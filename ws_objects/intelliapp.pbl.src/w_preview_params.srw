$PBExportHeader$w_preview_params.srw
forward
global type w_preview_params from window
end type
type em_from from editmask within w_preview_params
end type
type em_to from editmask within w_preview_params
end type
type cb_2 from commandbutton within w_preview_params
end type
type rb_prac from radiobutton within w_preview_params
end type
type rb_default from radiobutton within w_preview_params
end type
type st_2 from statictext within w_preview_params
end type
type st_1 from statictext within w_preview_params
end type
type cb_1 from commandbutton within w_preview_params
end type
type cbx_print from checkbox within w_preview_params
end type
type cbx_page from checkbox within w_preview_params
end type
type gb_3 from groupbox within w_preview_params
end type
type gb_2 from groupbox within w_preview_params
end type
type gb_1 from groupbox within w_preview_params
end type
end forward

global type w_preview_params from window
integer x = 1056
integer y = 484
integer width = 1705
integer height = 844
boolean titlebar = true
string title = "Preview Settings"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
em_from em_from
em_to em_to
cb_2 cb_2
rb_prac rb_prac
rb_default rb_default
st_2 st_2
st_1 st_1
cb_1 cb_1
cbx_print cbx_print
cbx_page cbx_page
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_preview_params w_preview_params

on w_preview_params.create
this.em_from=create em_from
this.em_to=create em_to
this.cb_2=create cb_2
this.rb_prac=create rb_prac
this.rb_default=create rb_default
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.cbx_print=create cbx_print
this.cbx_page=create cbx_page
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.em_from,&
this.em_to,&
this.cb_2,&
this.rb_prac,&
this.rb_default,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.cbx_print,&
this.cbx_page,&
this.gb_3,&
this.gb_2,&
this.gb_1}
end on

on w_preview_params.destroy
destroy(this.em_from)
destroy(this.em_to)
destroy(this.cb_2)
destroy(this.rb_prac)
destroy(this.rb_default)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cbx_print)
destroy(this.cbx_page)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type em_from from editmask within w_preview_params
integer x = 142
integer y = 392
integer width = 247
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
end type

event modified;cbx_page.checked = false
end event

type em_to from editmask within w_preview_params
integer x = 453
integer y = 392
integer width = 247
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
end type

event modified;cbx_page.checked = false
end event

type cb_2 from commandbutton within w_preview_params
integer x = 1381
integer y = 580
integer width = 247
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;closewithreturn(parent,"Cancel")
end event

type rb_prac from radiobutton within w_preview_params
integer x = 955
integer y = 380
integer width = 576
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Practitoner"
end type

type rb_default from radiobutton within w_preview_params
integer x = 951
integer y = 192
integer width = 608
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Default Practitioner"
boolean checked = true
end type

type st_2 from statictext within w_preview_params
integer x = 457
integer y = 324
integer width = 247
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "To:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_preview_params
integer x = 151
integer y = 324
integer width = 215
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "From:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_preview_params
integer x = 1115
integer y = 580
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
end type

event clicked;string ret

string ls_page_from
string ls_page_to
string ls_prac
string ls_print


if not cbx_page.checked and em_from.text = "" and em_to.text = "" then
	messagebox("Page Range?","All Pages is unchecked, please enter a page range.")
	return
end if

if not em_from.text = "" and not em_to.text = "" then
	if integer(em_from.text) > integer(em_to.text) then
		messagebox("Page Range?","Start Page cannot be greater then the End page, please correct.")
	end if
end if


if cbx_page.checked then //get page values
	ls_page_from = "D"
	ls_page_to = "D"
else
	if em_from.text = "" then
		ls_page_from = "S"
	else
		ls_page_from = em_from.text
	end if
	if em_to.text = "" then
		ls_page_to = "E"
	else
		ls_page_to = em_to.text
	end if
end if

if rb_default.checked then
	ls_prac = "D"
else
	ls_prac = "P"
end if

if cbx_print.checked then //not used
	ls_print = "Y"
else
	ls_print = "N"
end if

ret = ls_page_from + "@" + ls_page_to + "@" + ls_prac + "@" + ls_print

closewithreturn(parent,ret)
end event

type cbx_print from checkbox within w_preview_params
boolean visible = false
integer x = 1774
integer y = 188
integer width = 681
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Selected Range"
end type

type cbx_page from checkbox within w_preview_params
integer x = 274
integer y = 192
integer width = 361
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "All Pages"
boolean checked = true
end type

type gb_3 from groupbox within w_preview_params
boolean visible = false
integer x = 1723
integer y = 56
integer width = 768
integer height = 496
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Print"
end type

type gb_2 from groupbox within w_preview_params
integer x = 864
integer y = 56
integer width = 768
integer height = 496
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Practitoner"
end type

type gb_1 from groupbox within w_preview_params
integer x = 73
integer y = 56
integer width = 754
integer height = 496
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Page Range"
end type

