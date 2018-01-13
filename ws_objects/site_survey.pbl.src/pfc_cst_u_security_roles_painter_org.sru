$PBExportHeader$pfc_cst_u_security_roles_painter_org.sru
forward
global type pfc_cst_u_security_roles_painter_org from userobject
end type
type cb_save from u_cb within pfc_cst_u_security_roles_painter_org
end type
type cb_print from u_cb within pfc_cst_u_security_roles_painter_org
end type
type cb_close from u_cb within pfc_cst_u_security_roles_painter_org
end type
type st_3 from statictext within pfc_cst_u_security_roles_painter_org
end type
type st_2 from statictext within pfc_cst_u_security_roles_painter_org
end type
type st_1 from statictext within pfc_cst_u_security_roles_painter_org
end type
type dw_modules from u_dw within pfc_cst_u_security_roles_painter_org
end type
type dw_sub_modules from u_dw within pfc_cst_u_security_roles_painter_org
end type
type dw_actions from u_dw within pfc_cst_u_security_roles_painter_org
end type
type cb_new from u_cb within pfc_cst_u_security_roles_painter_org
end type
type dw_select_role from u_dw within pfc_cst_u_security_roles_painter_org
end type
type cb_delete from u_cb within pfc_cst_u_security_roles_painter_org
end type
type cb_copy from u_cb within pfc_cst_u_security_roles_painter_org
end type
type gb_1 from groupbox within pfc_cst_u_security_roles_painter_org
end type
type gb_select from groupbox within pfc_cst_u_security_roles_painter_org
end type
end forward

global type pfc_cst_u_security_roles_painter_org from userobject
integer width = 2715
integer height = 1596
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_save cb_save
cb_print cb_print
cb_close cb_close
st_3 st_3
st_2 st_2
st_1 st_1
dw_modules dw_modules
dw_sub_modules dw_sub_modules
dw_actions dw_actions
cb_new cb_new
dw_select_role dw_select_role
cb_delete cb_delete
cb_copy cb_copy
gb_1 gb_1
gb_select gb_select
end type
global pfc_cst_u_security_roles_painter_org pfc_cst_u_security_roles_painter_org

type variables
Integer ii_id = 1

w_security_roles_painter  iw_win
end variables

forward prototypes
public function integer of_set_parent_window (window aw_win)
public function integer of_save ()
public function integer of_new ()
public function integer of_delete ()
end prototypes

public function integer of_set_parent_window (window aw_win);iw_win = aw_win

RETURN 1
end function

public function integer of_save ();Integer li_retval

dw_actions.AcceptText()
li_retval = iw_win.Event pfc_save()
IF li_retval < 0 THEN
	Return -1
END IF

RETURN 1


end function

public function integer of_new ();n_ds lds_actions
n_ds lds_role
Integer li_row_cnt
Integer li_nr
Integer i
Integer li_rights_id
Integer li_next_role_id
String ls_role_name
DataWindowChild dwchild

Open( w_security_get_role_name )

ls_role_name = Message.StringParm

IF ls_role_name = "Cancel" THEN
	Return -1
END IF

This.SetRedraw( False )

SELECT Max( role_id )  
INTO :li_next_role_id  
FROM security_roles;

IF IsNull( li_next_role_id ) THEN
	li_next_role_id = 1
ELSE
	li_next_role_id ++
END IF

lds_actions = CREATE n_ds
lds_actions.DataObject = 'd_security_all_actions'
lds_actions.of_SetTransObject( SQLCA )
li_row_cnt = lds_actions.Retrieve()

lds_role = CREATE n_ds
lds_role.DataObject = 'd_dddw_security_roles'
lds_role.of_SetTransObject( SQLCA )
lds_role.InsertRow( 0 )
lds_role.SetItem( 1, "role_id", li_next_role_id )
lds_role.SetItem( 1, "role_name", ls_role_name )

IF lds_role.Update() = -1 THEN
	MessageBox( "Update Error", "Update to role table failed!" )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-01
	//$<modify> 01.13.2006 By: Wang Chao
	//$<reason> The Goto statement is currently unsupported.
	//$<modification> Copy the script associated with the GOTO label here.
	//GOTO ERROR
	Destroy lds_actions
	Destroy lds_role
	This.SetRedraw( True )
	
	Return -1
	//---------------------------- APPEON END ----------------------------	
END IF

dw_actions.Reset()

FOR i = 1 TO li_row_cnt
	li_nr = dw_actions.InsertRow( 0 )
	li_rights_id = gnv_app.of_get_id( "RIGHTS" )
	dw_actions.SetItem( li_nr, "security_roles_rights_rights_id", li_rights_id )
	dw_actions.SetItem( li_nr, "security_roles_rights_role_id", li_next_role_id )                                                                                                                                                                                                                                                                                    
	dw_actions.SetItem( li_nr, "security_roles_rights_action_id", lds_actions.GetItemNumber( i, "action_id" ) )
	IF lds_actions.GetItemNumber( i, "dddw_type" ) = 1 THEN
		dw_actions.SetItem( li_nr, "security_roles_rights_value_id", 1 )
	ELSE
		dw_actions.SetItem( li_nr, "security_roles_rights_value_id", 2 )
	END IF
END FOR

IF dw_actions.Update() = -1 THEN
	MessageBox( "Update Error", "Update to role table failed!" )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-02
	//$<modify> 01.13.2006 By: Wang Chao
	//$<reason> The Goto statement is currently unsupported.
	//$<modification> Copy the script associated with the GOTO label here.
	//GOTO ERROR
	Destroy lds_actions
	Destroy lds_role
	This.SetRedraw( True )
	
	Return -1
	//---------------------------- APPEON END ----------------------------	
END IF

dw_select_role.GetChild( "role_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve()
dw_select_role.SetItem( 1, "role_id", li_next_role_id )

ii_id = li_next_role_id
dw_modules.Retrieve( )

COMMIT USING SQLCA;

This.SetRedraw( True )

RETURN 1


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-03
//$<comment> 01.13.2006 By: Wang Chao
//$<reason> The Goto statement is currently unsupported.
//$<modification> Move the scripts to the location of GOTO ERROR.

//ERROR:
//DESTROY lds_actions
//DESTROY lds_role
//This.SetRedraw( True )
//
//RETURN -1
//---------------------------- APPEON END ----------------------------


end function

public function integer of_delete ();DataWindowChild dwchild
Integer li_ans

li_ans = MessageBox("Delete", "Are you sure you want to delete this role?", StopSign!, YesNo!, 2 )
IF li_ans = 2 THEN
	RETURN -1
END IF


DELETE FROM security_roles_rights
WHERE role_id = :ii_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF

DELETE FROM security_roles
WHERE role_id = :ii_id;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Database Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF


dw_actions.Reset()
dw_modules.Reset()
dw_sub_modules.Reset()

dw_select_role.GetChild( "role_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve()
dw_select_role.Reset()
dw_select_role.InsertRow( 0 )

RETURN 1
end function

on pfc_cst_u_security_roles_painter_org.create
this.cb_save=create cb_save
this.cb_print=create cb_print
this.cb_close=create cb_close
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_modules=create dw_modules
this.dw_sub_modules=create dw_sub_modules
this.dw_actions=create dw_actions
this.cb_new=create cb_new
this.dw_select_role=create dw_select_role
this.cb_delete=create cb_delete
this.cb_copy=create cb_copy
this.gb_1=create gb_1
this.gb_select=create gb_select
this.Control[]={this.cb_save,&
this.cb_print,&
this.cb_close,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_modules,&
this.dw_sub_modules,&
this.dw_actions,&
this.cb_new,&
this.dw_select_role,&
this.cb_delete,&
this.cb_copy,&
this.gb_1,&
this.gb_select}
end on

on pfc_cst_u_security_roles_painter_org.destroy
destroy(this.cb_save)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_modules)
destroy(this.dw_sub_modules)
destroy(this.dw_actions)
destroy(this.cb_new)
destroy(this.dw_select_role)
destroy(this.cb_delete)
destroy(this.cb_copy)
destroy(this.gb_1)
destroy(this.gb_select)
end on

event constructor;dw_actions.of_SetTransObject( SQLCA )
dw_modules.of_SetTransObject( SQLCA )
dw_select_role.of_SetTransObject( SQLCA )
dw_sub_modules.of_SetTransObject( SQLCA )
end event

type cb_save from u_cb within pfc_cst_u_security_roles_painter_org
integer x = 1961
integer y = 1444
integer width = 338
integer taborder = 60
string text = "&Save"
boolean default = true
end type

event clicked;Integer li_retval

li_retval = iw_win.Event pfc_save()
IF li_retval < 0 THEN
	Return 1
END IF


end event

type cb_print from u_cb within pfc_cst_u_security_roles_painter_org
integer x = 1595
integer y = 1444
integer width = 338
integer taborder = 50
string text = "&Print"
end type

type cb_close from u_cb within pfc_cst_u_security_roles_painter_org
integer x = 2322
integer y = 1444
integer width = 338
integer taborder = 40
string text = "Close"
boolean cancel = true
end type

event clicked;Close( iw_win )
end event

type st_3 from statictext within pfc_cst_u_security_roles_painter_org
integer x = 1710
integer y = 296
integer width = 325
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Access"
boolean focusrectangle = false
end type

type st_2 from statictext within pfc_cst_u_security_roles_painter_org
integer x = 891
integer y = 292
integer width = 325
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Function"
boolean focusrectangle = false
end type

type st_1 from statictext within pfc_cst_u_security_roles_painter_org
integer x = 69
integer y = 296
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Module"
boolean focusrectangle = false
end type

type dw_modules from u_dw within pfc_cst_u_security_roles_painter_org
integer x = 64
integer y = 360
integer width = 768
integer height = 960
integer taborder = 60
string dataobject = "d_security_modules"
end type

event constructor;This.of_SetUpdateAble( False )

end event

event retrieveend;call super::retrieveend;This.SelectRow( 1, True )

IF rowcount > 0 THEN
	dw_sub_modules.Retrieve( This.GetItemNumber( 1, "module_id" ) )
END IF
end event

event clicked;call super::clicked;Integer li_row

li_row = This.GetClickedRow()
IF li_row > 0 THEN
	This.SetRow( li_row )
	This.ScrollToRow( li_row )
END IF
end event

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow( 0, False )
This.SelectRow( currentrow, True )

IF This.RowCount() > 0 THEN
	Parent.SetRedraw( False )
	dw_sub_modules.Retrieve( This.GetItemNumber( currentrow, "module_id" ) )
	Parent.SetRedraw( True )
END IF



end event

event rowfocuschanging;call super::rowfocuschanging;Integer li_retval

li_retval = iw_win.Event pfc_save()
IF li_retval < 0 THEN
	Return 1
END IF


end event

type dw_sub_modules from u_dw within pfc_cst_u_security_roles_painter_org
integer x = 887
integer y = 360
integer width = 768
integer height = 960
integer taborder = 80
string dataobject = "d_security_sub_modules"
boolean vscrollbar = false
end type

event constructor;This.of_SetUpdateAble( False )

end event

event retrieveend;call super::retrieveend;This.SelectRow( 1, True )

IF rowcount > 0 THEN
	dw_actions.Retrieve( ii_id, This.GetItemNumber( 1, "sub_module_id" ) )
END IF
end event

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow( 0, False )
This.SelectRow( currentrow, True )

IF of_save() = -1 THEN
	Return 1
END IF

IF This.RowCount() > 0 THEN
	dw_actions.Retrieve( ii_id, This.GetItemNumber( currentrow, "sub_module_id" ) )
END IF



end event

type dw_actions from u_dw within pfc_cst_u_security_roles_painter_org
integer x = 1710
integer y = 360
integer width = 864
integer height = 960
integer taborder = 90
string dataobject = "d_security_actions"
boolean vscrollbar = false
end type

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow( 0, False )
This.SelectRow( currentrow, True )


end event

event retrieveend;call super::retrieveend;Integer i

IF rowcount > 0 THEN
	This.SelectRow( 1, True )
	FOR i = 1 TO rowcount
		IF This.GetItemNumber( i, "dddw_type" ) = 1 THEN
			This.SetItem( i, "value_id_1", This.GetItemNumber( i, "security_roles_rights_value_id" ) )
		ELSE
			This.SetItem( i, "value_id_2", This.GetItemNumber( i, "security_roles_rights_value_id" ) )
		END IF
	END FOR	
END IF

This.AcceptText()


end event

event clicked;call super::clicked;Integer li_row

li_row = This.GetClickedRow()
IF li_row > 0 THEN
	This.SetRow( li_row )
	This.ScrollToRow( li_row )
END IF
end event

event pfc_preupdate;call super::pfc_preupdate;Integer i
Integer li_row_cnt

li_row_cnt = This.RowCount()
This.SelectRow( 1, True )
FOR i = 1 TO li_row_cnt
	IF This.GetItemNumber( i, "dddw_type" ) = 1 THEN
		This.SetItem( i, "security_roles_rights_value_id", This.GetItemNumber( i, "value_id_1" ) )
	ELSE
		This.SetItem( i, "security_roles_rights_value_id", This.GetItemNumber( i, "value_id_2" ) )
	END IF
END FOR	

This.AcceptText()

RETURN AncestorReturnValue
end event

event itemchanged;call super::itemchanged;IF This.GetItemNumber( row, "dddw_type" ) = 1 THEN
	This.SetItem( row, "security_roles_rights_value_id", Integer( data ) )
ELSE
	This.SetItem( row, "security_roles_rights_value_id", Integer(data ) )
END IF
end event

type cb_new from u_cb within pfc_cst_u_security_roles_painter_org
integer x = 1207
integer y = 68
integer width = 338
integer taborder = 30
string text = "&Create Role"
end type

event clicked;of_new()
end event

type dw_select_role from u_dw within pfc_cst_u_security_roles_painter_org
integer x = 37
integer y = 68
integer width = 1143
integer height = 104
integer taborder = 10
string dataobject = "d_security_select_roles"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.Retrieve()
This.InsertRow( 0 )

This.of_SetUpdateable( False )
end event

event itemchanged;call super::itemchanged;This.AcceptText()
ii_id = Integer(data)


dw_modules.Retrieve( )
end event

type cb_delete from u_cb within pfc_cst_u_security_roles_painter_org
integer x = 1568
integer y = 68
integer width = 338
integer taborder = 100
string text = "&Delete Role"
end type

event clicked;of_delete()
end event

type cb_copy from u_cb within pfc_cst_u_security_roles_painter_org
integer x = 1925
integer y = 68
integer width = 338
integer taborder = 110
string text = "Copy &Role"
end type

event clicked;

//of_enable_select_buttons()
end event

type gb_1 from groupbox within pfc_cst_u_security_roles_painter_org
integer y = 220
integer width = 2651
integer height = 1164
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Role Settings"
end type

type gb_select from groupbox within pfc_cst_u_security_roles_painter_org
integer x = 5
integer width = 2647
integer height = 196
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Role"
end type

