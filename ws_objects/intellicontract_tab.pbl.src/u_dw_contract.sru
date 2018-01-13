$PBExportHeader$u_dw_contract.sru
forward
global type u_dw_contract from u_dw
end type
end forward

global type u_dw_contract from u_dw
integer width = 2094
integer height = 1160
boolean ib_rmbmenu = true
event ue_populatedddws ( )
event ue_selectall ( )
event ue_deselectall ( )
event ue_keydown ( )
event ue_post_itemchanged ( long row,  string dwoname,  string data )
event ue_reset_calendar_flag ( )
event ue_restore_pic ( )
event ue_dwsyscommand pbm_syscommand
event ue_refreshcolumn_dddw ( string as_col )
event dwnmousemove pbm_dwnmousemove
event type integer pfc_check_validation ( string as_column,  string as_data,  string as_type )
end type
global u_dw_contract u_dw_contract

type prototypes
FUNCTION ulong SetCapture(ulong a) LIBRARY "user32.dll"
FUNCTION boolean ReleaseCapture() LIBRARY "user32.dll"
SUBROUTINE GetClientRect (ULONG hClntWnd, REF STR_CLIENT_RECT lpRect) LIBRARY "USER32.DLL" alias for "GetClientRect;Ansi" 
end prototypes

type variables
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.07.2006 By: LeiWei
//$<reason> Add a variable to recored enable columns
Protected Boolean ib_enable_columns = TRUE

// Add a variable to recored original dataobject name
Protected String DataObject_original
//---------------------------- APPEON END ----------------------------

protected long il_prezoom

blob   b_text_blob
BOOLEAN ib_retrieve_drop_downs /* FLAG - DETERMINS IF THE DROP DOWNS SHOULD BE RETRIEVE */
BOOLEAN ib_use_row_selection /* row selection service*/
BOOLEAN IB_allow_filter
BOOLEAN IB_allow_sort
BOOLEAN ib_read_only
BOOLEAN ib_filter_only
BOOLEAN ib_contract_alarm = FALSE //added by alfee 09.05.2007
BOOLEAN ib_allow_save = TRUE //for of_enable_save() only -added by alfee 09.30.2007

string is_lookup_search_column_table
//long ll_table_id
//long ll_field_id
//long field_order[],ll_field_width[]
////long ll_rowcount
//long integers
//long ll_start, ll_used
//long   ll_FileNum
//long   ll_return
//long li_FileNum
//

////string is_class_name[]
////string ls_table_name,ls_field_text[],ls_field_type[]
//string ls_column_name[],field_sql[]
////u_dw ldw
//string ls_Table
//string ls_file_dump
//string is_file_names[]
//string is_docname,is_named

CONSTANT STRING NEW_LINE = '~r~n'	
n_cst_string       lnv_string


// start code change --- 10.31.2005
constant string word_2003_path = 'C:\Program Files\Microsoft Office\OFFICE11\WINWORD.EXE'
// end   code change --- 10.31.2005

//n_cst_dwsrv invo_dwsrv	2007.7.12 By Jervis

string is_title_bar_text
string is_prior_field	//09.27.2009
CONSTANT String is_pic_path = 'Bitmap' //jervis 12.09.2010

//Added By Jay Chen 07-17-2015
nv_tooltip		inv_dw_tooltip //tooltip object
Long		il_tooltip_dwid // unicode tooltip handle
Long		il_tooltip_dwrow // unicode tooltip row
String		istr_tooltip_dwcolumn // unicode tooltip column
string 	is_show_tip
string is_filter_company_contact //Added By Jay Chen 10-30-2015

public:
u_multi_select iuo_select  //Added By Jay Chen 12-23-2015
String is_prior_sort_filter_field //Added By Ken.Guo 2017-03-03

datastore 	ids_multi_select //Added By Gavin.Jay 2017-04-05
boolean 		ib_reopen = false //Added By Gavin.Jay 2017-04-05
end variables

forward prototypes
public function integer of_enable_save ()
public function integer of_set_drop_down_ret ()
public function integer of_set_rowselect ()
public function integer of_allow_filter ()
public function integer of_lookup_search_dddw (string as_lookup_search_column_table)
public function integer of_disable_columns ()
public function integer of_enable_columns ()
public function integer of_getobjects (ref string as_objlist[], string as_objtype, string as_band, boolean ab_visibleonly)
public function integer of_allow_sort ()
public subroutine of_savetosort ()
public function integer of_fill_data (long row, dwobject dwo, string data, datastore ads_filldata)
public subroutine of_enable_alarm (boolean ab_alarm)
public subroutine of_set_ib_retrieved_dddw (boolean ab_retrieved)
public subroutine of_resize ()
public function integer of_set_properties (long al_data_view_id, long al_screen_id, string as_titlebar_visible_def)
public function integer of_clicklink (dwobject adwo_object, long al_row)
public subroutine of_set_move_dw (boolean abn_move_dw)
public function boolean of_check_isdate_format (string as_col_name, boolean ab_show_msg)
public function integer of_setdropdownselect (boolean ab_switch)
public subroutine of_auto_compute_field (long al_row)
public subroutine of_auto_compute_field (long al_row, string as_type)
public subroutine of_set_sort_filer (string as_columnname)
public subroutine of_set_sort_filer_restore ()
public function string of_get_multi_select (string as_colname, integer ai_viewid, integer ai_screenid)
public function integer of_set_multi_select (string as_colname, integer ai_viewid, integer ai_screenid, string as_syntax)
end prototypes

event ue_populatedddws();/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner 05 Dovember 2005  ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

String	ls_UserID

if ib_retrieve_drop_downs then return

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 03.15.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Modify the ue_populatedddws to make the applciation work properly.

/*
string ls_cach_path
ls_cach_path = gnv_app.is_application_path + '\cachedata'

if ib_retrieve_drop_downs then return 

loNG LL_COLUMN_COUNT , LL_I
string ls_dddw_name
string ls_colname

DataWindowChild dwchild
n_ds lnds_user
lnds_user  = create N_DS

LL_COLUMN_COUNT = LONG(Object.DataWindow.Column.Count)

FOR LL_I = 1 TO LL_COLUMN_COUNT
	if Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
			ls_colname = Describe("#" +STRING(LL_I) + ".Name")
			ls_dddw_name = Describe("#" +STRING(LL_I) + ".DDDW.Name")
			getchild( ls_colname, dwchild)
			gnv_app.inv_dwcache.of_GetRegistered (ls_dddw_name,lnds_user) 
			if lnds_user.ShareData ( dwchild ) <> 1 then 
					//send message during development
					IF Handle(GetApplication()) = 0 THEN 
						//messagebox('Devlopment Message',ls_dddw_name +' missing in cache')
					end if 
			else 
				//messagebox('','ok')
				
			end if 
		
	
	end if 
NEXT

//long ll_z
//
//n_cst_dwsrv Lnvo_dwsrv
//Lnvo_dwsrv =  CREATE n_cst_dwsrv
//
//IF LEN(THIS.DATAOBJECT) < 0 THEN RETURN 
//
//Lnvo_dwsrv.OF_SETrequestor( THIS)
////for ll_z = 1 to rowcount()
//if rowcount() > 0 then 
//	FOR LL_I = 1 TO LL_COLUMN_COUNT
//			if Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
//					// get the value of the column
//				if isnumber(Lnvo_dwsrv.of_getitem( 1, Describe("#" +STRING(LL_I) + ".Name"))) then 
//						//if long(Lnvo_dwsrv.of_getitem( ll_z, Describe("#" +STRING(LL_I) + ".Name"))) > 8000 then 
//							ls_dddw_name = Describe("#" +STRING(LL_I) + ".DDDW.Name")
//							gnv_app.inv_dwcache.of_UNRegister(ls_dddw_name)
//							gnv_app.inv_dwcache.of_Register(ls_dddw_name, ls_dddw_name, SQLCA, true)
//							gnv_app.inv_dwcache.of_GetRegistered (ls_dddw_name,lnds_user)
//							//messagebox('',lnds_user.SaveAs (ls_cach_path + "\"+ string(lnds_user.dataobject) + ".txt" , text!,false))
//						   if lnds_user.ShareData ( dwchild ) <> 1 then
//								
//								
//								
//									//messagebox(ls_dddw_name,'cache NOT REFRESHED')
//							 else 
//								
//								
//						   end if 
//							
//						//end if
//						
//					end if
//				
//					
//				
//			
//			end if 
//		 
////NEXT
//	
//	
//next
//
//end if
*/
LONG LL_COLUMN_COUNT , LL_I
string ls_dddw_name
string ls_colname
String ls_coltag
Integer li_value
Integer ll_lookup_code
string ls_lable
long ll_null

DataWindowChild dwchild
n_ds lnds_user

LL_COLUMN_COUNT = LONG(This.Describe("DataWindow.Column.Count"))
IF LL_COLUMN_COUNT = 0 THEN RETURN

FOR LL_I = 1 TO LL_COLUMN_COUNT
	IF Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
		ls_colname = Describe("#" +STRING(LL_I) + ".Name")
		ls_dddw_name = lower(Describe("#" +STRING(LL_I) + ".DDDW.Name"))

		If ls_colname = 'app_facility' Then
			ls_colname = ls_colname
		End If

		IF ls_dddw_name = "d_dddw_code_lookup" OR ls_dddw_name = "d_dddw_code_lookup_action_type" THEN
			ls_coltag = Lower(Describe("#" +STRING(LL_I) + ".TAG"))
			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
				
			IF li_value <> 1 THEN
				gnv_app.of_setcontraccache_code_lookup( ls_coltag )
				li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
			END IF
		elseif ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then //add d_dddw_company_list - jervis 04.18.2011
			ls_coltag = Lower(Describe("#" +STRING(LL_I) + ".TAG"))
			li_value = 1
		ELSE
			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_dddw_name,lnds_user)
		END IF

		IF li_value = 1 THEN
			getchild( ls_colname, dwchild)
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 04.25.2007 By: Jack
			//$<reason> Fix a defect.
			/*
			If ls_coltag = 'contract category' Then
				dwchild.Reset()
				lnds_user.rowscopy(1, lnds_user.rowcount(),Primary!,dwchild, 1,Primary!)
			Else
				lnds_user.ShareData ( dwchild )	
			End If			
			*/
			if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then //add d_dddw_company_list - jervis 04.15.2011
				SetNull(ll_null)
				dwchild.Settransobject( sqlca)
				If ls_dddw_name = 'dddw_contact_company_new' Then //Added By Ken.Guo 02/22/2012. Added if statement
					dwchild.Retrieve( gs_user_id)
				Else
					dwchild.Retrieve( ls_coltag)
				End If
//				//Added By Jay Chen 10-30-2015 filter active company
//				is_filter_company_contact = gnv_data.of_getitem("icred_settings", "filter_company_contact", false)
//				if is_filter_company_contact = '1' then
//					dwchild.setfilter("")
//					dwchild.filter()
//					if ls_dddw_name = 'dddw_contact_company_new' then
//						dwchild.setfilter("app_facility_status = 'A' ")
//						dwchild.filter()
//					else
//						dwchild.setfilter("status = 'A' ")
//						dwchild.filter()
//					end if
//				end if
//				//end  //Commented By Jay 2016-05-17 itemfocuschanged() include

				dwchild.InsertRow(1)
				dwchild.SetItem(1,'facility_id',ll_null)
				dwchild.setitem(1,"facility_name",'')
				// 03/06/12 added by mark Track Appeon 
				IF w_mdi.of_security_access( 6930 ) = 0 THEN
					long 	ll_finditem
					ll_finditem = dwchild.find(" facility_id = -1 ",1, dwchild.rowcount())
					if ll_finditem > 0 then 
						dwchild.RowsDiscard(ll_finditem,ll_finditem,Primary!)
					end if 
				end if
			else
				//Begin - Modified By Ken.Guo 2010-02-02. Somewhere display as numeric.
				//lnds_user.ShareData ( dwchild )	 
				If ls_coltag = 'contract category' Then
					dwchild.Reset()
					lnds_user.rowscopy(1, lnds_user.rowcount(),Primary!,dwchild, 1,Primary!)
				Else
					lnds_user.ShareData ( dwchild )	
				End If				
				//End - Modified By Ken.Guo 2010-02-02
			end if
			//---------------------------- APPEON END ----------------------------
	
			
			if ls_dddw_name = 'd_dddw_users' then
				//BEGIN---Modify by Scofield on 2009-12-09
				if dwChild.RowCount() > 0 then
					ls_UserID = dwChild.GetItemString(1,"user_id")
				end if
				
				if Not IsNull(ls_UserID) and Trim(ls_UserID) <> "" then
					dwChild.InsertRow(1)
					dwChild.SetItem(1,"user_id",'')
				end if
				//END---Modify by Scofield on 2009-12-09
			end if
		
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03.27.2007 By: Jack 
			//$<reason> Fix a defect.
			long ll_find
			string ls_displaycolumn
			ls_displaycolumn = This.Describe(ls_colname + ".dddw.displaycolumn")
			ll_find = dwchild.find(ls_displaycolumn + " = '(NONE)'",1,dwchild.rowcount())
			If ll_find > 0 Then
				dwchild.setitem(ll_find,ls_displaycolumn,'')
			End If
			//---------------------------- APPEON END ----------------------------
			
			//---------Begin Added by Alfee 09.30.2007----------------------------
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
			//----------End Added ------------------------------------------------

			
			//Start code by jervis 10.20.2009
			//dynamically change the words *Add lookup Code* to *Add Agreement Type* and 
			//replace the words lookup code with the field label
			if ls_dddw_name = "d_dddw_code_lookup" or ls_dddw_name = "d_dddw_code_lookup_action_type" then
				ll_find = dwchild.find("lookup_code = -777", 1, dwchild.rowcount())
				If ll_find > 0 Then 
					ls_lable = This.Describe(ls_colname + "_t.text")
					if ls_lable <> '!' and ls_lable <> '?' then
						dwchild.setitem(ll_find,"code","*Add " + ls_lable + "*")
						dwchild.setitem(ll_find,"description","*Add " + ls_lable + "*")
						//dwchild.setitem(ll_find,"custom_1","*Add " + ls_lable + "*")
						dwchild.setitem(ll_find,"large_description_1","*Add " + ls_lable + "*")
						dwchild.setitem(ll_find,"large_description_2","*Add " + ls_lable + "*")
					end if
				end if
			end if
			//End code by jervis 10.20.2009
			
		END IF
	END IF
NEXT

ib_retrieve_drop_downs = True


/// Comment By Gavin.Jay 2017-05-05
////Begin - Added By Gavin.Jay 2017-04-05
////task744:Word Wrap Multi Select Drop-down Fields
//string ls_coltype, ls_style
//string ls_multi_select = ""   //Modified By Ken.Guo 2017-04-26. Drop Down Box Issues  
//string ls_syntax, ls_temp
//if(il_screenid = 9 or il_screenid = 10) then
//	FOR LL_I = 1 TO LL_COLUMN_COUNT
//		IF Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
//			ls_colname = lower(Describe("#" +STRING(LL_I) + ".Name"))			
//			ls_coltype = Describe(ls_colname+".coltype")
//			
//			if left(lower(ls_coltype),4) = 'char' and left (ls_colname,7) = 'custom_' then
//		
//				ls_multi_select = "" //Modified By Ken.Guo 2017-04-26. Drop Down Box Issues  
//				select object_format into :ls_multi_select from screen_field_select_item_attribute where view_id = :il_viewid and screen_id = :il_screenid and object_name = :ls_colname and object_type = 'multi-select'; 
//				if isnull(ls_multi_select) then ls_multi_select = ''
//				if ls_multi_select = '' then ls_multi_select = 'N'
//				if ls_multi_select = 'Y' then 					
//					ls_syntax='' //Modified By Ken.Guo 2017-04-26. Drop Down Box Issues  
//					ls_temp=''
//					
//					ls_temp = This.Describe(ls_colname + ".dddw.name")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.name='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.displaycolumn")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.displaycolumn='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.datacolumn")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.datacolumn='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.allowedit")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.allowedit='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.useasborder")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.useasborder='" + ls_temp + "' "
//					
//					ls_temp = This.Describe(ls_colname + ".dddw.autohscroll")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.autohscroll='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.autoretrieve")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.autoretrieve='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.hscrollbar")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.hscrollbar='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.hsplitscroll")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.hsplitscroll='" + ls_temp + "' "
//					
//					ls_temp = This.Describe(ls_colname + ".dddw.imemode")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.imemode='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.limit")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.limit='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.nilisnull")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.nilisnull='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.percentwidth")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.percentwidth='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.required")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.required='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.showlist")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.showlist='" + ls_temp + "' "
//					ls_temp = This.Describe(ls_colname + ".dddw.vscrollbar")
//					ls_syntax = ls_syntax + ls_colname + ".dddw.vscrollbar='" + ls_temp + "' "
//					
//					If  of_set_multi_select(ls_colname,il_viewid,il_screenid, ls_syntax)= 1 then		
//						//WEB tab selectionchanged:  @u_tabpg_contract_detail1::of_display_multi_company
//						if (il_screenid = 9) then
//							ls_syntax = ls_colname + ".edit.limit=0 "+ls_colname+".edit.case=any "+ls_colname+".edit.focusrectangle='no' "+ls_colname+".edit.autoselect='yes' " &
//									+ ls_colname+".edit.nilisnull='yes' " + ls_colname+".edit.imemode=0 " + ls_colname+".edit.autohscroll='no' " + ls_colname+".edit.autovscroll='no' " &
//									+ ls_colname+".edit.codetable='no' " + ls_colname+".edit.displayonly='yes' " + ls_colname+".edit.hscrollbar='no' " + ls_colname+".edit.vscrollbar='no' "
//							This.Modify ( ls_syntax )
//						end If
//						//first: ib_reopen = false  script in function of_set_drop_down_ret()
//						If(ib_reopen and il_screenid = 10 ) then
//							ls_syntax = ls_colname + ".edit.limit=0 "+ls_colname+".edit.case=any "+ls_colname+".edit.focusrectangle='no' "+ls_colname+".edit.autoselect='yes' " &
//									+ ls_colname+".edit.nilisnull='yes' " + ls_colname+".edit.imemode=0 " + ls_colname+".edit.autohscroll='no' " + ls_colname+".edit.autovscroll='no' " &
//									+ ls_colname+".edit.codetable='no' " + ls_colname+".edit.displayonly='yes' " + ls_colname+".edit.hscrollbar='no' " + ls_colname+".edit.vscrollbar='no' "
//							This.Modify ( ls_syntax )
//						End If
//					End If
//					ls_syntax= ""
//				End if
//			End If
//	
//		End if
//	Next
//End If
////End - Added By Gavin.Jay 2017-04-05


Return
//---------------------------- APPEON END ----------------------------
end event

event ue_selectall();long ll_i

if ib_read_only then return //Added by Alfee 09.30.2007

this.setredraw(false)

for ll_i = 1 to rowcount()
	this.object.selected[ll_i] = 1
next
OF_ENABLE_SAVE( )
this.setredraw(true)
end event

event ue_deselectall();long ll_i

if ib_read_only then return //Added by Alfee 09.30.2007

this.setredraw(false)

for ll_i = 1 to rowcount()
	this.object.selected[ll_i] = 0
next
of_enable_save( )
this.setredraw(true)
end event

event ue_post_itemchanged(long row, string dwoname, string data);
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
**  Created By	: Michael B. Skinner 27 March  2006 ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/


//Notes by Ken: APB not spport dwo argument type.  so use dwoname



String ls_column_name
integer res	
datawindowchild dwchild



if data = '-777' then 
	
	ls_column_name =GetColumnName()
   res = This.GetChild( ls_column_name, dwchild )
   if res > 0 then
		IF dwchild.RowCount() > 2 THEN 
				is_lookup_search_column_table = dwchild.GetItemString( dwchild.rowcount(), "lookup_name" )
		END IF
   end if
	of_lookup_search_dddw(is_lookup_search_column_table )
   
end if 

of_auto_compute_field(row,'E') //Added By Ken.Guo 2016-08-17
end event

event ue_reset_calendar_flag();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.06.2006 By: LeiWei
//$<reason> Fix a defect.
//$<modification> Set variables of iuo_calendar to NULL when this datawindow is re-created.

If isvalid(iuo_Calendar) Then
	iuo_Calendar.of_reset_flag( )
End If

ib_enable_columns = TRUE
ib_read_only = FALSE

//$<add> 09.18.2006 By: LeiWei
//$<reason> The X button should be disabled on all datawindow title bars.
This.Controlmenu = False

//---------------------------- APPEON END ----------------------------

//Reset prezoom when re-create dw
il_prezoom = 0

//Start Code By Jervis 04.17.2008
//Move to of_resize()
of_resize()		
/*
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.23.2006 By: Gary
//$<reason> Fix a defect.
//$<reason> The following script copies from pfc_n_cst_sie.of_set_size().

IF gb_autoresize THEN
	datawindowchild ldw_child
	long li_height,li_width,li_zoom,ll_count,ll_i
	string ls_column_name
	string ls_desc2
	
	str_client_rect lstr_client_rect  
	
	GetClientRect(handle(iw_parent),lstr_client_rect)
	
	li_width = pixelstoUnits(lstr_client_rect.right,XPixelsToUnits!)
	
	//li_zoom =  li_width / 2800 * 100
	
	// start code change --- 11.23.2005 MSKINNER
	li_zoom =  li_width / 4000 * 100 
	// start code change --- 11.23.2005 MSKINNER
	
	//$<add> 11.07.2006 By: Davis
	//$<reason> Fix a defect.
	Long li_zoom2
	li_height = pixelstoUnits(lstr_client_rect.bottom,YPixelsToUnits!)
	li_zoom2 = li_height / 2200 * 100 
	IF li_zoom > li_zoom2 THEN li_zoom = li_zoom2
	//$<add> 11.07.2006 By: Davis
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05.11.2007 By: Jack
	//$<reason> Fix a defect.
	/*
	if li_zoom < 100 then li_zoom = 100
	*/
	If isvalid(w_contract) Then
		If w_contract.windowstate = maximized! Then
			If li_zoom < 116 Then li_zoom = 116
		Else
			if li_zoom < 100 then li_zoom = 100
		End If
	Else
		if li_zoom < 100 then li_zoom = 100
	End If	
	//---------------------------- APPEON END ----------------------------

	this.object.datawindow.zoom = li_zoom
	// loop through the columns and see if it a DDDW and zoom it as well
	 for ll_i = 1 to long(this.Object.DataWindow.Column.Count)
		ls_column_name = "#" + string(ll_i) + ".name"
		ls_desc2 = this.Describe("#" + string(ll_i) + ".name") + ".Edit.Style"
		
		if this.Describe(ls_desc2) = 'dddw' then
			this.GetChild( this.Describe(ls_column_name), ldw_child )
			ldw_child.Modify('datawindow.zoom=' + string(li_zoom))
		end if 
	 next			 
END IF

//---------------------------- APPEON END ----------------------------
*/
//End Code By Jervis 04.17.2008

end event

event ue_restore_pic();//Add by jervis 12.09.2010
//Dynamic restore picture in screen
datastore lds_pic
long ll_i,ll_count
string ls_filename, ls_FileName2
string ls_picname
string ls_path, ls_Path2
blob 	lb_file,lb_temp
long ll_pic_id
long ll_datalen,ll_readcnts,ll_readcycle,ll_start
n_cst_filesrv   lnv_filesrv
//Added By Jay Chen 12-13-2013
long ll_painter_id
string ls_type

setnull(ll_painter_id)
lds_pic = create datastore
lds_pic.dataobject = 'd_conv_view_pic'
lds_pic.SetTransobject( sqlca)
ll_count = lds_pic.Retrieve( il_ViewId,il_ScreenId)
lnv_filesrv = create n_cst_filesrv //Added By Jay Chen 02-19-2014

//Parse path
ls_path = gs_dir_path + gs_DefDirName +"\" + is_pic_path + "\"
gnv_appeondll.of_parsepath(ls_path)
ls_Path2 = ls_Path
	
for ll_i = 1 to ll_count
	ls_picname = lds_pic.GetItemString( ll_i,"pic_name")
	ls_filename = lds_pic.GetItemString( ll_i,"pic_filename")
	ll_pic_id = lds_pic.GetItemNumber( ll_i,"pic_id")
	
	//download pic from db
	if ls_filename = '!' or ls_filename = '' or ls_filename = '?' or isnull( ls_filename ) then 
		this.Modify( ls_picname + ".filename =''")
		continue 
	End If
	ls_path = ls_path + ls_filename
	if not fileexists(ls_path) or FileLength( ls_Path ) = 0 then //Added By Ken.Guo 09/16/2013. added FileLength( ls_Path ) = 0
		//Added By Jay Chen 12-13-2013
		select pic_painter_id into :ll_painter_id from conv_view_pic where pic_id = :ll_pic_id;
		if ll_painter_id > 0 then 
			ls_type = 'painter'
		else 
			ls_type = 'system'
		end if
//		Modified By Jay Chen 12-13-2013
//		select datalength(pic_bitmap) into :ll_datalen from conv_view_pic where pic_id = :ll_pic_id;
		if ls_type = 'system' then
			select datalength(pic_bitmap) into :ll_datalen from conv_view_pic where pic_id = :ll_pic_id;
		else
			select datalength(file_image) into :ll_datalen from ctx_pictures where id = :ll_painter_id;
		end if
		if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_datalen > 8000 then
			ll_ReadCnts = Ceiling(ll_datalen/8000)
			
			for ll_ReadCycle = 1 To ll_ReadCnts
				ll_Start = (ll_ReadCycle - 1) * 8000 + 1
//				SELECTBLOB SubString(pic_bitmap,:ll_Start,8000) INTO :lb_Temp	from conv_view_pic where pic_id = :ll_pic_id;
				if ls_type = 'system' then 
					SELECTBLOB SubString(pic_bitmap,:ll_Start,8000) INTO :lb_Temp  from conv_view_pic where pic_id = :ll_pic_id;
				else
					SELECTBLOB SubString(file_image,:ll_Start,8000) INTO :lb_Temp	from ctx_pictures where  id = :ll_painter_id;
				end if
				lb_file += lb_Temp
			next
		else
//			selectblob pic_bitmap into :lb_file from conv_view_pic where pic_id = :ll_pic_id;
			if ls_type = 'system' then
				selectblob pic_bitmap into :lb_file from conv_view_pic where pic_id = :ll_pic_id;
			else
				selectblob file_image into :lb_file from ctx_pictures where  id = :ll_painter_id;
			end if
		end if
		AppeonWriteFile(ls_path, lb_file,len(lb_file))
	end if
	
	If FileLength( ls_Path ) = 0 or Not fileexists ( ls_Path ) Then//added by gavins 20120528
		ls_FileName2 = this.Describe( ls_PicName + ".filename" )
		If Len( ls_fileName2  ) > 2 And FileExists(  ls_fileName2 ) Then
			lnv_filesrv.of_fileread( ls_Path2 + ls_fileName2, ref lb_file)
//			If len( lb_file ) > 0 Then //Modified By Jay Chen 12-13-2013
			If len( lb_file ) > 0 and (isnull(ll_painter_id) or ll_painter_id = 0) Then
				Updateblob conv_view_pic set pic_bitmap = :lb_file where pic_id = :ll_pic_id;
				ls_fileName2 = Mid( ls_fileName2, LastPos( ls_fileName2 , '\' ) + 1 )
				update conv_view_pic      set pic_filename=:ls_fileName2 where pic_id = :ll_pic_id;
			End If
		End If
		this.Modify( ls_picname + ".filename =''")
		Continue
	End If
	//Reset the path
	this.Modify( ls_picname + ".filename ='" + ls_path + "'")
	ls_path = gs_dir_path + gs_DefDirName +"\" + is_pic_path + "\"
next

destroy lds_pic


end event

event ue_dwsyscommand;//====================================================================
// Event: ue_dwsyscommand
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	commandtype
// 	xpos
// 	ypos
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	gavin		Date: 2012-12-05
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//Added By Mark Lee 01/07/2013
//if commandtype = 61458 then
if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if

end event

event ue_refreshcolumn_dddw(string as_col);//====================================================================
// Event: ue_refreshcolumn_dddw
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_col
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 01-14-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String	ls_UserID


//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 03.15.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Modify the ue_populatedddws to make the applciation work properly.

/*
string ls_cach_path
ls_cach_path = gnv_app.is_application_path + '\cachedata'

if ib_retrieve_drop_downs then return 

loNG LL_COLUMN_COUNT , LL_I
string ls_dddw_name
string ls_colname

DataWindowChild dwchild
n_ds lnds_user
lnds_user  = create N_DS

LL_COLUMN_COUNT = LONG(Object.DataWindow.Column.Count)

FOR LL_I = 1 TO LL_COLUMN_COUNT
	if Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
			ls_colname = Describe("#" +STRING(LL_I) + ".Name")
			ls_dddw_name = Describe("#" +STRING(LL_I) + ".DDDW.Name")
			getchild( ls_colname, dwchild)
			gnv_app.inv_dwcache.of_GetRegistered (ls_dddw_name,lnds_user) 
			if lnds_user.ShareData ( dwchild ) <> 1 then 
					//send message during development
					IF Handle(GetApplication()) = 0 THEN 
						//messagebox('Devlopment Message',ls_dddw_name +' missing in cache')
					end if 
			else 
				//messagebox('','ok')
				
			end if 
		
	
	end if 
NEXT

//long ll_z
//
//n_cst_dwsrv Lnvo_dwsrv
//Lnvo_dwsrv =  CREATE n_cst_dwsrv
//
//IF LEN(THIS.DATAOBJECT) < 0 THEN RETURN 
//
//Lnvo_dwsrv.OF_SETrequestor( THIS)
////for ll_z = 1 to rowcount()
//if rowcount() > 0 then 
//	FOR LL_I = 1 TO LL_COLUMN_COUNT
//			if Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
//					// get the value of the column
//				if isnumber(Lnvo_dwsrv.of_getitem( 1, Describe("#" +STRING(LL_I) + ".Name"))) then 
//						//if long(Lnvo_dwsrv.of_getitem( ll_z, Describe("#" +STRING(LL_I) + ".Name"))) > 8000 then 
//							ls_dddw_name = Describe("#" +STRING(LL_I) + ".DDDW.Name")
//							gnv_app.inv_dwcache.of_UNRegister(ls_dddw_name)
//							gnv_app.inv_dwcache.of_Register(ls_dddw_name, ls_dddw_name, SQLCA, true)
//							gnv_app.inv_dwcache.of_GetRegistered (ls_dddw_name,lnds_user)
//							//messagebox('',lnds_user.SaveAs (ls_cach_path + "\"+ string(lnds_user.dataobject) + ".txt" , text!,false))
//						   if lnds_user.ShareData ( dwchild ) <> 1 then
//								
//								
//								
//									//messagebox(ls_dddw_name,'cache NOT REFRESHED')
//							 else 
//								
//								
//						   end if 
//							
//						//end if
//						
//					end if
//				
//					
//				
//			
//			end if 
//		 
////NEXT
//	
//	
//next
//
//end if
*/
LONG LL_COLUMN_COUNT , LL_I
string ls_dddw_name
string ls_colname
String ls_coltag
Integer li_value
Integer ll_lookup_code
string ls_lable
long ll_null

DataWindowChild dwchild
n_ds lnds_user

LL_COLUMN_COUNT = LONG(This.Describe("DataWindow.Column.Count"))
IF LL_COLUMN_COUNT = 0 THEN RETURN

FOR LL_I = 1 TO LL_COLUMN_COUNT
	IF Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
		ls_colname = Describe("#" +STRING(LL_I) + ".Name")
		if ls_colname <> as_col then continue
		ls_dddw_name = lower(Describe("#" +STRING(LL_I) + ".DDDW.Name"))

		If ls_colname = 'app_facility' Then
			ls_colname = ls_colname
		End If

		IF ls_dddw_name = "d_dddw_code_lookup" OR ls_dddw_name = "d_dddw_code_lookup_action_type" THEN
			ls_coltag = Lower(Describe("#" +STRING(LL_I) + ".TAG"))
			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
				
			IF li_value <> 1 THEN
				gnv_app.of_setcontraccache_code_lookup( ls_coltag )
				li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
			END IF
		elseif ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then //add d_dddw_company_list - jervis 04.18.2011
			ls_coltag = Lower(Describe("#" +STRING(LL_I) + ".TAG"))
			li_value = 1
		ELSE
			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_dddw_name,lnds_user)
		END IF

		IF li_value = 1 THEN
			getchild( ls_colname, dwchild)
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 04.25.2007 By: Jack
			//$<reason> Fix a defect.
			/*
			If ls_coltag = 'contract category' Then
				dwchild.Reset()
				lnds_user.rowscopy(1, lnds_user.rowcount(),Primary!,dwchild, 1,Primary!)
			Else
				lnds_user.ShareData ( dwchild )	
			End If			
			*/
			if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then //add d_dddw_company_list - jervis 04.15.2011
				SetNull(ll_null)
				dwchild.Settransobject( sqlca)
				If ls_dddw_name = 'dddw_contact_company_new' Then //Added By Ken.Guo 02/22/2012. Added if statement
					dwchild.Retrieve( gs_user_id)
				Else
					dwchild.Retrieve( ls_coltag)
				End If
//				//Added By Jay Chen 10-30-2015 filter active company
//				is_filter_company_contact = gnv_data.of_getitem("icred_settings", "filter_company_contact", false)
//				if is_filter_company_contact = '1' then
//					dwchild.setfilter("")
//					dwchild.filter()
//					if ls_dddw_name = 'dddw_contact_company_new' then
//						dwchild.setfilter("app_facility_status = 'A' ")
//						dwchild.filter()
//					else
//						dwchild.setfilter("status = 'A' ")
//						dwchild.filter()
//					end if
//				end if
//				//end //Commented By Jay 2016-05-17 itemfocuschanged() include
				dwchild.InsertRow(1)
				dwchild.SetItem(1,'facility_id',ll_null)
				dwchild.setitem(1,"facility_name",'')
				// 03/06/12 added by mark Track Appeon 
				IF w_mdi.of_security_access( 6930 ) = 0 THEN
					long 	ll_finditem
					ll_finditem = dwchild.find(" facility_id = -1 ",1, dwchild.rowcount())
					if ll_finditem > 0 then 
						dwchild.RowsDiscard(ll_finditem,ll_finditem,Primary!)
					end if 
				end if
			else
				//Begin - Modified By Ken.Guo 2010-02-02. Somewhere display as numeric.
				//lnds_user.ShareData ( dwchild )	 
				If ls_coltag = 'contract category' Then
					dwchild.Reset()
					lnds_user.rowscopy(1, lnds_user.rowcount(),Primary!,dwchild, 1,Primary!)
				Else
					lnds_user.ShareData ( dwchild )	
				End If				
				//End - Modified By Ken.Guo 2010-02-02
			end if
			//---------------------------- APPEON END ----------------------------
	
			
			if ls_dddw_name = 'd_dddw_users' then
				//BEGIN---Modify by Scofield on 2009-12-09
				if dwChild.RowCount() > 0 then
					ls_UserID = dwChild.GetItemString(1,"user_id")
				end if
				
				if Not IsNull(ls_UserID) and Trim(ls_UserID) <> "" then
					dwChild.InsertRow(1)
					dwChild.SetItem(1,"user_id",'')
				end if
				//END---Modify by Scofield on 2009-12-09
			end if
		
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 03.27.2007 By: Jack 
			//$<reason> Fix a defect.
			long ll_find
			string ls_displaycolumn
			ls_displaycolumn = This.Describe(ls_colname + ".dddw.displaycolumn")
			ll_find = dwchild.find(ls_displaycolumn + " = '(NONE)'",1,dwchild.rowcount())
			If ll_find > 0 Then
				dwchild.setitem(ll_find,ls_displaycolumn,'')
			End If
			//---------------------------- APPEON END ----------------------------
			
			//---------Begin Added by Alfee 09.30.2007----------------------------
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
			//----------End Added ------------------------------------------------

			
			//Start code by jervis 10.20.2009
			//dynamically change the words *Add lookup Code* to *Add Agreement Type* and 
			//replace the words lookup code with the field label
			if ls_dddw_name = "d_dddw_code_lookup" or ls_dddw_name = "d_dddw_code_lookup_action_type" then
				ll_find = dwchild.find("lookup_code = -777", 1, dwchild.rowcount())
				If ll_find > 0 Then 
					ls_lable = This.Describe(ls_colname + "_t.text")
					if ls_lable <> '!' and ls_lable <> '?' then
						dwchild.setitem(ll_find,"code","*Add " + ls_lable + "*")
						dwchild.setitem(ll_find,"description","*Add " + ls_lable + "*")
						//dwchild.setitem(ll_find,"custom_1","*Add " + ls_lable + "*")
						dwchild.setitem(ll_find,"large_description_1","*Add " + ls_lable + "*")
						dwchild.setitem(ll_find,"large_description_2","*Add " + ls_lable + "*")
					end if
				end if
			end if
			//End code by jervis 10.20.2009
			
		END IF
	END IF
NEXT

ib_retrieve_drop_downs = True

Return
//---------------------------- APPEON END ----------------------------
end event

event dwnmousemove;//Added By Jay Chen 07-20-2015
//is_show_tip = gnv_data.of_getitem("icred_settings","show_column_tip",false)
//if isnull(is_show_tip) or is_show_tip = '' then is_show_tip = '0'
if is_show_tip = '1' then 
	if isvalid(inv_dw_tooltip) then
		inv_dw_tooltip.f_uo_dwnmousemove(This, dwo, row,il_tooltip_dwid, False, '', '', '',il_ViewId,il_ScreenId)
	end if
end if
end event

event type integer pfc_check_validation(string as_column, string as_data, string as_type);//====================================================================
// Event: pfc_check_validation
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_column
// 	value    string    as_data
// 	value    string    as_type
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 08/07/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
// the return value was use from itemerror event return value.
//====================================================================
string 		ls_validation, ls_msg, ls_tmp, ls_arr[]
long			i

Choose case lower(as_type) 
	case lower("Email Address")
//		ls_validation = string(this.describe( string(as_column)+".validation"))
//		ls_msg = string(this.describe( string(as_column)+".validationmsg"))
		
		if Pos(string(as_data), ';') > 0 then 
			gnv_string.of_parsetoarray( string(as_data),';', ls_arr)
			for i = 1 to upperbound(ls_arr)				
				ls_tmp = ls_arr[i]
				if (not isnull(ls_tmp) and len(ls_tmp) > 4 and  pos(ls_tmp,'@') > 1 and lastpos(ls_tmp,'.') > pos(ls_tmp,'@') +1 and lastpos(ls_tmp,'.') <> len(ls_tmp) and pos(ls_tmp,' ') = 0 ) or trim(ls_tmp)="" then		
					//continue
				else
	//						Messagebox("DataWindow Error","The '"+ls_tmp +"' is not a valid email address. ~r~nThe data will be rolled back.  ~r~nPlease enter a valid email address such as sample@domain.com.")
					Messagebox(gnv_app.iapp_object.DisplayName,"The '"+ls_tmp +"' is not a valid email address. ~r~nThe data will be rolled back.  ~r~nPlease enter a valid email address such as sample@domain.com.")
					return 3
				end if 
			next 	
			return 2 				// Accept the data value							
		else 
			ls_tmp = string(as_data)
			if (not isnull(ls_tmp) and len(ls_tmp) > 4 and  pos(ls_tmp,'@') > 1 and lastpos(ls_tmp,'.') > pos(ls_tmp,'@') +1 and lastpos(ls_tmp,'.') <> len(ls_tmp) and pos(ls_tmp,' ') = 0 ) or trim(ls_tmp)="" then		
				return 2 				// Accept the data value				
			else
				Messagebox(gnv_app.iapp_object.DisplayName,"The '"+ls_tmp +"' is not a valid email address. ~r~nThe data will be rolled back.  ~r~nPlease enter a valid email address such as sample@domain.com.")
				return 3	// (Default) Reject the data value and show an error message box
			end if 
		end if 
	case else
	
End choose 

return 3
end event

public function integer of_enable_save ();


//
//if this.GetRow() < 1 then return success
//this.accepttext( )
//if not isvalid(m_pfe_cst_mdi_menu_contract) then return success
//
//dwItemStatus l_status
//
//l_status = this.GetItemStatus( this.GetRow(), 0, Primary!)

///if l_status = newmodified! or l_status = datamodified! then 

//----Begin Modified by Alfee 09.30.2007-----------------------
//<$Reason>For both search datawindows(can be modified manaully) and
//<$Reason>read only data windows(may be modified by sytem), the save
//<$Reason>menu item needn't be enabled.
//if isvalid(m_pfe_cst_mdi_menu_contract) THEN 
if isvalid(m_pfe_cst_mdi_menu_contract) and ib_allow_save and not ib_read_only THEN 	
//----End Modified ---------------------------------------------	
//	m_pfe_cst_mdi_menu_contract.m_file.m_save.enabled = true
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_contract.m_file.m_save, 'enabled', true )//modified by gavins 20130314
END IF 
//else 
///end if 

RETURN SUCcess
end function

public function integer of_set_drop_down_ret ();/******************************************************************************************************************
**  [PUBLIC]   : of_set_drop_down_ret( )
**==================================================================================================================
**  Purpose   	: Do not retrieve the drop downs if ib_do_not_retrieve_drop_downs = false
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 27 Febuary 2006 ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                      Reason
** ------------------------------------------------------------------------------------------------------------------
**    mskinner              09 March 2006                    added try catch, sometimes the object is null
**    mskinner					 03 May 2006 							 Turn off drop down caching for now need to fix
********************************************************************************************************************/
LONG LL_COLUMN_COUNT,LL_I

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.11.2006 By: LeiWei
String ls_modify
String ls_colname, ls_coltype, ls_multi_select, ls_syntax, ls_temp //Added By Gavin.Jay 2017-04-05

//---------------------------- APPEON END ----------------------------

try
// the following shoule be removed later to reuse the cahing
//ib_retrieve_drop_downs = true

if not ib_retrieve_drop_downs then
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 09.08.2006 By: LeiWei
	//$<reason> Fix a defect.
	/*
	if f_validstr(Object.DataWindow.Name) then 
		LL_COLUMN_COUNT = LONG(Object.DataWindow.Column.Count)
		FOR LL_I = 1 TO LL_COLUMN_COUNT
			if Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
				Modify("#" +STRING(LL_I)  + ".DDDW.AutoRetrieve=no")
			END IF 
		NEXT
	end if
	*/
	if f_validstr(Describe("DataWindow.Name")) then 
		LL_COLUMN_COUNT = LONG(Describe("DataWindow.Column.Count"))
		FOR LL_I = 1 TO LL_COLUMN_COUNT
			if Lower(Describe("#" +STRING(LL_I) + ".DDDW.AutoRetrieve")) = 'yes' then
				ls_modify = "#" +STRING(LL_I)  + ".DDDW.AutoRetrieve=no "
			END IF 
		NEXT
		Modify(ls_modify)
	end if
else 
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 09.08.2006 By: LeiWei
	//$<reason> Fix a defect.
	/*
	if f_validstr(Object.DataWindow.Name) then 
		LL_COLUMN_COUNT = LONG(Object.DataWindow.Column.Count)
		FOR LL_I = 1 TO LL_COLUMN_COUNT
			if Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
				Modify("#" +STRING(LL_I)  + ".DDDW.AutoRetrieve=yes")
			END IF 
		NEXT
	end if
	*/
	if f_validstr(Describe("DataWindow.Name")) then 
		LL_COLUMN_COUNT = LONG(Describe("DataWindow.Column.Count"))
		FOR LL_I = 1 TO LL_COLUMN_COUNT
			if Describe("#" +STRING(LL_I) + ".DDDW.AutoRetrieve") = 'no' then
				ls_modify = "#" +STRING(LL_I)  + ".DDDW.AutoRetrieve=yes "
			END IF 
		NEXT
		Modify(ls_modify)
//Comment By Gavin.Jay 2017-05-05
//		//Begin - Added By Gavin.Jay 2017-04-05
//		//task744:Word Wrap Multi Select Drop-down Fields
//		if  ( il_screenid = 10)  Then			
//			FOR LL_I = 1 TO LL_COLUMN_COUNT
//				IF Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
//					ls_colname = lower ( Describe("#" +STRING(LL_I) + ".Name"))
//					ls_coltype = Describe(ls_colname+".coltype")					
//					if left(lower(ls_coltype),4) = 'char' and left (ls_colname,7) = 'custom_' then					
//						
//						select object_format into :ls_multi_select from screen_field_select_item_attribute where view_id = :il_viewid and screen_id = :il_screenid and object_name = :ls_colname and object_type = 'multi-select'; 
//						if isnull(ls_multi_select) then ls_multi_select = ''
//						if ls_multi_select = '' then ls_multi_select = 'N'
//						if ls_multi_select = 'Y' then 	
//							ls_temp = This.Describe(ls_colname + ".dddw.name")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.name='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.displaycolumn")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.displaycolumn='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.datacolumn")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.datacolumn='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.allowedit")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.allowedit='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.useasborder")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.useasborder='" + ls_temp + "' "
//							
//							ls_temp = This.Describe(ls_colname + ".dddw.autohscroll")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.autohscroll='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.autoretrieve")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.autoretrieve='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.hscrollbar")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.hscrollbar='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.hsplitscroll")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.hsplitscroll='" + ls_temp + "' "
//							
//							ls_temp = This.Describe(ls_colname + ".dddw.imemode")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.imemode='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.limit")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.limit='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.nilisnull")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.nilisnull='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.percentwidth")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.percentwidth='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.required")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.required='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.showlist")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.showlist='" + ls_temp + "' "
//							ls_temp = This.Describe(ls_colname + ".dddw.vscrollbar")
//							ls_syntax = ls_syntax + ls_colname + ".dddw.vscrollbar='" + ls_temp + "' "
//							
//							If  of_set_multi_select(ls_colname,il_viewid,il_screenid, ls_syntax)= 1 then							
//								ls_syntax = ls_colname + ".edit.limit=0 "+ls_colname+".edit.case=any "+ls_colname+".edit.focusrectangle='no' "+ls_colname+".edit.autoselect='no' " &
//										+ ls_colname+".edit.nilisnull='yes' " + ls_colname+".edit.imemode=0 " + ls_colname+".edit.autohscroll='no' " + ls_colname+".edit.autovscroll='no' " &
//										+ ls_colname+".edit.codetable='no' " + ls_colname+".edit.displayonly='yes' " + ls_colname+".edit.hscrollbar='no' " + ls_colname+".edit.vscrollbar='no' "
//								This.Modify ( ls_syntax )
//							End If
//							ls_syntax= ""
//						End if
//					End If			
//				End if
//			Next	
//		end if
//		ib_reopen = true
//	
//		//End - Added By Gavin.Jay 2017-04-05
		
		
	end if
	//---------------------------- APPEON END ----------------------------
	
end if 

catch (runtimeerror rte)
end try

return 0
end function

public function integer of_set_rowselect ();/******************************************************************************************************************
**  [PUBLIC]   : of_set_rowselect( )
**==================================================================================================================
**  Purpose   	: turns off/on row selection  service
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 27 Febuary 2006 ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

if ib_use_row_selection = true then
	of_SetRowManager(TRUE)
   of_SetRowSelect(TRUE)
end if


return 0
end function

public function integer of_allow_filter ();/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner 17 March 2006 ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/


if ib_allow_filter then 
	of_SetFilter(TRUE)
   inv_filter.of_SetColumnDisplayNameStyle(2)
	inv_filter.of_SetVisibleOnly ( true )
   inv_filter.of_SetStyle(inv_filter.EXTENDED)
   //inv_filter.Event pfc_FilterDlg()
end if 

return success
end function

public function integer of_lookup_search_dddw (string as_lookup_search_column_table);/******************************************************************************************************************
**  [PUBLIC]   : of_lookup_search_dddw( /*string as_type */)
**==================================================================================================================
**  Purpose   	: Set the vales from the search window or back to the original value
**==================================================================================================================
**  Arguments 	: [string] as_type - not used
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: ??
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
**  MSkinner 						 19 December 2005                           I was getin a GPF on line 24 of the original code
**  mskinner 						 23 March    2006                           Modoified code so that -777 or -888 will not be saved
********************************************************************************************************************/


DataWindowChild dwchild
any l_any
long li_row_cnt
long ll_val
long ll_find
String ls_column_nm
String ls_retval
String ls_search_type
String ls_value
any ll_null
setnull(ll_null)

n_cst_dwsrv lnv_dwsrv
lnv_dwsrv = create n_cst_dwsrv
lnv_dwsrv.of_setrequestor( this)

ls_column_nm = GetColumnName()

ls_retval = Describe( ls_column_nm + ".DDDW.DisplayColumn" )

getchild( ls_column_nm, dwchild)

OpenWithParm( w_lookup_search_dddw,'C' + "@" + as_lookup_search_column_table )

IF Message.StringParm = "Cancel" THEN
	
	ls_value = lnv_dwsrv.of_getitem( GetRow(), ls_column_nm , primary!,true)
	if string(ls_value) = "-777" OR string(ls_value) = "-888" then
		setnull(ls_value)
	end if
	if not f_validstr(ls_value) then setnull(ls_value)
	lnv_dwsrv.of_setitem( GetRow(), ls_column_nm, ls_value)
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Add> 08.23.2007 By: Evan
	//$<Reason> Need to destroy object.
	if IsValid(lnv_dwsrv) then Destroy lnv_dwsrv
	//---------------------------- APPEON END ----------------------------

	RETURN -1
else
	l_any = Message.DoubleParm
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 09.01.2006 By: LeiWei
	//$<reason> Fix a defect.

	gnv_app.of_setcontraccache_code_lookup( as_lookup_search_column_table )
	
	//---------------------------- APPEON END ----------------------------
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 04-04-2007 By: Ken.Guo
	//$<reason> For 'Contract Category' Type,
	//Because it is not sharedata, so need rowscopy again by ue_populatedddws( )
	//------Begin Modified by Alfee 05.16.2007----------------------
	//If as_lookup_search_column_table = 'Contract Category' Then
	If as_lookup_search_column_table = 'Contract Category' Or &
		as_lookup_search_column_table = 'Contract Clause Category'  Then		
	//------End Modified--------------------------------------------		
		ib_retrieve_drop_downs = False
		event ue_populatedddws( )
	End If
	
	//Added By Jay Chen 01-14-2014
	if isvalid(w_contract_contact) then
		if  w_contract_contact.ib_dw2_itemchange then
			event ue_refreshcolumn_dddw(ls_column_nm)
		end if
	end if
	
	//Added By Ken.Guo 11/06/2013. for Details-> Category Field. need refresh category DDDW 
	String ls_code, ls_desc
	Long ll_new_row
	If ls_column_nm = 'category' and Describe( ls_column_nm + ".dddw.name" ) = 'd_dddw_user_access_category' and as_lookup_search_column_table = 'Contract Category' Then
		If dwchild.find('lookup_code = ' + String(l_any), 1, dwchild.RowCount() ) = 0 Then
			ls_code = gnv_data.of_getitem( 'code_lookup', 'code', 'lookup_code = ' + String(l_any))
			ls_desc = gnv_data.of_getitem( 'code_lookup', 'description', 'lookup_code = ' + String(l_any))
			ll_new_row = dwchild.InsertRow(0)
			dwchild.setitem(ll_new_row, 'code', ls_code )
			dwchild.setitem(ll_new_row, 'lookup_code', Long(l_any) )
			dwchild.setitem(ll_new_row, 'lookup_name', as_lookup_search_column_table )
			dwchild.setitem(ll_new_row, 'description', ls_desc )
		End If
	End If	
	
	
	lnv_dwsrv.of_setitem( GetRow(), ls_column_nm, string(l_any))
	accepttext()
	//---------------------------- APPEON END ----------------------------
end if

setpointer(hourglass!)
setcapture( handle(getapplication()))

//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 09.04.2006 By: LeiWei
//$<reason> Performance tuning.
/*
gnv_app.ib_ref_cache = true

gnv_app.of_setcontraccache( )

event ue_populatedddws( )
*/
//---------------------------- APPEON END ----------------------------


setcolumn(ls_column_nm)
releasecapture( )
setpointer(arrow!)

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(lnv_dwsrv) then Destroy lnv_dwsrv
//---------------------------- APPEON END ----------------------------

of_AutoDataFill(il_ViewId,il_ScreenId,ls_column_nm,GetRow(),string(l_any))		//Added By Scofield on 2008-01-10

Return 0

end function

public function integer of_disable_columns ();/******************************************************************************************************************
**  [PUBLIC]   : OF_disable_columns
**==================================================================================================================
**  Purpose   	: Disables columns on the datawindow
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 04 April 2006 ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.07.2006 By: LeiWei
//$<reason> Performance tuning
IF NOT ib_enable_columns THEN RETURN 1
//---------------------------- APPEON END ----------------------------

Long li_columns, ll_color, li_column, ll_cnt, ll_colno, ll_count,ll_upper,ll_index
String ls_string,ls_objects[]
string ls_string1,ls_modify,ls_modify2
string ls_describe, ls_type
ll_color = 79741120

If dataobject = "" Then
	return 1
End if

li_columns = of_getobjects(ls_objects[],"column","*",True)	

ll_upper = UpperBound (ls_objects)
setredraw(false)
For ll_index = 1 To ll_upper
	ls_describe = describe(ls_objects[ll_index]+".edit.Style")
	choose case ls_describe
		case "checkbox" 
			ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "+ ls_objects[ll_index] + ".tabsequence = ~"0~" "
			ls_modify += ls_objects[ll_index]+".checkbox.3D=no "
		case "radiobuttons"
			ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "+ ls_objects[ll_index] + ".tabsequence = ~"0~" "
			ls_modify += ls_objects[ll_index]+".radiobuttons.3D=no "
		case "edit"
			//ignore transparent mode, added if statement by Alfee 09.30.2007
			if Describe(ls_objects[ll_index] + ".Background.Mode") <> '1' then 
				ls_modify2 = ls_modify2 + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "
				ls_modify2 += ls_objects[ll_index]+".edit.displayonly=yes "
			end if
			ls_type = lower(string(describe(ls_objects[ll_index]+".ColType")))						//Added By Mark Lee 08/26/2015
			if ls_type = lower("DateTime")  then
				ls_modify2 += ls_objects[ll_index]+".tabsequence=~"0~" "
			end if 
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 08.31.2006 By: LeiWei
		//$<reason> Fix a defect.
		case "dddw"
//			if Describe(ls_objects[ll_index] + ".Border") <> '0'  then 	//Commented By Mark Lee 02/14/2014 all of column need readonly.
				ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "  //Add by Jack 05/22/2007
				ls_modify = ls_modify + " "+ ls_objects[ll_index] + ".tabsequence = ~"0~" "
//			end if
		//---------------------------- APPEON END ----------------------------			
		Case Else
		   //ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "+ ls_objects[ll_index] + ".tabsequence = ~"0~" "
			ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "+ ls_objects[ll_index] + ".TabSequence =  ~"0~" "
	end choose
Next



this.modify(ls_modify2)
this.modify(ls_modify)

ls_modify = "datawindow.Color="+string(ll_color) 

modify(ls_modify)

ib_read_only = true

setredraw(true)

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.07.2006 By: LeiWei
//$<reason> Performance tuning
ib_enable_columns = FALSE
//---------------------------- APPEON END ----------------------------

Return 1	
	
	
                  



end function

public function integer of_enable_columns ();/******************************************************************************************************************
**  [PUBLIC]   : of_enable_columns( )
**==================================================================================================================
**  Purpose   	: Enables the columns in the datawindow 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 04 April 2006 ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/


Long li_columns, ll_color, li_column, ll_cnt, ll_colno, ll_count,ll_upper,ll_index,ll_back_color, ll_tab_sequence
String ls_string,ls_objects[]
string ls_string1,ls_modify,ls_modify2
string ls_describe
ll_color = 1073741824
ll_back_color = 79741120

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.07.2006 By: LeiWei
//$<reason> Performance tuning
IF ib_enable_columns THEN RETURN 1
//---------------------------- APPEON END ----------------------------

If dataobject = "" Then
	return 1
End if


li_columns = of_getobjects(ls_objects[],"column","*",True)	

ll_upper = UpperBound (ls_objects)
setredraw(false)

For ll_index = 1 To ll_upper
	ls_describe = describe(ls_objects[ll_index]+".edit.Style")
	if ll_index = 1 then
		ll_tab_sequence = 10
	Else
		ll_tab_sequence = 10*ll_index
	End if
	choose case ls_describe
		case "checkbox" 
			ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "+ ls_objects[ll_index] + ".tabsequence = ~""+string(ll_tab_sequence)+"~" "
			ls_modify += ls_objects[ll_index]+".checkbox.3D=yes "
		case "radiobuttons"
			ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "+ ls_objects[ll_index] + ".tabsequence = ~""+string(ll_tab_sequence)+"~" "
			ls_modify += ls_objects[ll_index]+".radiobuttons.3D=yes "
		case "edit"
			//ignore transparent mode, added if statement by Alfee 09.30.2007
			if Describe(ls_objects[ll_index] + ".Background.Mode") <> '1' then 			
				ls_modify2 = ls_modify2 + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "
				ls_modify2 += ls_objects[ll_index]+".edit.displayonly=no "
			end if
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 08.31.2006 By: LeiWei
		//$<reason> Fix a defect.
		case "dddw"
			if Describe(ls_objects[ll_index] + ".Border") <> '0'  then 
				ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "  //Add by Jack 05/22/2007
				ls_modify = ls_modify + " "+ ls_objects[ll_index] + ".tabsequence = ~""+string(ll_tab_sequence)+"~" "
			end if
		//---------------------------- APPEON END ----------------------------
		Case Else
			if Describe(ls_objects[ll_index] + ".Border") <> '0'  then 
				ls_modify = ls_modify + ls_objects[ll_index] + ".Background.Color="+string(ll_color) + " "+ ls_objects[ll_index] + ".tabsequence = ~""+string(ll_tab_sequence)+"~" "
			end if
	end choose
Next

modify(ls_modify2)
modify(ls_modify)

ib_read_only = false

setredraw(true)

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.07.2006 By: LeiWei
//$<reason> Performance tuning
ib_enable_columns = TRUE
//---------------------------- APPEON END ----------------------------

Return 1	
	

end function

public function integer of_getobjects (ref string as_objlist[], string as_objtype, string as_band, boolean ab_visibleonly);
/******************************************************************************************************************
**  [PUBLIC]   :  of_getobjects( /*ref string as_objlist[]*/, /*string as_objtype*/, /*string as_band*/, /*boolean ab_visibleonly */)
**==================================================================================================================
**  Purpose   	: returns the list of objects from the datawindow
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 27 Febuary 2006 ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

string  ls_ObjString, ls_ObjHolder 
integer li_Start=1, li_Tab, li_Count=0 

///* Get the Object String */ 
ls_ObjString = Describe("Datawindow.Objects") 

//* Get the first tab position. */ 
li_Tab =  Pos(ls_ObjString, "~t", li_Start) 
Do While li_Tab > 0 
        ls_ObjHolder = Mid(ls_ObjString, li_Start, (li_Tab - li_Start)) 

        // Determine if object is the right type and in the right band 
	 If  (Describe(ls_ObjHolder + ".type") = as_ObjType or as_ObjType = "*") And & 
        (Describe(ls_ObjHolder + ".band") = as_Band or as_Band = "*")  And & 
		  (Describe(ls_ObjHolder + ".visible") <> "0"  Or Not ab_VisibleOnly) Then
				li_Count ++ 
            as_ObjList[li_Count] = ls_ObjHolder 
     End if 

        /* Get the next tab position. */ 
        li_Start = li_Tab + 1 
        li_Tab =  Pos(ls_ObjString, "~t", li_Start) 
Loop 

// Check the last object 
ls_ObjHolder = Mid(ls_ObjString, li_Start, Len(ls_ObjString)) 

// Determine if object is the right type and in the right band 
If  (Describe(ls_ObjHolder + ".type") = as_ObjType or as_ObjType = "*") And & 
        (Describe(ls_ObjHolder + ".band") = as_Band or as_Band = "*")  And & 
		   (Describe(ls_ObjHolder + ".visible") <> "0"  Or Not ab_VisibleOnly) Then
          li_Count ++ 
          as_ObjList[li_Count] = ls_ObjHolder 
End if 

Return li_Count 
end function

public function integer of_allow_sort ();if ib_allow_sort then 
  of_SetSort(TRUE)
  inv_sort.of_SetColumnHeader(TRUE)
  inv_sort.of_SetVisibleOnly ( true )


  inv_sort.of_SetUseDisplay(TRUE)
  inv_sort.of_SetColumnnameSource(inv_sort.HEADER)
  inv_sort.of_SetStyle(inv_sort.dragdrop )
end if 

return success

end function

public subroutine of_savetosort ();//////////////////////////////////////////////////////////////////////
// $<function>u_dw_contractof_savetosort()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 06.22.2007 by Jack
//////////////////////////////////////////////////////////////////////
long i,j,ll_count,ll_find
string ls_column_name,ls_ColType,ls_value,ls_find = ''
If this.rowcount() < 1 Then Return
If this.getrow() < 1 Then Return

If this.Describe("DataWindow.Table.Sort") <> '' and this.Describe("DataWindow.Table.Sort") <> '?' and this.Describe("DataWindow.Table.Sort") <> '!' Then
	//this.sort( )
	ll_count = Integer( this.Object.DataWindow.Column.Count )
	j = 1
	For i = 1 To ll_count
		ls_column_name = lower( this.Describe("#"+string( i ) + ".name") )
		If this.Describe(ls_column_name + ".key") = "yes" Then
			If j > 1 Then
				ls_find = ls_find + " and "
			End If
			ls_ColType  = this.Describe(ls_column_name + ".ColType")
			Choose Case Left ( ls_ColType , 5 )
				Case "char(", "char"
					ls_value = this.getitemstring(this.getrow(),ls_column_name)
					ls_find = ls_find + ls_column_name + " = '" + ls_value + "'"
				Case "date"	,"datet"	,"time", "times"
	
				Case "decim","numbe", "doubl", "real","long", "ulong", "int"
					ls_value = string(this.getitemnumber(this.getrow(),ls_column_name))				
					ls_find = ls_find + ls_column_name + " = " + ls_value 
			End Choose
			j++
		End If
	Next
	this.sort( )	//Move to here - Jervis 12.5.2009
	ll_find = this.find(ls_find,1,this.rowcount())
	If ll_find > 0 Then
		this.scrolltorow(ll_find)
	End If
End If

end subroutine

public function integer of_fill_data (long row, dwobject dwo, string data, datastore ads_filldata);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_fill_data
//	Arguments:		
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//	Jervis 2007.7.12
//////////////////////////////////////////////////////////////////////////////

long ll_view_id,ll_screen_id,ll_i,ll_row,ll_count
string ls_fillname,ls_mapname
datawindowchild ldwc

//check dddw
if pos(dwo.dddw.name,"d_dddw_code_lookup") > 0 then
	//check fill data info
	ads_filldata.setfilter("data_view_id = " + string(ll_view_id) + " and dataobject = '" + this.dataobject + "' and field_name = '" + dwo.name + "'")
	ll_count = ads_filldata.filter()
	
	//Get Child
	if this.GetChild( dwo.name,ldwc) = 1 then
		//fill data
		for ll_i = 1 to ll_count
			ls_fillname = ads_filldata.GetItemString(ll_i,"feild_fill_name")
			ls_mapname = ads_filldata.GetItemString(ll_i,"feild_map_name")
			ll_row = ldwc.find("code_lookup =" + data,1,ldwc.rowcount())
			
			this.inv_base.of_setitem( row,ls_fillname,ldwc.GetItemString(ll_row,ls_mapname))
		next
	end if 
end if
return 1
end function

public subroutine of_enable_alarm (boolean ab_alarm);//added by alfee 09.05.2007
ib_contract_alarm = ab_alarm
end subroutine

public subroutine of_set_ib_retrieved_dddw (boolean ab_retrieved);//////////////////////////////////////////////////////////////////////
// $<function>u_dw_contractof_set_ib_retrieved_dddw()
// $<arguments>
//		value	boolean	ab_retrieved		
// $<returns> (none)
// $<description> Set var ib_retrieve_drop_downs to retrieve DDDW data again.
//////////////////////////////////////////////////////////////////////
// $<add> 11/21/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////

ib_retrieve_drop_downs = ab_retrieved

end subroutine

public subroutine of_resize ();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.23.2006 By: Gary
//$<reason> Fix a defect.
//$<reason> The following script copies from pfc_n_cst_sie.of_set_size().

IF gb_autozoom THEN //modified by gavins 20130107   gb_autoresize

//Modified By Ken.Guo 12/13/2011	
//	//04.17.2008 By Jervis:PB Bug,Trigger event rowfocuschanged when Set zoom property 
//	if this.dataobject = 'd_dm_doc_tree' or this.dataobject = 'd_dm_doc_ai_browse' or this.dataobject = 'd_dm_doc_audit_browse' or &
//		this.dataobject = 'd_agreement_template_browse' or this.dataobject = 'd_sp_contract_search' or This.DataObject = "d_dm_new_buy_document" or This.DataObject = "d_dm_new_sell_document" then return 
	If this.dataobject = 'd_dm_new_buy_document' or this.dataobject = 'd_dm_new_sell_document' Then Return
	
	datawindowchild ldw_child
	long li_height,li_width,li_zoom,ll_count,ll_i
	string ls_column_name
	string ls_desc2
	
	str_client_rect lstr_client_rect  
	
	if not IsValid(iw_parent) then of_GetParentWindow(iw_parent) //Add by Evan 11/26/2008
	GetClientRect(handle(iw_parent),lstr_client_rect)
	
	li_width = pixelstoUnits(lstr_client_rect.right,XPixelsToUnits!)
	
	//li_zoom =  li_width / 2800 * 100
	
	// start code change --- 11.23.2005 MSKINNER
	li_zoom =  round(li_width / 3936 * 100,1) //4000->3936 By Jervis 11-21-2008
	// start code change --- 11.23.2005 MSKINNER
	
	//$<add> 11.07.2006 By: Davis
	//$<reason> Fix a defect.
	Long li_zoom2
	li_height = pixelstoUnits(lstr_client_rect.bottom,YPixelsToUnits!)
	li_zoom2 = round(li_height / 2152 * 100,1) //2000->2152 By Jervis 11-21-2008
	IF li_zoom > li_zoom2 THEN li_zoom = li_zoom2
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 12.03.2008 By: Ken.Guo
	//$<reason> Workaround for APB Bug. Trigger Resize event too many times.
	if Abs(il_prezoom - li_zoom) < 2 then 
		return
	End If
	il_prezoom = li_zoom
	

	This.dynamic function of_setzoomtriggered(true) //Added By Ken.Guo 12/13/2011. 
	this.Modify("datawindow.zoom = " + String(li_zoom))
	This.dynamic function of_setzoomtriggered(false) //Added By Ken.Guo 12/13/2011. 

	
	// loop through the columns and see if it a DDDW and zoom it as well
	//BEGIN---Modify by Evan on 06/12/2008
	integer li_ColCount
	li_ColCount = Integer(this.Describe("dataWindow.column.count"))
	//for ll_i = 1 to long(this.Object.DataWindow.Column.Count)
	for ll_i = 1 to li_ColCount //END---Modify by Evan on 06/12/2008
		ls_column_name = "#" + string(ll_i) + ".name"
		ls_desc2 = this.Describe("#" + string(ll_i) + ".name") + ".Edit.Style"
		
		if this.Describe(ls_desc2) = 'dddw' then
			this.GetChild( this.Describe(ls_column_name), ldw_child )
			ldw_child.Modify('datawindow.zoom=' + string(li_zoom))
		end if
	next
END IF

//---------------------------- APPEON END ----------------------------
end subroutine

public function integer of_set_properties (long al_data_view_id, long al_screen_id, string as_titlebar_visible_def);long ll_Row
string ls_titlebar_text
string ls_boarder_style
string ls_titlebar_visible

// Get screen properties
if not isvalid(gw_contract) then return 1 //For preload contract folder - jervis 08.24.2010
ll_Row = gw_contract.of_get_screen_prop_row(al_data_view_id, al_screen_id)
if ll_Row <= 0 then Return -1
ls_titlebar_text = gw_contract.ids_screen_prop.object.titlebar_text[ll_Row]
ls_boarder_style = gw_contract.ids_screen_prop.object.boarder_style[ll_Row]
ls_titlebar_visible = gw_contract.ids_screen_prop.object.titlebar_visible[ll_Row]
if IsNull(ls_titlebar_text) or Len(ls_titlebar_text) = 0 then ls_titlebar_text = this.Tag
if IsNull(ls_boarder_style) or Len(ls_boarder_style) = 0 then ls_boarder_style = "stylelowered!"
if IsNull(ls_titlebar_visible) or Len(ls_titlebar_visible) = 0 then ls_titlebar_visible = as_titlebar_visible_def

// Set title bar text property
this.Title = ls_titlebar_text
is_title_bar_text = ls_titlebar_text

// Set title bar visible property
if ls_titlebar_visible = "Y" then
	this.TitleBar = true
else
	this.TitleBar = false
end if

//Begin - Added By Mark Lee 04/26/12
//// Set title bar boarder style property
//choose case ls_boarder_style
//	case "stylebox!"
//		this.BorderStyle = stylebox!
//	case "stylelowered!"
//		this.BorderStyle = stylelowered!
//	case "styleraised!"
//		this.BorderStyle = styleraised!
//	case "styleshadowbox!"
//		this.BorderStyle = styleshadowbox!
//end choose
choose case ls_boarder_style
	case "noborder!"	
		this.BorderStyle = stylebox!
		this.Border  = False
	case "stylebox!"
		this.Border  = TRUE
		this.BorderStyle = stylebox!
	case "stylelowered!"
		this.Border  = TRUE
		this.BorderStyle = stylelowered!
	case "styleraised!"
		this.Border  = TRUE
		this.BorderStyle = styleraised!
	case "styleshadowbox!"
		this.Border  = TRUE
		this.BorderStyle = styleshadowbox!
end choose
//End - Added By Mark Lee 04/26/12


Return 1
end function

public function integer of_clicklink (dwobject adwo_object, long al_row);////====================================================================
// Function: of_clicklink
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	adwo_object
// 	al_row
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	gavin		Date: 2012-06-12
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String			ls_Null, ls_Link
Long			ll_Return


If String( adwo_object.Type ) = 'compute' Then
	SetNull( ls_Null )
	
	If Describe( String( adwo_object.name ) + ".html.linktarget" ) = 'link' Then 
		ls_Link = String( adwo_object.Primary[al_row] )
		ls_Link = '"' + ls_Link + '"'

		ll_Return = ShellExecuteA( handle( this ),  "open",  "iexplore.exe" , ls_Link,  ls_null,  1  )
		If ll_Return < 32 Then
			MessageBox( 'Tips' , 'Failure to open the Hyperlink!' + '(error number:' + string( ll_Return ) + ")")
		End If
	End If
End If






Return ll_Return
end function

public subroutine of_set_move_dw (boolean abn_move_dw);//====================================================================
// Function: of_set_move_dw
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                abn_move_dw
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 01/07/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

ib_move_dw = abn_move_dw
end subroutine

public function boolean of_check_isdate_format (string as_col_name, boolean ab_show_msg);//====================================================================
// Function: of_check_isdate_format
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                as_col_name
//                ab_show_msg
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 11/28/2013
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


String ls_mask,ls_type

ls_type =  This.Describe(as_col_name + ".coltype") 
If ls_type = 'date' or ls_type = 'datetime' Then
	ls_mask = This.Describe (as_col_name + ".EditMask.Mask")
	If ls_mask = '?' or ls_mask = '!' Then //No set format, using default.
		Return True
	End If
	If Pos(Upper(ls_mask), 'DD' ) = 0 or Pos(Upper(ls_mask), 'YY' ) = 0 Then
		If ab_show_msg Then
			Messagebox('Alarm','Alarm function is only supported for fields with date format.' + &
			+ '~r~nIf you need to set an alarm for this column, please set its format to date in the Screen Painter first.')
		End If
		Return False
	End If	
Else
	Return False
End If


Return True
end function

public function integer of_setdropdownselect (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetDropDownSelect
//	Arguments:		boolean
//   					true  - Start (create) the service
//   					false - Stop (destroy ) the service
//	Returns:			Integer - 1 if Successful operation, 0 = No action taken and -1 if an error occured
//	Description:		Starts or stops the DropDown Calendar visual object.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						6.0		Initial version
// 						6.0.01	Enhanced so that the Message object is not overwritten by the 
//								 OpenUserObject function.
//////////////////////////////////////////////////////////////////////////////
//	Copyright ? 1996-2000 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////

//Added By Jay Chen 12-23-2015
window lw_parent
string	ls_classname,ls_fieldname
powerobject	lpo_message
n_cst_calendarattrib lnv_calendarattrib

// Check arguments
if IsNull(ab_switch) then return FAILURE

// Get parent window reference.
of_GetParentWindow(lw_parent)
if IsNull(lw_parent) or not IsValid(lw_parent) then return FAILURE

ls_fieldname = this.getcolumnname()

if ab_Switch then
	if not IsValid (iuo_select) then
		// If using pfc_n_msg, store the Message Object (dynamic call).
		if IsValid(message) then
			ls_classname = Trim(Lower(message.ClassName()))
			if ls_classname = "n_msg" then lpo_message = Create Using "n_msg"
			if IsValid(lpo_message) then message.Dynamic of_CopyTo(lpo_message)
		end if				
		
		// Tell the object to behave as a dropdown object.
		lnv_calendarattrib.ib_dropdown = true
		lw_parent.OpenUserObjectWithParm(iuo_select, lnv_calendarattrib)
		iuo_select.of_SetRequestor (this)
		
		// If using pfc_n_msg, restore the Message Object (dynamic call).
		if IsValid(lpo_message) then 
			lpo_message.Dynamic of_CopyTo(message)
			Destroy lpo_message
		end if
		return SUCCESS
	end if
else 
	if IsValid (iuo_select) then
		lw_parent.CloseUserObject(iuo_select)
		return SUCCESS
	end if	
end if 

return NO_ACTION
end function

public subroutine of_auto_compute_field (long al_row);of_auto_compute_field(al_row, '')


////====================================================================
//// Function: of_auto_compute_field
////--------------------------------------------------------------------
//// Description: Set the compute value to field
////--------------------------------------------------------------------
//// Arguments:
////                al_row
////--------------------------------------------------------------------
//// Returns:  (None)
////--------------------------------------------------------------------
//// Author:         Ken.Guo 2016-08-17
////--------------------------------------------------------------------
////Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
////--------------------------------------------------------------------
//// Modify History:
////
////====================================================================
//
//
//Long ll_find,i, ll_start,ll_end,ll_cnt
//String ls_field_name, ls_field_expression, ls_datatype, ls_value
//datastore lds_field, lds_field_mul
//
//If  il_ViewId = 0 or il_ScreenId = 0 then Return
//Try
//	//for field property.
//	lds_field = gnv_data.ids_field_compute_expression
//	ll_find = lds_field.find('data_view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId), 1, lds_field.rowcount()) 
//	Do While ll_find > 0
//		//Get compute expression
//		ls_field_name = lds_field.GetItemString(ll_find, 'field_name')
//		ls_field_expression =  lds_field.GetItemString(ll_find, 'field_compute_expression')	
//		ls_datatype = this.describe(ls_field_name + '.coltype')
//		
//		If al_row > 0 Then //Ony apply this row
//			ll_start = al_row
//			ll_end = al_row
//		Else  //Apply all rows
//			ll_start = 1
//			ll_end = this.rowcount()
//		End If
//		
//		ls_field_expression = gnv_string.of_globalreplace( ls_field_expression, '~~', '~~~~')
//		ls_field_expression = gnv_string.of_globalreplace( ls_field_expression, "'", "~~'")	
//		
//		//Set the Value to field
//		For i = ll_start to ll_end
//			ls_value = this.describe("Evaluate('" + ls_field_expression +"', " + String(i) + ")")
//			If ls_value <> '?' and ls_value <> '!' Then
//				Choose Case left(ls_datatype,5)
//					Case "char(", "char"
//						If this.getitemstring(i,ls_field_name) = ls_value then
//							//
//						Else
//							this.setitem(i, ls_field_name, ls_value)
//						End If
//					Case "date"	,"datet"	,"time", "times"
//						If this.getitemdatetime(i,ls_field_name) = datetime(ls_value) then
//							//
//						Else
//							this.setitem(i, ls_field_name, datetime(ls_value))
//						End If										
//					Case "numbe", "long", "ulong", "int"
//						If this.getitemnumber(i,ls_field_name) = Long(ls_value) then
//							//
//						Else
//							this.setitem(i, ls_field_name, Long(ls_value))
//						End If							
//					Case "decim","doubl", "real"
//						If this.getitemdecimal(i,ls_field_name) = Dec(ls_value) then
//							//
//						Else
//							this.setitem(i, ls_field_name, Dec(ls_value))
//						End If						
//				End Choose
//			End If
//		Next
//		If ll_find =  lds_field.rowcount() Then Exit
//		ll_find = lds_field.find('data_view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId), ll_find + 1, lds_field.rowcount()) 
//	Loop
//	
//	//For field compute  multi.
//	long ll_field_cnt,j
//	String ls_fields, ls_field_arr[], ls_empty[]
//	String ls_field_compute_conditions,ls_field_compute_expression_true, ls_field_compute_fields_true, ls_field_compute_expression_false, ls_field_compute_fields_false
//	lds_field_mul = gnv_data.ids_field_compute_expression_mul
//	ll_find = lds_field_mul.find('view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId), 1, lds_field_mul.rowcount()) 
//	Do While ll_find > 0
//		//Get compute expression 
//		ls_field_compute_conditions = lds_field_mul.GetItemString(ll_find, 'field_compute_conditions')
//		ls_field_compute_expression_true = lds_field_mul.GetItemString(ll_find, 'field_compute_expression_true') 
//		ls_field_compute_fields_true = lds_field_mul.GetItemString(ll_find, 'field_compute_fields_true')
//		ls_field_compute_expression_false = lds_field_mul.GetItemString(ll_find, 'field_compute_expression_false')
//		ls_field_compute_fields_false = lds_field_mul.GetItemString(ll_find, 'field_compute_fields_false')
//		
//		If trim(ls_field_compute_conditions) <> '' and not isnull(ls_field_compute_conditions) Then
//			//Get and convert expression
//			ls_field_compute_conditions = gnv_string.of_globalreplace( ls_field_compute_conditions, '~~', '~~~~')
//			ls_field_compute_conditions = gnv_string.of_globalreplace( ls_field_compute_conditions, "'", "~~'")		
//			ls_field_compute_expression_true = gnv_string.of_globalreplace( ls_field_compute_expression_true, '~~', '~~~~')
//			ls_field_compute_expression_true = gnv_string.of_globalreplace( ls_field_compute_expression_true, "'", "~~'")		
//			ls_field_compute_expression_false = gnv_string.of_globalreplace( ls_field_compute_expression_false, '~~', '~~~~')
//			ls_field_compute_expression_false = gnv_string.of_globalreplace( ls_field_compute_expression_false, "'", "~~'")		
//			
//			If al_row > 0 Then //Ony apply this row
//				ll_start = al_row
//				ll_end = al_row
//			Else  //Apply all rows
//				ll_start = 1
//				ll_end = this.rowcount()
//			End If
//			For i = ll_start to ll_end
//				//Get expression result
//				ls_value = ''
//				ls_fields = ''			
//				ls_value = this.describe("Evaluate('" + ls_field_compute_conditions +"', " + String(i) + ")")	
//				If ls_value = 'true' Then
//					ls_value = this.describe("Evaluate('" + ls_field_compute_expression_true +"', " + String(i) + ")"		)
//					ls_fields = ls_field_compute_fields_true
//				Elseif ls_value = 'false' Then
//					ls_value = this.describe("Evaluate('" + ls_field_compute_expression_false +"', " + String(i) + ")"		)	
//					ls_fields = ls_field_compute_fields_false
//				End If
//				
//				//Set result to fields
//				ls_field_arr[] = ls_empty[]
//				gnv_string.of_parsetoarray( ls_fields, ';', ls_field_arr[])
//				ll_field_cnt = Upperbound(ls_field_arr[] )
//				If ll_field_cnt > 0 and ls_value <> '?' and ls_value <> '!' Then
//					for j = 1 to ll_field_cnt 
//						ls_datatype = this.describe(ls_field_arr[j] + '.coltype')
//						Choose Case left(ls_datatype,5)
//							Case "char(", "char"
//								If this.getitemstring(i,ls_field_arr[j]) = ls_value then
//									//
//								Else
//									this.setitem(i, ls_field_arr[j], ls_value)
//								End If
//							Case "date"	,"datet"	,"time", "times"
//								If this.getitemdatetime(i,ls_field_arr[j]) = datetime(ls_value) then
//									//
//								Else
//									this.setitem(i, ls_field_arr[j], datetime(ls_value))
//								End If										
//							Case "numbe", "long", "ulong", "int"
//								If this.getitemnumber(i,ls_field_arr[j]) = Long(ls_value) then
//									//
//								Else
//									this.setitem(i, ls_field_arr[j], Long(ls_value))
//								End If							
//							Case "decim","doubl", "real"
//								If this.getitemdecimal(i,ls_field_arr[j]) = Dec(ls_value) then
//									//
//								Else
//									this.setitem(i, ls_field_arr[j], Dec(ls_value))
//								End If						
//						End Choose					
//					Next
//				End If
//			Next					
//		End If
//		If ll_find =  lds_field_mul.rowcount() Then Exit
//		ll_find = lds_field_mul.find('view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId), ll_find+1, lds_field_mul.rowcount()) 
//	Loop
//Catch (runtimeerror err1)
//	messagebox('Error',err1.text)
//	gnv_debug.of_output(true, 'Failed to set the compute fields value.' + err1.text)
//End Try
end subroutine

public subroutine of_auto_compute_field (long al_row, string as_type);//====================================================================
// Function: of_auto_compute_field
//--------------------------------------------------------------------
// Description: Set the compute value to field
//--------------------------------------------------------------------
// Arguments:
//                al_row
//				as_type : 'R: retrieve', 'E: itemchanged', 'U: update'
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-17
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long ll_find,i, ll_start,ll_end,ll_cnt
String ls_field_name, ls_field_expression, ls_datatype, ls_value
datastore lds_field, lds_field_mul
DateTime ldt_null   //Added by Harry 2017-02-27 for task743

If  il_ViewId = 0 or il_ScreenId = 0 then Return

If gnv_user_option.of_get_option_value( 'autopopulate_triggeredby_retrieve')  <> '1'  and as_type = 'R' Then Return
If gnv_user_option.of_get_option_value( 'autopopulate_triggeredby_save')  <> '1'  and as_type = 'U' Then Return	


Try
	//for field property.
	// <RP> 1.10.2017 --------------------------------------------
	gnv_data.of_retrieveIfNecessary("field_compute_expression", FALSE)
	// <RP>
	lds_field = gnv_data.ids_field_compute_expression
	ll_find = lds_field.find('data_view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId), 1, lds_field.rowcount()) 
	Do While ll_find > 0
		//Get compute expression
		ls_field_name = lds_field.GetItemString(ll_find, 'field_name')
		ls_field_expression =  lds_field.GetItemString(ll_find, 'field_compute_expression')	
		ls_datatype = this.describe(ls_field_name + '.coltype')
		
		If al_row > 0 Then //Ony apply this row
			ll_start = al_row
			ll_end = al_row
		Else  //Apply all rows
			ll_start = 1
			ll_end = this.rowcount()
		End If
		
		ls_field_expression = gnv_string.of_globalreplace( ls_field_expression, '~~', '~~~~')
		ls_field_expression = gnv_string.of_globalreplace( ls_field_expression, "'", "~~'")	
		
		//Set the Value to field
		For i = ll_start to ll_end
			ls_value = this.describe("Evaluate('" + ls_field_expression +"', " + String(i) + ")")
			If ls_value <> '?' and ls_value <> '!' Then
				Choose Case left(ls_datatype,5)
					Case "char(", "char"
						If this.getitemstring(i,ls_field_name) = ls_value or (isnull(this.getitemstring(i,ls_field_name)) and  isnull(ls_value))then
							//
						Else
							this.setitem(i, ls_field_name, ls_value)
						End If
					Case "date"	,"datet"	,"time", "times"
						//Modified by Harry 2017-02-27 for task743
						/*
						If this.getitemdatetime(i,ls_field_name) = datetime(ls_value) or (isnull(this.getitemdatetime(i,ls_field_name)) and isnull(ls_value)) then
							//
						Else
							this.setitem(i, ls_field_name, datetime(ls_value))
						End If					
						*/
						If this.getitemdatetime(i,ls_field_name) = datetime(ls_value) or (isnull(this.getitemdatetime(i,ls_field_name)) and (isnull(ls_value) or trim(ls_value) = '')) then
							//
						Else
							if AppeonGetClientType() = 'WEB' and (isnull(ls_value) or trim(ls_value) = '') then
								Setnull(ldt_null)
								this.setitem(i, ls_field_name, ldt_null)
							else
								this.setitem(i, ls_field_name, datetime(ls_value))
							end if
						End If	
					Case "numbe", "long", "ulong", "int"
						If this.getitemnumber(i,ls_field_name) = Long(ls_value) or (isnull(this.getitemnumber(i,ls_field_name)) and isnull(ls_value)) then
							//
						Else
							this.setitem(i, ls_field_name, Long(ls_value))
						End If							
					Case "decim","doubl", "real"
						If this.getitemdecimal(i,ls_field_name) = Dec(ls_value) or (isnull(this.getitemdecimal(i,ls_field_name)) and  isnull(ls_value)) then
							//
						Else
							this.setitem(i, ls_field_name, Dec(ls_value))
						End If						
				End Choose
			End If
		Next
		If ll_find =  lds_field.rowcount() Then Exit
		ll_find = lds_field.find('data_view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId), ll_find + 1, lds_field.rowcount()) 
	Loop
	
	//For field compute  multi.
	long ll_field_cnt,j
	String ls_fields, ls_field_arr[], ls_empty[]
	String ls_field_compute_conditions,ls_field_compute_expression_true, ls_field_compute_fields_true, ls_field_compute_expression_false, ls_field_compute_fields_false
	// <RP> 1.10.2017 --------------------------------------------
	gnv_data.of_retrieveIfNecessary("field_compute_expression_mul", FALSE)
	// <RP>
	lds_field_mul = gnv_data.ids_field_compute_expression_mul
	ll_find = lds_field_mul.find('view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId), 1, lds_field_mul.rowcount()) 
	Do While ll_find > 0
		//Get compute expression 
		ls_field_compute_conditions = lds_field_mul.GetItemString(ll_find, 'field_compute_conditions')
		ls_field_compute_expression_true = lds_field_mul.GetItemString(ll_find, 'field_compute_expression_true') 
		ls_field_compute_fields_true = lds_field_mul.GetItemString(ll_find, 'field_compute_fields_true')
		ls_field_compute_expression_false = lds_field_mul.GetItemString(ll_find, 'field_compute_expression_false')
		ls_field_compute_fields_false = lds_field_mul.GetItemString(ll_find, 'field_compute_fields_false')
		
		If trim(ls_field_compute_conditions) <> '' and not isnull(ls_field_compute_conditions) Then
			//Get and convert expression
			ls_field_compute_conditions = gnv_string.of_globalreplace( ls_field_compute_conditions, '~~', '~~~~')
			ls_field_compute_conditions = gnv_string.of_globalreplace( ls_field_compute_conditions, "'", "~~'")		
			ls_field_compute_expression_true = gnv_string.of_globalreplace( ls_field_compute_expression_true, '~~', '~~~~')
			ls_field_compute_expression_true = gnv_string.of_globalreplace( ls_field_compute_expression_true, "'", "~~'")		
			ls_field_compute_expression_false = gnv_string.of_globalreplace( ls_field_compute_expression_false, '~~', '~~~~')
			ls_field_compute_expression_false = gnv_string.of_globalreplace( ls_field_compute_expression_false, "'", "~~'")		
			
			If al_row > 0 Then //Ony apply this row
				ll_start = al_row
				ll_end = al_row
			Else  //Apply all rows
				ll_start = 1
				ll_end = this.rowcount()
			End If
			For i = ll_start to ll_end
				//Get expression result
				ls_value = ''
				ls_fields = ''			
				ls_value = trim(lower(this.describe("Evaluate('" + ls_field_compute_conditions +"', " + String(i) + ")")	))
				If ls_value = 'true' Then
					ls_value = this.describe("Evaluate('" + ls_field_compute_expression_true +"', " + String(i) + ")"		)
					ls_fields = ls_field_compute_fields_true
				Elseif ls_value = 'false' Then
					ls_value = this.describe("Evaluate('" + ls_field_compute_expression_false +"', " + String(i) + ")"		)	
					ls_fields = ls_field_compute_fields_false
				End If
				
				//Set result to fields
				ls_field_arr[] = ls_empty[]
				gnv_string.of_parsetoarray( ls_fields, ';', ls_field_arr[])
				ll_field_cnt = Upperbound(ls_field_arr[] )
				If ll_field_cnt > 0 and ls_value <> '?' and ls_value <> '!' Then
					for j = 1 to ll_field_cnt 
						ls_datatype = this.describe(ls_field_arr[j] + '.coltype')
						Choose Case left(ls_datatype,5)
							Case "char(", "char"
								If this.getitemstring(i,ls_field_arr[j]) = ls_value or (isnull(this.getitemstring(i,ls_field_arr[j])) and  isnull(ls_value)) then
									//
								Else
									this.setitem(i, ls_field_arr[j], ls_value)
								End If
							Case "date"	,"datet"	,"time", "times"
								//Modified by Harry 2017-02-27 for task743
								/*
								If this.getitemdatetime(i,ls_field_arr[j]) = datetime(ls_value) or (isnull(this.getitemdatetime(i,ls_field_arr[j])) and  isnull(ls_value)) then
									//
								Else
									this.setitem(i, ls_field_arr[j], datetime(ls_value))
								End If						
								*/
								If this.getitemdatetime(i,ls_field_arr[j]) = datetime(ls_value) or (isnull(this.getitemdatetime(i,ls_field_arr[j])) and  (isnull(ls_value) or trim(ls_value) = '')) then
									//
								Else
									if AppeonGetClientType() = 'WEB' and (isnull(ls_value) or trim(ls_value) = '') then
										Setnull(ldt_null)
										this.setitem(i, ls_field_arr[j], ldt_null)
									else
										this.setitem(i, ls_field_arr[j], datetime(ls_value))
									end if
								End If	
							Case "numbe", "long", "ulong", "int"
								If this.getitemnumber(i,ls_field_arr[j]) = Long(ls_value) or (isnull(this.getitemnumber(i,ls_field_arr[j])) and isnull(ls_value)) then
									//
								Else
									this.setitem(i, ls_field_arr[j], Long(ls_value))
								End If							
							Case "decim","doubl", "real"
								If this.getitemdecimal(i,ls_field_arr[j]) = Dec(ls_value) or (isnull(this.getitemdecimal(i,ls_field_arr[j])) and  isnull(ls_value)) then
									//
								Else
									this.setitem(i, ls_field_arr[j], Dec(ls_value))
								End If						
						End Choose					
					Next
				End If
			Next					
		End If
		If ll_find =  lds_field_mul.rowcount() Then Exit
		ll_find = lds_field_mul.find('view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId), ll_find+1, lds_field_mul.rowcount()) 
	Loop
Catch (runtimeerror err1)
	messagebox('Error',err1.text)
	gnv_debug.of_output(true, 'Failed to set the compute fields value.' + err1.text)
End Try
end subroutine

public subroutine of_set_sort_filer (string as_columnname);//====================================================================
// Function: of_set_sort_filer
//--------------------------------------------------------------------
// Description:  Task 722. set sort and filter for dddw
//--------------------------------------------------------------------
// Arguments:
//                as_columnname
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 2017-03-03
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


datastore lds_field
datawindowchild ldwc_data
String ls_sort, ls_filter, ls_filter_org, ls_filter_new,ls_filter_expression
String ls_CurStyle,ls_CurTag
long ll_find 

If il_ViewId = 0 or il_ScreenId = 0 Then Return

//restore prior field
This.of_set_sort_filer_restore()

//Set current field
ls_CurStyle = This.Describe(as_columnname + ".Edit.Style")
ls_CurTag = This.Describe(as_columnname + ".tag")

If ls_CurStyle = 'dddw' and len(ls_CurTag) > 0 Then
	this.getchild(as_columnname, ldwc_data)
	
	//Get sort/filter data
	gnv_data.of_retrieveIfNecessary("field_other_properties", FALSE)
	lds_field = gnv_data.ids_field_other_properties
	ll_find = lds_field.find('data_view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId) + ' and field_name= "' +as_columnname+ '"', 1, lds_field.rowcount())
	If ll_find > 0 Then	
		
		//Filter function
		//Get filter data
		ls_filter_expression = lds_field.getitemstring(ll_find, 'filter_expression')
		ls_filter_org = trim(ldwc_data.describe("datawindow.table.filter"))
		If  lds_field.getitemstring(ll_find, 'field_add') = 'Y' Then //9990 is begin flag, 9991 is end flag
			ls_filter = '(9990=9990 and (('  + ls_filter_expression + ' ) or lookup_code = -1 or lookup_code = -777 or lookup_code = -999) and 9991=9991) '	
		Else
			ls_filter = '(9990=9990 and ('  + ls_filter_expression + ') and 9991=9991) '	
		End If
		
		If ls_filter_expression <> '' and not isnull(ls_filter_expression) Then
			//Use new filter
			If ls_filter_org = '' or ls_filter_org = '?' or ls_filter_org = '!' Then
				ls_filter_new = ls_filter
			Else
				If Pos( lower( ls_filter_org) , lower( ls_filter) ) = 0 Then
					ls_filter_new = ls_filter_org + ' and ' + ls_filter
				Else
					ls_filter_new = ls_filter_org
				End If
			End If
			ldwc_data.setfilter(ls_filter_new)
		Else
			//restore the filter 
			If Pos( lower( ls_filter_org) , lower( ls_filter) ) > 0 Then
				If Pos( lower( ls_filter_org) ,  ' and '  + lower( ls_filter) ) > 0 Then
					ls_filter_new = Mid(ls_filter_org, Pos( lower( ls_filter_org) ,  ' and '  + lower( ls_filter) ))
				ElseIf lower( ls_filter_org) =  lower( ls_filter) Then
					ls_filter_new = ''
				End If
			Else
				ls_filter_new = ''
			End If
		End If
		ldwc_data.filter()
		
		//Sort function
		ls_sort = lds_field.getitemstring(ll_find, 'sort_expression')
		If ls_sort <> '' and  not isnull(ls_sort) Then
			ldwc_data.setsort(ls_sort) // use new sort
		Else
			//Restore to default sort 
			If len(ls_CurTag) = 1  Then
				ldwc_data.setsort('facility_name A') //company
			Else
				ldwc_data.setsort('code A') //code lookup
			End If
		End If		
		ldwc_data.Sort()
		
		//Move '*Add lookup code' row to the first row.  move emty row to top
		If len(ls_CurTag) > 1  Then
			ll_find = ldwc_data.find('lookup_code = -', 1, ldwc_data.rowcount())
			If ll_find > 0 Then
				ldwc_data.RowsMove(ll_find, ll_find, Primary!, ldwc_data, 1, Primary!)
			End If
			ll_find = ldwc_data.find('lookup_code = -777', 1, ldwc_data.rowcount())
			If ll_find > 0 Then
				ldwc_data.RowsMove(ll_find, ll_find, Primary!, ldwc_data, 1, Primary!)
			End If
			ll_find = ldwc_data.find('lookup_code = -999', 1, ldwc_data.rowcount())
			If ll_find > 0 Then
				ldwc_data.RowsMove(ll_find, ll_find, Primary!, ldwc_data, 1, Primary!)
			End If	
			ll_find = ldwc_data.find('lookup_code = 0', 1, ldwc_data.rowcount())
			If ll_find > 0 Then
				ldwc_data.RowsMove(ll_find, ll_find, Primary!, ldwc_data, 1, Primary!)
			End If		
			ll_find = ldwc_data.find('isnull(lookup_code)', 1, ldwc_data.rowcount())
			If ll_find > 0 Then
				ldwc_data.RowsMove(ll_find, ll_find, Primary!, ldwc_data, 1, Primary!)
			End If	
			//Workarond PB'' bug: it hightlight two rows.
			ldwc_data.selectrow(0, false)
			ldwc_data.selectrow(1, true)
		End If
		
		is_prior_sort_filter_field = as_columnname // set the var to restore
	End If
End If
end subroutine

public subroutine of_set_sort_filer_restore ();//====================================================================
// Function: of_set_sort_filer_restore
//--------------------------------------------------------------------
// Description:  Task 722. restore sort and filter  for dddw
//--------------------------------------------------------------------
// Arguments:
//               
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 2017-03-03
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


datastore lds_field
datawindowchild ldwc_data
String ls_sort, ls_filter, ls_filter_org, ls_filter_new,ls_filter_expression
String ls_CurStyle,ls_CurTag
long ll_find 

If il_ViewId = 0 or il_ScreenId = 0 Then Return
If is_prior_sort_filter_field = '' Then Return 
ls_CurStyle = This.Describe(is_prior_sort_filter_field + ".Edit.Style")
ls_CurTag = This.Describe(is_prior_sort_filter_field + ".tag")

If ls_CurStyle = 'dddw' and len(ls_CurTag) > 0 Then
	this.getchild(is_prior_sort_filter_field, ldwc_data)
	
	ls_filter_org = trim(ldwc_data.describe("datawindow.table.filter"))
	If Len( ls_filter_org )  > 1 Then
		If pos(ls_filter_org, ' and (9990=9990 and (') > 0 Then
			ls_filter = Mid(ls_filter, pos(ls_filter_org, ' and (9990=9990 and (') -1  )	
			ldwc_data.setfilter(ls_filter)
			ldwc_data.filter()
			is_prior_sort_filter_field = ''
		ElseIf pos(ls_filter_org, '(9990=9990 and (') > 0 Then
			ls_filter = Mid(ls_filter, pos(ls_filter_org, '(9990=9990 and (') -1  )
			ldwc_data.setfilter(ls_filter)
			ldwc_data.filter()	
			is_prior_sort_filter_field = ''
		End If		
	End If
End If

end subroutine

public function string of_get_multi_select (string as_colname, integer ai_viewid, integer ai_screenid);
//====================================================================
// Function: of_get_multi_select
//--------------------------------------------------------------------
// Description:task744:Word Wrap Multi Select Drop-down Fields
//--------------------------------------------------------------------
// Arguments:
// 	value    string     as_colname
// 	value    integer    ai_viewid
// 	value    integer    ai_screenid
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Gavin.Jay		Date: 2017-04-05
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long 		ll_find, ll_Row, ll_viewid, ll_screenid

string ls_colname, ls_syntax

ll_viewid = ai_viewid
ll_screenid = ai_screenid
ls_colname = as_colname
If IsNull ( ll_viewid ) or ll_viewid < 1 Then return ""
If IsNull ( ll_screenid ) or ll_screenid < 1 Then return ""
If IsNull ( ls_colname ) or trim ( ls_colname ) = "" Then return ""

if Not isvalid( ids_multi_select) then
	ids_multi_select = create datastore
	ids_multi_select.dataObject = 'ds_multi_select_colstyle_ori'
	ids_multi_select.SetTransObject (SQLCA)
End If

ll_find = ids_multi_select.find ( "viewid = " + string ( ll_viewid ) + " and screenid = " + string ( ll_screenid ) + " and colname = '" + ls_colname + "'" , 1, ids_multi_select.RowCount() )
If ll_find > 0 Then
	ls_syntax = ids_multi_select.GetItemString (ll_find, "colsyntax")
End If

return ls_syntax
end function

public function integer of_set_multi_select (string as_colname, integer ai_viewid, integer ai_screenid, string as_syntax);//====================================================================
// Function: of_set_multi_select
//--------------------------------------------------------------------
// Description:task744:Word Wrap Multi Select Drop-down Fields
//--------------------------------------------------------------------
// Arguments:
// 	value    string     as_colname
// 	value    integer    ai_viewid
// 	value    integer    ai_screenid
// 	value    string     as_syntax
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Gavin.Jay		Date: 2017-04-05
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long 		ll_find, ll_Row, ll_viewid, ll_screenid

string ls_colname, ls_syntax

ll_viewid = ai_viewid
ll_screenid = ai_screenid
ls_colname = as_colname
ls_syntax = as_syntax
If IsNull ( ll_viewid ) or ll_viewid < 1 Then return 0
If IsNull ( ll_screenid ) or ll_screenid < 1 Then return 0
If IsNull ( ls_colname ) or trim ( ls_colname ) = "" Then return 0
If IsNull ( ls_syntax ) or trim ( ls_syntax ) = "" Then return 0

if Not isvalid( ids_multi_select) then
	ids_multi_select = create datastore
	ids_multi_select.dataObject = 'ds_multi_select_colstyle_ori'
	ids_multi_select.SetTransObject (SQLCA)
End If

ll_find = ids_multi_select.find ( "viewid =" + string ( ll_viewid ) + " and screenid = " + string ( ll_screenid ) + " and colname = '" + ls_colname + "'" , 1, ids_multi_select.RowCount() )
If ll_find = 0 Then	
	ll_row = ids_multi_select.InsertRow ( 0 )
	ids_multi_select.SetItem( ll_row, "viewid", 		 ll_viewid  )
	ids_multi_select.SetItem( ll_row, "screenid", 	ll_screenid )
	ids_multi_select.SetItem( ll_row, "colname",  	ls_colname )
	ids_multi_select.SetItem( ll_row, "colsyntax",  	ls_syntax  )
End If

return 1

end function

on u_dw_contract.create
call super::create
end on

on u_dw_contract.destroy
call super::destroy
end on

event getfocus;//BEGIN---Modify by Evan 07/21/2008
//No inherit parent code
//this.border = false

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.15.2006 By: Liang QingShi
//$<reason> Contract module modification
/*
is_title_bar_text = this.title 
*/
//is_title_bar_text = this.tag 
//---------------------------- APPEON END ----------------------------

//this.title = ' >>>>>>>>>> ' + is_title_bar_text + ' <<<<<<<<<<< '
datawindowchild ldwc_child

pfc_u_dw::Event GetFocus()
of_GetParentWindow(iw_parent)
//Added By Mark Lee 03/22/2013
//this.Title = ' >>>>>>>>>> ' + is_title_bar_text + ' <<<<<<<<<<< '
this.Title = gs_left_title_sign + is_title_bar_text + gs_right_title_sign
//END---Modify by Evan 07/21/2008

//BEGIN---Modify by Scofield on 2009-04-20
if iw_parent.ClassName() = 'w_contract' and IsValid(w_contract) then 
	w_contract.of_SetCurrentScreenID(il_ScreenId)
end if
//END---Modify by Scofield on 2009-04-20


//Add by jervis 11.13.2009
string ls_column, ls_SpecialFilter, ls_filter_company_contact
string ls_CurStyle,ls_CurTag,ls_dddw_name

ls_column = this.GetColumnname( )
if ls_column <> "" then
	ls_CurStyle = This.Describe(ls_column + ".Edit.Style")
	ls_CurTag = This.Describe(ls_column + ".tag")
	ls_dddw_name = This.Describe(ls_column + ".dddw.name")

	if ls_CurStyle = 'dddw' and len(ls_CurTag) > 1  then
		is_prior_field = ls_column
		if this.Getchild( ls_column, ldwc_child) = 1 then
			is_ori_filter = ldwc_child.describe( "datawindow.table.filter")  //jervis 08.01.2011
			If Len(is_ori_filter) = 1 Then is_ori_filter = ''
		else
			is_ori_filter = ''
		end if
		of_FieldDependFilter(il_ViewId,il_ScreenId,ls_column,this.GetRow(),true,is_ori_filter)
	end if
	
	//Added By Jay Chen 03-22-2016
	if ls_CurStyle = 'dddw' and len(ls_CurTag) = 1  then
		if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then
			is_prior_field = ls_column
			ls_filter_company_contact = gnv_data.of_getitem("icred_settings", "filter_company_contact", false) //added by gaivns 20160516 when using filldepend function , filter will be clear, but company need to preserve
			if ls_filter_company_contact = '1' then
				if ls_dddw_name = 'dddw_contact_company_new' then
					ls_specialFilter = "app_facility_status = 'A' "
				else
					ls_specialFilter = "status = 'A' "
				end if
			end if
			of_FieldDependFilter(il_ViewId,il_ScreenId,ls_column,this.GetRow(),true,is_ori_filter, ls_SpecialFilter ) //modified by gaivns 20160516
		end if
	end if

	//Added By Ken.Guo 2017-03-03. Task 722
	This.of_set_sort_filer( ls_column) 

end if


end event

event pfc_preupdate;call super::pfc_preupdate;/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner 18 october 2005  ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-12-02 By: Zhang lingping
//$<reason> The identifier 'll_rowcount_local' conflicts with an existing property with 
//$<reason>  this name. Rename it.

//$<modify> 04.05.2006 By: LeiWei
//$<reason> Performance tuning 
/*

//long ll_rowcount_local
long ll_rowcount_local

LONG LL_MAX_ROW

LL_MAX_ROW = rowcount( )

for ll_rowcount_local =1 to LL_MAX_ROW
	 //if not f_validstr(string(this.getitemNumber(ll_rowcount,'record_id'))) then
	 if not f_validstr(string(this.getitemNumber(ll_rowcount_local,'record_id'))) then
			//this.setItem(ll_rowcount,'record_id', of_get_next_record_id())
         this.setItem(ll_rowcount_local,'record_id', of_get_next_record_id())
			///commit;
	 end if 
next
*/

long ll_rowcount_local
LONG LL_MAX_ROW

if this.Describe( "record_id.x") = '!' then return success //08.15.2007 By Jervis

LL_MAX_ROW = rowcount( )
Long ll_record_id = 0
for ll_rowcount_local = 1 to LL_MAX_ROW
	 if not f_validstr(string(this.getitemNumber(ll_rowcount_local,'record_id'))) then
			IF ll_record_id = 0 THEN
				ll_record_id = gnv_app.of_get_id('RECORD_ID', LL_MAX_ROW)
			Else
				ll_record_id++
			ENd IF

         this.setItem(ll_rowcount_local,'record_id', ll_record_id)
	 end if 
next

of_auto_compute_field(0,'U') //Added By Ken.Guo 2016-08-17

return success
end event

event pfc_deleterow;/******************************************************************************************************************
**  [PUBLIC]   : event pfc_deleterow( )
**==================================================================================================================
**  Purpose   	: DELETES THE HISTORY OF THE REC_ID FROM THE SYS_AUDIT TABLE
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 10 oCTOBER 2005  ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
 NOTE: DO NOT DELETE FROM SYS_AUDIT
********************************************************************************************************************/




//long ll_rowcount
//LONG LL_MAX_ROW
//LONG LL_REC_ID
//LL_MAX_ROW = rowcount( )
//
//for ll_rowcount =1 to this.deletedcount( )
//	LL_REC_ID = this.getitemNumber(ll_rowcount,'record_id',delete!,FALSE)
//	DELETE FROM sys_audit  
//   WHERE sys_audit.rec_id =:LL_REC_ID;
//	
//next

//Start Change Code By Jervis 08.15.2007
/*
if not ib_read_only  then 
	super :: event pfc_deleterow( )
	return success
end if 

return success

OF_ENABLE_SAVE( )

return success
*/
if not ib_read_only  then 
	OF_ENABLE_SAVE( )
	return super :: event pfc_deleterow( )
else
	return NO_ACTION
end if 
//End Change Code By Jervis 08.15.2007

end event

event constructor;//////////////////////////////////////////////////////////////////////
//  do not run this code if we are not using contract
//////////////////////////////////////////////////////////////////////

long i

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 03.14.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
select set_cont into :i from icred_settings;
*/
i = Long(gnv_data.of_getitem( "icred_settings", "set_cont", False))
//---------------------------- APPEON END ----------------------------

if i = 0 then return success

//ib_rmbmenu	= true
of_setbase( true)
inv_base.of_SetColumnDisplayNameStyle ( inv_base.HEADER )
of_settransobject( sqlca)
////////////////////////////////////////////////////////////////////
// do not display filter errors
////////////////////////////////////////////////////////////////////
//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 2006-07-03 By: Liu Hongxin
//$<reason> NoUserPrompt is unsupport, replace it ItemError event of this.
/*
 Modify("DataWindow.NoUserPrompt='yes'")
 */
//---------------------------- APPEON END ----------------------------

is_notify_who[1] =  'support@contractlogix.com'


if isvalid(inv_rowmanager)  then 
    inv_rowmanager.of_setconfirmondelete( true)
end if


//invo_dwsrv =  create n_cst_dwsrv 	2007.7.12 By Jervis

of_set_drop_down_ret( )

of_set_rowselect( )

of_allow_sort()
of_allow_filter()

is_title_bar_text = this.title

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.18.2006 By: LeiWei
//$<reason> The X button should be disabled on all datawindow title bars.

This.Controlmenu = False
This.maxbox = False
This.Minbox = False

//---------------------------- APPEON END ----------------------------

//if ib_ShowTipsHelp  then 
//	iuo_tips.addtool(this,"",0) 
//end if 

//Added By Jay Chen 07-20-2015 add show dwtip
Powerobject	lpo_parent
is_show_tip = gnv_data.of_getitem("icred_settings","show_column_tip",false)
if isnull(is_show_tip) or is_show_tip = '' then is_show_tip = '0'
If is_show_tip = '1' Then	
	If Not IsValid(inv_dw_tooltip) Then
		inv_dw_tooltip = Create nv_tooltip
		lpo_parent = This.GetParent()
		
		Do While IsValid(lpo_parent)
			If lpo_parent.TypeOf() = window! Then Exit
			lpo_parent = lpo_parent.GetParent()
		Loop
		
		inv_dw_tooltip.f_uo_SetRequestor(lpo_parent)
		inv_dw_tooltip.f_uo_UseBalloonTip(False)
		inv_dw_tooltip.f_uo_SetMaxWidth(1200)
		inv_dw_tooltip.f_uo_setdelaytime(1, 500)		
	End If
	
	il_tooltip_dwid = inv_dw_tooltip.f_uo_AddTool(This, "" , inv_dw_tooltip.TTF_SUBCLASS)	

End If
//end


end event

event updateend;call super::updateend;


if ROWSUpdated > 0 OR ROWSdeleted > 0 OR ROWSinserted > 0 THEN 

of_getparentwindow(iw_parent )

if classname(iw_parent) = 'w_contract' then 
	iw_parent.FUNCTION DYNAMIC WF_AUDIT(THIS)
	//Added By Mark Lee 10/24/12
//	of_savetosort()  // Add by Jack 06/22/2007
	Post of_savetosort()				//if the dw had sort, the dw update will triggers twices.

end if 

END IF 
end event

event pfc_retrieve;call super::pfc_retrieve;//LONG LL_COLUMN_COUNT,LL_I
//LL_COLUMN_COUNT = LONG(Object.DataWindow.Column.Count)
//
//FOR LL_I = 1 TO LL_COLUMN_COUNT
//	if Describe("#" +STRING(LL_I) + ".Edit.Style") = 'dddw' then
//		messagebox('',Modify("#" +STRING(LL_I)  + ".DDDW.AutoRetrieve=no"))
//	END IF 
//NEXT

RETURN SUCcess
end event

event other;call super::other;//------------------------------------------------------------- 
// Check to see if the title bar for this datawindow has been 
// clicked and prevent it
//-------------------------------------------------------------
//modified by gavins 20121205  use   syscommand
//If Message.WordParm = 61458 Then 
//		Message.Processed = True
//		Message.ReturnValue = 0 
//End If
end event

event editchanged;call super::editchanged;OF_ENABLE_SAVE( )
end event

event itemchanged;call super::itemchanged;String	ls_ColStyle,ls_ColType

Of_Enable_Save()

ls_ColStyle = This.Describe(dwo.name + ".Edit.Style")
ls_ColType = This.Describe(dwo.name + ".ColType")

if ls_ColStyle = "dddw" or ls_ColType = "datetime" or ls_ColType = "date" then			//Added by Scofield on 2008-01-03
	of_AutoDataFill(il_ViewId,il_ScreenId,dwo.name,row,data)
end if

Post Event ue_post_itemchanged( row,dwo.name,data)

end event

event clicked;call super::clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 05.11.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<reason> Comment out the redunant script.
//event ue_populatedddws( )
//---------------------------- APPEON END ----------------------------

//add click hyperlink to goto this link  added by gavins 20120612
of_clicklink( DWO, Row )


/// Comment By Gavin.Jay 2017-05-05
//Begin - Added By Gavin.Jay 2017-04-05 for task744:Word Wrap Multi Select Drop-down Fields
//string ls_column, ls_dddw_name,ls_coltag,ls_colname, ls_userid,ls_lable, ls_coltype, ls_colProtect
//long 	li_value,ll_find, ll_null
//n_ds lnds_user
//datawindowchild  dwchild
//string ls_multi_selec, ls_syntax
//ls_column = dwo.name
//ls_coltype = Describe(ls_column+".coltype")
//ls_colProtect = Describe(ls_column+".Protect")
//
//if (ls_colProtect = "!" Or ls_colProtect = "?" Or IsNull (ls_colProtect)) Then ls_colProtect = "0"
//if(il_screenid = 9 or il_screenid = 10) and Left ( lower(ls_column), 7 ) = "custom_" and left(lower(ls_coltype),4) = 'char' and ls_colProtect = "0" then
//	
//	ls_multi_select = "";
//	select object_format into :ls_multi_select from screen_field_select_item_attribute where view_id = :il_viewid and screen_id = :il_screenid and object_name = :ls_column and object_type = 'multi-select'; 
//	if isnull(ls_multi_select) then ls_multi_select = ''
//	if ls_multi_select = '' then ls_multi_select = 'N'
//	if ls_multi_select = 'Y' then 	
//		ls_syntax = ""
//		ls_syntax = of_get_multi_select(ls_column,il_viewid,il_screenid)
//		if Len ( ls_syntax ) > 5 Then
//			This.Modify ( ls_syntax )
//			
//			ls_colname = ls_column
//			ls_dddw_name = lower(Describe(ls_column + ".DDDW.Name"))
//	
//			If ls_colname = 'app_facility' Then
//			ls_colname = ls_colname
//		End If
//
//		IF ls_dddw_name = "d_dddw_code_lookup" OR ls_dddw_name = "d_dddw_code_lookup_action_type" THEN
//			ls_coltag = Lower(Describe(ls_colname + ".TAG"))
//			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
//				
//			IF li_value <> 1 THEN
//				gnv_app.of_setcontraccache_code_lookup( ls_coltag )
//				li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
//			END IF
//		elseif ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then //add d_dddw_company_list - jervis 04.18.2011
//			ls_coltag = Lower(Describe(ls_colname + ".TAG"))			
//			li_value = 1
//		ELSE
//			li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_dddw_name,lnds_user)
//		END IF
//
//		IF li_value = 1 THEN
//			getchild( ls_colname, dwchild)
//			
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<modify> 04.25.2007 By: Jack
//			//$<reason> Fix a defect.
//			
//			if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then //add d_dddw_company_list - jervis 04.15.2011
//				SetNull(ll_null)
//				dwchild.Settransobject( sqlca)
//				If ls_dddw_name = 'dddw_contact_company_new' Then //Added By Ken.Guo 02/22/2012. Added if statement
//					dwchild.Retrieve( gs_user_id)
//				Else
//					
//					dwchild.Retrieve( ls_coltag)
//				End If
//
//
//				dwchild.InsertRow(1)
//				dwchild.SetItem(1,'facility_id',ll_null)
//				dwchild.setitem(1,"facility_name",'')
//				// 03/06/12 added by mark Track Appeon 
//				IF w_mdi.of_security_access( 6930 ) = 0 THEN
//					long 	ll_finditem
//					ll_finditem = dwchild.find(" facility_id = -1 ",1, dwchild.rowcount())
//					if ll_finditem > 0 then 
//						dwchild.RowsDiscard(ll_finditem,ll_finditem,Primary!)
//					end if 
//				end if
//			else
//				//Begin - Modified By Ken.Guo 2010-02-02. Somewhere display as numeric.
//				//lnds_user.ShareData ( dwchild )	 
//				If ls_coltag = 'contract category' Then
//					dwchild.Reset()
//					lnds_user.rowscopy(1, lnds_user.rowcount(),Primary!,dwchild, 1,Primary!)
//				Else
//					lnds_user.ShareData ( dwchild )	
//				End If				
//				//End - Modified By Ken.Guo 2010-02-02
//			end if
//			//---------------------------- APPEON END ----------------------------
//	
//			
//			if ls_dddw_name = 'd_dddw_users' then
//				//BEGIN---Modify by Scofield on 2009-12-09
//				if dwChild.RowCount() > 0 then
//					ls_UserID = dwChild.GetItemString(1,"user_id")
//				end if
//				
//				if Not IsNull(ls_UserID) and Trim(ls_UserID) <> "" then
//					dwChild.InsertRow(1)
//					dwChild.SetItem(1,"user_id",'')
//				end if
//				//END---Modify by Scofield on 2009-12-09
//			end if
//		
//			//--------------------------- APPEON BEGIN ---------------------------
//			//$<add> 03.27.2007 By: Jack 
//			//$<reason> Fix a defect.
//			//long ll_find
//			string ls_displaycolumn
//			ls_displaycolumn = This.Describe(ls_colname + ".dddw.displaycolumn")
//			ll_find = dwchild.find(ls_displaycolumn + " = '(NONE)'",1,dwchild.rowcount())
//			If ll_find > 0 Then
//				dwchild.setitem(ll_find,ls_displaycolumn,'')
//			End If
//			//---------------------------- APPEON END ----------------------------
//			
//			//---------Begin Added by Alfee 09.30.2007----------------------------
//			//<$Reason>Add contract access control to add lookup data
//			String ls_lookup_name
//			If Not IsValid(iw_parent) Then of_getparentwindow(iw_parent)
//			If IsValid(iw_parent) and (ls_dddw_name = "d_dddw_code_lookup") Then
//				If ClassName(iw_parent) = 'w_contract' Then
//					ll_find = 0
//					ll_find = dwchild.find("lookup_code = -777", 1, dwchild.rowcount())
//					If w_mdi.of_security_access(2075) = 0 Then //no access for Add LookUp Data
//						If ll_find > 0 Then dwchild.DeleteRow(ll_find)
//					End If
//				End If
//			End If
//			//----------End Added ------------------------------------------------
//
//			
//			//Start code by jervis 10.20.2009
//			//dynamically change the words *Add lookup Code* to *Add Agreement Type* and 
//			//replace the words lookup code with the field label
//			if ls_dddw_name = "d_dddw_code_lookup" or ls_dddw_name = "d_dddw_code_lookup_action_type" then
//				ll_find = dwchild.find("lookup_code = -777", 1, dwchild.rowcount())
//				If ll_find > 0 Then 
//					ls_lable = This.Describe(ls_colname + "_t.text")
//					if ls_lable <> '!' and ls_lable <> '?' then
//						dwchild.setitem(ll_find,"code","*Add " + ls_lable + "*")
//						dwchild.setitem(ll_find,"description","*Add " + ls_lable + "*")
//						//dwchild.setitem(ll_find,"custom_1","*Add " + ls_lable + "*")
//						dwchild.setitem(ll_find,"large_description_1","*Add " + ls_lable + "*")
//						dwchild.setitem(ll_find,"large_description_2","*Add " + ls_lable + "*")
//					end if
//				end if
//			end if
//			//End code by jervis 10.20.2009
//			
//		END IF
//		End If
//		
//	End if
//End If
//
////End - Added By Gavin.Jay 2017-04-05



end event

event retrievestart;call super::retrievestart;//-----Begin Commented by Alfee 09.30.2007-----
//<$Reason>Moved to the selectionchanged event
//parent.dynamic event ue_set_security( )
//-----End Commented --------------------------
event ue_populatedddws( )

end event

event dropdown;OF_ENABLE_SAVE( )

Long  ll_rtn 
Boolean lb_titlebar 
string ls_multi_select,ls_field_name,ls_displayname
long ll_cnt,ll_row,ll_code

lb_titlebar = TitleBar 

//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 2006-08-16 By: Rodger Wu (Contract)
//$<reason> 
/* If lb_titlebar Then TitleBar = FALSE */
//---------------------------- APPEON END ----------------------------

//SetRedraw ( FALSE ) 
//ll_rtn = Super::Event dropdown() 
//If lb_titlebar Then TitleBar = TRUE 
//SetRedraw ( TRUE ) 
//Return ll_rtn


//Modified By Jay Chen 12-23-2015 for multi select item
SetRedraw ( FALSE ) 
ls_field_name = this.getcolumnname()

//Modified By Ken.Guo 2017-05-09 improve performance
//select object_format into :ls_multi_select from screen_field_select_item_attribute where view_id = :il_viewid and screen_id = :il_screenid and object_name = :ls_field_name and object_type = 'multi-select'; 
ls_multi_select = gnv_data.of_getitem( 'multi_select_fields', 'object_format', 'view_id = ' + String(il_viewid) + ' and screen_id = ' + String(il_screenid) + ' and object_name = "' +ls_field_name+ '"' + ' and object_type = "multi-select"' )

if isnull(ls_multi_select) then ls_multi_select = ''
if ls_multi_select = '' then ls_multi_select = 'N'
if ls_multi_select = 'Y' and (il_screenid = 9 or il_screenid = 10) then 
	
	//Added By Ken.Guo 2017-05-09
	If this.describe(ls_field_name + '.dddw.PercentWidth') <> '1' Then
		 This.modify(ls_field_name + '.dddw.PercentWidth=1 ' + ls_field_name + '.dddw.lines = 1 ') 
	End If
	
	of_SetDropDownSelect(true) 
	iuo_select.il_view = il_viewid
	iuo_select.il_screen = il_screenid
	iuo_select.is_fieldname = ls_field_name
	
	if ib_read_only Then //Added By Gavin.Jay 2017-04-19 Fix bug for readonly
		iuo_select.dw_select.Modify("as_choose.protect = '1'")
	else
		iuo_select.dw_select.Modify("as_choose.protect = '0'")
	end If
	
	 if iuo_select.event pfc_dropdown() = 1 then
		gnv_debug.of_output(false, 'u_dw_contract.dropdown iuo_select.event pfc_dropdown() = 1 ')
		ll_rtn = 1
	else
		gnv_debug.of_output(false, 'u_dw_contract.dropdown iuo_select.event pfc_dropdown() <> 1 ')
		iuo_select.il_view = 0
		iuo_select.il_screen = 0
		iuo_select.is_fieldname = ''
		ll_rtn = Super::Event dropdown() 
	end if
else
	ll_rtn = Super::Event dropdown()  
end if

If lb_titlebar Then TitleBar = TRUE
SetRedraw ( TRUE ) 
Return ll_rtn







end event

event pfc_insertrow;
//Start Change Code By Jervis 08.15.2007
if not ib_read_only  then 
	return super :: event pfc_insertrow( )
else
	return NO_ACTION
end if 

//End Change Code By Jervis 08.15.2007
end event

event pfc_addrow;
if not ib_read_only  then 
	super :: event pfc_addrow( )
	return success
end if 

return success

end event

event losefocus;//BEGIN---Modify by Evan 07/21/2008
//No inherit parent code
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.15.2006 By: Liang QingShi
//$<reason> Contract module modification
/*
this.title = is_title_bar_text
*/
//this.title = this.tag

//---------------------------- APPEON END ----------------------------

of_GetParentWindow(iw_parent)
this.Title = is_title_bar_text
//END---Modify by Evan 07/21/2008



//Add by jervis 11.13.2009
string ls_column, ls_filter_company_contact ,  ls_specialFilter
string ls_CurStyle,ls_CurTag,ls_dddw_name

ls_column = this.GetColumnname( )
if ls_column <> "" then
	ls_CurStyle = This.Describe(ls_column + ".Edit.Style")
	ls_CurTag = This.Describe(ls_column + ".tag")
	ls_dddw_name = This.Describe(ls_column + ".dddw.name")	

	if ls_CurStyle = 'dddw' and len(ls_CurTag) > 1  then
		is_prior_field = ''
		of_FieldDependFilter(il_ViewId,il_ScreenId,ls_column,this.GetRow(),false,is_ori_filter) //add is_ori_filter - jervis 08.01.2011
	end if
	
	//Added By Jay Chen 03-22-2016 for facility depend A,B,O
	if ls_CurStyle = 'dddw' and len(ls_CurTag) = 1  then
		if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then
			is_prior_field = ''
			of_FieldDependFilter(il_ViewId,il_ScreenId,ls_column,this.GetRow(),false,is_ori_filter ) //add is_ori_filter - jervis 08.01.2011
			this.setRedraw( true  )
		end if
	end if
	//end
end if

//Added By Ken.Guo 2017-03-03. Task 722
This.of_set_sort_filer_restore()

/// Comment By Gavin.Jay 2017-05-05
////Begin - Added By Gavin.Jay 2017-04-05 for task744:Word Wrap Multi Select Drop-down Fields
//string ls_coltype, ls_colname
//string ls_multi_select,ls_syntax, ls_temp
//if ls_column <> "" then
//	ls_CurStyle = This.Describe(ls_column + ".Edit.Style")
//	ls_coltype = Describe(ls_column+".coltype")
//	
//	if(il_screenid = 9 or il_screenid = 10) and Left ( ls_column, 7 ) = "custom_" and ls_CurStyle = "dddw" and left(lower(ls_coltype),4) = 'char' then
//		
//			ls_multi_select = "";
//			select object_format into :ls_multi_select from screen_field_select_item_attribute where view_id = :il_viewid and screen_id = :il_screenid and object_name = :ls_column and object_type = 'multi-select'; 
//			if isnull(ls_multi_select) then ls_multi_select = ''
//			if ls_multi_select = '' then ls_multi_select = 'N'
//			if ls_multi_select = 'Y' then 
//				ls_syntax = ""
//				ls_temp = ""
//				ls_colname = ls_column
//				
//				ls_syntax = ls_colname + ".edit.limit=0 "+ls_colname+".edit.case=any "+ls_colname+".edit.focusrectangle='no' "+ls_colname+".edit.autoselect='yes' " &
//						+ ls_colname+".edit.nilisnull='yes' " + ls_colname+".edit.imemode=0 " + ls_colname+".edit.autohscroll='no' " + ls_colname+".edit.autovscroll='no' " &
//						+ ls_colname+".edit.codetable='no' " + ls_colname+".edit.displayonly='yes' " + ls_colname+".edit.hscrollbar='no' " + ls_colname+".edit.vscrollbar='no' "
//						
//				This.Modify ( ls_syntax )
//				
//			End if
//		End If
//	End If
////End - Added By Gavin.Jay 2017-04-05
end event

event pfc_prermbmenuproperty;call super::pfc_prermbmenuproperty;//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 2006-08-11 By: Rodger Wu (Contract)
//$<reason> No m_table founded.

/*
if ib_allow_filter then
    am_dw.m_table.m_filterdash.Visible  = true
	am_dw.m_table.m_filter.Visible = true	
end if 


if ib_allow_sort then
	am_dw.m_table.m_filterdash.Visible  = true
   am_dw.m_table.m_sort.Visible  = true
end if 
*/

//---------------------------- APPEON END ----------------------------




end event

event rbuttondown;call super::rbuttondown;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.14.2006 By: LeiWei
//$<reason> Put a Right click option "Clear Date Field" for all date fields.

integer col
integer ret
datetime dtn
string colname, ls_msg
STRING DT

setnull(dtn)

//col = this.getclickedcolumn() --alfee 09.05.2007
colname = dwo.name

//Start Change By Jervis 01.30.2007
if this.Describe("DataWindow.ReadOnly") = "yes" or this.Describe(colname + ".protect") <> "0" or this.Describe(colname + ".TabSequence") = "0" then return
//End Change
ls_msg = "Would you like to set this Date to null?"
If ib_contract_alarm Then ls_msg += "~r~rIf yes, the alarm setting for this date will also be cleared out."

if this.Describe( colname + ".ColType") = "datetime" THEN
	//ret = messagebox("Set Null","Would you like to set this Date to null?",question!,yesno!,2 ) --alfee 09.05.2007
	ret = messagebox("Set Null", ls_msg, question!, yesno!, 2 )	
	if ret = 1 then
		//this.setitem(row,col,dtn) --alfee 09.05.2007
		this.setitem(row,colname,dtn)
		of_enable_save() //Add by Evan on 06/10/2008
	end if
END IF

//---------------------------- APPEON END ----------------------------

end event

event itemerror;call super::itemerror;//return 3   //Added By Scofield on 2009-01-16
string 			ls_validation, ls_msg, ls_arr[], ls_tmp
long				i

//Begin - Added By Mark Lee 07/30/2015.
if row > 0 then 
	
	ls_validation = string(this.describe( string(dwo.name)+".validation"))
	ls_msg = string(this.describe( string(dwo.name)+".validationmsg"))
	
	if (not isnull(ls_validation) and trim(ls_validation) <> "") and not (isnull(string(data)) or trim(string(data))= '' ) and &
			( not isnull(ls_msg)  and &
			lower(ls_msg)= lower("Please enter a valid email address such as sample@domain.com or multiple ones separated by ~';~'")  ) then 
			
		return this.event pfc_check_validation( string(dwo.name), data, "Email Address")  
	end if 
//	
//	if (not isnull(ls_validation) and trim(ls_validation) <> "") and not (isnull(string(data)) or trim(string(data))= '' ) and &
//		( not isnull(ls_validation)  and &
//		lower(ls_validation)= lower("(pos(gettext(),'@') > 1 and len(gettext()) > 4 and lastpos(gettext(),'.') > pos(gettext(),'@') + 1 and lastpos(gettext(),'.') <> len(gettext()) and pos(gettext(),' ')= 0 and pos(gettext(),';')= 0) or isnull(gettext()) ") )  then 
////		( not isnull(ls_msg)  and &
////		lower(trim(ls_msg))= lower(trim("'Please enter a valid email address such as sample@domain.com. '")) )  then 
//		if Pos(string(data), ';') > 0 then 
//			gnv_string.of_parsetoarray( string(data),';', ls_arr)
//			for i = 1 to upperbound(ls_arr)				
//				ls_tmp = ls_arr[i]
//				if not isnull(ls_tmp) and len(ls_tmp) > 4 and  pos(ls_tmp,'@') > 1 and lastpos(ls_tmp,'.') > pos(ls_tmp,'@') +1 and lastpos(ls_tmp,'.') <> len(ls_tmp) and pos(ls_tmp,' ') = 0  then		
//					//continue
//				else
//					Messagebox("DataWindow Error","The '"+ls_tmp +"' is not a valid email address. ~r~nPlease enter a valid email address such as sample@domain.com.")
////					return 0
//					return 3
//				end if 
//			next 
//
//			return 2 				// Accept the data value							
//		else 
//			return 0	// (Default) Reject the data value and show an error message box
//////			ls_tmp = string(data)
//////			if not isnull(ls_tmp) and len(ls_tmp) > 4 and  pos(ls_tmp,'@') > 1 and lastpos(ls_tmp,'.') > pos(ls_tmp,'@') +1 and lastpos(ls_tmp,'.') <> len(ls_tmp) and pos(ls_tmp,' ') = 0  then		
//////				//continue
//////			else
//////				return 0
//////			end if 
//		end if 
//	end if 	
end if 

return 3 // Reject the data value but allow focus to change

//End - Added By Mark Lee 07/30/2015.

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
If Not ib_RMBmenu Or IsNull (dwo) Then	
	u_dw::event rbuttonup(xpos,ypos,row,dwo) //Added By Ken.Guo 2016-03-30
	Return 1
End If

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

lm_dw.m_table.m_mailaspdf.Visible = False
lm_dw.m_table.m_saveaspdf.Visible = False
//---------------------------- APPEON END ----------------------------

// Popup menu
lm_dw.m_table.PopMenu (lw_parent.PointerX() + 5, lw_parent.PointerY() + 10)

Destroy lm_dw

Return 1

end event

event itemfocuschanged;call super::itemfocuschanged;string ls_CurStyle
String ls_PriStyle
string ls_CurTag
string ls_PriTag
datawindowchild ldwc_child
Long ll_find
String ls_lable, ls_specialFilter, ls_filter_company_contact
string ls_cur_dddw_name,ls_pri_dddw_name //Added By Jay Chen 03-22-2016

ls_CurStyle = This.Describe(dwo.name + ".Edit.Style")
ls_CurTag = This.Describe(dwo.name + ".tag")
ls_PriStyle = this.Describe( is_prior_field + ".Edit.Style")
ls_PriTag = This.Describe(is_prior_field + ".tag")
ls_pri_dddw_name = This.Describe(is_prior_field + ".dddw.name")
ls_cur_dddw_name = This.Describe(dwo.name + ".dddw.name")

if ls_PriStyle = 'dddw' and len(ls_PriTag) > 1 then
	of_FieldDependFilter(il_ViewId,il_ScreenId,is_prior_field,row,false,is_ori_filter)
end if
//Added By Jay Chen 03-22-2016 for facility depend
if ls_PriStyle = 'dddw' and len(ls_PriTag) = 1 then
	if ls_pri_dddw_name = "d_dddw_company" or ls_pri_dddw_name = "d_dddw_company_list" or ls_pri_dddw_name = 'dddw_contact_company_new' then
	
		of_FieldDependFilter(il_ViewId,il_ScreenId,is_prior_field,row,false,is_ori_filter )
	end if
end if
//end
is_prior_field = ''
is_ori_filter=''


if ls_CurStyle = 'dddw' and len(ls_CurTag) > 1 then
	is_prior_field = dwo.name
	
	if this.Getchild( dwo.name, ldwc_child) = 1 then
		is_ori_filter = ldwc_child.describe( "datawindow.table.filter")  //jervis 08.01.2011
		If Len(is_ori_filter) = 1 Then is_ori_filter = ''
	else
		is_ori_filter = ''
	end if
	of_FieldDependFilter(il_ViewId,il_ScreenId,dwo.name,row,true,is_ori_filter)
	
	//Added By Ken.Guo 05/07/2012. Refresh Add Label Name
	If Len(ldwc_child.Describe('lookup_code.type')) > 0 Then
		ll_find = ldwc_child.Find('lookup_code = -777',1, ldwc_child.rowcount() )
		If ll_find > 0 Then	
			ls_lable = This.Describe(dwo.name + "_t.text")
			if ls_lable <> '!' and ls_lable <> '?' then
				ldwc_child.setitem(ll_find,"code","*Add " + ls_lable + "*")
				ldwc_child.setitem(ll_find,"description","*Add " + ls_lable + "*")		
			End If
		End If
	End If	
	
end if

//Added By Jay Chen 03-22-2016 for facility depend
if ls_CurStyle = 'dddw' and len(ls_CurTag) = 1 then
	if ls_cur_dddw_name = "d_dddw_company" or ls_cur_dddw_name = "d_dddw_company_list" or ls_cur_dddw_name = 'dddw_contact_company_new' then
		is_prior_field = dwo.name
		ls_filter_company_contact = gnv_data.of_getitem("icred_settings", "filter_company_contact", false) //added by gaivns 20160516 when using filldepend function , filter will be clear, but company need to preserve
		if ls_filter_company_contact = '1' then
			if ls_cur_dddw_name = 'dddw_contact_company_new' then
				ls_specialFilter = "app_facility_status = 'A' "
			else
				ls_specialFilter = "status = 'A' "
			end if
		end if
		of_FieldDependFilter(il_ViewId,il_ScreenId,dwo.name,row,true,is_ori_filter, ls_specialFilter )
	end if
end if
//end

//Added By Ken.Guo 2017-03-03 Task 722
This.of_set_sort_filer( dwo.name)
//datastore lds_field
//datawindowchild ldwc_data
//String ls_sort, ls_filter, ls_filter_org, ls_filter_new,ls_filter_expression
//If ls_CurStyle = 'dddw' and len(ls_CurTag) > 0 Then
//	this.getchild(dwo.name, ldwc_data)
//	
//	//Get sort/filter data
//	gnv_data.of_retrieveIfNecessary("field_other_properties", FALSE)
//	lds_field = gnv_data.ids_field_other_properties
//	ll_find = lds_field.find('data_view_id=' + String(il_ViewId) + ' and screen_id=' + String(il_ScreenId) + 'and field_name= "' +dwo.name+ '"', 1, lds_field.rowcount())
//	If ll_find > 0 Then	
//		
//		//Filter function
//		//Get filter data
//		ls_filter_expression = lds_field.getitemstring(ll_find, 'filter_expression')
//		ls_filter_org = trim(ldwc_data.describe("datawindow.table.filter"))
//		If  lds_field.getitemstring(ll_find, 'field_add') = 'Y' Then //9990 is begin flag, 9991 is end flag
//			ls_filter = '(9990=9990 and (('  + ls_filter_expression + ' ) or lookup_code = -1 or lookup_code = -777 or lookup_code = -999) and 9991=9991) '	
//		Else
//			ls_filter = '(9990=9990 and ('  + ls_filter_expression + ') and 9991=9991) '	
//		End If
//		
//		If ls_filter_expression <> '' and not isnull(ls_filter_expression) Then
//			//Use new filter
//			If ls_filter_org = '' or ls_filter_org = '?' or ls_filter_org = '!' Then
//				ls_filter_new = ls_filter
//			Else
//				If Pos( lower( ls_filter_org) , lower( ls_filter) ) = 0 Then
//					ls_filter_new = ls_filter_org + ' and ' + ls_filter
//				Else
//					ls_filter_new = ls_filter_org
//				End If
//			End If
//			ldwc_data.setfilter(ls_filter_new)
//		Else
//			//restore the filter 
//			If Pos( lower( ls_filter_org) , lower( ls_filter) ) > 0 Then
//				If Pos( lower( ls_filter_org) ,  ' and '  + lower( ls_filter) ) > 0 Then
//					ls_filter_new = Mid(ls_filter_org, Pos( lower( ls_filter_org) ,  ' and '  + lower( ls_filter) ))
//				ElseIf lower( ls_filter_org) =  lower( ls_filter) Then
//					ls_filter_new = ''
//				End If
//			Else
//				ls_filter_new = ''
//			End If
//		End If
//		ldwc_data.filter()
//		
//		//Sort function
//		ls_sort = lds_field.getitemstring(ll_find, 'sort_expression')
//		If ls_sort <> '' and  not isnull(ls_sort) Then
//			ldwc_data.setsort(ls_sort) // use new sort
//		Else
//			//Restore to default sort 
//			If len(ls_CurTag) = 1  Then
//				ldwc_data.setsort('code A')
//			Else
//				ldwc_data.setsort('facility_name A')
//			End If
//		End If		
//		ldwc_data.Sort()
//		
//	End If
//End If


end event

event buttonclicking;call super::buttonclicking;//Added By mark 03/22/12 for right of control. //Added '_dotdd_company' By Ken.Guo 07/24/2012
If  ib_enable_columns = False and Pos(dwo.name,"_dotdd_company") > 0  Then
	return 1
End If
end event

event buttonclicked;call super::buttonclicked;//Added By mark 04/01/12 for add a button of define by oneself that use define by oneself
str_pass 		lstr_dotdd_pass
String 		ls_dotdd_name,	ls_dotdd_column,	ls_dotdd_Company, ls_dotdd_facility_name, ls_dotdd_tmp
Long			ll_dotdd_facility,	ll_dotdd_find,	ll_dotdd_row
DataWindowChild		ldwc_dotdd_child
String			ls_dotdd_col_tag,	ls_dotdd_display_col, ls_dotdd_coltype, ls_dotdd_datacolumn
long ll_facility_id

lstr_dotdd_pass.s_u_dw = this
ls_dotdd_name 	= dwo.name

IF Pos(ls_dotdd_name,"_dotdd_company") > 0 And Left(ls_dotdd_name,2) = 'b_' Then
	ls_dotdd_column =  mid(ls_dotdd_name,3,Pos(ls_dotdd_name,'_dotdd_company') - 3 )
	
	lstr_dotdd_pass.s_string = 'Dotdd_Company'
	ls_dotdd_Company =  this.describe("Evaluate( 'lookupdisplay("+ls_dotdd_column+") ', "+string(1)+" )")
	ls_dotdd_col_tag	=  this.describe(ls_dotdd_column+".tag")
	If IsNull(ls_dotdd_Company) or trim(ls_dotdd_Company) = '' Then 
		ls_dotdd_Company = ''
		lstr_dotdd_pass.display_contact_detail =false
	Else
		lstr_dotdd_pass.display_contact_detail =true
	End if 
	lstr_dotdd_pass.s_string_array[1]  = ls_dotdd_Company 	// company name id of the contract
	lstr_dotdd_pass.as_search_type	 =	ls_dotdd_col_tag
	//Added By Jay Chen 01-07-2015
	if len(ls_dotdd_Company) > 0 then
		select facility_id into :ll_facility_id from app_facility where lower(facility_name) = lower(:ls_dotdd_Company);
		if isnull(ll_facility_id) then ll_facility_id = 0
		if ll_facility_id > 0 then
			lstr_dotdd_pass.l_facility_id = ll_facility_id
		end if
	end if
	//end
	OpenWithParm ( w_contract_contact, lstr_dotdd_pass)
	
	ls_dotdd_tmp =  string(this.Describe("Datawindow.syntax"))
	If message.doubleparm > 0 Then 
		ll_dotdd_facility = message.doubleparm
		if this.GetChild( ls_dotdd_column,ldwc_dotdd_child) = 1 then
			ls_dotdd_display_col	=	 string(this.Describe(ls_dotdd_column+".dddw.displaycolumn"))
			ls_dotdd_datacolumn =	 string(this.Describe(ls_dotdd_column+".dddw.datacolumn"))

			ls_dotdd_coltype	=	string(this.Describe(ls_dotdd_column+".coltype"))
					
			if ldwc_dotdd_child.rowcount( ) > 0 then 					
				ll_dotdd_find = ldwc_dotdd_child.find( "facility_id = " + string(ll_dotdd_facility),1, ldwc_dotdd_child.rowcount( ) )
				if ll_dotdd_find <= 0 then 
					ls_dotdd_facility_name = gnv_data.of_GetItem( "facility",ls_dotdd_display_col, "facility_id = " + string(ll_dotdd_facility),"Dotdd_Company")
					ll_dotdd_row = ldwc_dotdd_child.InsertRow( 1)
					ldwc_dotdd_child.SetItem( ll_dotdd_row,"facility_id", ll_dotdd_facility)
					ldwc_dotdd_child.SetItem( ll_dotdd_row,ls_dotdd_display_col, ls_dotdd_facility_name)
				Else 
					ls_dotdd_facility_name = ldwc_dotdd_child.GetItemString( ll_dotdd_find, ls_dotdd_display_col)
				end if 
			end if 
		end if
		IF Pos(ls_dotdd_coltype,'(') > 0 Then
			ls_dotdd_coltype = left(ls_dotdd_coltype,Pos(ls_dotdd_coltype,'(') - 1)
		End If
		Choose Case ls_dotdd_coltype
			case "char"
					this.setitem(row,ls_dotdd_column, string(ll_dotdd_facility))  //Modified By Ken.Guo 2015-11-27. fix bug. changed '1' to 'row'
					If ls_dotdd_column = "facility_name" or ls_dotdd_datacolumn = "facility_name" Then
						this.setitem(row,ls_dotdd_column, ls_dotdd_facility_name)
					End If 
			case "decimal","int","long","number","real","ulong"
					this.setitem(row,ls_dotdd_column, Long(ll_dotdd_facility))
		End Choose 
		of_AutoDataFill(il_ViewId,il_ScreenId,ls_dotdd_column,row,String(ll_dotdd_facility) ) //Added By Ken.Guo 2015-11-27
	End If	
End If 
end event

event doubleclicked;call super::doubleclicked;//====================================================================
// Event: doubleclicked
//--------------------------------------------------------------------
// Description: popup time calendar when set the dateformat is hh:mm.
//--------------------------------------------------------------------
// Arguments:
// 	value    integer     xpos
// 	value    integer     ypos
// 	value    long        row
// 	value    dwobject    dwo
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 04-17-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_colname,ls_edit_mask,ls_coltype,ls_editstyle

if row < 1 then return
if not isvalid(dwo) or isnull(dwo) then return 1 //Added By Jay Chen 01-05-2016
ls_colname = dwo.name
ls_edit_mask = This.Describe (ls_colname+".EditMask.Mask")
ls_editstyle = This.Describe (ls_colname+".Edit.Style")
ls_coltype = This.Describe(ls_colname+".coltype")
If (lower(ls_coltype) =  'date') or (lower(ls_coltype) = 'datetime') and lower(ls_editstyle) = 'editmask' Then
	if left(Upper(ls_edit_mask),3) = 'HH:' then
		Super::Event dropdown() 
	end if
End If
end event

event retrieveend;call super::retrieveend;of_auto_compute_field(0,'R') //Added By Ken.Guo 2016-08-17
end event

