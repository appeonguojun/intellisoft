$PBExportHeader$w_master.srw
$PBExportComments$Extension Master Window class
forward
global type w_master from pfc_w_master
end type
end forward

global type w_master from pfc_w_master
end type
global w_master w_master

type prototypes
FUNCTION ulong SetCapture(ulong a) LIBRARY "user32.dll"
FUNCTION boolean ReleaseCapture() LIBRARY "user32.dll"
end prototypes

type variables

// mskinner 28 feb 2006 -- begin
n_ToolTip 	inv_ToolTip
string 		is_ColName
integer 		ii_dwID
// mskinner 28 feb 2006 -- end
Long il_org_win_bkcolor //Added By Ken.Guo 2016-03-16
end variables

forward prototypes
public subroutine of_register (u_tabpg a_po)
public subroutine of_register (u_tab a_po)
end prototypes

public subroutine of_register (u_tabpg a_po);
long ll_i



if not isvalid(inv_resize) then return 

this.inv_resize.of_Register (a_po, inv_resize.scale  )

FOR LL_I =  1 TO UPPERBOUND(a_po.CONTrol)
   this.inv_resize.of_Register (a_po.CONTrol[LL_I]  , inv_resize.scale	 )
NEXT
end subroutine

public subroutine of_register (u_tab a_po);
 

long ll_i

if not isvalid(inv_resize) then return 

this.inv_resize.of_Register (a_po, inv_resize.scale  )

FOR LL_I =  1 TO UPPERBOUND(a_po.CONTrol)
   this.inv_resize.of_Register (a_po.CONTrol[LL_I]  , inv_resize.scale	 )
NEXT
end subroutine

on w_master.create
call super::create
end on

on w_master.destroy
call super::destroy
end on

event activate;call super::activate;//Comment By Jervis - 05.07.2009
//Move to w_main and w_sheet
/*
// MSKINNER 29 DEC 2005 --- BEGIN
// DEFECT 634
IF ISVALID(W_MDI) THEN 
w_mdi.of_menu_security( w_mdi.MenuName )
END IF 
// MSKINNER 29 DEC 2005 --- END
*/
end event

event pfc_postopen;call super::pfc_postopen;//comment by jervis 05.07.2009
/*
// MSKINNER 29 DEC 2005 --- BEGIN
// DEFECT 634
IF ISVALID(W_MDI) THEN 
w_mdi.of_menu_security( w_mdi.MenuName )
END IF 
// MSKINNER 29 DEC 2005 --- END
*/
end event

event pfc_preopen;call super::pfc_preopen;
/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 28 Febuary 2006 © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

long ll_i
///////////////////////////////////////////////////////////////
// set the inital values for the tool tip service
///////////////////////////////////////////////////////////////

inv_Tooltip.of_set_window_tip(this)

end event

event resize;call super::resize;//////////////////////////////////////////////////////////////////////
// $<event>w_master::resize()
// $<arguments>
//		value	unsignedlong	sizetype 		
//		value	integer     	newwidth 		
//		value	integer     	newheight		
// $<returns> long
// $<description>
// $<description> Set w_dashboard as backgroup
//////////////////////////////////////////////////////////////////////
// $<add> 17/07/2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

If This.WindowState = Minimized! Then
	If isvalid(w_dashboard) Then
		This.BringtoTop = True
		//w_dashboard.Post of_set_backgroup() //Comment it.
	End If
End If

end event

event open;call super::open;il_org_win_bkcolor = this.backcolor //Added By Ken.Guo 2016-03-16
gnv_win_backcolor.of_ChangeWindowBackColor(this) //Add by Evan 11/25/2008
end event

