$PBExportHeader$w_request_webform_action.srw
forward
global type w_request_webform_action from w_response
end type
type cbx_workflow from checkbox within w_request_webform_action
end type
type st_information2 from statictext within w_request_webform_action
end type
type dw_1 from u_dw within w_request_webform_action
end type
type st_name from statictext within w_request_webform_action
end type
type st_information from statictext within w_request_webform_action
end type
type cb_cancel from commandbutton within w_request_webform_action
end type
type cb_ok from commandbutton within w_request_webform_action
end type
type mle_notes from multilineedit within w_request_webform_action
end type
type st_notes from statictext within w_request_webform_action
end type
type gb_submit from groupbox within w_request_webform_action
end type
type gb_1 from groupbox within w_request_webform_action
end type
end forward

global type w_request_webform_action from w_response
integer x = 214
integer y = 221
integer width = 1911
integer height = 1500
cbx_workflow cbx_workflow
st_information2 st_information2
dw_1 dw_1
st_name st_name
st_information st_information
cb_cancel cb_cancel
cb_ok cb_ok
mle_notes mle_notes
st_notes st_notes
gb_submit gb_submit
gb_1 gb_1
end type
global w_request_webform_action w_request_webform_action

type variables
str_request_webform_action		istr_action
end variables

forward prototypes
public subroutine of_auto_select_steps ()
public subroutine of_adjust_updown (boolean abn_display)
end prototypes

public subroutine of_auto_select_steps ();long			i , ll_rowcount, ll_order_no, ll_steps_mark, ll_find
string			ls_submit_step, ls_temp, ls_status

if not isnull(istr_action.al_rwf_id) and istr_action.al_rwf_id >0 then
	ll_rowcount = dw_1.retrieve(istr_action.al_rwf_id )
	if not isnull(istr_action.al_steps) and istr_action.al_steps = 1 then 
		If isnull( istr_action.as_submit_step ) then 
			//			
//		elseif ( left(istr_action.as_submit_step, 1 ) = ";") then //;
//			
//		elseif ( isnumber(left(istr_action.as_submit_step, 1 ) )) then 	//1
			
//		elseif (trim(istr_action.as_submit_step ) = 'C') then 	//C
//			// return
		else
			//need separate it   ";1;" and return the value
			if  left(istr_action.as_submit_step, 1 ) <> ";" then 
				istr_action.as_submit_step= ";"+istr_action.as_submit_step
			end if 
			if ( isnumber(right(istr_action.as_submit_step, 1 )) )  then
				istr_action.as_submit_step= istr_action.as_submit_step+";"
			end if 
			for i =  1 to ll_rowcount 
				ll_steps_mark = dw_1.getItemNumber( i, "steps_mark")
				ls_status = dw_1.getItemString( i, "status")
				ls_temp = ";"+string(ll_steps_mark)+";"
				ll_find = pos(istr_action.as_submit_step,ls_temp)
				if ll_find > 0 and (lower(ls_status) = 'submitted' )  then 
					dw_1.setitem(i,"selected",1)
				end if 
			next 		
		end if 
	else
		for i =  1 to ll_rowcount 
			dw_1.setitem(i,"selected",1)
		next 
		dw_1.Modify("DataWindow.ReadOnly=Yes")
	end if 
end if 
end subroutine

public subroutine of_adjust_updown (boolean abn_display);//Added By Mark Lee 12/22/2014

st_information2.visible = abn_display

if abn_display = true then 
	st_notes.y = st_information2.y + st_information2.height + 10 
	mle_notes.y = st_notes.y+ st_notes.height + 10
	mle_notes.height = 330
else
	st_notes.y = st_information.y + st_information.height + 10	
	mle_notes.y = st_notes.y+ st_notes.height + 10
	mle_notes.height = 330 + 90
end if 
end subroutine

on w_request_webform_action.create
int iCurrent
call super::create
this.cbx_workflow=create cbx_workflow
this.st_information2=create st_information2
this.dw_1=create dw_1
this.st_name=create st_name
this.st_information=create st_information
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.mle_notes=create mle_notes
this.st_notes=create st_notes
this.gb_submit=create gb_submit
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_workflow
this.Control[iCurrent+2]=this.st_information2
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.st_name
this.Control[iCurrent+5]=this.st_information
this.Control[iCurrent+6]=this.cb_cancel
this.Control[iCurrent+7]=this.cb_ok
this.Control[iCurrent+8]=this.mle_notes
this.Control[iCurrent+9]=this.st_notes
this.Control[iCurrent+10]=this.gb_submit
this.Control[iCurrent+11]=this.gb_1
end on

on w_request_webform_action.destroy
call super::destroy
destroy(this.cbx_workflow)
destroy(this.st_information2)
destroy(this.dw_1)
destroy(this.st_name)
destroy(this.st_information)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.mle_notes)
destroy(this.st_notes)
destroy(this.gb_submit)
destroy(this.gb_1)
end on

event open;call super::open;//Submit Approval Response

istr_action = Message.powerobjectparm

if isvalid(istr_action) then
	if istr_action.as_action = 'approve' then
		this.title = "Submit Approval Response"	
		of_adjust_updown(false)
	else
		this.title = "Submit Reject Response"
		of_adjust_updown(true)
	end if 

	st_name.text = "Request Name:  "+istr_action.as_request_name	
	if dw_1.retrieve(istr_action.al_rwf_id ) > 0 then 
		of_auto_select_steps()
	end if 	
end if 

//st_information.text = "Please enter a note so the system can track and analyze this request record.~r~n"+ &
//         "For reject action, you have to enter a note so the user who submitted this request knows how to change the request data."
st_information.text = "Please enter a note so the system can track and analyze this request record."
st_information2.text = "For reject action, you have to enter a note so the user who submitted this request knows how to change the request data."
end event

type cbx_workflow from checkbox within w_request_webform_action
integer x = 14
integer y = 1320
integer width = 494
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trigger Work Flow "
boolean checked = true
end type

type st_information2 from statictext within w_request_webform_action
integer x = 55
integer y = 780
integer width = 1797
integer height = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Information2:"
boolean focusrectangle = false
end type

type dw_1 from u_dw within w_request_webform_action
event ue_dwsyscommand pbm_syscommand
integer x = 32
integer y = 184
integer width = 1838
integer height = 472
integer taborder = 10
string title = "Choose approve/reject steps"
string dataobject = "d_request_webform_action_selected"
boolean ib_isupdateable = false
end type

event ue_dwsyscommand;if commandtype = 61458 and ib_move_dw = False Then
	message.processed = true
	message.returnvalue = 0
end if
end event

event constructor;call super::constructor;this.of_SetUpdateAble(false)
end event

type st_name from statictext within w_request_webform_action
integer x = 14
integer y = 36
integer width = 1874
integer height = 84
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_information from statictext within w_request_webform_action
integer x = 55
integer y = 732
integer width = 1797
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Information:"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_request_webform_action
integer x = 1573
integer y = 1316
integer width = 315
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

event clicked;close(parent)
end event

type cb_ok from commandbutton within w_request_webform_action
integer x = 1230
integer y = 1316
integer width = 315
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

event clicked;string 	ls_submit, ls_message, ls_export_col_name, ls_step_name, ls_status, ls_notes, ls_step_name2, ls_comment
long		i, ll_order_no, ll_selected, ll_steps_num, ll_steps_mark, ll_row, ll_ctx_id

ls_step_name  = ""
ls_submit = ";"
ls_message = ""
ls_step_name2 =""

//workflow
if cbx_workflow.checked = true then 
	istr_action.al_workflow = 1
else
	istr_action.al_workflow = 0
end if 

//notes 
ls_notes = mle_notes.text
if istr_action.as_action = 'reject' and (isnull(ls_notes) or trim(ls_notes) = '')  then 
	ls_message= " Please enter the notes, and then continue with the reject action."
	messagebox(gnv_app.iapp_object.DisplayName,ls_message )
	return
end if 

//refresh data 			//Added By Mark Lee 08/17/2015
Select submit_step, reject_step, ctx_id
Into   :istr_action.as_submit_step, :istr_action.as_reject_step, :istr_action.al_ctx_id
From request_webform 
Where rwf_id = :istr_action.al_rwf_id Using sqlca;

ls_comment =  " Step(s) processed: ["
if isnull(ls_notes) then 	ls_notes = ""
for i = 1 to dw_1.rowcount( )
	ll_selected  = dw_1.GetItemNumber( i, "selected")
	ll_order_no  = dw_1.GetItemNumber( i, "order_no")
	ll_steps_num = dw_1.GetItemNumber( i, "steps_num")
	ll_steps_mark = dw_1.GetItemNumber( i, "steps_mark")
	ls_export_col_name = dw_1.GetItemString( i, "export_col_name")
	ls_status = dw_1.GetItemString( i, "status")
	if  ll_selected = 1 then 
		ls_submit = ls_submit + string(ll_steps_mark)+ ";"		
		ls_comment += ls_export_col_name+" ("+string(ll_steps_mark)+") , "
	end if
	
	if not isnull(ll_steps_num) and ll_steps_num = 1 and ll_selected <> 1 then
		if (lower(ls_status) = 'submitted' ) then 
			ls_step_name = ls_export_col_name
			ll_row = i
		elseif (lower(ls_status) = 'rejected' ) then 
			ls_step_name2 = ls_export_col_name			
		end if 
	end if 
Next 

if right(ls_comment, 2 ) =", " then 
	ls_comment = left(ls_comment, len(ls_comment) -2 ) + '] '
elseif isnull(ls_comment) then // maybe the steps_mark value is null when use the old request form data create request.
	ls_comment = ''
end if 

//Added By Mark Lee 10/08/2015
if istr_action.al_steps = 1  then 		//and istr_action.as_action = 'reject'
	ls_notes = ls_comment + ls_notes
end if 

istr_action.as_notes = ls_notes
if  istr_action.as_action = 'approve' then 
	ll_ctx_id =istr_action.al_ctx_id 
	if (isnull(ll_ctx_id) or ll_ctx_id <= 0 ) and trim(ls_step_name2) <> ""  then 
		ls_message = "The Initial Step ("+ls_step_name2+") needs to be approved before the rest of the steps can be approved. ~r~nPlease ask the requester to resubmit the Initial Step ("+ls_step_name2+") and get it approved first."
		messagebox(gnv_app.iapp_object.DisplayName,ls_message )
		return  
	end if 
	
	if trim(ls_step_name) <> "" then 
		ls_message = " Please select the Initial Step before you can perform the "+trim(istr_action.as_action)+" operation."	//
		messagebox(gnv_app.iapp_object.DisplayName,ls_message )
		dw_1.setItem( ll_row, "selected", 1)
		return  
	end if 
end if 

//Commented By Mark Lee 08/13/2015
// When use old request data then the ls_submit value must be null, When use new request data then the ls_submit value must be a valid string.
if trim(ls_submit) <> ";" or (isnull(ls_submit)) then 						//Added By Mark Lee 08/11/2015 add the isnull(ls_submit) condition when request be use old request data with no steps_mark value.
	istr_action.as_do_steps = ls_submit
	CloseWithReturn(Parent, istr_action)
else
	//messagebox
	ls_message = " Please select the step name(s) that you want to " 
	ls_message = ls_message + istr_action.as_action + '. '						//approve or reject.
	messagebox(gnv_app.iapp_object.DisplayName,ls_message )
	return  
end if

end event

type mle_notes from multilineedit within w_request_webform_action
integer x = 37
integer y = 936
integer width = 1833
integer height = 352
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean autohscroll = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
end type

type st_notes from statictext within w_request_webform_action
integer x = 55
integer y = 880
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notes:"
boolean focusrectangle = false
end type

type gb_submit from groupbox within w_request_webform_action
integer x = 14
integer y = 672
integer width = 1874
integer height = 632
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notice"
end type

type gb_1 from groupbox within w_request_webform_action
integer x = 14
integer y = 132
integer width = 1874
integer height = 532
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select the steps"
end type

