$PBExportHeader$w_lookup_add.srw
forward
global type w_lookup_add from window
end type
type st_message from statictext within w_lookup_add
end type
type cb_close from commandbutton within w_lookup_add
end type
type cb_save from commandbutton within w_lookup_add
end type
type sle_1 from singlelineedit within w_lookup_add
end type
type dw_1 from datawindow within w_lookup_add
end type
end forward

global type w_lookup_add from window
integer x = 1189
integer y = 556
integer width = 1861
integer height = 604
boolean titlebar = true
string title = "Lookup Add"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
st_message st_message
cb_close cb_close
cb_save cb_save
sle_1 sle_1
dw_1 dw_1
end type
global w_lookup_add w_lookup_add

type variables
string is_lookup_name
string is_lookup
end variables

forward prototypes
public function integer of_check_data ()
public subroutine of_addright (long al_category, string as_lookname)
end prototypes

public function integer of_check_data ();integer res
string ls_code = "*"
string ls_value
long ll_luc
integer cnt

//Start Code Change ---- 12.13.2005 # maha
dw_1.accepttext()
//End Code Change---12.13.2005 
//check for required data
if is_lookup = "A" then
	if isnull(dw_1.getitemstring(1,"entity_name")) then
		messagebox("Missing Required Data","Name data is missing.")
		return -1
	elseif isnull(dw_1.getitemstring(1,"street1")) then
		messagebox("Missing Required Data","Street1 data is missing.")
		return -1
	elseif isnull(dw_1.getitemstring(1,"city")) then
		messagebox("Missing Required Data","City data is missing.")
		return -1
//	elseif isnull(dw_1.getitemstring(1,"state")) then
//		messagebox("Missing Required Data","State data is missing.")
//		return -1
//	elseif isnull(dw_1.getitemstring(1,"zip")) then
//		messagebox("Missing Required Data","Zip code data is missing.")
//		return -1
	end if
	ls_value = dw_1.getitemstring(1,"entity_name")
elseif is_lookup = "C" then
	if isnull(dw_1.getitemstring(1,"code")) then
		messagebox("Missing Required Data","Please enter a lookup code")
		return -1		//Added by Scofield on 2007-08-31
	elseif isnull(dw_1.getitemstring(1,"description")) then
		messagebox("Missing Required Data","Please enter a lookup description")
		return -1		//Added by Scofield on 2007-08-31
	end if
	ls_value = dw_1.getitemstring(1,"code") //Added By Jay Chen 11-08-2013
end if

//see if lookup currently exists
if is_lookup = "A" then
	select count(*) into :cnt from address_lookup where upper(entity_name) = upper(:ls_value) and lookup_name = :is_lookup_name;
	if cnt > 0 then
		messagebox("Duplicate Record","A lookup with this name is already in the database.")
		return -1
	end if
elseif is_lookup = "C" then
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-01
	//$<modify> 03.23.2006 By: LeiWei
	//$<reason> Performance tuing
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*
	select count(*) into :cnt from code_lookup where upper(description) = upper(:ls_value) and lookup_name = :is_lookup_name;
	if cnt > 0 then
	*/
	If gnv_data.of_getitem("code_lookup","lookup_code","upper(code) = '" +upper(ls_value) +"'"+&
		" and upper(lookup_name) = '" + upper(is_lookup_name) + "'") <> "" Then //Modified By Jay Chen 11-08-2013
	//---------------------------- APPEON END ----------------------------
		messagebox("Duplicate Record","A lookup with this code is already in the database.")
		return -1
	end if
end if





return 1
	
end function

public subroutine of_addright (long al_category, string as_lookname);//Copied from w_lookup_maint by Alfee in 01.19.2008
//--------------------------- APPEON BEGIN ---------------------------
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
	elseif as_LookName = 'Contract Division' then //Added By Jay Chen 03-23-2015
		if ll_RoleId = ll_RoleId_User then //Added by harry 20170506 for task723
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,6,'61');
		else
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,6,'63');
		end if
	elseif as_LookName = 'Contract Department' then //Added By Jay Chen 03-23-2015
		if ll_RoleId = ll_RoleId_User then //Added by harry 20170506 for task723
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
				  VALUES (:ll_RoleId,:al_category,7,'71');
		else
			INSERT INTO ctx_acp_contract_management_right(role_id,category,types,rights )
			  	VALUES (:ll_RoleId,:al_category,7,'73');
		end if
	elseif as_LookName = 'Contract Type' then //Added By Jay Chen 03-23-2015
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

on w_lookup_add.create
this.st_message=create st_message
this.cb_close=create cb_close
this.cb_save=create cb_save
this.sle_1=create sle_1
this.dw_1=create dw_1
this.Control[]={this.st_message,&
this.cb_close,&
this.cb_save,&
this.sle_1,&
this.dw_1}
end on

on w_lookup_add.destroy
destroy(this.st_message)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.sle_1)
destroy(this.dw_1)
end on

event open;
is_lookup_name = mid(Message.StringParm,3)
is_lookup = mid(Message.StringParm,1,1)
 

if is_lookup = "C" then
	dw_1.dataobject = "d_code_lookup_add_add_search"
	sle_1.visible = false
	dw_1.visible = true
	this.title = "Code Add"
	//Modify by jervis - 02.10.2010
	//this.height = 500
	st_message.text = "Note:To set additional attributes of the " + is_lookup_name + &
							" lookup, please go to System->Lookup Painter and select the " + is_lookup_name + &
							" lookup table."
elseif  is_lookup = "A" then
	dw_1.visible = true
	sle_1.visible = false
	dw_1.dataobject = "d_address_lookup_add"
	this.title = "Entity Lookup Add"
end if

//messagebox("is_lookup_name",is_lookup_name)
//messagebox("is_lookup",is_lookup)

dw_1.SetTransObject( SQLCA )
dw_1.insertrow(1)
dw_1.setitem(1,"lookup_name",is_lookup_name)
//--------------------------- APPEON BEGIN ---------------------------
//$<modified> 2007-04-16 By: Wu ZhiJun
//$<reason> Fixed a bug
dw_1.SetFocus()
dw_1.SetColumn('code')
//--------------------------- APPEON END -----------------------------

//Start code change 11.30.2006 henry. if adding for contract category, then set the default view
If upper(is_lookup_name) = 'CONTRACT CATEGORY' Then dw_1.setitem(1,"ic_n",1001)
//End code change 11.30.2006
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_message from statictext within w_lookup_add
integer x = 37
integer y = 316
integer width = 1787
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Note:To set additional attributes of the  lookup please go to System->Lookup Painter and select the Clause Approval Status lookup table."
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_lookup_add
integer x = 1554
integer y = 32
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;closewithreturn(parent,"cancel")
end event

type cb_save from commandbutton within w_lookup_add
integer x = 1289
integer y = 32
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
boolean default = true
end type

event clicked;integer res
string ls_code = "*"
string ls_value
long ll_luc
Integer		li_value

res = of_check_data()

if res = -1 then return -1 

//if is_lookup = "A" then
//	ls_value = dw_1.getitemstring(1,"entity_name")
//elseif is_lookup = "C" then
//	ls_value = sle_1.text
//	dw_1.setitem(1,"description",ls_value)
//end if
//
//ls_code = ls_code + upper(mid(ls_value,1,6))
//dw_1.setitem(1,"code",ls_code)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 04.05.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
select lookup_code_id into :ll_luc from ids;
ll_luc++
update ids set lookup_code_id = :ll_luc;
dw_1.setitem(1,"lookup_code",ll_luc)

res = dw_1.update()

if res < 0 then 
	messagebox("Update Failure", "Unable to add lookup")
	return -1
else
	commit using sqlca;
	closewithreturn(parent,ll_luc)
end if
*/

gnv_appeondb.of_startqueue( )

select lookup_code_id into :ll_luc from ids;

update ids set lookup_code_id = lookup_code_id + 1;

gnv_appeondb.of_commitqueue( )

ll_luc++
dw_1.setitem(1,"lookup_code",ll_luc)
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.26.2007 By: Jack
//$<reason> Fix a defect.
If is_lookup = "C" Then
	dw_1.setitem(1,'type','C')
End If
//---------------------------- APPEON END ----------------------------

//Start code by jervis 12-4-2008
//Set display value for 'Contract Action Type' and 'Action Type'
if is_lookup_name = 'Contract Action Type' or is_lookup_name = 'Action Type' then
	dw_1.SetItem(1,'custom_1',dw_1.GetItemString(1,"description"))
end if
//End code By Jervis 12-4-2008

gnv_appeondb.of_autocommit( )
res = dw_1.update()
if res < 0 then 
	messagebox("Update Failure", "Unable to add lookup")
	return -1
else
	//Start Code change --11.30.2006 Added by henry.
	gnv_appeondb.of_startqueue()
	commit using sqlca;

	//Refresh cachedata
	gnv_data.of_retrieve( "code_lookup" )
	gnv_data.of_retrieve( "code_lookup_2" )
	update code_lookup set modify_date = getdate() where lookup_name = :is_lookup_name; 
	gnv_appeondb.of_commitqueue()
	//End code changes -- 11.30.2006
	
	//Begin - Added By Mark Lee 01/04/2013	 this is must after code_lookup retrieve data 	//	Contract Action Status
	li_value = gnv_app.inv_dwcache.of_IsRegistered (is_lookup_name)    
	IF li_value = 1 THEN
		gnv_app.of_setcontraccache_code_lookup( is_lookup_name )
	End If
	//End - Added By Mark Lee 01/04/2013
	
	//Modified by harry 20170606 for task723
	/*
	//----------Begin Added by Alfee 01.19.2008--------------------
	//<$Reason> Update ctx_acp_contract_management_right table
	if ((is_lookup_name = 'Contract Category') or (is_lookup_name = 'Contract Clause Category')) then
		of_AddRight(ll_luc, is_lookup_name)
	end if
	//----------END Added------------------------------------------	
	*/
	if ((is_lookup_name = 'Contract Category') or (is_lookup_name = 'Contract Clause Category') or (is_lookup_name = 'Contract Division') or (is_lookup_name = 'Contract Department') or (is_lookup_name = 'Contract Type')) then
		of_AddRight(ll_luc, is_lookup_name)
		if is_lookup_name <> 'Contract Clause Category' and w_mdi.of_security_access( 540 ) <> 0 and w_mdi.of_security_access( 6803 ) = 2  then 
			str_add_lookup lstr_lookup
			long ll_lookcode[]
			ll_lookcode[1] = ll_luc
			lstr_lookup.al_lookup_code = ll_lookcode
			openwithparm(w_security_add_lookup, lstr_lookup)
		end if
	end if
	//----------END Modified------------------------------------------	
	closewithreturn(parent,ll_luc)
end if
//---------------------------- APPEON END ----------------------------

end event

type sle_1 from singlelineedit within w_lookup_add
boolean visible = false
integer x = 1733
integer y = 2040
integer width = 73
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_lookup_add
integer x = 37
integer y = 144
integer width = 1787
integer height = 180
integer taborder = 10
string dataobject = "d_code_lookup_add_add_search"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//Add by jervis 10.20.2009 
if is_lookup = 'C' and dwo.name = 'code' then
	this.SetItem(row,'description',data)
end if
	
end event

