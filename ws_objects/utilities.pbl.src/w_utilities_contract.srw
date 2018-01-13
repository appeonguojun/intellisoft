$PBExportHeader$w_utilities_contract.srw
forward
global type w_utilities_contract from w_utilities5
end type
type cb_5 from commandbutton within w_utilities_contract
end type
type cb_weblink from commandbutton within w_utilities_contract
end type
type cb_6 from commandbutton within w_utilities_contract
end type
type cb_usertracking from commandbutton within w_utilities_contract
end type
type cb_regist from commandbutton within w_utilities_contract
end type
type cb_7 from commandbutton within w_utilities_contract
end type
type cb_ocr from commandbutton within w_utilities_contract
end type
type cb_create_ftx from commandbutton within w_utilities_contract
end type
type cb_convert from commandbutton within w_utilities_contract
end type
type cb_8 from commandbutton within w_utilities_contract
end type
type cb_email_audit from commandbutton within w_utilities_contract
end type
type cb_esign_settings from commandbutton within w_utilities_contract
end type
type cb_9 from commandbutton within w_utilities_contract
end type
type cb_copy_data_in_different_database from commandbutton within w_utilities_contract
end type
type cb_picture_painter from commandbutton within w_utilities_contract
end type
type cb_screen_picture from commandbutton within w_utilities_contract
end type
type cb_11 from commandbutton within w_utilities_contract
end type
type cb_12 from commandbutton within w_utilities_contract
end type
type cb_13 from commandbutton within w_utilities_contract
end type
type cb_batch_update_ban from commandbutton within w_utilities_contract
end type
type cb_14 from commandbutton within w_utilities_contract
end type
type cb_15 from commandbutton within w_utilities_contract
end type
type cb_16 from commandbutton within w_utilities_contract
end type
end forward

global type w_utilities_contract from w_utilities5
integer width = 2405
integer height = 1824
string title = "Contract Logix Utilities"
boolean center = false
cb_5 cb_5
cb_weblink cb_weblink
cb_6 cb_6
cb_usertracking cb_usertracking
cb_regist cb_regist
cb_7 cb_7
cb_ocr cb_ocr
cb_create_ftx cb_create_ftx
cb_convert cb_convert
cb_8 cb_8
cb_email_audit cb_email_audit
cb_esign_settings cb_esign_settings
cb_9 cb_9
cb_copy_data_in_different_database cb_copy_data_in_different_database
cb_picture_painter cb_picture_painter
cb_screen_picture cb_screen_picture
cb_11 cb_11
cb_12 cb_12
cb_13 cb_13
cb_batch_update_ban cb_batch_update_ban
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
end type
global w_utilities_contract w_utilities_contract

type variables

end variables

on w_utilities_contract.create
int iCurrent
call super::create
this.cb_5=create cb_5
this.cb_weblink=create cb_weblink
this.cb_6=create cb_6
this.cb_usertracking=create cb_usertracking
this.cb_regist=create cb_regist
this.cb_7=create cb_7
this.cb_ocr=create cb_ocr
this.cb_create_ftx=create cb_create_ftx
this.cb_convert=create cb_convert
this.cb_8=create cb_8
this.cb_email_audit=create cb_email_audit
this.cb_esign_settings=create cb_esign_settings
this.cb_9=create cb_9
this.cb_copy_data_in_different_database=create cb_copy_data_in_different_database
this.cb_picture_painter=create cb_picture_painter
this.cb_screen_picture=create cb_screen_picture
this.cb_11=create cb_11
this.cb_12=create cb_12
this.cb_13=create cb_13
this.cb_batch_update_ban=create cb_batch_update_ban
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_5
this.Control[iCurrent+2]=this.cb_weblink
this.Control[iCurrent+3]=this.cb_6
this.Control[iCurrent+4]=this.cb_usertracking
this.Control[iCurrent+5]=this.cb_regist
this.Control[iCurrent+6]=this.cb_7
this.Control[iCurrent+7]=this.cb_ocr
this.Control[iCurrent+8]=this.cb_create_ftx
this.Control[iCurrent+9]=this.cb_convert
this.Control[iCurrent+10]=this.cb_8
this.Control[iCurrent+11]=this.cb_email_audit
this.Control[iCurrent+12]=this.cb_esign_settings
this.Control[iCurrent+13]=this.cb_9
this.Control[iCurrent+14]=this.cb_copy_data_in_different_database
this.Control[iCurrent+15]=this.cb_picture_painter
this.Control[iCurrent+16]=this.cb_screen_picture
this.Control[iCurrent+17]=this.cb_11
this.Control[iCurrent+18]=this.cb_12
this.Control[iCurrent+19]=this.cb_13
this.Control[iCurrent+20]=this.cb_batch_update_ban
this.Control[iCurrent+21]=this.cb_14
this.Control[iCurrent+22]=this.cb_15
this.Control[iCurrent+23]=this.cb_16
end on

on w_utilities_contract.destroy
call super::destroy
destroy(this.cb_5)
destroy(this.cb_weblink)
destroy(this.cb_6)
destroy(this.cb_usertracking)
destroy(this.cb_regist)
destroy(this.cb_7)
destroy(this.cb_ocr)
destroy(this.cb_create_ftx)
destroy(this.cb_convert)
destroy(this.cb_8)
destroy(this.cb_email_audit)
destroy(this.cb_esign_settings)
destroy(this.cb_9)
destroy(this.cb_copy_data_in_different_database)
destroy(this.cb_picture_painter)
destroy(this.cb_screen_picture)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.cb_13)
destroy(this.cb_batch_update_ban)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
end on

event open;call super::open;String 	ls_tmp

If AppeonGetClientType() = 'PB' Then
	cb_weblink.enabled = False
End If

//Begin - Added By Mark Lee 03/04/2013 access_utility_menu
ls_tmp = gnv_data.of_getitem( "icred_settings", "access_utility_menu",FALSE)
If isnull(ls_tmp) Or trim(ls_tmp) = '' or ls_tmp = '0' Then
	cb_copy_data_in_different_database.enabled = False
Else
	cb_copy_data_in_different_database.enabled = True	
End IF 
//End - Added By Mark Lee 03/04/2013

//Added By Ken.Guo 10/09/2014
If AppeonGetClientType() = 'WEB' Then
	If Pos(Lower(gs_CacheName), 'ban7761' ) > 0 Then
		cb_batch_update_ban.enabled = True
	End If
End If
If Lower(gs_user_id) = 'master' Then
	cb_batch_update_ban.enabled = True
End If
end event

event resize;call super::resize;long ll_width,ll_y

//Added By Jay Chen 07-11-2014
If AppeonGetClientType() = 'WEB' Then
	if isvalid(w_mdi) then
		ll_width = w_mdi.dw_ezmenu.width
		ll_y =  w_mdi.dw_ezmenu.y + 650
	else
		ll_width = 0
		ll_y = this.y + 750
	end if
	this.x = ll_width + 10
	this.y = ll_y
else
	this.center = true
end if


end event

type cb_splash_set from w_utilities5`cb_splash_set within w_utilities_contract
integer taborder = 430
end type

type cb_importphoto from w_utilities5`cb_importphoto within w_utilities_contract
integer taborder = 620
end type

type cb_set_facility_app_label from w_utilities5`cb_set_facility_app_label within w_utilities_contract
integer x = 14
integer y = 1780
integer taborder = 540
end type

type cb_fixfax from w_utilities5`cb_fixfax within w_utilities_contract
integer x = 1033
integer y = 1784
integer taborder = 130
end type

type cb_npdb from w_utilities5`cb_npdb within w_utilities_contract
integer taborder = 500
end type

type cb_view_alias from w_utilities5`cb_view_alias within w_utilities_contract
integer x = 1056
integer y = 432
integer taborder = 210
end type

type cb_migrate from w_utilities5`cb_migrate within w_utilities_contract
integer x = 1161
integer y = 1744
integer taborder = 380
end type

type cb_clientsetting from w_utilities5`cb_clientsetting within w_utilities_contract
integer x = 1056
integer y = 432
integer width = 919
integer taborder = 140
end type

type cb_updae_sql from w_utilities5`cb_updae_sql within w_utilities_contract
integer x = 1056
integer y = 216
integer taborder = 190
end type

type cb_wc_setup from w_utilities5`cb_wc_setup within w_utilities_contract
integer x = 1088
integer y = 2220
integer taborder = 470
end type

type cb_crawls from w_utilities5`cb_crawls within w_utilities_contract
integer x = 55
integer y = 2464
integer taborder = 640
end type

type cb_dba from w_utilities5`cb_dba within w_utilities_contract
integer x = 3013
integer y = 3528
integer taborder = 260
end type

type cb_sec_paint from w_utilities5`cb_sec_paint within w_utilities_contract
integer x = 55
integer y = 324
integer taborder = 220
end type

type cb_nonprac from w_utilities5`cb_nonprac within w_utilities_contract
integer x = 1093
integer y = 2544
integer taborder = 420
end type

type cb_caqh_codes from w_utilities5`cb_caqh_codes within w_utilities_contract
integer x = 1111
integer y = 3024
integer taborder = 440
end type

type cb_caqh_fields from w_utilities5`cb_caqh_fields within w_utilities_contract
integer x = 1111
integer y = 2920
integer taborder = 450
end type

type cb_screen_view from w_utilities5`cb_screen_view within w_utilities_contract
integer x = 1088
integer y = 2392
integer taborder = 390
end type

type cb_paths from w_utilities5`cb_paths within w_utilities_contract
integer x = 3013
integer y = 3420
integer taborder = 230
end type

type cb_4 from w_utilities5`cb_4 within w_utilities_contract
integer x = 1106
integer y = 2812
integer taborder = 240
end type

type cb_index from w_utilities5`cb_index within w_utilities_contract
integer x = 1106
integer y = 2704
integer taborder = 110
end type

type cb_date_fields from w_utilities5`cb_date_fields within w_utilities_contract
integer x = 2066
integer y = 3088
integer taborder = 460
end type

type cb_appt_painter from w_utilities5`cb_appt_painter within w_utilities_contract
integer x = 1102
integer y = 2464
integer taborder = 400
end type

type cb_clear_quotes from w_utilities5`cb_clear_quotes within w_utilities_contract
integer x = 2071
integer y = 3196
integer taborder = 170
end type

type cb_prem_utl from w_utilities5`cb_prem_utl within w_utilities_contract
integer x = 41
integer y = 2732
integer taborder = 120
end type

type cb_priv_rpt from w_utilities5`cb_priv_rpt within w_utilities_contract
integer x = 1106
integer y = 3276
end type

type cb_selects from w_utilities5`cb_selects within w_utilities_contract
integer x = 55
integer y = 108
integer taborder = 370
end type

type cb_check_ids from w_utilities5`cb_check_ids within w_utilities_contract
integer x = 1056
integer y = 108
integer taborder = 180
end type

type cb_exp_not_comp from w_utilities5`cb_exp_not_comp within w_utilities_contract
integer x = 3013
integer y = 3308
integer taborder = 250
end type

type cb_registry from w_utilities5`cb_registry within w_utilities_contract
integer x = 1083
integer y = 2304
integer taborder = 350
end type

type cb_user_reset from w_utilities5`cb_user_reset within w_utilities_contract
integer x = 55
integer y = 216
integer taborder = 360
end type

type cb_bd_exp from w_utilities5`cb_bd_exp within w_utilities_contract
integer x = 2071
integer y = 2980
integer taborder = 340
end type

type cb_comp_info from w_utilities5`cb_comp_info within w_utilities_contract
integer x = 2071
integer y = 2872
integer taborder = 330
end type

type cb_requested from w_utilities5`cb_requested within w_utilities_contract
integer x = 3013
integer y = 3196
integer taborder = 160
end type

type cb_field_ord_chk from w_utilities5`cb_field_ord_chk within w_utilities_contract
integer x = 3013
integer y = 3088
integer taborder = 150
end type

type cb_iapp_fix from w_utilities5`cb_iapp_fix within w_utilities_contract
integer x = 3013
integer y = 2980
integer taborder = 100
end type

type cb_multi_affil_check from w_utilities5`cb_multi_affil_check within w_utilities_contract
integer x = 3017
integer y = 2872
end type

type cb_dapplications from w_utilities5`cb_dapplications within w_utilities_contract
integer x = 55
integer y = 2356
integer taborder = 490
end type

type cb_dmanual from w_utilities5`cb_dmanual within w_utilities_contract
integer x = 55
integer y = 2252
integer taborder = 480
end type

type cb_print_reset from w_utilities5`cb_print_reset within w_utilities_contract
integer x = 2071
integer y = 2332
integer taborder = 280
end type

type cb_assignedusers from w_utilities5`cb_assignedusers within w_utilities_contract
integer x = 2071
integer y = 2548
integer taborder = 300
end type

type cb_oig from w_utilities5`cb_oig within w_utilities_contract
integer x = 2071
integer y = 2440
integer taborder = 290
end type

type st_2 from w_utilities5`st_2 within w_utilities_contract
end type

type cb_user_security from w_utilities5`cb_user_security within w_utilities_contract
integer x = 78
integer y = 2616
end type

type cb_docids from w_utilities5`cb_docids within w_utilities_contract
integer x = 3013
integer y = 2656
end type

type cb_stat_check from w_utilities5`cb_stat_check within w_utilities_contract
integer x = 3013
integer y = 2548
end type

type cb_support_settings from w_utilities5`cb_support_settings within w_utilities_contract
integer x = 2057
integer y = 252
integer taborder = 650
end type

type cb_priv_adj from w_utilities5`cb_priv_adj within w_utilities_contract
integer x = 3013
integer y = 2440
end type

type cb_comm_review_fix from w_utilities5`cb_comm_review_fix within w_utilities_contract
integer x = 2071
integer y = 2656
integer taborder = 310
end type

type cb_links from w_utilities5`cb_links within w_utilities_contract
integer x = 3013
integer y = 2332
end type

type cb_10 from w_utilities5`cb_10 within w_utilities_contract
integer x = 2071
integer y = 2224
integer taborder = 270
end type

type cb_fix from w_utilities5`cb_fix within w_utilities_contract
integer x = 3013
integer y = 2224
end type

type dw_3 from w_utilities5`dw_3 within w_utilities_contract
integer taborder = 520
end type

type cb_3 from w_utilities5`cb_3 within w_utilities_contract
integer x = 2057
integer y = 52
end type

type cb_2 from w_utilities5`cb_2 within w_utilities_contract
integer x = 2071
integer y = 2764
integer taborder = 320
end type

type cb_1 from w_utilities5`cb_1 within w_utilities_contract
integer x = 2057
integer y = 152
integer taborder = 680
end type

type dw_facilcomm from w_utilities5`dw_facilcomm within w_utilities_contract
integer taborder = 690
end type

type dw_praccomm from w_utilities5`dw_praccomm within w_utilities_contract
integer taborder = 670
end type

type dw_pracaffil from w_utilities5`dw_pracaffil within w_utilities_contract
integer taborder = 660
end type

type gb_adm from w_utilities5`gb_adm within w_utilities_contract
integer y = 44
integer height = 1676
end type

type gb_2 from w_utilities5`gb_2 within w_utilities_contract
integer x = 27
integer y = 2188
end type

type dw_dvfieldcopy from w_utilities5`dw_dvfieldcopy within w_utilities_contract
integer taborder = 580
end type

type dw_data_view_list from w_utilities5`dw_data_view_list within w_utilities_contract
integer taborder = 510
end type

type gb_3 from w_utilities5`gb_3 within w_utilities_contract
integer x = 1070
integer y = 2116
integer height = 92
end type

type gb_4 from w_utilities5`gb_4 within w_utilities_contract
integer x = 1024
integer y = 44
integer width = 987
integer height = 1676
end type

type cb_settings from w_utilities5`cb_settings within w_utilities_contract
integer x = 55
integer y = 432
integer width = 919
integer taborder = 410
end type

type cb_5 from commandbutton within w_utilities_contract
integer x = 55
integer y = 540
integer width = 919
integer height = 88
integer taborder = 530
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Splash Screen Picture Settings"
end type

event clicked;open(w_splah_screen_set)
end event

type cb_weblink from commandbutton within w_utilities_contract
integer x = 1056
integer y = 540
integer width = 919
integer height = 88
integer taborder = 550
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Web Link Settings"
end type

event clicked;Open(w_weblink_settings)
end event

type cb_6 from commandbutton within w_utilities_contract
integer x = 1056
integer y = 756
integer width = 919
integer height = 88
integer taborder = 560
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reports Data Filter Settings"
end type

event clicked;Open(w_reports_access_settings)
end event

type cb_usertracking from commandbutton within w_utilities_contract
integer x = 55
integer y = 648
integer width = 919
integer height = 88
integer taborder = 570
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "User Tracking"
end type

event clicked;open(w_user_tracking)
end event

type cb_regist from commandbutton within w_utilities_contract
integer x = 55
integer y = 756
integer width = 919
integer height = 88
integer taborder = 590
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Manually Register OCX"
end type

event clicked;Open(w_register_ocx)

end event

type cb_7 from commandbutton within w_utilities_contract
integer x = 1056
integer y = 864
integer width = 919
integer height = 88
integer taborder = 600
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Merge Contract Category"
end type

event clicked;Open(w_merge_ctx_category)
end event

type cb_ocr from commandbutton within w_utilities_contract
integer x = 55
integer y = 864
integer width = 919
integer height = 88
integer taborder = 610
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OCR All Image Document"
end type

event clicked;open(w_ocr_all_document)
end event

type cb_create_ftx from commandbutton within w_utilities_contract
integer x = 1056
integer y = 324
integer width = 919
integer height = 88
integer taborder = 630
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create Full-Text Catalog"
end type

event clicked;IF Not Isvalid(gnv_logservice) THEN gnv_logservice = Create n_logservice

n_cst_update_sql lnv_sql
lnv_sql = Create n_cst_update_sql

//Modified By Ken.Guo 2010-12-09
//lnv_sql.of_ver70_release_createfulltext1( )
//lnv_sql.of_ver85_release_dropfulltext1( )
//lnv_sql.of_ver85_release_createfulltext1( )
//lnv_sql.of_ver95_release_dropfulltext1( )	//jervis 10.21.2009
//lnv_sql.of_ver95_release_createfulltext1( )	//jervis 10.21.2009
//lnv_sql.of_ver100_release_dropfulltext1( )	//Added By Ken.Guo 2010-05-13.
//lnv_sql.of_ver100_release_createfulltext1( )	//Added By Ken.Guo 2010-05-13.
lnv_sql.of_release_fulltext( )

Destroy lnv_sql
destroy gnv_logservice
end event

type cb_convert from commandbutton within w_utilities_contract
integer x = 55
integer y = 972
integer width = 919
integer height = 88
integer taborder = 620
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch Convert Image Document to PDF"
end type

event clicked;open(w_convert_tif2pdf)
end event

type cb_8 from commandbutton within w_utilities_contract
integer x = 1056
integer y = 972
integer width = 919
integer height = 88
integer taborder = 630
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Contract Screen Upgrade"
end type

event clicked;//Added By Ken.Guo 2010-03-09. Force Update Screen
n_cst_update_screen lnvo_screen

If Messagebox('Upgrade','Do you want to upgrade the Contract Screens?',Question!, yesno!) = 2 Then Return

lnvo_screen = Create n_cst_update_screen
lnvo_screen.of_appeon2_changes(True)
If IsValid(w_infodisp) Then Close(w_infodisp)
Destroy lnvo_screen
end event

type cb_email_audit from commandbutton within w_utilities_contract
integer x = 1056
integer y = 1080
integer width = 919
integer height = 88
integer taborder = 620
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sent Emails Log"
end type

event clicked;Open(w_email_audit)
Return 1

//If Isvalid(w_email_audit) Then
//	w_email_audit.BringtoTop = True
//	w_email_audit.WindowState = Normal!
//Else
//	//OpenSheet(w_email_audit, w_mdi, 4, original!) 
//	Open(w_email_audit)
//End If
//Close(Parent)
end event

type cb_esign_settings from commandbutton within w_utilities_contract
integer x = 1056
integer y = 648
integer width = 919
integer height = 88
integer taborder = 540
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Electronic Signature Settings"
end type

event clicked;//if gs_esigntype <> 'docusign' then //Modified By Jay Chen 04-09-2014
//	Open(w_esign_settings)
//else
//	Open(w_esign_settings_docusign)
//end if

//Modified By Jay Chen 02-06-2016
if gs_esigntype = 'docusign' then
	Open(w_esign_settings_docusign)
elseif gs_esigntype = 'echosign' then
	if gs_echosign_method = 'http' then
		Open(w_esign_settings_echosign)
	else
		Open(w_esign_settings)
	end if
else
	Open(w_esign_settings)
end if
end event

type cb_9 from commandbutton within w_utilities_contract
integer x = 55
integer y = 1080
integer width = 919
integer height = 88
integer taborder = 630
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch Update Create Action Item"
end type

event clicked;Open(w_batch_update_alarm_create_ai)
Return 1

end event

type cb_copy_data_in_different_database from commandbutton within w_utilities_contract
integer x = 1056
integer y = 1188
integer width = 919
integer height = 88
integer taborder = 630
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Data in Different Database "
end type

event clicked;//Added By Mark Lee 02/20/2013 Copy Data in Different Database 
m_copy_data_in_different_database lm_copy_data

lm_copy_data = Create m_copy_data_in_different_database
 
lm_copy_data.PopMenu(Parent.PointerX(),Parent.PointerY())

Destroy lm_copy_data
end event

type cb_picture_painter from commandbutton within w_utilities_contract
integer x = 55
integer y = 1188
integer width = 919
integer height = 88
integer taborder = 640
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Picture Painter"
end type

event clicked;Open(w_picture_painter)
end event

type cb_screen_picture from commandbutton within w_utilities_contract
integer x = 55
integer y = 1296
integer width = 919
integer height = 88
integer taborder = 700
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Repair Screen Picture Issue"
end type

event clicked;open( w_repair_screen_picture )
end event

type cb_11 from commandbutton within w_utilities_contract
integer x = 1056
integer y = 1296
integer width = 919
integer height = 88
integer taborder = 710
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set Check For Duplicate Contract"
end type

event clicked;open( w_doublecontract_setting )
end event

type cb_12 from commandbutton within w_utilities_contract
integer x = 1056
integer y = 1404
integer width = 919
integer height = 88
integer taborder = 720
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Application Runtime Log"
end type

event clicked;Open(w_apprun_audit)
Return 1
end event

type cb_13 from commandbutton within w_utilities_contract
integer x = 55
integer y = 1404
integer width = 919
integer height = 88
integer taborder = 730
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Check Empty Documents"
end type

event clicked;Open(w_empty_documents)
Return 1
end event

type cb_batch_update_ban from commandbutton within w_utilities_contract
integer x = 55
integer y = 1512
integer width = 919
integer height = 88
integer taborder = 750
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Batch Update Data"
end type

event clicked;Open(w_batch_update_for_ban)
Return 1
end event

type cb_14 from commandbutton within w_utilities_contract
integer x = 1056
integer y = 1512
integer width = 919
integer height = 88
integer taborder = 760
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Salesforce User Setting"
end type

event clicked;Open(w_salesforcelogin_setting)
Return 1
end event

type cb_15 from commandbutton within w_utilities_contract
integer x = 55
integer y = 1616
integer width = 919
integer height = 88
integer taborder = 760
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clause Email Notification Settings"
end type

event clicked;Open(w_clause_email_setting) //Added By Jay Chen 08-31-2015
Return 1
end event

type cb_16 from commandbutton within w_utilities_contract
integer x = 1056
integer y = 1616
integer width = 919
integer height = 88
integer taborder = 770
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Fix Multi-Select Dropdown List"
end type

event clicked;open(w_update_multi_data) //Added by Harry 2017-04-24 for task744
end event

