$PBExportHeader$w_exp_let_links.srw
forward
global type w_exp_let_links from window
end type
type cb_8 from commandbutton within w_exp_let_links
end type
type dw_links from datawindow within w_exp_let_links
end type
type cb_3 from commandbutton within w_exp_let_links
end type
type cb_2 from commandbutton within w_exp_let_links
end type
type cb_1 from commandbutton within w_exp_let_links
end type
type dw_basic from datawindow within w_exp_let_links
end type
end forward

global type w_exp_let_links from window
integer x = 123
integer y = 112
integer width = 1554
integer height = 404
boolean titlebar = true
string title = "Adjust adr links to only 1 exp cred let per prac"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
cb_8 cb_8
dw_links dw_links
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_basic dw_basic
end type
global w_exp_let_links w_exp_let_links

type variables
integer ii_row
end variables

on w_exp_let_links.create
this.cb_8=create cb_8
this.dw_links=create dw_links
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_basic=create dw_basic
this.Control[]={this.cb_8,&
this.dw_links,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_basic}
end on

on w_exp_let_links.destroy
destroy(this.cb_8)
destroy(this.dw_links)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_basic)
end on

event close;disCONNECT USING SQLCA;
end event

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_8 from commandbutton within w_exp_let_links
integer x = 553
integer y = 60
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "2)run"
end type

event clicked;long i
integer l
long rc
long recid
long meth
integer lc
integer cnt = 0

//messagebox("",meth)


rc = dw_basic.rowcount()

for i = 1 to rc
	recid = dw_basic.getitemnumber(i,"prac_id")
	dw_links.settransobject(sqlca)
	lc = dw_links.retrieve(recid)
	cnt = 0
	for l  = 2 to lc  
 		dw_links.setitem(l,"exp_letters",0)
	next
	dw_links.update()
	commit using sqlca;

next	
messagebox("","Finished")
end event

type dw_links from datawindow within w_exp_let_links
integer x = 645
integer y = 84
integer width = 146
integer height = 68
integer taborder = 40
string dataobject = "d_addr_links_prac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_exp_let_links
integer x = 1029
integer y = 52
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

type cb_2 from commandbutton within w_exp_let_links
integer x = 133
integer y = 56
integer width = 306
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1)retrieve"
end type

event clicked;//
//
//if rb_brd.checked = true then
//	dw_1.dataobject = "d_board_list"
//elseif rb_dea.checked = true then
//	dw_1.dataobject = "d_dea_list"
//elseif rb_ins.checked = true then
//	dw_1.dataobject = "d_ins_list"
//elseif rb_lisc.checked = true then
//	dw_1.dataobject = "d_lisc_list"
//end if
//	
//	
dw_basic.settransobject(sqlca)
dw_basic.retrieve()
end event

type cb_1 from commandbutton within w_exp_let_links
integer x = 1029
integer y = 184
integer width = 265
integer height = 72
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "About"
end type

event clicked;messagebox("To operate this program :","Click retrieve. Click run.  Program will reset address links so that there is only 1 exp cred link for each practitioner.")
end event

type dw_basic from datawindow within w_exp_let_links
integer x = 155
integer y = 68
integer width = 233
integer height = 72
integer taborder = 30
string dataobject = "d_basic"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

