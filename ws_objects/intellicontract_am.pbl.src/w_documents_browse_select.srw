$PBExportHeader$w_documents_browse_select.srw
forward
global type w_documents_browse_select from window
end type
type cb_1 from commandbutton within w_documents_browse_select
end type
type dw_browse from u_dw_contract within w_documents_browse_select
end type
type dw_filter from u_dw_contract within w_documents_browse_select
end type
type cb_2 from commandbutton within w_documents_browse_select
end type
type cb_select from commandbutton within w_documents_browse_select
end type
end forward

global type w_documents_browse_select from window
integer width = 4091
integer height = 2084
boolean titlebar = true
string title = "Documents Browse"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_filter ( )
event type integer ue_retrieve ( )
cb_1 cb_1
dw_browse dw_browse
dw_filter dw_filter
cb_2 cb_2
cb_select cb_select
end type
global w_documents_browse_select w_documents_browse_select

type variables
n_ds ids_ctx_group_user_view,ids_ctx_screens,ids_category_access
datastore ids_search
long il_ctx_id,il_current_screen 
boolean 	ib_retrieved

string is_OldSort = "D"  //Add by Evan on 05/22/2008
string is_OldSortColumn  //Add by Evan on 05/22/2008
end variables

forward prototypes
public subroutine of_filter_no_access_data ()
public function integer of_get_access_right (long al_row, ref string as_reason)
public function long of_get_ctx_view_id (long al_category, long al_ctx_id)
public subroutine of_create_document_dw ()
end prototypes

event ue_filter();String ls_filter
Long ll_ctx_id,ll_doc_category,ll_doc_status,ll_doc_id
String ls_doc_name,ls_doc_ext,ls_create_by,ls_company_name,ls_doc_type

dw_filter.AcceptText()

ls_filter = "1 = 1 "
ll_ctx_id = dw_filter.GetItemNumber(1,'ctx_id')
If Not isnull(ll_ctx_id) and ll_ctx_id <> 0 Then
	ls_filter += ' And ctx_id = '  + String(ll_ctx_id)
End If

ll_doc_id =  dw_filter.GetItemNumber(1,'doc_id')
If Not isnull(ll_doc_id) Then
	ls_filter += ' And doc_id = '  + String(ll_doc_id)
End If

ls_doc_name = dw_filter.GetItemString(1,'doc_name')
If ls_doc_name <> '' and Not isnull(ls_doc_name) Then
	ls_filter += " And Pos(Upper(doc_name_full),'" + Upper(ls_doc_name)  + "' ,1) > 0"
End If

ls_doc_ext = dw_filter.GetItemString(1,'doc_ext')
If ls_doc_ext <> '' and Not isnull(ls_doc_ext) Then
	ls_filter += " And Upper(doc_ext) = '" +ls_doc_ext+ "'"
End If

//Added By Ken.Guo 2011-04-02.
ls_doc_type = dw_filter.GetItemString(1,'doc_type')
If ls_doc_type <> '' and Not isnull(ls_doc_type) Then
	ls_filter += " And Pos(Upper(doc_type),'" + Upper(ls_doc_type)  + "' ,1) > 0"
End If

ll_doc_category = dw_filter.GetItemNumber(1,'doc_category')
If Not isnull(ll_doc_category) Then
	ls_filter += ' And category = '  + String(ll_doc_category)
End If

ll_doc_status = dw_filter.GetItemNumber(1,'status')
If Not isnull(ll_doc_status) Then
	ls_filter += ' And status = '  + String(ll_doc_status)
End If

ls_create_by = dw_filter.GetItemString(1,'createby')
If ls_create_by <> '' and Not isnull(ls_create_by) Then
	ls_filter += " And create_by = '" +ls_create_by+ "'"
End If

ls_company_name = dw_filter.GetItemString(1,'company_name')
If ls_company_name <> '' and Not isnull(ls_company_name) Then
	ls_filter += " And Pos(Upper(facility_name),'" + Upper(ls_company_name)  + "' ,1) > 0"
End If

//Added By Ken.Guo 2011-06-27. 
String ls_checkout_by
ls_checkout_by =  dw_filter.GetItemString(1,'checkout_by')
If ls_checkout_by <> '' and Not isnull(ls_checkout_by) Then
	ls_filter += " And checkout_by = '" +ls_checkout_by+ "'"
End If

//Added By Ken.Guo 2011-06-27. 
String ls_checkout_status
ls_checkout_status =  dw_filter.GetItemString(1,'checkout_status')
If ls_checkout_status <> '' and Not isnull(ls_checkout_status) Then
	Choose Case ls_checkout_status
		Case '100' //checked out with all
			ls_filter += " And checkout_status in ('1','2','3','5','6') "
		Case '2'
			ls_filter += " And checkout_status in ('2','3') "
		Case '5'
			ls_filter += " And checkout_status in ('5','6') "
		Case Else 
			ls_filter += " And checkout_status = '" +ls_checkout_status+ "' "
	End Choose
End If

//Added By Jay Chen 04-01-2014 Remark: add custom fields
string ls_colname,ls_value,ls_coltype,ls_visible,ls_Edit_Style,ls_data,ls_display
long ll_cnt,ll_row
dec{2} ldc_custom_number
datetime ldt_custom_date
ll_cnt = long(dw_filter.Describe( "DataWindow.Column.Count" ))
for ll_row = 1 to ll_cnt
	ls_colname = lower(dw_filter.Describe("#"+string( ll_row ) + ".name"))
	if left(ls_colname,7) <> 'custom_' then continue
	ls_coltype = lower(dw_filter.Describe("#"+string( ll_row ) + ".coltype" ))
	ls_visible = dw_filter.Describe(ls_colname + ".Visible")
	ls_Edit_Style = dw_filter.Describe(ls_colname + ".Edit.Style")
	if ls_visible <> '1' then continue
	choose case left(ls_coltype,4)
		case 'char'
			ls_value = dw_filter.getitemstring(1,ls_colname)
			if not isnull(ls_value) and ls_value<>''  then 
				if ls_Edit_Style = "dddw" then
					ls_filter += " and "+ls_colname+" = '" + ls_value+"' "
				else
					ls_filter += " and pos(lower("+ls_colname+"), '" + lower(ls_value) + "') > 0 " 
				end if
			end if
			
		case 'deci'
			ldc_custom_number = dw_filter.getitemdecimal(1,ls_colname)
			if not isnull(ldc_custom_number) then 
				ls_filter += " and "+ls_colname+" = " + string(ldc_custom_number) + " "
			end if
			
		case 'date'
			ldt_custom_date = dw_filter.getitemdatetime(1,ls_colname)
			if not isnull(ldt_custom_date) then 
				ls_filter += " and string("+ls_colname+",'yyyy/mm/dd') = '" + string(ldt_custom_date,'yyyy/mm/dd') + "' "
			end if
	end choose
next
//end add

dw_browse.SetFilter(ls_filter)
dw_browse.Filter()

If dw_browse.RowCount() = 0 Then
	//Tab_1.tabpage_preview.enabled = False
Else
	dw_browse.SetRow(1)
	dw_browse.ScrolltoRow(1)
	dw_browse.SelectRow(0,False)
	dw_browse.SelectRow(1,True)
	dw_browse.event rowfocuschanged(1)
End If
end event

event type integer ue_retrieve();//Override Ancestor Script

//Check Document Manager whether visible for current user
If w_mdi.of_security_access(2150) = 0 Then
	Messagebox('Documents',"You don't have right to view the Document Manager Tab.")
	Return 0
End If

SetPointer(HourGlass!)
dw_browse.SetFilter("")

dw_browse.SetRedraw(False)
gnv_appeondb.of_startqueue( )
	dw_browse.Retrieve(gs_user_id)
	ids_ctx_group_user_view.Retrieve(gs_user_id)
	ids_ctx_screens.Retrieve(gs_user_id)
	ids_category_access.Retrieve(gs_user_id,1)
gnv_appeondb.of_commitqueue( )
This.of_filter_no_access_data( )
//Added By Jay Chen 04-02-2014
ids_search = Create DataStore
ids_search.DataObject = dw_browse.DataObject
dw_browse.RowsCopy(1,dw_browse.RowCount(),Primary!,ids_search,1,Primary!)
//end add
This.event ue_filter( ) //Added By Ken.Guo 2010-10-20.
dw_browse.SetRedraw(True)
SetPointer(Arrow!)
ib_retrieved = True
Return 1

end event

public subroutine of_filter_no_access_data ();//////////////////////////////////////////////////////////////////////
// $<function>u_tabpg_document_browseof_filter_no_access_data()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description> Filter data what the user have no right to view
//////////////////////////////////////////////////////////////////////
// $<add> 2010-08-03 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long i,ll_row_cnt
String ls_err
Datawindow ldw_browse

ldw_browse = dw_browse
ll_row_cnt = ldw_browse.RowCount() 
If ll_row_cnt = 0 Then Return
SetPointer(HourGlass!)
For i = ll_row_cnt to 1 Step -1
	If This.of_get_access_right( i, ls_err) = 0 Then
		ldw_browse.Rowsdiscard( i, i, Primary!)
	End If
Next

Return 
end subroutine

public function integer of_get_access_right (long al_row, ref string as_reason);//////////////////////////////////////////////////////////////////////
// Function: of_get_access_right()
// Arguments:
// 	value    long   al_row
// 	ref    string    as_reason
//--------------------------------------------------------------------
// Return:  integer
////2: Full Access;    1: Read Only;    0: No Access
//--------------------------------------------------------------------
// Author:	Ken.Guo		Date: 2010-08-02
//--------------------------------------------------------------------
// Description: Get Right/Access for the Document
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////

String ls_access
Long ll_ctx_id,ll_view_id,ll_doc_category,ll_ctx_category
Datawindow ldw_browse

If al_row = 0 Then Return 0

ldw_browse = dw_browse

ll_ctx_id = ldw_browse.GetItemNumber(al_row,'ctx_id')
ll_doc_category = ldw_browse.GetItemNumber(al_row,'category')
ll_ctx_category = ldw_browse.GetItemNumber(al_row,'ctx_basic_info_category')
ls_access = ldw_browse.GetItemString(al_row,'ctx_access_list_access')
ll_view_id = This.of_get_ctx_view_id(ll_ctx_category,ll_ctx_id)

//Check Document Manager Tab whether visible for current view
if ids_ctx_screens.RowCount() = 0 then ids_ctx_screens.Retrieve(gs_user_id) //Added By Jay Chen 04-04-2014
If ids_ctx_screens.Find('data_view_id = ' + String(ll_view_id) + ' and tab_name = "tabpage_images"',1,ids_ctx_screens.RowCount()) = 0 Then
	as_reason = 'Because the Document Manager Tab is invisible for Contract '+String(ll_ctx_id)+'.'
	Return 0
End If

//Check Documents whether filter
If gnv_data.of_getitem( 'icred_settings', 'filter_documents', False) = '1' Then 
	If	ids_category_access.find( 'lookup_code = '+ String(ll_doc_category),1, ids_category_access.rowcount()) > 0 Then
		as_reason = 'Because the document has been auto filter by right in the Document Manager.'
		Return 0
	End If
End If

//Documents Browse Module whether ReadOnly
If w_mdi.of_security_access(6979) = 1 then 
	Return 1
End If

//Check Contract Main Module whether ReadOnly
If w_mdi.of_security_access(2070) = 1 Then
	Return 1
End If

//Check Document Manager Tab whether ReadOnly
If w_mdi.of_security_access(2150) = 1 Then
	Return 1
End If

//Get Contract Access
Choose Case Upper(ls_access) 
	Case 'F'
		Return 2
	Case 'R'
		Return 1
End Choose

Return 0




end function

public function long of_get_ctx_view_id (long al_category, long al_ctx_id);//////////////////////////////////////////////////////////////////////
// $<function>u_tabpg_contract_search::of_get_ctx_view()
// $<arguments>
//		value	long	al_category		
//		value	long	al_ctx_id        		
// $<returns> integer
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
//Added By Ken.Guo 2010-08-02.
//////////////////////////////////////////////////////////////////////

Long ll_row
Long ll_view_id

//Get From Group Access
ll_row = ids_ctx_group_user_view.Find('ctx_group_access_ctx_id = ' + String(al_ctx_id) + ' And Upper(security_group_users_user_id) = "'+upper(gs_user_id)+'"',1,ids_ctx_group_user_view.RowCount()) 
If ll_Row > 0 Then
	ll_view_id = ids_ctx_group_user_view.GetItemNumber(ll_row,'ctx_group_access_view_id')
	Return ll_view_id
End If

//Get From Category from Code_Lookup	
ll_view_id = Long(gnv_data.of_getitem('code_lookup','ic_n',"lookup_code = " + string(al_category)))

//Get From Default View
If isnull(ll_view_id) Or ll_view_id = 0 Then
	ll_view_id = Long(gnv_data.of_getitem('security_users','contract_default_view',"upper(user_id)='" + upper(gs_user_id) + "'"))
End If
If isnull(ll_view_id) Or ll_view_id = 0 Then
	ll_view_id = 1001
End If

Return ll_view_id
end function

public subroutine of_create_document_dw ();//====================================================================
// Function: of_create_document_dw
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 04-01-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string ls_tab_name,ls_dw_name[],ls_dataobject[]
datawindow ld_dw[]

ls_tab_name = 'tabpage_images'
ld_dw[1] = dw_filter
ld_dw[2] = dw_browse
ls_dw_name[1] = 'dw_filter'
ls_dw_name[2] = 'dw_browse'
ls_dataobject[1] = 'd_doc_br_search'
ls_dataobject[2] = 'd_doc_br_browse'
f_create_contract_dw(gl_SearchTab_document_View,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)

end subroutine

on w_documents_browse_select.create
this.cb_1=create cb_1
this.dw_browse=create dw_browse
this.dw_filter=create dw_filter
this.cb_2=create cb_2
this.cb_select=create cb_select
this.Control[]={this.cb_1,&
this.dw_browse,&
this.dw_filter,&
this.cb_2,&
this.cb_select}
end on

on w_documents_browse_select.destroy
destroy(this.cb_1)
destroy(this.dw_browse)
destroy(this.dw_filter)
destroy(this.cb_2)
destroy(this.cb_select)
end on

event open;//Added By Jay 2016-06-14
double 	ldb_message

ldb_message = message.doubleparm

If ldb_message > 0 Then
	il_ctx_id = Long ( ldb_message )
End If

ids_ctx_group_user_view = create n_ds
ids_ctx_group_user_view.dataobject = 'd_ctx_group_user_view_pt'
ids_ctx_group_user_view.settransobject(sqlca)

ids_ctx_screens = create n_ds
ids_ctx_screens.dataobject = 'd_ctx_screen'
ids_ctx_screens.settransobject(sqlca)

ids_category_access = Create n_ds
ids_category_access.dataobject = 'd_category_no_access'
ids_category_access.settransobject(sqlca)


long ll_Dynamic,ll_SearchTab_View_id
Boolean	lb_DefaultViewSearch

SELECT Dynamic_Search_Tab
INTO :ll_Dynamic
FROM security_users 
WHERE user_id = :gs_user_id;

if ll_Dynamic = 0  then
	lb_DefaultViewSearch = false
else
	lb_DefaultViewSearch = true
end if

if lb_DefaultViewSearch then
	ll_SearchTab_View_id = long(gnv_data.of_getitem('security_users','contract_default_view',"upper(user_id)='" + Upper(gs_user_id) + "'"))
end if
if IsNull(ll_SearchTab_View_id) or ll_SearchTab_View_id = 0 then ll_SearchTab_View_id = 1001

gl_SearchTab_document_View = ll_SearchTab_View_id

of_create_document_dw()

If dw_filter.GetRow() > 0 Then
	If il_ctx_id > 0 Then
		dw_filter.SetItem ( dw_filter.GetRow(), 'ctx_id', il_ctx_id )
		dw_filter.SetItem ( dw_filter.GetRow(), 'doc_ext', 'DOC' )
	End If	
Else
	dw_Filter.InsertRow ( 0 )
	If il_ctx_id > 0 Then
		dw_filter.SetItem ( dw_filter.GetRow(), 'ctx_id', il_ctx_id )
		dw_filter.SetItem ( dw_filter.GetRow(), 'doc_ext', 'DOC' )
	End If	
	dw_Filter.event ue_populatedddws( )
End If

DataWindowChild ldwc_doc_ext,ldwc_company, ldwc_child
dw_filter.GetChild('doc_ext',ldwc_doc_ext)
ldwc_doc_ext.SetTransObject(SQLCA)

dw_filter.GetChild('company_name',ldwc_company)
ldwc_company.SetTransObject(SQLCA)

gnv_appeondb.of_startqueue( )
	ldwc_company.Retrieve()
	ldwc_doc_ext.Retrieve()
gnv_appeondb.of_commitqueue( )

dw_filter.GetChild( "doc_category",ldwc_child)
n_cst_right lnv_right
If gnv_data.of_getitem( 'icred_settings', 'filter_documents', False) = '1' Then 
	lnv_right = Create n_cst_right
	lnv_right.of_filter_right( ldwc_child, 'lookup_code', 1)
	Destroy lnv_right
End If

dw_filter.SetFocus()


end event

event close;If isvalid(ids_ctx_group_user_view) Then Destroy ids_ctx_group_user_view
If isvalid(ids_ctx_screens) Then Destroy ids_ctx_screens
If isvalid(ids_category_access) Then Destroy ids_category_access
If isvalid ( ids_search ) Then Destroy ids_search
end event

type cb_1 from commandbutton within w_documents_browse_select
integer x = 2994
integer y = 1896
integer width = 343
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "S&earch"
boolean default = true
end type

event clicked;If ib_retrieved Then	
	dw_browse.reset( )
	ids_search.RowsCopy(1,ids_search.RowCount(),Primary!,dw_browse,1,Primary!)
	Event ue_filter( )
Else
	Event ue_retrieve( )
End If
end event

type dw_browse from u_dw_contract within w_documents_browse_select
event ue_sort ( string as_column )
string tag = "Document Browse"
integer x = 32
integer y = 616
integer width = 4037
integer height = 1260
integer taborder = 10
boolean titlebar = true
string title = "Document Browse"
string dataobject = "d_doc_br_browse"
boolean hscrollbar = true
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
boolean ib_use_row_selection = true
boolean ib_allow_sort = true
boolean ib_allow_save = false
end type

event ue_sort(string as_column);long ll_Row
long ll_RowCount
long ll_doc_id
string ls_CurrentSort

this.SetRedraw(false)

// Get current doc_id
ll_Row = this.GetRow()
if ll_Row <= 0 then Return
ll_doc_id = this.GetItemNumber(ll_Row, "doc_id")

ll_RowCount = this.RowCount()
for ll_Row = 1 to ll_RowCount
	this.SetItem(ll_Row, "style", "+")
next

// Sort clicked column
if as_Column <> is_OldSortColumn then
	is_OldSort = "D"
	is_OldSortColumn = as_Column
end if
if is_OldSort = "D" then
	ls_CurrentSort = " A"
	is_OldSort = "A"
else
	ls_CurrentSort = " D"
	is_OldSort = "D"
end if

choose case Lower(as_Column)
	case "category"
		this.SetSort("doc_type" + ls_CurrentSort + ", LookUpDisplay(category)" + ls_CurrentSort)
	case "doc_ext"
		this.SetSort("Upper(doc_ext)" + ls_CurrentSort)
	case "current_version"
		this.SetSort("revision" + ls_CurrentSort)
	case "status"
		this.SetSort("LookUpDisplay(status)" + ls_CurrentSort)
	case else
		this.SetSort(as_Column + ls_CurrentSort)
end choose
this.Sort()

// Locate the old row after sort
ll_Row = this.Find("doc_id = " + String(ll_doc_id), 1, this.Rowcount())
if ll_Row <= 0 then ll_Row = 1
this.Scrolltorow(ll_Row)
this.Event RowFocusChanged(ll_Row)
	
this.SetRedraw(true)
end event

event clicked;//Override Ancestor Script

//BEGIN---Add by Evan on 05/22/2008
if Lower(dwo.Type) = "text" then	
	String ls_Column
	ls_Column = dwo.Name
	ls_Column = Left(ls_Column, Len(ls_Column) - 2)
	this.Event ue_Sort(ls_Column)	
end if


end event

event doubleclicked;call super::doubleclicked;
If Not Row > 0 Then Return

cb_Select.Event clicked() //Added By Jay 2016-07-14
end event

type dw_filter from u_dw_contract within w_documents_browse_select
string tag = "Search Criteria"
integer x = 32
integer y = 40
integer width = 4037
integer height = 572
integer taborder = 10
boolean titlebar = true
string title = "Search Criteria"
string dataobject = "d_doc_br_search"
end type

event buttonclicked;call super::buttonclicked;//Override Ancestor Script
Choose Case dwo.name 
	Case'b_clear' 
		This.Reset()
		This.InsertRow(0)		
	Case 'b_filter'
		If ib_retrieved Then
			 //Added By Jay Chen 04-02-2014
			dw_browse.reset( )
			ids_search.RowsCopy(1,ids_search.RowCount(),Primary!,dw_browse,1,Primary!)
			Event ue_filter( )
		Else
			Event ue_retrieve( )
		End If
End Choose


end event

type cb_2 from commandbutton within w_documents_browse_select
integer x = 3726
integer y = 1896
integer width = 343
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
end type

event clicked;Event ue_retrieve( )
end event

type cb_select from commandbutton within w_documents_browse_select
integer x = 3360
integer y = 1896
integer width = 343
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select"
end type

event clicked;Long 		ll_ctx_id, ll_doc_id
string 	ls_ext

If dw_browse.RowCount () > 0 Then
	ls_ext = dw_browse.GetItemString ( dw_browse.GetRow(), 'doc_ext' )
	If Upper ( ls_ext ) <> "DOC" And Upper( ls_ext ) <> "DOCX" Then
		MessageBox("Tips","The selected document is not a Word document!")
		Return 
	End If
	ll_ctx_id = dw_browse.GetItemNumber ( dw_browse.GetRow(), 'ctx_id' )
	ll_doc_id = dw_browse.GetItemNumber ( dw_browse.GetRow(), 'doc_id' )
Else
	Return
End If

closewithreturn(parent, string ( ll_ctx_id ) + '-' + string ( ll_doc_id) )
end event

