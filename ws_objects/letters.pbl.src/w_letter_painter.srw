$PBExportHeader$w_letter_painter.srw
forward
global type w_letter_painter from w_response
end type
type uo_letter from pfc_cst_u_letter_painter within w_letter_painter
end type
end forward

global type w_letter_painter from w_response
integer x = 567
integer y = 324
integer height = 2032
string title = "Letter Painter"
uo_letter uo_letter
end type
global w_letter_painter w_letter_painter

on w_letter_painter.create
int iCurrent
call super::create
this.uo_letter=create uo_letter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_letter
end on

on w_letter_painter.destroy
call super::destroy
destroy(this.uo_letter)
end on

event open;call super::open;uo_letter.of_set_Parent_Window( This )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-10 By: Rodger Wu (Inova)
//$<reason> Attention!!!
/* In this PBL file, there are 46 DataWindows which name beginning with d_ltr_
	are modified by adding sex, maiden_other_name or suit_apt fields.
*/
//---------------------------- APPEON END ----------------------------

end event

type uo_letter from pfc_cst_u_letter_painter within w_letter_painter
integer x = 46
integer y = 12
integer taborder = 10
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_letter.destroy
call pfc_cst_u_letter_painter::destroy
end on

