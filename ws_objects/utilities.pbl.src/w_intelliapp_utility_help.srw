$PBExportHeader$w_intelliapp_utility_help.srw
forward
global type w_intelliapp_utility_help from window
end type
type cb_1 from commandbutton within w_intelliapp_utility_help
end type
type st_1 from statictext within w_intelliapp_utility_help
end type
end forward

global type w_intelliapp_utility_help from window
integer x = 1056
integer y = 484
integer width = 2103
integer height = 368
boolean titlebar = true
string title = "Help"
long backcolor = 80269524
cb_1 cb_1
st_1 st_1
end type
global w_intelliapp_utility_help w_intelliapp_utility_help

on w_intelliapp_utility_help.create
this.cb_1=create cb_1
this.st_1=create st_1
this.Control[]={this.cb_1,&
this.st_1}
end on

on w_intelliapp_utility_help.destroy
destroy(this.cb_1)
destroy(this.st_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_1 from commandbutton within w_intelliapp_utility_help
integer x = 1769
integer y = 76
integer width = 247
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close( Parent )
end event

type st_1 from statictext within w_intelliapp_utility_help
integer x = 37
integer y = 28
integer width = 1659
integer height = 356
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Use this utility to check and see if there are query values in IntelliApp fields mappings that do not have data associated with them in a lookup table.  This will avoid any Data Window Child errors."
boolean focusrectangle = false
end type

