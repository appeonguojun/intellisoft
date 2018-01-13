$PBExportHeader$uo_npdb_reports.sru
forward
global type uo_npdb_reports from u_base
end type
type cb_codes from commandbutton within uo_npdb_reports
end type
type st_2 from u_st_splitbar within uo_npdb_reports
end type
type st_1 from u_st within uo_npdb_reports
end type
type cb_1 from u_cb within uo_npdb_reports
end type
type dw_1 from u_dw within uo_npdb_reports
end type
type tv_1 from u_tv within uo_npdb_reports
end type
end forward

global type uo_npdb_reports from u_base
integer width = 3392
integer height = 2096
event ue_retrieve ( string as_doc_id )
event pfc_print_all ( )
cb_codes cb_codes
st_2 st_2
st_1 st_1
cb_1 cb_1
dw_1 dw_1
tv_1 tv_1
end type
global uo_npdb_reports uo_npdb_reports

type variables

n_cst_npdb invo
window iw_parent_window
long il_rpt_id //maha041808
long il_count


end variables

forward prototypes
public function string of_report_no_match (long al_id)
public function integer of_set_id (long al_report)
end prototypes

event ue_retrieve(string as_doc_id);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  [PUBLIC]   : ue_create_reports
//==================================================================================================================
//  Purpose   	: open event
//==================================================================================================================
//  Arguments 	: [none] 
//==================================================================================================================
//  Returns   	: [long]     
//==================================================================================================================
//  Notes     	: 	   
//==================================================================================================================
//  Created By	: Michael Skinner  Wednesday 13 October 2004
//==================================================================================================================
//  Modification Log
//   Changed By             Change Date                                               Reason
// ------------------------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int   index
long  ll_lev1, ll_lev2, ll_lev3, ll_lev4
long tvi_hdl = 0
long ll_start, ll_used
//long ll_id   //maha 122106
any aa_any[]
string ls_report_name
string ls_qsta_val


ll_start = Cpu()
dw_1.dataobject = ''

if isvalid(INVO) then destroy INVO



INVO = create n_cst_npdb

invo.of_initialize( )
invo.OF_Start_npdb( invo.is_report , 0, 0,as_doc_id,u_dw)

ll_used = Cpu() - ll_start

tv_1.PictureHeight = 32
tv_1.PictureWidth = 32

///////////////////////////////////////////////////////////
// delete all existing tree view items
///////////////////////////////////////////////////////////

DO UNTIL tv_1.FindItem(RootTreeItem!, 0) = -1
         tv_1.DeleteItem(tvi_hdl)
LOOP

///////////////////////////////////////////////////////////
// Inser all new tree view itams
///////////////////////////////////////////////////////////

if upperbound(invo.ids_report_dws) > 0  then
	dw_1.dataobject = invo.ids_report_dws[1].dataobject //Start Code Change ----04.17.2008 #V8 maha
	invo.ids_report_dws[1].ShareData(dw_1)
	il_count = il_count + 1
	
   //ll_lev1 = tv_1.InsertItemLast(0,  invo.ids_report_dws[1].object.compute_9[1]  ,1)
	
	if  not f_validstr(invo.ids_report_dws[1].object.compute_9[1]) then 
	   ll_lev1 = tv_1.InsertItemLast(0,  invo.ids_report_dws[1].object.compute_9[1]  ,1)
	else
		ls_report_name = of_report_no_match(il_rpt_id)
		if ls_report_name = "PRAC" then//Start Code Change ----05.07.2008 #V8 maha
			ls_report_name = invo.ids_report_dws[1].object.compute_9[1] 
		end if

		ll_lev1 = tv_1.InsertItemLast(0,  ls_report_name,1)
		dw_1.object.t_6.text = ls_report_name
	end if 
	

	for  il_count = 1 to  upperbound(invo.ids_report_dws)   
		
		ls_report_name = invo.ids_report_dws[il_count].object.report_type_code[1]
		
		choose case ls_report_name
			case "C"
				ls_report_name=  'Adverse Action Report'
			case "J"
				ls_report_name=  'Judgment or Conviction Report'
			case "P"
				ls_report_name=  'Medical Malpractice Payment Report'
			//Start Code Change ----05.07.2008 #V8 maha - added legacy reports
			case "M"
				ls_report_name=  'Legacy Medical Malpractice Payment Report'
			case "A"
				ls_report_name=  'Legacy Adverse Action Report'
			//End Code Change---05.07.2008
		end choose
			
		if f_validstr(ls_report_name) then 
			ll_lev3 = tv_1.InsertItemlast(ll_lev1, ls_report_name, 3)
		end if 
	
		invo.ids_report_dws[il_count].Object.DataWindow.Print.DocumentName = invo.ids_report_dws[1].object.compute_9[1] + ls_report_name + string(il_count)
	next

	tv_1.ExpandItem(ll_lev1)
	tv_1.ExpandItem(ll_lev2)
	tv_1.ExpandItem(ll_lev3)
	st_1.TEXT =  invo.is_retreive_time + '~r~n' +  "Total Completion Time:" + STRING(ll_used/1000) + ' seconds'

else
	//messagebox(iw_parent_window.title , 'No reports found for this practitioner. ')
	//close(iw_parent_window)
end if






end event

event pfc_print_all();/******************************************************************************************************************
**  [PUBLIC]   : event pfc_print_all( )
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

il_count = il_count + 1

for il_count = 1 to  upperbound(invo.ids_npdb_dws)  
	dw_1.dataobject = invo.ids_npdb_dws[il_count].dataobject 
	invo.ids_npdb_dws[il_count].ShareData(dw_1)
	dw_1.event dynamic pfc_print()
next

end event

public function string of_report_no_match (long al_id);////Start Code Change ---- 12.21.2006 #V7 maha - created to display message other than just 'no match found'


string ls_qsta_val
string ls_err_code
string ls_err_desc
string ls_report_name

//from the qrst find the no match/rejected value


select query_result_ind, err_cd into :ls_qsta_val, :ls_err_code from npdb_qsta where npdb_hdr_id = :al_id ;
//debugbreak()
if ls_qsta_val = "N" then
	ls_report_name=  'No Reports Found'
elseif ls_qsta_val = "R" then
	//select npdb_list_code_description  into :ls_err_desc from npdb_code_lookup where npdb_list = 'list_q' and npdb_list_code = :ls_err_code;
	ls_report_name =  "File Rejected - " + ls_err_code
else
	ls_report_name = "PRAC"// "No Reports Found"
end if

return ls_report_name
end function

public function integer of_set_id (long al_report);//Start Code Change ----04.18.2008 #V8 maha - added new
//function called from w_npdb_report tab itemchanged
il_rpt_id = al_report

return 1
end function

on uo_npdb_reports.create
int iCurrent
call super::create
this.cb_codes=create cb_codes
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_1=create dw_1
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_codes
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.tv_1
end on

on uo_npdb_reports.destroy
call super::destroy
destroy(this.cb_codes)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.tv_1)
end on

event constructor;call super::constructor;


iw_parent_window = this.GetParent()


end event

type cb_codes from commandbutton within uo_npdb_reports
integer x = 2528
integer y = 1892
integer width = 398
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Rejection codes"
end type

event clicked;open(w_npdb_reject_codes)
end event

type st_2 from u_st_splitbar within uo_npdb_reports
integer x = 695
integer width = 37
integer height = 1868
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = styleraised!
end type

event constructor;call super::constructor;n_cst_color lnvo 

this.of_Register(tv_1, LEFT)
this.of_Register(dw_1, RIGHT)
end event

type st_1 from u_st within uo_npdb_reports
integer x = 1065
integer y = 1884
integer width = 1381
integer height = 124
end type

type cb_1 from u_cb within uo_npdb_reports
integer x = 2944
integer y = 1892
integer width = 407
integer taborder = 20
string text = "&Output Options"
end type

event clicked;call super::clicked;


m_npdb_options NewMenu 
NewMenu = CREATE m_npdb_options

NewMenu.of_setparent( dw_1)
NewMenu.m_options.PopMenu(parent.x + this.x, parent.y + this.y - 190)



end event

type dw_1 from u_dw within uo_npdb_reports
event ue_mail_current ( )
event pfc_print_all ( )
integer x = 731
integer width = 2633
integer height = 1860
integer taborder = 10
boolean hscrollbar = true
boolean ib_isupdateable = false
end type

event ue_mail_current();////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  [PUBLIC]   : EVENT //
//==================================================================================================================
//  Purpose   	: Mail the curennt reports
//==================================================================================================================
//  Arguments 	: [none] 
//==================================================================================================================
//  Returns   	: [long]     
//==================================================================================================================
//  Notes     	: 	   
//==================================================================================================================
//  Created By	: Michael Skinner  
//==================================================================================================================
//  Modification Log
//   Changed By             Change Date                                               Reason
// ------------------------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//SetCapture(Handle(this)) // keeps the hourglass solid


constant string ADVERSE_ACTION_REPORT = 'C'
constant string JUDJEMENT_OR_CONVICTION_REPORT = 'J'
constant string MEDICAL_MALPRACTICE_PAYMENT_REPORT = 'P'
constant string LEGACY_ADVERSE_ACTION_REPORT = 'A'
constant string LEGACY_MEDICAL_MALPRACTICE_PAYMENT_REPORT = 'M'
string ls_report_name

choose case parent.dw_1.object.report_type_code[1]
	case ADVERSE_ACTION_REPORT
		ls_report_name = WordCap ( (Lower ('ADVERSE ACTION REPORT')))
	case JUDJEMENT_OR_CONVICTION_REPORT
		ls_report_name =  WordCap (  lower('JUDJEMENT OR CONVICTION REPORT'))
	case MEDICAL_MALPRACTICE_PAYMENT_REPORT
		ls_report_name=  WordCap (  lower('MEDICAL MALPRACTICE PAYMENT REPORT'))
	case LEGACY_MEDICAL_MALPRACTICE_PAYMENT_REPORT
		ls_report_name=  WordCap (  lower('LEGACY MEDICAL MALPRACTICE PAYMENT REPORT'))
	case LEGACY_ADVERSE_ACTION_REPORT
		ls_report_name=  WordCap (  lower(' LEGACY ADVERSE ACTION REPORT'))
	end choose




parent.dw_1.Object.DataWindow.Print.DocumentName = trim(parent.dw_1.object.compute_9[1])	+ ' - ' +ls_report_name
Super::EVENT ue_save_pdf_for_mailing( )

//releasecapture( )
//Start Code Change ----10.09.2008 #V85 maha -  readded option to use outlook email
if of_get_app_setting("set_56","I") = 1 then
	Super::EVENT ue_mail_bak('NPDB Reports for : ' + trim(parent.dw_1.object.compute_9[1]),'' )
else
	Super::EVENT ue_mail('NPDB Reports for : ' + trim(parent.dw_1.object.compute_9[1]),'' )
end if
//End Code Change---10.09.2008

end event

event pfc_print_all();

LONG LL_COUNT


FOR ll_COUNT = 1 TO upperbound(invo.ids_report_dws) 
	dw_1.dataobject = invo.ids_report_dws[LL_COUNT].dataobject 
	invo.ids_report_dws[LL_COUNT].ShareData(THIS)
	event pfc_print( )
NEXT


end event

event ue_mail;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  [PUBLIC]   : EVENT ue_mail
//==================================================================================================================
//  Purpose   	: Mail the reports
//==================================================================================================================
//  Arguments 	: [none] 
//==================================================================================================================
//  Returns   	: [long]     
//==================================================================================================================
//  Notes     	: 	   
//==================================================================================================================
//  Created By	: Michael Skinner  Wednesday 13 October 2004
//==================================================================================================================
//  Modification Log
//   Changed By             Change Date                                               Reason
// ------------------------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//SetCapture(Handle(this)) // keeps the hourglass solid

constant string ADVERSE_ACTION_REPORT = 'C'
constant string JUDJEMENT_OR_CONVICTION_REPORT = 'J'
constant string MEDICAL_MALPRACTICE_PAYMENT_REPORT = 'P'
constant string LEGACY_ADVERSE_ACTION_REPORT = 'A'
constant string LEGACY_MEDICAL_MALPRACTICE_REPORT = 'M'
string ls_report_name




long ll_count

for il_count = 1 to upperbound(invo.ids_report_dws)   
	parent.dw_1.dataobject = invo.ids_report_dws[il_count].dataobject 
	invo.ids_report_dws[il_count].ShareData(parent.dw_1)
	
	choose case parent.dw_1.object.report_type_code[1]
		case ADVERSE_ACTION_REPORT
			ls_report_name = WordCap ( (Lower ('ADVERSE ACTION REPORT')))
		case JUDJEMENT_OR_CONVICTION_REPORT
			ls_report_name =  WordCap (  lower('JUDJEMENT OR CONVICTION REPORT'))
			case MEDICAL_MALPRACTICE_PAYMENT_REPORT
			ls_report_name=  WordCap (  lower('MEDICAL MALPRACTICE PAYMENT REPORT'))
		end choose
	
	
	parent.dw_1.Object.DataWindow.Print.DocumentName = trim(parent.dw_1.object.compute_9[1]) +' - ' + ls_report_name + '  ' +string(il_count) +  ' of '+ string (upperbound(invo.ids_report_dws))
	event ue_save_pdf_for_mailing( )
next


Super::EVENT ue_mail('NPDB Reports for : ' + wordcap(lower(trim(parent.dw_1.object.compute_9[1])))  ,'' )

//releasecapture( )

end event

type tv_1 from u_tv within uo_npdb_reports
integer width = 695
integer height = 1860
integer taborder = 10
long backcolor = 16777215
string picturename[] = {"Picture!","RunReport!","RunReport!"}
end type

event clicked;call super::clicked;integer li_index

li_index= this.GetItematPointer ( )
li_index  = li_index - 1

if li_index > 0  then
	parent.dw_1.dataobject = invo.ids_report_dws[li_index].dataobject 
	invo.ids_report_dws[li_index].ShareData(parent.dw_1)
   //parent.dw_1.Object.DataWindow.Zoom = 80
   // parent.dw_1.Object.DataWindow.Print.Preview = 'no'
end if

end event

