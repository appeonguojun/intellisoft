$PBExportHeader$w_ai_update_values.srw
forward
global type w_ai_update_values from window
end type
type st_1 from statictext within w_ai_update_values
end type
type cb_2 from commandbutton within w_ai_update_values
end type
type cb_1 from commandbutton within w_ai_update_values
end type
type dw_1 from u_dw within w_ai_update_values
end type
end forward

global type w_ai_update_values from window
integer x = 1088
integer y = 224
integer width = 1998
integer height = 880
boolean titlebar = true
string title = "Batch Update Values "
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_ai_update_values w_ai_update_values

on w_ai_update_values.create
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_ai_update_values.destroy
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;datawindowchild dwchild
string p 


p = message.stringparm
//messagebox("p",p)

if p = "A" then //app audit
	dw_1.dataobject = "d_ai_update_missing_items"
end if

dw_1.settransobject(sqlca)
dw_1.insertrow(1)	
dw_1.of_SetDropDownCalendar( TRUE )
dw_1.iuo_calendar.of_Register(dw_1.iuo_calendar.DDLB)

if p = "A" then //app audit
	dw_1.GetChild( "data_status", dwchild )
	dwchild.settransobject(sqlca)
	dwchild.retrieve()	
	dw_1.setitem(1,"date_completed",today())
else
	dw_1.GetChild( "response_code", dwchild )
	dwchild.settransobject(sqlca)
	dwchild.retrieve("Credentials Verification Response")
	dw_1.GetChild( "verification_method", dwchild )
	dwchild.settransobject(sqlca)
	dwchild.retrieve("Verification Method")
//	dw_1.setitem(1,"date_recieved",today())
//	dw_1.setitem(1,"user_name",gs_user_id)
end if
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_1 from statictext within w_ai_update_values
integer x = 224
integer y = 340
integer width = 1527
integer height = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 79680469
boolean enabled = false
string text = "This Function will update the selected records with the above values "
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_ai_update_values
integer x = 1531
integer y = 580
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_ai_update_values
integer x = 1257
integer y = 580
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
end type

event clicked;integer res
long ic
long i
long ll_meth
string notes
long rcode
datetime drcv
string uname
string aname
w_action_items lw_win



//messagebox("In process","This function not yet complete")

res = messagebox("Batch","Are you sure you wish to update the selected records?",question!,yesno!,1)

if res = 2 then return

if gs_cust_type = "I" then //added 041204 maha for 4.19
	lw_win = w_action_items_ia
else
	lw_win = w_action_items
end if

lw_win.lb_response_cd_entered = true

ic = lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.rowcount()
dw_1.accepttext()

if dw_1.dataobject = "d_ai_update_missing_items" then
	drcv = dw_1.getitemdatetime(1,"date_completed")
	rcode = dw_1.getitemnumber(1,"data_status")
	notes = dw_1.getitemstring(1,"pd_app_audit_notes")
else
	drcv = dw_1.getitemdatetime(1,"date_recieved")
	rcode = dw_1.getitemnumber(1,"response_code")
	uname = dw_1.getitemstring(1,"user_name")
	aname = dw_1.getitemstring(1,"priority_user")
	notes = dw_1.getitemstring(1,"notes")
	ll_meth = dw_1.getitemnumber(1,"verification_method")  //Start Code Change ----11.06.2008 #V85 maha
end if

for i = 1 to ic
	if lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.getitemnumber(i,"selected") = 1 then
		//messagebox("i",i)
		lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.SetItemStatus ( i,0, primary!,datamodified! )
		if dw_1.dataobject = "d_ai_update_missing_items" then
			lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"data_status",rcode)
			lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"date_completed",drcv)
			lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"pd_app_audit_notes",notes)
		else
			if not isnull(rcode) then
				lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"response_code",rcode)
				//Start Code Change ----06.16.2008 #V81 maha - moved from below to update only if rsponse code is updated
				lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"exp_credential_flag",0) //maha 032805
				//End Code Change---06.16.2008
			end if
			if not isnull(drcv) then
				lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"date_recieved",drcv)
			end if
			if not isnull(uname) then
				lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"user_name",uname)
			end if
			if not isnull(aname) then
				lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"priority_user",aname)
			end if
			if not isnull(notes) or dw_1.getitemstring(1,"notes") = "" then
				lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"notes",notes) 
			end if
			if ll_meth > 1 then  //Start Code Change ----11.06.2008 #V85 maha
				lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"verification_method",ll_meth)
			end if
				
//Start Code Change ----06.16.2008 #V81 maha moved above  -   lw_win.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse.setitem(i,"exp_credential_flag",0) //maha 032805
		end if
	end if
next

		
close(parent)

end event

type dw_1 from u_dw within w_ai_update_values
integer x = 18
integer y = 36
integer width = 1911
integer height = 280
integer taborder = 30
string dataobject = "d_ai_batch_update_values"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;if this.GetColumnName() = "response_code" then
	this.setitem(1,"date_recieved",today())
	this.setitem(1,"user_name",gs_user_id)
end if
end event

