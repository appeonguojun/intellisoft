$PBExportHeader$w_import_ctx_template.srw
forward
global type w_import_ctx_template from w_response
end type
type cb_cancel from commandbutton within w_import_ctx_template
end type
type cb_ok from commandbutton within w_import_ctx_template
end type
type dw_1 from u_dw within w_import_ctx_template
end type
type gb_1 from groupbox within w_import_ctx_template
end type
end forward

global type w_import_ctx_template from w_response
integer x = 214
integer y = 221
integer width = 1527
integer height = 472
string title = "Use a Template to Create the Contract"
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
gb_1 gb_1
end type
global w_import_ctx_template w_import_ctx_template

on w_import_ctx_template.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
end on

on w_import_ctx_template.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;DataWindowChild ldw_Child

dw_1.SetTransObject(Sqlca)
dw_1.InsertRow(0)

dw_1.GetChild( "template_id", ldw_Child)
ldw_Child.SetTransObject(Sqlca)
ldw_Child.Retrieve(gs_USER_ID)
end event

event closequery;//
end event

type cb_cancel from commandbutton within w_import_ctx_template
integer x = 1147
integer y = 272
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;CloseWithReturn(parent,0)
end event

type cb_ok from commandbutton within w_import_ctx_template
integer x = 800
integer y = 272
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
end type

event clicked;long ll_template_id
ll_template_id =  dw_1.getitemnumber(1,'template_id') 
If IsNull(ll_template_id) Then ll_template_id = 0
CloseWithReturn(Parent, ll_template_id)
end event

type dw_1 from u_dw within w_import_ctx_template
integer x = 73
integer y = 104
integer width = 1371
integer height = 108
integer taborder = 10
string dataobject = "d_import_choose_ctx_template"
boolean vscrollbar = false
end type

type gb_1 from groupbox within w_import_ctx_template
integer x = 23
integer y = 28
integer width = 1467
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choose a Template"
end type

