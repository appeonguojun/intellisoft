$PBExportHeader$n_cst_winsrv_statusbar.sru
$PBExportComments$Extension Statusbar service
forward
global type n_cst_winsrv_statusbar from pfc_n_cst_winsrv_statusbar
end type
end forward

global type n_cst_winsrv_statusbar from pfc_n_cst_winsrv_statusbar
end type
global n_cst_winsrv_statusbar n_cst_winsrv_statusbar

forward prototypes
public function string of_get_info (string as_id)
end prototypes

public function string of_get_info (string as_id);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_winsrv_statusbarof_get_info()
// $<arguments>
//		value	string	as_id		
// $<returns> string
// $<description>
// $<description> Get Text Info
//////////////////////////////////////////////////////////////////////
// $<add> 2010-11-23 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_info,ls_type
If isvalid(iw_statusbar) Then
	If isvalid(iw_statusbar.dw_statusbar) Then	
		If iw_statusbar.dw_statusbar.RowCount() = 1 Then
			ls_type = iw_statusbar.dw_statusbar.Describe(as_id + '.type')
			Choose Case ls_type 
				Case 'column', 'compute'
					ls_info = iw_statusbar.dw_statusbar.GetItemString(1,as_id)
				Case 'text'
					ls_info = iw_statusbar.dw_statusbar.Describe(as_id + '.text')
			End Choose
		End If
	End If
End If

Return ls_info


end function

on n_cst_winsrv_statusbar.create
call super::create
end on

on n_cst_winsrv_statusbar.destroy
call super::destroy
end on

