$PBExportHeader$w_clause_template_list.srw
forward
global type w_clause_template_list from w_main
end type
type ole_1 from u_email_edit within w_clause_template_list
end type
type tv_clause from u_tvs within w_clause_template_list
end type
end forward

global type w_clause_template_list from w_main
integer width = 5248
integer height = 2188
string title = "Clause Template Map"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean clientedge = true
boolean center = true
ole_1 ole_1
tv_clause tv_clause
end type
global w_clause_template_list w_clause_template_list

type variables
string is_agreement_path

//Added By Jay Chen 09-12-2014
string is_current_file
long il_map_clause
oleobject iole_word 
n_cst_word_utility inv_word 

//WDOpenFormat
constant int wdOpenFormatAllWord = 6 
constant int wdOpenFormatAuto = 0 
constant int wdOpenFormatDocument = 1 
constant int wdOpenFormatEncodedText = 5 
constant int wdOpenFormatRTF = 3 
constant int wdOpenFormatTemplate = 2 
constant int wdOpenFormatText = 4 
constant int wdOpenFormatUnicodeText =  5 
constant int wdOpenFormatWebPages = 7 
constant int wdOpenFormatXML = 8 

//WdFindWrap
Constant int wdFindAsk = 2 
Constant int wdFindContinue = 1 
Constant int wdFindStop = 0 
Constant Long wdColorBlack = 0
Constant long wdFormatDocument = 0 

boolean ib_map = false //map on or off //Added By Jay Chen 09-11-2014
long il_clause_id
end variables

forward prototypes
public function integer of_build_template_tree (long al_clause_id)
public function integer of_display_template_file (long al_template_id)
end prototypes

public function integer of_build_template_tree (long al_clause_id);//====================================================================
// Function: of_build_template_tree
//--------------------------------------------------------------------
// Description: find templates which are used the current clause.
//--------------------------------------------------------------------
// Arguments:
// 	value    long    al_clause_id
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-16-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long i,ll_cnt,ll_row
long ll_handle,ll_root,ll_new_handle,ll_first_handle
long ll_category,ll_template_id,ll_category_temp
string ls_category_name,ls_template_name
long ll_height
treeviewitem litv_item
datastore lds_template_list

lds_template_list = create n_ds
lds_template_list.dataobject = "d_template_tree_list_by_clause"
lds_template_list.settransobject(sqlca)
lds_template_list.retrieve(al_clause_id)
ll_cnt = lds_template_list.rowcount()

//clear the treeview
ll_handle = tv_clause.finditem(roottreeitem!, 0)
do while ll_handle > 0 
   	tv_clause.deleteitem(ll_handle)
	ll_handle = tv_clause.finditem(roottreeitem!, 0)
loop

//insert root treeview item
litv_item.label = "Template(s) Which Reference This Clause"
litv_item.data = -1
litv_item.children = true
litv_item.pictureindex =1
litv_item.overlaypictureIndex = 1
litv_item.selectedpictureindex = 2

ll_root = tv_clause.insertitemlast(0,litv_item)
ll_handle = ll_root

if ll_cnt < 1 then return -1

for i = 1 to ll_cnt 
	ll_category = lds_template_list.getitemnumber(i,"category")
	ls_category_name = lds_template_list.getitemstring(i,"category_name")
	ll_template_id = lds_template_list.getitemnumber(i,"ctx_acp_template_id")
	ls_template_name = lds_template_list.getitemstring(i,"template_name")	
	
	if ll_category <> ll_category_temp then 
		//build category item
		litv_item.label = ls_category_name
		litv_item.data = ll_category
		litv_item.children = true
		litv_item.pictureindex =1
		litv_item.overlaypictureIndex = 1
		litv_item.selectedpictureindex = 2	
		ll_handle = tv_clause.insertitemlast(ll_root,litv_item)
		ll_category_temp = ll_category				
	end if
	
	//build template item
	if not isnull(ll_template_id) then 
		litv_item.label = ls_template_name
		litv_item.data = ll_template_id
		litv_item.children = false
		litv_item.pictureindex = 7  //mapped template
		litv_item.overlaypictureIndex = 3
		litv_item.selectedpictureindex = 4	
		ll_new_handle = tv_clause.insertitemlast(ll_handle,litv_item)		
		if i = 1 then ll_first_handle = ll_new_handle
	end if
next

ll_handle = tv_clause.finditem(roottreeitem!, 0)
if ll_handle > 0 then tv_clause.expanditem(ll_handle)

//tv_clause.selectitem(ll_root)
if ll_first_handle <> 0 then
	tv_clause.selectitem(ll_first_handle)
else
	tv_clause.selectitem(ll_root)
end if

//if il_map_clause <> al_clause_id then 
//	ll_height = ole_1.height
//	of_template_maponoff(false)
//	ole_1.height = ll_height
//	if isvalid(w_clause_painter) then
//		w_clause_painter.ib_map = false
//	end if
//end if
//il_map_clause = al_clause_id

		
return 1

end function

public function integer of_display_template_file (long al_template_id);//====================================================================
// Function: of_display_template_file
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long    al_template_id
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-12-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

n_cst_word_utility lnv_word
Long k,i
Decimal{2} ldec_revision
datetime ldt_modify_date
string ls_template_name,ls_bookmark

lnv_word = Create n_cst_word_utility
setpointer(HourGlass!)

ls_template_name = gs_dir_path + gs_DefDirName + "\Agreement\template_" + string(al_template_id) + ".doc"
if lower(is_current_file) = lower(ls_template_name) then //file already opened
	return -1
end if

openwithparm( w_appeon_gifofwait, "Opening selected document..." )
		
//Get template files
Select modify_date into :ldt_modify_date From ctx_acp_template Where ctx_acp_template_id = :al_template_id ;

IF lnv_word.of_get_template_file(al_template_id, ldt_modify_date) = -1 THEN
	Destroy lnv_word
	RETURN -1
END IF

//Open the file in the tabpage of template detail
is_current_file ="" 
if isnull(ls_template_name) or len(trim(ls_template_name)) < 1 then 
	If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
	ole_1.object.close()
	return -1
end if

TRY
	IF not FileExists(ls_template_name) THEN
		If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-30. workaround Task 524
		ole_1.object.CreateNew("Word.Document")
		If FileExists(ls_template_name) Then FileDelete(ls_template_name)
		If gs_ImageView_Version <> '4.0' Then ole_1.object.filesave = True
		ole_1.object.ActiveDocument.SaveAs(ls_template_name, wdFormatDocument,false,'',false) //Word 2003 format
		If gs_ImageView_Version <> '4.0' Then ole_1.object.filesave = False
		gnv_shell.of_delete_recent( ls_template_name, true) //Added By Ken.Guo 2010-05-25. Delete Windows Recent Document.
		app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
		If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_1.object.openLocalFile(ls_template_name, false)				
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	ELSE
		app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
		If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
		ole_1.object.openLocalFile(ls_template_name, false) 
		app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	END IF
	gnv_word_utility.of_modify_word_property( ole_1.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
CATCH (runtimeerror rte) //Alfee 09.23.2008
	If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
	ole_1.object.Close()
	MessageBox("Open Document","Failed to open document due to: ~r~n" + rte.text)
	RETURN -1
END TRY

is_current_file = ls_template_name

//Added By Mark Lee 07/20/12		add sys_tracking_log record
//gnv_tracking.of_tracking_doc(gnv_tracking.template_library_painter,string(al_template_id),'','','','add_doc_tracking',false)

ole_1.setfocus()

if ole_1.object.DocType <> 1  then 
	is_current_file =""
	return -1
end if	
	
//assign iole_word object variable
iole_word = ole_1.object.ActiveDocument

//set zoom percentage
iole_word.ActiveWindow.View.Zoom.Percentage = 100

//--------Added by alfee 04.16.2007-for numbering----
iole_word.ActiveWindow.View.ShowFieldCodes = False
//inv_word.of_update_field(iole_word,False)//only update seq fields
//--------End Added ---------------------------------

//-----------------Added By alfee 05.05.2007---------
//Set default color property for hyperlink field
//----------Begin Modified by Alfee on 10.07.2008----------------------
//<$Reason>For performance tuning
IF iole_word.Application.Language = 1033 THEN //us-en
	iole_word.Styles.Item("Hyperlink").Font.Color = wdColorBlack
	iole_word.Styles.Item("FollowedHyperlink").Font.Color = wdColorBlack
END IF

ls_bookmark = "clause_" + string(il_map_clause)
If Not ole_1.object.Activedocument.Content.Bookmarks.Exists(ls_bookmark) Then Return -1
ole_1.object.Activedocument.Content.Bookmarks.item(ls_bookmark).select()

if isvalid( w_appeon_gifofwait) then close(w_appeon_gifofwait)
destroy iole_word 
return 1
end function

on w_clause_template_list.create
int iCurrent
call super::create
this.ole_1=create ole_1
this.tv_clause=create tv_clause
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_1
this.Control[iCurrent+2]=this.tv_clause
end on

on w_clause_template_list.destroy
call super::destroy
destroy(this.ole_1)
destroy(this.tv_clause)
end on

event open;call super::open;//====================================================================
// Event: open
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-16-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_clause_name

is_agreement_path = gs_dir_path + gs_DefDirName + "\Agreement\" 
il_clause_id = message.doubleparm
il_map_clause = il_clause_id
SELECT clause_name INTO :ls_clause_name FROM ctx_acp_clause WHERE ctx_acp_clause_id=:il_clause_id;

this.title = 'Template Map For Clause: ' + ls_clause_name 
of_build_template_tree(il_clause_id)  



end event

event pfc_preopen;call super::pfc_preopen;
long ll_i
string ls_scale

This.of_SetResize(True)

This.inv_resize.of_SetOrigSize (This.workspacewidth(),This.workspaceheight())
ls_scale = this.inv_resize.scale

For ll_i =  1 To upperbound(This.CONTrol)
   This.inv_resize.of_Register (This.CONTrol[ll_i],ls_scale)
Next


end event

event activate;call super::activate;If gs_imageview_version = '5.0' and isvalid(ole_1 ) Then
	ole_1.object.activate(true)
End If


end event

event closequery;call super::closequery;If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
ole_1.object.close()
destroy inv_word  
destroy iole_word 
end event

type ole_1 from u_email_edit within w_clause_template_list
integer x = 1189
integer width = 4018
integer height = 2068
integer taborder = 20
string binarykey = "w_clause_template_list.win"
end type

event constructor;call super::constructor;this.object.menubar(true)
end event

type tv_clause from u_tvs within w_clause_template_list
integer x = 14
integer width = 1161
integer height = 2068
integer taborder = 10
fontcharset fontcharset = ansi!
boolean linesatroot = true
boolean disabledragdrop = false
boolean hideselection = false
boolean fullrowselect = true
grsorttype sorttype = ascending!
string picturename[] = {"Custom039!","Custom050!","MultiLineEdit!","RetrieveCancel!","sectiongreen.bmp","Properties!","MultiLineEdit!"}
string statepicturename[] = {"checkmark.bmp","check.bmp"}
end type

event selectionchanged;call super::selectionchanged;//====================================================================
// Event: selectionchanged
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long    oldhandle
// 	value    long    newhandle
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 09-16-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long	ll_template_id
TreeViewItem ltvi_Item

if tv_Clause.GetItem(NewHandle,ltvi_Item) = 1 then
	if  ltvi_Item.PictureIndex  = 7 then //mapped template
		ll_template_id = ltvi_Item.data
		of_display_template_file(ll_template_id)
	end if	
end if

end event

event rightclicked;return 1 //Added By Jay Chen 12-18-2014
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
00w_clause_template_list.bin 
2C00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000debb802001d1bad700000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b13000000000debb802001d1bad7debb802001d1bad70000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd00005ad90000356f8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000003400330029003400310020002f0030003300310032002f0031003000200034003500310032003a1234abcd00005ad90000356f8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000000174c00070000000000000000000000000014000000141060000004808580000000000000000000000028000000510004174c000417460000000000000000000000140065005700740073007200650000006e0000000000000028000000510004174c000417400000000000000000000000140000001410600000047fe478000000000800766400000000000000512081ff20000000250000001d000000080000000500000000000000100000002000000190000000000000006000000060212200200020000021000000000000000001004000000020000000250000001000000000000000000000000000000000000000000000000008006c61000000003e00003e000e037e0472287004721480000000000000000000000028000000510004174c000417460000000000000000000000140000001410600000047fe568000000000000000000000028000000510004174c000417400000000000000000000000140000001410600000047fe5b8000000000000000000000028000000510004174c0004174200000000000000000000001400000014106000000030c558000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10w_clause_template_list.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
