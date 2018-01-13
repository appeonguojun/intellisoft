$PBExportHeader$w_request_form_restore.srw
forward
global type w_request_form_restore from w_response
end type
type cb_sall from commandbutton within w_request_form_restore
end type
type st_1 from statictext within w_request_form_restore
end type
type cb_ok from commandbutton within w_request_form_restore
end type
type cb_cancel from commandbutton within w_request_form_restore
end type
type dw_1 from u_dw within w_request_form_restore
end type
end forward

global type w_request_form_restore from w_response
string tag = "Request Form Restore"
integer width = 2555
integer height = 2096
string title = "Request Form Restore"
cb_sall cb_sall
st_1 st_1
cb_ok cb_ok
cb_cancel cb_cancel
dw_1 dw_1
end type
global w_request_form_restore w_request_form_restore

type variables
long			il_request_id

end variables

on w_request_form_restore.create
int iCurrent
call super::create
this.cb_sall=create cb_sall
this.st_1=create st_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_sall
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.dw_1
end on

on w_request_form_restore.destroy
call super::destroy
destroy(this.cb_sall)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.dw_1)
end on

event open;call super::open;dw_1.retrieve( )

ib_disableclosequery = true				//close
end event

type cb_sall from commandbutton within w_request_form_restore
integer x = 64
integer y = 1880
integer width = 402
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select All"
end type

event clicked;integer i

if dw_1.rowcount() >  0 then
	if this.text = "&Select All" then
		for i = 1 to dw_1.rowcount()
			dw_1.setitem(i,"deleted","N")
		next
		this.text = "&Deselect All"
	elseif this.text = "&Deselect All" then
		for i = 1 to dw_1.rowcount()
			dw_1.setitem(i,"deleted","Y")
		next
		this.text = "&Select All"
	end if
end if 
end event

type st_1 from statictext within w_request_form_restore
integer x = 27
integer y = 32
integer width = 613
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select the restore name:"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_request_form_restore
integer x = 1687
integer y = 1892
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;long		i
string 	ls_deleted
boolean	lbn_update =false
DataWindowChild		ldwc_request_name

for i = 1 to dw_1.rowcount()
	ls_deleted = dw_1.getitemString(i,"deleted")
	if ls_deleted = "N" then
		dw_1.setitem(i,"user_id",gs_user_id)
		dw_1.setitem(i,"modify_date",DateTime(Date(Now()), Time(Now())) )
		lbn_update = true
	end if
Next

if 	lbn_update = true then
	dw_1.update()
	commit using sqlca;
	
	if isvalid(w_request_form) then
		w_request_form.of_restore_request()
	end if
end if 

Close(Parent)
end event

type cb_cancel from commandbutton within w_request_form_restore
integer x = 2112
integer y = 1892
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;//dw_1.reset()
ib_disableclosequery = true	
Close(Parent)
end event

type dw_1 from u_dw within w_request_form_restore
integer x = 27
integer y = 96
integer width = 2487
integer height = 1764
integer taborder = 10
string title = "Select the restore name"
string dataobject = "d_request_form_restore"
boolean hscrollbar = true
end type

event constructor;call super::constructor;//SetRowFocusIndicator(Hand!)

this.of_SetUpdateAble(true)
this.of_setrowselect( true)
end event

event itemchanged;call super::itemchanged;
ib_disableclosequery = false
end event

