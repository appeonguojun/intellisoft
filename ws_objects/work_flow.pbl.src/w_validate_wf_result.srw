$PBExportHeader$w_validate_wf_result.srw
forward
global type w_validate_wf_result from window
end type
type mle_1 from multilineedit within w_validate_wf_result
end type
type cb_close from commandbutton within w_validate_wf_result
end type
type cb_continue from commandbutton within w_validate_wf_result
end type
type dw_1 from datawindow within w_validate_wf_result
end type
end forward

global type w_validate_wf_result from window
integer width = 2825
integer height = 1456
boolean titlebar = true
string title = "Detection result of work flow"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
cb_close cb_close
cb_continue cb_continue
dw_1 dw_1
end type
global w_validate_wf_result w_validate_wf_result

on w_validate_wf_result.create
this.mle_1=create mle_1
this.cb_close=create cb_close
this.cb_continue=create cb_continue
this.dw_1=create dw_1
this.Control[]={this.mle_1,&
this.cb_close,&
this.cb_continue,&
this.dw_1}
end on

on w_validate_wf_result.destroy
destroy(this.mle_1)
destroy(this.cb_close)
destroy(this.cb_continue)
destroy(this.dw_1)
end on

event open;datastore lds_result
long ll_row,li_row,ll_ctx_id,ll_wf_id
string ls_stepname,ls_status_name,ls_field_name,ls_wf_name,ls_text,ls_reason

lds_result = message.powerobjectparm
ll_ctx_id = lds_result.getitemnumber(1,"ctx_id")
ll_wf_id = lds_result.getitemnumber(1,"wf_id")
select wf_name into :ls_wf_name from wf_workflow where wf_id = :ll_wf_id;
ls_text = "The current contract (Contract ID:" + string(ll_ctx_id) + ") "
ls_text += "is going to trigger work flow (" + ls_wf_name + "). "
ls_text += "The system detects the following issue(s). Do you still want to trigger the work flow?"
mle_1.text = ls_text
this.title = 'Detection result of work flow [' + ls_wf_name + "] "
//dw_1.object.datawindow.readonly = true

for ll_row = 1 to lds_result.rowcount()
	ls_stepname = lds_result.getitemstring(ll_row,"step_name")
	ls_status_name = lds_result.getitemstring(ll_row,"status_name")
	ls_field_name = lds_result.getitemstring(ll_row,"field_name")
	ls_reason = lds_result.getitemstring(ll_row,"errtext")
	li_row = dw_1.insertrow(0)
	dw_1.setitem(li_row,"step_name",ls_stepname)
	dw_1.setitem(li_row,"status_name",ls_status_name)
	dw_1.setitem(li_row,"field_name",ls_field_name)
	dw_1.setitem(li_row,"errtext",ls_reason)
next

 gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type mle_1 from multilineedit within w_validate_wf_result
integer x = 18
integer width = 2779
integer height = 132
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The current contract is going to trigger a work flow. The system detects the following issue(s). Do you still want to trigger the work flow?"
boolean border = false
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type cb_close from commandbutton within w_validate_wf_result
integer x = 2455
integer y = 1256
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;Closewithreturn(Parent,'2')
end event

type cb_continue from commandbutton within w_validate_wf_result
integer x = 2089
integer y = 1256
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Continue"
boolean default = true
end type

event clicked;Closewithreturn(Parent,'1')
end event

type dw_1 from datawindow within w_validate_wf_result
integer x = 18
integer y = 160
integer width = 2779
integer height = 1084
integer taborder = 10
string title = "none"
string dataobject = "d_unvalidate_fileld_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row < 1 then return

this.selectrow(0,false)
this.selectrow(row,true)
end event

