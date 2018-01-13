$PBExportHeader$w_utl_multi_nonhist_check.srw
forward
global type w_utl_multi_nonhist_check from window
end type
type rb_pur from radiobutton within w_utl_multi_nonhist_check
end type
type cb_del from commandbutton within w_utl_multi_nonhist_check
end type
type rb_orp from radiobutton within w_utl_multi_nonhist_check
end type
type cb_print from commandbutton within w_utl_multi_nonhist_check
end type
type cb_2 from commandbutton within w_utl_multi_nonhist_check
end type
type rb_hist from radiobutton within w_utl_multi_nonhist_check
end type
type rb_mult from radiobutton within w_utl_multi_nonhist_check
end type
type cb_run from commandbutton within w_utl_multi_nonhist_check
end type
type dw_pracaffil from datawindow within w_utl_multi_nonhist_check
end type
type dw_1 from datawindow within w_utl_multi_nonhist_check
end type
type cb_3 from commandbutton within w_utl_multi_nonhist_check
end type
type cb_1 from commandbutton within w_utl_multi_nonhist_check
end type
type gb_1 from groupbox within w_utl_multi_nonhist_check
end type
end forward

global type w_utl_multi_nonhist_check from window
integer x = 123
integer y = 112
integer width = 1838
integer height = 1856
boolean titlebar = true
string title = "Appointment Aberrations Check"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
rb_pur rb_pur
cb_del cb_del
rb_orp rb_orp
cb_print cb_print
cb_2 cb_2
rb_hist rb_hist
rb_mult rb_mult
cb_run cb_run
dw_pracaffil dw_pracaffil
dw_1 dw_1
cb_3 cb_3
cb_1 cb_1
gb_1 gb_1
end type
global w_utl_multi_nonhist_check w_utl_multi_nonhist_check

type variables
long il_openfor
end variables

on w_utl_multi_nonhist_check.create
this.rb_pur=create rb_pur
this.cb_del=create cb_del
this.rb_orp=create rb_orp
this.cb_print=create cb_print
this.cb_2=create cb_2
this.rb_hist=create rb_hist
this.rb_mult=create rb_mult
this.cb_run=create cb_run
this.dw_pracaffil=create dw_pracaffil
this.dw_1=create dw_1
this.cb_3=create cb_3
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.rb_pur,&
this.cb_del,&
this.rb_orp,&
this.cb_print,&
this.cb_2,&
this.rb_hist,&
this.rb_mult,&
this.cb_run,&
this.dw_pracaffil,&
this.dw_1,&
this.cb_3,&
this.cb_1,&
this.gb_1}
end on

on w_utl_multi_nonhist_check.destroy
destroy(this.rb_pur)
destroy(this.cb_del)
destroy(this.rb_orp)
destroy(this.cb_print)
destroy(this.cb_2)
destroy(this.rb_hist)
destroy(this.rb_mult)
destroy(this.cb_run)
destroy(this.dw_pracaffil)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;long ll_mess
string ls_sql
string ls_sql_org
string ls_where
long rows

if message.stringparm = "P" then  //from the intellicred program
	//skip login
	il_openfor = 0
else
	
	SQLCA.DBMS="ODBC"
	SQLCA.DbParm="ConnectString='DSN=Intellicred Client;UID=DBA;PWD=SQL;',DelimitIdentifier='Yes'"
	
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
	il_openfor = 1
	
end if
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

//	dw_1.settransobject(sqlca)
//	dw_1.Retrieve()
end event

event close;if il_openfor = 1 then
	disCONNECT USING SQLCA;
end if
end event

type rb_pur from radiobutton within w_utl_multi_nonhist_check
integer x = 1093
integer y = 1000
integer width = 594
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Purged files"
end type

type cb_del from commandbutton within w_utl_multi_nonhist_check
integer x = 1472
integer y = 548
integer width = 265
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Delete"
end type

event clicked;dw_1.deleterow(dw_1.getrow())

dw_1.update()
commit using sqlca;
end event

type rb_orp from radiobutton within w_utl_multi_nonhist_check
integer x = 1093
integer y = 904
integer width = 594
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Orphan Basic files"
end type

type cb_print from commandbutton within w_utl_multi_nonhist_check
integer x = 1472
integer y = 348
integer width = 265
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Print"
end type

event clicked;dw_1.print()
end event

type cb_2 from commandbutton within w_utl_multi_nonhist_check
integer x = 1472
integer y = 248
integer width = 265
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find"
end type

event clicked;
if rb_mult.checked then
	dw_1.dataobject = "d_utl_multi_active_appts"
	dw_pracaffil.dataobject = "d_affil_stat_of_prac_for_facil"
	cb_del.enabled = false
elseif rb_hist.checked then
	dw_1.dataobject = "d_utl_hist_only_appts1"
	dw_pracaffil.dataobject = "d_affil_stat_of_prac_for_facil_hist"
	cb_del.enabled = false
elseif rb_orp.checked then	
	dw_1.dataobject = "d_util_orphan_basic_info"
	cb_del.enabled = true
elseif rb_pur.checked then	
	dw_1.dataobject = "d_utl_purged_appts"
	cb_del.enabled = False
end if

	dw_1.settransobject(sqlca)
	
	dw_1.Retrieve()
	dw_pracaffil.settransobject(sqlca)
	
	cb_print.enabled = true
	
	
	
end event

type rb_hist from radiobutton within w_utl_multi_nonhist_check
integer x = 1093
integer y = 812
integer width = 594
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "History only"
end type

type rb_mult from radiobutton within w_utl_multi_nonhist_check
integer x = 1093
integer y = 724
integer width = 594
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Multiple non-history"
boolean checked = true
end type

type cb_run from commandbutton within w_utl_multi_nonhist_check
integer x = 1472
integer y = 444
integer width = 265
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;integer res

dw_pracaffil.update()
commit using sqlca;
		







end event

type dw_pracaffil from datawindow within w_utl_multi_nonhist_check
integer x = 32
integer y = 1156
integer width = 1714
integer height = 476
integer taborder = 10
string dataobject = "d_affil_stat_of_prac_for_facil"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_utl_multi_nonhist_check
integer x = 32
integer y = 44
integer width = 992
integer height = 1088
integer taborder = 70
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer r
long prac
integer fac
r = this.getclickedrow()
this.setrow(r)
this.selectrow(0,false)
this.selectrow(r,true)



if dw_1.dataobject <> "d_util_orphan_basic_info" then
	if r > 0 then
		prac = this.getitemnumber(r,"prac_id")
		fac = this.getitemnumber(r,"parent_facility_id")
		
		dw_pracaffil.settransobject(sqlca)
		dw_pracaffil.retrieve(prac,fac)
	end if
end if
end event

event retrieveend;this.selectrow(0,false)
this.selectrow(1,true)
end event

event rowfocuschanged;//long prac
//integer fac
//
//if this.rowcount() > 0 then
//	prac = this.getitemnumber(this.getrow(),"prac_id")
//	fac = this.getitemnumber(this.getrow(),"parent_facility_id")
//	
//	dw_pracaffil.settransobject(sqlca)
//	dw_pracaffil.retrieve(prac,fac)
//end if










end event

type cb_3 from commandbutton within w_utl_multi_nonhist_check
integer x = 1472
integer y = 48
integer width = 265
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

type cb_1 from commandbutton within w_utl_multi_nonhist_check
integer x = 1472
integer y = 148
integer width = 265
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "About"
end type

event clicked;messagebox("About","IntelliCred expects one and only one non-history appointment status record per practitioner/facility.~r~rThe Multiple non-history function will identify practitioners with more than one.~rHistory only will identify practitioners with no Active/Pending/Inactive Appointments.~rOrphan Basic will check for basic information records that have no Appointment Status record.~rPurged files will show practitioner with appointments set to Purge (to be deleted.)~r~rTo operate, select the function to use; click find to identify practitioners.  Click on the practitioner name to view the appointment records.  The record status can be modified appropriately.  Orphan records can be deleted. Click Save to save each change.")
end event

type gb_1 from groupbox within w_utl_multi_nonhist_check
integer x = 1042
integer y = 656
integer width = 695
integer height = 460
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Function"
end type

