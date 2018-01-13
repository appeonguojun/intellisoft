$PBExportHeader$w_multi_app_painter_new.srw
$PBExportComments$used with intelliapp
forward
global type w_multi_app_painter_new from w_response
end type
type uo_1 from pfc_cst_u_multi_app_painter_new within w_multi_app_painter_new
end type
end forward

global type w_multi_app_painter_new from w_response
int X=439
int Y=128
int Width=2811
int Height=2168
long BackColor=81324524
uo_1 uo_1
end type
global w_multi_app_painter_new w_multi_app_painter_new

on w_multi_app_painter_new.create
int iCurrent
call super::create
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
end on

on w_multi_app_painter_new.destroy
call super::destroy
destroy(this.uo_1)
end on

event open;call super::open;uo_1.iw_win = This
end event

type uo_1 from pfc_cst_u_multi_app_painter_new within w_multi_app_painter_new
int X=14
int Y=24
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

on uo_1.destroy
call pfc_cst_u_multi_app_painter_new::destroy
end on

