$PBExportHeader$u_cst_todolist.sru
forward
global type u_cst_todolist from u_base
end type
type p_close from picture within u_cst_todolist
end type
type p_refresh from picture within u_cst_todolist
end type
type p_print from picture within u_cst_todolist
end type
type p_go from picture within u_cst_todolist
end type
type p_save from picture within u_cst_todolist
end type
type cb_close from picturebutton within u_cst_todolist
end type
type cb_refresh from picturebutton within u_cst_todolist
end type
type cb_print from picturebutton within u_cst_todolist
end type
type cb_go from picturebutton within u_cst_todolist
end type
type cb_save from picturebutton within u_cst_todolist
end type
type dw_facility from u_dw within u_cst_todolist
end type
type st_time from statictext within u_cst_todolist
end type
type dw_action_status from u_dw within u_cst_todolist
end type
type cb_max from commandbutton within u_cst_todolist
end type
type tv_results from u_tvs within u_cst_todolist
end type
type dw_result from u_dw within u_cst_todolist
end type
end forward

global type u_cst_todolist from u_base
integer width = 2821
integer height = 1604
long backcolor = 1073741824
event ue_retrieve_todolist ( )
event ue_close ( )
event ue_refresh_dddw ( datastore ads_tdl )
event ue_resize ( )
event ue_ini ( )
event ue_move_picture ( )
event ue_refresh_unread_email ( )
event ue_move_max_button ( )
p_close p_close
p_refresh p_refresh
p_print p_print
p_go p_go
p_save p_save
cb_close cb_close
cb_refresh cb_refresh
cb_print cb_print
cb_go cb_go
cb_save cb_save
dw_facility dw_facility
st_time st_time
dw_action_status dw_action_status
cb_max cb_max
tv_results tv_results
dw_result dw_result
end type
global u_cst_todolist u_cst_todolist

type prototypes
//BEGIN---Modify by Jervis 12.02.2008
Function long SendMessage(long hWnd, ulong Msg, long wParam, long lParam) Library "user32.dll" Alias For "SendMessageA"

end prototypes

type variables
n_ds dw_document,dw_document_all
n_ds dw_tdl_intelliapp,dw_tdl_intelliapp_all
n_ds dw_tdl_intellicontract,dw_tdl_intellicontract_all
n_ds dw_tdl_intellicred, dw_tdl_intellicred_all
n_ds dw_todoitem
n_ds ds_tdl_icon
datastore ids_ctx_group_user_view //Added By Jay Chen 10-22-2015
//String is_type //'dw', 'tv'  //Added By Ken.Guo 01/10/2013

n_cst_dm_utils inv_utils //Added By Ken.Guo 03/27/2013

window iw_parent 

Private:

STRING is_filter[]
STRING is_where[]

LONG il_facility_id

STRING is_sql_intellicred
STRING is_sql_intelliapp
STRING is_sql_intellicontract
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.21.2007 By: Machongmin
//$<reason> Fix a defect.
string Is_sql_document
//---------------------------- APPEON END ----------------------------


LONG il_tdl_id[]
LONG il_tdli_id[]
LONG il_tdli_cnt[]

w_contract iw_contract
w_prac_data_1 iw_prac

STRING is_module[]

BOOLEAN ib_doubleclick

DatawindowChild idwc_action_status

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.16.2007 By: Machongmin
//$<reason> Fix a defect.
boolean ib_isvalid_contract = true
//---------------------------- APPEON END ----------------------------

Datetime idt_where_due_date

str_picture_index istr_picture_index[]

Public:
Long 			il_ctx_id 					//Added By Mark Lee 12/26/2012
boolean		ibn_use_ctx_id	= False 	//Added By Mark Lee 12/27/2012
Long  il_original_action_status //Added By Ken.Guo 2015-11-25
n_cst_ctx_audit inv_ctx_audit //Added By Ken.Guo 2015-11-25
end variables

forward prototypes
public function integer of_fill_treeview ()
public function integer of_fill_report (datawindow adw)
public subroutine of_item_changed (long handle)
public function integer of_run_action (integer ai_action, string as_sql_where)
public function integer of_goto_practitioner_action (long ll_prac_id, long ll_facility_id, long ll_parent_facility_id, long ll_rec_id, long ll_seq_no, string ls_moveto, string ls_action)
public function integer of_goto_practitioner (long ll_prac_id, long ll_facility_id, long ll_parent_facility_id, long ll_rec_id, long ll_seq_no, string ls_moveto, string ls_action)
public function integer of_goto_contract (long ll_ctx_id, string ls_moveto)
public function integer of_find_actionitem (integer al_seq_id)
public function integer of_find_document (integer al_doc_id, string as_tabpage, integer al_seq_id)
public function integer of_preview_doc ()
public function integer of_27_11 (long al_doc_id, string as_moveto, long al_seq_id)
public function integer of_29_09 (long al_doc_id, string as_moveto, long al_seq_id)
public function integer of_clausemap ()
public function integer of_29_10 (long al_doc_id, string as_moveto, long al_seq_id)
public function integer of_30 (long al_doc_id, string as_moveto, long al_seq_id)
public function integer of_31 (long al_doc_id, string as_moveto, long al_seq_id)
public subroutine of_set_bg_color (long al_color)
public subroutine of_set_where_due_date (datetime ldt_due_date)
public function string of_gen_where_due_date (string as_module_id)
public subroutine of_retrievedata ()
public subroutine of_reset_tv_picture ()
public function integer of_find_picture_index (string as_picturename)
public subroutine of_showcontract ()
public function integer of_fill_tdl_data (long ll_handle, string as_type)
public function integer of_fill_tdl_data (long al_handle)
public subroutine of_setredraw_details_dws ()
public subroutine of_invisible_close_button (boolean abn_visible)
public subroutine of_goto_contract_page (long al_ctx_id)
end prototypes

event ue_retrieve_todolist();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.28.2006 By: Davis
//$<reason> To retrieve to do list item.

LONG ll_row,ll_rowcnt,ll_UserType
LONG ll_Action_Type
LONG ll_Action_Status
INTEGER ll_Print_Flag
INTEGER ll_Due_Date
STRING ls_Max_Sends_Flag
STRING ls_sql_where
STRING ls_sql_filter
BOOLEAN lb_exists_term
STRING ls_sql
STRING ls_tdl_module
STRING ls_tdl_name
STRING ls_colname
LONG ll_tdli_id, ll_tdl_id, ll_cnt, i
LONG ll_null[]
STRING ls_null[],ls_AssignUser,ls_AmAssignUser

// Retrieve todolist Begin
SetPointer( HourGlass! )

// Initialize array
il_tdl_id = ll_null
il_tdli_id = ll_null
il_tdli_cnt = ll_null
is_filter = ls_null
is_where = ls_null

dw_tdl_intellicred_all.Reset( )
dw_tdl_intelliapp_all.Reset( )
dw_tdl_intellicontract_all.Reset( )
This.of_reset_tv_picture( ) //Added By Ken.Guo 2010-09-17.

//<add> 06/25/2007 by: Andy fixed a bug
String ls_user_id
ls_user_id = dw_facility.GetItemString(1, "user_id")
IF NOT f_validstr(ls_user_id) THEN ls_user_id = gs_user_id

//If ls_user_id = '-ALL-'	Then ls_user_id = '%' //Added by Ken.Guo on 2009-02-26

//end of add

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.28.2007 By: Machongmin
//$<reason> Fix a defect.	

string ls_ext_sql,ls_other_user 
long ll_tdl_right
If ls_user_id = '-ALL-' Then
	//Added by Ken.Guo on 2009-02-26
	ll_tdl_right = 2
	ls_other_user = ''
Else
	SELECT tdl_rights,tdl_other_user into :ll_tdl_right,:ls_other_user from security_users where user_id = :gs_user_id;
End If
//---------------------------- APPEON END ----------------------------

decimal{0} ld_category
ld_category = dw_facility.GetItemDecimal(1, "category")

n_cst_tdl_function lnv_tdl_function
//Begin - Added By Mark Lee 12/26/2012
//ls_sql = lnv_tdl_function.of_gen_tdl_sql(ls_user_id, dw_todoitem, is_where[], is_filter[],idt_where_due_date, ll_tdl_right, ls_other_user )
If not isnull(il_ctx_id) and ibn_use_ctx_id = True then 
	ls_sql = lnv_tdl_function.of_gen_tdl_sql(ls_user_id, dw_todoitem, is_where[], is_filter[],idt_where_due_date, ll_tdl_right, ls_other_user,il_ctx_id )
Else
	if isnull(ld_category) then
		ls_sql = lnv_tdl_function.of_gen_tdl_sql(ls_user_id, dw_todoitem, is_where[], is_filter[],idt_where_due_date, ll_tdl_right, ls_other_user )
	else //Added By Jay Chen 12-05-2014
		ls_sql = lnv_tdl_function.of_gen_tdl_sql(ls_user_id, dw_todoitem, is_where[], is_filter[],idt_where_due_date, ll_tdl_right, ls_other_user,ld_category )
	end if
End if
//End - Added By Mark Lee 12/26/2012
//---------------------------- APPEON END ----------------------------



DataStore lds_tdl
String ls_error_syntaxfromSQL, ls_error_create
String ls_syntax
Long ll_count,ll_ret = 1
If ls_sql <> '' Then
	lds_tdl = Create DataStore 
	ls_syntax = SQLCA.SyntaxFromSQL(ls_sql, 'Style(Type=Grid)', ls_error_syntaxfromSQL)
	IF Len(ls_error_syntaxfromSQL) > 0 THEN
		Messagebox('Syntax Error',ls_error_syntaxfromSQL)
		ll_ret = -1
	ELSE
		lds_tdl.Create(ls_syntax, ls_error_create)
		IF Len(ls_error_create) > 0 THEN
			Messagebox('Create Error',ls_error_create)
			ll_ret = -1
		END IF
	END IF
	If ll_ret = 1 Then
		lds_tdl.SetTransObject(SQLCA)
		ll_count = lds_tdl.Retrieve()
		If ll_count > 0 Then
			il_tdl_id[] = lds_tdl.object.#1[1,ll_count]
			il_tdli_id[] = lds_tdl.object.#2[1,ll_count]
			il_tdli_cnt[] = lds_tdl.object.#3[1,ll_count]
		End If
	End If
End If
//---------------------------- APPEON END ----------------------------

// Fill Treeview
THIS.of_fill_treeview( )

// Last refreshed time
st_time.Text = "Last refreshed " + String( Now( ), "hh:mm:ss" )

//---------------------------- APPEON END ----------------------------

end event

event ue_close();//////////////////////////////////////////////////////////////////////
// $<event>u_cst_todolist::ue_close()
// $<arguments>(None)
// $<returns> 
// $<description> 
// $<description> Close this window on Todolist window.
//////////////////////////////////////////////////////////////////////
// $<add> 2008-08-14 by Ken.Guo
//////////////////////////////////////////////////////////////////////


powerobject	lpo_parent

lpo_parent = this.GetParent()
do while IsValid (lpo_parent)
	If lpo_parent.TypeOf() = window! Then Exit
	lpo_parent = lpo_parent.GetParent()
loop

if IsValid (lpo_parent) then
	Close(lpo_parent)
end If

end event

event ue_refresh_dddw(datastore ads_tdl);
datawindowchild dwchild

ads_tdl.SettransObject( SQLCA )

Choose Case lower(ads_tdl.dataobject)
	Case 'd_tdl_document_all'
		Is_sql_document = ads_tdl.getsqlselect()
		
		ads_tdl.GetChild( "action_type", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Action Type') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "action_status", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Action Status') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "ctx_basic_info_status", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Status') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "ctx_basic_info_category", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Category') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "ctx_basic_info_contract_type", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Type') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "ctx_basic_info_dvision", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Division') = upper(lookup_name)", dwchild)
	Case 'd_tdl_intelliapp'
		Is_sql_intelliapp = ads_tdl.getsqlselect( )
		
		// Practitional Basic info
		ads_tdl.GetChild( "pd_basic_prac_category", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Practitioner Category') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "pd_basic_name_suffix", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Name Suffix') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "pd_basic_prof_suffix", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Professional Suffix') = upper(lookup_name)", dwchild)
		
		// Application Status
		ads_tdl.GetChild( "net_dev_action_items_action_dept", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Action Department') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "action_status", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Action Status') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "action_type", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Action Type') = upper(lookup_name)", dwchild)
		
	Case 'd_tdl_intellicontract'
		// Initialize syntax of dw
		Is_sql_intellicontract = ads_tdl.getsqlselect( )
		
		// Action Item
		ads_tdl.GetChild( "action_type", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Action Type') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "action_status", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Action Status') = upper(lookup_name)", dwchild)
		
		// CTX Basic Info
		ads_tdl.GetChild( "ctx_basic_info_status", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Status') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "ctx_basic_info_category", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Category') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "ctx_basic_info_contract_type", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Type') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "ctx_basic_info_dvision", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Contract Division') = upper(lookup_name)", dwchild)
		
	Case 'd_tdl_intellicred'
		// Initialize syntax of dw
		Is_sql_intellicred = ads_tdl.getsqlselect( )
		
		// Practitional Basic info
		ads_tdl.GetChild( "pd_basic_prac_category", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Practitioner Category') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "pd_basic_name_suffix", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Name Suffix') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "pd_basic_prof_suffix", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Professional Suffix') = upper(lookup_name)", dwchild)

		// Verification Status
		ads_tdl.GetChild( "action_type", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Verification Method') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "action_status", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('credentials verification response') = upper(lookup_name)", dwchild)

		//Affiliation Status
		ads_tdl.GetChild( "pd_affil_stat_affiliation_status", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('Affiliation Status') = upper(lookup_name)", dwchild)

		// Department
		ads_tdl.GetChild( "pd_affil_dept_department", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('department') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "pd_affil_dept_rank", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('division') = upper(lookup_name)", dwchild)
		
		ads_tdl.GetChild( "pd_affil_dept_section", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('section') = upper(lookup_name)", dwchild)
		
		// Staff category
		ads_tdl.GetChild( "pd_affil_staff_cat_staff_category", dwchild )
		gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper('staff category') = upper(lookup_name)", dwchild)
				
End Choose

end event

event ue_resize();//////////////////////////////////////////////////////////////////////
// $<event>u_cst_todolist::resize()
// $<arguments>
//		unsignedlong	sizetype 		
//		integer     	newwidth 		
//		integer     	newheight		
// $<returns> long
// $<description>
// $<description> Resize Todolist
//////////////////////////////////////////////////////////////////////
// $<add> 2008-08-18 by Ken.Guo
//Modified By Ken.Guo 2010-08-26. Use Picture Control.
//////////////////////////////////////////////////////////////////////

Long ll_button_width

tv_results.width = This.Width - 28 * 2

cb_save.x = 670

ll_button_width = (This.Width - cb_save.x - 24) /5

//'&Save' -> 'Save'. Must delete underline for Windows Version for XP. 
If ll_button_width <= 215 Then
//	cb_save.Text = "S"	
//	cb_go.Text = "G"
//	cb_print.Text = "P"
//	cb_refresh.Text = "R"
//	cb_close.Text = "C"

	cb_save.Text = ""	
	cb_go.Text = ""
	cb_print.Text = ""
	cb_refresh.Text = ""
	cb_close.Text = ""
	cb_save.picturename = "save!"
	cb_save.disabledname = "Custom008!"
	cb_go.picturename = "run!"
	cb_print.picturename = "print!"
	cb_refresh.picturename = "refresh.bmp"
	cb_close.picturename = "exit!"
	If This.width > 670 + 101*5 + 24 Then
		cb_save.x = (This.Width - 24 - 101*5 )
	End If
	
Else
	cb_save.Text = "Save"	
	cb_go.Text = "Go"
	cb_print.Text = "Print"
	cb_refresh.Text = "Refresh"
	cb_close.Text = "Close"	
	
	cb_save.picturename = ""
	cb_save.disabledname = ""
	cb_go.picturename = ""
	cb_print.picturename = ""
	cb_refresh.picturename = ""
	cb_close.picturename = ""
	
	cb_save.width = ll_button_width
	cb_go.width = ll_button_width
	cb_print.width = ll_button_width
	cb_refresh.width = ll_button_width
	cb_close.width = ll_button_width	
End If

cb_go.x = cb_save.x + cb_save.width
cb_print.x = cb_go.x + cb_go.width
cb_refresh.x = cb_print.x + cb_print.width
cb_close.x = cb_refresh.x + cb_refresh.width

//Added By Ken.Guo 2010-08-26.
Event ue_move_picture()
If ll_button_width <= 350 Then
	p_save.visible = False
	p_go.visible = False
	p_print.visible = False
	p_refresh.visible = False
	p_close.visible = False	
Else
	p_save.visible = True
	p_go.visible = True
	p_print.visible = True
	p_refresh.visible = True
	p_close.visible = True	
End If



end event

event ue_ini();String 	ls_Scale,ls_pic_file,ls_pic_file3
Long 	  	ll_Cycle,ll_value, ll_begin, ll_posx, ll_pre_width, ll_pre_posx, ll_space, ll_value_size,ll_row

n_cst_tdl_function 	lnvo_tdl_function
DataWindowChild 		dwchild,dwchild_user,ldwc_category

dw_document = Create n_ds 
dw_document_all = Create n_ds 
dw_tdl_intelliapp = Create n_ds
dw_tdl_intelliapp_all = Create n_ds
dw_tdl_intellicontract = Create n_ds
dw_tdl_intellicontract_all = Create n_ds
dw_tdl_intellicred = Create n_ds
dw_tdl_intellicred_all = Create n_ds
dw_todoitem = Create n_ds
ds_tdl_icon = Create n_ds

dw_document.dataobject = 'd_tdl_document_all'
dw_document_all.dataobject = 'd_tdl_document_all'
dw_tdl_intelliapp.dataobject = 'd_tdl_intelliapp'
dw_tdl_intelliapp_all.dataobject = 'd_tdl_intelliapp'
dw_tdl_intellicontract.dataobject = 'd_tdl_intellicontract'
dw_tdl_intellicontract_all.dataobject = 'd_tdl_intellicontract'
dw_tdl_intellicred.dataobject = 'd_tdl_intellicred'
dw_tdl_intellicred_all.dataobject = 'd_tdl_intellicred'
dw_todoitem.dataobject = 'd_tdl_painter_detail_list'
ds_tdl_icon.dataobject = 'd_tdl_icons'


dw_document.SetTransObject(SQLCA)
dw_document_all.SetTransObject(SQLCA)
dw_tdl_intelliapp.SetTransObject(SQLCA)
dw_tdl_intelliapp_all.SetTransObject(SQLCA)
dw_tdl_intellicontract.SetTransObject(SQLCA)
dw_tdl_intellicontract_all.SetTransObject(SQLCA)
dw_tdl_intellicred.SetTransObject(SQLCA)
dw_tdl_intellicred_all.SetTransObject(SQLCA)
dw_todoitem.SetTransObject(SQLCA)
ds_tdl_icon.SetTransObject(SQLCA)

dw_document.of_setbase(True)
dw_document_all.of_setbase(True)
dw_tdl_intelliapp.of_setbase(True)
dw_tdl_intelliapp_all.of_setbase(True)
dw_tdl_intellicontract.of_setbase(True)
dw_tdl_intellicontract_all.of_setbase(True)
dw_tdl_intellicred.of_setbase(True)
dw_tdl_intellicred_all.of_setbase(True)
dw_todoitem.of_setbase(True)
ds_tdl_icon.of_setbase(True)

lnvo_tdl_function.of_get_module(is_module[])

dw_facility.GetChild("facility_id",dwchild)
dw_facility.GetChild("user_id",dwchild_user)
dw_facility.GetChild("category", ldwc_category)
dwchild.SetTransObject(SQLCA)
dwchild_user.SetTransObject(SQLCA)
dw_todoitem.SetTransObject(SQLCA)
ldwc_category.settransobject(sqlca)

//Added By Jay Chen 10-22-2015
ids_ctx_group_user_view = create n_ds
ids_ctx_group_user_view.dataobject = 'd_ctx_group_user_view_pt'
ids_ctx_group_user_view.settransobject(sqlca)

gnv_appeondb.of_startqueue( )
	dwchild.Retrieve(gs_user_id)
	dwchild_user.Retrieve(gs_user_id)
	dw_todoitem.Retrieve(gs_user_id,is_module)
	ldwc_category.retrieve('Contract Category')
	ids_ctx_group_user_view.Retrieve(gs_user_id) //Added By Jay Chen 10-22-2015
gnv_appeondb.of_commitqueue( )

ll_Row = ldwc_category.InsertRow(1) 
ldwc_category.SetItem(ll_Row,'description','')  //Modified By Ken.Guo 2015-05-26. Task #119

dw_facility.SetTransObject( SQLCA )
dw_facility.InsertRow( 0 )
dw_facility.SetItem(1,'user_id',gs_user_id) //Added by Ken.Guo on 2009-02-26

IF dwchild_user.RowCount( ) <= 2 THEN
//	dw_facility.Modify( "user_id.visible=0 t_2.visible=0 t_3.x = 69 due_date.x = 69 b_clear.x = 494 gb_1.width = 613") 
	dw_facility.Modify( "user_id.visible=0 t_2.visible=0 t_3.x = 69 due_date.x = 69 b_clear.x = 494  t_1.x = 614 category.x = 614  gb_1.width = 1110")
END IF

//Added By Ken.Guo 01/17/2013
String ls_value
ls_value = gnv_user_option.of_get_option_value( gs_user_id, 'todolist_expanded')
If (ls_value = '1' and cb_max.text = '+') or (ls_value = '0' and cb_max.text = '-') Then
	cb_max.event clicked( )
End If

//Added By Ken.Guo 01/23/2013
String ls_modify_filter, ls_modify,ls_modify2
Long i
If gnv_user_option.of_get_option_value( 'todolist_style' ) = '2' Then //Treeview DW
	dw_result.visible = True
	tv_results.visible = False
	
	//Filter Screen
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_filter_font' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify_filter += " gb_1.Font.Face = '"+ls_value+"' "
		ls_modify_filter += " t_3.Font.Face = '"+ls_value+"' "
		ls_modify_filter += " t_2.Font.Face = '"+ls_value+"' "
		ls_modify_filter += " user_id.Font.Face = '"+ls_value+"' "
		ls_modify_filter += " due_date.Font.Face = '"+ls_value+"' "
		ls_modify_filter += " compute_email_info.Font.Face = '"+ls_value+"' "
		ls_modify_filter += " t_read_email.Font.Face = '"+ls_value+"' "
		
		//ls_modify_filter += " compute_2.Font.Face = '"+ls_value+"' "
	End If	
	
	If iw_parent.classname() = 'w_todolist' Then
		//Filter BK Color
		ls_value = gnv_user_option.of_get_option_value( 'todolist_filter_bk_color' )
		If Not isnull(ls_value) and ls_value <> '' and isnumber(ls_value) Then
			ls_modify_filter += " Datawindow.Color = '"+ls_value+"' "
		End If	
	End If
	dw_facility.Modify(ls_modify_filter)
	
	If iw_parent.classname() = 'w_todolist' Then
		//To Do List Screen BK Color
		ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_bk_color' )
		If Not isnull(ls_value) and ls_value <> '' and isnumber(ls_value) Then
			ls_modify += " Datawindow.Color = '"+ls_value+"' "
		End If	
	End If

	//Level 1
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level1_font' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += " tdl_name.Font.Face = '"+ls_value+"' "
	End If
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level1_font_size' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += "tdl_name.Font.Height = '-"+ls_value+"' "
		If Long(ls_value) > 12 Then
			ll_value = 84 + (Long(ls_value) - 12)*10
			ls_modify += "DataWindow.Tree.Level.1.Height= '"+String(ll_value)+"'"
		End If
	End If	
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level1_font_color' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += "tdl_name.color = '"+ls_value+"' "
	End If	
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level1_font_bold' )
	If isnull(ls_value) or ls_value = '' or ls_value = '0' Then
		ls_value = '400'
	Else
		ls_value = '700'
	End If
	ls_modify += " tdl_name.Font.Weight = '"+ls_value+"' "  
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level1_font_italy' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += " tdl_name.Font.italic = '"+ls_value+"' "  
	End If	

	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level1_font_underline' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += " tdl_name.Font.underline = '"+ls_value+"' "  
	End If		

	//Level 2
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level2_font' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += " tdli_name.Font.Face = '"+ls_value+"' "
	End If
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level2_font_size' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += "tdli_name.Font.Height = '-"+ls_value+"' "
		If Long(ls_value) > 12 Then
			ll_value = 84 + (Long(ls_value) - 12)*10
			ls_modify += "DataWindow.Tree.Level.2.Height= '"+String(ll_value)+"'"
		End If		
	End If	
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level2_font_color' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += "tdli_name.color = '"+ls_value+"' "
	End If	
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level2_font_bold' )
	If isnull(ls_value) or ls_value = '' or ls_value = '0' Then
		ls_value = '400'
	Else
		ls_value = '700'
	End If
	ls_modify += " tdli_name.Font.Weight = '"+ls_value+"' "  
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level2_font_italy' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += " tdli_name.Font.italic = '"+ls_value+"' "  
	End If	

	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level2_font_underline' )
	If Not isnull(ls_value) and ls_value <> '' Then
		ls_modify += " tdli_name.Font.underline = '"+ls_value+"' "  
	End If			

	//Level 3
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level3_font' )
	If Not isnull(ls_value) and ls_value <> '' Then
		For i = 1 To 12
			ls_modify += " display_field"+String(i)+".Font.Face = '"+ls_value+"' "  
		Next
	End If
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level3_font_size' )
	If Not isnull(ls_value) and ls_value <> '' Then
		For i = 1 To 12
			ls_modify += " display_field"+String(i)+".Font.Height = '-"+ls_value+"' "  
		Next
		If Long(ls_value) > 12 Then
			ll_value = 84 + (Long(ls_value) - 12)*10
			ls_modify += "DataWindow.Detail.Height= '"+String(ll_value)+"'"
		End If		
	End If	

	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level3_font_color' )
	If Not isnull(ls_value) and ls_value <> '' Then
		For i = 1 To 12
			ls_modify += " display_field"+String(i)+".Color = '"+ls_value+"' "  
		Next
	End If		
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level3_font_bold' )
	If isnull(ls_value) or ls_value = '' or ls_value = '0' Then
		ls_value = '400'
	Else
		ls_value = '700'
	End If
	For i = 1 To 12
		ls_modify += " display_field"+String(i)+".Font.Weight = '"+ls_value+"' "  
	Next
	
	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level3_font_italy' )
	If Not isnull(ls_value) and ls_value <> '' Then
		For i = 1 To 12
			ls_modify += " display_field"+String(i)+".Font.italic = '"+ls_value+"' "  
		Next
	End If	

	ls_value = gnv_user_option.of_get_option_value( 'todolist_tv_level3_font_underline' )
	If Not isnull(ls_value) and ls_value <> '' Then
		For i = 1 To 12
			ls_modify += " display_field"+String(i)+".Font.underline = '"+ls_value+"' "  
		Next
	End If		
	
	dw_result.Modify(ls_modify)
	
	//Set display Field Width
	ll_begin = 430
	ll_space = 50
	ls_modify = ' '
	ll_value_size = Long(gnv_user_option.of_get_option_value( 'todolist_tv_level3_font_size' ))
	For i = 1 To 12
		If ll_value_size > 9 Then
			ls_modify += " display_field"+String(i)+".Height = '" + String(( ll_value_size - 9 ) * 10 + 64 ) + "' "
		End If
		ls_value = gnv_user_option.of_get_option_value( 'todolist_display_field'+String(i)+'_width' )
		If ls_value = '' or isnull(ls_value) Then ls_value = '500' //Default Value
		If i = 1 Then
			ls_modify += " display_field"+String(i)+".width = '" + ls_value + "' "
			ll_pre_posx = ll_begin
		Else
			ll_posx = ll_pre_posx + ll_pre_width + ll_space
			ls_modify += " display_field"+String(i)+".width = '" + ls_value + "' "
			ls_modify += " display_field"+String(i)+".x = '" + String(ll_posx) + "' "
			ll_pre_posx = ll_posx
		End If
		ll_pre_width = Long(ls_value)
	Next
	
	dw_result.Modify(ls_modify)
	
	//Added By Jay Chen 03-17-2016
	ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level1_icon" )
	If isnull(ls_value) then ls_value = ''
	if isnumber(ls_value) then
		inv_utils.of_download_picture( Long(ls_value), ls_pic_file)
	else
		ls_pic_file = ls_value
	end if
	if ls_pic_file <> '' then
		ls_modify2 += " datawindow.tree.level.1.Expandedtreenodeiconname = '" + ls_pic_file + "' "
		ls_modify2 += " datawindow.tree.level.1.collapsedtreenodeIconname = '" + ls_pic_file + "' "
	end if
	
	ls_value = gnv_user_option.of_get_option_value( "todolist_tv_level3_icon" )
	If isnull(ls_value) then ls_value = ''
	if isnumber(ls_value) then
		inv_utils.of_download_picture( Long(ls_value), ls_pic_file3)
	else
		ls_pic_file3 = ls_value
	end if
	if ls_pic_file3 <> '' then
		ls_modify2 += " datawindow.tree.level.3.Expandedtreenodeiconname = '" + ls_pic_file3 + "' "
	end if
	dw_result.Modify(ls_modify2)
	//end
	
	If iw_parent.classname() = 'w_todolist' Then
		ls_value = gnv_user_option.of_get_option_value( 'todolist_whole_bk_color' )
		If Not isnull(ls_value) and ls_value <> '' and isnumber(ls_value) Then
			This.Backcolor = Long(ls_value)
		End If		
	End If
		
Else //TreeView Control
	dw_result.visible = False
	tv_results.visible = True
End If

cb_max.bringtotop = True


end event

event ue_move_picture();//Added By Ken.Guo 2010-08-26.
p_save.x = cb_save.x + 36
p_go.x = cb_go.x + 36
p_print.x = cb_print.x + 36
p_refresh.x = cb_refresh.x + 36
p_close.x = cb_close.x + 36
p_save.y = cb_save.y + 14
p_go.y = cb_go.y + 12
p_print.y = cb_print.y + 14
p_refresh.y = cb_refresh.y + 12
p_close.y = cb_close.y + 14


end event

event ue_refresh_unread_email();
If Isnull(gl_unread_email_cnt) Then gl_unread_email_cnt = 0

dw_facility.SetItem(1,'unread_email_cnt', gl_unread_email_cnt)

//dw_facility.Modify("t_email_info.Text = 'You have " +String(gl_unread_email_cnt)+ " unread emails.'")	
//If gl_unread_email_cnt > 0 Then
//	dw_facility.Modify("t_read_email.visible = '1' t_email_info.color = '" + String(RGB(255,0,0)) + "' t_read_email.color = '" + String(RGB(255,0,0)) + "' " )
//	dw_facility.Modify("t_todo.x = " +  String(Long(dw_facility.Describe("t_read_email.x")) + Long(dw_facility.Describe("t_read_email.width")) + 30) ) //Added By Ken.Guo 12/29/2012
//Else
//	dw_facility.Modify("t_read_email.visible = '0' t_email_info.color = '" + String(RGB(0,0,0)) + "' t_read_email.color = '" + String(RGB(0,0,0)) + "' ")		
//	dw_facility.Modify("t_todo.x = " +  dw_facility.Describe("t_read_email.x") ) //Added By Ken.Guo 12/29/2012
//End If


Return 
end event

event ue_move_max_button();cb_max.y = tv_results.y - 38
cb_max.x = tv_results.x + tv_results.Width - 60
cb_max.visible = True
end event

public function integer of_fill_treeview ();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.28.2006 By: Davis
//$<reason> To retrieve to do list item.

LONG ll_row,ll_rowcnt, ll_per_count, ll_all_count
STRING ls_tdl_module
STRING ls_tdl_name
STRING ls_verbiage
LONG ll_tdl_id, ll_tdl_id_previous
LONG ll_tdli_id
LONG ll_lev1, ll_lev2
TREEVIEWITEM ltv_item
STRING LS_Allow_Drill_Down
STRING ls_value
Integer li_pos
STRING ls_filter
INTEGER i
String ls_picturename

SetPointer( HourGlass! )

tv_results.SetRedraw( False )
dw_result.SetRedraw(False)

// Delete all items in the TreeView.
DO UNTIL tv_results.FindItem(RootTreeItem!, 0) = -1
    tv_results.DeleteItem( 0 )
LOOP

dw_result.Reset() //Added By Ken.Guo 01/07/2013

// Construct SQL according to term of to do item.
FOR ll_row = 1 TO dw_todoitem.Rowcount()
	ll_tdl_id = dw_todoitem.GetitemNumber( ll_row, "tdl_id" )
	ll_tdli_id = dw_todoitem.GetitemNumber( ll_row, "tdli_id" )
	ls_verbiage = dw_todoitem.GetitemString( ll_row, "verbiage" )
	ls_tdl_name = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_tdl_name" )
	ls_tdl_module = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
	LS_Allow_Drill_Down = dw_todoitem.GetitemString( ll_row, "Allow_Drill_Down" )
	ls_picturename = dw_todoitem.GetitemString( ll_row, "tv_icon" )
	
	//Added By Ken.Guo 03/27/2013
	If isnumber(ls_picturename) Then
		inv_utils.of_download_picture( Long(ls_picturename),ls_picturename) 
	End If
	If Lower(ls_picturename) = 'custom039!'   Then
		ls_picturename = 'folderclosed.gif'
	End If
	
	//Added By Ken.Guo 04/11/2013. Do not support system icon for tv dw. so use default gif file.
	If AppeonGetClientType() = 'PB' and gnv_user_option.of_get_option_value( 'todolist_style' ) = '2' Then 
		If Pos(ls_picturename, ':\') = 0 and 	pos(ls_picturename, '!' ) > 0 Then
			ls_picturename = 'folderclosed.gif'
		End If
	End If	
	
	IF Isnull(LS_Allow_Drill_Down) THEN LS_Allow_Drill_Down = "0"

	// Find total num of TO DO LIST
	ll_rowcnt = 0
	FOR i = 1 TO UPPERBOUND( il_tdl_id )
		IF il_tdl_id[i] = ll_tdl_id AND il_tdli_id[i] = ll_tdli_id THEN
			ll_rowcnt = il_tdli_cnt[i]
			EXIT
		END IF
	END FOR

	IF Isnull( ll_rowcnt ) THEN ll_rowcnt = 0
	
	ll_all_count += ll_rowcnt //Added By Ken.Guo 12/29/2012

	// TO DO LIST
	IF ll_tdl_id_previous <> ll_tdl_id THEN

		//Added By Ken.Guo 12/29/2012
		If ll_tdl_id_previous > 0 and ll_per_count = 0 Then
			tv_results.collapseitem(ll_lev1)
		End If
		ll_per_count = ll_rowcnt
		
		ll_tdl_id_previous = ll_tdl_id
		ltv_item.label = ls_tdl_name
		ltv_item.data = ll_row
		ltv_item.Expanded	= TRUE
		ltv_item.Children = TRUE
		ltv_item.Bold = TRUE
		
		ltv_item.PictureIndex = 1
		ltv_item.SelectedPictureIndex = 2
		ll_lev1 = tv_results.InsertItemLast(0, ltv_item)
	Else //Added By Ken.Guo 12/29/2012
		ll_per_count += ll_rowcnt
	END IF

	// TO DO LIST ITEM
	li_pos = Pos(ls_verbiage, "##")
	IF li_pos > 0 THEN
		ls_verbiage = Left(ls_verbiage,li_pos - 1) + STRING(ll_rowcnt) + Mid(ls_verbiage,li_pos + 2)
	END IF
	
	ltv_item.label = ls_verbiage
	ltv_item.data = ll_row
	ltv_item.Expanded	= FALSE
	ltv_item.Children = LS_Allow_Drill_Down = "1" AND ll_rowcnt > 0
	ltv_item.Bold = FALSE
	
	If gnv_user_option.of_get_option_value( 'todolist_style' ) = '2' Then
		dw_result.InsertRow(0)
		dw_result.SetItem(dw_result.RowCount(), 'tdl_id', ll_tdl_id)
		dw_result.SetItem(dw_result.RowCount(), 'tdli_id', ll_tdli_id)
		dw_result.SetItem(dw_result.RowCount(), 'tdl_name', ls_tdl_name)
		dw_result.SetItem(dw_result.RowCount(), 'tdli_name', ls_verbiage)
		dw_result.SetItem(dw_result.RowCount(), 'tv_icon', ls_picturename)
		dw_result.SetItem(dw_result.RowCount(), 'Allow_Drill_Down', LS_Allow_Drill_Down)
		dw_result.SetItem(dw_result.RowCount(), 'child_count', ll_rowcnt)
		dw_result.SetItem(dw_result.RowCount(), 'tdl_module', ls_tdl_module)
		dw_result.SetItem(dw_result.RowCount(), 'tdl_row', ll_row)
		dw_result.SetItem(dw_result.RowCount(), 'display_field1', '0 To Do Items')
	End If
	
	//Added By Ken.Guo 05/07/2013. Added 'or' statement. fixed bug.
	If gnv_user_option.of_get_option_value( 'todolist_style' ) = '1' or isnull(gnv_user_option.of_get_option_value( 'todolist_style' ))  or gnv_user_option.of_get_option_value( 'todolist_style' ) = '' Then 
		ltv_item.PictureIndex = of_find_picture_index(ls_picturename)
		ltv_item.SelectedPictureIndex = of_find_picture_index(ls_picturename)
		ll_lev2 = tv_results.InsertItemLast(ll_lev1, ltv_item)
		//Added By Ken.Guo 12/29/2012	
		If ll_row = dw_todoitem.Rowcount() Then
			If ll_per_count = 0 Then
				tv_results.collapseitem(ll_lev1)
			End If	
		End If
	End If
	
NEXT

tv_results.SetRedraw( True )

If gnv_user_option.of_get_option_value( 'todolist_style' ) = '2' Then
	dw_result.groupcalc( )
	Long ll_tdl_id_pre
	For i = 1 To dw_result.RowCount()
		ll_tdl_id = dw_result.GetItemNumber(i, 'tdl_id')
		If ll_tdl_id_pre = ll_tdl_id Then Continue
		If dw_result.Find('tdl_id = ' + string(ll_tdl_id) + ' and child_count > 0 ' , i, dw_result.RowCount()) > 0 Then
			dw_result.expand( i, 1)
			ll_tdl_id_pre = ll_tdl_id
		End If
	Next
End If

dw_result.SetRedraw(True)

//Added By Ken.Guo 12/29/2012
dw_facility.SetItem(1,'todo_cnt', ll_all_count)

SetPointer( Arrow! )

Return 1

//---------------------------- APPEON END ----------------------------

end function

public function integer of_fill_report (datawindow adw);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.28.2006 By: Davis
//$<reason> To retrieve to do list item.

LONG ll_row,ll_rowcnt
STRING ls_tdl_module
STRING ls_tdl_name
STRING ls_verbiage
LONG ll_tdl_id, ll_tdl_id_previous
LONG ll_tdli_id
n_ds ldw_tdl
STRING LS_Allow_Drill_Down
STRING ls_value
Integer li_pos
STRING ls_filter
STRING ls_column[12]
LONG i,j
STRING ls_str
Long ll_newrow
STRING ls_sql1,ls_sql2,ls_sql3,ls_sql_where
INTEGER li_width, li_column_width[12],li_null[12]
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.27.2007 By: Machongmin
//$<reason> Fix a defect.	
string ls_sql4
//---------------------------- APPEON END ----------------------------
SetPointer( HourGlass! )

// Check dw data
IF UpperBound(is_filter) = 0 THEN RETURN 0

adw.SetRedraw( False )

// Delete all items in the TreeView.
adw.Reset()

//Added By Jay Chen 12-05-2014
string ls_user_id
ls_user_id = dw_facility.GetItemString(1, "user_id")
IF NOT f_validstr(ls_user_id) THEN ls_user_id = gs_user_id
//end

// Construct SQL that where condition
FOR ll_row = 1 TO dw_todoitem.Rowcount()
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.27.2007 By: Machongmin
	//$<reason> Fix a defect.	
	ls_sql1 = ''
	ls_sql2 = ''
	ls_sql3 = ''
	ls_sql4 = ''
	//---------------------------- APPEON END ----------------------------
	ls_tdl_module = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )

	ls_sql_where = is_where[ll_row]
	
	CHOOSE CASE ls_tdl_module
		CASE "01"		//IntelliCred
			IF f_validstr(ls_sql_where) THEN 
				IF LEN(ls_sql1) = 0 THEN
					ls_sql1 += " (" + ls_sql_where + ")"
				ELSE
					ls_sql1 += " OR (" + ls_sql_where + ")"
				END IF
			END IF
		CASE "02"		//IntelliApp
			IF f_validstr(ls_sql_where) THEN 
				IF LEN(ls_sql2) = 0 THEN
					ls_sql2 += " (" + ls_sql_where + ")"
				ELSE
					ls_sql2 += " OR (" + ls_sql_where + ")"
				END IF
			END IF
		CASE "03"		//Contract
			IF f_validstr(ls_sql_where) THEN 
				IF LEN(ls_sql3) = 0 THEN
					ls_sql3 += " (" + ls_sql_where + ")"
				ELSE
					ls_sql3 += " OR (" + ls_sql_where + ")"
				END IF
			END IF
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.27.2007 By: Machongmin
		//$<reason> Fix a defect.	
		CASE "04"		//Contract
			IF f_validstr(ls_sql_where) THEN 
				IF LEN(ls_sql4) = 0 THEN
					ls_sql4 += " (" + ls_sql_where + ")"
				ELSE
					ls_sql4 += " OR (" + ls_sql_where + ")"
				END IF
			END IF
		//---------------------------- APPEON END ----------------------------
	END CHOOSE
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.27.2007 By: Machongmin
//$<reason> Fix a defect.		
//END FOR
//---------------------------- APPEON END ----------------------------
// Retrieve dw
gnv_appeondb.of_startqueue( )

IF f_validstr(ls_sql1) THEN
	IF NOT f_validstr(Is_sql_intellicred) THEN event ue_refresh_dddw( dw_tdl_intellicred)
	ls_sql1 = Is_sql_intellicred + " WHERE " + ls_sql1

	dw_tdl_intellicred.Reset()
	dw_tdl_intellicred.Modify('datawindow.table.select = "' + ls_sql1 + '"')
	dw_tdl_intellicred.Retrieve( )
END IF

IF f_validstr(ls_sql2) THEN
	IF NOT f_validstr(Is_sql_intelliapp) THEN event ue_refresh_dddw(dw_tdl_intelliapp )
	ls_sql2 = Is_sql_intelliapp + " WHERE " + ls_sql2

	dw_tdl_intelliapp.Reset()
	dw_tdl_intelliapp.Modify('datawindow.table.select = "' + ls_sql2 + '"')
	dw_tdl_intelliapp.Retrieve( )
END IF

IF f_validstr(ls_sql3) THEN
	IF NOT f_validstr(Is_sql_intellicontract) THEN event ue_refresh_dddw(dw_tdl_intellicontract )
	//Added By Jay Chen 12-05-2014
	If ls_user_id <> '-ALL-' Then 
		if pos(Is_sql_intellicontract,'ctx_user_access_tmp') = 0 then
			Is_sql_intellicontract += "join (select ctx_id from ctx_user_access_tmp  where user_id = '"+ls_user_id+"' )A on ctx_action_items.ctx_id = A.ctx_id "
		end if
	End If
	//end
	ls_sql3 = Is_sql_intellicontract + " where " + ls_sql3

	dw_tdl_intellicontract.Reset()
	dw_tdl_intellicontract.Modify('datawindow.table.select = "' + ls_sql3 + '"')
	dw_tdl_intellicontract.Retrieve( )
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.27.2007 By: Machongmin
//$<reason> Fix a defect.	
IF f_validstr(ls_sql4) THEN
	IF NOT f_validstr(Is_sql_document) THEN event ue_refresh_dddw(dw_document )
	//Added By Jay Chen 12-05-2014
	If ls_user_id <> '-ALL-' Then 
		if pos(Is_sql_document,'ctx_user_access_tmp') = 0 then
			Is_sql_document += "join (select ctx_id from ctx_user_access_tmp  where user_id = '"+ls_user_id+"' )A on ctx_basic_info.ctx_id = A.ctx_id "
		end if
	End If
	//end
	ls_sql4 = Is_sql_document + " and (" + ls_sql4 + ")"

	dw_document.Reset()
	dw_document.Modify('datawindow.table.select = "' + ls_sql4 + '"')
	dw_document.Retrieve( )
else
	if ls_sql4 = "" then
		IF NOT f_validstr(Is_sql_document) THEN event ue_refresh_dddw(dw_document )
		//Added By Jay Chen 12-05-2014
		If ls_user_id <> '-ALL-' Then 
			if pos(Is_sql_document,'ctx_user_access_tmp') = 0 then
				Is_sql_document += "join (select ctx_id from ctx_user_access_tmp  where user_id = '"+ls_user_id+"' )A on ctx_basic_info.ctx_id = A.ctx_id "
			end if
		End If
		//end
		ls_sql4 = Is_sql_document
	
		dw_document.Reset()
		dw_document.Modify('datawindow.table.select = "' + ls_sql4 + '"')
		dw_document.Retrieve( )
	end if
END IF
//---------------------------- APPEON END ----------------------------
gnv_appeondb.of_commitqueue( )


// Construct SQL according to term of to do item.
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.27.2007 By: Machongmin
//$<reason> Fix a defect.	
//FOR ll_row = 1 TO dw_todoitem.Rowcount()
//---------------------------- APPEON END ----------------------------
	ll_tdl_id = dw_todoitem.GetitemNumber( ll_row, "tdl_id" )
	ll_tdli_id = dw_todoitem.GetitemNumber( ll_row, "tdli_id" )
	ls_verbiage = dw_todoitem.GetitemString( ll_row, "verbiage" )
	ls_tdl_name = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_tdl_name" )
	ls_tdl_module = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
	LS_Allow_Drill_Down = dw_todoitem.GetitemString( ll_row, "Allow_Drill_Down" )
	IF Isnull(LS_Allow_Drill_Down) THEN LS_Allow_Drill_Down = "0"

	CHOOSE CASE ls_tdl_module
		CASE "01"		//IntelliCred
			ldw_tdl = dw_tdl_intellicred
		CASE "02"		//IntelliApp
			ldw_tdl = dw_tdl_intelliapp
		CASE "03"		//Contract
			ldw_tdl = dw_tdl_intellicontract
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.27.2007 By: Machongmin
		//$<reason> Fix a defect.
		CASE "04"		//Contract
			ldw_tdl = dw_document	
		//---------------------------- APPEON END ----------------------------
	END CHOOSE

	// Get 12 field from results of TO DO LIST item data
	li_column_width = li_null
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Delete> 08.22.2007 By: Evan
	//$<Reason> Use new method that width perfect but performance is too bad.
	/*
	FOR j = 1 TO 12
		ls_column[j] = dw_todoitem.GetitemString(ll_row, "Display" + String(j,"00"))
		IF f_validstr(ls_column[j]) THEN
			li_width = Integer(ldw_tdl.Describe( ls_column[j] + ".width" ))
			li_column_width[j] = Integer(li_width / 32)		// 32 units per word
		END IF
	END FOR
	*/
	//---------------------------- APPEON END ----------------------------
	
	// Get 12 Field Column
	FOR j = 1 TO 12
		ls_column[j] = dw_todoitem.GetitemString(ll_row, "Display" + String(j,"00"))
	END FOR
	
	// Set Filter for to do list data
	ls_filter = is_filter[ll_row]
	IF ldw_tdl.SetFilter( ls_filter ) <> 1 THEN
		IF Handle(getapplication()) = 0 THEN MEssagebox("SET FILTER ERROR",ls_filter)
	END IF
	ldw_tdl.Filter( )
	ll_rowcnt = ldw_tdl.Rowcount( )

	// TO DO LIST ITEM
	li_pos = Pos(ls_verbiage, "##")
	IF li_pos > 0 THEN
		ls_verbiage = Left(ls_verbiage,li_pos - 1) + STRING(ldw_tdl.Rowcount()) + Mid(ls_verbiage,li_pos + 2)
	END IF
	
	IF LS_Allow_Drill_Down <> "1" OR ll_rowcnt = 0 THEN
		ll_newrow = adw.Insertrow( 0 )
		adw.SetItem(ll_newrow, "tdl_id", ll_tdl_id )
		adw.SetItem(ll_newrow, "tdl_name", ls_tdl_name )
		adw.SetItem(ll_newrow, "tdli_id", ll_tdli_id )
		adw.SetItem(ll_newrow, "tdli_name", ls_verbiage )
		
		CONTINUE;
	END IF


	// TO DO LIST ITEM DATA
	IF LS_Allow_Drill_Down = "1" THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Add> 08.22.2007 By: Evan
		//$<Reason> Use new method that width perfect but performance is too bad.
		for j = 1 to 12
			for i = 1 to ldw_tdl.Rowcount()
				if f_validstr(ls_Column[j]) then				
					ls_str = Trim(ldw_tdl.inv_base.of_getitem(i, ls_Column[j]))
					if f_validstr(ls_str) then
						li_Width = Len(ls_str)
					else
						li_Width = 6
					end if					
					if li_column_width[j] < li_Width or IsNull(li_column_width[j]) then 
						li_column_width[j] = li_Width
					end if				
				end if
			next
		next		
		//---------------------------- APPEON END ----------------------------
				
		FOR i = 1 TO ldw_tdl.Rowcount()
			ls_value = ""
			FOR j = 1 TO 12
				IF f_validstr(ls_column[j]) THEN
					ls_str = Trim(ldw_tdl.inv_base.of_getitem( i, ls_column[j] ))
					IF NOT f_validstr(ls_str) THEN ls_str = "(None)"
					
					li_width = LEN( ls_str)
					IF li_column_width[j] > li_width THEN
						ls_str +=  space((li_column_width[j] - li_width) )
					ELSEIF li_column_width[j] < li_width THEN
						li_column_width[j] = li_width
					END IF
					
					ls_value +=  ls_str + "    "
				END IF
			END FOR
		
		ll_newrow = adw.Insertrow( 0 )
		adw.SetItem(ll_newrow, "tdl_id", ll_tdl_id )
		adw.SetItem(ll_newrow, "tdl_name", ls_tdl_name )
		adw.SetItem(ll_newrow, "tdli_id", ll_tdli_id )
		adw.SetItem(ll_newrow, "tdli_name", ls_verbiage )
		adw.SetItem(ll_newrow, "tdl_data", ls_value )
		
		END FOR
	END IF
NEXT

adw.Sort()
adw.GroupCalc ( )

adw.SetRedraw( True )

SetPointer( Arrow! )

Return 1

//---------------------------- APPEON END ----------------------------

end function

public subroutine of_item_changed (long handle);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.01.2006 By: Davis
//$<reason> Implement Dashboard.

LONG ll_tvi, ll_tvi2
LONG ll_row
TREEVIEWITEM ltv_item, ltv_item2
STRING ls_tdl_module
LONG ll_wf_id, ll_wf_step_id
STRING ls_module, ls_filter
n_ds ldw
LONG ll_action_status
LONG ll_lookup_code
STRING ls_wf_complete_flag
LONG ll_active_status
Long ll_level

SetNULL(il_original_action_status)  //Added By Ken.Guo 2015-11-25

// Check treeview item
If tv_results.visible Then
	ll_tvi = tv_results.FindItem(CurrentTreeItem!, 0)
	IF ll_tvi <= 0 THEN RETURN
	tv_results.Getitem( ll_tvi, ltv_item)
	ll_level = ltv_item.level
Else
	ll_level = 3
End If

CHOOSE CASE ll_level
	CASE 1	// To Do List level
		dw_action_status.Hide( )
	CASE 2	// To Do Item level
		dw_action_status.Hide( )
	CASE 3	// Drill Down record level
		// Get info of To Do Item Level
		If tv_results.visible Then
			ll_tvi2 = tv_results.FindItem(ParentTreeItem!, ll_tvi)
			IF ll_tvi2 <= 0 THEN RETURN
	
			tv_results.Getitem( ll_tvi2, ltv_item2)
			ll_row = Long( ltv_item2.Data )
			ls_tdl_module = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
	
			// Get Info of current action item
			ls_module = dw_action_status.GetitemString(1, "module")
	
			// Get info of Drill Down Record Level
			ll_row = Long( ltv_item.Data )
		Else
			//Added By Ken.Guo 01/17/2013
			If handle <= 0 Then 
				dw_action_status.Hide( )
				Return
			End If
			If Not dw_result.isexpanded( handle, 2) Then 
				dw_action_status.Hide( )
				Return
			End If
			ll_row = dw_result.GetItemNumber(handle,'tdl_row')
			If ll_row = 0 Then 
				dw_action_status.Hide( )
				Return
			End If
			ls_tdl_module = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
			ls_module = dw_action_status.GetitemString(1, "module")
			ll_row =  dw_result.GetItemNumber(handle,'tdl_ai_row')
			If ll_row = 0 Then 
				dw_action_status.Hide( )
				Return
			End If
		End If
		
		CHOOSE CASE ls_tdl_module
			CASE "01"		// IntelliCred
				ldw = dw_tdl_intelliCred_all

				ls_filter = upper("'credentials verification response'")
			CASE "02"		// IntelliApp
				ldw = dw_tdl_intelliapp_all

				ls_filter = upper("'Action Status'")
			CASE "03"		// Contract
				ldw = dw_tdl_intellicontract_all

				ls_filter = upper("'Contract Action Status'")
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.21.2007 By: Machongmin
			//$<reason> Fix a defect.
			case "04"
				ldw = dw_document_all
				ls_filter = upper("'Contract Action Status'")
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE
		
		// Set data to dddw of action status field
		IF NOT f_validstr(ls_module) OR ls_module <> ls_tdl_module THEN
			dw_action_status.Setitem(1, "module", ls_tdl_module)
			
			idwc_action_status.Reset( )
			gnv_data.of_set_dwchild_fromcache("code_lookup" , ls_filter + " = upper(lookup_name)", idwc_action_status)

			SetNull(ll_lookup_code)
			idwc_action_status.Insertrow( 1 )
			//idwc_action_status.Setitem( 1, "code", "(none)")						//Commented by Scofield on 2007-08-29
			idwc_action_status.Setitem( 1, "lookup_code", ll_lookup_code)
		END IF

		ls_filter = ""
		ll_wf_id = ldw.GetItemNumber(ll_row, "wf_id")
		IF ll_wf_id > 0 THEN
			ll_wf_step_id = ldw.GetItemNumber(ll_row, "wf_action_type_id")
			ls_filter = "wf_id =" + string(ll_wf_id) + " and step_id = " + string(ll_wf_step_id) 
			ls_filter = gnv_data.of_get_filter_data("workflow_status_filter",ls_filter,"lookup_code")
		END IF
		
		idwc_action_status.SetFilter( ls_filter )
		idwc_action_status.Filter()

		ll_action_status = ldw.GetItemNumber(ll_row, "action_status")
		dw_action_status.SetItem( 1, "action_status", ll_action_status)
		il_original_action_status = ll_action_status //Added By Ken.Guo 2015-11-25
		dw_action_status.Show( )
		
		// Added by davis 01.05.2007
		ls_wf_complete_flag = ldw.GetItemString(ll_row, "wf_complete_flag")
		CHOOSE CASE ls_tdl_module
			CASE "01"		// IntelliCred
				ll_active_status = ldw.GetItemNumber(ll_row, "verif_info_active_status")
			CASE "02"		// IntelliApp
				ll_active_status = ldw.GetItemNumber(ll_row, "net_dev_action_items_active_status")
			CASE "03"		// Contract
				ll_active_status = ldw.GetItemNumber(ll_row, "ctx_action_items_active_status")
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.21.2007 By: Machongmin
			//$<reason> Fix a defect.
			case "04"
				ll_active_status = ldw.GetItemNumber(ll_row, "ctx_am_action_item_active_status")
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE
		
		dw_action_status.Enabled = TRUE
		IF Upper(ls_wf_complete_flag) = 'Y' OR ll_active_status < 0 THEN
			dw_action_status.Enabled = FALSE
		END IF
END CHOOSE

//---------------------------- APPEON END ----------------------------

end subroutine

public function integer of_run_action (integer ai_action, string as_sql_where);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.06.2006 By: Davis
//$<reason> Open action item window.

IF gs_cust_type = "I" THEN
	IF Not IsValid( w_action_items_ia ) THEN
		OpenSheetWithParm( w_action_items_ia, 99, w_mdi, 4, Layered! )
		w_action_items_ia.ii_dashboard_macro = ai_action
		w_action_items_ia.ii_dashboard_where = as_sql_where
	ELSE
		w_action_items_ia.ii_dashboard_macro = ai_action
		w_action_items_ia.ii_dashboard_where = as_sql_where
		w_action_items_ia.Event pfc_postopen()
	END IF
	
	w_action_items_ia.BringToTop = TRUE
ELSE
	IF Not IsValid( w_action_items ) THEN
		OpenSheetWithParm( w_action_items, 99, w_mdi, 4, Layered! )
		w_action_items.ii_dashboard_macro = ai_action
		w_action_items.ii_dashboard_where = as_sql_where
	ELSE
		w_action_items.ii_dashboard_macro = ai_action
		w_action_items.ii_dashboard_where = as_sql_where
		w_action_items.Event pfc_postopen( )
	END if

	w_action_items.BringToTop = TRUE
END IF

RETURN 1

//---------------------------- APPEON END ----------------------------

end function

public function integer of_goto_practitioner_action (long ll_prac_id, long ll_facility_id, long ll_parent_facility_id, long ll_rec_id, long ll_seq_no, string ls_moveto, string ls_action);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.11.2006 By: Davis
//$<reason> The system will bring the user into the area selected in 
//$<reason> the Move To field in the To Do List Painter and then click a menu option 
//$<reason> if a value was selected in the Perform Function field in the To Do List.

// Go to appropriate row
IF ls_moveto = "05" OR ls_moveto = "06" OR ls_moveto = "07" THEN 	//Verification Status->Detail Tab
	u_dw	ldw
	Long ll_row

	iw_prac.tab_1.tabpage_verif.uo_verif_summary.rb_stat_both.checked = TRUE
	iw_prac.tab_1.tabpage_verif.uo_verif_summary.rb_stat_both.event clicked( )

	iw_prac.tab_1.tabpage_verif.uo_verif_summary.rb_ver_stat_both.checked = TRUE
	iw_prac.tab_1.tabpage_verif.uo_verif_summary.rb_ver_stat_both.event clicked( )

	ldw = iw_prac.tab_1.tabpage_verif.uo_verif_summary.dw_detail
	ll_row = ldw.Find("prac_id = " + String(ll_prac_id) + " and verif_info_facility_id = " +&
			String(ll_facility_id) + " and rec_id = " + String(ll_rec_id) +&
			" and seq_no = " + String(ll_seq_no), 1, ldw.Rowcount( ))
	IF ll_row > 0 THEN
		ldw.Setrow( ll_row )
		ldw.Scrolltorow( ll_row)
	END IF
END IF

// Perform action
Choose Case ls_action
	Case "01"		//Generate Missing Info Letter
		IF ls_moveto <> "02" THEN RETURN 1	//App Audit Tab
		iw_prac.tab_1.tabpage_app_audit.uo_app_audit.PostEvent("pfc_cst_compose_request")
	Case "02"		//Print Letters
		IF ls_moveto <> "06" THEN RETURN 1	//Verification Status->Detail Tab
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.PostEvent( "pfc_cst_print_letters" )
	Case "03"		//Crawl Web
		IF ls_moveto <> "06" THEN RETURN 1	//Verification Status->Detail Tab
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.PostEvent("pfc_cst_goto_web")
	Case "04"		//Send NPDB Query
		IF ls_moveto <> "06" THEN RETURN 1	//Verification Status->Detail Tab
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.PostEvent( "pfc_cst_npdb_export" )
	Case "05"		//Receive NPDB Query
		IF ls_moveto <> "06" THEN RETURN 1	//Verification Status->Detail Tab
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.PostEvent( "pfc_cst_npdb_export" )
	Case "06"		//Audit WebView Application
		IF ls_moveto <> "07" THEN RETURN 1	//Verification Status->Recred Tab
		// To do
	Case "07"		//Initiate Recredentialing
		IF ls_moveto <> "07" THEN RETURN 1	//Verification Status->Recred Tab
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.cbx_privs.Checked = FALSE
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.cb_init_recred.Postevent( Clicked! )
	Case "08"		//Initiate Recredentialing and Update Privileges
		IF ls_moveto <> "07" THEN RETURN 1	//Verification Status->Recred Tab
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.cbx_privs.Checked = TRUE
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.tab_view.tabpage_recred.cb_init_recred.Postevent( Clicked! )
End Choose

RETURN 1

//---------------------------- APPEON END ----------------------------

end function

public function integer of_goto_practitioner (long ll_prac_id, long ll_facility_id, long ll_parent_facility_id, long ll_rec_id, long ll_seq_no, string ls_moveto, string ls_action);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.11.2006 By: Davis
//$<reason> The system will bring the user into the area selected in 
//$<reason> the Move To field in the To Do List Painter and then click a menu option 
//$<reason> if a value was selected in the Perform Function field in the To Do List.

//Initiate serach
IF iw_prac.tab_1.Selectedtab <> 1 THEN
	iw_prac.tab_1.SelectTab( 1 )
END IF

// Find appropriate practitioner
pfc_cst_u_extended_search luo_search
luo_search = iw_prac.tab_1.tabpage_search.uo_search

luo_search.dw_org_facility_select.SetItem( 1, "facility_id", 0 )
luo_search.ddlb_search_type.Text = "Last Name"
luo_search.sle_srch_val.Text = ""
luo_search.cb_search.TriggerEvent(Clicked!)

// Check rights
Long ll_row
ll_row = luo_search.dw_search.Find("prac_id = " + String(ll_prac_id) + " AND parent_facility_id = " +&
		String(ll_parent_facility_id), 1, luo_search.dw_search.RowCount())
IF ll_row <=0 THEN
	Messagebox("Warning", "The #" + String(ll_prac_id) + " practitioner does not exist!")
	RETURN 0
END IF

luo_search.dw_search.Setrow(ll_row)
luo_search.dw_search.ScrollTorow(ll_row)

// Go to tabpage
Choose Case ls_moveto
	Case "01"		//Credentialing Tab
		iw_prac.tab_1.SelectTab( 2 )
	Case "02"		//App Audit Tab
		iw_prac.tab_1.SelectTab( 3 )
	Case "03"		//Appointment Status->Detail 1 Tab
		iw_prac.tab_1.SelectTab( 4 )
		iw_prac.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.Post SelectTab ( 2 )
	Case "04"		//Appointment Status->Detail 2 Tab
		iw_prac.tab_1.SelectTab( 4 )
		iw_prac.tab_1.tabpage_apptmnt_status.uo_affill_status.tab_view.Post SelectTab ( 3 )
	Case "05"		//Verification Status->Browse Tab
		iw_prac.tab_1.SelectTab( 5 )
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.tab_view.Post SelectTab ( 1 )
	Case "06"		//Verification Status->Detail Tab
		iw_prac.tab_1.SelectTab( 5 )
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.tab_view.Post SelectTab ( 2 )
	Case "07"		//Verification Status->Recred Tab
		iw_prac.tab_1.SelectTab( 5 )
		iw_prac.tab_1.tabpage_verif.uo_verif_summary.tab_view.Post SelectTab ( 3 )
	Case "08"		//Application Status->Detail Tab
		iw_prac.tab_1.SelectTab( 9 )
		iw_prac.tab_1.tabpage_net.uo_net.tab_1.SelectTab ( 1 )
	Case "09"		//Application Status->Id's Tab
		iw_prac.tab_1.SelectTab( 9 )
		iw_prac.tab_1.tabpage_net.uo_net.tab_1.SelectTab ( 2 )
	Case "10"		//Privileges->Browse
		iw_prac.tab_1.SelectTab( 8 )
		iw_prac.tab_1.tabpage_privileges.uo_priv.tab_1.Post SelectTab ( 1 )
	Case "11"		//Privileges->Detail
		iw_prac.tab_1.SelectTab( 8 )
		iw_prac.tab_1.tabpage_privileges.uo_priv.tab_1.Post SelectTab ( 2 )
	Case "12"		//Privileges->Expiring
		iw_prac.tab_1.SelectTab( 8 )
		iw_prac.tab_1.tabpage_privileges.uo_priv.tab_1.Post SelectTab ( 3 )
End Choose

// Perform action
THIS.Post Of_goto_practitioner_action( ll_prac_id, ll_facility_id, ll_parent_facility_id, ll_rec_id, ll_seq_no, ls_moveto, ls_action )

RETURN 1

//---------------------------- APPEON END ----------------------------

end function

public function integer of_goto_contract (long ll_ctx_id, string ls_moveto);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.11.2006 By: Davis
//$<reason> The system will bring the user into the area selected in 
//$<reason> the Move To field in the To Do List Painter and then click a menu option 
//$<reason> if a value was selected in the Perform Function field in the To Do List.




// Check Right

//Start Code By Jervis 11-23-2007
/*
IF iw_contract.tab_contract_details.tabpage_search.ids_contract_access.Find("ctx_id = " + String(ll_ctx_id), 1, 1000) <= 0 THEN
	Messagebox(title, 'Access denied for contract ' +string(ll_ctx_id)+ '. Contact the contract owner.')
	iw_contract.tab_contract_details.Selecttab( 1 )
	Return 0
END IF
*/
long ll_RowPos, ll_InsertRow
string ls_display_page

iw_contract.tab_contract_details.tabpage_search.ids_search.SetFilter('')
iw_contract.tab_contract_details.tabpage_search.ids_search.Filter()
ls_display_page = gnv_user_option.of_Get_option_value( gs_user_id, "display_page" ) //added by gavins 20160808
ll_RowPos = iw_contract.tab_contract_details.tabpage_search.ids_search.Find("ctx_id = " + String(ll_ctx_id), 1, iw_contract.tab_contract_details.tabpage_search.ids_search.RowCount())
IF   ll_RowPos <= 0 and ls_display_page = '1' and AppeonGetClientType() = 'WEB' then //pagination
	//Added By Jay Chen 05-13-2015
	iw_contract.tab_contract_details.tabpage_search.dw_search.Reset()
	iw_contract.tab_contract_details.tabpage_search.dw_search.InsertRow(0) 
	of_goto_contract_page(ll_ctx_id)  
	IF iw_contract.tab_contract_details.tabpage_search.ids_search.Find("ctx_id = " + String(ll_ctx_id), 1, iw_contract.tab_contract_details.tabpage_search.ids_search.RowCount()) <= 0 THEN //end	
		Messagebox("Warning", 'Access denied for contract ' +string(ll_ctx_id)+ '. Contact the contract owner.')
		iw_contract.tab_contract_details.Selecttab( 1 )
		Return 0
	END IF
END IF
//End Code By Jervis 11-23-2007

//Locate in browse tabpage - Alfee 05.30.2008
Long ll_cnt, ll_found
ll_cnt = iw_contract.tab_contract_details.tabpage_search.dw_search_det1.RowCount() 
ll_found = iw_contract.tab_contract_details.tabpage_search.dw_search_det1.Find("ctx_id = " +String(ll_ctx_id), 1, ll_cnt)
IF ll_cnt < 1 or ll_found < 1 THEN 
	//Search for all contracts	
	iw_contract.tab_contract_details.tabpage_search.dw_search.Reset()
	ll_InsertRow =	iw_contract.tab_contract_details.tabpage_search.dw_search.InsertRow(0)
	//added by gavins 20160808
	If ll_ctx_id > 0 Then iw_contract.tab_contract_details.tabpage_search.dw_search.SetItem(  ll_InsertRow, 'ctx_id', ll_ctx_id )
	iw_contract.tab_contract_details.tabpage_search.cb_3.event Clicked() 
	//Find the contract again
	ll_cnt = iw_contract.tab_contract_details.tabpage_search.dw_search_det1.RowCount() 
	ll_found = iw_contract.tab_contract_details.tabpage_search.dw_search_det1.Find("ctx_id = " +String(ll_ctx_id), 1, ll_cnt)	
END IF
IF ll_found > 0 THEN 
	iw_contract.tab_contract_details.tabpage_search.dw_search_det1.ScrolltoRow(ll_found)
	iw_contract.tab_contract_details.tabpage_search.dw_search_det1.SetRow(ll_found)
END IF

// Get category
Long ll_category
String ls_company
SELECT category,(select top 1 facility_name from app_facility where app_facility.facility_id = ctx_basic_info.app_facility)
INTO :ll_category, :ls_company
FROM ctx_basic_info
WHERE ctx_id = :ll_ctx_id;

//Added By Jay Chen 10-22-2015
long ll_row
Integer li_view_id
//Get From Group Access
ll_row = ids_ctx_group_user_view.Find('ctx_group_access_ctx_id = ' + String(ll_ctx_id) + ' And Upper(security_group_users_user_id) = "'+upper(gs_user_id)+'"',1,ids_ctx_group_user_view.RowCount()) 
if isnull(ll_row) then ll_row = 0
If ll_Row > 0 Then
	li_view_id = ids_ctx_group_user_view.GetItemNumber(ll_row,'ctx_group_access_view_id')
else
	li_view_id = integer(gnv_data.of_getitem('code_lookup','ic_n',"lookup_code = " + string(ll_category))) //Get From Category from Code_Lookup	
End If
//end

// Set tab visible
//Integer li_view_id
//li_view_id = integer(gnv_data.of_getitem('code_lookup','ic_n',"lookup_code = " + string(ll_category))) //Commented By Jay Chen 10-22-2015
if not isnull(li_view_id) then 
	If li_view_id <> gi_contract_view_id Then
		gi_contract_view_id = li_view_id
		iw_contract.function dynamic wf_tab_visible(li_view_id) 
		iw_contract.function dynamic wf_set_select('All',false) 
	End If
end if

// Juage access
Boolean lb_tab_visible
String ls_tab_name
Choose Case ls_moveto
	Case "13"		//Contract Folder->Detail
		lb_tab_visible = iw_contract.tab_contract_details.tabpage_details.visible
		ls_tab_name = "Detail"
	Case "14"		//Contract Folder->Contacts
		lb_tab_visible = iw_contract.tab_contract_details.tabpage_contacts.visible
		ls_tab_name = "Contacts"
	Case "15"		//Contract Folder->Locations
		lb_tab_visible = iw_contract.tab_contract_details.tabpage_locations.visible
		ls_tab_name = "Locations"
	Case "16"		//Contract Folder->Organizations
		lb_tab_visible = iw_contract.tab_contract_details.tabpage_orgabizations.visible
		ls_tab_name = "Organizations"
	Case "17"		//Contract Folder->Fee Schedule
		lb_tab_visible = iw_contract.tab_contract_details.tabpage_fee_schedules.visible
		ls_tab_name = "Fee Schedule"
	Case "18"		//Contract Folder->Fee Schedule (NM)
		lb_tab_visible = iw_contract.tab_contract_details.tabpage_fee_sched2.visible
		ls_tab_name = "Fee Schedule (NM)"
	Case "19"		//Contract Folder->Supporting Documents
		lb_tab_visible = iw_contract.tab_contract_details.tabpage_images.visible
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 04.16.2007 By: Machongmin
		//$<reason> Fix a defect.
		/*
		ls_tab_name = "Supporting Documents"
		*/
		ls_tab_name = "Document Manager"
		ib_isvalid_contract = lb_tab_visible
		//---------------------------- APPEON END ----------------------------
		
	Case "20"		//Contract Folder->Action Items
		lb_tab_visible = iw_contract.tab_contract_details.tabpage_action_items.visible
		ls_tab_name = "Action Items"
	Case Else
		lb_tab_visible = True
End Choose

IF NOT lb_tab_visible THEN
	Messagebox("Warning", "Access denied for Contract Folder->" + ls_tab_name + " tab.")
	iw_contract.tab_contract_details.Selecttab( 1 )
	Return 0
END IF

// reset the retived flag to false
iw_contract.function dynamic wf_reset_retrieved()
iw_contract.function dynamic of_select_details_tab_retrieved(false)
iw_contract.tab_contract_details.tabpage_search.inv_contract_details.is_mode = iw_contract.tab_contract_details.tabpage_search.inv_contract_details.edit
iw_contract.tab_contract_details.tabpage_images.inv_contract_details.of_set_ctx_id( ll_ctx_id )

// Set title
IF ls_moveto <> "detail" THEN
	IF f_validstr(ls_company) THEN ls_company = ' Company: ' + ls_company ELSE ls_company = ""
	iw_contract.title = 'Contract ' + ls_company + '        Contract ID: ' + String(ll_ctx_id)
END IF

// Go to the appropriate tab
Choose Case ls_moveto
	Case "13"		//Contract Folder->Detail
		iw_contract.tab_contract_details.Selecttab( 2 )
		Post of_setredraw_details_dws() //Added By Ken.Guo 01/22/2013
	Case "14"		//Contract Folder->Contacts
		iw_contract.tab_contract_details.Selecttab( 4 )
	Case "15"		//Contract Folder->Locations
		iw_contract.tab_contract_details.Selecttab( 5 )
	Case "16"		//Contract Folder->Organizations
		iw_contract.tab_contract_details.Selecttab( 6 )
	Case "17"		//Contract Folder->Fee Schedule
		iw_contract.tab_contract_details.Selecttab( 7 )
	Case "18"		//Contract Folder->Fee Schedule (NM)
		iw_contract.tab_contract_details.Selecttab( 8 )
	Case "19"		//Contract Folder->Supporting Documents
		iw_contract.tab_contract_details.Selecttab( 9 )
	Case "20"		//Contract Folder->Action Items
		iw_contract.tab_contract_details.Selecttab( 10 )
End Choose

RETURN 1

//---------------------------- APPEON END ----------------------------

end function

public function integer of_find_actionitem (integer al_seq_id);//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.24.2007 By: Machongmin
//$<reason> Fix a defect.
long ll_rowcount,ll_current

if isvalid(iw_contract) then
		
	ll_rowcount = iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail.rowcount()
	ll_current = iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail.find("seq_id = " + string(al_seq_id),1,ll_rowcount) 
	if ll_current > 0 then
		iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail.post scrolltorow(ll_current)
		iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail.post setrow(ll_current)
		iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail.post setfocus()
	end if
end if

return 0
//---------------------------- APPEON END ----------------------------
end function

public function integer of_find_document (integer al_doc_id, string as_tabpage, integer al_seq_id);//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.24.2007 By: Machongmin
//$<reason> Fix a defect.

long ll_rowcount,ll_current

if not isvalid(iw_contract) then return -1 //modified if statement by alfee 09.04.2007

//if isvalid(iw_contract) then		
ll_rowcount = iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.rowcount()
ll_current = iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.find("doc_id = " + string(al_doc_id),1,ll_rowcount) 
if ll_current > 0 then
	iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.post setrow(ll_current)
	iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.post scrolltorow(ll_current)
	iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.tabpage_browse.dw_browse.post selectrow( ll_current,true)
end if
//end if

choose case as_tabpage
	case '29'
		//---------Begin Added by Alfee 09.04.2007-------------------------------------
		iw_contract.tab_contract_details.tabpage_images.tab_1.post selecttab(1)
		iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.Post SelectTab(1)
		//---------End Added ----------------------------------------------------------
	case '30'
		iw_contract.tab_contract_details.tabpage_images.tab_1.post selecttab(2)
		iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.post event ue_post_doc_changed(al_doc_id,0,0,0)
		this.post of_find_actionitem(al_seq_id)
	case '31' //Approval Status
		iw_contract.tab_contract_details.tabpage_images.tab_1.post selecttab(1)
		iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.Post event ue_show_approve_status( )
	case '32' //Esign Status
		iw_contract.tab_contract_details.tabpage_images.tab_1.post selecttab(1)
		iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.Post event ue_show_sertifi_status( )
end choose

return 0

//---------------------------- APPEON END ----------------------------
end function

public function integer of_preview_doc ();//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.26.2007 By: Machongmin
//$<reason> Fix a defect.
if isvalid(iw_contract) then
	iw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data.tab_1.post selecttab(2)
end if
return 0
//---------------------------- APPEON END ----------------------------
end function

public function integer of_27_11 (long al_doc_id, string as_moveto, long al_seq_id);
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.16.2007 By: Machongmin
//$<reason> Fix a defect.
if ib_isvalid_contract then
	this.post of_find_document(al_doc_id,as_moveto,al_seq_id)
	this.post of_preview_doc()
end if	
return 1
//---------------------------- APPEON END ----------------------------
end function

public function integer of_29_09 (long al_doc_id, string as_moveto, long al_seq_id);
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.16.2007 By: Machongmin
//$<reason> Fix a defect.
if ib_isvalid_contract then
	this.post of_find_document(al_doc_id,as_moveto,al_seq_id)
	this.post of_preview_doc()								
end if
return 1
//---------------------------- APPEON END ----------------------------
end function

public function integer of_clausemap ();//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.29.2007 By: Machongmin
//$<reason> Fix a defect.	
if isvalid(iw_contract) then
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 04.16.2007 By: Machongmin
	//$<reason> Fix a defect.
	If w_mdi.of_security_access( 6917 ) = 0 Then
		return -1		
	End If
	//---------------------------- APPEON END ----------------------------
	iw_contract.dynamic post event ue_do('clausemap')
end if
return 0
//---------------------------- APPEON END ----------------------------
end function

public function integer of_29_10 (long al_doc_id, string as_moveto, long al_seq_id);
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.16.2007 By: Machongmin
//$<reason> Fix a defect.
if ib_isvalid_contract then
	this.post of_find_document(al_doc_id,as_moveto,al_seq_id)
	this.post of_preview_doc()								
	this.post of_clausemap()
end if	
return 1
//---------------------------- APPEON END ----------------------------
end function

public function integer of_30 (long al_doc_id, string as_moveto, long al_seq_id);
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.16.2007 By: Machongmin
//$<reason> Fix a defect.
if ib_isvalid_contract then
	this.post of_find_document(al_doc_id,as_moveto,al_seq_id)
end if	
return 1
//---------------------------- APPEON END ----------------------------
end function

public function integer of_31 (long al_doc_id, string as_moveto, long al_seq_id);
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.16.2007 By: Machongmin
//$<reason> Fix a defect.
if ib_isvalid_contract then
	this.post of_find_document(al_doc_id,as_moveto,al_seq_id)
end if
return 1
//---------------------------- APPEON END ----------------------------
end function

public subroutine of_set_bg_color (long al_color);This.backcolor = al_color
tv_results.backcolor = al_color

dw_facility.Modify("Datawindow.Color='"+String(al_color)+"'")
dw_result.Modify("Datawindow.Color='"+String(al_color)+"'")
//dw_facility.Modify("t_1.Background.Color='"+String(al_color)+"'")
//dw_facility.Modify("t_2.Background.Color='"+String(al_color)+"'")
//dw_facility.Modify("facility_id.Background.Color='"+String(al_color)+"'")

dw_action_status.Modify("Datawindow.Color='"+String(al_color)+"'")
//dw_action_status.Modify("t_1.Background.Color='"+String(al_color)+"'")
//dw_action_status.Modify("action_status.Background.Color='"+String(al_color)+"'")

end subroutine

public subroutine of_set_where_due_date (datetime ldt_due_date);//////////////////////////////////////////////////////////////////////
// $<function>u_cst_todolist::of_set_where_due_date()
// $<arguments>
//		value	datetime	ldt_due_date		
// $<returns> (none)
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.20.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

idt_where_due_date = ldt_due_date


end subroutine

public function string of_gen_where_due_date (string as_module_id);//////////////////////////////////////////////////////////////////////
// $<function>u_cst_todolist::of_gen_where_due_date()
// $<arguments>
//		value	String	as_module_id		
// $<returns> string
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.20.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

If isnull(idt_where_due_date) Then Return ''
Choose Case as_module_id
	Case '01'
		Return ''
	Case '02'
		Return ''
	Case '03'
		Return " And ctx_action_items.due_date = Convert(datetime,'"+String(idt_where_due_date,'yyyy-mm-dd')+"',126) "
	Case '04'
		Return " And ctx_am_action_item.due_date = Convert(datetime,'"+String(idt_where_due_date,'yyyy-mm-dd')+"',126) "
End Choose

Return ''
end function

public subroutine of_retrievedata ();//Added By Alan on 2009-1-21
if iw_contract.tab_contract_details.tabpage_search.ib_retriev_detail then iw_contract.tab_contract_details.tabpage_search.CB_1.event clicked()	
end subroutine

public subroutine of_reset_tv_picture ();//////////////////////////////////////////////////////////////////////
// $<function>u_cst_todolist.of_reset_tv_picture()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description> Refresh the Picture
//////////////////////////////////////////////////////////////////////
// $<add> 2010-09-17 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long i,ll_cnt,ll_index
String ls_basic_picture[] = {'Custom039!','Custom050!','Custom039!','Custom050!','ScriptNo!','ScriptYes!'}
String ls_picturename
str_picture_index lstr_picture_index[]

ds_tdl_icon.Retrieve()

//Reset 
tv_results.DeletePictures()
istr_picture_index[] = lstr_picture_index[]

//Add Basic Pictures
ll_cnt = UpperBound(ls_basic_picture[])
For i = 1 To ll_cnt
	ll_index = tv_results.Addpicture( ls_basic_picture[i])
	If ll_index > 0 Then
		istr_picture_index[ UpperBound(istr_picture_index[]) + 1 ].as_picturename = ls_basic_picture[i]
		istr_picture_index[ UpperBound(istr_picture_index[]) ].al_index = ll_index
	End If
Next

//Add To Do List Pictures
ll_cnt = ds_tdl_icon.RowCount()
For i = 1 To ll_cnt
	ls_picturename = ds_tdl_icon.GetItemString(i,'tv_icon')
	//Added By Ken.Guo 03/27/2013
	If isnumber(ls_picturename) Then
		inv_utils.of_download_picture( Long(ls_picturename),ls_picturename) 
	End If
	
	ll_index = tv_results.Addpicture( ls_picturename)
	If ll_index > 0 Then
		istr_picture_index[ UpperBound(istr_picture_index[]) + 1 ].as_picturename = ls_picturename
		istr_picture_index[ UpperBound(istr_picture_index[]) ].al_index = ll_index
	End If	
Next


Return

end subroutine

public function integer of_find_picture_index (string as_picturename);//////////////////////////////////////////////////////////////////////
// $<function>u_cst_todolistof_find_picture_index()
// $<arguments>
//		value	string	as_picturename		
// $<returns> integer
// $<description>
// $<description> Find the index in picture control.
//////////////////////////////////////////////////////////////////////
// $<add> 2010-09-17 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long i,ll_cnt

ll_cnt = UpperBound(istr_picture_index[])
For i = 1 To ll_cnt
	If Lower(istr_picture_index[i].as_picturename ) = Lower(as_picturename) Then
		Return istr_picture_index[i].al_index
	End If
Next

Return 3 //Default Value //Custom039!


end function

public subroutine of_showcontract ();If IsValid( w_contract ) Then w_contract.Post of_show( ) //add by gavin 2011-12-31
end subroutine

public function integer of_fill_tdl_data (long ll_handle, string as_type);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.28.2006 By: Davis
//$<reason> To retrieve to do list item.

LONG ll_row,ll_rowcnt
STRING ls_tdl_module
LONG ll_tdli_id
STRING LS_Allow_Drill_Down
LONG i,j
STRING ls_column[12]
STRING ls_value
Integer li_pos
long ll_tvi
STRING ls_str
STRING ls_sql, ls_sql_where
n_ds ldw_tdl, ldw_tdl_all
TREEVIEWITEM ltv_item, ltv_item_data
LONG ll_rowcount
INTEGER li_width, li_column_width[12]

// Check dw data
IF UpperBound(is_filter) = 0 THEN RETURN 0

If as_type = 'tv' Then
	// Check treeview item
	tv_results.Getitem( ll_handle, ltv_item_data)
	IF ltv_item_data.level <> 2 THEN RETURN 0
	IF NOT ltv_item_data.children THEN RETURN 0
	ll_tvi = tv_results.FindItem(ChildTreeItem!, ll_handle)
	IF ll_tvi > 0 THEN RETURN 0		// The data already list
	
	// Set Initializtion Value
	ll_row = Long( ltv_item_data.Data )
ElseIf as_type = 'dw' Then //Added By Ken.Guo 01/07/2013
	dw_result.SetRedraw(False)
	ll_row = dw_result.GetItemNumber(ll_handle,'tdl_row')
End If

IF ll_row = 0 THEN RETURN 0
IF UpperBound(is_where) < ll_row THEN RETURN 0

// Construct SQL according to term of to do item.
ls_tdl_module = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
LS_Allow_Drill_Down = dw_todoitem.GetitemString( ll_row, "Allow_Drill_Down" )
IF Isnull(LS_Allow_Drill_Down) THEN LS_Allow_Drill_Down = "0"
IF LS_Allow_Drill_Down <> "1" THEN RETURN 0

// Fill Treeview Begin
SetPointer( HourGlass! )
tv_results.SetRedraw( False )

// Add the SQL that where condition to datawindow
ls_sql_where = is_where[ll_row]

IF f_validstr(ls_sql_where) THEN
	
	ls_sql_where = " WHERE " + ls_sql_where
	/*
	choose case ls_tdl_module
		case "04"
			ls_sql_where = " and " + ls_sql_where
		case else
			ls_sql_where = " WHERE " + ls_sql_where
	end choose
	*/
	
ELSE
	ls_sql_where = ""
END IF

//Added By Jay Chen 12-05-2014
string ls_user_id
ls_user_id = dw_facility.GetItemString(1, "user_id")
IF NOT f_validstr(ls_user_id) THEN ls_user_id = gs_user_id
//end

CHOOSE CASE ls_tdl_module
	CASE "01"		//IntelliCred
		ldw_tdl = dw_tdl_intellicred
		ldw_tdl_all = dw_tdl_intellicred_all
		IF NOT f_validstr(Is_sql_intellicred) THEN
			Event ue_refresh_dddw(dw_tdl_intellicred)
		END IF
		ls_sql = Is_sql_intellicred + ls_sql_where
	CASE "02"		//IntelliApp
		ldw_tdl = dw_tdl_intelliapp
		ldw_tdl_all = dw_tdl_intelliapp_all
		IF NOT f_validstr(Is_sql_intelliapp) THEN event ue_refresh_dddw(dw_tdl_intelliapp )
		ls_sql = Is_sql_intelliapp + ls_sql_where
	CASE "03"		//Contract
		ldw_tdl = dw_tdl_intellicontract
		ldw_tdl_all = dw_tdl_intellicontract_all
		IF NOT f_validstr(Is_sql_intellicontract) THEN event ue_refresh_dddw( dw_tdl_intellicontract)
		//Begin - Added By Mark Lee 12/26/2012
		If not isnull(il_ctx_id) and ibn_use_ctx_id = True Then 
			IF f_validstr(ls_sql_where) THEN
				ls_sql_where += " And ( ctx_basic_info.ctx_id =" + string(il_ctx_id) + ") "
			Else
				ls_sql_where += " WHERE ( ctx_basic_info.ctx_id =" + string(il_ctx_id) + ") "
			End If
		End If
		//End - Added By Mark Lee 12/26/2012
		//Added By Jay Chen 12-05-2014
		If ls_user_id <> '-ALL-' Then 
			Is_sql_intellicontract += "join (select ctx_id from ctx_user_access_tmp  where user_id = '"+ls_user_id+"' )A on ctx_action_items.ctx_id = A.ctx_id "
		End If
		//end

		ls_sql = Is_sql_intellicontract + ls_sql_where
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.21.2007 By: Machongmin
	//$<reason> Fix a defect.
	case "04"
		ldw_tdl = dw_document
		ldw_tdl_all = dw_document_all
		IF NOT f_validstr(Is_sql_document) THEN event ue_refresh_dddw( dw_document)
		//Begin - Added By Mark Lee 12/26/2012
		If not isnull(il_ctx_id)  and ibn_use_ctx_id = True Then 
			IF f_validstr(ls_sql_where) THEN
				ls_sql_where += " And ( ctx_basic_info.ctx_id =" + string(il_ctx_id) + ") "
			Else
				ls_sql_where += " WHERE ( ctx_basic_info.ctx_id =" + string(il_ctx_id) + ") "
			End If
		End If
		//End - Added By Mark Lee 12/26/2012
		//Added By Jay Chen 12-05-2014
		If ls_user_id <> '-ALL-' Then 
			Is_sql_document += "join (select ctx_id from ctx_user_access_tmp  where user_id = '"+ls_user_id+"' )A on ctx_basic_info.ctx_id = A.ctx_id "
		End If
		//end
		ls_sql = Is_sql_document + ls_sql_where
		
	//---------------------------- APPEON END ----------------------------
END CHOOSE

// Retrive To Do List data
ldw_tdl.Reset()
ldw_tdl.SetFilter( "" )

//Added By Ken.Guo 10/14/2013. In order to Refresh DDDW data for lookupdislplay() function.
ldw_tdl.Dataobject = ldw_tdl.Dataobject
ldw_tdl.SetTransObject(SQLCA)
event ue_refresh_dddw( ldw_tdl)

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2009-01-12 By: Scofield
//$<Reason> The To Do List should always sort by the frist column and the second column
String ls_SortList,ls_SortCol
long	 ll_SortCnt

for j = 1 TO 12
	ls_SortCol = dw_todoitem.GetitemString(ll_row, "Display" + String(j,"00"))
	if f_ValidStr(ls_SortCol) then
		ls_SortList += "LookUpDisplay(" + ls_SortCol + ") A,"
		
		ll_SortCnt++
		if ll_SortCnt >= 2 then exit
	end if
next

if Right(ls_SortList,1) = "," then
	ls_SortList = Left(ls_SortList,Len(ls_SortList) - 1)
	ldw_tdl.SetSort(ls_SortList)
end if
//---------------------------- APPEON END ----------------------------

ldw_tdl.Modify('datawindow.table.select = "' + ls_sql + '"')
ll_rowcnt = ldw_tdl.Retrieve( )
//IF ll_rowcnt = 0 THEN
//	DEBUGBREAK();
//END IF

// Copy data to total dw
ll_rowcount = ldw_tdl_all.Rowcount( )
ldw_tdl.Rowscopy( 1, ll_rowcnt, Primary!, ldw_tdl_all, ll_rowcount + 1, Primary!)

// Get 12 field from results of TO DO LIST item data
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 12.18.2006 By: Davis
//$<reason> Use new method that width perfect but performance is too bad.
/*
FOR j = 1 TO 12
	ls_column[j] = dw_todoitem.GetitemString(ll_row, "Display" + String(j,"00"))
	IF f_validstr(ls_column[j]) THEN
		li_width = Integer(ldw_tdl.Describe( ls_column[j] + ".width" ))
		li_column_width[j] = Integer(li_width / 32)		// 32 units per word
	END IF
END FOR
*/
FOR j = 1 TO 12
	ls_column[j] = dw_todoitem.GetitemString(ll_row, "Display" + String(j,"00"))
	IF NOT f_validstr(ls_column[j]) THEN CONTINUE

	FOR i = 1 TO ll_rowcnt
		ls_str = Trim(ldw_tdl.inv_base.of_getitem( i, ls_column[j] ))
		IF f_validstr(ls_str) THEN
			li_width = LEN( ls_str)
		ELSE
			li_width = 6
		END IF
		IF li_column_width[j] < li_width OR Isnull(li_column_width[j]) THEN li_column_width[j] = li_width
	END FOR
END FOR
//---------------------------- APPEON END ----------------------------

Long ll_dw_row, ll_col_index
String ls_value_org

// Get content from 12 filed
FOR i = 1 TO ll_rowcnt
	ls_value = ""

	//Commented By Ken.Guo 01/07/2013
	If as_type = 'dw' Then
		If i = 1 Then
			ll_dw_row = ll_handle
		Else
			dw_result.RowsCopy( ll_handle,ll_handle, Primary!, dw_result, ll_handle + i - 1, Primary!	)
			ll_dw_row = ll_handle + i - 1
			dw_result.SetItem(ll_dw_row, 'expanded1', 0)
			dw_result.SetItem(ll_dw_row, 'expanded2', 0)
		End If
	End If	
	
	ll_col_index = 0 //Added By Ken.Guo 01/07/2013
	FOR j = 1 TO 12
		
		IF NOT f_validstr(ls_column[j]) THEN CONTINUE

		ls_str = Trim(ldw_tdl.inv_base.of_getitem( i, ls_column[j] ))
		IF NOT f_validstr(ls_str) THEN ls_str = "(None)"
		ls_value_org = ls_str //Added By Ken.Guo 01/07/2013
		
		li_width = LEN( ls_str)
		IF li_column_width[j] > li_width THEN
			ls_str +=  space((li_column_width[j] - li_width) )
		ELSEIF li_column_width[j] < li_width THEN
			li_column_width[j] = li_width
		END IF
		
		ls_value +=  ls_str + "    "
		
		//Added By Ken.Guo 01/07/2013
		ll_col_index++
		If as_type = 'dw' Then
			dw_result.SetItem(ll_dw_row, 'retrieved_child' ,1)
			dw_result.SetItem(ll_dw_row, 'display_field' + String(ll_col_index) , ls_value_org)
		End If
		
	END FOR
	
	//Added By Ken.Guo 01/08/2013. Added if Statement
	If as_type = 'tv' Then
		ltv_item.label = ls_value
		ltv_item.data = i + ll_rowcount
		ltv_item.PictureIndex = 5
		ltv_item.SelectedPictureIndex = 6
		tv_results.InsertItemLast(ll_handle, ltv_item)
	ElseIf as_type = 'dw' Then
		dw_result.SetItem(ll_dw_row, 'tdl_ai_row' ,i + ll_rowcount ) //Added By Ken.Guo 01/16/2013
	End If
	
END FOR
tv_results.SetRedraw( True )

//Added By Ken.Guo 01/08/2013
Long ll_tdl_id
If as_type = 'dw' Then
	dw_result.SetItem(ll_handle, 'expanded2', 1)
//	For i = 1 To dw_result.RowCount()
//		If dw_result.GetItemNumber(i, 'expanded1') = 1 Then
//			dw_result.Expand( i,1)
//		End If
//		If dw_result.GetItemNumber(i, 'expanded2') = 1 Then
//			ll_tdl_id = dw_result.GetItemNumber(i, 'tdl_id')
//			If dw_result.Find('tdl_id = ' + String(ll_tdl_id) + ' and expanded1 = 1 ', 1, i) > 0 Then
//				dw_result.Expand( i,2)
//			End If
//		End If
//	Next
	dw_result.Event ue_expand_histroy()
	dw_result.SetRedraw(True)
End If


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.20.2009 By: Ken.Guo
//$<reason> Should not Destroy these ds, 
//$ Because they are the pointer for Instance var for ds(e.g. dw_tdl_intellicontract_all)
/*
//01.19.2009 By Jervis
if isvalid(ldw_tdl) then destroy ldw_tdl
if isvalid(ldw_tdl_all) then destroy ldw_tdl_all
*/
//---------------------------- APPEON END ----------------------------
SetPointer( Arrow! )

Return 1

//---------------------------- APPEON END ----------------------------

end function

public function integer of_fill_tdl_data (long al_handle);Return of_fill_tdl_data(al_handle, 'tv')
end function

public subroutine of_setredraw_details_dws ();//====================================================================
// Function: of_setredraw_details_dws
//--------------------------------------------------------------------
// Description: To workaround APB bug. The screens sometimes show as blank.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 01/21/2013
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


If Not Isvalid(gw_contract) Then Return 
If AppeonGetClientType() = 'PB' Then Return

If gw_contract.tab_contract_details.Selectedtab = 2 Then
	gw_contract.tab_contract_details.tabpage_details.uo_1.dw_1.Post Setredraw( True)
	gw_contract.tab_contract_details.tabpage_details.uo_1.dw_occ.Post Setredraw( True)
	gw_contract.tab_contract_details.tabpage_details.uo_1.dw_ccc.Post Setredraw( True)
	gw_contract.tab_contract_details.tabpage_details.uo_1.dw_1.Post Setredraw( True)
	gw_contract.tab_contract_details.tabpage_details.uo_1.dw_products.Post Setredraw( True)
	gw_contract.tab_contract_details.tabpage_details.uo_1.dw_contract_dates.Post Setredraw( True)
End If


end subroutine

public subroutine of_invisible_close_button (boolean abn_visible);//Added By Mark Lee 04/12/2013
p_close.visible = abn_visible
cb_close.visible = abn_visible
end subroutine

public subroutine of_goto_contract_page (long al_ctx_id);//====================================================================
// Function: of_goto_contract_page
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long    al_ctx_id
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 05-13-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_display_page,ls_pagesize
long ll_pagesize,ll_cpage,ll_sumpage,ll_find,ll_cnt
//if AppeonGetClientType() = 'WEB' then
	ls_display_page = gnv_user_option.of_Get_option_value( gs_user_id, "display_page" )
	if isnull(ls_display_page) or ls_display_page = '' then ls_display_page = '0'
	ls_pagesize = gnv_user_option.of_Get_option_value( gs_user_id, "perpage_rows" )
	if isnull(ls_pagesize) or ls_pagesize = '' then ls_pagesize = '100'
	if long(ls_pagesize) > 0 then
		ll_pagesize = long(ls_pagesize)
	else
		ll_pagesize = 100
	end if
	if ls_display_page = '1' then
		update ctx_basic_info_log set sqlwhere = '' where session_id = :gs_session_id;
		iw_contract.tab_contract_details.tabpage_search.ids_search.DataObject = 'd_sp_contract_search_web'
		iw_contract.tab_contract_details.tabpage_search.ids_search.SetTransObject( sqlca)
		iw_contract.tab_contract_details.tabpage_search.ids_search.Retrieve(gs_user_id,'0',0,ll_pagesize,gs_session_id,al_ctx_id)
		iw_contract.tab_contract_details.tabpage_search.dw_search_det1.reset()
		iw_contract.tab_contract_details.tabpage_search.ids_search.RowsCopy(1,iw_contract.tab_contract_details.tabpage_search.ids_search.rowcount(), Primary!, iw_contract.tab_contract_details.tabpage_search.dw_search_det1, 1, Primary!)
		select cpage,pcount into :ll_cpage,:ll_sumpage from ctx_basic_info_log where session_id = :gs_session_id;
		iw_contract.tab_contract_details.tabpage_search.sle_page.text = string(ll_cpage) + '/' + string(ll_sumpage)
		iw_contract.tab_contract_details.tabpage_search.il_current_page = ll_cpage
		iw_contract.tab_contract_details.tabpage_search.il_sum_pages = ll_sumpage
		ll_cnt = iw_contract.tab_contract_details.tabpage_search.dw_search_det1.rowcount()
		if ll_cnt > 0 then
			ll_find = iw_contract.tab_contract_details.tabpage_search.dw_search_det1.find("ctx_id = " +String(al_ctx_id), 1, ll_cnt)
			if ll_find > 0 then
				iw_contract.tab_contract_details.tabpage_search.dw_search_det1.ScrolltoRow(ll_find)
				iw_contract.tab_contract_details.tabpage_search.dw_search_det1.event rowfocuschanged(ll_find)
			end if
		end if
	end if
//end if
//end
end subroutine

on u_cst_todolist.create
int iCurrent
call super::create
this.p_close=create p_close
this.p_refresh=create p_refresh
this.p_print=create p_print
this.p_go=create p_go
this.p_save=create p_save
this.cb_close=create cb_close
this.cb_refresh=create cb_refresh
this.cb_print=create cb_print
this.cb_go=create cb_go
this.cb_save=create cb_save
this.dw_facility=create dw_facility
this.st_time=create st_time
this.dw_action_status=create dw_action_status
this.cb_max=create cb_max
this.tv_results=create tv_results
this.dw_result=create dw_result
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_close
this.Control[iCurrent+2]=this.p_refresh
this.Control[iCurrent+3]=this.p_print
this.Control[iCurrent+4]=this.p_go
this.Control[iCurrent+5]=this.p_save
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_refresh
this.Control[iCurrent+8]=this.cb_print
this.Control[iCurrent+9]=this.cb_go
this.Control[iCurrent+10]=this.cb_save
this.Control[iCurrent+11]=this.dw_facility
this.Control[iCurrent+12]=this.st_time
this.Control[iCurrent+13]=this.dw_action_status
this.Control[iCurrent+14]=this.cb_max
this.Control[iCurrent+15]=this.tv_results
this.Control[iCurrent+16]=this.dw_result
end on

on u_cst_todolist.destroy
call super::destroy
destroy(this.p_close)
destroy(this.p_refresh)
destroy(this.p_print)
destroy(this.p_go)
destroy(this.p_save)
destroy(this.cb_close)
destroy(this.cb_refresh)
destroy(this.cb_print)
destroy(this.cb_go)
destroy(this.cb_save)
destroy(this.dw_facility)
destroy(this.st_time)
destroy(this.dw_action_status)
destroy(this.cb_max)
destroy(this.tv_results)
destroy(this.dw_result)
end on

event constructor;call super::constructor;//Commented By Ken.Guo 2016-11-23
//this.of_SetResize(true)
//this.inv_resize.of_setdwzoom( false)
////This.inv_resize.of_SetOrigSize(This.WorkSpaceWidth(),This.WorkSpaceHeight())
//This.inv_resize.of_Register(tv_results,This.inv_resize.scalerightbottom )
//This.inv_resize.of_Register(dw_action_status,This.inv_resize.fixedbottom )
//This.inv_resize.of_Register(cb_save,This.inv_resize.fixedrightbottom )
//This.inv_resize.of_Register(cb_close,This.inv_resize.fixedrightbottom )
//This.inv_resize.of_Register(cb_go,This.inv_resize.fixedrightbottom )
//This.inv_resize.of_Register(cb_print,This.inv_resize.fixedrightbottom )
//This.inv_resize.of_Register(cb_refresh,This.inv_resize.fixedrightbottom )
//This.inv_resize.of_Register(dw_facility,This.inv_resize.scaleright )
//
Setnull(idt_where_due_date) //Added by Ken.Guo on 2009-01-21


This.of_getparentwindow(iw_parent) //Added By Ken.Guo 04/10/2013

//Added By Ken.Guo 2015-10-10. for permission. readonly
If w_mdi.of_security_access( 2070 ) <> 2  or w_mdi.of_security_access( 2160 ) <> 2  Then
	dw_action_status.modify("action_status.protect='1' action_status.Background.Color='"+String(rgb(172,172,172))+"'")
End If


end event

event destructor;call super::destructor;If isvalid(dw_document) Then Destroy dw_document
If isvalid(dw_document_all) Then Destroy dw_document_all
If isvalid(dw_tdl_intelliapp) Then Destroy dw_tdl_intelliapp
If isvalid(dw_tdl_intelliapp_all) Then Destroy dw_tdl_intelliapp_all
If isvalid(dw_tdl_intellicontract) Then Destroy dw_tdl_intellicontract
If isvalid(dw_tdl_intellicontract_all) Then Destroy dw_tdl_intellicontract_all
If isvalid(dw_tdl_intellicred) Then Destroy dw_tdl_intellicred
If isvalid(dw_tdl_intellicred_all) Then Destroy dw_tdl_intellicred_all
If isvalid(dw_todoitem) Then Destroy dw_todoitem
If isvalid(ids_ctx_group_user_view) Then Destroy ids_ctx_group_user_view //Added By Jay Chen 10-22-2015
end event

event resize;call super::resize;
//Added By Ken.Guo 2016-11-23.  donot use pfc resize.
this.setredraw(false)
cb_close.move(newwidth - cb_close.width - 20, newheight - cb_close.height - 30)
cb_refresh.move(cb_close.x - cb_refresh.width - 10, cb_close.y )
cb_print.move(cb_refresh.x - cb_print.width - 10, cb_close.y)
cb_go.move(cb_print.x - cb_go.width - 10, cb_close.y)
cb_save.move(cb_go.x - cb_save.width - 10, cb_close.y)
dw_action_status.move(20, cb_close.y - 50)
dw_facility.width = newwidth - 50
tv_results.width = dw_facility.width
tv_results.height = newheight - tv_results.y - dw_action_status.height - 50


Event ue_move_picture()
dw_result.Resize(tv_results.width, tv_results.height)

This.event ue_move_max_button( )
this.setredraw(True)

gnv_debug.of_output(false, 'uo_todlist position: x=' + String(this.x) + ', y=' + string(this.y))
gnv_debug.of_output(false, 'uo_todlist.tv_results position: x=' + String(tv_results.x) + ', y=' + string(tv_results.y))
end event

type p_close from picture within u_cst_todolist
integer x = 2409
integer y = 1488
integer width = 73
integer height = 64
string picturename = "exit!"
boolean focusrectangle = false
boolean map3dcolors = true
string powertiptext = "Close"
end type

event clicked;If cb_close.enabled Then
	cb_close.event clicked()
End If
end event

type p_refresh from picture within u_cst_todolist
integer x = 2016
integer y = 1488
integer width = 73
integer height = 64
string picturename = "refresh.bmp"
boolean focusrectangle = false
boolean map3dcolors = true
string powertiptext = "Refresh"
end type

event clicked;If cb_refresh.enabled Then
	cb_refresh.event clicked()
End If
end event

type p_print from picture within u_cst_todolist
integer x = 1623
integer y = 1488
integer width = 73
integer height = 64
string picturename = "Print!"
boolean focusrectangle = false
boolean map3dcolors = true
string powertiptext = "Print"
end type

event clicked;If cb_print.enabled Then
	cb_print.event clicked()
End If
end event

type p_go from picture within u_cst_todolist
integer x = 1230
integer y = 1488
integer width = 73
integer height = 64
string picturename = "Run!"
boolean focusrectangle = false
boolean map3dcolors = true
string powertiptext = "Go"
end type

event clicked;If cb_go.enabled Then
	cb_go.event clicked()
End If
end event

type p_save from picture within u_cst_todolist
integer x = 841
integer y = 1488
integer width = 73
integer height = 64
string picturename = "save!"
boolean focusrectangle = false
boolean map3dcolors = true
string powertiptext = "Save"
end type

event clicked;If cb_save.enabled Then
	cb_save.event clicked()
End If
end event

type cb_close from picturebutton within u_cst_todolist
integer x = 2405
integer y = 1476
integer width = 393
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean originalsize = true
string powertiptext = "Close"
end type

event clicked;Parent.Trigger Event ue_close()
end event

type cb_refresh from picturebutton within u_cst_todolist
integer x = 2011
integer y = 1472
integer width = 393
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
boolean originalsize = true
string powertiptext = "Refresh"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.06.2006 By: Davis
//$<reason> Refresh To do list.

String ls_user_id

// Check product.
n_cst_tdl_function lnvo_tdl_function
lnvo_tdl_function.of_get_module( is_module[])

ls_user_id = dw_facility.GetItemString(1, "user_id")
IF NOT f_validstr(ls_user_id) THEN ls_user_id = gs_user_id

If ls_user_id = '-ALL-'	Then ls_user_id = '%' //Added by Ken.Guo on 2009-02-26
dw_todoitem.Retrieve(ls_user_id, is_module)

Parent.PostEvent("ue_retrieve_todolist")

//---------------------------- APPEON END ----------------------------

end event

type cb_print from picturebutton within u_cst_todolist
integer x = 1614
integer y = 1472
integer width = 393
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
boolean originalsize = true
string powertiptext = "Print"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.01.2006 By: Davis
//$<reason> Implement Dashboard.

Openwithparm( w_todolist_report, Parent)

//---------------------------- APPEON END ----------------------------

end event

type cb_go from picturebutton within u_cst_todolist
integer x = 1221
integer y = 1472
integer width = 393
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Go"
boolean originalsize = true
string powertiptext = "Go"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.01.2006 By: Davis
//$<reason> Implement Dashboard.

LONG ll_tvi, ll_tvi2
LONG ll_row
TREEVIEWITEM ltv_item, ltv_item2
STRING ls_tdl_module
STRING ls_moveto, ls_action
LONG ll_ctx_id
LONG ll_prac_id
LONG ll_facility_id,ll_parent_facility_id
LONG ll_rec_id
LONG ll_seq_no 
LONG ll_rowcnt
LONG ll_tdl_id
LONG ll_tdli_id
LONG i

long ll_Handle
constant long SW_SHOW       = 5
constant long WM_SYSCOMMAND = 274
constant long SC_RESTORE    = 61728

PowerObject lpo_NullParm

//////////////  DONT DELETE /////////
ib_doubleclick = FALSE
////////////////////////////////////

Long ll_level
If tv_results.visible Then
	// Check treeview item
	ll_tvi = tv_results.FindItem(CurrentTreeItem!, 0)
	IF ll_tvi <= 0 THEN RETURN 0
	tv_results.Getitem( ll_tvi, ltv_item)
	ll_level = ltv_item.level 
Else
	//Added By Ken.Guo 01/16/2013
	Long ll_selected_row
	//ll_selected_row = dw_result.GetSelectedrow(0)
	ll_selected_row = dw_result.GetRow() //Web Bug, we can only use GetRow.
	
//	gnv_debug.of_output( 'll_selected_row= ' + String(ll_selected_row))
	If ll_selected_row <= 0 Then Return 0
//	gnv_debug.of_output( 'isexpanded= ' + String(dw_result.isexpanded( ll_selected_row, 2)))
	If dw_result.isexpanded( ll_selected_row, 2) Then 
		//re-set current row, because current row = 0 when collapsed and expanded tv.
		dw_result.SetRow(ll_selected_row)		
	End If
	If dw_result.GetRow() <= 0 Then Return 0
	ll_level = 3  //Only Support 3 for TV DW
End If

CHOOSE CASE ll_level
	CASE 1	// To Do List level
	CASE 2	// To Do Item level
		ll_row = Long( ltv_item.Data )
		ls_tdl_module = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
		ll_tdl_id = dw_todoitem.GetitemNumber( ll_row, "tdl_id" )
		ll_tdli_id = dw_todoitem.GetitemNumber( ll_row, "tdli_id" )

		// Find total num of TO DO LIST
		ll_rowcnt = 0
		FOR i = 1 TO UPPERBOUND( il_tdl_id )
			IF il_tdl_id[i] = ll_tdl_id AND il_tdli_id[i] = ll_tdli_id THEN
				ll_rowcnt = il_tdli_cnt[i]
				EXIT
			END IF
		END FOR
	
		IF Isnull( ll_rowcnt ) THEN RETURN
		IF ll_rowcnt = 0 THEN RETURN

		CHOOSE CASE ls_tdl_module
			CASE "01"		//IntelliCred
				of_run_action(101, is_where[ll_row])		// Go to Action Items->Action Item Detail
			CASE "02"		//IntelliApp
				of_run_action(102, is_where[ll_row])		// Go to Action Items->Application Status
			CASE "03"		//Contract
				of_run_action(103, is_where[ll_row])		// Go to Action Items->Contract
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.22.2007 By: Machongmin
			//$<reason> Fix a defect.
			CASE "04"
				of_run_action(104,is_where[ll_row])
				//W_ACTION_TEIMS.tab_1.tabpage_document_manager.tab_1.tabpage_2.dw_details.retrieve()
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE

	CASE 3	// Drill Down record level
		If tv_results.visible Then
			// Get info of To Do Item Level
			ll_tvi2 = tv_results.FindItem(ParentTreeItem!, ll_tvi)
			IF ll_tvi2 <= 0 THEN RETURN 0
			tv_results.Getitem( ll_tvi2, ltv_item2)
			ll_row = Long( ltv_item2.Data )
		Else
			//Added By Ken.Guo 01/16/2013
			If dw_result.getrow() <= 0 Then Return 0
			ll_row = dw_result.GetItemNumber(dw_result.GetRow(),'tdl_row')
			If ll_row = 0 Then Return 0
		End If
		
		ls_moveto = dw_todoitem.GetitemString( ll_row, "moveto" )
		IF NOT f_validstr(ls_moveto) THEN RETURN
		
		ls_action = dw_todoitem.GetitemString( ll_row, "perform" )
		
		ls_tdl_module = dw_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )

		// Get info of Drill Down Record Level
		If tv_results.visible Then
			ll_row = Long( ltv_item.Data )
		Else
			ll_row = dw_result.GetItemNumber(dw_result.GetRow(),'tdl_ai_row')
			If ll_row = 0 Then Return 0
		End If
		
		CHOOSE CASE ls_tdl_module
			CASE "01","02"		//IntelliCred & IntelliApp
				IF ls_tdl_module = "01" THEN
					ll_prac_id = dw_tdl_intelliCred_all.GetitemNumber( ll_row, "prac_id" )
					ll_facility_id = dw_tdl_intelliCred_all.GetitemNumber( ll_row, "facility_id" )
					ll_rec_id = dw_tdl_intelliCred_all.GetitemNumber( ll_row, "rec_id" )
					ll_seq_no = dw_tdl_intelliCred_all.GetitemNumber( ll_row, "verif_info_seq_no" )
					ll_parent_facility_id = dw_tdl_intelliCred_all.GetitemNumber( ll_row, "pd_affil_stat_parent_facility_id" )
				ELSE
					ll_prac_id = dw_tdl_intelliapp_all.GetitemNumber( ll_row, "prac_id" )
					ll_facility_id = dw_tdl_intelliapp_all.GetitemNumber( ll_row, "facility_id" )
					ll_rec_id = dw_tdl_intelliapp_all.GetitemNumber( ll_row, "rec_id" )
					ll_seq_no = dw_tdl_intelliapp_all.GetitemNumber( ll_row, "net_dev_action_items_seq_no" )
					ll_parent_facility_id = ll_facility_id
				END IF
				
				// Open the practitioner window
				IF gs_cust_type = "I" THEN
					IF NOT Isvalid(w_prac_data_intelliapp) THEN
						OpenSheet( w_prac_data_intelliapp, w_mdi, 4, original!)
						w_prac_data_intelliapp.move(0,0)
						w_prac_data_intelliapp.BringToTop = TRUE
					END IF
					
					iw_prac = w_prac_data_intelliapp
				ELSE
					IF NOT Isvalid(w_prac_data_intelliapp) THEN
						OpenSheet( w_prac_data_1, w_mdi, 4, original!)
					END IF
					
					iw_prac = w_prac_data_1
				END IF
				iw_prac.BringToTop = TRUE

				Parent.post of_goto_practitioner( ll_prac_id, ll_facility_id, ll_parent_facility_id, ll_rec_id, ll_seq_no, ls_moveto, ls_action)
			CASE "03"		//Contract
				ll_ctx_id = dw_tdl_intellicontract_all.GetitemNumber( ll_row, "ctx_id")
				IF Isnull(ll_ctx_id) OR ll_ctx_id = 0 THEN RETURN
				
				If not isvalid( gw_contract ) then OpenWithParm(w_appeon_gifofwait, "Opening the contract folder, please wait...", w_mdi )  //add by gaivn 2012-01-09
				
				//Start code By Jervis 12.02.2008  // location modify by gavin 2011-12-31
				//Restore windows size
				if isvalid(gw_contract) then
					gw_contract.of_hide( ) // add by gavin 2011-12-31
					if gw_contract.windowstate = Minimized! then
						ll_Handle = Handle(w_contract)
//						SendMessage(ll_Handle, WM_SYSCOMMAND, SC_RESTORE, 0) //modify by gavin 2012-01-09
					end if
				end if
				//End code By Jervis 12.02.2008
				
				//Open the Contract window
				IF NOT Isvalid(gw_contract) THEN
					/*window child
					OpenSheet(child, "w_contract", w_mdi, 4, original!)*/
					gf_OpenContractFolder_base(lpo_NullParm, false )				//Modified by Scofield on 2008-11-19 // modify by gavin 2011-12-31
				END IF
								
				
				iw_contract = gw_contract
//				iw_contract.Bringtotop = TRUE // modify by gavin 2011--12-31
				
				//Added By Alan on 2009-1-21
//				parent.post of_retrievedata()  //Modified by gavins 20160808 comment


				Parent.post of_goto_contract( ll_ctx_id, ls_moveto )
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 03.22.2007 By: Machongmin
				//$<reason> Fix a defect.
			CASE "04"
				long ll_rowcount,ll_current,ll_doc_id,ll_seq_id
				
				ll_ctx_id = dw_document_all.GetitemNumber( ll_row, "ctx_id")
				ll_doc_id = dw_document_all.getitemnumber( ll_row, "doc_id")
				ll_seq_id = dw_document_all.getitemnumber( ll_row, "seq_id")
				
				IF Isnull(ll_ctx_id) OR ll_ctx_id = 0 THEN RETURN
			
				If not isvalid( gw_contract ) then OpenWithParm(w_appeon_gifofwait, "Opening the contract folder, please wait...", w_mdi ) //add by gavin 2012-01-09
			
				//Start code By Jervis 12.02.2008
				//Restore windows size
				if isvalid(gw_contract) then
					gw_contract.of_hide( ) // add by gavin 2011-12-31
					if gw_contract.windowstate = Minimized! then
						ll_Handle = Handle(w_contract)
//						SendMessage(ll_Handle, WM_SYSCOMMAND, SC_RESTORE, 0) //modify by gavin 2012-01-09
					end if
					
				end if
				//End code By Jervis 12.02.2008
			
				//Open the Contract window
				IF NOT Isvalid(gw_contract) THEN
					//OpenSheet(child, "w_contract", w_mdi, 4, original!)
					gf_OpenContractFolder_base (lpo_NullParm, false )				//Modified by Scofield on 2008-11-19 // modify by gavin 2011-12-31
				END IF
				
					
				iw_contract = gw_contract
//				iw_contract.Bringtotop = TRUE // modify by gavin 2011-12-31
				
				//Added By Alan on 2009-1-21
//				parent.post of_retrievedata() //Modified by gavins 20160808 comment
				
				choose case ls_moveto
					case '21','22','23','24','25','26','28'
						Parent.post of_goto_contract( ll_ctx_id, string (long (ls_moveto) - 8 ))
					case '27'
						choose case ls_action 
							case '11'
								Parent.post of_goto_contract( ll_ctx_id, '19')
								//--------------------------- APPEON BEGIN ---------------------------
								//$<modify> 04.16.2007 By: Machongmin
								//$<reason> Fix a defect.
								/*
								parent.post of_find_document(ll_doc_id,ls_moveto,ll_seq_id)
								parent.post of_preview_doc()
								*/
								parent.post of_27_11(ll_doc_id,ls_moveto,ll_seq_id)
								//---------------------------- APPEON END ----------------------------
						end choose
					case '29','32'
						Parent.post of_goto_contract( ll_ctx_id, '19') //moved here by Alfee 09.04.2007
						choose case ls_action 
							case '09'	
								//Parent.post of_goto_contract( ll_ctx_id, '19')
								//--------------------------- APPEON BEGIN ---------------------------
								//$<modify> 04.16.2007 By: Machongmin
								//$<reason> Fix a defect.
								/*
								parent.post of_find_document(ll_doc_id,ls_moveto,ll_seq_id)
								parent.post of_preview_doc()								
								*/
								parent.post of_29_09(ll_doc_id,ls_moveto,ll_seq_id)
								//---------------------------- APPEON END ----------------------------
							case '10'
								//Parent.post of_goto_contract( ll_ctx_id, '19')
								//--------------------------- APPEON BEGIN ---------------------------
								//$<modify> 04.16.2007 By: Machongmin
								//$<reason> Fix a defect.
								/*
								parent.post of_find_document(ll_doc_id,ls_moveto,ll_seq_id)
								parent.post of_preview_doc()
								parent.post of_clausemap()
								*/
								parent.post of_29_10(ll_doc_id,ls_moveto,ll_seq_id)
								//---------------------------- APPEON END ----------------------------
							case else //added by alfee 09.04.2007
								parent.post of_find_document(ll_doc_id,ls_moveto,ll_seq_id)
						end choose
						
					case '30'
						Parent.post of_goto_contract( ll_ctx_id, '19')
						//--------------------------- APPEON BEGIN ---------------------------
						//$<modify> 04.16.2007 By: Machongmin
						//$<reason> Fix a defect.
						/*
						parent.post of_find_document(ll_doc_id,ls_moveto,ll_seq_id)
						*/
						parent.post of_30(ll_doc_id,ls_moveto,ll_seq_id)
						//---------------------------- APPEON END ----------------------------
					case '31'
						Parent.post of_goto_contract( ll_ctx_id, '19')
						//--------------------------- APPEON BEGIN ---------------------------
						//$<modify> 04.16.2007 By: Machongmin
						//$<reason> Fix a defect.
						/*
						parent.post of_find_document(ll_doc_id,ls_moveto,ll_seq_id)
						*/
						parent.post of_31(ll_doc_id,ls_moveto,ll_seq_id)
						//---------------------------- APPEON END ----------------------------
					end choose 
				//---------------------------- APPEON END ----------------------------
		END CHOOSE
		//Begin - Added By Mark Lee 04/28/12
		If isvalid(w_appeon_gifofwait ) Then Post close( w_appeon_gifofwait ) // add by gavin 2012-01-09
		Parent.Post of_ShowContract( ) //add by gavin 2012-01-09
		//End - Added By Mark Lee 04/28/12
END CHOOSE
//Commented By Mark Lee 04/28/12	need conditions  to trigger event
//If isvalid(w_appeon_gifofwait ) Then Post close( w_appeon_gifofwait ) // add by gavin 2012-01-09
//Parent.Post of_ShowContract( ) //add by gavin 2012-01-09
//---------------------------- APPEON END ----------------------------

end event

type cb_save from picturebutton within u_cst_todolist
integer x = 827
integer y = 1472
integer width = 393
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Save"
boolean originalsize = true
string powertiptext = "Save"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.04.2007 By: Davis

Long ll_ctx_id, ll_ctx_action_item_id
Long ll_prac_id
Long ll_facility_id
Long ll_rec_id
Long ll_seq_no
Long ll_wf_id, ll_wf_step_id
String ls_module
Long ll_action_status
String ls_reference_value
Long ll_exp_credential_flag
Long ll_tvi
Long ll_row
TREEVIEWITEM ltv_item
str_action_item lstr_action[1]
n_cst_workflow_triggers    lnv_trigger
string ls_assigned_to
n_cst_notification lnv_notification
String ls_alm_table,ls_alm_column //Added By Ken.Guo 2011-05-05.
String ls_table_arr[],ls_column_arr[]
Long ll_ctx_arr[]
long ll_docid_arr[],ll_doc_id,ll_level_id1_arr[],ll_level_id1,ll_level_id2_arr[],ll_level_id2
Long i, ll_tdl_id	, ll_tdli_id		

// Check treeview item
If tv_results.visible Then
	ll_tvi = tv_results.FindItem(CurrentTreeItem!, 0)
	If ll_tvi <= 0 Then Return
	
	tv_results.GetItem( ll_tvi, ltv_item)
	If ltv_item.Level <> 3 Then Return
Else
	//Added By Ken.Guo 01/17/2013
	If dw_result.GetRow() = 0 Then Return
	If Not dw_result.isexpanded( dw_result.GetRow(), 2) Then Return 
End If

// Get Info of current action item
ls_module = dw_action_status.GetItemString(1, "module")
ll_action_status = dw_action_status.GetItemNumber(1, "action_status")

If tv_results.Visible Then
	ll_row = Long( ltv_item.Data )
Else
	ll_row = dw_result.GetItemNumber(dw_result.GetRow(), 'tdl_ai_row')
End If

//Pop-up prompt when action status change	- jervis 03.10.2009
if gb_workflow then
	lnv_trigger = create n_cst_workflow_triggers
	if ls_module = "03" then
		lstr_action[1].wf_id = dw_tdl_intellicontract_all.GetItemNumber(ll_row,"wf_id")
		lstr_action[1].wf_step_id = dw_tdl_intellicontract_all.GetItemNumber(ll_row,"wf_action_type_id")
		ls_assigned_to =  dw_tdl_intellicontract_all.getitemstring(ll_row,"ctx_action_items_action_user")  //jervis 01.13.2011
	elseif ls_module = "04" then
		lstr_action[1].wf_id = dw_document_all.GetItemNumber(ll_row,"wf_id")
		lstr_action[1].wf_step_id = dw_document_all.GetItemNumber(ll_row,"wf_action_type_id")
		ls_assigned_to =  dw_document_all.getitemstring(ll_row,"ctx_am_action_item_action_user")  //jervis 01.13.2011
		
	end if 
	if not isnull(lstr_action[1].wf_id) then
		lstr_action[1].wf_action_status_id =  ll_action_status
		lstr_action[1].as_assigned_to = ls_assigned_to		//jervis 01.13.2011
		if lnv_trigger.of_popup_prompt( lstr_action[1]) <> 1 then
			destroy lnv_trigger
			return 
		end if
	end if
end if

Choose Case ls_module
	Case "01" // IntelliCred
		ll_prac_id = dw_tdl_intelliCred_all.GetItemNumber( ll_row, "prac_id" )
		ll_facility_id = dw_tdl_intelliCred_all.GetItemNumber( ll_row, "facility_id" )
		ll_rec_id = dw_tdl_intelliCred_all.GetItemNumber( ll_row, "rec_id" )
		ll_seq_no = dw_tdl_intelliCred_all.GetItemNumber( ll_row, "verif_info_seq_no" )
		ls_reference_value = dw_tdl_intelliCred_all.GetItemString( ll_row, "verif_info_reference_value" )
		ll_exp_credential_flag = dw_tdl_intelliCred_all.GetItemNumber( ll_row, "verif_info_exp_credential_flag" )
		
		If ls_reference_value <> 'Expiring Appointment Letter' Then
			ll_exp_credential_flag = 0
		End If
		
		gnv_appeondb.of_autocommit( )
		Update verif_info
			Set response_code = :ll_action_status
			, user_name = :gs_user_id
			, source = 'P'
			, date_recieved = getdate()
			, print_flag = 0
			, exp_credential_flag = :ll_exp_credential_flag
			Where prac_id = :ll_prac_id
			And facility_id = :ll_facility_id
			And rec_id = :ll_rec_id
			And seq_no = :ll_seq_no;
		Commit;
		
		// Trigger work flow
		If gb_workflow Then
			lstr_action[1].rec_id = ll_rec_id //dw_tdl_intelliCred_all.getItemnumber( ll_row, "rec_id" )
			lstr_action[1].prac_id = 	ll_prac_id				//dw_tdl_intelliCred_all.getItemnumber( ll_row, "prac_id" )
			lstr_action[1].facility_id = ll_facility_id		//dw_tdl_intelliCred_all.getItemnumber( ll_row, "facility_id" )
			lstr_action[1].wf_id = dw_tdl_intelliCred_all.GetItemNumber(ll_row,"wf_id")
			lstr_action[1].wf_action_status_id = ll_action_status //dw_tdl_intelliCred_all.GetItemNumber(ll_row,"action_status")
			lstr_action[1].wf_action_type_id = dw_tdl_intelliCred_all.GetItemNumber(ll_row,"action_type")
			lstr_action[1].status_changed_flag = False
			lstr_action[1].module = "01" //IntelliGred
			lstr_action[1].trigger_by = "008"		//Trigger By Action Item Changed
			lstr_action[1].screen_id = -10
			
			If lstr_action[1].wf_id > 0 And dw_tdl_intelliCred_all.GetItemString(ll_row,"wf_complete_flag") = "N" Then
				lstr_action[1].wf_step_id = dw_tdl_intelliCred_all.GetItemNumber(ll_row,"wf_action_type_id")
				lstr_action[1].notes = dw_tdl_intelliCred_all.GetItemString(ll_row,"verif_info_notes")
				lstr_action[1].status_changed_flag = True
				lstr_action[1].seq_no = dw_tdl_intelliCred_all.GetItemNumber( ll_row, "verif_info_seq_no" )
			End If
			
			//lnv_trigger = Create n_cst_workflow_triggers
			lnv_trigger.of_status_changed( lstr_action[1] )
			
			//Create Work Flow By Action Item Changed
			lnv_trigger.of_workflow_triggers(lstr_action)
		End If
	Case "02" // IntelliApp
		ll_rec_id = dw_tdl_intelliApp_all.GetItemNumber( ll_row, "rec_id" )
		
		gnv_appeondb.of_autocommit( )
		Update net_dev_action_items
			Set action_status = :ll_action_status
			, action_date = getdate()
			Where rec_id = :ll_rec_id;
		Commit;
		
		// Trigger work flow
		If gb_workflow Then
			lstr_action[1].rec_id = ll_rec_id //dw_tdl_intelliApp_all.getItemnumber( ll_row, "rec_id" )
			lstr_action[1].prac_id = dw_tdl_intelliApp_all.GetItemNumber( ll_row, "prac_id" )
			lstr_action[1].facility_id = dw_tdl_intelliApp_all.GetItemNumber( ll_row, "facility_id" )
			lstr_action[1].wf_id = dw_tdl_intelliApp_all.GetItemNumber(ll_row,"wf_id")
			lstr_action[1].wf_action_status_id = ll_action_status //dw_tdl_intelliApp_all.GetItemNumber(ll_row,"action_status")
			lstr_action[1].wf_action_type_id = dw_tdl_intelliApp_all.GetItemNumber(ll_row,"action_type")
			lstr_action[1].module = "02" //IntelliApp
			lstr_action[1].trigger_by = "008"		//Trigger By Action Item Changed
			lstr_action[1].screen_id = -10
			If lstr_action[1].wf_id > 0 And dw_tdl_intelliApp_all.GetItemString(ll_row,"wf_complete_flag") = "N" Then
				lstr_action[1].wf_step_id = dw_tdl_intelliApp_all.GetItemNumber(ll_row,"wf_action_type_id")
				lstr_action[1].seq_no = dw_tdl_intelliApp_all.GetItemNumber( ll_row, "net_dev_action_items_seq_no" )
				lstr_action[1].notes = dw_tdl_intelliApp_all.GetItemString(ll_row,"net_dev_action_items_notes")
				lstr_action[1].status_changed_flag = True
			End If
			
			//lnv_trigger = Create n_cst_workflow_triggers
			lnv_trigger.of_status_changed( lstr_action[1] )
			
			//Create Work Flow By Action Item Changed
			lnv_trigger.of_workflow_triggers(lstr_action)
		End If
		
	Case "03" // Contract
		ll_ctx_id = dw_tdl_intellicontract_all.GetItemNumber( ll_row, "ctx_id")
		ll_ctx_action_item_id = dw_tdl_intellicontract_all.GetItemNumber( ll_row, "ctx_action_items_ctx_action_item_id")
		
		gnv_appeondb.of_autocommit( )
		Update ctx_action_items
			Set action_status = :ll_action_status
			, action_date = getdate()
			Where ctx_id = :ll_ctx_id
			And ctx_action_item_id = :ll_ctx_action_item_id;
		Commit;
		
		//Added By Ken.Guo 2015-11-25
		inv_ctx_audit.of_audit_action_items_status(ll_ctx_id,0,1021,il_original_action_status,ll_action_status,ll_ctx_action_item_id)
		
		// Trigger work flow
		//If gb_workflow Then //Commented By Ken.Guo 07/31/2014. for Date Alarm Auto Renew Date
			lstr_action[1].ctx_action_item_id = ll_ctx_action_item_id //dw_tdl_intellicontract_all.getItemnumber( ll_row, "ctx_action_items_ctx_action_item_id" )
			lstr_action[1].ctx_id = ll_ctx_id	//dw_tdl_intellicontract_all.getItemnumber( ll_row, "ctx_id" )
			lstr_action[1].wf_id = dw_tdl_intellicontract_all.GetItemNumber(ll_row,"wf_id")
			lstr_action[1].wf_action_status_id = ll_action_status //dw_tdl_intellicontract_all.GetItemNumber(ll_row,"action_status")
			lstr_action[1].wf_action_type_id = dw_tdl_intellicontract_all.GetItemNumber(ll_row,"action_type")
			lstr_action[1].status_changed_flag = False
			lstr_action[1].module = "03" //Contract Tracking
			lstr_action[1].trigger_by = "008"		//Trigger By Action Item Changed
			lstr_action[1].screen_id = -10
			lstr_action[1].as_assigned_to = ls_assigned_to		//jervis 01.13.2011
			If lstr_action[1].wf_id > 0 And dw_tdl_intellicontract_all.GetItemString(ll_row,"wf_complete_flag") = "N" Then
				lstr_action[1].wf_step_id = dw_tdl_intellicontract_all.GetItemNumber(ll_row,"wf_action_type_id")
				lstr_action[1].notes = dw_tdl_intellicontract_all.GetItemString(ll_row,"ctx_action_items_notes")
				lstr_action[1].status_changed_flag = True
			End If

			If Not Isvalid(lnv_trigger) Then lnv_trigger = create n_cst_workflow_triggers //Added By Ken.Guo 08/26/2014
			
			lnv_trigger.of_status_changed( lstr_action[1] )
			
			//Create Work Flow By Action Item Changed
			lnv_trigger.of_workflow_triggers(lstr_action)
			
			//Added By Ken.Guo 2011-05-05. Update Snooze Date. 
			
			//Modified By Ken.Guo 2011-05-05. fixed bug for Task 725.
			long ll_complete, ll_cnt
			ll_complete = long(gnv_data.of_getitem('code_lookup','lookup_code',"lookup_name = 'Contract Action Status' and code = 'Complete'"))	
			If  ll_action_status = ll_complete Then
								
				Select  alm_table, alm_column,doc_id,level_id1,level_id2 
				Into :ls_alm_table,:ls_alm_column, :ll_doc_id,:ll_level_id1,:ll_level_id2
				From ctx_action_items 
				Where  ctx_id = :ll_ctx_id And ctx_action_item_id = :ll_ctx_action_item_id;
				ll_ctx_arr[1] = ll_ctx_id
				ls_table_arr[1] = ls_alm_table
				ls_column_arr[1] = ls_alm_column
				ll_docid_arr[1] = ll_doc_id
				ll_level_id1_arr[1] = ll_level_id1
				ll_level_id2_arr[1] = ll_level_id2
				
				//Modified By Ken.Guo 2017-02-27.
				Select count(1) into :ll_cnt From ctx_action_items Where ctx_id = :ll_ctx_id And action_status <> :ll_complete And alm_table = :ls_alm_table 
						And alm_column = :ls_alm_column and doc_id =:ll_doc_id  And level_id1 = :ll_level_id1   And level_id2 = :ll_level_id2;
				If ll_cnt = 0 Then	
					
					If Not isvalid(lnv_notification) Then lnv_notification = Create n_cst_notification 
					choose case lower(ls_alm_table)
						case 'ctx_basic_info','ctx_custom' 
							lnv_notification.of_update_ctx_notification( ll_ctx_arr[], ls_table_arr[], ls_column_arr[])
						case 'ctx_custom_multi_hdr','ctx_custom_multi_detail'
							lnv_notification.of_update_ctx_notification( ll_ctx_arr[], ls_table_arr[], ls_column_arr[],ll_docid_arr,ll_level_id1_arr,ll_level_id2_arr)	
					end choose
					gnv_data.of_retrieve( "ctx_ai_notification")
					If Not isvalid(lnv_notification) Then Destroy lnv_notification
				End If
			End If
		
		//End If
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.26.2007 By: Machongmin
		//$<reason> Fix a defect.	
	Case "04"
		
		//Long ll_doc_id
		Long ll_seq_id
		ll_doc_id = dw_document_all.GetItemNumber( ll_row, "doc_id")
		ll_seq_id = dw_document_all.GetItemNumber( ll_row, "seq_id")
		
		ll_ctx_id = dw_document_all.GetItemNumber(ll_row,"ctx_id") //Added By Ken.Guo 10/22/2012
		
		gnv_appeondb.of_autocommit( )
		Update ctx_am_action_item
			Set action_status = :ll_action_status
			, status_date = getdate()
			Where doc_id = :ll_doc_id
			And seq_id = :ll_seq_id;
		Commit;
		
		//Added By Ken.Guo 2015-11-25
		inv_ctx_audit.of_audit_action_items_status(ll_ctx_id,ll_doc_id,1064,il_original_action_status,ll_action_status,ll_seq_id)
		
		
		// Trigger work flow
		//If gb_workflow Then //Commented By Ken.Guo 07/31/2014. for Date Alarm Auto Renew Date
			lstr_action[1].ctx_id = dw_document_all.GetItemNumber(ll_row,"ctx_id")	//01.30.2008 By Jervis
			lstr_action[1].seq_no = ll_seq_id //dw_tdl_intellicontract_all.getItemnumber( ll_row, "ctx_action_items_ctx_action_item_id" )
			lstr_action[1].doc_id = ll_doc_id	//dw_tdl_intellicontract_all.getItemnumber( ll_row, "ctx_id" )
			lstr_action[1].wf_id = dw_document_all.GetItemNumber(ll_row,"wf_id")
			lstr_action[1].wf_action_status_id = ll_action_status //dw_tdl_intellicontract_all.GetItemNumber(ll_row,"action_status")
			lstr_action[1].wf_action_type_id = dw_document_all.GetItemNumber(ll_row,"action_type")
			lstr_action[1].status_changed_flag = False
			lstr_action[1].module = "04" //Contract Document manager
			lstr_action[1].trigger_by = "008"		//Trigger By Action Item Changed
			lstr_action[1].screen_id = -10
			lstr_action[1].as_assigned_to = ls_assigned_to		//jervis 01.13.2011
			If lstr_action[1].wf_id > 0 And dw_document_all.GetItemString(ll_row,"wf_complete_flag") = "N" Then
				lstr_action[1].wf_step_id = dw_document_all.GetItemNumber(ll_row,"wf_action_type_id")
				lstr_action[1].notes = dw_document_all.GetItemString(ll_row,"notes")
				lstr_action[1].status_changed_flag = True
			End If
			
			If Not Isvalid(lnv_trigger) Then lnv_trigger = create n_cst_workflow_triggers //Added By Ken.Guo 08/26/2014
			
			//lnv_trigger = Create n_cst_workflow_triggers
			lnv_trigger.of_status_changed( lstr_action[1] )
			
			//Create Work Flow By Action Item Changed
			lnv_trigger.of_workflow_triggers(lstr_action)
		//End If
		//---------------------------- APPEON END ----------------------------	
		
End Choose

If IsValid(lnv_trigger) Then Destroy lnv_trigger //05/08/2007 By Jervis

// Refresh
//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 05.08.2007 By: Frank.Gui
//$<reason> 
//dw_action_status.Hide()
//Parent.PostEvent("ue_retrieve_todolist")

TREEVIEWITEM   tv_parent
Long  ll_actionStatus,ll_Parent,ll_ParentRow
String  ls_Label

If tv_results.visible Then
	ll_Parent = tv_results.FindItem( parenttreeitem!, ll_tvi)
	tv_results.GetItem(ll_Parent,tv_parent)
	ll_ParentRow = Long(tv_parent.Data)
Else
	ll_ParentRow = dw_result.GetItemNumber(dw_result.GetRow(), 'tdl_row')
End If

ll_actionStatus = dw_todoitem.GetItemNumber(ll_ParentRow,'action_status')
If ll_actionStatus > 0 Then
	ls_Label = dw_todoitem.GetItemString(ll_ParentRow,'verbiage')
	
	Int  li_Pos,li_old_Number,li_PosBlank
	string ls_LabelPostfix,ls_LabelPrefix,ls_NewLabel, ls_current_label
	
	if tv_results.visible Then
		ls_current_label = tv_parent.Label
	Else
		ls_current_label = dw_result.GetItemString(dw_result.GetRow(), 'tdli_name')
	End If
	
	li_Pos = Pos(ls_Label,'##')
	If li_Pos > 0 Then
		ls_LabelPostfix = mid(ls_Label,li_Pos+2)
		ls_LabelPrefix = left(ls_Label,li_pos -1)
		
		li_PosBlank = Pos(ls_current_label,' ',li_Pos+1)
		If li_PosBlank < 1 Then 
			li_PosBlank = li_Pos
			DO WHILE isNumber(mid(ls_current_label,li_PosBlank+1,1))
				li_PosBlank++
			LOOP
		END IF
		
		li_old_Number = Integer(Mid(ls_current_label,li_Pos,li_PosBlank - li_Pos + 1))
		
		ls_NewLabel = ls_LabelPrefix+String(li_old_Number - 1)+ls_LabelPostfix//Mid(tv_parent.Label,li_PosBlank)
		
		If tv_results.visible Then
			tv_parent.Label = ls_NewLabel
			tv_results.SetItem(ll_Parent,tv_parent)
		Else
			dw_result.SetRedraw(False)
			ll_tdl_id = dw_result.GetItemNumber(dw_result.Getrow(), 'tdl_id' )
			ll_tdli_id = dw_result.GetItemNumber(dw_result.Getrow(), 'tdli_id' )
			For i = 1 To dw_result.rowcount()
				If dw_result.GetItemNumber(i, 'tdl_id' ) = ll_tdl_id and dw_result.GetItemNumber(i, 'tdli_id' ) = ll_tdli_id Then
					dw_result.SetItem(i,'tdli_name',ls_NewLabel)
					dw_result.SetItem(i,'expanded1',1)
					dw_result.SetItem(i,'expanded2',1)
					If i = dw_result.Getrow() Then
						dw_result.SetItem(i,'child_count',0)
						dw_result.SetItem(i,'tv_icon','')
						dw_result.SetItem(i,'tdl_row',0)
						dw_result.SetItem(i,'tdl_ai_row',0)
						dw_result.SetItem(i,'display_field1','0 To Do Items')
						dw_result.SetItem(i,'display_field2','')
						dw_result.SetItem(i,'display_field3','')
						dw_result.SetItem(i,'display_field4','')
						dw_result.SetItem(i,'display_field5','')
						dw_result.SetItem(i,'display_field6','')
						dw_result.SetItem(i,'display_field7','')
						dw_result.SetItem(i,'display_field8','')
						dw_result.SetItem(i,'display_field9','')
						dw_result.SetItem(i,'display_field10','')
						dw_result.SetItem(i,'display_field11','')
						dw_result.SetItem(i,'display_field12','')
					End If
				End If
			Next
		End If
		
	End If
	dw_action_status.Hide()
	
	dw_facility.SetItem(1, 'todo_cnt', dw_facility.GetItemNumber(1, 'todo_cnt') - 1)
	If tv_results.visible Then
		tv_results.DeleteItem(ll_tvi)
		ll_tvi = tv_results.FindItem(CurrentTreeItem!, 0)
	Else
		If li_old_Number > 1 Then
			dw_result.DeleteRow(dw_result.Getrow())
			//dw_result.groupcalc( )
			dw_result.Event ue_expand_histroy()
		End If
		ll_tvi = dw_result.GetRow()		
	End If
	Parent.of_item_changed( ll_tvi)
	If tv_results.visible Then
		tv_results.post setfocus()
	Else
		dw_result.Post SetRedraw(True)
		dw_result.Post SetFocus()	
	End If
ELSE
	n_ds  ldw
	
	ls_module = dw_todoitem.GetitemString(ll_ParentRow, "tdl_basic_info_module")

	CHOOSE CASE ls_module
		CASE "01"		// IntelliCred
			ldw = dw_tdl_intelliCred_all
		CASE "02"		// IntelliApp
			ldw = dw_tdl_intelliapp_all
		CASE "03"		// Contract
			ldw = dw_tdl_intellicontract_all
		case "04"
			ldw = dw_document_all
	END CHOOSE

	ldw.SetItem(ll_row, "action_status",ll_action_status)
End If
//---------------------------- APPEON END ----------------------------


This.Enabled = False
//---------------------------- APPEON END ----------------------------

//Added By Ken.Guo 10/22/2012. Refresh AI Data and WF Status Data
window lw_parent
u_tabpg_dm_manager luo_docmanager
If isvalid(gw_contract) Then
	If gw_contract.tab_contract_details.tabpage_search.il_ctx_id = ll_ctx_id Then
		If ls_module = '03' Then
			//Refresh AI Data
			If gw_contract.tab_contract_details.ib_select10 Then
				gw_contract.tab_contract_details.ib_select10 = False
			End If
			//Refresh CTX WF Status Windows Data
			If IsValid(w_ctxwfstepstatus) then 
				close(w_ctxwfstepstatus)	
				open(w_ctxwfstepstatus)
			Else
				open(w_ctxwfstepstatus)
			End If			
		ElseIf ls_module = '04' Then
			If gw_contract.tab_contract_details.ib_select9 Then
				//Refresh Document AI Data
				luo_docmanager = gw_contract.tab_contract_details.tabpage_images
				If luo_docmanager.tab_1.tabpage_data.of_get_doc_id() = ll_doc_id Then
					luo_docmanager.tab_1.tabpage_action. event ue_doc_changed(luo_docmanager.tab_1.tabpage_action.of_get_doc_id(),luo_docmanager.tab_1.tabpage_data.of_get_doc_id(),&
												luo_docmanager.tab_1.tabpage_action.of_get_revision(),luo_docmanager.tab_1.tabpage_data.of_get_revision())		
				End If
				//Refresh Doc WF Status Windows Data
				If IsValid(w_DocWFStepStatus) then 
					close(w_DocWFStepStatus)	
					open(w_DocWFStepStatus)
				Else
					open(w_DocWFStepStatus)
				End If				
			End If		
			
			//Refresh CTX WF Status Windows Data
			If IsValid(w_ctxwfstepstatus) then 
				close(w_ctxwfstepstatus)	
				open(w_ctxwfstepstatus)
			Else
				open(w_ctxwfstepstatus)
			End If			
			//Set WF Status Window to Back
			If isvalid(w_ctxwfstepstatus) or isvalid(w_DocWFStepStatus) Then
				Parent.of_getparentwindow(lw_parent) 
				If isvalid(lw_parent) Then
					lw_parent.bringtotop = True
				End If
			End If

		End If
	End If
End If
end event

type dw_facility from u_dw within u_cst_todolist
integer x = 27
integer width = 2752
integer height = 320
integer taborder = 10
string dataobject = "d_tdl_facility_user"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.28.2006 By: Davis
//$<reason> Implement dashbord.

this.of_setupdateable( false)
this.of_SetDropDownCalendar(TRUE) //Added by Ken.Guo on 2009-01-21
//---------------------------- APPEON END ----------------------------

end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.29.2006 By: Davis
//$<reason> Filter faciltiy for TODoList.
DataWindowChild dwchild
String ls_user_id
Datetime ldt_due_date
IF This.GetColumnName() = "facility_id" THEN	

	il_facility_id = Integer( data )
	parent.PostEvent("ue_retrieve_todolist")

ELSEIF This.GetColumnName() = "user_id" THEN
	ls_user_id = String( data )

	dw_facility.GetChild( "facility_id", dwchild )
	dwchild.SetTransObject( SQLCA )
	
	gnv_appeondb.of_startqueue( )

	dwchild.Retrieve( ls_user_id )
	
	If ls_user_id = '-ALL-'	Then ls_user_id = '%' //Added by Ken.Guo on 2009-02-26
	dw_todoitem.Retrieve( ls_user_id, is_module )
	
	gnv_appeondb.of_commitqueue( )

	dwchild.InsertRow(1)
	dwchild.SetItem( 1, "facility_name", "All" )
	dwchild.SetItem( 1, "facility_id", 0 )

	il_facility_id = 0
	dw_facility.SetItem( 1, "facility_id", 0 )
	
	parent.PostEvent("ue_retrieve_todolist")
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.21.2009 By: Ken.Guo
//$<reason> Add due_date filter. 
ELSEIF This.GetColumnName() = "due_date" THEN 
	If isdate(data) Then
		ldt_due_date = DateTime(date(data), Time(00:00:00.000))
		of_set_where_due_date(ldt_due_date)
		Parent.PostEvent("ue_retrieve_todolist")
	ElseIf Isnull(data) or data = '' or data = '1900-01-01' Then
		SetNull(ldt_due_date)
		of_set_where_due_date(ldt_due_date)
		Parent.PostEvent("ue_retrieve_todolist")
	End If
//---------------------------- APPEON END ----------------------------	
END IF

//---------------------------- APPEON END ----------------------------

end event

event rbuttondown;call super::rbuttondown;//////////////////////////////////////////////////////////////////////
// $<event>dw_facility::rbuttondown()
// $<arguments>
//		integer 	xpos		
//		integer 	ypos		
//		long    	row 		
//		dwobject	dwo 		
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 01.21.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

//Override
Datetime ldt_null,ldt_due_date
Setnull(ldt_null)
If dwo.name = 'due_date' Then
	If Isnull( This.GetItemDate(1,'due_date')) Then Return 1
	If Messagebox('Reset', "Would you like to set this Date to null?",Question!,YesNo!) = 1 Then
		This.SetItem(1,'due_date',ldt_null)
		This.SetItem(1,'due_date',ldt_null) //Do again. Workaround APB Bug.
		This.SetColumn('due_date') // Workaround APB Bug. To set focus.		
		This.Trigger Event ItemChanged(1,dwo,'')
	End If
End If
end event

event buttonclicked;call super::buttonclicked;//////////////////////////////////////////////////////////////////////
// $<event>dw_facility::buttonclicked()
// $<arguments>
//		value	long    	row             		
//		value	long    	actionreturncode		
//		value	dwobject	dwo             		
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 02.07.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Datetime ldt_null,ldt_due_date
Setnull(ldt_null)
If dwo.name = 'b_clear' Then
	If Isnull( This.GetItemDate(1,'due_date')) Then Return 1
	This.SetItem(1,'due_date',ldt_null)
	This.SetItem(1,'due_date',ldt_null) //Do again. Workaround APB Bug.
	This.SetColumn('due_date') // Workaround APB Bug. To set focus.		
	This.Trigger Event ItemChanged(1,dwo,'')
End If
end event

event clicked;call super::clicked;If dwo.name = 't_read_email' Then
	int	li_opentype,li_tabpage
	str_email_parm lstr_email_parm
	Long ll_ctx_id
	
	lstr_email_parm.ai_folder_type = 2 //Inbox
	lstr_email_parm.ai_from_type = 0 
	
	If isvalid(w_email_folder) Then
		w_email_folder.BringtoTop = True
		If w_email_folder.WindowState = Minimized! Then
			w_email_folder.WindowState = Normal!
		End If
		w_email_folder.SetFocus()
		If w_email_folder.rb_all.checked = False Then
			w_email_folder.rb_all.checked = True
			w_email_folder.rb_all.Event Clicked()
		End If
		If w_email_folder.tv_mail.FindItem(CurrentTreeItem!, 0) <> 2 Then
			w_email_folder.tv_mail.SelectItem(2)
		End If
	Else
		OpenSheetwithparm(w_email_folder,lstr_email_parm, w_mdi, 4, Original!) 	
	End If
	
End If
end event

type st_time from statictext within u_cst_todolist
boolean visible = false
integer x = 1714
integer width = 681
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_action_status from u_dw within u_cst_todolist
boolean visible = false
integer x = 23
integer y = 1416
integer width = 626
integer height = 160
integer taborder = 30
string dataobject = "d_tdl_action_status_changes"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.04.2007 By: Davis

this.of_setupdateable( false)

dw_action_status.GetChild("action_status", idwc_action_status ) 
idwc_action_status.Insertrow(0)
dw_action_status.Insertrow(0)

//---------------------------- APPEON END ----------------------------

end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.04.2007 By: Davis

cb_save.Enabled = TRUE

//---------------------------- APPEON END ----------------------------

end event

type cb_max from commandbutton within u_cst_todolist
integer x = 2734
integer y = 280
integer width = 87
integer height = 76
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "+"
end type

event clicked;cb_max.visible = False

dw_result.SetRedraw(False)
If cb_max.text = '+' Then
	dw_facility.Height = 100
	tv_results.y = tv_results.y - 220
	tv_results.Height = tv_results.Height + 220
	If dw_facility.RowCount() > 0 Then
		dw_facility.SetItem(1,'expanded',1)
	End If	
	cb_max.text = '-'
	gnv_user_option.of_set_option_value( gs_user_id, 'todolist_expanded', '1')
Else
	dw_facility.Height = 320
	If dw_facility.RowCount() > 0 Then
		dw_facility.SetItem(1,'expanded',0)
	End If
	tv_results.y = tv_results.y + 220
	tv_results.Height = tv_results.Height - 220
	cb_max.text = '+'
	gnv_user_option.of_set_option_value( gs_user_id, 'todolist_expanded', '0')
End If
gnv_user_option.of_save( )

dw_result.y = tv_results.y
dw_result.Height = tv_results.Height
dw_result.SetRedraw(True)
tv_results.SetFocus() //Workaround PB's Bug.
Parent.event ue_move_max_button( )


end event

type tv_results from u_tvs within u_cst_todolist
boolean visible = false
integer x = 27
integer y = 320
integer width = 2752
integer height = 1088
integer taborder = 20
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier New"
boolean linesatroot = true
boolean hideselection = false
string picturename[] = {"Custom039!","Custom050!","Custom039!","Custom050!","ScriptNo!","ScriptYes!"}
boolean ib_rmbmenu = false
end type

event doubleclicked;call super::doubleclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.01.2006 By: Davis
//$<reason> Implement Dashboard.

ib_doubleclick = TRUE

cb_go.PostEvent(Clicked!)

//---------------------------- APPEON END ----------------------------

end event

event itemcollapsing;call super::itemcollapsing;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.29.2006 By: Davis
//$<reason> Implement Dashboard.

IF ib_doubleclick THEN RETURN 1

//---------------------------- APPEON END ----------------------------

end event

event itemexpanding;call super::itemexpanding;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.29.2006 By: Davis
//$<reason> Implement Dashboard.

IF ib_doubleclick THEN RETURN 1

Parent.of_fill_tdl_data( handle )

//---------------------------- APPEON END ----------------------------

end event

event selectionchanged;call super::selectionchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.04.2007 By: Davis
//$<reason> Implement Dashboard.

cb_save.enabled = FALSE

Parent.of_item_changed( newhandle )

//---------------------------- APPEON END ----------------------------

end event

type dw_result from u_dw within u_cst_todolist
event ue_select_getrow ( )
event ue_expand_histroy ( )
event ue_treenodselected ( )
integer x = 27
integer y = 320
integer width = 2752
integer height = 1088
integer taborder = 40
string dataobject = "d_todolist_treeview"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event ue_select_getrow();//gnv_debug.of_output( 'This.GetRow() = ' + String(This.GetRow()))
If This.GetRow() > 0 Then
//	This.SelectRow(0, True)
	This.SelectRow(0, False)
//	gnv_debug.of_output( 'This.SelectRow(0, True) = ' + String(This.SelectRow(0, True)))
//	gnv_debug.of_output( 'This.SelectRow(0, False) = ' + String(This.SelectRow(0, False)))
	This.SelectRow(GetRow(), True)
End If
end event

event ue_expand_histroy();Long i,ll_tdl_id
For i = 1 To dw_result.RowCount()
	If dw_result.GetItemNumber(i, 'expanded1') = 1 Then
		dw_result.Expand( i,1)
	End If
	If dw_result.GetItemNumber(i, 'expanded2') = 1 Then
		ll_tdl_id = dw_result.GetItemNumber(i, 'tdl_id')
		If dw_result.Find('tdl_id = ' + String(ll_tdl_id) + ' and expanded1 = 1 ', 1, i) > 0 Then
			dw_result.Expand( i,2)
		End If
	End If
Next
end event

event ue_treenodselected();
//Added by Harry 2017-08-01 Task 699:Cannot hilight anything in the To-Do list
This.SetRedraw(False)
This.SelectRow(0, False)
This.SetRedraw(True)
end event

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.04.2007 By: Davis

this.of_setupdateable( false)

dw_action_status.GetChild("action_status", idwc_action_status ) 
idwc_action_status.Insertrow(0)
dw_action_status.Insertrow(0)

//---------------------------- APPEON END ----------------------------

end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.04.2007 By: Davis

cb_save.Enabled = TRUE

//---------------------------- APPEON END ----------------------------

end event

event rowfocuschanged;call super::rowfocuschanged;////Added By Ken.Guo 01/16/2013. it auto high select row in the web.
//If AppeonGetClientType() = 'PB' Then
////	If This.GetRow() > 0 Then
////		This.SelectRow(0, False)
////		This.SelectRow(GetRow(), True)
////	End If
//	Event ue_select_getrow()
//End If
Event ue_select_getrow() ////Added By Ken.Guo 2017-01-03 apb 6.8, apb 2016 should not workaround it.

cb_save.enabled = FALSE
Parent.of_item_changed( GetRow() )
end event

event expanding;call super::expanding;If row > 0 and grouplevel = 2 Then
	If This.GetItemString(row, 'Allow_Drill_Down') = '1'  Then
		If This.GetItemNumber(row, 'retrieved_child') = 1  Then
			//Ignore it if added before.
		ElseIf This.GetItemNumber(row, 'child_count')  > 0 Then
			of_fill_tdl_data(row,'dw')
		End If
		Return 0
	Else
		Return -1
	End If
End If


Return 0
end event

event collapsed;call super::collapsed;If Row > 0 Then
	If GroupLevel = 1 Then
		This.SetItem(row, 'expanded1', 0)
	Else
		This.SetItem(row, 'expanded2', 0)
	End If
End If

Parent.of_item_changed(GetRow())
end event

event expanded;call super::expanded;If Row > 0 Then
	If GroupLevel = 1 Then
		This.SetItem(row, 'expanded1', 1)
	Else
		This.SetItem(row, 'expanded2', 1)
	End If
End If

//This.Post event ue_select_getrow( ) //Commented by Harry 2017-08-01 Task 699:Cannot hilight anything in the To-Do list

Parent.of_item_changed(GetRow())
end event

event clicked;call super::clicked;//Post Event ue_select_getrow()

end event

event doubleclicked;call super::doubleclicked;If Row > 0 Then
	cb_go.PostEvent(Clicked!) 
End If
end event

event treenodeselected;call super::treenodeselected;
//Added by Harry 2017-08-01 Task 699:Cannot hilight anything in the To-Do list
 This.Post Event ue_treenodselected()

end event

