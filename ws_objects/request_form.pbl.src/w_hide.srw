$PBExportHeader$w_hide.srw
forward
global type w_hide from w_sheet
end type
type dw_1 from u_dw within w_hide
end type
end forward

global type w_hide from w_sheet
boolean visible = false
integer x = 214
integer y = 221
string title = "hide"
dw_1 dw_1
end type
global w_hide w_hide

on w_hide.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on w_hide.destroy
call super::destroy
destroy(this.dw_1)
end on

event open;call super::open;// dw_1, use for pfc_n_cst_ai_export_apb.of_update_export_data()
end event

type dw_1 from u_dw within w_hide
integer x = 46
integer y = 20
integer width = 923
integer height = 408
integer taborder = 10
end type

