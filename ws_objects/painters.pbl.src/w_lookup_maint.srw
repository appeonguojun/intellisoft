$PBExportHeader$w_lookup_maint.srw
forward
global type w_lookup_maint from w_sheet
end type
type cb_restore from u_cb within w_lookup_maint
end type
type st_count from statictext within w_lookup_maint
end type
type gb_1 from groupbox within w_lookup_maint
end type
type dw_name from u_dw within w_lookup_maint
end type
type cb_new_lookup from u_cb within w_lookup_maint
end type
type dw_users from datawindow within w_lookup_maint
end type
type tab_1 from u_tab_lookup within w_lookup_maint
end type
type tab_1 from u_tab_lookup within w_lookup_maint
end type
end forward

global type w_lookup_maint from w_sheet
integer x = 5
integer y = 312
integer width = 3694
integer height = 2072
string title = "Lookup Painter"
windowstate windowstate = maximized!
event ue_delete ( )
event type integer ue_save ( )
event ue_add ( )
event ue_findrecord ( )
event ue_sort ( )
event ue_filter ( )
event ue_print ( )
event ue_export ( )
event ue_letterstorage ( )
event ue_help ( )
event ue_columnproperty ( )
event ue_change_lookupname ( string as_lookupname )
cb_restore cb_restore
st_count st_count
gb_1 gb_1
dw_name dw_name
cb_new_lookup cb_new_lookup
dw_users dw_users
tab_1 tab_1
end type
global w_lookup_maint w_lookup_maint

type variables
String is_lookup_name
String is_lookup_type

Boolean ib_new_table = False, ib_delete = False

Integer ii_delete_cnt
Integer ii_dept_secure_setting = 0


Long il_lookup_code
Long il_department_code[]

// MSKINNER 09 March 2006 -- begin
boolean ib_refresh_cache /*flag set to true if we update a contact table (at the close of the window)*/


// MSKINNER 09 March 2006 -- end 

n_cst_code_lookup_audit inv_audit //Added by Evan on 2008-01-26

string is_parm  //jervis 10/14/2010

Boolean ib_update = true //Added By Jay Chen 11-07-2013

//Added By Jay Chen 10-17-2014
boolean ib_delete_lookup = false
long il_delete_lookup_code[]

end variables

forward prototypes
public function string of_test_delete (string as_type, long as_code)
public function integer of_add_security_dept (integer ai_row)
public function integer wf_refresh_ctx_cache ()
public function integer of_count ()
public subroutine of_addright (long al_category, string as_lookname)
public subroutine wf_refreshcoltitle (string as_lookup_type, string as_lookup_name)
public subroutine wf_setcollabel (string as_labelname)
public subroutine wf_updateuserdefinfo (string as_lookup_type, string as_lookup_name)
public subroutine of_setmenuitemstatus ()
public subroutine of_enabledall (boolean ab_enabled)
public function long of_deletelookuptable ()
end prototypes

event ue_delete();long l_code,ll_Rtn,ll_delete_code,ll_cnt
long cnt
long ll_department_code,ll_CurRow,ll_return
String ls_text,ls_LookupName

DWItemStatus	ldwis_Status

if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return			//Added by Scofield on 2008-03-12

long ll_rowcount,ll_lookup_code,i
string ls_code
Tab_1.Tabpage_Browse.dw_Browse.accepttext()
ll_lookup_code = Tab_1.Tabpage_Browse.dw_Browse.GetItemNumber( Tab_1.Tabpage_Browse.dw_Browse.GetRow( ), "lookup_code" )
ls_code = Tab_1.Tabpage_Browse.dw_Browse.getitemstring(Tab_1.Tabpage_Browse.dw_Browse.getrow(),'code')

//Added By Ken.Guo 2015-06-02
IF Tab_1.Tabpage_Browse.dw_Browse.RowCount() >  0 THEN
	ls_LookupName = dw_name.GetItemString(1, 'lookup_name')
	Choose Case  lower(ls_LookupName)
		Case 'contract contact type'
			select count(1) into :ll_cnt  from ctx_contacts where contact_type = :ll_lookup_code;
			if ll_cnt > 0 Then
				Messagebox('Warning','You cannot delete this Contact Type because it is associated with '+String(ll_cnt)+' contact(s). ~r~nYou can disassociate these contacts with this contact type and then delete it.')
				Return 
			End If
			
			//Added By Ken.Guo 2015-06-16.
			select count(1) into :ll_cnt from ctx_contract_contacts where association = :ll_lookup_code or  association2 = :ll_lookup_code 
					or  association3 = :ll_lookup_code or association4 = :ll_lookup_code or  association5 = :ll_lookup_code or  association6 = :ll_lookup_code 
					or  association7 = :ll_lookup_code or association8 = :ll_lookup_code or  association9 = :ll_lookup_code or  association10 = :ll_lookup_code ;
			if ll_cnt > 0 Then
				Messagebox('Warning','You cannot delete this Contact Type because it is associated with '+String(ll_cnt)+' Our Company Contact(s). ~r~nYou can disassociate these contacts with this contact type and then delete it.')
				Return 
			End If
			
		Case Lower('Contract Department')
			select count(1) into :ll_cnt  from ctx_contacts where contact_department = :ll_lookup_code;
			if ll_cnt > 0 Then
				Messagebox('Warning','You cannot delete this Contact Department because it is associated with '+String(ll_cnt)+' contact(s). ~r~nYou can disassociate these contacts with this contact department and then delete it.')
				Return 
			End If		
		Case Lower('Contract Position Title')
			select count(1) into :ll_cnt  from ctx_contacts where contact_title = :ll_lookup_code;
			if ll_cnt > 0 Then
				Messagebox('Warning','You cannot delete this Contact Position Title because it is associated with '+String(ll_cnt)+' contact(s). ~r~nYou can disassociate these contacts with this contact position title  and then delete it.')
				Return 
			End If	
		Case Lower('Contract Contact VIA')
			select count(1) into :ll_cnt  from (select  distinct contact_id from CTX_CONTACTS_NUMBERS where via = :ll_lookup_code ) as ccn;
			if ll_cnt > 0 Then
				Messagebox('Warning','You cannot delete this Contact VIA because it is associated with '+String(ll_cnt)+' contact(s). ~r~nYou can disassociate these contacts with this contact via and then delete it.')
				Return 
			End If				
	End Choose 	
End If



IF Tab_1.Tabpage_Browse.dw_Browse.RowCount() = 1 THEN
	ll_Rtn = MessageBox("Warning","If this lookup code is already used in the system, it may fail to delete it or cause the fields that reference this lookup code to display as a number. ~r~n~r~nPlease confirm if you still want to delete it?",Question!,YesNo!)	//Added By Mark Lee 08/13/2014
	if ll_Rtn <> 1 then Return
else
	ll_Rtn = MessageBox('Warning',"If this lookup code is already used in the system, it may fail to delete it or cause the fields that reference this lookup code to display as a number. ~r~n~r~nPlease confirm if you still want to delete it?",Question!,YesNo!)
	if ll_Rtn <> 1 then Return
END IF

if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_address_lookup" then  //Start Code Change ---- 12.06.2007 #V8 maha
	//skip
else
	if Tab_1.Tabpage_Browse.dw_Browse.getitemstring(Tab_1.Tabpage_Browse.dw_Browse.getrow(),"type") = "S" then  //Start Code Change ---- 10.15.2007 #V7 maha
			MessageBox("Delete Error", "You can not delete a lookup item that is grey. ")
		Return
	END IF
end if

//IF department security is set to ON then track records being deleted so you can delete after save
IF ii_dept_secure_setting = 1 THEN
	ii_delete_cnt++
	il_department_code[ ii_delete_cnt ] = Tab_1.Tabpage_Browse.dw_Browse.GetItemNumber( Tab_1.Tabpage_Browse.dw_Browse.GetRow( ), "lookup_code" )
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.13.2007 By: Jack (Contract)
//$<reason> fix a defect.
//Added By Jay Chen 09-16-2014 can not delete clause status:Obsolete
If Lower(is_lookup_name) = 'clause approval status' and lower(ls_code) = 'obsolete' then
	MessageBox("Delete Error", "You can not delete clause approval status which is obsolete. ")
	Return
end if
//end
If Lower(is_lookup_name) = 'contract category' Or lower(is_lookup_name) = 'contract clause category' or (is_lookup_name = 'Contract Division') or (is_lookup_name = 'Contract Department') or (is_lookup_name = 'Contract Type') Then //Added By Jay Chen 03-19-2015
	datastore lds_contract
	datastore lds_folder
	datastore lds_template
	datastore lds_document
	datastore lds_contract_management_right
	
	lds_contract = Create datastore
	lds_folder = Create datastore
	lds_template = Create datastore
	lds_document = Create datastore
	lds_contract_management_right = Create datastore
	
	lds_contract.dataobject = 'd_lookup_contract'
	lds_contract.settransobject(sqlca)
	lds_folder.dataobject = 'd_lookup_folder'
	lds_folder.settransobject(sqlca)
	lds_template.dataobject = 'd_lookup_template'
	lds_template.settransobject(sqlca)
	lds_document.dataobject = 'd_lookup_document'
	lds_document.settransobject(sqlca)
	lds_contract_management_right.dataobject = 'd_lookup_contract_management_right'
	lds_contract_management_right.settransobject(sqlca)
	
	gnv_appeondb.of_startqueue( )
	lds_contract.retrieve(ll_lookup_code)	
	lds_folder.retrieve(ll_lookup_code)	
	lds_template.retrieve(ll_lookup_code)	
	lds_document.retrieve(ll_lookup_code)	
	lds_contract_management_right.retrieve(ll_lookup_code)	
	gnv_appeondb.of_commitqueue( )
	
	ll_rowcount = lds_contract.rowcount()
	
	If ll_rowcount > 0 Then
		messagebox("Lookup Data for code - " + ls_code,"Category lookup is required by the Contract Folder->Detail->Category field. Please modify that field first.")
		Return 
	End If
	ll_rowcount = lds_folder.rowcount()
	If ll_rowcount > 0 Then
		messagebox("Lookup Data for code - " + ls_code,"Category lookup is required by the Clause Painter module. Please modify the Category in the Folder table.")
		Return 
	End If
	
	ll_rowcount = lds_template.rowcount()
	If ll_rowcount > 0 Then
		messagebox("Lookup Data for code - " + ls_code,"Category lookup is required by the Template Painter module. Please modify the Category in the Template table.")
		Return 
	End If
	ll_rowcount = lds_document.rowcount()
	If ll_rowcount > 0 Then
		messagebox("Lookup Data for code - " + ls_code,"Category lookup is required by the Document Painter or Document Manager module. Please modify the Category in the Document table.")
		Return 
	End If
	ll_rowcount = lds_contract_management_right.rowcount()
	If ll_rowcount > 0 Then
//		For i = ll_rowcount to 1 Step -1
//			lds_contract_management_right.deleterow(i)
//		Next
		//modify by gavin 2012-01-13
		lds_contract_management_right.RowsMove( 1, lds_contract_management_right.RowCount( ), primary!, lds_contract_management_right, 1 , delete! )
		lds_contract_management_right.update()
	End If
	destroy lds_contract
	destroy lds_folder
	destroy lds_template
	destroy lds_document
	destroy lds_contract_management_right
End If
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.23.2007 By: Evan
//$<reason> New feature of import module.
long ll_Count
SELECT count(*) INTO :ll_Count FROM import_lookup_mapping A, import_lu_map_fields B
WHERE (A.ilm_id = B.ilm_id) AND
		(A.map_type = 'A' or A.map_type = 'C') AND
		(is_lu_code = :ll_lookup_code);
if ll_Count > 0 then
	MessageBox("Lookup Data for code - " + ls_Code, "This lookup code is required by import module.")
	Return
end if
//---------------------------- APPEON END ----------------------------

IF Tab_1.Tabpage_Browse.dw_Browse.RowCount() = 1 THEN
	of_DeleteLookupTable()
else
	//Added By Jay Chen 10-17-2014
	ib_delete_lookup = true
	if Tab_1.Tabpage_Browse.dw_Browse.GetRow( ) > 0 then 
		il_delete_lookup_code[upperbound(il_delete_lookup_code) + 1] = Tab_1.Tabpage_Browse.dw_Browse.GetItemNumber(Tab_1.Tabpage_Browse.dw_Browse.GetRow(), "lookup_code" )
	end if
	//end
	Tab_1.Tabpage_Browse.dw_Browse.Event pfc_deleterow() 
	Tab_1.Tabpage_Browse.dw_Browse.SetFocus()
end if

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-08-13 By: Scofield
//$<Reason> Refresh the counter
of_count()
//---------------------------- APPEON END ----------------------------

of_SetMenuItemStatus()

end event

event type integer ue_save();Integer li_retval
Integer i
Integer ll_department_code
n_cst_update_screen  lnv_update_screen //Added By Ken.Guo 03/21/2012. 

if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return 0			//Added by Scofield on 2008-03-12

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-11 By: Scofield
//$<Reason> Verify if there is new row
long		ll_Cycle,ll_Count,ll_AddCnt
long		ll_lookcode[]
Boolean	lb_SaveSucess
Long ll_View_ID_Arr[]

dwitemstatus	ldws_Status

Tab_1.Tabpage_Browse.dw_Browse.AcceptText()
lb_SaveSucess = true
if (is_lookup_name = 'Contract Category') or (is_lookup_name = 'Contract Clause Category') or (is_lookup_name = 'Contract Division') or (is_lookup_name = 'Contract Department') or (is_lookup_name = 'Contract Type') then //Added By Jay Chen 03-19-2015
	ll_Count = Tab_1.Tabpage_Browse.dw_Browse.RowCount()
	for ll_Cycle = 1 to ll_Count
		ldws_Status = Tab_1.Tabpage_Browse.dw_Browse.GetItemStatus(ll_Cycle,0,Primary!)
		if ldws_Status = newmodified! then
			ll_AddCnt++
			ll_lookcode[ll_AddCnt] = Tab_1.Tabpage_Browse.dw_Browse.GetItemNumber(ll_Cycle,'lookup_code')
		end if
	next
end if
//---------------------------- APPEON END ----------------------------


//Added By Ken.Guo 03/21/2012.  Get View ID List which is modified.
If is_lookup_name = 'Contract Category' Then
	ll_Count = Tab_1.Tabpage_Browse.dw_Browse.RowCount()
	For ll_Cycle = 1 To ll_Count
		If Tab_1.Tabpage_Browse.dw_Browse.GetItemStatus(ll_Cycle,'ic_n',Primary!) = DataModified! Then
			ll_View_ID_Arr[UpperBound(ll_View_ID_Arr[]) + 1] = Tab_1.Tabpage_Browse.dw_Browse.GetItemNumber(ll_Cycle,'ic_n')
		End If
	Next
End If

//Added By Jay Chen 11-08-2013 Check the lookup code value is or not duplicate
String ls_value,ls_return
ll_Count = Tab_1.Tabpage_Browse.dw_Browse.RowCount()
For ll_Cycle = 1 To ll_Count
	ldws_Status = Tab_1.Tabpage_Browse.dw_Browse.GetItemStatus(ll_Cycle,0,Primary!)
	if ldws_Status = Newmodified! then
		ls_value = Tab_1.Tabpage_Browse.dw_Browse.getitemstring(ll_Cycle, "code")
		if Upper(is_lookup_type) = "A"  then
			ls_return = gnv_data.of_getitem("address_lookup","lookup_code","upper(code)='"+upper(ls_value)+"' and upper(lookup_name)='"+upper(is_lookup_name)+"' ")
		else
			ls_return = gnv_data.of_getitem("code_lookup","lookup_code","upper(code)='"+upper(ls_value)+"' and upper(lookup_name)='"+upper(is_lookup_name)+"' ")
		end if
		If ls_return <> "" Then
			messagebox("Duplicate Record","A lookup with code [" + ls_value + "] is already in the lookup table.")
			ib_update = false
			return -1
		end if
	end if
Next
//end add	
	
inv_audit.of_FieldAudit(Tab_1.Tabpage_Browse.dw_Browse, is_lookup_type) //Added by Evan on 2008-01-26
li_retval = This.Event pfc_save()
if li_Retval = 1 then 
	//Added By Ken.Guo 2010-11-24. Need refresh the cache now.
	ib_refresh_cache = True 
	WF_refresh_ctx_cache( )
	
	inv_audit.of_Save() //Added by Evan on 2008-01-26
	
	//Added By Ken.Guo 03/21/2012. Refresh Fee Calc Data 
	SetPointer(HourGlass!)
	lnv_update_screen = Create n_cst_update_screen
	gnv_string.of_delete_duplicate(ll_View_ID_Arr[] )
	For ll_Cycle = 1 To UpperBound(ll_View_ID_Arr)
		lnv_update_screen.of_update_fee_calc(ll_View_ID_Arr[ll_Cycle])
	Next
	If Isvalid(lnv_update_screen) Then Destroy lnv_update_screen
	
End If


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.30.2007 By: Jack 
//$<reason> Fix a defect.
If li_retval <> 1 Then
	Tab_1.Tabpage_Browse.dw_Browse.Event pfc_Retrieve()
	lb_SaveSucess = false					//Added by Scofield on 2007-09-11
End If
//---------------------------- APPEON END ----------------------------

IF ib_new_table THEN
	dw_name.Reset()
	dw_name.of_SetTransObject(SQLCA)

	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08.28.2006 By: LeiWei
	//$<reason> Fix a defect.
	datawindowchild ldwc_child
	dw_name.GetChild("lookup_name",ldwc_child)
	ldwc_child.SettransObject(SQLCA)
	ldwc_child.Retrieve()
	//---------------------------- APPEON END ----------------------------

	dw_name.Retrieve()
   	dw_name.InsertRow(0)
	dw_name.SetText(is_lookup_name)
	ib_new_table = False	
END IF

Tab_1.Tabpage_Browse.dw_Browse.SetFocus()

IF ii_delete_cnt > 0 THEN

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<add> 04.03.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	gnv_appeondb.of_startqueue( )
	//---------------------------- APPEON END ----------------------------

	
	FOR i = 1 TO ii_delete_cnt

		ll_department_code = il_department_code[ i ]
		
		DELETE
		FROM security_user_department
		WHERE department_id = :ll_department_code;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
			RETURN -1
		END IF
		
	END FOR
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-06
	//$<add> 04.03.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	
	gnv_appeondb.of_commitqueue( )
	//---------------------------- APPEON END ----------------------------
	
	of_count()
	
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-11 By: Scofield
//$<Reason> Update ctx_acp_contract_management_right table
if ((is_lookup_name = 'Contract Category') or (is_lookup_name = 'Contract Clause Category') or (is_lookup_name = 'Contract Division') or (is_lookup_name = 'Contract Department') or (is_lookup_name = 'Contract Type')) and lb_SaveSucess and ll_AddCnt > 0 then //Added By Jay Chen 03-19-2015 add divison,department,contract type
	for ll_Cycle = 1 to ll_AddCnt
		of_AddRight(ll_lookcode[ll_Cycle],is_lookup_name)
	next
	if (is_lookup_name = 'Contract Category') or  (is_lookup_name = 'Contract Division') or (is_lookup_name = 'Contract Department') or (is_lookup_name = 'Contract Type') then //Added by harry 20170506 for task723
		if w_mdi.of_security_access( 540 ) <> 0 and w_mdi.of_security_access( 6803 ) = 2  then 
			if MessageBox(gnv_app.iapp_object.DisplayName,'By default, no user has access to this new record by default, except for the Role of the current login user.~r~n If you want to change the permission settings now please click Yes. Otherwise, please click No.', Question!, YesNo!) = 1 then
				str_add_lookup lstr_lookup
				lstr_lookup.al_lookup_code = ll_lookcode
				openwithparm(w_security_add_lookup, lstr_lookup)
			end if
		else
			MessageBox(gnv_app.iapp_object.DisplayName,'By default, no user has access to this new record by default, except for the Role of the current login user.~r~nIf you want to restrict rights for this record then you must go to the System->Role Painter to change the Full Access rights setting.')
		end if
	else
		MessageBox(gnv_app.iapp_object.DisplayName,'By default, all users will have full rights to the new record you have added.~r~nIf you want to restrict rights for this record then you must go to the System->Role Painter to change the Full Access rights setting.')
	end if
end if
//---------------------------- APPEON END ----------------------------

of_SetMenuItemStatus()

//BEGIN---Modify by Scofield on 2009-10-12
if IsValid(w_contract_field_properties) then
	w_contract_field_properties.of_Refresh_Lookup_dddw()
end if
//END---Modify by Scofield on 2009-10-12


return 1
end event

event ue_add();Integer li_row, li_lst_order

if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return			//Added by Scofield on 2008-03-12

li_row = Tab_1.Tabpage_Browse.dw_Browse.InsertRow(0)
Tab_1.Tabpage_Browse.dw_Browse.SetRow(li_row)
Tab_1.Tabpage_Browse.dw_Browse.ScrollToRow(li_row)
Tab_1.Tabpage_Browse.dw_Browse.SetItem(li_row, "lookup_name", is_lookup_name)
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.26.2007 By: Jack
//$<reason> Fix a defect.
If is_lookup_type = "C" Then
	Tab_1.Tabpage_Browse.dw_Browse.SetItem(li_row, "type", 'C')
End If	
//---------------------------- APPEON END ----------------------------

il_lookup_code = gnv_app.of_get_id("LOOKUP")

Tab_1.Tabpage_Browse.dw_Browse.SetItem(li_row, "lookup_code", il_lookup_code)
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.27.2006 By: Liang QingShi
//$<reason> Contract module modification
if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup_contract" then
	Tab_1.Tabpage_Browse.dw_Browse.SetItem(li_row, "ic_n", 1001)
end if
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.23.2007 By: Jack (Document Manager)
//$<reason> 
if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup_for_contract_document_stat" then
	Tab_1.Tabpage_Browse.dw_Browse.SetItem(li_row, "custom_1", '0')
end if

//---------------------------- APPEON END ----------------------------

Tab_1.Tabpage_Browse.dw_Browse.Enabled = True

if Tab_1.SelectedTab = 1 then
	Tab_1.Tabpage_Browse.dw_Browse.SetFocus()
	Tab_1.Tabpage_Browse.dw_Browse.SetColumn("code")
else
	Tab_1.Tabpage_Detail.dw_Detail.SetFocus()
	Tab_1.Tabpage_Detail.dw_Detail.SetColumn("code")
end if

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-08-13 By: Scofield
//$<Reason> Refresh the counter
of_count()
//---------------------------- APPEON END ----------------------------

of_SetMenuItemStatus()

end event

event ue_findrecord();long l_code
long cnt
string ls_text
SetPointer ( hourglass! )

if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return			//Added by Scofield on 2008-03-12

if Tab_1.Tabpage_Browse.dw_Browse.rowcount() = 0 then return //maha 012505

l_code = Tab_1.Tabpage_Browse.dw_Browse.getitemnumber(Tab_1.Tabpage_Browse.dw_Browse.getrow(),"lookup_code")

if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_address_lookup" then
	ls_text = of_test_delete("A",l_code)
	if ls_text = "NONE" then ls_text = ""

elseif Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup" then
	ls_text = of_test_delete("C",l_code)
	if ls_text = "NONE" then ls_text = ""

end if
//
SetPointer ( arrow! )
If len(ls_text) > 1 then
	messagebox("Referenced records found for Standard lookups",ls_text)
else //Start Code Change ----07.09.2008 #V81 maha  - modified message to be more informative
	messagebox("Referenced record","No Referenced record found for Standard foreign key data fields.  If custom fields are using lookup tables, this function will not find data connected to them.")
end if
end event

event ue_sort();if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return			//Added by Scofield on 2008-03-12

Tab_1.Tabpage_Browse.dw_Browse.Event pfc_SortDlg()

Tab_1.Tabpage_Browse.dw_Browse.SetFocus()

end event

event ue_filter();if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return			//Added by Scofield on 2008-03-12

//Tab_1.Tabpage_Browse.dw_Browse.Event pfc_filterdlg()
string null_str

SetNull(null_str)

Tab_1.Tabpage_Browse.dw_Browse.SetFilter(null_str)

Tab_1.Tabpage_Browse.dw_Browse.Filter()

Tab_1.Tabpage_Browse.dw_Browse.SetFocus()

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-08-13 By: Scofield
//$<Reason> Refresh the counter
of_count()
//---------------------------- APPEON END ----------------------------

end event

event ue_print();if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return			//Added by Scofield on 2008-03-12
Tab_1.Tabpage_Browse.dw_Browse.Print()
end event

event ue_export();if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return			//Added by Scofield on 2008-03-12
Tab_1.Tabpage_Browse.dw_Browse.SaveAs( "", Text!, True )
//restore Directory  
//added by nova 2008-04-29
ChangeDirectory ( gs_dir_path )

end event

event ue_letterstorage();//====================================================================
// Function: Clicked.cb_LetterStorage()
//--------------------------------------------------------------------
// Description: Open Letter Storage Area Painter
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2008-11-17
//====================================================================

String	ls_DocName
long		ll_Row

ll_Row = Tab_1.Tabpage_Browse.dw_Browse.GetRow()
if ll_Row <= 0 or ll_Row > Tab_1.Tabpage_Browse.dw_Browse.RowCount() then Return

ls_DocName = Tab_1.Tabpage_Browse.dw_Browse.GetItemString(ll_Row,"custom_6")
OpenWithParm(w_area_painter,ls_DocName)

Tab_1.Tabpage_Browse.dw_Browse.SetFocus()

end event

event ue_help();MessageBox(gnv_app.iapp_object.DisplayName,'To input more information for Large Description 1 or Large Description 2 column, please double click on it.~r~n~r~nTo modify the column label, please right click the column (any position except header) or click the Column Properties button. Label of Code, Description, large Description 1, and large Description 2 cannot be modified.')

end event

event ue_columnproperty();//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2008-02-14 By: Scofield
//$<Reason> Popup a dialog to modify column label.

String	ls_ColName,ls_Objects,ls_ObjName
long		ll_SepPos

if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then return

ls_ColName = Tab_1.Tabpage_Browse.dw_Browse.GetColumnName()
if IsNull(ls_ColName) or Trim(ls_ColName) = "" then return

ls_Objects = Tab_1.Tabpage_Browse.dw_Browse.Describe("DataWindow.Objects") + "~t"
ll_SepPos = Pos(ls_Objects,"~t")

do while ll_SepPos > 0
	ls_ObjName = Left(ls_Objects,ll_SepPos - 1)
	ls_Objects = Mid(ls_Objects,ll_SepPos + 1)
	ll_SepPos = Pos(ls_Objects,"~t")
	
	if long(Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".x")) <> long(Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ColName + ".x")) then continue
	if long(Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".Width")) <> long(Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ColName + ".Width")) then continue
	if Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".Band") <> "header" then continue
	if Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".Type") <> "text" then continue
	
	if ls_ObjName = "code_t" or ls_ObjName = "description_t" or &
   ls_ObjName = "large_description_1_t" or ls_ObjName = "large_description_2_t" then return
	
	wf_SetColLabel(ls_ObjName)
	Exit
loop

//---------------------------- APPEON END ----------------------------

end event

event ue_change_lookupname(string as_lookupname);//Modified By Ken.Guo 2010-12-30. Use Event to do it.
//Add by jervis 11.26.2009
if as_lookupname <> '' and not isnull(as_lookupname) then
	dw_name.SetItem( 1,"lookup_name",as_lookupname)
	dw_name.Event ItemChanged(1,dw_name.object.lookup_name,as_lookupname)
end if
end event

public function string of_test_delete (string as_type, long as_code);//maha created 021904 called from delete and test records.

long l_code
//long cnt
string ls_text
//SetPointer ( hourglass! )

l_code = as_code
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.08.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
if as_type = "A" then // "d_address_lookup" 
	select count(prac_id) into :cnt from pd_education where school_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_education.school_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_acedemic_appointments where school_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_acedemic_appointments.school_code field.~r"
	end if	
	select count(prac_id) into :cnt from pd_insurance where carrier_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_insurance.carrier_code field.~r"
	end if	
	select count(prac_id) into :cnt from pd_board_specialty where board_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_board_specialty.board_code field.~r"
	end if	
	select count(prac_id) into :cnt from pd_license where verifying_agency = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_license.verifying_agency field.~r"
	end if	
	select count(prac_id) into :cnt from pd_other_affill where institution_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_other_affill.institution_code field.~r"
	end if	
	select count(prac_id) into :cnt from pd_training where institution_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_training.institution_code field.~r"
	end if	
	select count(prac_id) into :cnt from pd_hosp_affil where hospital_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.hospital_code field.~r"
	end if	

	
elseif as_type = "C" then  // "d_code_lookup" 
	
	select count(prac_id) into :cnt from pd_acedemic_appointments where department_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_acedemic_appointments.department_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_acedemic_appointments where faculty_rank_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_acedemic_appointments.faculty_rank_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where accepting_new_patients = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.accepting_new_patients field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where adolescent = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.adolescent field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where adult = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.adult field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where child = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.child field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where country = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.country field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where county = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.county field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where handicapped_access = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.handicapped_access field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where office_in_home = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.office_in_home field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where practice_type = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.practice_type field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where public_transportation = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.public_transportation field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where senior_adult = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.senior_adult field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where state = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.state field.~r"
	end if
	select count(prac_id) into :cnt from pd_address where young_child = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address.young_child field.~r"
	end if
	select count(prac_id) into :cnt from pd_affil_staff_leave where leave_of_absence_reason = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_affil_staff_leave.leave_of_absence_reason field.~r"
	end if
	select count(prac_id) into :cnt from pd_affil_staff_cat where staff_category = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_affil_staff_cat.staff_category field.~r"
	end if
	select count(prac_id) into :cnt from pd_affil_stat where affil_ended_reason = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_affil_stat.affil_ended_reason field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where married = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.married field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where name_suffix = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.name_suffix field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where pob_country = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.pob_country field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where pob_state = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.pob_state field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where prac_category = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.prac_category field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where prof_suffix = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.prof_suffix field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where provider_type = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.provider_type field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where rank = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.rank field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where sex = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.sex(gender) field.~r"
	end if
	select count(prac_id) into :cnt from pd_basic where title = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_basic.title field.~r"
	end if
	select count(prac_id) into :cnt from pd_board_specialty where specialty = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_board_specialty.specialty field.~r"
	end if
	select count(prac_id) into :cnt from pd_board_specialty where specialty_order = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_board_specialty.specialty_order field.~r"
	end if
	select count(prac_id) into :cnt from pd_claims where status_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_claims.status_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_clinical_specialties where specialty_expertise = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_clinical_specialties.specialty_expertise field.~r"
	end if
	select count(prac_id) into :cnt from pd_clinical_specialties where rank = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_clinical_specialties.rank field.~r"
	end if
	select count(prac_id) into :cnt from pd_postgrad_train where category = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_postgrad_train.category field.~r"
	end if
	select count(prac_id) into :cnt from pd_postgrad_train where loc_state = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_postgrad_train.loc_state field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_1 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_1 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_2 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_2 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_3 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_3 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_4 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_4 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_5 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_5 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_6 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_6 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_7 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_7 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_8 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_8 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_9 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_9 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where cat_10 = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.cat_10 field.~r"
	end if
	select count(prac_id) into :cnt from pd_dea_state_csr where state = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_dea_state_csr.state field.~r"
	end if
	select count(prac_id) into :cnt from pd_affil_dept where department = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_affil_dept.department field.~r"
	end if
	select count(prac_id) into :cnt from pd_affil_dept where rank = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_affil_dept.rank(division) field.~r"
	end if
	select count(prac_id) into :cnt from pd_affil_dept where section = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_affil_dept.section field.~r"
	end if
	select count(prac_id) into :cnt from pd_education where education_type = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_education.education_type field.~r"
	end if
	select count(prac_id) into :cnt from pd_education where degree = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_education.degree field.~r"
	end if
	select count(prac_id) into :cnt from pd_group_providers where specialty = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_group_providers.specialty field.~r"
	end if
	select count(prac_id) into :cnt from pd_group_providers where covering = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_group_providers.covering field.~r"
	end if
	select count(prac_id) into :cnt from pd_hosp_affil where department_a = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.department_a field.~r"
	end if
	select count(prac_id) into :cnt from pd_hosp_affil where department_b = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.department_b field.~r"
	end if
	select count(prac_id) into :cnt from pd_hosp_affil where department_c = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.department_c field.~r"
	end if
	select count(prac_id) into :cnt from pd_hosp_affil where section_a = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.section_a field.~r"
	end if
	select count(prac_id) into :cnt from pd_hosp_affil where section_b = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.section_b field.~r"
	end if
	select count(prac_id) into :cnt from pd_hosp_affil where section_c = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.section_c field.~r"
	end if
	select count(prac_id) into :cnt from pd_hosp_affil where admitting_priv = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.admitting_priv field.~r"
	end if
	select count(prac_id) into :cnt from pd_hosp_affil where staff_category = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_hosp_affil.staff_category field.~r"
	end if
	select count(prac_id) into :cnt from pd_insurance where claims_made_occurrence = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_insurance.claims_made_occurrence field.~r"
	end if	
	select count(prac_id) into :cnt from pd_insurance where state_coverage = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_insurance.state_coverage field.~r"
	end if
	select count(prac_id) into :cnt from pd_insurance where state_funded_pool = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_insurance.state_funded_pool field.~r"
	end if
	select count(prac_id) into :cnt from pd_insurance where tail_coverage = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_insurance.tail_coverage field.~r"
	end if
	select count(prac_id) into :cnt from pd_languages where foreign_language = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_languages.foreign_language field.~r"
	end if
	select count(prac_id) into :cnt from pd_languages where speak = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_languages.speak field.~r"
	end if
	select count(prac_id) into :cnt from pd_languages where sign = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_languages.sign field.~r"
	end if
	select count(prac_id) into :cnt from pd_languages where writes = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_languages.writes field.~r"
	end if
	select count(prac_id) into :cnt from pd_languages where reads = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_languages.reads field.~r"
	end if
	select count(prac_id) into :cnt from pd_license where license_type_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_license.license_type_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_license where state = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_license.state field.~r"
	end if
	select count(prac_id) into :cnt from pd_other_affill where function_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_other_affill.function_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_other_ids where id_type = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_other_ids.id_type field.~r"
	end if
	select count(prac_id) into :cnt from pd_address_2 where work_comp_state = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_address_2.work_comp_state field.~r"
	end if
	select count(prac_id) into :cnt from pd_references where name_suffix = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_references.name_suffix field.~r"
	end if
	select count(prac_id) into :cnt from pd_references where country = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_references.country.~r"
	end if
	select count(prac_id) into :cnt from pd_references where title = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_references.title.~r"
	end if
	select count(prac_id) into :cnt from pd_references where state = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_references.state.~r"
	end if
	select count(prac_id) into :cnt from pd_references where prof_suffix = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_references.prof_suffix field.~r"
	end if
	select count(prac_id) into :cnt from pd_sanctions where action_sanction_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_sanctions.action_sanction_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_sanctions where status_activity_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_sanctions.status_activity_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_special_certs where certified_in = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_special_certs.certified_in field.~r"
	end if
	select count(prac_id) into :cnt from pd_training where fellowship_type_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_training.fellowship_type_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_training where internship_type_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_training.internship_type_code field.~r"
	end if
	select count(prac_id) into :cnt from pd_training where train_type = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_training.train_type field.~r"
	end if
	select count(prac_id) into :cnt from pd_training where specialty = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_training.specialty field.~r"
	end if
	select count(prac_id) into :cnt from pd_priv_list where status_code = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the pd_priv_list.status_code field.~r"
	end if
	
	select count(prac_id) into :cnt from net_dev_action_items where action_type = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the net_dev_action_items.action_type field.~r"
	end if
		select count(prac_id) into :cnt from net_dev_action_items where action_status = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the net_dev_action_items.action_status field.~r"
	end if
		select count(prac_id) into :cnt from net_dev_action_items where action_dept = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the net_dev_action_items.action_dept field.~r"
	end if
		select count(prac_id) into :cnt from net_dev_ids where plan_type = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the net_dev_ids.plan_type field.~r"
	end if
		select count(prac_id) into :cnt from net_dev_ids where tier = :l_code;
	if cnt > 0 then
		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the net_dev_ids.tier field.~r"
	end if
//		select count(prac_id) into :cnt from net_dev_ids where * = :l_code;
//	if cnt > 0 then
//		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the net_dev_ids.* field.~r"
//	end if
	
//	select count(prac_id) into :cnt from * where * = :l_code;
//	if cnt > 0 then
//		ls_text = ls_text + "There are " + string(cnt) + " record(s) in the *.* field.~r"
//	end if
end if
*/

long 	cnt00,cnt01,cnt02,cnt03,cnt04,cnt05,cnt06,cnt07,cnt08,cnt09,&
		cnt10,cnt11,cnt12,cnt13,cnt14,cnt15,cnt16,cnt17,cnt18,cnt19,&
		cnt20,cnt21,cnt22,cnt23,cnt24,cnt25,cnt26,cnt27,cnt28,cnt29,&
		cnt30,cnt31,cnt32,cnt33,cnt34,cnt35,cnt36,cnt37,cnt38,cnt39,&
		cnt40,cnt41,cnt42,cnt43,cnt44,cnt45,cnt46,cnt47,cnt48,cnt49,&
		cnt50,cnt51,cnt52,cnt53,cnt54,cnt55,cnt56,cnt57,cnt58,cnt59,&
		cnt60,cnt61,cnt62,cnt63,cnt64,cnt65,cnt66,cnt67,cnt68,cnt69,&
		cnt70,cnt71,cnt72,cnt73,cnt74,cnt75,cnt76,cnt77,cnt78,cnt79,&
		cnt80,cnt81,cnt82,cnt83,cnt84,cnt85,cnt86,cnt87,cnt88,cnt89,&
		cnt90,cnt91,cnt92,cnt93,cnt94,cnt95,cnt96,cnt97,cnt98,cnt99



if as_type = "A" then // "d_address_lookup" 

	gnv_appeondb.of_startqueue( )
	
	select count(prac_id) into :cnt00 from pd_education where school_code = :l_code;
	select count(prac_id) into :cnt01 from pd_acedemic_appointments where school_code = :l_code;
	select count(prac_id) into :cnt02 from pd_insurance where carrier_code = :l_code;
	select count(prac_id) into :cnt03 from pd_board_specialty where board_code = :l_code;
	select count(prac_id) into :cnt04 from pd_license where verifying_agency = :l_code;
	select count(prac_id) into :cnt05 from pd_other_affill where institution_code = :l_code;
	select count(prac_id) into :cnt06 from pd_training where institution_code = :l_code;
	select count(prac_id) into :cnt07 from pd_hosp_affil where hospital_code = :l_code;

	gnv_appeondb.of_commitqueue( )

	if cnt00 > 0 then
		ls_text = ls_text + "There are " + string(cnt00) + " record(s) in the pd_education.school_code field.~r"
	end if
	if cnt01 > 0 then
		ls_text = ls_text + "There are " + string(cnt01) + " record(s) in the pd_acedemic_appointments.school_code field.~r"
	end if	
	if cnt02 > 0 then
		ls_text = ls_text + "There are " + string(cnt02) + " record(s) in the pd_insurance.carrier_code field.~r"
	end if	
	if cnt03 > 0 then
		ls_text = ls_text + "There are " + string(cnt03) + " record(s) in the pd_board_specialty.board_code field.~r"
	end if	
	if cnt04 > 0 then
		ls_text = ls_text + "There are " + string(cnt04) + " record(s) in the pd_license.verifying_agency field.~r"
	end if	
	if cnt05 > 0 then
		ls_text = ls_text + "There are " + string(cnt05) + " record(s) in the pd_other_affill.institution_code field.~r"
	end if	
	if cnt06 > 0 then
		ls_text = ls_text + "There are " + string(cnt06) + " record(s) in the pd_training.institution_code field.~r"
	end if	
	if cnt07 > 0 then
		ls_text = ls_text + "There are " + string(cnt07) + " record(s) in the pd_hosp_affil.hospital_code field.~r"
	end if	

elseif as_type = "C" then  // "d_code_lookup" 
	
	gnv_appeondb.of_startqueue( )
	
	select count(prac_id) into :cnt00 from pd_acedemic_appointments where department_code = :l_code;
	select count(prac_id) into :cnt01 from pd_acedemic_appointments where faculty_rank_code = :l_code;
	select count(prac_id) into :cnt02 from pd_address where accepting_new_patients = :l_code;
	select count(prac_id) into :cnt03 from pd_address where adolescent = :l_code;
	select count(prac_id) into :cnt04 from pd_address where adult = :l_code;
	select count(prac_id) into :cnt05 from pd_address where child = :l_code;
	select count(prac_id) into :cnt06 from pd_address where country = :l_code;
	select count(prac_id) into :cnt07 from pd_address where county = :l_code;
	select count(prac_id) into :cnt08 from pd_address where handicapped_access = :l_code;
	select count(prac_id) into :cnt09 from pd_address where office_in_home = :l_code;
	select count(prac_id) into :cnt10 from pd_address where practice_type = :l_code;
	select count(prac_id) into :cnt11 from pd_address where public_transportation = :l_code;
	select count(prac_id) into :cnt12 from pd_address where senior_adult = :l_code;
	select count(prac_id) into :cnt13 from pd_address where state = :l_code;
	select count(prac_id) into :cnt14 from pd_address where young_child = :l_code;
	select count(prac_id) into :cnt15 from pd_affil_staff_leave where leave_of_absence_reason = :l_code;
	select count(prac_id) into :cnt16 from pd_affil_staff_cat where staff_category = :l_code;
	select count(prac_id) into :cnt17 from pd_affil_stat where affil_ended_reason = :l_code;
	select count(prac_id) into :cnt18 from pd_basic where married = :l_code;
	select count(prac_id) into :cnt19 from pd_basic where name_suffix = :l_code;
	select count(prac_id) into :cnt20 from pd_basic where pob_country = :l_code;
	select count(prac_id) into :cnt21 from pd_basic where pob_state = :l_code;
	select count(prac_id) into :cnt22 from pd_basic where prac_category = :l_code;
	select count(prac_id) into :cnt23 from pd_basic where prof_suffix = :l_code;
	select count(prac_id) into :cnt24 from pd_basic where provider_type = :l_code;
	select count(prac_id) into :cnt25 from pd_basic where rank = :l_code;
	select count(prac_id) into :cnt26 from pd_basic where sex = :l_code;
	select count(prac_id) into :cnt27 from pd_basic where title = :l_code;
	select count(prac_id) into :cnt28 from pd_board_specialty where specialty = :l_code;
	select count(prac_id) into :cnt29 from pd_board_specialty where specialty_order = :l_code;
	select count(prac_id) into :cnt30 from pd_claims where status_code = :l_code;
	select count(prac_id) into :cnt31 from pd_clinical_specialties where specialty_expertise = :l_code;
	select count(prac_id) into :cnt32 from pd_clinical_specialties where rank = :l_code;
	select count(prac_id) into :cnt33 from pd_postgrad_train where category = :l_code;
	select count(prac_id) into :cnt34 from pd_postgrad_train where loc_state = :l_code;
	select count(prac_id) into :cnt35 from pd_dea_state_csr where cat_1 = :l_code;
	select count(prac_id) into :cnt36 from pd_dea_state_csr where cat_2 = :l_code;
	select count(prac_id) into :cnt37 from pd_dea_state_csr where cat_3 = :l_code;
	select count(prac_id) into :cnt38 from pd_dea_state_csr where cat_4 = :l_code;
	select count(prac_id) into :cnt39 from pd_dea_state_csr where cat_5 = :l_code;
	select count(prac_id) into :cnt40 from pd_dea_state_csr where cat_6 = :l_code;
	select count(prac_id) into :cnt41 from pd_dea_state_csr where cat_7 = :l_code;
	select count(prac_id) into :cnt42 from pd_dea_state_csr where cat_8 = :l_code;
	select count(prac_id) into :cnt43 from pd_dea_state_csr where cat_9 = :l_code;
	select count(prac_id) into :cnt44 from pd_dea_state_csr where cat_10 = :l_code;
	select count(prac_id) into :cnt45 from pd_dea_state_csr where state = :l_code;
	select count(prac_id) into :cnt46 from pd_affil_dept where department = :l_code;
	select count(prac_id) into :cnt47 from pd_affil_dept where rank = :l_code;
	select count(prac_id) into :cnt48 from pd_affil_dept where section = :l_code;
	select count(prac_id) into :cnt49 from pd_education where education_type = :l_code;
	select count(prac_id) into :cnt50 from pd_education where degree = :l_code;
	select count(prac_id) into :cnt51 from pd_group_providers where specialty = :l_code;
	select count(prac_id) into :cnt52 from pd_group_providers where covering = :l_code;
	select count(prac_id) into :cnt53 from pd_hosp_affil where department_a = :l_code;
	select count(prac_id) into :cnt54 from pd_hosp_affil where department_b = :l_code;
	select count(prac_id) into :cnt55 from pd_hosp_affil where department_c = :l_code;
	select count(prac_id) into :cnt56 from pd_hosp_affil where section_a = :l_code;
	select count(prac_id) into :cnt57 from pd_hosp_affil where section_b = :l_code;
	select count(prac_id) into :cnt58 from pd_hosp_affil where section_c = :l_code;
	select count(prac_id) into :cnt59 from pd_hosp_affil where admitting_priv = :l_code;
	select count(prac_id) into :cnt60 from pd_hosp_affil where staff_category = :l_code;
	select count(prac_id) into :cnt61 from pd_insurance where claims_made_occurrence = :l_code;
	select count(prac_id) into :cnt62 from pd_insurance where state_coverage = :l_code;
	select count(prac_id) into :cnt63 from pd_insurance where state_funded_pool = :l_code;
	select count(prac_id) into :cnt64 from pd_insurance where tail_coverage = :l_code;
	select count(prac_id) into :cnt65 from pd_languages where foreign_language = :l_code;
	select count(prac_id) into :cnt66 from pd_languages where speak = :l_code;
	select count(prac_id) into :cnt67 from pd_languages where sign = :l_code;
	select count(prac_id) into :cnt68 from pd_languages where writes = :l_code;
	select count(prac_id) into :cnt69 from pd_languages where reads = :l_code;
	select count(prac_id) into :cnt70 from pd_license where license_type_code = :l_code;
	select count(prac_id) into :cnt71 from pd_license where state = :l_code;
	select count(prac_id) into :cnt72 from pd_other_affill where function_code = :l_code;
	select count(prac_id) into :cnt73 from pd_other_ids where id_type = :l_code;
	select count(prac_id) into :cnt74 from pd_address_2 where work_comp_state = :l_code;
	select count(prac_id) into :cnt75 from pd_references where name_suffix = :l_code;
	select count(prac_id) into :cnt76 from pd_references where country = :l_code;
	select count(prac_id) into :cnt77 from pd_references where title = :l_code;
	select count(prac_id) into :cnt78 from pd_references where state = :l_code;
	select count(prac_id) into :cnt79 from pd_references where prof_suffix = :l_code;
	select count(prac_id) into :cnt80 from pd_sanctions where action_sanction_code = :l_code;
	select count(prac_id) into :cnt81 from pd_sanctions where status_activity_code = :l_code;
	select count(prac_id) into :cnt82 from pd_special_certs where certified_in = :l_code;
	select count(prac_id) into :cnt83 from pd_training where fellowship_type_code = :l_code;
	select count(prac_id) into :cnt84 from pd_training where internship_type_code = :l_code;
	select count(prac_id) into :cnt85 from pd_training where train_type = :l_code;
	select count(prac_id) into :cnt86 from pd_training where specialty = :l_code;
	select count(prac_id) into :cnt87 from pd_priv_list where status_code = :l_code;
	select count(prac_id) into :cnt88 from net_dev_action_items where action_type = :l_code;
	select count(prac_id) into :cnt89 from net_dev_action_items where action_status = :l_code;
	select count(prac_id) into :cnt90 from net_dev_action_items where action_dept = :l_code;
	select count(prac_id) into :cnt91 from net_dev_ids where plan_type = :l_code;
	select count(prac_id) into :cnt92 from net_dev_ids where tier = :l_code;


	gnv_appeondb.of_commitqueue( )

	if cnt00 > 0 then
		ls_text = ls_text + "There are " + string(cnt00) + " record(s) in the pd_acedemic_appointments.department_code field.~r"
	end if
	if cnt01 > 0 then
		ls_text = ls_text + "There are " + string(cnt01) + " record(s) in the pd_acedemic_appointments.faculty_rank_code field.~r"
	end if
	if cnt02 > 0 then
		ls_text = ls_text + "There are " + string(cnt02) + " record(s) in the pd_address.accepting_new_patients field.~r"
	end if
	if cnt03 > 0 then
		ls_text = ls_text + "There are " + string(cnt03) + " record(s) in the pd_address.adolescent field.~r"
	end if
	if cnt04 > 0 then
		ls_text = ls_text + "There are " + string(cnt04) + " record(s) in the pd_address.adult field.~r"
	end if
	if cnt05 > 0 then
		ls_text = ls_text + "There are " + string(cnt05) + " record(s) in the pd_address.child field.~r"
	end if
	if cnt06 > 0 then
		ls_text = ls_text + "There are " + string(cnt06) + " record(s) in the pd_address.country field.~r"
	end if
	if cnt07 > 0 then
		ls_text = ls_text + "There are " + string(cnt07) + " record(s) in the pd_address.county field.~r"
	end if
	if cnt08 > 0 then
		ls_text = ls_text + "There are " + string(cnt08) + " record(s) in the pd_address.handicapped_access field.~r"
	end if
	if cnt09 > 0 then
		ls_text = ls_text + "There are " + string(cnt09) + " record(s) in the pd_address.office_in_home field.~r"
	end if
	if cnt10 > 0 then
		ls_text = ls_text + "There are " + string(cnt10) + " record(s) in the pd_address.practice_type field.~r"
	end if
	if cnt11 > 0 then
		ls_text = ls_text + "There are " + string(cnt11) + " record(s) in the pd_address.public_transportation field.~r"
	end if
	if cnt12 > 0 then
		ls_text = ls_text + "There are " + string(cnt12) + " record(s) in the pd_address.senior_adult field.~r"
	end if
	if cnt13 > 0 then
		ls_text = ls_text + "There are " + string(cnt13) + " record(s) in the pd_address.state field.~r"
	end if
	if cnt14 > 0 then
		ls_text = ls_text + "There are " + string(cnt14) + " record(s) in the pd_address.young_child field.~r"
	end if
	if cnt15 > 0 then
		ls_text = ls_text + "There are " + string(cnt15) + " record(s) in the pd_affil_staff_leave.leave_of_absence_reason field.~r"
	end if
	if cnt16 > 0 then
		ls_text = ls_text + "There are " + string(cnt16) + " record(s) in the pd_affil_staff_cat.staff_category field.~r"
	end if
	if cnt17 > 0 then
		ls_text = ls_text + "There are " + string(cnt17) + " record(s) in the pd_affil_stat.affil_ended_reason field.~r"
	end if
	if cnt18 > 0 then
		ls_text = ls_text + "There are " + string(cnt18) + " record(s) in the pd_basic.married field.~r"
	end if
	if cnt19 > 0 then
		ls_text = ls_text + "There are " + string(cnt19) + " record(s) in the pd_basic.name_suffix field.~r"
	end if
	if cnt20 > 0 then
		ls_text = ls_text + "There are " + string(cnt20) + " record(s) in the pd_basic.pob_country field.~r"
	end if
	if cnt21 > 0 then
		ls_text = ls_text + "There are " + string(cnt21) + " record(s) in the pd_basic.pob_state field.~r"
	end if
	if cnt22 > 0 then
		ls_text = ls_text + "There are " + string(cnt22) + " record(s) in the pd_basic.prac_category field.~r"
	end if
	if cnt23 > 0 then
		ls_text = ls_text + "There are " + string(cnt23) + " record(s) in the pd_basic.prof_suffix field.~r"
	end if
	if cnt24 > 0 then
		ls_text = ls_text + "There are " + string(cnt24) + " record(s) in the pd_basic.provider_type field.~r"
	end if
	if cnt25 > 0 then
		ls_text = ls_text + "There are " + string(cnt25) + " record(s) in the pd_basic.rank field.~r"
	end if
	if cnt26 > 0 then
		ls_text = ls_text + "There are " + string(cnt26) + " record(s) in the pd_basic.sex(gender) field.~r"
	end if
	if cnt27 > 0 then
		ls_text = ls_text + "There are " + string(cnt27) + " record(s) in the pd_basic.title field.~r"
	end if
	if cnt28 > 0 then
		ls_text = ls_text + "There are " + string(cnt28) + " record(s) in the pd_board_specialty.specialty field.~r"
	end if
	if cnt29 > 0 then
		ls_text = ls_text + "There are " + string(cnt29) + " record(s) in the pd_board_specialty.specialty_order field.~r"
	end if
	if cnt30 > 0 then
		ls_text = ls_text + "There are " + string(cnt30) + " record(s) in the pd_claims.status_code field.~r"
	end if
	if cnt31 > 0 then
		ls_text = ls_text + "There are " + string(cnt31) + " record(s) in the pd_clinical_specialties.specialty_expertise field.~r"
	end if
	if cnt32 > 0 then
		ls_text = ls_text + "There are " + string(cnt32) + " record(s) in the pd_clinical_specialties.rank field.~r"
	end if
	if cnt33 > 0 then
		ls_text = ls_text + "There are " + string(cnt33) + " record(s) in the pd_postgrad_train.category field.~r"
	end if
	if cnt34 > 0 then
		ls_text = ls_text + "There are " + string(cnt34) + " record(s) in the pd_postgrad_train.loc_state field.~r"
	end if
	if cnt35 > 0 then
		ls_text = ls_text + "There are " + string(cnt35) + " record(s) in the pd_dea_state_csr.cat_1 field.~r"
	end if
	if cnt36 > 0 then
		ls_text = ls_text + "There are " + string(cnt36) + " record(s) in the pd_dea_state_csr.cat_2 field.~r"
	end if
	if cnt37 > 0 then
		ls_text = ls_text + "There are " + string(cnt37) + " record(s) in the pd_dea_state_csr.cat_3 field.~r"
	end if
	if cnt38 > 0 then
		ls_text = ls_text + "There are " + string(cnt38) + " record(s) in the pd_dea_state_csr.cat_4 field.~r"
	end if
	if cnt39 > 0 then
		ls_text = ls_text + "There are " + string(cnt39) + " record(s) in the pd_dea_state_csr.cat_5 field.~r"
	end if
	if cnt40 > 0 then
		ls_text = ls_text + "There are " + string(cnt40) + " record(s) in the pd_dea_state_csr.cat_6 field.~r"
	end if
	if cnt41 > 0 then
		ls_text = ls_text + "There are " + string(cnt41) + " record(s) in the pd_dea_state_csr.cat_7 field.~r"
	end if
	if cnt42 > 0 then
		ls_text = ls_text + "There are " + string(cnt42) + " record(s) in the pd_dea_state_csr.cat_8 field.~r"
	end if
	if cnt43 > 0 then
		ls_text = ls_text + "There are " + string(cnt43) + " record(s) in the pd_dea_state_csr.cat_9 field.~r"
	end if
	if cnt44 > 0 then
		ls_text = ls_text + "There are " + string(cnt44) + " record(s) in the pd_dea_state_csr.cat_10 field.~r"
	end if
	if cnt45 > 0 then
		ls_text = ls_text + "There are " + string(cnt45) + " record(s) in the pd_dea_state_csr.state field.~r"
	end if
	if cnt46 > 0 then
		ls_text = ls_text + "There are " + string(cnt46) + " record(s) in the pd_affil_dept.department field.~r"
	end if
	if cnt47 > 0 then
		ls_text = ls_text + "There are " + string(cnt47) + " record(s) in the pd_affil_dept.rank(division) field.~r"
	end if
	if cnt48 > 0 then
		ls_text = ls_text + "There are " + string(cnt48) + " record(s) in the pd_affil_dept.section field.~r"
	end if
	if cnt49 > 0 then
		ls_text = ls_text + "There are " + string(cnt49) + " record(s) in the pd_education.education_type field.~r"
	end if
	if cnt50 > 0 then
		ls_text = ls_text + "There are " + string(cnt50) + " record(s) in the pd_education.degree field.~r"
	end if
	if cnt51 > 0 then
		ls_text = ls_text + "There are " + string(cnt51) + " record(s) in the pd_group_providers.specialty field.~r"
	end if
	if cnt52 > 0 then
		ls_text = ls_text + "There are " + string(cnt52) + " record(s) in the pd_group_providers.covering field.~r"
	end if
	if cnt53 > 0 then
		ls_text = ls_text + "There are " + string(cnt53) + " record(s) in the pd_hosp_affil.department_a field.~r"
	end if
	if cnt54 > 0 then
		ls_text = ls_text + "There are " + string(cnt54) + " record(s) in the pd_hosp_affil.department_b field.~r"
	end if
	if cnt55 > 0 then
		ls_text = ls_text + "There are " + string(cnt55) + " record(s) in the pd_hosp_affil.department_c field.~r"
	end if
	if cnt56 > 0 then
		ls_text = ls_text + "There are " + string(cnt56) + " record(s) in the pd_hosp_affil.section_a field.~r"
	end if
	if cnt57 > 0 then
		ls_text = ls_text + "There are " + string(cnt57) + " record(s) in the pd_hosp_affil.section_b field.~r"
	end if
	if cnt58 > 0 then
		ls_text = ls_text + "There are " + string(cnt58) + " record(s) in the pd_hosp_affil.section_c field.~r"
	end if
	if cnt59 > 0 then
		ls_text = ls_text + "There are " + string(cnt59) + " record(s) in the pd_hosp_affil.admitting_priv field.~r"
	end if
	if cnt60 > 0 then
		ls_text = ls_text + "There are " + string(cnt60) + " record(s) in the pd_hosp_affil.staff_category field.~r"
	end if
	if cnt61 > 0 then
		ls_text = ls_text + "There are " + string(cnt61) + " record(s) in the pd_insurance.claims_made_occurrence field.~r"
	end if	
	if cnt62 > 0 then
		ls_text = ls_text + "There are " + string(cnt62) + " record(s) in the pd_insurance.state_coverage field.~r"
	end if
	if cnt63 > 0 then
		ls_text = ls_text + "There are " + string(cnt63) + " record(s) in the pd_insurance.state_funded_pool field.~r"
	end if
	if cnt64 > 0 then
		ls_text = ls_text + "There are " + string(cnt64) + " record(s) in the pd_insurance.tail_coverage field.~r"
	end if
	if cnt65 > 0 then
		ls_text = ls_text + "There are " + string(cnt65) + " record(s) in the pd_languages.foreign_language field.~r"
	end if
	if cnt66 > 0 then
		ls_text = ls_text + "There are " + string(cnt66) + " record(s) in the pd_languages.speak field.~r"
	end if
	if cnt67 > 0 then
		ls_text = ls_text + "There are " + string(cnt67) + " record(s) in the pd_languages.sign field.~r"
	end if
	if cnt68 > 0 then
		ls_text = ls_text + "There are " + string(cnt68) + " record(s) in the pd_languages.writes field.~r"
	end if
	if cnt69 > 0 then
		ls_text = ls_text + "There are " + string(cnt69) + " record(s) in the pd_languages.reads field.~r"
	end if
	if cnt70 > 0 then
		ls_text = ls_text + "There are " + string(cnt70) + " record(s) in the pd_license.license_type_code field.~r"
	end if
	if cnt71 > 0 then
		ls_text = ls_text + "There are " + string(cnt71) + " record(s) in the pd_license.state field.~r"
	end if
	if cnt72 > 0 then
		ls_text = ls_text + "There are " + string(cnt72) + " record(s) in the pd_other_affill.function_code field.~r"
	end if
	if cnt73 > 0 then
		ls_text = ls_text + "There are " + string(cnt73) + " record(s) in the pd_other_ids.id_type field.~r"
	end if
	if cnt74 > 0 then
		ls_text = ls_text + "There are " + string(cnt74) + " record(s) in the pd_address_2.work_comp_state field.~r"
	end if
	if cnt75 > 0 then
		ls_text = ls_text + "There are " + string(cnt75) + " record(s) in the pd_references.name_suffix field.~r"
	end if
	if cnt76 > 0 then
		ls_text = ls_text + "There are " + string(cnt76) + " record(s) in the pd_references.country.~r"
	end if
	if cnt77 > 0 then
		ls_text = ls_text + "There are " + string(cnt77) + " record(s) in the pd_references.title.~r"
	end if
	if cnt78 > 0 then
		ls_text = ls_text + "There are " + string(cnt78) + " record(s) in the pd_references.state.~r"
	end if
	if cnt79 > 0 then
		ls_text = ls_text + "There are " + string(cnt79) + " record(s) in the pd_references.prof_suffix field.~r"
	end if
	if cnt80 > 0 then
		ls_text = ls_text + "There are " + string(cnt80) + " record(s) in the pd_sanctions.action_sanction_code field.~r"
	end if
	if cnt81 > 0 then
		ls_text = ls_text + "There are " + string(cnt81) + " record(s) in the pd_sanctions.status_activity_code field.~r"
	end if
	if cnt82 > 0 then
		ls_text = ls_text + "There are " + string(cnt82) + " record(s) in the pd_special_certs.certified_in field.~r"
	end if
	if cnt83 > 0 then
		ls_text = ls_text + "There are " + string(cnt83) + " record(s) in the pd_training.fellowship_type_code field.~r"
	end if
	if cnt84 > 0 then
		ls_text = ls_text + "There are " + string(cnt84) + " record(s) in the pd_training.internship_type_code field.~r"
	end if
	if cnt85 > 0 then
		ls_text = ls_text + "There are " + string(cnt85) + " record(s) in the pd_training.train_type field.~r"
	end if
	if cnt86 > 0 then
		ls_text = ls_text + "There are " + string(cnt86) + " record(s) in the pd_training.specialty field.~r"
	end if
	if cnt87 > 0 then
		ls_text = ls_text + "There are " + string(cnt87) + " record(s) in the pd_priv_list.status_code field.~r"
	end if
	if cnt88 > 0 then
		ls_text = ls_text + "There are " + string(cnt88) + " record(s) in the net_dev_action_items.action_type field.~r"
	end if
	if cnt89 > 0 then
		ls_text = ls_text + "There are " + string(cnt89) + " record(s) in the net_dev_action_items.action_status field.~r"
	end if
	if cnt90 > 0 then
		ls_text = ls_text + "There are " + string(cnt90) + " record(s) in the net_dev_action_items.action_dept field.~r"
	end if
	if cnt91 > 0 then
		ls_text = ls_text + "There are " + string(cnt91) + " record(s) in the net_dev_ids.plan_type field.~r"
	end if
	if cnt92 > 0 then
		ls_text = ls_text + "There are " + string(cnt92) + " record(s) in the net_dev_ids.tier field.~r"
	end if

end if

//---------------------------- APPEON END ----------------------------

//SetPointer ( arrow! )
If len(ls_text) > 1 then
	return(ls_text)
	//messagebox("Referenced records found",ls_text)
else
	return("NONE")
	//messagebox("Referenced record","No Referenced record found")
end if

end function

public function integer of_add_security_dept (integer ai_row);Integer li_user_cnt
Integer li_access
Integer u
Integer d
Integer i
String ls_user_id
Integer li_dept_cnt
Long ll_security_dept_code
Long ll_department

dw_users.SetTransObject( SQLCA )
dw_users.Retrieve( )
li_user_cnt = dw_users.RowCount( )

SELECT Max( user_depart_id )
INTO :ll_security_dept_code
FROM security_user_department;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF			

//grap the code for the new department
ll_department = Tab_1.Tabpage_Browse.dw_Browse.GetItemNumber( ai_row, "lookup_code" )			
//Loop through all users and department and setup department security
FOR u = 1 TO li_user_cnt
	ls_user_id = dw_users.GetItemString( u, "user_id" )
	ll_security_dept_code ++
	INSERT INTO security_user_department  
	       ( user_depart_id,   
              user_id,   
	         department_id,   
     	      access_rights )  
	VALUES ( :ll_security_dept_code,   
	         :ls_user_id,   
	         :ll_department,   
	         1 )  ;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "SQL Error", SQLCA.SQLERRTEXT )
		RETURN -1
	END IF			
END FOR

RETURN 1
end function

public function integer wf_refresh_ctx_cache ();/******************************************************************************************************************
**  [PUBLIC]   : wf_refresh_ctx_cache
**==================================================================================================================
**  Purpose   	: Will refresh the cache if we are using contract and a contract table has been updated
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 09 March 006 ? Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

long ll_contract

if ib_refresh_cache then
	gnv_app.IB_ref_cache = TRUE
	gnv_app.of_setcontraccache( )
end if 

//Refresh lookup cachedata - temp process,jervis 02.08.2010 
gnv_appeondb.of_startqueue( ) //Added By Ken.Guo 2010-11-24.
	gnv_data.of_retrieve( "code_lookup" )
	gnv_data.of_retrieve( "code_lookup_2" )
gnv_appeondb.of_commitqueue( )

gnv_app.of_setcontraccache_code_lookup( 'Clause Approval Status', true)

//Refresh lookup data when opened by  screen painter -- jervis 10.14.2010
if is_parm <> "" and not isnull(is_parm) then
	gnv_app.of_setcontraccache_code_lookup( is_parm)
end if

//Added By Jay Chen 08-12-2015 
if is_parm <> is_lookup_name then
	if is_lookup_name <> "" and not isnull(is_lookup_name) then
		gnv_app.of_setcontraccache_code_lookup(is_lookup_name, true)
	end if
end if

return 0
end function

public function integer of_count ();//Start Code Change ---- 03.29.2006 #354 maha created 

long l

l = Tab_1.Tabpage_Browse.dw_Browse.rowcount()
st_count.text = string(l)

return 1
end function

public subroutine of_addright (long al_category, string as_lookname);//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-11 By: Scofield
//$<Reason> Update ctx_acp_contract_management_right table when add contract category
long		ll_RoleId
long		ll_Cycle,ll_Count
long		ll_RoleId_User  //Added by harry 20170506 for task723
DataStore	lds_Security_Role

lds_Security_Role = Create DataStore
lds_Security_Role.DataObject = "d_dddw_security_roles"
lds_Security_Role.SetTransObject(SQLCA)
//lds_Security_Role.Retrieve()

//Added by harry 20170506 for task723
gnv_appeondb.of_startqueue( )
lds_Security_Role.Retrieve()
SELECT role_id INTO :ll_RoleId_User FROM security_users WHERE user_id = :gs_user_id;
gnv_appeondb.of_commitqueue( )

ll_Count = lds_Security_Role.RowCount()

gnv_appeondb.of_startqueue( )

for ll_Cycle = 1 to ll_Count
	ll_RoleId = lds_Security_Role.GetItemNumber(ll_Cycle,'role_id')
	if as_LookName = 'Contract Category' then
		if ll_RoleId = ll_RoleId_User then //Added by harry 20170506 for task723
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
			  VALUES (:ll_RoleId,:al_category,1,'11');
		else
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
			  VALUES (:ll_RoleId,:al_category,1,'13');
		end if
			  
		INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
			  VALUES (:ll_RoleId,:al_category,3,'31');
			  
		INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
			  VALUES (:ll_RoleId,:al_category,4,'41');
	elseif as_LookName = 'Contract Clause Category' then
		INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
			  VALUES (:ll_RoleId,:al_category,2,'21');
	elseif as_LookName = 'Contract Division' then //Added By Jay Chen 03-19-2015
		if ll_RoleId = ll_RoleId_User then //Added by harry 20170506 for task723
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,6,'61');
		else
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,6,'63');
		end if
	elseif as_LookName = 'Contract Department' then //Added By Jay Chen 03-19-2015
		if ll_RoleId = ll_RoleId_User then //Added by harry 20170506 for task723
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,7,'71');
		else
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,7,'73');
		end if
	elseif as_LookName = 'Contract Type' then //Added By Jay Chen 03-19-2015
		if ll_RoleId = ll_RoleId_User then //Added by harry 20170506 for task723
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,8,'81');
		else
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,8,'83');
		end if
	end if
next

gnv_appeondb.of_commitqueue( )

COMMIT USING SQLCA;

Destroy lds_Security_Role
//---------------------------- APPEON END ----------------------------

end subroutine

public subroutine wf_refreshcoltitle (string as_lookup_type, string as_lookup_name);//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-01-16 By: Scofield
//$<Reason> Modify column title text.

long		ll_Cycle,ll_Count,ll_InvComPos,ll_ColCoorX,ll_CorWidth
String	ls_TitleName,ls_TitleText,ls_ColName

CONSTANT LONG SPACEWIDTH = 9

DataStore	lds_ColTitle

if Lower(as_lookup_name) = "clause approval status" then return
Tab_1.Tabpage_Browse.dw_Browse.SetRedraw(false)

lds_ColTitle = Create DataStore

lds_ColTitle.DataObject = "d_Lookup_ColTitle"
lds_ColTitle.SetTransObject(SQLCA)
lds_ColTitle.Retrieve(as_lookup_type,as_lookup_name)

ll_Count = lds_ColTitle.RowCount()
for ll_Cycle = 1 to ll_Count
	ls_TitleName = lds_ColTitle.GetItemString(ll_Cycle,'ColTitleName')
	ls_TitleText = lds_ColTitle.GetItemString(ll_Cycle,'ColTitleText')
	
	ll_InvComPos = Pos(ls_TitleText,"'")
	do while ll_InvComPos > 0
		ls_TitleText = Replace(ls_TitleText,ll_InvComPos,1,"~~'")
		ll_InvComPos = Pos(ls_TitleText,"'",ll_InvComPos + 2)
	loop
	Tab_1.Tabpage_Browse.dw_Browse.Modify(ls_TitleName + ".Text='" + ls_TitleText + "'")
	Tab_1.Tabpage_Detail.dw_Detail.Modify(ls_TitleName + ".Text='" + ls_TitleText + "'")
	
	ls_ColName = lds_ColTitle.GetItemString(ll_Cycle,'ColName')
	ll_ColCoorX = lds_ColTitle.GetItemNumber(ll_Cycle,'ColCoorX')
	ll_CorWidth = lds_ColTitle.GetItemNumber(ll_Cycle,'ColWidth')
	
	if Not IsNull(ls_ColName) and Trim(ls_ColName) <> "" then
		Tab_1.Tabpage_Browse.dw_Browse.Modify(ls_ColName + ".X=" + String(ll_ColCoorX - SPACEWIDTH))
		Tab_1.Tabpage_Browse.dw_Browse.Modify(ls_ColName + ".Width=" + String(ll_CorWidth))
	end if
next

Destroy lds_ColTitle

Tab_1.Tabpage_Browse.dw_Browse.SetRedraw(true)

//---------------------------- APPEON END ----------------------------

end subroutine

public subroutine wf_setcollabel (string as_labelname);//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-01-17 By: Scofield
//$<Reason> Set Column Label.

String	ls_OriTitleText,ls_NewTitleText
long		ll_cnt,ll_InvComPos

gnv_appeondb.of_startqueue( )//modify by gavin 2012-01-16
SELECT coltitletext
  INTO :ls_OriTitleText
  FROM lookup_coltitle
 WHERE lookup_type = :is_lookup_type AND lookup_name = :is_lookup_name AND coltitlename = :as_LabelName;
 
 SELECT Count(*)
  INTO :ll_cnt
  FROM lookup_coltitle
 WHERE lookup_type = :is_lookup_type AND lookup_name = :is_lookup_name AND coltitlename = :as_LabelName;
 gnv_appeondb.of_commitqueue( )
 
if IsNull(ls_OriTitleText) or ls_OriTitleText = "" then
	ls_OriTitleText = Tab_1.Tabpage_Browse.dw_Browse.Describe(as_LabelName + ".Text")
end if

OpenWithParm(w_SetColLabelText,ls_OriTitleText)
if Message.DoubleParm = -1 then return

ls_NewTitleText = Message.StringParm

//SELECT Count(*)
//  INTO :ll_cnt
//  FROM lookup_coltitle
// WHERE lookup_type = :is_lookup_type AND lookup_name = :is_lookup_name AND coltitlename = :as_LabelName;
 
if ll_cnt <= 0 then
	INSERT INTO lookup_coltitle(Lookup_Type,Lookup_Name,ColTitleName,ColTitleText)
		  VALUES(:is_lookup_type,:is_lookup_name,:as_LabelName,:ls_NewTitleText);
else
	UPDATE lookup_coltitle
	   SET coltitletext = :ls_NewTitleText
	WHERE lookup_type = :is_lookup_type AND lookup_name = :is_lookup_name AND coltitlename = :as_LabelName;
end if

if SQLCA.SQLCode = 0 then
	COMMIT;
	
	ll_InvComPos = Pos(ls_NewTitleText,"'")
	do while ll_InvComPos > 0
		ls_NewTitleText = Replace(ls_NewTitleText,ll_InvComPos,1,"~~'")
		ll_InvComPos = Pos(ls_NewTitleText,"'",ll_InvComPos + 2)
	loop
	
	Tab_1.Tabpage_Browse.dw_Browse.Modify(as_LabelName + ".Text='" + ls_NewTitleText + "'")
	Tab_1.Tabpage_Detail.dw_Detail.Modify(as_LabelName + ".Text='" + ls_NewTitleText + "'")
else
	MessageBox(String(SQLCA.SQLCode),'Failed to modify title text!~r~n~r~n' + SQLCA.SQLErrText,EXCLAMATION!)
	ROLLBACK;
end if

//---------------------------- APPEON END ----------------------------

end subroutine

public subroutine wf_updateuserdefinfo (string as_lookup_type, string as_lookup_name);//------------------------------------------------------------------------------
// Function: wf_UpdateUserDefInfo()
//------------------------------------------------------------------------------
// Description: Save user-defined information into database.
// Arguments:
//		1 -- Lookup Type
//		2 -- Lookup Name
// Return Value: None
//------------------------------------------------------------------------------
// Author:	Scofield		Date: 2008-06-17
//------------------------------------------------------------------------------
// Revision History: 
//				1.0   Initial version
//==============================================================================

long		ll_Cycle,ll_ColCnt,ll_ColCoorX,ll_ColWidth,ll_RowCnt,ll_SepPos
String	ls_ColName,ls_Objects,ls_ObjCopy,ls_ObjName,ls_ColTitleName,ls_ColTitleText

Boolean	lb_Found

n_ds		lds_lookup_coltitle //add by gavin2012-01-13
Long		ll_K, ll_Row

if IsNull(as_lookup_type) or Trim(as_lookup_type) = "" then Return
if IsNull(as_lookup_name) or Trim(as_lookup_name) = "" then Return

/***************************/ //add by gavin2012-01-13
lds_lookup_coltitle = create n_ds
lds_lookup_coltitle.dataobject = "ds_code_lookup_coltitle"
lds_lookup_coltitle.SetTransObject( SQLCA )
lds_lookup_coltitle.Retrieve( as_lookup_type, as_lookup_name )
/**************************/

ls_Objects = Tab_1.Tabpage_Browse.dw_Browse.Describe("DataWindow.Objects") + "~t"
ll_ColCnt = long(Tab_1.Tabpage_Browse.dw_Browse.Describe("DataWindow.Column.Count"))
for ll_Cycle = 1 to ll_ColCnt
	if Tab_1.Tabpage_Browse.dw_Browse.Describe("#" + String(ll_Cycle) + ".Visible") = '1' then
		ls_ColName = Tab_1.Tabpage_Browse.dw_Browse.Describe("#" + String(ll_Cycle) + ".Name")
		ll_ColCoorX = long(Tab_1.Tabpage_Browse.dw_Browse.Describe("#" + String(ll_Cycle) + ".X"))
		ll_ColWidth = long(Tab_1.Tabpage_Browse.dw_Browse.Describe("#" + String(ll_Cycle) + ".Width"))
		
		/*******************************************/// modify by gavin 2012-01-13
//		SELECT Count(*) INTO :ll_RowCnt FROM lookup_coltitle WHERE lookup_coltitle.lookup_type = :as_lookup_type AND lookup_coltitle.lookup_name = :as_lookup_name AND lookup_coltitle.ColName = :ls_ColName ;
//		if ll_RowCnt > 0 then
//			UPDATE lookup_coltitle
//				SET ColCoorX = :ll_ColCoorX,ColWidth = :ll_ColWidth
//			 WHERE lookup_coltitle.lookup_type = :as_lookup_type AND lookup_coltitle.lookup_name = :as_lookup_name AND lookup_coltitle.ColName = :ls_ColName ;
//			 
//			CONTINUE
//		end if
		lds_lookup_coltitle.SetFilter( "ColName = '" + ls_ColName + "'" )
		lds_lookup_coltitle.Filter( )
		If lds_lookup_coltitle.RowCount( ) > 0 Then
			For ll_K = 1 To lds_lookup_coltitle.RowCount( ) 
				lds_lookup_coltitle.SetItem( ll_k, 'ColCoorX', ll_ColCoorX )
				lds_lookup_coltitle.SetItem( ll_k, 'ColWidth', ll_ColWidth )
			Next
			Continue
		End If
		/*******************************************/
		lb_Found = false
		ls_ObjCopy = ls_Objects
		ll_SepPos = Pos(ls_ObjCopy,"~t")
		do while ll_SepPos > 0
			ls_ObjName = Left(ls_ObjCopy,ll_SepPos - 1)
			ls_ObjCopy = Mid(ls_ObjCopy,ll_SepPos + 1)
			ll_SepPos = Pos(ls_ObjCopy,"~t")
			
			if long(Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".x")) <> long(Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ColName + ".x")) then continue
			if long(Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".Width")) <> long(Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ColName + ".Width")) then continue
			if Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".Band") <> "header" then continue
			if Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".Type") <> "text" then continue
			
			ls_ColTitleName = Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".Name")
			ls_ColTitleText = Tab_1.Tabpage_Browse.dw_Browse.Describe(ls_ObjName + ".Text")
			lb_Found = true
			Exit
		loop
		
		if Not lb_Found then CONTINUE
		/******************************///add by gavin 2012-01-13
//		SELECT Count(*) INTO :ll_RowCnt FROM lookup_coltitle WHERE lookup_coltitle.lookup_type = :as_lookup_type AND lookup_coltitle.lookup_name = :as_lookup_name AND lookup_coltitle.ColTitleName = :ls_ColTitleName ;
//		
//		if ll_RowCnt <= 0 then
//			INSERT INTO lookup_coltitle(Lookup_Type,Lookup_Name,ColTitleName,ColTitleText,ColName,ColCoorX,ColWidth)
//				  VALUES(:as_lookup_type,:as_lookup_name,:ls_ColTitleName,:ls_ColTitleText,:ls_ColName,:ll_ColCoorX,:ll_ColWidth);
//		else
//			UPDATE lookup_coltitle
//				SET ColName = :ls_ColName,ColCoorX = :ll_ColCoorX,ColWidth = :ll_ColWidth
//			 WHERE lookup_coltitle.lookup_type = :as_lookup_type AND lookup_coltitle.lookup_name = :as_lookup_name AND lookup_coltitle.ColTitleName = :ls_ColTitleName ;
//		end if
		lds_lookup_coltitle.SetFilter( "ColTitleName = '" + ls_ColTitleName + "'" )
		lds_lookup_coltitle.Filter( )
		If lds_lookup_coltitle.RowCount( ) <= 0 Then
			ll_Row = lds_lookup_coltitle.InsertRow( 0 )
			lds_lookup_coltitle.SetItem( ll_Row, 'Lookup_Type', 	as_lookup_type )
			lds_lookup_coltitle.SetItem( ll_Row, 'Lookup_Name', 	as_lookup_name )
			lds_lookup_coltitle.SetItem( ll_Row, 'ColTitleName', 	ls_ColTitleName )
			lds_lookup_coltitle.SetItem( ll_Row, 'ColTitleText', 	ls_ColTitleText )
			lds_lookup_coltitle.SetItem( ll_Row, 'ColName',		 	ls_ColName )
			lds_lookup_coltitle.SetItem( ll_Row, 'ColCoorX', 		ll_ColCoorX )			
			lds_lookup_coltitle.SetItem( ll_Row, 'ColWidth',			ll_ColWidth )	
		Else
			For ll_K = 1 To lds_lookup_coltitle.RowCount( ) 
				lds_lookup_coltitle.SetItem( ll_k, 'ColCoorX', ll_ColCoorX )
				lds_lookup_coltitle.SetItem( ll_k, 'ColWidth', ll_ColWidth )
				lds_lookup_coltitle.SetItem( ll_k, 'ColName', ls_ColName )
			Next
		End If
		/****************************/
	end if
next
/******************************///add by gavin 2012-01-13
lds_lookup_coltitle.SetFilter( "" )
lds_lookup_coltitle.Filter( )
If lds_lookup_coltitle.Update() <> 1 Then
	Messagebox('Error','Failed to save data.' )
	If isvalid(lds_lookup_coltitle) Then Destroy lds_lookup_coltitle
	Return	
End If
/******************************/
COMMIT USING SQLCA;

end subroutine

public subroutine of_setmenuitemstatus ();//====================================================================
// Function: of_SetMenuItemStatus()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-09-24
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long		ll_Right,ll_Cycle,ll_RowCnts
String	ls_ColName

DWItemStatus	ldw_Status

ll_Right = w_mdi.of_security_access(560)
if ll_Right = 1 then
	cb_new_lookup.Enabled = false
	cb_restore.Enabled = false //Added By Jay Chen 10-17-2014
	of_EnabledAll(false)
else
	cb_new_lookup.Enabled = true
	cb_restore.Enabled = true //Added By Jay Chen 10-17-2014
	
	if Tab_1.Tabpage_Browse.dw_Browse.DataObject = "" then
		of_EnabledAll(false)
	else
		ll_RowCnts = Tab_1.Tabpage_Browse.dw_Browse.RowCount()
		if ll_RowCnts > 0 then
			gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_delete0,'Enabled', true)
		else
			gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_delete0,'Enabled', false)
		end if
		
		gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_add,'Enabled', true)
		
		if Tab_1.Tabpage_Browse.dw_Browse.ModifiedCount() + Tab_1.Tabpage_Browse.dw_Browse.DeletedCount() > 0 then
			gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0,'Enabled', true)
		else
			gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0,'Enabled', false)
		end if
		
		gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_sort0,'Enabled', true)
		gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_filter0,'Enabled', true)
		gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_findrecords,'Enabled', true)
		gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_export,'Enabled', true)
		
		if Lower(is_lookup_name) = 'contract action type' then
			gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_letterstorage,'Enabled', true)
		else
			gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_letterstorage,'Enabled', false)
		end if
		
		ls_ColName = Tab_1.Tabpage_Browse.dw_Browse.GetColumnName()
		if ls_ColName = "code" or ls_ColName = "description" or ls_ColName = "large_description_1" or ls_ColName = "large_description_2" then
			gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_columnproperties,'Enabled', false)
		else
			gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_columnproperties,'Enabled', true)
		end if
		
		gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_print0,'Enabled', true)
	end if
end if

end subroutine

public subroutine of_enabledall (boolean ab_enabled);m_pfe_cst_mdi_menu_lookup.m_lookup.m_delete0.Enabled = ab_Enabled
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_add,'Enabled', ab_Enabled)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0,'Enabled', ab_Enabled)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_sort0,'Enabled', ab_Enabled)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_filter0,'Enabled', ab_Enabled)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_findrecords,'Enabled', ab_Enabled)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_export,'Enabled', ab_Enabled)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_letterstorage,'Enabled', ab_Enabled)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_columnproperties,'Enabled', ab_Enabled)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_print0,'Enabled', ab_Enabled)

end subroutine

public function long of_deletelookuptable ();//====================================================================
// Function: of_DeleteLookupTable()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-10-15
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long		ll_CurRow,ll_RowCnts
String	ls_LookupName

DataWindowChild ldwc_Child

//Added By Jay Chen 10-17-2014 backup delete data to table code_lookup_delete_record
insert into code_lookup_delete_record (lookup_code, lookup_name, code, description, type, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, caqh_code, 
												  ic_n, ic_c, modify_date, Large_Description_1, Large_Description_2, Money_1, Money_2, Integer_1, Integer_2, Integer_3, Integer_4,
												  Integer_5,Integer_6, Integer_7, Integer_8, datetime_1, datetime_2,delete_by,delete_date)
select lookup_code, lookup_name, code, description, type, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, caqh_code, ic_n, ic_c, modify_date, Large_Description_1, 
Large_Description_2, Money_1, Money_2, Integer_1, Integer_2, Integer_3, Integer_4, Integer_5,Integer_6, Integer_7, Integer_8, datetime_1, datetime_2,:gs_user_id,getdate()
from code_lookup
where code_lookup.lookup_name = :is_lookup_name;
//end

DELETE code_lookup
  FROM code_lookup
 WHERE (code_lookup.lookup_name = :is_lookup_name);

if SQLCA.SQLCode <> 0 then
	MessageBox("Delete Error",SQLCA.SQLErrText)
	ROLLBACK;
	
	ll_CurRow = dw_name.GetRow()
	dw_name.SetItem(ll_CurRow,"lookup_name",is_lookup_name)
	dw_name.Event itemchanged(ll_CurRow,dw_name.Object.lookup_name,is_lookup_name)
	
	Return -1
end if

//add by gavin 	2012-01-13
DELETE lookup_coltitle  FROM lookup_coltitle
 WHERE (lookup_coltitle.lookup_name = :is_lookup_name and lookup_coltitle.lookup_type = :is_lookup_type );
if SQLCA.SQLCode <> 0 then
	MessageBox("Delete Error",SQLCA.SQLErrText)
	ROLLBACK;
	
	ll_CurRow = dw_name.GetRow()
	dw_name.SetItem(ll_CurRow,"lookup_name",is_lookup_name)
	dw_name.Event itemchanged(ll_CurRow,dw_name.Object.lookup_name,is_lookup_name)
	
	Return -1
end if
COMMIT;
ib_delete = true // add by gavin 2012-01-13

Tab_1.Tabpage_Browse.dw_Browse.ResetUpdate()

dw_name.GetChild("lookup_name",ldwc_Child)
ldwc_Child.SetTransObject(SQLCA)
ldwc_Child.Retrieve()

ll_RowCnts = ldwc_Child.RowCount()
if ll_RowCnts > 0 then
	ls_LookupName = ldwc_Child.GetItemString(ll_RowCnts,"lookup_name")
	
	ll_CurRow = dw_name.GetRow()
	dw_name.SetItem(ll_CurRow,"lookup_name",ls_LookupName)
	dw_name.Event itemchanged(ll_CurRow,dw_name.Object.lookup_name,ls_LookupName)
else
	Tab_1.Tabpage_Browse.dw_Browse.DataObject = ""
end if


Return 1

end function

event open;call super::open;//string ls_parm
is_parm = Message.Stringparm

//Added By Ken.Guo 2016-04-26
If is_parm = '' Then
	gnv_win_backcolor.of_ChangeWindowBackColor(this, True)
End If

Tab_1.Tabpage_Browse.dw_Browse.of_SetTransObject(SQLCA)
Tab_1.Tabpage_Browse.dw_Browse.InsertRow(0)
Tab_1.Tabpage_Browse.dw_Browse.Enabled = False

dw_name.of_SetTransObject(SQLCA)
dw_name.InsertRow(0)

dw_name.SetFocus()

This.TriggerEvent(Activate!)

of_SetMenuItemStatus()

//Add by jervis 11.26.2009
Event ue_change_lookupname(is_parm)
//if is_parm <> '' and not isnull(is_parm) then
//	dw_name.SetItem( 1,"lookup_name",is_parm)
//	dw_name.Event ItemChanged(1,dw_name.object.lookup_name,is_parm)
//end if
end event

on w_lookup_maint.create
int iCurrent
call super::create
this.cb_restore=create cb_restore
this.st_count=create st_count
this.gb_1=create gb_1
this.dw_name=create dw_name
this.cb_new_lookup=create cb_new_lookup
this.dw_users=create dw_users
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_restore
this.Control[iCurrent+2]=this.st_count
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.dw_name
this.Control[iCurrent+5]=this.cb_new_lookup
this.Control[iCurrent+6]=this.dw_users
this.Control[iCurrent+7]=this.tab_1
end on

on w_lookup_maint.destroy
call super::destroy
destroy(this.cb_restore)
destroy(this.st_count)
destroy(this.gb_1)
destroy(this.dw_name)
destroy(this.cb_new_lookup)
destroy(this.dw_users)
destroy(this.tab_1)
end on

event pfc_postopen;call super::pfc_postopen;/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: Added code that will allow the user to event double click on a column with a dddw and add the code
** 				  easiley
*==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner  today()
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/
long ll_foundrow

if len(message.stringparm) > 0 then
   DataWindowChild lookup_name_child
   ll_foundrow = dw_name.GetChild('lookup_name', lookup_name_child)
	ll_foundrow = lookup_name_child.Find( "lookup_name = '" + message.stringparm + "'", 1, lookup_name_child.rowcount())

	if ll_foundrow > 0 then
		WordCap ( message.stringparm )
	  	Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup"
      Tab_1.Tabpage_Browse.dw_Browse.of_SetTransObject(SQLCA)
		is_lookup_name = message.stringparm 
		Tab_1.Tabpage_Browse.dw_Browse.event pfc_retrieve( )
		dw_name.settext(message.stringparm)
	end if
end if 
end event

event close;call super::close;//WF_refresh_ctx_cache( ) //Commented By Ken.Guo 2010-11-24. Move to ue_save() event.
wf_UpdateUserDefInfo(is_lookup_type,is_lookup_name)		//Added by Scofield on 2008-06-17
w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
w_mdi.of_menu_security(w_mdi.MenuName)

end event

event pfc_preopen;call super::pfc_preopen;long	ll_Cycle

if gb_AutoResize then
	This.of_SetResize(true)
	This.inv_resize.of_SetOrigSize(This.WorkSpaceWidth(), This.WorkSpaceHeight())
	This.inv_resize.of_SetMinSize(800, 600)
	for ll_Cycle =  1 to UpperBound(This.Control)
		//Added By Jay Chen 02-02-2015
		if ll_Cycle = 1 or ll_Cycle = 3  or ll_Cycle = 4 or ll_Cycle = 5  then continue
//		if This.Control[ll_Cycle].text = 'Select Lookup Table' then continue	 or This.Control[ll_Cycle].text = '&New Lookup Table' or This.Control[ll_Cycle].text = '&Restore Lookup Table' then continue
		This.inv_resize.of_Register(This.Control[ll_Cycle], This.inv_resize.scale)
	next	
end if

end event

event activate;call super::activate;long ll_Handle

if w_mdi.menuname <> 'm_pfe_cst_mdi_menu_lookup' then
	ll_Handle = handle(w_mdi)
	w_mdi.ChangeMenu(m_pfe_cst_mdi_menu_lookup)
	w_mdi.SetToolbarPos(2, 1, 200, false)	
	w_mdi.of_menu_security(w_mdi.MenuName)
	of_SetMenuItemStatus() //Added By Ken.Guo 2015-09-18
	gnv_appeondll.of_settoolbarpos(ll_Handle)	
end if

end event

event pfc_save;String ls_value,ls_return
Long ll_Count,ll_Cycle
dwitemstatus	ldws_Status

ll_Count = Tab_1.Tabpage_Browse.dw_Browse.RowCount()
For ll_Cycle = 1 To ll_Count
	ls_value = Tab_1.Tabpage_Browse.dw_Browse.getitemstring(ll_Cycle, "code")
	if isnull(ls_value) or trim(ls_value) = '' then
		messagebox("Lookup","The lookup code can not be empty!")
		Tab_1.Tabpage_Browse.dw_Browse.setfocus()
		Tab_1.Tabpage_Browse.dw_Browse.setcolumn("code")
		Tab_1.Tabpage_Browse.dw_Browse.setrow(ll_Cycle)
		Tab_1.Tabpage_Browse.dw_Browse.scrolltorow(ll_Cycle)
		return -1
	end if
	ldws_Status = Tab_1.Tabpage_Browse.dw_Browse.GetItemStatus(ll_Cycle,0,Primary!)
	if ldws_Status = Newmodified! then
		if Upper(is_lookup_type) = "A"  then
			ls_return = gnv_data.of_getitem("address_lookup","lookup_code","upper(code)='"+upper(ls_value)+"' and upper(lookup_name)='"+upper(is_lookup_name)+"' ")
		else
			ls_return = gnv_data.of_getitem("code_lookup","lookup_code","upper(code)='"+upper(ls_value)+"' and upper(lookup_name)='"+upper(is_lookup_name)+"' ")
		end if
		If ls_return <> "" Then
			messagebox("Duplicate Record","A lookup with code [" + ls_value + "] is already in the lookup table.")
			ib_update = false
			return -1
		end if
	end if
Next

//Added By Jay Chen 10-17-2014 backup delete data to table code_lookup_delete_record
long ll_index,ll_delete_code,ll_cnt,ll_null[],ll_cnt2
if ib_delete_lookup then
	for ll_index = 1 to upperbound(il_delete_lookup_code)
		ll_delete_code = il_delete_lookup_code[ll_index] 
		select count(*) into :ll_cnt from code_lookup_delete_record where lookup_code = :ll_delete_code;
		if ll_cnt > 0 then
			select count(*) into :ll_cnt2 from code_lookup where lookup_code = :ll_delete_code;
			if ll_cnt2 > 0 then
				delete from code_lookup_delete_record where lookup_code = :ll_delete_code;
			end if
		end if
		insert into code_lookup_delete_record (lookup_code, lookup_name, code, description, type, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, caqh_code, 
								ic_n, ic_c, modify_date, Large_Description_1, Large_Description_2, Money_1, Money_2, Integer_1, Integer_2, Integer_3, Integer_4,
								Integer_5,Integer_6, Integer_7, Integer_8, datetime_1, datetime_2,delete_by,delete_date)
		select lookup_code, lookup_name, code, description, type, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, caqh_code, ic_n, ic_c, modify_date, Large_Description_1, 
		Large_Description_2, Money_1, Money_2, Integer_1, Integer_2, Integer_3, Integer_4, Integer_5,Integer_6, Integer_7, Integer_8, datetime_1, datetime_2,:gs_user_id,getdate()
		from code_lookup
		where code_lookup.lookup_code = :ll_delete_code;
	next
	ib_delete_lookup = false
end if
//end

if ib_update then 
	call super::pfc_save
end if

il_delete_lookup_code = ll_null

return 1
end event

event pfc_dberror;call super::pfc_dberror;//Added By Jay Chen 02-13-2015
long ll_index,ll_delete_code
for ll_index = 1 to upperbound(il_delete_lookup_code)
	ll_delete_code = il_delete_lookup_code[ll_index] 
	delete from code_lookup_delete_record where lookup_code = :ll_delete_code;
next
end event

event closequery;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  closequery
//
//	Description:
//	Search for unsaved datawindows prompting the user if any
//	pending updates are found.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Enhanced control on what objects are to be updated.
// 6.0.01 Make sure the window is not minimized and behind other windows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Constant Integer	ALLOW_CLOSE = 0
Constant Integer	PREVENT_CLOSE = 1

Integer	li_msg
Integer	li_rc
String	ls_msgparms[]
Powerobject lpo_updatearray[]

// Check if the CloseQuery process has been disabled
If ib_disableclosequery Then
	Return ALLOW_CLOSE
End If

// Call event to perform any pre-CloseQuery processing
If This.Event pfc_preclose ( ) <> 1 Then
	// Prevent the window from closing
	Return PREVENT_CLOSE 
End If

// Prevent validation error messages from appearing while the window is closing
// and allow others to check if the  CloseQuery process is in progress
ib_closestatus = True

// Determine the objects for which an update will be attempted.
// For the CloseQuery, the order sequence is as follows: 
//		1) Specified permananent sequence (thru of_SetUpdateObjects(...)).
//		2) None was specified, so use default window control array.
If UpperBound(ipo_updateobjects) > 0 Then
	lpo_updatearray = ipo_updateobjects
Else
	lpo_updatearray = This.Control		
End If

// Check for any pending updates
li_rc = of_UpdateChecks(lpo_updatearray)
If li_rc = 0 Then
	// Updates are NOT pending, allow the window to be closed.
	ib_closestatus = False
	Return ALLOW_CLOSE
ElseIf li_rc < 0 Then
	// Make sure the window is not minimized and behind other windows.
	If this.WindowState = Minimized! Then
		this.WindowState = Normal!
	End If
	this.BringToTop = True

	// There are Updates pending, but at least one data entry error was found.
	// Give the user an opportunity to close the window without saving changes
	If IsValid(gnv_app.inv_error) Then
		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_failsvalidation', &
					 ls_msgparms, gnv_app.iapp_object.DisplayName)
	Else
		li_msg = of_MessageBox ("pfc_master_closequery_failsvalidation", &
					gnv_app.iapp_object.DisplayName, &
					"The information entered does not pass validation and "  + &
					"must be corrected before changes can be saved.~r~n~r~n" + &
					"Close without saving changes?", &
					exclamation!, YesNo!, 2)
	End If
	If li_msg = 1 Then
		ib_closestatus = False
		Return ALLOW_CLOSE
	End If
Else
	// Make sure the window is not minimized and behind other windows.
	If this.WindowState = Minimized! Then
		this.WindowState = Normal!
	End If	
	this.BringToTop = True
	
	// Changes are pending, prompt the user to determine if they should be saved
	If IsValid(gnv_app.inv_error) Then
		li_msg = gnv_app.inv_error.of_Message('pfc_closequery_savechanges',  &
					ls_msgparms, gnv_app.iapp_object.DisplayName)		
	Else
		li_msg = of_MessageBox ("pfc_master_closequery_savechanges", &
					gnv_app.iapp_object.DisplayName, &
					"Do you want to save changes?", exclamation!, YesNoCancel!, 1)
	End If
	Choose Case li_msg
		Case 1
			// YES - Update
			// If the update fails, prevent the window from closing
			If This.Event ue_save() >= 1 Then   //modified by harry 20170615 modify pfc_save to ue_save
				// Successful update, allow the window to be closed
				ib_closestatus = False
				Return ALLOW_CLOSE
			End If
		Case 2
			// NO - Allow the window to be closed without saving changes
			ib_closestatus = False
			Return ALLOW_CLOSE
		Case 3
			// CANCEL -  Prevent the window from closing
	End Choose
End If

// Prevent the window from closing
ib_closestatus = False
Return PREVENT_CLOSE
end event

event pfc_messagerouter;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_messagerouter
//
//	Arguments:
//	as_message   message (event notification) to send
//
//	Returns:  integer
//	 1 = message successfully sent
//	 0 = no receivers recognized the message
//	-1 = error
//
//	Description:	 
//	This event routes a message (event notification) 
//	to the appropriate object.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

graphicobject lgo_focus

// Check argument
If IsNull (as_message) or Len (Trim (as_message)) = 0 Then
	Return -1
End If

// Try sending the message to this window, if successful exit event.
if lower(as_message) = 'pfc_save' then  //Added by Harry 20170615 for task723
	If This.TriggerEvent ('ue_save') = 1 Then Return 1
else
	If This.TriggerEvent (as_message) = 1 Then Return 1
end if

// Try sending the message to the current control, if successful exit event.
lgo_focus = GetFocus()
If IsValid (lgo_focus) Then
	If lgo_focus.TriggerEvent (as_message) = 1 Then Return 1
End If

// Try sending the message to the last active datawindow, if successful exit event.
If IsValid (idw_active) Then
	If idw_active.TriggerEvent (as_message) = 1 Then Return 1
End If

// No objects recognized the message
Return 0
end event

type cb_restore from u_cb within w_lookup_maint
integer x = 2030
integer y = 68
integer width = 558
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "&Restore Lookup Table"
end type

event clicked;call super::clicked;//if isnull(is_lookup_name) or is_lookup_name = '' then
//	 MessageBox("Tips","Please select lookup table first!")
//	 return
//end if

openwithparm(w_lookup_delete_record,is_lookup_name)


end event

type st_count from statictext within w_lookup_maint
integer x = 3360
integer y = 1884
integer width = 274
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "0"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_lookup_maint
integer x = 37
integer y = 8
integer width = 2587
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Lookup Table"
end type

type dw_name from u_dw within w_lookup_maint
integer x = 64
integer y = 76
integer width = 1445
integer height = 92
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_lookup_select"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateable(False)

// mskinner 09 march 2006 -- begin
of_SetBase(TRUE)
// mskinner 09 march 2006 -- end 

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.18.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product

//filter out all Address type lookups and all the lookup that do not have an X next to it in the lookup table
IF gb_contract_version THEN
	This.DataObject = "d_lookup_select_for_contract"
END IF

//---------------------------- APPEON END ----------------------------

end event

event itemchanged;call super::itemchanged;long		ll_found
String	ls_lookup_type,ls_OrgValue
long ll_rtn



//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.26.2007 By: Frank.Gui
//$<reason> If modified data cannot be saved, restore to the original lookup name
Tab_1.Tabpage_Browse.dw_Browse.Accepttext( ) //Added By Ken.Guo 2010-12-30.
ls_OrgValue = this.getitemstring(row,"lookup_name")
//ll_rtn = Parent.Event pfc_save()
if not(isnull(ls_OrgValue) or ls_OrgValue = '') then
	ll_rtn = Parent.Event ue_save()  //Modified by Harry 20170615 for task723
	If ll_rtn < 0 THEN
		this.post setitem(row,"lookup_name",ls_OrgValue)
		Return
	end if
end if
//---------------------------- APPEON END ----------------------------

If Not ib_delete Then wf_UpdateUserDefInfo(is_lookup_type,is_lookup_name)		//Added by Scofield on 2008-06-17
ib_delete = false //add and modify by gavin 2012-01-13


Tab_1.Tabpage_Browse.dw_Browse.SetRedraw(False)

is_lookup_name = This.GetText()
Tab_1.Tabpage_Browse.of_set_lookup_name(is_lookup_name)
Tab_1.Tabpage_Detail.of_set_lookup_name(is_lookup_name)

datawindowchild dwchild
datawindowchild dwchild2
This.GetChild("lookup_name", dwchild)

ll_found = dwchild.Find("lookup_name = '" + is_lookup_name + "'", 1, 1000)

IF ll_found > 0 THEN
	ls_lookup_type = Upper(dwchild.GetItemString(ll_found, "type"))	
	IF ls_lookup_type = "A" THEN
		is_lookup_type = "A"
		Tab_1.Tabpage_Browse.of_set_lookup_type("A")
		Tab_1.Tabpage_Detail.of_set_lookup_type("A")
		Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_address_lookup"
		Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_address_lookup_form"
		Tab_1.Tabpage_Browse.dw_Browse.ShareData(Tab_1.Tabpage_Detail.dw_Detail)
	ELSE
		is_lookup_type = "C"
		Tab_1.Tabpage_Browse.of_set_lookup_type("C")
		Tab_1.Tabpage_Detail.of_set_lookup_type("C")

		if Lower(is_lookup_name) = 'contract category' then
			Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup_contract"
			Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_code_lookup_contract_form"
			Tab_1.Tabpage_Browse.dw_Browse.ShareData(Tab_1.Tabpage_Detail.dw_Detail)
			
			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 11.15.2006 By: Jervis
			//$<reason> modify for work flow 
			if gb_workflow then
				Tab_1.Tabpage_Browse.dw_Browse.Modify("custom_5.visible = '1'")
				Tab_1.Tabpage_Browse.dw_Browse.GetChild( "custom_5", dwchild )
				dwchild.SetTransObject( SQLCA )
				dwchild.SetFilter("wf_triggered_by = '002'")				//Added By Scofield on 2008-03-12
				dwchild.Retrieve( "03" )	//03-Contract Logix Contract Tracking
				dwchild.InsertRow(1)
				dwchild.SetItem(1,"wf_name","")								//Modified By Scofield on 2008-03-12
				//Added By Jay Chen 02-18-2014
				Tab_1.Tabpage_Detail.dw_Detail.GetChild( "custom_5", dwchild2 )
				dwchild2.SetTransObject( SQLCA )
				dwchild2.SetFilter("wf_triggered_by = '002'")	
				dwchild2.Retrieve( "03" )	
				dwchild2.InsertRow(1)
				dwchild2.SetItem(1,"wf_name","")
			else
				Tab_1.Tabpage_Browse.dw_Browse.Modify("custom_5.visible = '0'")
			end if
			//---------------------------- APPEON END ----------------------------


		//	<add> 09.27.2006 By: Lei Wei
		elseif Lower(is_lookup_name) = 'contract action type' then
			Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup_for_contract_action_type"
			Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_code_lookup_contract_action_type_form"
			Tab_1.Tabpage_Browse.dw_Browse.ShareData(Tab_1.Tabpage_Detail.dw_Detail)
			
			Integer li_word_storage_type

			li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
			IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0
			IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
				// Store on Hard Disk
				Tab_1.Tabpage_Browse.dw_Browse.GetChild( "custom_6", dwchild )
				dwchild.Insertrow(0)
			ELSE
				// Store in Database
				Tab_1.Tabpage_Browse.dw_Browse.GetChild( "custom_6", dwchild )
				dwchild.SetTransObject( SQLCA )
				dwchild.Retrieve( )
			END IF
			
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 01.23.2007 By: Jack (Document Manager)
		//$<reason> 
		elseif Lower(is_lookup_name) = 'contract document status' then
			Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup_for_contract_document_stat"	
			Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_code_lookup_for_contract_doc_stat_form"
			Tab_1.Tabpage_Browse.dw_Browse.ShareData(Tab_1.Tabpage_Detail.dw_Detail)
		//---------------------------- APPEON END ----------------------------
		//-----------Begin Added by Alfee 09.27.2007-------------------------
		//elseif Lower(is_lookup_name) = 'contract status'  then
		elseif Lower(is_lookup_name) = 'contract status' or Lower(is_lookup_name) = 'contract custom status1' or Lower(is_lookup_name) = 'contract custom status2'  then //add custom status - jervis 04.26.2011
			Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup_for_contract_status"
			Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_code_lookup_for_contract_status_form"
			Tab_1.Tabpage_Browse.dw_Browse.ShareData(Tab_1.Tabpage_Detail.dw_Detail)
		//-----------End Added -----------------------------------------------	
		elseif Lower(is_lookup_name) = 'clause approval status' then
			Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup_for_clause_status"
			Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_code_lookup_for_clause_status_form"
			Tab_1.Tabpage_Browse.dw_Browse.ShareData(Tab_1.Tabpage_Detail.dw_Detail)

		else
			Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup"
			Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_code_lookup_form"
			Tab_1.Tabpage_Browse.dw_Browse.ShareData(Tab_1.Tabpage_Detail.dw_Detail)
		end if

		//---------------------------- APPEON END ----------------------------

	END IF

	Tab_1.Tabpage_Browse.dw_Browse.of_SetTransObject(SQLCA)
	
	
	Tab_1.Tabpage_Browse.dw_Browse.Event pfc_Retrieve()

	Tab_1.Tabpage_Browse.dw_Browse.ScrollToRow(1)
	Tab_1.Tabpage_Browse.dw_Browse.SetRow(1)
END IF

Tab_1.Tabpage_Browse.dw_Browse.SetFocus()

Tab_1.Tabpage_Browse.dw_Browse.SetRedraw(True)

Tab_1.Tabpage_Browse.dw_Browse.Enabled = True

IF Upper(is_lookup_type) = "A" THEN
	 SELECT Max( lookup_code )  
    INTO :il_lookup_code  
    FROM address_lookup  ;
ELSE
	 SELECT Max( lookup_code )  
    INTO :il_lookup_code  
    FROM code_lookup  ;
END IF
IF IsNull( il_lookup_code ) THEN
	il_lookup_code = 0
END IF

IF ls_lookup_type = "A" THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-03
	//$<modify> 02.16.2006 By: owen chen
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

	/*
	Tab_1.Tabpage_Browse.dw_Browse.GetChild( "state", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( "state" )

	Tab_1.Tabpage_Browse.dw_Browse.GetChild( "country", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( "country" )	
	*/
	gnv_appeondb.of_startqueue( )
	
	Tab_1.Tabpage_Browse.dw_Browse.GetChild( "state", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( "state" )
	
	Tab_1.Tabpage_Browse.dw_Browse.GetChild( "country", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( "country" )		 

	gnv_appeondb.of_commitqueue( )
	
	//---------------------------- APPEON END ----------------------------

END IF

IF is_lookup_name = "Action Type" THEN
	Tab_1.Tabpage_Browse.dw_Browse.Modify( "cust_6_t.text = 'Include In Graph' ")
	Tab_1.Tabpage_Browse.dw_Browse.Modify( "cust_2_t.text = 'Default Due Date Days'")
	Tab_1.Tabpage_Browse.dw_Browse.Modify( "cust_3_t.text = 'Follow Up Days'")		
	Tab_1.Tabpage_Browse.dw_Browse.Modify( "cust_1_t.text = 'Display Value'")	
END IF

IF Upper( is_lookup_name ) = "DEPARTMENT" THEN
	ii_dept_secure_setting = gi_dept_security
END IF
//Start Code Change ---- 03.29.2006 #354 maha

wf_RefreshColTitle(ls_lookup_type,is_lookup_name)		//Added by scofield on 2008-01-16

of_count()

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-04-15 By: Scofield
//$<Reason> Unregister Calendar and register Calendar.

Tab_1.Tabpage_Browse.dw_Browse.of_SetDropDownCalendar(false)
Tab_1.Tabpage_Browse.dw_Browse.of_SetDropDownCalendar(true)

Tab_1.Tabpage_Detail.dw_Detail.of_SetDropDownCalendar(false)
Tab_1.Tabpage_Detail.dw_Detail.of_SetDropDownCalendar(true)

//---------------------------- APPEON END ----------------------------

of_SetMenuItemStatus()

end event

event pfc_retrieve;call super::pfc_retrieve;Return This.Retrieve()
end event

event pfc_update;call super::pfc_update;
Return 0
end event

type cb_new_lookup from u_cb within w_lookup_maint
integer x = 1536
integer y = 68
integer width = 489
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "&New Lookup Table"
end type

event clicked;IF Parent.Event pfc_save() < 0 THEN
	Return
END IF

Open(w_get_lookup_name)

if Message.StringParm = "Cancel" then return

is_lookup_name = Mid(Message.StringParm,1, Pos(Message.StringParm, "-")-1)
is_lookup_type = Mid(Message.StringParm, Pos(Message.StringParm, "-") +1, 2)

IF Upper(is_lookup_type) = "A" THEN
	Tab_1.Tabpage_Browse.of_set_lookup_type("A")
	Tab_1.Tabpage_Detail.of_set_lookup_type("A")
	Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_address_lookup"
	Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_address_lookup_form"
ELSE
	Tab_1.Tabpage_Browse.of_set_lookup_type("C")
	Tab_1.Tabpage_Detail.of_set_lookup_type("C")
	Tab_1.Tabpage_Browse.dw_Browse.DataObject = "d_code_lookup"
	Tab_1.Tabpage_Detail.dw_Detail.DataObject = "d_code_lookup_form"
END IF

ib_new_table = True

Tab_1.Tabpage_Browse.dw_Browse.of_SetTransObject(SQLCA)
Tab_1.Tabpage_Browse.dw_Browse.ShareData(Tab_1.Tabpage_Detail.dw_Detail)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 02.08.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/* 
Tab_1.Tabpage_Browse.dw_Browse.Event pfc_Retrieve()

IF Upper(is_lookup_type) = "A" THEN
	 SELECT Max( lookup_code )  
    INTO :il_lookup_code  
    FROM address_lookup  ;
ELSE
	 SELECT Max( lookup_code )  
    INTO :il_lookup_code  
    FROM code_lookup  ;
END IF
*/

gnv_appeondb.of_startqueue( )

Tab_1.Tabpage_Browse.dw_Browse.Retrieve(is_lookup_name)

IF Upper(is_lookup_type) = "A" THEN
	 SELECT Max( lookup_code )  
    INTO :il_lookup_code  
    FROM address_lookup  ;
ELSE
	 SELECT Max( lookup_code )  
    INTO :il_lookup_code  
    FROM code_lookup  ;
END IF

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

IF IsNull( il_lookup_code ) THEN
	il_lookup_code = 0
END IF

Parent.Event ue_add()

dw_name.SetItem(dw_name.GetRow(),"lookup_name",is_lookup_name)
dw_name.AcceptText()

Tab_1.Tabpage_Browse.dw_Browse.SetFocus()

gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_add,'Enabled', true)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_export,'Enabled', true)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_delete0,'Enabled', true)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_filter0,'Enabled', true)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_sort0,'Enabled', true)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_print0,'Enabled', true)
gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0,'Enabled', true)

of_count()

end event

type dw_users from datawindow within w_lookup_maint
boolean visible = false
integer x = 2181
integer y = 64
integer width = 274
integer height = 108
integer taborder = 40
string dataobject = "d_user_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tab_1 from u_tab_lookup within w_lookup_maint
integer x = 27
integer y = 220
integer width = 3607
integer height = 1732
integer taborder = 11
end type

