$PBExportHeader$w_lookup_search_dddw.srw
forward
global type w_lookup_search_dddw from w_response
end type
type rb_state from radiobutton within w_lookup_search_dddw
end type
type rb_country from radiobutton within w_lookup_search_dddw
end type
type rb_city from radiobutton within w_lookup_search_dddw
end type
type cb_ok from u_cb within w_lookup_search_dddw
end type
type cb_cancel from u_cb within w_lookup_search_dddw
end type
type dw_search from u_dw within w_lookup_search_dddw
end type
type cb_1 from u_cb within w_lookup_search_dddw
end type
type dw_1 from u_dw within w_lookup_search_dddw
end type
type cb_2 from commandbutton within w_lookup_search_dddw
end type
type gb_1 from groupbox within w_lookup_search_dddw
end type
type rb_name from radiobutton within w_lookup_search_dddw
end type
type cb_add from commandbutton within w_lookup_search_dddw
end type
type st_1 from statictext within w_lookup_search_dddw
end type
type rb_code from radiobutton within w_lookup_search_dddw
end type
type rb_description from radiobutton within w_lookup_search_dddw
end type
type gb_2 from groupbox within w_lookup_search_dddw
end type
end forward

global type w_lookup_search_dddw from w_response
integer x = 82
integer y = 312
integer width = 3483
integer height = 1956
string title = "Lookup Search"
boolean controlmenu = false
long backcolor = 80269524
rb_state rb_state
rb_country rb_country
rb_city rb_city
cb_ok cb_ok
cb_cancel cb_cancel
dw_search dw_search
cb_1 cb_1
dw_1 dw_1
cb_2 cb_2
gb_1 gb_1
rb_name rb_name
cb_add cb_add
st_1 st_1
rb_code rb_code
rb_description rb_description
gb_2 gb_2
end type
global w_lookup_search_dddw w_lookup_search_dddw

type variables
String is_search_type
String is_lookup_name
string is_lookup
string is_parm

Integer ii_lookup_code
integer ii_looked = 0



end variables

forward prototypes
public function integer of_select_lookupdata (string as_lookup_code)
public function string of_get_selectedcodes ()
end prototypes

public function integer of_select_lookupdata (string as_lookup_code);//Selecting in lookup data accordingly - Alfee 07.25.2008
Long i, ll_cnt, ll_found
String ls_lookup_code[]

n_cst_string_appeon lnv_string

IF IsNull(as_lookup_code) OR Len(Trim(as_lookup_code)) < 1 THEN RETURN -1

lnv_string.of_parsetoarray(as_lookup_code, ",",  ls_lookup_code)

ll_cnt = UpperBound(ls_lookup_code)
FOR i = 1 to ll_cnt
	ll_found = dw_1.Find("lookup_code = " + ls_lookup_code[i], 1, dw_1.Rowcount())
	IF ll_found > 0 THEN  dw_1.SetItem(ll_found, "selected_flag", 1)	
NEXT

RETURN 1
end function

public function string of_get_selectedcodes ();//Get selected lookup codes - Alfee 07.25.2008
Long i, ll_cnt, ll_flag, ll_temp
String ls_lookup_code

IF is_lookup <> "M" THEN RETURN ""

ll_cnt = dw_1.RowCount()
FOR i = 1 to ll_cnt
	ll_flag = dw_1.GetItemNumber(i, "selected_flag")
	ll_temp = dw_1.GetItemNumber(i, "lookup_code")
	IF ll_flag = 1 THEN 
		IF Len(Trim(ls_lookup_code)) > 0 THEN 
			ls_lookup_code += ", " + String(ll_temp)
		ELSE
			ls_lookup_code = String(ll_temp)
		END IF	
	END IF		
NEXT
	
RETURN ls_lookup_code
end function

on w_lookup_search_dddw.create
int iCurrent
call super::create
this.rb_state=create rb_state
this.rb_country=create rb_country
this.rb_city=create rb_city
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.dw_search=create dw_search
this.cb_1=create cb_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.gb_1=create gb_1
this.rb_name=create rb_name
this.cb_add=create cb_add
this.st_1=create st_1
this.rb_code=create rb_code
this.rb_description=create rb_description
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_state
this.Control[iCurrent+2]=this.rb_country
this.Control[iCurrent+3]=this.rb_city
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.cb_cancel
this.Control[iCurrent+6]=this.dw_search
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.rb_name
this.Control[iCurrent+12]=this.cb_add
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.rb_code
this.Control[iCurrent+15]=this.rb_description
this.Control[iCurrent+16]=this.gb_2
end on

on w_lookup_search_dddw.destroy
call super::destroy
destroy(this.rb_state)
destroy(this.rb_country)
destroy(this.rb_city)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.dw_search)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.gb_1)
destroy(this.rb_name)
destroy(this.cb_add)
destroy(this.st_1)
destroy(this.rb_code)
destroy(this.rb_description)
destroy(this.gb_2)
end on

event open;call super::open;Integer cnt
Long ll_pos //Alfee 07.25.2008
String ls_lookup_code, ls_delimiter = "@@" //Alfee 07.25.2008
DataWindowChild dwchild

is_parm = message.stringparm
is_lookup_name = mid(Message.StringParm,3)
is_lookup = mid(Message.StringParm,1,1)
dw_search.of_SetTransObject( SQLCA )
dw_search.InsertRow( 0 )
ii_looked = 0

//--------Begin Modified by Alfee on 07.25.2008----------
//support multi selection in lookup dw
//if is_lookup = "C" then
//	dw_1.dataobject = "d_code_lookup_search"
if is_lookup = "C" OR is_lookup = "M" then	
	IF is_lookup = "C" THEN
		dw_1.dataobject = "d_code_lookup_search"
		
		IF IsValid(w_custom_report) THEN
			gb_2.Text = 'Rturn Value'
			gb_2.Visible = True
			rb_code.visible = True
			rb_code.bringtotop=true
			rb_description.bringtotop=true
			rb_description.visible = True
			
			IF w_custom_report.tab_1.tabpage_filter.sle_1.Text = 'Code' THEN
				rb_code.Checked = True
			ELSE
				rb_description.Checked = True
			END IF
		else
			gb_2.Visible = False
		   gb_2.Text = 'Search Field'
		END IF
		
	ELSE 
		gb_2.Visible = False //Alfee 09.17.2008
		dw_1.dataobject = "d_code_lookup_search_multi"
		ll_pos = Pos(is_lookup_name, ls_delimiter)
		IF ll_pos > 0 THEN 
			is_parm = Left(is_parm, Pos(is_parm, ls_delimiter) - 1)
			ls_lookup_code = Mid(is_lookup_name, ll_pos + 2)
			is_lookup_name = Left(is_lookup_name, ll_pos - 1)
		END IF	
		dw_1.of_setupdateable(FALSE)
	END IF
//--------End Modified ----------------------------------		
	//gb_2.visible = false
	rb_city.visible = false
	rb_country.visible = false
	rb_state.visible = false
	rb_name.visible = false
	rb_city.TriggerEvent( Clicked! )
	is_search_type = "Description"
	this.title = "Description Lookup Search - " + is_lookup_name  //Added 'is_lookup_name' by Ken.Guo on 2009-01-12
elseif  is_lookup = "A" then
	dw_1.dataobject = "d_address_lookup_search"
	rb_name.TriggerEvent( Clicked! )
	dw_Search.SetFocus()
	this.title = "Entity Lookup Search - " + is_lookup_name //Added 'is_lookup_name' by Ken.Guo on 2009-01-12
end if
//messagebox("is_lookup_name",is_lookup_name)
//messagebox("is_lookup",is_lookup)

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 09.26.2006 By: LeiWei
//$<reason> Making the Contract Module a Standalone Product
/*
//Start Code Change ---- 04.03.2006 #398 maha
if w_mdi.of_security_access( 1300 ) = 0 then
	cb_add.visible = false
end if
//End Code Change---04.03.2006
*/

IF gb_contract_version THEN
	// Contract -> Add Lookup Data
	//IF w_mdi.of_security_access( 2075 ) = 0 THEN
	IF w_mdi.of_security_access( 2075 ) <> 2 THEN	 //Modified By Ken.Guo 2015-09-18
		cb_add.enabled = FALSE //Modified By Ken.Guo 2015-09-18
	END IF
ELSE
	//Start Code Change ---- 04.03.2006 #398 maha
	IF w_mdi.of_security_access( 1300 ) = 0 THEN
		cb_add.enabled = FALSE
	END IF
	//End Code Change---04.03.2006
END IF
//---------------------------- APPEON END ----------------------------

//Added By Ken.Guo 2015-09-18. readonly or no access
IF w_mdi.of_security_access(2070) <> 2 Then //Contract Window Main Access
	cb_add.enabled = FALSE
End If

dw_1.of_SetTransObject( SQLCA )
cnt = dw_1.Retrieve( is_lookup_name )

//Commented By Ken.Guo 2015-09-18
//if cnt < 16 then cb_add.enabled = true//Start Code Change ---- 05.09.2006 #441 maha
//if cnt < 16 then cb_ok.enabled = true//Start Code Change ---- 06.05.2006 #511 maha


//Selecting in the lookup data accordingly - Alfee 07.25.2008
IF is_lookup = "M" THEN of_select_lookupdata(ls_lookup_code)

end event

type rb_state from radiobutton within w_lookup_search_dddw
integer x = 325
integer y = 56
integer width = 247
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
string text = "&State"
end type

event clicked;DataWindowChild dwchild

dw_search.Object.value.DDDW.AllowEdit = 'No'

dw_search.GetChild( "value", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( "state" )

dw_search.SetFocus()

is_search_type = "state"


end event

type rb_country from radiobutton within w_lookup_search_dddw
integer x = 585
integer y = 56
integer width = 261
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
string text = "C&ountry"
end type

event clicked;DataWindowChild dwchild

dw_search.Object.value.DDDW.AllowEdit = 'No'

dw_search.GetChild( "value", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( "country" )

dw_search.SetFocus()

is_search_type = "country"


end event

type rb_city from radiobutton within w_lookup_search_dddw
integer x = 78
integer y = 56
integer width = 224
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
string text = "&City"
end type

event clicked;DataWindowChild dwchild

dw_search.GetChild( "value", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( "" )
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.14.2006 By: Liang QingShi
//$<reason> Fix a defect.
string ls_code
if dwchild.rowcount() > 0 then
	ls_code = dwchild.getitemstring(1,'code')
	if ls_code = '001' then
		dwchild.reset()
	end if
end if
//---------------------------- APPEON END ----------------------------

dw_search.SetFocus()

is_search_type = "city"

dw_search.Object.value.DDDW.AllowEdit = 'Yes'

dw_search.SetText( "" )
end event

type cb_ok from u_cb within w_lookup_search_dddw
integer x = 2665
integer y = 56
integer width = 247
integer height = 84
integer taborder = 90
boolean bringtotop = true
string text = "&Select"
end type

event clicked;//CloseWithReturn( Parent, dw_search.GetText() + "-" + is_search_type )
//Start Code Change ---- 04.18.2006 #402 maha
IF dw_1.RowCount( ) < 1 THEN RETURN
//End Code Change---04.18.2006


//-----Begin Modified by Alfee on 07.25.2008----------------------
//For supporting multi selection
String ls_lookup_code

IF is_lookup = "M" THEN
	ls_lookup_code = of_get_selectedcodes()
	Post CloseWithReturn(Parent, ls_lookup_code) //Added By Ken.Guo 10/19/2011. Added Post keyword to workaround IE Crash Bug.
ELSE
	//Added by Nova on 2008-08-12
	IF IsValid(w_custom_report) THEN
		IF rb_description.Checked THEN
			w_custom_report.tab_1.tabpage_filter.sle_2.Text = 'Description'
		ELSEIF rb_code.Checked THEN
			w_custom_report.tab_1.tabpage_filter.sle_2.Text = 'Code'
		END IF
	END IF
	Post CloseWithReturn( Parent, dw_1.GetItemNumber( dw_1.GetRow(), "lookup_code" ))  //Added By Ken.Guo 10/19/2011. Added Post keyword to workaround IE Crash Bug.
END IF
//CloseWithReturn( Parent, dw_1.GetItemNumber( dw_1.GetRow(), "lookup_code" ))
//-----End Modified ---------------------------------------------


end event

type cb_cancel from u_cb within w_lookup_search_dddw
integer x = 3200
integer y = 56
integer width = 247
integer height = 84
integer taborder = 80
boolean bringtotop = true
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn( Parent, "Cancel" )
end event

type dw_search from u_dw within w_lookup_search_dddw
integer x = 1234
integer y = 56
integer width = 1102
integer height = 96
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_select_lookup_search"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateAble( False )
end event

type cb_1 from u_cb within w_lookup_search_dddw
boolean visible = false
integer x = 64
integer y = 1836
integer taborder = 40
boolean bringtotop = true
string text = "S&how All"
end type

event clicked;CloseWithReturn( Parent, dw_search.GetText() + "-" + "All" )
end event

type dw_1 from u_dw within w_lookup_search_dddw
integer x = 50
integer y = 344
integer width = 3383
integer height = 1452
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_address_lookup_search"
boolean hscrollbar = true
end type

event clicked;call super::clicked;Integer li_clicked_row

li_clicked_row = This.GetClickedRow()

IF li_clicked_row > 0 THEN
	This.SelectRow( 0 , False )
	This.SelectRow( li_clicked_row, True )
	This.SetRow( li_clicked_row )
	This.ScrollToRow( li_clicked_row )
END IF
end event

event retrieveend;call super::retrieveend;IF rowcount > 0 THEN
	This.SelectRow( 0 , False )
	This.SelectRow( 1, True )
	This.SetRow( 1 )
	This.ScrollToRow( 1 )
	// mskinner 10 June 2006 - begin
	
	//Commented By Ken.Guo 2015-09-18
	//	if this.rowcount() < 15 then 
	//		cb_add.enabled = true
	//	end if

	// mskinner 10 June 2006 - end
	
END IF
end event

event doubleclicked;cb_ok.TriggerEvent( Clicked! )
end event

event constructor;This.of_SetSort(True)
This.inv_sort.of_SetStyle(3)
This.inv_sort.of_SetColumnHeader(True)

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-09-07 By: Rodger Wu
//$<reason> Enable to use key arrows to select record.
This.of_SetRowSelect(True)
//---------------------------- APPEON END ----------------------------

end event

type cb_2 from commandbutton within w_lookup_search_dddw
integer x = 2350
integer y = 56
integer width = 247
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Find"
boolean default = true
end type

event clicked;String ls_value
String ls_search_type

ls_value = upper(dw_search.GetText())

if len(ls_value) > 0 then
	IF is_search_type = "city" THEN
		dw_1.SetFilter( "Upper(city) like '" + ls_value + "%'" )
	ELSEIF is_search_type = "state" THEN
		dw_1.SetFilter( "Upper(state) = '" + ls_value + "'" )
	ELSEIF is_search_type = "country" THEN
		dw_1.SetFilter( "Upper(country) = '" + ls_value + "'" )
	ELSEIF is_search_type = "Name" THEN
		dw_1.SetFilter( "Upper(entity_name) like '%" + ls_value + "%'" )	
	ELSEIF is_search_type = "Description" THEN
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 2007.08.22 By: Jack
		//$<reason> Fix a defect.
		/*
		dw_1.SetFilter( "Upper(description) like '%" + ls_value + "%'" )
		*/
		dw_1.SetFilter( "(Upper(description) like '%" + ls_value + "%')" + " Or (Upper(code) like '%" + ls_value + "%')" )		
		//---------------------------- APPEON END ----------------------------
	ELSE
		dw_1.SetFilter("")
	END IF
else
	dw_1.SetFilter("")
end if
	
	
dw_1.Filter()
IF dw_1.RowCount() > 0 THEN
	dw_1.SelectRow( 0 , False )
	dw_1.SelectRow( 1, True )
	dw_1.SetRow( 1 )
END IF

//Commented By Ken.Guo 2015-09-18
//cb_ok.enabled = true
//cb_add.enabled = true
end event

type gb_1 from groupbox within w_lookup_search_dddw
integer x = 1193
integer y = 8
integer width = 1454
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Search Value"
end type

type rb_name from radiobutton within w_lookup_search_dddw
integer x = 878
integer y = 64
integer width = 224
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
string text = "&Name"
boolean checked = true
end type

event clicked;DataWindowChild dwchild

dwchild.reset()

dw_search.GetChild( "value", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( "" )
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.14.2006 By: Liang QingShi
//$<reason> Fix a defect.
string ls_code
if dwchild.rowcount() > 0 then
	ls_code = dwchild.getitemstring(1,'code')
	if ls_code = '001' then
		dwchild.reset()
	end if
end if
//---------------------------- APPEON END ----------------------------
dw_search.SetFocus()

is_search_type = "Name"

dw_search.Object.value.DDDW.AllowEdit = 'Yes'

dw_search.SetText( "" )

end event

type cb_add from commandbutton within w_lookup_search_dddw
integer x = 2935
integer y = 56
integer width = 247
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;long ll_code


openwithparm(w_lookup_add,is_parm)

if message.stringparm = "cancel" then
	return
elseif message.doubleparm > 1 then
	ll_code = message.doubleparm
	CloseWithReturn( Parent, ll_code)
	if isvalid(w_prac_data_1) then
		If isvalid(w_prac_data_1.tab_1.tabpage_detail.uo_data_entry.inv_data_entry) Then //Added By Ken.Guo 06.16.2008
			w_prac_data_1.tab_1.tabpage_detail.uo_data_entry.inv_data_entry.of_setup_cache()
		End If
	end if
end if
	
	
end event

type st_1 from statictext within w_lookup_search_dddw
integer x = 55
integer y = 200
integer width = 3328
integer height = 136
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "You can search to find a lookup record.  Once you have searched, if you cannot find the value you are looking for, you can click ADD to add a lookup. To search, enter a search value and click FIND."
boolean focusrectangle = false
end type

type rb_code from radiobutton within w_lookup_search_dddw
boolean visible = false
integer x = 82
integer y = 64
integer width = 343
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Code"
end type

type rb_description from radiobutton within w_lookup_search_dddw
boolean visible = false
integer x = 585
integer y = 64
integer width = 343
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Description"
end type

type gb_2 from groupbox within w_lookup_search_dddw
integer x = 69
integer y = 8
integer width = 1083
integer height = 164
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Search Field"
end type

