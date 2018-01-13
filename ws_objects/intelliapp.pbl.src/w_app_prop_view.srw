$PBExportHeader$w_app_prop_view.srw
forward
global type w_app_prop_view from window
end type
type dw_prop from datawindow within w_app_prop_view
end type
type cb_close from commandbutton within w_app_prop_view
end type
type cb_2 from commandbutton within w_app_prop_view
end type
type cb_1 from commandbutton within w_app_prop_view
end type
end forward

global type w_app_prop_view from window
integer width = 1778
integer height = 3012
boolean titlebar = true
string title = "View Field Properties"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_prop dw_prop
cb_close cb_close
cb_2 cb_2
cb_1 cb_1
end type
global w_app_prop_view w_app_prop_view

on w_app_prop_view.create
this.dw_prop=create dw_prop
this.cb_close=create cb_close
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_prop,&
this.cb_close,&
this.cb_2,&
this.cb_1}
end on

on w_app_prop_view.destroy
destroy(this.dw_prop)
destroy(this.cb_close)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;long ll_afp_id

ll_afp_id = message.doubleparm

dw_prop.settransobject(sqlca)
dw_prop.retrieve(ll_afp_id )

//BEGIN---Add by Evan 12/09/2008
long ll_Row
long ll_table_id
DataWindowChild ldwc_child
ll_Row = dw_prop.GetRow()
if ll_Row > 0 then	
	ll_table_id = dw_prop.object.table_id[ll_Row]
	if not IsNull(ll_table_id) then
		dw_prop.GetChild("field_id", ldwc_child)
		ldwc_child.SetTransObject(SQLCA)
		ldwc_child.Retrieve(ll_table_id)
	end if
end if
//END---Add by Evan 12/09/2008

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type dw_prop from datawindow within w_app_prop_view
integer x = 32
integer y = 136
integer width = 1673
integer height = 1988
integer taborder = 20
string title = "none"
string dataobject = "d_app_field_properties_view"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_close from commandbutton within w_app_prop_view
integer x = 1449
integer y = 24
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_2 from commandbutton within w_app_prop_view
integer x = 1134
integer y = 24
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "none"
end type

type cb_1 from commandbutton within w_app_prop_view
integer x = 855
integer y = 24
integer width = 247
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "none"
end type

