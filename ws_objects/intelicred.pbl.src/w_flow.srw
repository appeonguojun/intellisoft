$PBExportHeader$w_flow.srw
forward
global type w_flow from window
end type
type cb_13 from commandbutton within w_flow
end type
type cb_12 from commandbutton within w_flow
end type
type cb_11 from commandbutton within w_flow
end type
type cb_10 from commandbutton within w_flow
end type
type cb_9 from commandbutton within w_flow
end type
type cb_8 from commandbutton within w_flow
end type
type cb_7 from commandbutton within w_flow
end type
type cb_6 from commandbutton within w_flow
end type
type cb_5 from commandbutton within w_flow
end type
type cb_4 from commandbutton within w_flow
end type
type cb_3 from commandbutton within w_flow
end type
type cb_2 from commandbutton within w_flow
end type
type cb_1 from commandbutton within w_flow
end type
end forward

global type w_flow from window
integer x = 823
integer y = 360
integer width = 2610
integer height = 1664
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_flow w_flow

on w_flow.create
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_flow.destroy
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_13 from commandbutton within w_flow
integer x = 119
integer y = 332
integer width = 763
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "IntelliApp"
end type

type cb_12 from commandbutton within w_flow
integer x = 119
integer y = 192
integer width = 763
integer height = 108
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Expiring Credentials Tracking"
end type

type cb_11 from commandbutton within w_flow
integer x = 119
integer y = 52
integer width = 763
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Credentials Verification"
end type

type cb_10 from commandbutton within w_flow
integer x = 1349
integer y = 1340
integer width = 763
integer height = 108
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print Correspondence Letter"
end type

type cb_9 from commandbutton within w_flow
integer x = 1344
integer y = 1200
integer width = 763
integer height = 108
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print Credentialing Application"
end type

type cb_8 from commandbutton within w_flow
integer x = 1344
integer y = 1056
integer width = 763
integer height = 108
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Recieve From Committee"
end type

type cb_7 from commandbutton within w_flow
integer x = 1344
integer y = 916
integer width = 763
integer height = 108
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Send to Committee"
end type

type cb_6 from commandbutton within w_flow
integer x = 1344
integer y = 780
integer width = 763
integer height = 108
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Post Verification Result"
end type

type cb_5 from commandbutton within w_flow
integer x = 1344
integer y = 636
integer width = 763
integer height = 108
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Recieve Verification Letter Back"
end type

type cb_4 from commandbutton within w_flow
integer x = 1344
integer y = 488
integer width = 763
integer height = 108
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print Verification Letters"
end type

type cb_3 from commandbutton within w_flow
integer x = 1344
integer y = 340
integer width = 763
integer height = 108
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Recieve an application audit item"
end type

type cb_2 from commandbutton within w_flow
integer x = 1344
integer y = 192
integer width = 763
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Edit Physhician"
end type

type cb_1 from commandbutton within w_flow
integer x = 1344
integer y = 44
integer width = 763
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Enter New Phycian"
end type

