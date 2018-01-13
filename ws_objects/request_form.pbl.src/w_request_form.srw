$PBExportHeader$w_request_form.srw
forward
global type w_request_form from w_sheet
end type
type cb_dn from u_cb within w_request_form
end type
type cb_up from u_cb within w_request_form
end type
type cb_add_text from u_cb within w_request_form
end type
type st_notes from statictext within w_request_form
end type
type cb_properties from u_cb within w_request_form
end type
type cb_new_step from u_cb within w_request_form
end type
type cb_add_header from u_cb within w_request_form
end type
type cb_add_blank_line from u_cb within w_request_form
end type
type cb_left from u_cb within w_request_form
end type
type cb_right from u_cb within w_request_form
end type
type cb_close from u_cb within w_request_form
end type
type st_msg from statictext within w_request_form
end type
type dw_column from u_dw within w_request_form
end type
type dw_request_form from u_dw within w_request_form
end type
type gb_1 from groupbox within w_request_form
end type
type dw_select from u_dw within w_request_form
end type
type cb_add from u_cb within w_request_form
end type
type cb_copy from u_cb within w_request_form
end type
type cb_delete from u_cb within w_request_form
end type
type cb_save from u_cb within w_request_form
end type
type cb_restore from u_cb within w_request_form
end type
type dw_detail from u_dw within w_request_form
end type
type cb_role from u_cb within w_request_form
end type
type cb_rename from u_cb within w_request_form
end type
end forward

global type w_request_form from w_sheet
string tag = "Request Form Painter"
integer x = 214
integer y = 221
integer width = 4448
integer height = 2248
string title = "Request Form Painter"
windowstate windowstate = maximized!
boolean center = true
cb_dn cb_dn
cb_up cb_up
cb_add_text cb_add_text
st_notes st_notes
cb_properties cb_properties
cb_new_step cb_new_step
cb_add_header cb_add_header
cb_add_blank_line cb_add_blank_line
cb_left cb_left
cb_right cb_right
cb_close cb_close
st_msg st_msg
dw_column dw_column
dw_request_form dw_request_form
gb_1 gb_1
dw_select dw_select
cb_add cb_add
cb_copy cb_copy
cb_delete cb_delete
cb_save cb_save
cb_restore cb_restore
dw_detail dw_detail
cb_role cb_role
cb_rename cb_rename
end type
global w_request_form w_request_form

type variables
boolean ib_mouse_ldown = false //for dw_selected
boolean ib_detail_mouse_ldown = false 
boolean	ib_enable = true

string		is_design='m'
long		il_select_id
end variables

forward prototypes
public subroutine of_add ()
public subroutine of_copy ()
public subroutine of_delete ()
public function integer of_retrieveselectedrequest (string as_type, string as_name)
public function integer of_get_new_name (string as_types, ref string as_new_name)
public subroutine of_drop_list (long al_current_row, long al_target_row)
public subroutine of_enable_button (boolean abln_flag)
public function integer of_refresh_hint_msg (long al_selectrow)
public subroutine of_move_row (string as_from, string as_to, long al_row)
public subroutine of_detail_properties (long al_row)
public subroutine of_auto_move_row (string as_types)
public function integer of_save ()
public function integer of_insertrow ()
public function integer of_rename ()
public subroutine of_insert_label (string as_types, long al_insertrow)
public subroutine of_set_template_flag (integer al_data)
public subroutine of_restore_request ()
public function boolean of_checked_continuous_column (string as_table)
public subroutine of_sync_update (string as_type, string as_value)
public function boolean of_update_step_mark (long al_request_id)
public subroutine of_set_enable_step (boolean abln_enable)
public subroutine of_set_nomodify (long al_row)
public subroutine of_display_label (string as_category)
public function string of_date_format_replace (string as_data)
end prototypes

public subroutine of_add ();string 		ls_new_name
long 			ll_row, ll_id
DataWindowChild		ldwc_category,	ldwc_request_name
integer 		li_return

//save first
//if of_save( ) < 0 then return
if dw_request_form.rowcount( ) >0 then 
	if dw_request_form.modifiedcount( ) + dw_request_form.deletedcount( ) + dw_detail.modifiedcount( ) + dw_detail.deletedcount( ) > 0 then
//		messagebox(gnv_app.iapp_object.DisplayName,"Please save the data before you proceed.")
		li_return = messagebox(gnv_app.iapp_object.DisplayName,"The data need to be saved before you can run the current step. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
		if li_return =1 then 
			if of_save( ) <= 0 then return
		else			
			return 
		end if 
	end if 
end if 

//Added By Mark Lee 09/06/2013
if of_get_new_name("",ls_new_name) = 1 then
	if lower(dw_request_form.Describe("DataWindow.ReadOnly")) = "yes" then 
		of_enable_button(true)
	end if 
	
	dw_request_form.Reset()
	ll_row = dw_request_form.insertrow( 0)
	ll_id = gnv_app.of_get_id(upper("request_form_id"), 1)
	
	dw_request_form.setItem(ll_row,"request_name",ls_new_name)
	dw_request_form.setItem(ll_row,"request_id",ll_id)
	
	dw_request_form.getchild("category",ldwc_category)
	ldwc_category.SetTransobject(sqlca)
	ldwc_category.reset()
//	ldwc_category.retrieve("Contract Category" )
	ldwc_category.retrieve()
	
	//select 
	dw_select.GetChild("request_id",ldwc_request_name)
	ll_row = ldwc_request_name.insertrow( 0)
	ldwc_request_name.SetItem( ll_row, "request_name", ls_new_name)
	ldwc_request_name.SetItem( ll_row, "request_id", ll_id)
	ldwc_request_name.Setrow( ll_row)
	ldwc_request_name.scrolltorow(ll_row)
	dw_select.setitem( dw_select.getrow(),"request_id", ll_id)
	
	il_select_id = ll_id
	is_design='m'									//Added By Mark Lee 05/20/2015
	of_set_enable_step(true)	
	of_retrieveselectedrequest("detail","0")
	of_retrieveselectedrequest("export","0")
	
end if 
end subroutine

public subroutine of_copy ();string 			ls_name,	ls_new_name, ls_sql
DataWindowChild		ldwc_request_name
long 				ll_row, ll_request_id,	ll_detail_id,	ll_cnt, ll_cnt_document, ll_document_id, ll_cnt_role,	ll_id
datetime			ldt_now
integer 			li_return

if dw_request_form.rowcount( ) > 0 then
	if dw_request_form.modifiedcount( ) + dw_request_form.deletedcount( ) + dw_detail.modifiedcount( ) + dw_detail.deletedcount( ) > 0 then
		li_return = messagebox(gnv_app.iapp_object.DisplayName,"The data need to be saved before you can run the current step. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
		if li_return =1 then 
			if of_save( ) <= 0 then return
		else			
			return 
		end if 
	end if 

	if of_get_new_name("",ls_new_name) = 1 then
		ls_name  = dw_request_form.GetItemString(dw_request_form.GetRow(),"request_name")
		ll_request_id = dw_request_form.GetItemNumber(dw_request_form.GetRow(),"request_id")

		gnv_appeondb.of_startqueue( )			  
		select count(1) 
		into :ll_cnt
		from request_form_detail where request_id = :ll_request_id ;
		
		select count(1) 
		into :ll_cnt_document
		from request_form_document where request_id = :ll_request_id ;

		select count(1) 
		into :ll_cnt_role
		from request_form_role where request_id = :ll_request_id ;		
		gnv_appeondb.of_commitqueue( )
		
		if not isnull(ll_cnt) and  ll_cnt > 0 then 		
			ll_detail_id = gnv_app.of_get_id(upper("request_form_detail_id"), ll_cnt)	
		end if 
		if not isnull(ll_cnt_document) and  ll_cnt_document > 0 then 		
			ll_document_id = gnv_app.of_get_id(upper("request_form_document_id"), ll_cnt_document)	
		end if 
		if not isnull(ll_cnt_role) and  ll_cnt_role > 0 then 		
			ll_cnt_role = gnv_app.of_get_id(upper("request_form_role_id"), ll_cnt_role)	
		end if 
		ll_id = gnv_app.of_get_id(upper("request_form_id"), 1)
		
		gnv_appeondb.of_startqueue( )
		//Modified by harry 20170412 Web requester project -merge (add require_presubmission_approval)
		INSERT INTO request_form
			(request_id,request_name,export_id,category,status,submit_request_to,owner_user,template_id,allow_update_doc,
			include_request_notes,user_id,modify_date,description,send_email_setting,owner_email_id,approve_email_id,reject_email_id,
			cc_owner_user,cc_approve_user,cc_reject_user,bypass,steps,admin,multi_allow,cbx_display,edit_company,require_presubmission_approval)
			Select :ll_id, :ls_new_name,export_id,category,status,submit_request_to,owner_user,template_id,allow_update_doc,
			include_request_notes,user_id,modify_date,description,send_email_setting,owner_email_id,approve_email_id,reject_email_id,
			cc_owner_user,cc_approve_user,cc_reject_user,bypass,steps,admin,multi_allow,cbx_display,edit_company,require_presubmission_approval
			From request_form where request_id = :ll_request_id ;
		  
			if sqlca.sqlcode <> 0 then 
				gnv_debug.of_output( true, " Copy table request_form Error:"+sqlca.sqlerrtext	)	
				messagebox(gnv_app.iapp_object.DisplayName," Failed to copy the data!")
				return 
			end if 
		
		if not isnull(ll_cnt) and  ll_cnt > 0 then 		
			INSERT INTO request_form_detail
			(detail_id ,request_id ,types  ,export_col_name ,order_no ,user_id ,modify_date ,hint_message,
			export_id,required,rec_id,formats,column_height,column_width,steps_num,steps_mark,	design ) 
			Select rowno -1 + :ll_detail_id  ,request_id ,types, export_col_name ,order_no , :gs_user_id ,getdate() ,
				hint_message, export_id,required,rec_id,formats,column_height,column_width,steps_num,steps_mark, design
				from (select row_number() over (order by detail_id) as rowno , 
				(select request_id from request_form where request_name = :ls_new_name ) as request_id,
				types,export_col_name , 
				order_no , hint_message,export_id,required,rec_id, formats,column_height,column_width,steps_num,steps_mark, design
				FROM request_form_detail where request_id = :ll_request_id ) aa ; 
				
			if sqlca.sqlcode <> 0 then 
				gnv_debug.of_output( true, " Copy table request_form_detail Error:"+sqlca.sqlerrtext	)	
				messagebox(gnv_app.iapp_object.DisplayName," Failed to copy the data!")
				return 
			end if 				
			//update step marks 
			if of_update_step_mark(ll_id) = false then 
				gnv_debug.of_output( true, " Copy table request_form_detail Error: Update step marks "	)	
				messagebox(gnv_app.iapp_object.DisplayName," Failed to copy the data!")
				return 
			end if 
		end if			  
		
		if not isnull(ll_cnt_document) and  ll_cnt_document > 0 then 
			INSERT INTO request_form_document(document_id,request_id,document_name,doc_ext,user_id,modify_date,
			description,required,hint_message,steps_mark,ctx_doc_type)
				Select rowno -1 + :ll_document_id,request_id, document_name,doc_ext,:gs_user_id ,getdate() ,description,required,
					hint_message,steps_mark,ctx_doc_type
				from (select row_number() over (order by document_id) as rowno , 
				(select request_id from request_form where request_name = :ls_new_name ) as request_id,
				document_name,doc_ext,description,required,hint_message,steps_mark,ctx_doc_type
				FROM request_form_document where request_id = :ll_request_id ) aa ; 	  

			if sqlca.sqlcode <> 0 then 
				gnv_debug.of_output( true, " Copy table request_form_document Error:"+sqlca.sqlerrtext	)	
				messagebox(gnv_app.iapp_object.DisplayName," Failed to copy the data!")
				return 
			end if 				
		end if 
		
		if not isnull(ll_cnt_role) and  ll_cnt_role > 0 then 
			INSERT INTO request_form_role (request_role_id,request_id ,role_id,checked)
			select rowno -1 + :ll_cnt_role,
			(select request_id from request_form where request_name = :ls_new_name ) as request_id,
			role_id,checked  
			from (select row_number() over (order by request_role_id) as rowno,request_id ,role_id,checked 
				from request_form_role
				where request_id = :ll_request_id ) aa ;
				
			if sqlca.sqlcode <> 0 then 
				gnv_debug.of_output( true, " Copy table request_form_role Error:"+sqlca.sqlerrtext	)	
				messagebox(gnv_app.iapp_object.DisplayName," Failed to copy the data!")
				return 
			end if 				
		end if 
		
		gnv_appeondb.of_commitqueue( )
		
		if sqlca.sqlcode <> 0 then 
			gnv_debug.of_output( true, " Error:"+sqlca.sqlerrtext	)	
			messagebox(gnv_app.iapp_object.DisplayName," Failed to copy the data!")
			return 
		end if 
	
		//new request id	
		of_retrieveselectedrequest("request",string(ll_id))
		
		dw_select.GetChild("request_id",ldwc_request_name)
		ll_row = ldwc_request_name.insertrow( 0)
		ldwc_request_name.setItem( ll_row, "request_name", ls_new_name)
		ldwc_request_name.SetItem( ll_row, "request_id", ll_id)
		ldwc_request_name.scrolltorow(ll_row)
		ldwc_request_name.setrow(ll_row)
		dw_select.setitem(dw_select.getrow(), "request_id", ll_id)

		of_retrieveselectedrequest("detail","0")
		of_retrieveselectedrequest("export","0")
		
	end if 
end if 
end subroutine

public subroutine of_delete ();String 				ls_name
DataWindowChild	ldwc_category,	ldwc_request_name
long 					ll_row, ll_request_id, ll_id, ll_return, ll_getrow

if dw_request_form.rowcount() > 0 then

	ll_row = MessageBox("Delete Request Form", "Are you sure you want to delete the selected Request Form?", Question!, YesNo!, 2)
	IF ll_row = 2 THEN Return

	ls_name  = dw_request_form.GetItemString(dw_request_form.GetRow(),"request_name")
	ll_request_id = dw_request_form.GetItemNumber(dw_request_form.GetRow(),"request_id")

	gnv_appeondb.of_startqueue( )
	//Added By Mark Lee 10/22/2014
//	Delete from request_form where  request_id = :ll_request_id ;
//	Delete from request_form_detail where  request_id = :ll_request_id ;
//	Delete from request_form_document where  request_id = :ll_request_id ;
//	Delete from request_form_role where  request_id = :ll_request_id ;
	Update request_form Set deleted = 'Y', deleted_by = :gs_user_id, deleted_date= getdate() where  request_id = :ll_request_id ; 	
	gnv_appeondb.of_commitqueue( )
	
	if sqlca.sqlcode < 0 then 
		messagebox(gnv_app.iapp_object.DisplayName," Failed to delete the data!")
	end if 
	
	dw_select.GetChild("request_id",ldwc_request_name)
	ldwc_request_name.SetTransobject(sqlca)

	ll_row = ldwc_request_name.find( "request_id="+string(ll_request_id), 1, ldwc_request_name.rowcount())
	ll_return = ldwc_request_name.deleterow(ll_row)				
	ldwc_request_name.accepttext( )
	if ldwc_request_name.rowcount( ) > 0 then
		ll_getrow = ldwc_request_name.getrow( )			// IE 11 will get error the current row number.
		if isnull(ll_getrow) or ll_getrow = 0 or ll_getrow > ldwc_request_name.rowcount( )  then 				
			ll_getrow =  ldwc_request_name.rowcount( )
			ldwc_request_name.selectrow(ll_getrow,true)
		end if 
		ll_request_id = ldwc_request_name.getitemNumber(ll_getrow ,"request_id")
		if isnull(ll_request_id) or ll_request_id <= 0 then 
			ldwc_request_name.deleterow(ll_getrow)
			if ldwc_request_name.rowcount( ) = 0 then
				dw_select.reset( )
				dw_select.insertrow( 0)
				dw_request_form.Reset()
				is_design='m'									//Added By Mark Lee 05/20/2015
				of_set_enable_step(true)	
				of_retrieveselectedrequest("detail","0")
				of_retrieveselectedrequest("export","0")
				of_enable_button(false)
			end if 
		else
			dw_select.setitem(dw_select.getrow(),"request_id", ll_request_id)
			dw_select.event itemchanged(dw_select.getrow(), dw_select.object.request_id, string(ldwc_request_name.getitemNumber(ll_getrow,"request_id")))
		end if 
	else
		dw_select.reset( )
		dw_select.insertrow( 0)
		dw_request_form.Reset()
		is_design='m'									//Added By Mark Lee 05/20/2015		
		of_set_enable_step(true)	
		of_retrieveselectedrequest("detail","0")
		of_retrieveselectedrequest("export","0")
		of_enable_button(false)
	end if

end if
end subroutine

public function integer of_retrieveselectedrequest (string as_type, string as_name);//====================================================================
// Function: of_retrieveselectedrequest
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_type
// 	value    string    as_name
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/09/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
DataWindowChild			ldwc_category, ldwc_template
long 							ll_export_id,		ll_request_id, ll_row, ll_rec_id[], ll_category, i , ll_data
n_ds							lds_filter
string 						ls_arr[], ls_filter, ls_filter_data
n_cst_string					ln_cst_string

if isnull(as_name) or trim(as_name) = "" then
	return 0	
end if 

ls_filter_data = ""
dw_request_form.accepttext( )

choose case as_type
	case "request"
		gnv_appeondb.of_startqueue( )
		dw_request_form.reset( )
		dw_request_form.retrieve(long(as_name))
		
		dw_request_form.getchild("category",ldwc_category)
		ldwc_category.Settransobject( sqlca)
//		ldwc_category.retrieve("Contract Category" )
		ldwc_category.retrieve()
		gnv_appeondb.of_commitqueue( )
				
		if dw_request_form.rowcount( ) > 0 then
			ll_export_id  = dw_request_form.GetItemNumber(dw_request_form.getRow() ,"export_id")
			if not isnull(ll_export_id) and ll_export_id > 0 then
				dw_request_form.event ue_category_filter( ll_export_id,	ldwc_category)
			end if
			ll_data = dw_request_form.GetItemNumber( dw_request_form.getrow(), "category")				
			ll_row = ldwc_category.find("lookup_code="+string(ll_data) , 1, ldwc_category.rowcount() )
			if ll_row > 0 then 	// when the user had changed the view in the export, need checked the number.
				ll_data = ldwc_category.GetItemNumber(ll_row,"ic_n")			
				of_set_template_flag(ll_data)		//set flag
			end if 
			ll_data = long(dw_request_form.GetItemNumber(dw_request_form.getRow() ,"design"))
			if isnull(ll_data) or ll_data = 0 or ll_data = 1  then 
				is_design='m'
				of_set_enable_step(true)	
			elseif ll_data =2 then 
				is_design='p'
				of_set_enable_step(false)	
			elseif ll_data=3 then 
				is_design='c'
				of_set_enable_step(false)	
			else
				is_design='m'
				of_set_enable_step(true)	
			end if 
		end if
	case "export"
		if dw_request_form.rowcount( ) > 0 then 
			ll_export_id  = dw_request_form.GetItemNumber(dw_request_form.getRow() ,"export_id")
			if not isnull(ll_export_id) and ll_export_id > 0 then
				if is_design='p' then 
					ls_filter_data = " lower(ctx_table_name)='app_facility' "
				elseif is_design='c' then 
					ls_filter_data = " (lower(ctx_table_name)='ctx_contacts' or lower(ctx_table_name)='ctx_contacts_numbers') "	
				else
				//	is_design='m'
					ls_filter_data = " (lower(ctx_table_name)<>'app_facility' and lower(ctx_table_name)<>'ctx_contacts' and lower(ctx_table_name)<>'ctx_contacts_numbers' ) "
				end if 
				dw_column.setredraw( false)
				dw_column.setfilter("")
				dw_column.filter( )
				dw_column.setredraw( true)
				dw_column.retrieve( ll_export_id)			
				
				if dw_detail.rowcount() > 0 then 
					lds_filter = create n_ds
					lds_filter.dataobject = dw_detail.dataobject
					lds_filter.Settransobject(sqlca)
					dw_detail.rowscopy( 1, dw_detail.rowcount(),Primary!, lds_filter, 1, Primary!)
					
					lds_filter.setFilter( " types ='column' ")
					lds_filter.filter( )
					
					if lds_filter.rowcount( ) >0 then
//						ls_arr = lds_filter.object.export_col_name.Primary
						ll_rec_id = lds_filter.object.rec_id.Primary
//						ln_cst_string.of_arraytostring( ls_arr, "','", ls_filter)
						ln_cst_string.of_arraytostring( ll_rec_id, ",", ls_filter)
//						ls_filter = "'" + ls_filter + "'"
						// if change the export id then it will check the data 
						ll_row = lds_filter.find( " export_id > 0 and export_id <> "+string(ll_export_id) , 1, lds_filter.rowcount() )
						if  not isnull(ll_row) and ll_row > 0 then 
//							destroy lds_filter		// cancel
							dw_detail.RowsMove(1, dw_detail.Rowcount(), Primary!, dw_detail, dw_detail.DeletedCount() +  1, Delete!)
							of_refresh_hint_msg(0)
//							return 1			//cancel
						end if 
						
////						dw_column.setfilter(" export_field_name not in ("+ls_filter+")")
//						dw_column.setfilter(" rec_id not in ("+ls_filter+")")
//						dw_column.filter( )
//						if dw_column.rowcount() > 0 then
//							dw_column.SelectRow( 0,false)
//							dw_column.Setrow( 1)
//							dw_column.scrolltorow(1)
//							dw_column.SelectRow( 1,True)
//						end if 
						ls_filter_data +=  " and rec_id not in ("+ls_filter+") "
					end if 
					destroy lds_filter								
				end if 
				
				//reset filter data
				dw_column.setredraw( false)
				dw_column.setfilter(ls_filter_data)
				dw_column.filter( )
				dw_column.setredraw( True)
			
				if dw_column.rowcount() > 0 then
					dw_column.SelectRow( 0, false)
					dw_column.Setrow( 1)
					dw_column.scrolltorow(1)
					dw_column.SelectRow( 1, True)
				end if 				
			else
				dw_column.reset( )
			end if 
		else
			dw_column.reset( )
		end if 
	case "detail"	
		if dw_request_form.rowcount() > 0 then 
			if is_design='p' then 
				ls_filter_data = " design='p' "
			elseif is_design='c' then 
				ls_filter_data = " design='c' "
			else
			//	is_design='m'
				ls_filter_data = " (isnull(design) or design='m') "
			end if 
			
			ll_request_id  = dw_request_form.GetItemNumber(dw_request_form.getRow() ,"request_id")
			dw_detail.setredraw( false)	
			dw_detail.Setfilter("")
			dw_detail.filter( )
			dw_detail.reset()
			dw_detail.setredraw( true)	
			dw_detail.retrieve( ll_request_id)
			
			if dw_detail.rowcount( ) >0 then
				dw_detail.setredraw( false)	
				dw_detail.Setfilter( ls_filter_data)
				dw_detail.filter( )
				dw_detail.setredraw( true)	
			end if 
			ll_row = dw_detail.GetSelectedRow( 0)
			of_refresh_hint_msg(ll_row)
		else
			dw_detail.reset( )
		end if 
			
end choose 

return 1
end function

public function integer of_get_new_name (string as_types, ref string as_new_name);// Get new name
//OpenWithParm(w_get_request_form_name, "C")
OpenWithParm(w_get_request_form_name, as_types)

as_new_name = Message.StringParm

if lower(as_new_name) = "cancel" then
	Return -1
else
	Return 1
end if
end function

public subroutine of_drop_list (long al_current_row, long al_target_row);//====================================================================
// Function: of_drop_list
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long    al_current_row
// 	value    long    al_target_row
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/10/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long 		ll_row , i , ll_target_row , ll_current_row , ll_steps, ll_detail_id, ll_request_id, ll_roder_no, ll_export_id
string 	ls_export_col_name, ls_table_name, ls_col_name, ls_types, ls_hint_message, ls_col_lable, ls_col_label
long 		ll_exists_col, ll_rec_id, ll_col_length, ll_prec, ll_scale, ll_column_height, ll_column_width, ll_steps_num, ll_steps_mark
string 	ls_required, ls_lu_field_name, ls_ctx_lookup_type, ls_export_field_name, ls_lookup_code, ls_field_style
string		ls_col_type, ls_formats, ls_export_format, ls_design, ls_default_value
long		ll_use_default

If not al_current_row >0 Then return
If not al_target_row > 0 Then return 
If al_current_row = al_target_row Then return

ll_steps = abs(al_current_row - al_target_row)
If al_current_row > al_target_row Then
	ll_row  = al_target_row
Else
	ll_row  = al_current_row
End If

For i = 1 to ll_steps
	If al_current_row > al_target_row Then
		ll_row = al_current_row + 1 - i
		ll_target_row = ll_row -1 
	Else
		ll_row = al_current_row  + i - 1
		ll_target_row = ll_row + 1
	End If
	
	ls_export_col_name = dw_detail.GetItemString( ll_row,"export_col_name")
	ls_export_field_name  = dw_detail.GetItemString( ll_row,"export_field_name")	
	ls_table_name = dw_detail.GetItemString( ll_row,"table_name")
	ls_col_name = dw_detail.GetItemString( ll_row,"col_name")
	ls_types = dw_detail.GetItemString( ll_row,"types")	
	ll_detail_id = dw_detail.GetItemNumber( ll_row,"detail_id")	
	ll_request_id = dw_detail.GetItemNumber( ll_row,"request_id")	
	ll_roder_no = dw_detail.GetItemNumber( ll_row,"order_no")	
	ls_hint_message = dw_detail.GetItemString( ll_row,"hint_message")		
	ls_col_label  = dw_detail.GetItemString( ll_row,"col_label")		
	ll_export_id = dw_detail.GetItemNumber( ll_row,"export_id")	
	ll_exists_col = dw_detail.GetItemNumber( ll_row,"exists_col")	
	ls_required = dw_detail.GetItemString( ll_row,"required")	
	ll_rec_id = dw_detail.GetItemNumber( ll_row,"rec_id")	
	ls_lu_field_name = dw_detail.GetItemString( ll_row,"lu_field_name")		
//	ls_ctx_lookup_type = dw_detail.GetItemString( ll_row,"ctx_lookup_type")		
	ls_lookup_code= dw_detail.GetItemString( ll_row,"lookup_code")		
	ls_field_style= dw_detail.GetItemString( ll_row,"lookup_field_style")		
	
	ls_col_type= dw_detail.GetItemString( ll_row,"col_type")	
	ll_col_length = dw_detail.GetItemNumber( ll_row,"col_length")	
	ll_prec = dw_detail.GetItemNumber( ll_row,"prec")	
	ll_scale = dw_detail.GetItemNumber( ll_row,"scale")	
	ls_export_format = dw_detail.GetItemString( ll_row,"export_format")	
	ls_formats = dw_detail.GetItemString( ll_row,"formats")	
	ll_column_height = dw_detail.GetItemNumber( ll_row,"column_height")	
	ll_column_width = dw_detail.GetItemNumber( ll_row,"column_width")	
	ll_steps_num = dw_detail.GetItemNumber( ll_row,"steps_num")	
	ll_steps_mark = dw_detail.GetItemNumber( ll_row,"steps_mark")	
	ls_design  = dw_detail.GetItemString( ll_row,"design")	
	ll_use_default = dw_detail.GetItemNumber( ll_row,"use_default")	
	ls_default_value  = dw_detail.GetItemString( ll_row,"default_value")	
	
	dw_detail.SetItem( ll_row,"export_col_name", dw_detail.GetItemString( ll_target_row,"export_col_name") )
	dw_detail.SetItem( ll_row,"export_field_name", dw_detail.GetItemString( ll_target_row,"export_field_name") )
	dw_detail.SetItem( ll_row,"table_name", dw_detail.GetItemString( ll_target_row,"table_name") )
	dw_detail.SetItem( ll_row,"col_name", dw_detail.GetItemString( ll_target_row,"col_name") )	
	dw_detail.SetItem( ll_row,"types",dw_detail.GetItemString( ll_target_row,"types")	)
	dw_detail.SetItem( ll_row,"detail_id", dw_detail.GetItemNumber( ll_target_row,"detail_id")	)
	dw_detail.SetItem( ll_row,"request_id", dw_detail.GetItemNumber( ll_target_row,"request_id")	)
	dw_detail.SetItem( ll_row,"user_id", gs_user_id)
	dw_detail.SetItem( ll_row,"modify_date", DateTime(Date(Now()), Time(Now())) )
	dw_detail.SetItem( ll_row,"order_no", dw_detail.GetItemNumber( ll_target_row,"order_no"))
	dw_detail.SetItem( ll_row,"hint_message", dw_detail.GetItemString( ll_target_row,"hint_message"))
	dw_detail.SetItem( ll_row,"col_label", dw_detail.GetItemString( ll_target_row,"col_label"))
	dw_detail.SetItem( ll_row,"export_id", dw_detail.GetItemNumber( ll_target_row,"export_id"))
	dw_detail.SetItem( ll_row,"exists_col", dw_detail.GetItemNumber( ll_target_row,"exists_col"))
	dw_detail.SetItem( ll_row,"required", dw_detail.GetItemString( ll_target_row,"required"))
	dw_detail.SetItem( ll_row,"rec_id", dw_detail.GetItemNumber( ll_target_row,"rec_id"))
	dw_detail.SetItem( ll_row,"lu_field_name", dw_detail.GetItemString( ll_target_row,"lu_field_name"))
//	dw_detail.SetItem( ll_row,"ctx_lookup_type", dw_detail.GetItemString( ll_target_row,"ctx_lookup_type"))
	dw_detail.SetItem( ll_row,"lookup_code", dw_detail.GetItemString( ll_target_row,"lookup_code"))
	dw_detail.SetItem( ll_row,"lookup_field_style", dw_detail.GetItemString( ll_target_row,"lookup_field_style"))
	
	dw_detail.SetItem( ll_row,"col_type", dw_detail.GetItemString( ll_target_row,"col_type"))
	dw_detail.SetItem( ll_row,"col_length", dw_detail.GetItemNumber( ll_target_row,"col_length"))
	dw_detail.SetItem( ll_row,"prec", dw_detail.GetItemNumber( ll_target_row,"prec"))
	dw_detail.SetItem( ll_row,"scale", dw_detail.GetItemNumber( ll_target_row,"scale"))
	dw_detail.SetItem( ll_row,"export_format", dw_detail.GetItemString( ll_target_row,"export_format"))
	dw_detail.SetItem( ll_row,"formats", dw_detail.GetItemString( ll_target_row,"formats"))
	dw_detail.SetItem( ll_row,"column_height", dw_detail.GetItemNumber( ll_target_row,"column_height"))
	dw_detail.SetItem( ll_row,"column_width", dw_detail.GetItemNumber( ll_target_row,"column_width"))
	dw_detail.SetItem( ll_row,"steps_num", dw_detail.GetItemNumber( ll_target_row,"steps_num"))
	dw_detail.SetItem( ll_row,"steps_mark", dw_detail.GetItemNumber( ll_target_row,"steps_mark"))
	dw_detail.SetItem( ll_row,"design", dw_detail.GetItemString( ll_target_row,"design"))
	dw_detail.SetItem( ll_row,"use_default", dw_detail.GetItemNumber( ll_target_row,"use_default"))
	dw_detail.SetItem( ll_row,"default_value", dw_detail.GetItemString( ll_target_row,"default_value"))
		
	dw_detail.SetItem( ll_target_row,"export_col_name", ls_export_col_name )
	dw_detail.SetItem( ll_target_row,"export_field_name", ls_export_field_name )	
	dw_detail.SetItem( ll_target_row,"table_name", ls_table_name)
	dw_detail.SetItem( ll_target_row,"col_name", ls_col_name )	
	dw_detail.SetItem( ll_target_row,"types",ls_types	)	
	dw_detail.SetItem( ll_target_row,"detail_id", ll_detail_id)
	dw_detail.SetItem( ll_target_row,"request_id", ll_request_id)
	dw_detail.SetItem( ll_target_row,"user_id", gs_user_id)
	dw_detail.SetItem( ll_target_row,"modify_date", DateTime(Date(Now()), Time(Now())) )
	dw_detail.SetItem( ll_target_row,"order_no", ll_roder_no)
	dw_detail.SetItem( ll_target_row,"hint_message", ls_hint_message)
	dw_detail.SetItem( ll_target_row,"col_label", ls_col_label)
	dw_detail.SetItem( ll_target_row,"export_id", ll_export_id)
	dw_detail.SetItem( ll_target_row,"exists_col", ll_exists_col)
	dw_detail.SetItem( ll_target_row,"required", ls_required)	
	dw_detail.SetItem( ll_target_row,"rec_id", ll_rec_id)
	dw_detail.SetItem( ll_target_row,"lu_field_name", ls_lu_field_name)	
//	dw_detail.SetItem( ll_target_row,"ctx_lookup_type", ls_ctx_lookup_type)	
	dw_detail.SetItem( ll_target_row,"lookup_code", ls_lookup_code)	
	dw_detail.SetItem( ll_target_row,"lookup_field_style", ls_field_style)		
	
	dw_detail.SetItem( ll_target_row,"col_type", ls_col_type)		
	dw_detail.SetItem( ll_target_row,"col_length", ll_col_length)		
	dw_detail.SetItem( ll_target_row,"prec", ll_prec)		
	dw_detail.SetItem( ll_target_row,"scale", ll_scale)	
	dw_detail.SetItem( ll_target_row,"export_format", ls_export_format)	
	dw_detail.SetItem( ll_target_row,"formats", ls_formats)	
	dw_detail.SetItem( ll_target_row,"column_height", ll_column_height)	
	dw_detail.SetItem( ll_target_row,"column_width", ll_column_width)	
	dw_detail.SetItem( ll_target_row,"steps_num", ll_steps_num)		
	dw_detail.SetItem( ll_target_row,"steps_mark", ll_steps_mark)		
	dw_detail.SetItem( ll_target_row,"design", ls_design)		
	dw_detail.SetItem( ll_target_row,"use_default", ll_use_default)	
	dw_detail.SetItem( ll_target_row,"default_value", ls_default_value)	
Next

dw_detail.accepttext() 

dw_detail.SelectRow(0, false)
dw_detail.Setrow(ll_target_row)
dw_detail.SelectRow(ll_target_row, true)
dw_detail.scrolltorow(ll_target_row)
	
end subroutine

public subroutine of_enable_button (boolean abln_flag);//Added By Mark Lee 09/10/2013

cb_copy.enabled = abln_flag
cb_delete.enabled = abln_flag
cb_rename.enabled = abln_flag
cb_save.enabled = abln_flag
cb_right.enabled = abln_flag
cb_left.enabled = abln_flag
cb_up.enabled = abln_flag
cb_dn.enabled = abln_flag
cb_add_blank_line.enabled = abln_flag
cb_add_text.enabled = abln_flag
cb_add_header.enabled = abln_flag
cb_new_step.enabled = abln_flag
cb_properties.enabled = abln_flag		
cb_role.enabled = abln_flag		
cb_restore.enabled = abln_flag
if abln_flag = false then 
	dw_request_form.Modify("DataWindow.ReadOnly=Yes ")
else
	dw_request_form.Modify("DataWindow.ReadOnly=No")
end if 

ib_enable = abln_flag

if w_mdi.of_security_access( 7010 ) = 0 then
	cb_delete.enabled = false
	cb_restore.enabled = false
end if

if w_mdi.of_security_access( 7011 ) = 0 then
	cb_role.enabled =false
end if 
end subroutine

public function integer of_refresh_hint_msg (long al_selectrow);string 		ls_hint_msg, ls_notes

if isnull(al_selectrow) or al_selectrow <= 0 then 
	st_msg.text = ""
	return 0
end if 

if dw_detail.rowcount() <= 0 or dw_detail.rowcount() < al_selectrow then 
	st_msg.text = ""
	return 0
end if

ls_hint_msg = dw_detail.getItemString( al_selectrow, "hint_message")
if isnull(ls_hint_msg) then ls_hint_msg = ""
st_msg.text = ls_hint_msg

return 1 
end function

public subroutine of_move_row (string as_from, string as_to, long al_row);//====================================================================
// Function: of_move_row
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_from
// 	value    string    as_to
// 	value    long      al_row
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/14/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long			ll_row, ll_currentrow, ll_insertrow, ll_request_id
string 		ls_types, ls_name, ls_lu_field_name
string 		ls_table, ls_column, ls_coltype, ls_format, ls_lookup_field_style, ls_temp
long			ll_rec_id, ll_column_width, ll_length, ll_column_height

if as_from = as_to then 
	return 
end if 

ll_request_id  = dw_request_form.GetItemNumber(dw_request_form.getRow() ,"request_id")

choose case as_from
	case "dw_column"
		ll_currentrow = dw_column.GetRow()	
		if ll_currentrow > 0 then 
			ll_rec_id = dw_column.GetItemNumber(ll_currentrow,"rec_id") 
			ls_table = dw_column.GetItemString(ll_currentrow,"ctx_table_name")
			ls_column	= dw_column.GetItemString(ll_currentrow,"ctx_column_name")
			ls_coltype = dw_column.GetItemString(ll_currentrow,"col_type") 				
			
			if dw_detail.rowcount( ) > 0 then 
				if dw_detail.find( " types  = 'column' and rec_id ="+string(ll_rec_id) , 1, dw_detail.rowcount( )) > 0 then 
					return 
				end if 
			end if 
			
			if isnull(ls_coltype) or trim(ls_coltype) = '' then 
				messagebox(gnv_app.iapp_object.DisplayName,"The compute column cannot be used. Please choose other columns.")
				return 	
			end if 
			
			if dw_detail.find( "table_name = '"+ls_table+"' and col_name ='"+ls_column+"' ", 1, dw_detail.rowcount()) > 0 then 
				messagebox(gnv_app.iapp_object.DisplayName,"The column "+ls_column+" from the table "+ls_table+" cannot be added twice.")
				return 	
			end if
				
			if  is_design='m'  then 
				//repeat data
				if lower(ls_table) = "ctx_basic_info" and lower(ls_column) = "app_facility" then  
					if dw_detail.find( "table_name = 'ctx_basic_info' and col_name ='app_facility' ", 1, dw_detail.rowcount()) > 0 then 
						messagebox(gnv_app.iapp_object.DisplayName,"The column app_facility from the table ctx_basic_info cannot be added twice.")
						return 	
					end if
				else
//					if dw_detail.find( "table_name = '"+ls_table+"' and col_name ='"+ls_column+"' ", 1, dw_detail.rowcount()) > 0 then 
//						messagebox(gnv_app.iapp_object.DisplayName,"The column "+ls_column+" from the table "+ls_table+" cannot be added twice.")
//						return 	
//					end if
				end if 
				
				//continue
				if  lower(ls_table) = "app_facility" and  lower(ls_column) = "facility_name" then 
					messagebox(gnv_app.iapp_object.DisplayName,"The column facility_name from the table app_facility cannot be added."+&
						"~r~n Please add the column app_facility from the table ctx_basic_info instead.")
					return 	
				end if 
			elseif is_design='p'  then  
				
			elseif is_design='c'  then  				
				
			end if 
//			ls_format	= dw_column.GetItemString(ll_currentrow,"export_format")
			
			if al_row > 0 then 
				ll_insertrow  = al_row + 1 
			else
				ll_insertrow = dw_detail.GetSelectedRow(0)
				if ll_insertrow > 0 then 
					ll_insertrow ++
				end if 
			end if 
						
			ll_row = dw_detail.insertrow(ll_insertrow )
			dw_detail.SelectRow( 0,false)
			dw_detail.Setrow( ll_row)
			dw_detail.scrolltorow(ll_row)
			dw_detail.SelectRow( ll_row,True)
			setnull(ls_name)																//Added By Mark Lee 10/14/2013
			dw_detail.SetItem( ll_row,"export_col_name",  ls_name)																		//not really value
			dw_detail.SetItem( ll_row,"table_name", dw_column.GetItemString(ll_currentrow,"ctx_table_name") )				//not really value
			dw_detail.SetItem( ll_row,"export_field_name", dw_column.GetItemString(ll_currentrow,"export_field_name") )	//not really value
			dw_detail.SetItem( ll_row,"col_name", dw_column.GetItemString(ll_currentrow,"ctx_column_name") )				//not really value
			dw_detail.SetItem( ll_row,"col_label", dw_column.GetItemString(ll_currentrow,"data_view_label") )					//not really value
			dw_detail.SetItem( ll_row,"export_id", dw_column.GetItemNumber(ll_currentrow,"export_id") )	
			dw_detail.SetItem( ll_row,"rec_id", dw_column.GetItemNumber(ll_currentrow,"rec_id") )	
			dw_detail.SetItem( ll_row,"lu_field_name", dw_column.GetItemString(ll_currentrow,"lu_field_name") )				//not really value
//			dw_detail.SetItem( ll_row,"ctx_lookup_type", dw_column.GetItemString(ll_currentrow,"ctx_lookup_type") )			//not really value
			dw_detail.SetItem( ll_row,"lookup_code", dw_column.GetItemString(ll_currentrow,"lookup_code") )					//not really value
			dw_detail.SetItem( ll_row,"lookup_field_style", dw_column.GetItemString(ll_currentrow,"lookup_field_style") )					//not really value
			dw_detail.SetItem( ll_row,"col_length", dw_column.GetItemNumber(ll_currentrow,"col_length") )	
			dw_detail.SetItem( ll_row,"col_type", dw_column.GetItemString(ll_currentrow,"col_type") )	
			dw_detail.SetItem( ll_row,"prec", dw_column.GetItemNumber(ll_currentrow,"prec") )	
			dw_detail.SetItem( ll_row,"scale", dw_column.GetItemNumber(ll_currentrow,"scale") )	
			dw_detail.SetItem( ll_row,"export_format", dw_column.GetItemString(ll_currentrow,"export_format") )	
//			dw_detail.SetItem( ll_row,"formats", dw_column.GetItemString(ll_currentrow,"export_format") )	
			dw_detail.SetItem( ll_row,"use_default", dw_column.GetItemNumber(ll_currentrow,"use_default") )	
			dw_detail.SetItem( ll_row,"default_value", dw_column.GetItemString(ll_currentrow,"default_value") )	
			
			ls_lookup_field_style = dw_column.GetItemString(ll_currentrow,"lookup_field_style")
			//Added By Mark 07/03/2014
			If ( lower(ls_coltype) = 'int' or lower(ls_coltype) = 'integer' or lower(ls_coltype) = 'real' or lower(ls_coltype) = 'float' or &
				lower(ls_coltype) = 'smallint'  or lower(ls_coltype) = 'tinyint' or lower(ls_coltype) = 'numeric' or lower(ls_coltype) = 'money'  or &
				lower(ls_coltype) = 'char'  or lower(ls_coltype) = 'varchar' or lower(ls_coltype) = 'nchar' or lower(ls_coltype) = 'nvarchar'  or &				
				lower(ls_coltype) = 'datetime' or lower(ls_coltype) = 'smalldatetime' )  and &
				(isnull(ls_lookup_field_style) or trim(ls_lookup_field_style) = '') then 
				ls_temp	= dw_column.GetItemString(ll_currentrow,"export_format")
				ls_temp = of_date_format_replace(ls_temp)
				dw_detail.SetItem( ll_row,"formats", ls_temp)				//Added By Mark Lee 12/16/2015 //of_date_format_replace
			end if
			 			
			dw_detail.SetItem( ll_row,"exists_col", 1)
			dw_detail.SetItem( ll_row,"types", "column")
			dw_detail.SetItem( ll_row,"request_id", ll_request_id)
			dw_detail.SetItem( ll_row,"user_id", gs_user_id)
			dw_detail.SetItem( ll_row,"modify_date", DateTime(Date(Now()), Time(Now())) )
//			dw_detail.SetItem( ll_row,"column_height", 0)
			dw_detail.SetItem( ll_row,"column_width", 0)		
			dw_detail.SetItem( ll_row,"design", is_design)		
			
			//Added By Mark 07/14/2014
			ll_length = dw_column.GetItemNumber(ll_currentrow,"col_length")
			if isnull(ls_lookup_field_style ) or trim(ls_lookup_field_style ) ='' then 				
//				if lower(ls_coltype) = 'datetime' or lower(ls_coltype) = 'smalldatetime' then 
//					ll_column_height = 1
//				else
//					if not isnull(ll_length) and ll_length = 8000 then
//						ll_column_height = 8
//					else
//						ll_column_height = 2
//					end if				
//				end if 
				if (lower(ls_coltype) = 'varchar' and (not isnull(ll_length) and ll_length = 8000)) or &
					(lower(ls_coltype) = 'nvarchar' and (not isnull(ll_length) and ll_length = 4000)) then 
					ll_column_height = 8
				else
					ll_column_height = 1
				end if 
			else
				ll_column_height = 1
			end if			
			dw_detail.SetItem( ll_row,"column_height", ll_column_height)
			
			// add it for table ctx_products settings
			if lower(ls_table) = "ctx_products" and (lower(ls_column) = "product_id" or lower(ls_column) = "product_type" ) then 
				dw_detail.SetItem( ll_row,"required", "Y")
			end if 
			
			if lower(ls_table) = "app_facility" and (lower(ls_column) = "facility_name" ) then 
				dw_detail.SetItem( ll_row,"required", "Y")
			end if 
			
			if lower(ls_table) = "ctx_basic_info" and (lower(ls_column) = "app_facility" ) then 
				dw_detail.SetItem( ll_row,"required", "Y")
			end if 
			
			if lower(ls_table) = "ctx_contacts" and (lower(ls_column) = "first_name" or lower(ls_column) = "last_name" ) then 
				dw_detail.SetItem( ll_row,"required", "Y")
			end if 
			
			dw_column.deleterow(ll_currentrow)
			if dw_column.rowcount() > 0  then
				if ll_currentrow < dw_column.rowcount() then 
					dw_column.SelectRow(0, false)
					dw_column.Setrow( ll_currentrow)
					dw_column.scrolltorow(ll_currentrow)
					dw_column.SelectRow(ll_currentrow, true)
				else
					dw_column.SelectRow(0, false)
					dw_column.Setrow( dw_column.rowcount())
					dw_column.scrolltorow(dw_column.rowcount())
					dw_column.SelectRow(dw_column.rowcount(), true)				
				end if
			end if 
		end if 
	case "dw_detail"
		ll_currentrow = dw_detail.GetRow()
		if ll_currentrow > 0 then
			ls_types = dw_detail.GetItemString(ll_currentrow,"types") 
			if not isnull(ls_types) and ls_types = "column" then 
				if al_row > 0 then 
					ll_insertrow  = al_row + 1 
				else
					ll_insertrow = dw_column.GetSelectedRow(0)
					if ll_insertrow > 0 then 
						ll_insertrow ++
					end if 
				end if 
								
				if sqlca.sqlcode = 0 then				
					ll_row = dw_column.insertrow(ll_insertrow )
					dw_column.SelectRow( 0,false)
					dw_column.Setrow( ll_row)
					dw_column.scrolltorow(ll_row)
					dw_column.SelectRow( ll_row,True)
					dw_column.SetItem( ll_row,"export_field_name", dw_detail.GetItemString(ll_currentrow,"export_field_name") )
					dw_column.SetItem( ll_row,"ctx_table_name", dw_detail.GetItemString(ll_currentrow,"table_name") )
					dw_column.SetItem( ll_row,"ctx_column_name", dw_detail.GetItemString(ll_currentrow,"col_name") )	
					dw_column.SetItem( ll_row,"data_view_label", dw_detail.GetItemString(ll_currentrow,"col_label") )	
					dw_column.SetItem( ll_row,"export_id", dw_detail.GetItemNumber(ll_currentrow,"export_id") )	
					dw_column.SetItem( ll_row,"rec_id", dw_detail.GetItemNumber(ll_currentrow,"rec_id") )	
					dw_column.SetItem( ll_row,"lu_field_name", dw_detail.GetItemString(ll_currentrow,"lu_field_name") )	
//					dw_column.SetItem( ll_row,"ctx_lookup_type", dw_detail.GetItemString(ll_currentrow,"ctx_lookup_type") )			//not really value
					dw_column.SetItem( ll_row,"lookup_code", dw_detail.GetItemString(ll_currentrow,"lookup_code") )	
					dw_column.SetItem( ll_row,"lookup_field_style", dw_detail.GetItemString(ll_currentrow,"lookup_field_style") )	

					dw_column.SetItem( ll_row,"col_length", dw_detail.GetItemNumber(ll_currentrow,"col_length") )	
					dw_column.SetItem( ll_row,"col_type", dw_detail.GetItemString(ll_currentrow,"col_type") )	
					dw_column.SetItem( ll_row,"prec", dw_detail.GetItemNumber(ll_currentrow,"prec") )	
					dw_column.SetItem( ll_row,"scale", dw_detail.GetItemNumber(ll_currentrow,"scale") )	
					dw_column.SetItem( ll_row,"export_format", dw_detail.GetItemString(ll_currentrow,"export_format") )	
					dw_column.SetItem( ll_row,"use_default", dw_detail.GetItemNumber(ll_currentrow,"use_default") )	
					dw_column.SetItem( ll_row,"default_value", dw_detail.GetItemString(ll_currentrow,"default_value") )	
				end if
			end if
			dw_detail.deleterow(ll_currentrow)
			if dw_detail.rowcount() > 0  then
				if ll_currentrow < dw_detail.rowcount() then 
					dw_detail.SelectRow(0, false)
					dw_detail.Setrow( ll_currentrow)
					dw_detail.scrolltorow(ll_currentrow)
					dw_detail.SelectRow(ll_currentrow, true)
				else
					dw_detail.SelectRow(0, false)
					dw_detail.Setrow( dw_detail.rowcount())
					dw_detail.scrolltorow( dw_detail.rowcount())
					dw_detail.SelectRow( dw_detail.rowcount(), true)				
				end if
			end if 
		end if 
end choose 
end subroutine

public subroutine of_detail_properties (long al_row);//====================================================================
// Function: of_detail_properties
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long    al_row
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/14/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long 			ll_row

dw_detail.accepttext( )
if al_row > 0  then 
	OpenWithParm(w_request_form_detail_property,al_row)		
	ll_row = Message.doubleparm
	if not isnull(ll_row) and ll_row > 0 then 
		dw_detail.SelectRow( 0, false)
		dw_detail.setrow(ll_row)
		dw_detail.scrolltorow(ll_row)
		dw_detail.SelectRow( ll_row,true)
		of_refresh_hint_msg(ll_row)
	end if 
end if 

end subroutine

public subroutine of_auto_move_row (string as_types);//====================================================================
// Function: of_auto_move_row
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_types
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/23/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//	ctx_custom	ctx_products	ctx_fee_sched_nm		ctx_custom_multi_hdr		ctx_basic_info	ctx_custom_multi_detail
//====================================================================
long		i, j, k,	ll_find, ll_end, ll_target, ll_rowcount, ll_range
string 	ls_table,	ls_column, ls_types

if isnull(as_types) or trim(as_types) = '' then return 
ll_rowcount = dw_detail.rowcount( )
if ll_rowcount > 0 then
	choose case as_types
		case "company"
			ll_find = dw_detail.find( "table_name = 'ctx_basic_info' and col_name ='app_facility' ", 1, ll_rowcount)
			if ll_find > 0 then 
				ll_target = ll_find
				ll_range = 1
			else
				ll_target = dw_detail.find( "table_name = 'app_facility' ", 1, ll_rowcount)
				ll_range = 0
			end if 
			
			// compute the begin position of move row
			if ll_target < ll_rowcount then
				for i = ll_target + ll_range to ll_rowcount
					ls_table 	= dw_detail.GetItemString(i,"table_name") 
					ls_column = dw_detail.GetItemString(i,"col_name")
					if not isnull(ls_table) and lower(ls_table) = "app_facility"  then
						ll_range ++
					else
						exit
					end if 
				next 
			end if 
			
			//  j = ll_rowcount
			if ll_target + ll_range - 1 <=  ll_rowcount then
				if ll_find = 0 then 
					j = ll_target + ll_range 
				else
					j = 1
				end if 
				
				DO
					ls_table 	= dw_detail.GetItemString(j,"table_name") 
					ls_column = dw_detail.GetItemString(j,"col_name")
					ls_types = dw_detail.GetItemString(j,"types")
					if not isnull(ls_types) and ls_types = "column" and not isnull(ls_table) and lower(ls_table) = "app_facility"  then
						// The position will change in up and down.
						if j < ll_target + ll_range  then 
							ll_end  = ll_target + ll_range - 1
						else
							ll_end  = ll_target + ll_range 
						end if 
						of_drop_list(j , ll_end)
						if j < ll_target + ll_range - 1 then 
							ll_target --
						else
							j++
						end if
						ll_range ++
					else 
						j++
					end if
					
					// out of the range
					if j = ll_target then 
						j = ll_target + ll_range 
					end if 
				LOOP UNTIL  j > ll_rowcount
			end if 
		case "ctx_products"
			
			ll_rowcount = dw_detail.rowcount( )
			for i = 1 to ll_rowcount
				ls_types = dw_detail.GetItemString( i,"types")	
				ls_table = dw_detail.GetItemString(i,"table_name")
				ls_column = dw_detail.GetItemString(i,"col_name")	
				
			Next		
			


	end choose
end if 

end subroutine

public function integer of_save ();//Added By Mark Lee 09/06/2013
integer 	li_return 
DatawindowChild	ldwc_request_name
string 	ls_name
long		ll_request_id,	ll_find, ll_count,ll_new, ll_request_count

dw_request_form.accepttext( )
dw_detail.accepttext( )

//need check  at frist.
li_return = dw_request_form.event pfc_preupdate( )
if li_return < 0 then return li_return

li_return = dw_detail.event pfc_preupdate( )
if li_return < 0 then return li_return

//
li_return =  Event pfc_save()

//retrieve the dddw when user 	add new one.
if li_return > 0 then 
	
//	reset select dw data.
//	dw_select.reset( )
//	dw_select.insertrow( 0)
	dw_select.getchild( "request_id", ldwc_request_name)
	ll_request_id =  dw_request_form.GetItemNumber(dw_request_form.GetRow(),"request_id")
	ldwc_request_name.settransobject( sqlca)
	ldwc_request_name.reset()
	ldwc_request_name.retrieve( )
	ll_find = ldwc_request_name.find( "request_id ="+string(ll_request_id), 1,	ldwc_request_name.rowcount( )	)
	ldwc_request_name.setrow( ll_find)
	ldwc_request_name.scrolltorow( ll_find)
	dw_select.setItem( dw_select.getRow(),"request_id",ll_request_id)
		
	ll_count = 0 	
	ll_request_count = 0 
	ll_find = 0 
	gnv_appeondb.of_startqueue( )
	Select count(1)
	Into :ll_count
	From request_form_role  Where request_id = :ll_request_id Using Sqlca;
	
	Select count(1) 
	Into :ll_request_count
	From request_form_detail 
	Where request_id = :ll_request_id and (design is null or design = 'm') Using Sqlca;
	gnv_appeondb.of_commitqueue( )
	
	if ll_count = 0 then
		Select count(1) Into :ll_find	From security_roles Using Sqlca;
		if ll_find > 0 Then
			ll_new = gnv_app.of_get_id(upper("request_form_role_id"), ll_find)				
			Insert into request_form_role (request_role_id, request_id, role_id, checked)
				Select row_number() over (order by role_id) - 1 + :ll_new , :ll_request_id, role_id, 'Y'  From security_roles	
				Using Sqlca;				
			If sqlca.sqlcode <> 0 then 
				gnv_debug.of_output( true, " Insert table request_form_role Error:"+sqlca.sqlerrtext	)	
				messagebox(gnv_app.iapp_object.DisplayName," Failed to Insert the data for table request_form_role automatically! ") 
			end if 	
		End if		
	End if 
	
	if isnull(ll_request_count) or ll_request_count = 0 then 
		messagebox(gnv_app.iapp_object.DisplayName,"No design is made to the current request. ~r~nIt will show as a blank page on the web.~r~n~r~nPlease select Request Design Mode to design the request content. ") 
	end if	
end if 

return li_return
end function

public function integer of_insertrow ();datawindowchild	ldwc_category



dw_request_form.InsertRow(0)
dw_request_form.getchild("category",ldwc_category)
ldwc_category.SetTransobject(sqlca)
//ldwc_category.retrieve("Contract Category" )
ldwc_category.retrieve( )

return 1
end function

public function integer of_rename ();//Added By Mark Lee 11/08/2013

string 						ls_new_name
long 							ll_id
DataWindowChild			ldwc_request_name
integer 						li_return
boolean						lbn_save = false

//save first
if dw_request_form.rowcount( ) >0 then 
	ll_id = dw_request_form.GetItemNumber(dw_request_form.getrow(),"request_id")
//	if isnull(ll_id) or ll_id <= 0 then 
//		li_return = messagebox(gnv_app.iapp_object.DisplayName,"The data need to be saved before you can run the current step. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
//		if li_return =1 then 
//			if of_save( ) <= 0 then				
//				return 0
//			else
//				lbn_save = true
//				ll_id = dw_request_form.GetItemNumber(dw_request_form.getrow(),"request_id")
//			end if 
//		else			
//			return 0
//		end if 
//	end if 
	
	if of_get_new_name("",ls_new_name) = 1 then
		Update request_form
		Set request_name = :ls_new_name
		Where request_id = :ll_id
		Using Sqlca;
		
		dw_request_form.SetItem( dw_request_form.getrow( ) ,"request_name",ls_new_name)		
//		dw_request_form.SetItemStatus( dw_request_form.getrow( ) ,"request_name",Primary!, NotModified!)				//notmodified

		dw_select.GetChild("request_id",ldwc_request_name)
		ldwc_request_name.setTransobject( sqlca)
		ldwc_request_name.SetItem( ldwc_request_name.getrow( )	, "request_name", ls_new_name)
		dw_select.SetItem(dw_select.getrow( ), "request_id", ll_id)
	end if 

end if 


return 1
end function

public subroutine of_insert_label (string as_types, long al_insertrow);//====================================================================
// Function: of_insert_label
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_types
// 	value    long      al_insertrow
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 01/16/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long 		ll_row, ll_insertrow,	ll_request_id
string		ls_types, ls_newname

if isnull(as_types) or trim(as_types) = "" then
	return 
end if 

ls_newname = ""
//Added By Mark Lee 01/16/2014
if isnull(al_insertrow) or al_insertrow < 0 then
	ll_insertrow = dw_detail.GetSelectedRow(0)
else
	ll_insertrow = al_insertrow
end if 

if lower(as_types) = "line" or lower(as_types) = "header" OR lower(as_types) = "step" OR lower(as_types) = "text"  then	
	if lower(as_types) = "header" OR lower(as_types) = "step" then	
		if of_get_new_name(lower(as_types), ls_newname) <> 1 then 
			return 
		end if 
	end if
	
	ll_request_id  = dw_request_form.GetItemNumber(dw_request_form.getRow() ,"request_id")	
//	ll_insertrow = dw_detail.GetSelectedRow(0) 	//Commented By Mark Lee 01/16/2014
	if ll_insertrow > 0 then 
		ll_insertrow ++
	else
		ll_insertrow  = 1
	end if 	
	ll_row = dw_detail.insertrow( ll_insertrow )
	dw_detail.SelectRow( 0,false)
	dw_detail.Setrow( ll_row)
	dw_detail.scrolltorow(ll_row)
	dw_detail.SelectRow( ll_row,True)
	dw_detail.SetItem( ll_row,"types",  lower(as_types))
	if not isnull(ls_newname) and trim(ls_newname) <> "" then 
		dw_detail.SetItem( ll_row,"export_col_name",  ls_newname)
	end if 
	dw_detail.SetItem( ll_row,"request_id", ll_request_id)
	dw_detail.SetItem( ll_row,"user_id", gs_user_id)
	dw_detail.SetItem( ll_row,"modify_date", DateTime(Date(Now()), Time(Now())) )
	
elseif  pos(as_types,"header;") > 0  OR pos(as_types,"step;") > 0  then	
	if of_get_new_name(lower(as_types), ls_newname) <> 1 then 
		return 
	end if 
//	ll_insertrow = dw_detail.GetSelectedRow(0)	
	if not isnull(ls_newname) and trim(ls_newname) <> "" then 
		dw_detail.SetItem( ll_insertrow,"export_col_name",  ls_newname)
		dw_detail.SetItem( ll_insertrow,"user_id", gs_user_id)
		dw_detail.SetItem( ll_insertrow,"modify_date", DateTime(Date(Now()), Time(Now())) )
	end if 
else
	return 
end if 

end subroutine

public subroutine of_set_template_flag (integer al_data);//====================================================================
// Function: of_set_template_flag
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    integer    al_data
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark		Date: 07/10/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
DataWindowChild		ldwc_template
long						i, ll_view_id

if isnull(al_data) then return

dw_request_form.getchild("template_id",ldwc_template)
ldwc_template.SetTransobject(sqlca)
if ldwc_template.rowcount() > 0 then 
	for i = 1 to ldwc_template.rowcount() 
		ll_view_id   = ldwc_template.GetItemNumber( i,"ic_n")	
		if not isnull(ll_view_id) and ll_view_id = al_data then 
			ldwc_template.setItem( i, "flag", 1)
		else
			ldwc_template.setItem( i, "flag", 0)
		end if 
	Next
end if 
end subroutine

public subroutine of_restore_request ();long						ll_id,	ll_find
DataWindowChild		ldwc_request_name


dw_select.GetChild("request_id",ldwc_request_name)
ldwc_request_name.SetTransobject(sqlca)
	
if 	ldwc_request_name.rowcount( ) > 0  then
	ll_id = ldwc_request_name.GetItemNumber(ldwc_request_name.getrow(),"request_id")
	ldwc_request_name.reset( )
	ldwc_request_name.Retrieve( )
	
	ll_find = ldwc_request_name.find( "request_id ="+string(ll_id), 1, ldwc_request_name.rowcount() )
	ldwc_request_name.scrolltorow( ll_find)
	ldwc_request_name.setrow( ll_find)

end if 
end subroutine

public function boolean of_checked_continuous_column (string as_table);boolean 		lbn_order	= false
long			i, ll_rowcount, ll_find, ll_find2
string			ls_types,ls_table_name,ls_col_name
n_ds			lds_copy

if isnull(as_table) or trim(as_table) = '' then return lbn_order
ll_rowcount = dw_detail.rowcount( )
lds_copy = create n_ds
lds_copy.settransobject( sqlca)
lds_copy.dataobject = dw_detail.dataobject
lds_copy.reset( )								//Added By Mark Lee 04/30/2015

//string null_str
//SetNull(null_str)
//
lds_copy.SetSort("order_no asc")				//Added By Mark Lee 04/30/2015 need reset sort for APB.
lds_copy.Sort()
lds_copy.GroupCalc()

dw_detail.rowscopy( 1,ll_rowcount , Primary!, lds_copy,1, Primary!)

lds_copy.setfilter( " types = 'step' or ( types = 'column' )")
lds_copy.filter( )

ll_rowcount = lds_copy.rowcount( )
ll_find = lds_copy.find( " table_name='"+as_table+"' ", 1, ll_rowcount)
if ll_find > 0 and ll_find < ll_rowcount then
//	messagebox("find",string(ll_find)+" table:"+as_table+" rowcount:"+string(ll_rowcount))
	for i = ll_find + 1   to ll_rowcount
		ls_types = lds_copy.GetItemString( i,"types")	
		ls_table_name = lds_copy.GetItemString(i,"table_name")
		ls_col_name = lds_copy.GetItemString(i,"col_name")	
		if ls_types = "column" then
			if lower(ls_table_name) <> lower(as_table) then 
				if i < ll_rowcount then
					ll_find2 = lds_copy.find( " table_name='"+as_table+"' ", i + 1 , ll_rowcount)
//					messagebox("find2 "," table:"+string(ls_table_name)+" column:"+ls_col_name+" find:"+string(ll_find2)+" i:"+string(i))
					if ll_find2 > 0 then
						//exists the other column in the next list 
						lbn_order = true
					end if
					exit		// need exit it 
				end if 
			end if
		else
			//require the one step 
			if i < ll_rowcount then
				ll_find2 = lds_copy.find( " table_name='"+as_table+"' ", i + 1 ,ll_rowcount)
//					messagebox("find3 "," table:"+string(ls_table_name)+" column:"+ls_col_name+" find:"+string(ll_find2)+" i:"+string(i))
				if ll_find2 > 0 then
					//exists the other column in the next list 
					lbn_order = true
				end if
				exit		// need exit it 
			end if 
		end if 	
	Next		
end if 

destroy lds_copy

return lbn_order
end function

public subroutine of_sync_update (string as_type, string as_value);
if not isnull(as_type) and trim(lower(as_type)) = "admin" then 
	dw_request_form.SetItem(  w_request_form.dw_request_form.Getrow(),"admin", as_value)	
end if 

dw_request_form.SetItem(  w_request_form.dw_request_form.Getrow(),"user_id", gs_user_id)
dw_request_form.SetItem(  w_request_form.dw_request_form.Getrow(),"modify_date", DateTime(Date(Now()), Time(Now())) )
dw_request_form.event pfc_update(true,true)

end subroutine

public function boolean of_update_step_mark (long al_request_id);n_ds 		lds_detail
long		i, ll_count, ll_steps, ll_old
string		ls_types

if isnull(al_request_id) or al_request_id <= 0 then return false 


lds_detail  = create n_ds
lds_detail.dataobject = this.dw_detail.dataobject
lds_detail.settransobject( sqlca)
ll_count = lds_detail.retrieve(al_request_id )

ll_steps = 0 
for i =1 to ll_count
	ls_types = lds_detail.GetItemString(i,"types")
	ll_old  = lds_detail.GetItemNumber(i,"steps_mark")
	if ls_types = "step" then 
		ll_steps =  lds_detail.GetItemNumber(i,"detail_id")
	end if 
	if isnull(ll_old) or ll_old <> ll_steps then 
		lds_detail.SetItem( i, "steps_mark", ll_steps)
	end if 
next

if lds_detail.Modifiedcount( ) >  0 then 
	if lds_detail.update( ) =1 then 
		if isvalid(lds_detail) then destroy lds_detail
		return true
	else
		if isvalid(lds_detail) then destroy lds_detail
		return false		
	end if 
end if 

if isvalid(lds_detail) then destroy lds_detail
return true
end function

public subroutine of_set_enable_step (boolean abln_enable);//Added By Mark Lee 05/20/2015
if cb_properties.enabled = true then 
	cb_new_step.enabled  = abln_enable
else
	cb_new_step.enabled =  cb_properties.enabled
end if 
end subroutine

public subroutine of_set_nomodify (long al_row);
if isnull(al_row) or al_row <= 0 then return 

dw_request_form.SetItemStatus(al_row,"design", Primary!, NotModified!)
dw_request_form.SetItemStatus(al_row,"design", Delete!	, NotModified!)

dw_request_form.SetItemStatus(al_row,0, Primary!, NotModified!)
dw_request_form.SetItemStatus(al_row,0, Delete!	, NotModified!)

dw_request_form.resetupdate( )

return 
end subroutine

public subroutine of_display_label (string as_category);//Added By Mark Lee 10/09/2015
long				ll_row
string 			ls_data_view_label

if isnull(as_category) or trim(as_category) = "" then 
	return
end if 

if lower(as_category) = lower("Selection_List") then 
	ll_row = dw_column.getselectedrow( 0)
	ls_data_view_label = string(dw_column.GetItemString( ll_row, "data_view_label" ))
elseif lower(as_category) = lower("Formatting_List") then  
	ll_row = dw_detail.getselectedrow( 0)
	ls_data_view_label = string(dw_detail.GetItemString( ll_row, "col_label" ))
end if 

if isnull(ls_data_view_label) then ls_data_view_label = ''
OpenWithParm( w_mle_text, "$readonly$"+"$<t***>"+"Label "+"<t***>$"+ls_data_view_label)
end subroutine

public function string of_date_format_replace (string as_data);//====================================================================
// Function: of_date_format_replace
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_data
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/16/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string 			ls_return


if isnull(as_data) or trim(as_data) ="" then 
	ls_return = "None"
elseif (lower(as_data) = "[date] [time]") or  (lower(as_data) = " [date] [time] ") then
	ls_return = "mm/dd/yyyy hh:mm:ss"
elseif (trim(lower(as_data)) = "[date]") or trim(lower(as_data)) = "[ date ]" then
	ls_return = "mm/dd/yyyy"
elseif (trim(lower(as_data)) = "[time]") or (trim(lower(as_data)) = "[ time ]") then
	ls_return = "hh:mm:ss"	
elseif (trim(lower(as_data)) = "[shortdate] [time]") or  (trim(lower(as_data)) = "[ shortdate ] [ time ]") then
	ls_return = "m/d/yy h:mm:ss"	
elseif (trim(lower(as_data)) = "[shortdate]") or (trim(lower(as_data)) = "[ shortdate ]") then
	ls_return = "m/d/yy"	
elseif (trim(lower(as_data)) = "[longdate] [time]") or  (trim(lower(as_data)) = "[ longdate ] [ time ]") then
	ls_return = "mm/dd/yyyy h:mm:ss"	
elseif (trim(lower(as_data)) = "[longdate]") or (trim(lower(as_data)) = "[ longdate ]") then
	ls_return = "mm/dd/yyyy"		
else
	ls_return = as_data
end if 


return ls_return
end function

on w_request_form.create
int iCurrent
call super::create
this.cb_dn=create cb_dn
this.cb_up=create cb_up
this.cb_add_text=create cb_add_text
this.st_notes=create st_notes
this.cb_properties=create cb_properties
this.cb_new_step=create cb_new_step
this.cb_add_header=create cb_add_header
this.cb_add_blank_line=create cb_add_blank_line
this.cb_left=create cb_left
this.cb_right=create cb_right
this.cb_close=create cb_close
this.st_msg=create st_msg
this.dw_column=create dw_column
this.dw_request_form=create dw_request_form
this.gb_1=create gb_1
this.dw_select=create dw_select
this.cb_add=create cb_add
this.cb_copy=create cb_copy
this.cb_delete=create cb_delete
this.cb_save=create cb_save
this.cb_restore=create cb_restore
this.dw_detail=create dw_detail
this.cb_role=create cb_role
this.cb_rename=create cb_rename
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_dn
this.Control[iCurrent+2]=this.cb_up
this.Control[iCurrent+3]=this.cb_add_text
this.Control[iCurrent+4]=this.st_notes
this.Control[iCurrent+5]=this.cb_properties
this.Control[iCurrent+6]=this.cb_new_step
this.Control[iCurrent+7]=this.cb_add_header
this.Control[iCurrent+8]=this.cb_add_blank_line
this.Control[iCurrent+9]=this.cb_left
this.Control[iCurrent+10]=this.cb_right
this.Control[iCurrent+11]=this.cb_close
this.Control[iCurrent+12]=this.st_msg
this.Control[iCurrent+13]=this.dw_column
this.Control[iCurrent+14]=this.dw_request_form
this.Control[iCurrent+15]=this.gb_1
this.Control[iCurrent+16]=this.dw_select
this.Control[iCurrent+17]=this.cb_add
this.Control[iCurrent+18]=this.cb_copy
this.Control[iCurrent+19]=this.cb_delete
this.Control[iCurrent+20]=this.cb_save
this.Control[iCurrent+21]=this.cb_restore
this.Control[iCurrent+22]=this.dw_detail
this.Control[iCurrent+23]=this.cb_role
this.Control[iCurrent+24]=this.cb_rename
end on

on w_request_form.destroy
call super::destroy
destroy(this.cb_dn)
destroy(this.cb_up)
destroy(this.cb_add_text)
destroy(this.st_notes)
destroy(this.cb_properties)
destroy(this.cb_new_step)
destroy(this.cb_add_header)
destroy(this.cb_add_blank_line)
destroy(this.cb_left)
destroy(this.cb_right)
destroy(this.cb_close)
destroy(this.st_msg)
destroy(this.dw_column)
destroy(this.dw_request_form)
destroy(this.gb_1)
destroy(this.dw_select)
destroy(this.cb_add)
destroy(this.cb_copy)
destroy(this.cb_delete)
destroy(this.cb_save)
destroy(this.cb_restore)
destroy(this.dw_detail)
destroy(this.cb_role)
destroy(this.cb_rename)
end on

event pfc_preopen;call super::pfc_preopen;long ll_i
string ls_scale

This.of_SetResize(True)
//this.inv_resize.of_setminsize( 800, 600 )
This.inv_resize.of_SetOrigSize (This.workspacewidth(),This.workspaceheight())
inv_resize.of_SetMinSize(this.WorkSpaceWidth(),this.WorkSpaceHeight())
//ls_scale = this.inv_resize.scale
//
//For ll_i =  1 To upperbound(This.CONTrol)
//   This.inv_resize.of_Register (This.CONTrol[ll_i],ls_scale)
//Next


this.inv_resize.of_Register(gb_1, this.inv_resize.SCALERIGHT)
this.inv_resize.of_Register(dw_select, this.inv_resize.SCALERIGHT)
inv_resize.of_Register(cb_add, 0, 0, 0, 0)
this.inv_resize.of_Register(cb_copy,  0, 0, 0, 0)
this.inv_resize.of_Register(cb_rename,  0, 0, 0, 0)
this.inv_resize.of_Register(cb_delete,  0, 0, 0, 0)
this.inv_resize.of_Register(cb_save, 0, 0, 0, 0)
this.inv_resize.of_Register(cb_restore,  0, 0, 0, 0)
this.inv_resize.of_Register(cb_role,  0, 0, 0, 0)

//this.inv_resize.of_Register(cb_add, this.inv_resize.FIXEDRIGHT)
//this.inv_resize.of_Register(cb_copy, this.inv_resize.FIXEDRIGHT)
//this.inv_resize.of_Register(cb_delete, this.inv_resize.FIXEDRIGHT)
//this.inv_resize.of_Register(cb_save, this.inv_resize.FIXEDRIGHT)
//this.inv_resize.of_Register(cb_help, this.inv_resize.FIXEDRIGHT)
this.inv_resize.of_Register(cb_close, this.inv_resize.FIXEDRIGHT)

this.inv_resize.of_Register(dw_request_form, this.inv_resize.SCALERIGHT)

//this.inv_resize.of_Register(dw_column, this.inv_resize.SCALERIGHTBOTTOM)
//this.inv_resize.of_Register(dw_detail, this.inv_resize.SCALERIGHT)

inv_resize.of_Register(dw_column, 0 ,0, 50, 100)
inv_resize.of_Register(dw_detail, 50 ,0, 50, 100)

inv_resize.of_Register(cb_right, 50, 50, 0, 0)
inv_resize.of_Register(cb_left, 50, 50, 0, 0)
inv_resize.of_Register(cb_up, 50, 50, 0, 0)
inv_resize.of_Register(cb_dn, 50, 50, 0, 0)
inv_resize.of_Register(cb_add_blank_line, 50, 50, 0, 0)
inv_resize.of_Register(cb_add_text, 50, 50, 0, 0)
inv_resize.of_Register(cb_add_header, 50, 50, 0, 0)
inv_resize.of_Register(cb_new_step, 50, 50, 0, 0)
inv_resize.of_Register(cb_properties, 50, 50, 0, 0)

inv_resize.of_Register(st_msg, 50 ,100, 50, 0)
//this.inv_resize.of_Register(st_msg, this.inv_resize.SCALERIGHT)

inv_resize.of_Register(st_notes, 0 ,100, 50, 0)

end event

event open;call super::open;DataWindowChild		ldwc_category, ldwc_request_name
n_ds 			lds_export
long			ll_count


dw_select.getchild( "request_id", ldwc_request_name)
ldwc_request_name.SetTransobject(sqlca)
ldwc_request_name.retrieve( )			

if ldwc_request_name.rowcount( ) > 0 then
	dw_select.setitem(dw_select.getrow(),"request_id", ldwc_request_name.getitemNumber(ldwc_request_name.getrow( ),"request_id"))
	dw_select.event itemchanged(dw_select.getrow(), dw_select.object.request_id, string(ldwc_request_name.getitemNumber(ldwc_request_name.getrow( ),"request_id")))
end if

If dw_request_form.rowcount( )  <= 0  Then
//	dw_request_form.InsertRow(0)
//	dw_request_form.getchild("category",ldwc_category)
//	ldwc_category.SetTransobject(sqlca)
//	ldwc_category.retrieve("Contract Category" )
//	of_insertrow()
	
	of_enable_button(false)
End If

// check the export data  work for request form.
lds_export = create n_ds
lds_export.dataobject = 'd_dddw_export_files_request'
lds_export.settransobject( sqlca)
ll_count = lds_export.retrieve( )

if ll_count = 0 then 
	ll_count = messagebox(gnv_app.iapp_object.DisplayName,"The data source of the Request Form Painter is from the export data.~r~n" + &
	" The current system doesn’t have export data for the Request Form Painter. ~r~n~r~nDo you need to batch update the export data now?",Question!,YesNo! )
	if  ll_count = 1 then 
		pfc_n_cst_ai_export_apb  n_export
		n_export = CREATE pfc_n_cst_ai_export_apb
		n_export.of_batch_update_export_data('')		
		Destroy n_export
	end if 
end if 

destroy lds_export

//
if w_mdi.of_security_access( 7010 ) = 0 then
	cb_delete.enabled = false
	cb_restore.enabled = false
end if
if w_mdi.of_security_access( 7011 ) = 0 then
	cb_role.enabled =false
end if 
end event

event close;call super::close;w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
w_mdi.of_menu_security( w_mdi.MenuName )

end event

event activate;call super::activate;long ll_handle

If w_mdi.menuname <> 'm_pfe_cst_mdi_menu' Then 
	ll_handle = handle(w_mdi)
	w_mdi.ChangeMenu( m_pfe_cst_mdi_menu )
	w_mdi.SetToolbarPos ( 2, 1, 200, False )
	w_mdi.of_menu_security( w_mdi.MenuName )
	gnv_appeondll.of_settoolbarpos(ll_handle)
End If
end event

event resize;call super::resize;//Post of_set_position()
end event

type cb_dn from u_cb within w_request_form
integer x = 2011
integer y = 1256
integer width = 389
integer taborder = 30
fontcharset fontcharset = ansi!
string text = "&Dn"
end type

event clicked;call super::clicked;long 			ll_row

if dw_detail.rowcount() > 0 then 	
	ll_row = dw_detail.getrow()
	if ll_row > 0 and ll_row < dw_detail.rowcount() then	
		of_drop_list(ll_row ,ll_row + 1 )
	end if 	
end if 
end event

type cb_up from u_cb within w_request_form
integer x = 2011
integer y = 1124
integer width = 389
integer taborder = 50
fontcharset fontcharset = ansi!
string text = "&Up"
end type

event clicked;call super::clicked;long 			ll_row

if dw_detail.rowcount() > 0 then 	
	ll_row = dw_detail.getrow()
	if ll_row > 0  then 
		of_drop_list(ll_row ,ll_row - 1 )
	end if 
end if 
end event

type cb_add_text from u_cb within w_request_form
integer x = 2011
integer y = 1520
integer width = 393
integer taborder = 30
string text = "Add Text  "
end type

event clicked;call super::clicked;long 	ll_selectedrow 

ll_selectedrow  = dw_detail.GetSelectedRow(0)

of_insert_label("text",ll_selectedrow)

end event

type st_notes from statictext within w_request_form
boolean visible = false
integer x = 14
integer y = 2012
integer width = 1902
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Note: The red item(s) in the Field Selection / Formatting List window are missing from the Field Selection List. Please manually remove them."
boolean border = true
boolean focusrectangle = false
end type

type cb_properties from u_cb within w_request_form
integer x = 2011
integer y = 1916
integer width = 389
integer taborder = 50
string text = "Properties "
end type

event clicked;call super::clicked;//long 			ll_row,	ll_detail_id, ll_ret
//
//dw_detail.accepttext( )
//if dw_detail.rowcount( ) > 0 then 
//	ll_row = dw_detail.GetRow()
////	ll_detail_id = dw_detail.GetItemNumber( ll_row, "detail_id")
////	ll_ret = dw_detail.modifiedcount( ) + dw_detail.deletedcount( )
////	if isnull(ll_detail_id) or ll_detail_id <= 0  or ll_ret > 0 then 
////		messagebox(gnv_app.iapp_object.DisplayName," Please click the Save button to save the data in the Field Selection / Formatting List window.")
////	else
//		OpenWithParm(w_request_form_detail_property,ll_row)		
//		ll_ret = Message.doubleparm
//		if not isnull(ll_ret) and ll_ret > 0 then 
////			of_retrieveselectedrequest("detail","0")
//			dw_detail.setrow(ll_row)
//			dw_detail.scrolltorow(ll_row)
//			of_refresh_hint_msg(ll_row)
//		end if 
////	end if 
//end if 
//
long 			ll_row
if dw_detail.rowcount( ) > 0 then 
	ll_row = dw_detail.GetRow()
	if ll_row > 0 then 
		dw_detail.SelectRow(0, false)
		dw_detail.SelectRow(ll_row, true)
		of_detail_properties(ll_row)
	end if 
end if 
end event

type cb_new_step from u_cb within w_request_form
integer x = 2011
integer y = 1784
integer width = 389
integer taborder = 50
string text = "New Step "
end type

event clicked;call super::clicked;of_insert_label("step",dw_detail.GetSelectedRow(0))
end event

type cb_add_header from u_cb within w_request_form
integer x = 2011
integer y = 1652
integer width = 389
integer taborder = 40
string text = "Add Header "
end type

event clicked;call super::clicked;of_insert_label("header",dw_detail.GetSelectedRow(0))
end event

type cb_add_blank_line from u_cb within w_request_form
integer x = 2011
integer y = 1388
integer width = 389
integer taborder = 40
string text = "Add Blank Line "
end type

event clicked;call super::clicked;long 	ll_selectedrow 

ll_selectedrow  = dw_detail.GetSelectedRow(0)

of_insert_label("line",ll_selectedrow)

end event

type cb_left from u_cb within w_request_form
integer x = 2011
integer y = 992
integer width = 389
integer taborder = 20
integer textsize = -10
integer weight = 700
string text = "<-- "
end type

event clicked;call super::clicked;long 			ll_row

if dw_detail.rowcount() > 0 then 	
	ll_row = dw_detail.getselectedrow(0)
	if (isnull(ll_row) or ll_row <= 0 ) and dw_detail.GetItemString(dw_detail.GetRow(),"types") = "column" then
		messagebox(gnv_app.iapp_object.DisplayName,"Please select the item that you want to move in the Field Selection / Formatting List window.")
	else
		of_move_row("dw_detail","dw_column",0)
	end if 
end if 
end event

type cb_right from u_cb within w_request_form
integer x = 2011
integer y = 860
integer width = 389
integer taborder = 40
integer textsize = -10
integer weight = 700
string text = "--> "
end type

event clicked;call super::clicked;long 			ll_row

if dw_column.rowcount() > 0 then 	
	ll_row = dw_column.getselectedrow(0)
	if isnull(ll_row) or ll_row <= 0 then
		messagebox(gnv_app.iapp_object.DisplayName,"Please select the item that you want to move in the Field Selection List window.")
	else
		of_move_row("dw_column","dw_detail",0)
	end if
End if 
end event

type cb_close from u_cb within w_request_form
integer x = 3927
integer y = 68
integer taborder = 60
string text = "Cl&ose"
boolean cancel = true
end type

event clicked;call super::clicked;
Close(Parent)
end event

type st_msg from statictext within w_request_form
integer x = 2482
integer y = 2012
integer width = 1902
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type dw_column from u_dw within w_request_form
event ue_dwnmousemove pbm_dwnmousemove
event ue_dwsyscommand pbm_syscommand
integer x = 14
integer y = 848
integer width = 1902
integer height = 1156
integer taborder = 20
boolean titlebar = true
string title = "Field Selection List"
string dataobject = "d_export_field_list"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
end type

event ue_dwnmousemove;//====================================================================
// Event: ue_dwnmousemove
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                xpos
//                ypos
//                row
//                dwo
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/25/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if ib_mouse_ldown and this.RowCount() > 0 then
	this.Drag (begin!)
end if

end event

event ue_dwsyscommand;if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if
end event

event constructor;call super::constructor;this.of_SetUpdateAble(false)
this.of_setrowselect( true)
end event

event dragdrop;call super::dragdrop;
//Added By Mark Lee 09/09/2013
if source.TypeOf()=DataWindow! and classname(source) = "dw_detail"	then 
	of_move_row(classname(source) , "dw_column",row)
end if 
end event

event lbuttondown;call super::lbuttondown;long		ll_header

ll_header = 	Long(this.Object.DataWindow.Header.Height)

if ll_header >= ypos then return 								//Added By Mark Lee 10/13/2015

ib_mouse_ldown = true
end event

event lbuttonup;call super::lbuttonup;ib_mouse_ldown = false
end event

event clicked;call super::clicked;this.DragIcon = "row.ico"

end event

event doubleclicked;call super::doubleclicked;if row > 0 then 
	cb_right.event clicked( )
end if 
end event

event retrieveend;call super::retrieveend;if rowcount > 0 then 
	this.SelectRow( 0,false)
	this.Setrow( 1)
	this.scrolltorow(1)
	this.SelectRow( 1,True)
end if 
end event

event rbuttondown;call super::rbuttondown;//Added By Mark Lee 10/09/2015  //Modify gavins 20151015  comment
//m_request_form		lm_request
//long						ll_row
//
//ll_row  = this.getselectedrow( 0)
//if isnull(ll_row) or ll_row <= 0 then
//	return	
//end if 
//
//lm_request = create m_request_form
//
//lm_request.m_displaylabel.tag = lower("Selection_List")
//lm_request.PopMenu(w_mdi.PointerX(),w_mdi.PointerY())
//
//
//Destroy lm_request
end event

type dw_request_form from u_dw within w_request_form
event ue_category_filter ( long al_data,  datawindowchild adwc_category )
integer x = 14
integer y = 196
integer width = 4370
integer height = 640
integer taborder = 10
string dataobject = "d_request_form"
borderstyle borderstyle = stylebox!
boolean ib_rmbfocuschange = false
end type

event ue_category_filter(long al_data, datawindowchild adwc_category);long 	ll_view_id


select view_id 
into :ll_view_id
from export_header
where export_id = :al_data  using sqlca;

if not isnull(ll_view_id) and ll_view_id > 1000 then 
	adwc_category.setfilter( "ic_n ="+string(ll_view_id))
	adwc_category.filter( )
end if 
				
return 
end event

event itemchanged;call super::itemchanged;DataWindowChild 	ldwc_category, ldwc_template
string 	ls_filter,	ls_data, ls_old
long 		ll_view_id, ll_data, ll_export_id, ll_category, i , ll_template_id, ll_row, ll_modifiedcount
integer 	li_return

if row <= 0 then 
	return 
end if
ll_modifiedcount = this.modifiedcount( )
choose case dwo.name
	case "request_name"
//		ls_old = this.GetItemString(row,"request_name",Primary!,false)
//		if  ( isnull(ls_old) or trim(ls_old) = "" ) or (not isnull(ls_old) and trim(ls_old) <> "" and ls_old <> string(data) ) Then 
//			request_id
//			of_retrieveselectedrequest("request", string(data))
//		end if 
	case "export_id"
			this.getchild("category",ldwc_category)
			ldwc_category.SetTransobject(sqlca)
			ll_category = this.GetItemNumber(row,"category")
			ll_template_id = this.GetItemNumber(row,"template_id")
			
			ll_export_id = this.GetItemNumber(row,"export_id",Primary!,false)
			if not isnull(ll_export_id) and ll_export_id > 0 and long(data) <> ll_export_id  then 	
				if not isnull(ll_category) then 
					setnull(ll_category)
					setitem(row,"category",ll_category)
					ldwc_category.reset()
				end if 
				
				if not isnull(ll_template_id) then
					setnull(ll_template_id)
					setitem(row,"template_id",ll_template_id)
				end if 
			end if
			
			if ldwc_category. rowcount() <= 0  or isnull(ll_category)	then
//				ldwc_category.retrieve("Contract Category")
				ldwc_category.retrieve()
			end if
						
			ll_data = long(data)
			if not isnull(ll_data) and ll_data > 0 then
				Event	ue_category_filter(ll_data,ldwc_category)
				
				of_retrieveselectedrequest("export","0")		//Added By Mark Lee 09/11/2013
			end if
			
			//Added By Mark Lee 11/14/2013 
			if dw_column.rowcount( ) > 0 then 
				if dw_column.find( "ctx_table_name='ctx_basic_info' AND ctx_column_name ='app_facility' ", 1, dw_column.rowcount( ) ) <=0 then
					messagebox(gnv_app.iapp_object.DisplayName,"The Export you select does not have the required column app_facility from table ctx_basic_info.",Information!)
				end if 
			else
				messagebox(gnv_app.iapp_object.DisplayName,"The Export you select does not have the required column app_facility from table ctx_basic_info.",Information!)
			end if
			
			//Added By Mark Lee 01/22/2014
			if ldwc_category.rowcount() <= 0 then
				messagebox(gnv_app.iapp_object.DisplayName,"There is no Default Contract Category associated with the current export name.~r~nPlease go to the export painter pane to set the corresponding base on view or choose another export name.",Information!)
			end if 
			
		case "allow_update_doc"
			if string(data) = '1' then 
				this.Post event buttonclicked( row, 0, this.object.b_define_documents	)
			end if 
		case 'send_email_setting'
			if string(data) = '1' then 
				this.Post event buttonclicked( row, 0, this.object.b_email_sends_setting	)
			end if 	
		case 'category'
			this.getchild("category",ldwc_category)
			ldwc_category.SetTransobject(sqlca)
//			ll_data = long(data)			
			ll_row = ldwc_category.find("lookup_code="+string(data) , 1, ldwc_category.rowcount() )
			ll_data = ldwc_category.GetItemNumber(ll_row,"ic_n")
			of_set_template_flag(ll_data) 		//set flag
	case 'template_id'
		this.getchild("template_id",ldwc_template)
		ldwc_template.SetTransobject(sqlca)
//	case "steps"				//Modified By Mark Lee 11/24/2014
//		if(string(data) = '1') then 
//			ls_data = this.getItemString(row,"bypass") 
//			if isnull(ls_data) or ls_data <> "Y" then 
//				this.setitem( row,"bypass","Y")
//				messagebox(gnv_app.iapp_object.DisplayName,"Bypass Approval Process must be checked when Allow for Submit in Steps is set to Yes.")
//			end if 
//		end if 
//	case "bypass"	 
//		if(string(data) = 'N') then 
//			ll_data = this.getItemNumber(row,"steps") 
//			if isnull(ll_data) or ll_data <> 0 then 
//				this.setitem( row,"steps",0)
//				messagebox(gnv_app.iapp_object.DisplayName,"Allow for Submit in Steps must be set to No when you uncheck Bypass Approval Process.")
//			end if 
//		end if 		
		case 'design'
			if dw_detail.modifiedcount( ) + dw_detail.deletedcount( ) = 0 then
				//
			else
				li_return = messagebox(gnv_app.iapp_object.DisplayName,"The data need to be saved before you can run the current step. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
				if li_return = 1 then 
					if of_save( ) <= 0 then						
						return 1
					end if 
				end if 
			end if 
			
			if isnull(data) or trim(data) ="" or  string(data) = '1' then 
				is_design='m'				//request design
				of_set_enable_step(true)
			elseif string(data) = '2' then 
				is_design='p'				//company design
				of_set_enable_step(false)
			elseif string(data) = '3' then 								
				is_design='c'				//contact design
				of_set_enable_step(false)				
			else
				is_design='m'
				of_set_enable_step(true)				
			end if 

			of_retrieveselectedrequest("detail","0")
			of_retrieveselectedrequest("export","0")

			dwItemStatus dis_status
			dis_status = this.GetItemStatus(row, string(dwo.name), Primary!)

			this.SetItemStatus(row,string(dwo.name), Primary!, NotModified!)
			this.SetItemStatus(row,string(dwo.name), Delete!	, NotModified!)
			if ll_modifiedcount = 0 then 
				parent.post of_set_nomodify(row)						//Added By Mark Lee 06/03/2015
			end if 
		case 'multi'						//Added By Mark Lee 03/10/2016
			if string(data) = '1' then 
				this.Post event buttonclicked( row, 0, this.object.b_multi	)
			else
				ls_data = this.GetItemString( row,"multi_allow")
				if not isnull(ls_data) and trim(ls_data) <> "" then 
					this.SetItem( row, "multi_allow", '')
				end if 
			end if 
end choose 
end event

event constructor;call super::constructor;datawindowchild child
string ls_value



this.of_setresize(true)
this.inv_resize.of_setorigsize( this.width,this.height)
this.inv_resize.of_setminsize( this.width,this.height)
this.inv_resize.of_register(this.inv_resize.scale)
this.inv_resize.of_SetDetailHeight(true)



this.getchild("export_id",child)
child.settransobject(sqlca)
child.retrieve()
If gb_contract_version Then
	child.setfilter("export_type in (3,4)")
	child.filter()
Else
	child.setfilter('')
	child.filter()
End If
end event

event buttonclicked;call super::buttonclicked;string		 ls_new_name, ls_name, ls_parm
long 		ll_row,	ll_request_id
DataWindowChild		ldwc_category,	ldwc_request_name
integer	li_return

if row <= 0 then 
	return 
end if

if ib_enable = false then return 

this.accepttext( )
choose case dwo.name
	case "b_submit_request_to"
		ls_parm = "multi"
		ls_name =  this.GetItemString(row,"submit_request_to")
		if not isnull(ls_name) and trim(ls_name) <> "" then
			ls_parm = ls_parm + ";"+ls_name
		end if 
		OpenWithParm ( w_request_users, ls_parm)
 		ls_new_name = message.stringparm
		if not isnull(ls_new_name)  then
			//and trim(ls_new_name) <> ""
			if len(ls_new_name)  > 2000 then 									//Added By Mark Lee 10/22/2015
				messagebox(gnv_app.iapp_object.DisplayName,"The users you selected exceed 2000 characters. ~r~nPlease select fewer users.  ")
			else
				this.Setitem( row, "submit_request_to", ls_new_name)
			end if
		end if 
		this.setfocus( )
		this.SetColumn('submit_request_to')
	case "b_owner_user"
		ls_parm = "single"
		ls_name =  this.GetItemString(row,"owner_user")
		if not isnull(ls_name) and trim(ls_name) <> "" then
			ls_parm = ls_parm + ";"+ls_name
		end if 
		OpenWithParm ( w_request_users, ls_parm)
 		ls_new_name = message.stringparm
		if not isnull(ls_new_name)  then
			//and trim(ls_new_name) <> ""
			this.Setitem( row, "owner_user", ls_new_name)
		end if 
		this.setfocus( )
		this.SetColumn('owner_user')
	case "b_define_documents"
		ll_request_id = this.GetItemNumber(row,"request_id")
		if dw_request_form.modifiedcount( ) + dw_request_form.deletedcount( ) + dw_detail.modifiedcount( ) + dw_detail.deletedcount( ) = 0 then
			OpenWithParm( w_request_form_document, ll_request_id)
		else
//			messagebox(gnv_app.iapp_object.DisplayName,"Please save the data before you proceed.")
			li_return = messagebox(gnv_app.iapp_object.DisplayName,"The data need to be saved before you can run the current step. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
			if li_return = 1 then 
				if of_save( ) <= 0 then
					return
				else
					ll_request_id = this.GetItemNumber(row,"request_id")
					OpenWithParm( w_request_form_document, ll_request_id)
				end if 
			end if 
		end if
	case "b_email_sends_setting"
		OpenWithParm( w_request_form_email_setting, row)
	case "b_multi"									//Added By Mark Lee 03/10/2016
		ls_parm = "multiallow"
		ls_name =  this.GetItemString(row,"multi_allow")
		if not isnull(ls_name) and trim(ls_name) <> "" then
			ls_parm = ls_parm + ";"+ls_name
		end if 
		OpenWithParm( w_request_users, ls_parm)
		ls_new_name = message.stringparm
		if not isnull(ls_new_name)  then
			this.Setitem( row, "multi_allow", ls_new_name)
			if trim(ls_new_name) = "" then 
				this.setitem( row, 'multi', 0)
			end if 
		else
			 if isnull(ls_name) or trim(ls_name) = "" then 			//not set data
				this.setitem( row, 'multi', 0)
			 end if 
		end if 
		this.setfocus( )
		this.SetColumn('multi')
end choose


end event

event pfc_preupdate;call super::pfc_preupdate;//Added By Mark Lee 09/24/2013
long		ll_export_id, ll_category, ll_tmp, ll_template_id, ll_count
string 	ls_owner, ls_submit_request_to

this.accepttext( )
if this.rowcount( ) > 0 then 
	ll_template_id = this.GetItemNumber( this.Getrow(), "template_id")
	ll_category	= this.GetItemNumber(this.GetRow(),"category")
	ll_export_id = this.GetItemNumber(this.GetRow(),"export_id")
	ls_owner		= this.GetItemString(this.GetRow(),"owner_user")
	ls_submit_request_to = this.GetItemString(this.GetRow(),"submit_request_to")
	
	//Begin - Added By Mark Lee 09/27/2013.
	if isnull(ll_export_id) or ll_export_id <= 0 then 			
		this.SetColumn("export_id")
		this.SetFocus()
		Messagebox(gnv_app.iapp_object.DisplayName,"The Export is a required field. ~r~nPlease select a value before saving this form.")
		return -1
	end if 
	if isnull(ll_category) or ll_category <= 0 then 
		this.SetColumn("category")
		this.SetFocus()				
		Messagebox(gnv_app.iapp_object.DisplayName,"The Default Contract Category is a required field. ~r~nPlease select a value before saving this form.")
		return -1
	end if 	
	
	if isnull(ls_owner) or trim(ls_owner) = '' then
		this.SetColumn("owner_user")
		this.SetFocus()				
		Messagebox(gnv_app.iapp_object.DisplayName,"The Contract Owner is a required field. ~r~nPlease select a value before saving this form.")
		return -1
	end if 
	if isnull(ls_submit_request_to) or trim(ls_submit_request_to) = '' then
		this.SetColumn("submit_request_to")
		this.SetFocus()				
		Messagebox(gnv_app.iapp_object.DisplayName,"The Submit Request To is a required field. ~r~nPlease select a value before saving this form.")
		return -1
	end if 
	//			dw_detail.accepttext( )
	//			if dw_detail.find( "types='column'",1, dw_detail.rowcount()) <= 0 then 
	//				dw_column.SetFocus( )
	//				Messagebox(gnv_app.iapp_object.DisplayName,"You must have choose Field Selection List item in the Field Selection / Formatting List window, ~r~n if you want a vaild request form.")
	//				return 2
	//			end if 
	//End - Added By Mark Lee 09/27/2013.
	
	if not isnull(ll_template_id) and ll_template_id > 0  then 
		ll_tmp = 0 
		if not isnull(ll_category) and ll_category > 0  then	
			Select count(1)
			Into :ll_tmp
			from ctx_templates_info, ctx_basic_info, (Select lookup_code,ic_n
					FROM code_lookup      WHERE ( code_lookup.lookup_name = 'Contract Category' ) ) cc
			where ctx_templates_info.ctx_id = ctx_basic_info.ctx_id  and ctx_basic_info.ctx_id < 0 
				and ctx_basic_info.category = cc.lookup_code and ctx_templates_info.id = :ll_template_id
				and cc.ic_n =( select ic_n from code_lookup WHERE ( code_lookup.lookup_name = 'Contract Category' ) and lookup_code =:ll_category  )
			using sqlca;				
				
			if isnull(ll_tmp) or ll_tmp = 0 then
				this.SetColumn("template_id")
				this.SetFocus()
//				messagebox(gnv_app.iapp_object.DisplayName,"The Contract Record Template Name does not match the restriction of the Category. ~r~nPlease change the Contract Record Template Name.")
				messagebox(gnv_app.iapp_object.DisplayName,"The associated view of the Contract Record Template you selected does not match the associated view of the export. ~r~nPlease select a Contract Record Template that has a matching view to that of the export.")
				return -1
			end if 
		elseif not isnull(ll_export_id) and ll_export_id > 0  and ( isnull(ll_category) or ll_category = 0 ) then			
			Select count(1)
			Into :ll_tmp
			from ctx_templates_info, ctx_basic_info, (Select lookup_code,ic_n
					FROM code_lookup      WHERE ( code_lookup.lookup_name = 'Contract Category' ) ) cc
			where ctx_templates_info.ctx_id = ctx_basic_info.ctx_id  and ctx_basic_info.ctx_id < 0 
				and ctx_basic_info.category = cc.lookup_code and ctx_templates_info.id = :ll_template_id
				and cc.ic_n =(select view_id from export_header Where export_id = :ll_export_id) 
			using sqlca;	
			
			if isnull(ll_tmp) or ll_tmp <= 0 then
				this.SetColumn("template_id")
				this.SetFocus()
				messagebox(gnv_app.iapp_object.DisplayName,"The Contract Record Template Name does not match the Restriction of the Export Id. ~r~nPlease change the Contract Record Template Name.")
				return -1
			end if
		end if 
	end if
	
	if isnull(ls_owner) or trim(ls_owner) ='' then
		if not isnull(ll_template_id) and ll_template_id > 0  then 
			Select count(1)
			Into :ll_count
			From ctx_templates_info, ctx_contract_contacts
			Where ctx_templates_info.ctx_id = ctx_contract_contacts.ctx_id 
			And ctx_templates_info.ib_our_contacts = 1 and ctx_templates_info.add_contact = 1 and ctx_templates_info.ib_owner = 1
			And ctx_contract_contacts.ic_area = 'I' and ctx_contract_contacts.owner = 'Y' and ctx_templates_info.id = :ll_template_id
			Using sqlca;
			
			if ll_count = 0 then 
				this.SetColumn("owner_user")
				this.SetFocus()		
				messagebox(gnv_app.iapp_object.DisplayName,"You did not select an Contract Owner and the Contract Record Template you selected does not have an owner either. ~r~n~r~nPlease select an Contract Owner.")
				return -1
			end if 
		else 
			this.SetColumn("owner_user")
			this.SetFocus()	
			messagebox(gnv_app.iapp_object.DisplayName,"Contract Owner is a required field. ~r~n~r~nPlease select an Contract Owner or select a Contract Record Template that already has an owner.")
			return -1
		end if 
	end if

	this.SetItem(  this.Getrow(),"user_id", gs_user_id)
	this.SetItem(  this.Getrow(),"modify_date", DateTime(Date(Now()), Time(Now())) )
end if 

return 1 
end event

type gb_1 from groupbox within w_request_form
integer x = 14
integer y = 4
integer width = 4370
integer height = 184
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Request Form Template Name "
end type

type dw_select from u_dw within w_request_form
integer x = 41
integer y = 72
integer width = 910
integer height = 84
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_select_request_form_dddw_list"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;// Retrieve views
this.of_SetTransObject(SQLCA)
this.of_SetUpdateAble(false)
this.InsertRow(0)
end event

event itemchanged;call super::itemchanged;long						ll_find
DatawindowChild		ldwc_request_name
integer 					li_exists

if row <= 0 then 
	return 
end if

of_retrieveselectedrequest("request", string(data))

of_retrieveselectedrequest("detail","0")

of_retrieveselectedrequest("export","0")

if not isnull(il_select_id) and il_select_id >  0 and  long(data) >0 and il_select_id <> long(data) then 
	dw_select.GetChild("request_id",ldwc_request_name)
	ldwc_request_name.SetTransobject(sqlca)		
	if 	ldwc_request_name.rowcount( ) > 0  then						
		li_exists = 0 
		Select count(1)
		Into :li_exists
		From request_form Where request_id = :il_select_id using SQLCA;
		
		if li_exists = 0 then 	
			ll_find = ldwc_request_name.find( "request_id ="+string(il_select_id), 1, ldwc_request_name.rowcount() )
			if not isnull(ll_find) and ll_find >0 then 
				ldwc_request_name.deleterow( ll_find)
			end if 
		end if 
	end if
	
end if 
il_select_id = long(data)
end event

event rowfocuschanging;call super::rowfocuschanging;DatawindowChild		ldwc_request_name
long						ll_id,	ll_find
integer 					li_exists


if currentrow > 0 then
	dw_select.GetChild("request_id",ldwc_request_name)
	ldwc_request_name.SetTransobject(sqlca)
	
	if 	ldwc_request_name.rowcount( ) > 0  then
		ll_id = this.GetItemNumber(currentrow,"request_id")
		
		li_exists = 0 
		Select count(1)
		Into :li_exists
		From request_form Where request_id = :ll_id using SQLCA;
		
		if li_exists = 0 then 	
			ll_find = ldwc_request_name.find( "request_id ="+string(ll_id), 1, ldwc_request_name.rowcount() )
			ldwc_request_name.deleterow( ll_find)
		end if 
	end if
end if 
end event

event rowfocuschanged;call super::rowfocuschanged;//DatawindowChild		ldwc_request_name
//long						ll_id,	ll_find
//integer 					li_exists
//
//
//if currentrow > 0 then
//	dw_select.GetChild("request_id",ldwc_request_name)
//	ldwc_request_name.SetTransobject(sqlca)
//	
//	if 	ldwc_request_name.rowcount( ) > 0  then
//		ll_id = this.GetItemNumber(currentrow,"request_id")
//		
//		li_exists = 0 
//		Select count(1)
//		Into :li_exists
//		From request_form Where request_id = :ll_id using SQLCA;
//		
//		if li_exists = 0 then 	
//			ll_find = ldwc_request_name.find( "request_id ="+string(ll_id), 1, ldwc_request_name.rowcount() )
//			ldwc_request_name.deleterow( ll_find)
//		end if 
//	end if
//end if 
end event

type cb_add from u_cb within w_request_form
integer x = 960
integer y = 68
integer taborder = 40
boolean bringtotop = true
string text = "&Add"
end type

event clicked;call super::clicked;Parent.of_add( )
end event

type cb_copy from u_cb within w_request_form
integer x = 1339
integer y = 68
integer taborder = 20
boolean bringtotop = true
string text = "&Copy"
end type

event clicked;call super::clicked;Parent.of_copy( )
end event

type cb_delete from u_cb within w_request_form
integer x = 2098
integer y = 68
integer taborder = 50
boolean bringtotop = true
string text = "&Delete"
end type

event clicked;call super::clicked;Parent.of_delete( )
end event

type cb_save from u_cb within w_request_form
integer x = 2478
integer y = 68
integer taborder = 50
boolean bringtotop = true
string text = "&Save"
end type

event clicked;call super::clicked;Parent.of_save( )
end event

type cb_restore from u_cb within w_request_form
integer x = 3369
integer y = 68
integer taborder = 30
boolean bringtotop = true
string text = "Res&tore"
end type

event clicked;call super::clicked;Long		ll_count = 0

Select count(1)
Into	:ll_count
From request_form
Where (deleted is not null and deleted = 'Y' )
Using sqlca;

if ll_count > 0 then 
	Open( w_request_form_restore)
else
	messagebox(gnv_app.iapp_object.DisplayName,"No record to restore.")
end if 

end event

type dw_detail from u_dw within w_request_form
event ue_dwmousemove pbm_dwnmousemove
event ue_dwsyscommand pbm_syscommand
integer x = 2482
integer y = 848
integer width = 1902
integer height = 1156
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Field Selection / Formatting List"
string dataobject = "d_request_form_detail"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event ue_dwmousemove;//====================================================================
// Event: ue_dwnmousemove
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                xpos
//                ypos
//                row
//                dwo
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/25/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
if ib_detail_mouse_ldown and this.RowCount() > 0 then
	this.Drag (begin!)
end if

end event

event ue_dwsyscommand;if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if
end event

event lbuttondown;call super::lbuttondown;long		ll_header

ll_header = 	Long(this.Object.DataWindow.Header.Height)

if ll_header >= ypos then return 								//Added By Mark Lee 10/13/2015


ib_detail_mouse_ldown = true
end event

event lbuttonup;call super::lbuttonup;ib_detail_mouse_ldown = false
end event

event dragdrop;call super::dragdrop;//Added By Mark Lee 09/09/2013
if source.TypeOf()=DataWindow! and classname(source) = "dw_column"	then 
	of_move_row(classname(source) , "dw_detail",row)
elseif classname(source) = "dw_detail" then
	of_drop_list(dw_detail.getrow() ,row)
end if 
end event

event constructor;call super::constructor;this.of_SetUpdateAble(true)
this.of_setrowselect( true)

//  of_SetSort(TRUE)
//  inv_sort.of_SetColumnHeader(TRUE)
//  inv_sort.of_SetVisibleOnly ( true )


end event

event clicked;call super::clicked;string 			ls_category

if row > 0 then 	
//	ls_category = this.getitemstring(row,"category")
//	if not isnull(ls_category) and ls_category = "column" then 
		this.DragIcon = "row.ico"
//	end if 
	of_refresh_hint_msg(row)
end if 
end event

event pfc_preupdate;call super::pfc_preupdate;long			i, j, ll_detail_id,	ll_request_id, ll_old_detail_id, ll_old_request_id, ll_cnt, ll_order_no, ll_rowcount
string 		ls_types, ls_tmp, ls_table_name, ls_msg, ls_col_name, ls_export_field_name, ls_design
boolean		lbn_types,	lbn_app_facility, lbn_company, lbn_product_id, lbn_product_type
long			ll_company,	ll_ctx_products, ll_template_id, ll_steps, ll_main_steps, ll_steps_num
integer 		li_return, li_tmp
boolean		lbn_ctx_custom, lbn_ctx_products,	lbn_ctx_fee_sched_nm, lbn_ctx_custom_multi_hdr	, lbn_ctx_custom_multi_detail
boolean		lbn_ctx_contacts, lbn_ctx_contacts_numbers	
boolean		lb_initial_step

// order table's column together.
lbn_ctx_products =false
lbn_app_facility = false
lbn_company = false
lbn_ctx_custom_multi_hdr = false
lbn_ctx_custom_multi_detail = false
lbn_app_facility = false 
lbn_ctx_contacts = false 
lbn_ctx_contacts_numbers = false 
	
lbn_product_id = false
lbn_product_type = false
//Added By Mark Lee 09/10/2013
ll_detail_id = 0 
ll_cnt =  0
this.accepttext( )				//Added By Mark Lee 04/30/2015
ll_rowcount  = this.rowcount()
if ll_rowcount > 0 then 
	lbn_types = false 
	if is_design="" or  is_design='m' then 
		ll_main_steps = dw_request_form.getitemnumber(dw_request_form.getrow( ) , 'steps')
		ls_types = this.GetItemString( 1,"types")
		if isnull(ls_types) or ls_types <> "step" then
			li_tmp = messagebox(gnv_app.iapp_object.DisplayName," You need to add a step first at the beginning of the Field Selection/Formatting List." +  &
			"~r~n~r~n Select Yes and the system will automatically add a step at the beginning of the Field Selection/Formatting List.",Question!, YesNo! )
			if li_tmp = 1 then 
				of_insert_label("step",0)
			end if 
			return -1
		end if 
		
		//Added By Mark Lee 11/14/2013
		ll_template_id = dw_request_form.getitemnumber(dw_request_form.getrow( ) , 'template_id')
		if dw_detail.find( "col_name ='app_facility' and table_name= 'ctx_basic_info' ", 1,ll_rowcount) <= 0 then 
			if  (isnull(ll_template_id) or ll_template_id = 0 ) then
				messagebox(gnv_app.iapp_object.DisplayName,"You have to add the column app_facility from table ctx_basic_info to ~r~nthe Field Selection/Formatting List unless you have already set a Contract Record Template that has a  company name.")
				return -1
			else			
				Select count(1)
				Into :ll_cnt
				FROM ctx_templates_info, ctx_basic_info
				where ctx_templates_info.ctx_id = ctx_basic_info.ctx_id
				And ctx_templates_info.ib_contract_detail = 1 and ctx_templates_info.clear_company = 0  
				And ctx_basic_info.app_facility is not null and len(ctx_basic_info.app_facility ) > 0 and ctx_templates_info.id = :ll_template_id
				Using sqlca;
				
				if ll_cnt = 0 then				
					messagebox(gnv_app.iapp_object.DisplayName,"You did not add the column app_facility from table ctx_basic_info to ~r~nthe Field Selection/Formatting List and the current Contract Record Template you selected does not have a company name either. ~r~n~r~nPlease add the column app_facility from table ctx_basic_info to the Field Selection/Formatting List.")
					return -1
				end if
			end if
		end if
	
	elseif is_design='p' then 
		if dw_detail.find( "lower(col_name) ='facility_name' and lower(table_name)= 'app_facility' ", 1,ll_rowcount) <= 0 then 
			messagebox(gnv_app.iapp_object.DisplayName,"In Company Design Mode, you must define facility_name column. ~r~nPlease select it from the Field Selection List on the left side. ~r~nIf this column is not in the list, please add it in the associated export first. ")
			return -1
		end if 
	elseif is_design='c' then 
		if dw_detail.find( "lower(col_name) ='first_name' and lower(table_name)= 'ctx_contacts' ", 1,ll_rowcount) <= 0 then 
//			"In Contact Design Mode, you must define first_name and last_name columns. Please select them from the Field Selection List on the left side. If these columns are not in the list, please add them in the associated export first."
			messagebox(gnv_app.iapp_object.DisplayName,"In Contact Design Mode, you must define first_name column. ~r~nPlease select it from the Field Selection List on the left side. ~r~nIf this column is not in the list, please add it in the associated export first.")
			return -1
		end if 		
		if dw_detail.find( "lower(col_name) ='last_name' and lower(table_name)= 'ctx_contacts' ", 1,ll_rowcount) <= 0 then 
			messagebox(gnv_app.iapp_object.DisplayName,"In Contact Design Mode, you must define last_name column. ~r~nPlease select it from the Field Selection List on the left side. ~r~nIf this column is not in the list, please add it in the associated export first.")
			return -1
		end if 
	end if 
	
	ls_msg = ""	 
	li_return = 0
	ll_company = 0
	ll_ctx_products = 0
	ll_cnt 	= 0
	lb_initial_step = false
	for i = 1 to ll_rowcount
		ll_old_detail_id = this.GetItemNumber(i,"detail_id")
		ls_types = this.GetItemString( i,"types")	
		ll_steps_num = this.GetItemNumber(i,"steps_num")
		if not isnull(ll_steps_num) and ll_steps_num  = 1 then 
			lb_initial_step = true
		end if 
		if isnull(ll_old_detail_id) or ll_old_detail_id <= 0 then 
			ll_cnt ++
		end if 

		if i > 1 then 		
			if ls_types = "step" and this.GetItemString( i - 1 ,"types") = ls_types then 
				lbn_types =  true
			end if 
		end if 
				
		//Added By Mark Lee 10/21/2013 	ctx_basic_info
		ls_table_name = this.GetItemString(i,"table_name")
		ls_col_name = this.GetItemString(i,"col_name")	
		ls_export_field_name = this.GetItemString(i,"export_field_name")		
		if  lower(ls_table_name ) = "ctx_basic_info" and lower(ls_col_name) ="app_facility" then 
			lbn_company  = true
			if ll_company <> 0 then 
				ls_msg = " The column app_facility from the table ctx_basic_info must be in front of the table app_facility.~r~n~r~n Do you want the system to adjust the order automatically?"	
//				exit
			else
				ll_company = i
			end if 
		end if 
		
		if  lower(ls_table_name ) = "app_facility" then 
			lbn_app_facility = true 
			if ll_company <> 0 then 
				if ll_company <> i -1 then 
					ls_msg = " Columns from the table app_facility must be added consecutively ~r~n" + &
						"and must be after the column app_facility from the table ctx_basic_info if this column exists." + &
						"~r~n~r~n Do you want the system to adjust the order automatically?"
//					exit
				else
					ll_company = i					
				end if 
			else
				ll_company = i
			end if 
		end if 		
		
		if  lower(ls_table_name ) = "ctx_products" then 
//			if ll_ctx_products <> 0 then 
//				if ll_ctx_products <> i -1 then 
//					ls_msg = "Columns from the table ctx_products must be added consecutively. "
//					exit
//				else
//					ll_ctx_products = i					
//				end if 
//			else
//				ll_ctx_products = i
//			end if 
			if lower(ls_col_name) = "product_id" then
				lbn_product_id = true
			elseif  lower(ls_col_name) = "product_type"   then
				lbn_product_type = true
			end if
			// order table's column together.
			lbn_ctx_products = true
		end if 		
		
		if  lower(ls_table_name ) = "ctx_custom_multi_hdr" then  
			lbn_ctx_custom_multi_hdr = true
		end if
		
		if  lower(ls_table_name ) = "ctx_custom_multi_detail" then  
			lbn_ctx_custom_multi_detail = true
		end if		
		
		if  lower(ls_table_name ) = "ctx_contacts" then  
			lbn_ctx_contacts = true
		end if	
		
		if  lower(ls_table_name ) = "ctx_contacts_numbers" then  
			lbn_ctx_contacts_numbers = true
		end if	
	next 

	if  not isnull(ll_main_steps) and ll_main_steps = 1 and lb_initial_step = false then 
		messagebox(gnv_app.iapp_object.DisplayName,"The current request template allows Submit in Steps so you have to set a step as the Initial Step in the step properties window.")
		return -1
	end if 
	
	if lbn_product_id <> lbn_product_type then 
		if lbn_product_id = true then 
			messagebox(gnv_app.iapp_object.DisplayName,"When adding the column product_id from the table ctx_products into the Field Selection / Formatting List you also have to add the column product_type and it is also a required column.")
			return -1
		else 
			messagebox(gnv_app.iapp_object.DisplayName,"When adding the column product_type from the table ctx_products into the Field Selection / Formatting List you also have to add the column product_id and it is also a required column.")			
			return -1			
		end if 
	end if 
	
//	if lbn_ctx_contacts_numbers= true and lbn_ctx_contacts = false then 
//		li_return	=	messagebox(gnv_app.iapp_object.DisplayName,"" )
//		return -1
//	end if 
	
	if AppeonGetClientType() = 'WEB' then
		if lbn_ctx_contacts =  true or lbn_ctx_products = true then					//Added By Mark Lee 05/21/2015 work for the of_checked_continuous_column function.
			for i = 1 to ll_rowcount
				ll_order_no = this.GetItemNumber(i,"order_no")
				if  isnull(ll_order_no) or ll_order_no <> i then 
					this.SetItem( i, "order_no", i)
				end if 
			next 
		End if 
	end if 
		
	if lbn_ctx_contacts = true then 
		lbn_ctx_contacts = of_checked_continuous_column("ctx_contacts")
		if lbn_ctx_contacts  = true then
			li_return	=	messagebox(gnv_app.iapp_object.DisplayName,"Columns from ctx_contacts table must be in the same step and they should be next to each other, not separated by columns from other tables." )
			return -1
		end if 
	end if 
	
//	if lbn_ctx_contacts_numbers = true then 
//		lbn_ctx_contacts_numbers = of_checked_continuous_column("ctx_contacts_numbers")
//		if lbn_ctx_contacts_numbers  = true then
//			li_return	=	messagebox(gnv_app.iapp_object.DisplayName,"Columns from ctx_contacts_numbers table must be in the same step and they should be next to each other, not separated by columns from other tables." )
//			return -1
//		end if 
//	end if 
		
	//sort column
	if lbn_ctx_products  = true then		
		lbn_ctx_products = of_checked_continuous_column("ctx_products")
		if lbn_ctx_products  = true then
			li_return	=	messagebox(gnv_app.iapp_object.DisplayName,"Columns from ctx_products table must be in the same step and they should be next to each other, not separated by columns from other tables." )
			return -1
		end if 
	end if 
	
	if lbn_types =  true then 
		messagebox(gnv_app.iapp_object.DisplayName,"You cannot have a step right after another in the Field Selection/Formatting List without any column in between.")
		return -1
	end if 
	
	if lbn_ctx_custom_multi_detail = true and lbn_ctx_custom_multi_hdr = false then
		messagebox(gnv_app.iapp_object.DisplayName,"You must add at least one column from ctx_custom_multi_hdr table when you have added columns from ctx_custom_multi_detail table.")
		return -1
	else
		//
	end if 
		
//	if trim(ls_msg) <> "" then 
//		li_return	=	messagebox(gnv_app.iapp_object.DisplayName,ls_msg,Question!,YesNo! )
//		if li_return = 1 then 
//			of_auto_move_row("company") //move it
//		else
//			return -1
//		end if 
//	end if 
			
	//update value.
	if ll_cnt > 0 then 
		ll_detail_id = gnv_app.of_get_id(upper("request_form_detail_id"), ll_cnt)	
	end if 
	
	ll_request_id  = dw_request_form.GetItemNumber(dw_request_form.getRow() ,"request_id")	
	ll_steps = 0
	for i = 1 to ll_rowcount
		ls_types = this.GetItemString( i,"types")	
		if ll_cnt > 0 then 
			ll_old_detail_id = this.GetItemNumber(i,"detail_id")
			if isnull(ll_old_detail_id) or ll_old_detail_id <= 0 then 
				this.SetItem( i, "detail_id", ll_detail_id )
				ll_detail_id ++
			end if 
		end if
		
		if ls_types = "step" then 
			ll_steps =  this.GetItemNumber(i,"detail_id")
		end if 
		this.SetItem( i, "steps_mark", ll_steps)
		
		ll_old_request_id = this.GetItemNumber(i,"request_id")
		if isnull(ll_old_detail_id) or ll_old_detail_id <= 0 then 
			this.SetItem( i, "request_id", ll_request_id)
		end if 
		
		ll_order_no = this.GetItemNumber(i,"order_no")
		if  isnull(ll_order_no) or ll_order_no <> i then 
			this.SetItem( i, "order_no", i)
		end if 
		
		ls_design = this.GetItemString(i,"design")
		if isnull(ls_design) or ls_design <> is_design then 
			this.SetItem( i, "design", is_design)
		end if 
	next 
	
	//auto adjust the row no. And this must be in the end.
//	if trim(ls_msg) <> "" and  li_return = 1  then 
//		this.setredraw( false)
////		of_auto_move_row("company")		// no need it
//		this.setredraw(true )
//		for i = 1 to ll_rowcount
//			ll_order_no = this.GetItemNumber(i,"order_no")
//			if  isnull(ll_order_no) or ll_order_no <> i then 
//				this.SetItem( i, "order_no", i)
//			end if 
//		next 
//	end if
	
	dw_request_form.SetItem(  dw_request_form.Getrow(),"user_id", gs_user_id)
	dw_request_form.SetItem(  dw_request_form.Getrow(),"modify_date", DateTime(Date(Now()), Time(Now())) )
	
end if 

return 1

end event

event doubleclicked;call super::doubleclicked;//Added By Mark Lee 09/26/2013
string 		ls_types, ls_export_col_name 
integer		li_return

if row > 0 then
	This.SelectRow(0, false)
	This.SelectRow(row, true)
//Added By Mark Lee 12/03/2014
//	if dw_detail.modifiedcount( ) + dw_detail.deletedcount( ) > 0 then
//		li_return = messagebox(gnv_app.iapp_object.DisplayName,"The current data need to be saved before you can open the Detail Properties. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
//		if li_return =1 then 
//			if of_save( ) <= 0 then return
//		else			
//			return 
//		end if 		
//	End if
	of_detail_properties(row)
end if 
end event

event retrieveend;call super::retrieveend;if rowcount > 0 then 
	this.SelectRow( 0,false)
	this.Setrow( 1)
	this.scrolltorow(1)
	this.SelectRow( 1,True)
end if 
end event

event rbuttondown;call super::rbuttondown;//Added By Mark Lee 10/09/2015  //Modify gavins 20151015  comment
//m_request_form		lm_request
//long						ll_row
//
//ll_row  = this.getselectedrow( 0)
//if isnull(ll_row) or ll_row <= 0 then
//	return	
//end if 
//
//lm_request = create m_request_form
//
//lm_request.m_displaylabel.tag = lower("Formatting_List")
//
//if this.GetItemString(ll_row,"types") <> "column"  then lm_request.m_displaylabel.enabled = false
//
//lm_request.PopMenu(w_mdi.PointerX(),w_mdi.PointerY())
//
//
//Destroy lm_request
end event

type cb_role from u_cb within w_request_form
integer x = 2857
integer y = 68
integer width = 485
integer taborder = 60
boolean bringtotop = true
string text = "&Role Group Setting"
end type

event clicked;call super::clicked;long 			ll_request_id
integer		li_return

if dw_request_form.rowcount() >  0 then
	ll_request_id = dw_request_form.GetItemNumber(dw_request_form.getRow(),"request_id")
	if dw_request_form.modifiedcount( ) + dw_request_form.deletedcount( ) + dw_detail.modifiedcount( ) + dw_detail.deletedcount( ) = 0 then
		OpenWithParm( w_request_form_role, ll_request_id)
	else
//		messagebox(gnv_app.iapp_object.DisplayName,"Please save the data before you proceed.")
		li_return = messagebox(gnv_app.iapp_object.DisplayName,"The data need to be saved before you can run the current step. ~r~n~r~nClick Yes to save the data automatically.",Question!, YesNo!)
		if li_return =1 then 
			if of_save( ) <= 0 then
				return
			else
				ll_request_id = dw_request_form.GetItemNumber(dw_request_form.getRow(),"request_id")
				if not isnull(ll_request_id) and ll_request_id > 0 then 
					OpenWithParm( w_request_form_role, ll_request_id)
				end if
			end if 
		else			
			return 
		end if 
	end if 
end if 
end event

type cb_rename from u_cb within w_request_form
integer x = 1719
integer y = 68
integer taborder = 50
boolean bringtotop = true
string text = "Re&name"
end type

event clicked;call super::clicked;//Added By Mark Lee 11/08/2013
of_rename()

end event

