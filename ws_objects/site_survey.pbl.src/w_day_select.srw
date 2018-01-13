$PBExportHeader$w_day_select.srw
forward
global type w_day_select from w_response
end type
type dw_1 from datawindow within w_day_select
end type
type st_2 from statictext within w_day_select
end type
type st_1 from statictext within w_day_select
end type
type st_msg from statictext within w_day_select
end type
type ddlb_1 from dropdownlistbox within w_day_select
end type
type cb_cancel from commandbutton within w_day_select
end type
type cb_ok from commandbutton within w_day_select
end type
end forward

global type w_day_select from w_response
integer width = 1746
integer height = 652
string title = "Account Settings"
event ue_syscommand pbm_syscommand
dw_1 dw_1
st_2 st_2
st_1 st_1
st_msg st_msg
ddlb_1 ddlb_1
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_day_select w_day_select

type variables
Long il_pic_id
end variables

event ue_syscommand;//If message.wordparm = 61536 Then
//	cb_cancel.Trigger Event Clicked()
//End If
//
end event

on w_day_select.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_2=create st_2
this.st_1=create st_1
this.st_msg=create st_msg
this.ddlb_1=create ddlb_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_msg
this.Control[iCurrent+5]=this.ddlb_1
this.Control[iCurrent+6]=this.cb_cancel
this.Control[iCurrent+7]=this.cb_ok
end on

on w_day_select.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_msg)
destroy(this.ddlb_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;call super::open;datetime		ldt_date
datawindowchild ldwc

ddlb_1.text = string(0)

dw_1.insertrow(0)
dw_1.setitem(1,'facility_type','A')
dw_1.getchild( "facility_id", ldwc)
ldwc.settransobject(sqlca)
ldwc.retrieve()
//ddlb_2.text = 'Our Company'

//ldt_date	=	f_get_server_dtm()
//st_msg.text = "Current Server Date: "+string(ldt_date,"MM/dd/yyyy")
st_msg.text = "Tip: Click OK to generate a ContractRuqest link that will allow a user to create a Requester account."
end event

type dw_1 from datawindow within w_day_select
integer x = 32
integer y = 136
integer width = 1687
integer height = 176
integer taborder = 50
string title = "none"
string dataobject = "d_set_company_parm"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_day_select
integer x = 14
integer y = 44
integer width = 791
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Please choose valid period in days: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_day_select
integer x = 1079
integer y = 48
integer width = 645
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "( Enter 0 for unlimited period )"
boolean focusrectangle = false
end type

type st_msg from statictext within w_day_select
integer x = 23
integer y = 436
integer width = 1687
integer height = 128
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Tip: Click OK to generate a ContractRuqest link that will allow a user to create a Requester account."
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_day_select
integer x = 814
integer y = 32
integer width = 261
integer height = 796
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {"0","1","2","3","4","5","6","7","8","9"}
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_day_select
integer x = 1079
integer y = 332
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

event clicked;
//CloseWithReturn(Parent,-1)
CloseWithReturn(Parent,'-1')


end event

type cb_ok from commandbutton within w_day_select
integer x = 421
integer y = 332
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

event clicked;string 		ls_data
string ls_type
long ll_id

ls_data = string(ddlb_1.text)

//Added By Jay Chen 11-25-2015
dw_1.accepttext()
ls_type = dw_1.getitemstring(1, "facility_type")
ll_id = dw_1.getitemnumber(1,"facility_id")
if isnull(ll_id) then ll_id = 0
if ls_type = 'A' and ll_id = 0 then
	Messagebox(gnv_app.iapp_object.DisplayName,"Please select a company name.")
	dw_1.setfocus( )
	dw_1.setcolumn("facility_id")
	return
end if 

if not isnull(ls_data) and isnumber(ls_data) and long(ls_data) >=0 then 
//	CloseWithReturn(Parent,long(ls_data))
	CloseWithReturn(Parent,ls_data + '#' + ls_type + '-' + string(ll_id))
else
	Messagebox(gnv_app.iapp_object.DisplayName,"Please enter a whole number that is greater than or equal to zero.")
	ddlb_1.setfocus( )
	return
end if 


end event

