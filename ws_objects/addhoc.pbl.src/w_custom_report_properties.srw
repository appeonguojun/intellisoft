$PBExportHeader$w_custom_report_properties.srw
forward
global type w_custom_report_properties from w_response
end type
type p_1 from picture within w_custom_report_properties
end type
type cb_cancle from commandbutton within w_custom_report_properties
end type
type cb_ok from commandbutton within w_custom_report_properties
end type
type dw_1 from u_dw within w_custom_report_properties
end type
end forward

global type w_custom_report_properties from w_response
integer width = 1362
integer height = 1728
string title = "Report Properties"
event ue_new ( )
event ue_properties ( )
event ue_copy ( )
p_1 p_1
cb_cancle cb_cancle
cb_ok cb_ok
dw_1 dw_1
end type
global w_custom_report_properties w_custom_report_properties

type variables
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-05 By: Andy
str_parm   istr_parm

Integer ii_project_id = 99

Long    il_Product
boolean ib_OnlyOneProduct = true
string		is_name = ""
//---------------------------- APPEON END ----------------------------
end variables

event ue_new();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-04 By: Andy
Integer li_nr,li_Ret
String  ls_Modify
datawindowchild dwchild

li_nr = dw_1.InsertRow( 0 )

dw_1.SetItem( li_nr, "view_id", istr_parm.l_wf_id  )
dw_1.SetItem( li_nr, "project_id", ii_project_id )
dw_1.SetItem( li_nr, "create_date", datetime(today(),now()) )
dw_1.SetItem( li_nr, "created_by", gs_user_id )
dw_1.SetItem( li_nr, "mod_user", "All" )

if ib_OnlyOneProduct then
	dw_1.SetItem( li_nr, "module", il_Product )
	ls_Modify = "module.background.color='12632256' module.Protect='1'"
	dw_1.modify( ls_Modify)
	//$<add> 01.25.2008 by Andy
	li_Ret = dw_1.GetChild( "data_view_id", dwchild ) 
	if li_Ret = 1 then
		dwchild.settransobject(sqlca)
		//filter data
		if Long(il_Product) = 1 then 
			dwchild.setfilter( "UPPER(type_c)='C'" )
			dwchild.filter( )
			//Default System View
			dw_1.setitem(1,"data_view_id",1001)
		elseif Long(il_Product) = 2 then 
			dwchild.setfilter( "UPPER(type_c)='P'" )
			dwchild.filter( )
			//Default System View
			dw_1.setitem(1,"data_view_id",1)
		end if
	end if
end if

dw_1.setitemStatus(li_nr,0,primary!,NotModified!)//set new!
dw_1.SetFocus( )
dw_1.SetColumn( "view_name" )
dw_1.SetRow( li_nr )
//---------------------------- APPEON END ----------------------------
end event

event ue_properties();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-05 By: Andy
//Modified By Ken.Guo 2015-08-05 Added compute_role

Long    ll_Cnt,ll_module,ll_data_view_id
string  ls_mod_user,ls_color
Integer li_Ret
datawindowchild dwchild
String  ls_Modify = ""
boolean		lbn_modify =false 

ll_Cnt = dw_1.retrieve(istr_parm.l_wf_id)
if ll_Cnt < 1 then return

ls_mod_user = dw_1.getitemstring(1,"mod_user")
if ls_mod_user = "All" then ls_mod_user = gs_user_id
ll_data_view_id = dw_1.getitemNumber(1,"data_view_id")
is_name	=  dw_1.getitemString(1,"view_name")					//Added By Mark Lee 03/09/2015

ll_module = dw_1.getitemNumber(1,"module")
li_Ret = dw_1.GetChild( "data_view_id", dwchild ) 
if li_Ret = 1 then
	dwchild.settransobject(sqlca)
	//filter data
	if ll_module = 1 then 
		dwchild.setfilter( "UPPER(type_c)='C'" )
		dwchild.filter( )
	elseif ll_module = 2 then 
		dwchild.setfilter( "UPPER(type_c)='P'" )
		dwchild.filter( )		
	end if
end if

ls_color = dw_1.Describe("DataWindow.Color")

if upper(ls_mod_user) <> upper(gs_user_id) then
	//delete reprt_type.....- jervis 07.22.2010
	ls_Modify = "category.background.color='" + ls_color + "' view_name.background.color='" + ls_color + "' " +&
		"mod_user.background.color='" + ls_color + "' module.background.color='" + ls_color + "' " +&
		"data_view_id.background.color='" +ls_color + "' DataWindow.ReadOnly=yes "	+  " compute_role.background.color='" +ls_color + "'"
	lbn_modify =true 
else
	if Not IsNull(ll_module) then 
		ls_Modify = "module.background.color='" + ls_color + "' "
	end if
/*	
	if Not IsNull(ll_data_view_id) then 
		ls_Modify += "data_view_id.background.color='" +ls_color + "'"
	end if
*/	
end if

dw_1.modify( ls_Modify )
//---------------------------- APPEON END ----------------------------


//Added By Mark Lee 04/07/2015
if w_mdi.of_security_access( 7013 ) = 0 and lbn_modify =false then
	ls_Modify = "category.background.color='" + ls_color + "' view_name.background.color='" + ls_color + "' " +&
		"mod_user.background.color='" + ls_color + "' module.background.color='" + ls_color + "' " +&
		"data_view_id.background.color='" +ls_color + "' DataWindow.ReadOnly=yes "	+  " compute_role.background.color='" +ls_color + "'"	
	dw_1.modify( ls_Modify )
end if

end event

on w_custom_report_properties.create
int iCurrent
call super::create
this.p_1=create p_1
this.cb_cancle=create cb_cancle
this.cb_ok=create cb_ok
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_1
this.Control[iCurrent+2]=this.cb_cancle
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.dw_1
end on

on w_custom_report_properties.destroy
call super::destroy
destroy(this.p_1)
destroy(this.cb_cancle)
destroy(this.cb_ok)
destroy(this.dw_1)
end on

event open;call super::open;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-04 By: Andy
istr_parm = message.Powerobjectparm


choose case istr_parm.s_type
	case 'new'
		this.event ue_new()
//	case 'copy'
//		this.event ue_copy()
	case 'properties'
		this.event ue_properties()
end choose
//---------------------------- APPEON END ----------------------------


end event

event close;call super::close;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-12-05 By: Andy
Long ll_Cnt,ll_view_id,ll_R

if isValid(istr_parm.u_dw) then 
	ll_Cnt = istr_parm.u_dw.retrieve(gs_user_id) //Added By Ken.Guo 2015-08-06. added gs_user_id
	ll_view_id = dw_1.GetItemNumber( 1, "view_id" )
	
	if ll_Cnt > 0 then
		ll_R = istr_parm.u_dw.find( "view_id=" + String(ll_view_id), 1, ll_Cnt)
		if ll_R > 0 then
			istr_parm.u_dw.setrow( ll_R )
			istr_parm.u_dw.scrolltorow( ll_R )
			istr_parm.u_dw.selectrow( 0, false)
			istr_parm.u_dw.selectrow( ll_R, true)

			//$<add> 01.14.2008 by Andy
			istr_parm.u_dw.setfocus( )
		end if
	end if
end if
//---------------------------- APPEON END ----------------------------
end event

type p_1 from picture within w_custom_report_properties
integer x = 1179
integer y = 572
integer width = 73
integer height = 64
boolean originalsize = true
string picturename = "Help!"
boolean focusrectangle = false
end type

event clicked;//$<add> 04.25.2008 by Andy
Open(w_data_view_hints)
end event

type cb_cancle from commandbutton within w_custom_report_properties
integer x = 974
integer y = 1528
integer width = 352
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-12-05 By: Andy

str_parm  lstr_parm

lstr_parm.s_type = 'cancel'
closewithreturn(parent,lstr_parm)
//---------------------------- APPEON END ----------------------------
end event

type cb_ok from commandbutton within w_custom_report_properties
integer x = 590
integer y = 1528
integer width = 352
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
boolean default = true
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 12.05.2007 By: Andy
str_parm  lstr_parm
Integer   li_Ret 
string		ls_name

li_Ret = parent.event pfc_save()

if li_Ret >= 0 then//=1 
	//istr_parm.u_dw.retrieve()	
	
	if li_Ret = 1 then lstr_parm.s_type = 'ok'
	//Added By Mark Lee 03/09/2015
	ls_name = string(dw_1.getItemString(dw_1.getrow(),"view_name"))
	if is_name <> "" and upper(is_name) <> upper(ls_name) then lstr_parm.s_name = ls_name			
	closewithreturn(parent,lstr_parm)
end if

return 1
//---------------------------- APPEON END ----------------------------

end event

type dw_1 from u_dw within w_custom_report_properties
integer x = 18
integer y = 16
integer width = 1307
integer height = 1488
integer taborder = 10
string dataobject = "d_cust_report_detail"
boolean vscrollbar = false
boolean livescroll = false
end type

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-12-05 By: Andy
DataWindowChild dwchild
Integer li_Ret
Long ll_Set9,ll_set_cont,ll_Row

This.of_SetReqColumn( TRUE )

li_Ret = dw_1.GetChild( "mod_user", dwchild ) 
if li_Ret = 1 then
	dwchild.settransobject(sqlca)
	dwchild.retrieve()
end if

li_Ret = dw_1.GetChild( "data_view_id", dwchild ) 
if li_Ret = 1 then
	dwchild.settransobject(sqlca)
	dwchild.retrieve()
	//clear data
	dwchild.setfilter( "1=2" )
	dwchild.filter( )
end if

li_Ret = dw_1.GetChild( "module", dwchild ) 
if li_Ret = 1 then
	dwchild.settransobject(sqlca)
	
	SELECT TOP 1 Set_9, set_cont INTO :ll_Set9,:ll_set_cont FROM icred_settings;	
	if ll_Set9 = 4 then
		ll_Row = dwchild.insertrow( 0 )
		dwchild.setitem(ll_Row,"module",1)
		dwchild.setitem(ll_Row,"name","Contract")
		il_Product = 1
	else
		if ll_set_cont = 1 then
			ll_Row = dwchild.insertrow( 0 )
			dwchild.setitem(ll_Row,"module",1)
			dwchild.setitem(ll_Row,"name","Contract")
			ib_OnlyOneProduct = false
		end if		
		ll_Row = dwchild.insertrow( 0 )
		dwchild.setitem(ll_Row,"module",2)
		dwchild.setitem(ll_Row,"name","IntelliCred/App")
		il_Product = 2
	end if
end if
//---------------------------- APPEON END ----------------------------
end event

event itemchanged;call super::itemchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-12-05 By: Andy
String  ls_colName
Integer li_Ret
datawindowchild dwchild

if lower(string(dwo.name)) = 'module' then
	li_Ret = dw_1.GetChild( "data_view_id", dwchild ) 
	if li_Ret = 1 then
		dwchild.settransobject(sqlca)
		//filter data
		if Long(data) = 1 then 
			dwchild.setfilter( "UPPER(type_c)='C'" )
			dwchild.filter( )
			//Default System View
			if lower(istr_parm.s_type) = 'new' then 
				dw_1.setitem(1,"data_view_id",1001)
			end if
		elseif Long(data) = 2 then 
			dwchild.setfilter( "UPPER(type_c)='P'" )
			dwchild.filter( )
			//Default System View
			if lower(istr_parm.s_type) = 'new' then
				dw_1.setitem(1,"data_view_id",1)
			end if
		end if
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event buttonclicked;call super::buttonclicked;//Added By Ken.Guo 2015-08-05
String ls_role
If Lower(dw_1.describe("DataWindow.ReadOnly")) = 'no'  Then
	If dwo.name = 'b_role_view' and Row > 0 Then
		ls_role = This.GetItemString(row, 'roles_can_view')
		OpenWithParm(w_roles_select, ls_role)
		If message.Stringparm = 'Cancel' Then
			Return 0
		End If
		This.SetItem(row,'roles_can_view',Message.StringParm )
	End If
End If



end event

