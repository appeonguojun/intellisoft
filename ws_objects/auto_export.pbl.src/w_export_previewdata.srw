$PBExportHeader$w_export_previewdata.srw
forward
global type w_export_previewdata from w_response
end type
type cb_1 from commandbutton within w_export_previewdata
end type
type dw_preview from u_dw within w_export_previewdata
end type
type cb_ok from commandbutton within w_export_previewdata
end type
end forward

global type w_export_previewdata from w_response
integer x = 214
integer y = 221
integer width = 3003
integer height = 1676
string title = "Preview Data"
cb_1 cb_1
dw_preview dw_preview
cb_ok cb_ok
end type
global w_export_previewdata w_export_previewdata

type variables

str_pass istr_pass
end variables

event open;call super::open;string ls_sny_retrieve, ls_presentation_str, ls_dwsyntax_str
string errors, ls_modify
integer i

//Modify 07/18/2007 by: Andy


//ls_sny_retrieve = Message.StringParm
istr_pass = Message.PowerObjectParm
if Not isValid(istr_pass) or IsNull(istr_pass) then return
ls_sny_retrieve = istr_pass.s_string
//end of Modify

ls_presentation_str = "style(type=grid)"

ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sny_retrieve, ls_presentation_str, Errors)
IF Len(Errors) > 0 THEN
	MessageBox("Caution", "SyntaxFromSQL caused these errors: " + Errors)
	Return -1
END IF

dw_preview.Create( ls_dwsyntax_str, Errors)
//dw_preview.create(istr_pass.s_dw.describe("datawidow.syntax"),Errors)
IF Len(Errors) > 0 THEN
	MessageBox("Caution", "SyntaxFromSQL caused these errors: " + Errors)
	Return -1
END IF
dw_preview.SetTransObject( SQLCA )
//comment 07/18/2007 by: Andy
//i = dw_preview.retrieve()
//IF i = 0 THEN
//	close( This )
//	Messagebox( "IntelliSoft", "No data returned." )
//	return;
//END IF
//end of comment

//Modify 07/23/2007 by: Andy
/*
ls_modify = "Destroy column rec_id destroy rec_id_t " + &
				"datawindow.grid.columnmove='no' " + &
				"datawindow.selected.mouse='no' " + &
				"datawindow.readonly = 'yes' " + &
				"DataWindow.Header.color='67108864'"
dw_preview.Modify( ls_modify )
*/

//Modify 07/27/2007 by: Andy
//dw_preview.Modify( "rec_id.visible = 0" )
ls_modify = "rec_id.visible = 0 " + &
				"datawindow.grid.columnmove='no' " + &
				"datawindow.selected.mouse='no' " + &
				"datawindow.readonly = 'yes' " + &
				"DataWindow.Header.color='67108864'"
dw_preview.Modify( ls_modify )

istr_pass.s_ds.sharedata(dw_preview)
//end of modify

end event

on w_export_previewdata.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_preview=create dw_preview
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_preview
this.Control[iCurrent+3]=this.cb_ok
end on

on w_export_previewdata.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_preview)
destroy(this.cb_ok)
end on

event close;call super::close;dw_preview.sharedataoff( )
end event

type cb_1 from commandbutton within w_export_previewdata
integer x = 23
integer y = 1472
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save SQL"
end type

event clicked;//Added By Ken.Guo 12/30/2011. 
If UpperBound(istr_pass.s_string_array[]) > 0 Then
	clipboard(istr_pass.s_string_array[1])
	messagebox("Saved","On Clipboard")
End If




end event

type dw_preview from u_dw within w_export_previewdata
integer width = 2990
integer height = 1448
integer taborder = 30
boolean hscrollbar = true
end type

event constructor;call super::constructor;ib_rmbmenu	= False
this.of_setupdateable(false)

of_setsort(true)
inv_sort.of_setcolumnheader(true)
end event

type cb_ok from commandbutton within w_export_previewdata
integer x = 2606
integer y = 1472
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean cancel = true
end type

event clicked;close( parent )
end event

