$PBExportHeader$w_splah_screen_set.srw
forward
global type w_splah_screen_set from w_response
end type
type cbx_remember from checkbox within w_splah_screen_set
end type
type cb_reset_pic from commandbutton within w_splah_screen_set
end type
type st_version from statictext within w_splah_screen_set
end type
type cb_2 from statictext within w_splah_screen_set
end type
type cb_1 from statictext within w_splah_screen_set
end type
type sle_password from singlelineedit within w_splah_screen_set
end type
type st_2 from statictext within w_splah_screen_set
end type
type sle_user_id from singlelineedit within w_splah_screen_set
end type
type st_1 from statictext within w_splah_screen_set
end type
type p_1 from picture within w_splah_screen_set
end type
type ddlb_1 from dropdownlistbox within w_splah_screen_set
end type
type dw_1 from datawindow within w_splah_screen_set
end type
type st_10 from statictext within w_splah_screen_set
end type
type st_version_color from statictext within w_splah_screen_set
end type
type st_8 from statictext within w_splah_screen_set
end type
type st_version_bk_color from statictext within w_splah_screen_set
end type
type st_user_bk_color from statictext within w_splah_screen_set
end type
type st_5 from statictext within w_splah_screen_set
end type
type st_user_color from statictext within w_splah_screen_set
end type
type st_22 from statictext within w_splah_screen_set
end type
type cb_reset from commandbutton within w_splah_screen_set
end type
type st_size from statictext within w_splah_screen_set
end type
type cb_apply from commandbutton within w_splah_screen_set
end type
type st_zoom from statictext within w_splah_screen_set
end type
type st_w from statictext within w_splah_screen_set
end type
type st_h from statictext within w_splah_screen_set
end type
type sle_file from singlelineedit within w_splah_screen_set
end type
type cb_cancel from commandbutton within w_splah_screen_set
end type
type cb_ok from commandbutton within w_splah_screen_set
end type
type cb_browse from commandbutton within w_splah_screen_set
end type
type st_border from statictext within w_splah_screen_set
end type
type p_preview from picture within w_splah_screen_set
end type
type gb_2 from groupbox within w_splah_screen_set
end type
type gb_3 from groupbox within w_splah_screen_set
end type
type gb_4 from groupbox within w_splah_screen_set
end type
type gb_1 from groupbox within w_splah_screen_set
end type
type st_111 from statictext within w_splah_screen_set
end type
end forward

global type w_splah_screen_set from w_response
integer x = 214
integer y = 221
integer width = 5189
integer height = 2500
string title = "Splash Screen Settings"
cbx_remember cbx_remember
cb_reset_pic cb_reset_pic
st_version st_version
cb_2 cb_2
cb_1 cb_1
sle_password sle_password
st_2 st_2
sle_user_id sle_user_id
st_1 st_1
p_1 p_1
ddlb_1 ddlb_1
dw_1 dw_1
st_10 st_10
st_version_color st_version_color
st_8 st_8
st_version_bk_color st_version_bk_color
st_user_bk_color st_user_bk_color
st_5 st_5
st_user_color st_user_color
st_22 st_22
cb_reset cb_reset
st_size st_size
cb_apply cb_apply
st_zoom st_zoom
st_w st_w
st_h st_h
sle_file sle_file
cb_cancel cb_cancel
cb_ok cb_ok
cb_browse cb_browse
st_border st_border
p_preview p_preview
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_1 gb_1
st_111 st_111
end type
global w_splah_screen_set w_splah_screen_set

type variables
Long il_bg_color_org
String is_file_path,is_file_name,is_file_ext
Long il_file_lenght
Long il_logo_org_height,il_logo_org_width
n_cst_filesrvwin32 inv_FileSrv
string is_control[] = {'User Name Label','User Name','Password Label','Password','Button OK','Button Cancel','Version Label', 'Remember Me'}
Boolean ib_modify=false

//Added By Ken.Guo 2016-04-13
Long il_setprod
end variables

forward prototypes
public subroutine of_preview_logo (string ls_file_name, ref long al_logo_height, ref long al_logo_width)
public subroutine of_preview_pic (blob lb_file, ref long al_logo_height, ref long al_logo_width)
public subroutine of_set_default_color ()
public subroutine of_save_color ()
public subroutine of_set_default_property (string as_object)
public subroutine of_load_property (string as_object)
public subroutine of_save_property (string as_object)
public subroutine of_intellicontractlayout ()
public subroutine of_preview_property (string as_object)
end prototypes

public subroutine of_preview_logo (string ls_file_name, ref long al_logo_height, ref long al_logo_width);Integer li_size
p_preview.originalsize = True
p_preview.picturename = ls_file_name
al_logo_width = p_preview.width
al_logo_height = p_preview.height

il_logo_org_height= p_preview.height
il_logo_org_width= p_preview.width

If al_logo_width > 1408 Then
	p_preview.width = 1408
	p_preview.height = al_logo_height * (p_preview.width/al_logo_width)
	p_preview.originalsize = False
End If
If al_logo_height > 876 Then
	p_preview.height = 876
	p_preview.width = al_logo_width * (p_preview.height/al_logo_height)
	p_preview.originalsize = False
End If

st_zoom.text = 'Zoom: ' + String(Int((p_preview.width/al_logo_width) * 100)) + '%'
li_size = Int(FileLength(ls_file_name)/1024)
If li_size = 0 Then li_size = 1
If li_size > 0 Then
	st_size.text = 'Size: ' + String(li_size,'###,###,###') + ' KB'
Else
	st_size.text = ''
End If

//Added By Ken.Guo 09/17/2014
al_logo_height = Long(UnitsToPixels(al_logo_height, YUnitsToPixels!))
al_logo_width  = Long(UnitsToPixels(al_logo_width, XUnitsToPixels!))

st_h.text = 'H: ' + String(al_logo_height) 
st_w.text = 'W: ' + String(al_logo_width) 
end subroutine

public subroutine of_preview_pic (blob lb_file, ref long al_logo_height, ref long al_logo_width);
String ls_file_ext,ls_logo_file
Long ll_height,ll_width,li_size
IF Not IsNull(lb_file) THEN
	p_preview.SetPicture(lb_file)
	p_preview.OriginalSize = True
	al_logo_width = p_preview.Width
	al_logo_height = p_preview.Height
	
	IF al_logo_width > 1408 THEN
		p_preview.Width = 1408
		p_preview.Height = al_logo_height * (p_preview.Width/al_logo_width)
		p_preview.OriginalSize = False
	END IF
	
	IF al_logo_height > 876 THEN
		p_preview.Height = 876
		p_preview.Width = al_logo_width * (p_preview.Height/al_logo_height)
		p_preview.OriginalSize = False
	END IF
	
	p_preview.SetPicture(lb_file)
	

	st_zoom.Text = 'Zoom: ' + String(Int((p_preview.Width/al_logo_width) * 100)) + '%'
	li_size = Long(il_file_lenght/1024)
	IF li_size = 0 THEN li_size = 1
	If li_size > 0 Then
		st_size.Text = 'Size: ' + String(li_size,'###,###,###') + ' KB'
	Else
		st_size.text = ''
	End If
	
	//Added By Ken.Guo 09/17/2014
	al_logo_height = Long(UnitsToPixels(al_logo_height, YUnitsToPixels!))
	al_logo_width  = Long(UnitsToPixels(al_logo_width, XUnitsToPixels!))
	
	st_h.Text = 'H: ' + String(al_logo_height)
	st_w.Text = 'W: ' + String(al_logo_width)	
END IF


end subroutine

public subroutine of_set_default_color ();//Default Color //Added By Ken.Guo 09/15/2014
st_user_color.BackColor = RGB(66,66,66)
st_user_bk_color.BackColor = RGB(244,245,245)
st_version_color.BackColor = RGB(198,216,229)
st_version_bk_color.BackColor = RGB(42,134,199)


//Added By Jay Chen 03-17-2016
/*********
tab_1.tabpage_1.dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(66,66,66)))
tab_1.tabpage_1.dw_1.setitem(1, "fields_textcolor", RGB(66,66,66))
tab_1.tabpage_1.dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(244,245,245)))
tab_1.tabpage_1.dw_1.setitem(1, "fields_textbkcolor", RGB(244,245,245))

tab_1.tabpage_2.dw_2.modify("t_fields_textcolor.background.color = " + string(RGB(198,216,229)))
tab_1.tabpage_2.dw_2.setitem(1, "fields_textcolor", RGB(198,216,229))
tab_1.tabpage_2.dw_2.modify("t_fields_textbkcolor.background.color = " + string(RGB(42,134,199)))
tab_1.tabpage_2.dw_2.setitem(1, "fields_textbkcolor", RGB(42,134,199))

tab_1.tabpage_3.dw_3.modify("t_fields_textcolor.background.color = " + string(RGB(248,251,246)))
tab_1.tabpage_3.dw_3.setitem(1, "fields_textcolor", RGB(248,251,246))
tab_1.tabpage_3.dw_3.modify("t_fields_textbkcolor.background.color = " + string(RGB(134,196,64)))
tab_1.tabpage_3.dw_3.setitem(1, "fields_textbkcolor", RGB(134,196,64))

tab_1.tabpage_1.dw_1.setitem(1, "font_face", 'MS Sans Serif')
tab_1.tabpage_1.dw_1.setitem(1, "font_weight", '700')

tab_1.tabpage_2.dw_2.setitem(1, "font_weight", '700')
tab_1.tabpage_2.dw_2.setitem(1, "font_italic", '1')

tab_1.tabpage_3.dw_3.setitem(1, "font_face", 'MS Sans Serif')
tab_1.tabpage_3.dw_3.setitem(1, "font_weight", '700')
***********/
end subroutine

public subroutine of_save_color ();//Added By Ken.Guo 09/15/2014.
//gnv_user_option.of_set_option_value( 'splash_user_label_color', String(st_user_color.backcolor))
//gnv_user_option.of_set_option_value( 'splash_user_label_bk_color', String(st_user_bk_color.backcolor))
//gnv_user_option.of_set_option_value( 'splash_version_label_color', String(st_version_color.backcolor))
//gnv_user_option.of_set_option_value( 'splash_version_label_bk_color', String(st_version_bk_color.backcolor))

//Added By Jay Chen 03-15-2016
/**********
tab_1.tabpage_1.dw_1.accepttext()
tab_1.tabpage_2.dw_2.accepttext()
tab_1.tabpage_3.dw_3.accepttext()
gnv_user_option.of_set_option_value( 'splash_user_label_color', tab_1.tabpage_1.dw_1.describe("t_fields_textcolor.background.color"))
gnv_user_option.of_set_option_value( 'splash_user_label_bk_color', tab_1.tabpage_1.dw_1.describe("t_fields_textbkcolor.background.color"))
gnv_user_option.of_set_option_value( 'splash_version_label_color', tab_1.tabpage_2.dw_2.describe("t_fields_textcolor.background.color"))
gnv_user_option.of_set_option_value( 'splash_version_label_bk_color', tab_1.tabpage_2.dw_2.describe("t_fields_textbkcolor.background.color"))
gnv_user_option.of_set_option_value( 'splash_button_label_color', tab_1.tabpage_3.dw_3.describe("t_fields_textcolor.background.color"))
gnv_user_option.of_set_option_value( 'splash_button_label_bk_color', tab_1.tabpage_3.dw_3.describe("t_fields_textbkcolor.background.color"))

string ls_font_face1,ls_font_face2,ls_font_face3,ls_font_bold1,ls_font_bold2,ls_font_bold3
string ls_font_italic1,ls_font_italic2,ls_font_italic3,ls_font_underline1,ls_font_underline2,ls_font_underline3
ls_font_face1 = tab_1.tabpage_1.dw_1.getitemstring(1,"font_face")
ls_font_bold1 = tab_1.tabpage_1.dw_1.getitemstring(1,"font_weight")
ls_font_italic1 = tab_1.tabpage_1.dw_1.getitemstring(1,"font_italic")
ls_font_underline1 = tab_1.tabpage_1.dw_1.getitemstring(1,"font_underline")
ls_font_face2 = tab_1.tabpage_2.dw_2.getitemstring(1,"font_face")
ls_font_bold2 = tab_1.tabpage_2.dw_2.getitemstring(1,"font_weight")
ls_font_italic2 = tab_1.tabpage_2.dw_2.getitemstring(1,"font_italic")
ls_font_underline2 = tab_1.tabpage_2.dw_2.getitemstring(1,"font_underline")
ls_font_face3 = tab_1.tabpage_3.dw_3.getitemstring(1,"font_face")
ls_font_bold3 = tab_1.tabpage_3.dw_3.getitemstring(1,"font_weight")
ls_font_italic3 = tab_1.tabpage_3.dw_3.getitemstring(1,"font_italic")
ls_font_underline3 = tab_1.tabpage_3.dw_3.getitemstring(1,"font_underline")
gnv_user_option.of_set_option_value( 'splash_user_font_face',ls_font_face1)
gnv_user_option.of_set_option_value( 'splash_version_font_face',ls_font_face2)
gnv_user_option.of_set_option_value( 'splash_button_font_face',ls_font_face3)
gnv_user_option.of_set_option_value( 'splash_user_font_bold',ls_font_bold1)
gnv_user_option.of_set_option_value( 'splash_version_font_bold',ls_font_bold2)
gnv_user_option.of_set_option_value( 'splash_button_font_bold',ls_font_bold3)
gnv_user_option.of_set_option_value( 'splash_user_font_italic',ls_font_italic1)
gnv_user_option.of_set_option_value( 'splash_version_font_italic',ls_font_italic2)
gnv_user_option.of_set_option_value( 'splash_button_font_italic',ls_font_italic3)
gnv_user_option.of_set_option_value( 'splash_user_font_underline',ls_font_underline1)
gnv_user_option.of_set_option_value( 'splash_version_font_underline',ls_font_underline2)
gnv_user_option.of_set_option_value( 'splash_button_font_underline',ls_font_underline3)
gnv_user_option.of_system_save()
*************/
end subroutine

public subroutine of_set_default_property (string as_object);//Added By Jay Chen 03-18-2016
long ll_row
ll_row = dw_1.getrow()
if ll_row < 1 then return
choose case lower(as_object)
	case 'user name label'
		dw_1.setitem(ll_row,"fields_textcolor", RGB(66,66,66))
		dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(66,66,66)))
		dw_1.setitem(ll_row,"fields_textbkcolor", RGB(244,245,245))
		dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(244,245,245)))
		dw_1.setitem(1, "font_face", 'MS Sans Serif')
		dw_1.setitem(1, "font_weight", '700')
		dw_1.setitem(1, "font_italic", '0')
		dw_1.setitem(1, "font_underline", '0')
		dw_1.setitem(1, "x", 1152)
		dw_1.setitem(1, "y", 1168)
		dw_1.setitem(1, "width", 343)
		dw_1.setitem(1, "height", 60)
	case 'user name'
		dw_1.setitem(ll_row,"fields_textcolor", RGB(66,66,66))
		dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(66,66,66)))
		dw_1.setitem(ll_row,"fields_textbkcolor", RGB(255,255,255))
		dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(255,255,255)))
		dw_1.setitem(1, "font_face", 'MS Sans Serif')
		dw_1.setitem(1, "font_weight", '400')
		dw_1.setitem(1, "font_italic", '0')
		dw_1.setitem(1, "font_underline", '0')
		dw_1.setitem(1, "x", 1152)
		dw_1.setitem(1, "y", 1232)
		dw_1.setitem(1, "width", 713)
		dw_1.setitem(1, "height", 84)
	case 'password label'
		dw_1.setitem(ll_row,"fields_textcolor", RGB(66,66,66))
		dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(66,66,66)))
		dw_1.setitem(ll_row,"fields_textbkcolor", RGB(244,245,245))
		dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(244,245,245)))
		dw_1.setitem(1, "font_face", 'MS Sans Serif')
		dw_1.setitem(1, "font_weight", '700')
		dw_1.setitem(1, "font_italic", '0')
		dw_1.setitem(1, "font_underline", '0')
		dw_1.setitem(1, "x", 1152)
		dw_1.setitem(1, "y", 1336)
		dw_1.setitem(1, "width", 325)
		dw_1.setitem(1, "height", 60)
	case 'password'
		dw_1.setitem(ll_row,"fields_textcolor", RGB(66,66,66))
		dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(66,66,66)))
		dw_1.setitem(ll_row,"fields_textbkcolor", RGB(255,255,255))
		dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(255,255,255)))
		dw_1.setitem(1, "font_face", 'MS Sans Serif')
		dw_1.setitem(1, "font_weight", '400')
		dw_1.setitem(1, "font_italic", '0')
		dw_1.setitem(1, "font_underline", '0')
		dw_1.setitem(1, "x", 1152)
		dw_1.setitem(1, "y", 1400)
		dw_1.setitem(1, "width", 709)
		dw_1.setitem(1, "height", 84)
	case 'button ok'
		dw_1.setitem(ll_row,"fields_textcolor", RGB(248,251,246))
		dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(248,251,246)))
		dw_1.setitem(ll_row,"fields_textbkcolor", RGB(134,196,64))
		dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(134,196,64)))
		dw_1.setitem(1, "font_face", 'MS Sans Serif')
		dw_1.setitem(1, "font_weight", '700')
		dw_1.setitem(1, "font_italic", '0')
		dw_1.setitem(1, "font_underline", '0')
		dw_1.setitem(1, "x", 1509)
		dw_1.setitem(1, "y", 1552)
		dw_1.setitem(1, "width", 352)
		dw_1.setitem(1, "height", 92)
	case 'button cancel'
		dw_1.setitem(ll_row,"fields_textcolor", RGB(248,251,246))
		dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(248,251,246)))
		dw_1.setitem(ll_row,"fields_textbkcolor", RGB(134,196,64))
		dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(134,196,64)))
		dw_1.setitem(1, "font_face", 'MS Sans Serif')
		dw_1.setitem(1, "font_weight", '700')
		dw_1.setitem(1, "font_italic", '0')
		dw_1.setitem(1, "font_underline", '0')
		dw_1.setitem(1, "x", 1152)
		dw_1.setitem(1, "y", 1552)
		dw_1.setitem(1, "width", 352)
		dw_1.setitem(1, "height", 92)
	case 'version label'
		dw_1.setitem(ll_row,"fields_textcolor", RGB(198,216,229))
		dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(198,216,229)))
		dw_1.setitem(ll_row,"fields_textbkcolor", RGB(42,134,199))
		dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(42,134,199)))
		dw_1.setitem(1, "font_face", 'MS Sans Serif')
		dw_1.setitem(1, "font_weight", '700')
		dw_1.setitem(1, "font_italic", '1')
		dw_1.setitem(1, "font_underline", '0')
		dw_1.setitem(1, "x", 832)
		dw_1.setitem(1, "y", 1880)
		dw_1.setitem(1, "width", 1248)
		dw_1.setitem(1, "height", 92)
	case 'remember me' //Added By Ken.Guo 2016-06-22
		dw_1.setitem(ll_row,"fields_textcolor", RGB(66,66,66))
		dw_1.modify("t_fields_textcolor.background.color = " + string(RGB(66,66,66)))
		dw_1.setitem(ll_row,"fields_textbkcolor", RGB(244,245,245))
		dw_1.modify("t_fields_textbkcolor.background.color = " + string(RGB(244,245,245)))
		dw_1.setitem(1, "font_face", 'MS Sans Serif')
		dw_1.setitem(1, "font_weight", '400')
		dw_1.setitem(1, "font_italic", '0')
		dw_1.setitem(1, "font_underline", '0')
		dw_1.setitem(1, "x", 1160)
		dw_1.setitem(1, "y", 1552 + 92 + 10)
		dw_1.setitem(1, "width", 450)
		dw_1.setitem(1, "height", 60)
end choose








end subroutine

public subroutine of_load_property (string as_object);//Added By Jay Chen 03-18-2016
string ls_value,ls_parm
long ll_value,ll_row
ll_row = dw_1.getrow()
if ll_row < 1 then return
choose case lower(as_object)
	case 'user name label'
		ls_parm = 'splash_user_label_'
	case 'user name'
		ls_parm = 'splash_user_'
	case 'password label'
		ls_parm = 'splash_pwd_label_'
	case 'password'
		ls_parm = 'splash_pwd_'
	case 'button ok'
		ls_parm = 'splash_btn_ok_'
	case 'button cancel'
		ls_parm = 'splash_btn_cancel_'
	case 'version label'
		ls_parm = 'splash_version_label_'
	case 'remember me' //Added By Ken.Guo 2016-06-22
		ls_parm = 'splash_remember_me_'
end choose

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
if ls_parm = 'splash_pwd_label_' then
	if isnull(ls_value) or ls_value = '' then 
		ls_value = gnv_user_option.of_get_option_value('splash_user_label_color')
	end if
end if
if not isnull(ls_value) and ls_value <> '' then
	dw_1.modify("t_fields_textcolor.background.color = " + ls_value) 
	dw_1.setitem(1, "fields_textcolor", long(ls_value))
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
if ls_parm = 'splash_pwd_label_' then
	if isnull(ls_value) or ls_value = '' then 
		ls_value = gnv_user_option.of_get_option_value('splash_user_label_bk_color')
	end if
end if
if not isnull(ls_value) and ls_value <> '' then
	dw_1.modify("t_fields_textbkcolor.background.color = " + ls_value) 
	dw_1.setitem(1, "fields_textbkcolor", long(ls_value))
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
if ls_value = '?' or ls_value = '!' then ls_value = ''
if not isnull(ls_value) and ls_value <> '' then
	dw_1.setitem(1, "font_face", ls_value)
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
if ls_value = '?' or ls_value = '!' then ls_value = ''
if not isnull(ls_value) and ls_value <> '' then
	dw_1.setitem(1, "font_weight", ls_value)
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
if ls_value = '?' or ls_value = '!' then ls_value = ''
if not isnull(ls_value) and ls_value <> '' then
	dw_1.setitem(1, "font_italic", ls_value)
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
if ls_value = '?' or ls_value = '!' then ls_value = ''
if not isnull(ls_value) and ls_value <> '' then
	dw_1.setitem(1, "font_underline", ls_value)
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
if not isnull(ls_value) and ls_value <> '' then
	dw_1.setitem(1, "x", long(ls_value))
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
if not isnull(ls_value) and ls_value <> '' then
	dw_1.setitem(1, "y", long(ls_value))
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
if not isnull(ls_value) and ls_value <> '' then
	dw_1.setitem(1, "width", long(ls_value))
end if

ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
if not isnull(ls_value) and ls_value <> '' then
	dw_1.setitem(1, "height", long(ls_value))
end if
end subroutine

public subroutine of_save_property (string as_object);//Added By Jay Chen 03-18-2016
string ls_value,ls_parm
long ll_value,ll_row
ll_row = dw_1.getrow()
if ll_row < 1 then return
dw_1.accepttext()
choose case lower(as_object)
	case 'user name label'
		ls_parm = 'splash_user_label_'
	case 'user name'
		ls_parm = 'splash_user_'
	case 'password label'
		ls_parm = 'splash_pwd_label_'
	case 'password'
		ls_parm = 'splash_pwd_'
	case 'button ok'
		ls_parm = 'splash_btn_ok_'
	case 'button cancel'
		ls_parm = 'splash_btn_cancel_'
	case 'version label'
		ls_parm = 'splash_version_label_'
	case 'remember me' //Added By Ken.Guo 2016-06-22
		ls_parm = 'splash_remember_me_'
end choose

ll_value = dw_1.getitemnumber(1, "fields_textcolor")
if not isnull(ll_value) then
	gnv_user_option.of_set_option_value(ls_parm + 'color', string(ll_value))
end if

ll_value = dw_1.getitemnumber(1, "fields_textbkcolor")
if not isnull(ll_value) then
	gnv_user_option.of_set_option_value(ls_parm + 'bk_color', string(ll_value))
end if

ls_value = dw_1.getitemstring(1, "font_face")
if ls_value = '?' or ls_value = '!' then ls_value = ''
if not isnull(ls_value) and ls_value <> '' then
	gnv_user_option.of_set_option_value(ls_parm + 'font_face', ls_value)
end if

ls_value = dw_1.getitemstring(1, "font_weight")
if ls_value = '?' or ls_value = '!' then ls_value = ''
if not isnull(ls_value) and ls_value <> '' then
	gnv_user_option.of_set_option_value(ls_parm + 'font_weight', ls_value)
end if

ls_value = dw_1.getitemstring(1, "font_italic")
if ls_value = '?' or ls_value = '!' then ls_value = ''
if not isnull(ls_value) and ls_value <> '' then
	gnv_user_option.of_set_option_value(ls_parm + 'font_italic', ls_value)
end if

ls_value = dw_1.getitemstring(1, "font_underline")
if ls_value = '?' or ls_value = '!' then ls_value = ''
if not isnull(ls_value) and ls_value <> '' then
	gnv_user_option.of_set_option_value(ls_parm + 'font_underline', ls_value)
end if

ll_value = dw_1.getitemnumber(1, "x")
if not isnull(ll_value) and ll_value <> 0 then
	gnv_user_option.of_set_option_value(ls_parm + 'x', string(ll_value))
end if

ll_value = dw_1.getitemnumber(1, "y")
if not isnull(ll_value) and ll_value <> 0 then
	gnv_user_option.of_set_option_value(ls_parm + 'y', string(ll_value))
end if

ll_value = dw_1.getitemnumber(1, "width")
if not isnull(ll_value) and ll_value <> 0 then
	gnv_user_option.of_set_option_value(ls_parm + 'width', string(ll_value))
end if

ll_value = dw_1.getitemnumber(1, "height")
if not isnull(ll_value) and ll_value <> 0 then
	gnv_user_option.of_set_option_value(ls_parm + 'height', string(ll_value))
end if

gnv_user_option.of_system_save()


end subroutine

public subroutine of_intellicontractlayout ();//this.Resize(3770, 2476)
p_1.Move(0, -10)
p_1.Resize(3749, 2400)

sle_user_id.X = 1150
sle_password.X = sle_user_id.X
sle_user_id.Y = 1230
sle_password.Y = sle_user_id.Y + 168

st_1.X = sle_user_id.X//
st_2.X = sle_user_id.X
st_1.Y = sle_user_id.Y - st_1.Height - 4
st_2.Y = sle_password.Y - st_2.Height - 4
st_1.Text = "Username"
st_1.TextColor = RGB(66,66,66)
st_2.TextColor = RGB(66,66,66)
st_1.BackColor = RGB(244,245,245)
st_2.BackColor = RGB(244,245,245)

cb_2.X = sle_user_id.X
cb_1.X = sle_user_id.X + cb_2.Width + 4
cb_2.Y = sle_password.Y + 150
cb_1.Y = cb_2.Y
cb_1.Text = "&Login"
cb_1.TextColor = RGB(248,251,246)
cb_2.TextColor = RGB(248,251,246)
cb_1.BackColor = RGB(134,196,64)
cb_2.BackColor = RGB(134,196,64)

st_version.X = 832
st_version.Y = 1880

//Modified By Ken.Guo 12/16/2014
//st_version.Resize(1486, 152)
st_version.Resize(1250, 90)

st_version.TextColor = RGB(198,216,229)
st_version.BackColor = RGB(42,134,199)
st_version.Alignment = Left!
st_version.Show()

//Added By Ken.Guo 2016-06-22
cbx_remember.x = 1160
cbx_remember.y = cb_1.y + cb_1.height + 10
cbx_remember.TextColor = RGB(66,66,66)
cbx_remember.Backcolor = RGB(244,245,245)

end subroutine

public subroutine of_preview_property (string as_object);//Added By Jay Chen 03-18-2016
string ls_value,ls_parm
long ll_value

If Not isvalid(gnv_user_option) Then
	gnv_user_option = Create n_cst_user_option  
	gnv_user_option.of_system_retrieve( ) 
End If

choose case lower(as_object)
	case 'user name label'
		ls_parm = 'splash_user_label_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then st_1.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then st_1.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_1.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_1.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_1.italic = true
			else
				st_1.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_1.underline = true
			else
				st_1.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then st_1.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then st_1.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then st_1.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then st_1.height = long(ls_value)
	case 'user name'
		ls_parm = 'splash_user_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				sle_user_id.italic = true
			else
				sle_user_id.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				sle_user_id.underline = true
			else
				sle_user_id.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then sle_user_id.height = long(ls_value)
	case 'password label'
		ls_parm = 'splash_pwd_label_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if isnull(ls_value) or ls_value = '' then ls_value = gnv_user_option.of_get_option_value('splash_user_label_color')
		if not isnull(ls_value) and ls_value <> '' then st_2.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if isnull(ls_value) or ls_value = '' then ls_value = gnv_user_option.of_get_option_value('splash_user_label_bk_color')
		if not isnull(ls_value) and ls_value <> '' then st_2.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_2.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_2.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_2.italic = true
			else
				st_2.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_2.underline = true
			else
				st_2.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then st_2.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then st_2.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then st_2.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then st_2.height = long(ls_value)
	case 'password'
		ls_parm = 'splash_pwd_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then sle_password.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then sle_password.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				sle_password.italic = true
			else
				sle_password.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				sle_password.underline = true
			else
				sle_password.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then sle_password.height = long(ls_value)
	case 'button ok'
		ls_parm = 'splash_btn_ok_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cb_1.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cb_1.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cb_1.italic = true
			else
				cb_1.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cb_1.underline = true
			else
				cb_1.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then cb_1.height = long(ls_value)
	case 'button cancel'
		ls_parm = 'splash_btn_cancel_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cb_2.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cb_2.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cb_2.italic = true
			else
				cb_2.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cb_2.underline = true
			else
				cb_2.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then cb_2.height = long(ls_value)
	case 'version label'
		ls_parm = 'splash_version_label_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then st_version.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then st_version.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_version.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then st_version.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_version.italic = true
			else
				st_version.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				st_version.underline = true
			else
				st_version.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then st_version.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then st_version.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then st_version.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then st_version.height = long(ls_value)
	case 'remember me' //Added By Ken.Guo 2016-06-22
		ls_parm = 'splash_remember_me_'
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'color' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.textcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'bk_color' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.backcolor = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_face' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.facename = ls_value
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_weight' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.weight = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_italic' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cbx_remember.italic = true
			else
				cbx_remember.italic = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'font_underline' )
		if ls_value = '?' or ls_value = '!' then ls_value = ''
		if not isnull(ls_value) and ls_value <> '' then 
			if ls_value = '1' then
				cbx_remember.underline = true
			else
				cbx_remember.underline = false
			end if
		end if
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'x' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.x = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'y' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.y = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'width' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.width = long(ls_value)
		ls_value = gnv_user_option.of_get_option_value(ls_parm + 'height' )
		if not isnull(ls_value) and ls_value <> '' then cbx_remember.height = long(ls_value)		
end choose





end subroutine

on w_splah_screen_set.create
int iCurrent
call super::create
this.cbx_remember=create cbx_remember
this.cb_reset_pic=create cb_reset_pic
this.st_version=create st_version
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_password=create sle_password
this.st_2=create st_2
this.sle_user_id=create sle_user_id
this.st_1=create st_1
this.p_1=create p_1
this.ddlb_1=create ddlb_1
this.dw_1=create dw_1
this.st_10=create st_10
this.st_version_color=create st_version_color
this.st_8=create st_8
this.st_version_bk_color=create st_version_bk_color
this.st_user_bk_color=create st_user_bk_color
this.st_5=create st_5
this.st_user_color=create st_user_color
this.st_22=create st_22
this.cb_reset=create cb_reset
this.st_size=create st_size
this.cb_apply=create cb_apply
this.st_zoom=create st_zoom
this.st_w=create st_w
this.st_h=create st_h
this.sle_file=create sle_file
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_browse=create cb_browse
this.st_border=create st_border
this.p_preview=create p_preview
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_1=create gb_1
this.st_111=create st_111
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_remember
this.Control[iCurrent+2]=this.cb_reset_pic
this.Control[iCurrent+3]=this.st_version
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.sle_password
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.sle_user_id
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.p_1
this.Control[iCurrent+11]=this.ddlb_1
this.Control[iCurrent+12]=this.dw_1
this.Control[iCurrent+13]=this.st_10
this.Control[iCurrent+14]=this.st_version_color
this.Control[iCurrent+15]=this.st_8
this.Control[iCurrent+16]=this.st_version_bk_color
this.Control[iCurrent+17]=this.st_user_bk_color
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.st_user_color
this.Control[iCurrent+20]=this.st_22
this.Control[iCurrent+21]=this.cb_reset
this.Control[iCurrent+22]=this.st_size
this.Control[iCurrent+23]=this.cb_apply
this.Control[iCurrent+24]=this.st_zoom
this.Control[iCurrent+25]=this.st_w
this.Control[iCurrent+26]=this.st_h
this.Control[iCurrent+27]=this.sle_file
this.Control[iCurrent+28]=this.cb_cancel
this.Control[iCurrent+29]=this.cb_ok
this.Control[iCurrent+30]=this.cb_browse
this.Control[iCurrent+31]=this.st_border
this.Control[iCurrent+32]=this.p_preview
this.Control[iCurrent+33]=this.gb_2
this.Control[iCurrent+34]=this.gb_3
this.Control[iCurrent+35]=this.gb_4
this.Control[iCurrent+36]=this.gb_1
this.Control[iCurrent+37]=this.st_111
end on

on w_splah_screen_set.destroy
call super::destroy
destroy(this.cbx_remember)
destroy(this.cb_reset_pic)
destroy(this.st_version)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_password)
destroy(this.st_2)
destroy(this.sle_user_id)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.ddlb_1)
destroy(this.dw_1)
destroy(this.st_10)
destroy(this.st_version_color)
destroy(this.st_8)
destroy(this.st_version_bk_color)
destroy(this.st_user_bk_color)
destroy(this.st_5)
destroy(this.st_user_color)
destroy(this.st_22)
destroy(this.cb_reset)
destroy(this.st_size)
destroy(this.cb_apply)
destroy(this.st_zoom)
destroy(this.st_w)
destroy(this.st_h)
destroy(this.sle_file)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_browse)
destroy(this.st_border)
destroy(this.p_preview)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_1)
destroy(this.st_111)
end on

event close;call super::close;If Isvalid(inv_FileSrv) Then Destroy inv_FileSrv
end event

event open;call super::open;Blob  lb_splash_pic
long  ll_org_height,ll_org_width

//Added By Ken.Guo 2016-04-13
select set_9 into :il_setprod from icred_settings; 
If isnull(il_setprod) or  il_setprod = 4 then 
	p_1.picturename= "Contract-Splash.gif" 
	of_preview_logo("Contract-Splash.gif" ,ll_org_height,ll_org_width)	
	of_IntelliContractLayout() 
elseif il_setprod = 1 then
	p_1.picturename= "IntelliApp-Splash.gif" 
else
	p_1.picturename= "IntelliCred-Splash.gif"
end if


lb_splash_pic=of_get_pic_fromdb()
if not isnull(lb_splash_pic) then
	p_1.originalsize=false
	p_1.width=3749
	p_1.height=2400
	p_1.setpicture(lb_splash_pic)
end if

//lb_splash_pic = of_get_pic_fromdb()
//of_preview_pic(lb_splash_pic,ll_org_height,ll_org_width)


//Added By Jay Chen 03-15-2016
long ll_row

string ls_object
ddlb_1.reset()
for ll_row = 1 to 8
	ls_object = is_control[ll_row]
	ddlb_1.additem(ls_object)
next
ddlb_1.selectitem(1)
if dw_1.getrow() > 0 then ls_object = ddlb_1.text

//Added By Ken.Guo 09/15/2014
//Default Color 
//of_set_default_color()

dw_1.setitem(1, "object_name",ls_object)
of_set_default_property(ls_object) //Added By Jay Chen 03-18-2016
of_load_property(ls_object)

//Added By Ken.Guo 2016-04-13
Long ll_cnt
for ll_cnt = 1 to upperbound(is_control)
	of_preview_property(is_control[ll_cnt])
next
st_version.text = gnv_app.of_GetVersionLabel()
end event

type cbx_remember from checkbox within w_splah_screen_set
integer x = 1160
integer y = 1660
integer width = 450
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Remember me"
end type

type cb_reset_pic from commandbutton within w_splah_screen_set
integer x = 3817
integer y = 324
integer width = 325
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Reset"
end type

event clicked;Blob lb_file_data
string ls_object
Long ll_org_height,ll_org_width

If messagebox('Reset','Are you sure you want to reset the picture settings?? ', Question!, Yesno!) = 2 then Return
lb_file_data = Blob('0')
UpdateBlob ids  Set splash_picture = :lb_file_data;
IF sqlca.SQLCode <> 0 THEN
	MessageBox("Infor","Splash picture reset unsuccessfully!")
ELSE
//	This.Enabled = False
	p_preview.picturename='z:\asdfggas\a.jpg'
	
	//Added By Ken.Guo 2016-04-13
	If isnull(il_setprod) or  il_setprod = 4 then 
		p_1.picturename= "Contract-Splash.gif"
		of_preview_logo("Contract-Splash.gif" ,ll_org_height,ll_org_width)	
		p_1.originalsize = True
		of_IntelliContractLayout() 
	elseif il_setprod = 1 then
		p_1.picturename= "IntelliApp-Splash.gif" 
	else
		p_1.picturename= "IntelliCred-Splash.gif"
	end if	
	
	sle_file.text=''
	cb_apply.enabled=false
	p_preview.Width = 1408
	p_preview.Height = 876
//	st_h.Text = 'H: '+string(p_1.Height)
//	st_w.text= 'W: '+string(p_1.Width)
//	of_set_default_color() //Added By Ken.Guo 09/15/2014
 	//Added By Jay Chen 03-18-2016
//	ls_object = ddlb_1.text
//	dw_1.setitem(1, "object_name",ls_object)
//	of_set_default_property(ls_object) 
//	of_save_property(ls_object)
	//end
END IF
end event

type st_version from statictext within w_splah_screen_set
integer x = 55
integer y = 2304
integer width = 3579
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Bodoni MT"
boolean italic = true
long backcolor = 67108864
string text = "Product Version"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_2 from statictext within w_splah_screen_set
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
integer x = 1733
integer y = 1572
integer width = 352
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&Cancel"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_1 from statictext within w_splah_screen_set
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
integer x = 1371
integer y = 1572
integer width = 352
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "&OK"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type sle_password from singlelineedit within w_splah_screen_set
integer x = 1371
integer y = 1464
integer width = 709
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "123456"
boolean password = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_splah_screen_set
integer x = 1371
integer y = 1400
integer width = 325
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Password"
boolean focusrectangle = false
end type

type sle_user_id from singlelineedit within w_splah_screen_set
integer x = 1371
integer y = 1296
integer width = 713
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "user1"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_splah_screen_set
integer x = 1371
integer y = 1232
integer width = 343
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "User ID"
boolean focusrectangle = false
end type

type p_1 from picture within w_splah_screen_set
event lbuttondown pbm_lbuttondown
integer width = 3753
integer height = 2408
boolean originalsize = true
string picturename = "Contract-Splash.gif"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_splah_screen_set
integer x = 4183
integer y = 632
integer width = 805
integer height = 720
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
end type

event selectionchanged;//Added By Jay Chen 03-18-2016

string ls_object,ls_ori_object

if dw_1.getrow() < 1 then return

ls_ori_object = dw_1.getitemstring(1,"object_name")
of_save_property(ls_ori_object)

dw_1.setredraw(false)
dw_1.reset()
dw_1.insertrow(0)
ls_object = ddlb_1.text
dw_1.setitem(1, "object_name",ls_object)

of_set_default_property(ls_object) 
of_load_property(ls_object)
dw_1.setredraw(true)
end event

type dw_1 from datawindow within w_splah_screen_set
integer x = 3803
integer y = 880
integer width = 1262
integer height = 808
integer taborder = 50
string title = "none"
string dataobject = "d_login_screen_setting"
boolean border = false
boolean livescroll = true
end type

event clicked;//Added By Jay Chen 03-15-2016

Long ll_color
Long ll_default_color[]

if row < 1 then return
this.AcceptText()

choose case dwo.name
	case 't_fields_textcolor'
		gl_custom_colors[16] = RGB(66,66,66)// Parent.backcolor  //ButtonFace!
		ll_color = long(This.describe("t_fields_textcolor.background.color"))
		ChooseColor(ll_color,gl_custom_colors[])
		This.modify("t_fields_textcolor.background.color = " + string(ll_color) )
		This.setitem(1, "fields_textcolor", ll_color)
		cb_apply.enabled = True
	
	case 't_fields_textbkcolor'
		gl_custom_colors[16] = RGB(244,245,245)// Parent.backcolor  //ButtonFace!
		ll_color = long(This.describe("t_fields_textbkcolor.background.color"))
		ChooseColor(ll_color,gl_custom_colors[])
		This.modify("t_fields_textbkcolor.background.color = " + string(ll_color) )
		This.setitem(1, "fields_textbkcolor", ll_color)
		cb_apply.enabled = True
end choose

end event

event constructor;//Added By Jay Chen 03-15-2016
String ls_fonts[]
datawindowchild ldwc_fonts
int i,j
n_cst_appeondll lnv_appeon_dll


if this.getchild("font_face",ldwc_fonts) = 1 then
	lnv_appeon_dll.of_getfonts(ls_fonts)
	
	For i = 1 To UpperBound(ls_fonts[])
		If Trim(ls_fonts[i]) = '' Then Continue
		If i > 1 Then
			If ls_fonts[i - 1] = ls_fonts[i] Then Continue
		End If
		j = ldwc_fonts.InsertRow(0)
		ldwc_fonts.SetItem(j,1,ls_fonts[i])
	Next
	
	If ldwc_fonts.RowCount() = 0 Then
		ldwc_fonts.InsertRow(1)
		ldwc_fonts.SetItem(1,1,'MS Sans Serif')
	End If
	
	ldwc_fonts.SetSort('fonts_face A')
	ldwc_fonts.Sort()
	this.InsertRow(0)
end if
end event

event itemchanged;//Added By Jay Chen 03-15-2016
if row < 1 then return
if dwo.name = 'font_face' or dwo.name = 'font_weight' or dwo.name = 'font_italic' or dwo.name = 'font_underline' or dwo.name = 'x' or dwo.name = 'y' or dwo.name = 'width' or dwo.name = 'height' then
	cb_apply.enabled = true
end if
end event

event editchanged;//Added By Jay Chen 03-18-2016
If row> 0 Then
	If IsNull( data ) Or Trim( data ) = ''  Or Not IsNumber( data )  Then Return
	if dwo.name = 'x' or dwo.name = 'y' or dwo.name = 'width' or dwo.name = 'height' then
		AcceptText( )
	end if
End If
end event

type st_10 from statictext within w_splah_screen_set
integer x = 5175
integer y = 3336
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Text Color:"
boolean focusrectangle = false
end type

type st_version_color from statictext within w_splah_screen_set
integer x = 5431
integer y = 3336
integer width = 91
integer height = 68
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
gl_custom_colors[16] = RGB(198,216,229)//Parent.backcolor  //ButtonFace!
ll_color = This.backcolor
ChooseColor(ll_color,gl_custom_colors[])
This.backcolor = ll_color
cb_apply.enabled = True
end event

type st_8 from statictext within w_splah_screen_set
integer x = 5568
integer y = 3336
integer width = 402
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Background color:"
boolean focusrectangle = false
end type

type st_version_bk_color from statictext within w_splah_screen_set
integer x = 4672
integer y = 3020
integer width = 91
integer height = 68
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
gl_custom_colors[16] = RGB(42,134,199)//Parent.backcolor  //ButtonFace!
ll_color = This.backcolor
ChooseColor(ll_color,gl_custom_colors[])
This.backcolor = ll_color
cb_apply.enabled = True
end event

type st_user_bk_color from statictext within w_splah_screen_set
integer x = 4873
integer y = 3328
integer width = 91
integer height = 68
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
gl_custom_colors[16] = RGB(244,245,245)//Parent.backcolor  //ButtonFace!
ll_color = This.backcolor
ChooseColor(ll_color,gl_custom_colors[])
This.backcolor = ll_color
cb_apply.enabled = True
end event

type st_5 from statictext within w_splah_screen_set
integer x = 4466
integer y = 3328
integer width = 402
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Background color:"
boolean focusrectangle = false
end type

type st_user_color from statictext within w_splah_screen_set
integer x = 4325
integer y = 3328
integer width = 91
integer height = 68
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
gl_custom_colors[16] = RGB(66,66,66)// Parent.backcolor  //ButtonFace!
ll_color = This.backcolor
ChooseColor(ll_color,gl_custom_colors[])
This.backcolor = ll_color
cb_apply.enabled = True
end event

type st_22 from statictext within w_splah_screen_set
integer x = 4082
integer y = 3328
integer width = 283
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Text Color:"
boolean focusrectangle = false
end type

type cb_reset from commandbutton within w_splah_screen_set
integer x = 3817
integer y = 744
integer width = 325
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Reset"
end type

event clicked;Blob lb_file_data
string ls_object

ls_object = ddlb_1.text
If messagebox('Reset','Are you sure you want to reset the properties of the '+ls_object+' control? ', Question!, Yesno!) = 2 then Return

dw_1.setitem(1, "object_name",ls_object)
of_set_default_property(ls_object) 
of_save_property(ls_object)

//Added By Ken.Guo 2016-04-13
Long ll_cnt
for ll_cnt = 1 to upperbound(is_control)
	of_preview_property(is_control[ll_cnt])
next
end event

type st_size from statictext within w_splah_screen_set
integer x = 4407
integer y = 236
integer width = 283
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

type cb_apply from commandbutton within w_splah_screen_set
integer x = 4699
integer y = 2272
integer width = 421
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Apply&&Preview"
end type

event clicked;
Blob lb_file_data
Long ll_FileLen
String ls_new_name
String ls_verify_data
Int li_return
string ls_object
inv_FileSrv = Create n_cst_filesrvwin32

//IF il_logo_org_height <> 600 Or il_logo_org_width <> 820 THEN
//	li_return = MessageBox("Information","The picture may not be correctly displayed if its dimension is not 820*600. ",question!,yesno!,2)
//	IF li_return = 2 THEN RETURN 0
//	
//END IF

IF is_file_path <> '' THEN
	//Save logo to DB
	IF FileExists(is_file_path) THEN
		ll_FileLen = inv_FileSrv.of_FileRead(is_file_path, lb_file_data)
		IF ll_FileLen > 0 THEN
			UpdateBlob ids  Set splash_picture = :lb_file_data;
		END IF
	ELSE
		RETURN 0
	END IF
	
END IF
//of_save_color() //Added By Ken.Guo 09/15/2014
ls_object = ddlb_1.text
of_save_property(ls_object) //Added By Jay Chen 03-18-2016
cb_apply.enabled=false

//Added By Ken.Guo 2016-04-13
Long ll_cnt
for ll_cnt = 1 to upperbound(is_control)
	of_preview_property(is_control[ll_cnt])
next

RETURN 1

end event

type st_zoom from statictext within w_splah_screen_set
boolean visible = false
integer x = 5184
integer y = 1940
integer width = 283
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

type st_w from statictext within w_splah_screen_set
integer x = 3831
integer y = 236
integer width = 283
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

type st_h from statictext within w_splah_screen_set
integer x = 4119
integer y = 236
integer width = 283
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

type sle_file from singlelineedit within w_splah_screen_set
integer x = 4151
integer y = 108
integer width = 923
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

type cb_cancel from commandbutton within w_splah_screen_set
integer x = 4366
integer y = 2272
integer width = 325
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

type cb_ok from commandbutton within w_splah_screen_set
integer x = 4027
integer y = 2272
integer width = 325
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

event clicked;IF cb_apply.Enabled = True THEN
	IF cb_apply.Trigger Event Clicked() > 0 THEN
		Close(Parent)
	END IF
else
	Close(Parent)
END IF


end event

type cb_browse from commandbutton within w_splah_screen_set
integer x = 3817
integer y = 108
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
Integer i, li_cnt, li_rtn, li_filenum
Long ll_org_width,ll_org_height
n_getfilename ln_getfilename //Added By Jay Chen 08-15-2014
gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//li_rtn = GetFileOpenName("Select Logo File", &
//	ls_logo_path, ls_logo_file, "GIF", &
//	+ "GIF Files (*.GIF),*.GIF," &
//	+ "JPG Files (*.JPG),*.JPG," &
//	+ "All Files (*.*), *.*")
li_rtn = ln_getfilename.of_getopenfilename("Select Logo File", &
	ls_logo_path, ls_logo_file, "GIF", &
	+ "GIF Files (*.GIF),*.GIF," &
	+ "JPG Files (*.JPG),*.JPG," &
	+ "All Files (*.*), *.*")
gf_save_dir_path(ls_logo_path) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF li_rtn < 1 THEN RETURN

//IF Int(FileLength(ls_logo_path)/1024) > 500 THEN
//	MessageBox('Logo',"The logo file's size must less than 500K.")
//	RETURN
//END IF

sle_file.Text = ls_logo_path
Parent.SetRedraw(False)
of_preview_logo(ls_logo_path,ll_org_height,ll_org_width)

//Added By Ken.Guo 2016-04-13
p_1.originalsize = False 
p_1.picturename = ls_logo_path

cb_apply.enabled=true
cb_reset.enabled=true

il_file_lenght = FileLength(ls_logo_path)
is_file_path = ls_logo_path
is_file_name = ls_logo_file
is_file_ext = Right(ls_logo_file,3)
il_logo_org_height = ll_org_height
il_logo_org_width = ll_org_width
Parent.SetRedraw(True)





end event

type st_border from statictext within w_splah_screen_set
integer x = 6574
integer y = 2352
integer width = 1426
integer height = 888
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

type p_preview from picture within w_splah_screen_set
integer x = 6606
integer y = 2360
integer width = 1408
integer height = 876
boolean bringtotop = true
boolean originalsize = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
boolean map3dcolors = true
end type

event constructor;This.bringtotop = True
end event

type gb_2 from groupbox within w_splah_screen_set
integer x = 3781
integer y = 12
integer width = 1349
integer height = 452
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Picture Settings"
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_splah_screen_set
integer x = 4050
integer y = 3228
integer width = 960
integer height = 228
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "User Name && Password Label Settings"
end type

type gb_4 from groupbox within w_splah_screen_set
integer x = 5147
integer y = 3236
integer width = 960
integer height = 228
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Version Label Settings"
end type

type gb_1 from groupbox within w_splah_screen_set
integer x = 3781
integer y = 524
integer width = 1349
integer height = 1208
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Control Properties Settings:"
borderstyle borderstyle = styleraised!
end type

type st_111 from statictext within w_splah_screen_set
integer x = 3835
integer y = 636
integer width = 329
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Control Name:"
boolean focusrectangle = false
end type

