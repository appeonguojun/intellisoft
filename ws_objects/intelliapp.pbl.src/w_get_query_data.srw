$PBExportHeader$w_get_query_data.srw
forward
global type w_get_query_data from w_response
end type
type cbx_only from checkbox within w_get_query_data
end type
type cb_ok from u_cb within w_get_query_data
end type
type dw_1 from u_dw within w_get_query_data
end type
type cb_can from u_cb within w_get_query_data
end type
end forward

global type w_get_query_data from w_response
integer x = 1010
integer y = 560
integer width = 1019
integer height = 1252
string title = "Properties"
boolean controlmenu = false
long backcolor = 80269524
cbx_only cbx_only
cb_ok cb_ok
dw_1 dw_1
cb_can cb_can
end type
global w_get_query_data w_get_query_data

type variables

end variables

forward prototypes
public function integer of_set_lookup (string as_lookup, string as_data, string as_lookup_code, string as_field)
end prototypes

public function integer of_set_lookup (string as_lookup, string as_data, string as_lookup_code, string as_field);//maha created 042205 for setting the the query value lookups
//called from dw_fld_prop itemchanged and retrieveend as well as of_update

datawindowchild dwchild
		
//messagebox("of_setup_query_lookup","")
//debugbreak()
//Start Code Change ---- 02.09.2006 #256 maha	
iF as_lookup = "C" or as_lookup = "A" or as_lookup = "Q"  then
	IF as_lookup = "C" THEN
		dw_1.Modify( as_field + ".dddw.name = 'd_dddw_code_lookup'")
		dw_1.Modify( as_field + ".dddw.datacolumn = 'lookup_code'")			
		dw_1.Modify( as_field + ".dddw.displaycolumn = 'description'")						
	ELSEIF as_lookup = "A" THEN
		dw_1.Modify( as_field + ".dddw.name = 'd_dddw_address_lookup'")
		dw_1.Modify( as_field + ".dddw.datacolumn = 'lookup_code'")			
		dw_1.Modify( as_field + ".dddw.displaycolumn = 'entity_name'")
	
	ELSEIF as_lookup = "Q" THEN
		dw_1.Modify( as_field + ".dddw.name = 'd_dddw_quest_lookup_ia'")
		dw_1.Modify( as_field + ".dddw.datacolumn = 'quest_id'")			
		dw_1.Modify( as_field + ".dddw.displaycolumn = 'short_quest'")
		as_lookup_code = ""
	END IF
//End Code Change---02.09.2006	
	dw_1.GetChild( as_field , dwchild )
	dwchild.SetTransObject( w_train_app.tr_training_data )
	dwchild.Retrieve( as_lookup_code )
	dwchild.scrolltorow(0)
	dwchild.setrow(0)
ELSEIF Upper( as_data ) = "ACTIVE_STATUS" THEN
	dw_1.Modify( as_field + ".dddw.name = 'd_code_lookup_active_inactive'")
	dw_1.Modify( as_field + ".dddw.datacolumn = 'lookup_code'")			
	dw_1.Modify( as_field + ".dddw.displaycolumn = 'description'")	
END IF

return 1
end function

event open;call super::open;Long li_field_id
integer i
//debugbreak()
dw_1.SetTransObject( w_train_app.tr_training_data )

li_field_id = Long( Message.StringParm )

i = dw_1.Retrieve( li_field_id )

if i < 1 then
	messagebox("","Retrieve Failed")
	Closewithreturn( this,"Cancel" )
end if
end event

on w_get_query_data.create
int iCurrent
call super::create
this.cbx_only=create cbx_only
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.cb_can=create cb_can
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_only
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.cb_can
end on

on w_get_query_data.destroy
call super::destroy
destroy(this.cbx_only)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.cb_can)
end on

type cbx_only from checkbox within w_get_query_data
integer x = 183
integer y = 48
integer width = 617
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Update Record # only"
end type

type cb_ok from u_cb within w_get_query_data
integer x = 110
integer y = 964
integer height = 84
integer taborder = 21
boolean bringtotop = true
string text = "&OK"
boolean default = true
end type

event clicked;
dw_1.AcceptText()
w_train_app.ii_cf_record_number = dw_1.GetItemNumber( 1, "record_number" )
w_train_app.ii_cf_query_field = dw_1.GetItemString( 1, "query_field" )
w_train_app.ii_cf_query_operator = dw_1.GetItemString( 1, "query_operator" )
w_train_app.ii_cf_query_value = dw_1.GetItemString( 1, "query_value" )
w_train_app.ii_cf_past_years_query = dw_1.GetItemNumber( 1, "past_years_query" )
//Start Code Change ---- 06.14.2006 #538 maha
if cbx_only.checked = true then
	w_train_app.ii_cf_skip_query = 1
else
	w_train_app.ii_cf_skip_query = 0
end if
//End Code Change---06.14.2006

Close( Parent )
end event

type dw_1 from u_dw within w_get_query_data
integer x = 78
integer y = 128
integer width = 805
integer height = 832
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_app_field_properties_for_copy"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event retrieveend;call super::retrieveend;Integer li_found
Integer li_retval
String ls_lookup_code
String ls_data
string ls_lookup_type
string ls_fld_type
string ls_query_field
DataWindowChild dwchild

//debugbreak()

li_retval = This.GetChild( "query_field", dwchild )
dwchild.SetTransObject( w_train_app.tr_training_data )
dwchild.Retrieve( This.GetItemNumber( 1, "table_id"))
ls_data = This.GetItemString( 1, "query_field" )
li_found = dwchild.Find( "field_name = '" + ls_data + "'", 1, 10000 )

IF li_found > 0 THEN //maha 092404
		ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
		ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
		ls_fld_type = dwchild.GetItemString( li_found, "field_type" )	
		ls_query_field = This.GetItemString( 1, "query_field" )
		of_set_lookup(ls_lookup_type,ls_data,ls_lookup_code,"query_value")
END IF
end event

event constructor;This.of_SetUpdateable( False )
end event

event itemchanged;call super::itemchanged;DataWindowChild dwchild
String ls_lookup_code 
Long li_found
Long li_rc
Long li_nr
String ls_query_field
String ls_fld_type
String ls_lookup_type
String nullval
integer c

SetNull( nullval )

IF This.GetColumnName() = "query_field" THEN	
	c = This.GetChild( "query_field", dwchild )
	li_found = dwchild.Find( "field_name = '" + GetText() + "'", 1, 10000 )
	IF li_found > 0 THEN
		ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
		ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
		ls_fld_type = dwchild.GetItemString( li_found, "field_type" )
		
		ls_query_field = This.GetItemString( row, "query_field" )
		of_set_lookup(ls_lookup_type,data,ls_lookup_code,"query_value")
	END IF
	This.SetItem( row, "query_value", nullval )
	This.SetItem( row, "query_operator", "=" )
//Start Code Change ---- 02.07.2006 #257 maha
//ELSEIF This.GetColumnName() = "query_field_addr" THEN
//	c = This.GetChild( "query_field_addr", dwchild )
//	li_found = dwchild.Find( "field_name = '" + GetText() + "'", 1, 10000 )
//	IF li_found > 0 THEN
//		ls_lookup_code = dwchild.GetItemString( li_found, "lookup_code" )
//		ls_lookup_type = dwchild.GetItemString( li_found, "lookup_type" )
//		ls_fld_type = dwchild.GetItemString( li_found, "field_type" )
//		
//		ls_query_field = This.GetItemString( row, "query_field_addr" )
//		of_set_lookup(ls_lookup_type,data,ls_lookup_code,"query_value_addr")
//	END IF
//	This.SetItem( row, "query_value", nullval )
//	This.SetItem( row, "query_operator", "=" )	
//ELSEIF This.GetColumnName() = "object_type" AND (data = 'Y1' OR data = 'Y2' OR data = "C" OR data = "B" ) THEN
//	This.GetChild( "box_yes_value", dwchild )
//	ls_lookup_code = This.GetItemString( row, "lookup_code")
////	dw_fld_prop.GetChild( "box_yes_value", dwchild )
//	dwchild.SetTransObject( w_train_app.tr_training_data )
//	dwchild.Retrieve( ls_lookup_code )		
//	This.GetChild( "box_no_value", dwchild )
//	ls_lookup_code = This.GetItemString( row, "lookup_code")
//	//dw_fld_prop.GetChild( "box_no_value", dwchild )
//	dwchild.SetTransObject( w_train_app.tr_training_data )
//	//messagebox("2", ls_lookup_code )	
//	dwchild.Retrieve( ls_lookup_code )			
END IF




//ib_saved = False
end event

type cb_can from u_cb within w_get_query_data
integer x = 471
integer y = 964
integer height = 84
integer taborder = 11
boolean bringtotop = true
string text = "&Cancel"
end type

event clicked;//Start Code Change ---- 05.24.2006 #479 maha button added
Closewithreturn( Parent,"Cancel" )
end event

