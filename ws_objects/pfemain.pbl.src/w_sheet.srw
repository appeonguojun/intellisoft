$PBExportHeader$w_sheet.srw
$PBExportComments$Extension Sheet Window class
forward
global type w_sheet from pfc_w_sheet
end type
end forward

global type w_sheet from pfc_w_sheet
integer x = 214
integer y = 221
end type
global w_sheet w_sheet

type variables
boolean ib_movetozero = true
end variables

on w_sheet.create
call super::create
end on

on w_sheet.destroy
call super::destroy
end on

event open;call super::open;if ib_movetozero then move(0,0)	//09.23.2009 by jervis
end event

event activate;call super::activate;//Move to here From w_master -- jervis 05.07.2009
IF ISVALID(W_MDI) THEN 
w_mdi.of_menu_security( w_mdi.MenuName )
END IF 
end event

