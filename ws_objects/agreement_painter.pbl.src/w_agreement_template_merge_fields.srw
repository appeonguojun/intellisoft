$PBExportHeader$w_agreement_template_merge_fields.srw
forward
global type w_agreement_template_merge_fields from w_popup
end type
type mle_1 from multilineedit within w_agreement_template_merge_fields
end type
type rb_body from radiobutton within w_agreement_template_merge_fields
end type
type rb_subject from radiobutton within w_agreement_template_merge_fields
end type
type cb_cancel from commandbutton within w_agreement_template_merge_fields
end type
type cb_ok from commandbutton within w_agreement_template_merge_fields
end type
type dw_1 from u_dw_contract within w_agreement_template_merge_fields
end type
end forward

global type w_agreement_template_merge_fields from w_popup
integer width = 2153
integer height = 1608
string title = "Merge Fields"
boolean maxbox = false
boolean resizable = false
boolean center = true
event ue_inidw ( )
mle_1 mle_1
rb_body rb_body
rb_subject rb_subject
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
end type
global w_agreement_template_merge_fields w_agreement_template_merge_fields

type variables
string is_msg  //action message
boolean ib_need_update //
oleobject iole_word

datawindow idw_browse

window iw_parent
n_cst_word_utility inv_word

str_pass istr_pass	//04/25/2007 By jervis
end variables

forward prototypes
public subroutine of_set_parent (window iw_parent_window)
public subroutine of_set_object (oleobject aole_word)
public subroutine of_add_version_fields ()
public subroutine of_add_urllink_fields ()
public subroutine of_add_docusign_location_fields ()
public subroutine of_add_web_fields ()
end prototypes

event ue_inidw();long ll_currentrow,ll_row
long ll_template_id,ll_category,ll_reviewed_status
integer li_export_id,li_wf_id
string ls_template_name,ls_description,ls_reviewed_by
datetime ldt_date_reviewed

if not isvalid(idw_browse) then return
ll_currentrow = idw_browse.getrow()
if ll_currentrow < 1 then return
ll_row = dw_1.insertrow(0)

choose case lower(is_msg)
	case "add"
	//
	case "edit"
		ll_template_id = idw_browse.getitemnumber(ll_currentrow,"ctx_acp_template_id")
		ll_category = idw_browse.getitemnumber(ll_currentrow,"category")
		ls_template_name = idw_browse.getitemstring(ll_currentrow,"template_name")
		li_export_id = idw_browse.getitemnumber(ll_currentrow,"export_id")
		li_wf_id = idw_browse.getitemnumber(ll_currentrow,"wf_id")
		ls_description = idw_browse.getitemstring(ll_currentrow,"description")
		ls_reviewed_by = idw_browse.getitemstring(ll_currentrow,"reviewed_by")
		ldt_date_reviewed = idw_browse.getitemdatetime(ll_currentrow,"date_reviewed")
		ll_reviewed_status = idw_browse.getitemnumber(ll_currentrow,"reviewed_status")
			
		dw_1.setitem(ll_row,"ctx_acp_template_id",ll_template_id)
		dw_1.setitem(ll_row,"category",ll_category)
		dw_1.setitem(ll_row,"template_name",ls_template_name)
		dw_1.setitem(ll_row,"export_id",li_export_id)
		dw_1.setitem(ll_row,"wf_id",li_wf_id)
		dw_1.setitem(ll_row,"description",ls_description)
		dw_1.setitem(ll_row,"reviewed_by",ls_reviewed_by)
		dw_1.setitem(ll_row,"date_reviewed",ldt_date_reviewed)
		dw_1.setitem(ll_row,"reviewed_status",ll_reviewed_status)					
	case "copy"  
		//		
				
end choose
		
		
		
end event

public subroutine of_set_parent (window iw_parent_window);iw_parent = iw_parent_window
end subroutine

public subroutine of_set_object (oleobject aole_word);iole_word = aole_word
end subroutine

public subroutine of_add_version_fields ();//02.23.2009 By Jervis
//Add Version Info Fields for document
long ll_row
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "<<Version Number>>")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "<<Version Date>>")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "<<Create By>>")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "<<Document Name>>")
end subroutine

public subroutine of_add_urllink_fields ();//====================================================================
// Function: of_add_URLlink_fields()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	(none)
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-03-05
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Appeon, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String	ls_LinkName[]
long		ll_Cycle,ll_RowCnt,ll_InsPos

ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To Detail Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To Contacts Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To Locations Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To Organizations Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To Fee Schedule Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To Fee Schedule(NM) Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To DM Document Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To DM Work_Flow Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To DM Audit Trail Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = "Web Link To Action Items Tab"
ls_LinkName[UpperBound(ls_LinkName) + 1] = 'Web Link To File Service' 						//Added by Ken.Guo on 2009-03-26
ls_LinkName[UpperBound(ls_LinkName) + 1] = 'Web Link to Contract Status'
ls_LinkName[UpperBound(ls_LinkName) + 1] = 'Web Link To Document Tab(Open Document)'	//Added by Scofield on 2009-07-17

ll_RowCnt = UpperBound(ls_LinkName)
for ll_Cycle = 1 to ll_RowCnt
	ll_InsPos = dw_1.InsertRow(0)
	dw_1.SetItem(ll_InsPos,"Export_Field_Name",ls_LinkName[ll_Cycle])
next

end subroutine

public subroutine of_add_docusign_location_fields ();//====================================================================
// Function: of_add_docusign_location_fields
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 06-29-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
long ll_row

ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_approve_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_company_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_datesigned_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_emailaddress_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_envelopeid_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_firstname_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_fullname_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_initialhere_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_initialhereoptional_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_lastname_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_signerattachment_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_signerattachmentoptional_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_signhere_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_signhereoptional_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_title_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_decline_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_date_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_radio_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_checkbox_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_text_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_note_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_number_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_ssn_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_zip5_1}")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "{ds_zip5dash4_1}")



end subroutine

public subroutine of_add_web_fields ();//====================================================================
// Function: of_add_web_fields
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-23
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

 
Long ll_Row
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "Web Document ID")
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "Web Document Name")
//ll_Row = dw_1.insertrow(0) 
//dw_1.SetItem( ll_row,"export_field_name", "Web Approval Document CL Link") //Commented By Ken.Guo 2016-09-30
ll_Row = dw_1.insertrow(0)
dw_1.SetItem( ll_row,"export_field_name", "Document Manager Link")


end subroutine

on w_agreement_template_merge_fields.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.rb_body=create rb_body
this.rb_subject=create rb_subject
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.rb_body
this.Control[iCurrent+3]=this.rb_subject
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.cb_ok
this.Control[iCurrent+6]=this.dw_1
end on

on w_agreement_template_merge_fields.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.rb_body)
destroy(this.rb_subject)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
end on

event open;call super::open;long ll_export_id
boolean lb_filter_data = false //Added By Jay Chen 07-06-2015

//04/25/2007 By Jervis
//ll_export_id = message.DoubleParm
istr_pass = Message.powerobjectparm

inv_word = Create n_cst_word_utility

//Added By Jay Chen 09-24-2014
string ls_export_name
select export_name into :ls_export_name from export_header where export_id = :istr_pass.s_long[1];
if isnull(ls_export_name) then ls_export_name = ''
mle_1.text = 'Please select the field(s) you need.~r~nNote:These field(s) are from the export "' + ls_export_name + '". '
//end

//dw_1.retrieve(ll_export_id)
//$<add> 06.06.2008 by Andy
//$<Reason> When Contracts turned off,dw_1 retrieve failed.
dw_1.settransobject(SQLCA)
//end add 06.06.2008
dw_1.retrieve(istr_pass.s_long[1])

//---------Begin Added by Alfee 05.25.2007----------------
u_tabpg_dm_data lnv_data
CHOOSE CASE Lower(istr_pass.s_string)
	CASE "clause"
		IF IsValid(w_clause_painter) THEN
			iole_word = w_clause_painter.tab_1.tabpage_clause.ole_1.object.ActiveDocument
			of_add_version_fields()	//02.23.2009 By Jervis
			if gnv_data.of_getitem( 'icred_settings', 'esign', False) ='1' and lower(gs_esigntype) = 'docusign' then of_add_docusign_location_fields() //Added By Jay Chen 07-07-2015
		END IF
	CASE "template"
		IF IsValid(w_agreement_template_painter) THEN
			iole_word = w_agreement_template_painter.tab_1.tabpage_2.ole_1.object.ActiveDocument
			of_add_version_fields()	//02.23.2009 By Jervis
			if gnv_data.of_getitem( 'icred_settings', 'esign', False) ='1' and lower(gs_esigntype) = 'docusign' then of_add_docusign_location_fields() //Added By Jay Chen 07-07-2015
		END IF
	CASE "document"
		If isvalid(istr_pass.w_parent_window) Then
			IF istr_pass.w_parent_window.classname() = 'w_contract' THEN
				lnv_data = gw_contract.tab_contract_details.tabpage_images.tab_1.tabpage_data
				iole_word = lnv_data.tab_1.tabpage_preview.ole_doc.object.ActiveDocument
			ElseIf istr_pass.w_parent_window.classname() = 'w_documents_browse' THEN
				lnv_data = w_documents_browse.uo_1
				iole_word = lnv_data.tab_1.tabpage_preview.ole_doc.object.ActiveDocument				
			End If
			if isnull(istr_pass.s_long[1]) then lb_filter_data = true //Added By Jay Chen 07-06-2015
			if not lb_filter_data then of_add_version_fields()	//02.23.2009 By Jervis //Modified By Jay Chen 07-06-2015 add if condition
			if gnv_data.of_getitem( 'icred_settings', 'esign', False) ='1' and lower(gs_esigntype) = 'docusign' then of_add_docusign_location_fields() //Added By Jay Chen 06-29-2015
		END If
	CASE "email"
		
	CASE "email-painter","alarm"	//Add "alarm" by jervis 03.30.2010
		If Lower(istr_pass.s_string) = "email-painter" and istr_pass.s_long[1] = -999 Then
			//Added By Ken.Guo 2010-08-12. for Group Email Alarm Module
			dw_1.InsertRow(0)
			dw_1.SetItem(1,'export_field_name','Alarm List')				
		Else
			rb_subject.visible = true
			rb_body.visible = true
			if istr_pass.s_string_array[1] = 'body' then
				rb_body.checked = true
				rb_subject.checked = false
			else
				rb_body.checked = false
				rb_subject.checked = true
			end if
			
			if IsValid(w_email_add) then
				iole_word = w_email_add.ole_message.object.ActiveDocument
				if AppeonGetClientType() = "WEB" then
					of_add_URLlink_fields()	//Added by Scofield on 2009-03-05
					of_add_web_fields() //Added By Ken.Guo 2016-08-23
				end if
			elseif IsValid(w_ctx_alarm) then
				iole_word = w_ctx_alarm.ole_message.object.ActiveDocument
			end if		
		End If
	/*
	Comment by jervis 03.30.2010
	CASE "alarm" //Alfee 06.11.2008
		if IsValid(w_ctx_alarm) then
			iole_word = w_ctx_alarm.ole_message.object.ActiveDocument
		end if		
	*/
END CHOOSE
//---------End Added -----------------------------------------

end event

event close;call super::close;Destroy inv_word
end event

type mle_1 from multilineedit within w_agreement_template_merge_fields
integer x = 23
integer width = 2089
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Please insert the field which come from export"
boolean border = false
boolean displayonly = true
end type

type rb_body from radiobutton within w_agreement_template_merge_fields
boolean visible = false
integer x = 393
integer y = 1404
integer width = 334
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Body"
boolean checked = true
end type

type rb_subject from radiobutton within w_agreement_template_merge_fields
boolean visible = false
integer x = 23
integer y = 1404
integer width = 384
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Subject"
end type

type cb_cancel from commandbutton within w_agreement_template_merge_fields
integer x = 1787
integer y = 1404
integer width = 334
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_agreement_template_merge_fields
integer x = 1431
integer y = 1404
integer width = 334
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Insert"
end type

event clicked;long 		ll_row
string 	ls_merge_field
string 	ls_type

ll_row = dw_1.getrow()

if ll_row > 0 then
	ls_merge_field = dw_1.getitemstring(ll_row,"export_field_name")
	
	If len(ls_merge_field) > 0 Then
		//inv_word.dynamic of_add_merge_field(iole_word, ls_merge_field) //Commented by Alfee 11.23.2007
		choose case upper(istr_pass.s_string)
			case 'EMAIL' //, 'ALARM' //Alfee 06.11.2008
				iw_parent.dynamic of_add_merge_field(ls_merge_field)
			CASE 'EMAIL-PAINTER'	,'ALARM' //Add 'alarm'  JERVIS - 03.30.2010
				if rb_subject.checked then
					ls_type = 'subject'
				else
					ls_type = 'body'
				end if
				iw_parent.dynamic of_add_merge_field(ls_merge_field,ls_type)
			case else
				if left(lower(ls_merge_field),4) = '{ds_' then //Added By Jay Chen 06-29-2015 add docusign location field.
//					iole_word.Variables.Add(ls_merge_field, ls_merge_field)
//					iole_word.ActiveWindow.Selection.Fields.Add(iole_word.ActiveWindow.Selection.Range, 64, '"'+ls_merge_field+'"')
					if inv_word.of_unprotect_doc(iole_word) = -1 THEN RETURN -1
					iole_word.ActiveWindow.Selection.InsertAfter(ls_merge_field)
				else
					inv_word.dynamic of_add_merge_field(iole_word, ls_merge_field)
				end if
		end choose
	End If
else 
 	messagebox("Warning","You have not selected a field!")
end if

end event

type dw_1 from u_dw_contract within w_agreement_template_merge_fields
integer x = 23
integer y = 132
integer width = 2089
integer height = 1252
integer taborder = 10
string dataobject = "d_agreement_template_export"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
boolean ib_enable_columns = false
boolean ib_use_row_selection = true
end type

event constructor;call super::constructor;of_setupdateable(false)
of_SetRowSelect(true)


end event

event doubleclicked;call super::doubleclicked;cb_ok.event clicked()
end event

event getfocus;//
end event

event losefocus;//
end event

