$PBExportHeader$w_ctx_alarm_preview.srw
forward
global type w_ctx_alarm_preview from w_response
end type
type st_1 from statictext within w_ctx_alarm_preview
end type
type cb_close from u_cb within w_ctx_alarm_preview
end type
type ole_message from u_email_edit within w_ctx_alarm_preview
end type
end forward

global type w_ctx_alarm_preview from w_response
integer width = 3502
integer height = 2120
string title = "Email Preview"
boolean minbox = true
windowtype windowtype = popup!
st_1 st_1
cb_close cb_close
ole_message ole_message
end type
global w_ctx_alarm_preview w_ctx_alarm_preview

type variables
str_alarm_email  istr_alarm_email 
String is_sender
Long il_export_id
end variables

forward prototypes
public subroutine of_insert_signature (string as_userid)
public subroutine of_preview_data ()
end prototypes

public subroutine of_insert_signature (string as_userid);//Insert Signature
Long ll_DataLen,ll_Count,ll_Cycle,ll_Start
long 		READ_ONE_LENGTH = 8000
Blob lb_Temp,lblb_Signature
If istr_alarm_email.as_sign = 'Y' Then
	SELECT Datalength(security_user_mailsetting.signature)
	  INTO :ll_DataLen
	  FROM security_user_mailsetting
	 WHERE security_user_mailsetting.user_id = :as_userid AND flag = 1;
	
	If isnull(ll_DataLen) or ll_DataLen = 0 Then Return
	
	// Get signature from user ID
	if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_LENGTH then
		ll_Count = Ceiling(ll_DataLen/READ_ONE_LENGTH)
		
		for ll_Cycle = 1 To ll_Count
			ll_Start = (ll_Cycle - 1) * READ_ONE_LENGTH + 1
			SELECTBLOB SubString(signature,:ll_Start,:READ_ONE_LENGTH)
					INTO :lb_Temp
					FROM security_user_mailsetting
				  WHERE security_user_mailsetting.user_id = :as_userid AND flag = 1;
			
			lblb_Signature += lb_Temp
		next
	else
		SELECTBLOB signature
				INTO :lblb_Signature
				FROM security_user_mailsetting
			  WHERE security_user_mailsetting.user_id = :as_userid AND flag = 1;
	end if
	
	// Send email
	if Len(lblb_Signature) > 0 then
		// Merge signature
		ole_message.of_InsertFileLast(lblb_Signature)
	end if
end if	

end subroutine

public subroutine of_preview_data ();String ls_sender_email
String ls_subject
Integer li_ret
boolean lb_original

//Added By Jay Chen 07-28-2014
if isvalid(w_ctx_alarm) then
	lb_original = w_ctx_alarm.ole_message.object.activedocument.saved
end if

ole_message.of_open()
ole_Message.Object.Data = istr_alarm_email.aole_message.Data //Added By Ken.Guo 10/15/2012

//Get Sender Email Address
SELECT email  INTO :ls_sender_email From em_smtp_accounts Where user_id = :is_sender and is_default = 'Y';

//Add Email Header
//ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = 1
//ole_message.object.ActiveDocument.ActiveWindow.Selection.End = 1
ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter('From: ' )
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = True
ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter(ls_sender_email)
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = False

ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter('~r~nTo: ' )
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = True
ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter( istr_alarm_email.as_to  )
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = False

ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter('~r~nSubject: ' )
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = True
ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter( istr_alarm_email.as_subject )
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = False

If istr_alarm_email.as_attach <> '' Then
	ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
	ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter('~r~nAttachment: ' )
	ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = True
	ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
	ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter( istr_alarm_email.as_attach  )
	ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = False
End If

ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = ole_message.object.ActiveDocument.ActiveWindow.Selection.End
ole_message.object.ActiveDocument.ActiveWindow.Selection.InsertAfter('~r~n~r~n' )
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Bold = False

ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = 2
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Font.Name =  'MS Sans Serif' //'Tahoma'//

ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = 0
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Font.Color = 0 //Blank
ole_message.object.ActiveDocument.ActiveWindow.Selection.Range.Font.Size = 10

ole_message.object.ActiveDocument.ActiveWindow.Selection.End = ole_message.object.ActiveDocument.ActiveWindow.Selection.Start

//ole_message.object.ActiveDocument.Content.InsertBefore('~r~n')
//ole_message.object.ActiveDocument.ActiveWindow.Selection.Start = 0
//ole_message.object.ActiveDocument.ActiveWindow.Selection.End = ole_message.object.ActiveDocument.ActiveWindow.Selection.Start

ole_message.object.ActiveDocument.ActiveWindow.View.Type = 6 //wdWebView
ole_message.object.ActiveDocument.ActiveWindow.DocumentMap = False

//Added By Ken.Guo 10/11/2011. 
ole_message.object.ActiveDocument.ActiveWindow.View.Zoom.Percentage = 100

//Add Signature
If istr_alarm_email.as_sign = 'Y' Then
	of_insert_signature(is_sender)
End If

//Merge Data
n_cst_word_utility lnv_word
If il_export_id > 0 Then
	lnv_word = Create n_cst_word_utility
	li_ret = lnv_word.of_replace_export_word(ole_message.Object.ActiveDocument , ls_subject, istr_alarm_email.ctx_id , il_export_id)
	Destroy lnv_word
End If

//Added By Jay Chen 07-28-2014
if isvalid(w_ctx_alarm) then
	w_ctx_alarm.ole_message.object.activedocument.saved = lb_original
end if
end subroutine

on w_ctx_alarm_preview.create
int iCurrent
call super::create
this.st_1=create st_1
this.cb_close=create cb_close
this.ole_message=create ole_message
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.ole_message
end on

on w_ctx_alarm_preview.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.ole_message)
end on

event pfc_preopen;call super::pfc_preopen;istr_alarm_email = Message.Powerobjectparm

If isnull(istr_alarm_email.as_attach) Then istr_alarm_email.as_attach = ''
If isnull(istr_alarm_email.as_sign ) Then istr_alarm_email.as_sign = 'N'
If isnull(istr_alarm_email.as_to ) Then istr_alarm_email.as_to = ''
If isnull(istr_alarm_email.as_subject  ) Then istr_alarm_email.as_subject = ''

end event

event open;call super::open;String ls_owner

//Get Info
gnv_appeondb.of_startqueue( )
SELECT ctx_contacts.user_d INTO :ls_owner FROM ctx_contract_contacts,ctx_contacts,app_facility
WHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )
	AND (ctx_contacts.facility_id = app_facility.facility_id)
	AND ( ctx_contract_contacts.ctx_id = :istr_alarm_email.ctx_id  )
	AND ctx_contract_contacts.owner = 'Y'
	AND ctx_contract_contacts.ic_area = 'I';
//Select top 1 set_addresser Into :is_sender From icred_settings;				//Modified By Mark Lee 01/09/2014
Select export_id into :il_export_id from wf_email where email_id = :istr_alarm_email.al_template_id;
gnv_appeondb.of_commitqueue( )

//Added By Mark Lee 01/09/2014
If  gnv_data.of_getItem("icred_settings", "set_56", False) <> '1' then
	is_sender = gnv_data.of_getItem("icred_settings", "set_addresser", False)
else
	is_sender = ''
end if 

If IsNull(is_sender) or Trim(is_sender) = "" Then
	is_sender = ls_owner
End If










end event

event pfc_postopen;call super::pfc_postopen;st_1.visible = True
ole_message.Setredraw( False)
of_preview_data()
ole_message.Setredraw( True)
st_1.visible = False
end event

event activate;call super::activate;//Added By Ken.Guo 2011-11-30. Workaround Office OCX's bug
If isvalid(ole_message ) Then
	ole_message.object.activate(true)
End If
end event

event close;call super::close;//Added By Ken.Guo 2016-05-23. workaround Task 524
If ole_message.object.doctype > 0 Then 
	ole_message.object.ActiveDocument.Saved = True 
	ole_message.object.close()
End If

end event

type st_1 from statictext within w_ctx_alarm_preview
boolean visible = false
integer x = 46
integer y = 1928
integer width = 859
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
string text = "Loading Email..."
boolean focusrectangle = false
end type

type cb_close from u_cb within w_ctx_alarm_preview
integer x = 3081
integer y = 1904
integer width = 343
integer taborder = 20
string text = "&Close"
end type

event clicked;call super::clicked;Close(Parent)
end event

type ole_message from u_email_edit within w_ctx_alarm_preview
integer x = 18
integer y = 16
integer width = 3433
integer height = 1868
integer taborder = 10
string binarykey = "w_ctx_alarm_preview.win"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
09w_ctx_alarm_preview.bin 
2B00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff00000001000000000000000000000000000000000000000000000000000000000db1650001d1b56c00000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b130000000000db1650001d1b56c0db1650001d1b56c0000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
24ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd00004d9e000030448000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000e6d30000ba9200f6000000e3000000000000000000010000000000001234abcd00004d9e000030448000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000003600390030003200300034000000330000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff00000000000000010000d0d40000000000c800000000000000000000000000000000000000000000000000000000000000000000000000000000e6d30000ba9200f6000000e300000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000000000000000000000000000000000006f0000006a0062006300650020007400700061005f006f006f00630074006e006f0072005b006c002c005d0072002000660065007000200077006f007200650062006f0065006a0074006300610020006f00700070005f006e0065006900640067006e005d005b00290020002000200065007200750074006e007200200073006e006900650074006500670000007200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19w_ctx_alarm_preview.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
