$PBExportHeader$w_clause_email_setting.srw
$PBExportComments$Email Painter of work flow for add data
forward
global type w_clause_email_setting from w_popup
end type
type cb_preview from commandbutton within w_clause_email_setting
end type
type sle_subject from singlelineedit within w_clause_email_setting
end type
type cbx_group_email from checkbox within w_clause_email_setting
end type
type cb_resize from commandbutton within w_clause_email_setting
end type
type cb_field from commandbutton within w_clause_email_setting
end type
type cb_cancel from commandbutton within w_clause_email_setting
end type
type cb_save from commandbutton within w_clause_email_setting
end type
type dw_email from u_dw within w_clause_email_setting
end type
type gb_2 from groupbox within w_clause_email_setting
end type
type ole_message from u_email_edit within w_clause_email_setting
end type
type gb_1 from groupbox within w_clause_email_setting
end type
end forward

global type w_clause_email_setting from w_popup
integer width = 3858
integer height = 2676
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_nclbuttondblclk pbm_nclbuttondblclk
cb_preview cb_preview
sle_subject sle_subject
cbx_group_email cbx_group_email
cb_resize cb_resize
cb_field cb_field
cb_cancel cb_cancel
cb_save cb_save
dw_email dw_email
gb_2 gb_2
ole_message ole_message
gb_1 gb_1
end type
global w_clause_email_setting w_clause_email_setting

type variables
n_cst_filesrv in_FileSrv	//used for blob/file

String is_edit_type	//Add Copy Edit

String is_FileName	//include the path
Boolean ib_delete_attach = False	//Is delete a attachment?

DataStore	ids_EmailAttach		//Added by Scofield on 2009-02-20

//Added By Ken 08/18/2011. 
String is_mail_subject_org 
Boolean ib_body_changed = False, ib_subject_changed = False

CONSTANT INTEGER wdActiveEndPageNumber = 3
CONSTANT INTEGER wdFirstCharacterLineNumber = 10
CONSTANT INTEGER wdFirstCharacterColumnNumber = 9
CONSTANT INTEGER wdPropertyKeywords = 4  
Constant long wdFieldMergeField = 59 
Constant long wdFieldDocVariable=64 

n_cst_string inv_string
end variables

forward prototypes
public function string of_findrquired (datawindow adw_data)
public subroutine of_refresh_export (string as_module)
public subroutine of_getemailmessage (long al_email_id, ref blob ablb_message)
public subroutine of_getemailattachment (long al_email_id, long al_attach_id, ref blob ablb_attachment)
public function string of_getfilename (string as_pathname)
public subroutine of_add_merge_field (string as_merge_field, string as_type)
public subroutine of_update_alarms (long al_email_id)
public subroutine of_preview ()
public subroutine of_update_email_list (string as_column_name, string as_old_email_list, str_alarm_user astr_alarm_user)
end prototypes

event ue_nclbuttondblclk;if This.Windowstate = Maximized! then
	This.Windowstate = Normal!
else
	This.Windowstate = Maximized!
end if

return 1

end event

public function string of_findrquired (datawindow adw_data);long ll_row = 1

integer colnbr = 0

string colname, ls_text


DO WHILE ll_row <> 0

        colnbr++ // Continue searching at next column
        // If there's an error, exit
        IF adw_data.FindRequired(Primary!, &
            ll_row, colnbr, &
            colname, FALSE) < 0 THEN EXIT
        // If a row was found, save the row and column
        IF ll_row <> 0 THEN
            ls_text = ls_text + colname + "~r~n" //+ String(ll_row) + "~t" &
                
			END IF
LOOP
RETURN ls_text
end function

public subroutine of_refresh_export (string as_module);string ls_module
long	 ll_modules[]
DataWindowChild ldwc_child

Choose Case as_module
	Case '01','02'
		ll_modules[1] = 1
		ll_modules[2] = 2
	Case '03','04'
		ll_modules[1] = 3
		ll_modules[2] = 4
	Case else
		ll_modules[1] = 0
End Choose

dw_email.GetChild('export_id' , ldwc_child)
ldwc_child.settransobject( SQLCA)
ldwc_child.retrieve( ll_modules )
ldwc_child.insertrow( 1 )
end subroutine

public subroutine of_getemailmessage (long al_email_id, ref blob ablb_message);long	ll_DataLen,ll_Cycle,ll_Count,ll_Start
Blob	lb_Temp

long READ_ONE_LENGTH = 8000

SELECT Datalength(Email_Message)
  INTO :ll_DataLen
  FROM ctx_clause_email
 WHERE ctx_clause_email.email_id = :al_EMail_Id;

if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_LENGTH then
	ll_Count = Ceiling(ll_DataLen/READ_ONE_LENGTH)
	
	for ll_Cycle = 1 To ll_Count
		ll_Start = (ll_Cycle - 1) * READ_ONE_LENGTH + 1
		SELECTBLOB SubString(Email_Message,:ll_Start,:READ_ONE_LENGTH)
		      INTO :lb_Temp
		      FROM ctx_clause_email
		     WHERE ctx_clause_email.email_id = :al_EMail_Id;
		
		ablb_Message += lb_Temp
	next
else
	SELECTBLOB Email_Message
	      INTO :ablb_Message
	      FROM ctx_clause_email
	     WHERE ctx_clause_email.email_id = :al_EMail_Id;
end if

end subroutine

public subroutine of_getemailattachment (long al_email_id, long al_attach_id, ref blob ablb_attachment);//====================================================================
// Function: of_GetEmailAttachment()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    	long	al_Email_id
// 	reference	blob	ablb_Attachment
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-02-18
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long	ll_DataLen,ll_Cycle,ll_Count,ll_Start
Blob	lb_Temp

long READ_ONE_LENGTH = 8000

SELECT Datalength(Attachment)
  INTO :ll_DataLen
  FROM wf_email_attachment
 WHERE email_id = :al_EMail_Id AND attach_id = :al_attach_id;

if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_LENGTH then
	ll_Count = Ceiling(ll_DataLen/READ_ONE_LENGTH)
	
	for ll_Cycle = 1 To ll_Count
		ll_Start = (ll_Cycle - 1) * READ_ONE_LENGTH + 1
		SELECTBLOB SubString(Attachment,:ll_Start,:READ_ONE_LENGTH)
		      INTO :lb_Temp
		      FROM wf_email_attachment
		     WHERE email_id = :al_EMail_Id AND attach_id = :al_attach_id;
		
		ablb_Attachment += lb_Temp
	next
else
	SELECTBLOB Attachment
	      INTO :ablb_Attachment
	      FROM wf_email_attachment
	     WHERE email_id = :al_EMail_Id AND attach_id = :al_attach_id;
end if

end subroutine

public function string of_getfilename (string as_pathname);long	ll_Pos,ll_LastPos

as_PathName = Trim(as_PathName)

ll_Pos = Pos(as_PathName,"\")
do while ll_Pos > 0
	ll_LastPos = ll_Pos
	ll_Pos = Pos(as_PathName,"\",ll_Pos + 1)
loop

Return Trim(Mid(as_PathName,ll_LastPos + 1))

end function

public subroutine of_add_merge_field (string as_merge_field, string as_type);//Jervis 09.09.2009
//Add as_type - Insert Subject/Body

If not len(as_merge_field) > 0 Then return

if as_type = 'body' then
	//--------Begin Modified by Alfee 11.23.2007---------
	//<$Reason>Replaced the email edit control with Word OCX
	IF ole_message.Object.Doctype <> 1 THEN RETURN
	
	ole_message.Object.ActiveDocument.ActiveWindow.Selection.TypeText("$<" + as_merge_field + ">$ ")
	//dw_email.replacetext("$<"+as_merge_field+">$")
	//--------End Modified --------------------------------
else
	
	sle_subject.ReplaceText("$<"+as_merge_field+">$")
	dw_email.SetItem(dw_email.GetRow(),'subject',sle_subject.text)
end if
end subroutine

public subroutine of_update_alarms (long al_email_id);//Add by jervis -- 11.25.2009

long ll_return
long ll_alarm
long ll_ai_alarm
long ll_am_ai_alarm
long ll_templates
long ll_all_notification

gnv_appeondb.of_startqueue( )
select count(*) into :ll_alarm from ctx_notification,ctx_basic_info,wf_email
where	ctx_basic_info.ctx_id = ctx_notification.ctx_id and
		( ctx_notification.alm_enabled = '1' ) AND  
        ( ctx_basic_info.is_template = 0 ) and 
        (alm_total_tries_counter < alm_total_tries or alm_total_tries_counter is null) and
		alm_email_template_id = email_id	 and email_id = :al_email_id;

select count(*) into :ll_ai_alarm from ctx_ai_notification,ctx_basic_info,wf_email
where	ctx_basic_info.ctx_id = ctx_ai_notification.ctx_id and
		( ctx_ai_notification.alm_enabled = '1' ) AND  
        ( ctx_basic_info.is_template = 0 ) and 
        (alm_total_tries_counter < alm_total_tries or alm_total_tries_counter is null) and
		alm_email_template_id = email_id	 and email_id = :al_email_id;

select count(*) into :ll_am_ai_alarm from ctx_am_ai_notification,wf_email
where	( ctx_am_ai_notification.alm_enabled = '1' ) AND  
        (alm_total_tries_counter < alm_total_tries or alm_total_tries_counter is null) and
		alm_email_template_id = email_id	 and email_id = :al_email_id;

//Added By Ken.Guo 2011-04-27.
select count(*) into :ll_templates	from wf_email,ctx_notification_templates
		where	( ctx_notification_templates.alm_enabled = '1' ) AND  
				alm_email_template_id = email_id		 and email_id = :al_email_id;	

//Added By Jay Chen 07-28-2014
select count(*) into :ll_all_notification	from wf_email,ctx_all_notification
		where	( ctx_all_notification.alm_enabled = '1' ) AND  
				alm_email_template_id = email_id		 and email_id = :al_email_id;
		
gnv_appeondb.of_commitqueue( )

if ll_alarm + ll_ai_alarm + ll_am_ai_alarm + ll_templates + ll_all_notification > 0 then
	ll_return = Messagebox("Save","You have " +string(ll_alarm + ll_ai_alarm + ll_am_ai_alarm + ll_templates)+" active date alarms that have this Email Template associated with it." + &
					"~r~nWould you like to update these alarms to reflect the changes made to this email template?",Question!,YesNo!,2)
	if ll_return = 1 then
		gnv_appeondb.of_startqueue( )
		update ctx_notification set alm_message_blob = email_message, alm_subject = subject
		from ctx_basic_info,wf_email
		where	ctx_basic_info.ctx_id = ctx_notification.ctx_id and
				( ctx_notification.alm_enabled = '1' ) AND  
				( ctx_basic_info.is_template = 0 ) and 
				(alm_total_tries_counter < alm_total_tries or alm_total_tries_counter is null) and
				alm_email_template_id = email_id		 and email_id = :al_email_id;
		
		update ctx_ai_notification set alm_message_blob = email_message , alm_subject = subject
		from ctx_basic_info,wf_email
		where	ctx_basic_info.ctx_id = ctx_ai_notification.ctx_id and
				( ctx_ai_notification.alm_enabled = '1' ) AND  
				  ( ctx_basic_info.is_template = 0 ) and 
				  (alm_total_tries_counter < alm_total_tries or alm_total_tries_counter is null) and
				alm_email_template_id = email_id	 and email_id = :al_email_id;
		
		update ctx_am_ai_notification set alm_message_blob = email_message , alm_subject = subject
		from wf_email
		where	( ctx_am_ai_notification.alm_enabled = '1' ) AND  
				  (alm_total_tries_counter < alm_total_tries or alm_total_tries_counter is null) and
				alm_email_template_id = email_id	 and email_id = :al_email_id;
				
		//Update the email alarms templete - jervis 08.10.2010
		update ctx_notification_templates set alm_message_blob = email_message
		from wf_email
		where	( ctx_notification_templates.alm_enabled = '1' ) AND  
				alm_email_template_id = email_id		 and email_id = :al_email_id;
		
		//Added By Jay Chen 07-28-2014 update ctx_all_notification
		update ctx_all_notification set alm_message_blob = email_message
		from wf_email
		where ( ctx_all_notification.alm_enabled = '1' ) AND  
				alm_email_template_id = email_id		 and email_id = :al_email_id;
		commit;
		gnv_appeondb.of_commitqueue( )
	end if
end if
		


end subroutine

public subroutine of_preview ();//merge
long							ll_email_id, ll_export_id, ll_cnt, i , ll_ctx_id, ll_flag, ll_color_gray 
string							ls_auto_sign, ls_subject, ls_file
blob 							lblb_MsgData, lblb_newdata
str_doc_info					lstr_docinfo
str_email 					lstr_email
DataStore					lds_export
n_cst_ctx_mail				lnv_ctx_mail
n_cst_word_utility 			lnv_word


//readonly set 
ll_color_gray = Long(dw_email.Describe('attach_name.Background.Color'))
dw_email.Modify("DataWindow.ReadOnly=Yes export_id.Background.Color='"+String(ll_color_gray) + "' " +  "export_id.Color='"+String(ll_color_gray)+"' Module.Background.Color='"+String(ll_color_gray) + "' email_name.Background.Color='"+String(ll_color_gray) + "'  ")
sle_subject.backcolor = ll_color_gray

sle_subject.displayonly = true  
cb_field.enabled = false 
cb_save.enabled = false

if dw_email.rowcount( ) <=0 then return 

ll_export_id = dw_email.GetItemNumber( dw_email.getrow(), "export_id")
ls_auto_sign = dw_email.GetItemString( dw_email.getrow(), "auto_sign")
ls_subject = dw_email.GetItemString( dw_email.getrow(), "subject")
ll_email_id  = dw_email.GetItemNumber( dw_email.getrow(), "email_id")
ll_ctx_id	= Long(Mid(is_edit_type,Pos(is_edit_type, ":") + 1,  LastPos(is_edit_type, ":") - Pos(is_edit_type, ":") - 1  ))

Select flag
Into :ll_flag 
From security_user_mailsetting Where user_id = :gs_user_id Using Sqlca;

if not isvalid(w_appeon_gifofwait)  then	Open(w_appeon_gifofwait)			
Timer(0, w_appeon_gifofwait)
w_appeon_gifofwait.of_SetPosition(0)
w_appeon_gifofwait.of_SetMinPosition(0)
//w_appeon_gifofwait.of_SetMaxPosition(ll_count  * 10)  
w_appeon_gifofwait.of_setstep(10)

// Retrieve clause reference count
w_appeon_gifofwait.of_SetText("Getting Email Data, Please wait...")
IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()	

//get template email content
lnv_ctx_mail.of_get_mail_template(ll_email_id,lblb_MsgData,lstr_email)

//	lnv_ctx_mail.of_get_mail_template_attachment(ll_email_id, ls_attchname)
//	gnv_string.of_arraytostring( ls_attchname, ',', ls_attach_file)
//	ls_attachfilename = gnv_string.of_get_file_name(ls_attach_file,',')
	
IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("Retrieve Email Data, Please wait...")
IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()	
//Set message with the email template and signature
ole_message.of_close( )
if  not isnull(ls_auto_sign) and ls_auto_sign = 'Y' and not isnull(ll_Flag) and  ll_Flag = 1 then
	ole_message.of_Open(gs_user_id)
	ole_message.of_insertfilefirst(lblb_MsgData)
else
	ole_message.of_Open(lblb_MsgData)
end if

IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("Merge Email, Please wait...")
IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()	

if isnull(ll_export_id) or ll_export_id =0 then 
	ole_message.object.activedocument.saved = False
	if isvalid(w_appeon_gifofwait)  then	close(w_appeon_gifofwait)	
	return 
end if 

lnv_word = Create n_cst_word_utility
lnv_word.il_doc_id = 0
lds_export = Create DataStore
ll_cnt = lnv_word.of_replace_export_word(ole_message.Object.ActiveDocument,ls_subject,ll_ctx_id, ll_export_id, lds_export, true)	

IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()		
ole_message.object.activedocument.saved = False
//lnv_word.of_preview(ole_message.Object.ActiveDocument, false)

//ls_file = gs_dir_path + gs_DefDirName + "\Email\_email_meger_data"+string(ll_email_id)+".doc"
//gnv_rights.of_check_dir_right(ls_file, true, 'Word Save')
//
//if  FileExists(ls_file) then 
//	 FileDelete ( ls_file )
//end if  

//IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.of_SetText("3. Sending Email, Please wait...")	 
//IF isvalid(w_appeon_gifofwait) THEN w_appeon_gifofwait.hpb_1.Stepit()		
//ole_message.of_getblob( lblb_newdata)	
//ole_message.of_writefile( ls_file,lblb_newdata)	 
//gnv_shell.of_delete_recent( ls_file, true) // Delete Windows Recent Document.			

IF IsValid(lds_export) THEN Destroy lds_export
IF IsValid(lnv_word) THEN Destroy lnv_word	
if isvalid(w_appeon_gifofwait)  then	close(w_appeon_gifofwait)		

//dw_email.setitem(dw_email.getrow(), "subject", ls_subject)			
sle_subject.text = ls_subject
is_mail_subject_org = ls_subject
end subroutine

public subroutine of_update_email_list (string as_column_name, string as_old_email_list, str_alarm_user astr_alarm_user);//====================================================================
// Function: of_update_email_list
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string            as_column_name
// 	value    string            as_old_email_list
// 	value    str_alarm_user    astr_alarm_user
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 08-31-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Long i,j,ll_row,ll_find
String ls_arr_old[],ls_arr_new[],ls_new_userlist,ls_mailto
String ls_new_email_list
string	ls_currentAppointmentuser[] , ls_newAppointmentuser[], ls_appointment_list, ls_appointment
string ls_email


If isnull(as_old_email_list) Then as_old_email_list = ''
If isnull(astr_alarm_user.s_to_list ) Then 
	ls_new_email_list = ''
Else
	ls_new_email_list = astr_alarm_user.s_to_list 
End If

inv_string.of_parsetoarray( as_old_email_list, ';', ls_arr_old[] ) 
inv_string.of_parsetoarray( ls_new_email_list, ';', ls_arr_new[] )

ls_mailto = as_old_email_list

//If ls_new_email_list = '' Then Return

FOR i = 1 to UpperBound(ls_arr_new[]) 
//	FOR j = 1 to UpperBound(ls_arr_old[])
//		IF Upper(Trim(ls_arr_new[i])) = Upper(Trim(ls_arr_old[j])) THEN EXIT	
//	NEXT
//	//Skip the duplicated user
//	IF j <= UpperBound(ls_arr_old) THEN CONTINUE
	//Keep the user in new user list
	IF Len(ls_new_userlist) < 1 THEN
		ls_new_userlist = ls_arr_new[i]
	ELSE
		ls_new_userlist += ';' + ls_arr_new[i]
	END IF
NEXT
//Add them to current user list	
//IF Len(ls_new_userlist) > 0 THEN 
	IF Len(Trim(ls_mailto)) > 0 And	Right(Trim(ls_mailto),1) <> ';' THEN ls_mailto = Righttrim(ls_mailto) + ';'
	ls_mailto = ls_mailto + ls_new_userlist
//	dw_email.SetItem(1, as_column_name, ls_mailto)
	dw_email.SetItem(1, as_column_name, ls_new_userlist)
//END IF


Return 
end subroutine

on w_clause_email_setting.create
int iCurrent
call super::create
this.cb_preview=create cb_preview
this.sle_subject=create sle_subject
this.cbx_group_email=create cbx_group_email
this.cb_resize=create cb_resize
this.cb_field=create cb_field
this.cb_cancel=create cb_cancel
this.cb_save=create cb_save
this.dw_email=create dw_email
this.gb_2=create gb_2
this.ole_message=create ole_message
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_preview
this.Control[iCurrent+2]=this.sle_subject
this.Control[iCurrent+3]=this.cbx_group_email
this.Control[iCurrent+4]=this.cb_resize
this.Control[iCurrent+5]=this.cb_field
this.Control[iCurrent+6]=this.cb_cancel
this.Control[iCurrent+7]=this.cb_save
this.Control[iCurrent+8]=this.dw_email
this.Control[iCurrent+9]=this.gb_2
this.Control[iCurrent+10]=this.ole_message
this.Control[iCurrent+11]=this.gb_1
end on

on w_clause_email_setting.destroy
call super::destroy
destroy(this.cb_preview)
destroy(this.sle_subject)
destroy(this.cbx_group_email)
destroy(this.cb_resize)
destroy(this.cb_field)
destroy(this.cb_cancel)
destroy(this.cb_save)
destroy(this.dw_email)
destroy(this.gb_2)
destroy(this.ole_message)
destroy(this.gb_1)
end on

event open;call super::open;Long 		ll_Row,ll_EMailId
String 	ls_module,ls_Null
Blob		lblb_Message
string ls_subject,ls_email_name
Long ll_color_gray
SetNull(ls_Null)

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2009-02-19 By: Scofield
//$<Reason> Create file service object according to the OS.

//in_FileSrv = Create pfc_n_cst_filesrv
f_SetFileSrv(in_FileSrv,true)

//---------------------------- APPEON END ----------------------------

ids_EmailAttach = Create DataStore		//Added by Scofield on 2009-02-19

//Select top 1 email_id INTO :ll_EMailId FROM ctx_clause_email;
ll_EMailId = 1
dw_email.SetTransObject(Sqlca)
dw_email.Retrieve(ll_EMailId)
if dw_email.rowcount() > 0 then
	is_edit_type = 'edit'
	of_GetEMailMessage(ll_EMailId,lblb_Message)
	ole_Message.of_Open(lblb_Message)
else
	is_edit_type = 'new'
	dw_email.InsertRow(0)
	dw_email.setitem(dw_email.getrow(), "subject", "[Folder Name] - [Category] - [Clause Name] - [User] - [check in or out]")
	ole_Message.of_Open()
	ole_message.object.activedocument.saved = False
end if









end event

event close;call super::close;ole_Message.of_Close()

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2009-02-19 By: Scofield
//$<Reason> Destroy the useless object.

Destroy ids_EmailAttach

//IF IsValid(in_FileSrv) THEN DESTROY in_FileSrv
f_SetFileSrv(in_FileSrv,false)

//---------------------------- APPEON END ----------------------------

end event

event pfc_preopen;call super::pfc_preopen;

this.of_setresize(true)

this.inv_resize.of_SetOrigSize(this.WorkSpaceWidth(), this.WorkSpaceHeight())
//this.inv_resize.of_setminsize( w_mdi.WorkSpaceWidth(),w_mdi.WorkSpaceHeight())
this.inv_resize.of_SetMinSize(this.WorkSpaceWidth(), this.WorkSpaceHeight())

this.inv_resize.of_Register(gb_2, this.inv_resize.SCALERIGHT)
this.inv_resize.of_Register(gb_1, this.inv_resize.SCALERIGHTBOTTOM)
this.inv_resize.of_Register(ole_message, this.inv_resize.SCALERIGHTBOTTOM)
this.inv_resize.of_Register(cb_resize, this.inv_resize.FIXEDBOTTOM)
this.inv_resize.of_Register(cbx_group_email, this.inv_resize.FIXEDBOTTOM) //Added By Ken.Guo 2010-08-16.

this.inv_resize.of_Register(dw_email, this.inv_resize.SCALERIGHT)
//this.inv_resize.of_Register(sle_subject,this.inv_resize.SCALERIGHT)
this.inv_resize.of_Register(cb_cancel, this.inv_resize.FIXEDRIGHTBOTTOM)
this.inv_resize.of_Register(cb_save, this.inv_resize.FIXEDRIGHTBOTTOM)
this.inv_resize.of_Register(cb_preview, this.inv_resize.FIXEDRIGHTBOTTOM)
this.inv_resize.of_Register(cb_field, this.inv_resize.FIXEDRIGHTBOTTOM)


end event

event closequery;//Override

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 2007-08-21 By: Evan
//$<Reason> Not prompt save data when no data change.
boolean lb_ShowPrompt = false

dw_email.AcceptText()
if dw_email.GetItemStatus(1, "subject", Primary!) = DataModified! then lb_ShowPrompt = true
if dw_email.GetItemStatus(1, "email_to", Primary!) = DataModified! then lb_ShowPrompt = true
if dw_email.GetItemStatus(1, "email_cc", Primary!) = DataModified! then lb_ShowPrompt = true
if dw_email.GetItemStatus(1, "email_enable", Primary!) = DataModified! then lb_ShowPrompt = true
if dw_email.GetItemStatus(1, "auto_sign", Primary!) = DataModified! then lb_ShowPrompt = true
if lb_ShowPrompt then
	if MessageBox("Save data", "Close without saving changes?", Question!, YesNo!) = 2 then
		Return 1
	end if
end if
//---------------------------- APPEON END ----------------------------
end event

event resize;call super::resize;if SizeType = 0 then
	cb_resize.text = '&Maximized'
elseif SizeType = 2 then
	cb_resize.text = '&Normal'
end if

end event

event activate;call super::activate;//Added By Ken.Guo 2011-11-30. Workaround Office OCX's bug
If isvalid(ole_message ) Then
	ole_message.object.activate(true)
End If
end event

type cb_preview from commandbutton within w_clause_email_setting
integer x = 2793
integer y = 2472
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Preview"
end type

event clicked;str_alarm_email lstr_alarm_email

lstr_alarm_email.as_to = dw_email.GetItemString(1, "email_to")
lstr_alarm_email.as_subject = dw_email.GetItemString(1, "subject")
lstr_alarm_email.aole_message = ole_message.object
lstr_alarm_email.as_sign =   dw_email.GetItemString(1, "auto_sign")

OpenWithParm(w_ctx_alarm_preview, lstr_alarm_email)


end event

type sle_subject from singlelineedit within w_clause_email_setting
boolean visible = false
integer x = 2789
integer y = 500
integer width = 165
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean border = false
end type

type cbx_group_email from checkbox within w_clause_email_setting
boolean visible = false
integer x = 398
integer y = 2472
integer height = 92
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Set as Group Email Alarm Template"
end type

type cb_resize from commandbutton within w_clause_email_setting
integer x = 18
integer y = 2472
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Maximized"
end type

event clicked;if parent.windowstate = maximized! then
	parent.windowstate = normal!
else
	parent.windowstate = maximized!
end if

end event

type cb_field from commandbutton within w_clause_email_setting
boolean visible = false
integer x = 2793
integer y = 2472
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Insert Field"
end type

event clicked;long		ll_row,ll_export_id
string	ls_merge_field
str_pass lstr_pass

ll_row = dw_email.getrow()
if ll_row < 1 then return

//Modified By Ken.Guo 2010-08-12
If dw_email.GetItemString(dw_email.GetRow(),'module') <> '05' Then
	ll_export_id = dw_email.getitemnumber(ll_row,"export_id")
	if IsNull(ll_export_id) then 
		MessageBox("ContractLogix Group","There is no export selected.  Please select first.")
		return
	end if
	
	lstr_pass.s_long[1] = ll_export_id
Else
	lstr_pass.s_long[1] = -999 //Group Email Alarm
End If

//EMAIL to EMAIL-PAINTER -- jervis 09.09.2009
lstr_pass.s_string = "EMAIL-PAINTER"	
lstr_pass.s_string_array[1] = 'body'	

OpenWithParm(w_agreement_template_merge_fields,lstr_pass)
//---------------------------- APPEON END ----------------------------

w_agreement_template_merge_fields.of_set_parent(parent)
//ls_merge_field = message.stringparm
//
//If not len(ls_merge_field) > 0 Then 
//	return
//End If
//
//dw_email.replacetext("$<"+ls_merge_field+">$")
end event

type cb_cancel from commandbutton within w_clause_email_setting
integer x = 3488
integer y = 2472
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(Parent)

end event

type cb_save from commandbutton within w_clause_email_setting
integer x = 3141
integer y = 2472
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;Long 		ll_Rtn, ll_Max_ID, ll_Email_id
String 	ls_email_name, ls_Module, ls_subject
Blob 		lblb_data[],lblb_Attach[]

long		ll_Cycle,ll_RowCnts,ll_OldAttachID,ll_NewAttachID,ll_Pos
String	ls_AttachName,ls_PathName,ls_AttachList,ls_text //Added By Ken.Guo 2010-08-12.
Long ll_end,ll_begin
Boolean lb_found
oleobject aole_word
CONSTANT STRING SEMICOLON = ";"
String ls_matchwildcards
string ls_emailto
dw_email.AcceptText( )

ls_emailto = trim(dw_email.getitemstring(dw_email.getrow(), "email_to"))

IF IsNull(ls_emailto) OR ls_emailto = "" THEN
	MessageBox(gnv_app.iapp_object.DisplayName, "To users can not be empty!")
	dw_email.SetColumn("email_to")
	dw_email.SetFocus()
	RETURN -1
END IF

////Added By Ken.Guo 2010-08-12. for Group Email
//If ls_Module = '05' Then
//	//Check Subject
//	If Pos(ls_subject,'$<') > 0 and Pos(ls_subject,'<$') > 0 Then
//		Messagebox(gnv_app.iapp_object.DisplayName,"Subject doesn't support inserted field for the Group Email Alarm Module.")
//		Return -1
//	End If
//	
//	//Check Body
//	IF ole_message.Object.Doctype = 1 THEN 
//		ole_message.Setredraw(False)
//		aole_word = ole_message.Object.ActiveDocument
//		ls_matchwildcards = "\$\<*\>\$" 
//		aole_word.Content.Select()
//		lb_found =  aole_word.ActiveWindow.Selection.Find.Execute(ls_matchwildcards, false, true, true, false, false, true, 0, false, "", 0 ) 
//		Do While lb_found
//			ls_text = aole_word.ActiveWindow.Selection.Text 
//			ll_begin = aole_word.ActiveWindow.Selection.End
//			If ls_text = '$<Alarm List>$' Then
//				ll_end = aole_word.Content.End
//				IF ll_end > ll_begin THEN
//					aole_word.Range(ll_begin, ll_end).Select()			
//					lb_found = aole_word.ActiveWindow.Selection.Find.Execute(ls_matchwildcards, false, true, true, false, false, true, 0, false, "", 0)			
//				ELSE
//					lb_found = FALSE
//				END IF
//			Else
//				ole_message.Setredraw(True)
//				Messagebox(gnv_app.iapp_object.DisplayName,'For Group Email Alarm Module, it doesn~'t support any other fileds in the message except $<Alarm List>$ field .')
//				Return -1
//			End If
//		Loop
//		aole_word.ActiveWindow.Selection.End = aole_word.ActiveWindow.Selection.Start
//		ole_message.Setredraw(True)
//	End If
//End If


//Set max ID
IF lower(is_edit_type) = "new" THEN
//	Select IsNull(Max(email_id)+1, 1) INTO :ll_Max_ID FROM ctx_clause_email;
	ll_Max_ID = 1
	dw_email.SetItem(dw_email.GetRow(), "Email_id", ll_Max_ID)
END IF

ll_Rtn = parent.event pfc_save()

if ll_Rtn < 0 then return -1

//Add,Edit
ll_Email_id = dw_email.GetItemNumber(dw_email.GetRow(), "Email_id")

if not ole_message.object.activedocument.saved then	//Add by jervis  -- 11 25.2009
	ib_body_changed = True
	ole_Message.of_GetBlob(lblb_data[1])
	UPDATEBLOB ctx_clause_email SET email_message = :lblb_data[1] WHERE email_id = :ll_Email_id;
	IF Sqlca.SqlCode = 0 THEN
		COMMIT USING SQLCA;
		ole_message.object.activedocument.saved = true
	ELSE
		Messagebox('Error','Failed to save email message.' + Sqlca.sqlerrtext)
		ROLLBACK USING SQLCA;
		Return -5
	END IF
end if

end event

type dw_email from u_dw within w_clause_email_setting
integer x = 55
integer y = 64
integer width = 3762
integer height = 560
integer taborder = 10
string title = "none"
string dataobject = "d_clause_email_setting"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event buttonclicked;str_alarm_user	lstr_alarm
String ls_columnname, ls_email_list,ls_email_list_temp,ls_email_arr[],ls_email_column
n_cst_string lnv_string
long ll_row

if row < 1 then return
ls_columnname = dwo.name
dw_email.AcceptText()

Choose Case ls_columnname
	Case 'b_sendto'
		ls_email_column = 'email_to'
	Case 'b_sendcc'
		ls_email_column = 'email_cc'
End Choose


Choose Case ls_columnname
	Case 'b_sendto','b_sendcc'
		lstr_alarm.s_flag = 'Y' 
		ls_email_list = This.GetItemString(row,ls_email_column)
		lnv_string.of_parsetoarray( ls_email_list, ';', ls_email_arr[])
		lnv_string.of_arraytostring( ls_email_arr[], ';', ls_email_list_temp)
		lstr_alarm.s_to_list = ls_email_list_temp
		Openwithparm(w_clause_email_users,lstr_alarm)

		lstr_alarm = message.PowerObjectParm
		if isvalid(lstr_alarm) then
			of_update_email_list(ls_email_column,ls_email_list,lstr_alarm)
		end if		
End Choose




end event

event rbuttondown;call super::rbuttondown;////--------------------------- APPEON BEGIN ---------------------------
////$<add> 2006-11-10 By: Liu Hongxin
////$<reason> delete the attachment
//IF Row < 1 THEN RETURN -1
//IF dwo.name = "attach_name" THEN
//	Long	 ll_Email_id
//	String ls_attach_name
//	ls_attach_name = GetItemString(Row, "attach_name")
//	IF ls_attach_name <> "" AND Not IsNull(ls_attach_name) THEN
//		IF MessageBox(gnv_app.iapp_object.DisplayName, "Are you sure you want to delete the attachment?", Question!, YesNo!) = 1 THEN
//			ll_Email_id = GetItemNumber(Row, "Email_id")
//			
//			SetItem(Row, "attach_name", "")
//			/*
//			gnv_appeondb.of_StartQueue()
//			Update wf_email
//			Set Attachment = Null,
//				 attach_name = Null
//			Where Email_id = :ll_Email_id;
//			
//			Commit;
//			gnv_appeondb.of_CommitQueue()
//			*/
//			ib_delete_attach = true
//			//IF cb_save.Enabled = False THEN cb_save.Enabled = True
//		END IF
//	END IF
//END IF
////---------------------------- APPEON END ----------------------------
//
end event

event doubleclicked;////--------------------------- APPEON BEGIN ---------------------------
////$<add> 2006-11-10 By: Liu Hongxin
////$<reason> View Attachment
//Long 		ll_Email_Id,ll_AttachID,ll_Cycle,ll_RowCnts
//String 	ls_FileName,ls_Null,ls_AttachName
//BLOB 		lblb_Attach[]
//
//if  Left(is_edit_type, 7) = "Preview" then  return 						//Added By Mark Lee 04/28/2015
//	
//IF dwo.Name = "attach_name" THEN
//	ll_Email_Id = this.GetItemNumber(Row, "Email_id")
//	if IsNull(ll_Email_Id) or ll_Email_Id = 0 then Return
//	
//	ls_FileName = this.GetItemString(Row, "Attach_name")
//	if Len(ls_FileName) < 1 or IsNull(ls_FileName) then Return
//	
//	SetNull(ls_Null)
//	
//	//--------------------------- APPEON BEGIN ---------------------------
//	//$<Modify> 2009-02-20 By: Scofield
//	//$<Reason> Open multi-attachment.
//	
//	ids_EmailAttach.DataObject = "d_Email_Attach"
//	ids_EmailAttach.SetTransObject(SQLCA)
//	ids_EmailAttach.Retrieve(ll_Email_Id)
//	
//	ll_RowCnts = ids_EmailAttach.RowCount()
//	for ll_Cycle = 1 to ll_RowCnts
//		ls_AttachName = ids_EmailAttach.GetItemString(ll_Cycle,"attach_name")
//		ll_AttachID = ids_EmailAttach.GetItemNumber(ll_Cycle,"attach_id")
//		
//		of_GetEmailAttachment(ll_Email_id,ll_AttachID,lblb_Attach[UpperBound(lblb_Attach) + 1])
//		
//		if Len(lblb_Attach[UpperBound(lblb_Attach)]) > 0 then
//			ls_FileName = gs_dir_path + gs_DefDirName + "\" + ls_AttachName
//			in_FileSrv.of_FileWrite(ls_FileName, lblb_Attach[UpperBound(lblb_Attach)],false)
//		
//			if Right(Lower(ls_FileName),5)='.html' or Right(Lower(ls_FileName),4)='.htm' Then
//				 ShellExecuteA(Handle(this),"open",'IEXPLORE',ls_FileName,ls_Null,4)
//			else				
//				 ShellExecuteA(Handle(this),"open",ls_FileName,ls_Null,ls_Null,4)
//			end if
//		end if
//	next
//	
//	/*
//	SELECT Datalength(wf_email.Attachment)
//	  INTO :ll_DataLen
//	  FROM wf_email
//	 WHERE wf_email.email_id = :ll_EMail_Id;
//	
//	if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_LENGTH then
//		ll_Count = Ceiling(ll_DataLen/READ_ONE_LENGTH)
//		
//		for ll_Cycle = 1 To ll_Count
//			ll_Start = (ll_Cycle - 1) * READ_ONE_LENGTH + 1
//			SELECTBLOB SubString(Attachment,:ll_Start,:READ_ONE_LENGTH)
//					INTO :lb_Temp
//					FROM wf_email
//				  WHERE wf_email.email_id = :ll_EMail_Id;
//			
//			lblb_data += lb_Temp
//		next
//	else
//		SELECTBLOB Attachment
//				INTO :lblb_data
//				FROM wf_email
//			  WHERE wf_email.email_id = :ll_EMail_Id;
//	end if
//	
//	IF SQLCA.SQLCODE = -1 THEN
//		MessageBox( gnv_app.iapp_object.DisplayName, SQLCA.SQLERRTEXT )
//		Return -1
//	END IF
//	
//	ll_FileLen = Len( lblb_data )
//	
//	// Check blob data
//	IF ll_FileLen = 0 OR Isnull(lblb_data) THEN
//		RETURN -2
//	END IF
//	
//	ls_FileName = gs_dir_path + gs_DefDirName + "\" + ls_FileName
//	in_FileSrv.of_FileWrite(ls_FileName, lblb_data, FALSE)
//
//	If right(lower(ls_FileName),5)='.html' or right(lower(ls_FileName),4)='.htm' Then
//		 ll_FileLen = ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_FileName , ls_Null, 4)
//	else				
//		 ll_FileLen = ShellExecuteA ( Handle( This ), "open", ls_FileName , ls_Null, ls_Null, 4)
//	end if
//END IF
////---------------------------- APPEON END ----------------------------
//*/
//end if
////---------------------------- APPEON END ----------------------------
//
end event

event losefocus;call super::losefocus;this.AcceptText()
end event

event itemerror;call super::itemerror;RETURN 1
end event

event itemchanged;call super::itemchanged;//Long ll_color_gray,ll_color_white
//
//Choose Case dwo.name
//	Case 'module'
//		If data = '05' Then
//			cb_field.enabled = true
//			ll_color_gray = Long(This.Describe('attach_name.Background.Color'))
//			cbx_group_email.visible = True			
//			This.Modify("export_id.Protect = '1' " + "export_id.Background.Color='"+String(ll_color_gray) + "' " +  "export_id.Color='"+String(ll_color_gray)+"'"  )
//		Else
//			ll_color_white = Long(This.Describe('module.Background.Color'))
//			This.Modify("export_id.Protect = '0' " + "export_id.Background.Color='"+String(ll_color_white) + "' " + "export_id.Color='0'"  ) 
//			cbx_group_email.visible = False
//			of_refresh_export(data)
//		End If
//	case "export_id" //Start Code Change ----10.29.2008 #V85 maha
//		if integer(data) > 0 then
//			cb_field.enabled = true
//		end if
//		
//End Choose
//
////IF cb_save.Enabled = False THEN cb_save.Enabled = True
end event

event constructor;call super::constructor;dw_email.of_setresize(true)
//dw_email.inv_resize.of_setorigsize( dw_email.width,dw_email.height)
//dw_email.inv_resize.of_SetMinSize( dw_email.width,dw_email.height)
//for ll_i = 1 to ll_count
//	dw_email.inv_resize.of_register(ls_array[ll_i],dw_email.inv_resize.SCALE)
//next
//dw_email.inv_resize.of_register("datawindow.detail",dw_email.inv_resize.FIXEDBOTTOM)
//
//
// Args - PercentageX, PercentageY, PercentageWidth, PercentageHeight
inv_resize.of_Register('subject', 0, 0, 100, 0)
inv_resize.of_Register('subject_t', 0, 0, 0, 0)
inv_resize.of_Register('auto_sign', 100, 0, 0, 0)
inv_resize.of_Register('gb_1', 0,0,100,0)
inv_resize.of_Register('email_to', 0, 0, 100, 0)
inv_resize.of_Register('email_cc', 0, 0, 100, 0)
inv_resize.of_Register('b_sendto', 0, 0, 0, 0)
inv_resize.of_Register('b_sendcc', 0, 0, 0, 0)

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 15/05/2007 By: Jervis
//$<reason> 
/*
if gb_contract_version then
	this.Modify("module.values = 'Contract->Parent Level	03/Contract->Document Manager	04/'")
end if
*/
//integer li_product
//integer li_contract_set
//string ls_ddlb
//li_product = of_get_app_setting('set_9', 'I')
//li_contract_set = of_get_app_setting('set_cont', 'I')
//
//choose case li_product
//	case 0
//		ls_ddlb = "IntelliCred	01/"
//		if li_contract_set = 1 then
//			ls_ddlb += "Contract->Parent Level	03/Contract->Document Manager	04/"
//		end if
//	case 1
//		ls_ddlb = "IntelliApp	02/"
//		if li_contract_set = 1 then
//			ls_ddlb += "Contract->Parent Level	03/Contract->Document Manager	04/"
//		end if
//	case 2	//IntelliCred SE
//		ls_ddlb = "IntelliCred	01/"
//	case 3
//		ls_ddlb = "IntelliCred	01/IntelliApp	02/"
//		if li_contract_set = 1 then
//			ls_ddlb += "Contract->Parent Level	03/Contract->Document Manager	04/"
//		end if
//	case 4 //Contract
//		ls_ddlb = "Contract->Parent Level	03/Contract->Document Manager	04/Group Email Alarm	05/"
//end choose
//
//this.Modify("module.values = '" + ls_ddlb + "'")	

//---------------------------- APPEON END ----------------------------

//---------------------------- APPEON END ----------------------------



end event

event rbuttonup;//UnExtend Ancestor Script
//Modify by Ken at 2007-05-31 for show rightbutton menu.
end event

event pfc_preupdate;call super::pfc_preupdate;//this.SetItem( this.Getrow(),"subject",sle_subject.text )
return SUCCESS
//
end event

type gb_2 from groupbox within w_clause_email_setting
integer x = 18
integer y = 8
integer width = 3813
integer height = 640
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Basic Information"
end type

type ole_message from u_email_edit within w_clause_email_setting
integer x = 55
integer y = 736
integer width = 3739
integer height = 1668
integer taborder = 30
string binarykey = "w_clause_email_setting.win"
end type

event onwordwpsselchange;call super::onwordwpsselchange;if isvalid(w_agreement_template_merge_fields) then
	w_agreement_template_merge_fields.rb_body.checked = true
end if
end event

type gb_1 from groupbox within w_clause_email_setting
integer x = 18
integer y = 672
integer width = 3813
integer height = 1764
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Message"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Ew_clause_email_setting.bin 
2500000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000096e9765001d0e47a00000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b1300000000096e9765001d0e47a96e9765001d0e47a0000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd0000548b00002b198000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234abcd0000548b00002b198000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Ew_clause_email_setting.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
