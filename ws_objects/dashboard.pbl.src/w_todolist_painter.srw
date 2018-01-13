$PBExportHeader$w_todolist_painter.srw
$PBExportComments$To Do List Painter
forward
global type w_todolist_painter from w_sheet
end type
type cb_settings from commandbutton within w_todolist_painter
end type
type p_icon from picture within w_todolist_painter
end type
type cb_copy_detail from commandbutton within w_todolist_painter
end type
type cb_del_detail from commandbutton within w_todolist_painter
end type
type cb_add_detail from commandbutton within w_todolist_painter
end type
type dw_list from u_dw within w_todolist_painter
end type
type dw_title from u_dw within w_todolist_painter
end type
type cb_close from commandbutton within w_todolist_painter
end type
type cb_save from commandbutton within w_todolist_painter
end type
type cb_copy from commandbutton within w_todolist_painter
end type
type cb_del from commandbutton within w_todolist_painter
end type
type cb_properties from commandbutton within w_todolist_painter
end type
type cb_add from commandbutton within w_todolist_painter
end type
type dw_dashboard from u_dw within w_todolist_painter
end type
type gb_1 from groupbox within w_todolist_painter
end type
end forward

global type w_todolist_painter from w_sheet
integer width = 3973
integer height = 2232
string title = "To Do List Painter"
windowstate windowstate = maximized!
boolean center = true
cb_settings cb_settings
p_icon p_icon
cb_copy_detail cb_copy_detail
cb_del_detail cb_del_detail
cb_add_detail cb_add_detail
dw_list dw_list
dw_title dw_title
cb_close cb_close
cb_save cb_save
cb_copy cb_copy
cb_del cb_del
cb_properties cb_properties
cb_add cb_add
dw_dashboard dw_dashboard
gb_1 gb_1
end type
global w_todolist_painter w_todolist_painter

type variables
String is_Module
String is_edit_type = "Edit"	//Add Copy Edit

Long	il_TDL_id					//Change when:Select To Do List Name, Save detail.
Long	il_Dragdrop_Row			//the start row of drag.
Boolean ib_lButtonUp = True

n_cst_dm_utils inv_utils //Added By Ken.Guo 03/27/2013
end variables

forward prototypes
public function integer of_checkrequired ()
public subroutine of_set_icon ()
end prototypes

public function integer of_checkrequired ();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-14 By: Allen
//$<reason> Check Required before save
Long i
String ls_Display
IF dw_dashboard.Modifiedcount( ) < 1 THEN Return -1

IF Pos(dw_dashboard.GetItemString(1, 'verbiage'), "##") < 1 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04.24.2007 By: Jack
	//$<reason> Fix a defect.
	/*
	MessageBox(gnv_app.iapp_object.DisplayName, "There should be a ##")
	*/
	MessageBox(gnv_app.iapp_object.DisplayName, 'The value of "To Do Item Display Verbiage" must contain "##", for example, "You have ## contracts under review by CEO."')
	dw_dashboard.setfocus()
	dw_dashboard.setcolumn('verbiage')	
	//---------------------------- APPEON END ----------------------------
	RETURN -2
END IF

//If allow Drill Down, It should a display column at least.
IF dw_dashboard.GetItemString(1, "allow_drill_down") = "1" THEN
	FOR i = 1 TO 12
		ls_Display = dw_dashboard.GetItemString(1, "display" + String(i, "00"))
		IF Not IsNull(ls_Display) THEN Exit
	NEXT
	IF IsNull(ls_Display) And i = 13 THEN
		//MessageBox(gnv_app.iapp_object.DisplayName, "If allow Drill Down, It should a display column at least")
		MessageBox(gnv_app.iapp_object.DisplayName, "To allow Drill Down, it must be a display column.")
		Return -3
	END IF
END IF

//Check graph category title. it should input a value. Ken.Guo 2009-02-24
String ls_category
IF dw_dashboard.GetItemNumber(1, "use_graph") = 1 Then
	 ls_category = dw_dashboard.GetItemString(1,'graph_category') 
	 If ls_category = '' or isnull(ls_category) Then
		MessageBox(gnv_app.iapp_object.DisplayName, "You must input a value to Graph Category Title if Graph To Do Item is checked.")
		Return -4
	 End If
End If

Return 0
//---------------------------- APPEON END ----------------------------

end function

public subroutine of_set_icon ();//////////////////////////////////////////////////////////////////////
// $<function>w_todolist_painterof_set_icon()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description> Show Icon for current to do list item.
//////////////////////////////////////////////////////////////////////
// $<add> 2010-09-19 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long ll_icon_x,ll_icon_y
String ls_tv_icon,ls_pic_file
Boolean lb_from_picture_painter

If dw_dashboard.RowCount() <= 0 Then Return 
ll_icon_x = Long(dw_dashboard.Describe('t_icon_pos.x'))
ll_icon_y = Long(dw_dashboard.Describe('t_icon_pos.y'))

ls_tv_icon = dw_dashboard.GetItemString(1,'tv_icon')

If isnull(ls_tv_icon) or ls_tv_icon = '' Then
	p_icon.picturename = 'Custom039!'
	dw_dashboard.SetItem(1,'tv_icon','Custom039!')
ElseIf isnumber(ls_tv_icon) Then //From Picture Painter //Added By Ken.Guo 03/27/2013
	inv_utils.of_download_picture( Long(ls_tv_icon), ls_pic_file)
//	If FileExists(ls_pic_file) Then
//		p_icon.picturename = ls_pic_file
//	Else
//		p_icon.picturename = ''
//	End If
	p_icon.picturename = ""  //for reset SetRowFocusIndicator
//	lb_from_picture_painter = True
Else
	p_icon.picturename = ls_tv_icon
End If

dw_dashboard.SetRowFocusIndicator(p_icon,ll_icon_x,ll_icon_y)	
dw_dashboard.Modify( 'p_pic.filename = "' +ls_pic_file+ '"' )



end subroutine

on w_todolist_painter.create
int iCurrent
call super::create
this.cb_settings=create cb_settings
this.p_icon=create p_icon
this.cb_copy_detail=create cb_copy_detail
this.cb_del_detail=create cb_del_detail
this.cb_add_detail=create cb_add_detail
this.dw_list=create dw_list
this.dw_title=create dw_title
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cb_copy=create cb_copy
this.cb_del=create cb_del
this.cb_properties=create cb_properties
this.cb_add=create cb_add
this.dw_dashboard=create dw_dashboard
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_settings
this.Control[iCurrent+2]=this.p_icon
this.Control[iCurrent+3]=this.cb_copy_detail
this.Control[iCurrent+4]=this.cb_del_detail
this.Control[iCurrent+5]=this.cb_add_detail
this.Control[iCurrent+6]=this.dw_list
this.Control[iCurrent+7]=this.dw_title
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.cb_save
this.Control[iCurrent+10]=this.cb_copy
this.Control[iCurrent+11]=this.cb_del
this.Control[iCurrent+12]=this.cb_properties
this.Control[iCurrent+13]=this.cb_add
this.Control[iCurrent+14]=this.dw_dashboard
this.Control[iCurrent+15]=this.gb_1
end on

on w_todolist_painter.destroy
call super::destroy
destroy(this.cb_settings)
destroy(this.p_icon)
destroy(this.cb_copy_detail)
destroy(this.cb_del_detail)
destroy(this.cb_add_detail)
destroy(this.dw_list)
destroy(this.dw_title)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cb_copy)
destroy(this.cb_del)
destroy(this.cb_properties)
destroy(this.cb_add)
destroy(this.dw_dashboard)
destroy(this.gb_1)
end on

event pfc_preopen;call super::pfc_preopen;string ls_scale
long 	  ll_i

this.of_SetResize(TRUE)

this.inv_resize.of_SetOrigSize (this.workspacewidth( ) ,  this.workspaceheight( ) )
ls_scale = this.inv_resize.scale

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search user object
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

FOR LL_I =  1 TO UPPERBOUND(this.CONTrol)
   this.inv_resize.of_Register (this.CONTrol[LL_I]  , ls_scale	 )
NEXT
end event

event open;call super::open;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> 
dw_title.InsertRow(0)
dw_title.Event ue_refresh_dddw()
dw_title.SetFocus()

n_cst_tdl_function ln_cst_tdl_function
ln_cst_tdl_function.of_filter_module(dw_title)
//---------------------------- APPEON END ----------------------------
end event

event activate;call super::activate;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-14 By: Allen
//$<reason> Refresh Menu
If w_mdi.menuname <> "m_pfe_cst_mdi_menu" Then
	w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
	w_mdi.of_menu_security( w_mdi.MenuName )
END IF
//---------------------------- APPEON END ----------------------------
end event

event closequery;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.23.2007 By: Jack
//$<reason> Fix a defect.
If ib_closestatus = False Then
   cb_close.event clicked() 
End If
//---------------------------- APPEON END ----------------------------

end event

event close;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.24.2007 By: Jack
//$<reason> 

//---------------------------- APPEON END ----------------------------

end event

type cb_settings from commandbutton within w_todolist_painter
integer x = 3547
integer y = 216
integer width = 315
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Settings"
end type

event clicked;Open(w_todolist_settings)
end event

type p_icon from picture within w_todolist_painter
boolean visible = false
integer x = 1815
integer y = 784
integer width = 101
integer height = 80
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_copy_detail from commandbutton within w_todolist_painter
integer x = 3547
integer y = 592
integer width = 315
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> Copy TDLI_detail
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.10.2007 By: Machongmin
//$<reason> Fix a defect.	
/*
IF dw_dashboard.RowCount() < 1 THEN RETURN
*/
long ll_row

ll_row = dw_list.getrow()

If ll_row <= 0 Then	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 2007-08-21 By: Evan
	//$<Reason> Prompt agreement.
	//MessageBox(gnv_app.iapp_object.DisplayName, "Please first select a To Do Item.")
	MessageBox(gnv_app.iapp_object.DisplayName, "Please select a To Do List Name.")
	//---------------------------- APPEON END ----------------------------		
	Return -1
End If
//---------------------------- APPEON END ----------------------------


IF (is_edit_type = "Add" OR is_edit_type = "Copy") Then Return

is_edit_type = "Copy"
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.10.2007 By: Machongmin
//$<reason> Fix a defect.
//Long ll_Row
//---------------------------- APPEON END ----------------------------
ll_Row = dw_List.InsertRow(0)
dw_List.SetRow(ll_Row)
dw_List.ScrollToRow(ll_Row)
dw_List.SetItem(ll_Row, "TDL_Sort", ll_Row)

dw_dashboard.SetItem(1, "Verbiage", "")
dw_dashboard.SetItem(1, "TDL_Sort", ll_Row)
dw_dashboard.SetFocus()

dw_dashboard.SetItemStatus(1, 0, Primary!, New!)
//---------------------------- APPEON END ----------------------------

end event

type cb_del_detail from commandbutton within w_todolist_painter
integer x = 3547
integer y = 500
integer width = 315
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> delete TDL_detail

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.10.2007 By: Machongmin
//$<reason> Fix a defect.	
/*
IF dw_dashboard.RowCount() < 1 THEN RETURN
*/
long ll_row

ll_row = dw_list.getrow()

If ll_row <= 0 Then	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 2007-08-21 By: Evan
	//$<Reason> Prompt agreement.
	//MessageBox(gnv_app.iapp_object.DisplayName, "Select a To Do Item, please")
	MessageBox(gnv_app.iapp_object.DisplayName, "Please select a To Do List Name.")
	//---------------------------- APPEON END ----------------------------	
	Return -1
End If
//---------------------------- APPEON END ----------------------------



//Reset while Add/Copy
IF (is_edit_type = "Add" OR is_edit_type = "Copy") Then
	IF IsNull(dw_dashboard.GetItemNumber(1, "tdli_id")) THEN
		dw_dashboard.Reset()
	END IF
Else
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 2007-08-21 By: Evan
	//$<Reason> Prompt incorrect.	
	//IF MessageBox(gnv_app.iapp_object.DisplayName, "Do you want delete the record?", Question!, YesNo!) = 1 THEN
	IF MessageBox(gnv_app.iapp_object.DisplayName, "Are you sure you want to delete this record?", Question!, YesNo!) = 1 THEN
	//---------------------------- APPEON END ----------------------------
		dw_dashboard.DeleteRow(0)
		IF dw_dashboard.Update() = 1 THEN
			COMMIT;
		END IF
	ELSE
		Return
	END IF
End IF

//Refresh display of dw_list
dw_list.DeleteRow(0)

IF dw_list.RowCount() > 0 THEN
	IF dw_list.GetRow() = 1 THEN
		dw_dashboard.Retrieve(il_TDL_id, dw_list.GetItemNumber(1, 'Tdli_id'))
		dw_list.SelectRow( 1, True)
	ELSE
		dw_list.ScrollToRow(1)
	END IF
END IF
dw_list.SetFocus()

is_edit_type = "Edit"
//---------------------------- APPEON END ----------------------------
end event

type cb_add_detail from commandbutton within w_todolist_painter
integer x = 3547
integer y = 408
integer width = 315
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> Insert Row in detail
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.10.2007 By: Machongmin
//$<reason> Fix a defect.	
If IsNull(dw_title.GetItemNumber(1, "tdl_id")) OR dw_title.GetItemNumber(1, "tdl_id") < 1 Then	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 2007-08-21 By: Evan
	//$<Reason> Prompt agreement.
	//MessageBox(gnv_app.iapp_object.DisplayName, "Select a To Do List Name, please")
	MessageBox(gnv_app.iapp_object.DisplayName, "Please select a To Do List Name.")
	//---------------------------- APPEON END ----------------------------	
	Return -1
End If
//---------------------------- APPEON END ----------------------------

IF is_edit_type = "Add" OR is_edit_type = "Copy" THEN RETURN

If IsNull(dw_title.GetItemNumber(1, "tdl_id")) OR dw_title.GetItemNumber(1, "tdl_id") < 1 Then	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 2007-08-21 By: Evan
	//$<Reason> Prompt agreement.
	//MessageBox(gnv_app.iapp_object.DisplayName, "Select a To Do List Name, please")
	MessageBox(gnv_app.iapp_object.DisplayName, "Please select a To Do List Name.")
	//---------------------------- APPEON END ----------------------------
	Return -1
End If
is_edit_type = "Add"

Long ll_Row
ll_Row = dw_List.InsertRow(0)
dw_List.SetRow(ll_Row)
dw_List.ScrollToRow(ll_Row)

dw_dashboard.Reset()
dw_dashboard.InsertRow(0)
dw_dashboard.SetFocus()

dw_dashboard.SetItem(1, "TDL_Sort", ll_Row)
dw_list.Setitem(ll_Row, 'tdl_sort', ll_Row)
//---------------------------- APPEON END ----------------------------
end event

type dw_list from u_dw within w_todolist_painter
event mousemove_dw pbm_dwnmousemove
integer x = 50
integer y = 224
integer width = 3474
integer height = 456
integer taborder = 110
string dragicon = "DataPipeline!"
string title = "Select To Do Item"
string dataobject = "d_dashboard_detail_list"
boolean ib_isupdateable = false
string is_updatesallowed = ""
end type

event mousemove_dw;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-11 By: Allen
//$<reason> Sort the list
IF row > 0 And Not ib_lButtonUp THEN
	IF IsNull(GetItemNumber(Row, "tdli_id")) THEN RETURN	//New Row don't drag
	
	il_Dragdrop_Row = Row
	This.Drag(Begin! )
END IF
//---------------------------- APPEON END ----------------------------
end event

event rowfocuschanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> 
Long ll_TDLI_id
String ls_tv_icon
If currentrow < 1 Then Return
ll_TDLI_id = GetItemNumber(currentrow, 'tdli_id')
IF Not IsNull(ll_TDLI_id) THEN
	dw_dashboard.SetRedraw(False)
	IF dw_dashboard.Retrieve(il_TDL_id, ll_TDLI_id) > 0 Then
		//Populate dddw of Perform Function
		Datawindowchild ldwc_Child
		String ls_Moveto
		ls_Moveto = dw_dashboard.GetItemString(1, "moveto")
		dw_dashboard.GetChild( "Perform", ldwc_Child)
		IF Len(ls_Moveto) > 0 Then
			ldwc_Child.SetFilter("movetoid = '00' or movetoid = '"+ls_Moveto+"'")
		ELSE
			ldwc_Child.SetFilter("movetoid = '00'")
		END IF
		ldwc_Child.Filter()
		
		//Check Verbiage & Sort
		This.SetItem(CurrentRow, "Tdl_Sort", dw_dashboard.GetItemNumber(1,"Tdl_Sort"))
		This.SetItem(CurrentRow, "verbiage", dw_dashboard.GetItemString(1,"verbiage"))

	END IF
	dw_dashboard.SetRedraw(True)
END IF

of_set_icon()

This.SelectRow( 0, False)
This.SelectRow( currentrow, True)
ib_lButtonUp = True
//---------------------------- APPEON END ----------------------------
end event

event rowfocuschanging;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-29 By: Allen
//$<reason> Prompt if To Do Item have not saved
IF CurrentRow < 1 OR NewRow < 1 THEN Return
IF (is_edit_type = "Add" OR is_edit_type = "Copy") Then
	IF IsNull(GetItemNumber(CurrentRow, "tdli_id")) THEN
		is_edit_type = "Edit"
		Post DeleteRow(CurrentRow)
		dw_dashboard.Reset()
	END IF
End If
//---------------------------- APPEON END ----------------------------
end event

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-30 By: Allen
//$<reason> Not update this dw
This.of_SetUpdateable(False)
This.of_Setbase(False)
//---------------------------- APPEON END ----------------------------
end event

event other;call super::other;//------------------------------------------------------------- 
// Check to see if the title bar for this datawindow has been 
// clicked and prevent it
//-------------------------------------------------------------
If Message.WordParm = 61458 Then 
		Message.Processed = True
		Message.ReturnValue = 0 
End If
end event

event dragdrop;call super::dragdrop;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-11 By: Allen
//$<reason> Dragdrop
IF row > 0 THEN
	this.SetRedraw(False)
	Long i, ll_Row
	IF il_Dragdrop_Row = Row THEN
		this.SetRedraw(True)
		RETURN
	ELSEIF il_Dragdrop_Row < Row THEN	//Drag Down
		RowsMove(il_Dragdrop_Row, il_Dragdrop_Row, Primary!, this, Row + 1, Primary!)
	ELSE											//Drag Up
		RowsMove(il_Dragdrop_Row, il_Dragdrop_Row, Primary!, this, Row, Primary!)
	END IF

	SetRow(Row)
	SelectRow(0, False)
	SelectRow(Row, True)
	
	ll_Row = RowCount()
	FOR i = 1 To ll_Row
		SetItem(i, "tdl_sort", i)
	NEXT
	
	gnv_appeondb.of_autocommit( )
	IF this.Update() = 1 THEN
		COMMIT;
	END IF
	this.SetRedraw(True)
END IF
//---------------------------- APPEON END ----------------------------
end event

event lbuttondown;ib_lButtonUp = False
end event

event lbuttonup;ib_lButtonUp = True
end event

type dw_title from u_dw within w_todolist_painter
event type integer ue_refresh_dddw ( )
integer x = 137
integer y = 36
integer width = 1733
integer height = 160
integer taborder = 10
string title = "none"
string dataobject = "d_dashboard_title"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbfocuschange = false
string is_updatesallowed = ""
end type

event type integer ue_refresh_dddw();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> Refresh the dddw of tdl_name
DatawindowChild ldwc_child
This.GetChild("tdl_id", ldwc_child)
ldwc_child.SetTransObject(Sqlca)
ldwc_child.SetFilter("module = '" + is_Module + "'")
ldwc_child.Filter()

Return ldwc_child.Retrieve()
//---------------------------- APPEON END ----------------------------
end event

event itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> 
CHOOSE CASE Lower(dwo.Name)
	CASE 'module'
		is_Module = data
		
		DatawindowChild ldwc_child
		This.GetChild("tdl_id", ldwc_child)
		ldwc_child.SetFilter('Module = "' + is_Module + '"')
		ldwc_child.Filter()
		
		Long ll_Null
		SetNull(ll_Null)
		this.SetItem(1, "tdl_id", ll_Null)
		
		SetColumn("tdl_id")
		dw_list.Reset()
		dw_dashboard.Reset()
		//<add> andy 06/072007
		dw_dashboard.Event ue_refresh_dddw(False)
		//end of add
	CASE 'tdl_id'
		/*comment by andy 06/07/2007
		IF IsNull(GetItemNumber(1, 'tdl_id')) THEN
			dw_dashboard.Event ue_refresh_dddw(False)
		END IF
		*/
		
		il_TDL_id = Long(data)
		dw_list.Reset()
		IF dw_list.Retrieve(il_TDL_id) > 0 THEN
			dw_list.SelectRow( 0, False)
			dw_list.SelectRow( 1, True)
		ELSE
			dw_dashboard.Reset()
		END IF
		is_edit_type = "Edit"
END CHOOSE
//---------------------------- APPEON END ----------------------------
end event

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-30 By: Allen
//$<reason> Not update this dw
This.of_SetUpdateable(False)
This.of_Setbase(False)
//---------------------------- APPEON END ----------------------------
end event

type cb_close from commandbutton within w_todolist_painter
integer x = 3547
integer y = 92
integer width = 315
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.23.2007 By: Jack
//$<reason> Fix a defect.
/*
Close(Parent)
*/
int li_mes

//--------------------------- APPEON BEGIN ---------------------------
//$<Delete> 08.22.2007 By: Evan
//$<Reason> APB will throw an error after accept text when 'verbiage' is required field.
//dw_dashboard.accepttext( )
//---------------------------- APPEON END ----------------------------

If dw_dashboard.modifiedcount() > 0 Or dw_dashboard.deletedcount() > 0 Then
	li_mes = messagebox('ContractLogix','Do you want to save changes?',Question!,YesNoCancel!)
	If li_mes = 1 Then
		If cb_save.event clicked() = - 1 Then
			Return 
		Else
		   close(parent)
		End If
	Elseif li_mes = 2 then
		ib_closestatus = True
		close(parent)
	Else
		Return -1
	End If
Else
	close(parent)	
End If
//---------------------------- APPEON END ----------------------------

end event

type cb_save from commandbutton within w_todolist_painter
integer x = 3547
integer y = 312
integer width = 315
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> Save TDL_detail
Long ll_Max_id

IF dw_dashboard.accepttext() < 1 THEN return -1
//
//Check the input
IF of_CheckRequired() < 0 THEN RETURN -1

IF is_edit_type = "Edit" THEN
ELSE
	Select IsNull(Max(TDLI_id) + 1, 1) into :ll_Max_id From TDL_detail Where TDL_id = :il_Tdl_id;
	dw_dashboard.Setitem( 1, 'tdli_id', ll_Max_id)
	dw_dashboard.Setitem( 1, 'tdl_id', il_TDL_id)
	
	dw_List.SetItem(dw_list.GetRow(), "tdli_id", ll_Max_id)	//Need the id when RowChanged()
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.27.2007 By: Frank.Gui
//$<reason> Using PFC style code.
/*IF dw_dashboard.Update( ) = 1 THEN
	Commit;
END IF
*/
IF parent.event pfc_save() < 1 then return
//---------------------------- APPEON END ----------------------------



//locate row after sort
Long ll_Row, ll_tdli_id
ll_Row = dw_list.GetRow()
ll_tdli_id = dw_list.GetItemNumber(ll_Row, "Tdli_id")
dw_list.Retrieve(il_TDL_id) //Added By Jay Chen 02-25-2014 Remark:refresh detail list data
dw_list.SetSort("TDL_Sort A")
dw_list.Sort()
ll_Row = dw_list.Find("tdli_id = " + String(ll_tdli_id),1, dw_list.RowCount())
IF ll_Row > 0 THEN
	dw_list.ScrollToRow(ll_Row)
	dw_list.SetRow(ll_Row)
END IF

is_edit_type = "Edit"
//---------------------------- APPEON END ----------------------------
end event

type cb_copy from commandbutton within w_todolist_painter
integer x = 3159
integer y = 92
integer width = 315
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "C&opy"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-30 By: Allen
//$<reason> Copy with To Do List Item and Role data.
Long	ll_TDL_ID, ll_TDL_ID_New

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.10.2007 By: Machongmin
//$<reason> Fix a defect.	
ll_TDL_ID = dw_title.GetItemNumber(1, "TDL_id")
If IsNull(ll_tdl_id) or ll_tdl_id < 0 Then 
	MessageBox(gnv_app.iapp_object.DisplayName, "Please first select a To Do List.")
	Return -1
End If
//---------------------------- APPEON END ----------------------------


OpenWithParm(w_ToDoList_properties, "Copy:"+String(ll_TDL_ID))

If Message.StringParm = "Cancel" Then Return -2
ll_TDL_ID_New = Message.DoubleParm

gnv_appeondb.of_StartQueue( )
//Copy Item
Insert Into TDL_detail(tdl_id, tdli_id, tdli_name, tdl_sort, verbiage, notes, allow_drill_down, include_in_graph,
		action_type, action_status, print_flag, due_date, max_sends_flag, display01, updateable01,
		display02, updateable02, display03, updateable03, display04, updateable04, display05, updateable05,
		display06, updateable06, display07, updateable07, display08, updateable08, display09, updateable09,
		display10, updateable10, display11, updateable11, display12, updateable12, moveto , perform ,user_type)
Select:ll_TDL_ID_New, tdli_id,   tdli_name,   tdl_sort,   verbiage,   notes,	allow_drill_down, include_in_graph,   
		action_type,   action_status,   print_flag,   due_date,   max_sends_flag, 	display01,   updateable01, 
		display02,   updateable02,   display03,   updateable03,display04,   updateable04,   display05,   updateable05,
		display06,   updateable06,display07,   updateable07,   display08,   updateable08,   display09,   updateable09,   
		display10,   updateable10,   display11,   updateable11,   display12,   updateable12, moveto,   perform,user_type  
From tdl_detail
Where TDL_id = :ll_TDL_ID;
	
//Copy Role Rights
Insert Into TDL_Security_Roles_Rights(role_id,tdl_id,access_rights)
Select Role_id, :ll_TDL_ID_New, access_rights From TDL_Security_Roles_Rights
Where TDL_id = :ll_TDL_ID;

//Refresh To Do List 
dw_title.Event ue_refresh_dddw()
Commit;
gnv_appeondb.of_CommitQueue( )
//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.27.2007 By: Frank.Gui
//$<reason> Select the new added To Do List at once.
dw_title.setitem(1,"tdl_id",ll_TDL_ID_New)
dw_title.event itemchanged(1, dw_title.object.tdl_id, String(ll_TDL_ID_New))
//---------------------------- APPEON END ----------------------------
end event

type cb_del from commandbutton within w_todolist_painter
integer x = 2830
integer y = 92
integer width = 315
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-28 By: Allen
//$<reason> Delete TDL/TDL detail/TDL Role
Long ll_tdl_id

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.10.2007 By: Machongmin
//$<reason> Fix a defect.	

ll_tdl_id = dw_title.GetItemNumber( 1, 'tdl_id')
IF IsNull(ll_TDL_ID) OR ll_tdl_id< 0 THEN
	MessageBox(gnv_app.iapp_object.DisplayName, "Please select a To Do Item first.")
	Return -1
End If
//---------------------------- APPEON END ----------------------------


If MessageBox(gnv_app.iapp_object.DisplayName, "Are you sure you want to delete this To Do List?", Question!, YesNo!) = 1 Then
	gnv_appeondb.of_StartQueue()
	//Delete Detail
	Delete TDL_detail
	Where  TDL_ID = :ll_tdl_id;
	//Delete Role Rights
	Delete TDL_Security_Roles_Rights
	Where TDL_id = :ll_tdl_id;
	//Delete TDL
	Delete TDL_basic_info
	Where  TDL_ID = :ll_tdl_id;
	If sqlca.SQLCode = 0 Then
		Commit;
	Else
		Rollback;
	End If
	
	//Refresh List
	dw_title.Event ue_refresh_dddw()
	gnv_appeondb.of_CommitQueue()
	dw_list.Reset()
	dw_dashboard.Reset()

	//Revise display
	Long ll_Null
	SetNull(ll_Null)
	dw_title.SetItem(1, "tdl_id", ll_Null)	
End If
//---------------------------- APPEON END ----------------------------
end event

type cb_properties from commandbutton within w_todolist_painter
integer x = 2501
integer y = 92
integer width = 315
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Properties"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-05 By: Allen
//$<reason> Edit TDL properties
Long ll_Row, ll_TDL_ID

ll_Row = dw_title.GetRow()
ll_TDL_ID = dw_title.GetItemNumber(ll_Row, "tdl_id")
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.10.2007 By: Machongmin
//$<reason> Fix a defect.	
/*
IF IsNull(ll_TDL_ID) THEN RETURN -1
*/
If IsNull(ll_TDL_ID) OR ll_TDL_ID < 1 Then
	MessageBox(gnv_app.iapp_object.DisplayName, "Please first select a To Do List.")
	Return -1
End If
//---------------------------- APPEON END ----------------------------
OpenWithParm(w_ToDoList_properties, "Edit:" + String(ll_TDL_ID))

IF Message.StringParm = "Cancel" THEN RETURN -2
ll_TDL_ID = Message.DoubleParm

dw_title.Event ue_refresh_dddw()
//---------------------------- APPEON END ----------------------------
end event

type cb_add from commandbutton within w_todolist_painter
integer x = 2171
integer y = 92
integer width = 315
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-05 By: Allen
//$<reason> Add Role Rights After insert TDL
OpenWithParm(w_ToDoList_properties, "Add:"+is_Module)

String ls_TDL
ls_TDL = Message.StringParm
IF ls_TDL = "Cancel" THEN RETURN

Long ll_TDL_ID
ll_TDL_ID = Message.DoubleParm

dw_title.Event ue_refresh_dddw()

//Add Role Rights
Insert Into TDL_Security_Roles_Rights
Select Role_id, :ll_TDL_ID, 0 From Security_Roles;


//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add>  04.27.2007 By: Frank.Gui
//$<reason> Select the new added To Do List at once.
//<Modify>05.24.2007 By:Scofield
//<Reason> Fix a bug

String	ls_Module

SELECT "tdl_basic_info"."module"  
  INTO :ls_Module
  FROM "tdl_basic_info"  
 WHERE "tdl_basic_info"."tdl_id" = :ll_tdl_id;
dw_title.setitem(1,"module",ls_Module)
dw_title.event itemchanged(1, dw_title.object.module,ls_Module)

dw_title.setitem(1,"tdl_id",ll_tdl_id)
dw_title.event itemchanged(1, dw_title.object.tdl_id, String(ll_tdl_id))
cb_add_detail.event clicked()
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-08-20 By: Scofield
//$<Reason> Modify the prompt information

//MessageBox(gnv_app.iapp_object.DisplayName, "When you are finished designing &
//your To Do List you must go to the Role Painter->To Do List tab ~r~n&
//to turn ON access to this To Do List for each role")

MessageBox(gnv_app.iapp_object.DisplayName, "When you finish designing your To Do List, you must go to the Role Painter -> To Do List tab and enable access to this To Do List for appropriate roles.")
//---------------------------- APPEON END ----------------------------
end event

type dw_dashboard from u_dw within w_todolist_painter
event type integer ue_refresh_dddw ( boolean ab_refresh_lookup_only )
integer x = 50
integer y = 692
integer width = 3822
integer height = 1400
integer taborder = 120
string title = "To Do Item Properties"
string dataobject = "d_dashboard_detail"
boolean vscrollbar = false
boolean livescroll = false
end type

event type integer ue_refresh_dddw(boolean ab_refresh_lookup_only);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-29 By: Allen
//$<reason> Refresh dddw after module changed
Long i
datawindowchild ldwc_Child
String ls_action_type, ls_Null

SetNull(ls_Null)
//1.Populate dddw of Action Types
Choose Case is_Module
	Case '01'
		ls_action_type = 'Verification Method'
	Case '02'
		ls_action_type = 'Action Type'
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.13.2007 By: Machongmin
	//$<reason> Fix a defect.
	/*
	Case '03'
		ls_action_type = 'Contract Action Type'
	Case '04'
		ls_action_type = 'Agreement Manager Action Type'
	*/
	Case '03','04'
		ls_action_type = 'Contract Action Type'
	//---------------------------- APPEON END ----------------------------	
	
End Choose
This.GetChild( "action_type", ldwc_Child)
ldwc_Child.SetTransObject(Sqlca)
//ldwc_Child.Retrieve(ls_action_type)
gnv_data.of_set_dwchild_fromcache("code_lookup", "lookup_name = '" + ls_action_type + "'", ldwc_Child)
ldwc_Child.Sort()

//Add Null
ldwc_Child.InsertRow(1)
ldwc_Child.SetItem(1,"lookup_code", ls_Null)
ldwc_Child.SetItem(1,"code","")
ldwc_Child.SetItem(1,"description","")

//2.Populate dddw of Action Action
Choose Case is_Module
	Case '01'
		ls_action_type = 'Credentials Verification Response'
	Case '02'
		ls_action_type = 'Action Status'
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.20.2007 By: Machongmin
	//$<reason> Fix a defect.
	/*
	Case '03'
		ls_action_type = 'Contract Action Status'
	Case '04'
		ls_action_type = 'Agreement Manager Action Status'
	*/
	Case '03','04'
		ls_action_type = 'Contract Action Status'	//05/10/2007 By Jervis
	//---------------------------- APPEON END ----------------------------	
End Choose
This.GetChild( "action_status", ldwc_Child)
ldwc_Child.SetTransObject(Sqlca)
//ldwc_Child.Retrieve(ls_action_type)
gnv_data.of_set_dwchild_fromcache("code_lookup", "lookup_name = '" + ls_action_type + "'", ldwc_Child)
ldwc_Child.Sort()

//--------------------------- APPEON BEGIN ---------------------------
//$<Delete> 2007-08-21 By: Evan
//$<Reason> Need to like other's child dddw
//--------------------------- APPEON BEGIN ---------------------------
/*
//$<add> 01.10.2007 By: Davis
//Add NULL
ldwc_Child.InsertRow(1)
ldwc_Child.SetItem(1,"lookup_code", -1)
ldwc_Child.SetItem(1,"code","(None)")
ldwc_Child.SetItem(1,"description","")
*/
//---------------------------- APPEON END ----------------------------
//---------------------------- APPEON END ----------------------------

//Add None
ldwc_Child.InsertRow(1)
ldwc_Child.SetItem(1,"lookup_code", ls_Null)
ldwc_Child.SetItem(1,"code","")
ldwc_Child.SetItem(1,"description","")
//Only Refresh lookup table after Lookup Painter has update.
IF ab_refresh_lookup_only THEN Return 1

//3.Populate dddw of displayxx
For i = 1 To 12
	This.GetChild( "display" + String(i, "00"), ldwc_Child)

	IF is_Module = '01' OR is_Module = '02' THEN
		ldwc_Child.SetFilter("module = '" + is_Module + "' OR module = '00'" )//00:Basic info,01&02 used the same
	ELSE
		ldwc_Child.SetFilter("module = '" + is_Module + "'")
	END IF

	ldwc_Child.Filter()
	ldwc_Child.Sort()
Next

//4.To Do Action 
//4.1) IntelliCred/IntelliApp have the same Move to List, 00-(None)
This.GetChild( "Moveto", ldwc_Child)

IF is_Module ='02' THEN
	ldwc_Child.SetFilter("module = '01' OR module = '00'")
ELSE
	ldwc_Child.SetFilter("module = '" + is_Module + "' OR module = '00'")
END IF


ldwc_Child.Filter()

//4.2) Initialize display (None), change while MoveTo changed.
This.GetChild( "Perform", ldwc_Child)
ldwc_Child.SetFilter('movetoid = "00"')
ldwc_Child.Filter()
Return 0
//---------------------------- APPEON END ----------------------------
end event

event editchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-29 By: Allen
//$<reason> 
Choose Case Lower(dwo.Name)
	Case 'verbiage'
		dw_List.SetItem( dw_List.GetRow(), 'verbiage', Data)
	Case 'tdl_sort'
		dw_list.SetItem( dw_list.GetRow(), "TDL_Sort", Long(Data))
End Choose
//---------------------------- APPEON END ----------------------------
end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-11-29 By: Allen
//$<reason> validate after edit
this.accepttext()
Choose Case Lower(dwo.Name)
	Case 'verbiage'
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 04.24.2007 By: Jack
		//$<reason> Fix a defect.
		/*
		IF Pos(Data, "##") < 1 THEN		
			MessageBox(gnv_app.iapp_object.DisplayName, "There should be a ##")		
			RETURN 1
		END IF
		*/
		//---------------------------- APPEON END ----------------------------
	Case 'moveto'
		Datawindowchild ldwc_Child
		This.GetChild( "Perform", ldwc_Child)
		ldwc_Child.SetFilter("movetoid = '00' OR Movetoid = '" +data+ "'")
		ldwc_Child.Filter()

		//Protect digist while no this data
		String ls_Null
		SetNull(ls_Null)
		SetItem(1, 'perform', ls_Null)
End Choose
//---------------------------- APPEON END ----------------------------
end event

event buttonclicked;call super::buttonclicked;String ls_icon,ls_new_icon
str_picture lstr_picture,lstr_picture_new
If dwo.name = 'b_icon_browse' Then
	ls_icon = This.GetitemString(1,'tv_icon')
	If  isnumber(ls_icon) Then  //For Picture Painter
		lstr_picture.al_pic_id = Long(ls_icon)
		lstr_picture.ab_support_picture_painter = True
	Else //For system picture.
		lstr_picture.as_pic_file  = ls_icon
		lstr_picture.ab_support_picture_painter = True		
	End If
	OpenwithParm(w_icon_select,lstr_picture)
	If isvalid(Message.powerobjectparm ) Then
		lstr_picture_new = Message.Powerobjectparm
		If lstr_picture_new.al_pic_id > 0 Then
			This.SetItem(1,'tv_icon', String(lstr_picture_new.al_pic_id)) 
			Parent.of_set_icon( )
		ElseIf lstr_picture_new.as_pic_file <> '' Then
			This.SetItem(1,'tv_icon', lstr_picture_new.as_pic_file)
			Parent.of_set_icon( )
		End If
	End If
End If


end event

type gb_1 from groupbox within w_todolist_painter
integer x = 55
integer width = 3470
integer height = 212
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

