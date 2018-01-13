$PBExportHeader$w_prac_data_intelliapp.srw
forward
global type w_prac_data_intelliapp from w_prac_data_1
end type
end forward

global type w_prac_data_intelliapp from w_prac_data_1
end type
global w_prac_data_intelliapp w_prac_data_intelliapp

on w_prac_data_intelliapp.create
int iCurrent
call super::create
end on

on w_prac_data_intelliapp.destroy
call super::destroy
end on

type uo_app_stat from w_prac_data_1`uo_app_stat within w_prac_data_intelliapp
boolean visible = false
integer x = 1783
integer y = 1740
integer width = 1125
integer height = 80
long backcolor = 81324524
end type

type tab_1 from w_prac_data_1`tab_1 within w_prac_data_intelliapp
integer x = 23
integer y = 8
integer width = 3579
long backcolor = 81324524
end type

type tabpage_search from w_prac_data_1`tabpage_search within tab_1
integer width = 3543
end type

type uo_search from w_prac_data_1`uo_search within tabpage_search
end type

type tabpage_detail from w_prac_data_1`tabpage_detail within tab_1
integer width = 3543
long backcolor = 81324524
string text = "Credentialing Data"
long tabbackcolor = 81324524
end type

type oval_2 from w_prac_data_1`oval_2 within tabpage_detail
end type

type uo_data_entry from w_prac_data_1`uo_data_entry within tabpage_detail
end type

type p_face from w_prac_data_1`p_face within tabpage_detail
end type

type tabpage_app_audit from w_prac_data_1`tabpage_app_audit within tab_1
integer width = 3543
long backcolor = 81324524
string text = "Required Elements"
long tabbackcolor = 81324524
end type

type uo_app_audit from w_prac_data_1`uo_app_audit within tabpage_app_audit
end type

type tabpage_apptmnt_status from w_prac_data_1`tabpage_apptmnt_status within tab_1
boolean visible = false
integer width = 3543
long backcolor = 81324524
string text = "Affiliations"
long tabbackcolor = 81324524
end type

type uo_affill_status from w_prac_data_1`uo_affill_status within tabpage_apptmnt_status
integer y = 44
end type

type tabpage_verif from w_prac_data_1`tabpage_verif within tab_1
boolean visible = false
integer width = 3543
long backcolor = 80269524
string text = "Expiring"
long tabbackcolor = 80269524
end type

type uo_verif_summary from w_prac_data_1`uo_verif_summary within tabpage_verif
integer y = 32
end type

type tabpage_profile from w_prac_data_1`tabpage_profile within tab_1
integer width = 3543
long backcolor = 80269524
string text = "Provider Profile "
long tabbackcolor = 80269524
end type

type uo_profile from w_prac_data_1`uo_profile within tabpage_profile
end type

type tabpage_image from w_prac_data_1`tabpage_image within tab_1
integer width = 3543
long backcolor = 81324524
string text = "Scanned Documents"
long tabbackcolor = 81324524
end type

type uo_image from w_prac_data_1`uo_image within tabpage_image
end type

type tabpage_privileges from w_prac_data_1`tabpage_privileges within tab_1
boolean visible = false
integer width = 3543
long backcolor = 81324524
long tabbackcolor = 81324524
end type

type uo_priv from w_prac_data_1`uo_priv within tabpage_privileges
integer y = 24
end type

type tabpage_net from w_prac_data_1`tabpage_net within tab_1
integer width = 3543
long backcolor = 81324524
string text = "Application Status"
long tabbackcolor = 81324524
string picturename = "PasteStatement!"
end type

type uo_net from w_prac_data_1`uo_net within tabpage_net
end type

type tabpage_meetings from w_prac_data_1`tabpage_meetings within tab_1
integer width = 3543
end type

type uo_meetings from w_prac_data_1`uo_meetings within tabpage_meetings
end type

type cb_1 from w_prac_data_1`cb_1 within w_prac_data_intelliapp
end type

