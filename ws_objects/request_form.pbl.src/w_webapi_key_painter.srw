$PBExportHeader$w_webapi_key_painter.srw
forward
global type w_webapi_key_painter from w_response
end type
type dw_webapi from u_dw within w_webapi_key_painter
end type
type cb_save from u_cb within w_webapi_key_painter
end type
type cb_delete from u_cb within w_webapi_key_painter
end type
type cb_close from u_cb within w_webapi_key_painter
end type
type dw_1 from u_dw within w_webapi_key_painter
end type
type cb_gnerate_new_key from u_cb within w_webapi_key_painter
end type
type gb_1 from groupbox within w_webapi_key_painter
end type
end forward

global type w_webapi_key_painter from w_response
string tag = "Web API Key Painter"
integer x = 214
integer y = 221
integer width = 3465
integer height = 2160
string title = "Web API Key Painter"
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = main!
windowstate windowstate = maximized!
dw_webapi dw_webapi
cb_save cb_save
cb_delete cb_delete
cb_close cb_close
dw_1 dw_1
cb_gnerate_new_key cb_gnerate_new_key
gb_1 gb_1
end type
global w_webapi_key_painter w_webapi_key_painter

forward prototypes
public function integer of_verify_cachename (string as_cachename, boolean abn_flag)
public function string of_get_webapi_key ()
end prototypes

public function integer of_verify_cachename (string as_cachename, boolean abn_flag);//====================================================================
// Function: of_verify_cachename
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string     as_cachename
// 	value    boolean    abn_flag
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 03/12/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
string 	ls_cachename, ls_db_name, ls_server_name, ls_new_dbname, ls_new_servername
n_tr 		TR_WEBLINK

if AppeonGetClientType() <> 'WEB' then
	return 1 
end if 

TR_WEBLINK = Create n_tr
TR_WEBLINK.AutoCommit = True
TR_WEBLINK.DBMS = 'ODB-MSS'
TR_WEBLINK.DBParm = "CacheName='" + as_cachename + "'"
Connect USING TR_WEBLINK;

IF TR_WEBLINK.SQLCODE = -1 THEN
	dw_webapi.modify("cache_name.protect=0 cache_name.background.color='1073741824' ")
	if abn_flag = true then		
		MessageBox("Error", "Failed to connect the CacheName '" +as_cachename+ "'")
	end if
	if isvalid(TR_WEBLINK) then Destroy TR_WEBLINK
	Return -1
else
	select DB_NAME(), @@SERVERNAME Into :ls_db_name, :ls_server_name from  ids USING SQLCA ; 	
	if isvalid(TR_WEBLINK) then 
		select DB_NAME(), @@SERVERNAME Into :ls_new_dbname, :ls_new_servername from  ids USING TR_WEBLINK ; 
	end if 

	if (isnull(ls_new_dbname) or trim(ls_new_dbname) = '' or isnull(ls_new_servername) or trim(ls_new_servername) = ''  ) or &
		(lower(ls_db_name) <> lower(ls_new_dbname) ) or ( lower(ls_server_name) <> lower(ls_new_servername) ) 	then 
		dw_webapi.modify("cache_name.protect=0 cache_name.background.color='1073741824' ")
		if abn_flag = true then
			messagebox(gnv_app.iapp_object.DisplayName,"The CacheName '" +as_cachename+ "' is invalid.")
		end if 
		if isvalid(TR_WEBLINK) then Destroy TR_WEBLINK
		Return -1	
	end if 
	dw_webapi.modify("cache_name.protect=1 cache_name.background.color='553648127' ")
	if abn_flag = true then		
		messagebox(gnv_app.iapp_object.DisplayName,"Success to connect the CacheName '" +as_cachename+ "'")
	end if 
END IF

if isvalid(TR_WEBLINK) then 
	DisConnect USING TR_WEBLINK;
	Destroy TR_WEBLINK
end if 

return 1 
end function

public function string of_get_webapi_key ();string 			ls_return, ls_first,  ls_second, ls_third, ls_four
Datetime			ldt_date
integer			li_1, li_2, li_3, li_4

ldt_date	=	f_get_server_dtm()
li_1 = integer(left(string(year(date(ldt_date)) ), 1) )
li_2 = integer(mid(string(year(date(ldt_date))), 2,1) )
li_3 = integer(mid(string(year(date(ldt_date))), 3,1) )
li_4 = integer(mid(string(year(date(ldt_date))), 4) )
if li_1 < 15 then li_1 = abs( 37 - li_1)
if li_2 < 15 then li_2 = abs( 37 - li_2)
if li_3 < 15 then li_3 = abs( 37 - li_3)
if li_4 < 15 then li_4 = abs( 37 - li_4)
ls_first = of_get_alpha_letter(rand(li_1))+of_get_alpha_letter(rand(li_2))+of_get_alpha_letter(rand(li_3))+of_get_alpha_letter(rand(li_4))
li_1 = integer(string(Month(date(ldt_date)) ))
li_2 = integer(string(day(date(ldt_date)) ))
li_3 = rand(37)
li_4 = rand(37)
if li_1 < 15 then li_1 = abs( 37 - li_1)
if li_2 < 15 then li_2 = abs( 37 - li_2)
ls_second =  of_get_alpha_letter(rand(li_1))+of_get_alpha_letter(rand(li_2))+of_get_alpha_letter(rand(li_3))+of_get_alpha_letter(rand(li_4))
li_1 = integer(left( string(ldt_date, "hh:mm:ss"), 2))
li_2 = integer(mid( string(ldt_date, "hh:mm:ss"), 4,2))
li_3 = integer(mid( string(ldt_date, "hh:mm:ss"), 7,2))
li_4 = rand(37)
if li_1 < 15 then li_1 = abs( 37 - li_1)
if li_2 < 15 then li_2 = abs( 37 - li_2)
if li_3 < 15 then li_3 = abs( 37 - li_3)
ls_third = of_get_alpha_letter(rand(li_1))+of_get_alpha_letter(rand(li_2))+of_get_alpha_letter(rand(li_3))+of_get_alpha_letter(rand(li_4))

ls_return = '-'+ls_first + '-'+ ls_second + '-'+ls_third

return ls_return

end function

on w_webapi_key_painter.create
int iCurrent
call super::create
this.dw_webapi=create dw_webapi
this.cb_save=create cb_save
this.cb_delete=create cb_delete
this.cb_close=create cb_close
this.dw_1=create dw_1
this.cb_gnerate_new_key=create cb_gnerate_new_key
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_webapi
this.Control[iCurrent+2]=this.cb_save
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.cb_gnerate_new_key
this.Control[iCurrent+7]=this.gb_1
end on

on w_webapi_key_painter.destroy
call super::destroy
destroy(this.dw_webapi)
destroy(this.cb_save)
destroy(this.cb_delete)
destroy(this.cb_close)
destroy(this.dw_1)
destroy(this.cb_gnerate_new_key)
destroy(this.gb_1)
end on

event open;call super::open;string 	ls_cache_name 

//
gnv_appeondb.of_startqueue( )
dw_webapi.retrieve( )
dw_1.retrieve()
gnv_appeondb.of_commitqueue( )

ls_cache_name  = dw_webapi.GetItemString(dw_webapi.GetRow(), "cache_name")
//gs_cachename
if  isnull(gs_cachename) or trim(gs_cachename) = ''  then 
//	if  isnull(ls_cache_name) or trim(ls_cache_name) = ''  then
//		messagebox(gnv_app.iapp_object.DisplayName,"The system cannot detect a valid DB Cache Name. ~r~nPlease go to AEM -> Connection Cache to find the valid Cache Name and enter it here manually.")
//	end if 
else
	//automatic update the data.
	if  isnull(ls_cache_name) or trim(ls_cache_name) = '' or (not isnull(ls_cache_name) and lower(gs_cachename) <> lower(ls_cache_name) ) then
		dw_webapi.SetItem(dw_webapi.GetRow(), "cache_name",gs_cachename)
		dw_webapi.modify("cache_name.protect=1 cache_name.background.color='553648127' ")
		dw_webapi.event pfc_update(true, true)
	elseif	(not isnull(ls_cache_name) and lower(gs_cachename) = lower(ls_cache_name) )  then
		dw_webapi.modify("cache_name.protect=1 cache_name.background.color='553648127' ")
	end if 	
end if 

if AppeonGetClientType() = 'PB' then
	dw_webapi.modify("cache_name.protect=1 cache_name.background.color='553648127' ")
	dw_1.modify("Destroy b_verify")
	dw_1.modify("Destroy b_copy_sf")	
	
	cb_gnerate_new_key.visible = false
	cb_delete.visible = false
end if 


end event

event pfc_postopen;call super::pfc_postopen;string 	ls_cache_name 


if AppeonGetClientType() = 'WEB' then 
	ls_cache_name  = dw_webapi.GetItemString(dw_webapi.GetRow(), "cache_name")
	if  isnull(gs_cachename) or trim(gs_cachename) = ''  then 
		if  isnull(ls_cache_name) or trim(ls_cache_name) = ''  then
			dw_webapi.setfocus( )
			dw_webapi.setcolumn( "cache_name")
			messagebox(gnv_app.iapp_object.DisplayName,"The system cannot detect a valid DB Cache Name. ~r~nPlease go to AEM -> Connection Cache to find the valid Cache Name and enter it here manually.")
		end if 
	end if 
end if 
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

event close;call super::close;w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
w_mdi.of_menu_security( w_mdi.MenuName )

end event

event pfc_preopen;call super::pfc_preopen;long ll_i
string ls_scale

This.of_SetResize(True)
//this.inv_resize.of_setminsize( 800, 600 )
This.inv_resize.of_SetOrigSize (This.workspacewidth(),This.workspaceheight())
inv_resize.of_SetMinSize(this.WorkSpaceWidth(),this.WorkSpaceHeight())
ls_scale = this.inv_resize.scale

For ll_i =  1 To upperbound(This.CONTrol)
   This.inv_resize.of_Register (This.CONTrol[ll_i],ls_scale)
Next


end event

type dw_webapi from u_dw within w_webapi_key_painter
integer x = 18
integer y = 20
integer width = 3401
integer height = 96
integer taborder = 30
string dataobject = "d_icred_settings_webapi"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_setupdateable( True)

end event

event pfc_update;call super::pfc_update;
gnv_data.of_retrieve( "icred_settings")
return 1
end event

event buttonclicked;call super::buttonclicked;if row <=0 then  return 0

if dwo.name = 'b_help' then 
	messagebox("Help","Please go to AEM -> Connection Cache to find the valid Cache Name and enter it here manually.")
end if 
end event

type cb_save from u_cb within w_webapi_key_painter
integer x = 2770
integer y = 1952
integer width = 320
integer height = 84
integer taborder = 30
string text = "&Save"
end type

event clicked;call super::clicked;string 	ls_cachename

dw_webapi.accepttext( )
ls_cachename = trim(dw_webapi.GetItemString(dw_webapi.GetRow(), "cache_name" ) )
setpointer(HourGlass!)
if of_verify_cachename(ls_cachename , false) <= 0 then 
	setpointer(Arrow!)
	MessageBox(gnv_app.iapp_object.DisplayName, "Failed to connect the CacheName '" +ls_cachename+ "'")
	setpointer(HourGlass!)
end if 

If event pfc_save( ) <> 1 Then 
	setpointer(Arrow!)
	Return	
end if 

setpointer(Arrow!)

end event

type cb_delete from u_cb within w_webapi_key_painter
integer x = 2446
integer y = 1952
integer width = 320
integer height = 84
integer taborder = 20
string text = "&Delete"
end type

event clicked;call super::clicked;
dw_1.event pfc_deleterow( )
end event

type cb_close from u_cb within w_webapi_key_painter
integer x = 3095
integer y = 1952
integer width = 320
integer height = 84
integer taborder = 20
string text = "&Close"
boolean cancel = true
end type

event clicked;call super::clicked;Close(Parent)
end event

type dw_1 from u_dw within w_webapi_key_painter
integer x = 32
integer y = 176
integer width = 3378
integer height = 1744
integer taborder = 20
string dataobject = "d_wepapi_key_painter"
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.of_setupdateable( True)
this.of_setrowselect( true)

this.of_SetDropDownCalendar(TRUE)
end event

event pfc_preinsertrow;call super::pfc_preinsertrow;
//check the cache name
 if dw_webapi.event pfc_preupdate( ) < 0 then 
	return -1 
 end if 

return 1 
end event

event pfc_postinsertrow;call super::pfc_postinsertrow;Datetime			ldt_date
string 			ls_key, ls_new, ls_cache_name
long				ll_row, i, ll_rowcount


if al_row<=0 then return 

ldt_date =	f_get_server_dtm()
ls_cache_name  = trim(dw_webapi.GetItemString(dw_webapi.GetRow(), "cache_name" ) )

ls_new = ls_cache_name +of_get_webapi_key()
ll_rowcount = this.rowcount()

if ll_rowcount > 1 then 
	for i = 1 to ll_rowcount 
		if i = al_row then 
			continue
		end if
		ls_key = this.getitemstring( i, "api_key")
		if ls_new = ls_key then 
			ls_new = ls_cache_name +of_get_webapi_key()
		end if 
	next 
	
	for i = 1 to ll_rowcount 
		if i = al_row then 
			continue
		end if
		ls_key = this.getitemstring( i, "api_key")
		if ls_new = ls_key then 
			this.deleterow(al_row)
			messagebox(gnv_app.iapp_object.DisplayName," The automatically generated API key ["+ls_new+"] already exists. Please try again.")
			return 
		end if 
	next 	
end if 

this.setItem( al_row, "api_key", ls_new)
this.setItem( al_row, "active", "T")
this.setItem( al_row, "creator",gs_user_id)
this.setItem( al_row, "create_date",ldt_date)
//this.setItem( al_row, "expiration_date",ldt_date)

end event

event pfc_preupdate;call super::pfc_preupdate;long 		i , ll_row, ll_rowcount, ll_find
string 	ls_apikey, ls_cachename, ls_arr[]
 
 ll_rowcount = this.rowcount()
 ls_cachename = ""
 i = 0 
 for ll_row = 1 to ll_rowcount 
	ls_apikey = this.GetItemString(ll_row,"api_key") 
	i ++
	ls_arr[i] = left(ls_apikey, pos(ls_apikey,"-") - 1 )
 next 

if i > 0  then 
	gnv_string.of_delete_duplicate(ls_arr)
	ll_rowcount = UpperBound(ls_arr)	

	for ll_row = 1 to ll_rowcount 
		ls_cachename = ls_arr[ll_row]
		if of_verify_cachename(ls_cachename, false) <= 0 then 
			ll_find =	this.find( " Pos(api_key,'"+ls_cachename+"-') > 0 ", 1, this.rowcount()) 
			if ll_find > 0 then 
				this.setItem( ll_find, "active", "F")
				this.setItem( ll_find, "verifies",  1)
				ls_apikey = this.GetItemString(ll_find,"api_key")
				messagebox(gnv_app.iapp_object.DisplayName,"The API Key '" +ls_apikey+ "' is invalid.")
			else
				messagebox(gnv_app.iapp_object.DisplayName,"The CacheName '" +ls_cachename+ "' is invalid.")
			end if 
			return -1 
		end if 
	next
end if 
 
return 1 
end event

event pfc_predeleterow;call super::pfc_predeleterow;// chooise the row 
long 	ll_row

ll_row = this.getselectedrow(0)


if ll_row <= 0 then 
	messagebox(gnv_app.iapp_object.DisplayName,"Please select a row that you want to delete.")
	return 0
end if 

return 1 


end event

event rbuttondown;call super::rbuttondown;string 		ls_colname,ls_msg
Datetime		dtn
integer		ret

ls_colname = dwo.name
setnull(dtn)

if this.Describe("DataWindow.ReadOnly") = "yes" or this.Describe(ls_colname + ".protect") <> "0" or this.Describe(ls_colname + ".TabSequence") = "0"  or row <= 0 then return

ls_msg = "Would you like to set this Date to null?"
if this.Describe( ls_colname + ".ColType") = "datetime" THEN
	ret = messagebox("Set Null", ls_msg, question!, yesno!, 2 )	
	if ret = 1 then
		this.setitem(row,ls_colname,dtn)
	end if
END IF
end event

event buttonclicked;call super::buttonclicked;string 	ls_apikey, ls_url, ls_ip
long 		ll_pos

if row <=0 then  return 0

if dwo.name = 'b_verify' then 
	ls_apikey = this.GetItemString(row,"api_key")
	if isnull(ls_apikey) or trim(ls_apikey) = "" then 
		messagebox(gnv_app.iapp_object.DisplayName," The API Key cannot be null. ~r~n Please use Generate New Key button get the API Key frist.")
	else
		ll_pos= pos(ls_apikey, "-")
		if isnull(ll_pos) or ll_pos <= 0 then 
			this.setItem( row, "active", "F")
			this.setItem( row, "verifies",  1)
			messagebox(gnv_app.iapp_object.DisplayName,"The API Key '" +ls_apikey+ "' is invalid.")			
		else
			if of_verify_cachename(left(ls_apikey, ll_pos -1 ), true) <= 0 then 
				this.setItem( row, "active", "F")
				this.setItem( row, "verifies",  1)
			end if 
		end if 
	end if
elseif dwo.name = 'b_copy' then 
	ls_apikey = this.GetItemString(row,"api_key")
	::Clipboard(ls_apikey)
	messagebox(gnv_app.iapp_object.DisplayName,"The current API key is already on the clipboard.")
elseif dwo.name ='b_copy_sf' then	//Added By Mark 07/01/2014
	ls_apikey = this.GetItemString(row,"api_key")	
	ls_url = AppeonGetIEURL()
	If ls_url <> '' Then
		ls_url = Mid(ls_url,1,Len(ls_url) - 1) //Cut last '/'
		ls_url = Mid(ls_url,1,LastPos(ls_url,'/')) //Cut application root name
		if pos(lower(ls_url),'localhost')  > 0 then
			ls_ip = appeongetclientip()
			ls_url = gnv_string.of_globalreplace(ls_url, 'localhost', ls_ip)
		end if
		ls_url = ls_url+ "ContractlogixWeb/api/InboundSalesforceData?accesstoken="+ls_apikey
		::Clipboard(ls_url)
		messagebox(gnv_app.iapp_object.DisplayName,"The current Salesforce Endpoint URL is already on the clipboard.")	
	End If
end if 

return 0


end event

type cb_gnerate_new_key from u_cb within w_webapi_key_painter
integer x = 1979
integer y = 1952
integer width = 462
integer height = 84
integer taborder = 10
string text = "&Generate New Key"
end type

event clicked;call super::clicked;dw_1.event pfc_addrow( )
end event

type gb_1 from groupbox within w_webapi_key_painter
integer x = 18
integer y = 128
integer width = 3401
integer height = 1808
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Web API Browse "
end type

