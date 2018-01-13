$PBExportHeader$w_clean_plugin.srw
forward
global type w_clean_plugin from w_popup
end type
type cb_close from commandbutton within w_clean_plugin
end type
type dw_ocx from u_dw within w_clean_plugin
end type
type gb_2 from groupbox within w_clean_plugin
end type
end forward

global type w_clean_plugin from w_popup
integer x = 214
integer y = 221
integer width = 3589
integer height = 1456
string title = "Contractlogix Plugin"
boolean maxbox = false
boolean center = true
cb_close cb_close
dw_ocx dw_ocx
gb_2 gb_2
end type
global w_clean_plugin w_clean_plugin

on w_clean_plugin.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_ocx=create dw_ocx
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_ocx
this.Control[iCurrent+3]=this.gb_2
end on

on w_clean_plugin.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_ocx)
destroy(this.gb_2)
end on

event open;call super::open;If IsValid (w_client_setting) Then 
	If w_client_setting.dw_ocx.rowcount() > 0 Then 
		w_client_setting.dw_ocx.rowscopy( 1,w_client_setting.dw_ocx.rowcount(), Primary!,dw_ocx, 1, Primary!)
	End If
End If 
end event

type cb_close from commandbutton within w_clean_plugin
integer x = 3191
integer y = 1240
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
boolean default = true
end type

event clicked;Close(Parent)
end event

type dw_ocx from u_dw within w_clean_plugin
integer x = 14
integer y = 52
integer width = 3506
integer height = 1156
integer taborder = 20
string dataobject = "d_env_check_ocx"
boolean hscrollbar = true
boolean livescroll = false
end type

event constructor;call super::constructor;This.of_setupdateable(False)
end event

type gb_2 from groupbox within w_clean_plugin
integer width = 3534
integer height = 1224
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "DLL && OCX Check"
end type

