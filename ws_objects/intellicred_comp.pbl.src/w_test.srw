$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type st_3 from statictext within w_test
end type
type mle_1 from multilineedit within w_test
end type
type lb_2 from listbox within w_test
end type
type st_2 from statictext within w_test
end type
type st_1 from statictext within w_test
end type
type lb_1 from listbox within w_test
end type
type pb_7 from picturebutton within w_test
end type
type pb_6 from picturebutton within w_test
end type
type pb_5 from picturebutton within w_test
end type
type pb_4 from picturebutton within w_test
end type
type pb_3 from picturebutton within w_test
end type
type pb_2 from picturebutton within w_test
end type
type pb_1 from picturebutton within w_test
end type
end forward

global type w_test from window
integer x = 1056
integer y = 456
integer width = 887
integer height = 2020
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 15780518
st_3 st_3
mle_1 mle_1
lb_2 lb_2
st_2 st_2
st_1 st_1
lb_1 lb_1
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
end type
global w_test w_test

on w_test.create
this.st_3=create st_3
this.mle_1=create mle_1
this.lb_2=create lb_2
this.st_2=create st_2
this.st_1=create st_1
this.lb_1=create lb_1
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.Control[]={this.st_3,&
this.mle_1,&
this.lb_2,&
this.st_2,&
this.st_1,&
this.lb_1,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1}
end on

on w_test.destroy
destroy(this.st_3)
destroy(this.mle_1)
destroy(this.lb_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.lb_1)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_3 from statictext within w_test
integer x = 41
integer y = 72
integer width = 421
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 15780518
boolean enabled = false
string text = "Practitioner Search"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_test
integer x = 41
integer y = 136
integer width = 745
integer height = 224
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
end type

type lb_2 from listbox within w_test
integer x = 41
integer y = 440
integer width = 741
integer height = 356
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Add/Modify Credentialing Data","Generate Credentialing Form","Track Expiring Credentials","Track Application Process"}
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_test
integer x = 46
integer y = 376
integer width = 741
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Practitioner"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_test
integer x = 46
integer y = 932
integer width = 741
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Quick Reports"
alignment alignment = center!
boolean focusrectangle = false
end type

type lb_1 from listbox within w_test
integer x = 46
integer y = 992
integer width = 741
integer height = 356
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Expiring Credentials","Application Tracking 1","Application Tracking 2","Provider Profile","Missing Information"}
borderstyle borderstyle = stylelowered!
end type

type pb_7 from picturebutton within w_test
integer x = 50
integer y = 1344
integer width = 741
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Run Reports"
end type

type pb_6 from picturebutton within w_test
integer x = 1106
integer y = 1088
integer width = 818
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Track Required Data/Hard Copies"
end type

type pb_5 from picturebutton within w_test
integer x = 2286
integer y = 392
integer width = 677
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Track Expiring Credentials"
end type

type pb_4 from picturebutton within w_test
integer x = 869
integer y = 396
integer width = 677
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print Applications"
end type

type pb_3 from picturebutton within w_test
integer x = 1573
integer y = 392
integer width = 677
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Track Applications"
end type

type pb_2 from picturebutton within w_test
integer x = 1106
integer y = 860
integer width = 677
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add/Modify Practitioner"
end type

type pb_1 from picturebutton within w_test
integer x = 1253
integer y = 232
integer width = 677
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Practitioner"
end type

