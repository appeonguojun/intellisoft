$PBExportHeader$w_request_form_email_setting.srw
forward
global type w_request_form_email_setting from w_popup
end type
type st_4 from statictext within w_request_form_email_setting
end type
type st_3 from statictext within w_request_form_email_setting
end type
type st_2 from statictext within w_request_form_email_setting
end type
type st_1 from statictext within w_request_form_email_setting
end type
type dw_1 from u_dw within w_request_form_email_setting
end type
type cb_ok from commandbutton within w_request_form_email_setting
end type
type cb_cancel from commandbutton within w_request_form_email_setting
end type
end forward

global type w_request_form_email_setting from w_popup
integer x = 214
integer y = 221
integer width = 3118
integer height = 900
string title = "Email Sending Settings "
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
dw_1 dw_1
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_request_form_email_setting w_request_form_email_setting

type variables
long			il_row
boolean		ibln_update =false
end variables

forward prototypes
public function boolean of_doc_field_checked (long al_template_id)
end prototypes

public function boolean of_doc_field_checked (long al_template_id);//====================================================================
// Function: of_doc_field_checked
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long    al_template_id
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 03/18/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
Boolean					lbn_return = false,		lb_found
long						ll_export_id
blob						lblb_message
n_cst_ctx_mail			lnv_ctx_mail
str_email					lstr_email
w_ole_word				lw_ole_word
string						ls_text,	ls_download_file

if isnull(al_template_id) or al_template_id <= 0 then 
	return lbn_return
end if 

setpointer(HourGlass!)
lnv_ctx_mail.of_get_mail_template( al_template_id, lblb_message, lstr_email)
//ll_export_id = lstr_email.export_id

IF Not isvalid(lw_ole_word) Then 
	Open(lw_ole_word)
	lw_ole_word.event activate( )
End IF 
	
lw_ole_word.ole_1.of_Close()	
lw_ole_word.ole_1.of_Open(lblb_message)
	
//	IF lw_ole_word.ole_1.Object.Doctype <> 1 THEN 
////		return lbn_return
//	end if 

lw_ole_word.ole_1.Object.ActiveDocument.Content.Select()
lb_found = lw_ole_word.ole_1.Object.ActiveDocument.ActiveWindow.Selection.Find.Execute("\$\<*\>\$" , false, true, true, false, false, true, 0, false, "", 0 )
if lb_found or match(lstr_email.subject,"\$\<.*\>\$") then 
//		ls_text =  lw_ole_word.ole_1.Object.ActiveDocument.ActiveWindow.Selection.Text 		
//		ls_download_file = gs_dir_path + gs_DefDirName + "\Request\temp_"+string(al_template_id)+".doc"
//		if  FileExists(ls_download_file) then 
//			 FileDelete ( ls_download_file )
//		end if 
//		lw_ole_word.ole_1.of_getblob( lblb_message)	
//		lw_ole_word.ole_1.of_writefile( ls_download_file,lblb_message)	 
//		gnv_shell.of_delete_recent( ls_download_file, true) // Delete Windows Recent Document.		
//	ls_text = "The email template in the first setting is not supported because it contains fields in its subject or body. Please select an email teamplate without any fields."
	lbn_return = true
end if 
	
If Isvalid(lw_ole_word) Then 
	lw_ole_word.ole_1.of_close( ) 	
	Close(lw_ole_word)		
end if 

setpointer(Arrow!)
return lbn_return
end function

on w_request_form_email_setting.create
int iCurrent
call super::create
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.cb_ok
this.Control[iCurrent+7]=this.cb_cancel
end on

on w_request_form_email_setting.destroy
call super::destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;call super::open;DataWindowChild			ldwc_owner_email_id, 	ldwc_approve_email_id	,	ldwc_reject_email_id

il_row = Message.doubleparm

if isnull(il_row ) or il_row <= 0 or not isvalid(w_request_form) then
	this.event close( )
elseif il_row > 0 then 
	dw_1.reset( )
	
	dw_1.GetChild( "owner_email_id", ldwc_owner_email_id)
	ldwc_owner_email_id.settransobject( sqlca)
	ldwc_owner_email_id.retrieve( )		

	dw_1.GetChild( "approve_email_id", ldwc_approve_email_id)
	ldwc_approve_email_id.settransobject( sqlca)
	dw_1.GetChild( "reject_email_id", ldwc_reject_email_id)
	ldwc_reject_email_id.settransobject( sqlca)

	if ldwc_owner_email_id.rowcount( ) > 0 then
		ldwc_owner_email_id.rowscopy( 1, ldwc_owner_email_id.rowcount( ), Primary!, ldwc_approve_email_id, 1, Primary!)
		ldwc_owner_email_id.rowscopy( 1, ldwc_owner_email_id.rowcount( ), Primary!, ldwc_reject_email_id, 1, Primary!)
	end if 
	
	w_request_form.dw_request_form.rowscopy(il_row,il_row, Primary!, this.dw_1, 1 , Primary!)	
end if 

end event

type st_4 from statictext within w_request_form_email_setting
integer x = 23
integer y = 748
integer width = 1893
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "The reason is that merge field values are not available before the request is approved."
boolean focusrectangle = false
end type

type st_3 from statictext within w_request_form_email_setting
integer x = 23
integer y = 692
integer width = 1893
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "           The third setting doesn’t support email template with merge fields."
boolean focusrectangle = false
end type

type st_2 from statictext within w_request_form_email_setting
integer x = 23
integer y = 632
integer width = 1893
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "           The second setting support email template with merge fields."
boolean focusrectangle = false
end type

type st_1 from statictext within w_request_form_email_setting
integer x = 23
integer y = 572
integer width = 1893
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Notes: The first setting doesn’t support email template with merge fields."
boolean focusrectangle = false
end type

type dw_1 from u_dw within w_request_form_email_setting
integer x = 23
integer y = 24
integer width = 3063
integer height = 524
integer taborder = 10
string dataobject = "d_request_form_email_setting"
boolean vscrollbar = false
end type

event constructor;call super::constructor;this.of_SetUpdateAble(false)
end event

event itemchanged;call super::itemchanged;DataWindowChild			ldwc_owner_email_id, 	ldwc_approve_email_id	,	ldwc_cc_owner_user,	ldwc_cc_approve_user
DataWindowChild			ldwc_reject_email_id, 	ldwc_cc_reject_user
string 		ls_user, ls_parm, ls_new_name
long			ll_find, ll_email_id

if row > 0 then
	this.accepttext( )	
	Choose case dwo.name
		case "cc_approve_user"
//			this.GetChild( "cc_approve_user", ldwc_cc_owner_user)
//			ls_user = this.GetItemString(row,"cc_approve_user")
//			if not isnull(ls_user) and trim(ls_user) <> "" then 
//				ll_find = ldwc_cc_owner_user.find(" user_id ='"+ls_user+"' ", 1, ldwc_cc_owner_user.rowcount())
//				if ll_find <=0 then 
//					this.setcolumn( "cc_approve_user")
//					this.SetFocus()
//					this.setitem( row,"cc_approve_user","")
//					messagebox(gnv_app.iapp_object.DisplayName,"Please select a valid user to who the system will CC the email when the request is submitted.")	
//					return 1
//				end if 
//			end if
			
		case "cc_reject_user"
//			this.GetChild( "cc_reject_user", ldwc_cc_owner_user)
//			ls_user = this.GetItemString(row,"cc_reject_user")
//			if not isnull(ls_user) and trim(ls_user) <> "" then 
//				ll_find = ldwc_cc_owner_user.find(" user_id ='"+ls_user+"' ", 1, ldwc_cc_owner_user.rowcount())
//				if ll_find <=0 then 
//					this.setcolumn( "cc_reject_user")
//					this.SetFocus()
//					this.setitem( row,"cc_reject_user","")
//					messagebox(gnv_app.iapp_object.DisplayName,"Please select a valid user to who the system will CC the email when the request is rejected.")	
//					return 1
//				end if 
//			end if
		case "approve_email_id"

		case "owner_email_id"

		case "reject_email_id"	

	End Choose 
	ibln_update = true 
end if
end event

event buttonclicked;call super::buttonclicked;string 		ls_user, ls_parm, ls_new_name
long			ll_find, ll_email_id

if row > 0 then
	this.accepttext( )	
	Choose case dwo.name
		case "b_cc_owner_user"
			ls_parm = "multi"
			ls_user =  this.GetItemString(row,"cc_owner_user")
			if not isnull(ls_user) and trim(ls_user) <> "" then
				ls_parm = ls_parm + ";"+ls_user
			end if 
			OpenWithParm ( w_request_users, ls_parm)
			ls_new_name = message.stringparm
			if not isnull(ls_new_name)  then
				this.Setitem( row, "cc_owner_user", ls_new_name)
				ibln_update = true 
			end if 
			this.setcolumn( "cc_owner_user")
			this.setfocus( )
			this.SetColumn('cc_owner_user')
		
		case "b_cc_approve_user"
			ls_parm = "multi"
			ls_user =  this.GetItemString(row,"cc_approve_user")
			if not isnull(ls_user) and trim(ls_user) <> "" then
				ls_parm = ls_parm + ";"+ls_user
			end if 
			OpenWithParm ( w_request_users, ls_parm)
			ls_new_name = message.stringparm
			if not isnull(ls_new_name)  then
				this.Setitem( row, "cc_approve_user", ls_new_name)
				ibln_update = true 
			end if 
			this.setcolumn( "cc_approve_user")
			this.setfocus( )
			this.SetColumn('cc_approve_user')
		case "b_cc_reject_user"
			ls_parm = "multi"
			ls_user =  this.GetItemString(row,"cc_reject_user")
			if not isnull(ls_user) and trim(ls_user) <> "" then
				ls_parm = ls_parm + ";"+ls_user
			end if 
			OpenWithParm ( w_request_users, ls_parm)
			ls_new_name = message.stringparm
			if not isnull(ls_new_name)  then
				this.Setitem( row, "cc_reject_user", ls_new_name)
				ibln_update = true 
			end if 
			this.setcolumn( "cc_reject_user")
			this.setfocus( )
			this.SetColumn('cc_reject_user')
	End Choose 
end if
end event

type cb_ok from commandbutton within w_request_form_email_setting
integer x = 2368
integer y = 568
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

event clicked;string 				ls_cc_owner_user,ls_cc_approve_user,ls_cc_reject_user, ls_null, ls_message
long					ll_approve_email_id,ll_owner_email_id,ll_reject_email_id, ll_null 


if dw_1.accepttext( ) < 0 then	
//	dw_1.event pfc_accepttext( true)
//	messagebox(gnv_app.iapp_object.DisplayName, "The information entered does not pass validation and must be corrected before changes can be saved.")	
	return 
end if 

ll_approve_email_id =  dw_1.GetItemNumber(dw_1.GetRow(),"approve_email_id")
ll_owner_email_id =  dw_1.GetItemNumber(dw_1.GetRow(),"owner_email_id")
ll_reject_email_id =  dw_1.GetItemNumber(dw_1.GetRow(),"reject_email_id")
ls_cc_owner_user =  dw_1.GetItemString(dw_1.GetRow(),"cc_owner_user")
ls_cc_approve_user =  dw_1.GetItemString(dw_1.GetRow(),"cc_approve_user")
ls_cc_reject_user =  dw_1.GetItemString(dw_1.GetRow(),"cc_reject_user")

SetNull(ls_null)
SetNull(ll_null)
st_1.text = "Notes:The system is validating the email templates used in the settings above. Please wait..."
if il_row > 0 and ibln_update = true then 
	if isnull(ll_owner_email_id) or  ll_owner_email_id <=0 then 
		ll_owner_email_id = ll_null
	end if 
	w_request_form.dw_request_form.SetItem(il_row,"owner_email_id", ll_owner_email_id)
	
	if  isnull(ls_cc_owner_user) or trim(ls_cc_owner_user) = '' then 
		ls_cc_owner_user = ls_null
	end if 
	w_request_form.dw_request_form.SetItem(il_row,"cc_owner_user", ls_cc_owner_user)

	if isnull(ll_approve_email_id) or  ll_approve_email_id <=0 then 
		ll_approve_email_id = ll_null
	else
		//check document template fields
		if of_doc_field_checked(ll_approve_email_id ) then 
			st_1.text = "Notes:The settings above do not support email templates with fields except for the second setting."
			dw_1.setfocus( )
			dw_1.setcolumn("approve_email_id")
			//first
			ls_message = "The email template in the first setting is not supported because it contains fields in its subject or body."+ &
				"~r~n~r~n Please select an email teamplate without any fields."
			messagebox(gnv_app.iapp_object.DisplayName,ls_message)			
			return 
		end if		
	end if 
	w_request_form.dw_request_form.SetItem(il_row,"approve_email_id", ll_approve_email_id)
	
	if  isnull(ls_cc_approve_user) or trim(ls_cc_approve_user) = '' then 
		ls_cc_approve_user = ls_null
	end if 	
	w_request_form.dw_request_form.SetItem(il_row,"cc_approve_user", ls_cc_approve_user)
		
	if isnull(ll_reject_email_id) or  ll_reject_email_id <=0 then 
		ll_reject_email_id = ll_null
	else
		//check document template fields
		if of_doc_field_checked(ll_reject_email_id) then 
			st_1.text = "Notes:The settings above do not support email templates with fields except for the second setting."
			dw_1.setfocus( )
			dw_1.setcolumn("reject_email_id")
			//third
			ls_message = "The email template in the third setting is not supported because it contains fields in its subject or body."+ &
				"~r~n~r~n Please select an email teamplate without any fields."			
			messagebox(gnv_app.iapp_object.DisplayName,ls_message)				
			return 
		end if		
	end if 
	w_request_form.dw_request_form.SetItem(il_row,"reject_email_id", ll_reject_email_id)
		
	if  isnull(ls_cc_reject_user) or trim(ls_cc_reject_user) = '' then 
		ls_cc_reject_user = ls_null
	end if 
	w_request_form.dw_request_form.SetItem(il_row,"cc_reject_user", ls_cc_reject_user)
end if 
st_1.text = "Notes:The settings above do not support email templates with fields except for the second setting."
Parent.cb_cancel.event clicked( )
end event

type cb_cancel from commandbutton within w_request_form_email_setting
integer x = 2743
integer y = 568
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

