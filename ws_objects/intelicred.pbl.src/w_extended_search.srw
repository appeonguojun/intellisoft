$PBExportHeader$w_extended_search.srw
forward
global type w_extended_search from w_popup
end type
type cb_1 from u_search_letter_button within w_extended_search
end type
type cb_2 from u_search_letter_button within w_extended_search
end type
type cb_3 from u_search_letter_button within w_extended_search
end type
type cb_4 from u_search_letter_button within w_extended_search
end type
type cb_5 from u_search_letter_button within w_extended_search
end type
type cb_6 from u_search_letter_button within w_extended_search
end type
type cb_7 from u_search_letter_button within w_extended_search
end type
type cb_8 from u_search_letter_button within w_extended_search
end type
type cb_9 from u_search_letter_button within w_extended_search
end type
type cb_10 from u_search_letter_button within w_extended_search
end type
type cb_11 from u_search_letter_button within w_extended_search
end type
type cb_12 from u_search_letter_button within w_extended_search
end type
type cb_13 from u_search_letter_button within w_extended_search
end type
type cb_14 from u_search_letter_button within w_extended_search
end type
type cb_15 from u_search_letter_button within w_extended_search
end type
type cb_16 from u_search_letter_button within w_extended_search
end type
type cb_17 from u_search_letter_button within w_extended_search
end type
type cb_18 from u_search_letter_button within w_extended_search
end type
type cb_19 from u_search_letter_button within w_extended_search
end type
type cb_20 from u_search_letter_button within w_extended_search
end type
type cb_21 from u_search_letter_button within w_extended_search
end type
type cb_22 from u_search_letter_button within w_extended_search
end type
type cb_23 from u_search_letter_button within w_extended_search
end type
type cb_24 from u_search_letter_button within w_extended_search
end type
type cb_25 from u_search_letter_button within w_extended_search
end type
type dw_search from u_dw within w_extended_search
end type
type cb_new from commandbutton within w_extended_search
end type
type cb_28 from u_search_letter_button within w_extended_search
end type
type sle_srch_val from singlelineedit within w_extended_search
end type
type gb_4 from groupbox within w_extended_search
end type
type gb_3 from groupbox within w_extended_search
end type
type gb_1 from groupbox within w_extended_search
end type
type cb_search from u_cb within w_extended_search
end type
type rb_id from radiobutton within w_extended_search
end type
type rb_ln from radiobutton within w_extended_search
end type
type rb_ss from radiobutton within w_extended_search
end type
type cb_close from commandbutton within w_extended_search
end type
type cb_select from commandbutton within w_extended_search
end type
type gb_2 from groupbox within w_extended_search
end type
type dw_view from u_dw within w_extended_search
end type
type dw_org_facility_select from pfc_cst_u_org_facility_selector_vertical within w_extended_search
end type
type cbx_status from checkbox within w_extended_search
end type
end forward

global type w_extended_search from w_popup
integer x = 5
integer y = 312
integer width = 3657
integer height = 2112
string title = "Practitioner Search"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
cb_10 cb_10
cb_11 cb_11
cb_12 cb_12
cb_13 cb_13
cb_14 cb_14
cb_15 cb_15
cb_16 cb_16
cb_17 cb_17
cb_18 cb_18
cb_19 cb_19
cb_20 cb_20
cb_21 cb_21
cb_22 cb_22
cb_23 cb_23
cb_24 cb_24
cb_25 cb_25
dw_search dw_search
cb_new cb_new
cb_28 cb_28
sle_srch_val sle_srch_val
gb_4 gb_4
gb_3 gb_3
gb_1 gb_1
cb_search cb_search
rb_id rb_id
rb_ln rb_ln
rb_ss rb_ss
cb_close cb_close
cb_select cb_select
gb_2 gb_2
dw_view dw_view
dw_org_facility_select dw_org_facility_select
cbx_status cbx_status
end type
global w_extended_search w_extended_search

type variables
n_ds ids_datastore

String is_open_for
String is_original_sql
Integer il_facility_id

str_pass istr_pass 
CONSTANT STRING MULTISELECT = "MULTISELECT"


end variables

forward prototypes
public function integer of_search (string letter)
public function integer of_select_prac (integer ai_row)
public function integer of_select_multi ()
end prototypes

public function integer of_search (string letter);String ls_sql

dw_search.SetRedraw( False )

letter = Upper(letter)

sle_srch_val.Text = letter
rb_ln.Checked = True

il_facility_id = dw_org_facility_select.GetItemNumber( 1, "facility_id" )

	

ls_sql =   "SELECT pd_basic.first_name,   "+&
                  "pd_basic.middle_name,   "+&
                  "pd_basic.title,   "+&
                  "pd_basic.name_suffix,"+&   
                  "pd_basic.prof_suffix,   "+&
                  "pd_basic.ssn,   "+&
                  "pd_basic.sex,   "+&
                  "pd_basic.prac_category,   "+&
                  "pd_basic.date_of_birth,   "+&
                  "pd_basic.rec_id,  "+& 
                  "pd_basic.prac_id, "+&  
                  "pd_affil_stat.parent_facility_id,   "+&
                  "facility.facility_name,"+&   
                  "facility.default_data_view_id,   "+&
                  "pd_basic.last_name  " + &
						"FROM  pd_basic," +&
        					 " pd_affil_stat,  "+& 
                      " facility  "+&
   	                " WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and  "+&
                      " ( pd_affil_stat.parent_facility_id = facility.facility_id )"   


ls_sql = ls_sql 

IF il_facility_id <> 0 THEN
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id = " + String( il_facility_id )
END IF

IF cbx_status.Checked = True THEN
	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 2)" 
ELSE
	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 )"
END IF

IF is_open_for = "DELETE" THEN
	ls_sql = ls_sql + " AND pd_affil_stat.active_status = 2 " 
END IF

ls_sql = ls_sql + " AND {fn left(pd_basic.last_name,1 )} = '" + letter + "'"

dw_search.SetSQLSelect ( ls_sql )
dw_search.SetTransObject( SQLCA )
dw_search.Retrieve( )

dw_search.SetRedraw( True )
IF dw_search.RowCount() > 0 THEN
	dw_search.SelectRow( 0, False )
	dw_search.SelectRow( 1, True )
END IF


Return 0
end function

public function integer of_select_prac (integer ai_row);Long ll_prac_id
String ls_full_name

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
	w_mdi.iw_prac_cnt++
	OpenSheet(w_mdi.iw_prac[ w_mdi.iw_prac_cnt], "w_prac_data_1", w_mdi, 4, Layered!)
ELSEIF is_open_for = "DELETE" THEN
	gl_prac_id = ll_prac_id
	Close( This )
ELSEIF is_open_for = "AUDIT" THEN
	gl_prac_id = ll_prac_id
ELSEIF is_open_for = "MEETINGS" OR is_open_for = "REPORTS" THEN
	IF Not IsNull( dw_search.GetItemString( ai_row, "first_name" ) ) THEN
		ls_full_name = dw_search.GetItemString( ai_row, "first_name" ) + " "
	END IF
	IF Not IsNull( dw_search.GetItemString( ai_row, "middle_name" ) ) THEN
		ls_full_name = ls_full_name + dw_search.GetItemString( ai_row, "middle_name" ) + " "
	END IF
	ls_full_name = ls_full_name + dw_search.GetItemString( ai_row, "last_name" )
	CloseWithReturn( This, String( ll_prac_id ) + "-" + ls_full_name )
	Return -1
ELSEIF is_open_for = "ACTIONITEMS" THEN
	CloseWithReturn( This, String( ll_prac_id ))
	Return -1
END IF

Close( This )

RETURN 0


end function

public function integer of_select_multi ();/******************************************************************************************************************
**  [PUBLIC]   : OF_SELECT_MULTI
**==================================================================================================================
**  Purpose   	: INSERTS MULTIPLE ROWS IN TO ISTR_pass.S_U_dw
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



LONG LL_I
long ll_inserted_row
long ll_prac_id
string ls_full_name
CHOOSE CASE ISTR_pass.S_U_dw.DATAOBject
	CASE 'd_ctx_schedule_fee_pracs'
		
		FOR LL_I = 1 TO dw_search.ROWCOUNT( )
			if dw_search.object.selected[ll_i] = 1 then
				if ISTR_pass.S_U_dw.Find( "practitioner_id = " + string(dw_search.object.prac_id[LL_I]) , 1, ISTR_pass.S_U_dw.RowCount()) < 1 then
				
				 ll_inserted_row = istr_pass.s_u_dw.insertrow(0)
				 ll_prac_id = dw_search.object.prac_id[LL_I]
			    istr_pass.s_u_dw.object.practitioner_id[ll_inserted_row] =  ll_prac_id
				 istr_pass.s_u_dw.object.first_name[ll_inserted_row] =  dw_search.object.first_name[LL_I]
				 istr_pass.s_u_dw.object.last_name[ll_inserted_row] =  dw_search.object.last_name[LL_I]

				 SELECT v_full_name.full_name 
				 INTO :ls_full_name  
				 FROM v_full_name 
				 WHERE v_full_name.prac_id =  :ll_prac_id  ;
					 
				 istr_pass.s_u_dw.object.FULL_name[ll_inserted_row] =  ls_full_name
			    end if 
			end if 
			
			
			
		next	
		
		
	CASE ELSE 
		MESSAGEBOX('Deneloper Notice', 'No datawindow control passed to function OF_SELECT_MULTI')
END CHOOSE
Close( This )
RETURN 0
end function

on w_extended_search.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_10=create cb_10
this.cb_11=create cb_11
this.cb_12=create cb_12
this.cb_13=create cb_13
this.cb_14=create cb_14
this.cb_15=create cb_15
this.cb_16=create cb_16
this.cb_17=create cb_17
this.cb_18=create cb_18
this.cb_19=create cb_19
this.cb_20=create cb_20
this.cb_21=create cb_21
this.cb_22=create cb_22
this.cb_23=create cb_23
this.cb_24=create cb_24
this.cb_25=create cb_25
this.dw_search=create dw_search
this.cb_new=create cb_new
this.cb_28=create cb_28
this.sle_srch_val=create sle_srch_val
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_1=create gb_1
this.cb_search=create cb_search
this.rb_id=create rb_id
this.rb_ln=create rb_ln
this.rb_ss=create rb_ss
this.cb_close=create cb_close
this.cb_select=create cb_select
this.gb_2=create gb_2
this.dw_view=create dw_view
this.dw_org_facility_select=create dw_org_facility_select
this.cbx_status=create cbx_status
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.cb_5
this.Control[iCurrent+6]=this.cb_6
this.Control[iCurrent+7]=this.cb_7
this.Control[iCurrent+8]=this.cb_8
this.Control[iCurrent+9]=this.cb_9
this.Control[iCurrent+10]=this.cb_10
this.Control[iCurrent+11]=this.cb_11
this.Control[iCurrent+12]=this.cb_12
this.Control[iCurrent+13]=this.cb_13
this.Control[iCurrent+14]=this.cb_14
this.Control[iCurrent+15]=this.cb_15
this.Control[iCurrent+16]=this.cb_16
this.Control[iCurrent+17]=this.cb_17
this.Control[iCurrent+18]=this.cb_18
this.Control[iCurrent+19]=this.cb_19
this.Control[iCurrent+20]=this.cb_20
this.Control[iCurrent+21]=this.cb_21
this.Control[iCurrent+22]=this.cb_22
this.Control[iCurrent+23]=this.cb_23
this.Control[iCurrent+24]=this.cb_24
this.Control[iCurrent+25]=this.cb_25
this.Control[iCurrent+26]=this.dw_search
this.Control[iCurrent+27]=this.cb_new
this.Control[iCurrent+28]=this.cb_28
this.Control[iCurrent+29]=this.sle_srch_val
this.Control[iCurrent+30]=this.gb_4
this.Control[iCurrent+31]=this.gb_3
this.Control[iCurrent+32]=this.gb_1
this.Control[iCurrent+33]=this.cb_search
this.Control[iCurrent+34]=this.rb_id
this.Control[iCurrent+35]=this.rb_ln
this.Control[iCurrent+36]=this.rb_ss
this.Control[iCurrent+37]=this.cb_close
this.Control[iCurrent+38]=this.cb_select
this.Control[iCurrent+39]=this.gb_2
this.Control[iCurrent+40]=this.dw_view
this.Control[iCurrent+41]=this.dw_org_facility_select
this.Control[iCurrent+42]=this.cbx_status
end on

on w_extended_search.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_10)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.cb_13)
destroy(this.cb_14)
destroy(this.cb_15)
destroy(this.cb_16)
destroy(this.cb_17)
destroy(this.cb_18)
destroy(this.cb_19)
destroy(this.cb_20)
destroy(this.cb_21)
destroy(this.cb_22)
destroy(this.cb_23)
destroy(this.cb_24)
destroy(this.cb_25)
destroy(this.dw_search)
destroy(this.cb_new)
destroy(this.cb_28)
destroy(this.sle_srch_val)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.cb_search)
destroy(this.rb_id)
destroy(this.rb_ln)
destroy(this.rb_ss)
destroy(this.cb_close)
destroy(this.cb_select)
destroy(this.gb_2)
destroy(this.dw_view)
destroy(this.dw_org_facility_select)
destroy(this.cbx_status)
end on

event open;call super::open;
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
**  Created By	:  
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                        Reason
** ------------------------------------------------------------------------------------------------------------------
   mskinner                 20 July 2005                                       added code for contract
********************************************************************************************************************/

Integer li_facility

is_open_for = Message.StringParm

// mskinner 20 july 2005 -- begin added for contract
istr_pass = Message.powerobjectparm


if isvalid(message.powerobjectparm) then 
   dw_search.inv_rowselect.of_SetStyle(DW_SEARCH.inv_rowselect.multiple)
	dw_search.dataobject = 'd_extended_search_list_2'
	dw_search.settransobject( sqlca)
	is_open_for = MULTISELECT 
	dw_search.of_setupdateable( false)
	dw_view.visible = FALSE
	GB_4.VISible = FALSE
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 08.25.2006 By: Liang QingShi
	//$<reason> Contract module modification
	//$<reason> Fix a defect.
	If gb_contract_version = True Then
		cb_new.visible = False
	End If
	//---------------------------- APPEON END ----------------------------
else
	IF is_open_for = "AUDIT" THEN
		cb_new.Visible = False
	ELSEIF Left(is_open_for, 7 ) = "REPORTS" THEN
		li_facility = Integer( Mid( is_open_for , 8, 10 ) )
		dw_org_facility_select.SetItem( 1, "facility_id", li_facility )	
		is_open_for = "REPORTS"
		dw_view.Enabled = False
		dw_view.Object.data_view_id.Background.Color= String( RGB(192,192,192))
		//dw_org_facility_select.Enabled = False
		//dw_org_facility_select.Object.facility_id.Background.Color= String( RGB(192,192,192))
	ELSEIF is_open_for = "DELETE" THEN
		is_open_for = "DELETE"
		cbx_status.Checked = True
		cbx_status.Enabled = False
	END IF
	// mskinner 20 july 2005 --end  added for contract
   
end if 

is_original_sql = dw_search.Object.DataWindow.Table.Select


gl_prac_id = 0
gl_facility_id = 0

dw_search.SetFocus()
end event

type cb_1 from u_search_letter_button within w_extended_search
integer x = 96
integer y = 812
integer height = 64
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "a"
end type

event clicked;of_search(This.Text)
end event

type cb_2 from u_search_letter_button within w_extended_search
integer x = 96
integer y = 876
integer height = 64
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "b"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_3 from u_search_letter_button within w_extended_search
integer x = 96
integer y = 940
integer height = 64
integer taborder = 360
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "c"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_4 from u_search_letter_button within w_extended_search
integer x = 96
integer y = 1004
integer height = 64
integer taborder = 350
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "d"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_5 from u_search_letter_button within w_extended_search
integer x = 96
integer y = 1068
integer height = 64
integer taborder = 340
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "e"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_6 from u_search_letter_button within w_extended_search
integer x = 96
integer y = 1132
integer height = 64
integer taborder = 330
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "f"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_7 from u_search_letter_button within w_extended_search
integer x = 96
integer y = 1196
integer height = 64
integer taborder = 320
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "g"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_8 from u_search_letter_button within w_extended_search
integer x = 320
integer y = 812
integer height = 64
integer taborder = 300
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "h"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_9 from u_search_letter_button within w_extended_search
integer x = 320
integer y = 876
integer height = 64
integer taborder = 290
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "i"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_10 from u_search_letter_button within w_extended_search
integer x = 320
integer y = 940
integer height = 64
integer taborder = 280
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "j"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_11 from u_search_letter_button within w_extended_search
integer x = 320
integer y = 1004
integer height = 64
integer taborder = 270
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "k"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_12 from u_search_letter_button within w_extended_search
integer x = 320
integer y = 1068
integer height = 64
integer taborder = 260
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "l"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_13 from u_search_letter_button within w_extended_search
integer x = 320
integer y = 1132
integer height = 64
integer taborder = 250
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "m"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_14 from u_search_letter_button within w_extended_search
integer x = 320
integer y = 1196
integer height = 64
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "n"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_15 from u_search_letter_button within w_extended_search
integer x = 544
integer y = 812
integer height = 64
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "o"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_16 from u_search_letter_button within w_extended_search
integer x = 544
integer y = 876
integer height = 64
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "p"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_17 from u_search_letter_button within w_extended_search
integer x = 544
integer y = 940
integer height = 64
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "q"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_18 from u_search_letter_button within w_extended_search
integer x = 544
integer y = 1004
integer height = 64
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "r"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_19 from u_search_letter_button within w_extended_search
integer x = 544
integer y = 1068
integer height = 64
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "s"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_20 from u_search_letter_button within w_extended_search
integer x = 544
integer y = 1132
integer height = 64
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "t"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_21 from u_search_letter_button within w_extended_search
integer x = 544
integer y = 1196
integer height = 64
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "u"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_22 from u_search_letter_button within w_extended_search
integer x = 777
integer y = 812
integer height = 64
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "v"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_23 from u_search_letter_button within w_extended_search
integer x = 777
integer y = 876
integer height = 64
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "w"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_24 from u_search_letter_button within w_extended_search
integer x = 777
integer y = 940
integer height = 64
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "x"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type cb_25 from u_search_letter_button within w_extended_search
integer x = 777
integer y = 1004
integer height = 64
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "y"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type dw_search from u_dw within w_extended_search
integer x = 1111
integer y = 48
integer width = 2473
integer height = 1872
integer taborder = 370
boolean bringtotop = true
string dataobject = "d_extended_search_list"
boolean hscrollbar = true
end type

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

event doubleclicked;of_select_prac( row )
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

event constructor;//This.of_SetSort(True)
//This.inv_sort.of_SetStyle(3)
//This.of_SetReqColumn(True)
//This.inv_sort.of_SetColumnHeader(True)

of_SetRowSelect(TRUE)

end event

type cb_new from commandbutton within w_extended_search
integer x = 375
integer y = 1828
integer width = 329
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&New"
end type

event clicked;IF dw_view.GetText() = "" OR IsNull( dw_view.GetText() )  THEN
	MessageBox("View", "Please select a view." )
	Return -1
END IF

gl_prac_id = 0
gl_data_view_id = dw_view.GetItemNumber( 1, "data_view_id" )
gi_parent_facility = 0
w_mdi.iw_prac_cnt++
OpenSheet(w_mdi.iw_prac[ w_mdi.iw_prac_cnt], "w_prac_data_1", w_mdi, 4, Layered!)
Close(Parent)
end event

type cb_28 from u_search_letter_button within w_extended_search
integer x = 777
integer y = 1068
integer height = 64
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "z"
end type

event clicked;call super::clicked;of_search(This.Text)
end event

type sle_srch_val from singlelineedit within w_extended_search
integer x = 78
integer y = 1556
integer width = 919
integer height = 80
integer taborder = 80
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

type gb_4 from groupbox within w_extended_search
integer x = 32
integer y = 324
integer width = 1015
integer height = 268
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

type gb_3 from groupbox within w_extended_search
integer x = 32
integer y = 1340
integer width = 1015
integer height = 436
integer taborder = 310
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

type gb_1 from groupbox within w_extended_search
integer x = 37
integer y = 24
integer width = 1015
integer height = 268
integer taborder = 60
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

type cb_search from u_cb within w_extended_search
integer x = 78
integer y = 1648
integer width = 919
integer taborder = 40
boolean bringtotop = true
string text = "&Search"
boolean default = true
end type

event clicked;String ls_fld
String ls_sql
String ls_ssn
String ls_name
Integer li_name_len
Integer li_val_len
Integer i

IF rb_id.Checked = True THEN
	ls_fld = "prac_id"
ELSEIF rb_ln.Checked = True THEN
	ls_fld = "last_name"
ELSE
	ls_fld = "ssn"
END IF

li_val_len = Len(sle_srch_val.Text)


il_facility_id = dw_org_facility_select.GetItemNumber( 1, "facility_id" )

ls_sql =   "SELECT pd_basic.first_name,   "+&
         "pd_basic.middle_name,   "+&
         "pd_basic.title,   "+&
         "pd_basic.name_suffix,"+&   
         "pd_basic.prof_suffix,   "+&
         "pd_basic.ssn,   "+&
         "pd_basic.sex,   "+&
         "pd_basic.prac_category,   "+&
         "pd_basic.date_of_birth,   "+&
         "pd_basic.rec_id,  "+& 
         "pd_basic.prac_id, "+&  
         "pd_affil_stat.parent_facility_id,   "+&
         "facility.facility_name,"+&   
         "facility.default_data_view_id,   "+&
         "pd_basic.last_name  "+&
    "FROM pd_basic,   "+&
         "pd_affil_stat,  "+& 
         "facility  "+&
   	" WHERE ( pd_basic.prac_id = pd_affil_stat.prac_id ) and  "+&
         "( pd_affil_stat.parent_facility_id = facility.facility_id ) "   


IF il_facility_id <> 0 THEN
	ls_sql = ls_sql + " AND pd_affil_stat.parent_facility_id = " + String( il_facility_id )
END IF

IF cbx_status.Checked = True THEN
	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 OR pd_affil_stat.active_status = 2)" 
ELSE
	ls_sql = ls_sql + " AND (pd_affil_stat.active_status = 1 )" 	
END IF
IF is_open_for = "DELETE" THEN
	ls_sql = ls_sql + " AND pd_affil_stat.active_status = 2 " 
END IF

IF Len(sle_srch_val.Text) > 0 THEN
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
		ls_sql = ls_sql + " AND {fn left(pd_basic.last_name," + String( li_name_len ) + ")} = '" + ls_name + "'"
	ELSEIF ls_fld = "ssn" THEN
		ls_ssn = sle_srch_val.Text
		IF Pos( ls_ssn, "-" ) > 0 THEN
		 	ls_ssn = Mid( sle_srch_val.Text, 1, 3 ) + Mid( sle_srch_val.Text, 5, 2 ) + Mid( sle_srch_val.Text, 8, 4 )
		END IF
		ls_sql = ls_sql + " AND ssn = '" + ls_ssn + "'"
	END IF
END IF

dw_search.SetTransObject( SQLCA )
dw_search.SetSQLSelect ( ls_sql )
dw_search.Retrieve( )

dw_search.SetFocus()
	
end event

type rb_id from radiobutton within w_extended_search
integer x = 69
integer y = 1476
integer width = 192
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
string text = "I.D."
end type

event clicked;sle_srch_val.SetFocus()
end event

type rb_ln from radiobutton within w_extended_search
integer x = 69
integer y = 1400
integer width = 361
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
string text = "Last Name"
boolean checked = true
end type

event clicked;sle_srch_val.SetFocus()
end event

type rb_ss from radiobutton within w_extended_search
integer x = 663
integer y = 1400
integer width = 215
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
string text = "SS#"
end type

event clicked;sle_srch_val.SetFocus()
end event

type cb_close from commandbutton within w_extended_search
integer x = 709
integer y = 1828
integer width = 334
integer height = 92
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;CloseWithReturn( Parent, -1)
end event

type cb_select from commandbutton within w_extended_search
integer x = 37
integer y = 1828
integer width = 334
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select"
end type

event clicked;
IF DW_Search.ROWCOUNT() < 1 THEN RETURN 0


if is_open_for = MULTISELECT THEN
 	OF_SELECT_MULTI()
ELSE 
	of_select_prac( dw_search.GetRow() )
   
END IF
end event

type gb_2 from groupbox within w_extended_search
integer x = 32
integer y = 724
integer width = 1015
integer height = 592
integer taborder = 380
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

type dw_view from u_dw within w_extended_search
integer x = 64
integer y = 432
integer width = 955
integer height = 108
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_select_views_dddw_list_with_user_param"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;

This.of_SetTransObject( SQLCA )
This.of_SetUpdateAble( False )
This.InsertRow( 0 )

DatawindowChild dwchild
This.GetChild( "data_view_id", dwchild )
dwchild.SetTransObject( SQLCA )
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08.04.2006 By: Liang QingShi
//$<reason> Contract module modification
/*
dwchild.Retrieve( gs_user_id)
*/
dwchild.Retrieve( gs_user_id,'P' )

//---------------------------- APPEON END ----------------------------

//This.SetItem( 1, "data_view_id", 1 )
//This.SetRow( 1 )
//This.ScrollToRow( 1 )





end event

type dw_org_facility_select from pfc_cst_u_org_facility_selector_vertical within w_extended_search
integer x = 64
integer y = 76
integer width = 974
integer height = 192
integer taborder = 30
boolean bringtotop = true
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;
This.Object.facilities_t.Visible = False


end event

type cbx_status from checkbox within w_extended_search
integer x = 32
integer y = 624
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

