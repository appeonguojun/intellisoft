$PBExportHeader$w_refs.srw
forward
global type w_refs from window
end type
type cb_5 from commandbutton within w_refs
end type
type cb_4 from commandbutton within w_refs
end type
type cb_3 from commandbutton within w_refs
end type
type cb_2 from commandbutton within w_refs
end type
type dw_1 from datawindow within w_refs
end type
type dw_3 from datawindow within w_refs
end type
type cb_1 from commandbutton within w_refs
end type
type dw_copy from datawindow within w_refs
end type
end forward

global type w_refs from window
integer x = 219
integer y = 200
integer width = 3296
integer height = 1972
boolean titlebar = true
string title = "Reference Update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
dw_1 dw_1
dw_3 dw_3
cb_1 cb_1
dw_copy dw_copy
end type
global w_refs w_refs

on w_refs.create
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_1=create dw_1
this.dw_3=create dw_3
this.cb_1=create cb_1
this.dw_copy=create dw_copy
this.Control[]={this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.dw_1,&
this.dw_3,&
this.cb_1,&
this.dw_copy}
end on

on w_refs.destroy
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.dw_3)
destroy(this.cb_1)
destroy(this.dw_copy)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_5 from commandbutton within w_refs
integer x = 23
integer y = 48
integer width = 631
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Adjust ref codes in ed"
end type

event clicked;update data_view_screen
set reference_field_1 = 89
where screen_id = 6;

update data_view_screen
set reference_field_2 = 82
where screen_id = 6;


end event

type cb_4 from commandbutton within w_refs
integer x = 2848
integer y = 60
integer width = 247
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_3 from commandbutton within w_refs
integer x = 1870
integer y = 48
integer width = 247
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "save"
end type

event clicked;dw_1.update()

commit using sqlca;

messagebox("","Save Complete.")
end event

type cb_2 from commandbutton within w_refs
integer x = 1211
integer y = 48
integer width = 526
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "update references"
end type

event clicked;long r
integer r2
integer i
integer rcount
integer rcount2
integer rcount3
long recid
long pracid
integer facilid
integer tableid
long ll_ref
string ls_ref1
string ls_ref2
string fullref
long recdata
long recver
integer check = 0
string ls_ref
long addr_id

rcount = dw_1.rowcount()

for r = 1 to rcount
		
			dw_1.scrolltorow(r)
			fullref = ""
			tableid = dw_1.getitemnumber(r,"data_view_screen_table_id")
			recid = dw_1.getitemnumber(r,"rec_id")
			choose case tableid
		
				case 8//
					dw_3.dataobject = "d_x_education"
					dw_3.settransobject(sqlca)
					dw_3.retrieve(recid)
					if dw_3.rowcount() < 1 then continue
	
				case else
					continue
			end choose
			
			
				choose case tableid
		
				case 8//
					
		
					ls_ref2 = dw_3.getitemstring(1,"code")
					ls_ref1 = dw_3.getitemstring(1,"entity_name")
					addr_id = dw_3.getitemnumber(1,"school_code")
		
				case else
					continue
			end choose
	
		if isnull(ls_ref1) then ls_ref1 = " "
		if isnull(ls_ref2) then ls_ref2 = " "
		fullref = ls_ref1 + " - " + ls_ref2	
		dw_1.setitem(r,"reference_value",fullref)
		dw_1.setitem(r,"address_lookup_code",addr_id)
//		if dw_1.getitemstring(r,"reference_value",primary!,true) <> dw_1.getitemstring(r,"reference_value",primary!,false) then
//			dw_1.rowscopy(1,rcount,primary!,dw_3,1000000,Primary!)
//		end if
		//	messagebox("fullref",fullref)

	
			
		
	
next
//dw_1.rowscopy(1,rcount,DataModified!,dw_3,1000000,Primary!)
cb_3.enabled = true

end event

type dw_1 from datawindow within w_refs
integer x = 41
integer y = 536
integer width = 3200
integer height = 1304
integer taborder = 60
string dataobject = "d_verif_info2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_refs
integer x = 23
integer y = 192
integer width = 3159
integer height = 300
integer taborder = 50
string dataobject = "d_x_education"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_refs
integer x = 718
integer y = 52
integer width = 265
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retrieve"
boolean default = true
end type

event clicked;dw_1.settransobject(sqlca)
dw_1.retrieve()

//dw_3.settransobject(sqlca)

cb_2.enabled = true

end event

type dw_copy from datawindow within w_refs
integer x = 41
integer y = 1380
integer width = 91
integer height = 60
integer taborder = 70
string dataobject = "d_verif_info2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

