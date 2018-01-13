$PBExportHeader$w_view_alias_maintenance.srw
forward
global type w_view_alias_maintenance from w_main
end type
type cb_reset_all from commandbutton within w_view_alias_maintenance
end type
type cb_reset from commandbutton within w_view_alias_maintenance
end type
type cb_expand from commandbutton within w_view_alias_maintenance
end type
type dw_6 from datawindow within w_view_alias_maintenance
end type
type dw_5 from datawindow within w_view_alias_maintenance
end type
type cb_close from commandbutton within w_view_alias_maintenance
end type
type cb_save from commandbutton within w_view_alias_maintenance
end type
type cb_import from commandbutton within w_view_alias_maintenance
end type
type dw_select_view from u_dw within w_view_alias_maintenance
end type
type dw_fields_alias from u_dw within w_view_alias_maintenance
end type
type dw_view_alias from u_dw within w_view_alias_maintenance
end type
type dw_1 from datawindow within w_view_alias_maintenance
end type
type tv_view from u_tvs_rpt within w_view_alias_maintenance
end type
type gb_1 from groupbox within w_view_alias_maintenance
end type
end forward

global type w_view_alias_maintenance from w_main
integer width = 3040
integer height = 2176
string title = "View Alias Maintenance"
boolean maxbox = false
boolean resizable = false
windowtype windowtype = popup!
cb_reset_all cb_reset_all
cb_reset cb_reset
cb_expand cb_expand
dw_6 dw_6
dw_5 dw_5
cb_close cb_close
cb_save cb_save
cb_import cb_import
dw_select_view dw_select_view
dw_fields_alias dw_fields_alias
dw_view_alias dw_view_alias
dw_1 dw_1
tv_view tv_view
gb_1 gb_1
end type
global w_view_alias_maintenance w_view_alias_maintenance

type variables
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
Long il_OrigModule = 0
Blob iblb_data
Boolean ib_upLoad = False
//---------------------------- APPEON END ----------------------------


end variables

forward prototypes
public function integer of_getargs (u_tvs_rpt atv_args, long al_parent, integer ai_level, ref any aa_arg[20])
public function integer of_upload_image (string as_fullname)
public function integer of_update_image ()
public subroutine of_expandcollapseall (commandbutton acb_args, u_tvs_rpt atv_args)
end prototypes

public function integer of_getargs (u_tvs_rpt atv_args, long al_parent, integer ai_level, ref any aa_arg[20]);//====================================================================
// Event: w_custom_report.of_getargs()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//    value       treeview atv_args
// 	value    	long   	al_parent 	
// 	value    	integer	ai_level  	
// 	reference	any    	aa_arg[20]	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Andy		Date: 12.20.2007
//--------------------------------------------------------------------
//	
//--------------------------------------------------------------------
// Modify History:
//				
//====================================================================
Integer				li_Index
TreeViewItem		ltvi_Item

// check arguments
If (al_parent < 0) or IsNull(al_parent) Then Return -1
If (ai_level < 1) or IsNull(ai_level) Then Return -1

// Determine level 
li_Index = UpperBound(atv_args.inv_attrib)
If ai_Level > li_Index Then
	Return -1
Else
	li_Index = ai_Level
End If

if al_Parent <> 0 then
	If atv_args.GetItem(al_Parent, ltvi_Item) = -1 Then Return -1
end if

CHOOSE CASE ai_level
	CASE 1
		//do nothing
		
	CASE 2
		aa_arg[1] = ltvi_Item.data
		//$<add> 02.21.2008 by Andy
		aa_arg[2] = 0
END CHOOSE

Return 1

end function

public function integer of_upload_image (string as_fullname);//====================================================================
// Event: w_view_alias_maintenance.of_upload_image()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	string	fullname	
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Andy		Date: Dec 21,2007
//--------------------------------------------------------------------
//	
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

integer li_FileNum, li_loops, ll_i

long ll_flen, ll_Ret

blob lblb_data

// Set a wait cursor
SetPointer(HourGlass!)

If not fileexists(as_fullname) then return -1

// Open processs window
//openwithparm( w_appeon_gifofwait, "Uploading Image to Database..." )
	
// Get the file length, and open the file
ll_flen = FileLength(as_fullname)

// Open the file
li_FileNum = FileOpen(as_fullname, StreamMode!, Read!, LockRead!)

// Determine how many times to call FileRead
IF ll_flen > 32765 THEN
	IF Mod(ll_flen, 32765) = 0 THEN
		li_loops = ll_flen/32765
	ELSE
		li_loops = (ll_flen/32765) + 1
	END IF
ELSE
	li_loops = 1
END IF

// Read the file
FOR ll_i = 1 to li_loops
    ll_Ret = FileRead(li_FileNum, lblb_data)
    iblb_data = iblb_data + lblb_data
NEXT

// Close the file
FileClose(li_FileNum)

ib_upLoad = True
// Close process window
//IF Isvalid( w_appeon_gifofwait) THEN Close( w_appeon_gifofwait)

Return 1

end function

public function integer of_update_image ();//====================================================================
// Event: w_view_alias_maintenance.of_update_image()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Andy		Date: Dec 21,2007
//--------------------------------------------------------------------
//	
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long   ll_Row
String ls_v_name

IF NOT ib_upLoad THEN RETURN 1
ll_Row = dw_view_alias.GetRow( )

if ll_Row > 0 then 
	ls_v_name = dw_view_alias.GetItemString(ll_Row,"v_name")	
	
	UPDATEBLOB  view_alias
		 SET v_image = :iblb_data
	  WHERE v_name = :ls_v_name;
	IF SQLCA.SQLCODE <> 0 THEN
		RETURN -1
	END IF
END IF

ib_upLoad = False
RETURN 1

end function

public subroutine of_expandcollapseall (commandbutton acb_args, u_tvs_rpt atv_args);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
Long   ll_Root,ll_FirstRoot
String ls_Type

if lower(acb_args.text) = '&expand all' then
	acb_args.text = 'C&ollapse All'
	ls_Type = 'expandall'
else
	acb_args.text = '&Expand All'
	ls_Type = 'collapseall'
end if

ll_Root = atv_args.FindItem(RootTreeItem!, 0)
ll_FirstRoot = ll_Root
DO WHILE (1=1)
	if ll_Root < 1 then exit
	
	if lower(ls_Type) = 'expandall' then
		atv_args.ExpandAll ( ll_Root )
	else
		atv_args.collapseItem ( ll_Root )
		//delete all child
		//atv_args.of_reset( ll_Root )
	end if
	
	ll_Root = atv_args.FindItem(NextTreeItem!, ll_Root)
LOOP 

atv_args.selectItem(ll_FirstRoot)
atv_args.setfocus()
//---------------------------- APPEON END ----------------------------
end subroutine

on w_view_alias_maintenance.create
int iCurrent
call super::create
this.cb_reset_all=create cb_reset_all
this.cb_reset=create cb_reset
this.cb_expand=create cb_expand
this.dw_6=create dw_6
this.dw_5=create dw_5
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cb_import=create cb_import
this.dw_select_view=create dw_select_view
this.dw_fields_alias=create dw_fields_alias
this.dw_view_alias=create dw_view_alias
this.dw_1=create dw_1
this.tv_view=create tv_view
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reset_all
this.Control[iCurrent+2]=this.cb_reset
this.Control[iCurrent+3]=this.cb_expand
this.Control[iCurrent+4]=this.dw_6
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_save
this.Control[iCurrent+8]=this.cb_import
this.Control[iCurrent+9]=this.dw_select_view
this.Control[iCurrent+10]=this.dw_fields_alias
this.Control[iCurrent+11]=this.dw_view_alias
this.Control[iCurrent+12]=this.dw_1
this.Control[iCurrent+13]=this.tv_view
this.Control[iCurrent+14]=this.gb_1
end on

on w_view_alias_maintenance.destroy
call super::destroy
destroy(this.cb_reset_all)
destroy(this.cb_reset)
destroy(this.cb_expand)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cb_import)
destroy(this.dw_select_view)
destroy(this.dw_fields_alias)
destroy(this.dw_view_alias)
destroy(this.dw_1)
destroy(this.tv_view)
destroy(this.gb_1)
end on

event open;call super::open;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
Long ll_Root,ll_FistRoot

tv_view.event pfc_populate( 0)
//Expand All
ll_Root = tv_view.FindItem(RootTreeItem!, 0)
ll_FistRoot = ll_Root
DO WHILE (1=1)
	IF ll_Root < 1 THEN  EXIT	
	tv_view.ExpandAll(ll_Root)//expandItem
	ll_Root = tv_view.FindItem(NextTreeItem!, ll_Root)	
LOOP

if ll_FistRoot > 0 then 
	tv_view.selectitem( ll_FistRoot )
END IF
tv_view.setfocus( )
//---------------------------- APPEON END ----------------------------
end event

event pfc_postupdate;call super::pfc_postupdate;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
Long ll_Module,ll_Row,ll_handle
Long ll_Root,ll_data
TreeViewItem ltvi,ltvi_prt
String ls_v_alias,ls_data,ls_v_name

ll_Row = dw_view_alias.GetRow()
if ll_Row > 0 then
	ll_Module = dw_view_alias.GetItemNumber(ll_Row,"module")
	ls_v_alias= dw_view_alias.GetItemString(ll_Row,"v_alias")
	ls_v_name = dw_view_alias.GetItemString(ll_Row,"v_name")
	
	if ll_Module <> il_OrigModule then 
		//Move the TreeViewItem to new Module
		ll_handle = tv_view.Finditem( CurrentTreeItem!, 0)
		if ll_handle > 0 then
			if tv_view.getitem( ll_handle, ltvi) = 1 then
				
				//Find Root that it's data equal to new module. 
				DO WHILE (1=1)
					ll_Root = tv_view.FindItem(RootTreeItem!, 0)
					IF ll_Root < 1 then exit
					if tv_view.getitem( ll_Root, ltvi_prt) = 1 then
						ll_data = ltvi_prt.data
						if ll_data = ll_Module then 
							exit
						end if
					end if										
				LOOP 
				
				if ll_Root > 0 then
					//Delete Item from the old root.
					tv_view.DeleteItem ( ll_handle )
					//Insert Item to the new root.
					If tv_view.FindItem(ChildTreeItem!, ll_Root) = -1 Then
						tv_view.Expanditem( ll_Root )
						ll_handle = tv_view.FindItem(ChildTreeItem!, ll_Root)
						DO WHILE ll_handle > 0
							if tv_view.getitem( ll_handle, ltvi) = 1 then
								ls_data = ltvi.data
								if ls_data = ls_v_name then 
									exit
								end if
							end if
							ll_handle = tv_view.FindItem(NextTreeItem!, ll_handle)										
						LOOP
					else
						ltvi.label = ls_v_alias
						ll_handle  = tv_view.InsertItemLast( ll_Root, ltvi )						
					end if
					if ll_handle > 0 then
						tv_view.SelectItem ( ll_handle )
					end if
				end if
				
			end if
		end if
	end if	
end if

Return 1
//---------------------------- APPEON END ----------------------------
end event

type cb_reset_all from commandbutton within w_view_alias_maintenance
integer x = 27
integer y = 1972
integer width = 448
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset All Alias"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description: Reset All Alias of All Screen Views
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 07/05/2012
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


string ls_v_name
long ll_data_view_id,ll_row, ll_current_handle
n_cst_update_view_fields_alias lnv_update_alias 

If Messagebox('Field Alias','Do you want to reset all field aliases of all screen views?', Question!, Yesno!) = 2 Then Return

lnv_update_alias = Create n_cst_update_view_fields_alias
lnv_update_alias.of_update_view_fields_alias( 0, 0, True)

ll_current_handle = tv_view.finditem( CurrentTreeItem!	, 0)
If ll_current_handle > 0 Then
	tv_view.event selectionchanged( ll_current_handle,ll_current_handle)
End If

Destroy lnv_update_alias

end event

type cb_reset from commandbutton within w_view_alias_maintenance
integer x = 1093
integer y = 60
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Alias"
end type

event clicked;//reset alais - jervis 09.06.2011
string ls_v_name
long ll_data_view_id,ll_row

//Added By Ken.Guo 01/19/2012. 
If Messagebox('Field Alias','Do you want to reset the alias?', Question!, Yesno!) = 2 Then Return


//Get relative data.
ll_data_view_id = dw_select_view.GetItemNumber(1,"data_view_id")
ll_Row = dw_view_alias.GetRow()
if ll_Row < 1 then Return
ls_v_name = dw_view_alias.GetItemString(ll_Row,"v_name")

delete from view_fields_alias where data_view_id = :ll_data_view_id and v_name = :ls_v_name;
commit;

dw_fields_alias.SetRedraw( false)
dw_fields_alias.reset( )														//Added By Mark Lee 08/11/2015
dw_fields_alias.Retrieve( ls_v_name, ll_data_view_id )
cb_import.event clicked()
cb_save.event clicked( ) //Added By Ken.Guo 01/19/2012. 
dw_fields_alias.SetRedraw( true)


end event

type cb_expand from commandbutton within w_view_alias_maintenance
integer x = 1929
integer y = 60
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "C&ollapse All"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
of_expandcollapseall(this,tv_view)
//---------------------------- APPEON END ----------------------------

end event

type dw_6 from datawindow within w_view_alias_maintenance
integer x = 1088
integer y = 732
integer width = 1906
integer height = 88
integer taborder = 110
boolean enabled = false
boolean titlebar = true
string title = "Fields Alias"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_5 from datawindow within w_view_alias_maintenance
integer x = 1088
integer y = 208
integer width = 1906
integer height = 88
integer taborder = 90
boolean enabled = false
boolean titlebar = true
string title = "View Alias"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type cb_close from commandbutton within w_view_alias_maintenance
integer x = 2651
integer y = 60
integer width = 343
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;//$<add> 2007-12-20 By: Andy
Close(Parent)
end event

type cb_save from commandbutton within w_view_alias_maintenance
integer x = 2290
integer y = 60
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
boolean default = true
end type

event clicked;//$<add> 2007-12-21 By: Andy
Parent.event pfc_save( )
end event

type cb_import from commandbutton within w_view_alias_maintenance
integer x = 1454
integer y = 60
integer width = 457
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Import Fields Alias"
end type

event clicked;//====================================================================
// Event: clicked()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Andy		Date: 2008-01-14
//--------------------------------------------------------------------
//	Copyright (c) 1999-2010 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:Scofield		Date: 2010-04-21
//
//====================================================================

long		ll_data_view_id,ll_Row,ll_ScreenCnt
long		ll_Cycle,ll_Cnt,ll_dwCnt,ll_Find
String	ls_v_name,ls_Screen,ls_ScreenArray[]
String	ls_ScreenID,ls_c_name,ls_c_alias

n_cst_update_view_fields_alias	lnvo_Update
n_cst_string							lnvo_String
datastore								lds_view_fields_alias

ll_Row = dw_view_alias.GetRow()
if ll_Row < 1 then Return

This.Enabled = false
SetPointer(HourGlass!)

lnvo_Update = Create n_cst_update_view_fields_alias

lds_view_fields_alias = Create datastore
lds_view_fields_alias.DataObject = 'd_view_fields_alias_edit'
lds_view_fields_alias.SetTransObject(SQLCA)

//Get relative data.
ll_data_view_id = dw_select_view.GetItemNumber(1,"data_view_id")

ls_v_name = dw_view_alias.GetItemString(ll_Row,"v_name")
ls_Screen = dw_view_alias.GetItemString(ll_Row,"screen")
ls_Screen = ls_Screen + ','

lnvo_String.of_ParseToArray(ls_Screen,',',ls_ScreenArray )
ll_ScreenCnt = UpperBound(ls_ScreenArray)

//Get fields alias.
for ll_Cycle = 1 to ll_ScreenCnt
	ls_ScreenID = ls_ScreenArray[ll_Cycle]
	//ls_ScreenID is a DataObject name
	if Not IsNumber(ls_ScreenID) then
		//ls_ScreenID is a DataObject name	
		lnvo_Update.of_get_view_fields_alias(il_OrigModule,0,ls_ScreenID,ls_v_name,lds_view_fields_alias)
	else
		//ls_ScreenID is a screen id
		lnvo_Update.of_get_view_fields_alias(il_OrigModule,ll_data_view_id,ls_ScreenID,ls_v_name,lds_view_fields_alias)
	end if 
next

//if don't find alias out, then set a default value.
lnvo_Update.of_After_GetAliasFormScreen(lds_view_fields_alias)

//Set field alias.
ll_Cnt   = lds_view_fields_alias.RowCount()
ll_dwCnt = dw_fields_alias.RowCount()
for ll_Cycle = 1 to ll_Cnt
	ls_c_name = lds_view_fields_alias.GetItemString(ll_Cycle,"c_name")
//	ll_Find   = dw_fields_alias.Find("c_name='" + ls_c_name + "'",1,ll_dwCnt)							//Added By Mark Lee 08/11/2015 bug with Reset Alias function. 
	ll_Find   = dw_fields_alias.Find("lower(c_name)='" + lower(trim(ls_c_name)) + "'",1,dw_fields_alias.rowcount( ) )
	if ll_Find < 1 then
		//if field alias is not exist, then insert it.
		lds_view_fields_alias.Rowscopy(ll_Cycle,ll_Cycle,Primary!,dw_fields_alias,dw_fields_alias.RowCount() + 1,Primary!)
	else
		//if field alias is null(''), then replace it.
		ls_c_alias = dw_fields_alias.GetItemString(ll_Find,"c_alias")
		if IsNull(ls_c_alias) then ls_c_alias = ""
		if Trim(ls_c_alias) = "" then
			dw_fields_alias.SetItem(ll_Find,"c_alias",lds_view_fields_alias.GetItemString(ll_Cycle,"c_alias"))
		end if
		
		//Added By Ken.Guo 01/19/2012. 
		If lds_view_fields_alias.GetItemNumber(ll_Cycle,"visible")  = 1 Then
			dw_fields_alias.SetItem(ll_Find,"visible",1)
		End If		
		
	end if
next

Destroy lnvo_Update
Destroy lds_view_fields_alias

SetPointer(Arrow!)
This.Enabled = true

end event

type dw_select_view from u_dw within w_view_alias_maintenance
integer x = 55
integer y = 60
integer width = 987
integer height = 104
integer taborder = 10
string dataobject = "d_select_view_list_rpt"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
this.of_setupdateable( false )
InsertRow(0)
//---------------------------- APPEON END ----------------------------

end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-24 By: Andy
Long   ll_Row, ll_data_view_id
String ls_v_name 

ll_Row = dw_view_alias.GetRow( )
if ll_Row < 1 then return

ls_v_name = dw_view_alias.GetItemString(ll_Row,"v_name")
ll_data_view_id = long(data)

dw_fields_alias.retrieve(ls_v_name, ll_data_view_id)
//---------------------------- APPEON END ----------------------------

end event

type dw_fields_alias from u_dw within w_view_alias_maintenance
integer x = 1088
integer y = 812
integer width = 1906
integer height = 1132
integer taborder = 120
string dataobject = "d_view_fields_alias_edit"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = styleraised!
end type

event pfc_preupdate;call super::pfc_preupdate;//Added By Mark Lee 04/01/2015 checked if the alias name is SQL KEY WORD.
long 			i, ll_count
string 		ls_c_alias

ll_count  = this.rowcount( )
if ll_count >0 then 
	for i =1 to ll_count
		 ls_c_alias = this.getItemString( i, "c_alias")
		if  gnv_string.of_exists_sql_keyword(ls_c_alias) < 0 then 
			this.scrolltorow( i)
			this.SetColumn("c_alias")
			this.setfocus( )
			messagebox("Field Alias Error","The name ("+ls_c_alias+") you supplied for the current field is a SQL key word (reserved word). ~r~nPlease choose a different name.")
			return -1
		end if 
	next 	
end if 

end event

type dw_view_alias from u_dw within w_view_alias_maintenance
integer x = 1088
integer y = 288
integer width = 1906
integer height = 412
integer taborder = 100
string dataobject = "d_view_alias"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = styleraised!
end type

event buttonclicked;call super::buttonclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
Integer li_rtn,ll_Ret
String  ls_Path,ls_FileName

if Lower(String(dwo.name)) = 'b_1' then 
	gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
	li_rtn = GetFileOpenName("Select File", &
		 ls_Path, ls_FileName, ".bmp", &
		 "Bitmap (*.bmp),*.bmp,GIF (*.gif),*.gif,JPEG (*.jpg;*.jpeg),*.jpg;*.jpeg" )
	gf_save_dir_path(ls_Path) //Added by Ken.Guo on 2009-03-10
	//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008
	IF li_rtn < 1 THEN RETURN
	
	this.SetItem(Row,"p_name",ls_FileName)
	//Upload image
	ll_Ret = of_upload_image(ls_Path)
	if ll_Ret = 1 then 
		this.SetItem(Row,"datalen",1)
	end if
end if
//---------------------------- APPEON END ----------------------------
end event

event pfc_update;call super::pfc_update;//$<add> 2007-12-21 By: Andy
Return of_update_image()
end event

event retrieveend;call super::retrieveend;//$<add> 01.25.2008 by Andy
String ls_sflag
Long   ll_Row

this.Modify("b_1.enabled=true")

if rowcount = 0 then return
ll_Row = this.GetRow()
if ll_Row < 1 then return 

ls_sflag = this.GetItemString(ll_Row,"sflag")
if IsNull(ls_sflag) then ls_sflag = 'N'
if Upper(ls_sflag) = 'Y' then 
	this.Modify("b_1.enabled=false")
else
	this.Modify("b_1.enabled=true")
end if
end event

type dw_1 from datawindow within w_view_alias_maintenance
integer x = 23
integer y = 208
integer width = 1042
integer height = 88
integer taborder = 20
boolean enabled = false
boolean titlebar = true
string title = "View List"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type tv_view from u_tvs_rpt within w_view_alias_maintenance
integer x = 18
integer y = 288
integer width = 1042
integer height = 1656
integer taborder = 30
end type

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-20 By: Andy
this.of_register( 1, "module", "name", "", "d_view_module_all", SQLCA, "")
this.of_register( 2, "v_name", "v_alias", ":al_module,:al_view_id", "d_view_names", SQLCA, "")
//---------------------------- APPEON END ----------------------------
end event

event selectionchanged;call super::selectionchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
Integer      li_level
Long         ll_module,ll_Root,ll_Cnt,ll_Row
Long         ll_data_view_id
String       ls_v_name,ls_Filter
datawindowchild ldwc
TreeViewItem ltvi,ltvi_Prt

if this.getItem(newhandle,ltvi) = 1 then
	li_level  = ltvi.level	
	if li_level = 1 then
		ll_module = ltvi.data
		dw_view_alias.Reset( )
		dw_fields_alias.Reset( )		
	elseif li_level = 2 then
		ls_v_name = ltvi.data
		ll_Root = this.Finditem( ParentTreeItem!, newhandle)
		if ll_Root > 0 then 
			if this.getItem(ll_Root,ltvi_Prt) = 1 then
				ll_module = ltvi_Prt.data
			end if
		end if		
	end if
	
	//Filter data for data_view_id
	if ll_module <> il_OrigModule then 
		il_OrigModule = ll_module
		if ll_module = 1 then 
			ls_Filter = "Upper(type_c)='C'"
			ll_data_view_id = 1001
		elseif ll_module = 2 then
			ls_Filter = "Upper(type_c)='P'"
			ll_data_view_id = 1
		else
			ls_Filter = "1=2"
			ll_data_view_id = 0
		end if		
		if dw_select_view.GetChild("data_view_id",ldwc) = 1 then 
			ldwc.SetTransObject( SQLCA )
			ldwc.SetFilter( ls_Filter )
			ldwc.Filter( )
		end if
		dw_select_view.setitem(1,"data_view_id",ll_data_view_id)
	end if
	
	if li_level = 2 then
		//Retrieve view alias
		ll_Cnt = dw_view_alias.Retrieve(ls_v_name)
		//if view alias not exists, then add it.
		if ll_Cnt < 1 then 
			ll_Row = dw_view_alias.InsertRow(0)
			dw_view_alias.SetItem(ll_Row,"module", ll_module)
			dw_view_alias.SetItem(ll_Row,"v_name", ls_v_name)
			dw_view_alias.SetItem(ll_Row,"sflag" , "N")
			//Set row status New!
			dw_view_alias.SetItemStatus( ll_Row, 0, Primary!, NotModified!	)
		end if
		ll_data_view_id = dw_select_view.GetItemNumber( 1 , "data_view_id")
		dw_fields_alias.Retrieve( ls_v_name, ll_data_view_id )
	end if
	
end if
//---------------------------- APPEON END ----------------------------

end event

event selectionchanging;call super::selectionchanging;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-21 By: Andy
Integer li_Ret,ll_R

li_Ret = of_updatespending( )
if li_Ret = 1 then
	ll_R = messagebox(gnv_app.iapp_object.DisplayName,'Do you want to save changes?',question!,yesnocancel!)
	IF ll_R = 1 THEN
		IF event pfc_save() < 0 THEN
			return 1
		END IF
	ELSEIF ll_R = 3 THEN
		return 1
	END IF
end if
//---------------------------- APPEON END ----------------------------
end event

event doubleclicked;//do nothing
end event

event begindrag;//do nothing
end event

event dragdrop;//do nothing
end event

type gb_1 from groupbox within w_view_alias_maintenance
integer x = 23
integer width = 1042
integer height = 184
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Screen View"
end type

