$PBExportHeader$u_tab_request_webform.sru
forward
global type u_tab_request_webform from u_tab
end type
type tabpage_browse from userobject within u_tab_request_webform
end type
type st_vsplitbar from u_st_splitbar within tabpage_browse
end type
type dw_list from u_dw within tabpage_browse
end type
type dw_search from u_dw within tabpage_browse
end type
type tabpage_browse from userobject within u_tab_request_webform
st_vsplitbar st_vsplitbar
dw_list dw_list
dw_search dw_search
end type
type tabpage_detail from userobject within u_tab_request_webform
end type
type st_hsplitbar from u_st_splitbar within tabpage_detail
end type
type st_vsplitbar2 from u_st_splitbar within tabpage_detail
end type
type dw_log from u_dw within tabpage_detail
end type
type dw_detail from u_dw within tabpage_detail
end type
type dw_header from u_dw within tabpage_detail
end type
type tabpage_detail from userobject within u_tab_request_webform
st_hsplitbar st_hsplitbar
st_vsplitbar2 st_vsplitbar2
dw_log dw_log
dw_detail dw_detail
dw_header dw_header
end type
end forward

global type u_tab_request_webform from u_tab
integer width = 4119
integer height = 2396
tabposition tabposition = tabsonbottom!
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
event ue_show_constructor ( )
end type
global u_tab_request_webform u_tab_request_webform

type variables
string 			 is_origin_sql
n_cst_dm_utils  inv_dm_utils
Long				il_waiting_approve_count

CONSTANT INTEGER wdActiveEndPageNumber = 3
CONSTANT INTEGER wdFirstCharacterLineNumber = 10
CONSTANT INTEGER wdFirstCharacterColumnNumber = 9
CONSTANT INTEGER wdPropertyKeywords = 4  
Constant long wdFieldMergeField = 59 
Constant long wdFieldDocVariable=64 

long il_current_screen //Added By Jay Chen 06-09-2014
datastore ids_screen_prop //Added By Jay Chen 06-12-2014


end variables

forward prototypes
public subroutine of_search ()
public function integer of_create_request_webform (str_request_webform_action astr_action)
public function integer of_action (str_request_webform_action astr_action)
public function integer of_document_mergedata_auto (str_request_webform_action astr_action)
public function integer of_sending_email (str_request_webform_action astr_action)
public function integer of_get_template_emailinfo (long ai_mail_id, long al_export_id, ref str_dm_email astr_email)
public function integer of_get_template_emailmessage (long al_email_id, ref blob ablb_msgdata)
public function integer of_get_template_email_attachment (long al_email_id, long al_attach_id, ref blob ablb_attachment)
public subroutine of_update_msg ()
public subroutine of_sent_email_log (long al_rwf_id, string as_action, string as_note)
public subroutine of_create_dw ()
public subroutine of_set_splitbar_location ()
public subroutine of_set_object_resize ()
public function integer of_set_properties (long al_data_view_id, long al_screen_id, string as_titlebar_visible_def)
public subroutine of_export_log (long al_row)
public subroutine of_retrievedddw (string as_type)
public function boolean of_enable_action (long al_rwf_id, string as_status, string as_submit, long al_steps, string as_submit_step, string as_bypass)
public function integer of_retrieve (long al_rwf_id)
public subroutine of_delete (long al_row)
public function integer of_trigger_workflow (long al_ctx_id, boolean abn_new)
public function integer of_rejected_request (long al_rwf_id, string as_reject_step, string as_steps_mark, string as_submit_step, string as_msg, string as_title, long al_ctx_id)
public subroutine of_open_ctx (long al_data_id, integer ai_steps)
public subroutine of_display_label (string as_category)
public function long of_use_template (long al_template_id)
end prototypes

event ue_show_constructor();//====================================================================
// Event: ue_show_constructor
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 06-09-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

this.SetRedraw(false)


of_create_dw()

//Added By Jay Chen 06-12-2014
ids_screen_prop = Create n_ds
ids_screen_prop.DataObject = "d_screen_properties"
ids_screen_prop.SetTransObject(SQLCA)
ids_screen_prop.retrieve( )
of_set_properties(gl_SearchTab_otherwin_View, 61, "Y")
of_set_properties(gl_SearchTab_otherwin_View, 62, "Y")
of_set_properties(gl_SearchTab_otherwin_View, 63, "Y")
of_set_properties(gl_SearchTab_otherwin_View, 64, "Y")
of_set_properties(gl_SearchTab_otherwin_View, 65, "Y")
//end

tabpage_browse.dw_search.Event constructor( )
tabpage_browse.dw_list.Event constructor( )
//tabpage_browse.dw_list.Event ue_populatedddw( )
this.of_retrievedddw('')											//Added By Mark Lee 11/05/2014
tabpage_detail.dw_header.Event constructor( )
tabpage_detail.dw_detail.Event constructor( )
tabpage_detail.dw_log.Event constructor( )

Post of_Set_SplitBar_Location( ) //Added By Jay Chen 06-11-2014

this.SetRedraw(true)



end event

public subroutine of_search ();//====================================================================
// Function: of_search
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/30/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long					i, ll_cnt, ll_num
string 				ls_coltype,	ls_colname,	ls_visible,	ls_value,	ls_dddwname
n_cst_string			ln_string
string 				ls_filter, ls_select , ls_err

if this.tabpage_browse.dw_search.rowcount( )  < 1 then return

this.tabpage_browse.dw_search.accepttext( )
ll_Cnt = Long( this.tabpage_browse.dw_search.describe("DataWindow.Column.Count"))
ls_filter = " (status <> 'Draft' and status <> 'Deleted') "			//status = 'Draft'

For i = 1 to ll_cnt
 	ls_ColType =   this.tabpage_browse.dw_search.describe("#" + string(i) + ".ColType")
	ls_ColName =   this.tabpage_browse.dw_search.describe("#" + string(i) + ".Name")
	ls_Visible =  this.tabpage_browse.dw_search.describe("#" + string(i) + ".visible")
	ls_Value =  this.tabpage_browse.dw_search.inv_base.of_getitem(1,ls_ColName,false)
//		ls_Value = this.tabpage_browse.dw_search.getitem(1,ls_ColName)
	If ls_Visible <> '1' Then Continue
	
	Choose Case Lower(Left ( ls_ColType , 3 ))
		CASE 'int','lon','dec','num','dou','rea','ulo', 'mon'
			if f_validstr(ls_Value) THEN 
				 ls_filter = ls_filter +' AND '+ls_ColName+' = ' + ls_Value
			end if
		CASE 'dat'
			//Added By Jay Chen 06-10-2014
			if f_validstr(ls_Value) then
//				if not isnull(ls_Value) and ls_Value <> '' Then															//Added By Mark Lee 10/21/2015
				if lower(ls_ColName) = "from_date"  then 
					 ls_filter = ls_filter +" AND  modify_date  >= Cast('" + string(DateTime(date(ls_value),time('00:00:00'))) + "' as datetime) "
				elseif lower(ls_ColName) = "to_date"  then 
					ls_filter = ls_filter +" AND  modify_date <= Cast('" + string(DateTime(date(ls_value),time('23:59:59'))) + "' as datetime) "
				else
					 ls_filter = ls_filter +" AND "+ls_ColName+" >= Cast('" + string(DateTime(date(ls_value),time('00:00:00'))) + "' as datetime) "
				end if
			end if
			//end add
		CASE 'var','cha'	
			If ls_Value = '(NONE)' Then 
					setnull(ls_Value)
			End If			
			
			if Not f_validstr(ls_Value) THEN Continue
			ls_Value = ln_string.of_globalreplace( ls_Value, '"','~~"')
			ls_Value = ln_string.of_globalreplace( ls_Value, "'","~~'")

			choose case lower(ls_ColName)
				case 'submit_request_to'
					ls_filter = ls_filter +" AND (CHARINDEX('" + Upper(ls_Value) + ";',Upper(" + ls_ColName + ") ) > 0  or Upper(right(submit_request_to,len('"+Upper(ls_Value)  +"') )) ='"+Upper(ls_Value)+"'  )"
				case else						
					if this.tabpage_browse.dw_search.describe("#" + string(ll_Num) + ".edit.style") = 'dddw' then
//						ls_dddwname =  this.tabpage_browse.dw_search.describe("#" + string(ll_Num) + ".dddw.name") 
//						if ls_dddwname  = 'd_dddw_lookup_code' or ls_dddwname = 'd_dddw_company' or ls_dddwname = 'd_dddw_company_list' then
//							if len(ls_filter) > 1 then 
//								 ls_filter = ls_filter +" AND (Upper(" + ls_ColName + ") = '" + Upper(ls_Value) + "')"
//							else 
//								 ls_filter = " (Upper(" + ls_ColName +  ") = '" + Upper(ls_Value) + "')"
//							end if
//						else
//							if len(ls_filter) > 1 then 
//								 ls_filter = ls_filter +" AND (Upper(" + ls_ColName + ") Like '%" + Upper(ls_Value) + "%')"
//							else 
//								 ls_filter = " (Upper(" + ls_ColName +  ") Like '%" + Upper(ls_Value) + "%')"
//							end if
//						end if
						ls_filter = ls_filter +" AND (Upper(" + ls_ColName + ") = '" + Upper(ls_Value) + "')"
					else
						if len(ls_filter) > 1 then 
							 ls_filter = ls_filter +" AND (Upper(" + ls_ColName + ") Like '%" + Upper(ls_Value) + "%')"
						else 
							 ls_filter = " (Upper(" + ls_ColName +  ") Like '%" + Upper(ls_Value) + "%')"
						end if
					end if
			end choose
			
		End Choose 
Next

//view all requests		owner_user/submit_request_to
if w_Mdi.of_security_access(6994) = 0 then 
	ls_filter = ls_filter +" AND (CHARINDEX('" + Upper(gs_user_id) + "',Upper( submit_request_to ) ) > 0  or Upper(owner_user) ='" + Upper(gs_user_id) + "'	)"
else 
	//
end if 

ls_select	=  is_origin_sql + " where "+ ls_filter 

ls_err	=	this.tabpage_browse.dw_list.Modify( "datawindow.table.select=" + '"' +ls_select+ '"' )
this.tabpage_browse.dw_list.SetTransObject( sqlca)
this.tabpage_browse.dw_list.reset()
this.tabpage_browse.dw_list.Retrieve( )
of_retrievedddw('')									//Added By Mark Lee 11/05/2014



end subroutine

public function integer of_create_request_webform (str_request_webform_action astr_action);long			ll_row, ll_rwf_id, ll_template_id, ll_new_ctx_id, ll_export_id, i, ll_upperbound, ll_steps_mark
string 		ls_action, 	ls_err, ls_send_email_setting, ls_submit_step, ls_arr_steps[], ls_tmp, ls_steps_mark, ls_do_steps, ls_sql[], ls_reject_step
str_request_webform_action		lstr_action
Datetime									ldt_sysdate
boolean									lbn_template =false, lbn_new_ctx =false 
			
if isnull(astr_action.as_action) or trim(astr_action.as_action) = '' then return  -1 

ll_rwf_id = astr_action.al_rwf_id
ll_template_id = astr_action.al_template_id
ls_action = astr_action.as_action
ll_export_id = astr_action.al_export_id

OpenWithParm(w_request_webform_action,	astr_action)
lstr_action = Message.powerobjectparm

if isvalid(lstr_action) then 
	if ls_action = 'approve' then
		ll_new_ctx_id = lstr_action.al_ctx_id
		if (isnull(ll_new_ctx_id) or ll_new_ctx_id <= 0 ) then 
			lbn_new_ctx = true 
		end if 
		
		if (isnull(ll_new_ctx_id) or ll_new_ctx_id <= 0 ) and not isnull(ll_template_id) and ll_template_id > 0 then 
			ll_new_ctx_id = of_use_template(ll_template_id)
			if ll_new_ctx_id <= 0 then 
				return -1
			end if 
			lbn_template  = true 
		end if 
		
		ls_err = ''
		//Modified by harry 2017-08-24 add a param @IFdelete = 0
		Declare lsp_create_request Procedure For sp_create_request_data
			@rwf_id= :ll_rwf_id, @user_id = :gs_user_id, @notes =:lstr_action.as_notes,@do_steps= :lstr_action.as_do_steps , @ctx_id = :ll_new_ctx_id OUTPUT, @err_msg = :ls_err OUTPUT,@IFdelete = 0;
		Execute lsp_create_request;
		Fetch lsp_create_request Into :ll_new_ctx_id,	:ls_err;
		Close lsp_create_request;
		
		 If SQLCA.SQLCode < 0  or  Pos(lower(ls_err),"error") > 0 Then
			ROLLBACK;
			if isnull(ll_new_ctx_id) then ll_new_ctx_id = 0 
			//Added By Mark Lee 06/18/2015
			of_rejected_request(ll_rwf_id,string(lstr_action.as_do_steps),"", "","Approved the Request Webform ("+string(ll_rwf_id)+") Failed : (error:"+ls_err+" Sqlerrtext:"+sqlca.sqlerrtext+" )" , " Request webform Auto Reject ("+string(ll_rwf_id)+") ", ll_new_ctx_id)
			gnv_debug.of_output( true, " Request webform "+lstr_action.as_action+" ("+string(ll_rwf_id)+", "+string(ll_new_ctx_id)+") error:"+ls_err	+" Sqlerrtext:"+sqlca.sqlerrtext)			
//			Messagebox('Error','Failed to create the Contract, Please call support or try it again.')
			Messagebox('Error','Failed to create the Contract, Sqlerrtext:'+sqlca.sqlerrtext)
			return -2
		Else 
			COMMIT;
		End If		
		
		if not isnull(ls_err) and  len(trim(ls_err)) >0 then 
			gnv_debug.of_output( true, " Request webform "+lstr_action.as_action+" ("+string(ll_rwf_id)+", "+string(ll_new_ctx_id)+") error:"+ls_err	+" Message:"+sqlca.sqlerrtext)			
		end if 
		
		lstr_action.al_ctx_id = ll_new_ctx_id
		
		//Added By Jay Chen 10-30-2015 update company and contact status = 'Active'
		if not isnull(ll_new_ctx_id) and ll_new_ctx_id > 0 then
			update app_facility set status = 'A' where facility_id = (select app_facility from ctx_basic_info where ctx_id = :ll_new_ctx_id);
			update ctx_contacts set status = 'A' where contact_id in (select contact_id from ctx_contract_contacts where ctx_id = :ll_new_ctx_id);
		end if
		//end
		
//		ll_steps_mark = 0 
//		Select top 1 steps_mark
//		Into :ll_steps_mark
//		From request_webform_document
//		Where rwf_id = :ll_rwf_id Using sqlca;
		
//		if Pos(lstr_action.as_do_steps, ";"+string(ll_steps_mark)+";") > 0 then 
			//for merged the document
			of_document_mergedata_auto(lstr_action)
//		end if 

		// workflow			
		if lstr_action.al_workflow = 1 then
			of_trigger_workflow(ll_new_ctx_id, lbn_new_ctx)
		end if 
	elseif ls_action = 'reject' then
		ll_new_ctx_id = lstr_action.al_ctx_id
		ls_submit_step = lstr_action.as_submit_step
		ls_reject_step = lstr_action.as_reject_step
		ls_do_steps = lstr_action.as_do_steps
		if isnull(ls_reject_step) or trim(ls_reject_step) = "" then 
			ls_reject_step = ls_do_steps
		else
			ls_reject_step = left(ls_reject_step, len(ls_reject_step) - 1 ) + ls_do_steps
		end if 
		
		if not isnull(lstr_action.as_do_steps ) then
			gnv_string.of_parsetoarray( Mid(lstr_action.as_do_steps , 2 , len(lstr_action.as_do_steps ) - 2 ) , ";", ls_arr_steps) 			
		end if 
		ll_upperbound = UpperBound(ls_arr_steps)

		if isnull(ls_submit_step) then 
			ls_submit_step = ""
		else
			if ll_upperbound > 0 then 
				for i = 1 to ll_upperbound
					ls_tmp = ";"+ls_arr_steps[i]+";"
					ls_submit_step = gnv_string.of_globalreplace( ls_submit_step, ls_tmp, ";")
				next 
			end if 
		end if 
		
		if not isnull(lstr_action.as_do_steps) then 
			ls_steps_mark = gnv_string.of_globalreplace(  Mid(lstr_action.as_do_steps , 2 , len(lstr_action.as_do_steps ) - 2 ), ";", ",")
		end if 
		
		if trim(ls_submit_step) = ";" then ls_submit_step = ""
	
	//		ldt_sysdate = f_get_server_dtm()
	//		gnv_appeondb.of_startqueue( )
	//		Update request_webform
	//		Set status = 'Rejected', submit_step = :ls_submit_step , reject_step= :ls_do_steps 
	//		Where rwf_id = :ll_rwf_id Using sqlca;
	//		
	//		//update submit step sign
	//		Update request_webform_detail
	//		Set submitted = -1
	//		where submitted = 2 and (updated is null or updated = 'N') and  rwf_id = :ll_rwf_id and steps_mark in (:ll_arr_steps)
	//		Using sqlca;
	//		
	//		INSERT INTO request_webform_log
	//				  (rwf_id,notes ,user_id,modify_date ,action, ctx_id)
	//				  Values(:lstr_action.al_rwf_id, :lstr_action.as_notes, :gs_user_id, :ldt_sysdate, 'Rejected', :ll_new_ctx_id) 
	//					using sqlca;
	//		gnv_appeondb.of_commitqueue( )			
	//		
	//		if sqlca.sqlcode <>0 then 
	//			ROLLBACK;
	//			gnv_debug.of_output( true, " Request webform "+lstr_action.as_action+" ("+string(ll_rwf_id)+")  error:"+sqlca.sqlerrtext	)
	//			messagebox(gnv_app.iapp_object.DisplayName," Request webform "+ls_action+" ("+string(ll_rwf_id)+") error:"+sqlca.sqlerrtext	)
	//			return -2
	//		else
	//			COMMIT;
	//		end if 
	
//Added By Mark Lee 06/18/2015 move it to of_rejected_request() funcation. 	
//			// if isnull(istr_action.as_bypass ) or trim(istr_action.as_bypass) = '' or trim(istr_action.as_bypass) = 'N' then // old data chooice.
//			if isnull(ls_reject_step) or trim(ls_reject_step) = '' or isnull(ls_submit_step) or trim(ls_submit_step) = '' then
//				ls_sql[1] = " Update request_webform Set status = 'Rejected', submit_step ='' , reject_step = '' Where rwf_id ="+string(ll_rwf_id) + " ; "
//			else
//				ls_sql[1] = " Update request_webform Set status = 'Rejected', submit_step = '"+ls_submit_step+"' , reject_step = '"+ls_reject_step+"' Where rwf_id ="+string(ll_rwf_id) + " ; "
//			end if 
//			
//			if isnull(ls_steps_mark) or trim(ls_steps_mark) = '' then
//				ls_sql[2] = " Update request_webform_detail Set submitted = -1 where submitted = 2 and (updated is null or updated = 'N') and  rwf_id ="+string(ll_rwf_id)+" ; "
//			else
//				ls_sql[2] = " Update request_webform_detail Set submitted = -1 where submitted = 2 and (updated is null or updated = 'N') and  rwf_id ="+string(ll_rwf_id)+" and steps_mark in ("+ls_steps_mark+") ; "
//			end if 
//							
//			ls_sql[3] = " INSERT INTO request_webform_log  (rwf_id,notes ,user_id,modify_date ,action, ctx_id) Values("+string(lstr_action.al_rwf_id)+", '"+lstr_action.as_notes+"', '"+gs_user_id+"', getdate(), 'Rejected', "+string(ll_new_ctx_id)+") ; "
//		i = gnv_string.of_execute_sql( ls_sql, " Request webform "+lstr_action.as_action+" ("+string(ll_rwf_id), "error", true)	

		i =	of_rejected_request(ll_rwf_id,ls_reject_step,ls_steps_mark, ls_submit_step,lstr_action.as_notes, " Request webform "+ls_action+" ("+string(ll_rwf_id)+") ", ll_new_ctx_id)
		if i = -1 then return -2
	end if 
else
	return -1
end if 		
	
//Sending Email
ls_send_email_setting = astr_action.as_send_email_setting 
if (not isnull(ls_send_email_setting) and ls_send_email_setting = '1') then
	//if of_sending_email(astr_action) < 0 then  //Commented By Ken.Guo 2015-06-17
	if of_sending_email(lstr_action) < 0 then  //Added By Ken.Guo 2015-06-17
		messagebox(gnv_app.iapp_object.DisplayName,"To view the sent email log in detail please go to the Sent Email Log (System -> Utilities -> Sent Email Log)." ) 
	end if 
end if		
		
return 1
end function

public function integer of_action (str_request_webform_action astr_action);//====================================================================
// Function: of_action
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    str_request_webform_action    astr_action
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 11/22/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
str_request_webform_action		lstr_action
Datetime									ldt_sysdate
long										ll_row, ll_return
string 									ls_status
n_cst_filesrv 							lnv_filesrv
Boolean									lbn_action

if isnull(astr_action.as_action) or trim(astr_action.as_action) = "" then
	return 0
end if 

inv_dm_utils.of_delete_directory_file(  gs_dir_path + gs_DefDirName +"\Request")	//clean history files

if astr_action.as_from = 'detail' then
	if this.tabpage_detail.dw_header.rowcount( ) <= 0 then
		return 0
	end if 

	if isnull(astr_action.al_rwf_id) or astr_action.al_rwf_id <= 0 then 
		return 0
	end if 
	
	//checked the status 
	Select status ,submit_request_to,steps,submit_step,bypass
	Into :lstr_action.as_status, :lstr_action.as_submit_request_to, :lstr_action.al_steps, :lstr_action.as_submit_step, :lstr_action.as_bypass
	From request_webform 
	Where rwf_id = :astr_action.al_rwf_id Using sqlca;

//	if not isnull(ls_status) and Upper(ls_status) = Upper('Waiting for Approval') then 
	if of_enable_action(astr_action.al_rwf_id , lstr_action.as_status ,lstr_action.as_submit_request_to, lstr_action.al_steps,lstr_action.as_submit_step,lstr_action.as_bypass)	= true then 
		if of_create_request_webform(astr_action) > 0 then 
			of_retrieve(astr_action.al_rwf_id)

			ll_row = w_request_webform_approve.tab_1.tabpage_browse.dw_list.getrow( )
			if astr_action.as_action = 'approve' then
				ls_status	= "Completed"
			else
				ls_status	= "Rejected"
			end if 
			w_request_webform_approve.tab_1.tabpage_browse.dw_list.SetItem(ll_row,"status", ls_status)
		else
			return -1
		end if 
	else
		of_retrieve(astr_action.al_rwf_id)
	end if 
elseif astr_action.as_from = 'browse' then
	ll_row		= astr_action.al_row
	if not isnull(ll_row) and ll_row > 0 then 
		astr_action.al_rwf_id = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemNumber(ll_row,"rwf_id")
		astr_action.as_request_name = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemString(ll_row,"request_name")
		astr_action.al_template_id = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemNumber(ll_row,"template_id")		
		astr_action.al_export_id = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemNumber(ll_row,"export_id")		
		astr_action.as_send_email_setting = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemString(ll_row,"send_email_setting")				
		astr_action.al_steps = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemNumber(ll_row,"steps")	
		astr_action.as_submit_step = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemString(ll_row,"submit_step") 
		astr_action.as_reject_step = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemString(ll_row,"reject_step") 
		astr_action.al_ctx_id = w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemNumber(ll_row,"ctx_id")	
		
		//checked the status 
		Select status ,submit_request_to,steps,submit_step,bypass
		Into :lstr_action.as_status, :lstr_action.as_submit_request_to, :lstr_action.al_steps, :lstr_action.as_submit_step, :lstr_action.as_bypass
		From request_webform 
		Where rwf_id = :astr_action.al_rwf_id Using sqlca;
	
		if of_enable_action(astr_action.al_rwf_id , lstr_action.as_status ,lstr_action.as_submit_request_to, lstr_action.al_steps,lstr_action.as_submit_step,lstr_action.as_bypass)	= true then 
			if of_create_request_webform(astr_action) > 0 then 
				if astr_action.as_action = 'approve' then
					ls_status	= "Completed"
				else
					ls_status	= "Rejected"
				end if 
				w_request_webform_approve.tab_1.tabpage_browse.dw_list.SetItem(ll_row,"status", ls_status)
			else
				return -1
			end if 
		else
			of_retrieve(astr_action.al_rwf_id)
		end if 
	end if 
	
end if 

of_update_msg()		//update message

return 1
end function

public function integer of_document_mergedata_auto (str_request_webform_action astr_action);//====================================================================
// Function: of_document_mergedata_auto
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    str_request_webform_action    astr_action
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/02/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_ds 					ds_document_merged
integer				li_rtn
n_cst_ovole_utils  lnv_ole_utils_doc	
long					i, j,	ll_count, ll_doc_id,	li_cnt, ll_export_id
string 				ls_merge_tmp_file,	ls_filename
str_doc_info			lstr_docinfo 
OleObject			lole_save,	lole_fields

//Added By Jay Chen 02-04-2016
n_cst_word_utility lnv_word_utils
DataStore lds_clause_rules_result
Long ll_from_template_id
Boolean lb_rules_valid = FALSE, lb_Template_Valid=FALSE
DateTime ldt_modify
String ls_docname,ls_clauseid[],ls_sql, ls_criteria
n_cst_dm_utils lnv_dm_utils
n_cst_string lnv_string
//end

if isnull(astr_action.al_ctx_id) or astr_action.al_ctx_id <=0 then return -1		
li_rtn = 0 
ds_document_merged = create n_ds
ds_document_merged.dataobject = 'ds_document_merged'
ds_document_merged.settransobject( sqlca)
ds_document_merged.retrieve( astr_action.al_ctx_id )
ll_count = ds_document_merged.rowcount( )

if ll_count <= 0 then return li_rtn

if Not isvalid( w_infodisp ) then open(w_infodisp)
if isvalid(w_infodisp) then w_infodisp.title = "Merging Document(s) "
if isvalid(w_infodisp) then w_infodisp.Center = TRUE
if isvalid(w_infodisp) then w_infodisp.st_complete.visible = false
if isvalid(w_infodisp) then w_infodisp.st_3.visible = false
if isvalid(w_infodisp) then w_infodisp.st_information.visible = false
if isvalid(w_infodisp) then w_infodisp.st_1.text = 'Auto Merged' 
if isvalid(w_infodisp) then w_infodisp.wf_set_min_max(1,ll_count)
	
if not isvalid(lnv_ole_utils_doc) then 
	lnv_ole_utils_doc = create n_cst_ovole_utils
end if 

//Added By Jay Chen 02-04-2016
lnv_word_utils = Create n_cst_word_utility
lds_clause_rules_result = Create DataStore
lds_clause_rules_result.DataObject = 'd_dm_template_clause_rules_result'
//end

for i = 1 to ll_count
	ll_doc_id = ds_document_merged.GetItemNumber(i,'doc_id')
	lstr_docinfo.ver_num = ds_document_merged.GetItemDecimal(i,'revision')
	lstr_docinfo.doc_name =  ds_document_merged.GetItemString(i,'doc_name')
	lstr_docinfo.create_by =  ds_document_merged.GetItemString(i,'create_by')
	lstr_docinfo.ver_date =  Date(ds_document_merged.GetItemDateTime(i,'create_date'))
	ll_export_id	= ds_document_merged.GetItemNumber(i, "export_id")
	ll_from_template_id = ds_document_merged.GetItemNumber(i, "from_templete_id") //Added By Jay Chen 02-04-2016
	
	ls_merge_tmp_file = gs_dir_path + gs_DefDirName + "\agreement\_merged_data"+string(i)+".doc"
	if isvalid(w_infodisp) then w_infodisp.st_1.text =  'Contract ID:'+string(astr_action.al_ctx_id)+' Modification:' +string(i) +' of '+ string(ll_count) +', Please stand by!'
	
	lb_Template_valid = FALSE 
	lb_rules_valid = FALSE
	//Added By Jay Chen 02-04-2016
	IF gnv_data.of_findrow('template_clause_rules', "ctx_acp_template_id = " + String(ll_from_template_id)) > 0 THEN
		lb_Template_valid = TRUE //added by gavins 20160425
		//Get clause rules' result into datastore				
		lnv_dm_utils.of_get_clause_rule_reuslts(astr_action.al_ctx_id, ll_from_template_id, lds_clause_rules_result)
		FOR i = 1 to lds_clause_rules_result.RowCount()								
			IF lds_clause_rules_result.GetItemNumber(i,"rules_result") = 0 THEN 
				lb_rules_valid = TRUE
				ls_clauseid[UpperBound(ls_clauseid) + 1] = String(lds_clause_rules_result.GetItemNumber(i, "ctx_acp_clause_id"))
			END IF
		NEXT
	END IF
 
	IF  lb_Template_valid  AND NOT lb_rules_valid THEN	// all clause meet criteria
		//the dynamic adding clause rules is invalid	
	//---------End Added ---------------------------------------------
//		gnv_appeondb.of_startqueue( )
		
//		Insert Ctx_am_doc_image(Doc_id, Revision, image_file, doc_ext, modify_date,doc_ext_full)
//		Select :ll_doc_id, :ldc_revision, image_file, 'doc', getdate(),'doc'
//		From ctx_acp_template
//		Where ctx_acp_template_id = :ll_from_template_id;
//		update Ctx_am_doc_image set image_file = ctx_acp_template.image_file	from ctx_acp_template , Ctx_am_doc_image 
//		where ctx_acp_template.ctx_acp_template_id =:ll_from_template_id and 
//		Ctx_am_doc_image.doc_id = :ll_doc_id  and      Ctx_am_doc_image.Revision = :lstr_docinfo.ver_num;

		delete from Ctx_am_document_clause where Doc_id = :ll_doc_id and revision =:lstr_docinfo.ver_num;

		Insert Ctx_am_document_clause(Doc_id, Revision, ctx_acp_clause_id, orders )
		Select :ll_doc_id, :lstr_docinfo.ver_num, ctx_acp_clause_id, orders
		From ctx_acp_template_clause
		Where ctx_acp_template_id = :ll_from_template_id;
		
		//Get modify date for the template
		Select modify_date Into :ldt_modify From ctx_acp_template Where ctx_acp_template_id = :ll_from_template_id;
			//Get the template file
		lnv_word_utils.of_get_template_file(ll_from_template_id, ldt_modify)
		//Clear invalid clauses based on rules, and generate the new document
		ls_filename = gs_dir_path + gs_DefDirName + "\Agreement\" + "template_" + string(ll_from_template_id) + ".doc"
		ls_docname = ls_filename
		
	Elseif lb_rules_valid then
		delete from Ctx_am_document_clause where Doc_id = :ll_doc_id and revision =:lstr_docinfo.ver_num;
		
		lnv_string.of_arraytostring(ls_clauseid, ",", ls_criteria) 				
		ls_sql = "Insert ctx_am_document_clause(doc_id, revision, ctx_acp_clause_id, orders ) " + &
					" Select " + String(ll_doc_id) + ", " + String(lstr_docinfo.ver_num) + ", ctx_acp_clause_id, orders" + &
					"  From ctx_acp_template_clause Where ctx_acp_template_id = " + String(ll_from_template_id)
		IF Len(ls_criteria) > 0 THEN ls_sql = ls_sql + " And ctx_acp_clause_id not in (" + ls_criteria + ")"	
		ls_sql += "; "		
		EXECUTE IMMEDIATE :ls_sql; //update clause map		
		//Get modify date for the template
		Select modify_date Into :ldt_modify From ctx_acp_template Where ctx_acp_template_id = :ll_from_template_id;
		//Get the template file
		lnv_word_utils.of_get_template_file(ll_from_template_id, ldt_modify)
		//Clear invalid clauses based on rules, and generate the new document
		ls_filename = gs_dir_path + gs_DefDirName + "\Agreement\" + "template_" + string(ll_from_template_id) + ".doc"
		ls_docname = lnv_dm_utils.of_generate_tempname(ll_doc_id, lstr_docinfo.ver_num, 'doc')			
		lnv_dm_utils.of_gen_document_on_rules(ls_filename, ls_docname, lds_clause_rules_result)
	end if
	//end add
	
//	ls_filename = inv_dm_utils.of_download_file( ll_doc_id, lstr_docinfo.ver_num)
	//Modified By Jay Chen 02-04-2016
	if lb_rules_valid Or lb_Template_valid then //modified by gavins 20160425 add lb_Template_valid
		ls_filename = ls_docname
	else
		ls_filename = inv_dm_utils.of_download_file( ll_doc_id, lstr_docinfo.ver_num)
	end if
	//end
	
	If Fileexists(ls_filename) Then		
		if not isnull(ll_export_id) and ll_export_id > 0 then			
			//Create oleobject
			if not isvalid(lole_save) then 
				lole_save = Create OleObject
				app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
				IF lole_save.Connecttonewobject("word.application") <> 0 THEN
					app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
					gnv_debug.of_output( True,"Could not connect to Microsoft Word. Please make sure it is properly installed. ~r~n syntax:of_document_mergedata_auto( ) ") 
					Destroy lole_save			
					If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)		
					if isvalid(lnv_ole_utils_doc) then destroy lnv_ole_utils_doc
					if isvalid(ds_document_merged) then destroy ds_document_merged
					if isvalid(w_infodisp) then close(w_infodisp)	
					RETURN -1
				END IF
				app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
			end if 
			
			
			lole_save.Application.NormalTemplate.Saved = TRUE  
			lole_save.Application.Documents.Open(ls_filename, False, True) 	
			gnv_word_utility.of_modify_word_property( lole_save.Activedocument)	 
			gnv_shell.of_delete_recent( ls_filename, true) //  Delete Windows Recent Document.
					
			//If no merge fields existed
			lole_fields =  lole_save.Activedocument.Fields
			li_cnt = lole_fields.count 
			For j = 1 to li_cnt
				If lole_fields.Item[j].Type = wdFieldMergeField or lole_fields.Item[j].Type = wdFieldDocVariable Then Exit
			Next	

			IF j > li_cnt  Then 
				lole_save.ActiveDocument.Close(0)
//				lole_save.Quit(0)
//				lole_save.DisconnectObject( )
//				destroy lole_save			
				if isvalid(w_infodisp) then w_infodisp.wf_step_pbar(1)
				continue
			end if 
			
			//or lnv_ole_utils_doc.of_ismerged(lole_save.ActiveDocument)  ...// unmerged.....
			if  lnv_ole_utils_doc.of_ismerged(lole_save.ActiveDocument)  then   
//				lole_save.ActiveDocument.MailMerge.ViewMailMergeFieldCodes = True
				lnv_ole_utils_doc.of_setmergestatus( lole_save.ActiveDocument, false)
				lnv_ole_utils_doc.of_mergedocinfo( lole_save.ActiveDocument, lstr_docinfo, true)
			end if 
	
			lole_save.ActiveDocument.SaveAs(ls_merge_tmp_file, 0,false,'',false)
			gnv_shell.of_delete_recent( ls_merge_tmp_file, true) // Delete Windows Recent Document.					
			lole_save.ActiveDocument.Close(0)
//			lole_save.Quit(0)
//			lole_save.DisconnectObject( )
//			destroy lole_save
	
			lnv_ole_utils_doc.of_setstatuschanged(FALSE) 

			If not isvalid(w_appeon_gifofwait) Then OpenwithParm(w_appeon_gifofwait,"Merging Data ...")				
			li_rtn = lnv_ole_utils_doc.of_mergedata_auto(ll_export_id, astr_action.al_ctx_id,ls_merge_tmp_file,ls_filename,false,lstr_docinfo)			
			FileDelete(ls_merge_tmp_file)				
			if li_rtn > 0 then 
				// update document
				inv_dm_utils	.ib_request_approve = True //Add by Harry 2017-03-02
				inv_dm_utils	.of_upload_file(ll_doc_id,lstr_docinfo.ver_num,ls_filename,'')
				inv_dm_utils	.ib_request_approve = False  //Add by Harry 2017-03-02
//			else
//				If isvalid(lole_save) Then
//					lole_save.Quit(0)
//					lole_save.DisconnectObject( )
//					destroy lole_save
//				end if 
//				If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)		
//				if isvalid(lnv_ole_utils_doc) then destroy lnv_ole_utils_doc
//				if isvalid(ds_document_merged) then destroy ds_document_merged
//				if isvalid(w_infodisp) then close(w_infodisp)	
//				return li_rtn					// if one document merge failuredd, the queue will continue to merge document.
			end if 	
		else
			inv_dm_utils	.ib_request_approve = True  //Add by Harry 2017-03-02
			inv_dm_utils	.of_upload_file(ll_doc_id,lstr_docinfo.ver_num,ls_filename,'')
			inv_dm_utils	.ib_request_approve = False  //Add by Harry 2017-03-02
		end if 
	End IF 
	if isvalid(w_infodisp) then w_infodisp.wf_step_pbar(1)	
next 

If isvalid(lole_save) Then
	lole_save.Quit(0)
	lole_save.DisconnectObject( )
	destroy lole_save
end if 
If isvalid(w_appeon_gifofwait) Then close(w_appeon_gifofwait)		
if isvalid(lnv_ole_utils_doc) then destroy lnv_ole_utils_doc
if isvalid(ds_document_merged) then destroy ds_document_merged
if isvalid(w_infodisp) then close(w_infodisp)	

//Added By Jay Chen 02-04-2016
IF IsValid(lds_clause_rules_result) THEN DESTROY lds_clause_rules_result 
IF IsValid(lnv_word_utils) THEN Destroy lnv_word_utils

return li_rtn
end function

public function integer of_sending_email (str_request_webform_action astr_action);//====================================================================
// Function: of_sending_email
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    str_request_webform_action    astr_action
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/12/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long		i, ll_attach_id, ll_flag, ll_Return, ll_send_result, ll_rtn
long		ll_rwf_id, ll_owner_email_id, ll_approve_email_id, ll_reject_email_id, ll_email_id, ll_count,	ll_rowcount
String		ls_cc_owner_user, ls_cc_approve_user, ls_cc_reject_user, ls_creator, ls_send_user, ls_cc_user, ls_owner, ls_computer_info, ls_email_type
String		ls_attach_name, ls_attach_file, ls_attachfilename, ls_file_name,	ls_download_file, ls_auto_sign,	ls_email_address, ls_cc_email_address
String 	ls_fullname[],	ls_filename[], ls_errtext, ls_action_type, ls_subject, ls_to_email_user, ls_to_email_address
Blob		lblb_MsgData,	lblb_Attach[],	lblb_newdata
String 	ls_attchname[], ls_cc[], ls_submitter
//str_dm_email 			lstr_email
str_email 				lstr_email
n_ds						lds_email_attach
DataStore				lds_export
n_cst_filesrv 			lnv_filesrv
n_cst_word_utility 		lnv_word
w_ole_word				lw_ole_word
n_cst_easymail_smtp 	lnv_Mail
str_email_account		lstr_email_account, lstr_email_account_copy
n_cst_ctx_mail			lnv_ctx_mail

ll_rwf_id = astr_action.al_rwf_id
ll_count = 0 
ll_send_result = 0 
ls_attachfilename = ''
ls_attach_file = ''
//if isnull(ll_rwf_id) or ll_rwf_id <= 0 then  
//	return 0 
//end if

If Not DirectoryExists(gs_dir_path + gs_DefDirName + "\Request\") Then
	gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Request\")
End If
	
If Not DirectoryExists(gs_dir_path + gs_DefDirName + "\Request\Attach\") Then
	gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\Request\Attach\")
End If

Select owner_email_id,approve_email_id,reject_email_id,cc_owner_user,cc_approve_user,cc_reject_user,create_user, owner_user, user_id
Into :ll_owner_email_id, :ll_approve_email_id, :ll_reject_email_id, :ls_cc_owner_user, :ls_cc_approve_user, :ls_cc_reject_user, :ls_creator, :ls_owner, :ls_submitter
From request_webform
Where rwf_id = :ll_rwf_id Using Sqlca;

//ls_to_email_user = lower( ls_creator )											//Added By Mark Lee 09/29/2015	Email Subject: RM issues for RM version 15.2.0710.15
ls_to_email_user = ls_submitter
if astr_action.as_action = 'approve' then 
	ll_email_id =ll_owner_email_id
	ls_cc_user = lower(ls_cc_owner_user)
	ls_action_type = 'Approved'
else
	ll_email_id =ll_reject_email_id
	ls_cc_user = lower(ls_cc_reject_user)
	ls_action_type = 'Rejected'
end if 

//Added By Mark Lee 02/26/2014
if isnull(ll_email_id) or ll_email_id <= 0 then  	
	of_sent_email_log(ll_rwf_id,ls_action_type+"-Email","Failed to send email. There is no email template set in the Email Sending Settings.")
	MessageBox("Failed to send email", " There is no email template set in the Email Sending Settings." )	
	return 0 
end if

////replace the special user name
if not isnull(ls_cc_user) and pos(lower(ls_cc_user) , lower('$<Creater>$')  ) > 0 then 
	ls_cc_user = lower(gnv_string.of_globalreplace( lower(ls_cc_user), lower('$<Creater>$'), ls_creator))
end if
	
ls_send_user = gs_user_id			//send user
ls_send_user = lnv_Mail.of_replace_send_user(ls_send_user)		// use system email address 
if lnv_Mail.of_getdefaultaccount( ls_send_user, lstr_email_account) = -1 then 
	of_sent_email_log(ll_rwf_id,ls_action_type+"-Email","Failed to send email to"+ls_send_user+". The "+ls_send_user+" user's Email Address cannot be empty.")
	MessageBox("Email Address required", " The "+ls_send_user+" user's Email Address cannot be empty." )
	Return 0
else
	ls_email_address = lstr_email_account.as_emailaddress
end if 

//only for receive email 
//lstr_email_account = lstr_email_account_copy
//if lnv_Mail.of_getdefaultaccount( ls_to_email_user, lstr_email_account) = -1 then
//	of_sent_email_log(ll_rwf_id,ls_action_type+"-Email","Failed to send email to "+ls_to_email_user+". The "+ls_to_email_user+" user's Email Address cannot be empty.")
//	MessageBox("Email Address required", " The "+ls_to_email_user+" user's Email Address cannot be empty." )
//	Return -1
//else
//	ls_to_email_address = lstr_email_account.as_emailaddress
//end if
//Added By Mark Lee 09/01/2014	add lower() function 
ls_to_email_address = gnv_data.of_getItem("security_users", "email_id", " lower(user_id) ='"+lower(ls_to_email_user)+"' ") 	
if isnull(ls_to_email_address) or trim(ls_to_email_address) = '' then 
	// other table
	Select email 
	into : ls_to_email_address
	From user_requester 
	Where lower(user_id) = :ls_to_email_user using sqlca;
	
	if isnull(ls_to_email_address) or trim(ls_to_email_address) = '' then 
		of_sent_email_log(ll_rwf_id,ls_action_type+"-Email","Failed to send email to "+ls_to_email_user+". The "+ls_to_email_user+" user's Email Address cannot be empty.")
		MessageBox("Email Address required", " The "+ls_to_email_user+" user's Email Address cannot be empty." )
		Return 0	
	end if 
end if 

//lstr_email_account = lstr_email_account_copy
//lnv_Mail.of_getdefaultaccount( ls_cc_user, lstr_email_account)
//ls_cc_email_address = lstr_email_account.as_emailaddress
//Added By Mark Lee 01/29/2015 ;email@company.com;
ls_cc_email_address = ""
if (pos(ls_cc_user,";") > 0 ) then 
	gnv_string.of_parsetoarray( ls_cc_user,";", ls_cc)
	for i = 1 to upperbound(ls_cc)
		ls_cc_email_address = ls_cc_email_address + gnv_data.of_getItem("security_users", "email_id", "lower(user_id) ='"+lower(ls_cc[i])+"' ") + ";"
	next 
	if right(ls_cc_email_address,1) = ";" then
		ls_cc_email_address = left(ls_cc_email_address, len(ls_cc_email_address) - 1)
	end if 
else
	ls_cc_email_address = gnv_data.of_getItem("security_users", "email_id", "lower(user_id) ='"+lower(ls_cc_user)+"' ") 	
end if 

gnv_appeondb.of_startqueue( )	
Select count(1)
Into :ll_count
From wf_email	
Where email_id = :ll_email_id 	Using Sqlca;

//need separate the count() function.
Select  auto_sign
Into :ls_auto_sign
From wf_email	
Where email_id = :ll_email_id 	Using Sqlca;

Select flag
Into :ll_flag 
From security_user_mailsetting Where user_id = :ls_send_user Using Sqlca;
gnv_appeondb.of_commitqueue( )

if ll_count > 0 then 
	if not isvalid(w_appeon_gifofwait)  then	Open(w_appeon_gifofwait)			
	Timer(0, w_appeon_gifofwait)
	w_appeon_gifofwait.of_SetPosition(0)
	w_appeon_gifofwait.of_SetMinPosition(0)
	w_appeon_gifofwait.of_SetMaxPosition(ll_count  * 10)  
	w_appeon_gifofwait.of_setstep(10)
	// Retrieve clause reference count
	w_appeon_gifofwait.of_SetText("Sending Email, Please wait...")

	//get template email content
	lnv_ctx_mail.of_get_mail_template(ll_email_id,lblb_MsgData,lstr_email)
//	of_get_template_emailinfo(ll_email_id, astr_action.al_export_id, lstr_email	)
//	of_get_template_emailmessage(ll_email_id,lblb_MsgData)
	
	lnv_ctx_mail.of_get_mail_template_attachment(ll_email_id, ls_attchname)
	gnv_string.of_arraytostring( ls_attchname, ',', ls_attach_file)
	ls_attachfilename = gnv_string.of_get_file_name(ls_attach_file,',')
	
//	lds_email_attach = Create n_ds
//	lds_email_attach.DataObject = "d_Email_Attach"
//	lds_email_attach.SetTransObject(SQLCA)
//	lds_email_attach.Retrieve(ll_email_id)
//	
//	ll_rowcount = lds_email_attach.RowCount()
//	f_SetFileSrv(lnv_filesrv,true)
//	for i = 1 to ll_rowcount
//		IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()					
//		ls_attach_name = lds_email_attach.GetItemString(i,"attach_name")
//		ll_attach_id = lds_email_attach.GetItemNumber(i,"attach_id")
//
//		of_get_template_email_attachment(ll_email_id,ll_attach_id,lblb_Attach[UpperBound(lblb_Attach) + 1])
//		
//		if Len(lblb_Attach[UpperBound(lblb_Attach)]) > 0 then
//			ls_file_name = gs_dir_path + gs_DefDirName + "\Request\Attach\" + ls_attach_name
//				
//			lnv_filesrv.of_FileWrite(ls_file_name, lblb_Attach[UpperBound(lblb_Attach)],false)
//				
//			if trim(ls_attach_file) = '' then 
//				ls_attach_file = ls_file_name
//			else
//				ls_attach_file = ls_attach_file + ','+ls_file_name
//			end if
//			if trim(ls_attachfilename) = '' then 
//				ls_attachfilename = ls_attach_name
//			else
//				ls_attachfilename = ls_attachfilename + ';'+ ls_attach_name
//			end if 
//		end if
//	next
//	
//	f_SetFileSrv(lnv_filesrv,false)
//	Destroy lds_email_attach
	
	//create file 	
	IF Not isvalid(lw_ole_word) Then 
		Open(lw_ole_word)
		lw_ole_word.event activate( )
	End IF 
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("1. Sending Email, Please wait...")
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()	
	//Set message with the email template and signature
	lw_ole_word.ole_1.of_Close()
	if  not isnull(ls_auto_sign) and ls_auto_sign = 'Y' and not isnull(ll_Flag) and  ll_Flag = 1 then
		lw_ole_word.ole_1.of_Open(ls_send_user)
		lw_ole_word.ole_1.of_insertfilefirst(lblb_MsgData)
	else
		lw_ole_word.ole_1.of_Open(lblb_MsgData)
	end if
	
	//Added By Mark Lee 05/04/2015     Subject: RE: More Request Module Trouble after V15 [ don't find the reason.]
//	IF lw_ole_word.ole_1.Object.Doctype <> 1 THEN 
//		of_sent_email_log(ll_rwf_id,ls_action_type+"-Email","Failed to send email to "+ls_to_email_user+". The document object cannot be use.")
//		lw_ole_word.ole_1.of_close( ) 		
//		If Isvalid(lw_ole_word) Then Close(lw_ole_word)			
//		IF IsValid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
//		RETURN 0
//	END IF
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("2. Sending Email, Please wait...")
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()	
	lnv_word = Create n_cst_word_utility
	lnv_word.il_doc_id = 0
	lds_export = Create DataStore
//	ll_rtn = lnv_word.of_replace_export_word(lw_ole_word.ole_1.Object.ActiveDocument, lstr_email.subject,astr_action.al_ctx_id, astr_action.al_export_id, lds_export, true)	
	ll_rtn = lnv_word.of_replace_export_word(lw_ole_word.ole_1.Object.ActiveDocument, lstr_email.subject,astr_action.al_ctx_id, lstr_email.export_id, lds_export, true)	
	
	//Added By Mark Lee 01/23/2014	lstr_email.subject	
	ls_download_file = gs_dir_path + gs_DefDirName + "\Request\send_"+string(astr_action.as_action)+string(ll_rwf_id)+"_request"+string(ll_email_id)+".doc"
	
	if  FileExists(ls_download_file) then 
		 FileDelete ( ls_download_file )
	end if //Added By Mark Lee 01/23/2014
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("3. Sending Email, Please wait...")	 
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()		
	lw_ole_word.ole_1.of_getblob( lblb_newdata)	
	lw_ole_word.ole_1.of_writefile( ls_download_file,lblb_newdata)	 
	gnv_shell.of_delete_recent( ls_download_file, true) // Delete Windows Recent Document.			
	
	IF IsValid(lds_export) THEN Destroy lds_export
	IF IsValid(lnv_word) THEN Destroy lnv_word	
	
	//send email
	gb_ShowEmailErrorMessage = True
	
	if isnull(ls_cc_email_address) then ls_cc_email_address = ''
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()	
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("4. Sending Email, Please wait...")		
	if lnv_Mail.of_CreateObject() = -1 then
		of_sent_email_log(ll_rwf_id,ls_action_type+"-Email","Failed to send email to "+ls_to_email_user+". The send email object cannot be use.")
		lw_ole_word.ole_1.of_close( ) 		
		If Isvalid(lw_ole_word) Then Close(lw_ole_word)	
		IF IsValid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
		f_show_message('create Email object','','','','')		
		Return 0
	end if
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("5. Sending Email, Please wait...")
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()	
	gstr_email_info.ss_ctx_id_list = ''
	gstr_email_info.ss_doc_id_list = ''
	ls_errtext = ""
	ls_subject = lstr_email.subject
	if isnull(ls_subject) or trim(ls_subject) ='' then 
		ls_subject = "[Request Name: "+astr_action.as_request_name	+"]"
	else
		ls_subject = ls_subject + "[Request Name: "+astr_action.as_request_name	+"]"
	end if 

	ll_Return = lnv_Mail.of_SendHtml(gs_user_id, ls_to_email_address, ls_cc_email_address, '',ls_subject, lw_ole_word.ole_1, ls_attach_file,false,astr_action.al_ctx_id,0,0)	
	gstr_email_info.ss_ctx_id_list = ''
	gstr_email_info.ss_doc_id_list = ''	
	if ll_Return <> 0 then
		If lnv_Mail.is_sendprotocol = 'SMTP' Then
			f_show_message('error_code_'+string(ll_Return),'%1S%',String(ll_Return),'','')
		Else
			ls_errtext = lnv_Mail.of_getemailerror(ll_Return)
			if isnull(ls_errtext) then ls_errtext = ""
			f_show_message('error_code_'+string(ll_Return),'ALL',ls_errtext,'','')
		End If
		ll_send_result = -1
		ls_errtext = gnv_message.of_get_error_message( ll_Return) + ' ' + ls_errtext		//Added By Mark Lee 10/08/2014
		of_sent_email_log(ll_rwf_id,ls_action_type+"-Email","Failed to send email to "+ls_to_email_user+'. error_code_'+string(ll_Return)+" errtext:"+left(ls_errtext,7000))
		lnv_Mail.of_DeleteObject()	
		lw_ole_word.ole_1.of_close( ) 	
		If Isvalid(lw_ole_word) Then Close(lw_ole_word)			
	end if
	
	IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("6. Sending Email, Please wait...")	
//	ls_attachfilename = gnv_string.of_get_file_name( ls_attach_file, ',') 
	ls_email_type = 'Request '+ls_action_type+' Email'
	ls_computer_info = lnv_Mail.of_get_compute_info( )
	If gnv_data.of_getitem( 'icred_settings', 'use_web_email', False) = '1' Then
		ls_computer_info = ls_computer_info + " By WebServer"
	end if
	
	Insert Into em_mail_audit
	(user_id,mail_from,mail_to,mail_cc,mail_bcc,mail_subject,mail_date,mail_attach_name,mail_template_id,ctx_id_list,doc_id_list,ai_id_list,wf_id,alarm_type,field_name,send_result,error_text,notes,compute_info)
	Values 
	(:gs_user_id,:ls_send_user,:ls_to_email_address,:ls_cc_email_address,'',:ls_subject, getdate(),:ls_attachfilename,:ll_email_id,convert(varchar, :astr_action.al_ctx_id),'0','',null,:ls_email_type,'',:ll_send_result,:ls_errtext,'',:ls_computer_info);
		
	IF IsValid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)	
	if ll_Return <> 0 then Return -1
	lnv_Mail.of_DeleteObject()

	lw_ole_word.ole_1.of_close( ) 		
	If Isvalid(lw_ole_word) Then Close(lw_ole_word)	
	of_sent_email_log(ll_rwf_id,ls_action_type+"-Email","Success to send email to "+ls_to_email_user+". ")
else
	MessageBox("Failed to send email", " There is a empty email template." )	
	return 0
end if 

return 1
end function

public function integer of_get_template_emailinfo (long ai_mail_id, long al_export_id, ref str_dm_email astr_email);Long 		ll_data_length,ll_start
Integer 	li_loops,li_counter
Blob 		lb_data

//Get Email Information
//gnv_appeondb.of_startqueue( )
Select wf_email.email_name,
	wf_email.subject,
	wf_email.attach_name,
	wf_email.email_msg,
	wf_email.export_id,
	Datalength(wf_email.attachment)
	Into :astr_email.name,
	:astr_email.subject,
	:astr_email.attach_name,
	:astr_email.message,
	:al_export_id,
	:ll_data_length
	From wf_email
	Where wf_email.email_id = :ai_mail_id;
	
If appeongetclienttype() = 'PB' And gs_dbtype = 'SQL' And ll_data_length > 0 Then
	If ll_data_length > 8000 Then
		If Mod(ll_data_length,8000) = 0 Then
			li_loops = ll_data_length/8000
		Else
			li_loops = (ll_data_length/8000) + 1
		End If
	Else
		li_loops = 1
	End If
	
	For li_counter = 1 To li_loops
		ll_start = (li_counter - 1) * 8000 + 1
		SelectBlob substring(attachment,:ll_start,8000)
		Into :lb_data
		From wf_email
		Where wf_email.email_id = :ai_mail_id;
		
		astr_email.attach += lb_data
	Next
Else
	SelectBlob attachment
	Into :astr_email.attach
	From wf_email
	Where wf_email.email_id = :ai_mail_id;
End If

return 1

end function

public function integer of_get_template_emailmessage (long al_email_id, ref blob ablb_msgdata);long	ll_DataLen,ll_Cycle,ll_Count,ll_Start
Blob	lb_Temp

long 	READ_ONE_LENGTH = 8000

SELECT Datalength(wf_email.Email_Message)
  INTO :ll_DataLen
  FROM wf_email
 WHERE wf_email.email_id = :al_EMail_Id;

if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_LENGTH then
	ll_Count = Ceiling(ll_DataLen/READ_ONE_LENGTH)
	
	for ll_Cycle = 1 To ll_Count
		ll_Start = (ll_Cycle - 1) * READ_ONE_LENGTH + 1
		SELECTBLOB SubString(Email_Message,:ll_Start,:READ_ONE_LENGTH)
				INTO :lb_Temp
				FROM wf_email
			  WHERE wf_email.email_id = :al_EMail_Id;
		
		ablb_MsgData += lb_Temp
	next
else
	SELECTBLOB Email_Message
			INTO :ablb_MsgData
			FROM wf_email
		  WHERE wf_email.email_id = :al_EMail_Id;
end if

return 1

end function

public function integer of_get_template_email_attachment (long al_email_id, long al_attach_id, ref blob ablb_attachment);//====================================================================
// Function: of_get_template_email_attachment
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value        long    al_email_id
// 	value        long    al_attach_id
// 	reference    blob    ablb_attachment
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/13/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long	ll_DataLen,ll_Cycle,ll_Count,ll_Start
Blob	lb_Temp

long READ_ONE_LENGTH = 8000 

SELECT Datalength(Attachment)
  INTO :ll_DataLen
  FROM wf_email_attachment
 WHERE email_id = :al_EMail_Id AND attach_id = :al_attach_id;

if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_LENGTH then
	ll_Count = Ceiling(ll_DataLen/READ_ONE_LENGTH)
	
	for ll_Cycle = 1 To ll_Count
		ll_Start = (ll_Cycle - 1) * READ_ONE_LENGTH + 1
		SELECTBLOB SubString(Attachment,:ll_Start,:READ_ONE_LENGTH)
		      INTO :lb_Temp
		      FROM wf_email_attachment
		     WHERE email_id = :al_EMail_Id AND attach_id = :al_attach_id;
		
		ablb_Attachment += lb_Temp
	next
else
	SELECTBLOB Attachment
	      INTO :ablb_Attachment
	      FROM wf_email_attachment
	     WHERE email_id = :al_EMail_Id AND attach_id = :al_attach_id;
end if

return 1
end function

public subroutine of_update_msg ();//Added By Mark Lee 11/06/2013	msg_t
long		ll_count
string 	ls_modify

Select count(*)
Into :ll_count
FROM request_webform     
Where  ( CHARINDEX(Upper(:gs_user_id)+';',Upper( submit_request_to ) ) > 0 or Upper(right(submit_request_to,len(:gs_user_id)))= Upper(:gs_user_id)) 
AND (Upper(status) = Upper('Waiting for Approval')) 
using sqlca;

//Select count(*)
//Into :ll_count
//FROM request_webform     
//Where  ( CHARINDEX(Upper(:gs_user_id)+';',Upper( submit_request_to ) ) > 0 or Upper(right(submit_request_to,len(:gs_user_id)))= Upper(:gs_user_id)) 
//AND (Upper(status) = Upper('Waiting for Approval') or 
//			exists (Select distinct 1
//				From request_webform_detail 
//				Where request_webform_detail.rwf_id = request_webform.rwf_id and request_webform_detail.submitted  = 2)
//				)  using sqlca;

il_waiting_approve_count = ll_count

ls_modify  = "msg_t.text='You have "+string(il_waiting_approve_count)+" waiting for approval request(s).' "
if il_waiting_approve_count > 0 then 
	ls_modify = ls_modify +  " msg_t.pointer='HyperLink!' "
else 
	ls_modify = ls_modify +  " msg_t.pointer='Arrow!' "	
end if 

this.tabpage_browse.dw_search.modify( ls_modify )
end subroutine

public subroutine of_sent_email_log (long al_rwf_id, string as_action, string as_note);//====================================================================
// Function: of_sent_email_log
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_rwf_id
// 	value    string    as_action
// 	value    string    as_note
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 03/05/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


if isnull(al_rwf_id) or al_rwf_id <= 0 then return
if isnull(as_action) or trim(as_action) = '' then return

INSERT INTO request_webform_log
           (rwf_id ,notes,user_id,modify_date,action )
     VALUES(	:al_rwf_id, :as_note, :gs_user_id, getdate(), :as_action  ) using sqlca;

if sqlca.sqlcode <> 0 then 
	gnv_debug.of_output(true, 'Sent Request Email Failure: rwf_id = '+string(al_rwf_id)+", Action= "+as_action+", user= "+gs_user_id+", Notes: "  + as_note )
end if 
end subroutine

public subroutine of_create_dw ();//====================================================================
// Function: of_create_dw
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 06-09-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_tab_name,ls_dw_name[],ls_dataobject[]
datawindow ld_dw[]

ls_tab_name = 'tabpage_windows'
ld_dw[1] = tabpage_browse.dw_search
ld_dw[2] = tabpage_browse.dw_list
ld_dw[3] = tabpage_detail.dw_header
ld_dw[4] = tabpage_detail.dw_detail
ld_dw[5] = tabpage_detail.dw_log
ls_dw_name[1] = 'dw_search'
ls_dw_name[2] = 'dw_list'
ls_dw_name[3] = 'dw_header'
ls_dw_name[4] = 'dw_detail'
ls_dw_name[5] = 'dw_log'
ls_dataobject[1] = 'd_request_webform_query'
ls_dataobject[2] = 'd_request_webform_list'
ls_dataobject[3] = 'd_request_webform'
ls_dataobject[4] = 'd_request_webform_detail'
ls_dataobject[5] = 'd_request_webform_log'
f_create_contract_dw(gl_SearchTab_otherwin_View,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)
end subroutine

public subroutine of_set_splitbar_location ();//====================================================================
// Function: of_set_splitbar_location
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 06-11-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String			ls_Option_Value,ls_Option_Value2,ls_Option_Value3
Dec{3}		ldec_Sacle,ldec_Sacle2,ldec_Sacle3
Integer		li_Y,li_Y2,li_x
Boolean 		lb_resize_object = false

ls_Option_Value = gnv_user_option.of_Get_option_value( gs_user_id, "w_request_webform_approve.tab_1.tabpage_browse.st_vsplitbar" )
ls_Option_Value2 = gnv_user_option.of_Get_option_value( gs_user_id, "w_request_webform_approve.tab_1.tabpage_detail.st_vsplitbar2" )
ls_Option_Value3 = gnv_user_option.of_Get_option_value( gs_user_id, "w_request_webform_approve.tab_1.tabpage_detail.st_hsplitbar" )
gnv_string.of_convert_numeric_for_language( ls_Option_Value)	
gnv_string.of_convert_numeric_for_language( ls_Option_Value2)		
gnv_string.of_convert_numeric_for_language( ls_Option_Value3)		
ldec_Sacle = Dec( ls_Option_Value )
ldec_Sacle2 = Dec( ls_Option_Value2 )
ldec_Sacle3 = Dec( ls_Option_Value3 )

li_Y = tabpage_browse.Height * ldec_Sacle
li_Y2 = tabpage_detail.Height * ldec_Sacle2
li_x = tabpage_detail.Width * ldec_Sacle3

If li_Y > 0 Then
//	If tabpage_browse.st_vsplitbar.Y >  li_Y + 4 Or  tabpage_browse.st_vsplitbar.Y <  li_Y - 4 Then
		w_request_webform_approve.SetRedraw(false)
		tabpage_browse.dw_search.Height = li_Y - tabpage_browse.dw_search.y - 4
		tabpage_browse.st_vsplitbar.Y =  li_Y 
		tabpage_browse.dw_list.Y = tabpage_browse.st_vsplitbar.Y + 20
		tabpage_browse.dw_list.Height = tabpage_browse.Height -  tabpage_browse.dw_list.Y  - 10 
		w_request_webform_approve.SetRedraw(true)
		lb_resize_object = true
//	End If		
End If

If li_Y2 > 0 Then
//	If tabpage_detail.st_vsplitbar2.Y >  li_Y2 + 4 Or  tabpage_detail.st_vsplitbar2.Y <  li_Y2 - 4 Then
		w_request_webform_approve.SetRedraw(false)
		tabpage_detail.dw_header.Height = li_Y2 - tabpage_detail.dw_header.y - 4
		tabpage_detail.st_vsplitbar2.Y =  li_Y2 
		tabpage_detail.dw_detail.Y = tabpage_detail.st_vsplitbar2.Y + 20
		tabpage_detail.dw_detail.Height = tabpage_detail.Height -  tabpage_detail.dw_detail.Y  - 10 
		tabpage_detail.dw_log.Y = tabpage_detail.dw_detail.Y
		tabpage_detail.dw_log.Height = tabpage_detail.dw_detail.Height
		w_request_webform_approve.SetRedraw(true)
		lb_resize_object = true
//	End If		
End If

If li_x > 0 Then
//	If tabpage_detail.st_hsplitbar.x >  li_x + 4 Or  tabpage_detail.st_hsplitbar.x <  li_x - 4 Then
		w_request_webform_approve.SetRedraw(false)
		tabpage_detail.dw_detail.width = li_x - tabpage_detail.dw_detail.x - 4
		tabpage_detail.st_hsplitbar.x =  li_x 
		tabpage_detail.dw_log.x = tabpage_detail.st_hsplitbar.x + 20
		tabpage_detail.dw_log.width = tabpage_detail.width -  tabpage_detail.dw_log.x  - 10 
		w_request_webform_approve.SetRedraw(true)
		lb_resize_object = true
//	End If		
End If

If lb_resize_object Then
	of_Set_object_Resize( ) //regist resize object
End If
	
end subroutine

public subroutine of_set_object_resize ();long ll_i
string ls_ObjName

this.of_SetResize (TRUE)

this.tabpage_browse.dw_search.of_setresize( true)

FOR ll_i =  1 TO UPPERBOUND(this.Control)
   this.inv_resize.of_Register (Control[ll_i] , inv_resize.scale)
NEXT

FOR ll_i = 1 TO UPPERBOUND(tabpage_browse.Control)
	ls_ObjName = tabpage_browse.Control[ll_i].ClassName()
//	if ls_ObjName = "pb_attrifilter" or ls_ObjName = "cb_go" or ls_ObjName = "cb_clear" then
//		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.FIXEDRIGHT  )
//	elseif ls_ObjName = "dw_filter" then
//		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.scaleright  )
//	else
		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.scale)
//	end if
NEXT


FOR ll_i = 1 TO UPPERBOUND(tabpage_detail.Control)
	ls_ObjName = tabpage_detail.Control[ll_i].ClassName()
//	if ls_ObjName = "pb_attrifilter" or ls_ObjName = "cb_go" or ls_ObjName = "cb_clear" then
//		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.FIXEDRIGHT  )
//	elseif ls_ObjName = "dw_filter" then
//		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.scaleright  )
//	else
		this.inv_resize.of_Register (tabpage_detail.Control[ll_i], inv_resize.scale)
//	end if
NEXT

end subroutine

public function integer of_set_properties (long al_data_view_id, long al_screen_id, string as_titlebar_visible_def);//====================================================================
// Function: of_set_properties
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_data_view_id
// 	value    long      al_screen_id
// 	value    string    as_titlebar_visible_def
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 06-12-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_Row
string ls_titlebar_text
string ls_boarder_style
string ls_titlebar_visible
datawindow ldw_properties

choose case al_screen_id
	case 61
		ldw_properties = tabpage_browse.dw_search
	case 62
		ldw_properties = tabpage_browse.dw_list
	case 63
		ldw_properties = tabpage_detail.dw_header
	case 64
		ldw_properties = tabpage_detail.dw_detail
	case 65
		ldw_properties = tabpage_detail.dw_log
end choose

// Get screen properties
ll_Row = ids_screen_prop.find("data_view_id = " + String(al_data_view_id) + " and screen_id = " + String(al_screen_id) + "",1,ids_screen_prop.rowcount())
if ll_Row <= 0 then Return -1
ls_titlebar_text = ids_screen_prop.object.titlebar_text[ll_Row]
ls_boarder_style = ids_screen_prop.object.boarder_style[ll_Row]
ls_titlebar_visible = ids_screen_prop.object.titlebar_visible[ll_Row]
if IsNull(ls_titlebar_text) or Len(ls_titlebar_text) = 0 then ls_titlebar_text = ldw_properties.Tag
if IsNull(ls_boarder_style) or Len(ls_boarder_style) = 0 then ls_boarder_style = "stylelowered!"
if IsNull(ls_titlebar_visible) or Len(ls_titlebar_visible) = 0 then ls_titlebar_visible = as_titlebar_visible_def
		
// Set title bar text property
ldw_properties.Title = ls_titlebar_text

// Set title bar visible property
if ls_titlebar_visible = "Y" then
	ldw_properties.TitleBar = true
else
	ldw_properties.TitleBar = false
end if

choose case ls_boarder_style
	case "noborder!"	
		ldw_properties.BorderStyle = stylebox!
		ldw_properties.Border  = False
	case "stylebox!"
		ldw_properties.Border  = TRUE
		ldw_properties.BorderStyle = stylebox!
	case "stylelowered!"
		ldw_properties.Border  = TRUE
		ldw_properties.BorderStyle = stylelowered!
	case "styleraised!"
		ldw_properties.Border  = TRUE
		ldw_properties.BorderStyle = styleraised!
	case "styleshadowbox!"
		ldw_properties.Border  = TRUE
		ldw_properties.BorderStyle = styleshadowbox!
end choose

Return 1
end function

public subroutine of_export_log (long al_row);long 			ll_rwf_id
n_ds			ds_log
string 		ls_CurDir, ls_filename ="", ls_path
integer 		li_return

if not isnull(al_row) and al_row > 0 then
	ll_rwf_id =  w_request_webform_approve.tab_1.tabpage_browse.dw_list.GetItemNumber(al_row,"rwf_id")
	ds_log = Create n_ds
	ds_log.dataobject = "ds_request_webform_log"
	ds_log.settransobject( sqlca)
	ds_log.retrieve( ll_rwf_id)
	
	ls_CurDir = GetCurrentDirectory()

	n_getfilename ln_getfilename
	li_return = ln_getfilename.of_getsavefilename( "Save File", ls_path, ls_filename, "TXT","Text Files (*.TXT),*.TXT" )	
	if li_return > 0 then
		li_return = ds_log.SaveAs(ls_path, Text!	,True)
	end if 
//	li_return = ds_log.SaveAs()
	ChangeDirectory(ls_CurDir)

	Destroy ds_log

//	if not isvalid(this.tabpage_detail.dw_log) or this.tabpage_detail.dw_log.rowcount() <=0 then 
//		of_retrieve()
//	end if 

end if
end subroutine

public subroutine of_retrievedddw (string as_type);DataWindowChild			dwc_user, dwc_request, dwc_export, dwc_category, dwc_template, dwc_submit_request_to
DataWindowChild			dwc_request1, dwc_export1, dwc_category1, dwc_template1
DataWindowChild			dwc_owner_email, dwc_approve_email, dwc_reject_email
DataWindowChild			dwc_owner_email1, dwc_approve_email1, dwc_reject_email1

this.tabpage_browse.dw_list.getchild("request_id", dwc_request)
dwc_request.settransobject(sqlca)

this.tabpage_browse.dw_list.getchild("export_id", dwc_export)
dwc_export.settransobject(sqlca)

this.tabpage_browse.dw_list.getchild("category", dwc_category)
dwc_category.settransobject(sqlca)

this.tabpage_browse.dw_list.getchild("template_id", dwc_template)
dwc_template.settransobject(sqlca)

this.tabpage_browse.dw_list.getchild("owner_email_id", dwc_owner_email)
dwc_owner_email.settransobject(sqlca)

this.tabpage_browse.dw_list.getchild("approve_email_id", dwc_approve_email)
dwc_approve_email.settransobject(sqlca)

this.tabpage_browse.dw_list.getchild("reject_email_id", dwc_reject_email)
dwc_reject_email.settransobject(sqlca)

gnv_appeondb.of_startqueue( )
dwc_request.retrieve( )
dwc_export.retrieve( )
dwc_category.retrieve( )
dwc_template.retrieve( )
dwc_owner_email.retrieve( )									//Added By Mark Lee 12/09/2015
gnv_appeondb.of_commitqueue( )


if dwc_owner_email.rowcount( ) >0 then 
	dwc_owner_email.rowscopy( 1, dwc_owner_email.rowcount( ), Primary!, dwc_approve_email, 1, Primary!)
	dwc_owner_email.rowscopy( 1, dwc_owner_email.rowcount( ), Primary!, dwc_reject_email, 1, Primary!)
end if 

if not isnull(as_type ) and upper(as_type ) = 'ALL' then 
	this.tabpage_browse.dw_search.getchild("request_id", dwc_request1)
	dwc_request1.settransobject(sqlca)
	
	this.tabpage_browse.dw_search.getchild("export_id", dwc_export1)
	dwc_export1.settransobject(sqlca)
	
	this.tabpage_browse.dw_search.getchild("category", dwc_category1)
	dwc_category1.settransobject(sqlca)
	
	this.tabpage_browse.dw_search.getchild("template_id", dwc_template1)
	dwc_template1.settransobject(sqlca)
	
	this.tabpage_browse.dw_search.getchild("owner_email_id", dwc_owner_email1)
	dwc_owner_email1.settransobject(sqlca)
	
	this.tabpage_browse.dw_search.getchild("approve_email_id", dwc_approve_email1)
	dwc_approve_email1.settransobject(sqlca)
	
	this.tabpage_browse.dw_search.getchild("reject_email_id", dwc_reject_email1)
	dwc_reject_email1.settransobject(sqlca)
	
	this.tabpage_browse.dw_search.getchild("owner_user", dwc_user)
	dwc_user.settransobject(sqlca)
	dwc_user.retrieve( )
	
	this.tabpage_browse.dw_search.getchild("submit_request_to", dwc_submit_request_to)
	dwc_submit_request_to.settransobject(sqlca)
	dwc_submit_request_to.reset( )
	if dwc_user.rowcount( ) >0 then 
		dwc_user.rowscopy( 1, dwc_user.rowcount( ), Primary!, dwc_submit_request_to, 1, Primary!)
	end if 

	if dwc_request.rowcount() > 0 then
		dwc_request.rowscopy( 1, dwc_request.rowcount( ), Primary!, dwc_request1, 1, Primary!)
	end if 
	
	if dwc_export.rowcount() > 0 then
		dwc_export.rowscopy( 1, dwc_request.rowcount( ), Primary!, dwc_export1, 1, Primary!)
	end if 
	
	if dwc_category.rowcount() > 0 then
		dwc_category.rowscopy( 1, dwc_request.rowcount( ), Primary!, dwc_category1, 1, Primary!)
	end if 
	
	if dwc_template.rowcount() > 0 then
		dwc_template.rowscopy( 1, dwc_request.rowcount( ), Primary!, dwc_template1, 1, Primary!)
	end if 
	
	if dwc_owner_email.rowcount( ) >0 then 
		dwc_owner_email.rowscopy( 1, dwc_owner_email.rowcount( ), Primary!, dwc_owner_email1, 1, Primary!)
		dwc_owner_email.rowscopy( 1, dwc_owner_email.rowcount( ), Primary!, dwc_approve_email1, 1, Primary!)
		dwc_owner_email.rowscopy( 1, dwc_owner_email.rowcount( ), Primary!, dwc_reject_email1, 1, Primary!)
	end if 

End if 
end subroutine

public function boolean of_enable_action (long al_rwf_id, string as_status, string as_submit, long al_steps, string as_submit_step, string as_bypass);//====================================================================
// Function: of_enable_action
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_rwf_id
// 	value    string    as_status
// 	value    string    as_submit
// 	value    long      al_steps
// 	value    string    as_submit_step
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 11/25/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
// approve // reject
//====================================================================
boolean 			bln_return = false
long				ll_count, ll_doc_count


if isnull(al_rwf_id) or al_rwf_id <= 0 then  return bln_return

if  (isnull(as_bypass) or as_bypass = 'N') then 
	if not isnull(al_steps) and al_steps = 1 then 
		if not isnull(as_submit_step) and upper(trim(as_submit_step)) = 'C' then 
			bln_return = false
		else
			ll_count  = 0 
			ll_doc_count = 0 
			gnv_appeondb.of_startqueue( )
			Select count(1)
			Into :ll_count 
			From request_webform_detail 
			Where rwf_id = :al_rwf_id and submitted  = 2 ;
			
			Select count(1)
			Into :ll_doc_count 
			From request_webform_document 
			Where rwf_id = :al_rwf_id and submitted  = 2 ;
			gnv_appeondb.of_commitqueue( )			
			if ll_count + ll_doc_count > 0 then 
				bln_return = true						
			else 
				bln_return = false
			end if 
		end if 
	else
		if (	not isnull(as_status) and lower(as_status) = lower("Waiting for Approval") )  &
			and  (not isnull(as_submit) and (pos(Upper(as_submit), Upper(gs_user_id)+";") > 0 or right(Upper(as_submit), len(gs_user_id) ) = Upper(gs_user_id)  ) ) then
			bln_return = true											
		else
			bln_return = false
		end if 
	end if 
end if 
return bln_return
end function

public function integer of_retrieve (long al_rwf_id);long		ll_rwf_id

if w_Mdi.of_security_access(6993) = 0 then 
	this.tabpage_detail.dw_header.modify("b_approve.visible =0 b_reject.visible =0 ")
else
	this.tabpage_detail.dw_header.modify("b_approve.visible =1 b_reject.visible =1 ")	
end if 

if isnull(al_rwf_id) or al_rwf_id <=0 then 
	if this.tabpage_browse.dw_list.rowcount( ) <=0 then
		this.tabpage_detail.dw_header.reset( )
		this.tabpage_detail.dw_detail.reset( )
		this.tabpage_detail.dw_log.reset( )				
		return 0
	end if 
	
	ll_rwf_id = this.tabpage_browse.dw_list.GetItemNumber( this.tabpage_browse.dw_list.getrow( )	,"rwf_id")
	if isnull(ll_rwf_id) or ll_rwf_id <= 0 then 
		this.tabpage_detail.dw_header.reset( )
		this.tabpage_detail.dw_detail.reset( )
		this.tabpage_detail.dw_log.reset( )		
		return 0		
	end if 
else 
	ll_rwf_id  = al_rwf_id
end if 

this.tabpage_detail.dw_header.Settransobject( sqlca)
this.tabpage_detail.dw_detail.Settransobject( sqlca)		
this.tabpage_detail.dw_log.Settransobject( sqlca)	

//		gnv_appeondb.of_startqueue( )
this.tabpage_detail.dw_header.Retrieve(ll_rwf_id )
this.tabpage_detail.dw_detail.Retrieve(ll_rwf_id )
this.tabpage_detail.dw_log.Retrieve(ll_rwf_id )			
//		gnv_appeondb.of_commitqueue( )		//Added By Mark Lee 12/01/2014	APB bug, use the dw_detail datawindow retrieve data, some data can't display in it.

return 1
end function

public subroutine of_delete (long al_row);//====================================================================
// Event: of_delete
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long       al_row
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 04/20/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string			ls_request_name
long			ll_rwf_id
integer		li_return
if isnull(al_row) or al_row <=0 then return

ls_request_name = this.tabpage_browse.dw_list.GetItemString(al_row,"request_name")
ll_rwf_id = this.tabpage_browse.dw_list.GetItemNumber(al_row,"rwf_id")

li_return = messagebox(gnv_app.iapp_object.DisplayName,"Are you sure you want to delete this request ( "+ls_request_name+" ) ?" ,Question!, YesNo!) 
if li_return =1 then 
	Update request_webform
	set status =  'Deleted'
	Where rwf_id = :ll_rwf_id;
	
	if sqlca.sqlcode <> 0 then 	
		messagebox(gnv_app.iapp_object.DisplayName," Failed to delete the request ( "+ls_request_name+" ). ~r~n~r~n"+"errtext: " +sqlca.sqlerrtext)
		gnv_debug.of_output(true, 'Deleted Request Failure: rwf_id = '+string(ll_rwf_id)+", Request Name= "+ls_request_name+", user= "+gs_user_id+", errtext: " +sqlca.sqlerrtext )
	else
		this.tabpage_browse.dw_list.deleterow(al_row)	
		if this.tabpage_browse.dw_list.rowcount( ) >0 then 
			this.tabpage_browse.dw_list.setfocus( )
			this.tabpage_browse.dw_list.scrolltorow(1)
			this.tabpage_browse.dw_list.selectrow( 1, true)			
			ll_rwf_id = this.tabpage_browse.dw_list.GetItemNumber(1,"rwf_id")
			of_retrieve(ll_rwf_id)
		else
			of_retrieve(0)
		end if 							
		of_update_msg()			//update message 
		of_retrievedddw('ALL')	
	end if 

end if 
end subroutine

public function integer of_trigger_workflow (long al_ctx_id, boolean abn_new);long			ll_category,ll_status_id, ll_view_id, ll_screen[]
string			ls_updateCol[]

if isnull(al_ctx_id) or al_ctx_id = 0 then return 0

Select ctx_basic_info.category, ctx_basic_info.status, code_lookup.ic_n
Into :ll_category, :ll_status_id, :ll_view_id
From 	ctx_basic_info 
	left join code_lookup on ctx_basic_info.category = code_lookup.lookup_code and code_lookup.lookup_name = 'Contract Category'
Where  ctx_id = :al_ctx_id ;

//Get Screen ID List
ll_screen[1] = 3 //long(gnv_data.of_getitem("ctx_screen" , "screen_id" , "tab_name='tabpage_details' and dw_name='dw_1' and dataobject='d_contract_det_master'"))
ll_screen[2] = 5 //long(gnv_data.of_getitem("ctx_screen" , "screen_id" , "tab_name='tabpage_details' and dw_name='dw_contract_dates' and dataobject='d_contract_det_master_2'"))
ll_screen[3] = 8 //long(gnv_data.of_getitem("ctx_screen" , "screen_id" , "tab_name='tabpage_details' and dw_name='dw_1' and dataobject='d_contract_det_notes'"))
ll_screen[4] = 9 //long(gnv_data.of_getitem("ctx_screen" , "screen_id" , "tab_name='tabpage_details' and dw_name='dw_1' and dataobject='d_contract_det_custom'"))
ll_screen[5] = 4 //long(gnv_data.of_getitem("ctx_screen" , "screen_id" , "tab_name='tabpage_details' and dw_name='dw_products' and dataobject='d_ctx_products'"))
ll_screen[6] = 7 //long(gnv_data.of_getitem("ctx_screen" , "screen_id" , "tab_name='tabpage_details' and dw_name='dw_occ' and dataobject='d_contract_det_contact_external'"))
ll_screen[7] = 6 //long(gnv_data.of_getitem("ctx_screen" , "screen_id" , "tab_name='tabpage_details' and dw_name='dw_ccc' and dataobject='d_contract_det_contact_external'"))
ll_screen[8] = 10 // for Details-> Custom 2 screen					//Added By Mark Lee 10/10/2015
ll_screen[9] = 53 //Added By Ken.Guo 2016-02-22 header->header
ll_screen[10] = 55 //Added By Ken.Guo 2016-02-22 detail->detail
ll_screen[11] = 51 //Added By Ken.Guo 2016-02-22 add document properties
ll_screen[12] = 52 //Added By Ken.Guo 2016-02-22 create document properties


if Not isvalid( w_infodisp ) then open(w_infodisp)
if isvalid(w_infodisp) then w_infodisp.title = "WorkFlow Triggers"
if isvalid(w_infodisp) then w_infodisp.Center = TRUE
if isvalid(w_infodisp) then w_infodisp.st_complete.visible = false
if isvalid(w_infodisp) then w_infodisp.st_3.visible = false
if isvalid(w_infodisp) then w_infodisp.st_information.visible = false
if isvalid(w_infodisp) then w_infodisp.st_1.text =  'Contract ID:'+string(al_ctx_id)+' Modification:' +string(1) +' of '+ string(2) +', Please stand by!'
if isvalid(w_infodisp) then w_infodisp.wf_set_min_max(1,2)

n_cst_workflow_triggers lnv_workflow
lnv_workflow = create n_cst_workflow_triggers
if abn_new = true then
	lnv_workflow.of_trigger_for_ctx( al_ctx_id, ll_category , ll_status_id )								//create new record.
end if 
if isvalid(w_infodisp) then w_infodisp.wf_step_pbar(1)	
if isvalid(w_infodisp) then w_infodisp.st_1.text =  'Contract ID:'+string(al_ctx_id)+' Modification:' +string(2) +' of '+ string(2) +', Please stand by!'
lnv_workflow.of_data_value_comparision(ll_view_id, ll_screen, ls_updateCol,al_ctx_id, 0, '03', 'I','S')

//Added By Ken.Guo 2016-02-25
Long ll_doc_id,i
n_ds lds_doc
lds_doc = create n_ds
lds_doc.dataobject = 'd_ctx_doc_data'
lds_doc.settransobject(sqlca)
lds_doc.retrieve(al_ctx_id)
For i = 1 To lds_doc.rowcount()
	ll_doc_id = lds_doc.getitemnumber(i, 'doc_id')
	lnv_workflow.of_data_value_comparision(ll_view_id, ll_screen, al_ctx_id, ll_doc_id, '04', 'I')
Next

destroy lnv_workflow
if isvalid(w_infodisp) then close(w_infodisp)	

return 1 
end function

public function integer of_rejected_request (long al_rwf_id, string as_reject_step, string as_steps_mark, string as_submit_step, string as_msg, string as_title, long al_ctx_id);//====================================================================
// Function: of_rejected_request
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_rwf_id
// 	value    string    as_reject_step
// 	value    string    as_steps_mark
// 	value    string    as_submit_step
// 	value    string    as_msg
// 	value    string    as_title
// 	value    long      al_ctx_id
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 08/11/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
// differ table relation
// request status 													submitted										updated
//				Draft														0													null	
//				Submitted												2 / null(old data)								N	
//				Submitted + Bypass Approval Process 			1													N
//				rejected 													-1													N
//				Approved												4													Y
//				Approved + Bypass Approval Process				3 													Y
//====================================================================

integer 	li_return , li_n
string		ls_sql[], ls_ctx_id, ls_err

li_n = 0 
li_n = li_n  + 1 
if isnull(as_reject_step) or trim(as_reject_step) = '' or isnull(as_submit_step) or trim(as_submit_step) = '' then
	ls_sql[li_n] = " Update request_webform Set status = 'Rejected', submit_step ='' , reject_step = '' Where rwf_id ="+string(al_rwf_id) + " ; "
else
	ls_sql[li_n] = " Update request_webform Set status = 'Rejected', submit_step = '"+as_submit_step+"' , reject_step = '"+as_reject_step+"' Where rwf_id ="+string(al_rwf_id) + " ; "
end if 

li_n = li_n  + 1 
if isnull(as_steps_mark) or trim(as_steps_mark) = '' then
	ls_sql[li_n] = " Update request_webform_detail Set submitted = -1 where (submitted is null or submitted = 2 ) and (updated is null or updated = 'N') and  rwf_id ="+string(al_rwf_id)+" ; "
	// when the request be use old data with no steps, then it will be update all the documents.
	li_n = li_n  + 1 
	ls_sql[li_n] = " Update request_webform_document Set submitted = -1 where (submitted is null or submitted = 2 ) and (updated is null or updated = 'N') and  rwf_id ="+string(al_rwf_id)+" ; "		
else
	ls_sql[li_n] = " Update request_webform_detail Set submitted = -1 where (submitted is null or submitted = 2 ) and (updated is null or updated = 'N') and  rwf_id ="+string(al_rwf_id)+" and steps_mark in ("+as_steps_mark+") ; "
	//if reject the request documents, then update request_webform_document table value.
	if pos(as_steps_mark,'-999') > 0 then 						
		li_n = li_n  + 1 
		ls_sql[li_n] = " Update request_webform_document Set submitted = -1 where (submitted is null or submitted = 2 ) and (updated is null or updated = 'N') and  rwf_id ="+string(al_rwf_id)+" and steps_mark in ("+as_steps_mark+") ; "		
	end if 
end if 
				
ls_ctx_id = string(al_ctx_id)
if isnull(ls_ctx_id) then ls_ctx_id ="0"
li_n = li_n  + 1 
ls_err = as_msg 					
ls_err = gnv_string.of_globalreplace(ls_err, "'", '"')		//replace ' to " .   			//Added By Mark Lee 07/27/2016 for next ' symbol in the sql sentence.
if not isnull(ls_err) and len(ls_err) > 8000 then ls_err = left(ls_err, 8000)			//Added By Mark Lee 12/07/2015
ls_sql[li_n] = " INSERT INTO request_webform_log  (rwf_id,notes ,user_id,modify_date ,action, ctx_id) Values("+string(al_rwf_id)+", '"+ls_err+"', '"+gs_user_id+"', getdate(), 'Rejected', "+ls_ctx_id+") ; "

li_return = gnv_string.of_execute_sql( ls_sql, as_title, "error", true)

return li_return

		
end function

public subroutine of_open_ctx (long al_data_id, integer ai_steps);int					li_count = 0 
str_dashboard 	str_para
long				ll_find

if (isnull(al_data_id) or al_data_id <= 0 ) then return 						//0				//Added By Mark Lee 09/02/2015

str_para.data_id = al_data_id

select count(1) 
Into :li_count
from ctx_basic_info 
where ctx_id > 0  and ctx_id = :al_data_id 
using sqlca;

if (li_count = 0 ) or sqlca.sqlcode <> 0   then
	messagebox(gnv_app.iapp_object.DisplayName,"This contract Id ("+string(al_data_id)+") has been deleted, so you cannot open it.")
//	return 0											//Added By Mark Lee 09/02/2015		Task 361:Request Module 
	return 
end if 

if IsValid(gw_contract) then	
	//Added By Mark Lee 11/06/2014
	ll_find=gw_contract.tab_contract_details.tabpage_search.dw_search_det1.find("ctx_id="+string(al_data_id), 1, gw_contract.tab_contract_details.tabpage_search.dw_search_det1.rowcount())
	if ll_find <=0  or ( not isnull(ai_steps) and ai_steps = 1)   then
		gw_contract.tab_contract_details.tabpage_search.ib_retriev_detail = true
		gw_contract.tab_contract_details.tabpage_search.dw_search.Reset()						//Added By Mark Lee 10/10/2015 clean the old ctx data for new search.
		gw_contract.tab_contract_details.tabpage_search.dw_search.InsertRow(0)
		
		gw_contract.tab_contract_details.of_set_ib_retrieved_dddw( false)												//Added By Mark Lee 07/29/2015
	end if
	gw_contract.of_Dashboard(str_para.data_id)
	gw_contract.setfocus( ) 																											//Added By Mark Lee 09/28/2015  change the focus.
else
	gf_OpenContractFolder(str_para)
end if

//Return 1										//Added By Mark Lee 09/02/2015			Task 361:Request Module 
return 
end subroutine

public subroutine of_display_label (string as_category);//Added By Mark Lee 10/09/2015
long				ll_row
string 			ls_data_view_label

//if isnull(as_category) or trim(as_category) = "" then 
//	return
//end if 


ll_row = this.tabpage_detail.dw_detail.getselectedrow( 0)
ls_data_view_label = string(this.tabpage_detail.dw_detail.GetItemString( ll_row, "col_label" ))

if isnull(ls_data_view_label) then ls_data_view_label = ''
OpenWithParm( w_mle_text, "$readonly$"+"$<t***>"+"Label "+"<t***>$"+ls_data_view_label)
end subroutine

public function long of_use_template (long al_template_id);// all ctx_id variable need to use long type.  by gavins 20161012
long	ll_new_ctx_id
n_cst_copy_ctx lnv_copy_ctx

if isnull(al_template_id)  or al_template_id <= 0 then 
	return 0
end if 

lnv_copy_ctx = Create n_cst_copy_ctx

//Copy CTX from Template
ll_new_ctx_id = lnv_copy_ctx.of_copy_ctx_from_template(al_template_id, 'request' )
If ll_new_ctx_id < 0 Then
	Messagebox('Error','Failed to create contract from the template, please call support.')
	If isvalid(lnv_copy_ctx) Then Destroy lnv_copy_ctx
	Return -1
End If

If isvalid(lnv_copy_ctx) Then Destroy lnv_copy_ctx

return ll_new_ctx_id

end function

on u_tab_request_webform.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_browse
this.Control[iCurrent+2]=this.tabpage_detail
end on

on u_tab_request_webform.destroy
call super::destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
end on

event constructor;call super::constructor;long 		ll_i
String	ls_ObjName

this.of_SetResize (TRUE)

this.tabpage_browse.dw_search.of_setresize( true)
//this.tabpage_browse.dw_search.inv_resize.of_setorigsize( this.tabpage_browse.dw_search.width,this.tabpage_browse.dw_search.height)
//this.tabpage_browse.dw_search.inv_resize.of_setminsize( this.tabpage_browse.dw_search.width,this.tabpage_browse.dw_search.height)
//
FOR ll_i =  1 TO UPPERBOUND(this.Control)
   this.inv_resize.of_Register (Control[ll_i] , inv_resize.scale)
NEXT

FOR ll_i = 1 TO UPPERBOUND(tabpage_browse.Control)
	ls_ObjName = tabpage_browse.Control[ll_i].ClassName()
//	if ls_ObjName = "pb_attrifilter" or ls_ObjName = "cb_go" or ls_ObjName = "cb_clear" then
//		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.FIXEDRIGHT  )
//	elseif ls_ObjName = "dw_filter" then
//		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.scaleright  )
//	else
		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.scale)
//	end if
NEXT


FOR ll_i = 1 TO UPPERBOUND(tabpage_detail.Control)
	ls_ObjName = tabpage_detail.Control[ll_i].ClassName()
//	if ls_ObjName = "pb_attrifilter" or ls_ObjName = "cb_go" or ls_ObjName = "cb_clear" then
//		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.FIXEDRIGHT  )
//	elseif ls_ObjName = "dw_filter" then
//		this.inv_resize.of_Register (tabpage_browse.Control[ll_i], inv_resize.scaleright  )
//	else
		this.inv_resize.of_Register (tabpage_detail.Control[ll_i], inv_resize.scale)
//	end if
NEXT
//
//this.tabpage_browse.dw_search.inv_resize.of_SetDetailHeight(true)

end event

event selectionchanged;call super::selectionchanged;


If NewIndex = 2 then
	of_retrieve(0)
end if 
end event

event resize;call super::resize;post of_Set_SplitBar_Location( ) //Added By Jay Chen 06-13-2014
end event

type tabpage_browse from userobject within u_tab_request_webform
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 4082
integer height = 2280
long backcolor = 79741120
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_vsplitbar st_vsplitbar
dw_list dw_list
dw_search dw_search
end type

on tabpage_browse.create
this.st_vsplitbar=create st_vsplitbar
this.dw_list=create dw_list
this.dw_search=create dw_search
this.Control[]={this.st_vsplitbar,&
this.dw_list,&
this.dw_search}
end on

on tabpage_browse.destroy
destroy(this.st_vsplitbar)
destroy(this.dw_list)
destroy(this.dw_search)
end on

type st_vsplitbar from u_st_splitbar within tabpage_browse
integer y = 780
integer width = 4078
end type

event constructor;call super::constructor;//Added By Jay Chen 06-11-2014  regist split bar
tabpage_browse.st_vsplitbar.of_register( tabpage_browse.dw_search, 3 )
tabpage_browse.st_vsplitbar.of_register( tabpage_browse.dw_list, 4 )
tabpage_browse.st_vsplitbar.of_SetMinobjectsize( 300 )
end event

event mousemove;call super::mousemove;//Added By Jay Chen 06-11-2014
gnv_user_option.of_Set_option_value( gs_user_id, "w_request_webform_approve.tab_1.tabpage_browse.st_vsplitbar",string( this.y / tabpage_browse.height ) )
end event

type dw_list from u_dw within tabpage_browse
event ue_dwsyscommand pbm_syscommand
event ue_populatedddw ( )
event ue_set_sort ( integer xpos,  integer ypos,  long row,  dwobject dwo,  string as_sort_column )
event type string ue_replace_sort ( string as_sort )
string tag = "Request Form Browse"
integer y = 796
integer width = 4078
integer height = 1480
integer taborder = 20
boolean titlebar = true
string title = "Request Form Browse"
string dataobject = "d_request_webform_list"
boolean controlmenu = false
boolean hscrollbar = true
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbfocuschange = false
end type

event ue_dwsyscommand;if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if
end event

event ue_populatedddw();//====================================================================
// Event: ue_populatedddw
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 06-10-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

datawindowchild ldwc1,ldwc2,ldwc3,ldwc4

this.getchild("request_id", ldwc1)
ldwc1.settransobject(sqlca)

this.getchild("export_id", ldwc2)
ldwc2.settransobject(sqlca)

this.getchild("category", ldwc3)
ldwc3.settransobject(sqlca)

this.getchild("template_id", ldwc4)
ldwc4.settransobject(sqlca)

gnv_appeondb.of_startqueue( )
ldwc1.retrieve( )
ldwc2.retrieve( )
ldwc3.retrieve( )
ldwc4.retrieve( )
gnv_appeondb.of_commitqueue( )
end event

event ue_set_sort(integer xpos, integer ypos, long row, dwobject dwo, string as_sort_column);//====================================================================
// Event: ue_set_sort
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    integer     xpos
// 	value    integer     ypos
// 	value    long        row
// 	value    dwobject    dwo
// 	value    string      as_sort_column
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/09/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_i,ll_rwf_id,ll_findrow
long ll_master_contract_id,ll_master_cnt
string ls_sort_column, ls_sort
String ls_sort_syntax

this.setredraw(false)

this.of_setsort( true)
If IsValid (inv_Sort) Then 
	inv_Sort.of_setcolumnheader(True)
	inv_Sort.of_setusedisplay(True)
	inv_Sort.of_build_click_sort_syntax( xpos, ypos, row, dwo )
End If

If GetRow() > 0 Then ll_rwf_id = This.GetItemNumber(GetRow(),'rwf_id')

this.SetSort(this.inv_sort.of_getsort())		 
//ls_sort = this.event ue_replace_sort( this.inv_sort.of_getsort())
//this.SetSort(ls_sort)
This.sort()

ll_findrow = This.Find('rwf_id = ' + String(ll_rwf_id),1, This.RowCount())
If ll_findrow > 0 Then
	this.SetRow(ll_findrow)
	this.ScrollToRow(ll_findrow)
	this.event rowfocuschanged(ll_findrow)
Else
	If Rowcount( ) > 0 Then this.event rowfocuschanged(1)
End If

//this.of_setsort( false)
this.setredraw(true)

end event

event type string ue_replace_sort(string as_sort);//====================================================================
// Event: ue_replace_sort
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_sort
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/09/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//LookUpDisplay(status) A
Integer li_pos,i
String ls_replace_syntax[],ls_replace_syntax_web[],ls_value[]

// 'request_id','export_id','category','template_id','owner_email_id','approve_email_id','reject_email_id'
ls_replace_syntax[1] = "lookupdisplay(request_id)"
ls_replace_syntax[2] = "lookupdisplay(export_id)"
ls_replace_syntax[3] = "lookupdisplay(category)"
ls_replace_syntax[4] = "lookupdisplay(template_id)"
ls_replace_syntax[5] = "lookupdisplay(owner_email_id)"
ls_replace_syntax[6] = "lookupdisplay(approve_email_id)"
ls_replace_syntax[7] = "lookupdisplay(reject_email_id)"

ls_replace_syntax_web[1] = "lookupdisplay ( request_id )"
ls_replace_syntax_web[2] = "lookupdisplay ( export_id )"
ls_replace_syntax_web[3] = "lookupdisplay ( category )"
ls_replace_syntax_web[4] = "lookupdisplay ( template_id )"
ls_replace_syntax_web[5] = "lookupdisplay ( owner_email_id )"
ls_replace_syntax_web[6] = "lookupdisplay ( approve_email_id )"
ls_replace_syntax_web[7] = "lookupdisplay ( reject_email_id )"

ls_value[1] = "request_name"
ls_value[2] = "export_name"
ls_value[3] = "category_name"
ls_value[4] = "template_name"
ls_value[5] = "owner_email_name"
ls_value[6] = "approve_email_name"
ls_value[7] = "reject_email_name"

as_sort = Lower(as_sort)

For i = 1 To UpperBound(ls_replace_syntax_web[])
	li_pos = Pos(as_sort, ls_replace_syntax_web[i] ) 
	If li_pos > 0 Then
		as_sort = Replace(as_sort,li_pos,len(ls_replace_syntax_web[i]),ls_value[i])
	End If
Next

For i = 1 To UpperBound(ls_replace_syntax[])
	li_pos = Pos(as_sort, ls_replace_syntax[i] ) 
	If li_pos > 0 Then
		as_sort = Replace(as_sort,li_pos,len(ls_replace_syntax[i]),ls_value[i])
	End If
Next	

Return as_sort

end event

event constructor;call super::constructor;this.of_SetUpdateAble(false)
this.of_setrowselect( true)

////Added By Mark Lee 10/21/2015
//This.of_SetSort(True)
//This.inv_sort.of_SetStyle(3)
//This.inv_sort.of_SetColumnDisplayNameStyle( 2 )
////This.of_SetFilter(True)
////This.inv_Filter.of_SetStyle(1)
//This.inv_sort.of_SetColumnHeader(True)
This.of_SetSort(false)						//Added By Mark Lee 12/09/2015

this.of_setresize(true)
this.inv_resize.of_setorigsize( this.width,this.height)
this.inv_resize.of_setminsize( this.width,this.height)
this.inv_resize.of_register(this.inv_resize.scale)
this.inv_resize.of_SetDetailHeight(true)

is_origin_sql = this.describe( "Datawindow.table.select")



end event

event doubleclicked;call super::doubleclicked;if row > 0 then 
	u_tab_request_webform lu_tab_request_webform
	lu_tab_request_webform = Parent.Getparent( )
	IF Isvalid(lu_tab_request_webform) THEN
		lu_tab_request_webform.selecttab( 2 )
	END IF

//	of_retrieve()
end if 
end event

event rbuttondown;call super::rbuttondown;m_request_webform_action			m_action
string										ls_status,	ls_submit,	ls_submit_step, ls_bypass
long										ll_steps,		ll_count,		ll_rwf_id
boolean									lbn_action

if row >0 and  w_Mdi.of_security_access(6993) = 1 then 
	
	m_action = create m_request_webform_action
	
	ll_rwf_id = this.GetItemNumber( row, "rwf_id" )
	ls_status = this.GetItemString( row, "status" )
	ls_submit = this.GetItemString( row , "submit_request_to")
	ll_steps = this.GetItemNumber( row , "steps")
	ls_submit_step = this.GetItemString( row , "submit_step")	
	ls_bypass = this.GetItemString( row , "bypass")
		
	lbn_action =	 of_enable_action( ll_rwf_id, ls_status, ls_submit, ll_steps,ls_submit_step,ls_bypass)
	if lbn_action = true then 
		m_action.m_approve.enabled = True		
		m_action.m_reject.enabled = True	
	else
		m_action.m_approve.enabled = false		
		m_action.m_reject.enabled = false
	end if

	if w_Mdi.of_security_access(7015) = 0 then 
		m_action.m_delete.enabled = false
	else
		m_action.m_delete.enabled = true	
	end if 
	
	m_action.m_approve.tag = string(row)
	m_action.m_reject.tag = string(row)	
	m_action.m_export_log.tag = string(row)	
	m_action.m_delete.tag = string(row)	
	m_action.Popmenu( w_mdi.PointerX() , w_mdi.PointerY())

	destroy m_request_webform_action
end if 
end event

event getfocus;call super::getfocus;il_current_screen = 62 //Added By Jay Chen 06-09-2014
end event

event clicked;
if IsValid (inv_RowSelect) then inv_RowSelect.Event pfc_clicked ( xpos, ypos, row, dwo )

//Added By Mark Lee 12/09/2015
//$<reason> Fix a defect.
string ls_objectname,ls_sort_column
ls_objectname = string(dwo.name) 

If row = 0 and this.describe(ls_objectname+".band") = "header" and this.describe(ls_objectname + ".text") <> "!" Then 
	ls_sort_column = left(ls_objectname,len(ls_objectname) - 2)
	this.event ue_set_sort(xpos,ypos,row,dwo,ls_sort_column)
End If
end event

type dw_search from u_dw within tabpage_browse
event ue_dwsyscommand pbm_syscommand
string tag = "Search Criteria"
integer width = 4078
integer height = 776
integer taborder = 10
boolean titlebar = true
string title = "Search Criteria"
string dataobject = "d_request_webform_query"
boolean controlmenu = false
boolean vscrollbar = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbfocuschange = false
end type

event ue_dwsyscommand;if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if
end event

event constructor;call super::constructor;this.of_SetUpdateAble(false)
this.of_setdropdowncalendar( true) //Added By Jay Chen 06-10-2014
this.of_setresize(true)
this.inv_resize.of_setorigsize( this.width,this.height)
this.inv_resize.of_setminsize( this.width,this.height)
this.inv_resize.of_register(this.inv_resize.scale)
this.inv_resize.of_SetDetailHeight(true)

this.event pfc_addrow( )


end event

event buttonclicked;call super::buttonclicked;if row <= 0 then return


choose case dwo.name
	case 'b_clear'
		this.reset( )
		this.insertrow( 0)
		of_update_msg()			//update message 
		of_retrievedddw('ALL')	//Added By Mark Lee 11/05/2014 update all ddw data.	
	case 'b_search'
		this.accepttext( )											//Added By Mark Lee 10/21/2015
		SetPointer(HourGlass!)
		of_search()
		of_update_msg()			//update message 
		SetPointer(Arrow!)
end choose 


end event

event pfc_preinsertrow;call super::pfc_preinsertrow;datawindowchild ldwc_child
string 		ls_err

//ls_err = this.Modify("category.dddw.name = 'd_dddw_user_access_category'")
this.GetChild( "category",ldwc_child)
ldwc_child.SetTransobject( sqlca)
//if ldwc_child.Retrieve( "Contract Category") < 1 then ldwc_child.Insertrow( 0)
if ldwc_child.Retrieve( ) < 1 then ldwc_child.Insertrow( 0)


return success
end event

event pfc_postinsertrow;call super::pfc_postinsertrow;of_update_msg()			//update message 
end event

event doubleclicked;call super::doubleclicked;//if row <= 0 then return 
//
//if dwo.name = "msg_t" then 
//	this.dynamic Trigger Event buttonclicked(row,0,this.object.b_clear)	
//	this.SetItem( row,"status", 'Waiting for Approval')
//	this.SetItem( row,"submit_request_to", gs_user_id)
//	this.dynamic Trigger Event buttonclicked(row,0,this.object.b_search)	
//end if 
end event

event clicked;call super::clicked;if row <= 0 then return 

if dwo.name = "msg_t" and il_waiting_approve_count > 0 then 
	this.dynamic Trigger Event buttonclicked(row,0,this.object.b_clear)	
	this.SetItem( row,"status", 'Waiting for Approval')
	this.SetItem( row,"submit_request_to", gs_user_id)
	this.dynamic Trigger Event buttonclicked(row,0,this.object.b_search)	
end if 
end event

event getfocus;call super::getfocus;il_current_screen = 61 //Added By Jay Chen 06-09-2014
end event

event itemerror;call super::itemerror;return 3 // Reject the data value but allow focus to change
end event

type tabpage_detail from userobject within u_tab_request_webform
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 4082
integer height = 2280
long backcolor = 79741120
string text = "Details"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_hsplitbar st_hsplitbar
st_vsplitbar2 st_vsplitbar2
dw_log dw_log
dw_detail dw_detail
dw_header dw_header
end type

on tabpage_detail.create
this.st_hsplitbar=create st_hsplitbar
this.st_vsplitbar2=create st_vsplitbar2
this.dw_log=create dw_log
this.dw_detail=create dw_detail
this.dw_header=create dw_header
this.Control[]={this.st_hsplitbar,&
this.st_vsplitbar2,&
this.dw_log,&
this.dw_detail,&
this.dw_header}
end on

on tabpage_detail.destroy
destroy(this.st_hsplitbar)
destroy(this.st_vsplitbar2)
destroy(this.dw_log)
destroy(this.dw_detail)
destroy(this.dw_header)
end on

type st_hsplitbar from u_st_splitbar within tabpage_detail
integer x = 2034
integer y = 1140
integer width = 18
integer height = 1128
end type

event constructor;call super::constructor;//Added By Jay Chen 06-11-2014  regist split bar
tabpage_detail.st_hsplitbar.of_register( tabpage_detail.dw_detail, 1 )
tabpage_detail.st_hsplitbar.of_register( tabpage_detail.dw_log, 2 )
tabpage_detail.st_hsplitbar.of_SetMinobjectsize( 300 )
end event

event mousemove;call super::mousemove;Tabpage_detail.st_hsplitbar.Y = Tabpage_detail.dw_detail.Y
Tabpage_detail.st_hsplitbar.Height = Tabpage_detail.dw_detail.Height
gnv_user_option.of_Set_option_value( gs_user_id, "w_request_webform_approve.tab_1.tabpage_detail.st_hsplitbar",string( this.x / tabpage_detail.width ) )

end event

type st_vsplitbar2 from u_st_splitbar within tabpage_detail
integer y = 1120
integer width = 4078
end type

event constructor;call super::constructor;//Added By Jay Chen 06-11-2014  regist split bar
tabpage_detail.st_vsplitbar2.of_register( tabpage_detail.dw_header, 3 )
tabpage_detail.st_vsplitbar2.of_register( tabpage_detail.dw_detail, 4 )
tabpage_detail.st_vsplitbar2.of_register( tabpage_detail.dw_log, 4 )
tabpage_detail.st_vsplitbar2.of_SetMinobjectsize( 300 )
end event

event mousemove;call super::mousemove;//Added By Jay Chen 06-11-2014
gnv_user_option.of_Set_option_value( gs_user_id, "w_request_webform_approve.tab_1.tabpage_detail.st_vsplitbar2",string( this.y / tabpage_detail.height ) )
Tabpage_detail.st_hsplitbar.Y =  tabpage_detail.dw_header.Y  + tabpage_detail.dw_header.Height  + 4
Tabpage_detail.st_hsplitbar.Height = tabpage_detail.Height  - tabpage_detail.st_vsplitbar2.Y - tabpage_detail.st_vsplitbar2.Height - 20
end event

type dw_log from u_dw within tabpage_detail
event ue_dwsyscommand pbm_syscommand
string tag = "Request Webform Log"
integer x = 2048
integer y = 1140
integer width = 2011
integer height = 1116
integer taborder = 21
boolean titlebar = true
string title = "Request Webform Log"
string dataobject = "d_request_webform_log"
boolean controlmenu = false
boolean hscrollbar = true
end type

event ue_dwsyscommand;if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if
end event

event constructor;call super::constructor;//SetRowFocusIndicator(Hand!)//Commented By jay 2016-04-14
this.of_SetUpdateAble(True)
//this.of_setrowselect( true)

this.of_setresize(true)
this.inv_resize.of_setorigsize( this.width,this.height)
this.inv_resize.of_setminsize( this.width,this.height)
this.inv_resize.of_register(this.inv_resize.scale)
this.inv_resize.of_SetDetailHeight(true)
end event

event getfocus;call super::getfocus;il_current_screen = 65 //Added By Jay Chen 06-09-2014
end event

type dw_detail from u_dw within tabpage_detail
event ue_dwsyscommand pbm_syscommand
string tag = "Request Webform Detail"
integer y = 1140
integer width = 2030
integer height = 1116
integer taborder = 21
boolean titlebar = true
string title = "Request Webform Detail"
string dataobject = "d_request_webform_detail"
boolean controlmenu = false
boolean hscrollbar = true
end type

event ue_dwsyscommand;if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if
end event

event constructor;call super::constructor;this.of_SetUpdateAble(false)
this.of_setrowselect( true)

this.of_setresize(true)
this.inv_resize.of_setorigsize( this.width,this.height)
this.inv_resize.of_setminsize( this.width,this.height)
this.inv_resize.of_register(this.inv_resize.scale)
this.inv_resize.of_SetDetailHeight(true)
end event

event getfocus;call super::getfocus;il_current_screen = 64 //Added By Jay Chen 06-09-2014
end event

event rbuttondown;call super::rbuttondown;//Added By Mark Lee 10/09/2015
m_request_webform		lm_request
long						ll_row

ll_row  = this.getselectedrow( 0)
if isnull(ll_row) or ll_row <= 0 then
	return	
end if 

lm_request = create m_request_webform

//lm_request.m_displaylabel.tag = lower("Formatting_List")

if this.GetItemString(ll_row,"types") <> "column"  then lm_request.m_displaylabel.enabled = false

lm_request.PopMenu(w_mdi.PointerX(),w_mdi.PointerY())


Destroy lm_request
end event

type dw_header from u_dw within tabpage_detail
event ue_dwsyscommand pbm_syscommand
string tag = "Request Webform Header"
integer width = 4078
integer height = 1120
integer taborder = 10
boolean titlebar = true
string title = "Request Webform Header"
string dataobject = "d_request_webform"
boolean controlmenu = false
boolean vscrollbar = false
boolean livescroll = false
end type

event ue_dwsyscommand;if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if
end event

event constructor;call super::constructor;this.of_SetUpdateAble(true)

this.of_setresize(true)
this.inv_resize.of_setorigsize( this.width,this.height)
this.inv_resize.of_setminsize( this.width,this.height)
this.inv_resize.of_register(this.inv_resize.scale)
this.inv_resize.of_SetDetailHeight(true)

if w_Mdi.of_security_access(6993) = 0 then 
	this.modify("b_approve.visible =0 b_reject.visible =0 ")
else
	this.modify("b_approve.visible =1 b_reject.visible =1 ")	
end if 
end event

event buttonclicked;call super::buttonclicked;str_request_webform_action	lstr_action
long			ll_count

if row <= 0 then return

ll_count =0 
lstr_action.al_rwf_id = this.GetItemNumber(row,"rwf_id")
lstr_action.as_request_name = this.GetItemString(row,"request_name")
lstr_action.al_template_id = this.GetItemNumber(row,"template_id")
lstr_action.al_export_id = this.GetItemNumber(row,"export_id")
lstr_action.as_send_email_setting = this.GetItemString(row,"send_email_setting")
lstr_action.al_steps = this.GetItemNumber(row,"steps")
lstr_action.as_submit_step = this.GetItemString(row,"submit_step")
lstr_action.as_reject_step = this.GetItemString(row,"reject_step")
lstr_action.al_ctx_id  = this.GetItemNumber(row,"ctx_id")

lstr_action.as_from = 'detail'
		
choose case dwo.name
	case 'b_approve'
		lstr_action.as_action = 'approve'
		of_action(lstr_action)
	case 'b_reject'
		lstr_action.as_action = 'reject'
		of_action(lstr_action)
	case "b_define_documents"
		if not isnull(lstr_action.al_rwf_id) and lstr_action.al_rwf_id > 0 then 			
			SELECT count(1)
			Into :ll_count
			FROM request_webform_document  
			WHERE ( request_webform_document.rwf_id = :lstr_action.al_rwf_id )    and datalength(document_content) > 0  Using Sqlca;
			if ll_count > 0 then
				OpenWithParm( w_request_webform_document, lstr_action.al_rwf_id)
			else
				messagebox(gnv_app.iapp_object.DisplayName,"No documents have been uploaded.")
			end if 
		end if
	case "b_email_sends_setting"
		if not isnull(lstr_action.al_rwf_id) and lstr_action.al_rwf_id > 0 then 
			OpenWithParm( w_request_webform_email_setting, row)
		end if
end choose 
end event

event getfocus;call super::getfocus;il_current_screen = 63 //Added By Jay Chen 06-09-2014
end event

event clicked;call super::clicked;long 		ll_ctx_id
integer 	li_steps
if row <=0 then return 


if lower(dwo.name) = "ctx_id" then 
	ll_ctx_id = this.GetItemNumber( row,"ctx_id")
	li_steps = this.GetItemNumber( row,"steps")
	of_open_ctx(ll_ctx_id,li_steps)
end if 
end event

event retrieveend;call super::retrieveend;Long			ll_rwf_id, ll_template_id, ll_export_id, ll_steps
string			ls_request_name, ls_submit_step, ls_reject_step, ls_status,ls_bypass,ls_submit
boolean		lbn_action

if rowcount <= 0 then return
	
ll_rwf_id = this.GetItemNumber(this.getrow() ,"rwf_id")
ls_status = this.GetItemString(this.getrow(),"status")
ls_submit = this.GetItemString(this.getrow(),"submit_request_to")
ll_steps = this.GetItemNumber(this.getrow(),"steps")
ls_submit_step = this.GetItemString(this.getrow(),"submit_step")
ls_bypass = this.GetItemString(this.getrow(),"bypass")


if of_enable_action(ll_rwf_id , ls_status , ls_submit, ll_steps,ls_submit_step,ls_bypass)	= true then 
	this.modify("b_approve.Enabled =yes b_reject.Enabled =yes ")	
else 
	this.modify("b_approve.Enabled =no b_reject.Enabled =no ")		
end if 
end event

