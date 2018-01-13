$PBExportHeader$w_letter_painter_ia.srw
forward
global type w_letter_painter_ia from w_response
end type
type uo_letter from pfc_cst_u_letter_painter_ia within w_letter_painter_ia
end type
end forward

global type w_letter_painter_ia from w_response
int Width=2478
int Height=2040
uo_letter uo_letter
end type
global w_letter_painter_ia w_letter_painter_ia

on w_letter_painter_ia.create
int iCurrent
call super::create
this.uo_letter=create uo_letter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_letter
end on

on w_letter_painter_ia.destroy
call super::destroy
destroy(this.uo_letter)
end on

event open;call super::open;uo_letter.of_Set_Parent_Window( This )
end event

type uo_letter from pfc_cst_u_letter_painter_ia within w_letter_painter_ia
int X=41
int Y=28
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
long BackColor=80269524
end type

on uo_letter.destroy
call pfc_cst_u_letter_painter_ia::destroy
end on

