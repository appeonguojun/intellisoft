$PBExportHeader$w_popup.srw
$PBExportComments$Extension Popup Window class
forward
global type w_popup from pfc_w_popup
end type
end forward

global type w_popup from pfc_w_popup
event ue_syscommand pbm_syscommand
end type
global w_popup w_popup

type variables
Boolean ib_autohide = True //Added By Ken.Guo 2010-12-30.
end variables

forward prototypes
public subroutine of_set_autohide (boolean ab_value)
end prototypes

event ue_syscommand;//====================================================================
// Event: ue_syscommand
//--------------------------------------------------------------------
// Description: To workaround APB 6.8 bug. The popup window cannot be closed when user click the 'x' button in the window's titlebar.
//--------------------------------------------------------------------
// Arguments:
//                commandtype
//                xpos
//                ypos
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 2017-08-01
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If message.wordparm = 61536 Then
	Close(This)
End If

end event

public subroutine of_set_autohide (boolean ab_value);ib_autohide = ab_value
end subroutine

on w_popup.create
call super::create
end on

on w_popup.destroy
call super::destroy
end on

event timer;call super::timer;Long ll_handle,ll_IsMin
Boolean lb_isactived 
n_cst_platformwin32 lnv_platformwin32

If AppeonGetClientType() = "WEB" Then
	If Not ib_autohide Then Return
	ll_handle = appeongetiehandle()
	If ll_handle <= 0 Then Return
	
	ll_IsMin = IsIconic(ll_Handle)
	
   //Begin - Modified By Ken.Guo 2011-02-22
	/*
	Choose Case ll_ismin 
		Case 0 //
			If Not This.Visible Then This.Visible = True
		Case 1 //Minimized!
			If This.Visible Then This.Visible = False
	End Choose
	*/
	lnv_platformwin32 = Create n_cst_platformwin32
	lb_isactived = lnv_platformwin32.of_iscurrentietab( )
	Destroy lnv_platformwin32

	If ll_ismin = 0 and lb_isactived Then
		If Not This.Visible Then This.Visible = True
	Else
		If This.Visible Then This.Visible = False
	End If
	//End - Modified By Ken.Guo 2011-02-22
	
End If

end event

event pfc_postopen;call super::pfc_postopen;Timer(1)
end event

event pfc_preopen;call super::pfc_preopen;//Added By Ken.Guo 03/22/2012. To Workaround some bug.
If gnv_data.of_GetItem( 'icred_settings', 'hide_inactive_window', False) = '0' or IsNull(gnv_data.of_GetItem( 'icred_settings', 'hide_inactive_window', False)) Then
	ib_autohide = False
End If
end event

event open;call super::open;//Added By Ken.Guo 07/12/2012. to workaround APB bug. when refresh IE, the popup window do not close.
gw_popup[UpperBound(gw_popup[]) + 1] = This
end event

