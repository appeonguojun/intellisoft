$PBExportHeader$w_dm_batchadd_document.srw
forward
global type w_dm_batchadd_document from w_response
end type
type st_info from statictext within w_dm_batchadd_document
end type
type cb_preview from commandbutton within w_dm_batchadd_document
end type
type cb_4 from commandbutton within w_dm_batchadd_document
end type
type cb_3 from commandbutton within w_dm_batchadd_document
end type
type cb_design from commandbutton within w_dm_batchadd_document
end type
type cb_pastefile from commandbutton within w_dm_batchadd_document
end type
type cb_scan from commandbutton within w_dm_batchadd_document
end type
type cb_checkin from commandbutton within w_dm_batchadd_document
end type
type dw_list_select from u_dw_contract within w_dm_batchadd_document
end type
type dw_1 from u_dw_contract within w_dm_batchadd_document
end type
end forward

global type w_dm_batchadd_document from w_response
string tag = "Batch Add Documents"
integer width = 2702
integer height = 1940
string title = "Batch Add Documents"
st_info st_info
cb_preview cb_preview
cb_4 cb_4
cb_3 cb_3
cb_design cb_design
cb_pastefile cb_pastefile
cb_scan cb_scan
cb_checkin cb_checkin
dw_list_select dw_list_select
dw_1 dw_1
end type
global w_dm_batchadd_document w_dm_batchadd_document

type variables
Boolean ib_new
Long il_ctx_id
long il_template_approved, il_document_approved //added by alfee 08.31.2007
str_add_doc istr_add_doc
String is_old_status

DataStore ids_category_filtered

//n_cst_right inv_right
n_cst_dm_utils inv_utils //note: auto instantiate variable. added by Alfee 05.08.2007 
//n_cst_filesrv inv_filesrv 

String 	is_scaned_file //Added By Ken.Guo 2009-05-31.
long		il_OriScreenID

//Added By Ken.Guo 2010-06-28.
Long il_batch_ctx_id[] 
Boolean ib_batch_new
str_batch_doc istr_batch_doc,istr_batch_doc_invalid,istr_batch_doc_empty
long il_doc_id
str_ctx_email istr_ctx_email
String is_ocr_result
Boolean ib_ocred
String 	is_operation		//Added By Mark Lee 06/13/2013

n_cst_contract inv_contract_details //Added By Jay Chen 11-29-2013
String is_activewindow_name //Added By Jay Chen 04-17-2014

long		il_doc_category							//Added By Mark Lee 09/09/2015
string 	is_file
end variables

forward prototypes
public subroutine of_create_dw ()
public function integer of_filter_category (ref datawindowchild adwc_category, string as_basetype)
public subroutine of_set_flag (u_dw adw_alm)
public subroutine of_refreshdocpath (string as_pathname)
public function boolean of_check_read_only ()
public subroutine of_set_default_dw_values (long al_row, u_dw_contract adw_con, string as_type)
end prototypes

public subroutine of_create_dw ();String	ls_TabName,ls_DWName[],ls_DOName[]

DataWindow	ldw_Name[]

ls_TabName = "tabpage_images"

ldw_Name[1]  = dw_1
ls_DWName[1] = "dw_1"
ls_DOName[1] = dw_1.DataObject

Window	lw_activewindow
lw_activewindow = w_mdi.GetActiveSheet( )
if isvalid(lw_activewindow) then
	is_activewindow_name = lw_activewindow.classname( )
end if

long ll_view_id,ll_category,ll_ctx_id,ll_row,ll_cnt
if is_activewindow_name = "w_documents_browse" then 
	ll_row = w_documents_browse.uo_1.tab_1.tabpage_browse.dw_browse.getrow()
	if ll_row > 0 then
		ll_category = w_documents_browse.uo_1.tab_1.tabpage_browse.dw_browse.object.category[ll_row]
		ll_ctx_id = w_documents_browse.uo_1.tab_1.tabpage_browse.dw_browse.object.ctx_id[ll_row]
		ll_view_id = w_documents_browse.of_get_ctx_view(ll_category,ll_ctx_id)
		Select Count(1) Into :ll_cnt From ctx_screen Where data_view_id = :ll_view_id And dataobject = :ls_DOName[1];
		If ll_cnt > 0 Then 
			f_create_contract_dw(ll_view_id,ls_TabName,ldw_Name,ls_DWName,ls_DOName)
			w_documents_browse.il_current_properties_view = ll_view_id
		End If
	end if
else
	Select Count(1) Into :ll_cnt From ctx_screen Where data_view_id = :gi_contract_view_id And dataobject = :ls_DOName[1];
	If ll_cnt > 0 Then 
		f_create_contract_dw(gi_contract_view_id,ls_TabName,ldw_Name,ls_DWName,ls_DOName)		
	End If
end if

end subroutine

public function integer of_filter_category (ref datawindowchild adwc_category, string as_basetype);//Filter category according to the user rights
String ls_filter
Long ll_cnt, i
DatawindowChild ldwc_template

IF NOT IsValid(ids_category_filtered) THEN RETURN -1
IF dw_1.RowCount() < 1 THEN RETURN -1
IF Not IsNumber(as_basetype) THEN RETURN -1

If Not ib_new Then Return -1 // Only Add a new document need to filter.

//Get the categories which is not allowed to access to the current user
String ls_filter_category
ls_filter_category = "Category_type = " + String(Integer(as_basetype) + 2) 
If gnv_data.of_getitem( 'icred_settings', 'filter_documents', False) = '1' Then 
	ls_filter_category = ls_filter_category +  " or Category_type = 1 "
End If
ids_category_filtered.SetFilter(ls_filter_category)
ids_category_filtered.Filter()

//Get the filter criteria and filter in the category dddw
ll_cnt = ids_category_filtered.RowCount()
FOR i = 1 to ll_cnt
	IF i = 1 THEN ls_filter	= "lookup_code not in ( "  
	ls_filter += String(ids_category_filtered.GetItemNumber(i, 'category_code')) 
	IF i < ll_cnt THEN 
		ls_filter += ", "
	ELSE
		ls_filter += " )"
	END IF
NEXT
IF Len(Trim(ls_filter)) < 1 THEN ls_filter = '1=1' 
adwc_category.SetFilter(ls_filter)
adwc_category.Filter( )		

adwc_category.rowsdiscard(1, adwc_category.FilteredCount(), Filter! ) 

//Restore the data in category datastore
ids_category_filtered.SetFilter('1=1')
ids_category_filtered.Filter()

//show all template or document by access right.
dw_1.GetChild('from_templete_id',ldwc_template)
ll_cnt = adwc_category.RowCount()
ls_filter = ''
For i = 1 To ll_cnt
	If i = 1 Then ls_filter = 'category in ('
	ls_filter += String(adwc_category.GetItemNumber(i, 'lookup_code') )
	If i < ll_cnt Then
		ls_filter += ", "
	Else
		ls_filter += " )"
	End If
Next

If gnv_data.of_getitem( 'icred_settings', 'filter_template', False) = '1' Then 
	ldwc_template.SetFilter('1 = 2')
	ldwc_template.Filter()		
Else
	If ls_filter <> '' Then
		ls_filter += 'and type = ' + as_basetype
		ldwc_template.SetFilter(ls_filter)
		ldwc_template.Filter()	
	Else
		ldwc_template.SetFilter('1 = 2')
		ldwc_template.Filter()	
	End If
End If
If ldwc_template.Rowcount( ) = 0 THEN ldwc_template.InsertRow( 1 )

RETURN 1

end function

public subroutine of_set_flag (u_dw adw_alm);long	ll_ctx_id
string ls_customscreen[]
long ll_i,ll_count,ll_doc_id
long ll_k,ll_colcount

ll_ctx_id = dw_1.getitemnumber(1,"ctx_id")
//ll_ctx_id=il_ctx_id
ll_count = adw_alm.rowcount()

ls_customscreen =  {'custom_date1','custom_date2','custom_date3','custom_date4','custom_date5','custom_date6','received_date','status_date','create_date','checkout_date'}

ll_colcount = UpperBound(ls_customscreen)
FOR ll_i = 1 to ll_count
	ll_doc_id = adw_alm.GetItemNumber( ll_i,'doc_id')
	for ll_k = 1 to ll_colCount
		adw_alm.SetItem( ll_i, ls_customscreen[ll_k] + "_flag", f_set_ai_flag('ctx_am_document', ls_customscreen[ll_k],ll_ctx_id,ll_doc_id, 0,0)) //Modified By Jay Chen 11-29-2013
	next
	adw_alm.SetItemStatus(ll_i, 0, Primary!, NotModified!)	
NEXT
adw_alm.Post setredraw(true) 


end subroutine

public subroutine of_refreshdocpath (string as_pathname);//dw_1.setredraw(False)
//if dw_1.RowCount( ) > 0 then
//	cb_Preview.Enabled = true
//	istr_add_doc.filename = as_PathName
//	//lstr_add_doc.notes = dw_1.GetItemstring( 1, "notes")
//	
//	dw_1.Setitem(1, "filename", as_PathName)
//	
//	//if Not f_validstr(Trim(dw_1.GetitemString(1, "doc_name"))) then
//		as_PathName = inv_utils.of_get_filename(as_PathName)			
//		dw_1.Setitem(1, "doc_name", as_PathName) 
//	//end if
//	
//	if Not f_ValidStr(as_PathName) then 
//		cb_3.Enabled = false
//	else
//		cb_3.Enabled = true
//	end if
//end if
//
//dw_1.setredraw(True)
end subroutine

public function boolean of_check_read_only ();//<$Reason>Get read only flag from it's parent tab page
Integer li_tabidx
u_tabpg_contract_master	lu_tabpg

IF IsValid(gw_contract) THEN
	li_tabidx = gw_contract.tab_contract_details.selectedtab
	IF li_tabidx > 0 THEN
		// get the current tab page index
		lu_tabpg = gw_contract.tab_contract_details.of_gettabpage(li_tabidx)
		IF lu_tabpg.inv_contract_details.of_get_protect_columns( ) THEN
			//of_set_message('Contract is presently read only. No changes can be made. ')
			RETURN TRUE
		END IF
	END IF
END IF

return false
end function

public subroutine of_set_default_dw_values (long al_row, u_dw_contract adw_con, string as_type);//====================================================================
// Function: of_set_default_dw_values
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long             al_row
// 	value    u_dw_contract    adw_con
// 	value    string           as_type
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/09/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long						ll_doc_status, ll_category, ll_NULL
string						ls_base_type, ls_name
DataWindowChild		ldwc_category, ldwc_template

// Initialize datawindow 
SetNull(ll_NULL)

adw_con.setitem(al_row, "ctx_id", il_ctx_id)	
adw_con.Setitem(al_row, "create_by", gs_user_id)
adw_con.setitem(al_row, 'create_date', Datetime(today()))
adw_con.Setitem(al_row, "status_by", gs_user_id)	
adw_con.setitem(al_row, 'status_date', Datetime(today()))
adw_con.Setitem(al_row, "doc_ext", 'doc') 							// Workaround APB bug. should set a any default value, cannot be null.	
If Isnull(adw_con.GetItemNumber(al_row, 'status')) Then 		// Use default value in screen if exists.
	// Set default document status is 'New'.
	ll_doc_status = Long(gnv_data.of_getitem( 'code_lookup', 'lookup_code', "upper(lookup_name) = upper('Contract Document Status') and upper(code) = upper('New')"))
	IF ll_doc_status > 0 THEN 
		adw_con.setitem(al_row, 'status', ll_doc_status)
	End If
End If

adw_con.SetItem(al_row,"doc_type","Other")
adw_con.SetItem(al_row,"received_by",gs_user_id)
adw_con.SetItem(al_row,"received_date",Today())

If isnull(adw_con.GetItemDecimal(al_row, 'revision')) Then
	adw_con.SetItem(al_row, "revision", 1.0 )
End If

if not isnull(is_file) and trim(is_file) <> "" then
	adw_con.setitem(al_row,"filename",is_file)
	ls_name = inv_utils.of_get_filename(is_file)	
	adw_con.setitem(al_row,"doc_name",ls_name)
end if 
		
if lower(as_type) = "detail" then
	// Set default as contract
	//Filter category according to the user rights
	adw_con.getchild( "category",ldwc_category)										 
	adw_con.Getchild( "from_templete_id", ldwc_template)							 
	ldwc_category.settransobject( sqlca)
	ldwc_template.settransobject( sqlca)
	
	ls_base_type = adw_con.GetItemString(al_row, "base_type")			
	IF ls_base_type = "1" OR ls_base_type = "2" THEN of_filter_category(ldwc_category, ls_base_type)							
	IF ldwc_category.find('lookup_code = '+string(il_doc_category),1,ldwc_category.rowcount()) > 0 THEN 
		adw_con.setitem(al_row, 'category', il_doc_category)
		adw_con.Event ItemChanged ( al_row, adw_con.object.category, String ( il_doc_category ) ) //Added By Jay 2016-07-05
		If gnv_data.of_getitem( 'icred_settings', 'filter_template', False) = '1' Then 
			ldwc_template.Setfilter( "type = "+String(ls_base_type)+" and category = " + string(il_doc_category) )
			ldwc_template.Filter()
			IF ldwc_template.Rowcount( ) = 0 THEN ldwc_template.InsertRow( 1 )
		End If
	else
		setNull(il_doc_category)																//reset 
	END IF
	
	//Filter by contract category.
	of_filter_category(ldwc_category, '-1')
	ll_category = adw_con.GetItemNumber(al_row,'Category')
	IF isnull(ll_category) or ldwc_category.find('lookup_code = '+string(ll_category),1,ldwc_category.rowcount()) < 1 THEN 
		adw_con.setitem(al_row, 'category', ll_NULL)
		setNull(il_doc_category)																//reset 
	END IF 	
	
	adw_con.SetitemStatus( al_row, 0, Primary!, NotModified! )					//Added By Mark Lee 09/09/2015
else
	IF not isnull(il_doc_category) and il_doc_category > 0 THEN 
		adw_con.setitem(al_row, 'category', il_doc_category)
		adw_con.Event ItemChanged ( al_row, adw_con.object.category, String ( il_doc_category ) ) //Added By Jay 2016-07-05
	END IF 		
end if 

//dw_1.SetitemStatus( 1, 0, Primary!, NotModified! )										
end subroutine

event open;call super::open;str_add_doc lstr_add_doc
Integer li_setting
Long ll_doc_id
Long ll_doc_status
Long ll_doc_category, ll_category,ll_null, ll_row
String ls_base_type, ls_doc_type, ls_filename, ls_preview, ls_color

DatawindowChild ldwc_category, ldwc_template, ldwc_wf, ldwc_DocFromName,ldwc_ReceivedBy

SetNull(ll_null)

if IsValid(gw_Contract) then il_OriScreenID = gw_Contract.of_GetCurrentScreenID()
of_create_dw()																									 
dw_1.of_SetReqColumn(TRUE)
dw_1.Event ue_populatedddws()
if IsValid(gw_Contract) then gw_Contract.of_SetCurrentScreenID(dw_1.il_ScreenId)

if is_activewindow_name = "w_documents_browse" then
	w_documents_browse.il_current_properties_screen = dw_1.il_ScreenId
end if

//dw_list_select background
ls_color = dw_1.describe("datawindow.Color")
dw_list_select.modify("datawindow.Color="+ls_color)

//ls_preview = gnv_user_option.of_Get_option_value( gs_user_id, "Contract_Document_Manager_Tab_Preview_in_Document_Manager_Checked" )					
//If isnull(ls_preview) or trim(ls_preview) = '' or ls_preview = '1' Then
//	cbx_preview.checked = True																		
//Else
//	cbx_preview.checked = False																			
//End If 

//inv_filesrv = Create n_cst_filesrv 
IF NOT IsvaLid(Message.PowerObjectParm) THEN RETURN

//get approved code of contract 
il_template_approved = long(gnv_data.of_getitem('code_lookup','lookup_code',"lookup_name = 'Contract Template Review Status' and code = 'Approved'"))
il_document_approved = long(gnv_data.of_getitem('code_lookup','lookup_code',"lookup_name = 'Contract Document Review Status' and code = 'Approved'"))

lstr_add_doc = Message.PowerObjectParm
ib_new = lstr_add_doc.new
ll_doc_id = lstr_add_doc.doc_id
il_ctx_id = lstr_add_doc.ctx_id

ib_batch_new = lstr_add_doc.ab_batch_new
il_batch_ctx_id[] = lstr_add_doc.al_batch_ctx_id[] 

ids_category_filtered = Create DataStore
ids_category_filtered.DataObject = 'd_dm_category_filtered'

//<$Reason>if not a new document, display template ids with any status.
IF Not ib_new THEN dw_1.Modify("from_templete_id.dddw.name = 'dddw_document_baseondoc_list_all'")

dw_1.Getchild( "from_templete_id", ldwc_template)
dw_1.Getchild( "wf_id", ldwc_wf)
dw_1.getchild( "category",ldwc_category)
dw_1.GetChild( "doc_from_name", ldwc_DocFromName)
dw_1.GetChild( "Received_By", ldwc_ReceivedBy)

ids_category_filtered.SetTransObject(SQLCA)
ldwc_template.Settransobject( SQLCA )
ldwc_wf.Settransobject( SQLCA )
ldwc_category.SettransObject( SQLCA )
ldwc_DocFromName.SetTransObject( SQLCA )
ldwc_ReceivedBy.SetTransObject( SQLCA )
//dw_1.Settransobject( SQLCA )

gnv_appeondb.of_startqueue( )
ids_category_filtered.Retrieve(gs_user_id)

//<$Reason>if not a new document, display template ids with any status.
IF Not ib_new THEN 
	ldwc_template.Retrieve()
ELSE	
	ldwc_template.Retrieve(il_template_approved, il_document_approved)
END IF	

ldwc_wf.Retrieve("04")
ldwc_category.Retrieve()
//select category into :ll_doc_category from ctx_basic_info where ctx_id = :lstr_add_doc.ctx_id; 		/////??????????????????!!!!!!!!!!!!
select category into :il_doc_category from ctx_basic_info where ctx_id = :lstr_add_doc.ctx_id; 		//Added By Mark Lee 09/09/2015

ldwc_DocFromName.Retrieve(il_ctx_id)
ldwc_DocFromName.InsertRow(1)

ldwc_ReceivedBy.Retrieve(il_ctx_id)
ldwc_ReceivedBy.InsertRow(1)

gnv_appeondb.of_commitqueue( )

//$<reason> Set Filter trigger by <> 104-New Buy Side Document
if dw_1.dataobject = "d_dm_new_buy_document" then
	ldwc_wf.SetFilter("wf_triggered_by <> '001'")
	ldwc_wf.Filter( )
else
	ldwc_wf.SetFilter("wf_triggered_by <> '104'")
	ldwc_wf.Filter( )
end if
ldwc_wf.Insertrow(1)

// Create a sell contract document
IF ib_new THEN
	ll_row = dw_1.Insertrow(0)
	// Initialize datawindow 
	of_set_default_dw_values( ll_row, dw_1, "detail")	
//ELSE	// Retrieve old doc
//	IF dw_1.Retrieve( ll_doc_id ) > 0 THEN
//		ls_base_type = dw_1.GetItemString(1, "Base_type")
//		is_old_status = dw_1.Describe("Evaluate( 'lookupdisplay(status)', 1 )")			
//	END IF
//
//	dw_1.Modify('wf_id.protect = 1')
//	dw_1.Modify('base_type.protect = 1')
//	dw_1.Modify('from_templete_id.protect = 1')
//	dw_1.Modify('revision.protect = 1')
//	dw_1.Modify("wf_id.Background.Color='553648127'" )
//	dw_1.Modify("base_type.Background.Color='553648127'" )
//	dw_1.Modify("from_templete_id.Background.Color='553648127'" )
//	dw_1.Modify("revision.Background.Color='553648127'" )
//
////	if dw_1.GetItemString(1,'checkout_status') > '1' then 								//Added By Mark Lee 09/09/2015
////		cb_weblink.visible = True 																				
////	end if
//
//
//	dw_1.modify('p_attachment.height = 0')
//
//	cb_Scan.Enabled = false
//	cb_CheckIn.Enabled = false
//	cb_PasteFile.Enabled = false
//	cb_Preview.Enabled = false
//	gnv_data.ids_ctx_all_notification.Retrieve() 
//	of_set_flag(dw_1) 
end if

//Added By Mark Lee 09/11/2015		  can't modify it. because this is use for new module only.
dw_1.Modify('doc_type.protect = 1')
dw_1.Modify("doc_type.Background.Color='553648127'" )
	
//Set work flow. 
li_setting = of_get_app_setting("set_47","I")
If li_setting = 0 Then
	dw_1.object.wf_id_t.visible = False
	dw_1.object.wf_id.visible = False
	IF dw_1.dataobject = "d_dm_new_sell_document" THEN
		dw_1.object.notes_t.y = dw_1.object.wf_id_t.y
		dw_1.object.notes.height = String(Integer(dw_1.object.notes.height) + Integer(dw_1.object.notes.y) - Integer(dw_1.object.wf_id.y))
		dw_1.object.notes.y = dw_1.object.wf_id.y
	elseif dw_1.DataObject = "d_dm_new_buy_document" THEN
		dw_1.object.notes_t.y = dw_1.object.status_t.y
		dw_1.object.notes.height = String(Integer(dw_1.object.notes.height) + Integer(dw_1.object.notes.y) - Integer(dw_1.object.status_t.y))
		dw_1.object.notes.y = dw_1.object.status.y
		
		dw_1.object.status_t.y = dw_1.object.wf_id_t.y
		dw_1.object.status.y = dw_1.object.wf_id.y
		
		dw_1.object.status_by_t.y = dw_1.object.wf_id_t.y
		dw_1.object.status_by.y = dw_1.object.wf_id.y
		
		dw_1.object.status_date_t.y = dw_1.object.wf_id_t.y
		dw_1.object.status_date.y = dw_1.object.wf_id.y
	ELSE
		dw_1.object.wf_id_t.Visible = false
		dw_1.object.wf_id.Visible = false		
	END IF
END IF

//Add readonly control to contract in properties window
IF IsValid(lstr_add_doc.au_tabpg_dm_data) THEN
	IF lstr_add_doc.au_tabpg_dm_data.of_check_read_only() THEN
		dw_1.Enabled = FALSE
		cb_3.Enabled = FALSE
		dw_list_select.enabled = False													//Added By Mark Lee 09/10/2015
		cb_checkin.enabled = False
	END IF
END If

long	ll_HDHeight,ll_DTHeight,ll_SMHeight,ll_FTHeight
long	ll_OriHeight,ll_IncHeight

ll_HDHeight = long(dw_1.Describe("DataWindow.Header.Height"))
ll_DTHeight = long(dw_1.Describe("DataWindow.Detail.Height"))
ll_SMHeight = long(dw_1.Describe("DataWindow.Summary.Height"))
ll_FTHeight = long(dw_1.Describe("DataWindow.Footer.Height"))

ll_OriHeight = dw_1.Height
ll_IncHeight = ll_HDHeight + ll_DTHeight + ll_SMHeight + ll_FTHeight - ll_OriHeight + 20
ll_IncHeight = ll_IncHeight + 80  
This.Height += ll_IncHeight 
dw_1.Height += ll_IncHeight

cb_4.Y = dw_1.Y + dw_1.Height - cb_4.Height											
cb_3.Y = cb_4.Y - cb_4.Height - 16														
cb_Design.Y = cb_3.Y - cb_Design.Height - 72				
st_info.y = dw_1.y + dw_1.height + 8

////Set OK button for buy/other document
//IF Not ib_new or dw_1.RowCount() < 1 THEN 
//	RETURN 
//End If

//Added By Mark Lee 09/10/2015 when you don't select any document in the list, then no save button can use it.
//ls_doc_type = dw_1.GetItemString(1, "doc_type")
//IF Upper(ls_doc_type) = "Buy" or Upper(ls_doc_type) = "Other" THEN			 
//	ls_filename	= dw_1.GetItemString(1, "filename")
//	IF NOT f_validstr(ls_filename) THEN cb_3.Enabled = FALSE
//END IF
cb_3.Enabled = FALSE						// when you don't select any document in the list, then no save button can use it.
cb_preview.enabled = false

//////Only Set Preview						//Added By Mark Lee 09/10/2015
//If  ib_batch_new and UpperBound(il_batch_ctx_id[])  = 1 Then
//	cbx_preview.visible = True																 
//Else
//	If ib_new and  not ib_batch_new  Then 
//		cbx_preview.visible = True															
//	Else
//		cbx_preview.visible = False															
//	End IF 
//End If

is_operation = lstr_add_doc.operation
//IF 	lstr_add_doc.operation = 'add to document' Then 									//Added By Mark Lee 09/10/2015 it is not use.
////	of_RefreshDocPath(lstr_add_doc.filepathname)										//Added By Mark Lee 09/09/2015							
////	st_info.text = 'Document successfully loaded.'										//Added By Mark Lee 09/08/2015
//	cb_checkin.visible = False
//	cb_scan.visible = False
//	cb_pastefile.visible = False
//	cb_preview.visible = False
////	cb_weblink.visible = False																//Added By Mark Lee 09/08/2015
//	cb_design.visible = False
////	cbx_preview.visible = False																//Added By Mark Lee 09/08/2015
//End If

// Set right for Design button(Screen Painter right)
If isvalid(m_pfe_cst_master_menu) THEN
	If Not m_pfe_cst_master_menu.m_system.m_painters.m_contractdatascreenpainter.Visible Then     //w_mdi.of_security_access( 5300 ) = 0
		cb_design.visible = False
	End If
End If

//Added By Ken.Guo 2017-06-05.  Task 704:Design Button in Doc Manager Properties button enabled for users without access to Screen Painter
IF w_mdi.of_security_access( 5300 ) = 0 THEN
	cb_design.visible = False
END IF		

//Added By Jay Chen 12-30-2015
string ls_visible
datawindowchild ldwc
ls_visible = dw_1.describe("export_id.visible")
if ls_visible = "?" or ls_visible = "!" then ls_visible = '0'
if ls_visible = '1' then
	dw_1.getchild("export_id",ldwc)
	ldwc.settransobject(sqlca)
	ldwc.retrieve(gi_contract_view_id)
end if

//Commented By Ken.Guo 2017-01-13. Task 712. unhide preview function.
//cb_preview.visible = false//Modified by gavins 20161019  because saas upgrade apb6.5 to apb6.8 doc preview produce crash issue.
end event

on w_dm_batchadd_document.create
int iCurrent
call super::create
this.st_info=create st_info
this.cb_preview=create cb_preview
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_design=create cb_design
this.cb_pastefile=create cb_pastefile
this.cb_scan=create cb_scan
this.cb_checkin=create cb_checkin
this.dw_list_select=create dw_list_select
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_info
this.Control[iCurrent+2]=this.cb_preview
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_design
this.Control[iCurrent+6]=this.cb_pastefile
this.Control[iCurrent+7]=this.cb_scan
this.Control[iCurrent+8]=this.cb_checkin
this.Control[iCurrent+9]=this.dw_list_select
this.Control[iCurrent+10]=this.dw_1
end on

on w_dm_batchadd_document.destroy
call super::destroy
destroy(this.st_info)
destroy(this.cb_preview)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_design)
destroy(this.cb_pastefile)
destroy(this.cb_scan)
destroy(this.cb_checkin)
destroy(this.dw_list_select)
destroy(this.dw_1)
end on

event pfc_postopen;call super::pfc_postopen;dw_1.of_setdropdowncalendar(True) 					
end event

event close;call super::close;Destroy ids_category_filtered
//Destroy inv_right
//IF IsValid(inv_filesrv) THEN Destroy inv_filesrv  

if IsValid(gw_Contract) then gw_Contract.of_SetCurrentScreenID(il_OriScreenID)

end event

type st_info from statictext within w_dm_batchadd_document
boolean visible = false
integer x = 37
integer y = 1792
integer width = 1893
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_preview from commandbutton within w_dm_batchadd_document
integer x = 1929
integer y = 308
integer width = 727
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Pre&view"
end type

event clicked;String ls_FileExtName,ls_Null

str_add_doc 		lstr_add_doc
n_cst_dm_utils 	lnvo_dm_utils

SetNull(ls_Null)

if FileExists(is_file) then
	// Get file extend name
	ls_FileExtName = Lower(lnvo_dm_utils.of_get_fileext(is_file))
	choose case ls_FileExtName
		case "doc"
			lstr_add_doc.filename = is_file			
			OpenWithParm(w_dm_document_preview, lstr_add_doc)
		case "html","htm"
			 ShellExecuteA(Handle(This), "open", 'IEXPLORE', is_file, ls_Null, 4)
		case else
			if ShellExecuteA(Handle(This), "open", is_file, ls_Null, ls_Null, 4) <= 32 then
				Run("rundll32.exe shell32.dll,OpenAs_RunDLL " +is_file)
			end if
	end choose
end if

end event

type cb_4 from commandbutton within w_dm_batchadd_document
integer x = 1929
integer y = 1680
integer width = 727
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;close(parent)						 
end event

type cb_3 from commandbutton within w_dm_batchadd_document
integer x = 1929
integer y = 1548
integer width = 727
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;//====================================================================
// Event: clicked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/10/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
String ls_template, ls_docname
String ls_doc_type, ls_filename, ls_basetype  
LONG ll_from_templete_id
Integer li_ret
Long ll_doc_id
String			ls_primary_doc, 	ls_batch_ctx_id	, ls_sql, ls_temp	//Added By Mark Lee 10/29/2012
Long		ll_ctx_id,	ll_Find, ll_rowcount, i , ll_findrow

ib_ocred = False

IF dw_list_select.rowcount() < 1 THEN RETURN

//verify document name
dw_1.accepttext( )										//need it
dw_list_select.AcceptText()
If dw_1.event pfc_validation( ) < 0 Then Return							  	//move
for i = 1 to dw_list_select.rowcount( )  
	ls_docname = dw_list_select.GetitemString( i, "doc_name")
	IF Not inv_utils.of_verify_filename(ls_docname) THEN 
		dw_list_select.scrolltorow( i)
		dw_list_select.SelectRow(0, false)
		dw_list_select.setrow( i)
		dw_list_select.SelectRow(i, true)	
		RETURN
	end if 
	ls_doc_type = dw_list_select.GetItemString(i, "doc_type")
	ls_filename	= dw_list_select.GetItemString(i, "filename")
	ls_basetype = dw_list_select.GetItemString(i, "base_type")
	
	if IsNull(ls_doc_type) or Trim(ls_doc_type) = "" then
		dw_list_select.scrolltorow( i)
		dw_list_select.SelectRow(0, false)
		dw_list_select.setrow( i)
		dw_list_select.SelectRow(i, true)	
		
		MessageBox("Verification", "The document type is required! ")
		dw_1.SetColumn("doc_type")
		dw_1.SetFocus()
		Return
	end if
	
	IF NOT f_validstr(ls_filename) THEN
		dw_list_select.scrolltorow( i)
		dw_list_select.SelectRow(0, false)
		dw_list_select.setrow( i)
		dw_list_select.SelectRow(i, true)	
		Messagebox(Parent.title, 'Please check in/scan a document first.' )
		RETURN
	END IF
	
next

istr_batch_doc_invalid = istr_batch_doc_empty
// again
for i = 1 to  dw_list_select.rowcount( )  
	ls_primary_doc = dw_list_select.getitemString( i,"primary_doc")
	ll_ctx_id = dw_list_select.getitemNumber( i,"ctx_id")
	ll_doc_id = dw_list_select.GetItemNumber(i, "doc_id")
	
//	If ib_new Then 
	If not isnull(ls_primary_doc) and trim(ls_primary_doc) = '1' Then
		Update ctx_am_document 		set  primary_doc = '0'	From ctx_am_document 		Where ctx_id = :ll_ctx_id ;
	end if 
//	end if 
next 


st_info.visible = True
gnv_workflow_prompt.of_set_prompt_status(False)				// workflow promt  
li_ret = parent.event pfc_save( )
If li_ret > 0 Then										//Added By Mark Lee 09/10/2015  //???????????????!!!!!!!!!!!!!!!!!!!!!!!
//	istr_batch_doc.al_ctx_id[UpperBound(istr_batch_doc.al_ctx_id) + 1] = il_batch_ctx_id[i]
//	istr_batch_doc.al_doc_id[UpperBound(istr_batch_doc.al_ctx_id)] = dw_1.GetItemNumber(1,'doc_id')
//	istr_batch_doc.adec_revision[UpperBound(istr_batch_doc.al_ctx_id)] = dw_1.GetItemDecimal(1,'revision')
Else
//	istr_batch_doc_invalid.al_ctx_id[UpperBound(istr_batch_doc_invalid.al_ctx_id) + 1] = il_batch_ctx_id[i]
//	istr_batch_doc_invalid.al_doc_id[UpperBound(istr_batch_doc_invalid.al_ctx_id)] = dw_1.GetItemNumber(1,'doc_id')
//	istr_batch_doc_invalid.adec_revision[UpperBound(istr_batch_doc_invalid.al_ctx_id)] = dw_1.GetItemDecimal(1,'revision')
	gnv_workflow_prompt.of_set_prompt_status(True)
	//Need Show Error Text?
	Return -1
End If
gnv_workflow_prompt.of_set_prompt_status(True)		
	
//	
If isvalid(gw_contract) Then
	If gw_contract.tab_contract_details.Selectedtab = 9 Then 
		gw_contract.tab_contract_details.tabpage_images.event ue_retrieve( )
//		ll_doc_id = dw_1.GetItemNumber(1, "doc_id")								//Added By Mark Lee 09/10/2015	 
		ls_filename  = dw_1.GetItemString(1, "filename")		
		ll_findrow = 0 								 
		if dw_list_select.rowcount( ) > 0 then 
			if  f_validstr(ls_filename) then
				ll_findrow = dw_list_select.find( " lower(filename)='"+lower(ls_filename)+"' ", 1, dw_list_select.rowcount() )
				if not isnull(ll_findrow) and ll_findrow > 0 then 
					ll_doc_id = dw_list_select.GetItemNumber(ll_findrow, "doc_id")	
				end if 
			end if 
		end if 
		
		ll_rowcount = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.rowcount()
		ll_Find = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.find('doc_id = ' + String(ll_doc_id),1, ll_rowcount)
		If ll_Find > 0 Then
			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.SetRow(ll_Find)
			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.ScrolltoRow(ll_Find)
			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.SelectRow(0,False)
			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.SelectRow(ll_Find,True)
			gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.Post	event rowfocuschanged( ll_Find)	
		End IF 
	Else
		gw_contract.tab_contract_details.tabpage_images.ib_retrieved = False
	End If
End If

IF li_ret = 0 THEN
	CloseWithReturn(Parent, 0)
ELSEIF li_ret > 0 THEN
//	IF ib_new THEN
//		ll_doc_id = dw_1.GetItemNumber(1, "doc_id")			 
		ls_filename  = dw_1.GetItemString(1, "filename")		
		ll_findrow = 0 								 
		if dw_list_select.rowcount( ) > 0 then 
			if f_validstr(ls_filename) then
				ll_findrow = dw_list_select.find( " lower(filename)='"+lower(ls_filename)+"' ", 1, dw_list_select.rowcount() )
				if not isnull(ll_findrow) and ll_findrow > 0 then 
					ll_doc_id = dw_list_select.GetItemNumber(ll_findrow, "doc_id")	
				end if 
			end if 
		end if 
		CloseWithReturn(Parent, ll_doc_id)				
//	END IF
END IF
end event

type cb_design from commandbutton within w_dm_batchadd_document
integer x = 1929
integer y = 1408
integer width = 727
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Design"
end type

event clicked;
CloseWithReturn(Parent, 'design' )
end event

type cb_pastefile from commandbutton within w_dm_batchadd_document
boolean visible = false
integer x = 1929
integer y = 836
integer width = 727
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch &Paste File From Clipboard"
end type

event clicked;String ls_FilePath,ls_FileName,ls_PathName

n_cst_appeondll lnv_appeondll

ls_FilePath = gs_dir_path + gs_DefDirName + '\'//gs_dir_path //Modified By Ken.Guo 2010-06-21
ls_FileName = SPACE(256)

if lnv_appeondll	.of_PasteFromClipboard(ls_FilePath,ls_FileName) > 0 then
	ls_PathName = ls_FilePath + ls_FileName
//	of_RefreshDocPath(ls_PathName)										//Added By Mark Lee 09/08/2015
	st_info.text = 'Document successfully pasted.'
end if

end event

type cb_scan from commandbutton within w_dm_batchadd_document
boolean visible = false
integer x = 1929
integer y = 720
integer width = 727
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch &Scan Existing Document"
end type

event clicked;/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: Create a document from scanner
**==================================================================================================================
**  Created By	: Davis 01.11.2007
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

String ls_filename
Integer li_pos

//----Begin Modified by Alfee on 07.28.2008----
//Open( w_ctx_doc_scan )
IF gi_imageocx = 1 THEN //image 360
	Open( w_ctx_doc_scan ) 
ELSE
	Open( w_ctx_doc_scan_cp )
END IF
//----End Modified ----------------------------

IF f_validstr( Message.StringParm ) THEN
	IF FileExists( Message.stringparm ) THEN
		istr_add_doc.filename = Message.stringparm
		
		//Added By Ken.Guo 2009-05-31.
		If Right(Upper(istr_add_doc.filename),3) = 'PDF' Then
			is_scaned_file = istr_add_doc.filename
		End If
		
		IF dw_1.rowcount( ) > 0 THEN
			dw_1.AcceptText() 
			//-------------Begin Added by Alfee 03.26.2008-----------------------
			dw_1.Setitem(1, "filename", istr_add_doc.filename)			
			ls_filename = Lower(inv_utils.of_get_filename(istr_add_doc.filename)) 
			//-------------End Added --------------------------------------------
			IF NOT f_validstr( dw_1.GetitemString(1, "doc_name") ) THEN
//				Parent.of_refreshdocpath(istr_add_doc.filename) //Added By Ken.Guo 2009-11-24.						//Added By Mark Lee 09/08/2015
				//----------Begin Modified -----------------------
				/*ls_filename = istr_add_doc.filename
				li_pos = LastPos(ls_filename,"\")
				IF li_pos > 0 THEN
					ls_filename = Lower(Mid(ls_filename, li_pos + 1))
					dw_1.Setitem(1, "doc_name", ls_filename) 
				END IF*/
				//---------Begin Commented by Alfee 03.26.2008---------------------------
				//ls_filename = Lower(inv_utils.of_get_filename(istr_add_doc.filename))
				//dw_1.Setitem(1, "filename", ls_filename) 
				//---------End Commented ------------------------------------------------
				//dw_1.Setitem(1, "doc_name", ls_filename) //Commented By Ken.Guo 2009-11-24
				//----------End Modified --------------------------
			END IF
			//-----------Begin Added By Alfee 05.09.2007----------
			//Set OK button for buy/other document
			IF NOT f_validstr(ls_filename) THEN 
				cb_3.Enabled = FALSE
			ELSE
				st_info.text = 'Document successfully scanned.'
				cb_3.Enabled = TRUE
			END IF
			//-----------End Added--------------------------------		
		END IF
	END IF
END IF

end event

event constructor;//Alfee 05.19.2008

//IF gi_imageocx <> 1 THEN this.visible = FALSE
end event

type cb_checkin from commandbutton within w_dm_batchadd_document
integer x = 1929
integer y = 180
integer width = 727
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch Select &Existing Document"
end type

event clicked;String 	ls_FilePath,ls_FileName[], ls_name
long		i, ll_Rtn,	ll_insertrow, ll_row, ll_upperbound
integer 	li_FileCount

//dw_1.reset( )
//dw_list_select.reset()					// readd
is_file = ""
//istr_add_doc.filenamearry = ls_FileName	//readd
//ll_upperbound =  0  
ll_upperbound = upperbound(istr_add_doc.filenamearry)

if dw_list_select.rowcount( ) = 0 then 
	cb_preview.enabled = false
	cb_3.enabled = false
end if 

gf_load_dir_path()

n_getfilename     ln_getfilename
//
ll_Rtn = ln_getfilename.of_getopenfilename("Select File(s)", &
		+ ls_FilePath, ls_FileName[], "", &
		+ "Doc Files (*.DOCX;*.DOC),*.DOCX;*.DOC," &
		+ "Xls Files (*XLSX;*.XLS),*.XLSX;*.XLS,"&		
		 + "Tif Files (*.TIF),*.TIF,"&
		+ "Pdf Files (*.PDF),*.PDF," &
		+ "All Files (*.*), *.*"      )		

gf_save_dir_path(ls_FilePath)  

if ll_Rtn <> 1 then Return

li_FileCount = UpperBound(ls_FileName[])
st_info.Text = 'Select File...'
SetPointer(HourGlass!)
for i = 1 to li_FileCount	
	//stop executing the process 
	yield()
	//
	if not f_validstr(ls_FileName[i]) then continue
	if li_FileCount = 1 and i = 1 then 
		is_file = ls_FilePath
	else
		is_file = ls_FilePath+"\"+ls_FileName[i]
	end if 
	istr_add_doc.filenamearry[ll_upperbound + 1 ] = is_file
	ll_upperbound = upperbound(istr_add_doc.filenamearry)
	
	ll_insertrow = dw_list_select.insertrow(0)
	of_set_default_dw_values( ll_insertrow, dw_list_select, "list")		
	st_info.Text = 'Select File '+string( Int( i / li_FileCount * 100) )+'%'	
next 

st_info.text = 'Document successfully loaded.'
SetPointer ( Arrow! )

if dw_list_select.rowcount( ) > 0 then 
	dw_list_select.scrolltorow( 1)
	dw_list_select.SelectRow(0, false)
	dw_list_select.setrow( 1)
	dw_list_select.SelectRow(1, true)	
	dw_list_select.event rowfocuschanged( 1)					//?
//	cb_preview.visible = true 
	cb_preview.enabled = true
	cb_3.enabled = true
end if 
end event

type dw_list_select from u_dw_contract within w_dm_batchadd_document
integer x = 37
integer y = 40
integer width = 1856
integer height = 572
integer taborder = 10
string dataobject = "d_dm_batchadd_document"
boolean hscrollbar = true
boolean livescroll = false
end type

event constructor;call super::constructor;this.of_SetUpdateAble(true)
this.of_setrowselect( true)
end event

event rowfocuschanged;call super::rowfocuschanged;//Added By Mark Lee 09/09/2015
string 			ls_filename, ls_filename2

if currentrow > 0 then 
	ls_filename = this.getitemstring( currentrow, "filename")
	ls_filename2 = dw_1.getitemstring( 1, "filename")
	
	if (not isnull(ls_filename) and trim(ls_filename) <>"") and  (isnull(ls_filename2) or lower(ls_filename) <> lower(ls_filename2)) then 
		dw_1.accepttext( )				// check valules
		dw_1.reset()
		this.rowscopy(currentrow,currentrow, Primary!, dw_1, 1, Primary!)		
		is_file = ls_filename				//set current file.
		dw_1.SetitemStatus( 1, 0, Primary!, NotModified! )	
	end if 
end if 

end event

event pfc_preupdate;call super::pfc_preupdate;//$<reason> Get max id for new document.

Long ll_doc_id, i , ll_count, ll_cnt, ll_id 
Decimal ldc_revision

ll_count = rowcount( )
IF rowcount( ) > 0 THEN
	ll_cnt = 0 
	for i = 1 to ll_count
		ll_doc_id = this.getitemnumber( i, "doc_id")
		IF isnull(ll_doc_id) or ll_doc_id <= 0   THEN
			ll_cnt ++
		end if 
		
		// Set revision number
		ldc_revision = Double( this.getitemdecimal( i, "revision") )
		IF ldc_revision > 0 THEN
			This.setitem( i, "revision_control", "1")
		END IF
	next 

	// Set doc_id
	if ll_cnt > 0 then 
		ll_id = gnv_app.of_get_id("doc_id", ll_cnt)
		for i = 1 to ll_count
			ll_doc_id = this.getitemnumber( i, "doc_id")
			IF isnull(ll_doc_id) or ll_doc_id <= 0   THEN
				This.setitem( i, "doc_id", ll_id)
				ll_id ++ 
			end if 
		next 
	end if 
	
END IF

Return SUCCESS

end event

event pfc_postupdate;call super::pfc_postupdate;//$<reason> Generate image file.
Decimal 		ldc_revision
Integer 		li_rtn
Long 			ll_doc_id, ll_from_template_id, ll_ctx_id, ll_wf_Id, i, j , ll_rowcount
String 		ls_base_type, ls_filename_extend, ls_filename, ls_filename_new, ls_new_status,ls_docname, ls_sql, ls_criteria, ls_clauseid[]
DateTime 	ldt_modify, ldt_modify_new
Boolean 		lb_rules_valid = FALSE
String 		ls_filename_tif, ls_shortname
long 			ll_screen_id[]

DataStore 				lds_clause_rules_result
n_cst_dm_utils 			lnv_dm_utils
str_add_audit 			lstr_add_audit
n_cst_word_utility 		lnv_word_utils
n_cst_ovole_utils 		lnv_word
str_action_item 		lstr_action[]

lnv_word_utils = Create n_cst_word_utility
lds_clause_rules_result = Create DataStore
lnv_word = Create n_cst_ovole_utils 
lds_clause_rules_result.DataObject = 'd_dm_template_clause_rules_result'

ll_rowcount =  this.rowcount()
IF NOT ll_rowcount > 0 THEN RETURN 0

n_cst_workflow_triggers lnv_workflow
lnv_workflow = create n_cst_workflow_triggers

for j = 1 to ll_rowcount 
//	IF ib_new THEN
		ll_ctx_id = this.object.ctx_id[j]
		ll_doc_id = this.object.doc_id[j]
		ll_wf_Id = this.object.wf_id[j]
		ldc_revision = this.object.revision[j]
		ll_from_template_id = this.object.from_templete_id[j]
		ls_base_type = this.object.base_type[j]
		ls_filename_extend = "doc"
		ls_shortname = this.object.doc_name[j]  
		///////////////////////////////////////////////////////////////////////
		//// Insert document record to the database
		///////////////////////////////////////////////////////////////////////
	
		CHOOSE CASE ls_base_type
//			CASE "1"		//template
//				//<$Reason>For dynamic adding clauses based on defined rules in template
//				//Get whether the dynamic adding clause rules is valid
//				IF gnv_data.of_findrow('template_clause_rules', "ctx_acp_template_id = " + String(ll_from_template_id)) > 0 THEN
//					//Get clause rules' result into datastore				
//					lnv_dm_utils.of_get_clause_rule_reuslts(il_ctx_id, ll_from_template_id, lds_clause_rules_result)
//					FOR i = 1 to lds_clause_rules_result.RowCount()								
//						IF lds_clause_rules_result.GetItemNumber(i,"rules_result") = 0 THEN 
//							lb_rules_valid = TRUE
//							ls_clauseid[UpperBound(ls_clauseid) + 1] = String(lds_clause_rules_result.GetItemNumber(i, "ctx_acp_clause_id"))
//						END IF
//					NEXT
//				END IF
//	
//				IF NOT lb_rules_valid THEN	
//					//the dynamic adding clause rules is invalid	
//					Insert Ctx_am_doc_image(Doc_id, Revision, image_file, doc_ext, modify_date,doc_ext_full)
//					Select :ll_doc_id, :ldc_revision, image_file, 'doc', getdate(),'doc'
//					From ctx_acp_template
//					Where ctx_acp_template_id = :ll_from_template_id;
//	
//					IF SQLCA.SQLCODE <> 0 THEN	
//						Delete from ctx_am_doc_image Where doc_id = :ll_doc_id;
//						Delete from ctx_am_document where doc_id = :ll_doc_id;
//						gnv_debug.of_output( true,"Add Document Errtext:"+sqlca.sqlerrtext)					//Added By Mark Lee 09/10/2015
//						MESSAGEBOX("Add Document", sqlca.sqlerrtext)						
//						if IsValid(lnv_workflow) then Destroy lnv_workflow
//						IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
//						IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils					
//						Return failure
//					End If
//	
//					Update Ctx_am_document
//					Set doc_ext = 'doc'
//					Where doc_id = :ll_doc_id;
//	
//					Insert Ctx_am_document_clause(Doc_id, Revision, ctx_acp_clause_id, orders )
//					Select :ll_doc_id, :ldc_revision, ctx_acp_clause_id, orders
//					From ctx_acp_template_clause
//					Where ctx_acp_template_id = :ll_from_template_id;
//	
//			//		gnv_appeondb.of_commitqueue( )	
//				//---------Begin Added by alfee 11.12.2007------------------------			
//				ELSE 	
//					//the dynamic adding clause rules is valid
//					//Get modify date and sql statement for clause map update
//					ldt_modify_new = DateTime(Today(), Now())					
//	
//					lnv_string.of_arraytostring(ls_clauseid, ",", ls_criteria) 				
//					ls_sql = "Insert ctx_am_document_clause(doc_id, revision, ctx_acp_clause_id, orders ) " + &
//								" Select " + String(ll_doc_id) + ", " + String(ldc_revision) + ", ctx_acp_clause_id, orders" + &
//								"  From ctx_acp_template_clause Where ctx_acp_template_id = " + String(ll_from_template_id)
//					IF Len(ls_criteria) > 0 THEN ls_sql = ls_sql + " And ctx_acp_clause_id not in (" + ls_criteria + ")"	
//					ls_sql += "; "
//	
//					//General update
//					//gnv_appeondb.of_startqueue( )
//					
//					Insert Ctx_am_doc_image(Doc_id, Revision, doc_ext, modify_date,doc_ext_full) 
//						Values( :ll_doc_id, :ldc_revision, 'doc', :ldt_modify_new,'doc');
//	
//					//Added By Ken.Guo 2009-12-22.
//					IF SQLCA.SQLCODE <> 0 THEN	
//						Delete from ctx_am_doc_image Where doc_id = :ll_doc_id;
//						Delete from ctx_am_document where doc_id = :ll_doc_id;
//						MESSAGEBOX("Add Document", sqlca.sqlerrtext)
//						if IsValid(lnv_workflow) then Destroy lnv_workflow
//						IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
//						IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils					
//						Return failure
//					End If
//					
//					Update Ctx_am_document Set doc_ext = 'doc' Where doc_id = :ll_doc_id;
//					
//					EXECUTE IMMEDIATE :ls_sql; //update clause map
//	
//					//Get modify date for the template
//					Select modify_date Into :ldt_modify From ctx_acp_template Where ctx_acp_template_id = :ll_from_template_id;
//					
//					//gnv_appeondb.of_commitqueue( )
//					
//					IF SQLCA.SQLCODE <> 0 THEN	
//						MessageBox("Add Document", "Add document failed due to: " + sqlca.sqlerrtext)
//						RETURN FAILURE
//					END IF
//					
//					//Get the template file
//					lnv_word_utils.of_get_template_file( ll_from_template_id, ldt_modify)
//					
//					//Clear invalid clauses based on rules, and generate the new document
//					ls_filename = gs_dir_path + gs_DefDirName + "\Agreement\" + "template_" + string(ll_from_template_id) + ".doc"
//					ls_docname = lnv_dm_utils.of_generate_tempname(ll_doc_id, ldc_revision, 'doc')			
//					lnv_dm_utils.of_gen_document_on_rules(ls_filename, ls_docname, lds_clause_rules_result)
//					
//					//Upload document to DB, and update registry value. 
//					lnv_dm_utils.of_update_document(ll_doc_id, ldc_revision, ls_docname, ldt_modify_new)
//					
//				END IF		
//				//---------End Added ---------------------------------------------
//	
//				IF SQLCA.SQLCODE <> 0 THEN	
//					Delete from ctx_am_doc_image Where doc_id = :ll_doc_id;
//					Delete from ctx_am_document where doc_id = :ll_doc_id;
//					MESSAGEBOX("Add Document", sqlca.sqlerrtext)
//					if IsValid(lnv_workflow) then Destroy lnv_workflow
//					IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
//					IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils	
//					IF IsValid(lnv_word) THEN Destroy lnv_word	
//					Return failure
//				End If
//				
//				//Merge data from DB and upload to DB //Added By Ken.Guo 2010-06-30.
//				If ib_batch_new Then
//					If lnv_word.of_merge_to_db( ll_ctx_id, ll_doc_id, ldc_revision, ls_shortname, ls_filename_extend) < 0 Then
//						if IsValid(lnv_workflow) then Destroy lnv_workflow
//						IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
//						IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils	
//						IF IsValid(lnv_word) THEN Destroy lnv_word						
//						Return failure
//					End If
//				End If
//	
//			CASE "2"		//document
//				gnv_appeondb.of_startqueue( )
//				
//				//Insert Ctx_am_doc_image(Doc_id, Revision, image_file, doc_ext, modify_date)
//				//Select :ll_doc_id, :ldc_revision, image_file, document_type, getdate() //Alfee 09.19.2008
//				Insert Ctx_am_doc_image(Doc_id, Revision, image_file, doc_ext, modify_date, pdftext,doc_ext_full)
//				Select :ll_doc_id, :ldc_revision, image_file, document_type, getdate(), image_text,document_type
//				  From ctx_acp_document
//				 Where ctx_acp_document_id = :ll_from_template_id;
//				
//				//Added By Mark Lee 05/07/2013
//				If AppeonGetClientType() = 'PB' then	
//					IF SQLCA.SQLCODE <> 0 THEN
//						Delete from ctx_am_doc_image Where doc_id = :ll_doc_id;
//						Delete from ctx_am_document where doc_id = :ll_doc_id;
//						MESSAGEBOX("Add Document", sqlca.sqlerrtext)
//						if IsValid(lnv_workflow) then Destroy lnv_workflow
//						IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
//						IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils				
//						Return Failure
//					END IF
//				End IF 
//				
//				Update Ctx_am_document
//				Set Ctx_am_document.doc_ext = document_type
//				From ctx_acp_document
//				Where Ctx_am_document.doc_id = :ll_doc_id
//					And ctx_acp_document_id = :ll_from_template_id;
//	
//				gnv_appeondb.of_commitqueue( )
//	
//				IF SQLCA.SQLCODE = 0 THEN
//					//COMMIT; Commented by Alfee 09.17.2007
//				ELSE
//					Delete from ctx_am_doc_image Where doc_id = :ll_doc_id;
//					Delete from ctx_am_document where doc_id = :ll_doc_id;
//					MESSAGEBOX("Add Document", sqlca.sqlerrtext)
//					if IsValid(lnv_workflow) then Destroy lnv_workflow
//					IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
//					IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils				
//					Return Failure
//				END IF
			CASE "3"		//existing document
//				ls_filename = istr_add_doc.filename
				ls_filename = istr_add_doc.filenamearry[j]										//Added By Mark Lee 09/10/2015
				
				//Get The OCR Result. for batch add document to contracts.
				If Not ib_ocred Then
					is_ocr_result = lnv_dm_utils.of_get_ocr_result(ls_filename)
					ib_ocred = True
				End If
				
				// Get file extend name
				ls_filename_extend = lnv_dm_utils.of_get_fileext( ls_filename )
				
				//<$Reason>For performance tuning
				IF lnv_dm_utils.of_upload_file( ll_doc_id, ldc_revision, ls_filename,is_ocr_result) < 0 THEN 
					Delete from ctx_am_doc_image Where doc_id = :ll_doc_id;
					Delete from ctx_am_document where doc_id = :ll_doc_id;	
//					This.SetItemStatus(j,0, Primary!,NewModified!) 									//Added By Mark Lee 09/10/2015  ???
					if IsValid(lnv_workflow) then Destroy lnv_workflow
					IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
					IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils				
					RETURN -1		
				End If

				gnv_appeondb.of_startqueue( )	
				Select modify_date Into :ldt_modify From Ctx_am_doc_image Where doc_id = :ll_doc_id and revision = :ldc_revision ;
				Update Ctx_am_document Set doc_ext = :ls_filename_extend	Where doc_id = :ll_doc_id;			 
				gnv_appeondb.of_commitqueue( )
					
				//Generate local file & Update registry date
				IF Not IsNull(ldt_modify) THEN
					ls_filename_new = lnv_dm_utils.of_generate_tempname(ll_doc_id, ldc_revision, ls_filename_extend)

					IF FileExists(ls_filename) THEN li_rtn = FileCopy(ls_filename, ls_filename_new,true) //APB Blob Bug 
					IF li_rtn > 0 THEN
						gnv_filetime.of_setlastwritedatetime( ls_filename, ldt_modify)
						gnv_filetime.of_setlastwritedatetime( ls_filename_new, ldt_modify)
					End If
				END IF
				
				/*lnv_dm_utils.of_upload_file( ll_doc_id, ldc_revision, ls_filename)
				
				IF SQLCA.SQLCODE = 0 THEN
					COMMIT;
				ELSE
					MESSAGEBOX("Add Document", sqlca.sqlerrtext)
				END IF*/
				//----------End Modified ---------------------------------------------
		END CHOOSE
		
		///////////////////////////////////////////////////////////////////////
		//// Trigger off work flow
		///////////////////////////////////////////////////////////////////////
		If gb_workflow AND ll_ctx_id > 0 AND ll_wf_id > 0 AND ll_doc_id > 0 Then
			lstr_action[1].ctx_id = ll_ctx_id
			lstr_action[1].doc_id = ll_doc_id
			lstr_action[1].wf_id = ll_wf_id
			
			lnv_workflow.of_workflow_triggers( lstr_action[] )
		End If
		
		///////////////////////////////////////////////////////////////////////
		//// Trigger off audit trail
		///////////////////////////////////////////////////////////////////////
		lstr_add_audit.doc_id = ll_doc_id
		lstr_add_audit.revision = ldc_revision
		lstr_add_audit.filename = this.object.filename[j]
		lstr_add_audit.doc_from_name = this.object.doc_from_name[j]
		lstr_add_audit.doc_from_type = this.object.doc_from_type[j]
//		lstr_add_audit.notes = istr_add_doc.notes													//Added By Mark Lee 09/10/2015   not use 
		lstr_add_audit.notes = this.object.notes[j]													// not use 
		lstr_add_audit.doc_ext = ls_filename_extend
		
		CHOOSE CASE ls_base_type
//			CASE "1"		//template
//				lstr_add_audit.action = "New - Template"
//			CASE "2"		//document
//				lstr_add_audit.action = "New - Document"
			CASE "3"		//existing document
				lstr_add_audit.action = "New - Existing"
		END CHOOSE
	
		lnv_dm_utils.of_add_audit_trail( lstr_add_audit )
//	ELSE
//		ls_new_status = dw_1.Describe("Evaluate( 'lookupdisplay(status)', 1 )")
//		IF is_old_status <> ls_new_status THEN
//			///////////////////////////////////////////////////////////////////////
//			//// Trigger off audit trail
//			///////////////////////////////////////////////////////////////////////
//			lstr_add_audit.doc_id = dw_1.GetItemNumber( 1, "doc_id")
//			lstr_add_audit.revision = dw_1.GetItemDecimal( 1, "revision")
//			lstr_add_audit.doc_ext = dw_1.GetItemString( 1, "doc_ext")
//			lstr_add_audit.action = "Status Change"
//			lstr_add_audit.notes = "Changed Status from " + is_old_status + " to " + ls_new_status 
//			lnv_dm_utils.of_add_audit_trail( lstr_add_audit )
//		END IF
//	END IF				//ib_new 

	If gb_workflow Then 																	//Added By Mark Lee 09/10/2015
		ll_ctx_id = this.object.ctx_id[j]
		ll_doc_id = this.object.doc_id[j]
		ll_screen_id[1] = -100
	
		lnv_workflow.of_data_value_comparision(gi_contract_view_id, ll_screen_id, ll_ctx_id, ll_doc_id, '04', 'I')
	end if
Next 

//$<reason> Trigger work flow by Contract Logix folder data value comparision
u_dw ldw
If gb_workflow Then 
//	ll_ctx_id = dw_1.object.ctx_id[1]
//	ll_doc_id = dw_1.object.doc_id[1]
//	ll_screen_id[1] = -100
//
//	lnv_workflow.of_data_value_comparision(gi_contract_view_id, ll_screen_id, ll_ctx_id, ll_doc_id, '04', 'I')
	//refresh UI
	if IsValid(w_contract) then
		ldw = w_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail
		ldw.event pfc_retrieve( )
	end if
End If

if IsValid(lnv_workflow) then Destroy lnv_workflow
IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils
If Isvalid(lnv_word) Then Destroy lnv_word

RETURN SUCCESS

end event

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//	Event:  			rbuttonup
//	Description:		Popup menu
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   	Initial version
//						5.0.04 Modified script to avoid 64K segment problem with 16bit machine code executables
// 						6.0		Added DataWindow Property to the popup menu.
// 						6.0 	Added check for the new RowManager.of_GetRestoreRow() switch.
// 						6.0.01 Added call to pfc_prermbmenuproperty to isolate calls to shared variable.
// 						6.0.01 Corrected so that dwo.protect works properly for protect expressions.
//////////////////////////////////////////////////////////////////////////////
//	Copyright ? 1996-2000 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
Boolean		lb_frame
Boolean		lb_desired
Boolean		lb_readonly
Boolean		lb_editstyleattrib
Integer		li_tabsequence
Long			ll_getrow,ll_Right
String		ls_editstyle
String		ls_val
String		ls_protect
String		ls_colname
String		ls_currcolname
String		ls_type
String		ls_expression
n_cst_conversion	lnv_conversion
m_dw					lm_dw
window				lw_parent
window				lw_frame
window				lw_sheet
window				lw_childparent

// Determine if RMB popup menu should occur
If Not ib_RMBmenu Or IsNull (dwo) Then	Return 1

// No RMB support for OLE objects and graphs
ls_type = dwo.Type
If ls_type = "ole" Or ls_type = "tableblob" Or ls_type = "graph" Then Return 1

// No RMB support for print preview mode
If This.Object.DataWindow.Print.Preview = "yes" Then Return 1

// Determine parent window for PointerX, PointerY offset
This.of_GetParentWindow (lw_parent)
If IsValid (lw_parent) Then
	// Get the MDI frame window if available
	lw_frame = lw_parent
	Do While IsValid (lw_frame)
		If lw_frame.WindowType = MDI! Or lw_frame.WindowType = MDIHelp! Then
			lb_frame = True
			Exit
		Else
			lw_frame = lw_frame.ParentWindow()
		End If
	Loop
	
	If lb_frame Then
		// If MDI frame window is available, use it as the reference point for the
		// popup menu for sheets (windows opened with OpenSheet function) or child windows
		If lw_parent.WindowType = Child! Then
			lw_parent = lw_frame
		Else
			lw_sheet = lw_frame.GetFirstSheet()
			If IsValid (lw_sheet) Then
				Do
					// Use frame reference for popup menu if the parentwindow is a sheet
					If lw_sheet = lw_parent Then
						lw_parent = lw_frame
						Exit
					End If
					lw_sheet = lw_frame.GetNextSheet (lw_sheet)
				Loop Until IsNull(lw_sheet) Or Not IsValid (lw_sheet)
			End If
		End If
	Else
		// SDI application.  All windows except for child windows will use the parent
		// window of the control as the reference point for the popmenu
		If lw_parent.WindowType = Child! Then
			lw_childparent = lw_parent.ParentWindow()
			If IsValid (lw_childparent) Then
				lw_parent = lw_childparent
			End If
		End If
	End If
Else
	Return 1
End If

// Create popup menu
lm_dw = Create m_dw
lm_dw.of_SetParent (This)

//////////////////////////////////////////////////////////////////////////////
// Main popup menu operations
//////////////////////////////////////////////////////////////////////////////
ll_getrow = This.GetRow()

ls_val = This.Object.DataWindow.Readonly
lb_readonly = lnv_conversion.of_Boolean (ls_val)

Choose Case ls_type
	Case "datawindow", "column", "compute", "text", "report", &
		"bitmap", "line", "ellipse", "rectangle", "roundrectangle"
	
	// Row operations based on readonly status
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_insert,'Enabled', Not lb_readonly)
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_addrow,'Enabled', Not lb_readonly)
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_delete,'Enabled', Not lb_readonly)
	
	// Menu item enablement for current row
	If Not lb_readonly Then
		lb_desired = False
		If ll_getrow > 0 Then lb_desired = True
		gnv_app.of_modify_menu_attr( lm_dw.m_table.m_delete,'Enabled', lb_desired)
		gnv_app.of_modify_menu_attr( lm_dw.m_table.m_insert,'Enabled', lb_desired)
	End If
	
Case Else
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_insert,'Enabled', False)
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_delete,'Enabled', False)
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_addrow,'Enabled', False)
End Choose

// Get column properties
ls_currcolname = This.GetColumnName()
If ls_type = "column" Then
	ls_editstyle = dwo.Edit.Style
	ls_colname = dwo.Name
	ls_protect = dwo.Protect
	If Not IsNumber(ls_protect) Then
		// Since it is not a number, it must be an expression.
		ls_expression = Right(ls_protect, Len(ls_protect) - Pos(ls_protect, "~t"))
		ls_expression = "Evaluate(~""+ls_expression+","+String(row)+")"
		ls_protect = This.Describe(ls_expression)
	End If
	ls_val = dwo.TabSequence
	If IsNumber (ls_val) Then
		li_tabsequence = Integer (ls_val)
	End If
End If

//////////////////////////////////////////////////////////////////////////////
// Transfer operations.  Only enable for editable column edit styles
//////////////////////////////////////////////////////////////////////////////
gnv_app.of_modify_menu_attr( lm_dw.m_table.m_copy,'Enabled', False)
gnv_app.of_modify_menu_attr( lm_dw.m_table.m_cut,'Enabled', False)
gnv_app.of_modify_menu_attr( lm_dw.m_table.m_paste,'Enabled', False)
gnv_app.of_modify_menu_attr( lm_dw.m_table.m_selectall,'Enabled', False)

// Get the column/editystyle specific editable flag.
If ls_type = "column" And Not lb_readonly Then
	Choose Case ls_editstyle
		Case "edit"
			ls_val = dwo.Edit.DisplayOnly
		Case "editmask"
			ls_val = dwo.EditMask.Readonly
		Case "ddlb"
			ls_val = dwo.DDLB.AllowEdit
		Case "dddw"
			ls_val = dwo.DDDW.AllowEdit
		Case Else
			ls_val = ""
	End Choose
	lb_editstyleattrib = lnv_conversion.of_Boolean (ls_val)
	If IsNull(lb_editstyleattrib) Then lb_editstyleattrib = False
End If

//Added By Ken.Guo 2016-03-31.   uncomment these script.
if ls_type = "column" and not lb_readonly then
	if dwo.BitmapName = "no" and ls_editstyle <> "checkbox" and ls_editstyle <> "radiobuttons" then
		
		if Len (this.SelectedText()) > 0 and ll_getrow = row and ls_currcolname = ls_colname then
			// Copy
			lm_dw.m_table.m_copy.Enabled = true

			// Cut
			if li_tabsequence > 0 and ls_protect = "0" then
				lb_desired = false
				choose case ls_editstyle
					case "edit", "editmask"
						lb_desired = not lb_editstyleattrib
					case "ddlb", "dddw"
						lb_desired = lb_editstyleattrib
				end choose
				lm_dw.m_table.m_cut.Enabled = lb_desired
			end if
		end if
			
		if li_tabsequence > 0 and ls_protect = "0" then
			// Paste
			if Len (ClipBoard()) > 0 then
				lb_desired = false
				choose case ls_editstyle
					case "edit", "editmask"
						lb_desired = not lb_editstyleattrib
					case "ddlb", "dddw"
						lb_desired = lb_editstyleattrib
				end choose
				lm_dw.m_table.m_paste.Enabled = lb_desired
			end if

			// Select All
			if Len (this.GetText()) > 0 and ll_getrow = row and ls_currcolname = ls_colname then
				choose case ls_editstyle
					case "ddlb", "dddw"
						lb_desired = lb_editstyleattrib						
					case else
						lb_desired = true
				end choose
				lm_dw.m_table.m_selectall.Enabled = lb_desired				
			end if
		end if

	end if
end if

//////////////////////////////////////////////////////////////////////////////
// Services
//////////////////////////////////////////////////////////////////////////////
// Row Manager
If IsValid (inv_RowManager) Then
	// Undelete capability
	If inv_RowManager.of_IsRestoreRow() Then
		lm_dw.m_table.m_restorerow.Visible = True
		If This.DeletedCount() > 0 And Not lb_readonly Then
			gnv_app.of_modify_menu_attr( lm_dw.m_table.m_restorerow,'Enabled', True)
		Else
			gnv_app.of_modify_menu_attr( lm_dw.m_table.m_restorerow,'Enabled', False)
		End If
	End If
Else
	lm_dw.m_table.m_restorerow.Visible = False
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_restorerow,'Enabled', False)
End If

// QueryMode
// Default to false
lm_dw.m_table.m_operators.Visible = False
gnv_app.of_modify_menu_attr( lm_dw.m_table.m_operators,'Enabled', False)
lm_dw.m_table.m_values.Visible = False
gnv_app.of_modify_menu_attr( lm_dw.m_table.m_values,'Enabled', False)
lm_dw.m_table.m_dash12.Visible = False

If IsValid (inv_QueryMode) Then
	If inv_QueryMode.of_GetEnabled() Then
		// Do not allow undelete while in querymode
		lm_dw.m_table.m_restorerow.Visible = False
		gnv_app.of_modify_menu_attr( lm_dw.m_table.m_restorerow,'Enabled', False)
		
		// Default visible to true if in querymode
		lm_dw.m_table.m_values.Visible = True
		lm_dw.m_table.m_operators.Visible = True
		lm_dw.m_table.m_dash12.Visible = True
	End If
End If

// DataWindow property entries. (isolate calls to shared variable)
This.Event pfc_prermbmenuproperty (lm_dw)

// Allow for any other changes to the popup menu before it opens
This.Event pfc_prermbmenu (lm_dw)

// Send rbuttonup notification to row selection service
If IsValid (inv_RowSelect) Then inv_RowSelect.Event pfc_rbuttonup (xpos, ypos, row, dwo)

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-18 By: Scofield
//$<Reason> Don't display the mailaspdf and saveaspdf menu item
//Modified By Ken.Guo 11/25/2013
//if This.ClassName() <> "dw_fee_nm" then lm_dw.m_table.m_insert.Enabled = False
if This.ClassName() <> "dw_fee_nm" and This.ClassName() <> "dw_detail" and This.ClassName() <> "dw_header" then 
	lm_dw.m_table.m_insert.Enabled = False
End If

//Added By Mark Lee 09/10/2015
if This.ClassName() = "dw_list_select" then 			
	lm_dw.m_table.m_addrow.Enabled = False
end if 

lm_dw.m_table.m_mailaspdf.Visible = False
lm_dw.m_table.m_saveaspdf.Visible = False
//---------------------------- APPEON END ----------------------------

// Popup menu
lm_dw.m_table.PopMenu (lw_parent.PointerX() + 5, lw_parent.PointerY() + 10)

Destroy lm_dw

Return 1

end event

event pfc_deleterow;call super::pfc_deleterow;long			ll_row
//Added By Mark Lee 09/10/2015
if this.rowcount( ) >  0 then 
	this.scrolltorow( 1)
	this.SelectRow(0, false)
	this.setrow( 1)
	this.SelectRow(1, true)	
//	this.event rowfocuschanged( 1)					//?
else
	dw_1.reset( )
	is_file=""
	ll_row = dw_1.Insertrow(0)
	// Initialize datawindow 
	of_set_default_dw_values( ll_row, dw_1, "detail")	
end if 

return 1
end event

type dw_1 from u_dw_contract within w_dm_batchadd_document
integer x = 37
integer y = 640
integer width = 1856
integer height = 1136
integer taborder = 10
string dataobject = "d_dm_new_buy_document"
boolean vscrollbar = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
end type

event clicked;call super::clicked;If dwo.name = 'p_attachment' Then
	//UnCommented By Ken.Guo 2017-01-13. Task 712. unhide preview function.
	cb_preview.event clicked( )//Commented by gavins 20161019  because saas upgrade apb6.5 to apb6.8 doc preview produce crash issue.
End If
end event

event constructor;call super::constructor;this.of_SetUpdateAble(false)

end event

event buttonclicked;dw_1.accepttext()
if ib_new then
	messagebox('Information','The date alarm function can not be used when adding document.~r~n You can go to document properties window to set date alarm ~r~n after the adding document is completed.')
	return 1
else
//	if dw_1.modifiedcount( ) > 0 then							//Added By Mark Lee 09/09/2015 			
//		parent.event pfc_save()
//		gnv_data.ids_ctx_all_notification.Retrieve() 
//	end if	
//	of_set_flag(this)
//	if of_check_read_only( ) then return 1 
//	this.SetRow( row)
//	inv_contract_details.of_set_alarm( this,'Ctx_am_document', dwo)
end if



end event

event itemchanged;call super::itemchanged;/******************************************************************************************************************
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
**  Created By	: Davis 01.11.2007
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/
Long ll_from_templete_id, ll_cnt, ll_category, ll_wf_id, ll_export_id, ll_NULL
String ls_template, ls_dddw_name, ls_document_name, ls_description, ls_filename, ls_filter
DatawindowChild ldw_child, ldwc_category
long		ll_update_row, i , ll_rnt
String  	ls_coltype , ls_type, ls_primary_doc, ls_column

SETNULL(ll_NULL)
IF rowcount() < 1 THEN RETURN

ll_update_row = 0 								//Added By Mark Lee 09/10/2015 synchronous data
if dw_list_select.rowcount( ) > 0 then 
	dw_list_select.accepttext( )
	ls_filename = This.GetItemString(1, "filename")
	if not isnull(ls_filename) and trim(ls_filename) <> "" then
		ll_update_row = dw_list_select.find( " lower(filename)='"+lower(ls_filename)+"' ", 1, dw_list_select.rowcount() )
		if isnull(ll_update_row) or ll_update_row < 0 then ll_update_row = 0 
	end if 
end if 

CHOOSE CASE Lower(dwo.name)
	CASE "base_type"
		ls_template = String(data)
		CHOOSE CASE ls_template
			CASE '1', '2'			//templete or Document
				//Filter the category dddw according to the user rights	
				This.Getchild( "category", ldwc_category)
				of_filter_category(ldwc_category, ls_template)
				//Set the category field
				ll_category = dw_1.GetItemNumber(row, 'category')
				IF ll_category > 0 AND Not ldwc_category.Find('lookup_code = '+string(ll_category),1,ldwc_category.rowcount()) > 0 THEN 
					dw_1.SetItem(row,'category', ll_NULL)
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'category', ll_NULL)
					SetNull(ll_category)
				END IF
		
				This.Getchild( "from_templete_id", ldw_child)		
				IF IsNull(ll_category) THEN
					dw_1.SetItem(row, 'from_templete_id', ll_NULL)
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'from_templete_id', ll_NULL)
					ls_filter = '1=2'
				ELSEIf gnv_data.of_getitem( 'icred_settings', 'filter_template', False) = '1' Then 	
					ls_filter = "type = " + String(ls_template) + " and category = " + string(this.GetItemNumber(1,"category"))
				Else
					ls_filter =  "type = " + String(ls_template)
				END IF
				ldw_child.Setfilter(ls_filter)
				ldw_child.filter( )
				
				cb_CheckIn.Visible = FALSE
				cb_Scan.Visible = FALSE
				cb_3.Enabled = TRUE	
				This.Setitem( 1, "from_templete_id", ll_null)
				if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'from_templete_id', ll_NULL)
				This.SetItem( 1, "doc_name", "") 
				if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'doc_name', "")
			CASE '3'		//Existing		
				This.Getchild( "category", ldwc_category)
				of_filter_category(ldwc_category, ls_template)
				//Set the category field
				ll_category = dw_1.GetItemNumber(row, 'category')
				IF ll_category > 0 AND Not ldwc_category.Find('lookup_code = '+string(ll_category),1,ldwc_category.rowcount()) > 0 THEN 
					dw_1.SetItem(row,'category', ll_NULL)
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'category', ll_NULL)
					SetNull(ll_category)
				END IF				

				cb_CheckIn.Visible = TRUE
				cb_Scan.Visible = TRUE				
				This.Setitem( 1, "from_templete_id", ll_null)
				if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'from_templete_id', ll_NULL)
				This.Setitem( 1, "export_id", ll_null)
				if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'export_id', ll_NULL)
				This.SetItem( 1, "doc_name", "")
				if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'doc_name', "")
				
				//Set OK button for document
				ls_filename = This.GetItemString(1, "filename")
				IF NOT f_validstr(ls_filename) THEN 
					cb_3.Enabled = FALSE
				ELSE
					cb_3.Enabled = TRUE
				END IF
		END CHOOSE

		IF String(data) = '3' THEN
			This.SetItem( 1, "Revision", 1.0)
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'Revision', 1.0)
		ELSE
			This.SetItem( 1, "Revision", 0.0)
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'Revision', 0.0)
		END IF
		if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'base_type', String(data))
	CASE "from_templete_id"
		ls_template = This.GetitemString( 1, "base_type")
		ll_from_templete_id = Long(data)

		CHOOSE CASE ls_template
			CASE '1'		//templete
				Select category, template_name, wf_id, export_id, description
				Into :ll_category, :ls_document_name, :ll_wf_id, :ll_export_id, :ls_description
				From ctx_acp_template
				Where ctx_acp_template_id = :ll_from_templete_id;
			CASE '2'		//Document
				Select category, document_name, wf_id, description
				Into :ll_category, :ls_document_name, :ll_wf_id, :ls_description
				From ctx_acp_document
				Where ctx_acp_document_id = :ll_from_templete_id;
			CASE ELSE
				RETURN
		END CHOOSE
		
		IF f_validstr(ls_document_name) THEN 
			This.Setitem( 1, "doc_name", ls_document_name)
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'doc_name', ls_document_name)
		end if 
		IF ll_wf_id > 0 THEN 
			This.Setitem( 1, "wf_id", ll_wf_id)
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'wf_id', ll_wf_id)
		end if 
		IF ll_export_id > 0 THEN 
			This.Setitem( 1, "export_id", ll_export_id)
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'export_id', ll_export_id)
		end if 
		IF f_validstr(ls_description) THEN 
			This.Setitem( 1, "notes", ls_description)
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'notes', ls_description)
		end if 
		if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'from_templete_id', long(data))
	CASE "status"
		This.Setitem( 1, "status_by", gs_user_id)
		if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'status_by', gs_user_id)
		This.SetItem( 1, "status_date", DateTime(Today()))
		if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'status_date', DateTime(Today()))
		if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'status', long(data))
	case 'category'
		If Not ib_new Then 
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'category', long(data))
			Return
		end if 
		ls_template = this.GetItemString(row,"base_type")

		If gnv_data.of_getitem( 'icred_settings', 'filter_template', False) = '1' Then 
			This.Getchild( "from_templete_id", ldw_child)
			ldw_child.Setfilter( "type = " + String(ls_template) + " and category = " + data)
			ldw_child.filter( )	
			This.Setitem( 1, "from_templete_id", ll_null)
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'from_templete_id', ll_null)
		End If
		if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'category', long(data))
 	Case "doc_from_name"
		if IsNumber(Data) then
			This.Setitem(1, "doc_from_type", "1" )		// Contract contacts
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'doc_from_type',  "1")
		else
			This.Setitem(1, "doc_from_type", "2" )		// System user
			if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'doc_from_type',  "2")
		end if
		if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,'doc_from_name', string(data))
	case "primary_doc"									//Added By Mark Lee 09/10/2015   
		if string(data) = "1" then 
			if dw_list_select.rowcount( ) > 0 then 
				for i  =1 to dw_list_select.rowcount( )
					ls_primary_doc = string(dw_list_select.getitemstring(i, "primary_doc"))
					if i <> ll_update_row and ( not isnull(ls_primary_doc) and  trim(ls_primary_doc)= "1" ) then 
						dw_list_select.SetItem(i,"primary_doc", "0")
					end if 
				next 
			end if 
		end if 
		if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,"primary_doc", string(data))
//	case "notes"
//		//Added By Mark Lee 09/11/2015 ?? fail to set notes values.?
//		if ll_update_row > 0 then ll_rnt = dw_list_select.SetItem(ll_update_row,"notes", string(data))
  	Case else
	//Added By Mark Lee 09/10/2015 synchronous data
		ls_column = Lower(string(dwo.name))
		ls_coltype = this.describe( dwo.name+".coltype")
		ls_type = this.Describe( dwo.name+".Type")
		if not isnull(ls_type) and lower(ls_type) = "column" then 
			Choose Case Left ( ls_ColType , 5 )
				Case "char(", "char"
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,ls_column, string(data))
				Case "date"	,"datet"
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,ls_column, datetime(data))
				Case"time", "times"
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,ls_column, time(data))
				Case "decim","numbe", "doubl"
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,ls_column, dec(data))
				Case "real","long", "ulong", "int"
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,ls_column, Long(data))
				case else
					if ll_update_row > 0 then dw_list_select.SetItem(ll_update_row,ls_column, string(data))
			End Choose				
		end if 
END CHOOSE



end event

event ue_populatedddws;long		ll_Column_Count,ll_i,ll_null
string 	ls_dddw_name
string 	ls_colname
String 	ls_coltag
Integer 	li_value
Integer 	ll_lookup_code
string 	ls_lable

DataWindowChild dwchild
n_ds lnds_user

if ib_retrieve_drop_downs then return

ll_Column_Count = LONG(This.Describe("DataWindow.Column.Count"))
IF ll_Column_Count = 0 THEN RETURN

FOR ll_i = 1 TO ll_Column_Count
	IF Describe("#" +STRING(ll_i) + ".Edit.Style") = 'dddw' then
		ls_colname = Describe("#" +STRING(ll_i) + ".Name")
		ls_dddw_name = lower(Describe("#" +STRING(ll_i) + ".DDDW.Name"))

		IF ls_dddw_name = "d_dddw_code_lookup" OR ls_dddw_name = "d_dddw_code_lookup_action_type" or ls_dddw_name = "d_dddw_code_lookup_doc_type" THEN
			ls_coltag = Lower(Describe("#" +STRING(ll_i) + ".TAG"))
			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
				
			IF li_value <> 1 THEN
				gnv_app.of_setcontraccache_code_lookup( ls_coltag )
				li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
			END IF
		ELSE
			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_dddw_name,lnds_user)
		END IF

		IF li_value = 1 THEN
			getchild( ls_colname, dwchild)
			
			lnds_user.ShareData ( dwchild )				
			long ll_find
			string ls_displaycolumn
			ls_displaycolumn = This.Describe(ls_colname + ".dddw.displaycolumn")
			ll_find = dwchild.find(ls_displaycolumn + " = '(NONE)'",1,dwchild.rowcount())
			If ll_find > 0 Then
				dwchild.setitem(ll_find,ls_displaycolumn,'')
			End If
			ll_find = dwchild.find(ls_displaycolumn + " = ''",1,dwchild.rowcount()) 
			If ll_find > 0 Then
				dwchild.setitem(ll_find,ls_displaycolumn,'')
			End If

			//dynamically change the words *Add lookup Code* to *Add Agreement Type* and 
			//replace the words lookup code with the field label
			if ls_dddw_name = "d_dddw_code_lookup" or ls_dddw_name = "d_dddw_code_lookup_action_type" or ls_dddw_name = "d_dddw_code_lookup_doc_type" then
				ll_find = dwchild.find("lookup_code = -777", 1, dwchild.rowcount())
				If ll_find > 0 Then 
					ls_lable = This.Describe(ls_colname + "_t.text")
					if ls_lable <> '!' and ls_lable <> '?' then
						dwchild.setitem(ll_find,"code","*Add " + ls_lable + "*")
						dwchild.setitem(ll_find,"description","")
						dwchild.setitem(ll_find,"large_description_1","")
						dwchild.setitem(ll_find,"large_description_2","")
					end if
				elseif ll_find = 0 then 
					ls_lable = This.Describe(ls_colname + "_t.text")
					if ls_lable <> '!' and ls_lable <> '?' then
						if dwchild.rowcount( ) < 2 then
							ll_Find = 0
						Else
							ll_Find = 2
						End If
						ll_Find = dwchild.insertrow( ll_Find )
						dwchild.setitem(ll_find,"code","*Add " + ls_lable + "*")
						dwchild.setitem(ll_find,"description","")
						dwchild.setitem(ll_find,"large_description_1","")
						dwchild.setitem(ll_find,"large_description_2","")
						dwchild.setitem(ll_find,"lookup_code",-777)
						
					end if
				end if
			end if
		 
			//<$Reason>Add contract access control to add lookup data
			String ls_lookup_name
			If Not IsValid(iw_parent) Then of_getparentwindow(iw_parent)
			If IsValid(iw_parent) and (ls_dddw_name = "d_dddw_code_lookup") Then
				If ClassName(iw_parent) = 'w_contract' Then
					ll_find = 0
					ll_find = dwchild.find("lookup_code = -777", 1, dwchild.rowcount())
					If w_mdi.of_security_access(2075) = 0 Then //no access for Add LookUp Data
						If ll_find > 0 Then dwchild.DeleteRow(ll_find)
					End If
				End If
			End If
		
		END IF
		
		if li_value = -1 then
			if ls_dddw_name = 'd_dddw_company' or ls_dddw_name = 'd_dddw_company_list' then 
				ls_coltag = Lower(Describe("#" +STRING(ll_i) + ".TAG"))
				getchild( ls_colname, dwchild)
				SetNull(ll_null)
				dwchild.Settransobject( sqlca)
				dwchild.Retrieve( ls_coltag)
				dwchild.InsertRow(1)
				dwchild.SetItem(1,'facility_id',ll_null)
				dwchild.setitem(1,"facility_name",'')	
			end if
		end if
	END IF
NEXT

ib_retrieve_drop_downs = True

Return

end event

event ue_post_itemchanged;String	ls_ColName,ls_Code,ls_RetVal
long		ll_Rtn,ll_LookupCode
any		l_any
String	ls_value

n_cst_dwsrv lnv_dwsrv

DataWindowChild dwChild

if data = '-777' or Pos(data,"*Add ") > 0 then
	ls_ColName = GetColumnName()
   ll_Rtn = This.GetChild(ls_ColName,dwChild)
   if ll_Rtn > 0 then
		if dwChild.RowCount() > 2 then 
			is_lookup_search_column_table = dwChild.GetItemString(dwChild.RowCount(), "lookup_name")
		end if
   end if

	lnv_dwsrv = create n_cst_dwsrv
	lnv_dwsrv.of_setrequestor(this)
	
	OpenWithParm(w_lookup_search_dddw,'C' + "@" + is_lookup_search_column_table)
	
	if Message.StringParm = "Cancel" then
		ls_Value = lnv_dwsrv.of_GetItem(GetRow(), ls_ColName , Primary!,true)
		if String(ls_value) = "-777" or String(ls_value) = "-888" or Pos(ls_value,"*Add ") > 0 then
			SetNull(ls_value)
		end if
		
		if Not f_validstr(ls_value) then SetNull(ls_Value)
		lnv_dwsrv.of_SetItem(GetRow(), ls_ColName, ls_Value)
		
		if IsValid(lnv_dwsrv) then Destroy lnv_dwsrv
	
		Return
	else
		ll_LookupCode = long(Message.DoubleParm)
		gnv_app.of_SetContracCache_Code_Lookup(is_lookup_search_column_table)
		
		ib_Retrieve_Drop_Downs = false
		Event ue_PopulateDDDWs()
		
		SELECT code INTO :ls_Code FROM code_lookup WHERE lookup_code = :ll_LookupCode;
		
		lnv_dwsrv.of_SetItem(GetRow(), ls_ColName, ls_Code)
		This.AcceptText()
	end if
	
	if IsValid(lnv_dwsrv) then Destroy lnv_dwsrv	
end if 

end event

