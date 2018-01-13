$PBExportHeader$w_get_additional_info_pages.srw
forward
global type w_get_additional_info_pages from w_response
end type
type st_label from statictext within w_get_additional_info_pages
end type
type sle_pages from singlelineedit within w_get_additional_info_pages
end type
type cb_ok from commandbutton within w_get_additional_info_pages
end type
end forward

global type w_get_additional_info_pages from w_response
integer x = 1024
integer y = 804
integer width = 1678
integer height = 584
string title = "Additional Information Pages"
st_label st_label
sle_pages sle_pages
cb_ok cb_ok
end type
global w_get_additional_info_pages w_get_additional_info_pages

on w_get_additional_info_pages.create
int iCurrent
call super::create
this.st_label=create st_label
this.sle_pages=create sle_pages
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_label
this.Control[iCurrent+2]=this.sle_pages
this.Control[iCurrent+3]=this.cb_ok
end on

on w_get_additional_info_pages.destroy
call super::destroy
destroy(this.st_label)
destroy(this.sle_pages)
destroy(this.cb_ok)
end on

event open;call super::open;String ls_pages
Integer li_app_id

li_app_id = w_train_app.ii_app_id

SELECT additional_info_pages
INTO :ls_pages
FROM app_hdr  
WHERE app_hdr.app_id = :li_app_id 
USING w_train_app.tr_training_data;
IF w_train_app.tr_training_data.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return 0
END IF

sle_pages.Text = ls_pages
end event

type st_label from statictext within w_get_additional_info_pages
integer x = 64
integer y = 100
integer width = 1591
integer height = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Type in the page numbers that are used for additional information pages.  Example  12,13,14"
boolean focusrectangle = false
end type

type sle_pages from singlelineedit within w_get_additional_info_pages
integer x = 64
integer y = 252
integer width = 1102
integer height = 92
integer taborder = 10
boolean bringtotop = true
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

type cb_ok from commandbutton within w_get_additional_info_pages
integer x = 1189
integer y = 256
integer width = 247
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;String ls_pages
Integer li_app_id

li_app_id = w_train_app.ii_app_id

ls_pages = Trim( sle_pages.Text )

UPDATE app_hdr  
SET additional_info_pages = :ls_pages  
WHERE app_hdr.app_id = :li_app_id
USING w_train_app.tr_training_data;
IF w_train_app.tr_training_data.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	Return 0
END IF

Close( Parent )
end event

