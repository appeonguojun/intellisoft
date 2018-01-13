$PBExportHeader$pfc_cst_u_multi_app_select.sru
forward
global type pfc_cst_u_multi_app_select from pfc_cst_u_multi_app_painter_new
end type
type cb_ok from commandbutton within pfc_cst_u_multi_app_select
end type
type cb_cancel from commandbutton within pfc_cst_u_multi_app_select
end type
type cb_1 from commandbutton within pfc_cst_u_multi_app_select
end type
type dw_action_type from u_dw within pfc_cst_u_multi_app_select
end type
type gb_3 from groupbox within pfc_cst_u_multi_app_select
end type
type gb_2 from groupbox within pfc_cst_u_multi_app_select
end type
type cb_2 from commandbutton within pfc_cst_u_multi_app_select
end type
end forward

global type pfc_cst_u_multi_app_select from pfc_cst_u_multi_app_painter_new
integer width = 3625
integer height = 2064
cb_ok cb_ok
cb_cancel cb_cancel
cb_1 cb_1
dw_action_type dw_action_type
gb_3 gb_3
gb_2 gb_2
cb_2 cb_2
end type
global pfc_cst_u_multi_app_select pfc_cst_u_multi_app_select

type variables
w_select_payor iw_win2
end variables

on pfc_cst_u_multi_app_select.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.cb_1=create cb_1
this.dw_action_type=create dw_action_type
this.gb_3=create gb_3
this.gb_2=create gb_2
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_action_type
this.Control[iCurrent+5]=this.gb_3
this.Control[iCurrent+6]=this.gb_2
this.Control[iCurrent+7]=this.cb_2
end on

on pfc_cst_u_multi_app_select.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.cb_1)
destroy(this.dw_action_type)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.cb_2)
end on

event constructor;call super::constructor;

CHOOSE CASE gi_intelliapp_type
		//SINGLE GROUP
	CASE 0
		dw_app_data.Modify( "parent_facility_t.text = 'Payor/Hospital'" )		
		//MULTI SITE GROUP
	CASE 1
		gb_3.Text = "Select Group and Payor/Hospital to Associate With Practitioner"
		dw_app_data.DataObject = "d_multi_app_list_new_billing"
		dw_app_data.SetTransObject( SQLCA )	
		dw_app_data.Modify( "parent_facility_t.text = 'Group'" )		
		//BILLING COMPANY
	CASE 2
		gb_3.Text = "Select Client and Payor/Hospital to Associate With Practitioner"		
		dw_app_data.DataObject = "d_multi_app_list_new_billing"
		dw_app_data.SetTransObject( SQLCA )		
		dw_app_data.Modify( "parent_facility_t.text = 'Client'" )		
END CHOOSE



end event

type cb_delete from pfc_cst_u_multi_app_painter_new`cb_delete within pfc_cst_u_multi_app_select
boolean visible = false
integer taborder = 130
end type

type cb_add from pfc_cst_u_multi_app_painter_new`cb_add within pfc_cst_u_multi_app_select
boolean visible = false
integer taborder = 120
end type

type cb_close from pfc_cst_u_multi_app_painter_new`cb_close within pfc_cst_u_multi_app_select
boolean visible = false
integer taborder = 110
end type

type cb_save from pfc_cst_u_multi_app_painter_new`cb_save within pfc_cst_u_multi_app_select
boolean visible = false
integer taborder = 50
end type

type dw_app_data from pfc_cst_u_multi_app_painter_new`dw_app_data within pfc_cst_u_multi_app_select
integer x = 55
integer y = 312
integer width = 2665
integer height = 1516
integer taborder = 40
string dataobject = "d_multi_app_list_new"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event dw_app_data::constructor;call super::constructor;This.of_SetUpdateAble( False )
end event

event dw_app_data::buttonclicked;call super::buttonclicked;Integer li_parent_facility
Integer i
Integer li_rc

li_parent_facility = This.GetItemNumber( row, "parent_facility_id" )

li_rc = This.RowCount( )


FOR i = 1 TO li_rc
	IF This.GetItemNumber( i, "parent_facility_id" ) = li_parent_facility THEN
		This.SetItem( i, "selected", 1 )
	END IF
END FOR


end event

type cb_new from pfc_cst_u_multi_app_painter_new`cb_new within pfc_cst_u_multi_app_select
boolean visible = false
integer taborder = 140
end type

type cb_3 from pfc_cst_u_multi_app_painter_new`cb_3 within pfc_cst_u_multi_app_select
boolean visible = false
integer taborder = 150
end type

type dw_select from pfc_cst_u_multi_app_painter_new`dw_select within pfc_cst_u_multi_app_select
integer width = 1088
end type

event dw_select::constructor;call super::constructor;DataWindowChild dwchild

This.GetChild( "multi_app_id", dwchild )
IF dwchild.RowCount() = 0 THEN
	MessageBox("Multi App", "You have not setup your Multi App Painter yet.  Go to System->Painter->Multi App Painter and setup before adding Payers." )
END IF

This.SetItem( 1, "multi_app_id", 1 )

dw_app_data.Retrieve( 1,gs_user_id )
of_enable_disable_objects( 1 )
ii_multi_app_id = 1
end event

type gb_1 from pfc_cst_u_multi_app_painter_new`gb_1 within pfc_cst_u_multi_app_select
integer x = 46
integer width = 1143
integer height = 200
integer taborder = 30
end type

type cb_ok from commandbutton within pfc_cst_u_multi_app_select
integer x = 389
integer y = 1900
integer width = 325
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;Long ll_lookup_code
Integer ll_set_to
Integer r
Integer li_rc
Integer i
Integer li_cnt

gs_pass_ids istr_ids

dw_app_data.AcceptText()

li_rc = dw_app_data.RowCount()

FOR i = 1 TO li_rc
	IF dw_app_data.GetItemNumber( i, "selected" ) = 1 THEN
		li_cnt++
		istr_ids.i_facility_ids[ li_cnt ] = dw_app_data.GetItemNumber( i, "parent_facility_id" )
		istr_ids.s_ids[ li_cnt ] = String( dw_app_data.GetItemNumber( i, "app_id" ) )
	END IF
END FOR

li_rc = dw_action_type.RowCount( )

dw_action_type.AcceptText( )

li_cnt = 0
FOR r = 1 to li_rc
	IF dw_action_type.GetItemString( r, "selected" ) = "1" THEN
		li_cnt++		
		istr_ids.s_action_type[ li_cnt ] = dw_action_type.GetItemString( r, "code" )		
	END IF
END FOR


CloseWithReturn ( iw_win2, istr_ids )
end event

type cb_cancel from commandbutton within pfc_cst_u_multi_app_select
integer x = 731
integer y = 1900
integer width = 325
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn ( iw_win2, "Cancel" )
end event

type cb_1 from commandbutton within pfc_cst_u_multi_app_select
integer x = 46
integer y = 1900
integer width = 325
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All"
end type

event clicked;Integer li_rc
Integer i
Integer li_cnt

gs_pass_ids istr_ids

dw_app_data.AcceptText()

li_rc = dw_app_data.RowCount()

FOR i = 1 TO li_rc
	IF This.Text = "Select All" THEN
		dw_app_data.SetItem( i, "selected", 1 )
	ELSE
		dw_app_data.SetItem( i, "selected", 0 ) 
	END IF
END FOR

IF This.Text = "Select All" THEN
	This.Text = "UnSelect All"
ELSE
	This.Text = "Select All"
END IF
end event

type dw_action_type from u_dw within pfc_cst_u_multi_app_select
integer x = 2816
integer y = 304
integer width = 727
integer height = 1560
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_ai_type_list"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_SetTraNsObject( SQLCA )
This.of_SetUpdateAble( False )
This.Retrieve( )

Integer li_found
li_found = This.Find( "code = 'App Out To MD'", 1, 1000 )

IF li_found > 0 THEN
	This.DeleteRow( li_found )
END IF
end event

event itemchanged;call super::itemchanged;IF This.GetItemString( row, "code" ) = 'App Out To MD' THEN
	MessageBox("Invalid Entry", "App Out To MD must be selected." )
	This.SetItem( row, "selected", 1 )
	Return 0
END IF
end event

type gb_3 from groupbox within pfc_cst_u_multi_app_select
integer x = 41
integer y = 244
integer width = 2688
integer height = 1632
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Payor/Hospital To Associate With Practitioner"
end type

type gb_2 from groupbox within pfc_cst_u_multi_app_select
integer x = 2789
integer y = 244
integer width = 777
integer height = 1636
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Action Items To Create"
end type

type cb_2 from commandbutton within pfc_cst_u_multi_app_select
integer x = 2793
integer y = 1900
integer width = 398
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save As Default"
boolean cancel = true
end type

event clicked;dw_action_type.Update()

//Long ll_lookup_code
//Integer ll_set_to
//Integer li_rc
//Integer r
//
//li_rc = dw_action_type.RowCount( )
//
//dw_action_type.AcceptText( )
//
//FOR r = 1 to li_rc
//	IF dw_action_type.GetItemNumber( r, "selected" ) = 1 THEN
//		ll_set_to = 1
//	ELSE
//		ll_set_to = 0
//	END IF
//	
//	ll_lookup_code = dw_action_type.GetItemNumber( r, "lookup_code" )
//	UPDATE code_lookup
//	SET custom_4 = :ll_set_to
//	WHERE lookup_code = :ll_lookup_code
//	USING SQLCA;
//
//END FOR
end event

