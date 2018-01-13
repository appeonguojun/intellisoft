$PBExportHeader$w_login_audit.srw
forward
global type w_login_audit from window
end type
type cb_2 from commandbutton within w_login_audit
end type
type cb_1 from commandbutton within w_login_audit
end type
type st_to from statictext within w_login_audit
end type
type st_from from statictext within w_login_audit
end type
type em_to from editmask within w_login_audit
end type
type em_from from editmask within w_login_audit
end type
type cb_close from commandbutton within w_login_audit
end type
type cb_filter from commandbutton within w_login_audit
end type
type cb_sort from commandbutton within w_login_audit
end type
type dw_1 from datawindow within w_login_audit
end type
type cb_go from commandbutton within w_login_audit
end type
type gb_1 from groupbox within w_login_audit
end type
end forward

global type w_login_audit from window
integer width = 2770
integer height = 2496
boolean titlebar = true
string title = "Login Audit"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
st_to st_to
st_from st_from
em_to em_to
em_from em_from
cb_close cb_close
cb_filter cb_filter
cb_sort cb_sort
dw_1 dw_1
cb_go cb_go
gb_1 gb_1
end type
global w_login_audit w_login_audit

on w_login_audit.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_to=create st_to
this.st_from=create st_from
this.em_to=create em_to
this.em_from=create em_from
this.cb_close=create cb_close
this.cb_filter=create cb_filter
this.cb_sort=create cb_sort
this.dw_1=create dw_1
this.cb_go=create cb_go
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_to,&
this.st_from,&
this.em_to,&
this.em_from,&
this.cb_close,&
this.cb_filter,&
this.cb_sort,&
this.dw_1,&
this.cb_go,&
this.gb_1}
end on

on w_login_audit.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_to)
destroy(this.st_from)
destroy(this.em_to)
destroy(this.em_from)
destroy(this.cb_close)
destroy(this.cb_filter)
destroy(this.cb_sort)
destroy(this.dw_1)
destroy(this.cb_go)
destroy(this.gb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_2 from commandbutton within w_login_audit
integer x = 1856
integer y = 76
integer width = 270
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export"
end type

event clicked;dw_1.saveas()
	//restore Directory  
//added by nova 2008-04-29
ChangeDirectory ( gs_dir_path )

end event

type cb_1 from commandbutton within w_login_audit
integer x = 2135
integer y = 76
integer width = 270
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;dw_1.print()

end event

type st_to from statictext within w_login_audit
integer x = 567
integer y = 96
integer width = 87
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_from from statictext within w_login_audit
integer x = 50
integer y = 104
integer width = 146
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_to from editmask within w_login_audit
integer x = 658
integer y = 84
integer width = 343
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type em_from from editmask within w_login_audit
integer x = 206
integer y = 88
integer width = 343
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
end type

type cb_close from commandbutton within w_login_audit
integer x = 2414
integer y = 76
integer width = 270
integer height = 92
integer taborder = 80
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

type cb_filter from commandbutton within w_login_audit
integer x = 1298
integer y = 76
integer width = 270
integer height = 92
integer taborder = 40
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

dw_1.Setfilter(null_str)

dw_1.filter( )
end event

type cb_sort from commandbutton within w_login_audit
integer x = 1577
integer y = 76
integer width = 270
integer height = 92
integer taborder = 50
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

dw_1.SetSort(null_str)

dw_1.Sort( )
end event

type dw_1 from datawindow within w_login_audit
integer x = 46
integer y = 236
integer width = 2633
integer height = 2068
integer taborder = 90
string title = "none"
string dataobject = "d_login_audit"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_go from commandbutton within w_login_audit
integer x = 1042
integer y = 76
integer width = 178
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Go"
end type

event clicked;datetime ld_from
datetime ld_to
date ld_Date
date ld_Null

//debugbreak()
 //Start Code Change ---- ~04.28.2007 #V7 maha //corrected for sql server lack og date functions
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2007.08.23 By: Jack
//$<reason> Fix a defect.
/*
ld_from = datetime("2000-01-01 00:00:00")
ld_to = datetime("2099-01-01 59.59.59") //Start Code Change ---- 06.28.2007 #V7 maha corrected time
*/
ld_from = datetime(date('2000-01-01'),time('00:00:00'))
ld_to = datetime(date('2099-01-01'),time('59:59:59'))
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2008.03.17 By: Evan
//$<reason> Fix a defect.
/*
if len(em_from.text) > 4 then ld_from = datetime(date(em_from.text), time("00:00:00") )
if len(em_to.text) > 4 then ld_to = datetime(date(em_to.text), time("59:59:59") ) //Start Code Change ---- 06.28.2007 #V7 maha
//End Code Change---04.28.2007
*/
ld_Null = 1900-01-01
em_from.GetData(ld_Date)
if ld_Date <> ld_Null then ld_from = datetime(ld_Date, 00:00:00)
em_to.GetData(ld_Date)
if ld_Date <> ld_Null then ld_to = datetime(ld_Date, 23:59:59)
//---------------------------- APPEON END ----------------------------

dw_1.settransobject(sqlca)
dw_1.retrieve(ld_from,ld_to)

end event

type gb_1 from groupbox within w_login_audit
integer x = 41
integer y = 24
integer width = 1243
integer height = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Date Range (optional)"
end type

