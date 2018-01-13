$PBExportHeader$w_main.srw
$PBExportComments$Extension Main Window class
forward
global type w_main from pfc_w_main
end type
end forward

global type w_main from pfc_w_main
end type
global w_main w_main

on w_main.create
call super::create
end on

on w_main.destroy
call super::destroy
end on

event pfc_endtran;call super::pfc_endtran;IF ai_update_results = 1 THEN
	COMMIT USING SQLCA;
END IF

RETURN 1

end event

event activate;call super::activate;//Move to here From w_master -- jervis 05.07.2009
IF ISVALID(W_MDI) THEN 
w_mdi.of_menu_security( w_mdi.MenuName )
END IF 
end event

event open;call super::open;gw_popup[UpperBound(gw_popup[]) + 1] = This
end event

