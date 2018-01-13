$PBExportHeader$pfc_cst_u_profile.sru
forward
global type pfc_cst_u_profile from userobject
end type
type tab_report from tab within pfc_cst_u_profile
end type
type tabpage_profile from userobject within tab_report
end type
type dw_profile from u_dw within tabpage_profile
end type
type tabpage_profile from userobject within tab_report
dw_profile dw_profile
end type
type tabpage_verification from userobject within tab_report
end type
type dw_verification from u_dw within tabpage_verification
end type
type tabpage_verification from userobject within tab_report
dw_verification dw_verification
end type
type tab_report from tab within pfc_cst_u_profile
tabpage_profile tabpage_profile
tabpage_verification tabpage_verification
end type
end forward

global type pfc_cst_u_profile from userobject
integer width = 3543
integer height = 1708
boolean border = true
long backcolor = 79741120
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
tab_report tab_report
end type
global pfc_cst_u_profile pfc_cst_u_profile

type variables
Long il_prac_id
Integer il_facility_id
Long il_view_id

pfc_cst_u_reports inv_reports
pfc_n_cst_ai_printletters inv_printletters //Start Code Change ----10.01.2008 #V85 maha

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 28/08/2008 By: Alan
//$<reason> 
Long il_profile_view_id = 999
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_set_prac_id (long al_prac_id)
public function integer of_run_profile ()
public function integer of_set_facility_id (integer ai_facility_id)
public function integer of_run_verification ()
public function integer of_run_report ()
public function integer of_print_report ()
public function integer of_set_view_id (long al_view_id)
end prototypes

public function integer of_set_prac_id (long al_prac_id);il_prac_id = al_prac_id

Return 0
end function

public function integer of_run_profile ();String ls_facility_name

tab_report.tabpage_profile.dw_profile.DataObject = "d_prf_master"

inv_reports.of_profile_report_v8( tab_report.tabpage_profile.dw_profile, il_facility_id, il_prac_id, il_profile_view_id,false,tab_report.tabpage_profile.dw_profile,il_view_id)

SELECT facility.facility_name  
INTO :ls_facility_name  
FROM facility  
WHERE facility.facility_id = :il_facility_id   ;

tab_report.tabpage_profile.dw_profile.Modify( "selected_facility_t.text = '" + ls_facility_name + "'" )

Return 1
end function

public function integer of_set_facility_id (integer ai_facility_id);il_facility_id = ai_facility_id

Return 1
end function

public function integer of_run_verification ();Integer li_facility_id[1]
String ls_facility_name
string ls_ir_filter //maha 100108
string ls_appt_type //maha 100108
long ll_pracs[]

ll_pracs[1] = il_prac_id

tab_report.tabpage_verification.dw_verification.DataObject = "d_prf_ver_results"
tab_report.tabpage_verification.dw_verification.of_SetTransObject( SQLCA )

li_facility_id[1]= il_facility_id
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

tab_report.tabpage_verification.dw_verification.Retrieve( li_facility_id , ll_pracs )

SELECT facility.facility_name  
INTO :ls_facility_name  
FROM facility  
WHERE facility.facility_id = :il_facility_id   ;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance..
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

tab_report.tabpage_verification.dw_verification.Modify( "selected_facility_t.text = '" + ls_facility_name + "'" )

//Start Code Change ----10.01.2008 #V85 maha
if of_get_app_setting("set_55","I") = 1 then
	select apptmnt_type into :ls_appt_type from pd_affil_stat where active_status in (1,4) and parent_facility_id = :il_facility_id and prac_id = :il_prac_id;
	ls_ir_filter = inv_printletters.of_set_i_r_filter (ls_appt_type,il_facility_id)
	ls_ir_filter  = mid (ls_ir_filter,8) //remove ' and ( '
	ls_ir_filter  = mid (ls_ir_filter,1,len(ls_ir_filter ) - 2) //remove last ')'
	if tab_report.tabpage_verification.dw_verification.setfilter(ls_ir_filter) = 1 then
		tab_report.tabpage_verification.dw_verification.filter()
	else
		messagebox("","ccvs filter failed")
	end if
end if
//End Code Change---10.01.2008
Return 1
end function

public function integer of_run_report ();IF tab_report.SelectedTab = 1 THEN
	of_run_profile()
ELSE
	of_run_verification()
END IF

RETURN 1 
end function

public function integer of_print_report ();IF tab_report.SelectedTab = 1 THEN
	tab_report.tabpage_profile.dw_profile.Print()
ELSE
	tab_report.tabpage_verification.dw_verification.Print()	
END IF

Return 1
end function

public function integer of_set_view_id (long al_view_id);//
il_view_id = al_view_id

return 0
end function

on pfc_cst_u_profile.create
this.tab_report=create tab_report
this.Control[]={this.tab_report}
end on

on pfc_cst_u_profile.destroy
destroy(this.tab_report)
end on

event constructor;inv_reports = CREATE pfc_cst_u_reports
inv_printletters =  create pfc_n_cst_ai_printletters 

end event

event destructor;Destroy inv_reports
Destroy inv_printletters
end event

type tab_report from tab within pfc_cst_u_profile
integer x = 18
integer y = 12
integer width = 3506
integer height = 1676
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
tabposition tabposition = tabsonbottom!
alignment alignment = center!
integer selectedtab = 1
tabpage_profile tabpage_profile
tabpage_verification tabpage_verification
end type

on tab_report.create
this.tabpage_profile=create tabpage_profile
this.tabpage_verification=create tabpage_verification
this.Control[]={this.tabpage_profile,&
this.tabpage_verification}
end on

on tab_report.destroy
destroy(this.tabpage_profile)
destroy(this.tabpage_verification)
end on

type tabpage_profile from userobject within tab_report
integer x = 18
integer y = 16
integer width = 3470
integer height = 1560
long backcolor = 79741120
string text = "Profile"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_profile dw_profile
end type

on tabpage_profile.create
this.dw_profile=create dw_profile
this.Control[]={this.dw_profile}
end on

on tabpage_profile.destroy
destroy(this.dw_profile)
end on

type dw_profile from u_dw within tabpage_profile
integer x = 14
integer y = 12
integer width = 3438
integer height = 1524
integer taborder = 20
boolean hscrollbar = true
end type

event constructor;of_SetTransObject( SQLCA )
This.Modify("DataWindow.Zoom = 96" )



ib_rmbmenu	= true

end event

event rbuttonup;/******************************************************************************************************************
**  [PUBLIC]   : event rbuttonup( /*integer xpos*/, /*integer ypos*/, /*long row*/, /*dwobject dwo */)
**==================================================================================================================
**  Purpose   	: Display pop up menu
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: Ancestor functon has been over ridden and modified	   
**==================================================================================================================
**  Created By	: Michael B. Skinner  23 May 2005
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

boolean		lb_frame
boolean		lb_desired
boolean		lb_readonly
boolean		lb_editstyleattrib
integer		li_tabsequence
long			ll_getrow
string		ls_editstyle
string		ls_val
string		ls_protect
string		ls_colname
string		ls_currcolname
string		ls_type
string		ls_expression
n_cst_conversion	lnv_conversion
m_dw					lm_dw
window				lw_parent
window				lw_frame
window				lw_sheet
window				lw_childparent

// Determine if RMB popup menu should occur
if not ib_RMBmenu or IsNull (dwo) then	return 1

// No RMB support for OLE objects and graphs
ls_type = dwo.Type
if ls_type = "ole" or ls_type = "tableblob" or ls_type = "graph" then return 1

// No RMB support for print preview mode
//if this.Object.DataWindow.Print.Preview = "yes" then return 1

// Determine parent window for PointerX, PointerY offset
this.of_GetParentWindow (lw_parent)
if IsValid (lw_parent) then
	// Get the MDI frame window if available
	lw_frame = lw_parent
	do while IsValid (lw_frame)
		if lw_frame.windowtype = MDI! or lw_frame.windowtype = MDIHelp! then
			lb_frame = true
			exit
		else
			lw_frame = lw_frame.ParentWindow()
		end if
	loop
	
	if lb_frame then
		// If MDI frame window is available, use it as the reference point for the
		// popup menu for sheets (windows opened with OpenSheet function) or child windows
		if lw_parent.windowtype = Child! then
			lw_parent = lw_frame
		else
			lw_sheet = lw_frame.GetFirstSheet()
			if IsValid (lw_sheet) then
				do
					// Use frame reference for popup menu if the parentwindow is a sheet
					if lw_sheet = lw_parent then
						lw_parent = lw_frame
						exit
					end if
					lw_sheet = lw_frame.GetNextSheet (lw_sheet)
				loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
			end if
		end if
	else
		// SDI application.  All windows except for child windows will use the parent
		// window of the control as the reference point for the popmenu
		if lw_parent.windowtype = Child! then
			lw_childparent = lw_parent.ParentWindow()
			if IsValid (lw_childparent) then
				lw_parent = lw_childparent
			end if
		end if
	end if
else
	return 1
end if

// Create popup menu
lm_dw = create m_dw
lm_dw.of_SetParent (this)

//////////////////////////////////////////////////////////////////////////////
// Main popup menu operations
//////////////////////////////////////////////////////////////////////////////
ll_getrow = this.GetRow()

ls_val = this.Object.DataWindow.ReadOnly
lb_readonly = lnv_conversion.of_Boolean (ls_val)

lm_dw.m_table.m_copy.Visible = false
lm_dw.m_table.m_cut.Visible = false
lm_dw.m_table.m_paste.Visible = false
lm_dw.m_table.m_selectall.Visible = false
lm_dw.m_table.m_insert.Visible = false
lm_dw.m_table.m_delete.Visible = false
lm_dw.m_table.m_addrow.Visible = false
lm_dw.m_table.m_restorerow.Visible = false
lm_dw.m_table.m_operators.Visible = false
lm_dw.m_table.m_values.Visible = false
lm_dw.m_table.m_dash12.Visible = false
// DataWindow property entries. (isolate calls to shared variable)
this.event pfc_prermbmenuproperty (lm_dw)

// Allow for any other changes to the popup menu before it opens
this.event pfc_prermbmenu (lm_dw)

// Send rbuttonup notification to row selection service
if IsValid (inv_RowSelect) then inv_RowSelect.event pfc_rbuttonup (xpos, ypos, row, dwo)

// Popup menu
lm_dw.m_table.PopMenu (lw_parent.PointerX() + 5, lw_parent.PointerY() + 10)

destroy lm_dw

return 1


end event

type tabpage_verification from userobject within tab_report
integer x = 18
integer y = 16
integer width = 3470
integer height = 1560
long backcolor = 79741120
string text = "Verification"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_verification dw_verification
end type

on tabpage_verification.create
this.dw_verification=create dw_verification
this.Control[]={this.dw_verification}
end on

on tabpage_verification.destroy
destroy(this.dw_verification)
end on

type dw_verification from u_dw within tabpage_verification
integer x = 14
integer y = 12
integer width = 3442
integer height = 1524
integer taborder = 10
boolean hscrollbar = true
end type

event constructor;This.of_SetTransObject( SQLCA )
end event

