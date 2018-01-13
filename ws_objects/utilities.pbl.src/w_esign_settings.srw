$PBExportHeader$w_esign_settings.srw
forward
global type w_esign_settings from w_response
end type
type cb_template from commandbutton within w_esign_settings
end type
type rb_1 from radiobutton within w_esign_settings
end type
type rb_2 from radiobutton within w_esign_settings
end type
type cb_1 from commandbutton within w_esign_settings
end type
type mle_1 from multilineedit within w_esign_settings
end type
type dw_1 from u_dw within w_esign_settings
end type
type cb_default from commandbutton within w_esign_settings
end type
type cb_verify from commandbutton within w_esign_settings
end type
type st_1 from statictext within w_esign_settings
end type
type cb_ok from commandbutton within w_esign_settings
end type
type cb_cancel from commandbutton within w_esign_settings
end type
type gb_1 from groupbox within w_esign_settings
end type
type gb_2 from groupbox within w_esign_settings
end type
end forward

global type w_esign_settings from w_response
integer x = 214
integer y = 221
integer width = 1883
integer height = 756
string title = "Electronic Signature Settings"
event sys_command pbm_syscommand
cb_template cb_template
rb_1 rb_1
rb_2 rb_2
cb_1 cb_1
mle_1 mle_1
dw_1 dw_1
cb_default cb_default
cb_verify cb_verify
st_1 st_1
cb_ok cb_ok
cb_cancel cb_cancel
gb_1 gb_1
gb_2 gb_2
end type
global w_esign_settings w_esign_settings

type variables

end variables

event sys_command;If message.wordparm = 61536 Then
	cb_cancel.Trigger Event Clicked()
End If

end event

on w_esign_settings.create
int iCurrent
call super::create
this.cb_template=create cb_template
this.rb_1=create rb_1
this.rb_2=create rb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.cb_default=create cb_default
this.cb_verify=create cb_verify
this.st_1=create st_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_template
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.mle_1
this.Control[iCurrent+6]=this.dw_1
this.Control[iCurrent+7]=this.cb_default
this.Control[iCurrent+8]=this.cb_verify
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.cb_ok
this.Control[iCurrent+11]=this.cb_cancel
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.gb_2
end on

on w_esign_settings.destroy
call super::destroy
destroy(this.cb_template)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.cb_default)
destroy(this.cb_verify)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.gb_1)
destroy(this.gb_2)
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

dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()

//Added By Jay Chen 10-09-2013
choose case gs_esigntype
	case 'sertifi'
		dw_1.modify("es_apicode.visible = true")
		dw_1.modify("echo_apicode.visible = false")
		dw_1.modify("t_1.text = 'Sertifi API Code:'")
		mle_1.text = 'The default API code is Contract Logix, but you can obtain your own API code from https://www.sertifi.com/'
		ls_mode = gnv_user_option.of_get_option_value(gs_user_id, "sertifi_license_mode" )
		cb_template.visible = true
	case 'echosign'
		dw_1.modify("es_apicode.visible = false")
		dw_1.modify("echo_apicode.visible = true")
		dw_1.modify("t_1.text = 'Echosign API Code:'")
		if dw_1.getitemstring(1,"echo_apicode") = 'XY5JXPL2M3X7I8M' then
			mle_1.text = 'The default API code is demo use only, but you can obtain your own API code from https://secure.echosign.com/'
		else
			mle_1.text = 'The default API code is Contract Logix, but you can obtain your own API code from https://secure.echosign.com/'
		end if
		ls_mode = gnv_user_option.of_get_option_value(gs_user_id, "echosign_license_mode" )
		cb_template.visible = false
end choose
This.of_setalwaysvalidate( True)

//Added By Jay Chen 09-03-2014
if isnull(ls_mode) or ls_mode = '' then ls_mode = "global_license"
if ls_mode = "global_license" then
	rb_1.checked = true
else
	rb_2.checked = true
	cb_default.enabled = false
	cb_verify.enabled = false
	dw_1.object.datawindow.readonly = true
end if

end event

event close;//Override ancestor script
end event

event pfc_save;//Added By Jay Chen 09-04-2014
cb_ok.triggerevent(clicked!)
return 1
end event

type cb_template from commandbutton within w_esign_settings
integer x = 50
integer y = 544
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

type rb_1 from radiobutton within w_esign_settings
integer x = 64
integer y = 408
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
	dw_1.object.datawindow.readonly = false
end if
end event

type rb_2 from radiobutton within w_esign_settings
integer x = 699
integer y = 408
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

event clicked;dw_1.accepttext()
if this.checked then
	cb_default.enabled = false
	cb_verify.enabled = false
	dw_1.object.datawindow.readonly = true
end if
end event

type cb_1 from commandbutton within w_esign_settings
integer x = 1253
integer y = 400
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

event clicked;OpenWithParm(w_security_license_user,gs_user_id)
end event

type mle_1 from multilineedit within w_esign_settings
integer x = 69
integer y = 172
integer width = 1691
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

type dw_1 from u_dw within w_esign_settings
integer x = 69
integer y = 52
integer width = 1751
integer height = 104
integer taborder = 30
string dataobject = "d_esign_settings"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_setupdateable( True)

end event

event pfc_validation;call super::pfc_validation;//////////////////////////////////////////////////////////////////////
// $<event>dw_weblink::pfc_validation()
// $<arguments>(None)
// $<returns> integer
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2009-03-30 by Ken.Guo
//////////////////////////////////////////////////////////////////////

String ls_apicode_name
This.AcceptText()
ls_apicode_name = dw_1.GetItemString(1,'es_apicode')

If ls_apicode_name = '' Or Isnull(ls_apicode_name) Then Return -1

Return 1
end event

type cb_default from commandbutton within w_esign_settings
integer x = 416
integer y = 544
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

event clicked;dw_1.SetItem(1,'es_apicode','DC1317FF-E03E-475D-87E7-AAE70E8D97A4')
dw_1.SetItem(1,'echo_apicode','XY5JXPL2M3X7I8M')

end event

type cb_verify from commandbutton within w_esign_settings
integer x = 1138
integer y = 544
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Verify"
end type

event clicked;String ls_apicode
integer li_ret

dw_1.AcceptText() //Added By Ken.Guo 08/17/2012
choose case gs_esigntype //Added By Jay Chen 10-09-2013
	case 'sertifi'
		ls_apicode = dw_1.GetitemString(1,'es_apicode')
		If ls_apicode = '' or isnull(ls_apicode) Then
			Messagebox('Error','Please input the Sertifi API Code.',Exclamation!)
			Return
		End If
		
		If Not gnv_sertifi.of_check_sertifi(false) Then Return
		
         li_ret = gnv_sertifi.of_ping_apicode(ls_apicode) 
			Choose Case li_ret 
				Case -1
					Messagebox('Sertifi Error','Invalid Sertifi API Code, please input a valid value.',Exclamation!)
				Case -2
					Messagebox('Sertifi Error','Cannot connect to Sertifi server. You may experience some network connection issue.',Exclamation!)
				Case 1
					Messagebox('Sertifi','Sertifi API Code is OK.')
			End Choose
		
	case 'echosign'
		ls_apicode = dw_1.GetitemString(1,'echo_apicode')
		If ls_apicode = '' or isnull(ls_apicode) Then
			Messagebox('Error','Please input the Echosign API Code.',Exclamation!)
			Return
		End If
		
		If Not gnv_echosign.of_check_sertifi(false) Then Return
		
         li_ret = gnv_echosign.of_ping_apicode(ls_apicode) 
			Choose Case li_ret 
				Case -1
					Messagebox('Echosign Error','Invalid Echosign API Code, please input a valid value.',Exclamation!)
				Case -2
					Messagebox('Echosign Error','Cannot connect to Echosign server. You may experience some network connection issue.',Exclamation!)
				Case 1
					Messagebox('Echosign','Echosign API Code is OK.')
			End Choose
			
	end choose
	
Return

end event

type st_1 from statictext within w_esign_settings
boolean visible = false
integer x = 32
integer y = 668
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

type cb_ok from commandbutton within w_esign_settings
integer x = 782
integer y = 544
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

dw_1.accepttext()
//Added By Jay Chen 09-03-2014
if rb_1.checked then
	ls_mode = "global_license"
elseif rb_2.checked then
	ls_mode = "personal_license"
end if

//Added By Jay Chen 09-05-2014 check docusign apicode if or not modify
choose case gs_esigntype
	case 'sertifi'
		ls_apicode = dw_1.getitemstring(1,'es_apicode',Primary!,true)
		ls_apicode2 = dw_1.getitemstring(1,'es_apicode',Primary!,false)
	case 'echosign'
		ls_apicode = dw_1.getitemstring(1,'echo_apicode',Primary!,true)
		ls_apicode2 = dw_1.getitemstring(1,'echo_apicode',Primary!,false)
end choose
//if ls_apicode <> ls_apicode2 then
//	if gs_esigntype = 'sertifi' then
//		select count(*) into :ll_cnt from ctx_am_document where esign_type = 'sertifi'  and es_apicode = :ls_apicode;
//	else
//		select count(*) into :ll_cnt from ctx_am_document where esign_type = 'echosign'  and es_apicode = :ls_apicode;
//	end if
//	if isnull(ll_cnt) then ll_cnt = 0
//	if ll_cnt < 1 then
//		if gs_esigntype = 'sertifi' then
//			select count(*) into :ll_cnt from ctx_am_doc_audit where esign_type = 'sertifi' and es_apicode = :ls_apicode;
//		else
//			select count(*) into :ll_cnt from ctx_am_doc_audit where esign_type = 'echosign' and es_apicode = :ls_apicode;
//		end if
//		if isnull(ll_cnt) then ll_cnt = 0
//	end if
//	if ll_cnt > 0 then
//		if Messagebox('Contractlogix','The system has detected that this API code has been used for sending document signing requests. You will not be able to check the signing status for those documents if you change it. Do you want to continue?',Exclamation!, YesNo!, 2) = 2 then
//			dw_1.setfocus()
//			if gs_esigntype = 'sertifi' then
//				dw_1.SetColumn('es_apicode')
//			else
//				dw_1.SetColumn('echo_apicode')
//			end if
//			return -1
//		end if
//	end if
//end if

If dw_1.update() = 1 Then
	Commit;
	gnv_data.of_retrieve('icred_settings')
	choose case gs_esigntype
		case 'sertifi'
			gnv_user_option.of_Set_option_value(gs_user_id, "sertifi_license_mode",ls_mode )
		case 'echosign'
			gnv_user_option.of_Set_option_value(gs_user_id, "echosign_license_mode",ls_mode )
	end choose
	gnv_user_option.of_save( )
Else
	Rollback;
	Messagebox('Save Error','Failed to save data, please call support.')
	Return -1
End If

Close(Parent)
Return 1
end event

type cb_cancel from commandbutton within w_esign_settings
integer x = 1495
integer y = 544
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

type gb_1 from groupbox within w_esign_settings
integer x = 27
integer y = 4
integer width = 1810
integer height = 324
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Global License"
end type

type gb_2 from groupbox within w_esign_settings
integer x = 27
integer y = 328
integer width = 1810
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

