$PBExportHeader$w_utilities5.srw
forward
global type w_utilities5 from window
end type
type cb_splash_set from commandbutton within w_utilities5
end type
type cb_importphoto from commandbutton within w_utilities5
end type
type cb_set_facility_app_label from commandbutton within w_utilities5
end type
type cb_fixfax from commandbutton within w_utilities5
end type
type cb_npdb from commandbutton within w_utilities5
end type
type cb_view_alias from commandbutton within w_utilities5
end type
type cb_migrate from commandbutton within w_utilities5
end type
type cb_clientsetting from commandbutton within w_utilities5
end type
type cb_updae_sql from commandbutton within w_utilities5
end type
type cb_wc_setup from commandbutton within w_utilities5
end type
type cb_crawls from commandbutton within w_utilities5
end type
type cb_dba from commandbutton within w_utilities5
end type
type cb_sec_paint from commandbutton within w_utilities5
end type
type cb_nonprac from commandbutton within w_utilities5
end type
type cb_caqh_codes from commandbutton within w_utilities5
end type
type cb_caqh_fields from commandbutton within w_utilities5
end type
type cb_screen_view from commandbutton within w_utilities5
end type
type cb_paths from commandbutton within w_utilities5
end type
type cb_4 from commandbutton within w_utilities5
end type
type cb_index from commandbutton within w_utilities5
end type
type cb_date_fields from commandbutton within w_utilities5
end type
type cb_appt_painter from commandbutton within w_utilities5
end type
type cb_clear_quotes from commandbutton within w_utilities5
end type
type cb_prem_utl from commandbutton within w_utilities5
end type
type cb_priv_rpt from commandbutton within w_utilities5
end type
type cb_selects from commandbutton within w_utilities5
end type
type cb_check_ids from commandbutton within w_utilities5
end type
type cb_exp_not_comp from commandbutton within w_utilities5
end type
type cb_registry from commandbutton within w_utilities5
end type
type cb_user_reset from commandbutton within w_utilities5
end type
type cb_bd_exp from commandbutton within w_utilities5
end type
type cb_comp_info from commandbutton within w_utilities5
end type
type cb_requested from commandbutton within w_utilities5
end type
type cb_field_ord_chk from commandbutton within w_utilities5
end type
type cb_iapp_fix from commandbutton within w_utilities5
end type
type cb_multi_affil_check from commandbutton within w_utilities5
end type
type cb_dapplications from commandbutton within w_utilities5
end type
type cb_dmanual from commandbutton within w_utilities5
end type
type cb_print_reset from commandbutton within w_utilities5
end type
type cb_assignedusers from commandbutton within w_utilities5
end type
type cb_oig from commandbutton within w_utilities5
end type
type st_2 from statictext within w_utilities5
end type
type cb_user_security from commandbutton within w_utilities5
end type
type cb_docids from commandbutton within w_utilities5
end type
type cb_stat_check from commandbutton within w_utilities5
end type
type cb_support_settings from commandbutton within w_utilities5
end type
type cb_priv_adj from commandbutton within w_utilities5
end type
type cb_comm_review_fix from commandbutton within w_utilities5
end type
type cb_links from commandbutton within w_utilities5
end type
type cb_10 from commandbutton within w_utilities5
end type
type cb_fix from commandbutton within w_utilities5
end type
type dw_3 from datawindow within w_utilities5
end type
type cb_3 from commandbutton within w_utilities5
end type
type cb_2 from commandbutton within w_utilities5
end type
type cb_1 from commandbutton within w_utilities5
end type
type dw_facilcomm from datawindow within w_utilities5
end type
type dw_praccomm from datawindow within w_utilities5
end type
type dw_pracaffil from datawindow within w_utilities5
end type
type gb_adm from groupbox within w_utilities5
end type
type gb_2 from groupbox within w_utilities5
end type
type dw_dvfieldcopy from datawindow within w_utilities5
end type
type dw_data_view_list from datawindow within w_utilities5
end type
type gb_3 from groupbox within w_utilities5
end type
type gb_4 from groupbox within w_utilities5
end type
type cb_settings from commandbutton within w_utilities5
end type
end forward

global type w_utilities5 from window
integer x = 59
integer y = 48
integer width = 3374
integer height = 2232
boolean titlebar = true
string title = "IntelliCred/App Utilities"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 80269524
boolean center = true
event ue_syscommand pbm_syscommand
cb_splash_set cb_splash_set
cb_importphoto cb_importphoto
cb_set_facility_app_label cb_set_facility_app_label
cb_fixfax cb_fixfax
cb_npdb cb_npdb
cb_view_alias cb_view_alias
cb_migrate cb_migrate
cb_clientsetting cb_clientsetting
cb_updae_sql cb_updae_sql
cb_wc_setup cb_wc_setup
cb_crawls cb_crawls
cb_dba cb_dba
cb_sec_paint cb_sec_paint
cb_nonprac cb_nonprac
cb_caqh_codes cb_caqh_codes
cb_caqh_fields cb_caqh_fields
cb_screen_view cb_screen_view
cb_paths cb_paths
cb_4 cb_4
cb_index cb_index
cb_date_fields cb_date_fields
cb_appt_painter cb_appt_painter
cb_clear_quotes cb_clear_quotes
cb_prem_utl cb_prem_utl
cb_priv_rpt cb_priv_rpt
cb_selects cb_selects
cb_check_ids cb_check_ids
cb_exp_not_comp cb_exp_not_comp
cb_registry cb_registry
cb_user_reset cb_user_reset
cb_bd_exp cb_bd_exp
cb_comp_info cb_comp_info
cb_requested cb_requested
cb_field_ord_chk cb_field_ord_chk
cb_iapp_fix cb_iapp_fix
cb_multi_affil_check cb_multi_affil_check
cb_dapplications cb_dapplications
cb_dmanual cb_dmanual
cb_print_reset cb_print_reset
cb_assignedusers cb_assignedusers
cb_oig cb_oig
st_2 st_2
cb_user_security cb_user_security
cb_docids cb_docids
cb_stat_check cb_stat_check
cb_support_settings cb_support_settings
cb_priv_adj cb_priv_adj
cb_comm_review_fix cb_comm_review_fix
cb_links cb_links
cb_10 cb_10
cb_fix cb_fix
dw_3 dw_3
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_facilcomm dw_facilcomm
dw_praccomm dw_praccomm
dw_pracaffil dw_pracaffil
gb_adm gb_adm
gb_2 gb_2
dw_dvfieldcopy dw_dvfieldcopy
dw_data_view_list dw_data_view_list
gb_3 gb_3
gb_4 gb_4
cb_settings cb_settings
end type
global w_utilities5 w_utilities5

forward prototypes
public function integer of_password (string ai_window)
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

public function integer of_password (string ai_window);//string ls_pass
//
////ls_pass = string(ai_window)
////messagebox("window",ls_pass)
//
//ls_pass = sle_pass.text
//
//if len(ls_pass) < 1 then
//	messagebox("Enter Password","You need to enter the correct support password to use this utility.")
//	return -1
//end if
//
//if ai_window = "w_sql_send" then
//	if upper(ls_pass) <> "INTELLISQL" then
//		messagebox("Incorrect Password","You must enter the correct support password for the SQL utility.")
//		return -1
//	end if
//elseif upper(ls_pass) <> "INTELLISET" then
//	messagebox("Incorrect Password","You must enter the correct support password to use this utility.")
//	return -1
//end if
//
return 1
end function

on w_utilities5.create
this.cb_splash_set=create cb_splash_set
this.cb_importphoto=create cb_importphoto
this.cb_set_facility_app_label=create cb_set_facility_app_label
this.cb_fixfax=create cb_fixfax
this.cb_npdb=create cb_npdb
this.cb_view_alias=create cb_view_alias
this.cb_migrate=create cb_migrate
this.cb_clientsetting=create cb_clientsetting
this.cb_updae_sql=create cb_updae_sql
this.cb_wc_setup=create cb_wc_setup
this.cb_crawls=create cb_crawls
this.cb_dba=create cb_dba
this.cb_sec_paint=create cb_sec_paint
this.cb_nonprac=create cb_nonprac
this.cb_caqh_codes=create cb_caqh_codes
this.cb_caqh_fields=create cb_caqh_fields
this.cb_screen_view=create cb_screen_view
this.cb_paths=create cb_paths
this.cb_4=create cb_4
this.cb_index=create cb_index
this.cb_date_fields=create cb_date_fields
this.cb_appt_painter=create cb_appt_painter
this.cb_clear_quotes=create cb_clear_quotes
this.cb_prem_utl=create cb_prem_utl
this.cb_priv_rpt=create cb_priv_rpt
this.cb_selects=create cb_selects
this.cb_check_ids=create cb_check_ids
this.cb_exp_not_comp=create cb_exp_not_comp
this.cb_registry=create cb_registry
this.cb_user_reset=create cb_user_reset
this.cb_bd_exp=create cb_bd_exp
this.cb_comp_info=create cb_comp_info
this.cb_requested=create cb_requested
this.cb_field_ord_chk=create cb_field_ord_chk
this.cb_iapp_fix=create cb_iapp_fix
this.cb_multi_affil_check=create cb_multi_affil_check
this.cb_dapplications=create cb_dapplications
this.cb_dmanual=create cb_dmanual
this.cb_print_reset=create cb_print_reset
this.cb_assignedusers=create cb_assignedusers
this.cb_oig=create cb_oig
this.st_2=create st_2
this.cb_user_security=create cb_user_security
this.cb_docids=create cb_docids
this.cb_stat_check=create cb_stat_check
this.cb_support_settings=create cb_support_settings
this.cb_priv_adj=create cb_priv_adj
this.cb_comm_review_fix=create cb_comm_review_fix
this.cb_links=create cb_links
this.cb_10=create cb_10
this.cb_fix=create cb_fix
this.dw_3=create dw_3
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_facilcomm=create dw_facilcomm
this.dw_praccomm=create dw_praccomm
this.dw_pracaffil=create dw_pracaffil
this.gb_adm=create gb_adm
this.gb_2=create gb_2
this.dw_dvfieldcopy=create dw_dvfieldcopy
this.dw_data_view_list=create dw_data_view_list
this.gb_3=create gb_3
this.gb_4=create gb_4
this.cb_settings=create cb_settings
this.Control[]={this.cb_splash_set,&
this.cb_importphoto,&
this.cb_set_facility_app_label,&
this.cb_fixfax,&
this.cb_npdb,&
this.cb_view_alias,&
this.cb_migrate,&
this.cb_clientsetting,&
this.cb_updae_sql,&
this.cb_wc_setup,&
this.cb_crawls,&
this.cb_dba,&
this.cb_sec_paint,&
this.cb_nonprac,&
this.cb_caqh_codes,&
this.cb_caqh_fields,&
this.cb_screen_view,&
this.cb_paths,&
this.cb_4,&
this.cb_index,&
this.cb_date_fields,&
this.cb_appt_painter,&
this.cb_clear_quotes,&
this.cb_prem_utl,&
this.cb_priv_rpt,&
this.cb_selects,&
this.cb_check_ids,&
this.cb_exp_not_comp,&
this.cb_registry,&
this.cb_user_reset,&
this.cb_bd_exp,&
this.cb_comp_info,&
this.cb_requested,&
this.cb_field_ord_chk,&
this.cb_iapp_fix,&
this.cb_multi_affil_check,&
this.cb_dapplications,&
this.cb_dmanual,&
this.cb_print_reset,&
this.cb_assignedusers,&
this.cb_oig,&
this.st_2,&
this.cb_user_security,&
this.cb_docids,&
this.cb_stat_check,&
this.cb_support_settings,&
this.cb_priv_adj,&
this.cb_comm_review_fix,&
this.cb_links,&
this.cb_10,&
this.cb_fix,&
this.dw_3,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_facilcomm,&
this.dw_praccomm,&
this.dw_pracaffil,&
this.gb_adm,&
this.gb_2,&
this.dw_dvfieldcopy,&
this.dw_data_view_list,&
this.gb_3,&
this.gb_4,&
this.cb_settings}
end on

on w_utilities5.destroy
destroy(this.cb_splash_set)
destroy(this.cb_importphoto)
destroy(this.cb_set_facility_app_label)
destroy(this.cb_fixfax)
destroy(this.cb_npdb)
destroy(this.cb_view_alias)
destroy(this.cb_migrate)
destroy(this.cb_clientsetting)
destroy(this.cb_updae_sql)
destroy(this.cb_wc_setup)
destroy(this.cb_crawls)
destroy(this.cb_dba)
destroy(this.cb_sec_paint)
destroy(this.cb_nonprac)
destroy(this.cb_caqh_codes)
destroy(this.cb_caqh_fields)
destroy(this.cb_screen_view)
destroy(this.cb_paths)
destroy(this.cb_4)
destroy(this.cb_index)
destroy(this.cb_date_fields)
destroy(this.cb_appt_painter)
destroy(this.cb_clear_quotes)
destroy(this.cb_prem_utl)
destroy(this.cb_priv_rpt)
destroy(this.cb_selects)
destroy(this.cb_check_ids)
destroy(this.cb_exp_not_comp)
destroy(this.cb_registry)
destroy(this.cb_user_reset)
destroy(this.cb_bd_exp)
destroy(this.cb_comp_info)
destroy(this.cb_requested)
destroy(this.cb_field_ord_chk)
destroy(this.cb_iapp_fix)
destroy(this.cb_multi_affil_check)
destroy(this.cb_dapplications)
destroy(this.cb_dmanual)
destroy(this.cb_print_reset)
destroy(this.cb_assignedusers)
destroy(this.cb_oig)
destroy(this.st_2)
destroy(this.cb_user_security)
destroy(this.cb_docids)
destroy(this.cb_stat_check)
destroy(this.cb_support_settings)
destroy(this.cb_priv_adj)
destroy(this.cb_comm_review_fix)
destroy(this.cb_links)
destroy(this.cb_10)
destroy(this.cb_fix)
destroy(this.dw_3)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_facilcomm)
destroy(this.dw_praccomm)
destroy(this.dw_pracaffil)
destroy(this.gb_adm)
destroy(this.gb_2)
destroy(this.dw_dvfieldcopy)
destroy(this.dw_data_view_list)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.cb_settings)
end on

event open;gw_popup[UpperBound(gw_popup[]) + 1] = This

if w_mdi.of_security_access( 1345 ) = 0   then ////Start Code Change ----01.02.2008 #V8 maha changed from 1380
	cb_settings.enabled = false
	cb_user_reset.enabled = false
	cb_registry.enabled = false
	cb_selects.enabled = false
	cb_screen_view.enabled = false
	cb_nonprac.enabled = false
	cb_sec_paint.enabled = false
	cb_wc_setup.enabled = false
	cb_migrate.enabled = false
end if

if gi_iapp_on = 0  then
	cb_dapplications.enabled = false
end if

//Start Code Change ---- 10.03.2006 #651 maha
if of_get_app_setting("set_19", "I") = 1 then
	cb_prem_utl.visible = true
end if
//End Code Change---10.03.2006

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;////disCONNECT USING SQLCA;
end event

type cb_splash_set from commandbutton within w_utilities5
integer x = 41
integer y = 1960
integer width = 923
integer height = 88
integer taborder = 400
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Splash Screen Picture Settings"
end type

event clicked;	open(w_splah_screen_set)






end event

type cb_importphoto from commandbutton within w_utilities5
integer x = 2043
integer y = 1848
integer width = 919
integer height = 88
integer taborder = 500
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Import Photos"
end type

event clicked;//------------------------------------------------------------------------------
// Description: Upload picture to database
// Arguments:
//		None
// Return Value: 
//		None
//------------------------------------------------------------------------------
// Author:	Scofield		Date: 2008-07-10
//------------------------------------------------------------------------------
// Revision History: 
//				1.0   Initial version
//==============================================================================

long		ll_Cycle,ll_Cnts,ll_Prefix,ll_ExistInBasic,ll_ExistInPhoto,ll_FileNo,ll_ReadCnts,ll_Rtn
String	ls_PicPath,ls_PicName,ls_AllPic[],ls_Prefix,ls_Postfix
BLOB		lblb_ImageData,lblb_Buffer

CONSTANT STRING SEPCHAR = "*"

n_cst_filesrvwin32 inv_filesrv
n_cst_dirattrib	 inv_DirAttribBMP[],inv_DirAttribJPG[],inv_DirAttribGIF[]

ls_PicPath = TRIM(gnv_data.of_getitem("ids","picture_path",false))
if Right(ls_PicPath,1) <> "\" then ls_PicPath += "\"

ll_Rtn = MessageBox(gnv_app.iapp_object.DisplayName,"This utility is to upload the photo files from the ~"" + ls_PicPath + "~" folder to the database.~r~n~r~nDo you want to continue?",Question!,YesNo!,2)
if ll_Rtn <> 1 then Return

SetPointer(HourGlass!)

f_SetFileSrv(inv_filesrv,TRUE)

inv_filesrv.of_DirList(ls_PicPath + "*.bmp",0,inv_DirAttribBMP)
inv_filesrv.of_DirList(ls_PicPath + "*.jpg",0,inv_DirAttribJPG)
inv_filesrv.of_DirList(ls_PicPath + "*.gif",0,inv_DirAttribGIF)

ls_Prefix = SEPCHAR

ll_Cnts = UpperBound(inv_DirAttribBMP)
for ll_Cycle = 1 to ll_Cnts
	ls_PicName = inv_DirAttribBMP[ll_Cycle].is_FileName
	//if Pos(ls_Prefix,SEPCHAR + Left(ls_PicName,LastPos(ls_PicName,".") - 1) + SEPCHAR) > 0 then CONTINUE
	ls_Prefix += Left(ls_PicName,LastPos(ls_PicName,".") - 1) + SEPCHAR
	ls_AllPic[UpperBound(ls_AllPic) + 1] = ls_PicName
next

ll_Cnts = UpperBound(inv_DirAttribJPG)
for ll_Cycle = 1 to ll_Cnts
	ls_PicName = inv_DirAttribJPG[ll_Cycle].is_FileName
	if Pos(ls_Prefix,SEPCHAR + Left(ls_PicName,LastPos(ls_PicName,".") - 1) + SEPCHAR) > 0 then CONTINUE
	
	ls_Prefix += Left(ls_PicName,LastPos(ls_PicName,".") - 1) + SEPCHAR
	ls_AllPic[UpperBound(ls_AllPic) + 1] = ls_PicName
next

ll_Cnts = UpperBound(inv_DirAttribGIF)
for ll_Cycle = 1 to ll_Cnts
	ls_PicName = inv_DirAttribGIF[ll_Cycle].is_FileName
	if Pos(ls_Prefix,SEPCHAR + Left(ls_PicName,LastPos(ls_PicName,".") - 1) + SEPCHAR) > 0 then CONTINUE
	
	//ls_Prefix += Left(ls_PicName,LastPos(ls_PicName,".") - 1) + SEPCHAR
	ls_AllPic[UpperBound(ls_AllPic) + 1] = ls_PicName
next

ll_Cnts = UpperBound(ls_AllPic)
for ll_Cycle = 1 to ll_Cnts
	ls_PicName = ls_AllPic[ll_Cycle]
	ls_Prefix = Left(ls_PicName,LastPos(ls_PicName,".") - 1)
	ls_Postfix = Mid(ls_PicName,LastPos(ls_PicName,".") + 1)
	if IsNumber(ls_Prefix) then
		ll_Prefix = long(ls_Prefix)
		SELECT Count(*) INTO :ll_ExistInBasic from pd_basic WHERE pd_basic.prac_id = :ll_Prefix ;
		if ll_ExistInBasic <= 0 then CONTINUE
		
		SELECT Count(*) INTO :ll_ExistInPhoto from pd_photo WHERE pd_photo.prac_id = :ll_Prefix ;
		if ll_ExistInPhoto <= 0 then
			INSERT INTO pd_photo(prac_id,image_type) VALUES(:ll_Prefix,:ls_Postfix) ;
		end if
		
		ll_FileNo = FileOpen(ls_PicPath + ls_PicName,StreamMode!,Read!)
		if ll_FileNo <= 0 then CONTINUE
		
		lblb_ImageData = Blob("")				//Reset lblb_ImageData
		ll_ReadCnts = FileRead(ll_FileNo,lblb_Buffer)
		do while ll_ReadCnts > 0
			lblb_ImageData += lblb_Buffer
			ll_ReadCnts = FileRead(ll_FileNo,lblb_Buffer)
		loop
		
		FileClose(ll_FileNo)
		
		UPDATE pd_photo SET image_type = :ls_Postfix WHERE pd_photo.prac_id = :ll_Prefix ;
		UPDATEBLOB pd_photo SET image_data = :lblb_ImageData WHERE pd_photo.prac_id = :ll_Prefix ;
	end if
next

f_SetFileSrv(inv_filesrv,false)

MessageBox(gnv_app.iapp_object.DisplayName,"Upload is complete!")

SetPointer(Arrow!)

end event

type cb_set_facility_app_label from commandbutton within w_utilities5
integer x = 41
integer y = 1720
integer width = 923
integer height = 92
integer taborder = 490
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "IntelliApp Name Painter"
end type

event clicked;open(w_facility_app_label)
end event

type cb_fixfax from commandbutton within w_utilities5
integer x = 1042
integer y = 1500
integer width = 919
integer height = 88
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Fix GP Fax Numbers"
end type

event clicked;integer r
string ls_ver_ck

// r = 	messagebox("About","This function will clear dba. values from export filters and practitioner queries.~rContinue?",Question!,yesno!,1)
//if r = 2 then return

open(w_fix_fax_fubar)


end event

type cb_npdb from commandbutton within w_utilities5
integer x = 2043
integer y = 1744
integer width = 919
integer height = 88
integer taborder = 470
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "NPDB Specialty Utility"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.27.2007 By: Jack
open(w_npdb_specialty_matching)
//---------------------------- APPEON END ----------------------------

end event

type cb_view_alias from commandbutton within w_utilities5
integer x = 2043
integer y = 1948
integer width = 919
integer height = 88
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "View Alias Maintenance"
end type

event clicked;//$<add> 02.19.2008 by Andy
Open(w_view_alias_maintenance)
end event

type cb_migrate from commandbutton within w_utilities5
integer x = 46
integer y = 836
integer width = 919
integer height = 88
integer taborder = 360
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Migrate Test Data"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility id for importing/Exporting data from test systems for specific Modules..~r~rDo you wish to continue?",Question!,yesno!,1)
if r = 2 then return

open(w_data_migration)
end event

type cb_clientsetting from commandbutton within w_utilities5
boolean visible = false
integer x = 41
integer y = 1608
integer width = 923
integer height = 88
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Client Setting"
end type

event clicked;Open(w_client_setting)
end event

type cb_updae_sql from commandbutton within w_utilities5
integer x = 2043
integer y = 1640
integer width = 919
integer height = 88
integer taborder = 440
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Contract Screen SQL"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.27.2007 By: Jack
open(w_contract_screen)
//---------------------------- APPEON END ----------------------------

end event

type cb_wc_setup from commandbutton within w_utilities5
integer x = 46
integer y = 516
integer width = 919
integer height = 88
integer taborder = 450
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Web Crawl Setup"
end type

event clicked;//integer r

// r = 	messagebox("About","This utility is for creating non- practitioner records available for inclusion in meeting attendance.   ~r~rDo you wish to continue?",Question!,yesno!,1)
//if r = 2 then return

open(w_web_crawler_user_info)
end event

type cb_crawls from commandbutton within w_utilities5
integer x = 46
integer y = 296
integer width = 923
integer height = 88
integer taborder = 530
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Import Web Crawls"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for importing IntelliCred Web crawler data.Contact ContractLogix Group to get import files.  Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
Open( w_import_webcrawler ) 
end event

type cb_dba from commandbutton within w_utilities5
integer x = 1042
integer y = 1384
integer width = 919
integer height = 88
integer taborder = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clean dba. from export data"
end type

event clicked;integer r
string ls_ver_ck

 r = 	messagebox("About","This function will clear dba. values from export filters and practitioner queries.~rContinue?",Question!,yesno!,1)
if r = 2 then return

open(w_utl_strip_dba_from_export)


end event

type cb_sec_paint from commandbutton within w_utilities5
integer x = 46
integer y = 1164
integer width = 919
integer height = 88
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Login Security Parameters"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

// r = 	messagebox("About","This allows resetting a user expiration date to today to allow the user to log in and change their password.  It also includes Settings for password expiration and program timeout.~r~rDo you wish to continue?",Question!,yesno!,1)
//if r = 2 then return

open(w_security_painter)
end event

type cb_nonprac from commandbutton within w_utilities5
integer x = 46
integer y = 1496
integer width = 919
integer height = 88
integer taborder = 400
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Non-Practitioner Painter"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for creating non- practitioner records available for inclusion in meeting attendance.   ~r~rDo you wish to continue?",Question!,yesno!,1)
if r = 2 then return

openwithparm(w_non_prac_painter,"A")
end event

type cb_caqh_codes from commandbutton within w_utilities5
integer x = 2043
integer y = 1536
integer width = 919
integer height = 88
integer taborder = 410
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "CAQH Code Utility"
end type

event clicked;integer r

 r = 	messagebox("About","This function is for adding CAQH code values to lookup tables.~rContinue?",Question!,yesno!,1)
if r = 2 then return



openwithparm(w_caqh_import_utl,"P")


end event

type cb_caqh_fields from commandbutton within w_utilities5
integer x = 2043
integer y = 1432
integer width = 919
integer height = 88
integer taborder = 420
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add CAQH Fields to Views"
end type

event clicked;integer r


open(w_caqh_add_fields)


end event

type cb_screen_view from commandbutton within w_utilities5
integer x = 46
integer y = 1280
integer width = 919
integer height = 88
integer taborder = 370
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Screen View Utility"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for setting screen aliases and reference field values.  Do not use withoutassistance of IntelliCred Support.~r~rDo you wish to continue?",Question!,yesno!,1)
if r = 2 then return

open(w_ref_field_update)
end event

type cb_paths from commandbutton within w_utilities5
integer x = 1042
integer y = 1276
integer width = 919
integer height = 88
integer taborder = 210
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Test Paths"
end type

event clicked;integer r
string ls_ver_ck

 r = 	messagebox("About","This function will check to see if program paths are valid.~rContinue?",Question!,yesno!,1)
if r = 2 then return

n_cst_rights LNVO_RIGHTS
LNVO_RIGHTS = create n_cst_rights
ls_ver_ck = LNVO_RIGHTS.OF_start( )
if ls_ver_ck = "OK" then
	messagebox("Path Test","No problems found")
else
	openwithparm( w_sql_msg,ls_ver_ck)
end if
destroy LNVO_RIGHTS


end event

type cb_4 from commandbutton within w_utilities5
integer x = 2039
integer y = 1328
integer width = 919
integer height = 88
integer taborder = 220
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Application Mod Audit"
end type

event clicked;integer r

// r = 	messagebox("About","This function will the IDs table to make sure prac_ids, rec_ids, lookup_codes,etc. are in sync.~rWill NOT work for rec_id on custom tables.~rContinue?",Question!,yesno!,2)
//if r = 2 then return
//
open(w_appl_tracking_utl)


end event

type cb_index from commandbutton within w_utilities5
integer x = 2039
integer y = 1224
integer width = 919
integer height = 88
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Additional indexes"
end type

event clicked;string ls_sql
integer r
long fid = 9810 //expiration date

 r = 	messagebox("About","This function will add additional indexes to the database that may improve performance. It is best to run this with only one user in the system.~r~rContinue?",Question!,yesno!,2)
if r = 2 then 
	return
else
	open (w_add_indexes_v5)
end if


end event

type cb_date_fields from commandbutton within w_utilities5
integer x = 2034
integer y = 912
integer width = 919
integer height = 88
integer taborder = 430
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add New Date Fields to Views"
end type

event clicked;integer r

// r = 	messagebox("About","This function will clear double quotes in all Credentialing Data screen labels and text items.~rContinue?",Question!,yesno!,2)
//if r = 2 then return
//
open(w_add_new_date_fields)


end event

type cb_appt_painter from commandbutton within w_utilities5
integer x = 46
integer y = 1388
integer width = 919
integer height = 88
integer taborder = 380
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Appointment Status Cust Painter"
end type

event clicked;integer res
res = messagebox("This operation:","This utility is a painter for some of the Appointment Status detail field labels.  Validation can also be set on those fields.    ~rContinue?",question!,yesno!,1)

if res =  1 then 	Open(w_appt_stat_painter)
end event

type cb_clear_quotes from commandbutton within w_utilities5
integer x = 2039
integer y = 1016
integer width = 919
integer height = 88
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Clear Quotes from Labels"
end type

event clicked;integer r

 r = 	messagebox("About","This function will clear double quotes in all Credentialing Data screen labels and text items.~rContinue?",Question!,yesno!,2)
if r = 2 then return

openwithparm(w_utl_label_strip_quote,"P")


end event

type cb_prem_utl from commandbutton within w_utilities5
boolean visible = false
integer x = 1042
integer y = 1960
integer width = 923
integer height = 88
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "iPrem Utilities"
end type

event clicked;integer res
//res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)

//Open(w_premium_sync)






end event

type cb_priv_rpt from commandbutton within w_utilities5
boolean visible = false
integer x = 2043
integer y = 1980
integer width = 923
integer height = 88
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Privilege Report"
end type

event clicked;integer res
//res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)

Open(w_privilege_report)






end event

type cb_selects from commandbutton within w_utilities5
integer x = 46
integer y = 728
integer width = 919
integer height = 88
integer taborder = 350
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "SQL Selects"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will allow the user run and export sql queries.~r~rDo you wish to continue?",Question!,yesno!,1)
if r = 2 then return

open(w_sql_select_only)
end event

type cb_check_ids from commandbutton within w_utilities5
integer x = 2039
integer y = 1120
integer width = 919
integer height = 88
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Check IDs"
end type

event clicked;
//Commented By Ken.Guo 01/29/2013
//integer r
// r = 	messagebox("About","This function will the IDs table to make sure prac_ids, rec_ids, lookup_codes,etc. are in sync.~rWill NOT work for rec_id on custom tables.~rContinue?",Question!,yesno!,2)
//if r = 2 then return

open(w_ids_check)


end event

type cb_exp_not_comp from commandbutton within w_utilities5
integer x = 1042
integer y = 1164
integer width = 919
integer height = 88
integer taborder = 230
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Exp Verifications not Completed "
end type

event clicked;integer r

 r = 	messagebox("About","This function will display an updateable list of all incompleted expiring verifications where the expiration date is beyond today's date.~rFor items beyond 30 days, this could indicate the data record was completed but not the verification.~rContinue?",Question!,yesno!,2)
if r = 2 then return

openwithparm(w_utl_incomplete_exp_verifs,"P")


end event

type cb_registry from commandbutton within w_utilities5
boolean visible = false
integer x = 3109
integer y = 1304
integer width = 919
integer height = 88
integer taborder = 330
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set Registry Path"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will set the registry key to allow a user to run the program from other than the C drive.~r~rDo you wish to continue?",Question!,yesno!,1)
if r = 2 then return

openwithparm(w_utl_set_regedit_path,"P")
end event

type cb_user_reset from commandbutton within w_utilities5
integer x = 46
integer y = 1052
integer width = 919
integer height = 88
integer taborder = 340
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "User Utilities"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

// r = 	messagebox("About","This allows resetting a user expiration date to today to allow the user to log in and change their password.  It also includes Settings for password expiration and program timeout.~r~rDo you wish to continue?",Question!,yesno!,1)
//if r = 2 then return
//
//open(w_security_set)
open(w_user_reset)  //Start Code Change ---- 11.07.2006 #1 maha changed back to this window to separate user functions from security settings.
end event

type cb_bd_exp from commandbutton within w_utilities5
integer x = 2039
integer y = 808
integer width = 919
integer height = 88
integer taborder = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "New Board/Specialty Fields"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.23.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
integer r
integer dvid
integer rc
integer v
integer find
integer vc
integer a
long fid = 9810 //expiration date

 r = 	messagebox("About","This function will Copy the new specialty exp date and certified fields to all views, and set the Bd/Spec expiration field to expiration date, and create expiration date data from certificate expires.~r~rContinue?",Question!,yesno!,2)
if r = 2 then return

SetPointer ( hourglass! )
debugbreak()
dw_data_view_list.settransobject(sqlca)
vc = dw_data_view_list.retrieve()
dw_dvfieldcopy.settransobject(sqlca)

for a = 1 to 2
	if a = 2 then fid = 9811 //board certified
	dw_dvfieldcopy.reset()
	rc = dw_dvfieldcopy.retrieve(fid)
	for v = 1 to vc  //go down list of views and add if not found
		dvid = dw_data_view_list.getitemnumber(v,"data_view_id")
		find = dw_dvfieldcopy.Find ( "data_view_id = " + string(dvid), 1, vc )
		if find < 0 then
			messagebox("","bad find")
			return
			end if
		if find = 0 then 
			dw_dvfieldcopy.rowscopy(1,1,primary!,dw_dvfieldcopy,1000,primary!)
			dw_dvfieldcopy.setitem(dw_dvfieldcopy.rowcount(),"data_view_id",dvid)
		end if
	next
	dw_dvfieldcopy.update()
	commit using sqlca;
next
		

//update exp dv field
update data_view_screen set exp_field = 9810 where screen_id =  19;

//update exp data
update pd_board_specialty set expiration_date = string(certification_expires) + '-12-30' + ' 00:00:00' where certification_expires is not null and expiration_date is null;

//update certified
update pd_board_specialty set board_certified = 581 where board_code is not null;
update pd_board_specialty set board_certified = 582 where board_code is null;
*/
integer r
integer dvid
integer rc
integer v
integer find
integer vc
integer a
long fid = 9810 //expiration date

r = messagebox("About","This function will Copy the new specialty exp date and certified fields to all views, and set the Bd/Spec expiration field to expiration date, and create expiration date data from certificate expires.~r~rContinue?",Question!,yesno!,2)
if r = 2 then return

SetPointer ( hourglass! )
debugbreak()
dw_data_view_list.settransobject(sqlca)
vc = dw_data_view_list.retrieve()
dw_dvfieldcopy.settransobject(sqlca)

for a = 1 to 2
	if a = 2 then fid = 9811 //board certified
	dw_dvfieldcopy.reset()
	rc = dw_dvfieldcopy.retrieve(fid)
	for v = 1 to vc  //go down list of views and add if not found
		dvid = dw_data_view_list.getitemnumber(v,"data_view_id")
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 04.01.2006 By: LiuHongXin
		//$<reason> Fix a defect.
		/*
		find = dw_dvfieldcopy.Find ( "data_view_id = " + string(dvid), 1, vc )
		*/
		find = dw_dvfieldcopy.Find ( "data_view_id = " + string(dvid), 1, rc )
		//---------------------------- APPEON END ----------------------------
		if find < 0 then
			messagebox("","bad find")
			return
			end if
		if find = 0 then 
			dw_dvfieldcopy.rowscopy(1,1,primary!,dw_dvfieldcopy,1000,primary!)
			dw_dvfieldcopy.setitem(dw_dvfieldcopy.rowcount(),"data_view_id",dvid)
		end if
	next
next

gnv_appeondb.of_startqueue( )
		
dw_dvfieldcopy.update()
commit using sqlca;

//update exp dv field
update data_view_screen set exp_field = 9810 where screen_id =  19;
//update exp data
update pd_board_specialty set expiration_date = convert(char(4),certification_expires) + '-12-30' + ' 00:00:00' where certification_expires is not null and expiration_date is null;
//update certified
update pd_board_specialty set board_certified = 581 where board_code is not null;
update pd_board_specialty set board_certified = 582 where board_code is null;

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

SetPointer ( arrow! )
messagebox("Done"," Update Completed")
end event

type cb_comp_info from commandbutton within w_utilities5
integer x = 2039
integer y = 704
integer width = 923
integer height = 88
integer taborder = 310
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Company Information"
end type

event clicked;integer res
//res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)

open(w_company_info)






end event

type cb_requested from commandbutton within w_utilities5
integer x = 1042
integer y = 1052
integer width = 919
integer height = 88
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set Staff Cat Status "
end type

event clicked;integer r

 r = 	messagebox("About","This function will update the status value for all Staff Category records based on to_date.~rDate  = inactive; no date = active.~r~rContinue?",Question!,yesno!,2)
if r = 2 then return

string ls_sql


update pd_affil_staff_cat set requested = 0 where to_date is not null;
update pd_affil_staff_cat set requested = 1 where to_date is null;
commit using sqlca;

 r = 	messagebox("Requested","Do you want to update the status of records where there is no FROM or TO dates to 'Requested' status?",Question!,yesno!,2)
if r = 1 then 
	update pd_affil_staff_cat set requested = 2 where to_date is null and from_date is null;
	commit using sqlca;
end if

messagebox("Done"," Update Completed")
end event

type cb_field_ord_chk from commandbutton within w_utilities5
integer x = 1042
integer y = 944
integer width = 919
integer height = 88
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Check Field Order "
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility will check for and correct duplicated field orders on the default data view which could cause app populating problems. Continue?",Question!,yesno!,2)
if r = 2 then return

Openwithparm(w_utl_dvf_order_check,"P" )


end event

type cb_iapp_fix from commandbutton within w_utilities5
integer x = 1042
integer y = 836
integer width = 919
integer height = 88
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Intelliappfix Search"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob


Open( w_iapp_fix_login )

if Lower( Message.StringParm ) = "cancel"  THEN
	return
elseIF Lower( Message.StringParm ) = "intelliappfix"  THEN
	Open( w_iapp_find_row )
ELSE
	MessageBox( "Sorry", "Wrong password." )
END IF
end event

type cb_multi_affil_check from commandbutton within w_utilities5
integer x = 1047
integer y = 728
integer width = 914
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Appointment Aberrations Check"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for checking for abnormal appointment records for practitioners. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
openwithparm(w_utl_multi_nonhist_check, "P")
end event

type cb_dapplications from commandbutton within w_utilities5
integer x = 46
integer y = 188
integer width = 923
integer height = 88
integer taborder = 480
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Download Applications"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for downloading IntelliApp Applications from the ContractLogix Group Website. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
Openwithparm( w_import_apps,"P" ) //P indicated open from intellicred
end event

type cb_dmanual from commandbutton within w_utilities5
integer x = 46
integer y = 84
integer width = 923
integer height = 88
integer taborder = 460
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Download Current Manual"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for downloading the latest Manual from the ContractLogix Group Website. Continue?",Question!,yesno!,1)
if r = 2 then return

String sle_url
inet iinet_base

messagebox("About","Enter your assigned user name and password for the ContractLogix Group website. If you don't know it, contact IntelliSoft Group Suppor.t~r Go to Download Center.  Select the manual you desire and click download.~r SAVE to your computer.")
of_open_web("http://www.intellisoftgroup.com/forum/login_user.asp") //Start Code Change ---- 06.20.2007 #V7 maha
//GetContextService("Internet", iinet_base)
//iinet_base.HyperlinkToURL("http://www.intellisoftgroup.com/customer/customer.html")

end event

type cb_print_reset from commandbutton within w_utilities5
integer x = 2039
integer y = 184
integer width = 928
integer height = 88
integer taborder = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch Reset Print Flags"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for Batch resetting verification print flags When 'Did the letters print ok' is answered yes by mistake. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
open(w_utl_print_reset)
end event

type cb_assignedusers from commandbutton within w_utilities5
integer x = 2039
integer y = 392
integer width = 928
integer height = 88
integer taborder = 280
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Change Assigned Users "
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for updating the assigned users for Appointments and verifications. Continue?",Question!,yesno!,2)
if r = 2 then return

//messagebox("About","This function not yet complete.")
//return
open(w_user_update_new)
end event

type cb_oig from commandbutton within w_utilities5
integer x = 2039
integer y = 288
integer width = 928
integer height = 88
integer taborder = 270
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update OIG Data"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for updating OIG data. Continue?",Question!,yesno!,2)
if r = 2 then return

open(w_import_oig)
end event

type st_2 from statictext within w_utilities5
integer x = 3022
integer y = 1880
integer width = 91
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;messagebox("Oh no " + gs_user_id + " !","~nYou have now entered the customer abuse zone; the place where the program abusues the user.~n~n Just remember, you asked for it.")

open (w_user_abuse)
end event

type cb_user_security from commandbutton within w_utilities5
integer x = 1042
integer y = 620
integer width = 919
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "User Security Utilities"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will clean up user view and facility security.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

openwithparm(w_user_security_fix,1)
end event

type cb_docids from commandbutton within w_utilities5
integer x = 1042
integer y = 512
integer width = 919
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Verification Doc Ids"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This will reset all doc_ids values for all verifications to correct any that have gotten out of sync.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_doc_id_reset_utility)
end event

type cb_stat_check from commandbutton within w_utilities5
integer x = 1042
integer y = 404
integer width = 919
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sync Appointment Child Data"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility will check all appointment status records and match the active status/facility id of ~rchild records (Department, Staff Category, Leave, Committees).~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_check_active_stats)
end event

type cb_support_settings from commandbutton within w_utilities5
integer x = 3040
integer y = 240
integer width = 279
integer height = 84
integer taborder = 540
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Support"
end type

event clicked;//Open( w_function_password )
//
//
//IF Lower( Message.StringParm ) = "intelliset5"  THEN
	open(w_utilities_support)
//ELSE
//	MessageBox( "Sorry", "Wrong password." )
//END IF
end event

type cb_priv_adj from commandbutton within w_utilities5
integer x = 1042
integer y = 296
integer width = 919
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Adjust Privileges"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for adjusting privilege deliniation.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_privilege_adjustments)
end event

type cb_comm_review_fix from commandbutton within w_utilities5
integer x = 2039
integer y = 496
integer width = 923
integer height = 88
integer taborder = 290
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Committee Review Fix"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for adding missing committees to active affiliations the have NONE.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_comm_review_fix)
end event

type cb_links from commandbutton within w_utilities5
integer x = 1042
integer y = 188
integer width = 919
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Links Fix Utility"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob

 r = 	messagebox("About","This utility is for adding missing address, specialty,of hospital links,as well as for deleting bad ones.~r~rDo you wish to continue?",Question!,yesno!,2)
if r = 2 then return

open(w_link_check_utility)
end event

type cb_10 from commandbutton within w_utilities5
integer x = 2039
integer y = 80
integer width = 928
integer height = 88
integer taborder = 250
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Back Up Database"
end type

event clicked;integer res


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-11-25 By: Zhang Lingping
//$<reason> can not backup SQL database from apllication 

if gs_dbtype = 'ASA' then
	res = messagebox("This operation:","This utility will allow you to back up your Intellicred datebase.  ~rContinue?",question!,yesno!,1)
	if res = 1 then 
		open(w_data_backup)
	end if
else
	messagebox("This operation:","The MS SQL Database cannot be backed up by this uility!")
end if
	
//---------------------------- APPEON END ----------------------------
end event

type cb_fix from commandbutton within w_utilities5
integer x = 1042
integer y = 80
integer width = 919
integer height = 88
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = " Fix DOB Year"
end type

event clicked;integer r
integer rc
integer d
integer m
integer yr
date dob


 r = 	messagebox("About","This function will correct any prac dob that shows a year greater than 2000",Question!,yesno!,2)
if r = 2 then return
dw_3.settransobject(sqlca)
rc = dw_3.retrieve()
for r = 1 to rc
	 yr = year(date(dw_3.getitemdatetime(r,"date_of_birth"))) 
	 //messagebox("yr",yr)
if yr > 2000 then		
	yr = yr - 100
	//messagebox("yr-100",yr)
	m = month(date(dw_3.getitemdatetime(r,"date_of_birth")))
	d = day(date(dw_3.getitemdatetime(r,"date_of_birth")))
	dob = date(string(yr)  + "/" + string(m) + "/" + string(d))
	//messagebox("",string(dob))
	dw_3.setitem(r,"date_of_birth",datetime(dob))
end if
next

dw_3.update()
commit using sqlca;


	messagebox("done","Completed")
end event

type dw_3 from datawindow within w_utilities5
boolean visible = false
integer x = 3168
integer y = 872
integer width = 247
integer height = 88
integer taborder = 510
string dataobject = "d_fix_dob"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

type cb_3 from commandbutton within w_utilities5
integer x = 3040
integer y = 40
integer width = 279
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;CLOSE(PARENT)
end event

type cb_2 from commandbutton within w_utilities5
integer x = 2039
integer y = 600
integer width = 923
integer height = 88
integer taborder = 300
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update PD Committees"
end type

event clicked;integer res
res = messagebox("This operation:","This utility will add missing facility committees to current appointments.  Used when committees have been added to a facility after the appointments were created.  ~rContinue?",question!,yesno!,2)
if res = 2 then return

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 02.23.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
integer a
integer ac
integer p
integer pc
integer c
integer cc
integer nr
integer nc
integer li_fac
long ll_commid
long ll_rec
long ll_prac
Long ll_seq
integer comfind
datetime ldt_date

dw_pracaffil.settransobject(sqlca)
ac = dw_pracaffil.retrieve()//a list of all active appointments
//Start Code Change ---- 01.23.2006 #211 maha
if ac < 1 then
	messagebox("Retrieve Error","No Appointment data retrieved")
	return
end if
//End Code Change---01.23.2005 

for a = 1 to ac
	ll_rec = dw_pracaffil.getitemnumber(a,"rec_id")
	ll_prac = dw_pracaffil.getitemnumber(a,"prac_id")
	li_fac = dw_pracaffil.getitemnumber(a,"parent_facility_id")
	ll_seq = dw_pracaffil.getitemnumber(a,"seq_no")
	ldt_date = dw_pracaffil.getitemdatetime(a,"apptmnt_start_date")
	dw_praccomm.settransobject(sqlca)
	pc = dw_praccomm.retrieve(ll_rec)// a list of comms for the appnt
	dw_facilcomm.settransobject(sqlca)
	cc = dw_facilcomm.retrieve(li_fac)// a list of committees for the facil of the appnt.
	for c = 1 to cc
		comfind = 0
		//messagebox("cc",cc)
		ll_commid = dw_facilcomm.getitemnumber(c,"committee_id")
		for p = 1 to pc
			if ll_commid = dw_praccomm.getitemnumber(p,"committee_id") then 
				comfind = 1
			end if
		next
			if comfind = 0 then
				nr = dw_praccomm.insertrow(0)
				dw_praccomm.setitem(nr,"rec_id",ll_rec)
				dw_praccomm.setitem(nr,"prac_id",ll_prac)
				dw_praccomm.setitem(nr,"facility_id",li_fac)
				dw_praccomm.setitem(nr,"seq_no",ll_seq)
				dw_praccomm.setitem(nr,"committee_id",ll_commid)
				dw_praccomm.setitem(nr,"active_status",1)
				dw_praccomm.setitem(nr,"date_sent_for_review", ldt_date )
				dw_praccomm.setitem(nr,"date_back_from_review", ldt_date )
				if not isnull(ldt_date) then
					dw_praccomm.setitem(nr,"review_results", 615 )//approved	
				end if
				dw_praccomm.update()
				commit using sqlca;
			end if
	next
next
*/
integer a
integer ac
integer p
integer pc
integer c
integer cc
integer nr
integer nc
integer li_fac[]
long ll_commid
long ll_rec[]
long ll_prac
Long ll_seq
integer comfind
datetime ldt_date

datastore lds_praccomm,lds_facilcomm,lds_praccomm1

lds_praccomm = create datastore
lds_praccomm1 = create datastore
lds_facilcomm = create datastore
lds_praccomm.dataobject = 'd_prac_pd_comm_for_pt'
lds_praccomm1.dataobject = 'd_prac_pd_comm_for_pt'
lds_facilcomm.dataobject = 'd_comm_of_facil_for_pt'
lds_praccomm.settransobject(sqlca)
lds_praccomm1.settransobject(sqlca)
lds_facilcomm.settransobject(sqlca)
dw_pracaffil.settransobject(sqlca)
ac = dw_pracaffil.retrieve()//a list of all active appointments
//Start Code Change ---- 01.23.2006 #211 maha
if ac < 1 then
	messagebox("Retrieve Error","No Appointment data retrieved")
	return
end if
//End Code Change---01.23.2005 

for a = 1 to ac
	ll_rec[a] = dw_pracaffil.getitemnumber(a,"rec_id")
	li_fac[a] = dw_pracaffil.getitemnumber(a,"parent_facility_id")
next

if upperBound(ll_rec) = 0 then
	ll_rec[1] = 0
end if

if upperBound(li_fac) = 0 then
	li_fac[1] = 0
end if

gnv_appeondb.of_startqueue( )

lds_praccomm.retrieve(ll_rec)
lds_facilcomm.retrieve(li_fac)

gnv_appeondb.of_commitqueue( )

for a = 1 to ac
	ll_prac = dw_pracaffil.getitemnumber(a,"prac_id")
	ll_seq = dw_pracaffil.getitemnumber(a,"seq_no")
	ldt_date = dw_pracaffil.getitemdatetime(a,"apptmnt_start_date")
	lds_praccomm.setfilter('rec_id = '+string(ll_rec[a]))
	lds_praccomm.filter( )
	pc = lds_praccomm.rowcount( )
	lds_facilcomm.setfilter('facility_id = ' + string(li_fac[a]))
	lds_facilcomm.filter( )
	cc = lds_facilcomm.rowcount( )
	for c = 1 to cc
		comfind = 0
		//messagebox("cc",cc)
		ll_commid = lds_facilcomm.getitemnumber(c,"committee_id")
		for p = 1 to pc
			if ll_commid = lds_praccomm.getitemnumber(p,"committee_id") then 
				comfind = 1
			end if
		next
			if comfind = 0 then
				nr = lds_praccomm1.insertrow(0)
				lds_praccomm1.setitem(nr,"rec_id",ll_rec[a])
				lds_praccomm1.setitem(nr,"prac_id",ll_prac)
				lds_praccomm1.setitem(nr,"facility_id",li_fac[a])
				lds_praccomm1.setitem(nr,"seq_no",ll_seq)
				lds_praccomm1.setitem(nr,"committee_id",ll_commid)
				lds_praccomm1.setitem(nr,"active_status",1)
				lds_praccomm1.setitem(nr,"date_sent_for_review", ldt_date )
				lds_praccomm1.setitem(nr,"date_back_from_review", ldt_date )
				if not isnull(ldt_date) then
					lds_praccomm1.setitem(nr,"review_results", 615 )//approved	
				end if
			end if
	next
next			

gnv_appeondb.of_startqueue( )

lds_praccomm1.update()
commit using sqlca;

gnv_appeondb.of_commitqueue( )

destroy lds_praccomm
destroy lds_praccomm1
destroy lds_facilcomm
//---------------------------- APPEON END ----------------------------

messagebox("Done"," Update Completed")






end event

type cb_1 from commandbutton within w_utilities5
integer x = 3040
integer y = 140
integer width = 279
integer height = 84
integer taborder = 570
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&About"
end type

event clicked;messagebox("To operate this program :","Click the button for the utility you wish to run. ~rSupport functions are intended for ContractLogix technical support only.")

end event

type dw_facilcomm from datawindow within w_utilities5
boolean visible = false
integer x = 3214
integer y = 1196
integer width = 82
integer height = 64
integer taborder = 580
string dataobject = "d_comm_of_facil"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_praccomm from datawindow within w_utilities5
boolean visible = false
integer x = 3127
integer y = 724
integer width = 279
integer height = 64
integer taborder = 560
string dataobject = "d_prac_pd_comm"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pracaffil from datawindow within w_utilities5
boolean visible = false
integer x = 3109
integer y = 1020
integer width = 498
integer height = 92
integer taborder = 550
string dataobject = "d_affil_stat_of_prac_all"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_adm from groupbox within w_utilities5
integer x = 9
integer y = 428
integer width = 987
integer height = 1672
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Administrative"
end type

type gb_2 from groupbox within w_utilities5
integer x = 18
integer y = 20
integer width = 978
integer height = 404
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Downloads"
end type

type dw_dvfieldcopy from datawindow within w_utilities5
boolean visible = false
integer x = 3173
integer y = 456
integer width = 261
integer height = 76
integer taborder = 520
string dataobject = "d_dvf_field_copy"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_data_view_list from datawindow within w_utilities5
boolean visible = false
integer x = 3186
integer y = 564
integer width = 283
integer height = 72
integer taborder = 500
string dataobject = "d_data_view_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_utilities5
integer x = 1010
integer y = 16
integer width = 987
integer height = 2084
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Data Clean Up"
end type

type gb_4 from groupbox within w_utilities5
integer x = 2011
integer y = 16
integer width = 978
integer height = 2084
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Program Utilities"
end type

type cb_settings from commandbutton within w_utilities5
integer x = 41
integer y = 1836
integer width = 923
integer height = 88
integer taborder = 390
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Application Settings"
end type

event clicked;	open(w_icred_settings)
	//close(parent)





end event

