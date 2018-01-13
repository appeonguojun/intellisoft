$PBExportHeader$w_saveas_file_options.srw
forward
global type w_saveas_file_options from w_response
end type
type cb_cancel from commandbutton within w_saveas_file_options
end type
type cb_ok from commandbutton within w_saveas_file_options
end type
type cbx_revision from checkbox within w_saveas_file_options
end type
type cbx_company from checkbox within w_saveas_file_options
end type
type cbx_ctxid from checkbox within w_saveas_file_options
end type
type gb_1 from groupbox within w_saveas_file_options
end type
end forward

global type w_saveas_file_options from w_response
integer width = 1499
integer height = 688
string title = "Save As Options"
cb_cancel cb_cancel
cb_ok cb_ok
cbx_revision cbx_revision
cbx_company cbx_company
cbx_ctxid cbx_ctxid
gb_1 gb_1
end type
global w_saveas_file_options w_saveas_file_options

on w_saveas_file_options.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cbx_revision=create cbx_revision
this.cbx_company=create cbx_company
this.cbx_ctxid=create cbx_ctxid
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cbx_revision
this.Control[iCurrent+4]=this.cbx_company
this.Control[iCurrent+5]=this.cbx_ctxid
this.Control[iCurrent+6]=this.gb_1
end on

on w_saveas_file_options.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cbx_revision)
destroy(this.cbx_company)
destroy(this.cbx_ctxid)
destroy(this.gb_1)
end on

type cb_cancel from commandbutton within w_saveas_file_options
integer x = 1065
integer y = 464
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent, '')
end event

type cb_ok from commandbutton within w_saveas_file_options
integer x = 695
integer y = 464
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;String ls_parm

If cbx_ctxid.checked Then
	ls_parm = '1'
Else
	ls_parm = '0'
End If

If cbx_company.checked Then
	ls_parm += '1'
Else
	ls_parm += '0'
End If

If cbx_revision.checked Then
	ls_parm += '1'
Else
	ls_parm += '0'
End If


ClosewithReturn(Parent,ls_parm)
end event

type cbx_revision from checkbox within w_saveas_file_options
string tag = "Should always included document id as the same file name reason."
integer x = 160
integer y = 268
integer width = 841
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
string text = "Included Document ID && Revision "
boolean checked = true
end type

type cbx_company from checkbox within w_saveas_file_options
integer x = 690
integer y = 152
integer width = 626
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Included Company Name "
boolean checked = true
end type

type cbx_ctxid from checkbox within w_saveas_file_options
integer x = 160
integer y = 152
integer width = 443
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Included CTX ID "
boolean checked = true
end type

type gb_1 from groupbox within w_saveas_file_options
integer x = 69
integer y = 44
integer width = 1349
integer height = 388
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "File Name Options"
end type

