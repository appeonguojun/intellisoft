$PBExportHeader$w_multi_app_painter.srw
$PBExportComments$used with intellicred
forward
global type w_multi_app_painter from w_response
end type
type uo_multi_app from pfc_cst_u_multi_app_painter within w_multi_app_painter
end type
end forward

global type w_multi_app_painter from w_response
int X=320
int Y=160
int Width=2930
int Height=2124
boolean TitleBar=true
string Title="Multi App Painter"
uo_multi_app uo_multi_app
end type
global w_multi_app_painter w_multi_app_painter

on w_multi_app_painter.create
int iCurrent
call super::create
this.uo_multi_app=create uo_multi_app
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_multi_app
end on

on w_multi_app_painter.destroy
call super::destroy
destroy(this.uo_multi_app)
end on

event open;call super::open;uo_multi_app.iw_win = This
end event

type uo_multi_app from pfc_cst_u_multi_app_painter within w_multi_app_painter
int X=27
int Y=20
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
long BackColor=79741120
end type

on uo_multi_app.destroy
call pfc_cst_u_multi_app_painter::destroy
end on

