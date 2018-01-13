$PBExportHeader$w_prac_batch_search.srw
forward
global type w_prac_batch_search from window
end type
type cb_default from commandbutton within w_prac_batch_search
end type
type cb_batch from commandbutton within w_prac_batch_search
end type
type st_batch from statictext within w_prac_batch_search
end type
type cb_2 from commandbutton within w_prac_batch_search
end type
type dw_1 from datawindow within w_prac_batch_search
end type
end forward

global type w_prac_batch_search from window
integer x = 585
integer y = 932
integer width = 2665
integer height = 492
boolean titlebar = true
string title = "Practitioner Batch Select"
windowtype windowtype = response!
long backcolor = 79680469
cb_default cb_default
cb_batch cb_batch
st_batch st_batch
cb_2 cb_2
dw_1 dw_1
end type
global w_prac_batch_search w_prac_batch_search

type variables
integer ii_screen
long il_batch_id
end variables

on w_prac_batch_search.create
this.cb_default=create cb_default
this.cb_batch=create cb_batch
this.st_batch=create st_batch
this.cb_2=create cb_2
this.dw_1=create dw_1
this.Control[]={this.cb_default,&
this.cb_batch,&
this.st_batch,&
this.cb_2,&
this.dw_1}
end on

on w_prac_batch_search.destroy
destroy(this.cb_default)
destroy(this.cb_batch)
destroy(this.st_batch)
destroy(this.cb_2)
destroy(this.dw_1)
end on

event open;integer f
string ls_batch
il_batch_id = message.doubleparm

dw_1.settransobject(sqlca)
dw_1.retrieve()

datawindowchild dwchild
dw_1.GetChild("batch_id", dwchild)
dwchild.SetTransObject(Sqlca)
dwchild.InsertRow(1)
dwchild.SetItem(1, "batch_id", -999)
dwchild.SetItem(1, "batch_name", "")
dw_1.SetItem(1, "batch_id", -999)

if il_batch_id > 0 then
	f = dwchild.find( "batch_id = " + string(il_batch_id), 1, dwchild.rowcount())
	if f > 0 then
		ls_batch = dwchild.getitemstring(f,"batch_name")
		st_batch.text = "Default Batch - " + ls_batch
	else
		st_batch.text = "Please select an existing batch or Click Batch Search to create a batch."
		cb_default.enabled = false
	end if
end if
		
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

		


end event

type cb_default from commandbutton within w_prac_batch_search
integer x = 1463
integer y = 184
integer width = 521
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Use &Default"
boolean default = true
end type

event clicked;closewithreturn(parent,il_batch_id  )
end event

type cb_batch from commandbutton within w_prac_batch_search
integer x = 923
integer y = 184
integer width = 521
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Batch Search"
boolean default = true
end type

event clicked;open(w_batch_prac_select_new)

il_batch_id = message.doubleparm

closewithreturn(parent,il_batch_id)
end event

type st_batch from statictext within w_prac_batch_search
integer x = 256
integer y = 56
integer width = 2034
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Please select an existing batch or Click Batch Search to create a batch."
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_prac_batch_search
integer x = 1998
integer y = 184
integer width = 521
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
end type

event clicked;closewithreturn(parent,"C")
end event

type dw_1 from datawindow within w_prac_batch_search
integer x = 55
integer y = 184
integer width = 841
integer height = 92
integer taborder = 30
string dataobject = "d_d_batch_list"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//ii_screen = integer(data)
//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 01.13.2006 By: Liuhongxin
//$<reason> Fix a defect.
if Long(data) = -999 then return 0
//---------------------------- APPEON END ----------------------------

closewithreturn(parent,long(data))
end event

