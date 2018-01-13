$PBExportHeader$n_cst_tdl_function.sru
$PBExportComments$Public function of TDL
forward
global type n_cst_tdl_function from nonvisualobject
end type
end forward

global type n_cst_tdl_function from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer of_get_module (ref string as_module[])
public function integer of_filter_module (datawindow adw)
public function string of_gen_where_due_date (string as_module_id, datetime adt_where_due_date)
public function string of_gen_tdl_sql (string as_user_id, datastore ads_todoitem, ref string as_where[], ref string as_filter[], datetime adt_where_due_date, long al_tdl_right, string as_other_user)
public function string of_gen_tdl_sql (string as_user_id, datastore ads_todoitem, ref string as_where[], ref string as_filter[], datetime adt_where_due_date, long al_tdl_right, string as_other_user, long al_ctx_id)
public function string of_gen_tdl_sql (string as_user_id, datastore ads_todoitem, ref string as_where[], ref string as_filter[], datetime adt_where_due_date, long al_tdl_right, string as_other_user, decimal al_category)
end prototypes

public function integer of_get_module (ref string as_module[]);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-18 By: Allen
//$<reason> Filter mudule according to setup
Integer i, li_set_9, li_set_cont
integer li_iapp //maha043008
String ls_Filter
String ls_null[]

li_set_9 = of_get_app_setting("set_9","I")
li_set_cont = of_get_app_setting("set_cont","I")
li_iapp = of_get_app_setting("set_iapps","I")

as_module = ls_null

CHOOSE CASE li_set_9
	CASE 0		//IntelliCred
		as_module[1] = "01"									//IntelliCred
//Start Code Change ----04.30.2008 #V8 maha - bug correction: most IntelliCred/App systems are set up
//as Intellicred with applcation mapping module (not with IntelliCred/IntelliApp setting ) so it needs to work as well
		if li_iapp = 1 then
			as_module[2] = "02"	
		end if
		IF li_set_cont = 1 THEN 
			as_module[upperbound(as_module) + 1] = "03"	//Contract Logix
			as_module[upperbound(as_module) + 1] = "04"	//05/14/2007 By Jervis
		end if
//End Code Change---.2008
	CASE 1		//IntelliApp
		as_module[1] = "02"									//IntelliApp
		IF li_set_cont = 1 THEN 
			as_module[2] = "03"	//Contract Logix
			as_module[3] = "04"	//05/14/2007 By Jervis
		end if
	CASE 2		//IntelliCred SE
	CASE 3		//IntelliCred/IntelliApp
		as_module[1] = "01"									//IntelliCred
		as_module[2] = "02"									//IntelliApp
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.26.2007 By: Machongmin
		//$<reason> Fix a defect.
		/*
		IF li_set_cont = 1 THEN as_module[3] = "03"	
		*/
		IF li_set_cont = 1 THEN 
			as_module[3] = "03"	
			as_module[4] = "04"	
		END IF
		//---------------------------- APPEON END ----------------------------
	CASE 4		//Contract Logix
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.26.2007 By: Machongmin
		//$<reason> Fix a defect.
		/*
		as_module[1] = "03"									//Contract Logix
		*/
		as_module[1] = "03"									
		as_module[2] = "04"									
		//as_module[3] = "03"									//Contract Logix
		//as_module[4] = "04"
		//---------------------------- APPEON END ----------------------------
END CHOOSE

Return 0
//---------------------------- APPEON END ----------------------------

end function

public function integer of_filter_module (datawindow adw);//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-12-18 By: Allen
//$<reason> Filter mudule according to setup
String ls_Filter
String ls_module[]
Integer i

of_get_module(ls_module)

FOR i = 1 To UpperBound( ls_module )
	IF Len(ls_module[i]) > 0 THEN
		ls_Filter += "'" + ls_module[i] + "',"
	END IF
NEXT

ls_Filter = Left(ls_Filter, Len(ls_Filter) - 1)
IF Len(ls_Filter) = 0 THEN Return -1

//Filter dw_tdl_role in pfc_cst_u_tdl_role_painter: list type dw.
IF adw.ClassName() = "dw_tdl_role" THEN
	adw.SetFilter("module in (" + ls_Filter + ")")
	adw.Filter()
ELSE
	//Filter dwc_child
	DatawindowChild ldwc_child
	ldwc_child.SetTransObject(Sqlca)
	IF adw.GetChild("module", ldwc_child) = -1 THEN Return -2
	ldwc_child.SetFilter("module_id in (" + ls_Filter + ")")
	ldwc_child.Filter()
END IF

Return 0
//---------------------------- APPEON END ----------------------------

end function

public function string of_gen_where_due_date (string as_module_id, datetime adt_where_due_date);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_tdl_function::of_gen_where_due_date()
// $<arguments>
//		value	string  	as_module_id		
//		value	datetime	adt_dut_date		
// $<returns> integer
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 02.25.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////

If isnull(adt_where_due_date) Then Return ''
Choose Case as_module_id
	Case '01'
		Return ''
	Case '02'
		Return ''
	Case '03'
		Return " And ctx_action_items.due_date = Convert(datetime,'"+String(adt_where_due_date,'yyyy-mm-dd')+"',126) "
	Case '04'
		Return " And ctx_am_action_item.due_date = Convert(datetime,'"+String(adt_where_due_date,'yyyy-mm-dd')+"',126) "
End Choose

Return ''
end function

public function string of_gen_tdl_sql (string as_user_id, datastore ads_todoitem, ref string as_where[], ref string as_filter[], datetime adt_where_due_date, long al_tdl_right, string as_other_user);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_tdl_function::of_gen_tdl_sql()
// $<arguments>
//		value    	string   	as_user_id        		
//		value    	datastore	ads_todoitem      		
//		reference	string   	as_where[]        		
//		reference	string   	as_filter[]       		
//		value    	datetime 	adt_where_due_date		
//		value    	long     	al_tdl_right      		
//		value    	string   	as_other_user     		
// $<returns> string
// $<description> Move from u_cst_todolist::ue_retrieve_todolist()
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 02.25.2009 by Ken.Guo
//////////////////////////////////////////////////////////////////////


string ls_ext_sql,ls_sql
long ll_row
Long ll_tdl_id,ll_tdli_id,ll_Action_Type
Long ll_Action_Status,ll_Print_Flag,ll_Due_Date,ll_UserType,ll_category
String ls_tdl_name,ls_tdl_module,ls_Max_Sends_Flag,ls_AssignUser,ls_AmAssignUser
String ls_sql_where,ls_sql_filter,ls_colname
Boolean lb_exists_term
String ls_module[]
Boolean lb_all_user = False

If as_user_id = '-ALL-' Then 
	lb_all_user = True
End If

//Added By Jay Chen 12-05-2014
If not lb_all_user then
	DECLARE lup_get_ctx_user_access PROCEDURE FOR up_get_ctx_user_access
				  :as_user_id;
	EXECUTE lup_get_ctx_user_access;
	if SQLCA.SQLCode < 0 then
		ROLLBACK;
	else
		COMMIT;
	end if
	close lup_get_ctx_user_access;
end if
//end

// Construct SQL according to term of to do item.
FOR ll_row = 1 TO ads_todoitem.Rowcount()
	ll_tdl_id = ads_todoitem.GetitemNumber( ll_row, "tdl_id" )
	ll_tdli_id = ads_todoitem.GetitemNumber( ll_row, "tdli_id" )
	ls_tdl_name = ads_todoitem.GetitemString( ll_row, "tdl_basic_info_tdl_name" )
	ls_tdl_module = ads_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
	
	ll_Action_Type = ads_todoitem.GetitemNumber( ll_row, "Action_Type" )
	ll_Action_Status = ads_todoitem.GetitemNumber( ll_row, "Action_Status" )
	ll_Print_Flag = ads_todoitem.GetitemNumber( ll_row, "Print_Flag" )
	ll_Due_Date = ads_todoitem.GetitemNumber( ll_row, "Due_Date" )
	ls_Max_Sends_Flag = ads_todoitem.GetitemString( ll_row, "Max_Sends_Flag" )

	If lb_all_user Then
		as_user_id = ads_todoitem.GetItemString(ll_row,'tdl_users_access')
		If isnull(as_user_id) Then 
			as_user_id = ''
		Else
			//Cut single quotation marks
			as_user_id = Mid(as_user_id,2)
			as_user_id = Mid(as_user_id,1,len(as_user_id) - 1)
		End If
	End If
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2009-01-15 By: Scofield
	//$<Reason> Add Assigned by user type.

	ll_UserType = ads_todoitem.GetitemNumber(ll_row, "tdl_detail_user_type")
	if IsNull(ll_UserType) then ll_UserType = 1
	if ll_UserType = 1 then
		ls_AssignUser = "ctx_action_items.action_user"
		ls_AmAssignUser = "ctx_am_action_item.action_user"
	else
		ls_AssignUser = "ctx_action_items.wf_assigned_by"
		ls_AmAssignUser = "ctx_am_action_item.wf_assigned_by"
	end if
	//---------------------------- APPEON END ----------------------------

	ls_sql_where = ""
	ls_sql_filter = ""
	lb_exists_term = FALSE

	// Term of Action Type
	IF ll_Action_Type > 0 THEN
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				ls_colname = "ctx_action_items.action_type"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.21.2007 By: Machongmin
			//$<reason> Fix a defect.
			case "04"
				ls_colname = "ctx_am_action_item.action_type"
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		ls_sql_where += ls_colname + " = " + String( ll_Action_Type )
		ls_sql_filter += "action_type = " + String( ll_Action_Type )
		
		lb_exists_term = TRUE
	END IF

	// Term of Action Status
	IF ll_Action_Status > 0 OR ll_Action_Status = -1 THEN
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				ls_colname = "ctx_action_items.action_status"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.21.2007 By: Machongmin
			//$<reason> Fix a defect.
			case "04"
				ls_colname = "ctx_am_action_item.action_status"
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		IF ll_Action_Status = -1 THEN // Action Status Is Null
			ls_sql_where += ls_colname + " is null "
			ls_sql_filter += " isnull(action_status) "
		ELSE
			ls_sql_where += ls_colname + " = " + String( ll_Action_Status )
			ls_sql_filter += "action_status = " + String( ll_Action_Status )
		END IF

		lb_exists_term = TRUE
	END IF

	// Term of Print Flag
	IF ll_Print_Flag >= 0 THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF

		ls_sql_where += "Print_Flag = " + String( ll_Print_Flag )
		ls_sql_filter += "Print_Flag = " + String( ll_Print_Flag )
		
		lb_exists_term = TRUE
	END IF
	
	// Term of Due Date
	IF ll_Due_Date >= 0 THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF

		IF ll_Due_Date = 0 THEN
			ls_sql_where += "DATEDIFF(Day,Due_Date,getdate()) >= 1"	//Modified by Scofield on 2009-01-14
			ls_sql_filter += "daysafter(Due_Date,today()) >= 1"		//Modified by Scofield on 2009-01-14
		ELSEIF ll_Due_Date = 1 THEN		//Added by Scofield on 2008-12-23
			ls_sql_where += "DATEDIFF(Day,Due_Date,getdate()) = 0"
			ls_sql_filter += "daysafter(Due_Date,today()) = 0"
		ELSE
			//Modified By Ken.Guo 2016-01-27
			/*
			ls_sql_where += "(Due_Date >= getdate() AND Due_Date <= dateadd(day," + String(ll_Due_Date) + ",getdate()))"
			ls_sql_filter += "(Due_Date >= today() AND Due_Date <= RelativeDate(today()," + String(ll_Due_Date) + "))"
			*/
			ls_sql_where += "(DATEDIFF(Day,Due_Date,getdate()) <= 0 AND Due_Date <= dateadd(day," + String(ll_Due_Date) + ",getdate()))"
			ls_sql_filter += "(daysafter(Due_Date,today()) <= 0 AND Due_Date <= RelativeDate(today()," + String(ll_Due_Date) + "))"
					
		END IF

		lb_exists_term = TRUE
	END IF

	// Max Number Attempts
	IF ls_Max_Sends_Flag = '1' THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				//ls_sql_where += "ctx_action_items.no_attemp >= wf_action_status.send_count"
				ls_sql_where += "(Exists (select 1 from wf_action_status where ctx_action_items.wf_id = wf_action_status.wf_id &
										AND ctx_action_items.wf_action_type_id = wf_action_status.step_id &
										AND ctx_action_items.action_status = wf_action_status.action_status_id &
										AND ctx_action_items.no_attempts >= wf_action_status.send_count))"
				ls_sql_filter += "number_sent >= wf_action_status_send_count"
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 03.21.2007 By: Machongmin
				//$<reason> Fix a defect.
			case "04"
				ls_sql_where += "(Exists (select 1 from wf_action_status where ctx_am_action_item.wf_id = wf_action_status.wf_id AND ctx_am_action_item.wf_action_type_id = wf_action_status.step_id AND ctx_am_action_item.action_status = wf_action_status.action_status_id AND ctx_am_action_item.Attempt_Times >= wf_action_status.send_count))"
				ls_sql_filter += "Attempt_Times >= wf_action_status_send_count"
				
				//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		lb_exists_term = TRUE
	END IF
	

	// Set where condition to array
	as_where[ll_row] = ls_sql_where
	as_filter[ll_row] = ls_sql_filter
	
	// Construct SQL for dynamic sql
	IF Len(ls_sql) > 0 THEN ls_sql += "~r~n UNION ~r~n"
	
	CHOOSE CASE ls_tdl_module
		CASE "03"		//Contract Logix
			choose case al_tdl_right
				case 0
					//<Modify> 07/31/2007 by: Andy
					//ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "')"
					ls_ext_sql = " and (" + ls_AssignUser + " in ('" + gs_user_id + "','Public'))"		//Modified by Scofield on 2009-01-15
					//end of modify
				case 1
					as_other_user = trim(as_other_user)
					if len(as_other_user) > 0 then
						ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "' or " + ls_AssignUser + " = '" +  as_other_user + "')"		//Modified by Scofield on 2009-01-15
					else
						ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "')"					//Modified by Scofield on 2009-01-15
					end if
				case 2
						ls_ext_sql = " and (" + ls_AssignUser + " in ('" + as_user_id + "','Public'))"	//Modified by Scofield on 2009-01-15
			end choose
		
			ls_ext_sql += This.of_gen_where_due_date(ls_tdl_module,adt_where_due_date) //Added by Ken.Guo on 2009-01-20
			
			If not lb_all_user then //Added By Jay Chen 12-05-2014
				ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
				", cnt = count(1) FROM ctx_action_items &
			 	JOIN ctx_basic_info ON ctx_action_items.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
			 	JOIN (select ctx_id from ctx_user_access_tmp  where user_id ='"+as_user_id+"' ) A on ctx_action_items.ctx_id = A.ctx_id  &
			 	JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
			 	AND Isnull(ctx_action_items.active_status,0) >= 0" + ls_ext_sql
			else
				ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
				", cnt = count(1) FROM ctx_action_items &
			 	JOIN ctx_basic_info ON ctx_action_items.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
			 	JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
			 	AND Isnull(ctx_action_items.active_status,0) >= 0" + ls_ext_sql
			end if
			
			if len(trim(ls_ext_sql)) > 0 then
				if len(trim(as_where[ll_row])) > 0 then
					as_where[ll_row] += ls_ext_sql
				else
					as_where[ll_row] = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
				if len(trim(ls_sql_where)) > 0 then
					ls_sql_where += ls_ext_sql
				else
					ls_sql_where = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
			end if
		//---------------------------- APPEON END ----------------------------	 


		case "04"
			choose case al_tdl_right
				case 0
					ls_ext_sql = " and (" + ls_AmAssignUser + " in ('" + gs_user_id + "','Public'))"			//Modified by Scofield on 2009-01-15	
				case 1
					as_other_user = trim(as_other_user)
					if len(as_other_user) > 0 then
						ls_ext_sql = " and (" + ls_AmAssignUser + " = '" + gs_user_id + "' or " + ls_AmAssignUser + " = '" +  as_other_user + "')"		//Modified by Scofield on 2009-01-15
					else
						ls_ext_sql = " and (" + ls_AmAssignUser + " = '" + gs_user_id + "')"						//Modified by Scofield on 2009-01-15
					end if
				case 2
						ls_ext_sql = " and (" + ls_AmAssignUser + " in ('" + as_user_id + "','Public'))"		//Modified by Scofield on 2009-01-15
			end choose
		
			ls_ext_sql += This.of_gen_where_due_date(ls_tdl_module,adt_where_due_date) //Added by Ken.Guo on 2009-01-20
			
			If not lb_all_user then //Added By Jay Chen 12-05-2014
				ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
				", cnt = count(1) FROM ctx_am_action_item &
				,ctx_am_document,ctx_basic_info &
				join (select ctx_id from ctx_user_access_tmp  where user_id = '"+as_user_id+"' ) A on ctx_basic_info.ctx_id = A.ctx_id  &
				JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
				where ctx_am_action_item.doc_id = ctx_am_document.doc_id and ctx_am_document.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
				AND Isnull(ctx_am_action_item.active_status,0) >= 0" + ls_ext_sql
			else
				ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
				", cnt = count(1) FROM ctx_am_action_item &
				,ctx_am_document,ctx_basic_info &
				JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
				where ctx_am_action_item.doc_id = ctx_am_document.doc_id and ctx_am_document.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
				AND Isnull(ctx_am_action_item.active_status,0) >= 0" + ls_ext_sql
			end if
			
			if len(trim(ls_ext_sql)) > 0 then
				if len(trim(as_where[ll_row])) > 0 then
					as_where[ll_row] += ls_ext_sql
				else
					as_where[ll_row] = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
				if len(trim(ls_sql_where)) > 0 then
					ls_sql_where += ls_ext_sql
				else
					ls_sql_where = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
			end if
		//---------------------------- APPEON END ----------------------------	 
	END CHOOSE
	
	
   IF lb_exists_term THEN
		CHOOSE CASE ls_tdl_module
			case '04'
				ls_sql += " and " + ls_sql_where
			case else
				ls_sql += " WHERE " + ls_sql_where
		end choose
	end if
	//---------------------------- APPEON END ----------------------------
NEXT

Return ls_sql

end function

public function string of_gen_tdl_sql (string as_user_id, datastore ads_todoitem, ref string as_where[], ref string as_filter[], datetime adt_where_due_date, long al_tdl_right, string as_other_user, long al_ctx_id);//====================================================================
// Function: of_gen_tdl_sql
//--------------------------------------------------------------------
// Description:
// $<description> Move from u_cst_todolist::ue_retrieve_todolist()
//--------------------------------------------------------------------
// Arguments:
//                as_user_id
//                ads_todoitem
//                as_where[]
//                as_filter[]
//                adt_where_due_date
//                al_tdl_right
//                as_other_user
//                al_ctx_id
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/26/2012
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string ls_ext_sql,ls_sql
long ll_row
Long ll_tdl_id,ll_tdli_id,ll_Action_Type
Long ll_Action_Status,ll_Print_Flag,ll_Due_Date,ll_UserType
String ls_tdl_name,ls_tdl_module,ls_Max_Sends_Flag,ls_AssignUser,ls_AmAssignUser
String ls_sql_where,ls_sql_filter,ls_colname
Boolean lb_exists_term
String ls_module[]
Boolean lb_all_user = False

If as_user_id = '-ALL-' Then 
	lb_all_user = True
End If

// Construct SQL according to term of to do item.
FOR ll_row = 1 TO ads_todoitem.Rowcount()
	ll_tdl_id = ads_todoitem.GetitemNumber( ll_row, "tdl_id" )
	ll_tdli_id = ads_todoitem.GetitemNumber( ll_row, "tdli_id" )
	ls_tdl_name = ads_todoitem.GetitemString( ll_row, "tdl_basic_info_tdl_name" )
	ls_tdl_module = ads_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
	
	ll_Action_Type = ads_todoitem.GetitemNumber( ll_row, "Action_Type" )
	ll_Action_Status = ads_todoitem.GetitemNumber( ll_row, "Action_Status" )
	ll_Print_Flag = ads_todoitem.GetitemNumber( ll_row, "Print_Flag" )
	ll_Due_Date = ads_todoitem.GetitemNumber( ll_row, "Due_Date" )
	ls_Max_Sends_Flag = ads_todoitem.GetitemString( ll_row, "Max_Sends_Flag" )

	If lb_all_user Then
		as_user_id = ads_todoitem.GetItemString(ll_row,'tdl_users_access')
		If isnull(as_user_id) Then 
			as_user_id = ''
		Else
			//Cut single quotation marks
			as_user_id = Mid(as_user_id,2)
			as_user_id = Mid(as_user_id,1,len(as_user_id) - 1)
		End If
	End If
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2009-01-15 By: Scofield
	//$<Reason> Add Assigned by user type.

	ll_UserType = ads_todoitem.GetitemNumber(ll_row, "tdl_detail_user_type")
	if IsNull(ll_UserType) then ll_UserType = 1
	if ll_UserType = 1 then
		ls_AssignUser = "ctx_action_items.action_user"
		ls_AmAssignUser = "ctx_am_action_item.action_user"
	else
		ls_AssignUser = "ctx_action_items.wf_assigned_by"
		ls_AmAssignUser = "ctx_am_action_item.wf_assigned_by"
	end if
	//---------------------------- APPEON END ----------------------------

	ls_sql_where = ""
	ls_sql_filter = ""
	lb_exists_term = FALSE

//	//Begin - Added By Mark Lee 01/03/2013
	CHOOSE CASE ls_tdl_module
			CASE "03","04"		//Contract Logix
//				lb_exists_term = TRUE
				ls_sql_where += "  ctx_basic_info.ctx_id = "+string(al_ctx_id) +" AND "
				ls_sql_filter += " ctx_id = "+string(al_ctx_id) +" AND "
	End Choose 				
//	//End - Added By Mark Lee 01/03/2013
	
	// Term of Action Type
	IF ll_Action_Type > 0 THEN
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				ls_colname = "ctx_action_items.action_type"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.21.2007 By: Machongmin
			//$<reason> Fix a defect.
			case "04"
				ls_colname = "ctx_am_action_item.action_type"
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		ls_sql_where += ls_colname + " = " + String( ll_Action_Type )
		ls_sql_filter += "action_type = " + String( ll_Action_Type )
		
		lb_exists_term = TRUE
	END IF

	// Term of Action Status
	IF ll_Action_Status > 0 OR ll_Action_Status = -1 THEN
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				ls_colname = "ctx_action_items.action_status"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.21.2007 By: Machongmin
			//$<reason> Fix a defect.
			case "04"
				ls_colname = "ctx_am_action_item.action_status"
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		IF ll_Action_Status = -1 THEN // Action Status Is Null
			ls_sql_where += ls_colname + " is null "
			ls_sql_filter += " isnull(action_status) "
		ELSE
			ls_sql_where += ls_colname + " = " + String( ll_Action_Status )
			ls_sql_filter += "action_status = " + String( ll_Action_Status )
		END IF

		lb_exists_term = TRUE
	END IF

	// Term of Print Flag
	IF ll_Print_Flag >= 0 THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF

		ls_sql_where += "Print_Flag = " + String( ll_Print_Flag )
		ls_sql_filter += "Print_Flag = " + String( ll_Print_Flag )
		
		lb_exists_term = TRUE
	END IF
	
	// Term of Due Date
	IF ll_Due_Date >= 0 THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF

		IF ll_Due_Date = 0 THEN
			ls_sql_where += "DATEDIFF(Day,Due_Date,getdate()) >= 1"	//Modified by Scofield on 2009-01-14
			ls_sql_filter += "daysafter(Due_Date,today()) >= 1"		//Modified by Scofield on 2009-01-14
		ELSEIF ll_Due_Date = 1 THEN		//Added by Scofield on 2008-12-23
			ls_sql_where += "DATEDIFF(Day,Due_Date,getdate()) = 0"
			ls_sql_filter += "daysafter(Due_Date,today()) = 0"
		ELSE
			//Modified By Ken.Guo 2016-01-27
			/*
			ls_sql_where += "(Due_Date >= getdate() AND Due_Date <= dateadd(day," + String(ll_Due_Date) + ",getdate()))"
			ls_sql_filter += "(Due_Date >= today() AND Due_Date <= RelativeDate(today()," + String(ll_Due_Date) + "))"
			*/
			ls_sql_where += "(DATEDIFF(Day,Due_Date,getdate()) <= 0 AND Due_Date <= dateadd(day," + String(ll_Due_Date) + ",getdate()))"
			ls_sql_filter += "(daysafter(Due_Date,today()) <= 0 AND Due_Date <= RelativeDate(today()," + String(ll_Due_Date) + "))"
						
		END IF

		lb_exists_term = TRUE
	END IF

	// Max Number Attempts
	IF ls_Max_Sends_Flag = '1' THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				//ls_sql_where += "ctx_action_items.no_attemp >= wf_action_status.send_count"
				ls_sql_where += "(Exists (select 1 from wf_action_status where ctx_action_items.wf_id = wf_action_status.wf_id &
										AND ctx_action_items.wf_action_type_id = wf_action_status.step_id &
										AND ctx_action_items.action_status = wf_action_status.action_status_id &
										AND ctx_action_items.no_attempts >= wf_action_status.send_count))"
				ls_sql_filter += "number_sent >= wf_action_status_send_count"
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 03.21.2007 By: Machongmin
				//$<reason> Fix a defect.
			case "04"
				ls_sql_where += "(Exists (select 1 from wf_action_status where ctx_am_action_item.wf_id = wf_action_status.wf_id AND ctx_am_action_item.wf_action_type_id = wf_action_status.step_id AND ctx_am_action_item.action_status = wf_action_status.action_status_id AND ctx_am_action_item.Attempt_Times >= wf_action_status.send_count))"
				ls_sql_filter += "Attempt_Times >= wf_action_status_send_count"
				
				//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		lb_exists_term = TRUE
	END IF
	

	// Set where condition to array
	as_where[ll_row] = ls_sql_where
	as_filter[ll_row] = ls_sql_filter
	
	// Construct SQL for dynamic sql
	IF Len(ls_sql) > 0 THEN ls_sql += "~r~n UNION ~r~n"
	
	CHOOSE CASE ls_tdl_module
		CASE "03"		//Contract Logix
			choose case al_tdl_right
				case 0
					//<Modify> 07/31/2007 by: Andy
					//ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "')"
					ls_ext_sql = " and (" + ls_AssignUser + " in ('" + gs_user_id + "','Public'))"		//Modified by Scofield on 2009-01-15
					//end of modify
				case 1
					as_other_user = trim(as_other_user)
					if len(as_other_user) > 0 then
						ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "' or " + ls_AssignUser + " = '" +  as_other_user + "')"		//Modified by Scofield on 2009-01-15
					else
						ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "')"					//Modified by Scofield on 2009-01-15
					end if
				case 2
						ls_ext_sql = " and (" + ls_AssignUser + " in ('" + as_user_id + "','Public'))"	//Modified by Scofield on 2009-01-15
			end choose
		
			ls_ext_sql += This.of_gen_where_due_date(ls_tdl_module,adt_where_due_date) //Added by Ken.Guo on 2009-01-20
			//Modified By Mark Lee 12/26/2012
			ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
			", cnt = count(1) FROM ctx_action_items &
			 JOIN ctx_basic_info ON ctx_action_items.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
			 JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
			 AND ctx_basic_info.ctx_id = "+string(al_ctx_id) +   &
			 " AND Isnull(ctx_action_items.active_status,0) >= 0" + ls_ext_sql
			
			if len(trim(ls_ext_sql)) > 0 then
				if len(trim(as_where[ll_row])) > 0 then
					as_where[ll_row] += ls_ext_sql
				else
					as_where[ll_row] = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
				if len(trim(ls_sql_where)) > 0 then
					ls_sql_where += ls_ext_sql
				else
					ls_sql_where = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
			end if
		//---------------------------- APPEON END ----------------------------	 

		case "04"
			choose case al_tdl_right
				case 0
					ls_ext_sql = " and (" + ls_AmAssignUser + " in ('" + gs_user_id + "','Public'))"			//Modified by Scofield on 2009-01-15	
				case 1
					as_other_user = trim(as_other_user)
					if len(as_other_user) > 0 then
						ls_ext_sql = " and (" + ls_AmAssignUser + " = '" + gs_user_id + "' or " + ls_AmAssignUser + " = '" +  as_other_user + "')"		//Modified by Scofield on 2009-01-15
					else
						ls_ext_sql = " and (" + ls_AmAssignUser + " = '" + gs_user_id + "')"						//Modified by Scofield on 2009-01-15
					end if
				case 2
						ls_ext_sql = " and (" + ls_AmAssignUser + " in ('" + as_user_id + "','Public'))"		//Modified by Scofield on 2009-01-15
			end choose
		
			ls_ext_sql += This.of_gen_where_due_date(ls_tdl_module,adt_where_due_date) //Added by Ken.Guo on 2009-01-20
			//Modified By Mark Lee 12/26/2012
			ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
			", cnt = count(1) FROM ctx_am_action_item &
			,ctx_am_document,ctx_basic_info &
			JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
			where ctx_am_action_item.doc_id = ctx_am_document.doc_id and ctx_am_document.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
			AND ctx_basic_info.ctx_id = "+string(al_ctx_id) +   &
			" AND Isnull(ctx_am_action_item.active_status,0) >= 0" + ls_ext_sql
			
			if len(trim(ls_ext_sql)) > 0 then
				if len(trim(as_where[ll_row])) > 0 then
					as_where[ll_row] += ls_ext_sql
				else
					as_where[ll_row] = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
				if len(trim(ls_sql_where)) > 0 then
					ls_sql_where += ls_ext_sql
				else
					ls_sql_where = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
			end if
		//---------------------------- APPEON END ----------------------------	 
	END CHOOSE
	
	
   IF lb_exists_term THEN
		CHOOSE CASE ls_tdl_module
			case '04'
				ls_sql += " and " + ls_sql_where
			case else
				ls_sql += " WHERE " + ls_sql_where
		end choose
	end if
	//---------------------------- APPEON END ----------------------------
NEXT

Return ls_sql

end function

public function string of_gen_tdl_sql (string as_user_id, datastore ads_todoitem, ref string as_where[], ref string as_filter[], datetime adt_where_due_date, long al_tdl_right, string as_other_user, decimal al_category);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_tdl_function::of_gen_tdl_sql()
// $<arguments>
//		value    	string   	as_user_id        		
//		value    	datastore	ads_todoitem      		
//		reference	string   	as_where[]        		
//		reference	string   	as_filter[]       		
//		value    	datetime 	adt_where_due_date		
//		value    	long     	al_tdl_right      		
//		value    	string   	as_other_user   
//		value    	decimal   	al_category   
// $<returns> string
// $<description> Move from u_cst_todolist::ue_retrieve_todolist()
// $<description>
//////////////////////////////////////////////////////////////////////
//Added By Jay Chen 12-05-2014
//////////////////////////////////////////////////////////////////////


string ls_ext_sql,ls_sql
long ll_row
Long ll_tdl_id,ll_tdli_id,ll_Action_Type
Long ll_Action_Status,ll_Print_Flag,ll_Due_Date,ll_UserType,ll_category
String ls_tdl_name,ls_tdl_module,ls_Max_Sends_Flag,ls_AssignUser,ls_AmAssignUser
String ls_sql_where,ls_sql_filter,ls_colname
Boolean lb_exists_term
String ls_module[]
Boolean lb_all_user = False

If as_user_id = '-ALL-' Then 
	lb_all_user = True
End If

//Added By Jay Chen 12-05-2014
If not lb_all_user then
	DECLARE lup_get_ctx_user_access PROCEDURE FOR up_get_ctx_user_access
				  :as_user_id;
	EXECUTE lup_get_ctx_user_access;
	if SQLCA.SQLCode < 0 then
		ROLLBACK;
	else
		COMMIT;
	end if
	close lup_get_ctx_user_access;
end if
//end

// Construct SQL according to term of to do item.
FOR ll_row = 1 TO ads_todoitem.Rowcount()
	ll_tdl_id = ads_todoitem.GetitemNumber( ll_row, "tdl_id" )
	ll_tdli_id = ads_todoitem.GetitemNumber( ll_row, "tdli_id" )
	ls_tdl_name = ads_todoitem.GetitemString( ll_row, "tdl_basic_info_tdl_name" )
	ls_tdl_module = ads_todoitem.GetitemString( ll_row, "tdl_basic_info_module" )
	
	ll_Action_Type = ads_todoitem.GetitemNumber( ll_row, "Action_Type" )
	ll_Action_Status = ads_todoitem.GetitemNumber( ll_row, "Action_Status" )
	ll_Print_Flag = ads_todoitem.GetitemNumber( ll_row, "Print_Flag" )
	ll_Due_Date = ads_todoitem.GetitemNumber( ll_row, "Due_Date" )
	ls_Max_Sends_Flag = ads_todoitem.GetitemString( ll_row, "Max_Sends_Flag" )

	If lb_all_user Then
		as_user_id = ads_todoitem.GetItemString(ll_row,'tdl_users_access')
		If isnull(as_user_id) Then 
			as_user_id = ''
		Else
			//Cut single quotation marks
			as_user_id = Mid(as_user_id,2)
			as_user_id = Mid(as_user_id,1,len(as_user_id) - 1)
		End If
	End If
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2009-01-15 By: Scofield
	//$<Reason> Add Assigned by user type.

	ll_UserType = ads_todoitem.GetitemNumber(ll_row, "tdl_detail_user_type")
	if IsNull(ll_UserType) then ll_UserType = 1
	if ll_UserType = 1 then
		ls_AssignUser = "ctx_action_items.action_user"
		ls_AmAssignUser = "ctx_am_action_item.action_user"
	else
		ls_AssignUser = "ctx_action_items.wf_assigned_by"
		ls_AmAssignUser = "ctx_am_action_item.wf_assigned_by"
	end if
	//---------------------------- APPEON END ----------------------------

	ls_sql_where = ""
	ls_sql_filter = ""
	lb_exists_term = FALSE

	// Term of Action Type
	IF ll_Action_Type > 0 THEN
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				ls_colname = "ctx_action_items.action_type"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.21.2007 By: Machongmin
			//$<reason> Fix a defect.
			case "04"
				ls_colname = "ctx_am_action_item.action_type"
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		ls_sql_where += ls_colname + " = " + String( ll_Action_Type )
		ls_sql_filter += "action_type = " + String( ll_Action_Type )
		
		lb_exists_term = TRUE
	END IF
	
	//Added By Jay Chen 12-05-2014 category
	if al_category > 0 then
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		ls_colname = "ctx_basic_info.category"
		ls_sql_where += ls_colname + " = " + String( al_category )
		ls_sql_filter += "ctx_basic_info_category = " + String( al_category )
		
		lb_exists_term = TRUE
	end if
	//end

	// Term of Action Status
	IF ll_Action_Status > 0 OR ll_Action_Status = -1 THEN
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				ls_colname = "ctx_action_items.action_status"
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 03.21.2007 By: Machongmin
			//$<reason> Fix a defect.
			case "04"
				ls_colname = "ctx_am_action_item.action_status"
			//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		IF ll_Action_Status = -1 THEN // Action Status Is Null
			ls_sql_where += ls_colname + " is null "
			ls_sql_filter += " isnull(action_status) "
		ELSE
			ls_sql_where += ls_colname + " = " + String( ll_Action_Status )
			ls_sql_filter += "action_status = " + String( ll_Action_Status )
		END IF

		lb_exists_term = TRUE
	END IF

	// Term of Print Flag
	IF ll_Print_Flag >= 0 THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF

		ls_sql_where += "Print_Flag = " + String( ll_Print_Flag )
		ls_sql_filter += "Print_Flag = " + String( ll_Print_Flag )
		
		lb_exists_term = TRUE
	END IF
	
	// Term of Due Date
	IF ll_Due_Date >= 0 THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF

		IF ll_Due_Date = 0 THEN
			ls_sql_where += "DATEDIFF(Day,Due_Date,getdate()) >= 1"	//Modified by Scofield on 2009-01-14
			ls_sql_filter += "daysafter(Due_Date,today()) >= 1"		//Modified by Scofield on 2009-01-14
		ELSEIF ll_Due_Date = 1 THEN		//Added by Scofield on 2008-12-23
			ls_sql_where += "DATEDIFF(Day,Due_Date,getdate()) = 0"
			ls_sql_filter += "daysafter(Due_Date,today()) = 0"
		ELSE
			//Modified By Ken.Guo 2016-01-27
			/*
			ls_sql_where += "(Due_Date >= getdate() AND Due_Date <= dateadd(day," + String(ll_Due_Date) + ",getdate()))"
			ls_sql_filter += "(Due_Date >= today() AND Due_Date <= RelativeDate(today()," + String(ll_Due_Date) + "))"
			*/
			ls_sql_where += "(DATEDIFF(Day,Due_Date,getdate()) <= 0 AND Due_Date <= dateadd(day," + String(ll_Due_Date) + ",getdate()))"
			ls_sql_filter += "(daysafter(Due_Date,today()) <= 0 AND Due_Date <= RelativeDate(today()," + String(ll_Due_Date) + "))"
		
		END IF

		lb_exists_term = TRUE
	END IF

	// Max Number Attempts
	IF ls_Max_Sends_Flag = '1' THEN
		IF lb_exists_term THEN
			ls_sql_where += " AND "
			ls_sql_filter += " AND "
		END IF
		
		CHOOSE CASE ls_tdl_module
			CASE "03"		//Contract Logix
				//ls_sql_where += "ctx_action_items.no_attemp >= wf_action_status.send_count"
				ls_sql_where += "(Exists (select 1 from wf_action_status where ctx_action_items.wf_id = wf_action_status.wf_id &
										AND ctx_action_items.wf_action_type_id = wf_action_status.step_id &
										AND ctx_action_items.action_status = wf_action_status.action_status_id &
										AND ctx_action_items.no_attempts >= wf_action_status.send_count))"
				ls_sql_filter += "number_sent >= wf_action_status_send_count"
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 03.21.2007 By: Machongmin
				//$<reason> Fix a defect.
			case "04"
				ls_sql_where += "(Exists (select 1 from wf_action_status where ctx_am_action_item.wf_id = wf_action_status.wf_id AND ctx_am_action_item.wf_action_type_id = wf_action_status.step_id AND ctx_am_action_item.action_status = wf_action_status.action_status_id AND ctx_am_action_item.Attempt_Times >= wf_action_status.send_count))"
				ls_sql_filter += "Attempt_Times >= wf_action_status_send_count"
				
				//---------------------------- APPEON END ----------------------------	
		END CHOOSE

		lb_exists_term = TRUE
	END IF
	

	// Set where condition to array
	as_where[ll_row] = ls_sql_where
	as_filter[ll_row] = ls_sql_filter
	
	// Construct SQL for dynamic sql
	IF Len(ls_sql) > 0 THEN ls_sql += "~r~n UNION ~r~n"
	
	CHOOSE CASE ls_tdl_module
		CASE "03"		//Contract Logix
			choose case al_tdl_right
				case 0
					//<Modify> 07/31/2007 by: Andy
					//ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "')"
					ls_ext_sql = " and (" + ls_AssignUser + " in ('" + gs_user_id + "','Public'))"		//Modified by Scofield on 2009-01-15
					//end of modify
				case 1
					as_other_user = trim(as_other_user)
					if len(as_other_user) > 0 then
						ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "' or " + ls_AssignUser + " = '" +  as_other_user + "')"		//Modified by Scofield on 2009-01-15
					else
						ls_ext_sql = " and (" + ls_AssignUser + " = '" + gs_user_id + "')"					//Modified by Scofield on 2009-01-15
					end if
				case 2
						ls_ext_sql = " and (" + ls_AssignUser + " in ('" + as_user_id + "','Public'))"	//Modified by Scofield on 2009-01-15
			end choose
		
			ls_ext_sql += This.of_gen_where_due_date(ls_tdl_module,adt_where_due_date) //Added by Ken.Guo on 2009-01-20
			
			If not lb_all_user then //Added By Jay Chen 12-05-2014
				ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
				", cnt = count(1) FROM ctx_action_items &
			 	JOIN ctx_basic_info ON ctx_action_items.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
			 	JOIN (select ctx_id from ctx_user_access_tmp  where user_id ='"+as_user_id+"' ) A on ctx_action_items.ctx_id = A.ctx_id  &
			 	JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
			 	AND Isnull(ctx_action_items.active_status,0) >= 0" + ls_ext_sql
			else
				ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
				", cnt = count(1) FROM ctx_action_items &
			 	JOIN ctx_basic_info ON ctx_action_items.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
			 	JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
			 	AND Isnull(ctx_action_items.active_status,0) >= 0" + ls_ext_sql
			end if
			
			if len(trim(ls_ext_sql)) > 0 then
				if len(trim(as_where[ll_row])) > 0 then
					as_where[ll_row] += ls_ext_sql
				else
					as_where[ll_row] = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
				if len(trim(ls_sql_where)) > 0 then
					ls_sql_where += ls_ext_sql
				else
					ls_sql_where = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
			end if
		//---------------------------- APPEON END ----------------------------	 


		case "04"
			choose case al_tdl_right
				case 0
					ls_ext_sql = " and (" + ls_AmAssignUser + " in ('" + gs_user_id + "','Public'))"			//Modified by Scofield on 2009-01-15	
				case 1
					as_other_user = trim(as_other_user)
					if len(as_other_user) > 0 then
						ls_ext_sql = " and (" + ls_AmAssignUser + " = '" + gs_user_id + "' or " + ls_AmAssignUser + " = '" +  as_other_user + "')"		//Modified by Scofield on 2009-01-15
					else
						ls_ext_sql = " and (" + ls_AmAssignUser + " = '" + gs_user_id + "')"						//Modified by Scofield on 2009-01-15
					end if
				case 2
						ls_ext_sql = " and (" + ls_AmAssignUser + " in ('" + as_user_id + "','Public'))"		//Modified by Scofield on 2009-01-15
			end choose
		
			ls_ext_sql += This.of_gen_where_due_date(ls_tdl_module,adt_where_due_date) //Added by Ken.Guo on 2009-01-20
			
			If not lb_all_user then //Added By Jay Chen 12-05-2014
				ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
				", cnt = count(1) FROM ctx_am_action_item &
				,ctx_am_document,ctx_basic_info &
				join (select ctx_id from ctx_user_access_tmp  where user_id = '"+as_user_id+"' ) A on ctx_basic_info.ctx_id = A.ctx_id  &
				JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
				where ctx_am_action_item.doc_id = ctx_am_document.doc_id and ctx_am_document.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
				AND Isnull(ctx_am_action_item.active_status,0) >= 0" + ls_ext_sql
			else
				ls_sql += "SELECT tdl_id = " + String(ll_tdl_id) + ", tdli_id = " + String(ll_tdli_id) +&
				", cnt = count(1) FROM ctx_am_action_item &
				,ctx_am_document,ctx_basic_info &
				JOIN code_lookup ctx_status On (ctx_basic_info.status = ctx_status.lookup_code And ctx_status.custom_3 = 'YES' )  &
				where ctx_am_action_item.doc_id = ctx_am_document.doc_id and ctx_am_document.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0 &
				AND Isnull(ctx_am_action_item.active_status,0) >= 0" + ls_ext_sql
			end if
			
			if len(trim(ls_ext_sql)) > 0 then
				if len(trim(as_where[ll_row])) > 0 then
					as_where[ll_row] += ls_ext_sql
				else
					as_where[ll_row] = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
				if len(trim(ls_sql_where)) > 0 then
					ls_sql_where += ls_ext_sql
				else
					ls_sql_where = mid(ls_ext_sql,5,len(ls_ext_sql) - 4)
				end if
			end if
		//---------------------------- APPEON END ----------------------------	 
	END CHOOSE
	
	
   IF lb_exists_term THEN
		CHOOSE CASE ls_tdl_module
			case '04'
				ls_sql += " and " + ls_sql_where
			case else
				ls_sql += " WHERE " + ls_sql_where
		end choose
	end if
	//---------------------------- APPEON END ----------------------------
NEXT

Return ls_sql

end function

on n_cst_tdl_function.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_tdl_function.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

