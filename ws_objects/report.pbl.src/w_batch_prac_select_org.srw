$PBExportHeader$w_batch_prac_select_org.srw
forward
global type w_batch_prac_select_org from window
end type
type uo_1 from pfc_cst_u_prac_batch_search within w_batch_prac_select_org
end type
end forward

global type w_batch_prac_select_org from window
integer x = 219
integer y = 288
integer width = 3319
integer height = 2040
boolean titlebar = true
string title = "Practitioner Batch Search"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
uo_1 uo_1
end type
global w_batch_prac_select_org w_batch_prac_select_org

type variables
string is_openfor
end variables

on w_batch_prac_select_org.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on w_batch_prac_select_org.destroy
destroy(this.uo_1)
end on

event open;integer li_fac_pos
string ls_fac
string ls_open

is_openfor = message.stringparm
//messagebox("is_openfor",is_openfor)
li_fac_pos = pos(is_openfor,"*",1)
//check to see if facility is being passed  
if li_fac_pos > 0 then
	if isnumber(mid(is_openfor,li_fac_pos + 1)) then
		uo_1.il_facility_id = integer(mid(is_openfor,li_fac_pos + 1))
		uo_1.cbx_facility.enabled = false
		uo_1.cbx_status.enabled = false
		select facility_name into :ls_fac from facility where facility_id = :uo_1.il_facility_id;
		uo_1.st_facility.text = ls_fac
		uo_1.ib_facility = true
	end if
else
	uo_1.ib_facility = false
	
end if

ls_open = mid(is_openfor,1,1)
uo_1.is_openedfor = ls_open
// A = intelliapp printing
// R = reports or correspondence
// E = Export Painter
// P = Custom profile run from reports
//messagebox("",ls_open)
if ls_open = "A" then
	uo_1.dw_app.visible = true
	uo_1.st_app.visible = true
	uo_1.cbx_facility.enabled = false
	uo_1.cbx_status.enabled = false
elseif ls_open = "E" then
	uo_1.dw_app.visible = false
	uo_1.st_app.visible = false
	uo_1.cb_return.text = "Return with Syntax"
elseif ls_open = "P" then
	uo_1.dw_app.visible = false
	uo_1.st_app.visible = false
else //"R"
	uo_1.dw_app.visible = false
	uo_1.st_app.visible = false	
end if


gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type uo_1 from pfc_cst_u_prac_batch_search within w_batch_prac_select_org
integer x = 14
integer y = 12
integer taborder = 10
end type

on uo_1.destroy
call pfc_cst_u_prac_batch_search::destroy
end on

