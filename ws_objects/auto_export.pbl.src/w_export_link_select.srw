$PBExportHeader$w_export_link_select.srw
forward
global type w_export_link_select from window
end type
type ddlb_1 from dropdownlistbox within w_export_link_select
end type
type cb_2 from commandbutton within w_export_link_select
end type
type cb_1 from commandbutton within w_export_link_select
end type
end forward

global type w_export_link_select from window
integer x = 1056
integer y = 484
integer width = 1595
integer height = 764
boolean titlebar = true
string title = "Select link field"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
boolean center = true
ddlb_1 ddlb_1
cb_2 cb_2
cb_1 cb_1
end type
global w_export_link_select w_export_link_select

type variables
string is_mes = ""
end variables

on w_export_link_select.create
this.ddlb_1=create ddlb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.ddlb_1,&
this.cb_2,&
this.cb_1}
end on

on w_export_link_select.destroy
destroy(this.ddlb_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type ddlb_1 from dropdownlistbox within w_export_link_select
integer x = 64
integer y = 96
integer width = 1422
integer height = 548
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"pd_address_link.primary_office = 1","pd_address_link.additional_office = 1","pd_address_link.home_address = 1","pd_address_link.mailing = 1","pd_address_link.billing = 1","pd_hosp_facility_link.primary_hosp = 581","pd_spec_facility_link.practicing = 581"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;is_mes = this.text
cb_1.enabled = is_mes<>''
end event

type cb_2 from commandbutton within w_export_link_select
integer x = 1230
integer y = 524
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;closewithreturn(parent,"cancel")
end event

type cb_1 from commandbutton within w_export_link_select
integer x = 951
integer y = 524
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&OK"
end type

event clicked;closewithreturn(parent,is_mes)
end event

