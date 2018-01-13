$PBExportHeader$n_iresult.sru
forward
global type n_iresult from internetresult
end type
end forward

global type n_iresult from internetresult
end type
global n_iresult n_iresult

type variables

string is_result
string errorcode
string errormessage

boolean ib_show_msg = true //Added By Jay Chen 04-23-2014
end variables

forward prototypes
public function integer internetdata (blob data)
end prototypes

public function integer internetdata (blob data);is_result = string(data,EncodingUTF8!)
int li_find = 0, li_lenstr
string ls_result = ""
string ls_statuscode = "0"
string ls_findt , ls_findt2, ls_findt3, ls_findt4
string ls_message
long ll_findt , ll_finde , ll_findend
n_cst_string		ln_cst_string

ls_findt = 'error code:'
ls_findt3='errorcode:'
ls_findt2 = 'error:'
ls_findt4 = '"errorcode":'

ls_result = lower(is_result)
ll_findt = pos(ls_result,ls_findt)
li_lenstr = len( ls_findt  )
if ll_findt = 0 then
	ll_findt = pos( ls_result, ls_findt2 )
	li_lenstr = len( ls_findt2 )
End If
if ll_findt = 0 then
	ll_findt = pos( ls_result, ls_findt3 )
	li_lenstr = len( ls_findt3 )
end if
if ll_findt = 0 then
	ll_findt = pos( ls_result, ls_findt4 )
	li_lenstr = len( ls_findt4 )
end if
if ll_findt > 0 then
	ll_findt = ll_findt + li_lenstr
	ll_finde = pos(ls_result,'","',ll_findt + 1)
	If ll_finde =0 Then ll_finde = pos(ls_result,' ',ll_findt + 1)
	if ll_finde > 0 then
		ls_statuscode = mid(ls_result,ll_findt,ll_finde - ll_findt)
		If left( ls_statuscode, 1 ) = '"' then ls_statuscode = trim(mid( ls_statuscode, 2 ) )
		ls_message = mid(is_result,ll_finde,len(is_result) - ll_finde)
		ls_message = ln_cst_string.of_globalreplace(ls_message,'"','')  	
		If Left( trim( ls_Message) ,1) = ',' then ls_message = mid( ls_message, 2 )
	else
		ls_message = " "
		ls_statuscode = "0"
	end if
end if

//Added By Harry 2017-02-03
If Isvalid (w_dm_echosign_request) Then
	If w_dm_echosign_request.ib_auto_ref_token and Pos(Lower(ls_result), 'the remote server returned an error: (401) unauthorized') > 0 Then
		Return -8
	End If
End If

If Isvalid (w_dm_sertifi_status) Then
	If w_dm_sertifi_status.ib_auto_ref_token and Pos(Lower(ls_result), 'the remote server returned an error: (401) unauthorized') > 0 Then
		Return -8
	End If
End If
//End Added
	errorcode = ""
	errormessage=""
//Added By Jay Chen 04-23-2014
string ls_errtext
if isvalid(w_email_account_edit) then 
	ib_show_msg = w_email_account_edit.ib_show_sendmsg
end if
//end 
//added by gavins 20150305
If Lower( is_Result ) = 'the resource you are looking for has been removed, had its name changed, or is temporarily unavailable.' Then
	ls_message = is_Result
	ls_statuscode = '-1'
End If
		
		
if not  (ls_statuscode = "0" or trim(ls_statuscode) = ""  or isnull( ls_statuscode ) ) then
	errorcode = ls_statuscode
	
	is_result = ln_cst_string.of_globalreplace(is_result,'\r\n','~r~n')  	
	//errormessage = ls_message
	If Len( errormessage ) > 0 Then
		if ib_show_msg then //Added By Jay Chen 04-22-2014
			MessageBox('Web Error', "Error Code: -1," + errormessage )
		end if
		ls_errtext = 'Web Error. ' + "Error Code: -1," + errormessage
	Else
		if ib_show_msg then //Added By Jay Chen 04-22-2014
			MessageBox('Web Error', "Error Code: -1," + is_result )
		end if
		ls_errtext = 'Web Error. ' + "Error Code: -1," + is_result
	End If
	
end if

If Pos( is_result, '<div id="header"><h1>Server Error</h1></div>') > 0 Then
	errorcode = "-1"
	errormessage = "Web Service Error."
	if ib_show_msg then //Added By Jay Chen 04-22-2014
		MessageBox('Web Error', "Error Code: -1, Status Code: " + ls_statuscode + ", "  + errormessage )
	end if
	ls_errtext = 'Web Error. ' + "Error Code: -1, Status Code: " + ls_statuscode + ", "  + errormessage
End If

If pos( Lower(is_Result), Lower('<title>The page cannot be displayed</title>'))>0 Then
	errorcode = "-1"
	errormessage = "The page cannot be displayed,Service may be stopped."
	if ib_show_msg then //Added By Jay Chen 04-22-2014
		MessageBox('Web Error', "Error Code: -1, Status Code: 403, "  + errormessage )
	end if
	ls_errtext = 'Web Error. ' + "Error Code: -1, Status Code: 403, "  + errormessage
End If

If pos( Lower(is_Result), Lower('an unhandled exception was generated'))>0 Then
	errorcode = "-1"
	errormessage = "The page cannot be displayed,Value does not fall within the expected range."
	if ib_show_msg then //Added By Jay Chen 04-22-2014
		MessageBox('Web Error', "Error Code: -1,"  + errormessage )
	end if
	ls_errtext = 'Web Error. ' + "Error Code: -1,"  + errormessage
End If

//Added By Jay Chen 04-22-2014
if isvalid(w_email_account_edit) then
	w_email_account_edit.is_test_send_errtext = ls_errtext
end if


//messagebox("inet", is_result)
return 0
end function

on n_iresult.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_iresult.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

