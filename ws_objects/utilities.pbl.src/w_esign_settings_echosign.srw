$PBExportHeader$w_esign_settings_echosign.srw
forward
global type w_esign_settings_echosign from w_response
end type
type st_2 from statictext within w_esign_settings_echosign
end type
type sle_redirect from singlelineedit within w_esign_settings_echosign
end type
type cb_refresh from commandbutton within w_esign_settings_echosign
end type
type dw_2 from u_dw within w_esign_settings_echosign
end type
type cb_template from commandbutton within w_esign_settings_echosign
end type
type rb_1 from radiobutton within w_esign_settings_echosign
end type
type rb_2 from radiobutton within w_esign_settings_echosign
end type
type cb_1 from commandbutton within w_esign_settings_echosign
end type
type mle_1 from multilineedit within w_esign_settings_echosign
end type
type cb_default from commandbutton within w_esign_settings_echosign
end type
type cb_verify from commandbutton within w_esign_settings_echosign
end type
type st_1 from statictext within w_esign_settings_echosign
end type
type cb_ok from commandbutton within w_esign_settings_echosign
end type
type cb_cancel from commandbutton within w_esign_settings_echosign
end type
type gb_1 from groupbox within w_esign_settings_echosign
end type
type gb_2 from groupbox within w_esign_settings_echosign
end type
type gb_3 from groupbox within w_esign_settings_echosign
end type
end forward

global type w_esign_settings_echosign from w_response
integer x = 214
integer y = 221
integer width = 2176
integer height = 1440
string title = "Echosign Token Settings"
event sys_command pbm_syscommand
st_2 st_2
sle_redirect sle_redirect
cb_refresh cb_refresh
dw_2 dw_2
cb_template cb_template
rb_1 rb_1
rb_2 rb_2
cb_1 cb_1
mle_1 mle_1
cb_default cb_default
cb_verify cb_verify
st_1 st_1
cb_ok cb_ok
cb_cancel cb_cancel
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_esign_settings_echosign w_esign_settings_echosign

type variables
n_cst_webapi inv_webapi
end variables

event sys_command;If message.wordparm = 61536 Then
	cb_cancel.Trigger Event Clicked()
End If

end event

on w_esign_settings_echosign.create
int iCurrent
call super::create
this.st_2=create st_2
this.sle_redirect=create sle_redirect
this.cb_refresh=create cb_refresh
this.dw_2=create dw_2
this.cb_template=create cb_template
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.cb_default=create cb_default
this.cb_verify=create cb_verify
this.st_1=create st_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.sle_redirect
this.Control[iCurrent+3]=this.cb_refresh
this.Control[iCurrent+4]=this.dw_2
this.Control[iCurrent+5]=this.cb_template
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.rb_2
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.mle_1
this.Control[iCurrent+10]=this.cb_default
this.Control[iCurrent+11]=this.cb_verify
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.cb_ok
this.Control[iCurrent+14]=this.cb_cancel
this.Control[iCurrent+15]=this.gb_1
this.Control[iCurrent+16]=this.gb_2
this.Control[iCurrent+17]=this.gb_3
end on

on w_esign_settings_echosign.destroy
call super::destroy
destroy(this.st_2)
destroy(this.sle_redirect)
destroy(this.cb_refresh)
destroy(this.dw_2)
destroy(this.cb_template)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.cb_default)
destroy(this.cb_verify)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////
// Event: open()
// Arguments:
//--------------------------------------------------------------------
// Return:  long
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-05-26.
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
string ls_mode
string ls_client_id,ls_client_secret,ls_access_token,ls_refresh_token,ls_token_date, ls_website
string ls_redirect  //Added by Harry 2017-01-18
string ls_restapi   //Added By Harry 2017-08-10

ls_mode = gnv_user_option.of_get_option_value(gs_user_id, "echosign_license_mode" )
This.of_setalwaysvalidate( True)

//Added By Jay Chen 09-03-2014
if isnull(ls_mode) or ls_mode = '' then ls_mode = "global_license"
if ls_mode = "global_license" then
	rb_1.checked = true
else
	rb_2.checked = true
	cb_default.enabled = false
	cb_verify.enabled = false
	dw_2.object.datawindow.readonly = true
end if

//Modified By Ken.Guo 2017-06-22
//gnv_user_option.of_retrieve("contractlogix-super-master")   //Added by Harry 2017-02-21 
gnv_user_option.of_retrieve(gs_user_id)
 
//Added By Jay Chen 02-03-2016
dw_2.insertrow(0)
ls_client_id = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_client_id" )
ls_client_secret = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_client_secret" )
ls_access_token = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_access_token" )
ls_refresh_token = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_refresh_token" )
ls_token_date = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_token_date" )
ls_website = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_website" ) //Added By Ken.Guo 2017-06-20
ls_restapi = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_rest_api" )//Added By Harry 2017-08-10
If ls_website = '' or isnull(ls_website)  Then
	ls_website = 'https://secure.echosign.com/public/oauth'
	gnv_user_option.of_Set_option_value('contractlogix-super-master', "esign_website",ls_website ) //Added By Ken.Guo 2017-06-20
	gnv_user_option.of_save()	
End If

//Added By Harry 2017-08-10
If ls_restapi = '' or isnull(ls_restapi)  Then
	ls_restapi = 'https://api.na1.echosign.com/api/rest/v5'
	gnv_user_option.of_Set_option_value('contractlogix-super-master', "esign_rest_api",ls_restapi )
	gnv_user_option.of_save()	
End If

 //Added by Harry 2017-01-18
ls_redirect =  gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_redirect" )
if isnull(ls_redirect) or ls_redirect = '' then ls_redirect = 'https://web.contractlogix.com/ContractlogixWeb/api/AccessToken'
sle_redirect.text = ls_redirect

dw_2.setitem(dw_2.getrow(),"client_id", ls_client_id)
dw_2.setitem(dw_2.getrow(),"client_secret", ls_client_secret)
dw_2.setitem(dw_2.getrow(),"access_token", ls_access_token)
dw_2.setitem(dw_2.getrow(),"refresh_token", ls_refresh_token)
dw_2.setitem(dw_2.getrow(),"token_date", ls_token_date)
dw_2.setitem(dw_2.getrow(),"esign_website", ls_website) //Added By Ken.Guo 2017-06-20
dw_2.setitem(dw_2.getrow(),"esign_restapi", ls_restapi)   //Added By Harry 2017-08-10
dw_2.setitemstatus(dw_2.getrow(),0, Primary!, NotModified!)

if isnull(ls_access_token) then ls_access_token = ''
if isnull(ls_refresh_token) then ls_refresh_token = ''
if ls_access_token <> '' and ls_refresh_token <> '' then
	cb_refresh.enabled = true
else
	cb_refresh.enabled = false
end if
//end add
end event

event close;//Override ancestor script
end event

event pfc_save;//Added By Jay Chen 09-04-2014
cb_ok.triggerevent(clicked!)
return 1
end event

type st_2 from statictext within w_esign_settings_echosign
integer x = 69
integer y = 1088
integer width = 544
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Echosign Redirect URL:"
boolean focusrectangle = false
end type

type sle_redirect from singlelineedit within w_esign_settings_echosign
integer x = 622
integer y = 1068
integer width = 1495
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_refresh from commandbutton within w_esign_settings_echosign
integer x = 681
integer y = 1220
integer width = 384
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&RefreshToken"
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
// Author:	Jay Chen		Date: 02-16-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_rtn 
string ls_access_token,ls_refresh_token,ls_token_date

if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then gs_accesstoken = inv_webapi.of_convert_json_token()
ll_rtn = inv_webapi.of_esign_refresh_token(gs_accesstoken, 'contractlogix-super-master',ls_access_token,ls_refresh_token,ls_token_date)
if ll_rtn < 0 then
	messagebox("Information","Failed to refresh the echosign token!")
	return -1
end if

//refresh token information
dw_2.setitem(dw_2.getrow(),"access_token", ls_access_token)
dw_2.setitem(dw_2.getrow(),"refresh_token", ls_refresh_token)
dw_2.setitem(dw_2.getrow(),"token_date", ls_token_date)

dw_2.setitemstatus(dw_2.getrow(),0, Primary!, NotModified!)

//Modified By Ken.Guo 2017-06-22
//gnv_user_option.of_retrieve("contractlogix-super-master") 
gnv_user_option.of_retrieve(gs_user_id) 

messagebox("Information","The echosign token is successfully refreshed!")


end event

type dw_2 from u_dw within w_esign_settings_echosign
integer x = 69
integer y = 80
integer width = 2053
integer height = 700
integer taborder = 40
string dataobject = "dw_echosign_token"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_setupdateable( true) //Added By Jay Chen 02-03-2016
end event

type cb_template from commandbutton within w_esign_settings_echosign
boolean visible = false
integer x = 50
integer y = 1080
integer width = 352
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Template"
end type

event clicked;open(w_sertifi_template)
end event

type rb_1 from radiobutton within w_esign_settings_echosign
integer x = 101
integer y = 884
integer width = 549
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Global License"
boolean checked = true
end type

event clicked;if this.checked then
	cb_default.enabled = true
	cb_verify.enabled = true
	cb_refresh.enabled = true
	dw_2.object.datawindow.readonly = false
end if
end event

type rb_2 from radiobutton within w_esign_settings_echosign
integer x = 1349
integer y = 884
integer width = 549
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Personal License"
end type

event clicked;if this.checked then
	cb_default.enabled = false
	cb_verify.enabled = false
	cb_refresh.enabled = false
	dw_2.object.datawindow.readonly = true
end if
end event

type cb_1 from commandbutton within w_esign_settings_echosign
integer x = 1902
integer y = 872
integer width = 146
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "..."
boolean cancel = true
end type

event clicked;String ls_redirect 
//Added by Harry 2017-01-18
ls_redirect =  Trim(sle_redirect.text)
if ls_redirect = '' then
	messagebox(gnv_app.iapp_object.DisplayName,'Please input the Echosign Redirect URL first!')
	sle_redirect.setfocus()
	return -1
end if
gnv_user_option.of_Set_option_value('contractlogix-super-master', "esign_redirect",ls_redirect )
gnv_user_option.of_save()
//end
OpenWithParm(w_security_license_user,gs_user_id)
end event

type mle_1 from multilineedit within w_esign_settings_echosign
boolean visible = false
integer x = 69
integer y = 272
integer width = 1728
integer height = 136
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The default API code is Contract Logix, but you can obtain your own API code from https://www.sertifi.com/"
boolean border = false
end type

type cb_default from commandbutton within w_esign_settings_echosign
integer x = 535
integer y = 1400
integer width = 352
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Load Default"
end type

type cb_verify from commandbutton within w_esign_settings_echosign
integer x = 1079
integer y = 1220
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&GetToken"
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
// Author:	Jay Chen		Date: 02-05-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History: get echosign accesstoken
//====================================================================

String ls_client_id,ls_client_secret,ls_url,ls_redirect,ls_null, ls_website
long ll_row

dw_2.AcceptText() 
Setnull(ls_null)
ll_row = dw_2.getrow()
if ll_row < 1 then return
ls_client_id = dw_2.getitemstring(ll_row,"client_id")
ls_client_secret = dw_2.getitemstring(ll_row,"client_secret")
ls_website = dw_2.getitemstring(ll_row, 'esign_website') //Added By Ken.Guo 2017-06-20

if isnull(ls_client_id) then ls_client_id = ''
if isnull(ls_client_secret) then ls_client_secret = ''
if ls_client_id = '' then
	messagebox(gnv_app.iapp_object.DisplayName,'Please input the Echosign Client ID first!')
	dw_2.setfocus()
	dw_2.setcolumn("client_id")
	return -1
end if
if ls_client_secret = '' then
	messagebox(gnv_app.iapp_object.DisplayName,'Please input the Echosign Client Secret first!')
	dw_2.setfocus()
	dw_2.setcolumn("client_secret")
	return -1
end if

//Modified By Ken.Guo 2017-06-20
If isnull(ls_website) or ls_website = '' Then
	ls_url = 'https://secure.echosign.com/public/oauth'//modified by gavins 05102017
Else
	ls_url = ls_website
End If

//Modified by Harry 2017-01-18
//ls_redirect = gnv_user_option.of_get_option_value('contractlogix-super-master', "esign_redirect" )
//if isnull(ls_redirect) or ls_redirect = '' then ls_redirect = 'https://192.0.0.148/api/accesstoken/'
ls_redirect =  Trim(sle_redirect.text)
if isnull(ls_redirect ) or trim(ls_redirect) = '' then 
	messagebox(gnv_app.iapp_object.DisplayName,"The system cannot detect a valid echosign accesstoken redirect url.")
	return -1
end if

//https://appeon.na1.echosign.com/public/oauth?redirect_uri=***&response_type=***&client_id=***&scope=***&state=***
if isnull(gs_accesstoken) or trim(gs_accesstoken) = '' then 
	gs_accesstoken = inv_webapi.of_convert_json_token()
end if
ls_url = ls_url+ "?redirect_uri=" + ls_redirect+ "&response_type=code" + "&client_id=" + ls_client_id + "&scope=agreement_read+agreement_send+agreement_write+user_login" + "&state=" + gs_accesstoken + '_contractlogix-super-master'
ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_url , ls_Null, 4)	

close(parent)
end event

type st_1 from statictext within w_esign_settings_echosign
boolean visible = false
integer x = 32
integer y = 1180
integer width = 1819
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Attention: Web Link Settings will use default value if it don~'t fill data."
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_esign_settings_echosign
integer x = 1435
integer y = 1220
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;string ls_mode,ls_apicode,ls_apicode2
long ll_cnt
string ls_client_id,ls_client_secret, ls_website
string ls_redirect  //Added by Harry 2017-01-18
string ls_restapi   //Added By Harry 2017-08-10

if rb_1.checked then
	ls_mode = "global_license"
elseif rb_2.checked then
	ls_mode = "personal_license"
end if

//Modified By Jay Chen 02-16-2016
dw_2.accepttext()
if dw_2.getrow() < 1 then return
ls_client_id = dw_2.getitemstring(dw_2.getrow(),"client_id")
ls_client_secret = dw_2.getitemstring(dw_2.getrow(),"client_secret")
ls_website = dw_2.getitemstring(dw_2.getrow(),"esign_website") //Added By Ken.Guo 2017-06-20
ls_restapi = dw_2.getitemstring(dw_2.getrow(),"esign_restapi") //Added By Harry 2017-08-10
if isnull(ls_client_id) then ls_client_id = ''
if isnull(ls_client_secret) then ls_client_secret = ''

//Added By Ken.Guo 2017-06-20
If isnull(ls_website) or  ls_website = ''  Then
	ls_website = 'https://secure.echosign.com/public/oauth'
	dw_2.setitem(dw_2.getrow(), 'esign_website', ls_website)
End If

//Added By Harry 2017-08-10
If isnull(ls_restapi) or  ls_restapi = ''  Then
	ls_restapi = 'https://api.na1.echosign.com/api/rest/v5'
	dw_2.setitem(dw_2.getrow(), 'esign_restapi', ls_restapi)
End If

if ls_client_id = '' then
	messagebox(gnv_app.iapp_object.DisplayName,'Please input the Echosign Client ID first!')
	dw_2.setfocus()
	dw_2.setcolumn("client_id")
	return -1
end if
if ls_client_secret = '' then
	messagebox(gnv_app.iapp_object.DisplayName,'Please input the Echosign Client Secret first!')
	dw_2.setfocus()
	dw_2.setcolumn("client_secret")
	return -1
end if


//Added by Harry 2017-01-18
ls_redirect =  Trim(sle_redirect.text)
if ls_redirect = '' then
	messagebox(gnv_app.iapp_object.DisplayName,'Please input the Echosign Redirect URL first!')
	sle_redirect.setfocus()
	return -1
end if
gnv_user_option.of_Set_option_value('contractlogix-super-master', "esign_redirect",ls_redirect )
//end 
gnv_user_option.of_Set_option_value('contractlogix-super-master', "esign_client_id",ls_client_id )
gnv_user_option.of_Set_option_value('contractlogix-super-master', "esign_client_secret",ls_client_secret )
gnv_user_option.of_Set_option_value('contractlogix-super-master', "esign_website",ls_website ) //Added By Ken.Guo 2017-06-20
gnv_user_option.of_Set_option_value('contractlogix-super-master',"esign_rest_api" ,ls_restapi )  //Added By Harry 2017-08-10
gnv_user_option.of_Set_option_value(gs_user_id, "echosign_license_mode",ls_mode )
gnv_user_option.of_save()
//end 


Close(Parent)
Return 1
end event

type cb_cancel from commandbutton within w_esign_settings_echosign
integer x = 1792
integer y = 1220
integer width = 343
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

event clicked;Close(Parent)
end event

type gb_1 from groupbox within w_esign_settings_echosign
integer x = 27
integer y = 4
integer width = 2112
integer height = 800
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Global License for Echosign"
end type

type gb_2 from groupbox within w_esign_settings_echosign
integer x = 27
integer y = 804
integer width = 2112
integer height = 200
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "License Mode"
end type

type gb_3 from groupbox within w_esign_settings_echosign
integer x = 23
integer y = 1004
integer width = 2112
integer height = 188
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

