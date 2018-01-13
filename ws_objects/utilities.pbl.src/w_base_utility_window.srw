$PBExportHeader$w_base_utility_window.srw
forward
global type w_base_utility_window from window
end type
type cb_run from commandbutton within w_base_utility_window
end type
type dw_facilcomm from datawindow within w_base_utility_window
end type
type dw_praccomm from datawindow within w_base_utility_window
end type
type dw_pracaffil from datawindow within w_base_utility_window
end type
type dw_1 from datawindow within w_base_utility_window
end type
type cb_4 from commandbutton within w_base_utility_window
end type
type cb_3 from commandbutton within w_base_utility_window
end type
type cb_1 from commandbutton within w_base_utility_window
end type
end forward

global type w_base_utility_window from window
integer x = 123
integer y = 112
integer width = 2139
integer height = 1568
boolean titlebar = true
string title = "Reset group ids"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
cb_run cb_run
dw_facilcomm dw_facilcomm
dw_praccomm dw_praccomm
dw_pracaffil dw_pracaffil
dw_1 dw_1
cb_4 cb_4
cb_3 cb_3
cb_1 cb_1
end type
global w_base_utility_window w_base_utility_window

type variables
long il_openfor
end variables

on w_base_utility_window.create
this.cb_run=create cb_run
this.dw_facilcomm=create dw_facilcomm
this.dw_praccomm=create dw_praccomm
this.dw_pracaffil=create dw_pracaffil
this.dw_1=create dw_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_1=create cb_1
this.Control[]={this.cb_run,&
this.dw_facilcomm,&
this.dw_praccomm,&
this.dw_pracaffil,&
this.dw_1,&
this.cb_4,&
this.cb_3,&
this.cb_1}
end on

on w_base_utility_window.destroy
destroy(this.cb_run)
destroy(this.dw_facilcomm)
destroy(this.dw_praccomm)
destroy(this.dw_pracaffil)
destroy(this.dw_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_1)
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
	il_openfor = 1
	
end if

	dw_1.settransobject(sqlca)
	dw_1.Retrieve()
	
	gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;if il_openfor = 1 then
	disCONNECT USING SQLCA;
end if
end event

type cb_run from commandbutton within w_base_utility_window
integer x = 187
integer y = 1180
integer width = 960
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;integer res
res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)
if res = 2 then return

integer a
integer ac
integer p
integer pc
integer c
integer cc
integer nr
integer nc
integer li_fac
long ll_commid
long ll_rec
long ll_prac
Long ll_seq
integer comfind
datetime ldt_date

dw_pracaffil.settransobject(sqlca)
ac = dw_pracaffil.retrieve()//a list of all active appointments

for a = 1 to ac
	ll_rec = dw_pracaffil.getitemnumber(a,"rec_id")
	ll_prac = dw_pracaffil.getitemnumber(a,"prac_id")
	li_fac = dw_pracaffil.getitemnumber(a,"parent_facility_id")
	ll_seq = dw_pracaffil.getitemnumber(a,"seq_no")
	ldt_date = dw_pracaffil.getitemdatetime(a,"apptmnt_start_date")
	dw_praccomm.settransobject(sqlca)
	pc = dw_praccomm.retrieve(ll_rec)// a list of comms for the appnt
	dw_facilcomm.settransobject(sqlca)
	cc = dw_facilcomm.retrieve(li_fac)// a list of committees for the facil of the appnt.
	for c = 1 to cc
		comfind = 0
		//messagebox("cc",cc)
		ll_commid = dw_facilcomm.getitemnumber(c,"committee_id")
		for p = 1 to pc
			if ll_commid = dw_praccomm.getitemnumber(p,"committee_id") then 
				comfind = 1
			end if
		next
			if comfind = 0 then
				nr = dw_praccomm.insertrow(0)
				dw_praccomm.setitem(nr,"rec_id",ll_rec)
				dw_praccomm.setitem(nr,"prac_id",ll_prac)
				dw_praccomm.setitem(nr,"facility_id",li_fac)
				dw_praccomm.setitem(nr,"seq_no",ll_seq)
				dw_praccomm.setitem(nr,"committee_id",ll_commid)
				dw_praccomm.setitem(nr,"active_status",1)
				dw_praccomm.setitem(nr,"date_sent_for_review", ldt_date )
				dw_praccomm.setitem(nr,"date_back_from_review", ldt_date )
				if not isnull(ldt_date) then
					dw_praccomm.setitem(nr,"review_results", 615 )//approved	
				end if
				dw_praccomm.update()
				commit using sqlca;
			end if
	next
next
			



messagebox("Done"," Update Completed")






end event

type dw_facilcomm from datawindow within w_base_utility_window
integer x = 1746
integer y = 492
integer width = 46
integer height = 64
integer taborder = 10
string dataobject = "d_comm_of_facil"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_praccomm from datawindow within w_base_utility_window
integer x = 1637
integer y = 396
integer width = 279
integer height = 64
integer taborder = 20
string dataobject = "d_prac_pd_comm"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pracaffil from datawindow within w_base_utility_window
integer x = 1637
integer y = 324
integer width = 279
integer height = 60
integer taborder = 30
string dataobject = "d_affil_stat_of_prac_all"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_base_utility_window
integer x = 41
integer y = 36
integer width = 1513
integer height = 1084
integer taborder = 80
string dataobject = "d_group_recids"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_base_utility_window
integer x = 2199
integer y = 108
integer width = 247
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print"
end type

event clicked;//if dw_1.rowcount() < 1 then
//	messagebox("","nothing to print")
//	return
//end if
//
//dw_1.print()
end event

type cb_3 from commandbutton within w_base_utility_window
integer x = 1632
integer y = 72
integer width = 274
integer height = 108
integer taborder = 50
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

type cb_1 from commandbutton within w_base_utility_window
integer x = 1641
integer y = 200
integer width = 265
integer height = 72
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "About"
end type

event clicked;messagebox("To operate this program :","Select a record type. Click run.  You will get a list of expiring records from 30 days in the future for active records.")
end event

