$PBExportHeader$w_entity_painter.srw
forward
global type w_entity_painter from w_popup
end type
type cb_close from commandbutton within w_entity_painter
end type
type cb_import from commandbutton within w_entity_painter
end type
type tab_1 from tab within w_entity_painter
end type
type tabpage_browse from userobject within tab_1
end type
type dw_browse from datawindow within tabpage_browse
end type
type tabpage_browse from userobject within tab_1
dw_browse dw_browse
end type
type tabpage_detail from userobject within tab_1
end type
type cb_addappfac from commandbutton within tabpage_detail
end type
type cb_findappfac from commandbutton within tabpage_detail
end type
type cb_addlocat from commandbutton within tabpage_detail
end type
type cb_findlocat from commandbutton within tabpage_detail
end type
type cb_addgroup from commandbutton within tabpage_detail
end type
type cb_findgroup from commandbutton within tabpage_detail
end type
type cb_addfac from commandbutton within tabpage_detail
end type
type cb_findfac from commandbutton within tabpage_detail
end type
type dw_1 from datawindow within tabpage_detail
end type
type tabpage_detail from userobject within tab_1
cb_addappfac cb_addappfac
cb_findappfac cb_findappfac
cb_addlocat cb_addlocat
cb_findlocat cb_findlocat
cb_addgroup cb_addgroup
cb_findgroup cb_findgroup
cb_addfac cb_addfac
cb_findfac cb_findfac
dw_1 dw_1
end type
type tab_1 from tab within w_entity_painter
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type
end forward

global type w_entity_painter from w_popup
integer width = 3639
integer height = 2356
string title = "Entity Painter"
cb_close cb_close
cb_import cb_import
tab_1 tab_1
end type
global w_entity_painter w_entity_painter

on w_entity_painter.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_import=create cb_import
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_import
this.Control[iCurrent+3]=this.tab_1
end on

on w_entity_painter.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_import)
destroy(this.tab_1)
end on

type cb_close from commandbutton within w_entity_painter
integer x = 3131
integer y = 40
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close( parent)
end event

type cb_import from commandbutton within w_entity_painter
integer x = 1189
integer y = 32
integer width = 393
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Import Entities"
end type

type tab_1 from tab within w_entity_painter
integer x = 27
integer y = 124
integer width = 3493
integer height = 2076
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type

on tab_1.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.Control[]={this.tabpage_browse,&
this.tabpage_detail}
end on

on tab_1.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
end on

type tabpage_browse from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3456
integer height = 1960
long backcolor = 79741120
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_browse dw_browse
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.Control[]={this.dw_browse}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
end on

type dw_browse from datawindow within tabpage_browse
integer x = 27
integer y = 44
integer width = 2002
integer height = 1840
integer taborder = 20
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_detail from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3456
integer height = 1960
long backcolor = 79741120
string text = "Detail"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cb_addappfac cb_addappfac
cb_findappfac cb_findappfac
cb_addlocat cb_addlocat
cb_findlocat cb_findlocat
cb_addgroup cb_addgroup
cb_findgroup cb_findgroup
cb_addfac cb_addfac
cb_findfac cb_findfac
dw_1 dw_1
end type

on tabpage_detail.create
this.cb_addappfac=create cb_addappfac
this.cb_findappfac=create cb_findappfac
this.cb_addlocat=create cb_addlocat
this.cb_findlocat=create cb_findlocat
this.cb_addgroup=create cb_addgroup
this.cb_findgroup=create cb_findgroup
this.cb_addfac=create cb_addfac
this.cb_findfac=create cb_findfac
this.dw_1=create dw_1
this.Control[]={this.cb_addappfac,&
this.cb_findappfac,&
this.cb_addlocat,&
this.cb_findlocat,&
this.cb_addgroup,&
this.cb_findgroup,&
this.cb_addfac,&
this.cb_findfac,&
this.dw_1}
end on

on tabpage_detail.destroy
destroy(this.cb_addappfac)
destroy(this.cb_findappfac)
destroy(this.cb_addlocat)
destroy(this.cb_findlocat)
destroy(this.cb_addgroup)
destroy(this.cb_findgroup)
destroy(this.cb_addfac)
destroy(this.cb_findfac)
destroy(this.dw_1)
end on

type cb_addappfac from commandbutton within tabpage_detail
integer x = 2235
integer y = 1344
integer width = 251
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add"
end type

type cb_findappfac from commandbutton within tabpage_detail
integer x = 2231
integer y = 1240
integer width = 251
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find"
end type

type cb_addlocat from commandbutton within tabpage_detail
integer x = 1687
integer y = 1344
integer width = 251
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add"
end type

type cb_findlocat from commandbutton within tabpage_detail
integer x = 1682
integer y = 1240
integer width = 251
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find"
end type

type cb_addgroup from commandbutton within tabpage_detail
integer x = 955
integer y = 1344
integer width = 251
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add"
end type

type cb_findgroup from commandbutton within tabpage_detail
integer x = 951
integer y = 1240
integer width = 251
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find"
end type

type cb_addfac from commandbutton within tabpage_detail
integer x = 229
integer y = 1344
integer width = 251
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add"
end type

type cb_findfac from commandbutton within tabpage_detail
integer x = 229
integer y = 1240
integer width = 251
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Find"
end type

type dw_1 from datawindow within tabpage_detail
integer x = 64
integer y = 120
integer width = 3255
integer height = 984
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

