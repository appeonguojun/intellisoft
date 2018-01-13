$PBExportHeader$w_aiq_run.srw
forward
global type w_aiq_run from window
end type
type st_1 from statictext within w_aiq_run
end type
type r_1 from rectangle within w_aiq_run
end type
type r_status from rectangle within w_aiq_run
end type
end forward

global type w_aiq_run from window
integer x = 1056
integer y = 484
integer width = 2373
integer height = 720
boolean titlebar = true
string title = "Action Items Query"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
st_1 st_1
r_1 r_1
r_status r_status
end type
global w_aiq_run w_aiq_run

on w_aiq_run.create
this.st_1=create st_1
this.r_1=create r_1
this.r_status=create r_status
this.Control[]={this.st_1,&
this.r_1,&
this.r_status}
end on

on w_aiq_run.destroy
destroy(this.st_1)
destroy(this.r_1)
destroy(this.r_status)
end on

event open;//Timer ( 1 ,this )
//
//st_2.text = string(50)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event timer;//integer w
//
//w = r_status.width
//
//if w > 499 then w = 0
//
//w = w + 10
//
//r_status.width = w
//
//st_2.text = string(w)
end event

type st_1 from statictext within w_aiq_run
integer x = 91
integer y = 144
integer width = 2071
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Running Action Items Query"
boolean focusrectangle = false
end type

type r_1 from rectangle within w_aiq_run
integer linethickness = 4
long fillcolor = 80269524
integer x = 91
integer y = 320
integer width = 2094
integer height = 72
end type

type r_status from rectangle within w_aiq_run
long linecolor = 80269524
integer linethickness = 4
long fillcolor = 16711680
integer x = 96
integer y = 324
integer width = 50
integer height = 64
end type

