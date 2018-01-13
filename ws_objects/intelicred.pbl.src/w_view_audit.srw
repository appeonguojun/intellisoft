$PBExportHeader$w_view_audit.srw
forward
global type w_view_audit from pfc_w_response
end type
type st_run from statictext within w_view_audit
end type
type tab_1 from tab within w_view_audit
end type
type tabpage_1 from userobject within tab_1
end type
type st_thru from statictext within tabpage_1
end type
type st_from from statictext within tabpage_1
end type
type em_thru from editmask within tabpage_1
end type
type em_from from editmask within tabpage_1
end type
type cb_clear from pfc_u_cb within tabpage_1
end type
type cb_search from pfc_u_cb within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type sle_prac from singlelineedit within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_select_screen from u_dw within tabpage_1
end type
type dw_select_user from u_dw within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type dw_dates from u_dw within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_thru st_thru
st_from st_from
em_thru em_thru
em_from em_from
cb_clear cb_clear
cb_search cb_search
st_3 st_3
sle_prac sle_prac
st_2 st_2
st_1 st_1
dw_select_screen dw_select_screen
dw_select_user dw_select_user
gb_1 gb_1
dw_dates dw_dates
end type
type tabpage_2 from userobject within tab_1
end type
type dw_ctx from u_dw within tabpage_2
end type
type st_6 from statictext within tabpage_2
end type
type dw_dates_ctx from u_dw within tabpage_2
end type
type st_5 from statictext within tabpage_2
end type
type dw_tables from u_dw within tabpage_2
end type
type dw_users from u_dw within tabpage_2
end type
type st_4 from statictext within tabpage_2
end type
type gb_2 from groupbox within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_ctx dw_ctx
st_6 st_6
dw_dates_ctx dw_dates_ctx
st_5 st_5
dw_tables dw_tables
dw_users dw_users
st_4 st_4
gb_2 gb_2
end type
type tab_1 from tab within w_view_audit
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_audit from u_dw within w_view_audit
end type
type cb_close from pfc_u_cb within w_view_audit
end type
type cb_print from pfc_u_cb within w_view_audit
end type
type cb_help from pfc_u_cb within w_view_audit
end type
type cb_1 from pfc_u_cb within w_view_audit
end type
end forward

global type w_view_audit from pfc_w_response
integer x = 9
integer y = 248
integer width = 3616
integer height = 2104
string title = "Audit Information For "
boolean center = true
st_run st_run
tab_1 tab_1
dw_audit dw_audit
cb_close cb_close
cb_print cb_print
cb_help cb_help
cb_1 cb_1
end type
global w_view_audit w_view_audit

type variables
String is_original_sql
long ll_ctx_id
end variables

forward prototypes
public function integer wf_run_filter_prac ()
public function integer wf_run_filter_ctx ()
public function integer wf_reset_st_run ()
end prototypes

public function integer wf_run_filter_prac ();String ls_sql
String ls_user
String ls_from_date
String ls_to_date
Integer li_table_id



ls_user =  this.tab_1.tabpage_1.dw_select_user.GetItemString( 1, "user_id" )

IF ls_user <> "All" THEN
	ls_sql = ls_sql + " AND sys_audit.user_id = '" + ls_user + "'"
END IF

li_table_id = this.tab_1.tabpage_1.dw_select_screen.GetItemNumber( 1, "table_id" )

IF li_table_id <> 0 THEN
	ls_sql = ls_sql + " AND sys_audit.table_id = " + String( li_table_id )
END IF

IF this.tab_1.tabpage_1.sle_prac.Text <> "" AND NOT IsNull( this.tab_1.tabpage_1.sle_prac.Text ) THEN
	ls_sql = ls_sql + " AND sys_audit.prac_id= " + String( gl_prac_id )
END IF



this.tab_1.tabpage_1.dw_dates.AcceptText()

ls_from_date = String( this.tab_1.tabpage_1.dw_dates.GetItemDate( 1, "from_date" ), 'yyyy-mm-dd' ) 
ls_to_date =  String( this.tab_1.tabpage_1.dw_dates.GetItemDate( 1, "to_date" ), 'yyyy-mm-dd' ) 

IF ls_from_date <> "" AND NOT IsNull( ls_from_date ) AND ls_from_date <> "00/00/0000" THEN
	IF ls_to_date = "" OR IsNull( ls_to_date ) OR ls_to_date = "00/00/0000" THEN		
		MessageBox("Select Error", "You must select a Thru Date" )
		this.tab_1.tabpage_1.dw_dates.SetColumn( "to_date" )
		Return -1
	END IF
END IF

IF ls_to_date <> "" AND NOT IsNull( ls_to_date ) AND ls_to_date <> "00/00/0000" THEN
	IF ls_from_date = "" OR IsNull( ls_from_date ) OR ls_from_date = "00/00/0000" THEN		
		MessageBox("Select Error", "You must select a From Date" )
		this.tab_1.tabpage_1.dw_dates.SetColumn( "from_date" )
		Return -1
	END IF
END IF

IF ls_from_date <> "" AND NOT IsNull( ls_from_date ) AND ls_from_date <> "00/00/0000" THEN
	IF ls_to_date <> "" AND NOT IsNull( ls_to_date ) AND ls_to_date <> "00/00/0000" THEN	
		ls_from_date = "'" + ls_from_date + "'"
		ls_to_date = "'" + ls_to_date + "'"
		 //--------------------------- APPEON BEGIN ---------------------------
		 //$<modify> 2005-11-15 By: Zhang Lingping
		 //$<reason>  The database function date is unsupported in SQL Server. 
		 //$<reason>  It need be replace with dabase function "convert".
		 
		 //ls_sql = ls_sql + " AND Date(sys_audit.date_time_modified)  >= " + ls_from_date +&
		 //					" AND Date(sys_audit.date_time_modified)  <= " + ls_to_date 
			ls_sql = ls_sql + " AND convert(datetime,  convert( varchar, sys_audit.date_time_modified,102) )  >= " + ls_from_date +&
								" AND convert(datetime, convert( varchar, sys_audit.date_time_modified,102) )  <= " + ls_to_date 
		 //---------------------------- APPEON END ----------------------------
	END IF
END IF

ls_sql = is_original_sql + ls_sql

//messagebox("", ls_sql )

dw_audit.SetSQLSelect ( ls_sql )
dw_audit.SetTransObject( SQLCA )
dw_audit.Retrieve()


return 0
end function

public function integer wf_run_filter_ctx ();/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner 22 October 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/
String ls_sql
String ls_user
String ls_from_date
String ls_to_date
Integer li_table_id
string ls_original_sql

dw_audit.dataobject = ''
dw_audit.dataobject =  'd_view_audit_ctx'

ls_original_sql = dw_audit.Object.DataWindow.Table.Select

ls_user = this.tab_1.tabpage_2.dw_users.GetItemString( 1, "user_id" )

IF ls_user <> "All" THEN
	ls_sql = ls_sql + " AND sys_audit.user_id = '" + ls_user + "'"
END IF

li_table_id = this.tab_1.tabpage_2.dw_tables.GetItemNumber( 1, "table_id" )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<modify> 04.22.2006 By: LeiWei
//$<reason> The way Appeon deals with the NULL value on the Web is different from that in PowerBuilder.
//$<modification> Modify the condition to make sure the applciation works correctly on the Web.
//IF li_table_id <> 0 THEN
IF li_table_id <> 0 AND NOT ISNULL(li_table_id) THEN
//---------------------------- APPEON END ----------------------------
	ls_sql = ls_sql + " AND sys_audit.table_id = " + String( li_table_id )
END IF

this.tab_1.tabpage_2.dw_dates_ctx.AcceptText()

ls_from_date = String(this.tab_1.tabpage_2.dw_dates_ctx.GetItemDate( 1, "from_date" ), 'yyyy-mm-dd' ) 
ls_to_date =  String( this.tab_1.tabpage_2.dw_dates_ctx.GetItemDate( 1, "to_date" ), 'yyyy-mm-dd' ) 


IF  not IsNull( ll_ctx_id ) and ll_ctx_id <> 0 THEN
	ls_sql = ls_sql + " AND sys_audit.prac_id= " + String( ll_ctx_id )
END IF


IF ls_from_date <> "" AND NOT IsNull( ls_from_date ) AND ls_from_date <> "00/00/0000" THEN
	IF ls_to_date = "" OR IsNull( ls_to_date ) OR ls_to_date = "00/00/0000" THEN		
		MessageBox("Select Error", "You must select a Thru Date" )
		this.tab_1.tabpage_2.dw_dates_ctx.SetColumn( "to_date" )
		Return -1
	END IF
END IF

IF ls_to_date <> "" AND NOT IsNull( ls_to_date ) AND ls_to_date <> "00/00/0000" THEN
	IF ls_from_date = "" OR IsNull( ls_from_date ) OR ls_from_date = "00/00/0000" THEN		
		MessageBox("Select Error", "You must select a From Date" )
   	this.tab_1.tabpage_2.dw_dates_ctx.SetColumn( "from_date" )
		Return -1
	END IF
END IF

IF ls_from_date <> "" AND NOT IsNull( ls_from_date ) AND ls_from_date <> "00/00/0000" THEN
	IF ls_to_date <> "" AND NOT IsNull( ls_to_date ) AND ls_to_date <> "00/00/0000" THEN	
		ls_from_date = "'" + ls_from_date + "'"
		ls_to_date = "'" + ls_to_date + "'"
		 //--------------------------- APPEON BEGIN ---------------------------
		 //$<modify> 2005-11-15 By: Zhang Lingping
		 //$<reason>  The database function date is unsupported in SQL Server. 
		 //$<reason>  It need be replace with dabase function "convert".
		 
		 //ls_sql = ls_sql + " AND Date(sys_audit.date_time_modified)  >= " + ls_from_date +&
		 //					" AND Date(sys_audit.date_time_modified)  <= " + ls_to_date 
			ls_sql = ls_sql + " AND convert(datetime,  convert( varchar, sys_audit.date_time_modified,102) )  >= " + ls_from_date +&
								" AND convert(datetime, convert( varchar, sys_audit.date_time_modified,102) )  <= " + ls_to_date 
		 //---------------------------- APPEON END ----------------------------
	END IF
END IF

ls_sql = ls_original_sql + ls_sql

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<modify> 04.22.2006 By: LeiWei
//$<reason> SetSQLSelect doest not work correctly against SQL server database on the Web.
//$<modification> Change it to Modify() to make sure the application runs correctly against
//$<modification> both SQL server database and ASA database on the Web.
//dw_audit.SetSQLSelect ( ls_sql )
dw_audit.Modify('DataWindow.Table.Select="'+ls_sql + '"')
//---------------------------- APPEON END ----------------------------

dw_audit.SetTransObject( SQLCA )
dw_audit.Retrieve()


return 0
end function

public function integer wf_reset_st_run ();

st_run.BorderStyle = StyleRaised!
st_run.TextColor = RGB( 128, 0, 0 )
st_run.Enabled = True

return 0
end function

event open;call super::open;is_original_sql = dw_audit.Object.DataWindow.Table.Select

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.18.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product

IF Isvalid(w_mdi) THEN
	//Check Practitioner Data right
	IF gb_contract_version OR w_mdi.of_security_access( 5800 ) = 0 THEN
		tab_1.tabpage_1.Visible = False
		tab_1.Post SelectTab( 2 )
	END IF		
	
	//Check Contract Data right
	IF w_mdi.of_security_access( 5810 ) = 0 THEN
		tab_1.tabpage_2.Visible = False
	END IF		

END IF

//---------------------------- APPEON END ----------------------------

end event

on w_view_audit.create
int iCurrent
call super::create
this.st_run=create st_run
this.tab_1=create tab_1
this.dw_audit=create dw_audit
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_help=create cb_help
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_run
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_audit
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.cb_help
this.Control[iCurrent+7]=this.cb_1
end on

on w_view_audit.destroy
call super::destroy
destroy(this.st_run)
destroy(this.tab_1)
destroy(this.dw_audit)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_help)
destroy(this.cb_1)
end on

type st_run from statictext within w_view_audit
integer x = 3250
integer y = 492
integer width = 325
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Run Filter"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner 26 October 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

st_run.BorderStyle = StyleLowered!
st_run.TextColor = 0
st_run.Enabled = False

choose case dw_audit.dataobject
	case 'd_view_audit'
		wf_run_filter_prac()
	case else
      wf_run_filter_ctx()
end choose 
end event

type tab_1 from tab within w_view_audit
integer width = 3218
integer height = 588
integer taborder = 50
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
boolean boldselectedtext = true
boolean createondemand = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;

choose case newindex
	case 1
		dw_audit.dataobject =  'd_view_audit'
		dw_audit.settransobject( sqlca)
	case 2
	   dw_audit.dataobject =  'd_view_audit_ctx'
		dw_audit.settransobject( sqlca)
end choose 


st_run.BorderStyle = StyleRaised!
st_run.TextColor = RGB( 128, 0, 0 )
st_run.Enabled = True
end event

event constructor;/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner 25 October 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/
long ll_count
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.18.2006 By: Cao YongWang
//$<reason> The sys.systable table not exists in SQL Server,
//$<reason> Replace it with v_systable if the appliation running in SQL Server.
/*
select count(*)
into :ll_count
from sys.systable 
where table_name='CTX_BASIC_INFO' ;
*/
Choose Case gs_dbType
	Case 'ASA'
		select count(*) into :ll_count from sys.systable where table_name = 'CTX_BASIC_INFO';
	Case 'SQL'
		select count(*) into :ll_count from v_systable where table_name = 'CTX_BASIC_INFO';
End Choose
//---------------------------- APPEON END ----------------------------
	  
if of_get_app_setting("set_cont","I") = 0 or ll_count < 1 then
		 this.tabpage_2.visible = false
end if

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 3182
integer height = 472
long backcolor = 79741120
string text = "Practitioner"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
st_thru st_thru
st_from st_from
em_thru em_thru
em_from em_from
cb_clear cb_clear
cb_search cb_search
st_3 st_3
sle_prac sle_prac
st_2 st_2
st_1 st_1
dw_select_screen dw_select_screen
dw_select_user dw_select_user
gb_1 gb_1
dw_dates dw_dates
end type

on tabpage_1.create
this.st_thru=create st_thru
this.st_from=create st_from
this.em_thru=create em_thru
this.em_from=create em_from
this.cb_clear=create cb_clear
this.cb_search=create cb_search
this.st_3=create st_3
this.sle_prac=create sle_prac
this.st_2=create st_2
this.st_1=create st_1
this.dw_select_screen=create dw_select_screen
this.dw_select_user=create dw_select_user
this.gb_1=create gb_1
this.dw_dates=create dw_dates
this.Control[]={this.st_thru,&
this.st_from,&
this.em_thru,&
this.em_from,&
this.cb_clear,&
this.cb_search,&
this.st_3,&
this.sle_prac,&
this.st_2,&
this.st_1,&
this.dw_select_screen,&
this.dw_select_user,&
this.gb_1,&
this.dw_dates}
end on

on tabpage_1.destroy
destroy(this.st_thru)
destroy(this.st_from)
destroy(this.em_thru)
destroy(this.em_from)
destroy(this.cb_clear)
destroy(this.cb_search)
destroy(this.st_3)
destroy(this.sle_prac)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_select_screen)
destroy(this.dw_select_user)
destroy(this.gb_1)
destroy(this.dw_dates)
end on

type st_thru from statictext within tabpage_1
integer x = 1568
integer y = 256
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Thru"
boolean focusrectangle = false
end type

type st_from from statictext within tabpage_1
integer x = 1083
integer y = 256
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "From"
boolean focusrectangle = false
end type

type em_thru from editmask within tabpage_1
integer x = 1605
integer y = 312
integer width = 393
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

event modified;st_run.BorderStyle = StyleRaised!
st_run.TextColor = RGB( 128, 0, 0 )
st_run.Enabled = True
end event

type em_from from editmask within tabpage_1
integer x = 1070
integer y = 312
integer width = 434
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yyyy"
end type

type cb_clear from pfc_u_cb within tabpage_1
integer x = 2254
integer y = 148
integer width = 229
integer height = 84
integer taborder = 60
boolean bringtotop = true
string text = "&Clear"
boolean cancel = true
end type

event clicked;sle_prac.Text = ""
end event

type cb_search from pfc_u_cb within tabpage_1
integer x = 2011
integer y = 148
integer width = 229
integer height = 84
integer taborder = 50
boolean bringtotop = true
string text = "&Search"
boolean cancel = true
end type

event clicked;gs_search lstr_search

lstr_search.stran_transaction = SQLCA
lstr_search.ls_open_for = "AUDIT" 

OpenWithParm( w_extended_search_new , lstr_search )

IF Message.DoubleParm = -1 THEN
	Return -1

ELSE
	nv_prac_info lnv_full_name
	lnv_full_name = CREATE nv_prac_info
	String ls_name
	ls_name = lnv_full_name.of_get_name( gl_prac_id )
	DESTROY lnv_full_name	
	sle_prac.Text = ls_name
	wf_reset_st_run( )
END IF

// + String( il_facility_id )
end event

type st_3 from statictext within tabpage_1
integer x = 1074
integer y = 88
integer width = 251
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Practitioner"
boolean focusrectangle = false
end type

type sle_prac from singlelineedit within tabpage_1
integer x = 1074
integer y = 156
integer width = 923
integer height = 76
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 12632256
boolean autohscroll = false
end type

type st_2 from statictext within tabpage_1
integer x = 229
integer y = 252
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "User"
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 229
integer y = 84
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Screen"
boolean focusrectangle = false
end type

type dw_select_screen from u_dw within tabpage_1
integer x = 215
integer y = 144
integer width = 745
integer height = 104
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_select_screen_for_field_audit"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )
This.InsertRow( 0 )

DataWindowChild dwchild

This.GetChild( "table_id", dwchild )

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "table_name_allias", "All" )
dwchild.SetItem( 1, "table_id", 0 )

This.SetItem( 1, "table_id", 0 )
end event

event itemchanged;call super::itemchanged;//Start Code Change ---- 02.09.2006 #264 maha
wf_reset_st_run()
//End Code Change---02.09.2006

end event

type dw_select_user from u_dw within tabpage_1
integer x = 219
integer y = 312
integer width = 462
integer height = 104
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_select_user_for_audit_trail"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )
This.InsertRow( 0 )

DataWindowChild dwchild

This.GetChild( "user_id", dwchild )

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "user_id", "All" )

This.SetItem( 1, "user_id", "All" )
end event

event itemchanged;call super::itemchanged;wf_reset_st_run( )
end event

type gb_1 from groupbox within tabpage_1
integer x = 128
integer y = 24
integer width = 2770
integer height = 428
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Filter"
end type

type dw_dates from u_dw within tabpage_1
integer x = 1051
integer y = 256
integer width = 1029
integer height = 168
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_select_from_thru_date"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )
This.InsertRow( 0 )

This.of_SetDropDownCalendar( TRUE )
This.iuo_calendar.of_Register(this.iuo_calendar.DDLB)

end event

event editchanged;wf_reset_st_run()

end event

event itemchanged;call super::itemchanged;wf_reset_st_run( )
end event

event rbuttondown;call super::rbuttondown;integer 	li_Col
integer 	li_Rtn
datetime ldt_Null

SetNull(ldt_Null)

li_Col = this.GetClickedColumn()

li_Rtn = MessageBox("Set Null?","Would you like to set this date to null?",question!,yesno!,2 )

if li_Rtn = 1 then
	this.SetItem(Row,li_Col,ldt_Null)
end if

end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 100
integer width = 3182
integer height = 472
long backcolor = 79741120
string text = "Contract"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_ctx dw_ctx
st_6 st_6
dw_dates_ctx dw_dates_ctx
st_5 st_5
dw_tables dw_tables
dw_users dw_users
st_4 st_4
gb_2 gb_2
end type

on tabpage_2.create
this.dw_ctx=create dw_ctx
this.st_6=create st_6
this.dw_dates_ctx=create dw_dates_ctx
this.st_5=create st_5
this.dw_tables=create dw_tables
this.dw_users=create dw_users
this.st_4=create st_4
this.gb_2=create gb_2
this.Control[]={this.dw_ctx,&
this.st_6,&
this.dw_dates_ctx,&
this.st_5,&
this.dw_tables,&
this.dw_users,&
this.st_4,&
this.gb_2}
end on

on tabpage_2.destroy
destroy(this.dw_ctx)
destroy(this.st_6)
destroy(this.dw_dates_ctx)
destroy(this.st_5)
destroy(this.dw_tables)
destroy(this.dw_users)
destroy(this.st_4)
destroy(this.gb_2)
end on

type dw_ctx from u_dw within tabpage_2
integer x = 1591
integer y = 148
integer width = 933
integer height = 92
integer taborder = 11
string dataobject = "d_ext_ctx"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event constructor;call super::constructor;// start code change --- 11.01.2005 MSKINNER
if of_get_app_setting("set_cont","I") = 1 then
	 
	 long ll_count
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.18.2006 By: Cao YongWang
	//$<reason> The sys.systable table not exists in SQL Server,
	//$<reason> Replace it with v_systable if the appliation running in SQL Server.
	/*
	select count(*)
	into :ll_count
	from sys.systable 
	where table_name='CTX_BASIC_INFO' ;
	*/
	Choose Case gs_dbType
		Case 'ASA'
			select count(*) into :ll_count from sys.systable where table_name = 'CTX_BASIC_INFO';
		Case 'SQL'
			select count(*) into :ll_count from v_systable where table_name = 'CTX_BASIC_INFO';
	End Choose
	//---------------------------- APPEON END ----------------------------

	 if ll_count < 1 then return 
	

	 
	 
	 This.of_SetUpdateAble( False )
	 This.of_SetTransObject( SQLCA )
	 This.InsertRow( 0 )
	 DataWindowChild dwchild
	 This.GetChild( "table_id", dwchild )
	 dwchild.InsertRow( 1 )
	 dwchild.SetItem( 1, "table_name_allias", "All" )
	dwchild.SetItem( 1, "table_id", 0 )
end if
// end code change --- 11.01.2005 MSKINNER




end event

event itemchanged;call super::itemchanged;
wf_reset_st_run( )


ll_ctx_id = long(data)
end event

type st_6 from statictext within tabpage_2
integer x = 1591
integer y = 84
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
string text = "Contract"
boolean focusrectangle = false
end type

type dw_dates_ctx from u_dw within tabpage_2
integer x = 1568
integer y = 252
integer width = 1029
integer height = 168
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_select_from_thru_date"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )
This.InsertRow( 0 )

This.of_SetDropDownCalendar( TRUE )
This.iuo_calendar.of_Register(this.iuo_calendar.DDLB)

end event

event editchanged;//st_run.BorderStyle = StyleRaised!
//st_run.TextColor = RGB( 128, 0, 0 )
//st_run.Enabled = True
end event

event itemchanged;call super::itemchanged;wf_reset_st_run( )
end event

event rbuttondown;call super::rbuttondown;integer 	li_Col
integer 	li_Rtn
datetime ldt_Null

SetNull(ldt_Null)

li_Col = this.GetClickedColumn()

li_Rtn = MessageBox("Set Null?","Would you like to set this date to null?",question!,yesno!,2 )

if li_Rtn = 1 then
	this.SetItem(Row,li_Col,ldt_Null)
end if

end event

type st_5 from statictext within tabpage_2
integer x = 187
integer y = 248
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
string text = "Users:"
boolean focusrectangle = false
end type

type dw_tables from u_dw within tabpage_2
integer x = 169
integer y = 148
integer width = 1330
integer height = 104
integer taborder = 11
string dataobject = "d_select_screen_for_field_audit_ctx"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
end type

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-08-21 By: Evan
//$<Reason> Insert null row to DDDW.
//insertrow(0)
DataWindowChild ldwc_Child

this.InsertRow(0)
this.GetChild("table_id", ldwc_Child)
ldwc_Child.InsertRow(1)
//---------------------------- APPEON END ----------------------------

end event

event itemchanged;call super::itemchanged;wf_reset_st_run( )
end event

type dw_users from u_dw within tabpage_2
integer x = 178
integer y = 300
integer width = 462
integer height = 104
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_select_user_for_audit_trail"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetTransObject( SQLCA )
This.InsertRow( 0 )

DataWindowChild dwchild

This.GetChild( "user_id", dwchild )

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "user_id", "All" )

This.SetItem( 1, "user_id", "All" )
end event

event itemchanged;call super::itemchanged;wf_reset_st_run( )
end event

type st_4 from statictext within tabpage_2
integer x = 187
integer y = 84
integer width = 343
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Screen"
boolean focusrectangle = false
end type

type gb_2 from groupbox within tabpage_2
integer x = 128
integer y = 24
integer width = 2770
integer height = 428
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Filter"
end type

type dw_audit from u_dw within w_view_audit
integer y = 600
integer width = 3570
integer height = 1312
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_view_audit"
boolean hscrollbar = true
boolean ib_isupdateable = false
end type

event constructor;This.of_SetUpdateAble( False )

This.of_SetTransObject(SQLCA)

This.of_SetSort(True)
This.inv_sort.of_SetStyle(3)
This.inv_sort.of_SetColumnDisplayNameStyle( 2 )

This.of_SetFilter(True)
This.inv_Filter.of_SetStyle(1)

This.inv_sort.of_SetColumnHeader(True)


end event

type cb_close from pfc_u_cb within w_view_audit
integer x = 3250
integer y = 92
integer width = 325
integer height = 84
integer taborder = 130
boolean bringtotop = true
string text = "Close"
boolean cancel = true
end type

event clicked;Close( Parent )
end event

type cb_print from pfc_u_cb within w_view_audit
integer x = 3250
integer y = 292
integer width = 325
integer height = 84
integer taborder = 120
boolean bringtotop = true
string text = "&Print"
boolean cancel = true
end type

event clicked;dw_audit.Print()
end event

type cb_help from pfc_u_cb within w_view_audit
integer x = 3250
integer y = 192
integer width = 325
integer height = 84
integer taborder = 40
boolean bringtotop = true
string text = "&Sort"
boolean cancel = true
end type

event clicked;dw_audit.Event pfc_SortDlg()

dw_audit.SetFocus()
end event

type cb_1 from pfc_u_cb within w_view_audit
integer x = 3250
integer y = 392
integer width = 325
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "&Export"
boolean cancel = true
end type

event clicked;call super::clicked;dw_audit.saveas()
end event

