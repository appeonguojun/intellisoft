$PBExportHeader$pfc_cst_u_letter_painter.sru
forward
global type pfc_cst_u_letter_painter from userobject
end type
type cb_close from u_cb within pfc_cst_u_letter_painter
end type
type cb_save from u_cb within pfc_cst_u_letter_painter
end type
type cb_print from u_cb within pfc_cst_u_letter_painter
end type
type cb_delete from u_cb within pfc_cst_u_letter_painter
end type
type cb_add from u_cb within pfc_cst_u_letter_painter
end type
type tab_letter from tab within pfc_cst_u_letter_painter
end type
type tabpage_browse from userobject within tab_letter
end type
type dw_1 from u_dw within tabpage_browse
end type
type st_1 from statictext within tabpage_browse
end type
type dw_browse from u_dw within tabpage_browse
end type
type tabpage_browse from userobject within tab_letter
dw_1 dw_1
st_1 st_1
dw_browse dw_browse
end type
type tabpage_detail from userobject within tab_letter
end type
type dw_detail from u_dw within tabpage_detail
end type
type tabpage_detail from userobject within tab_letter
dw_detail dw_detail
end type
type tab_letter from tab within pfc_cst_u_letter_painter
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type
end forward

global type pfc_cst_u_letter_painter from userobject
integer width = 2382
integer height = 1904
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_close cb_close
cb_save cb_save
cb_print cb_print
cb_delete cb_delete
cb_add cb_add
tab_letter tab_letter
end type
global pfc_cst_u_letter_painter pfc_cst_u_letter_painter

type variables
w_response iw_parent_window
u_dw idw_current
// start code change --- 11.04.2005 MSKINNER
long li_letter_id
// end code change --- 11.04.2005 MSKINNER
long il_row = 1  	// Added by Jack on 2007-08-27

Boolean	ib_Add	//Added by Scofield on 2007-08-27

end variables

forward prototypes
public function integer of_set_parent_window (w_response aw_parent_window)
public function integer of_filter_child_dw (string as_data)
public function integer of_select_letter (integer currentrow)
end prototypes

public function integer of_set_parent_window (w_response aw_parent_window);iw_parent_window = aw_parent_window

Return 0
end function

public function integer of_filter_child_dw (string as_data);// start code change --- 11.01.2005 MSKINNER
/******************************************************************************************************************
**  [PUBLIC]   : of_filter_child_dw( /*string as_data */)
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 03 November 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

long ll_null
long ll_current_data
string ls_filter
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.23.2006 By: LiuHongXin
//$<reason> Fix a defect.
IF IsNull(as_data) THEN RETURN -1
//---------------------------- APPEON END ----------------------------
setnull(ll_null)
datawindowchild dw_child
//ll_current_data = this.tab_letter.tabpage_detail.dw_detail.getitemNumber(1,'letter_destination') 
ls_filter = "LETTER_MODULE = "+ as_data 
this.tab_letter.tabpage_browse.dw_browse.setfilter( ls_filter)
this.tab_letter.tabpage_browse.dw_browse.filter()
//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-08-22 By: Scofield
//$<Reason> Set the first row to current row
if tab_letter.tabpage_browse.dw_browse.RowCount() > 0 then
	tab_letter.tabpage_browse.dw_browse.SelectRow(0,false)
	tab_letter.tabpage_browse.dw_browse.SelectRow(1,true)
	tab_letter.tabpage_browse.dw_browse.ScrollToRow(1)
	tab_letter.tabpage_browse.dw_browse.SetRow(1)
end if
//---------------------------- APPEON END ----------------------------

this.tab_letter.tabpage_detail.dw_detail.getchild( 'letter_destination', dw_child)
// mskinner 23 feb 2006 -- begin
//this.tab_letter.tabpage_detail.dw_detail.object.letter_destination[1] = ll_null 
// mskinner 23 feb 2006 -- end

ls_filter = "module = '"+ as_data + "'"
dw_child.setfilter( ls_filter)
dw_child.filter()
dw_child.InsertRow(1)		//Added by Scofield on 2007-08-24

// mskinner 23 feb 2006 -- begin
//if this.tab_letter.tabpage_browse.dw_browse.rowcount( ) < 1 then 
//	this.tab_letter.tabpage_detail.enabled = false
//else 
//	this.tab_letter.tabpage_detail.enabled = true
//end if 
// mskinner 23 feb 2006 -- end

// end code change --- 11.01.2005 MSKINNER
return 0
end function

public function integer of_select_letter (integer currentrow);// start code change --- 11.07.2005 MSKINNER
Integer 	li_letters_id
long		ll_Count,ll_Module,ll_Rnt

DataWindowChild	ldc_child

ll_Count = tab_letter.tabpage_browse.dw_browse.RowCount()

if ll_Count > 0 then
	if currentrow > ll_Count then currentrow = 1				//Added by Scofield on 2007-08-22
	li_letters_id = tab_letter.tabpage_browse.dw_browse.GetItemNumber( currentrow, "letter_id" )
	ll_Rnt = tab_letter.tabpage_detail.dw_detail.Retrieve( li_letters_id )
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2007-08-27 By: Scofield
	//$<Reason> Filter the export id
	
	if ll_Rnt > 0 then
		tab_letter.tabpage_detail.dw_detail.GetChild("export_id",ldc_child)
		ll_Module = tab_letter.tabpage_detail.dw_detail.GetItemNumber(1,'letter_module')
		If ll_Module = 4 Then //Contract
			ldc_child.SetFilter("export_type = 3 or export_type = 4")
		Else
			ldc_child.SetFilter("export_type = 1 or export_type = 2")
		End If
		
		ldc_child.Filter()
	end if
	//---------------------------- APPEON END ----------------------------	
	tab_letter.tabpage_browse.dw_browse.SelectRow( 0, False )
	tab_letter.tabpage_browse.dw_browse.SelectRow( currentrow, True )
	tab_letter.tabpage_detail.dw_detail.SetFocus()
END IF


RETURN 0
// end code change --- 11.07.2005 MSKINNER
end function

on pfc_cst_u_letter_painter.create
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cb_print=create cb_print
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.tab_letter=create tab_letter
this.Control[]={this.cb_close,&
this.cb_save,&
this.cb_print,&
this.cb_delete,&
this.cb_add,&
this.tab_letter}
end on

on pfc_cst_u_letter_painter.destroy
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cb_print)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.tab_letter)
end on

type cb_close from u_cb within pfc_cst_u_letter_painter
integer x = 1879
integer y = 1740
integer width = 430
integer height = 84
integer taborder = 70
boolean bringtotop = true
string text = "&Close"
end type

event clicked;Close( iw_parent_window )
end event

type cb_save from u_cb within pfc_cst_u_letter_painter
integer x = 1417
integer y = 1740
integer width = 430
integer height = 84
integer taborder = 50
boolean bringtotop = true
string text = "&Save"
end type

event clicked;
//--------------------------- APPEON BEGIN ---------------------------
//$<modified> 2007-04-19 By: Wu ZhiJun
//$<reason> Fix a bug
long	ll_Row
Integer	ll_Module

ll_Row = tab_letter.tabpage_detail.dw_detail.getrow()

if ll_Row > 0 then
	li_letter_id = tab_letter.tabpage_detail.dw_detail.getitemnumber(ll_Row,'letter_id')
	ll_Module = tab_letter.tabpage_detail.dw_detail.getitemnumber(ll_Row,'letter_module')
end if
//--------------------------- APPEON END -----------------------------

// start code change --- 11.03.2005 MSKINNER
// removed a bunch of code 
//li_letter_id = tab_letter.tabpage_detail.dw_detail.getitemnumber(tab_letter.tabpage_detail.dw_detail.getrow(),'letter_id')

IF iw_parent_window.Event pfc_save( ) < 0 THEN
	Return -1
END IF

//long li_cr
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.16.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
/*
tab_letter.tabpage_browse.dw_browse.Retrieve()
tab_letter.tabpage_detail.dw_detail.Retrieve( li_letter_id )
*/
This.Tag = "1"
gnv_appeondb.of_startqueue( )

tab_letter.tabpage_browse.dw_1.SetItem(1,'module',ll_Module)		//Added by Scofield on 2007-08-22
tab_letter.tabpage_browse.dw_browse.Retrieve()
tab_letter.tabpage_detail.dw_detail.Retrieve( li_letter_id )

gnv_appeondb.of_commitqueue( )
This.Tag = ""
//---------------------------- APPEON END ----------------------------


// end code change --- 11.03.2005 MSKINNER
end event

type cb_print from u_cb within pfc_cst_u_letter_painter
integer x = 946
integer y = 1740
integer width = 443
integer height = 84
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Print"
end type

event clicked;idw_current.Print()
idw_current.SetFocus( )
end event

type cb_delete from u_cb within pfc_cst_u_letter_painter
integer x = 485
integer y = 1740
integer width = 434
integer height = 84
integer taborder = 30
boolean bringtotop = true
string text = "&Delete Letter"
end type

event clicked;Integer li_ans

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.27.2007 By: Frank.Gui
//$<reason> 
IF tab_letter.tabpage_detail.dw_detail.GetRow() < 1 THEN
	return
END IF
//---------------------------- APPEON END ----------------------------

li_ans = MessageBox("Delete Row", "Are you sure you want to delete selected row?", Question!, YesNo!, 1 )

IF li_ans = 1 THEN
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.18.2006 By: Rodger Wu
//$<reason> Fix a defect. 
	Long ll_currentrow, ll_letterid
	
	ll_currentrow = tab_letter.tabpage_detail.dw_detail.GetRow()
	If ll_currentrow < 1 Then Return;
	
	If gs_dbtype = "SQL" Then
		ll_letterid = tab_letter.tabpage_detail.dw_detail.GetItemNumber( ll_currentrow, "letter_id" )
		
		Delete from sys_letter_module where letter_id = :ll_letterid;
		If SQLCA.SQLCode <> 0 Then
			MessageBox("Update Failed", "Update failed on delete.")
			Return -1
		End If
	End If
//---------------------------- APPEON END ----------------------------
	tab_letter.tabpage_detail.dw_detail.DeleteRow( 0 )
	IF tab_letter.tabpage_detail.dw_detail.Update() = -1 THEN
		MessageBox("Update Failed", "Update failed on delete.")
		Return -1
	END IF
END IF

tab_letter.SelectTab( 1 )
tab_letter.tabpage_browse.dw_browse.Retrieve()
tab_letter.tabpage_browse.dw_browse.SetFocus( )

IF tab_letter.tabpage_browse.dw_browse.RowCount() > 0 THEN
	tab_letter.tabpage_browse.dw_browse.SelectRow( 0, False )
	tab_letter.tabpage_browse.dw_browse.SelectRow( 1, True )
	tab_letter.tabpage_browse.dw_browse.SetRow( 1 )
	tab_letter.tabpage_browse.dw_browse.ScrollToRow( 1 )
END IF
end event

type cb_add from u_cb within pfc_cst_u_letter_painter
integer x = 50
integer y = 1740
integer width = 407
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "&Add Letter"
end type

event clicked;// start code change --- 11.01.2005 MSKINNER
Integer 	li_nr
long		ll_Module

DataWindowChild	ldwc_child

IF iw_parent_window.Event pfc_save() < 0 THEN
	Return -1
END IF

tab_letter.tabpage_detail.dw_detail.Reset()
li_nr = tab_letter.tabpage_detail.dw_detail.InsertRow( 0 )

// end code change --- 11.01.2005 MSKINNER

tab_letter.tabpage_detail.dw_detail.ScrollToRow( li_nr )
tab_letter.tabpage_detail.dw_detail.SetRow( li_nr )
tab_letter.tabpage_detail.dw_detail.SetFocus( )

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-08-27 By: Scofield
//$<Reason> Filter the export id

tab_letter.tabpage_detail.dw_detail.GetChild("export_id",ldwc_child)
ll_Module = tab_letter.tabpage_detail.dw_detail.GetItemNumber(li_nr,'letter_module')
If ll_Module = 4 Then //Contract
	ldwc_child.SetFilter("export_type = 3 or export_type = 4")
Else
	ldwc_child.SetFilter("export_type = 1 or export_type = 2")
End If

ldwc_child.Filter()

//---------------------------- APPEON END ----------------------------	

ib_Add = true		//Added by Scofield on 2007-08-27
tab_letter.SelectTab( 2 )
ib_Add = false		//Added by Scofield on 2007-08-27

end event

type tab_letter from tab within pfc_cst_u_letter_painter
integer x = 5
integer width = 2359
integer height = 1880
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type

on tab_letter.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.Control[]={this.tabpage_browse,&
this.tabpage_detail}
end on

on tab_letter.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
end on

event selectionchanged;long	ll_letter_id,ll_Row,ll_Find,ll_Count

if gi_export_on = 0 then
	tabpage_detail.dw_detail.object.t1.visible = false
	tabpage_detail.dw_detail.object.t2.visible = false
	tabpage_detail.dw_detail.object.use_export.visible = false
	tabpage_detail.dw_detail.object.export_id.visible = false
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-08-22 By: Scofield
//$<Reason> Only from tab1 to tab2 call of_Select_letter()
if Not ib_Add then
	if oldindex = 1 and newindex = 2 then
		of_Select_letter(il_row)  //Add by Jack 21.08.2007
	else
		ll_Row = tab_letter.tabpage_detail.dw_detail.GetRow()
		if ll_Row > 0 then
			ll_letter_id = tab_letter.tabpage_detail.dw_detail.getitemnumber(ll_Row,'letter_id')
			ll_Count = tab_letter.tabpage_browse.dw_browse.RowCount()
			
		   if isnull(ll_letter_id) then ll_letter_id=0 //added by nova 05-04-2008
		   ll_Find = tab_letter.tabpage_browse.dw_browse.Find("letter_id = " + String(ll_letter_id),1,ll_Count)
			if ll_Find > 0 then
				tab_letter.tabpage_browse.dw_browse.SelectRow( 0, False )
				tab_letter.tabpage_browse.dw_browse.SelectRow(ll_Find, True )
			end if
		end if
	end if
end if
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.13.2006 By: Rodger Wu
//$<reason> Fix a defect.
if oldindex <> newindex then
	if newindex = 1 then
		tabpage_browse.dw_browse.post setfocus()
	else
		tabpage_detail.dw_detail.post setfocus()
	end if
end if
//---------------------------- APPEON END ----------------------------
end event

type tabpage_browse from userobject within tab_letter
integer x = 18
integer y = 100
integer width = 2322
integer height = 1764
long backcolor = 79741120
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_1 dw_1
st_1 st_1
dw_browse dw_browse
end type

on tabpage_browse.create
this.dw_1=create dw_1
this.st_1=create st_1
this.dw_browse=create dw_browse
this.Control[]={this.dw_1,&
this.st_1,&
this.dw_browse}
end on

on tabpage_browse.destroy
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.dw_browse)
end on

type dw_1 from u_dw within tabpage_browse
integer x = 325
integer y = 16
integer width = 1083
integer height = 100
integer taborder = 20
string dataobject = "d_ext_module"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
end type

event constructor;call super::constructor;/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 04 November 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

/////////////////////////////////////////////////////////////////////////////////////////////////
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//    	IF ANY MODIFICATIONS ARE MADE TT THE FILTER LOGIC; MODS NEED TO BE MADE IN PFC_U_LETTER_PAINTER 
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/////////////////////////////////////////////////////////////////////////////////////////////////

insertrow(0)

this.object.module[1] = 1
string ls_current_filter

datawindowchild dw_child

this.getchild( 'module', dw_child)
//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 01.13.2006 By: Rodger Wu
//$<reason> Fix a defect.
//this.getchild( 'letter_module', dw_child)
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.18.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
//$<reason> When the Product Setting is set to Contract Logix then the Letter 
//$<reason> type drop down should only have contract in list 
IF gb_contract_version THEN
	dw_child.setfilter("module_data = 4")
	dw_child.filter()

	st_1.VISible = FALSE
	THIS.VISible = FALSE
   PARENT.dw_browse.X = 27
	PARENT.dw_browse.Y = 12
	PARENT.dw_browse.width =2263 
	PARENT.dw_browse.Height =1592 
	
	of_filter_child_dw( "4" )
	
	RETURN
END IF
//---------------------------- APPEON END ----------------------------


ls_current_filter = dw_child.Describe("DataWindow.Table.Filter")	

IF NOT F_VALIDSTR(ls_current_filter) OR  ls_current_filter = '?' THEN 
	ls_current_filter = ''
END IF

//////////////////////////////////////////////////////////////////////////
// filter out the peer review
//////////////////////////////////////////////////////////////////////////

if of_get_app_setting("set_peer","I") = 0 AND ls_current_filter <> '?' then
    dw_child.setfilter("module_data <> 2")
    dw_child.filter()
end if 

//////////////////////////////////////////////////////////////////////////
// filter out the QA stuff
//////////////////////////////////////////////////////////////////////////

ls_current_filter = dw_child.Describe("DataWindow.Table.Filter")	

if of_get_app_setting("set_qa","I") = 0 then
	 if f_validstr(ls_current_filter) AND ls_current_filter <> '?' then 
		 dw_child.setfilter(ls_current_filter + ' and ' + "module_data <> 3")
	 else 
		 dw_child.setfilter( "module_data <> 3")
	end if 
   dw_child.filter()
end if

//////////////////////////////////////////////////////////////////////////
// filter out the contract
//////////////////////////////////////////////////////////////////////////

ls_current_filter = dw_child.Describe("DataWindow.Table.Filter")	

if of_get_app_setting("set_cont","I") = 0 AND ls_current_filter <> '?'then
	 if f_validstr(ls_current_filter) then 
		 dw_child.setfilter(ls_current_filter + ' and ' + "module_data <> 4")
	 else 
		 dw_child.setfilter("module_data <> 4")
	 end if 
    dw_child.filter()
end if

/////////////////////////////////////////////////////////////////////////////
//// IF THE USER ONLY HAS ACCESS TO PRACTITIONER LETTERS THE TO THE FOLLOWING
///////////////////////////////////////////////////////////////////////////////
//
IF dw_child.ROWCOUNT( ) = 1 THEN 
	st_1.VISible = FALSE
	THIS.VISible = FALSE
   PARENT.dw_browse.X = 27
	PARENT.dw_browse.Y = 12
	PARENT.dw_browse.width =2263 
	PARENT.dw_browse.Height =1592 
END IF


end event

event itemchanged;call super::itemchanged;

if f_validstr(data) then 
  of_filter_child_dw(data)
end if 
end event

type st_1 from statictext within tabpage_browse
integer x = 32
integer y = 32
integer width = 302
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Letter Type:"
boolean focusrectangle = false
end type

type dw_browse from u_dw within tabpage_browse
integer x = 27
integer y = 120
integer width = 2263
integer height = 1484
integer taborder = 20
string dataobject = "d_letter_painter_browse"
boolean hscrollbar = true
end type

event constructor;This.of_SetTransObject( SQLCA )
This.of_SetUpdateAble( False )


end event

event rowfocuschanged;call super::rowfocuschanged;////Integer li_letter_id
//
//IF This.RowCount() > 0 THEN
//	li_letter_id = This.GetItemNumber( currentrow, "letter_id" )
//	tab_letter.tabpage_detail.dw_detail.Retrieve( li_letter_id )
//	This.SelectRow( 0, False )
//	This.SelectRow( currentrow, True )
//	tab_letter.tabpage_detail.dw_detail.SetFocus()
//END IF


end event

event clicked;call super::clicked;Integer li_row

if this.rowcount( ) < 1 then return 0


if row < 1 then return 0

li_letter_id = THIS.GetItemNumber( ROW, "letter_id" )
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.09.2006 By: LiuHongXin
//$<reason> Fix a defect.
/*
OF_SELect_letter( ROW)

li_row = This.GetClickedRow( )
*/
li_row = This.GetClickedRow( )
//OF_SELect_letter( ROW)  //Comment by Jack 21.08.2007
//---------------------------- APPEON END ----------------------------

il_row = li_row  //Add by Jack 21.08.2007

IF li_row = 0 THEN
	tab_letter.tabpage_browse.dw_browse.SetFocus( )
	Return -1
END IF

This.SelectRow( 0, False )
This.SelectRow( li_row, True )
This.ScrollToRow( li_row )
This.SetRow( li_row )

of_select_letter(li_row)				//Added by Scofield on 2008-07-14

return success

end event

event doubleclicked;if this.rowcount( ) < 1 then return 0

tab_letter.SelectTab( 2 )
end event

event retrieveend;call super::retrieveend;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.28.2006 By: LeiWei
//$<reason> Fix a defect.
IF cb_save.Tag = "1" THEN RETURN
//---------------------------- APPEON END ----------------------------

Integer li_letters_id

IF this.rowcount() > 0 THEN
	li_letters_id = This.GetItemNumber( 1, "letter_id" )	
	tab_letter.tabpage_detail.dw_detail.Retrieve( li_letters_id )
END IF
end event

event getfocus;call super::getfocus;idw_current = This
end event

type tabpage_detail from userobject within tab_letter
integer x = 18
integer y = 100
integer width = 2322
integer height = 1764
long backcolor = 79741120
string text = "Letter Setup"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_detail dw_detail
end type

on tabpage_detail.create
this.dw_detail=create dw_detail
this.Control[]={this.dw_detail}
end on

on tabpage_detail.destroy
destroy(this.dw_detail)
end on

type dw_detail from u_dw within tabpage_detail
integer x = 14
integer y = 32
integer width = 2295
integer height = 1424
integer taborder = 20
string dataobject = "d_letter_painter"
boolean vscrollbar = false
boolean livescroll = false
end type

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.07.2006 By: LeiWei
//$<reason> To implement the functionality of storing Word templates to both HDD and db.
//$<modification> Two dataobjects are used: 1) d_letter_painter (store templates to local HDD);
//$<modification> 2) d_letter_painter_database (store templates to db).
//This.of_SetTransObject( SQLCA )

Integer li_word_storage_type, li_rightvalue
Long ll_areaid
String ls_letterpath
DataWindowChild ldwc

li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0
IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
	This.Dataobject = "d_letter_painter"
ELSE	
	This.Dataobject = "d_letter_painter_database"

	li_rightvalue = w_mdi.of_security_access(5010)
	if li_rightvalue = 0 then This.Modify( "b_1.visible = 0" )
END IF
This.of_SetTransObject( SQLCA )
//---------------------------- APPEON END ----------------------------

This.of_SetReqColumn(TRUE)
tab_letter.tabpage_browse.dw_browse.Retrieve( )
// start code change --- 11.03.2005 MSKINNER
of_SetMultiTable(TRUE)
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.03.2006 By: LiuHongXin
//$<reason> Fix a defect.
/*
String ls_sys_letter_col[ ] = {"letter_id","letter_name","letter_description" ,'document_name','response_required','maximum_sends','resend_days','export_id'}
String ls_sys_letter_mod_cols[ ] = {"sys_letter_module_letter_id", "letter_module",'letter_destination'}
inv_multitable.of_Register ("sys_letters", ls_sys_letter_col)
inv_multitable.of_Register ("sys_letter_module", ls_sys_letter_mod_cols)
*/
String ls_sys_letter_col[ ] = {"letter_id","letter_name","letter_description" ,'document_name','response_required','maximum_sends','resend_days','export_id','use_export','sys_letters_case_review_letter'}
String ls_sys_letter_mod_cols[ ] = {"sys_letter_module_letter_id", "letter_module",'letter_destination'}
inv_multitable.of_Register ("sys_letters",{"letter_id"}, ls_sys_letter_col)
inv_multitable.of_Register ("sys_letter_module",{"sys_letter_module_letter_id"}, ls_sys_letter_mod_cols)
//---------------------------- APPEON END ----------------------------

LONG LL_RET
// end code change --- 11.03.2005 MSKINNER


/////////////////////////////////////////////////////////////////////////////////////////////////
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//    	IF ANY MODIFICATIONS ARE MADE TT THE FILTER LOGIC; MODS NEED TO BE MADE IN W_LETTER_GENERATOR 
// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/////////////////////////////////////////////////////////////////////////////////////////////////



string ls_current_filter

datawindowchild dw_child
this.getchild( 'letter_module', dw_child)

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.18.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
//$<reason> When the Product Setting is set to Contract Logix then there
//$<reason> should only be contract in list.

IF gb_contract_version THEN
	dw_child.setfilter("module_data = 4")
	dw_child.filter()

   This.Modify("letter_module.Protect = 1")
	This.Modify("letter_module.Initial= '4'")
	//Added by Alan on 2008-12-31
	This.Modify("letter_module.Background.Color = "+string(rgb(212,208,200)))
	of_filter_child_dw("4")
	
	RETURN
END IF
//---------------------------- APPEON END ----------------------------


ls_current_filter = dw_child.Describe("DataWindow.Table.Filter")	

IF NOT F_VALIDSTR(ls_current_filter) OR  ls_current_filter = '?' THEN 
	ls_current_filter = ''
END IF

//////////////////////////////////////////////////////////////////////////
// filter out the peer review
//////////////////////////////////////////////////////////////////////////

if of_get_app_setting("set_peer","I") = 0 AND ls_current_filter <> '?' then
    dw_child.setfilter("module_data <> 2")
    dw_child.filter()
end if 

//////////////////////////////////////////////////////////////////////////
// filter out the QA stuff
//////////////////////////////////////////////////////////////////////////
ls_current_filter = dw_child.Describe("DataWindow.Table.Filter")	
if of_get_app_setting("set_qa","I") = 0 then
	 if f_validstr(ls_current_filter) AND ls_current_filter <> '?' then 
		 dw_child.setfilter(ls_current_filter + ' and ' + "module_data <> 3")
	 else 
		LL_RET = dw_child.setfilter( "module_data <> 3")
	end if 
	 LL_RET =  dw_child.filter()
end if

//////////////////////////////////////////////////////////////////////////
// filter out the contract
//////////////////////////////////////////////////////////////////////////

ls_current_filter = dw_child.Describe("DataWindow.Table.Filter")	
if of_get_app_setting("set_cont","I") = 0 AND ls_current_filter <> '?'then
	 if f_validstr(ls_current_filter) then 
		 dw_child.setfilter(ls_current_filter + ' and ' + "module_data <> 4")
	 else 
		 dw_child.setfilter("module_data <> 4")
	 end if 
    
    LL_RET =  dw_child.filter()
	 
end if


///////////////////////////////////////////////////////////////////////////////
//// IF THE USER ONLY HAS ACCESS TO PRACTITIONER LETTERS THE TO THE FOLLOWING
///////////////////////////////////////////////////////////////////////////////

IF dw_child.ROWCOUNT( ) = 1 THEN 
   Object.letter_module.Protect = 1
else 
	Object.letter_module.Protect = 0
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-08-27 By: Scofield
//$<Reason> Insert a blank row for export_id

This.GetChild("export_id",ldwc)
ldwc.InsertRow(1)
ldwc.SetItem(1,'export_type',3)

ldwc.InsertRow(1)
ldwc.SetItem(1,'export_type',1)
//---------------------------- APPEON END ----------------------------

end event

event buttonclicked;string docname, named
integer value

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.07.2006 By: LeiWei
//$<modification> Open Letter Storage Area Painter for template management.

IF This.dataobject = "d_letter_painter_database" THEN
	if row < 1 then return;
	docname = Trim( This.GetItemString( row, "document_name" ) )
	if Len( docname ) > 0 then
		OpenWithParm( w_area_painter, docname )
	else
		Open( w_area_painter )
	end if
	RETURN
END IF
//---------------------------- APPEON END ----------------------------
gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//value = GetFileOpenName("Select File",&
//+ docname, named, "DOC", &
//	+ "Doc Files (*.DOC),*.DOC")				//Added By Mark Lee 08/15/2014
n_getfilename     ln_getfilename
value = ln_getfilename.of_getopenfilename("Select File",&
                + docname, named, "DOC", &
			  + "Doc Files (*.DOC),*.DOC")	
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value = 1 THEN
	This.SetItem( row, "document_name", named )
END IF
end event

event getfocus;call super::getfocus;idw_current = This
end event

event itemchanged;call super::itemchanged;// start code change --- 11.03.2005 MSKINNER
/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 03 November 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

Long 		ll_null,ll_ExpId,ll_Find
Long		ll_bcolor
			
SetNull(ll_null)
datawindowchild ldwc

Choose Case dwo.Name
	Case 'letter_module'
		Choose Case Data
			Case '1' // practitioner
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 2006-05-10 By: Liu Hongxin
				//$<reason> Fix a defect. 
													/*
													object.letter_destination[1] = ll_null // no destination
				*/
				This.SetItem(1, 'letter_destination', ll_null)
				//---------------------------- APPEON END ----------------------------
			Case Else
				of_filter_child_dw(Data)
		End Choose
		
		//Start Change 01.22.2007 By Jervis
		This.GetChild("export_id",ldwc)
		
		ll_ExpId = This.GetItemNumber(row,'export_id')	//Added by Scofield on 2007-08-27
		
		If data = '4' Then //Contract
			ldwc.SetFilter("export_type = 3 or export_type = 4")
		Else
			ldwc.SetFilter("export_type = 1 or export_type = 2")
		End If
		
		ldwc.Filter()
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2007-08-27 By: Scofield
		//$<Reason> if change the moudle value,then refresh the export id value.
		if Not IsNull(ll_ExpId) then
			ll_Find = ldwc.Find('export_id = ' + String(ll_ExpId),1,ldwc.RowCount())
			if ll_Find <= 0 then
				This.SetItem(Row,'export_id',ll_null)		
			end if
		end if
		//---------------------------- APPEON END ----------------------------
		//End Change
	Case 'use_export'
		if data = '2' then 
			This.Modify("export_id.protect = '1'")
			This.Modify("export_id.Background.Color = "+string(rgb(212,208,200)))
		else
			This.Modify("export_id.protect = '0'")
			ll_bcolor=long(This.describe("use_export.Background.Color"))
			This.Modify("export_id.Background.Color = "+string(ll_bcolor))
		end if
	Case Else
		
End Choose

// end code change --- 11.03.2005 MSKINNER


end event

event pfc_preupdate;call super::pfc_preupdate;//// start code change --- 11.01.2005 MSKINNER
/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner xx September 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/


li_letter_id = GetItemNumber(1 , "letter_id" )

if not f_validstr(string(li_letter_id)) then 
  SELECT Max( sys_letters.letter_id )  //moved from add 041803
  INTO :li_letter_id  
  FROM sys_letters ;
  if isnull(li_letter_id) then li_letter_id = 0
  li_letter_id++
  this.SetItem( 1, "letter_id", li_letter_id)
  this.SetItem( 1, "sys_letter_module_letter_id", li_letter_id)
end if 

return 0
end event

event pfc_validation;// start code change --- 11.03.2005 MSKINNER
/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 03 november 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.27.2007 By: Frank.Gui
//$<reason> 
IF  super::event pfc_validation( ) =FAILURE THEN
	return FAILure
END IF
//---------------------------- APPEON END ----------------------------

if getrow() < 1 then return success
if pos(trim(GetItemstring(1 , "document_name" ))," ")  > 0 then  //Modified By Ken.Guo 04.03.2008.  Letter_name replaced with document_name.
	messagebox("Save Error","Document Name cannot have space(s) in them. Use underscore instead.")
	return failure
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.27.2007 By: Frank.Gui
//$<reason> 
string  ls_document_name

ls_document_name = getitemstring(getrow(),'document_name')
if ls_document_name='' or isnull(ls_document_name) THEN
	setcolumn('document_name')
	messagebox('Save Error',"Required value missing for Word Document Name on row 1. Please enter a value.")
	
	return failure
END IF
//---------------------------- APPEON END ----------------------------
return SUccess

// end code change --- 11.03.2005 MSKINNER
end event

event retrieveend;call super::retrieveend;

// start code change --- 11.03.2005 MSKINNER
if rowcount > 0 then 
   of_filter_child_dw(string(this.object.letter_module[1]))
	//Added by Alan on 2008-12-31
	if getrow()>0 and string(getitemnumber(getrow(),'use_export'))<>'' then this.trigger event itemchanged(getrow(),this.object.use_export,string(getitemnumber(getrow(),'use_export')))
end if 
// end code change --- 11.03.2005 MSKINNER

end event

event rowfocuschanged;call super::rowfocuschanged;//Start Change 01.22.2007 By Jervis
integer li_module
datawindowchild ldwc

if currentrow > 0 then
	this.GetChild("export_id",ldwc)
	
	li_module = this.GetItemNumber(currentrow,"letter_module")
	
	
	If li_module = 4 Then //Contract
		ldwc.SetFilter( "export_type = 3 or export_type = 4")
		ldwc.Filter()
	else
		ldwc.SetFilter("")
		ldwc.Filter()
	End If
end if
//End Change
end event

