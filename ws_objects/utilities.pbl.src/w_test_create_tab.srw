$PBExportHeader$w_test_create_tab.srw
forward
global type w_test_create_tab from window
end type
type tab_1 from u_tab_test within w_test_create_tab
end type
type tab_1 from u_tab_test within w_test_create_tab
end type
type cb_1 from commandbutton within w_test_create_tab
end type
end forward

global type w_test_create_tab from window
integer x = 1056
integer y = 484
integer width = 2569
integer height = 1516
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
tab_1 tab_1
cb_1 cb_1
end type
global w_test_create_tab w_test_create_tab

on w_test_create_tab.create
this.tab_1=create tab_1
this.cb_1=create cb_1
this.Control[]={this.tab_1,&
this.cb_1}
end on

on w_test_create_tab.destroy
destroy(this.tab_1)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type tab_1 from u_tab_test within w_test_create_tab
integer x = 137
integer y = 80
integer taborder = 20
boolean createondemand = true
end type

type cb_1 from commandbutton within w_test_create_tab
integer x = 151
integer y = 352
integer width = 247
integer height = 108
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "none"
end type

event clicked;IF tab_1.CreateOnDemand = True THEN
//
IF tab_1.tabpage_2.PageCreated() = False THEN
		tab_1.tabpage_2.CreatePage()
END IF

IF tab_1.tabpage_3.PageCreated() = False THEN
		tab_1.tabpage_3.CreatePage()
END IF

END IF
end event

