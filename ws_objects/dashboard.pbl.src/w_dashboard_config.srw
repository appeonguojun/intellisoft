﻿$PBExportHeader$w_dashboard_config.srw
forward
global type w_dashboard_config from w_response
end type
type st_5 from statictext within w_dashboard_config
end type
type dw_personal from datawindow within w_dashboard_config
end type
type st_size from statictext within w_dashboard_config
end type
type cb_apply from commandbutton within w_dashboard_config
end type
type st_zoom from statictext within w_dashboard_config
end type
type st_w from statictext within w_dashboard_config
end type
type st_h from statictext within w_dashboard_config
end type
type st_4 from statictext within w_dashboard_config
end type
type em_height from editmask within w_dashboard_config
end type
type st_2 from statictext within w_dashboard_config
end type
type sle_file from singlelineedit within w_dashboard_config
end type
type st_title_bg_color from statictext within w_dashboard_config
end type
type cb_cancel from commandbutton within w_dashboard_config
end type
type cb_ok from commandbutton within w_dashboard_config
end type
type cb_browse from commandbutton within w_dashboard_config
end type
type st_1 from statictext within w_dashboard_config
end type
type st_3 from statictext within w_dashboard_config
end type
type gb_1 from groupbox within w_dashboard_config
end type
type gb_2 from groupbox within w_dashboard_config
end type
type gb_3 from groupbox within w_dashboard_config
end type
type gb_4 from groupbox within w_dashboard_config
end type
type st_border from statictext within w_dashboard_config
end type
type p_preview from picture within w_dashboard_config
end type
end forward

global type w_dashboard_config from w_response
integer x = 214
integer y = 221
integer width = 2011
integer height = 1520
string title = "Dashboard Banner Settings"
st_5 st_5
dw_personal dw_personal
st_size st_size
cb_apply cb_apply
st_zoom st_zoom
st_w st_w
st_h st_h
st_4 st_4
em_height em_height
st_2 st_2
sle_file sle_file
st_title_bg_color st_title_bg_color
cb_cancel cb_cancel
cb_ok cb_ok
cb_browse cb_browse
st_1 st_1
st_3 st_3
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
st_border st_border
p_preview p_preview
end type
global w_dashboard_config w_dashboard_config

type variables
Long il_bg_color_org
String is_file_path,is_file_name,is_file_ext
Long il_file_lenght
Long il_logo_org_height,il_logo_org_width
n_cst_filesrvwin32 inv_FileSrv

Boolean ib_uploaded

String is_logo_file
end variables

forward prototypes
public subroutine of_preview_logo (string ls_file_name, ref long al_logo_height, ref long al_logo_width)
end prototypes

public subroutine of_preview_logo (string ls_file_name, ref long al_logo_height, ref long al_logo_width);//////////////////////////////////////////////////////////////////////
// $<function>w_dashboard_configof_preview_logo()
// $<arguments>
//		value    	string	ls_file_name  		
//		reference	long  	al_logo_height		
//		reference	long  	al_logo_width 		
// $<returns> (none)
// $<description>
// $<description> Preview logo file
//////////////////////////////////////////////////////////////////////
// $<add> 2008-08-20 by Ken.Guo
//////////////////////////////////////////////////////////////////////
Integer li_size
Decimal ldec_zoom_w,ldec_zoom_h
p_preview.originalsize = True
p_preview.picturename = ls_file_name
al_logo_width = p_preview.width
al_logo_height = p_preview.height
If al_logo_width > 1400 Then
	p_preview.width = 1400
	ldec_zoom_w = 1400/al_logo_width
	p_preview.height = al_logo_height * ldec_zoom_w
	p_preview.originalsize = False
End If
If al_logo_height > 500 Then
	ldec_zoom_h = 500/al_logo_height
	If ldec_zoom_h < ldec_zoom_w Or ldec_zoom_w = 0 Then
		p_preview.height = 500
		p_preview.width = al_logo_width * ldec_zoom_h
		p_preview.originalsize = False
	End If
End If

//Modified By Ken.Guo 12/19/2013
//st_h.text = 'H: ' + String(al_logo_height) 
//st_w.text = 'W: ' + String(al_logo_width) 
st_h.text = 'H: ' + String( Long(UnitsToPixels(al_logo_height, YUnitsToPixels!)) ) + ' pixels'
st_w.text = 'W: ' + String( Long(UnitsToPixels(al_logo_width, XUnitsToPixels!)) )  + ' pixels'
If Long(UnitsToPixels(al_logo_height, YUnitsToPixels!)) > 120 Then
	st_h.textcolor = RGB(255,0,0)
Else
	st_h.textcolor = RGB(0,0,0)
End If

st_zoom.text = 'Zoom: ' + String(Int((p_preview.width/al_logo_width) * 100)) + '%'
li_size = Int(FileLength(ls_file_name)/1024)
If li_size = 0 Then li_size = 1
st_size.text = 'Size: ' + String(li_size,'###,###,###') + ' KB'

//Fixed size if it have not zoom
//APB have a bug about UI. So add st_border to draw the border.
//Set p_preview.border = False
/*
If p_preview.width < 1400 and p_preview.height < 500 Then
	p_preview.width = 1400
	p_preview.height = 500
End If
*/
end subroutine

on w_dashboard_config.create
int iCurrent
call super::create
this.st_5=create st_5
this.dw_personal=create dw_personal
this.st_size=create st_size
this.cb_apply=create cb_apply
this.st_zoom=create st_zoom
this.st_w=create st_w
this.st_h=create st_h
this.st_4=create st_4
this.em_height=create em_height
this.st_2=create st_2
this.sle_file=create sle_file
this.st_title_bg_color=create st_title_bg_color
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_browse=create cb_browse
this.st_1=create st_1
this.st_3=create st_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.st_border=create st_border
this.p_preview=create p_preview
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.dw_personal
this.Control[iCurrent+3]=this.st_size
this.Control[iCurrent+4]=this.cb_apply
this.Control[iCurrent+5]=this.st_zoom
this.Control[iCurrent+6]=this.st_w
this.Control[iCurrent+7]=this.st_h
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.em_height
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.sle_file
this.Control[iCurrent+12]=this.st_title_bg_color
this.Control[iCurrent+13]=this.cb_cancel
this.Control[iCurrent+14]=this.cb_ok
this.Control[iCurrent+15]=this.cb_browse
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.gb_1
this.Control[iCurrent+19]=this.gb_2
this.Control[iCurrent+20]=this.gb_3
this.Control[iCurrent+21]=this.gb_4
this.Control[iCurrent+22]=this.st_border
this.Control[iCurrent+23]=this.p_preview
end on

on w_dashboard_config.destroy
call super::destroy
destroy(this.st_5)
destroy(this.dw_personal)
destroy(this.st_size)
destroy(this.cb_apply)
destroy(this.st_zoom)
destroy(this.st_w)
destroy(this.st_h)
destroy(this.st_4)
destroy(this.em_height)
destroy(this.st_2)
destroy(this.sle_file)
destroy(this.st_title_bg_color)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_browse)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.st_border)
destroy(this.p_preview)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////
// $<event>w_dashboard_config::open()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2008-08-20 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_file_ext,ls_logo_file
Long ll_height,ll_width
inv_FileSrv = Create n_cst_filesrvwin32

st_title_bg_color.backcolor = w_dashboard.backcolor
em_height.Text = String(w_dashboard.tab_dashboard.y)

ls_file_ext = w_dashboard.inv_dashboard.ids_dashboard_settings.GetItemString(1,'logo_extname')
is_logo_file = gs_dir_path + gs_DefDirName + '\dashboard_logo.' + ls_file_ext

of_preview_logo(is_logo_file,ll_height,ll_width)


//dw_personal.SetTransObject(SQLCA)
//dw_personal.Retrieve(gs_user_id)
end event

event close;call super::close;If Isvalid(inv_FileSrv) Then Destroy inv_FileSrv
end event

type st_5 from statictext within w_dashboard_config
integer x = 78
integer y = 1148
integer width = 1664
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The recommended image size is 120 pixels maximum in height and any width."
boolean focusrectangle = false
end type

type dw_personal from datawindow within w_dashboard_config
boolean visible = false
integer x = 78
integer y = 1656
integer width = 763
integer height = 92
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "d_dashb_settings_auto_open"
boolean border = false
boolean livescroll = true
end type

type st_size from statictext within w_dashboard_config
integer x = 110
integer y = 936
integer width = 325
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Size:"
boolean focusrectangle = false
end type

type cb_apply from commandbutton within w_dashboard_config
integer x = 1582
integer y = 1292
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Apply"
end type

event clicked;//////////////////////////////////////////////////////////////////////
// $<event>clickedcb_2()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2008-08-20 by Ken.Guo
//////////////////////////////////////////////////////////////////////
Blob lb_file_data
Long ll_FileLen
String ls_new_name
String ls_verify_data

If Not isvalid(w_dashboard) Then Return 1

If Long(em_height.Text) < 128 or Long(em_height.Text) > 500 Then
	Messagebox('Invalid','Invalid value for Title Height, please input again.')
	em_height.SetFocus()
	Return -1
End If
If st_title_bg_color.backcolor <> w_dashboard.backcolor Then
	w_dashboard.inv_dashboard.ids_dashboard_settings.SetItem(1,'title_bg_color',st_title_bg_color.backcolor) 
End If
If Long(em_height.text) <> w_dashboard.tab_dashboard.y Then
	w_dashboard.inv_dashboard.ids_dashboard_settings.SetItem(1,'title_height',Long(em_height.text)) 
End If
If FileExists(is_file_path) and ib_uploaded = False Then 
	ls_verify_data = String(today(),'yyyymmddhhmmssfff')
	w_dashboard.inv_dashboard.ids_dashboard_settings.SetItem(1,'logo_size',il_file_lenght)
	w_dashboard.inv_dashboard.ids_dashboard_settings.SetItem(1,'logo_org_height',il_logo_org_height)
	w_dashboard.inv_dashboard.ids_dashboard_settings.SetItem(1,'logo_org_width',il_logo_org_width)	
	w_dashboard.inv_dashboard.ids_dashboard_settings.SetItem(1,'logo_extname',is_file_ext)
	w_dashboard.inv_dashboard.ids_dashboard_settings.SetItem(1,'logo_verif_data',ls_verify_data)
End If

//gnv_appeondb.of_autocommitrollback( )
//If dw_personal.update() = 1 Then
//	Commit;
//Else
//	Rollback;
//End If

gnv_appeondb.of_autocommitrollback( )
If w_dashboard.inv_dashboard.ids_dashboard_settings.ModifiedCount() > 0 Then 
	If w_dashboard.inv_dashboard.ids_dashboard_settings.update() = 1 Then
		Commit;
	Else
		Rollback;
		Messagebox('Save Error','Failed to save the changes, please call support.')
		w_dashboard.inv_dashboard.ids_dashboard_settings.Retrieve()
		Return -1
	End If
	
	//Apply Settings For color and height
	w_dashboard.of_apply_title_bg_color()	
	w_dashboard.of_set_title_height(Long(em_height.text))	
	
	//For Logo
	If is_file_path <> '' Then
		//Save logo to DB
		If FileExists(is_file_path) Then
			ll_FileLen = inv_FileSrv.of_FileRead(is_file_path, lb_file_data)
				IF ll_FileLen > 0 THEN
					UPDATEBLOB dashboard_settings SET logo = :lb_file_data;
				END IF
		Else
			Return 0
		End If
		
		//Apply Logo
		ls_new_name = gs_dir_path + gs_DefDirName + '\dashboard_logo.' + is_file_ext
		If Upper(is_file_path) <> Upper(ls_new_name) Then		
			If FileExists(ls_new_name) Then
				inv_FileSrv.of_setfilereadonly( ls_new_name, False)
				If Not FileDelete(ls_new_name) Then
					Messagebox('Save Error','Failed to replace the file: '+ls_new_name + '.')
					Return -1
				End If
			End If
			If FileCopy(is_file_path,ls_new_name,True) <> 1 Then
				Messagebox('Save Error','Failed to generate the logo file.')
				Return -1
			End If
		End If
		is_logo_file = ls_new_name		
		
		w_dashboard.Setredraw(False)
		w_dashboard.of_apply_logo(ls_new_name,il_logo_org_height,il_logo_org_width,ls_verify_data)
		ib_uploaded = True
		w_dashboard.Setredraw(True)		
	End If
End If

Return 1
end event

type st_zoom from statictext within w_dashboard_config
integer x = 110
integer y = 856
integer width = 325
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Zoom:"
boolean focusrectangle = false
end type

type st_w from statictext within w_dashboard_config
integer x = 110
integer y = 764
integer width = 325
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "W: "
boolean focusrectangle = false
end type

type st_h from statictext within w_dashboard_config
integer x = 110
integer y = 684
integer width = 325
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "H: "
boolean focusrectangle = false
end type

type st_4 from statictext within w_dashboard_config
integer x = 1513
integer y = 204
integer width = 347
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "(128~~500 PBU)"
boolean focusrectangle = false
end type

type em_height from editmask within w_dashboard_config
integer x = 1166
integer y = 184
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "000"
boolean spin = true
double increment = 10
string minmax = "128~~500"
end type

type st_2 from statictext within w_dashboard_config
integer x = 818
integer y = 204
integer width = 329
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Header height:"
boolean focusrectangle = false
end type

type sle_file from singlelineedit within w_dashboard_config
integer x = 443
integer y = 456
integer width = 1431
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 134217739
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_title_bg_color from statictext within w_dashboard_config
integer x = 667
integer y = 184
integer width = 101
integer height = 88
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

event clicked;Long ll_color
Long ll_default_color[]
gl_custom_colors[16] = Parent.backcolor  //ButtonFace!
ll_color = This.backcolor
ChooseColor(ll_color,gl_custom_colors[])
This.backcolor = ll_color
end event

type cb_cancel from commandbutton within w_dashboard_config
integer x = 1207
integer y = 1292
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_dashboard_config
integer x = 837
integer y = 1292
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;If cb_apply.trigger event clicked() > 0 Then
	Close(Parent)
End If

end event

type cb_browse from commandbutton within w_dashboard_config
integer x = 101
integer y = 456
integer width = 325
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse..."
end type

event clicked;String ls_logo_path, ls_logo_file
integer i, li_cnt, li_rtn, li_filenum
Long ll_org_width,ll_org_height
//Added By Jay Chen 12-13-2013
string ls_type
long ll_picid,ll_pos
str_picture lstr_picture,lstr_picture_new
n_cst_dm_utils lnv_utils
n_getfilename ln_getfilename //Added By Jay Chen 08-15-2014

//Added By Jay Chen 12-13-2013
open(w_picture_browse_option)
ls_type = message.stringparm
if isnull(ls_type) or ls_type = '' then return

if ls_type = 'system' then 
	gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
	li_rtn = GetFileOpenName("Select Logo File", &
  		 	ls_logo_path, ls_logo_file, "GIF", &
			+ "Bitmaps(*.BMP),*.BMP," &
   			+ "GIF(*.GIF),*.GIF," &
   			+ "JPG(*.JPG),*.JPG" )
			//	+ "Ico(*.ICO),*.ICO" ) //PB have problem
			// + "Cursor(*.CUR),*.CUR" ) //PB&WEB have problem
			
	li_rtn = ln_getfilename.of_getopenfilename("Select Logo File", &
  		 	ls_logo_path, ls_logo_file, "GIF", &
			+ "Bitmaps(*.BMP),*.BMP," &
   			+ "GIF(*.GIF),*.GIF," &
   			+ "JPG(*.JPG),*.JPG" )
	
			gf_save_dir_path(ls_logo_path) //Added by Ken.Guo on 2009-03-10
			//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008
elseif ls_type = 'painter' then    //Added By Jay Chen 12-13-2013
	lstr_picture.as_type = 'select'
	Openwithparm(w_picture_painter, lstr_picture)
	If isvalid(Message.powerobjectparm) Then
		lstr_picture_new = Message.Powerobjectparm
		If lstr_picture_new.al_pic_id > 0 Then
			ll_picid = lstr_picture_new.al_pic_id
			lnv_utils.of_download_picture(ll_picid, ls_logo_path)
			if not isnull(ls_logo_path) and ls_logo_path <> "" then
				ll_pos = LastPos( ls_logo_path, '\' )
				if ll_pos > 0 then
					ls_logo_file = mid(ls_logo_path,ll_pos + 1)
					li_rtn = 1
				else
					li_rtn = 0
				end if
			else
				li_rtn = 0
			end if
		else
			li_rtn = 0
		End If
	End If
end if

IF li_rtn < 1 THEN Return

If Upper(ls_logo_path) = Upper(is_logo_file) Then
	Messagebox('Logo','The file "' + is_logo_file + '" is current logo file, please select another file.')
	Return -1
End If

If Int(FileLength(ls_logo_path)/1024) > 500 Then
	Messagebox('Logo',"The logo file's size must less than 500K.")
	Return -1
End If

sle_file.text = ls_logo_path
Parent.SetRedraw(False)

of_preview_logo(ls_logo_path,ll_org_height,ll_org_width)

il_file_lenght = FileLength(ls_logo_path) 
is_file_path = ls_logo_path
is_file_name = ls_logo_file
is_file_ext = Right(ls_logo_file,3)
il_logo_org_height = ll_org_height
il_logo_org_width = ll_org_width
Parent.SetRedraw(True)

ib_uploaded = False

Return 1


end event

type st_1 from statictext within w_dashboard_config
integer x = 119
integer y = 204
integer width = 549
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Header backgroup color:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_dashboard_config
integer x = 183
integer y = 584
integer width = 224
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Preview:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_dashboard_config
integer x = 73
integer y = 376
integer width = 1833
integer height = 744
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Logo Settings"
end type

type gb_2 from groupbox within w_dashboard_config
integer x = 73
integer y = 100
integer width = 1833
integer height = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Header Settings"
end type

type gb_3 from groupbox within w_dashboard_config
integer x = 32
integer y = 20
integer width = 1925
integer height = 1232
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Application Settings"
end type

type gb_4 from groupbox within w_dashboard_config
boolean visible = false
integer x = 37
integer y = 1584
integer width = 1925
integer height = 196
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Personal Settings"
end type

type st_border from statictext within w_dashboard_config
integer x = 443
integer y = 576
integer width = 1426
integer height = 524
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type p_preview from picture within w_dashboard_config
integer x = 457
integer y = 588
integer width = 1399
integer height = 500
boolean bringtotop = true
boolean originalsize = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
boolean map3dcolors = true
end type

event constructor;This.bringtotop = True
end event
