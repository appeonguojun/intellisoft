$PBExportHeader$w_npdb_reject_codes.srw
forward
global type w_npdb_reject_codes from window
end type
type dw_1 from datawindow within w_npdb_reject_codes
end type
type cb_1 from commandbutton within w_npdb_reject_codes
end type
end forward

global type w_npdb_reject_codes from window
integer width = 3150
integer height = 1536
boolean titlebar = true
string title = "NPDB File Rejection Codes"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
cb_1 cb_1
end type
global w_npdb_reject_codes w_npdb_reject_codes

on w_npdb_reject_codes.create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_1}
end on

on w_npdb_reject_codes.destroy
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;string s
string r
integer f
string ls_f

s = message.stringparm

if len(s) = 3 then
	r = "error_cd"  //send error
else
	r = "list_q"		//file error
end if


//of_strip_char("*", s,",")

dw_1.settransobject(sqlca)
dw_1.retrieve(r)

ls_f = "npdb_list_code = '" + s + "'"
//messagebox("",ls_f)
 f = dw_1.find(ls_f ,1,dw_1.rowcount())
 
 if f > 0 then
	dw_1.scrolltorow(f)
	dw_1.selectrow(0,false)
	dw_1.selectrow(f,true)
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type dw_1 from datawindow within w_npdb_reject_codes
integer x = 37
integer y = 128
integer width = 3022
integer height = 1168
integer taborder = 10
string title = "none"
string dataobject = "d_npdb_error_codes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_npdb_reject_codes
integer x = 2725
integer y = 16
integer width = 329
integer height = 92
integer taborder = 10
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

