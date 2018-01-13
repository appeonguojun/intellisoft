$PBExportHeader$w_missing_verifs.srw
forward
global type w_missing_verifs from window
end type
type cb_close from commandbutton within w_missing_verifs
end type
type cb_add from commandbutton within w_missing_verifs
end type
type dw_1 from datawindow within w_missing_verifs
end type
end forward

global type w_missing_verifs from window
integer width = 2857
integer height = 1736
boolean titlebar = true
string title = "Missing Verifications"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_close cb_close
cb_add cb_add
dw_1 dw_1
end type
global w_missing_verifs w_missing_verifs

on w_missing_verifs.create
this.cb_close=create cb_close
this.cb_add=create cb_add
this.dw_1=create dw_1
this.Control[]={this.cb_close,&
this.cb_add,&
this.dw_1}
end on

on w_missing_verifs.destroy
destroy(this.cb_close)
destroy(this.cb_add)
destroy(this.dw_1)
end on

event open;datastore lds_verif

dw_1.settransobject(sqlca)
dw_1.retrieve(0) //retrieving bogus prac id

lds_verif = message.powerobjectparm

lds_verif.rowscopy( 1, lds_verif.rowcount(), primary!, dw_1,1000, primary!)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_close from commandbutton within w_missing_verifs
integer x = 2441
integer y = 1504
integer width = 343
integer height = 92
integer taborder = 30
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

type cb_add from commandbutton within w_missing_verifs
integer x = 2075
integer y = 1504
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Ok"
end type

event clicked;integer i
integer ic

for i  = dw_1.rowcount() to 1 step -1
	if dw_1.getitemnumber(i,"selected") <> 1 then
		dw_1.rowsdiscard( i,i,primary!)
	end if
next

dw_1.update()

//closewithreturn(parent,dw_1)
close (parent)


end event

type dw_1 from datawindow within w_missing_verifs
integer x = 41
integer y = 32
integer width = 2747
integer height = 1448
integer taborder = 10
string dataobject = "d_copy_verification_missing"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;IF This.GetColumnName() = "new_verification_method" THEN
	this.setitem(this.getrow(),"verification_method",long(data))
end if
end event

