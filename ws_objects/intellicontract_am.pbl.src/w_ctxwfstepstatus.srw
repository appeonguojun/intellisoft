﻿$PBExportHeader$w_ctxwfstepstatus.srw
forward
global type w_ctxwfstepstatus from w_popup
end type
type mle_notes from multilineedit within w_ctxwfstepstatus
end type
type dw_workflow_step_status from datawindow within w_ctxwfstepstatus
end type
type dw_workflow_steps from datawindow within w_ctxwfstepstatus
end type
type gb_step from groupbox within w_ctxwfstepstatus
end type
type gb_status from groupbox within w_ctxwfstepstatus
end type
type gb_notes from groupbox within w_ctxwfstepstatus
end type
end forward

global type w_ctxwfstepstatus from w_popup
integer width = 2176
integer height = 992
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
mle_notes mle_notes
dw_workflow_step_status dw_workflow_step_status
dw_workflow_steps dw_workflow_steps
gb_step gb_step
gb_status gb_status
gb_notes gb_notes
end type
global w_ctxwfstepstatus w_ctxwfstepstatus

type variables
long	il_ctx_id

//Added By Ken.Guo 11/07/2012
long il_action_item_id,il_wf_action_type_id , il_action_type
String is_notes,is_wf_complete_flag

Long il_position_x_org //Added By Ken.Guo 11/29/2013
n_cst_ctx_audit inv_ctx_audit //Added By Ken.Guo 2015-11-25
Long il_original_action_status //Added By Ken.Guo 2015-11-25
end variables

forward prototypes
public function long of_refreshworkflowstep ()
public subroutine of_refresh_notes ()
public subroutine of_set_position ()
end prototypes

public function long of_refreshworkflowstep ();//====================================================================
// Function: of_RefreshWorkFlowStep()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Scofield		Date: 2009-07-13
//--------------------------------------------------------------------
//	Copyright (c) 1999-2009 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long		ll_ctx_id,ll_CurRow,ll_step_id,ll_FoundRow
Boolean	lb_NeedRestore

DataWindowChild ldwc_Child

if IsValid(gw_contract) then
	if IsValid(gw_contract.tab_contract_details) then
		if Lower(gw_contract.tab_contract_details.tabpage_search.inv_contract_details.is_mode) <> 'new' Then //Added By Ken.Guo 04/10/2014. add checking 'is_mode'.
			if IsValid(gw_contract.tab_contract_details.tabpage_action_items) then
				if IsValid(gw_contract.tab_contract_details.tabpage_action_items.tab_1) then
					if IsValid(gw_contract.tab_contract_details.tabpage_action_items.tab_1.tabpage_detail) then
						ll_ctx_id = gw_contract.tab_contract_details.tabpage_search.il_ctx_id
					end if
				end if
			end if
		end if
	end if
end if

if ll_ctx_id = il_ctx_id then lb_NeedRestore = true

il_ctx_id = ll_ctx_id

if IsNull(il_ctx_id) or il_ctx_id <= 0 then Return -1

////////////////////////////////////////////////////////////////////////////
ll_CurRow = dw_workflow_steps.GetRow()
if lb_NeedRestore and (ll_CurRow > 0 and ll_CurRow <= dw_workflow_steps.RowCount()) then
	ll_step_id = dw_workflow_steps.GetItemNumber(ll_CurRow,"al_step_id")
end if
////////////////////////////////////////////////////////////////////////////

dw_workflow_steps.SetTransObject(SQLCA)
dw_workflow_steps.Reset()

dw_workflow_steps.GetChild("al_step_id",ldwc_Child)
ldwc_Child.SetTransObject(SQLCA)
ldwc_Child.Reset()
ldwc_Child.Retrieve(il_ctx_id,gs_user_id)

dw_workflow_step_status.SetTransObject(SQLCA)
dw_workflow_step_status.Reset()

if ldwc_Child.RowCount() <= 0 then Return -1

ll_CurRow = dw_workflow_steps.InsertRow(0)
/////////////////////////////////////////////////////////////
if lb_NeedRestore and ll_step_id > 0 then
	dw_workflow_steps.GetChild("al_step_id",ldwc_Child)
	ll_FoundRow = ldwc_Child.Find("ctx_action_items_wf_action_type_id = " + String(ll_step_id),1,ldwc_Child.RowCount())
	if ll_FoundRow > 0 then
		dw_workflow_steps.SetItem(1,"al_step_id",ll_step_id)
		dw_workflow_steps.Trigger Event ItemChanged(1,dw_workflow_steps.Object.al_step_id,String(ll_step_id))
		Return 1
	end if
end if
/////////////////////////////////////////////////////////////
ll_step_id = ldwc_Child.GetItemNumber(1,"ctx_action_items_wf_action_type_id")
dw_workflow_steps.SetItem(1,"al_step_id",ll_step_id)
dw_workflow_steps.Trigger Event ItemChanged(1,dw_workflow_steps.Object.al_step_id,String(ll_step_id))

Return 1

end function

public subroutine of_refresh_notes ();datawindowchild ldwc_wf_step
Long ll_step_id, ll_displaynotes, ll_find
String ls_notes

dw_workflow_steps.GetChild('al_step_id',ldwc_wf_step)
If dw_workflow_steps.GetRow() = 1 Then
	ll_step_id = dw_workflow_steps.GetItemNumber(1, 'al_step_id')
	ll_find = ldwc_wf_step.Find('ctx_action_items_wf_action_type_id = ' + String(ll_step_id), 1, ldwc_wf_step.Rowcount())
	If ll_find > 0 Then
		ll_displaynotes = ldwc_wf_step.GetItemNumber(1, 'wf_action_types_displaynotes')
		ls_notes =  ldwc_wf_step.GetItemString(1, 'wf_action_types_notes') 
		If isnull(ls_notes) Then ls_notes = ''
		If ll_displaynotes = 1 Then
			mle_Notes.Text = ls_notes
			If Not gb_notes.visible Then
				gb_notes.visible = True
				mle_notes.visible = True
				//This.width = gb_notes.x + gb_notes.width + 100
				gb_step.x = 1006
				dw_workflow_steps.x = gb_step.x + 114
				gb_status.x = gb_step.x
				dw_workflow_step_status.x = dw_workflow_steps.x
				This.width = gb_step.x + gb_step.width + 100
				
				of_set_position()
			End If
		Else
			mle_Notes.Text = ''
			If gb_notes.visible Then
				gb_notes.visible = False
				mle_notes.visible = False
				//This.width = gb_notes.x  + 60
				
				gb_step.x = 73
				dw_workflow_steps.x = gb_step.x + 114
				gb_status.x = gb_step.x
				dw_workflow_step_status.x = dw_workflow_steps.x
				This.width = gb_step.x + gb_step.width + 100				
				
				of_set_position()
			End If
		End If
	End If
End If

//refresh first open position if it do not move yet.
If il_position_x_org = This.x Then
	of_set_position()
End If

end subroutine

public subroutine of_set_position ();//Added By Ken.Guo 11/29/2013. copy from open()
//Long ll_ezmenu_width, ll_status_bar_height
//If w_mdi.dw_ezmenu.visible Then
//	ll_ezmenu_width = w_mdi.dw_ezmenu.width
//Else
//	ll_ezmenu_width = 0
//End If
//ll_status_bar_height = w_mdi.dw_statusbar.height
//
if IsValid(gw_Contract) then
//	If gw_Contract.X + gw_Contract.Width - This.Width - 120 < 0 Then
//		This.X = ll_ezmenu_width + w_mdi.X + w_mdi.Width - This.Width - 120
//	Else
//		This.X = ll_ezmenu_width +  gw_Contract.X + gw_Contract.Width - This.Width - 120
//	End If
//	If gw_Contract.Y + gw_Contract.Height - This.Height + 20 < This.Height Then
//		This.Y = w_mdi.Y + w_mdi.Height - This.Height + 20
//	Else
//		This.Y = gw_Contract.Y + gw_Contract.Height - This.Height + 20
//	End If
	This.X = gw_Contract.Width - This.Width - 120
	This.Y = gw_Contract.Height - This.Height - 180
end if

end subroutine

on w_ctxwfstepstatus.create
int iCurrent
call super::create
this.mle_notes=create mle_notes
this.dw_workflow_step_status=create dw_workflow_step_status
this.dw_workflow_steps=create dw_workflow_steps
this.gb_step=create gb_step
this.gb_status=create gb_status
this.gb_notes=create gb_notes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_notes
this.Control[iCurrent+2]=this.dw_workflow_step_status
this.Control[iCurrent+3]=this.dw_workflow_steps
this.Control[iCurrent+4]=this.gb_step
this.Control[iCurrent+5]=this.gb_status
this.Control[iCurrent+6]=this.gb_notes
end on

on w_ctxwfstepstatus.destroy
call super::destroy
destroy(this.mle_notes)
destroy(this.dw_workflow_step_status)
destroy(this.dw_workflow_steps)
destroy(this.gb_step)
destroy(this.gb_status)
destroy(this.gb_notes)
end on

event open;call super::open;long	ll_RtnVal

This.Title = "Workflow Step for " + gs_user_id

//of_set_position() //Modified By Ken.Guo 11/29/2013
//if IsValid(gw_Contract) then
//	If gw_Contract.X + gw_Contract.Width - This.Width - 120 < 0 Then
//		This.X = w_mdi.X + w_mdi.Width - This.Width - 120
//	Else
//		This.X = gw_Contract.X + gw_Contract.Width - This.Width - 120
//	End If
//	If gw_Contract.Y + gw_Contract.Height - This.Height + 20 < This.Height Then
//		This.Y = w_mdi.Y + w_mdi.Height - This.Height + 20
//	Else
//		This.Y = gw_Contract.Y + gw_Contract.Height - This.Height + 20
//	End If
//end if

il_position_x_org = This.x

ll_RtnVal = of_RefreshWorkFlowStep()
if ll_RtnVal < 0 then Close(This)

end event

event show;call super::show;long	ll_RtnVal

ll_RtnVal = of_RefreshWorkFlowStep()
if ll_RtnVal < 0 then Close(This)

end event

type mle_notes from multilineedit within w_ctxwfstepstatus
integer x = 73
integer y = 96
integer width = 846
integer height = 736
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type dw_workflow_step_status from datawindow within w_ctxwfstepstatus
string tag = "187"
integer x = 1120
integer y = 324
integer width = 933
integer height = 496
integer taborder = 20
string dataobject = "d_workflow_step_status"
boolean vscrollbar = true
boolean border = false
end type

event buttonclicked;//Begin - Modified By Ken.Guo 11/07/2012
//Copy Code From uo_todolist.cb_save.clicked()

long ll_wf_id,ll_step_id,ll_status_id,ll_FoundRow,ll_RtnVal
long  ll_wf_step_id
Long ll_action_status
str_action_item lstr_action[1]
n_cst_workflow_triggers    lnv_trigger
n_cst_notification lnv_notification
String ls_alm_table,ls_alm_column 
String ls_table_arr[],ls_column_arr[]
Long ll_ctx_arr[]
long ll_docid_arr[],ll_doc_id,ll_level_id1_arr[],ll_level_id1,ll_level_id2_arr[],ll_level_id2
			
lnv_trigger = create n_cst_workflow_triggers
			
lstr_action[1].ctx_id = il_ctx_id
lstr_action[1].ctx_action_item_id = il_action_item_id
lstr_action[1].wf_id = This.GetItemNumber(Row,"wf_id")
lstr_action[1].wf_step_id =  This.GetItemNumber(Row,"step_id")
lstr_action[1].wf_action_status_id =  This.GetItemNumber(Row,"action_status_id")		
lstr_action[1].as_assigned_to = gs_user_id 

if lnv_trigger.of_popup_prompt( lstr_action[1]) <> 1 then
	destroy lnv_trigger
	return 
end if

ll_action_status = This.GetItemNumber(Row,"action_status_id")		

gnv_appeondb.of_autocommit( )
Update ctx_action_items
	Set action_status = :ll_action_status
	, action_date = getdate()
	Where ctx_id = :il_ctx_id
	And ctx_action_item_id = :il_action_item_id;
Commit;

//Added By Ken.Guo 2015-11-25
inv_ctx_audit.of_audit_action_items_status(il_ctx_id,0,1021,il_original_action_status,ll_action_status,il_action_item_id)

// Trigger work flow
If gb_workflow Then

	lstr_action[1].wf_action_type_id = il_action_type 
	lstr_action[1].status_changed_flag = False
	lstr_action[1].module = "03" //Contract Tracking
	lstr_action[1].trigger_by = "008"		//Trigger By Action Item Changed
	lstr_action[1].screen_id = -10
	If lstr_action[1].wf_id > 0 And is_wf_complete_flag = "N" Then
		lstr_action[1].wf_step_id = il_wf_action_type_id
		lstr_action[1].notes = is_notes
		lstr_action[1].status_changed_flag = True
	End If

	//lnv_trigger = Create n_cst_workflow_triggers
	lnv_trigger.of_status_changed( lstr_action[1] )
	
	//Create Work Flow By Action Item Changed
	lnv_trigger.of_workflow_triggers(lstr_action)
	
	//Added By Ken.Guo 2011-05-05. Update Snooze Date.
	If Not isvalid(lnv_notification) Then lnv_notification = Create n_cst_notification 
	Select  alm_table, alm_column,doc_id,level_id1,level_id2 
	Into :ls_alm_table,:ls_alm_column :ll_doc_id,:ll_level_id1,:ll_level_id2
	From ctx_action_items 
		Where  ctx_id = :il_ctx_id And ctx_action_item_id = :il_action_item_id;
	ll_ctx_arr[1] = il_ctx_id
	ls_table_arr[1] = ls_alm_table
	ls_column_arr[1] = ls_alm_column
	ll_docid_arr[1] = ll_doc_id
	ll_level_id1_arr[1] = ll_level_id1
	ll_level_id2_arr[1] = ll_level_id2
	choose case lower(ls_alm_table)
		case 'ctx_basic_info','ctx_custom' 
			lnv_notification.of_update_ctx_notification( ll_ctx_arr[], ls_table_arr[], ls_column_arr[])
		case 'ctx_custom_multi_hdr','ctx_custom_multi_detail'
			lnv_notification.of_update_ctx_notification( ll_ctx_arr[], ls_table_arr[], ls_column_arr[],ll_docid_arr,ll_level_id1_arr,ll_level_id2_arr)	
	end choose
	gnv_data.of_retrieve( "ctx_ai_notification")
	If Not isvalid(lnv_notification) Then Destroy lnv_notification
End If

If IsValid(lnv_trigger) Then Destroy lnv_trigger 

ll_RtnVal = of_RefreshWorkFlowStep()
if ll_RtnVal <= 0 then Hide(Parent)

//Refresh AI Data
If gw_contract.tab_contract_details.Selectedtab = 10 Then
	gw_contract.tab_contract_details.tabpage_action_items.tab_1.tabpage_detail.dw_1.event pfc_retrieve( )
Else
	gw_contract.tab_contract_details.ib_select10 = False
End If

//Commented By Ken.Guo 11/07/2012
//String	ls_FindExp
//
//u_dw_contract	ldw_Detail
//
//if dwo.Name <> "b_statusname" then Return
//
//if IsValid(gw_contract) then
//	if IsValid(gw_contract.tab_contract_details) then
//		if IsValid(gw_contract.tab_contract_details.tabpage_action_items) then
//			if IsValid(gw_contract.tab_contract_details.tabpage_action_items.tab_1) then
//				if IsValid(gw_contract.tab_contract_details.tabpage_action_items.tab_1.tabpage_detail) then
//					if IsValid(gw_contract.tab_contract_details.tabpage_action_items.tab_1.tabpage_detail.dw_1) then
//						ldw_Detail = gw_contract.tab_contract_details.tabpage_action_items.tab_1.tabpage_detail.dw_1
//					end if
//				end if
//			end if
//		end if
//	end if
//end if
//
//if Not IsValid(ldw_Detail) then Return
//
////Added By Ken.Guo 11/07/2012
//If Not gw_contract.tab_contract_details.ib_select10 Then
//	
//End If
//ldw_Detail.Event pfc_Retrieve()
//
//ll_wf_id = This.GetItemNumber(Row,"wf_id")
//ll_step_id = This.GetItemNumber(Row,"step_id")
//ll_status_id = This.GetItemNumber(Row,"action_status_id")
//
//ls_FindExp = "wf_id = " + String(ll_wf_id) + " and wf_action_type_id = " + String(ll_step_id) + " and action_user = '" + gs_user_id + "' and wf_complete_flag <> 'Y' and active_status >= 0"
//
//ll_FoundRow = ldw_Detail.Find(ls_FindExp,1,ldw_Detail.RowCount())
//if ll_FoundRow > 0 then
//	ldw_Detail.SetItem(ll_FoundRow,"action_status",ll_status_id)
//	ll_RtnVal = ldw_Detail.Trigger Event ItemChanged(ll_FoundRow,ldw_Detail.Object.action_status,String(ll_status_id))
//	
//	if ll_RtnVal = 2 then
//		ldw_Detail.Event pfc_Retrieve()
//	else
//		if ldw_Detail.of_AcceptText(true) < 0 then Return
//		if ldw_Detail.of_Validation() < 0 then Return
//		if ldw_Detail.of_Update(true,false) = 1 then
//			ldw_Detail.of_PostUpdate()
//		end if
//	end if
//end if
//ll_RtnVal = of_RefreshWorkFlowStep()
//if ll_RtnVal <= 0 then Hide(Parent)

//End - Modified By Ken.Guo 11/07/2012
end event

type dw_workflow_steps from datawindow within w_ctxwfstepstatus
string tag = "187"
integer x = 1120
integer y = 100
integer width = 887
integer height = 84
integer taborder = 10
string dataobject = "d_workflow_active_steps"
boolean border = false
end type

event itemchanged;String	ls_ColName,ls_StepName
long		ll_wf_id,ll_Step_id,ll_FoundRow,ll_Cycle,ll_RowCnts,ll_Action_Status

DataWindowChild ldwc_Child

ls_ColName = dwo.Name
Setnull(il_original_action_status) //Added By Ken.Guo 2015-11-25

if ls_ColName = "al_step_id" then
	This.GetChild("al_step_id",ldwc_Child)
	ll_FoundRow = ldwc_Child.Find("ctx_action_items_wf_action_type_id = " + data,1,ldwc_Child.RowCount())
	
	if ll_FoundRow > 0 then
		ls_StepName = ldwc_Child.GetItemString(ll_FoundRow,"wf_action_types_step_name")
		
		//Added By Ken.Guo 11/07/2012
		il_action_item_id = ldwc_Child.GetItemNumber(ll_FoundRow,"ctx_action_item_id") 
		il_wf_action_type_id = ldwc_Child.GetItemNumber(ll_FoundRow,"ctx_action_items_wf_action_type_id") 
		is_notes = ldwc_Child.GetItemString(ll_FoundRow,'notes')
		is_wf_complete_flag = ldwc_Child.GetItemString(ll_FoundRow,'wf_complete_flag')
		il_action_type = ldwc_Child.GetItemNumber(ll_FoundRow,"action_type") 		
		
		Parent.Title = ls_StepName
		
		ll_wf_id = ldwc_Child.GetItemNumber(ll_FoundRow,"ctx_action_items_wf_id")
		dw_workflow_step_status.Retrieve(ll_wf_id,long(data))
		
		ll_Action_Status = ldwc_Child.GetItemNumber(ll_FoundRow,"ctx_action_items_action_status")
		if IsNull(ll_Action_Status) then ll_Action_Status = 0
		il_original_action_status = ll_Action_Status //Added By Ken.Guo 2015-11-25
		
		ll_RowCnts = dw_workflow_step_status.RowCount()
		for ll_Cycle = 1 to ll_RowCnts
			dw_workflow_step_status.SetItem(ll_Cycle,"current_status",ll_Action_Status)
		next
	end if
	of_refresh_notes() //Added By Ken.Guo 11/29/2013
end if

end event

type gb_step from groupbox within w_ctxwfstepstatus
string tag = "73"
integer x = 1006
integer y = 20
integer width = 1106
integer height = 208
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Current Active Workflow Step"
end type

type gb_status from groupbox within w_ctxwfstepstatus
string tag = "73"
integer x = 1006
integer y = 240
integer width = 1106
integer height = 620
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Workflow Status"
end type

type gb_notes from groupbox within w_ctxwfstepstatus
integer x = 41
integer y = 20
integer width = 914
integer height = 844
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Instructions/Notes"
end type

