$PBExportHeader$u_display_page_bak.sru
forward
global type u_display_page_bak from userobject
end type
type pb_4 from picturebutton within u_display_page_bak
end type
type pb_3 from picturebutton within u_display_page_bak
end type
type sle_page from singlelineedit within u_display_page_bak
end type
type pb_2 from picturebutton within u_display_page_bak
end type
type pb_1 from picturebutton within u_display_page_bak
end type
end forward

global type u_display_page_bak from userobject
integer width = 663
integer height = 104
boolean border = true
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_4 pb_4
pb_3 pb_3
sle_page sle_page
pb_2 pb_2
pb_1 pb_1
end type
global u_display_page_bak u_display_page_bak

on u_display_page_bak.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.sle_page=create sle_page
this.pb_2=create pb_2
this.pb_1=create pb_1
this.Control[]={this.pb_4,&
this.pb_3,&
this.sle_page,&
this.pb_2,&
this.pb_1}
end on

on u_display_page_bak.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.sle_page)
destroy(this.pb_2)
destroy(this.pb_1)
end on

type pb_4 from picturebutton within u_display_page_bak
integer x = 535
integer width = 110
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
string text = ""
alignment htextalign = left!
long backcolor = 67108864
end type

event clicked;//Added By Jay Chen 03-25-2016
if isvalid(gw_contract) then
	gw_contract.tab_contract_details.tabpage_search.pb_4.triggerevent(clicked!)
end if
end event

type pb_3 from picturebutton within u_display_page_bak
integer x = 425
integer width = 110
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
string text = ""
alignment htextalign = left!
long backcolor = 67108864
end type

event clicked;//Added By Jay Chen 03-25-2016
if isvalid(gw_contract) then
	gw_contract.tab_contract_details.tabpage_search.pb_3.triggerevent(clicked!)
end if
end event

type sle_page from singlelineedit within u_display_page_bak
integer x = 224
integer y = 4
integer width = 197
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean autohscroll = false
boolean hideselection = false
end type

event modified;//Added By Jay Chen 03-25-2016
if isvalid(gw_contract) then
	gw_contract.tab_contract_details.tabpage_search.sle_page.text = this.text
	gw_contract.tab_contract_details.tabpage_search.sle_page.triggerevent(modified!)
end if
end event

type pb_2 from picturebutton within u_display_page_bak
integer x = 114
integer width = 110
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
string text = ""
alignment htextalign = left!
long backcolor = 67108864
end type

event clicked;//Added By Jay Chen 03-25-2016
if isvalid(gw_contract) then
	gw_contract.tab_contract_details.tabpage_search.pb_2.triggerevent(clicked!)
end if
end event

type pb_1 from picturebutton within u_display_page_bak
integer x = 9
integer width = 110
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = symbol!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Wingdings 3"
string text = ""
alignment htextalign = left!
long backcolor = 67108864
end type

event clicked;//Added By Jay Chen 03-25-2016
if isvalid(gw_contract) then
	gw_contract.tab_contract_details.tabpage_search.pb_1.triggerevent(clicked!)
end if
end event

