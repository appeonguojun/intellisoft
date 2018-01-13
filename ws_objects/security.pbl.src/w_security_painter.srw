$PBExportHeader$w_security_painter.srw
forward
global type w_security_painter from window
end type
type cb_1 from commandbutton within w_security_painter
end type
type dw_2 from datawindow within w_security_painter
end type
type cb_7 from commandbutton within w_security_painter
end type
type dw_1 from datawindow within w_security_painter
end type
type cb_3 from commandbutton within w_security_painter
end type
end forward

global type w_security_painter from window
integer x = 965
integer y = 256
integer width = 2126
integer height = 2120
boolean titlebar = true
string title = "Security Painter"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79680469
cb_1 cb_1
dw_2 dw_2
cb_7 cb_7
dw_1 dw_1
cb_3 cb_3
end type
global w_security_painter w_security_painter

type variables
string is_from
string is_to
integer ii_facil
long il_dept = 0
end variables

forward prototypes
public function integer of_no_user ()
end prototypes

public function integer of_no_user ();//Start Code Change ---- 04.26.2006 #426 maha  new function
if isnull(is_from) or is_from = "" then
	messagebox("Select Error","You must select a user.")
	return -1
else
	return 1
end if
//End Code Change---04.26.2006
end function

on w_security_painter.create
this.cb_1=create cb_1
this.dw_2=create dw_2
this.cb_7=create cb_7
this.dw_1=create dw_1
this.cb_3=create cb_3
this.Control[]={this.cb_1,&
this.dw_2,&
this.cb_7,&
this.dw_1,&
this.cb_3}
end on

on w_security_painter.destroy
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.cb_7)
destroy(this.dw_1)
destroy(this.cb_3)
end on

event open;//Start Code Change ---- 10.03.2006 #1 maha new window
// Holds settings for specific password security functionality
DataWindowChild dwchild

dw_1.settransobject(sqlca)
dw_1.retrieve()

dw_2.settransobject(sqlca)
dw_2.retrieve()

//Added By Ken.Guo 2015-12-09
If dw_2.rowcount() = 0 Then
	dw_2.insertrow(0)
	dw_2.setitem(1,'exp_days',-1)
	dw_2.update()
End If

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_1 from commandbutton within w_security_painter
integer x = 841
integer y = 48
integer width = 485
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Login Audit Report"
end type

event clicked;open(w_login_audit)
end event

type dw_2 from datawindow within w_security_painter
integer x = 64
integer y = 568
integer width = 1966
integer height = 776
integer taborder = 80
string title = "none"
string dataobject = "d_security_settings"
boolean livescroll = true
end type

type cb_7 from commandbutton within w_security_painter
integer x = 1458
integer y = 48
integer width = 274
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;dw_1.update()
dw_2.update()

end event

type dw_1 from datawindow within w_security_painter
integer x = 64
integer y = 228
integer width = 1966
integer height = 324
integer taborder = 70
string title = "none"
string dataobject = "d_icred_set_security"
boolean livescroll = true
end type

type cb_3 from commandbutton within w_security_painter
integer x = 1751
integer y = 48
integer width = 274
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;CLOSE(PARENT)
end event

