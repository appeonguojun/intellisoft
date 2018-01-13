$PBExportHeader$w_dataview_field_update.srw
forward
global type w_dataview_field_update from window
end type
type st_1 from statictext within w_dataview_field_update
end type
type cb_3 from commandbutton within w_dataview_field_update
end type
type dw_3 from datawindow within w_dataview_field_update
end type
type dw_2 from datawindow within w_dataview_field_update
end type
type dw_select from datawindow within w_dataview_field_update
end type
type dw_1 from datawindow within w_dataview_field_update
end type
type cb_2 from commandbutton within w_dataview_field_update
end type
type cb_1 from commandbutton within w_dataview_field_update
end type
end forward

global type w_dataview_field_update from window
integer x = 1106
integer y = 1092
integer width = 1979
integer height = 864
boolean titlebar = true
string title = "Data field update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
st_1 st_1
cb_3 cb_3
dw_3 dw_3
dw_2 dw_2
dw_select dw_select
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_dataview_field_update w_dataview_field_update

type variables
long li_field_id
end variables

on w_dataview_field_update.create
this.st_1=create st_1
this.cb_3=create cb_3
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_select=create dw_select
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.cb_3,&
this.dw_3,&
this.dw_2,&
this.dw_select,&
this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_dataview_field_update.destroy
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_select)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;dw_select.settransobject(sqlca)
dw_select.retrieve()

dw_1.settransobject(sqlca)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_1 from statictext within w_dataview_field_update
integer x = 37
integer y = 56
integer width = 448
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "1) Select screen"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_dataview_field_update
integer x = 32
integer y = 476
integer width = 297
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "About"
end type

event clicked;messagebox("About","This function will add data view fields for a praticular screen to data views missing them.") 
end event

type dw_3 from datawindow within w_dataview_field_update
integer x = 375
integer y = 276
integer width = 421
integer height = 288
integer taborder = 50
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_dataview_field_update
integer x = 1349
integer y = 148
integer width = 494
integer height = 420
integer taborder = 30
string dataobject = "d_oig_data_view"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_select from datawindow within w_dataview_field_update
integer x = 14
integer y = 148
integer width = 777
integer height = 96
integer taborder = 20
string dataobject = "d_sys_fields_only"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;li_field_id = long(data)
end event

type dw_1 from datawindow within w_dataview_field_update
integer x = 827
integer y = 148
integer width = 494
integer height = 420
integer taborder = 10
string dataobject = "d_oig_data_view"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_dataview_field_update
integer x = 32
integer y = 276
integer width = 297
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "2) DV1"
end type

event clicked;dw_1.retrieve(li_field_id)
end event

type cb_1 from commandbutton within w_dataview_field_update
integer x = 32
integer y = 372
integer width = 297
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "3)Update"
end type

event clicked;integer i
integer ic
integer r
integer rc
long recid
long fieldid
integer dvid
integer ck = 0

select max(data_view_field_id) into :recid from data_view_fields;

for i = 1 to dw_3.rowcount()
	ck = 0
	dvid = dw_3.getitemnumber(i,"data_view_id")
	for r = 1 to dw_1.rowcount()
		if dw_1.getitemnumber(i,"data_view_id") = dvid then
			exit
		else
			dw_1.RowsCopy (1, 1, primary!, dw_2, 1000, 	primary!)
			dw_2.setitem(dw_2.rowcount(),"data_view_id",dvid)
			dw_2.setitem(dw_2.rowcount(),"data_view_field_id",recid)
		end if
	next
next

if dw_2.rowcount() > 0 then
	dw_2.settransobject(sqlca)
	dw_2.update()
	commit using sqlca;
end if

end event

