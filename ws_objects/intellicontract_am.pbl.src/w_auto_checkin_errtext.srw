$PBExportHeader$w_auto_checkin_errtext.srw
forward
global type w_auto_checkin_errtext from window
end type
type mle_1 from multilineedit within w_auto_checkin_errtext
end type
type dw_1 from datawindow within w_auto_checkin_errtext
end type
type cb_2 from commandbutton within w_auto_checkin_errtext
end type
type ln_1 from line within w_auto_checkin_errtext
end type
end forward

global type w_auto_checkin_errtext from window
integer width = 3547
integer height = 1576
boolean titlebar = true
string title = "Auto CheckIn Error"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
dw_1 dw_1
cb_2 cb_2
ln_1 ln_1
end type
global w_auto_checkin_errtext w_auto_checkin_errtext

on w_auto_checkin_errtext.create
this.mle_1=create mle_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.ln_1=create ln_1
this.Control[]={this.mle_1,&
this.dw_1,&
this.cb_2,&
this.ln_1}
end on

on w_auto_checkin_errtext.destroy
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.ln_1)
end on

event open;str_checkin_errtext lstr_errtext
Long ll_err_cnt, i, ll_row, ll_suc_cnt

lstr_errtext = message.PowerObjectParm	

ll_err_cnt = lstr_errtext.error_cnt
ll_suc_cnt = lstr_errtext.suc_cnt
mle_1.text = "There are " + string(ll_suc_cnt) + " records that have been successfully checked in and there are " + string(ll_err_cnt) +" records failed to check in." +'~r~n'+&
"Please see below for details."

for i = 1 to ll_err_cnt
	ll_row = dw_1.insertrow(0)
	dw_1.setitem(ll_row, 'doc_id', lstr_errtext.doc_id[i])
	dw_1.setitem(ll_row, 'ctx_id', lstr_errtext.ctx_id[i])
	dw_1.setitem(ll_row, 'doc_name', lstr_errtext.doc_name[i])
	dw_1.setitem(ll_row, 'doc_ext', lstr_errtext.doc_ext[i])
	dw_1.setitem(ll_row, 'errortext', lstr_errtext.errortext[i])
next 


end event

type mle_1 from multilineedit within w_auto_checkin_errtext
integer x = 18
integer y = 24
integer width = 3095
integer height = 152
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

type dw_1 from datawindow within w_auto_checkin_errtext
integer x = 14
integer y = 216
integer width = 3497
integer height = 1256
integer taborder = 20
string title = "none"
string dataobject = "d_auto_checkin_error"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(sqlca)
end event

type cb_2 from commandbutton within w_auto_checkin_errtext
integer x = 3163
integer y = 52
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type ln_1 from line within w_auto_checkin_errtext
integer linethickness = 6
integer beginx = 9
integer beginy = 196
integer endx = 3493
integer endy = 196
end type

