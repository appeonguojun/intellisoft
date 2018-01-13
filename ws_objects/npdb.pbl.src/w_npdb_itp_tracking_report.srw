$PBExportHeader$w_npdb_itp_tracking_report.srw
forward
global type w_npdb_itp_tracking_report from window
end type
type em_to from u_em within w_npdb_itp_tracking_report
end type
type em_from from u_em within w_npdb_itp_tracking_report
end type
type cb_1 from commandbutton within w_npdb_itp_tracking_report
end type
type rb_all from radiobutton within w_npdb_itp_tracking_report
end type
type rb_inc from radiobutton within w_npdb_itp_tracking_report
end type
type rb_comp from radiobutton within w_npdb_itp_tracking_report
end type
type st_2 from statictext within w_npdb_itp_tracking_report
end type
type st_1 from statictext within w_npdb_itp_tracking_report
end type
type cb_get from commandbutton within w_npdb_itp_tracking_report
end type
type cb_print from commandbutton within w_npdb_itp_tracking_report
end type
type cb_export from commandbutton within w_npdb_itp_tracking_report
end type
type dw_1 from datawindow within w_npdb_itp_tracking_report
end type
type cb_sort from commandbutton within w_npdb_itp_tracking_report
end type
type cb_filter from commandbutton within w_npdb_itp_tracking_report
end type
type cb_close from commandbutton within w_npdb_itp_tracking_report
end type
type gb_1 from groupbox within w_npdb_itp_tracking_report
end type
type gb_2 from groupbox within w_npdb_itp_tracking_report
end type
end forward

global type w_npdb_itp_tracking_report from window
integer width = 3511
integer height = 2256
boolean titlebar = true
string title = "NPDB ITP Tracking Report"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_to em_to
em_from em_from
cb_1 cb_1
rb_all rb_all
rb_inc rb_inc
rb_comp rb_comp
st_2 st_2
st_1 st_1
cb_get cb_get
cb_print cb_print
cb_export cb_export
dw_1 dw_1
cb_sort cb_sort
cb_filter cb_filter
cb_close cb_close
gb_1 gb_1
gb_2 gb_2
end type
global w_npdb_itp_tracking_report w_npdb_itp_tracking_report

on w_npdb_itp_tracking_report.create
this.em_to=create em_to
this.em_from=create em_from
this.cb_1=create cb_1
this.rb_all=create rb_all
this.rb_inc=create rb_inc
this.rb_comp=create rb_comp
this.st_2=create st_2
this.st_1=create st_1
this.cb_get=create cb_get
this.cb_print=create cb_print
this.cb_export=create cb_export
this.dw_1=create dw_1
this.cb_sort=create cb_sort
this.cb_filter=create cb_filter
this.cb_close=create cb_close
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.em_to,&
this.em_from,&
this.cb_1,&
this.rb_all,&
this.rb_inc,&
this.rb_comp,&
this.st_2,&
this.st_1,&
this.cb_get,&
this.cb_print,&
this.cb_export,&
this.dw_1,&
this.cb_sort,&
this.cb_filter,&
this.cb_close,&
this.gb_1,&
this.gb_2}
end on

on w_npdb_itp_tracking_report.destroy
destroy(this.em_to)
destroy(this.em_from)
destroy(this.cb_1)
destroy(this.rb_all)
destroy(this.rb_inc)
destroy(this.rb_comp)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_get)
destroy(this.cb_print)
destroy(this.cb_export)
destroy(this.dw_1)
destroy(this.cb_sort)
destroy(this.cb_filter)
destroy(this.cb_close)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dw_1.settransobject(sqlca)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type em_to from u_em within w_npdb_itp_tracking_report
integer x = 640
integer y = 64
integer width = 347
integer taborder = 40
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event constructor;call super::constructor;of_setdropdowncalendar(true)
end event

event getfocus;call super::getfocus;this.event pfc_ddcalendar( )
end event

type em_from from u_em within w_npdb_itp_tracking_report
integer x = 197
integer y = 64
integer width = 347
integer taborder = 40
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event constructor;call super::constructor;of_setdropdowncalendar(true)
end event

event getfocus;call super::getfocus;this.event pfc_ddcalendar( )
end event

type cb_1 from commandbutton within w_npdb_itp_tracking_report
integer x = 2062
integer y = 120
integer width = 338
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Err Codes"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-07-15 By: Scofield
//$<Reason> Check the current is lower than zero.

//string s
//
//s = dw_1.getitemstring(dw_1.getrow(),"cust_3")
//
//OpenWithParm(w_npdb_reject_codes,s)

long		ll_Row
String	ls_Cust3

ll_Row = dw_1.GetRow()
if ll_Row <= 0 or ll_Row > dw_1.RowCount() then Return

ls_Cust3 = dw_1.GetItemString(ll_Row,"cust_3")

OpenWithParm(w_npdb_reject_codes,ls_Cust3)
//---------------------------- APPEON END ----------------------------

end event

type rb_all from radiobutton within w_npdb_itp_tracking_report
integer x = 1106
integer y = 60
integer width = 197
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "All"
boolean checked = true
end type

event clicked;dw_1.setfilter("")
dw_1.filter()
dw_1.sort()
end event

type rb_inc from radiobutton within w_npdb_itp_tracking_report
integer x = 1655
integer y = 48
integer width = 343
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Incomplete"
end type

event clicked;dw_1.setfilter("isnull(r_date)")
dw_1.filter()
dw_1.sort()
end event

type rb_comp from radiobutton within w_npdb_itp_tracking_report
integer x = 1298
integer y = 64
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Complete"
end type

event clicked;dw_1.setfilter("not isnull(r_date)")
dw_1.filter()
dw_1.sort()

end event

type st_2 from statictext within w_npdb_itp_tracking_report
integer x = 530
integer y = 72
integer width = 96
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "To:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_npdb_itp_tracking_report
integer x = 41
integer y = 72
integer width = 133
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "From:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_get from commandbutton within w_npdb_itp_tracking_report
integer x = 2057
integer y = 24
integer width = 343
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Get Data"
end type

event clicked;string ls_filter
string ls_from
string ls_to

ls_from = em_from.text
ls_to = em_to.text
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 05/27/2008 By: Ken.Guo
//$<reason> Fix BugS050608. Need use currency date format.
/*
if ls_from = 'none' then ls_from = "01/01/2000"
if ls_to = 'none' then ls_to = "01/01/2200"	
*/
if ls_from = 'none' then ls_from = "2000-01-01"
if ls_to = 'none' then ls_to = "2200-01-01"	
//---------------------------- APPEON END ----------------------------
	
debugbreak()

dw_1.retrieve(date(ls_from),date(ls_to))

if rb_all.checked then
	ls_filter = ""
elseif rb_comp.checked then
	ls_filter = "not isnull(r_date)"
elseif rb_inc.checked then
	ls_filter =  "isnull(r_date)"
end if

dw_1.setfilter(ls_filter)
dw_1.filter()
dw_1.sort()

end event

type cb_print from commandbutton within w_npdb_itp_tracking_report
integer x = 2414
integer y = 24
integer width = 343
integer height = 84
integer taborder = 40
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

type cb_export from commandbutton within w_npdb_itp_tracking_report
integer x = 2766
integer y = 24
integer width = 343
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export"
end type

event clicked;dw_1.saveas()
end event

type dw_1 from datawindow within w_npdb_itp_tracking_report
integer x = 18
integer y = 228
integer width = 3447
integer height = 1908
integer taborder = 90
string title = "none"
string dataobject = "d_npdb_tracker_report"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;long i

i = this.getclickedrow()
this.setrow(i)
this .selectrow(0,false)
this.selectrow(i,true)
end event

type cb_sort from commandbutton within w_npdb_itp_tracking_report
integer x = 2409
integer y = 120
integer width = 343
integer height = 84
integer taborder = 60
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

type cb_filter from commandbutton within w_npdb_itp_tracking_report
integer x = 2761
integer y = 120
integer width = 343
integer height = 84
integer taborder = 70
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
end event

type cb_close from commandbutton within w_npdb_itp_tracking_report
integer x = 3118
integer y = 24
integer width = 343
integer height = 84
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

type gb_1 from groupbox within w_npdb_itp_tracking_report
integer x = 1065
integer width = 965
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Status"
end type

type gb_2 from groupbox within w_npdb_itp_tracking_report
integer x = 27
integer width = 987
integer height = 168
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Send Date Range (Optional)"
end type

