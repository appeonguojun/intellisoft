﻿$PBExportHeader$w_email_help.srw
forward
global type w_email_help from window
end type
type st_24 from statictext within w_email_help
end type
type st_23 from statictext within w_email_help
end type
type st_22 from statictext within w_email_help
end type
type st_21 from statictext within w_email_help
end type
type st_20 from statictext within w_email_help
end type
type st_19 from statictext within w_email_help
end type
type st_18 from statictext within w_email_help
end type
type st_17 from statictext within w_email_help
end type
type st_16 from statictext within w_email_help
end type
type st_15 from statictext within w_email_help
end type
type st_14 from statictext within w_email_help
end type
type st_13 from statictext within w_email_help
end type
type st_12 from statictext within w_email_help
end type
type st_11 from statictext within w_email_help
end type
type st_10 from statictext within w_email_help
end type
type st_9 from statictext within w_email_help
end type
type st_8 from statictext within w_email_help
end type
type st_7 from statictext within w_email_help
end type
type st_5 from statictext within w_email_help
end type
type st_6 from statictext within w_email_help
end type
type st_4 from statictext within w_email_help
end type
type st_3 from statictext within w_email_help
end type
type st_2 from statictext within w_email_help
end type
type st_1 from statictext within w_email_help
end type
type ln_1 from line within w_email_help
end type
type ln_2 from line within w_email_help
end type
type ln_3 from line within w_email_help
end type
type ln_4 from line within w_email_help
end type
type ln_5 from line within w_email_help
end type
type ln_6 from line within w_email_help
end type
type ln_7 from line within w_email_help
end type
type ln_8 from line within w_email_help
end type
type ln_9 from line within w_email_help
end type
type ln_10 from line within w_email_help
end type
type ln_11 from line within w_email_help
end type
end forward

global type w_email_help from window
integer width = 2770
integer height = 2376
boolean titlebar = true
string title = "ContractLogix"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15793151
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
st_24 st_24
st_23 st_23
st_22 st_22
st_21 st_21
st_20 st_20
st_19 st_19
st_18 st_18
st_17 st_17
st_16 st_16
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_5 st_5
st_6 st_6
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
ln_8 ln_8
ln_9 ln_9
ln_10 ln_10
ln_11 ln_11
end type
global w_email_help w_email_help

on w_email_help.create
this.st_24=create st_24
this.st_23=create st_23
this.st_22=create st_22
this.st_21=create st_21
this.st_20=create st_20
this.st_19=create st_19
this.st_18=create st_18
this.st_17=create st_17
this.st_16=create st_16
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_5=create st_5
this.st_6=create st_6
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.ln_7=create ln_7
this.ln_8=create ln_8
this.ln_9=create ln_9
this.ln_10=create ln_10
this.ln_11=create ln_11
this.Control[]={this.st_24,&
this.st_23,&
this.st_22,&
this.st_21,&
this.st_20,&
this.st_19,&
this.st_18,&
this.st_17,&
this.st_16,&
this.st_15,&
this.st_14,&
this.st_13,&
this.st_12,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.st_7,&
this.st_5,&
this.st_6,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.ln_1,&
this.ln_2,&
this.ln_3,&
this.ln_4,&
this.ln_5,&
this.ln_6,&
this.ln_7,&
this.ln_8,&
this.ln_9,&
this.ln_10,&
this.ln_11}
end on

on w_email_help.destroy
destroy(this.st_24)
destroy(this.st_23)
destroy(this.st_22)
destroy(this.st_21)
destroy(this.st_20)
destroy(this.st_19)
destroy(this.st_18)
destroy(this.st_17)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.ln_7)
destroy(this.ln_8)
destroy(this.ln_9)
destroy(this.ln_10)
destroy(this.ln_11)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_24 from statictext within w_email_help
integer x = 274
integer y = 2172
integer width = 1609
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Email: thuang@contractlogix.com"
boolean focusrectangle = false
end type

type st_23 from statictext within w_email_help
integer x = 274
integer y = 2100
integer width = 1609
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Password: thuang"
boolean focusrectangle = false
end type

type st_22 from statictext within w_email_help
integer x = 274
integer y = 2028
integer width = 1609
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Set Default Account: Checked."
boolean focusrectangle = false
end type

type st_21 from statictext within w_email_help
integer x = 274
integer y = 1956
integer width = 1609
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Account: thuang"
boolean focusrectangle = false
end type

type st_20 from statictext within w_email_help
integer x = 274
integer y = 1884
integer width = 1609
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "My SMTP server requires authentication: Unchecked."
boolean focusrectangle = false
end type

type st_19 from statictext within w_email_help
integer x = 274
integer y = 1812
integer width = 1609
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Port: 25"
boolean focusrectangle = false
end type

type st_18 from statictext within w_email_help
integer x = 274
integer y = 1740
integer width = 1609
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "SMTP Server: pop.onebox.com"
boolean focusrectangle = false
end type

type st_17 from statictext within w_email_help
integer x = 69
integer y = 1672
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "For Example:"
boolean focusrectangle = false
end type

type st_16 from statictext within w_email_help
integer x = 69
integer y = 204
integer width = 1655
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Below is a brief explanation of the fields found on this window."
boolean focusrectangle = false
end type

type st_15 from statictext within w_email_help
integer x = 119
integer y = 1368
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Email"
boolean focusrectangle = false
end type

type st_14 from statictext within w_email_help
integer x = 119
integer y = 1216
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Password"
boolean focusrectangle = false
end type

type st_13 from statictext within w_email_help
integer x = 119
integer y = 1020
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Set Default Account"
boolean focusrectangle = false
end type

type st_12 from statictext within w_email_help
integer x = 119
integer y = 808
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Account"
boolean focusrectangle = false
end type

type st_11 from statictext within w_email_help
integer x = 119
integer y = 460
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Port"
boolean focusrectangle = false
end type

type st_10 from statictext within w_email_help
integer x = 119
integer y = 600
integer width = 841
integer height = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "My SMTP server requires authentication"
boolean focusrectangle = false
end type

type st_9 from statictext within w_email_help
integer x = 119
integer y = 328
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Server"
boolean focusrectangle = false
end type

type st_8 from statictext within w_email_help
integer x = 1102
integer y = 1368
integer width = 1527
integer height = 196
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Email address of the user, for example, jdamelio@contractlogix.com (must be the full email address)"
boolean focusrectangle = false
end type

type st_7 from statictext within w_email_help
integer x = 1102
integer y = 1216
integer width = 1481
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Password of user account."
boolean focusrectangle = false
end type

type st_5 from statictext within w_email_help
integer x = 1102
integer y = 808
integer width = 731
integer height = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "User account, for example, jdamelio"
boolean focusrectangle = false
end type

type st_6 from statictext within w_email_help
integer x = 1102
integer y = 600
integer width = 1481
integer height = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Determines whether SMTP server needs to validate the login account."
boolean focusrectangle = false
end type

type st_4 from statictext within w_email_help
integer x = 1102
integer y = 460
integer width = 1481
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Port of SMTP server for sending emails."
boolean focusrectangle = false
end type

type st_3 from statictext within w_email_help
integer x = 1102
integer y = 328
integer width = 1481
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Server name or IP address of SMTP server."
boolean focusrectangle = false
end type

type st_2 from statictext within w_email_help
integer x = 1102
integer y = 1020
integer width = 1481
integer height = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "If the user has only one email address, then make sure that this option is selected."
boolean focusrectangle = false
end type

type st_1 from statictext within w_email_help
integer x = 768
integer y = 52
integer width = 1230
integer height = 96
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15793151
string text = "Email Account Maintenance Help"
boolean focusrectangle = false
end type

type ln_1 from line within w_email_help
integer linethickness = 6
integer beginx = 73
integer beginy = 300
integer endx = 2656
integer endy = 300
end type

type ln_2 from line within w_email_help
integer linethickness = 6
integer beginx = 73
integer beginy = 1616
integer endx = 2656
integer endy = 1616
end type

type ln_3 from line within w_email_help
integer linethickness = 6
integer beginx = 73
integer beginy = 296
integer endx = 73
integer endy = 1616
end type

type ln_4 from line within w_email_help
integer linethickness = 6
integer beginx = 2656
integer beginy = 296
integer endx = 2656
integer endy = 1616
end type

type ln_5 from line within w_email_help
integer linethickness = 4
integer beginx = 73
integer beginy = 424
integer endx = 2656
integer endy = 424
end type

type ln_6 from line within w_email_help
integer linethickness = 4
integer beginx = 73
integer beginy = 560
integer endx = 2656
integer endy = 560
end type

type ln_7 from line within w_email_help
integer linethickness = 4
integer beginx = 73
integer beginy = 776
integer endx = 2656
integer endy = 776
end type

type ln_8 from line within w_email_help
integer linethickness = 4
integer beginx = 73
integer beginy = 980
integer endx = 2656
integer endy = 980
end type

type ln_9 from line within w_email_help
integer linethickness = 4
integer beginx = 73
integer beginy = 1184
integer endx = 2656
integer endy = 1184
end type

type ln_10 from line within w_email_help
integer linethickness = 4
integer beginx = 73
integer beginy = 1324
integer endx = 2656
integer endy = 1324
end type

type ln_11 from line within w_email_help
integer linethickness = 4
integer beginx = 1056
integer beginy = 296
integer endx = 1056
integer endy = 1616
end type

