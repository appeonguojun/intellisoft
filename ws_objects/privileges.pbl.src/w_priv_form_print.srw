$PBExportHeader$w_priv_form_print.srw
forward
global type w_priv_form_print from window
end type
type dw_facility from datawindow within w_priv_form_print
end type
type dw_print from datawindow within w_priv_form_print
end type
type cb_print from commandbutton within w_priv_form_print
end type
type cb_preview from commandbutton within w_priv_form_print
end type
type ddlb_report from dropdownlistbox within w_priv_form_print
end type
type dw_clin_select_preview from datawindow within w_priv_form_print
end type
type gb_1 from groupbox within w_priv_form_print
end type
type gb_9 from groupbox within w_priv_form_print
end type
type gb_6 from groupbox within w_priv_form_print
end type
end forward

global type w_priv_form_print from window
integer x = 14
integer y = 32
integer width = 3538
integer height = 2116
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
dw_facility dw_facility
dw_print dw_print
cb_print cb_print
cb_preview cb_preview
ddlb_report ddlb_report
dw_clin_select_preview dw_clin_select_preview
gb_1 gb_1
gb_9 gb_9
gb_6 gb_6
end type
global w_priv_form_print w_priv_form_print

type variables
long il_clin_area_preview
long il_facility
end variables

on w_priv_form_print.create
this.dw_facility=create dw_facility
this.dw_print=create dw_print
this.cb_print=create cb_print
this.cb_preview=create cb_preview
this.ddlb_report=create ddlb_report
this.dw_clin_select_preview=create dw_clin_select_preview
this.gb_1=create gb_1
this.gb_9=create gb_9
this.gb_6=create gb_6
this.Control[]={this.dw_facility,&
this.dw_print,&
this.cb_print,&
this.cb_preview,&
this.ddlb_report,&
this.dw_clin_select_preview,&
this.gb_1,&
this.gb_9,&
this.gb_6}
end on

on w_priv_form_print.destroy
destroy(this.dw_facility)
destroy(this.dw_print)
destroy(this.cb_print)
destroy(this.cb_preview)
destroy(this.ddlb_report)
destroy(this.dw_clin_select_preview)
destroy(this.gb_1)
destroy(this.gb_9)
destroy(this.gb_6)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type dw_facility from datawindow within w_priv_form_print
integer x = 78
integer y = 60
integer width = 841
integer height = 92
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_dddw_priv_facility"
boolean border = false
boolean livescroll = true
end type

event constructor;dw_facility.settransobject(sqlca)
dw_facility.retrieve()
dw_facility.InsertRow( 1 )

DataWindowChild dwchild

This.GetChild( "facility_name", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve()


end event

event itemchanged;long i

il_facility = integer(data)
//messagebox("facility", il_facility)

end event

type dw_print from datawindow within w_priv_form_print
integer x = 27
integer y = 216
integer width = 3433
integer height = 1756
integer taborder = 40
string dataobject = "d_form_priv_acknowledgement_col"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_print from commandbutton within w_priv_form_print
integer x = 3200
integer y = 64
integer width = 247
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;if  isnull(il_clin_area_preview) or il_clin_area_preview < 1 then
	messagebox("No data", "Please select a Clinical Area")
	return
end if

cb_preview.triggerevent(clicked!)


dw_print.print()
end event

type cb_preview from commandbutton within w_priv_form_print
integer x = 2935
integer y = 64
integer width = 247
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Pre&view"
end type

event clicked;long ll_fac_id
long ll_clin_id

ll_fac_id = il_facility
ll_clin_id = il_clin_area_preview
//	messagebox("ll_clin_id",ll_clin_id)

if  isnull(ll_clin_id) or ll_clin_id < 1 then
	messagebox("No data", "Please select a Clinical Area")
	return
end if

if ddlb_report.text = "Clinical Area Privilege List" then
	dw_print.dataobject  = "d_rpt_priv_by_clin_area_by_facil"
	dw_print.settransobject(sqlca)
	dw_print.retrieve(ll_fac_id, ll_clin_id )

elseif ddlb_report.text = "Privilege Requirements" then
	dw_print.dataobject  = "d_form_priv_clin_req"

elseif ddlb_report.text = "Privileges Requested w/ headers" then
	dw_print.dataobject  = "d_form_priv_by_clin_area_h"
	
elseif ddlb_report.text = "Privileges Requested w/ descp." then
	dw_print.dataobject  = "d_form_priv_by_clin_area_d"
	
elseif ddlb_report.text = "Privilege Recommendations" then
	dw_print.dataobject  = "d_form_priv_acknowledgement_col"

elseif ddlb_report.text = "Complete Privilege Application w/ headers" then
	dw_print.dataobject  = "d_form_clin_priv_request_master_h"
	
elseif ddlb_report.text = "Complete Privilege Application w/ descp." then
	dw_print.dataobject  = "d_form_clin_priv_request_master_d"
	
	
else
	messagebox("Report Selection", "Please select a report or form to view.")
	return
end if

	dw_print.settransobject(sqlca)
	dw_print.retrieve(ll_fac_id,ll_clin_id )

//dw_print.printpreview()


end event

type ddlb_report from dropdownlistbox within w_priv_form_print
integer x = 1925
integer y = 72
integer width = 933
integer height = 404
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"Clinical Area Privilege List","Privilege Requirements","Privileges Requested w/ headers","Privilege Recommendations","Complete Privilege Application w/ headers","Complete Privilege Application w/ descp.","Privileges Requested w/ descp."}
borderstyle borderstyle = stylelowered!
end type

type dw_clin_select_preview from datawindow within w_priv_form_print
integer x = 1006
integer y = 68
integer width = 818
integer height = 96
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_dddw_clin_area"
boolean border = false
boolean livescroll = true
end type

event constructor;//dw_clin_select.settransobject(sqlca)
//dw_clin_sel.retrieve(il_facil)
//dw_clin_select.InsertRow( 0 )


DataWindowChild dwchild

This.GetChild( "clinical_area_description", dwchild )

dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("il_facil")
dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "clinical_area_description", "" )
dwchild.SetItem( 1, "clinical_area_id", 0 )



//DataWindowChild dwchild


//This.of_SetTransObject(SQLCA)

//This.GetChild( "review_results", dwchild )

//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("approval code")
end event

event itemchanged;


//tab_1.tabpage_report.dw_clin_select_preview.accepttext()
//il_clin_area_preview = integer(data)








end event

type gb_1 from groupbox within w_priv_form_print
integer x = 23
integer y = 8
integer width = 937
integer height = 176
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 79741120
string text = "Select Facility"
end type

type gb_9 from groupbox within w_priv_form_print
integer x = 1879
integer y = 8
integer width = 1019
integer height = 176
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Preview"
end type

type gb_6 from groupbox within w_priv_form_print
integer x = 974
integer y = 8
integer width = 878
integer height = 176
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Clinical Area"
end type

