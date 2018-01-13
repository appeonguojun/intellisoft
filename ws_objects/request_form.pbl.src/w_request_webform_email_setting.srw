$PBExportHeader$w_request_webform_email_setting.srw
forward
global type w_request_webform_email_setting from w_popup
end type
type dw_1 from u_dw within w_request_webform_email_setting
end type
type cb_cancel from commandbutton within w_request_webform_email_setting
end type
end forward

global type w_request_webform_email_setting from w_popup
integer x = 214
integer y = 221
integer width = 3035
integer height = 768
string title = "Email Sending Settings "
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
dw_1 dw_1
cb_cancel cb_cancel
end type
global w_request_webform_email_setting w_request_webform_email_setting

type variables
long			il_row

end variables

on w_request_webform_email_setting.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_cancel
end on

on w_request_webform_email_setting.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_cancel)
end on

event open;call super::open;DataWindowChild			ldwc_owner_email_id, 	ldwc_approve_email_id	,ldwc_reject_email_id

il_row = Message.doubleparm

if isnull(il_row ) or il_row <= 0 or not isvalid(w_request_webform_approve) then
	this.event close( )
elseif il_row > 0 then 
	dw_1.reset( )

	gnv_appeondb.of_startqueue( )
	dw_1.GetChild( "owner_email_id", ldwc_owner_email_id)
	ldwc_owner_email_id.settransobject( sqlca)
	ldwc_owner_email_id.retrieve( )		
	gnv_appeondb.of_commitqueue( )
		
	dw_1.GetChild( "approve_email_id", ldwc_approve_email_id)
	ldwc_approve_email_id.settransobject( sqlca)
	dw_1.GetChild( "reject_email_id", ldwc_reject_email_id)
	ldwc_reject_email_id.settransobject( sqlca)

	if ldwc_owner_email_id.rowcount( ) > 0 then
		ldwc_owner_email_id.rowscopy( 1, ldwc_owner_email_id.rowcount( ), Primary!, ldwc_approve_email_id, 1, Primary!)
		ldwc_owner_email_id.rowscopy( 1, ldwc_owner_email_id.rowcount( ), Primary!, ldwc_reject_email_id, 1, Primary!)
	end if 
	
	w_request_webform_approve.tab_1.tabpage_detail.dw_header.rowscopy(il_row,il_row, Primary!, this.dw_1, 1 , Primary!)	
end if 

//Added By Jay Chen 06-13-2014
gnv_win_backcolor.of_ChangeWindowBackColor(this) 
end event

type dw_1 from u_dw within w_request_webform_email_setting
integer x = 23
integer y = 24
integer width = 2985
integer height = 524
integer taborder = 10
string dataobject = "d_request_webform_email_setting"
boolean vscrollbar = false
end type

event constructor;call super::constructor;this.of_SetUpdateAble(false)
end event

type cb_cancel from commandbutton within w_request_webform_email_setting
integer x = 2670
integer y = 576
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

