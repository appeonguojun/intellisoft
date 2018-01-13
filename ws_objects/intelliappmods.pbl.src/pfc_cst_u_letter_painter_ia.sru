$PBExportHeader$pfc_cst_u_letter_painter_ia.sru
forward
global type pfc_cst_u_letter_painter_ia from pfc_cst_u_letter_painter
end type
type dw_path from u_dw within tabpage_browse
end type
end forward

global type pfc_cst_u_letter_painter_ia from pfc_cst_u_letter_painter
end type
global pfc_cst_u_letter_painter_ia pfc_cst_u_letter_painter_ia

on pfc_cst_u_letter_painter_ia.create
int iCurrent
call super::create
end on

on pfc_cst_u_letter_painter_ia.destroy
call super::destroy
end on

type cb_close from pfc_cst_u_letter_painter`cb_close within pfc_cst_u_letter_painter_ia
integer taborder = 60
end type

type cb_save from pfc_cst_u_letter_painter`cb_save within pfc_cst_u_letter_painter_ia
end type

event cb_save::clicked;call super::clicked;String ls_letter_path

ls_letter_path = tab_letter.tabpage_browse.dw_path.GetItemString( 1, "letter_path" )

UPDATE facility
SET letter_path = :ls_letter_path;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF




end event

type cb_print from pfc_cst_u_letter_painter`cb_print within pfc_cst_u_letter_painter_ia
end type

type cb_delete from pfc_cst_u_letter_painter`cb_delete within pfc_cst_u_letter_painter_ia
end type

type cb_add from pfc_cst_u_letter_painter`cb_add within pfc_cst_u_letter_painter_ia
end type

type tab_letter from pfc_cst_u_letter_painter`tab_letter within pfc_cst_u_letter_painter_ia
end type

type tabpage_browse from pfc_cst_u_letter_painter`tabpage_browse within tab_letter
dw_path dw_path
end type

on tabpage_browse.create
this.dw_path=create dw_path
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_path
end on

on tabpage_browse.destroy
call super::destroy
destroy(this.dw_path)
end on

type dw_1 from pfc_cst_u_letter_painter`dw_1 within tabpage_browse
end type

type st_1 from pfc_cst_u_letter_painter`st_1 within tabpage_browse
end type

type dw_browse from pfc_cst_u_letter_painter`dw_browse within tabpage_browse
integer height = 1356
end type

type tabpage_detail from pfc_cst_u_letter_painter`tabpage_detail within tab_letter
end type

type dw_detail from pfc_cst_u_letter_painter`dw_detail within tabpage_detail
end type

type dw_path from u_dw within tabpage_browse
integer x = 18
integer y = 1512
integer width = 2263
integer height = 112
integer taborder = 11
string dataobject = "d_get_letter_path"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.SetTransObject( SQLCA )
This.Retrieve( )

This.InsertRow( 0 )

This.Of_SetUpdateAble( False )
end event

