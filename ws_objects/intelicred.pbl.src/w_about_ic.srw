$PBExportHeader$w_about_ic.srw
forward
global type w_about_ic from window
end type
type shl_1 from statichyperlink within w_about_ic
end type
type st_6 from statictext within w_about_ic
end type
type st_4 from statictext within w_about_ic
end type
type cb_license_new from commandbutton within w_about_ic
end type
type st_5 from statictext within w_about_ic
end type
type cb_1 from commandbutton within w_about_ic
end type
type st_ver from statictext within w_about_ic
end type
type st_3 from statictext within w_about_ic
end type
type st_2 from statictext within w_about_ic
end type
type st_1 from statictext within w_about_ic
end type
type gb_1 from groupbox within w_about_ic
end type
type st_license from singlelineedit within w_about_ic
end type
end forward

global type w_about_ic from window
integer x = 823
integer y = 360
integer width = 2016
integer height = 1124
boolean titlebar = true
string title = "About"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
boolean center = true
shl_1 shl_1
st_6 st_6
st_4 st_4
cb_license_new cb_license_new
st_5 st_5
cb_1 cb_1
st_ver st_ver
st_3 st_3
st_2 st_2
st_1 st_1
gb_1 gb_1
st_license st_license
end type
global w_about_ic w_about_ic

on w_about_ic.create
this.shl_1=create shl_1
this.st_6=create st_6
this.st_4=create st_4
this.cb_license_new=create cb_license_new
this.st_5=create st_5
this.cb_1=create cb_1
this.st_ver=create st_ver
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.st_license=create st_license
this.Control[]={this.shl_1,&
this.st_6,&
this.st_4,&
this.cb_license_new,&
this.st_5,&
this.cb_1,&
this.st_ver,&
this.st_3,&
this.st_2,&
this.st_1,&
this.gb_1,&
this.st_license}
end on

on w_about_ic.destroy
destroy(this.shl_1)
destroy(this.st_6)
destroy(this.st_4)
destroy(this.cb_license_new)
destroy(this.st_5)
destroy(this.cb_1)
destroy(this.st_ver)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.st_license)
end on

event open;//Start Code Change ---- 03.13.2007 #V7 maha
if upper(appeongetclienttype())  = "WEB" then
	//gs_user_version =  "Version 7.0"   //Commented by Ken.Guo 04.09.2008
	gs_user_version = gnv_app.of_getversion( ) //Added By Ken.Guo 04.09.2008
	st_ver.text =  gs_user_version //Added By Ken.Guo 04.09.2008
else
	st_ver.text = gs_user_version
end if
//End Code Change---03.13.2007
st_1.text = w_mdi.title

if( left(gnv_session.is_license_key, 5) = "CLX15") then
	//Added By Mark Lee 10/17/2014
	st_license.text = String(gnv_session.is_license_key,'@@@ @@@@@ @@@@@@ @@@@@@ @@@@@@')
else
	st_license.text = String(gnv_session.is_license_key,'@@@ @@@@ @@@@@@@ @@@@@@@@')
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event doubleclicked;//MessageBox('Last Modify Date','2007-07-03    ')
end event

type shl_1 from statichyperlink within w_about_ic
integer x = 1170
integer y = 760
integer width = 759
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "http://www.fatcow.com/free-icons"
boolean focusrectangle = false
string url = "http://www.fatcow.com/free-icons"
end type

type st_6 from statictext within w_about_ic
integer x = 55
integer y = 760
integer width = 1115
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Part of the icons used in this application come from "
boolean focusrectangle = false
end type

type st_4 from statictext within w_about_ic
integer x = 55
integer y = 912
integer width = 315
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "License Key:"
boolean focusrectangle = false
end type

type cb_license_new from commandbutton within w_about_ic
integer x = 1225
integer y = 892
integer width = 398
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&New License..."
end type

event clicked;Open(w_install_module_update)
If Message.Stringparm = 'OK' Then	
	if( left(gnv_session.is_license_key, 5) = "CLX15") then
		//Added By Mark Lee 10/17/2014
		st_license.text = String(gnv_session.is_license_key,'@@@ @@@@@ @@@@@@ @@@@@@ @@@@@@')
	else
		st_license.text = String(gnv_session.is_license_key,'@@@ @@@@ @@@@@@@ @@@@@@@@')
	end if
End If
end event

type st_5 from statictext within w_about_ic
integer x = 686
integer y = 444
integer width = 594
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "www.contractlogix.com"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_about_ic
integer x = 1641
integer y = 892
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;close(parent)
end event

type st_ver from statictext within w_about_ic
integer x = 18
integer y = 644
integer width = 1966
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "version"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_about_ic
integer x = 530
integer y = 356
integer width = 910
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Contract Logix Inc"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_about_ic
integer x = 722
integer y = 556
integer width = 521
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Version Info: "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_about_ic
integer x = 18
integer y = 140
integer width = 1966
integer height = 120
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "IntelliCred for Windows"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_about_ic
integer y = 844
integer width = 2007
integer height = 8
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type st_license from singlelineedit within w_about_ic
integer x = 347
integer y = 916
integer width = 850
integer height = 56
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
boolean displayonly = true
end type

