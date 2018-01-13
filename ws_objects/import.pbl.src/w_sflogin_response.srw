$PBExportHeader$w_sflogin_response.srw
forward
global type w_sflogin_response from w_response
end type
type sle_sfurl from singlelineedit within w_sflogin_response
end type
type st_4 from statictext within w_sflogin_response
end type
type cb_help from commandbutton within w_sflogin_response
end type
type sle_3 from singlelineedit within w_sflogin_response
end type
type st_3 from statictext within w_sflogin_response
end type
type cb_2 from commandbutton within w_sflogin_response
end type
type cb_1 from commandbutton within w_sflogin_response
end type
type st_2 from statictext within w_sflogin_response
end type
type st_1 from statictext within w_sflogin_response
end type
type sle_2 from singlelineedit within w_sflogin_response
end type
type sle_1 from singlelineedit within w_sflogin_response
end type
end forward

global type w_sflogin_response from w_response
integer x = 214
integer y = 221
integer width = 1701
integer height = 756
string title = "Salesforce Login"
sle_sfurl sle_sfurl
st_4 st_4
cb_help cb_help
sle_3 sle_3
st_3 st_3
cb_2 cb_2
cb_1 cb_1
st_2 st_2
st_1 st_1
sle_2 sle_2
sle_1 sle_1
end type
global w_sflogin_response w_sflogin_response

type variables
str_sflogin_response   istr_res
end variables

on w_sflogin_response.create
int iCurrent
call super::create
this.sle_sfurl=create sle_sfurl
this.st_4=create st_4
this.cb_help=create cb_help
this.sle_3=create sle_3
this.st_3=create st_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_2=create st_2
this.st_1=create st_1
this.sle_2=create sle_2
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_sfurl
this.Control[iCurrent+2]=this.st_4
this.Control[iCurrent+3]=this.cb_help
this.Control[iCurrent+4]=this.sle_3
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.sle_2
this.Control[iCurrent+11]=this.sle_1
end on

on w_sflogin_response.destroy
call super::destroy
destroy(this.sle_sfurl)
destroy(this.st_4)
destroy(this.cb_help)
destroy(this.sle_3)
destroy(this.st_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_2)
destroy(this.sle_1)
end on

type sle_sfurl from singlelineedit within w_sflogin_response
integer x = 494
integer y = 40
integer width = 1147
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_sflogin_response
integer x = 59
integer y = 60
integer width = 338
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SF URL:"
boolean focusrectangle = false
end type

type cb_help from commandbutton within w_sflogin_response
integer x = 50
integer y = 540
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;String ls_message
ls_message = &
"Please use your Salesforce user name and password.~r~n~r~n" + &
"To obtain the Security Token, please log into your Salesforce website and get it from: My Settings -> Personal -> Reset My Security Token.~r~n~r~n" +&
"When SalesForce URL is empty, the production soap link will be used by default. Users can enter SalesForce sandbox link, ~r~n" + &
"for example: ttps://test.salesforce.com/services/Soap/c/38.0/0DFe00000004E4A"

//"Contractlogix is not going to save the information you input here. You will be prompted for the information again when you reopen the Import Painter."

Messagebox('Tips',ls_message)
end event

type sle_3 from singlelineedit within w_sflogin_response
integer x = 494
integer y = 388
integer width = 1147
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_sflogin_response
integer x = 59
integer y = 400
integer width = 425
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SF Security Token:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_sflogin_response
integer x = 1307
integer y = 540
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;close( parent )
end event

type cb_1 from commandbutton within w_sflogin_response
integer x = 933
integer y = 540
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Login"
boolean default = true
end type

event clicked;string				ls_Result, ls_sfuser, ls_sfpwd, ls_Token,ls_pwd, ls_sfurl
Integer			li_Pos,ll_cnt
n_cst_webapi    ln_api
n_cst_string		ln_string
boolean lb_valid = false //Added By Jay Chen 10-14-2014					

ls_sfpwd = sle_2.Text
ls_sfuser = sle_1.Text
ls_Token = trim(sle_3.Text)
ls_sfurl	= trim( sle_sfurl.Text )
if( isnull( ls_sfpwd ) or trim( ls_sfpwd ) = "" ) or isnull( ls_sfuser ) or trim( ls_sfuser ) = ""  or isnull( ls_Token ) or trim( ls_Token ) = '' Then
	MessageBox( 'tips', 'Please input user or password,token!' )
	Return
End If

If IsNull( ls_sfurl ) Then ls_sfurl = ''
ls_sfuser = trim( ls_sfuser )
ls_pwd = ls_sfpwd 
ls_sfpwd = ls_sfpwd + ls_Token
ls_Result = ln_api.of_get_salesforce_objects( ls_sfuser, ls_sfpwd, "", ls_sfurl)//Modified by gavins 20161223

If Len( ls_Result  ) > 0 Then
	istr_res.s_user = ls_sfuser
	istr_res.s_pwd = ls_sfpwd
	istr_res.s_sfurl = ls_sfurl
	li_Pos = pos( lower( ls_Result ), '"metadata":')
	
	If li_Pos > 0 then
		ls_Result = mid( ls_Result, li_pos + 11 )
		ls_Result = mid( ls_Result, 2, len( ls_Result ) - 3 )
		ls_Result = ln_string.of_globalreplace( ls_Result, "\t", "~t")
		ls_Result = ln_string.of_globalreplace( ls_Result, "\r", "~r")	
		
		istr_res.s_result = ls_Result
		lb_valid = true
	Else
		lb_valid = false
		return
	End If
Else
	lb_valid = false
	Return
End If

//Added By Jay Chen 10-14-2014
if lb_valid then
	select count(*) into :ll_cnt from security_user_salesforce where salesforce_user = :ls_sfuser;
	if isnull(ll_cnt) then ll_cnt = 0
	if ll_cnt = 0 then
		insert into security_user_salesforce(salesforce_user,salesforce_pwd,salesforce_token,update_by,update_date, salesforceurl )
		values(:ls_sfuser,:ls_pwd,:ls_Token,:gs_user_id,getdate(), :ls_sfurl);
	else
		update security_user_salesforce
		set salesforce_pwd = :ls_pwd,
			 salesforce_token = :ls_Token,
			 update_by = :gs_user_id,
			 update_date = getdate(),
			 salesforceurl =:ls_sfurl
		where salesforce_user = :ls_sfuser;
	end if
end if
//end

closewithreturn( parent, istr_res )
end event

type st_2 from statictext within w_sflogin_response
integer x = 59
integer y = 284
integer width = 306
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SF Password:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_sflogin_response
integer x = 59
integer y = 180
integer width = 338
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "SF User Name:"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_sflogin_response
integer x = 494
integer y = 272
integer width = 1147
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_sflogin_response
integer x = 494
integer y = 156
integer width = 1147
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

