$PBExportHeader$pfc_cst_u_extended_search_alt.sru
forward
global type pfc_cst_u_extended_search_alt from userobject
end type
type cb_iverify from commandbutton within pfc_cst_u_extended_search_alt
end type
type ddlb_search_type from dropdownlistbox within pfc_cst_u_extended_search_alt
end type
type cbx_status from checkbox within pfc_cst_u_extended_search_alt
end type
type dw_view from u_dw within pfc_cst_u_extended_search_alt
end type
type cb_select from commandbutton within pfc_cst_u_extended_search_alt
end type
type cb_search from u_cb within pfc_cst_u_extended_search_alt
end type
type sle_srch_val from singlelineedit within pfc_cst_u_extended_search_alt
end type
type cb_new from commandbutton within pfc_cst_u_extended_search_alt
end type
type gb_search from groupbox within pfc_cst_u_extended_search_alt
end type
type gb_view from groupbox within pfc_cst_u_extended_search_alt
end type
type gb_2 from groupbox within pfc_cst_u_extended_search_alt
end type
type cb_28 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_25 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_24 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_23 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_22 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_21 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_20 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_19 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_18 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_17 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_16 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_15 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_14 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_13 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_12 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_11 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_10 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_9 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_8 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_7 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_6 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_5 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_4 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_3 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_2 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type cb_1 from u_search_letter_button within pfc_cst_u_extended_search_alt
end type
type dw_search from u_dw within pfc_cst_u_extended_search_alt
end type
type dw_org_facility_select from pfc_cst_u_org_facility_selector_vertical within pfc_cst_u_extended_search_alt
end type
type gb_facility from groupbox within pfc_cst_u_extended_search_alt
end type
type cb_close from commandbutton within pfc_cst_u_extended_search_alt
end type
end forward

global type pfc_cst_u_extended_search_alt from userobject
integer width = 3547
integer height = 1680
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_iverify cb_iverify
ddlb_search_type ddlb_search_type
cbx_status cbx_status
dw_view dw_view
cb_select cb_select
cb_search cb_search
sle_srch_val sle_srch_val
cb_new cb_new
gb_search gb_search
gb_view gb_view
gb_2 gb_2
cb_28 cb_28
cb_25 cb_25
cb_24 cb_24
cb_23 cb_23
cb_22 cb_22
cb_21 cb_21
cb_20 cb_20
cb_19 cb_19
cb_18 cb_18
cb_17 cb_17
cb_16 cb_16
cb_15 cb_15
cb_14 cb_14
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_search dw_search
dw_org_facility_select dw_org_facility_select
gb_facility gb_facility
cb_close cb_close
end type
global pfc_cst_u_extended_search_alt pfc_cst_u_extended_search_alt

type variables
Integer il_facility_id
String is_open_for

w_prac_data_1 iw_prac_folder

n_tr SQLCA_1
end variables

forward prototypes
public function integer of_search (string letter)
public function integer of_select_prac (integer ai_row)
public function integer of_close (integer ai_value)
public function integer of_set_open_for (string as_open_for)
public function integer of_set_parent (w_prac_data_1 aw_win)
public function integer of_set_transaction (n_tr as_trans)
end prototypes

public function integer of_search (string letter);String ls_sql
Integer li_rc
Integer i
DataWindowChild dwchild
String ls_all_facilities

dw_search.SetRedraw( False )

IF is_open_for = "INTELLIAPP" THEN
	dw_search.DataObject = "d_extended_search_list_intelliapp"				
ELSE
	dw_search.DataObject = "d_extended_search_list"	
END IF

letter = Upper(letter)

sle_srch_val.Text = letter
ddlb_search_type.Text = "Last Name"

il_facility_id = dw_org_facility_select.GetItemNumber( 1, "facility_id" )


ls_sql =   "SELECT DISTINCT pd_basic.first_name, "+&   
         "pd_basic.middle_name,"+&      
         "pd_basic.title,"+&      
         "pd_basic.name_suffix,"+&      
         "pd_basic.prof_suffix,"+&      
         "pd_basic.ssn,"+&      
         "pd_basic.sex,"+&      
         "pd_basic.prac_category,"+&      
         "pd_basic.date_of_birth,"+&      
         "pd_basic.rec_id,"+&      
         "pd_basic.prac_id,"+&      
         "pd_affil_stat.parent_facility_id,"+&      
         "facility.facility_name,"+&      
         "facility.default_data_view_id,"+&      
         "pd_basic.last_name,"+&      
         "code_lookup.code "
    	IF is_open_for = "INTELLIAPP" THEN	    
          ls_sql = ls_sql + ",net_dev_action_items.action_type,"+&      
         "net_dev_action_items.app_id,"+&      	    
         "net_dev_action_items.action_status " +&
	   "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
	    "{oj pd_affil_stat  LEFT OUTER JOIN net_dev_action_items  ON pd_affil_stat.parent_facility_id =  "+&
	    "net_dev_action_items.facility_id AND pd_affil_stat.prac_id = net_dev_action_items.prac_id}, "+&      
     	    "facility "+&     
	  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     	    "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
	ELSE
		ls_sql = ls_sql + ",pd_affil_stat.date_app_audit_completed," +&   
       	"pd_affil_stat.date_data_entry_completed," +&
	     "pd_affil_stat.date_verif_completed," +&  
     	"pd_affil_stat.apptmnt_start_date "
		
     	ls_sql = ls_sql +  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
     	"facility, "+&   
		"pd_affil_stat "+&
     	"WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
	END IF	    


IF il_facility_id <> 0 THEN
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id = " + String( il_facility_id )
ELSE
	dw_org_facility_select.GetChild( "facility_id", dwchild )
	FOR i = 1 TO dwchild.RowCount()
		ls_all_facilities = ls_all_facilities + String( dwchild.GetItemNumber( i, "facility_id" ) ) + ","
	END FOR
	ls_all_facilities = Mid( ls_all_facilities , 1 , Len( ls_all_facilities ) -1 )
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id in (" + ls_all_facilities + ")"	
END IF

IF is_open_for <> "DELETE" THEN
	IF cbx_status.Checked = True THEN
		ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 3 OR pd_affil_stat.active_status = 4)"  //{pd_affil_stat.active_status = 0 OR} the section in braces was taken out of the code to not return history records 100200 maha
	ELSE
		ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 4)"
	END IF
END IF

IF is_open_for = "DELETE" THEN
	ls_sql = ls_sql + " AND pd_affil_stat.active_status = 2 " 
END IF

ls_sql = ls_sql + " AND {fn left(pd_basic.last_name,1 )} = '" + letter + "'"

ls_sql = ls_sql + " ORDER BY pd_basic.last_name ASC"   

//messagebox("", ls_sql)

dw_search.SetSQLSelect ( ls_sql )
dw_search.SetTransObject( SQLCA_1 )
li_rc = dw_search.Retrieve( )

FOR i = 1 TO li_rc
	dw_search.SetItem( i, "rec_id", 0 )
END FOR


dw_search.SetRedraw( True )
IF dw_search.RowCount() > 0 THEN
	dw_search.SelectRow( 0, False )
	dw_search.SelectRow( 1, True )
END IF


Return 0
end function

public function integer of_select_prac (integer ai_row);Long ll_prac_id
Integer li_parent_facility_id
Integer li_cnt
Integer li_active_status
String ls_full_name
String ls_names[]
Integer li_msg_ans
Integer li_rc
Integer i
Long ll_prac_ids[]
Integer li_facility_ids[]

IF ai_row < 1 THEN
	RETURN -1
END IF

ll_prac_id = dw_search.GetItemNumber(ai_row, "prac_id")

IF is_open_for = "DATAENTRY" THEN
	gl_prac_id = ll_prac_id
	dw_view.AcceptText()
	IF dw_view.GetText() = "" OR IsNull( dw_view.GetText() )  THEN
		MessageBox("View", "Please select a view." )
		Return -1
	END IF
	gl_data_view_id = dw_view.GetItemNumber( 1, "data_view_id" )
	gi_parent_facility = dw_search.GetItemNumber( ai_row, "parent_facility_id" )
	SELECT pd_affil_stat.active_status  
	INTO :li_active_status  
     FROM pd_affil_stat  
     WHERE ( pd_affil_stat.prac_id = :gl_prac_id ) AND  
           ( pd_affil_stat.parent_facility_id = :gi_parent_facility ) AND
		   pd_affil_stat.active_status <> 0;  // line added 091500 maha

	IF li_active_status = 3  THEN
		li_msg_ans = MessageBox("Inactive", "This is an inactive record. Do you want to Re-Active it?", Question!, YesNo!, 1 )
		IF li_msg_ans = 1 THEN
			li_parent_facility_id = dw_search.GetItemNumber( ai_row, "parent_facility_id" )
			UPDATE pd_affil_stat  
     		SET active_status = 1  
	   		WHERE ( pd_affil_stat.prac_id = :ll_prac_id ) AND  
         		( pd_affil_stat.parent_facility_id = :li_parent_facility_id )and
					(pd_affil_stat.active_status = 3);// line added 012201 maha

			UPDATE pd_comm_review
     		SET active_status = 1  
   			WHERE ( pd_comm_review.prac_id = :ll_prac_id ) AND  
         		( pd_comm_review.facility_id = :li_parent_facility_id ) and 
					(pd_comm_review.active_status = 3);// line added 012201 maha
			
		END IF
	END IF
	iw_prac_folder.of_retrieve_prac()
	Return 0
ELSEIF is_open_for = "INTELLIAPP" THEN
	li_rc = dw_search.RowCount()
	gl_prac_ids = ll_prac_ids
	gl_facility_ids = li_facility_ids
	gs_names = ls_names
	FOR i = 1 TO li_rc
		IF dw_search.GetItemNumber( i, "rec_id" ) = 0 THEN
			CONTINUE
		END IF
		li_cnt++
		gi_app_ids[ li_cnt ] = dw_search.GetItemNumber( i, "app_id" )
		gl_prac_ids[ li_cnt ] = dw_search.GetItemNumber( i, "prac_id" )
		gl_facility_ids[ li_cnt ] = dw_search.GetItemNumber( i, "parent_facility_id" )		
		IF Not IsNull( dw_search.GetItemString( i, "first_name" ) ) THEN
			ls_full_name = dw_search.GetItemString( i, "first_name" ) + " "
		END IF
		IF Not IsNull( dw_search.GetItemString( i, "middle_name" ) ) THEN
			ls_full_name = ls_full_name + dw_search.GetItemString( i, "middle_name" ) + " "
		END IF
		gs_names[ li_cnt ] = ls_full_name + dw_search.GetItemString( i, "last_name" )		
	END FOR
ELSEIF is_open_for = "DELETE" THEN
	gl_prac_id = ll_prac_id
ELSEIF is_open_for = "AUDIT" THEN
	gl_prac_id = ll_prac_id
ELSEIF is_open_for = "MEETINGS" OR is_open_for = "REPORTS" THEN
	gi_parent_facility = dw_search.GetItemNumber( ai_row, "parent_facility_id" )
	IF Not IsNull( dw_search.GetItemString( ai_row, "first_name" ) ) THEN
		ls_full_name = dw_search.GetItemString( ai_row, "first_name" ) + " "
	END IF
	IF Not IsNull( dw_search.GetItemString( ai_row, "middle_name" ) ) THEN
		ls_full_name = ls_full_name + dw_search.GetItemString( ai_row, "middle_name" ) + " "
	END IF
	ls_full_name = ls_full_name + dw_search.GetItemString( ai_row, "last_name" )
	CloseWithReturn( Parent, String( ll_prac_id ) + "-" + ls_full_name )
	Return -1
ELSEIF is_open_for = "ACTIONITEMS" THEN
	CloseWithReturn( Parent, String( ll_prac_id ))
	Return -1
END IF

Close( Parent )

RETURN 0


end function

public function integer of_close (integer ai_value);CloseWithReturn( Parent, ai_value )

Return 0
end function

public function integer of_set_open_for (string as_open_for);is_open_for = as_open_for
Integer li_facility

IF is_open_for = "AUDIT" THEN
	cb_new.Visible = False
	cb_new.Visible = False
	cb_iverify.Visible = False	
ELSEIF Left(is_open_for, 7 ) = "REPORTS" THEN
	li_facility = Integer( Mid( is_open_for , 8, 10 ) )
	dw_org_facility_select.SetItem( 1, "facility_id", li_facility )	
	is_open_for = "REPORTS"
	dw_view.Enabled = False
	dw_view.Object.data_view_id.Background.Color= String( RGB(192,192,192))
	cb_new.Visible = False
	cb_iverify.Visible = False	
	//dw_org_facility_select.Enabled = False
	//dw_org_facility_select.Object.facility_id.Background.Color= String( RGB(192,192,192))
ELSEIF Left( is_open_for, 10 ) = "INTELLIAPP" THEN
	li_facility = Integer( Mid( is_open_for , 8, 10 ) )
	dw_org_facility_select.SetItem( 1, "facility_id", li_facility )	
	is_open_for = "INTELLIAPP"
	dw_search.DataObject = "d_extended_search_list_intelliapp"
	dw_search.SetTransObject( SQLCA )
	dw_view.Enabled = False
	dw_view.Object.data_view_id.Background.Color= String( RGB(192,192,192))	
	ddlb_search_type.Text = "Apps Needing Printed"
	cb_new.Visible = False
	cb_iverify.Visible = False
ELSEIF is_open_for = "DELETE" THEN
	is_open_for = "DELETE"
	cbx_status.Checked = False
	cbx_status.Enabled = False
	cb_new.Visible = False
	cb_iverify.Visible = False	
END IF

//is_original_sql = dw_search.Object.DataWindow.Table.Select

gl_prac_id = 0
gl_facility_id = 0

dw_search.SetFocus()


Return 0
end function

public function integer of_set_parent (w_prac_data_1 aw_win);iw_prac_folder = aw_win

Return 0
end function

public function integer of_set_transaction (n_tr as_trans);SQLCA_1 = CREATE n_tr;

//Integer dd

//SELECT data_view.data_view_id
//Into: dd
//FROM data_view  
//WHERE data_view.data_view_id = 1
//using sqlca_1;
//
//IF SQLCA.SQLCODE = -1 THEN
//	messagebox("", sqlca_1.sqlerrtext)
//END IF

SQLCA_1 = as_trans

dw_view.of_SetTransObject( sqlca_1 )
dw_view.of_SetUpdateAble( False )
dw_view.InsertRow( 0 )

DatawindowChild dwchild
dw_view.GetChild( "data_view_id", dwchild )
dwchild.SetTransObject( sqlca_1 )
dwchild.Retrieve( gs_user_id )

dw_view.SetItem( 1, "data_view_id", 1 )
dw_view.SetRow( 1 )
dw_view.ScrollToRow( 1 )

dw_org_facility_select.SetTransObject( sqlca_1 )
dw_org_facility_select.InsertRow( 0 )

dw_org_facility_select.GetChild( "facility_id", dwchild )
dwchild.SetTransObject( SQLCA_1 )
dwchild.Retrieve( gs_user_id )
dwchild.InsertRow(1)
dwchild.SetItem( 1, "facility_name", "All" )
dwchild.SetItem( 1, "facility_id", 0 )

dw_org_facility_select.SetItem( 1, "facility_id", 0 )

Return 1
end function

on pfc_cst_u_extended_search_alt.create
this.cb_iverify=create cb_iverify
this.ddlb_search_type=create ddlb_search_type
this.cbx_status=create cbx_status
this.dw_view=create dw_view
this.cb_select=create cb_select
this.cb_search=create cb_search
this.sle_srch_val=create sle_srch_val
this.cb_new=create cb_new
this.gb_search=create gb_search
this.gb_view=create gb_view
this.gb_2=create gb_2
this.cb_28=create cb_28
this.cb_25=create cb_25
this.cb_24=create cb_24
this.cb_23=create cb_23
this.cb_22=create cb_22
this.cb_21=create cb_21
this.cb_20=create cb_20
this.cb_19=create cb_19
this.cb_18=create cb_18
this.cb_17=create cb_17
this.cb_16=create cb_16
this.cb_15=create cb_15
this.cb_14=create cb_14
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_search=create dw_search
this.dw_org_facility_select=create dw_org_facility_select
this.gb_facility=create gb_facility
this.cb_close=create cb_close
this.Control[]={this.cb_iverify,&
this.ddlb_search_type,&
this.cbx_status,&
this.dw_view,&
this.cb_select,&
this.cb_search,&
this.sle_srch_val,&
this.cb_new,&
this.gb_search,&
this.gb_view,&
this.gb_2,&
this.cb_28,&
this.cb_25,&
this.cb_24,&
this.cb_23,&
this.cb_22,&
this.cb_21,&
this.cb_20,&
this.cb_19,&
this.cb_18,&
this.cb_17,&
this.cb_16,&
this.cb_15,&
this.cb_14,&
this.cb_13,&
this.cb_12,&
this.cb_11,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_search,&
this.dw_org_facility_select,&
this.gb_facility,&
this.cb_close}
end on

on pfc_cst_u_extended_search_alt.destroy
destroy(this.cb_iverify)
destroy(this.ddlb_search_type)
destroy(this.cbx_status)
destroy(this.dw_view)
destroy(this.cb_select)
destroy(this.cb_search)
destroy(this.sle_srch_val)
destroy(this.cb_new)
destroy(this.gb_search)
destroy(this.gb_view)
destroy(this.gb_2)
destroy(this.cb_28)
destroy(this.cb_25)
destroy(this.cb_24)
destroy(this.cb_23)
destroy(this.cb_22)
destroy(this.cb_21)
destroy(this.cb_20)
destroy(this.cb_19)
destroy(this.cb_18)
destroy(this.cb_17)
destroy(this.cb_16)
destroy(this.cb_15)
destroy(this.cb_14)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_search)
destroy(this.dw_org_facility_select)
destroy(this.gb_facility)
destroy(this.cb_close)
end on

event constructor;IF gs_user_id = "SE" THEN
	dw_view.Visible = False
	gb_view.Visible = False
	dw_org_facility_select.Visible = False
	gb_facility.Visible = False
	cb_iverify.Visible = False
	
	gb_search.y = 24
	ddlb_search_type.Y = 84
	cb_search.Y = 84
	sle_srch_val.Y = 196
END IF
end event

type cb_iverify from commandbutton within pfc_cst_u_extended_search_alt
boolean visible = false
integer x = 677
integer y = 1544
integer width = 334
integer height = 92
integer taborder = 330
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "iVerify Add"
end type

event clicked;//gs_pass_ids gs_passed_parms
//
//gs_passed_parms.s_ids[1] = "New"
//
//OpenWithParm( w_iverify_summary, gs_passed_parms )
//
//Return 0
end event

type ddlb_search_type from dropdownlistbox within pfc_cst_u_extended_search_alt
integer x = 32
integer y = 1288
integer width = 695
integer height = 388
integer taborder = 360
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Last Name","I.D.","SS #","Department","Section","Apps Needing Printed"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_srch_val.SetFocus()
end event

event constructor;This.Text = "Last Name"
end event

type cbx_status from checkbox within pfc_cst_u_extended_search_alt
integer x = 32
integer y = 516
integer width = 786
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Include Inactive files in search"
end type

type dw_view from u_dw within pfc_cst_u_extended_search_alt
integer x = 32
integer y = 360
integer width = 955
integer height = 108
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_select_views_dddw_list_with_user_param"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;//
//
This.of_SetTransObject( sqlca_1 )
This.of_SetUpdateAble( False )
This.InsertRow( 0 )

DatawindowChild dwchild
This.GetChild( "data_view_id", dwchild )
dwchild.SetTransObject( sqlca )
dwchild.Retrieve( gs_user_id )

//This.SetItem( 1, "data_view_id", 1 )
//This.SetRow( 1 )
//This.ScrollToRow( 1 )


//
//
//
end event

type cb_select from commandbutton within pfc_cst_u_extended_search_alt
integer x = 5
integer y = 1544
integer width = 334
integer height = 92
integer taborder = 310
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select"
end type

event clicked;IF dw_search.RowCount() > 0 THEN
	of_select_prac( dw_search.GetRow() )
END IF
end event

type cb_search from u_cb within pfc_cst_u_extended_search_alt
integer x = 754
integer y = 1288
integer width = 229
integer height = 84
integer taborder = 330
boolean bringtotop = true
string text = "&Search"
boolean default = true
end type

event clicked;String ls_fld
String ls_sql
String ls_ssn
String ls_name
Integer li_name_len
Integer li_Rc
Integer li_val_len
Integer i
String ls_all_facilities
DatawindowChild dwchild

dw_search.DataObject = "d_extended_search_list"
//debugbreak()
IF ddlb_search_type.Text = "I.D." THEN
	ls_fld = "prac_id"
ELSEIF ddlb_search_type.Text = "Last Name" THEN
	ls_fld = "last_name"
ELSEIF ddlb_search_type.Text = "SS #" THEN
	ls_fld = "ssn"
ELSEIF ddlb_search_type.Text = "Apps Needing Printed" THEN
	ls_fld = "Apps Needing Printed"	
	IF is_open_for = "INTELLIAPP" THEN
		dw_search.DataObject = "d_extended_search_list_intelliapp"				
	ELSE
		dw_search.DataObject = "d_extended_search_list"	
	END IF

END IF

li_val_len = Len(sle_srch_val.Text)


il_facility_id = dw_org_facility_select.GetItemNumber( 1, "facility_id" )

ls_sql =   "SELECT DISTINCT pd_basic.first_name, "+&   
         "pd_basic.middle_name,"+&      
         "pd_basic.title,"+&      
         "pd_basic.name_suffix,"+&      
         "pd_basic.prof_suffix,"+&      
         "pd_basic.ssn,"+&      
         "pd_basic.sex,"+&      
         "pd_basic.prac_category,"+&      
         "pd_basic.date_of_birth,"+&      
         "pd_basic.rec_id,"+&      
         "pd_basic.prac_id,"+&      
         "pd_affil_stat.parent_facility_id,"+&      
         "facility.facility_name,"+&      
         "facility.default_data_view_id,"+&      
         "pd_basic.last_name,"+&      
         "code_lookup.code "
	  IF is_open_for = "INTELLIAPP" THEN
   // 	IF ls_fld = "Apps Needing Printed" THEN	    
          ls_sql = ls_sql + ",net_dev_action_items.action_type,"+&      
         "net_dev_action_items.app_id,"+&      	    
         "net_dev_action_items.action_status " +&
	   "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
	    "{oj pd_affil_stat  LEFT OUTER JOIN net_dev_action_items  ON pd_affil_stat.parent_facility_id =  "+&
	    "net_dev_action_items.facility_id AND pd_affil_stat.prac_id = net_dev_action_items.prac_id}, "+&      
     	    "facility "+&     
	  "WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     	    "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
	ELSE
		ls_sql = ls_sql + ",pd_affil_stat.date_app_audit_completed," +&   
       	"pd_affil_stat.date_data_entry_completed," +&
	     "pd_affil_stat.date_verif_completed," +&  
     	"pd_affil_stat.apptmnt_start_date "
     	ls_sql = ls_sql +  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&
     	"facility, "+&   
		"pd_affil_stat "+&
     	"WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and "+&     
     		 "( pd_affil_stat.parent_facility_id = facility.facility_id ) "
	END IF	    
 //  "FROM {oj pd_basic  LEFT OUTER JOIN code_lookup  ON pd_basic.name_suffix = code_lookup.lookup_code}, "+&   	    
IF il_facility_id <> 0 THEN
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id = " + String( il_facility_id )
ELSE
	dw_org_facility_select.GetChild( "facility_id", dwchild )
	FOR i = 1 TO dwchild.RowCount()
		ls_all_facilities = ls_all_facilities + String( dwchild.GetItemNumber( i, "facility_id" ) ) + ","
	END FOR
	ls_all_facilities = Mid( ls_all_facilities , 1 , Len( ls_all_facilities ) -1 )
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id in (" + ls_all_facilities + ")"
END IF

IF cbx_status.Checked = True THEN
	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 2 OR pd_affil_stat.active_status = 3 OR pd_affil_stat.active_status = 4 )" 
ELSE
	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 4)" 	
END IF
IF is_open_for = "DELETE" THEN
	ls_sql = ls_sql + " AND pd_affil_stat.active_status = 2 " 
END IF

IF Len(sle_srch_val.Text) > 0 OR ls_fld = "Apps Needing Printed" THEN
	IF ls_fld = "prac_id" THEN
		ls_sql = ls_sql + " AND pd_basic.prac_id = " + sle_srch_val.Text
	ELSEIF ls_fld = "last_name" THEN
		ls_name = sle_srch_val.Text
		li_name_len = Len( ls_name )
		FOR i = 1 TO li_name_len
			IF Mid(ls_name, i,1 )  = "'" THEN
				ls_name = Mid(ls_name, 1, i ) + "'" + Mid(ls_name, i+1 , 100 )
				i++
		END IF	
		END FOR
		ls_sql = ls_sql + " AND {fn left(pd_basic.last_name," + String( li_name_len ) + ")}  = '" + Upper(ls_name) + "'"
	ELSEIF ls_fld = "ssn" THEN
		ls_ssn = sle_srch_val.Text
		IF Pos( ls_ssn, "-" ) > 0 THEN
		 	ls_ssn = Mid( sle_srch_val.Text, 1, 3 ) + Mid( sle_srch_val.Text, 5, 2 ) + Mid( sle_srch_val.Text, 8, 4 )
		END IF
		ls_sql = ls_sql + " AND ssn = '" + ls_ssn + "'"
	END IF
	IF ls_fld = "Apps Needing Printed" THEN
		ls_sql = ls_sql + "AND action_type = -3 AND action_status = -110"
	END IF
END IF
ls_sql = ls_sql + " ORDER BY pd_basic.last_name ASC"   
//messagebox("", ls_sql )
dw_search.SetTransObject( SQLCA_1 )
dw_search.SetSQLSelect ( ls_sql )
li_rc = dw_search.Retrieve( )

FOR i = 1 TO li_rc
	dw_search.SetItem( i, "rec_id", 0 )
END FOR

dw_search.SetFocus()
	
end event

type sle_srch_val from singlelineedit within pfc_cst_u_extended_search_alt
integer x = 37
integer y = 1400
integer width = 942
integer height = 80
integer taborder = 340
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_new from commandbutton within pfc_cst_u_extended_search_alt
integer x = 343
integer y = 1544
integer width = 329
integer height = 92
integer taborder = 300
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&New"
end type

event clicked;Integer li_rec_cnt
String ls_demo

IF dw_view.GetText() = "" OR IsNull( dw_view.GetText() )  THEN
	MessageBox("View", "Please select a view." )
	Return -1
END IF

ls_demo = ProfileString(gs_IniFilePathName, "setup", "demo", "None")
IF ls_demo = "1" THEN
	SELECT Count(prac_id)  
	INTO :li_rec_cnt  
	FROM pd_basic  ;
	IF li_rec_cnt > 10 THEN
		MessageBox("Limit", "You can only have up to 10 records in the trial version.")
		Return -1
	END IF
END IF


gl_prac_id = -9
gi_parent_facility = 0
dw_view.AcceptText()
IF dw_view.GetText() = "" OR IsNull( dw_view.GetText() )  THEN
	MessageBox("View", "Please select a view." )
	Return -1
END IF
gl_data_view_id = dw_view.GetItemNumber( 1, "data_view_id" )
iw_prac_folder.of_retrieve_prac()
Return 0



end event

type gb_search from groupbox within pfc_cst_u_extended_search_alt
integer y = 1228
integer width = 1015
integer height = 288
integer taborder = 370
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Custom Search"
end type

type gb_view from groupbox within pfc_cst_u_extended_search_alt
integer y = 284
integer width = 1015
integer height = 212
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select View"
end type

type gb_2 from groupbox within pfc_cst_u_extended_search_alt
integer y = 612
integer width = 1015
integer height = 592
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "First Letter of Last Name Search"
end type

type cb_28 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 745
integer y = 956
integer height = 64
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "z"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_25 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 745
integer y = 892
integer height = 64
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "y"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_24 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 745
integer y = 828
integer height = 64
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "x"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_23 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 745
integer y = 764
integer height = 64
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "w"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_22 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 745
integer y = 700
integer height = 64
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "v"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_21 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 512
integer y = 1084
integer height = 64
integer taborder = 350
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "u"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_20 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 512
integer y = 1020
integer height = 64
integer taborder = 270
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "t"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_19 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 512
integer y = 956
integer height = 64
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "s"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_18 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 512
integer y = 892
integer height = 64
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "r"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_17 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 512
integer y = 828
integer height = 64
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "q"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_16 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 512
integer y = 764
integer height = 64
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "p"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_15 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 512
integer y = 700
integer height = 64
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "o"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_14 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 288
integer y = 1084
integer height = 64
integer taborder = 380
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "n"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_13 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 288
integer y = 1020
integer height = 64
integer taborder = 280
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "m"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_12 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 288
integer y = 956
integer height = 64
integer taborder = 250
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "l"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_11 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 288
integer y = 892
integer height = 64
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "k"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_10 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 288
integer y = 828
integer height = 64
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "j"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_9 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 288
integer y = 764
integer height = 64
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "i"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_8 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 288
integer y = 700
integer height = 64
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "h"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_7 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 64
integer y = 1084
integer height = 64
integer taborder = 390
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "g"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_6 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 64
integer y = 1020
integer height = 64
integer taborder = 290
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "f"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_5 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 64
integer y = 956
integer height = 64
integer taborder = 260
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "e"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_4 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 64
integer y = 892
integer height = 64
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "d"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_3 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 64
integer y = 828
integer height = 64
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "c"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_2 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 64
integer y = 764
integer height = 64
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "b"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_1 from u_search_letter_button within pfc_cst_u_extended_search_alt
integer x = 64
integer y = 700
integer height = 64
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "a"
end type

event clicked;of_search(This.Text)
end event

type dw_search from u_dw within pfc_cst_u_extended_search_alt
integer x = 1056
integer y = 48
integer width = 2473
integer height = 1592
integer taborder = 10
string dataobject = "d_extended_search_list"
boolean hscrollbar = true
end type

event constructor;This.of_SetSort(True)
This.inv_sort.of_SetStyle(3)
This.of_SetReqColumn(True)
This.of_SetUpdateable( False )

This.inv_sort.of_SetColumnHeader(True)

IF gs_cust_type = "C" THEN
	This.Modify( "facility_name_t.text = 'Client'" )
ELSEIF gs_cust_type = "I" THEN
	This.Modify( "facility_name_t.text = 'Payor/Hospital'" )
END IF
end event

event doubleclicked;IF is_open_for = "INTELLIAPP" THEN
	MessageBox("Select", "You must check of the select box and then click the Select button to select practitioners.")
	Return 0
END IF
of_select_prac( row )
end event

event retrieveend;call super::retrieveend;Integer li_default_data_view_id
Integer li_found
String ls_null

SetNull( ls_null )

This.SelectRow(0, False)
This.SelectRow(1, True)

IF This.RowCount() > 0 THEN
	li_default_data_view_id = This.GetItemNumber( 1, "data_view_id" )
	DataWindowChild dwchild
	dw_view.GetChild( "data_view_id", dwchild )
	li_found = dwchild.Find( "data_view_id = " + String( li_default_data_view_id ),1, 1000 )
	IF li_found > 0 THEN
		dw_view.SetItem( 1, "data_view_id", li_default_data_view_id )
	ELSE
		dw_view.Reset()
		dw_view.InsertRow( 0 )
	END IF
END IF
end event

event rowfocuschanged;call super::rowfocuschanged;Integer li_default_data_view_id
Integer li_found
String ls_null

SetNull( ls_null )

IF currentrow > 0 THEN
	This.SelectRow(0, False)
	This.SelectRow(This.GetRow(), True)
	li_default_data_view_id = This.GetItemNumber( currentrow, "data_view_id" )
	DataWindowChild dwchild
	dw_view.GetChild( "data_view_id", dwchild )
	li_found = dwchild.Find( "data_view_id = " + String( li_default_data_view_id ),1, 1000 )
	IF li_found > 0 THEN
		dw_view.SetItem( 1, "data_view_id", li_default_data_view_id )
	ELSE
		dw_view.Reset()
		dw_view.InsertRow( 0 )
	END IF
END IF

end event

type dw_org_facility_select from pfc_cst_u_org_facility_selector_vertical within pfc_cst_u_extended_search_alt
integer x = 32
integer y = 68
integer width = 974
integer height = 168
integer taborder = 30
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;
This.Object.facilities_t.Visible = False


end event

type gb_facility from groupbox within pfc_cst_u_extended_search_alt
integer y = 24
integer width = 1015
integer height = 236
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Facility"
end type

event constructor;IF gs_cust_type = "C" THEN
	This.Text = 'Client'
ELSEIF gs_cust_type = "I" THEN
	This.Text = 'Payor/Hospital'
END IF
end event

type cb_close from commandbutton within pfc_cst_u_extended_search_alt
integer x = 677
integer y = 1544
integer width = 329
integer height = 92
integer taborder = 320
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;of_Close( -1)
end event

