$PBExportHeader$w_library_mod.srw
forward
global type w_library_mod from window
end type
type cb_2 from commandbutton within w_library_mod
end type
type dw_1 from datawindow within w_library_mod
end type
type st_1 from statictext within w_library_mod
end type
type sle_1 from singlelineedit within w_library_mod
end type
type dw_list from datawindow within w_library_mod
end type
type cb_1 from commandbutton within w_library_mod
end type
end forward

global type w_library_mod from window
integer x = 59
integer y = 16
integer width = 2583
integer height = 2580
boolean titlebar = true
string title = "Library List"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
cb_2 cb_2
dw_1 dw_1
st_1 st_1
sle_1 sle_1
dw_list dw_list
cb_1 cb_1
end type
global w_library_mod w_library_mod

type variables
String is_library_list_file = "S:\Development\Version 4.current\library_list_intellicred03-03.txt"
end variables

on w_library_mod.create
this.cb_2=create cb_2
this.dw_1=create dw_1
this.st_1=create st_1
this.sle_1=create sle_1
this.dw_list=create dw_list
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.dw_1,&
this.st_1,&
this.sle_1,&
this.dw_list,&
this.cb_1}
end on

on w_library_mod.destroy
destroy(this.cb_2)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.dw_list)
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_2 from commandbutton within w_library_mod
integer x = 41
integer y = 232
integer width = 398
integer height = 108
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Import List"
end type

event clicked;dw_1.ImportFile( is_library_list_file )
end event

type dw_1 from datawindow within w_library_mod
integer x = 37
integer y = 1560
integer width = 2386
integer height = 732
integer taborder = 30
string dataobject = "d_library_import_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_library_mod
integer x = 46
integer y = 20
integer width = 247
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Directory"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_library_mod
integer x = 41
integer y = 88
integer width = 1696
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_list from datawindow within w_library_mod
integer x = 37
integer y = 376
integer width = 2386
integer height = 1156
integer taborder = 40
string dataobject = "d_library_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_library_mod
integer x = 466
integer y = 232
integer width = 398
integer height = 108
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Get Library List"
end type

event clicked;String ls_entries
String ls_dir
String ls_library
Integer i
Integer li_rc

li_rc = dw_1.RowCount( )

ls_dir = sle_1.Text

FOR i = 1 TO li_rc
	ls_library = dw_1.GetItemString( I, "library" )
	ls_library = Mid( ls_library, 1, Len( ls_library ) -1)
	ls_entries = LibraryDirectory( ls_library, DirAll! )
	dw_list.ImportString(ls_Entries)
END FOR
end event

