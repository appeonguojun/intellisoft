$PBExportHeader$pfc_cst_u_site_survey_collect_dat.sru
$PBExportComments$inhereted from pfc_cst_u_site_survey_collect_data
forward
global type pfc_cst_u_site_survey_collect_dat from pfc_cst_u_site_survey_collect_data
end type
type dw_addresses from u_dw within tabpage_browse
end type
type st_1 from u_st_splitbar within tabpage_browse
end type
end forward

global type pfc_cst_u_site_survey_collect_dat from pfc_cst_u_site_survey_collect_data
integer width = 3433
integer height = 1992
end type
global pfc_cst_u_site_survey_collect_dat pfc_cst_u_site_survey_collect_dat

type variables
protected:

long il_prac_id
long il_adddress_id
long il_zoom
end variables

forward prototypes
public subroutine of_set_prac_id (long al_prac_id)
public function integer of_set_zoom (integer al_zoom)
end prototypes

public subroutine of_set_prac_id (long al_prac_id);



il_prac_id = al_prac_id
end subroutine

public function integer of_set_zoom (integer al_zoom);

il_zoom = al_zoom

return 1
end function

on pfc_cst_u_site_survey_collect_dat.create
int iCurrent
call super::create
end on

on pfc_cst_u_site_survey_collect_dat.destroy
call super::destroy
end on

type tab_review from pfc_cst_u_site_survey_collect_data`tab_review within pfc_cst_u_site_survey_collect_dat
integer x = 0
integer height = 1736
integer selectedtab = 1
end type

event tab_review::selectionchanged;//IF newindex = 1 THEN
//	tab_review.tabpage_browse.dw_browse.SetFocus()
//	IF IsValid( m_pfe_cst_site_survey ) THEN	
//		m_pfe_cst_site_survey.m_file.m_save.enabled = False
//		m_pfe_cst_site_survey.m_file.m_print.enabled = True
//		m_pfe_cst_site_survey.m_edit.m_delete1.enabled = False
//		m_pfe_cst_site_survey.m_edit.m_insert.enabled = False
//	END IF
//ELSEIF newindex = 2 THEN
//	tab_review.tabpage_setup.dw_setup.SetFocus()	
//	tab_review.tabpage_setup.dw_setup.SetColumn( "address_id" )
//	IF IsValid( m_pfe_cst_site_survey ) THEN
//		m_pfe_cst_site_survey.m_file.m_save.enabled = True
//		m_pfe_cst_site_survey.m_file.m_print.enabled = True
//		m_pfe_cst_site_survey.m_edit.m_delete1.enabled = True
//		m_pfe_cst_site_survey.m_edit.m_insert.enabled = True
//	END IF
//ELSE  //index 3
//	tab_review.tabpage_questions.rb_answers.TriggerEvent( Clicked! )
//	tab_review.tabpage_questions.rb_answers.checked = true //maha 090701
//	tab_review.tabpage_questions.dw_questions.SetFocus()
//	w_group_practice.tab_1.tabpage_gp.cb_print.visible = true
//	IF IsValid( m_pfe_cst_site_survey ) THEN	
//		m_pfe_cst_site_survey.m_file.m_save.enabled = True
//		m_pfe_cst_site_survey.m_file.m_print.enabled = True
//		m_pfe_cst_site_survey.m_edit.m_delete1.enabled = False
//		m_pfe_cst_site_survey.m_edit.m_insert.enabled = False
//	END IF
//END IF
end event

type tabpage_browse from pfc_cst_u_site_survey_collect_data`tabpage_browse within tab_review
integer height = 1620
dw_addresses dw_addresses
st_1 st_1
end type

on tabpage_browse.create
this.dw_addresses=create dw_addresses
this.st_1=create st_1
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_addresses
this.Control[iCurrent+2]=this.st_1
end on

on tabpage_browse.destroy
call super::destroy
destroy(this.dw_addresses)
destroy(this.st_1)
end on

type dw_browse from pfc_cst_u_site_survey_collect_data`dw_browse within tabpage_browse
integer y = 716
integer width = 3333
integer height = 872
string dataobject = "d_survey_basic_info_bwse"
end type

event dw_browse::pfc_retrieve;call super::pfc_retrieve;


return this.retrieve(il_adddress_id )
end event

event dw_browse::resize;call super::resize;If gb_autozoom then this.object.datawindow.zoom =il_zoom  //added by gavins 20130107
end event

type tabpage_setup from pfc_cst_u_site_survey_collect_data`tabpage_setup within tab_review
integer height = 1620
end type

type dw_setup from pfc_cst_u_site_survey_collect_data`dw_setup within tabpage_setup
boolean ib_isupdateable = false
end type

event dw_setup::resize;call super::resize;



If gb_autozoom then this.object.datawindow.zoom =il_zoom  //added by gavins 20130107
end event

type tabpage_questions from pfc_cst_u_site_survey_collect_data`tabpage_questions within tab_review
integer height = 1620
end type

type cb_1 from pfc_cst_u_site_survey_collect_data`cb_1 within tabpage_questions
end type

type cb_enlarge from pfc_cst_u_site_survey_collect_data`cb_enlarge within tabpage_questions
end type

type rb_summary from pfc_cst_u_site_survey_collect_data`rb_summary within tabpage_questions
end type

type rb_answers from pfc_cst_u_site_survey_collect_data`rb_answers within tabpage_questions
end type

type dw_survey_questions from pfc_cst_u_site_survey_collect_data`dw_survey_questions within tabpage_questions
end type

type dw_answers from pfc_cst_u_site_survey_collect_data`dw_answers within tabpage_questions
end type

type dw_questions from pfc_cst_u_site_survey_collect_data`dw_questions within tabpage_questions
boolean ib_isupdateable = false
end type

type dw_addresses from u_dw within tabpage_browse
integer width = 3333
integer height = 656
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_prac_addresses_display"
end type

event pfc_retrieve;call super::pfc_retrieve;

this.retrieve(il_prac_id)
return 1
end event

event rowfocuschanged;call super::rowfocuschanged;


if this.rowcount( ) > 0 then
 il_adddress_id = 	this.object.gp_id[currentrow]
 parent.dw_browse.event pfc_retrieve( )
end if
end event

event constructor;call super::constructor;


setnull(il_adddress_id )
THIS.of_SetRowSelect(TRUE)
THIS.inv_rowselect.of_SetStyle(THIS.inv_rowselect.single )
end event

event resize;call super::resize;

If gb_autozoom then this.object.datawindow.zoom =il_zoom  //added by gavins 20130107
end event

type st_1 from u_st_splitbar within tabpage_browse
integer y = 668
integer width = 3333
integer height = 36
boolean bringtotop = true
boolean border = true
borderstyle borderstyle = styleraised!
end type

event constructor;call super::constructor;this.of_Register(parent.dw_addresses, above)
this.of_Register(dw_browse, BELOW )
this.of_SetBarColor(rgb(128,0,0)  )
end event

