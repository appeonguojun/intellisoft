$PBExportHeader$w_practice_to_addr_find_new.srw
forward
global type w_practice_to_addr_find_new from window
end type
type rb_up from radiobutton within w_practice_to_addr_find_new
end type
type rb_add from radiobutton within w_practice_to_addr_find_new
end type
type rb_parent_name from radiobutton within w_practice_to_addr_find_new
end type
type rb_pho from radiobutton within w_practice_to_addr_find_new
end type
type rb_addr from radiobutton within w_practice_to_addr_find_new
end type
type cb_3 from commandbutton within w_practice_to_addr_find_new
end type
type cb_populate from commandbutton within w_practice_to_addr_find_new
end type
type dw_1 from datawindow within w_practice_to_addr_find_new
end type
type cb_1 from commandbutton within w_practice_to_addr_find_new
end type
type sle_1 from singlelineedit within w_practice_to_addr_find_new
end type
type gb_1 from groupbox within w_practice_to_addr_find_new
end type
type gb_2 from groupbox within w_practice_to_addr_find_new
end type
end forward

global type w_practice_to_addr_find_new from window
integer x = 741
integer y = 96
integer width = 2258
integer height = 2192
boolean titlebar = true
string title = "Find Practice"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
rb_up rb_up
rb_add rb_add
rb_parent_name rb_parent_name
rb_pho rb_pho
rb_addr rb_addr
cb_3 cb_3
cb_populate cb_populate
dw_1 dw_1
cb_1 cb_1
sle_1 sle_1
gb_1 gb_1
gb_2 gb_2
end type
global w_practice_to_addr_find_new w_practice_to_addr_find_new

type variables
long il_addr_id[]
integer ii_close = 0
end variables

on w_practice_to_addr_find_new.create
this.rb_up=create rb_up
this.rb_add=create rb_add
this.rb_parent_name=create rb_parent_name
this.rb_pho=create rb_pho
this.rb_addr=create rb_addr
this.cb_3=create cb_3
this.cb_populate=create cb_populate
this.dw_1=create dw_1
this.cb_1=create cb_1
this.sle_1=create sle_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.rb_up,&
this.rb_add,&
this.rb_parent_name,&
this.rb_pho,&
this.rb_addr,&
this.cb_3,&
this.cb_populate,&
this.dw_1,&
this.cb_1,&
this.sle_1,&
this.gb_1,&
this.gb_2}
end on

on w_practice_to_addr_find_new.destroy
destroy(this.rb_up)
destroy(this.rb_add)
destroy(this.rb_parent_name)
destroy(this.rb_pho)
destroy(this.rb_addr)
destroy(this.cb_3)
destroy(this.cb_populate)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;
dw_1.retrieve()

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event closequery;if ii_close = 0 then
	messagebox("Close","Click Cancel to close")
	return 1
end if
end event

type rb_up from radiobutton within w_practice_to_addr_find_new
integer x = 1883
integer y = 204
integer width = 247
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Update"
end type

event clicked;gi_temp_switch = 1
end event

type rb_add from radiobutton within w_practice_to_addr_find_new
integer x = 1687
integer y = 204
integer width = 247
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Add"
boolean checked = true
end type

event clicked;gi_temp_switch = 0
end event

type rb_parent_name from radiobutton within w_practice_to_addr_find_new
integer x = 87
integer y = 68
integer width = 594
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent Company Name"
end type

type rb_pho from radiobutton within w_practice_to_addr_find_new
integer x = 1184
integer y = 68
integer width = 311
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Phone #"
end type

type rb_addr from radiobutton within w_practice_to_addr_find_new
integer x = 722
integer y = 68
integer width = 617
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Practice Name"
boolean checked = true
end type

type cb_3 from commandbutton within w_practice_to_addr_find_new
integer x = 1934
integer y = 32
integer width = 247
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;gs_pass_ids ids

ids.l_ids[1] = 0
ii_close = 1
CloseWithReturn(Parent, ids)
end event

type cb_populate from commandbutton within w_practice_to_addr_find_new
integer x = 1673
integer y = 32
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Populate"
boolean default = true
end type

event clicked;Integer li_Rc
Integer i


dw_1.AcceptText()

dw_1.SetFilter( "selected = 1" ) 
dw_1.Filter()

li_rc = dw_1.RowCount( )

IF li_rc = 0 THEN
	MessageBox( "Nothing Selected", "You must select at least one address to populate." )
	dw_1.SetFilter( "" ) 
	dw_1.Filter()
	Return
END IF

gs_pass_ids ids

FOR i = 1 TO li_rc
	ids.l_ids[ i ]  = dw_1.GetItemNumber( i, "rec_id" )
END FOR

message.doubleparm = 1
ii_close = 1
CloseWithReturn( Parent, ids )

debugbreak()
end event

type dw_1 from datawindow within w_practice_to_addr_find_new
integer x = 46
integer y = 308
integer width = 2135
integer height = 1752
integer taborder = 60
string dataobject = "d_group_prac_search_new"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;Integer li_row

li_row = this.getclickedrow()

dw_1.setrow(li_row)
dw_1.selectrow(0,false)
dw_1.selectrow(li_row,true)
//
//il_addr_id = dw_1.getitemnumber(li_row,"rec_id")



end event

event doubleclicked;cb_populate.TriggerEvent( Clicked! )

end event

event constructor;this.settransobject(sqlca)

DataWindowChild dwchild


This.GetChild( "state", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("state")
dwchild.InsertRow( 1 )

This.GetChild( "mailing_address", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("address type")
dwchild.InsertRow( 1 )

This.GetChild( "county", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("county")
dwchild.InsertRow( 1 )

This.GetChild( "country", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("country")
dwchild.InsertRow( 1 )



end event

event itemchanged;//added maha 083004 for checking add/update default does not work
//
//long i
//long ic
//integer cnt
//
//this.accepttext()
//
//for i = 1 to ic
//	if this.getitemnumber(i,"selected") = 0 then //this means it will be checked
//		cnt++
//	end if
//	if cnt > 1 then //if more that one selected default to add
//		gi_temp_switch = 0
//		rb_add.checked = true
//		rb_up.checked = false
//		rb_up.enabled = false
//		exit
//	else
//		rb_up.enabled = true
//	end if
//next

end event

type cb_1 from commandbutton within w_practice_to_addr_find_new
integer x = 1257
integer y = 184
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Filter"
end type

event clicked;string ls_filter = ""
integer li_rtnval

if isnull(sle_1.text) then return

ls_filter = upper(sle_1.text)

if ls_filter = "" then 
	ls_filter = ""
else
	if rb_addr.checked = true then 
		ls_filter = "upper(street) like '%" + ls_filter + "%'"
	elseif rb_pho.checked = true then 	
		ls_filter = "phone like '%" + ls_filter + "%'"
	else
		ls_filter = "upper(gp_name) like '%" + ls_filter + "%'" //alfee 12.12.2008
		//ls_filter = "gp_name like '%" + ls_filter + "%'"
	end if
end if
	

//messagebox("filter",ls_filter)
//li_rtnval = 
dw_1.setfilter(ls_filter)  
//if li_rtnval = 1 then
dw_1.filter()


//

end event

type sle_1 from singlelineedit within w_practice_to_addr_find_new
integer x = 46
integer y = 184
integer width = 1193
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_practice_to_addr_find_new
integer x = 1669
integer y = 160
integer width = 494
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_practice_to_addr_find_new
integer x = 50
integer y = 8
integer width = 1458
integer height = 156
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 80269524
string text = "Filter By"
end type

