$PBExportHeader$w_contract_field_depend.srw
forward
global type w_contract_field_depend from w_response
end type
type cbx_showallcategory from checkbox within w_contract_field_depend
end type
type mle_1 from multilineedit within w_contract_field_depend
end type
type dw_syntax from u_dw_contract within w_contract_field_depend
end type
type st_depend from statictext within w_contract_field_depend
end type
type st_base from statictext within w_contract_field_depend
end type
type cb_delete from commandbutton within w_contract_field_depend
end type
type cb_add from commandbutton within w_contract_field_depend
end type
type st_2 from u_st_splitbar within w_contract_field_depend
end type
type st_1 from u_st_splitbar within w_contract_field_depend
end type
type dw_field from u_dw within w_contract_field_depend
end type
type cb_all from commandbutton within w_contract_field_depend
end type
type cb_save from commandbutton within w_contract_field_depend
end type
type cb_close from commandbutton within w_contract_field_depend
end type
type dw_depend from u_dw within w_contract_field_depend
end type
type dw_base from u_dw within w_contract_field_depend
end type
type gb_lookup from groupbox within w_contract_field_depend
end type
type gb_screen from groupbox within w_contract_field_depend
end type
end forward

global type w_contract_field_depend from w_response
integer width = 3643
integer height = 2524
cbx_showallcategory cbx_showallcategory
mle_1 mle_1
dw_syntax dw_syntax
st_depend st_depend
st_base st_base
cb_delete cb_delete
cb_add cb_add
st_2 st_2
st_1 st_1
dw_field dw_field
cb_all cb_all
cb_save cb_save
cb_close cb_close
dw_depend dw_depend
dw_base dw_base
gb_lookup gb_lookup
gb_screen gb_screen
end type
global w_contract_field_depend w_contract_field_depend

type variables
str_pass istr_pass
string is_screen_type[]
boolean ib_retrieve = true
string	is_depend_dddw_type
end variables

forward prototypes
public function string of_get_lookupname (string as_field, datawindowchild adwc)
public subroutine of_init_screen_type ()
end prototypes

public function string of_get_lookupname (string as_field, datawindowchild adwc);long ll_count
long ll_row


ll_count = adwc.RowCount()
if ll_count = 0 then return ''

ll_row = adwc.Find("field = '" + as_field + "'",1,ll_count)
if ll_row > 0 then
	return adwc.GetItemString(ll_row,'field_lookup_name')
else
	return ''
end if

end function

public subroutine of_init_screen_type ();is_screen_type[1] = "M"   //Search->Search Criteria
is_screen_type[2] = "M" //"S"   //Search->Contract Browse
is_screen_type[3] = "S"   //Details->Contract Detail
is_screen_type[4] = "M"   //Details->Products
is_screen_type[5] = "S"   //Details->Contract Dates
is_screen_type[6] = "M"   //Details->Contracted Company Contact
is_screen_type[7] = "M"   //Details->Our Company Contact
is_screen_type[8] = "M" //"S"   //Details->Notes Tab->Notes
is_screen_type[9] = "S"   //Details->Custom Data Tab->Custom Data
is_screen_type[10] = "M"   //Details->Audit Trail Tab->Audit Trail
is_screen_type[11] = "M"   //Requirements->Profile Selection
is_screen_type[12] = "M"   //Requirements->Profile Detail
is_screen_type[13] = "M"   //Requirements->Profile Detail
is_screen_type[14] = "M"   //Other Contacts->Contacts List
is_screen_type[15] = "M"   //Other Contacts->Contract Details
is_screen_type[16] = "M"   //Other Contacts->Contract Information
is_screen_type[17] = "M"   //Other Contacts->Contract Notes
is_screen_type[18] = "M"   //Locations->Parent Organization
is_screen_type[19] = "M"   //Locations->Group/Location
is_screen_type[20] = "M"   //Locations->Associated Physicians
is_screen_type[21] = "M"   //Locations->Specialties
is_screen_type[22] = "M"   //Organizations->Organization List
is_screen_type[23] = "M"   //Organizations->Address
is_screen_type[24] = "M"   //Organizations->Notes
is_screen_type[25] = "M"   //Organizations->Organization Contacts
is_screen_type[26] = "M"   //Fee Schedules->Browse Tab->Fee Schedules
is_screen_type[27] = "M"   //Fee Schedules->Browse Tab->Fee Schedule Locations
is_screen_type[28] = "M"   //Fee Schedules->Browse Tab->Fees
is_screen_type[29] = "M"   //Fee Schedules->Browse Tab->Providers
is_screen_type[30] = "M"   //Fee Schedules->Notes Tab->User Defined data
is_screen_type[31] = "M"   //Fee Schedule (NM)->Fee Schedule (Non Healthcare)
is_screen_type[32] = "M"   //Document Manager->Document Tab->Search Criteria
is_screen_type[33] = "M"   //Action Items->Action Item List
is_screen_type[34] = "M"   //QRG->Select Data Tab->Report Profiles
is_screen_type[35] = "M"   //QRG->Select Data Tab->Basic Information to Include
is_screen_type[36] = "M"   //QRG->Select Data Tab->Contract Contact Information to Include
is_screen_type[37] = "M"   //QRG->Select Data Tab->Precertifications Requirements
is_screen_type[38] = "M"   //QRG->Select Data Tab->Authorizations Requirements
is_screen_type[39] = "M"   //QRG->Select Data Tab->Fee Schedule Data to Include
is_screen_type[40] = "M"   //QRG->Select Data Tab->Organization Types to Include
is_screen_type[41] = "M"   //QRG->Select Data Tab->Requirements to Include
is_screen_type[42] = "M"   //Action Items->Action Item Browse
is_screen_type[43] = "M"   //Details->Linked Contracts Tab->Linked Contracts
is_screen_type[45] = "M"   //Document Manager->Work Flow Tab->Search Criteria
is_screen_type[46] = "M"   //Document Manager->Work Flow Tab->Action Item Browse
is_screen_type[47] = "M"   //Document Manager->Work Flow Tab->Action Item Detail
is_screen_type[48] = "M"   //Document Manager->Audit Trail Tab->Search Criteria
is_screen_type[49] = "M"   //Document Manager->Audit Trail Tab->Document Browse
is_screen_type[50] = "M"   //Details->Group Access Tab->Group Access

//Added By Ken.Guo 06/13/2012
is_screen_type[51] = "M"  //Document Manager->Document Tab->Added Document Properties
is_screen_type[52] = "M"  //Document Manager->Document Tab->Created Document Properties
is_screen_type[53] = "M"  //Custom Multi->Header->Header
is_screen_type[54] = "M"  //Custom Multi->Detail->Browse
is_screen_type[55] = "M"  //Custom Multi->Detail->Detail
is_screen_type[56] = "M"  //Document Manager->Document Tab->Document Browse
is_screen_type[57] = "M"  //Document Manager->Document Tab->Document History

//Added By Jay Chen 06-12-2014
is_screen_type[61] = "M" //Other Windows->Request WebForm->Browse->Search Criteria
is_screen_type[62] = "M" //Other Windows->Request WebForm->Browse->Request Form Browse
is_screen_type[63] = "M" //Other Windows->Request WebForm->Details->Request Webform Header
is_screen_type[64] = "M" //Other Windows->Request WebForm->Details->Request Webform Detail
is_screen_type[65] = "M" //Other Windows->Request WebForm->Details->Request Webform Log







end subroutine

on w_contract_field_depend.create
int iCurrent
call super::create
this.cbx_showallcategory=create cbx_showallcategory
this.mle_1=create mle_1
this.dw_syntax=create dw_syntax
this.st_depend=create st_depend
this.st_base=create st_base
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.st_2=create st_2
this.st_1=create st_1
this.dw_field=create dw_field
this.cb_all=create cb_all
this.cb_save=create cb_save
this.cb_close=create cb_close
this.dw_depend=create dw_depend
this.dw_base=create dw_base
this.gb_lookup=create gb_lookup
this.gb_screen=create gb_screen
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_showallcategory
this.Control[iCurrent+2]=this.mle_1
this.Control[iCurrent+3]=this.dw_syntax
this.Control[iCurrent+4]=this.st_depend
this.Control[iCurrent+5]=this.st_base
this.Control[iCurrent+6]=this.cb_delete
this.Control[iCurrent+7]=this.cb_add
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.dw_field
this.Control[iCurrent+11]=this.cb_all
this.Control[iCurrent+12]=this.cb_save
this.Control[iCurrent+13]=this.cb_close
this.Control[iCurrent+14]=this.dw_depend
this.Control[iCurrent+15]=this.dw_base
this.Control[iCurrent+16]=this.gb_lookup
this.Control[iCurrent+17]=this.gb_screen
end on

on w_contract_field_depend.destroy
call super::destroy
destroy(this.cbx_showallcategory)
destroy(this.mle_1)
destroy(this.dw_syntax)
destroy(this.st_depend)
destroy(this.st_base)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_field)
destroy(this.cb_all)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.dw_depend)
destroy(this.dw_base)
destroy(this.gb_lookup)
destroy(this.gb_screen)
end on

event pfc_preopen;call super::pfc_preopen;istr_pass = message.powerobjectparm
end event

event open;call super::open;datawindowchild ldwc_child

//Init Screen Type:S-Single row, M-Multi Row
of_init_screen_type()

//Added By Ken.Guo 02/04/2015
String ls_value
ls_value = gnv_user_option.of_get_option_value("contractlogix-super-master", "depend_settings_show_all_category_data" )
If ls_value = '1' Then
	cbx_showallcategory.checked = True
Else
	cbx_showallcategory.checked = False	
End If

//Retrieve screen dddw 
/*
if dw_field.GetChild( "base_screen", ldwc_child) = 1 then
	ldwc_child.SetTransObject( sqlca)
	if ldwc_child.Retrieve( istr_pass.s_long[1] ) < 1 then
		ldwc_child.InsertRow( 0)
	end if
end if
*/
if dw_field.GetChild( "depend_screen_id", ldwc_child) = 1 then
	ldwc_child.SetTransObject( sqlca)
	if ldwc_child.Retrieve( istr_pass.s_long[1] ) < 1 then
		ldwc_child.InsertRow( 0)
	end if
end if

//Retrieve dddw for  Field Depend
if dw_field.GetChild( "base_field_dispaly",ldwc_child) = 1 then
	istr_pass.s_ds.Sharedata(ldwc_child  )
end if

/*
if dw_field.GetChild( "depend_field",ldwc_child) = 1 then
	istr_pass.s_ds.Sharedata(ldwc_child )
end if
*/

//Retrieve Field Depend
if dw_field.event pfc_retrieve() < 1 then
//	cb_add.event clicked()//modified by gavins 20140604
end if
end event

type cbx_showallcategory from checkbox within w_contract_field_depend
boolean visible = false
integer x = 46
integer y = 2320
integer width = 704
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Show All Categories Data "
end type

event clicked;//Added By Ken.Guo 02/04/2015
String ls_value
If cbx_showallcategory.checked = True Then
	gnv_user_option.of_set_option_value("contractlogix-super-master", "depend_settings_show_all_category_data" , '1')
Else
	gnv_user_option.of_set_option_value("contractlogix-super-master", "depend_settings_show_all_category_data" , '0')
End If

dw_base.event pfc_retrieve( )
end event

type mle_1 from multilineedit within w_contract_field_depend
integer x = 69
integer y = 2180
integer width = 3511
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "When you set dependency to filter a field in a multi-row table, this may cause the field be filtered displaying as numbers temporarily in other rows. It will return to normal after you move the focus away and it won’t affect your data integrity. "
boolean border = false
end type

type dw_syntax from u_dw_contract within w_contract_field_depend
boolean visible = false
integer x = 3982
integer y = 1248
integer width = 320
integer height = 332
integer taborder = 20
end type

type st_depend from statictext within w_contract_field_depend
integer x = 1829
integer y = 1140
integer width = 494
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Depend Lookup Data:"
boolean focusrectangle = false
end type

type st_base from statictext within w_contract_field_depend
integer x = 69
integer y = 1140
integer width = 1765
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Base Lookup Data:"
boolean focusrectangle = false
end type

type cb_delete from commandbutton within w_contract_field_depend
integer x = 3209
integer y = 208
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;//Added By Jay Chen 07-30-2014
string ls_field_name
if dw_field.getrow() < 1 then return
ls_field_name = dw_field.GetItemString(dw_field.getrow() ,'base_field') 
if lower(ls_field_name) = 'category' then
	st_base.text = 'Base Lookup Data:'
end if
//end

dw_field.event pfc_deleterow()
end event

type cb_add from commandbutton within w_contract_field_depend
integer x = 3209
integer y = 88
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;dw_field.SetColumn( "base_field")
dw_field.event pfc_addrow()

st_base.text = 'Base Lookup Data:' //Added By Jay Chen 07-30-2014
end event

type st_2 from u_st_splitbar within w_contract_field_depend
integer x = 27
integer y = 1024
integer width = 3570
end type

event constructor;call super::constructor;this.of_register( dw_field, this.above)
this.of_register( dw_depend, this.below)
this.of_register( dw_base, this.below)
this.of_register( st_1, this.below)
//this.of_register( st_base, this.below )
//this.of_register( st_depend, this.below)
this.of_register( gb_screen, this.above)
this.of_register( gb_lookup, this.below)
end event

event mousemove;call super::mousemove;st_base.y = dw_base.y - st_base.height
st_depend.y = st_base.y

end event

type st_1 from u_st_splitbar within w_contract_field_depend
integer x = 1801
integer y = 1192
integer width = 18
integer height = 932
end type

event constructor;call super::constructor;this.of_register( dw_base,this.left )
THIS.OF_register( dw_depend,this.right)
end event

type dw_field from u_dw within w_contract_field_depend
event ue_init_depend_dddw ( long al_screen_id,  datawindowchild adwc_field )
integer x = 69
integer y = 92
integer width = 3104
integer height = 896
integer taborder = 20
string dataobject = "d_depend_field"
boolean hscrollbar = true
boolean livescroll = false
end type

event ue_init_depend_dddw(long al_screen_id, datawindowchild adwc_field);datawindow   ldw[] 
integer li_count,li_i,ll_row  
string ls_lookup_name
string ls_display_name, ls_dddw_name

string ls_name,ls_text,ls_error , ls_coltype , ls_tablename,ls_DbName
string ls_tab_name,ls_dw_name[],ls_dataobject[]

parent.setredraw(false)


ls_tab_name = gnv_data.of_get_table_name( al_screen_id, 'C', 'tab_name')

ldw[1] = dw_syntax

ls_dw_name[1] 		= gnv_data.of_get_table_name( al_screen_id, 'C', 'dw_name')
ls_dataobject[1] 	= gnv_data.of_get_table_name( al_screen_id, 'C', 'dataobject')

f_create_contract_dw(istr_pass.s_long[1] ,ls_tab_name,ldw,ls_dw_name,ls_dataobject)


dw_syntax.visible = false
li_count  = integer(dw_syntax.Describe("DataWindow.Column.Count"))

If li_count > 0  Then
	For li_i = 1 to li_count
		ls_name = dw_syntax.Describe("#"+string(li_i) + ".name")
		if dw_syntax.Describe(ls_name + ".edit.style") <> 'dddw' then continue
		if long(dw_syntax.describe(ls_name + ".y")) > long(dw_syntax.describe("datawindow.detail.height")) then continue
		if long(dw_syntax.describe(ls_name + ".visible")) = 0 then continue
		
		ls_lookup_name = dw_syntax.Describe( ls_name + ".tag")
		ls_dddw_name = lower( dw_syntax.Describe("#" +STRING(li_i) + ".DDDW.Name")) //Modified by gavins 03092016
		//Added By Jay Chen 03-22-2016
		if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then 	
			if ls_lookup_name = '?' or ls_lookup_name = '!' then
				ls_lookup_name = 'All'
			end if
		end if
		//end
		if ls_lookup_name <> ''  Or ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then 	
			ls_display_name = dw_syntax.Describe( ls_name + "_t.text")
			if ls_display_name = '!' or ls_display_name = '?' then ls_display_name = ls_name
			//Modified by gavins 03092016
			If len(ls_name) > 1 and len(ls_lookup_name) > 1 Or &
			( (ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' ) and &
			( Upper( ls_lookup_name ) = 'A' Or Upper( ls_lookup_name ) = 'B' Or Upper( ls_lookup_name ) = 'O' Or Upper( ls_lookup_name ) = 'ALL'  or lower(ls_name) = 'app_facility' ) ) then	
				ll_row = adwc_field.insertrow(0)
				adwc_field.SetItem(ll_row,'field',ls_name)
				adwc_field.SetItem(ll_row,'field_display',ls_display_name)
				adwc_field.SetItem(ll_row,'field_lookup_name',ls_lookup_name)
				adwc_field.SetItem(ll_row,'screen_id',al_screen_id)
				adwc_field.SetItem(ll_Row,'field_dddw_name', ls_dddw_name )//Added by gavins 03092016
			end if
		end if
	next
end if

adwc_field.sort()
parent.setredraw(true)


end event

event constructor;call super::constructor;this.of_setrowselect( true)
this.of_setupdateable( true)
this.SetTransObject(sqlca)
end event

event rowfocuschanging;call super::rowfocuschanging;if currentrow = 0 then return 0
if this.accepttext() = -1 then return 1
if parent.triggerevent('pfc_save') < 0 then return 1
end event

event rowfocuschanged;call super::rowfocuschanged;dw_base.event pfc_retrieve()
end event

event pfc_retrieve;call super::pfc_retrieve;return this.Retrieve(istr_pass.s_long[1],istr_pass.s_long[2] )
end event

event pfc_postinsertrow;call super::pfc_postinsertrow;this.SetItem(al_row,'view_id',istr_pass.s_long[1])
this.SetItem(al_row,'base_screen_id',istr_pass.s_long[2])
this.SetItem(al_row,'depend_screen_id',istr_pass.s_long[2])
if is_screen_type[istr_pass.s_long[2]] = "S" then	//Set Default to 'M'
	this.SetItem(al_row,'base_screen_type',"S")
else
	this.SetItem(al_row,'base_screen_type',"M")
end if

this.SetItemStatus( al_row,0,primary!, NotModified!)
end event

event itemchanged;call super::itemchanged;datawindowchild ldwc
long ll_row
string	ls_Lookup_name, ls_dddw_name, ls_FilterExpress

choose case dwo.name
	case 'base_field_dispaly'
		If this.GetChild( dwo.name,ldwc) = 1 Then
			ll_row = ldwc.GetRow()
			if ll_row > 0 then 
				if this.GetItemString( row, "base_screen_type") = "S" then
					//For single type screen, Get data by SQL Query
					this.SetItem(row,"base_field",ldwc.GetItemString( ll_row,"dbname"))
					this.SetItem(row,"base_table",ldwc.GetItemString( ll_row,"table_name"))
				else
					//For Multi type screen, Get data by Datawindow
					this.SetItem(row,"base_field",ldwc.GetItemString( ll_row,"field"))					
				end if
				ls_dddw_name = ldwc.GetItemString( ll_Row, 'field_dddw_name' )
				ls_Lookup_name = ldwc.GetItemString( ll_Row, 'field_lookup_name' )
				//Added By Jay Chen 03-22-2016
				if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then
					if ls_lookup_name = '?' or ls_lookup_name = '!' then
						ls_lookup_name = 'All'
					end if
				end if
				//end
			end if
		end if
		dw_base.SetRedraw( false ) //Modified by gavins 03092016
		If ( (ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' ) and &
			( Upper( ls_lookup_name ) = 'A' Or Upper( ls_lookup_name ) = 'B' Or Upper( ls_lookup_name ) = 'O' Or Upper( ls_lookup_name ) = 'ALL' ) ) Then
			dw_base.DataObject = 'd_screendesign_depend_facility'
			// <RP> 1.10.2017 --------------------------------------------
			gnv_data.of_retrieveIfNecessary("ctx_facility", FALSE)
			// <RP>
			gnv_data.ids_ctx_facility.RowsCopy( 1, gnv_data.ids_ctx_facility.RowCount( ),Primary! ,dw_base, 1, Primary! )
			If upper(ls_lookup_name) = 'ALL' Then //Modified By Jay Chen 03-22-2016
				ls_FilterExpress = ""
			Else
				ls_FilterExpress = "contact_type2 ='" + ls_lookup_name + "'"
			End If
			dw_base.SetFilter( ls_FilterExpress )
			dw_base.Filter( )
			ib_retrieve = false //Added By Jay Chen 09-01-2014
			dw_base.SelectRow(this.GetRow( ),true)
			dw_base.event RowFocusChanged(this.GetRow())
		Else
			If dw_base.DataObject <> 'd_base_lookup' Then
				dw_base.DataObject = 'd_base_lookup' 
				dw_base.SetTransObject( sqlca)
			End If
			dw_base.post event pfc_retrieve()
		End If
		dw_base.SetRedraw( true )		
	case 'depend_field_dispaly'
		If this.GetChild( dwo.name,ldwc) = 1 Then
			ll_row = ldwc.GetRow()
			if ll_row > 0 then 
				this.SetItem(row,"depend_field",ldwc.GetItemString( ll_row,"field"))
				//this.SetItem(row,"depend_table",ldwc.GetItemString( ll_row,"table_name"))
				ls_dddw_name = ldwc.GetItemString( ll_Row, 'field_dddw_name' )  //added by gavins 03142016
				ls_Lookup_name = ldwc.GetItemString( ll_Row, 'field_lookup_name' )
				//Added By Jay Chen 03-22-2016
				if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then
					if ls_lookup_name = '?' or ls_lookup_name = '!' then
						ls_lookup_name = 'All'
					end if
				end if
				//end
			end if
		end if
		dw_depend.SetRedraw( false ) //Modified by gavins 03092016
		If ( (ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' ) and &
			( Upper( ls_lookup_name ) = 'A' Or Upper( ls_lookup_name ) = 'B' Or Upper( ls_lookup_name ) = 'O' Or Upper( ls_lookup_name ) = 'ALL' ) ) Then
			dw_depend.DataObject = 'd_depend_facility'
			dw_depend.SettransObject( sqlca )
			is_depend_dddw_type = "app_facility"
		Else
			If dw_depend.DataObject <> 'd_depend_lookup'  Then
				dw_depend.DataObject = 'd_depend_lookup' 
				dw_depend.SetTransObject( sqlca)
			End If
			is_depend_dddw_type = ""
		End If
		dw_depend.post event pfc_retrieve()
		dw_depend.SetRedraw( true )		
		
		
//		dw_depend.post event pfc_retrieve()
	case 'depend_screen_id'
		this.SetItem(row,'depend_field_dispaly','')
		this.SetItem(row,'depend_field','')
		this.event ItemChanged(row,this.object.depend_field_dispaly,'')
end choose

end event

event itemfocuschanged;call super::itemfocuschanged;long ll_screen_id,ll_row
datawindowchild ldwc_field
string ls_dddw_name,ls_Lookup_name

if dwo.name = "depend_field_dispaly" then
	ll_screen_id = this.GetItemNumber( row, "depend_screen_id")
	If isnull(ll_screen_id) Then Return //Added By Ken.Guo 04/25/2012
	if this.GetChild(dwo.name,ldwc_field) = 1 then
		ldwc_field.SetFilter( "screen_id = " + string(ll_screen_id))
		ldwc_field.Filter()
					
		if ldwc_field.RowCount() < 1 then
			event ue_init_depend_dddw(ll_screen_id,ldwc_field)
		end if
	end if
end if

	
			
		
	
	
end event

type cb_all from commandbutton within w_contract_field_depend
integer x = 2555
integer y = 2308
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &All"
end type

event clicked;//Added By Ken.Guo 11/09/2012.
Long i
If This.Text = 'Select &All' Then
	For i = 1 To dw_depend.RowCount()
		dw_depend.SetItem(i,'selected', 1)
	Next
	This.Text = 'Deselect &All'
Else
	For i = 1 To dw_depend.RowCount()
		dw_depend.SetItem(i,'selected', 0)
	Next	
	This.Text = 'Select &All'
End If
end event

type cb_save from commandbutton within w_contract_field_depend
integer x = 2903
integer y = 2308
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;if parent.event pfc_save() = 1 then
	//Refresh data -- 12.2.2009
	gnv_data.of_retrieve( "depend_field")
end if
end event

type cb_close from commandbutton within w_contract_field_depend
integer x = 3250
integer y = 2308
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;//Refresh cache
gnv_data.of_retrieve( 'depend_field')
gnv_data.of_retrieve( 'depend_lookup')

close(parent)
end event

type dw_depend from u_dw within w_contract_field_depend
integer x = 1824
integer y = 1192
integer width = 1728
integer height = 932
integer taborder = 10
string dataobject = "d_depend_lookup"
boolean hscrollbar = true
boolean livescroll = false
end type

event constructor;call super::constructor;this.of_setupdateable( true)
this.SettransObject( sqlca)

of_setsort(true )//added by gavins 20160428
this.inv_sort.of_setcolumnheader( true)
end event

event pfc_retrieve;call super::pfc_retrieve;string ls_base_name
string ls_depend_name
long ll_base_code
long ll_base_row,ll_row
datawindowchild ldwc
string ls_lookup_name,ls_code,ls_description,ls_lookup_name2,ls_code2,ls_description2
long ll_lookup_code,ll_lookup_code2,j,ll_find
string ls_dddw_name,ls_depend_field_dispaly

ll_base_row  = dw_base.GetRow() 

//Added By Jay Chen 03-22-2016
If dw_field.GetChild( 'depend_field_dispaly',ldwc) = 1 Then
	if ldwc.rowcount() < 1 then
		dw_field.Event ItemFocusChanged(dw_field.GetRow(),dw_field.object.depend_field_dispaly)
	end if
	ls_depend_field_dispaly = dw_field.Getitemstring(dw_field.getrow(), 'depend_field_dispaly')
	ll_find = ldwc.find("field_display = '"+ls_depend_field_dispaly+"'",1,ldwc.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find > 0 then 
		ls_dddw_name = ldwc.GetItemString( ll_find, 'field_dddw_name' )  
		ls_Lookup_name = ldwc.GetItemString( ll_find, 'field_lookup_name' )
		//Added By Jay Chen 03-22-2016
		if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then
			if ls_lookup_name = '?' or ls_lookup_name = '!' then
				ls_lookup_name = 'All'
			end if
		end if
		//end
	end if
end if
If ( (ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' ) and &
	( Upper( ls_lookup_name ) = 'A' Or Upper( ls_lookup_name ) = 'B' Or Upper( ls_lookup_name ) = 'O' Or Upper( ls_lookup_name ) = 'ALL' ) ) Then
	dw_depend.DataObject = 'd_depend_facility'
	dw_depend.SettransObject( sqlca )
	is_depend_dddw_type = "app_facility"
Else
	If dw_depend.DataObject <> 'd_depend_lookup'  Then
		dw_depend.DataObject = 'd_depend_lookup' 
		dw_depend.SetTransObject( sqlca)
	End If
	is_depend_dddw_type = ""
End If
//end

if ll_base_row > 0 then
	//ls_base_name = dw_base.GetItemString( ll_base_row,"lookup_name")
//	ll_base_code = dw_base.GetItemNumber( ll_base_row,"lookup_code")
	//Added By Jay Chen 03-22-2016
	if dw_base.DataObject = 'd_screendesign_depend_facility' then
		ll_base_code = dw_base.GetItemNumber( ll_base_row,"facility_id")
	else
		ll_base_code = dw_base.GetItemNumber( ll_base_row,"lookup_code")
	end if
	//end
	if dw_field.GetRow() > 0 then
		if dw_field.GetChild( 'depend_field_dispaly', ldwc) = 1 then
			dw_field.Event ItemFocusChanged(dw_field.GetRow(),dw_field.object.depend_field_dispaly)
			ls_depend_name = of_Get_lookupname(dw_field.GetItemString( dw_field.GetRow(),"depend_field"),ldwc)
			
		end if
	end if
end if
//return this.Retrieve(ls_base_name,ll_base_code,ls_depend_name)
//return this.Retrieve(ll_base_code,ls_depend_name,istr_pass.s_long[1],istr_pass.s_long[2] )
//Modified By Jay Chen 09-01-2014
If is_depend_dddw_type = "app_facility" Then//modified by gavins 03092016
	this.Retrieve(ll_base_code,istr_pass.s_long[1],istr_pass.s_long[2] ) 
	If  Upper( ls_lookup_name ) <> 'ALL' Then//added by gavins 20160428
		This.SetFilter('app_facility_contact_type2="' + ls_lookup_name +'"' )
		This.Filter( )
	End If
Else
	this.Retrieve(ll_base_code,ls_depend_name,istr_pass.s_long[1],istr_pass.s_long[2] ) 
End If

If is_depend_dddw_type <> "app_facility" Then
	//delete repeat record
	for ll_row = this.rowcount() to 1 step -1
		ls_lookup_name = this.getitemstring(ll_row,"code_lookup_lookup_name")
		ls_code = this.getitemstring(ll_row,"code_lookup_code")
		ls_description = this.getitemstring(ll_row,"code_lookup_description")
		ll_lookup_code = this.getitemnumber(ll_row,"code_lookup_lookup_code")
		for j = 1 to ll_row - 1
			ls_lookup_name2 = this.getitemstring(j,"code_lookup_lookup_name")
			ls_code2 = this.getitemstring(j,"code_lookup_code")
			ls_description2 = this.getitemstring(j,"code_lookup_description")
			ll_lookup_code2 = this.getitemnumber(j,"code_lookup_lookup_code")
			if ls_lookup_name = ls_lookup_name2 and ls_code = ls_code2 and ls_description = ls_description2 and ll_lookup_code = ll_lookup_code2 then
				this.deleterow(j)
			end if
		next
	next
End If

gnv_app.of_window_basic_code(Parent) //Added By Ken.Guo 2016-04-11

return this.rowcount()
end event

event pfc_preupdate;call super::pfc_preupdate;
Long ll_i
Long ll_count
dwItemStatus l_status
Integer li_selected

ll_count = This.RowCount()

SetRedraw(False)

This.AcceptText( )

For ll_i = ll_count To 1 Step -1
	If This.GetItemNumber(ll_i,'selected') = 1 And This.GetItemNumber(ll_i,'selected',primary!,True) <> This.GetItemNumber(ll_i,'selected',primary!,False)  Then
		If	This.GetItemStatus(ll_i,0, primary!) = DataMODIFIED! Then
			This.SetItem(ll_i,'depend_lookup_code', This.GetItemNumber(ll_i,'code_lookup_lookup_code'))
			//This.SetItem(ll_i,'depend_lookup_name', "")
			if dw_base.DataObject = 'd_screendesign_depend_facility' then //Added By Jay Chen 03-22-2016
				This.SetItem(ll_i,'base_lookup_code', dw_base.GetItemNumber(dw_base.getrow(),'facility_id'))
			else
				This.SetItem(ll_i,'base_lookup_code', dw_base.GetItemNumber(dw_base.getrow(),'lookup_code'))
			end if
			
			//Added by Ken.Guo 01/17/2012
			This.SetItem(ll_i,'view_id', istr_pass.s_long[1])
			This.SetItem(ll_i,'screen_id', istr_pass.s_long[2])
			
			//This.SetItem(ll_i,'base_lookup_name', '')
			//Set states From DataModified! to NewModified
			This.SetItemStatus(ll_i,0,primary!,New!)
			Continue
		End If
	End If
	
	
	
	l_status = This.GetItemStatus(ll_i,0, primary!)
	li_selected = This.GetItemNumber(ll_i,'selected')
	If IsNull(li_selected) Then li_selected = 0
	
	If li_selected = 0 And (l_status = DataMODIFIED! Or l_status = newmodified!) And This.GetItemNumber(ll_i,'selected',primary!,True) <> This.GetItemNumber(ll_i,'selected',primary!,False) Then
		
		//This.SetRedraw( False )
		
		This.RowsCopy( ll_i, ll_i, primary!, This, ll_i + 1, primary! )
		This.SetItemStatus( ll_i + 1, 0, primary!, NotModified! )
		This.DeleteRow( ll_i )
		//This.SetRedraw( True )
		Continue
	End If
Next
This.SetRedraw( True )
Return 0

end event

type dw_base from u_dw within w_contract_field_depend
integer x = 69
integer y = 1192
integer width = 1728
integer height = 932
integer taborder = 10
string dataobject = "d_base_lookup"
boolean hscrollbar = true
boolean livescroll = false
end type

event constructor;call super::constructor;this.of_setrowselect( true)
this.of_setupdateable( false)
this.SetTransObject(sqlca)
of_setsort(true )
this.inv_sort.of_setcolumnheader( true)
end event

event rowfocuschanging;call super::rowfocuschanging;if currentrow = 0 then return 0
if dw_depend.accepttext() = -1 then return 1
if parent.triggerevent('pfc_save') < 0 then return 1
end event

event rowfocuschanged;call super::rowfocuschanged;if ib_retrieve then return 1 //Added By Jay Chen 09-01-2014
dw_depend.event Pfc_retrieve()

end event

event pfc_retrieve;call super::pfc_retrieve;string ls_lookup_name,ls_dddw_name,ls_base_field_dispaly,ls_Filter
long ll_row,ll_child_row,ll_find
datawindowchild ldwc,ldwc2
string ls_field_name //Added By Jay Chen 07-30-2014
boolean lb_base_facility = false

ll_row = dw_field.GetRow( )

if ll_row > 0 then
	if dw_field.GetChild( 'base_field_dispaly', ldwc) = 1 then
		ls_field_name = dw_field.GetItemString(ll_row,'base_field') //Added By Jay Chen 07-30-2014
		ls_lookup_name = of_Get_LookupName( dw_field.GetItemString(ll_row,'base_field'),ldwc)
	end if
end if

//Added By Jay Chen 03-22-2016
If dw_field.GetChild( 'base_field_dispaly',ldwc2) = 1 Then
	ls_base_field_dispaly = dw_field.Getitemstring(dw_field.getrow(), 'base_field_dispaly')
	ll_find = ldwc2.find("field_display = '"+ls_base_field_dispaly+"'",1,ldwc2.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find > 0 then 
		ls_dddw_name = ldwc2.GetItemString( ll_find, 'field_dddw_name' )  
		ls_Lookup_name = ldwc2.GetItemString( ll_find, 'field_lookup_name' )
		//Added By Jay Chen 03-22-2016
		if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then
			if ls_lookup_name = '?' or ls_lookup_name = '!' then
				ls_lookup_name = 'All'
			end if
		end if
		//end
	end if
end if
If ( (ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' ) and &
	( Upper( ls_lookup_name ) = 'A' Or Upper( ls_lookup_name ) = 'B' Or Upper( ls_lookup_name ) = 'O' Or Upper( ls_lookup_name ) = 'ALL' ) ) Then
	dw_base.DataObject = 'd_screendesign_depend_facility'
	dw_base.settransobject(sqlca)
	lb_base_facility = true
Else
	If dw_base.DataObject <> 'd_base_lookup'  Then
		dw_base.DataObject = 'd_base_lookup' 
		dw_base.SetTransObject( sqlca)
	End If
	lb_base_facility = false
End If
//end

If isnull(ls_lookup_name) or ls_lookup_name = '' Then //Added By Ken.Guo 04/25/2012. Added If Statements.
	This.ReSet()
	dw_depend.ReSet()
Else
	//Added By Jay Chen 07-30-2014
	this.setfilter("")
	this.filter()
	//end
	if not lb_base_facility then //Added By Jay Chen 03-22-2016
		if this.retrieve( ls_lookup_name) > 0 then 
			//Added By Jay Chen 07-30-2014
			if lower(ls_field_name) = 'category' and istr_pass.s_long[2] = 3 then
				If Not cbx_showallcategory.checked Then //Added By Ken.Guo 02/04/2015. add if statement. support this checkbox.
					this.setfilter("ic_n = " + string(istr_pass.s_long[1]) + "")
					this.filter()
					st_base.text = 'Base Lookup Data(only include category(ies) associated with the current view):' 
				Else
					st_base.text = 'Base Lookup Data:'
				End If
				cbx_showallcategory.visible = True
			else
				st_base.text = 'Base Lookup Data:'
				cbx_showallcategory.visible = False
			end if
			//end
			ib_retrieve = false //Added By Jay Chen 09-01-2014
			this.SelectRow(this.GetRow( ),true)
			this.event RowFocusChanged(this.GetRow())
		end if
		ib_retrieve = false
	else 
		//Added By Jay Chen 03-22-2016
		if this.retrieve() > 0 then
			If upper(ls_lookup_name) = 'ALL' Then 
				ls_Filter = ""
			Else
				ls_Filter = "contact_type2 ='" + ls_lookup_name + "'"
			End If
			dw_base.SetFilter( ls_Filter )
			dw_base.Filter( )
			st_base.text = 'Base Lookup Data:'
			cbx_showallcategory.visible = False
			ib_retrieve = false
			this.SelectRow(this.GetRow( ),true)
			this.event RowFocusChanged(this.GetRow())
		end if
		//end
	end if
end if
gnv_app.of_window_basic_code(Parent) //Added By Ken.Guo 2016-04-11
return this.RowCount( )
	

end event

type gb_lookup from groupbox within w_contract_field_depend
integer x = 27
integer y = 1052
integer width = 3570
integer height = 1116
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Lookup Data Depend Setting    "
end type

type gb_screen from groupbox within w_contract_field_depend
integer x = 27
integer y = 8
integer width = 3570
integer height = 1016
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Screen Field Depend Setting"
end type

