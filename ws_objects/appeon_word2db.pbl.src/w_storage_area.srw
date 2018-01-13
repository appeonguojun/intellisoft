﻿$PBExportHeader$w_storage_area.srw
forward
global type w_storage_area from w_response
end type
type dw_1 from u_dw within w_storage_area
end type
type cb_3 from commandbutton within w_storage_area
end type
type cb_1 from commandbutton within w_storage_area
end type
end forward

global type w_storage_area from w_response
integer width = 2286
integer height = 900
string title = "Add Storage Area"
long backcolor = 67108864
string icon = "AppIcon!"
dw_1 dw_1
cb_3 cb_3
cb_1 cb_1
end type
global w_storage_area w_storage_area

type variables
Boolean ib_new
Boolean ib_save

end variables

on w_storage_area.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_3=create cb_3
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_1
end on

on w_storage_area.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.cb_1)
end on

event open;call super::open;dw_1.settransobject( SQLCA )

Long ll_area_id

ll_area_id = Message.Doubleparm

IF ll_area_id > 0 THEN
	THIS.title = "Edit Storage Area"
	ib_new = FALSE
	dw_1.Retrieve( ll_area_id )
ELSE
	THIS.title = "Add Storage Area"
	ib_new = TRUE
	dw_1.Insertrow( 0 )
END IF

end event

type dw_1 from u_dw within w_storage_area
integer x = 46
integer y = 52
integer width = 2158
integer height = 576
integer taborder = 10
string title = "none"
string dataobject = "d_sys_storage_area"
boolean vscrollbar = false
boolean livescroll = false
end type

event buttonclicked;call super::buttonclicked;String		ls_null, ls_folder
Integer 		li_result

SetNull( ls_null )

li_result = GetFolder( "", ls_folder )

IF li_result = 1 THEN
	IF Right(ls_folder, 1) <> "\" THEN ls_folder = ls_folder + "\"
	This.SetItem(1, "area_doc_path", ls_folder)
END IF

end event

type cb_3 from commandbutton within w_storage_area
integer x = 1938
integer y = 668
integer width = 265
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;IF ib_save THEN
	CLOSEWITHRETURN(PARENT,100)
ELSE
	CLOSE(PARENT)
END IF
end event

type cb_1 from commandbutton within w_storage_area
integer x = 1623
integer y = 668
integer width = 265
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;Long ll_max_area_id
Long ll_area_id
String ls_area_name
String ls_path

dw_1.accepttext( )

ls_area_name = dw_1.GetItemString(1, "area_name")
IF Isnull(ls_area_name) OR Trim(ls_area_name) = "" THEN
	Messagebox("Error", "Required information for Area Name.")
	Return
END IF

ls_path = dw_1.GetItemString(1, "area_doc_path")
IF Isnull(ls_path) OR Trim(ls_path) = "" THEN
	Messagebox("Error", "Required information for Area Doc Path.")
	Return
END IF

IF Right(ls_path, 1) <> "\" THEN
	ls_path = ls_path + "\"
	dw_1.SetItem(1, "area_doc_path", ls_path)
END IF

If dw_1.Modifiedcount( ) > 0 THEN
	ll_area_id = dw_1.GetItemNumber(1, "area_id")

	IF ib_new AND ( Isnull(ll_area_id) OR ll_area_id =0 ) THEN
		SELECT MAX(area_id) INTO :ll_max_area_id FROM sys_storage_area;
		IF ISNULL(ll_max_area_id) THEN ll_max_area_id = 0
		
		ll_max_area_id++
		
		dw_1.Setitem(1, "area_id", ll_max_area_id)
	END IF

	If dw_1.update( ) = 1 THen
		commit;
	End if
	
	ib_save = TRUE
END IF
end event

