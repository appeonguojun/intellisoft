$PBExportHeader$w_reset_exp_flag.srw
forward
global type w_reset_exp_flag from window
end type
type cb_5 from commandbutton within w_reset_exp_flag
end type
type cb_4 from commandbutton within w_reset_exp_flag
end type
type cb_8 from commandbutton within w_reset_exp_flag
end type
type cb_3 from commandbutton within w_reset_exp_flag
end type
type cb_2 from commandbutton within w_reset_exp_flag
end type
type cb_1 from commandbutton within w_reset_exp_flag
end type
type dw_basic from datawindow within w_reset_exp_flag
end type
type dw_links from datawindow within w_reset_exp_flag
end type
type dw_1 from datawindow within w_reset_exp_flag
end type
end forward

global type w_reset_exp_flag from window
integer x = 123
integer y = 112
integer width = 2053
integer height = 424
boolean titlebar = true
string title = "Reset exp cred flags set at 2"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79680469
cb_5 cb_5
cb_4 cb_4
cb_8 cb_8
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_basic dw_basic
dw_links dw_links
dw_1 dw_1
end type
global w_reset_exp_flag w_reset_exp_flag

type variables
integer ii_row
end variables

on w_reset_exp_flag.create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_8=create cb_8
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_basic=create dw_basic
this.dw_links=create dw_links
this.dw_1=create dw_1
this.Control[]={this.cb_5,&
this.cb_4,&
this.cb_8,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_basic,&
this.dw_links,&
this.dw_1}
end on

on w_reset_exp_flag.destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_8)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_basic)
destroy(this.dw_links)
destroy(this.dw_1)
end on

event close;disCONNECT USING SQLCA;
end event

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_5 from commandbutton within w_reset_exp_flag
integer x = 46
integer y = 188
integer width = 777
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete duplicate exp letters"
end type

event clicked;integer i
integer rc
integer check



dw_1.settransobject(sqlca)
rc = dw_1.retrieve()
cb_8.enabled = true
messagebox("rc",rc)
for i = rc to 1 step - 1
	if i > 1 then
		if dw_1.getitemnumber(i,"verif_info_rec_id") = dw_1.getitemnumber(i - 1,"verif_info_rec_id") then
			dw_1.deleterow(i)
		end if
	end if
next

dw_1.update()
commit using sqlca;
messagebox("rc",dw_basic.rowcount())
end event

type cb_4 from commandbutton within w_reset_exp_flag
integer x = 46
integer y = 68
integer width = 777
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete all exp cred letters"
end type

event clicked;delete from verif_info 
where active_status = 1 and exp_credential_flag = 1 and screen_id <> 1 and response_code is null and first_sent is null;
end event

type cb_8 from commandbutton within w_reset_exp_flag
integer x = 1166
integer y = 68
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
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
	recid = dw_basic.getitemnumber(i,"verif_info_rec_id")
	dw_links.settransobject(sqlca)
	cnt = dw_links.retrieve(recid)

	if  isnull(cnt) or cnt < 1 then  
 		dw_basic.setitem(i,"exp_credential_flag",0)
	end if
next
	dw_basic.update()
	commit using sqlca;

	
messagebox("","Finished")
end event

type cb_3 from commandbutton within w_reset_exp_flag
integer x = 1733
integer y = 64
integer width = 274
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Quit"
end type

event clicked;CLOSE(PARENT)
end event

type cb_2 from commandbutton within w_reset_exp_flag
integer x = 841
integer y = 68
integer width = 306
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "1)retrieve"
end type

event clicked;integer i
integer rc
integer check



dw_basic.settransobject(sqlca)
rc = dw_basic.retrieve()
cb_8.enabled = true
messagebox("rc",rc)
for i = rc to 1 step - 1
	if i > 1 then
		if dw_basic.getitemnumber(i,"verif_info_rec_id") = dw_basic.getitemnumber(i - 1,"verif_info_rec_id") then
			dw_basic.deleterow(i - 1)
		end if
	end if
next
messagebox("rc",dw_basic.rowcount())
end event

type cb_1 from commandbutton within w_reset_exp_flag
integer x = 1440
integer y = 64
integer width = 265
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "About"
end type

event clicked;messagebox("To operate this program :","Click retrieve.  Click run. Program will check for all normal verifications for a exp_cred flag of 2 (means exp cred letter had been generated.) For each record it will check to see if there is another record with a flag of 1 or 0; if not the original flag will be reset to 0 ")
end event

type dw_basic from datawindow within w_reset_exp_flag
boolean visible = false
integer x = 1285
integer y = 156
integer width = 69
integer height = 76
integer taborder = 40
string dataobject = "d_verifs_w_2_flag"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_links from datawindow within w_reset_exp_flag
boolean visible = false
integer x = 1056
integer y = 52
integer width = 146
integer height = 68
integer taborder = 50
string dataobject = "d_verifs_child_of_2_flag"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_reset_exp_flag
boolean visible = false
integer x = 1033
integer y = 168
integer width = 151
integer height = 76
integer taborder = 30
string dataobject = "d_verifs_child_of_2_flag_at_1"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

