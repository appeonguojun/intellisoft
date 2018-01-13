$PBExportHeader$w_snn_check_prac_info.srw
$PBExportComments$for lij 01-02
forward
global type w_snn_check_prac_info from window
end type
type rb_npi from radiobutton within w_snn_check_prac_info
end type
type rb_ssn from radiobutton within w_snn_check_prac_info
end type
type st_mes from statictext within w_snn_check_prac_info
end type
type cb_2 from commandbutton within w_snn_check_prac_info
end type
type st_none from statictext within w_snn_check_prac_info
end type
type st_enter from statictext within w_snn_check_prac_info
end type
type cb_search from commandbutton within w_snn_check_prac_info
end type
type em_ssn from editmask within w_snn_check_prac_info
end type
type cb_1 from commandbutton within w_snn_check_prac_info
end type
type cb_del from commandbutton within w_snn_check_prac_info
end type
type dw_2 from datawindow within w_snn_check_prac_info
end type
type dw_1 from datawindow within w_snn_check_prac_info
end type
type gb_1 from groupbox within w_snn_check_prac_info
end type
type em_npi from editmask within w_snn_check_prac_info
end type
end forward

global type w_snn_check_prac_info from window
integer x = 590
integer y = 412
integer width = 2688
integer height = 1584
boolean titlebar = true
string title = "Practitioner SSN/NPI Search"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
rb_npi rb_npi
rb_ssn rb_ssn
st_mes st_mes
cb_2 cb_2
st_none st_none
st_enter st_enter
cb_search cb_search
em_ssn em_ssn
cb_1 cb_1
cb_del cb_del
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
em_npi em_npi
end type
global w_snn_check_prac_info w_snn_check_prac_info

type variables
integer ii_rights
string is_type
end variables

forward prototypes
public function integer of_setup ()
end prototypes

public function integer of_setup ();//Start Code Change ----04.14.2008 #V8 maha - function add for search type specific setup
st_enter.text = "Enter " + is_type + " and click Search."
st_none.text = "No practitioners found with matching " + is_type + "."


choose case is_type
	case "SSN"
		em_ssn.visible = true
		em_npi.visible = false
		setfocus(em_ssn )
		
	case "NPI"
		em_ssn.visible = false
		em_npi.visible = true
		setfocus(em_npi )
end choose







return 1
end function

on w_snn_check_prac_info.create
this.rb_npi=create rb_npi
this.rb_ssn=create rb_ssn
this.st_mes=create st_mes
this.cb_2=create cb_2
this.st_none=create st_none
this.st_enter=create st_enter
this.cb_search=create cb_search
this.em_ssn=create em_ssn
this.cb_1=create cb_1
this.cb_del=create cb_del
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.em_npi=create em_npi
this.Control[]={this.rb_npi,&
this.rb_ssn,&
this.st_mes,&
this.cb_2,&
this.st_none,&
this.st_enter,&
this.cb_search,&
this.em_ssn,&
this.cb_1,&
this.cb_del,&
this.dw_2,&
this.dw_1,&
this.gb_1,&
this.em_npi}
end on

on w_snn_check_prac_info.destroy
destroy(this.rb_npi)
destroy(this.rb_ssn)
destroy(this.st_mes)
destroy(this.cb_2)
destroy(this.st_none)
destroy(this.st_enter)
destroy(this.cb_search)
destroy(this.em_ssn)
destroy(this.cb_1)
destroy(this.cb_del)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.em_npi)
end on

event open;//string is_ssn
//long pracid
//
//is_ssn = message.stringparm
//
//this.title = "Practitioners with SSN of " + is_ssn
//dw_1.settransobject(sqlca)
//dw_1.retrieve(is_ssn)
//
//pracid = dw_1.getitemnumber(1,"prac_id")
//
//dw_2.settransobject(sqlca)
//dw_2.retrieve(pracid)
//
//if gs_user_id = "MASTER" then
//	cb_del.visible = true
//end if

integer i

st_none.visible = false //maha 052004
st_mes.visible = false //maha 071305

i = message.doubleparm

//if i = 1 then
	is_type = "SSN"
//elseif i = 2 then
//	is_type = "NPI"	
//else
//	close(this)
//end if
////of_setup

ii_rights = w_mdi.of_security_access(30)
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type rb_npi from radiobutton within w_snn_check_prac_info
integer x = 1019
integer y = 64
integer width = 297
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "NPI"
end type

event clicked;is_type = "NPI"	
of_setup ()
end event

type rb_ssn from radiobutton within w_snn_check_prac_info
integer x = 594
integer y = 64
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SSN"
boolean checked = true
end type

event clicked;is_type = "SSN"	
of_setup ()
end event

type st_mes from statictext within w_snn_check_prac_info
integer x = 142
integer y = 296
integer width = 2350
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Practitioner match found but you do not have rights to continue."
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_snn_check_prac_info
integer x = 2386
integer y = 1252
integer width = 247
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;long pracid

pracid = -123
closewithreturn(parent,pracid)
end event

type st_none from statictext within w_snn_check_prac_info
integer x = 686
integer y = 376
integer width = 1262
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "No practitioners found with matching Number."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_enter from statictext within w_snn_check_prac_info
integer x = 901
integer y = 204
integer width = 837
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Enter SSN and click Search."
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_search from commandbutton within w_snn_check_prac_info
integer x = 1920
integer y = 52
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Search"
boolean default = true
end type

event clicked;string ls_num
string ls_type //maha 04.23.08
long pracid
integer rc

//Start Code Change ----04.14.2008 #V8 maha - modification to allow search on multiple fields
if em_npi.visible then
	ls_num = em_npi.text
	ls_type = "N"
elseif em_ssn.visible then
	ls_num = em_ssn.text
	ls_num = mid(trim(ls_num),1,3) + mid(trim(ls_num),5,2) + mid(trim(ls_num),8,4)
	ls_type = "S"
else
	return
end if

if len(ls_num) = 0 or long(ls_num) = 0 then
	messagebox("","Please enter " + is_type)
	if em_npi.visible then
		em_npi.setfocus( )
	else
		em_ssn.setfocus( )	//Added by Scofield on 2008-03-07
	end if
end if

st_none.visible = false  //Start Code Change ----03.11.2008 #V8 maha - added for multiple checks
//closewithreturn(parent,ssn)

dw_1.settransobject(sqlca)
rc = dw_1.retrieve(ls_num)
dw_2.reset() 
//End Code Change---04.14.2008

if rc > 0 then
	pracid = dw_1.getitemnumber(1,"prac_id")

	dw_2.settransobject(sqlca)
	dw_2.retrieve(pracid)
	if ii_rights = 1 then
		cb_1.enabled = true
	else
		cb_1.enabled = false
		st_mes.visible = true
	end if
	
elseif rc = 0 then
	st_none.visible = true
	st_mes.visible = false
	cb_1.text = "&Continue"
	cb_1.enabled = true
	gs_ssnnpi = ls_type + "*" + ls_num //Start Code Change ----04.23.2008 #V8 maha - create value for setting on de screen
end if


//if gs_user_id = "MASTER" then //maha removed 052004
//	cb_del.visible = true
//end if

 

end event

type em_ssn from editmask within w_snn_check_prac_info
integer x = 1509
integer y = 52
integer width = 379
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###-##-####"
end type

type cb_1 from commandbutton within w_snn_check_prac_info
integer x = 2126
integer y = 1252
integer width = 247
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Continue"
end type

event clicked;long pracid

if dw_1.rowcount() = 0 then
	pracid = -9
else
	pracid = dw_1.getitemnumber(dw_1.getrow(),"prac_id")
end if

closewithreturn(parent,pracid)
end event

type cb_del from commandbutton within w_snn_check_prac_info
boolean visible = false
integer x = 37
integer y = 1312
integer width = 215
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

type dw_2 from datawindow within w_snn_check_prac_info
integer x = 27
integer y = 732
integer width = 2606
integer height = 476
integer taborder = 40
string dataobject = "d_affil_list_for_prac"
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_1 from datawindow within w_snn_check_prac_info
integer x = 23
integer y = 476
integer width = 2615
integer height = 236
integer taborder = 30
string dataobject = "d_ssn_check_prac_info"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;integer nr

nr = this.getclickedrow()

this.setrow(nr)
end event

event rowfocuschanged;long prac

if this.rowcount() > 0 then
	prac = this.getitemnumber(currentrow,"prac_id")

	dw_2.settransobject(sqlca)
	dw_2.retrieve(prac)
end if
	
end event

event constructor;this.SetRowFocusIndicator ( FocusRect! )
end event

type gb_1 from groupbox within w_snn_check_prac_info
integer x = 462
integer y = 4
integer width = 946
integer height = 148
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Search on:"
borderstyle borderstyle = stylebox!
end type

type em_npi from editmask within w_snn_check_prac_info
event ue_setup ( )
boolean visible = false
integer x = 1509
integer y = 52
integer width = 379
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "##########"
end type

event ue_setup();//Start Code Change ----04.14.2008 #V8 maha

end event

