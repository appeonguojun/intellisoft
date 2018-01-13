$PBExportHeader$n_cst_message.sru
forward
global type n_cst_message from nonvisualobject
end type
end forward

global type n_cst_message from nonvisualobject
end type
global n_cst_message n_cst_message

type variables
n_cst_datastore ids_xmlmessage
end variables

forward prototypes
public subroutine of_get_messagexml ()
public function integer of_get_error_message (string as_msg_id, string as_msg_replace, string as_repl1, string as_repl2, string as_repl3)
public function string of_get_error_message (long al_msg_id)
end prototypes

public subroutine of_get_messagexml ();String 	xml_path
Long 		ll_ret, ll_row

n_appeon_download lnv_download

IF appeongetclienttype() = 'WEB' THEN
	xml_path = gs_dir_path + gs_DefDirName + "\messages.txt"
	
	n_cst_update_helpmessage lnvo_helpmessage
	lnvo_helpmessage = Create n_cst_update_helpmessage
	lnvo_helpmessage.of_update_message()
	Destroy lnvo_helpmessage
	
ELSE
	//xml_path = Gs_Current_Directory + "\messages.txt"
	
	//Begin added by Scofield on 2009-03-23
	if Right(Gs_Current_Directory,1) <> "\" then
		xml_path = Gs_Current_Directory + "\messages.txt"
	else
		xml_path = Gs_Current_Directory + "messages.txt"
	end if
	//End added by Scofield on 2009-03-23
END IF

IF FileExists(xml_path) THEN
	ids_xmlmessage.ImportFile(xml_path)
	
	ll_row = ids_xmlmessage.insertrow(0)
	ids_xmlmessage.SetItem(ll_row, 'msgid','error_code_1001')
	ids_xmlmessage.SetItem(ll_row, 'msgtitle','Email Send')
	ids_xmlmessage.SetItem(ll_row, 'msgicon','Information')
	ids_xmlmessage.SetItem(ll_row, 'msgrepresentation','Email Send Test is failed!')
	ids_xmlmessage.SetItem(ll_row, 'msgtext',"Please open Windows Task Manager and look for the WINWORD.exe process and right click on that entry and click End Process. Then try again.	")
	ids_xmlmessage.SetItem(ll_row, 'msgcause',"Failed to create HTML file.")
	ids_xmlmessage.SetItem(ll_row, 'msgbutton','OK')
	ids_xmlmessage.SetItem(ll_row, 'msgdefaultbutton','1')	
	
ELSEIF AppeonGetClientType() = 'PB' THEN
	MessageBox("Error","The file " + xml_path +' does not exist')
END IF

end subroutine

public function integer of_get_error_message (string as_msg_id, string as_msg_replace, string as_repl1, string as_repl2, string as_repl3);//Popup the Error Message.

Long ll_nbr, ll_foundrow


u_cst_message_struct u_message
Long ll_pos

//Added By Ken.Guo 2010-11-25.
If Not gb_ShowEmailErrorMessage Then Return 0

//Added By Ken.Guo 07/03/2013
If as_msg_replace = 'ALL' Then
	u_message.msgbutton = 'OK'
	u_message.msgdefaultbutton = 1
	u_message.msgicon = 'Information'
	u_message.msgid = as_msg_id
	u_message.msgtext = 'Failed to send email. '+ as_repl1
	u_message.msgtitle = 'Email Error'
	u_message.msgfind='0'
	OpenWithParm(w_cust_normal_message,u_message)
	Return 1
End If


ll_nbr = ids_xmlmessage.RowCount()
//Added By Ken.Guo 2010-11-12.
If ll_nbr = 0 Then
	This.of_get_messagexml( )
End If

ll_nbr = ids_xmlmessage.RowCount()

IF ll_nbr > 0 THEN
	
	ll_foundrow = ids_xmlmessage.Find("msgid = '" + as_msg_id + "'", 1, ll_nbr)
	IF ll_foundrow > 0 THEN
		u_message.msgfind='1'
		u_message.msgbutton = ids_xmlmessage.Object.msgbutton[ll_foundrow]
		u_message.msgdefaultbutton = ids_xmlmessage.Object.msgdefaultbutton[ll_foundrow]
		u_message.msgicon = ids_xmlmessage.Object.msgicon[ll_foundrow]
		u_message.msgid = ids_xmlmessage.Object.msgid[ll_foundrow]
		u_message.msgtext = ids_xmlmessage.Object.msgtext[ll_foundrow]
		
		IF as_msg_replace <> '' THEN
			ll_pos = Pos(u_message.msgtext,as_msg_replace)
			IF ll_pos > 0 THEN
				u_message.msgtext = Replace(u_message.msgtext,ll_pos,4,as_repl1)
			END IF
		END IF
		u_message.msgtitle = ids_xmlmessage.Object.msgtitle[ll_foundrow]
		
		u_message.msgcause = ids_xmlmessage.Object.msgcause[ll_foundrow]
		IF as_msg_replace <> '' THEN
			ll_pos = Pos(u_message.msgcause,as_msg_replace)
			IF ll_pos > 0 THEN
				u_message.msgcause = Replace(u_message.msgcause,ll_pos,4,as_repl2)
			END IF
		END IF
		
		u_message.msgrepresentation = ids_xmlmessage.Object.msgrepresentation[ll_foundrow]
		IF as_msg_replace <> '' THEN
			ll_pos = Pos(u_message.msgrepresentation,as_msg_replace)
			IF ll_pos > 0 THEN
				u_message.msgrepresentation = Replace(u_message.msgrepresentation,ll_pos,4,as_repl3)
			END IF
		END IF
		OpenWithParm(w_cust_error_message,u_message)
	ELSE
		u_message.msgbutton = 'OK'
		u_message.msgdefaultbutton = 1
		u_message.msgicon = 'Information'
		u_message.msgid = as_msg_id
		If gnv_data.of_getitem( 'icred_settings', 'use_web_email', False) <> '1' Then //added by gavins 20140528
			u_message.msgtext = 'The message id " '+String(as_msg_id)+'" is not  define!'+'~r~n'+&
				'please contact developer!'
		Else
			u_message.msgtext = 'The message id is " '+String(as_msg_id)+'", for more information  see web service logs.' + '~r~n' + &
			'(system->utilities->application runtime log)'
		End If
		u_message.msgtitle = 'Application'
		u_message.msgfind='0'
		OpenWithParm(w_cust_normal_message,u_message)
	END IF
END IF

RETURN 1


end function

public function string of_get_error_message (long al_msg_id);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_messageof_get_error_message()
// $<arguments>
//		value	long	al_msg_id		
// $<returns> string
// $<description>
// $<description> Get Message Error Cause for Email Audit.
//////////////////////////////////////////////////////////////////////
// $<add> 2010-11-12 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Long ll_cnt, ll_foundrow
String ls_msg_id, ls_msg
n_cst_easymail_smtp lnv_mail
If ids_xmlmessage.RowCount() = 0 Then
	This.of_get_messagexml( )
End If

ll_cnt = ids_xmlmessage.RowCount()
ls_msg_id = 'error_code_' + String(al_msg_id)

ll_foundrow = ids_xmlmessage.Find("msgid = '" + ls_msg_id + "'", 1, ll_cnt)
IF ll_foundrow > 0 THEN
	If al_msg_id > 1000 Then
		Return 'Error code is ' +String(al_msg_id) +'. ' + ids_xmlmessage.GetItemString(ll_foundrow,'msgcause') + ' ' + ids_xmlmessage.GetItemString(ll_foundrow,'msgtext')
	Else
		Return 'Error code is ' +String(al_msg_id) +'. ' + ids_xmlmessage.GetItemString(ll_foundrow,'msgcause')
	End If
Else
	//Added By Ken.Guo 12/12/2013
	ls_msg = lnv_mail.of_getemailerror( al_msg_id ) 
	If ls_msg <> '' Then
		Return 'Error code is ' +String(al_msg_id) +'. ' + ls_msg 
	End If
End If
		
Return ''		
end function

on n_cst_message.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_message.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_xmlmessage = Create n_cst_datastore
ids_xmlmessage.DataObject = 'd_cst_messages'
ids_xmlmessage.SetTransObject(SQLCA)
end event

event destructor;If isvalid(ids_xmlmessage) Then Destroy  ids_xmlmessage
end event

