$PBExportHeader$w_survey_painter.srw
forward
global type w_survey_painter from w_response
end type
type uo_survey from pfc_cst_u_site_survey within w_survey_painter
end type
end forward

global type w_survey_painter from w_response
int X=14
int Y=32
int Width=3616
int Height=2196
boolean TitleBar=true
string Title="Survey Painter"
uo_survey uo_survey
end type
global w_survey_painter w_survey_painter

on w_survey_painter.create
int iCurrent
call super::create
this.uo_survey=create uo_survey
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_survey
end on

on w_survey_painter.destroy
call super::destroy
destroy(this.uo_survey)
end on

event open;call super::open;uo_survey.of_set_parent_window ( This )
end event

type uo_survey from pfc_cst_u_site_survey within w_survey_painter
int X=0
int Y=8
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

on uo_survey.destroy
call pfc_cst_u_site_survey::destroy
end on

