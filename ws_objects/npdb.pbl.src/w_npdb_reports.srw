$PBExportHeader$w_npdb_reports.srw
forward
global type w_npdb_reports from w_sheet
end type
type cb_track from commandbutton within w_npdb_reports
end type
type cb_dall from commandbutton within w_npdb_reports
end type
type cb_delete from commandbutton within w_npdb_reports
end type
type cb_1 from commandbutton within w_npdb_reports
end type
type reports from tab within w_npdb_reports
end type
type tabpage_1 from userobject within reports
end type
type dw_1 from u_dw within tabpage_1
end type
type rb_3 from radiobutton within tabpage_1
end type
type rb_2 from radiobutton within tabpage_1
end type
type rb_1 from radiobutton within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within reports
dw_1 dw_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type
type tabpage_2 from userobject within reports
end type
type uo_1 from uo_npdb_reports within tabpage_2
end type
type tabpage_2 from userobject within reports
uo_1 uo_1
end type
type tabpage_3 from userobject within reports
end type
type dw_3 from u_dw within tabpage_3
end type
type tabpage_3 from userobject within reports
dw_3 dw_3
end type
type reports from tab within w_npdb_reports
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
end forward

global type w_npdb_reports from w_sheet
integer x = 214
integer y = 221
integer width = 3515
integer height = 2408
string title = "NPDB Reports"
boolean center = true
cb_track cb_track
cb_dall cb_dall
cb_delete cb_delete
cb_1 cb_1
reports reports
end type
global w_npdb_reports w_npdb_reports

type variables


constant string NO_RESPONSE_CODE = 'isNull( verification_complete )'
constant string WITH_RESPONSE_CODE= 'NOT isNull( verification_complete )'
constant string BOTH_RESPONSE_CODE= ''
constant string WINDOW_TITLE = 'NPDB Report Viewer'
n_cst_npdb invo_npdb
string is_current_doc_id
string is_run_doc_id
string is_doc_ids[]

str_pass istr_pass



end variables

forward prototypes
public function integer wf_filter_dw (u_dw adw, string as_filter)
public subroutine of_set_doc_ids (ref string as_doc_ids[])
end prototypes

public function integer wf_filter_dw (u_dw adw, string as_filter);/******************************************************************************************************************
**  [PUBLIC]   : wf_filter_dw( /*u_dw adw*/, /*string as_filter */)
**==================================================================================================================
**  Purpose   	: Filter the datawindow
**==================================================================================================================
**  Arguments 	: [u_dw]  data window
**					: [string] as_filter
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner  14 March 2005
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

adw.setredraw(false)

adw.setfilter(as_filter)
if adw.filter() = -1 then messagebox(this.title, 'filter failed')

adw.setredraw(true)


return reports.tabpage_1.dw_1.success


end function

public subroutine of_set_doc_ids (ref string as_doc_ids[]);

is_doc_ids = as_doc_ids

reports.tabpage_1.dw_1.retrieve( is_doc_ids )
end subroutine

on w_npdb_reports.create
int iCurrent
call super::create
this.cb_track=create cb_track
this.cb_dall=create cb_dall
this.cb_delete=create cb_delete
this.cb_1=create cb_1
this.reports=create reports
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_track
this.Control[iCurrent+2]=this.cb_dall
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.reports
end on

on w_npdb_reports.destroy
call super::destroy
destroy(this.cb_track)
destroy(this.cb_dall)
destroy(this.cb_delete)
destroy(this.cb_1)
destroy(this.reports)
end on

event pfc_postopen;call super::pfc_postopen;//Start Code Change ----05.01.2008 #V8 maha
invo_npdb = create n_cst_npdb
if gs_user_id = "MASTER" then cb_dall.visible = true
//End Code Change---05.01.2008
/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner  14 March 2005
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/
/*
STRING AS_DOC_IDS[]
long ll_i

setnull(is_current_doc_id)
reports.SelectTab(1)


invo_npdb.of_initialize( )

istr_pass = message.powerobjectparm
invo_npdb =  istr_pass.uo1 

reports.tabpage_2.uo_1.invo = invo_npdb

if upperbound(istr_pass.s_string_array) > 0 then 
			reports.tabpage_1.dw_1.retrieve( istr_pass.s_string_array)
			IF reports.tabpage_1.dw_1.ROWcount( ) > 0 THEN 
			 // 
			ELSE 
				//CLOSE(THIS)
			END IF
			// need to clear out the messageparm for the calander service
			setnull(message.powerobjectparm)
			
			n_cst_color  lnv_color
			reports.tabpage_3.dw_3.of_SetDropDownCalendar(TRUE)
			reports.tabpage_3.dw_3.iuo_calendar.of_Register("first_sent", reports.tabpage_3.dw_3.iuo_calendar.DDLB)
			reports.tabpage_3.dw_3.iuo_calendar.of_Register("last_sent", reports.tabpage_3.dw_3.iuo_calendar.DDLB)
			reports.tabpage_3.dw_3.iuo_calendar.of_Register("date_recieved", reports.tabpage_3.dw_3.iuo_calendar.DDLB)
			reports.tabpage_3.dw_3.iuo_calendar.of_SetSaturdayBold(TRUE)
			reports.tabpage_3.dw_3.iuo_calendar.of_SetSaturdayColor (lnv_color.dark_red )
			reports.tabpage_3.dw_3.iuo_calendar.of_SetSundayBold(TRUE)
			reports.tabpage_3.dw_3.iuo_calendar.of_SetSundayColor(lnv_color.dark_red)
			
			THIS.Visible = TRUE
			
	ELSE
	 close(this)
end if 

setpointer(arrow!)
*/


end event

event pfc_preopen;call super::pfc_preopen;/****************************************************************************************************************
** [PUBLIC] EVENT   
**--------------------------------------------------------------------------------------------------------------
** Description: Perform pre open requirments
**--------------------------------------------------------------------------------------------------------------
** Arguments:	
**--------------------------------------------------------------------------------------------------------------
** Returns:	(none) 
**--------------------------------------------------------------------------------------------------------------
** Author:	Michael Skinner 	Date: 		
**--------------------------------------------------------------------------------------------------------------
** ModIFication Log:	
**
** Date            Who                   Change  	
**--------------------------------------------------------------------------------------------------------------
****************************************************************************************************************/

setpointer(hourglass!)

LONG LL_I
string ls_scale

powerobject lo_powerobjects[]

this.of_SetResize(TRUE)

this.inv_resize.of_SetOrigSize (this.workspacewidth( ) ,  this.workspaceheight( ) )

ls_scale = this.inv_resize.scale

FOR LL_I =  1 TO UPPERBOUND(this.CONTrol)
   this.inv_resize.of_Register (this.CONTrol[LL_I]  , ls_scale	 )
NEXT

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search user object
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (reports.tabpage_1, ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(reports.tabpage_1.CONTrol)
   this.inv_resize.of_Register (reports.tabpage_1.CONTrol[LL_I]  , ls_scale )
next


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// The search uo_data_entry
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

this.inv_resize.of_Register (reports.tabpage_2, ls_scale  )

FOR LL_I =  1 TO UPPERBOUND(reports.tabpage_2.CONTrol)
   this.inv_resize.of_Register (reports.tabpage_2.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(reports.tabpage_2.uo_1.CONTrol)
   this.inv_resize.of_Register (reports.tabpage_2.uo_1.CONTrol[LL_I]  , ls_scale )
next

FOR LL_I =  1 TO UPPERBOUND(reports.tabpage_3.CONTrol)
   this.inv_resize.of_Register (reports.tabpage_3.CONTrol[LL_I]  , ls_scale )
next

end event

event pfc_close;call super::pfc_close;

//if isvalid( invo_npdb) then destroy invo_npdb
end event

event close;call super::close;
if isvalid(invo_npdb) then destroy invo_npdb
end event

type cb_track from commandbutton within w_npdb_reports
integer x = 2478
integer y = 4
integer width = 343
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Tracking"
end type

event clicked;open(w_npdb_itp_tracking_report)
end event

type cb_dall from commandbutton within w_npdb_reports
boolean visible = false
integer x = 2021
integer y = 4
integer width = 297
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete All"
end type

event clicked;integer res
long li_id
res = messagebox("Delete","Are you sure you wish to delete all data?", question!, yesno!, 2)

if res = 2 then return

//li_id = reports.tabpage_1.dw_1.getitemnumber(reports.tabpage_1.dw_1.getrow(),"npdb_hdr_id")

invo_npdb.of_delete_npdb_data(0)

reports.tabpage_1.dw_1.retrieve()
end event

type cb_delete from commandbutton within w_npdb_reports
integer x = 2830
integer y = 4
integer width = 297
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete"
end type

event clicked;integer res
long li_id
res = messagebox("Delete","Are you sure you wish to delete this record?", question!, yesno!, 2)

if res = 2 then return
if reports.tabpage_1.dw_1.rowcount( )=0  then return

li_id = reports.tabpage_1.dw_1.getitemnumber(reports.tabpage_1.dw_1.getrow(),"npdb_hdr_id")

invo_npdb.of_delete_npdb_data(li_id)

reports.tabpage_1.dw_1.retrieve()
end event

type cb_1 from commandbutton within w_npdb_reports
integer x = 3136
integer y = 4
integer width = 297
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close( Parent)
end event

type reports from tab within w_npdb_reports
integer x = 50
integer y = 16
integer width = 3438
integer height = 2212
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type

on reports.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3}
end on

on reports.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

event selectionchanging;/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner  14 March 2005
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

if oldindex = newindex then return
if oldindex < 1 then return
long ll_rpt_id //maha 041808

//IF NOT ISNULL(is_current_doc_id) and (is_run_doc_id <> is_current_doc_id) THEN 
IF NOT ISNULL(is_current_doc_id) and (is_run_doc_id <> is_current_doc_id) and is_current_doc_id <> "" THEN //04.29.2008 By Jervis
	reports.tabpage_2.ENabled = TRUE
	reports.tabpage_2.uo_1.event ue_retrieve(is_current_doc_id)
	reports.tabpage_3.dw_3.retrieve(is_current_doc_id)
	is_run_doc_id = is_current_doc_id
END IF //

//if isnull(is_current_doc_id)then
if isnull(is_current_doc_id) or is_current_doc_id = "" then	//04/29/2008 By Jervis
	messagebox(TItle, 'Please select a practitioner.')
   return 1 // do not let the tab change
end if 
	
end event

type tabpage_1 from userobject within reports
integer x = 18
integer y = 100
integer width = 3401
integer height = 2096
long backcolor = 79741120
string text = "NPDB Report Listing"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_1 dw_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.gb_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
end on

type dw_1 from u_dw within tabpage_1
integer x = 23
integer y = 164
integer width = 3365
integer height = 1908
integer taborder = 60
string dataobject = "d_npdb_get_responses"
boolean ib_isupdateable = false
end type

event clicked;call super::clicked;long ll_row //maha 04.18.08
long ll_rpt_id  //maha 04.18.08

if row < 1 then return

if isvalid(dwo) then
	is_current_doc_id = this.object.doc_id[row]
	TItle = WINDOW_TITLE + ' - '  + this.object.compute_1[row]
end if

inv_rowselect.of_RowSelect(row) //???

//Start Code Change ----04.18.2008 #V8 maha - pass report id
ll_row = this.getclickedrow()
dw_1.setrow(ll_row)
ll_rpt_id = this.getitemnumber(ll_row,"npdb_hdr_id")
reports.tabpage_2.uo_1.of_set_id(ll_rpt_id)
//End Code Change---04.18.2008

end event

event constructor;call super::constructor;this.of_SetRowSelect(TRUE)
retrieve( )
wf_filter_dw(dw_1, NO_RESPONSE_CODE)
end event

event retrieveend;call super::retrieveend;
if this.rowcount() > 0 then
  //is_current_doc_id = this.object.doc_id[this.GetSelectedRow(0)] 
   is_current_doc_id = this.object.doc_id[1] 
end if
end event

event doubleclicked;call super::doubleclicked;reports.selecttab( 2)
end event

type rb_3 from radiobutton within tabpage_1
integer x = 965
integer y = 60
integer width = 219
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Both"
end type

event clicked;


wf_filter_dw(dw_1, BOTH_RESPONSE_CODE)
end event

type rb_2 from radiobutton within tabpage_1
integer x = 55
integer y = 60
integer width = 439
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Incomplete"
boolean checked = true
end type

event clicked;

wf_filter_dw(dw_1, NO_RESPONSE_CODE)
end event

type rb_1 from radiobutton within tabpage_1
integer x = 512
integer y = 60
integer width = 379
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Completed"
end type

event clicked;
wf_filter_dw(dw_1, WITH_RESPONSE_CODE)
end event

type gb_1 from groupbox within tabpage_1
integer x = 18
integer y = -4
integer width = 3365
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Query Results"
end type

type tabpage_2 from userobject within reports
integer x = 18
integer y = 100
integer width = 3401
integer height = 2096
long backcolor = 79741120
string text = "Report(s)"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
uo_1 uo_1
end type

on tabpage_2.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on tabpage_2.destroy
destroy(this.uo_1)
end on

type uo_1 from uo_npdb_reports within tabpage_2
integer x = 18
integer y = 20
integer taborder = 50
end type

on uo_1.destroy
call uo_npdb_reports::destroy
end on

type tabpage_3 from userobject within reports
integer x = 18
integer y = 100
integer width = 3401
integer height = 2096
long backcolor = 79741120
string text = "Verification"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_3.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_3.destroy
destroy(this.dw_3)
end on

type dw_3 from u_dw within tabpage_3
integer y = 16
integer width = 3401
integer height = 1996
integer taborder = 70
string dataobject = "d_npdb_verif_info_doc_id"
end type

