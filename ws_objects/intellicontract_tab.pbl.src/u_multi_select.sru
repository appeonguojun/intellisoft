$PBExportHeader$u_multi_select.sru
forward
global type u_multi_select from u_base
end type
type dw_select from u_dw within u_multi_select
end type
end forward

global type u_multi_select from u_base
integer width = 1115
integer height = 672
long backcolor = 80263328
event type integer pfc_dropdown ( )
dw_select dw_select
end type
global u_multi_select u_multi_select

type variables
Public:
// Datawindow Register ColumnStyle constants.
constant integer NONE = 1
constant integer DDLB = 2
constant integer DDLB_WITHARROW = 3

n_cst_dropdown2	inv_dropdown
long il_view,il_screen //Added By Jay Chen 12-23-2015
string is_fieldname,is_fieldname_old
datastore ids_select_item_list,ids_select_item_list_tmp
long il_view_old,il_screen_old,il_ctx_old
boolean ib_refresh_multi = false

Protected:
// Internal attibutes.
constant string EMPTY = ''
dragobject idrg_requestor
//datawindow idw_requestor Modified by Ken.Guo 2017/02/14
u_dw_contract idw_requestor
editmask iem_requestor
Double	idbl_value
Double	idbl_repeatvalue
String	is_currvalue
String	is_curroperator
String	is_repeatoperator
String	is_prevkeystroke
Boolean	ib_validresetvalue
n_cst_calculatorattrib inv_calculatorattrib

// API accessible attributes
Boolean	ib_closeonclick = True
Boolean	ib_initialvalue= False

//API accessible attributes - DataWindow only attributes.
string	is_dwcolumns[]
string	is_dwcolumnsexp[]
integer	ii_dwcolumnstyle[]
end variables

forward prototypes
public function integer of_setrequestor (dragobject adrg_requestor)
public function integer of_setcloseonclick (boolean ab_switch)
protected function integer of_setfocusonrequestor ()
protected function integer of_setvalue (double adbl_value, boolean ab_setrequestor)
protected function integer of_setvalueonrequestor (string as_value)
public function integer of_reset ()
public function integer of_setdropdown (boolean ab_switch)
public function boolean of_IsDropDown ()
public function integer of_SetInitialValue (boolean ab_switch)
protected function integer of_redirectfocus ()
protected function integer of_dropdown ()
end prototypes

event type integer pfc_dropdown();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_dropdown
//
//	(Arguments:		None)
//
//	Returns:  Integer
//		1 if it succeeds
//		-1 if an error occurs.
//		0 if the current datawindow column has not been registered.
//
//	Description:  
//		Request the dropdown calculator.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Added By Jay Chen 12-23-2015
long ll_row,ll_ctx
If IsValid(idw_requestor) Then
	ll_row = idw_requestor.getrow()
	if ll_row > 0 then
		ll_ctx = idw_requestor.getitemnumber(ll_row,"ctx_id")
	end if
End If
	
if ib_refresh_multi then
	il_view_old = 0
	il_screen_old = 0
	is_fieldname_old = ''
	il_ctx_old = 0
	ib_refresh_multi = false
end if

if not (il_view = 0 and il_screen = 0) then
	if not isvalid(ids_select_item_list_tmp) then 
		ids_select_item_list_tmp = create datastore
		ids_select_item_list_tmp.dataobject = 'd_screen_multi_select_item'
	end if
//	if isvalid(ids_select_item_list) then
//		ids_select_item_list.rowscopy(1,ids_select_item_list.rowcount(), Primary!, ids_select_item_list_tmp, ids_select_item_list_tmp.rowcount()+1, Primary!)
//	end if
//Modified By Ken.Guo 2017-02-28 Task 748
	If isnull(ll_ctx) Then ll_ctx = 0 //Added By Ken.Guo 2017-05-16
	if il_view <> il_view_old or il_screen <> il_screen_old or ll_ctx <> il_ctx_old then
		ids_select_item_list = create datastore
		ids_select_item_list.dataobject = 'd_screen_multi_select_item'
		ids_select_item_list.settransobject(sqlca)
		ids_select_item_list.retrieve(il_view,il_screen,ll_ctx)
		il_view_old = il_view
		il_screen_old = il_screen
		is_fieldname_old = is_fieldname
		il_ctx_old = ll_ctx
	end if
	//Added By Ken.Guo 2017-02-28 Task 748
	ids_select_item_list.SetFilter("field_name='" + is_fieldname + "'")
	ids_select_item_list.Filter()	
end if

Return of_DropDown()
end event

public function integer of_setrequestor (dragobject adrg_requestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRequestor
//
//	Access:    Public
//
//	Arguments:
//   adrg_requestor   The object requesting the service.
//			Valid objects are DataWindow! and editmask!.
//
//	Returns:  Integer
//		1 if it succeeds 
//		-1 if an error occurs.
//		-2 if attempting to associate object where only dropdowns are supported.
//		-3 MaskDataType is incorrect.
//
//	Description:  Associates an object control with this object 
//		by setting the requestor instance variable(s).
//		The valid objects which can be associated are of type datawindow and 
//		type editmask.  Editmask type should further have a mask of 
//		type DecimalMask! or NumericMask!.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

dragobject	ldrg_notvalid
editmask		lem_testonly
boolean		lb_dropdownbehavior

// Validate Reference.
If IsNull(adrg_requestor) or Not IsValid(adrg_requestor) Then
	Return -1
End If

// Invalidate references.
idrg_requestor = ldrg_notvalid
idw_requestor = ldrg_notvalid
iem_requestor = ldrg_notvalid

// Is this object behaving as a dropdown object.
If IsValid(inv_dropdown) Then
	lb_dropdownbehavior = True
End If

// Make sure it is one of the expected type and get the 
// parent window reference.
CHOOSE CASE TypeOf(adrg_requestor)
	CASE DataWindow!
		// Datawindow object must be a dropdown.
		If Not lb_dropdownbehavior Then
			Return -2
		End If
		idw_requestor = adrg_requestor
	CASE EditMask!
		lem_testonly = adrg_requestor
		If lem_testonly.MaskDataType <> DecimalMask! And &
			lem_testonly.MaskDataType <> NumericMask! Then
			Return -3
		End If
		iem_requestor = adrg_requestor
		If Not lb_dropdownbehavior Then
			// Field cannot be typed on.
			iem_requestor.DisplayOnly = True
			// Set initial value.
			of_Reset()
		End If				
	CASE ELSE
		Return -1
END CHOOSE

// Set the generic reference.
idrg_requestor = adrg_requestor

Return 1
end function

public function integer of_setcloseonclick (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_CloseOnClick
//
//	Access:    	Public
//
//	Arguments:
//   ab_switch  A switch that determines when to close the object.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the switch that determines when to close the 
//						object.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Check to see if the passed style number is valid.
IF IsNull(ab_switch) THEN 
	Return -1
End If

ib_closeonclick = ab_switch
Return 1
end function

protected function integer of_setfocusonrequestor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFocusOnRequestor
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//		1 if it succeeds and -1 if an error occurs.
//
//	Description:  Sets the focus on the requestor.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Validate Reference.
If IsNull(idrg_requestor) or Not IsValid(idrg_requestor) Then 
	Return -1
End If

Return idrg_requestor.SetFocus()
end function

protected function integer of_setvalue (double adbl_value, boolean ab_setrequestor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetValue
//
//	Access:    Protected
//
//	Arguments:
//  adbl_value		The value to set.
//	 ab_setrequestor	Switch stating if the requestor object should get this value.
//
//	Returns:  Integer
//		1 if it succeeds and -1 if an error occurs.
//
//	Description: 
//	Sets a new value.  If appropriate, it will also set the requestor to get
//	this new date.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Integer			li_rc = 1
Integer 			li_month
Integer 			li_year
Integer 			li_day
Integer  		li_FirstDayNum
String			ls_newcell

// Check the argument(s).
If IsNull(adbl_value) Then
	Return -1
End If

// Set the new date.
idbl_value = adbl_value

// If appropriate, set the requestor with the new date.
If ab_setrequestor Then
	of_SetValueOnRequestor( string(idbl_value) )
End If			 

Return li_rc
end function

protected function integer of_setvalueonrequestor (string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetValueOnRequestor
//
//	Access:    Public
//
//	Arguments:
//   adbl_value	The value to set.
//
//	Returns:  Integer
//		1 if it succeeds and -1 if an error occurs.
//
//	Description:  Sets the value on the requestor.
//
//	*Note: This function's argument is a string in order to not loose the decimal
//		point in numbers that have no decimal values. (i.e. 6.)
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Validate Reference.
If IsValid(idw_requestor) Or IsValid(iem_requestor) Then
	// Good reference.
Else
	Return -1
End If

// Validate the value.
If Not IsNumber(as_value) Then
	Return -1
End If

// Set the requestor with the new value.
If IsValid(idw_requestor) Then
	idw_requestor.SetText(as_value)
ElseIf IsValid(iem_requestor) Then
	iem_requestor.Text = as_value	
Else
	Return -1
End If

Return 1
end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Reset
//
//	Access:    Public
//
//	Arguments:	None.
//
//	Returns:  Integer
//		1 if it succeeds and -1 if an error occurs.
//
//	Description: 
//		Resets the object value to the current value found on the requestor.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

integer	li_rc
string 	ls_value

// Validate Reference.
If IsValid(idw_requestor) Or IsValid(iem_requestor) Then
	// Good reference.
Else
	Return -1
End If

// Get the current value from the requesting object.
If IsValid(idw_requestor) Then
	ls_value = idw_requestor.GetText()
ElseIf IsValid(iem_requestor) Then
	ls_value = iem_requestor.Text
Else
	Return -1
End If

// Bring focus on the object.
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2005-09-12 By: Liang QingShi
//$<reason> 
//li_rc = SetFocus(this)
//li_rc = SetFocus(dw_select)

this.SetFocus()
dw_select.SetFocus()

//---------------------------- APPEON END ----------------------------

// Validate the value.
// Keep track if the value was valid or not.
ib_validresetvalue = IsNumber(ls_value)
If ib_validresetvalue Then
	// Set the new date.  Do not Update the requestor.
	of_SetValue(Double(ls_value), False)
Else
	// Set the new value.  The requestor is/is_not updated according 
	// to the ib_initialvalue attribute.
	of_SetValue(0, ib_initialvalue)
End If

// Clear the Current value variables.
is_curroperator = EMPTY
is_currvalue = EMPTY

// Clear the Repeat value variables.
is_repeatoperator	= EMPTY
idbl_repeatvalue = 0

Return 1
end function

public function integer of_setdropdown (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetDropDown
//
//	Arguments:
//	ab_switch   starts/stops the UserObject DropDown service
//
//	Returns:  integer
//	 1 = Successful operation.
//	 0 = No action necessary
//	-1 = An error was encountered
//
//	Description:
//	Starts or stops the UserObject DropDown service
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

integer	li_rc

// Check arguments.
if IsNull (ab_switch) then return -1

if ab_Switch then
	if IsNull(inv_dropdown) Or not IsValid (inv_dropdown) then
		inv_dropdown = create n_cst_dropdown2
		inv_dropdown.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_dropdown) then
		destroy inv_dropdown
		li_rc = 1
	end if
end if

return li_rc
end function

public function boolean of_IsDropDown ();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_IsDropDown
//
//	Arguments: None
//
//	Returns:  boolean
//	 True if the behavior is that of a DropDown object.
//	 False if not.
//
//	Description:
//	Reports if the behavior of the object is that of a DropDown object.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

If IsValid (inv_dropdown) then
	Return True
End If

Return False

end function

public function integer of_SetInitialValue (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetInitialValue
//
//	Access:    	Public
//
//	Arguments:
//   ab_switch  A switch that determines if a zero value should be set on the
//					requestor when a null value is found on the requestor.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	
// Sets the switch that determines if an initial '0' value should be used when
// an initial invalid value or no value is found on the requestor.
//
// *Note: The main behavior change through this attribute is in the row/column status.
//		For example,
//		A) The attribute is set to True.
//			1) The calculator is requested on a field that has no value.
//			2) The calculator drops down.
//			3) The field displays a zero value.  This means the column status may
//				have changed.  One possibility is from NotModified! to Modified!.
//		B) The attribute is set to False.
//			1) The calculator is requested on a field that has no value.
//			2) The calculator drops down.
//			3) The field continues to display empty.  This means the column status 
//				has not changed.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Validate the argument.
IF IsNull(ab_switch) THEN 
	Return -1
End If

ib_initialvalue = ab_switch
Return 1
end function

protected function integer of_redirectfocus ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RedirectFocus
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//	1 if it succeeds.
//	-1 if an error occurs.
//
//	Description:  
//	Prevent this object from having focus while not visible.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Prevent this object from having focus while not visible.
If this.Visible = False Then
	Return of_SetFocusOnRequestor()
End If

Return 1
end function

protected function integer of_dropdown ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DropDown
//
//	Access:    Protected
//
//	Arguments:	None
//
//	Returns:  Integer
//		1 if it succeeds
//		-1 if an error occurs.
//		0 if the current datawindow column has not been registered.
//
//	Description:  
//		Drop Down the Object after getting the appropriate location.
//		For datawindow columns check that the current column has 
//		been registered.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////
Integer 	li_rc
String	ls_colname,ls_data,ls_display
String	ls_coltype,ls_value,ls_style,ls_datavalue
Integer	li_x
Integer	li_y
long ll_screen,ll_cnt,ll_row,ll_value,ll_find,ll_width,ll_item_width, ll_K
datawindowchild ldwc
string ls_Multi_DisplayValue, ls_Array_DisplayVaule[] //Added by gavin 20170424
//Added By Jay Chen 12-23-2015

// Check the required references.
If IsNull(inv_dropdown) Or Not IsValid(inv_dropdown) or &
	IsNull(idrg_requestor) or Not IsValid(idrg_requestor) Then
	Return -1
End If

// Datawindow control specific checks.
If IsValid(idw_requestor) Then
	ls_colname = idw_requestor.GetColumnName()
	ll_width = long(idw_requestor.Describe(ls_colname+".width"))
	ls_coltype = idw_requestor.Describe(ls_colname+".coltype")
	ls_style = idw_requestor.Describe(ls_colname+".edit.style")
	if left(ls_coltype,4) = 'char' and left(ls_colname,7) = 'custom_' and ls_style = 'dddw' then
		dw_select.reset()
		ls_data = idw_requestor.Describe(ls_colname+".dddw.datacolumn")
		ls_display = idw_requestor.Describe(ls_colname+".dddw.displaycolumn")
		idw_requestor.getchild(ls_colname, ldwc)
		
		If idw_requestor.GetRow()>0 Then //Added by gavin 20170424
			ls_Multi_DisplayValue = idw_requestor.GetItemString( idw_requestor.GetRow(), ls_colname )
			gnv_string.of_parsetoarray(  ls_Multi_DisplayValue , ' | '   , ls_Array_DisplayVaule )
		End If
		
		for ll_cnt =1 to ldwc.rowcount()
			if left(ldwc.describe(ls_data+".coltype"),4) = 'char' then
				ls_datavalue = ldwc.getitemstring(ll_cnt, ls_data)
			else
				ls_datavalue = string(ldwc.getitemnumber(ll_cnt, ls_data))
			end if
			if left(ldwc.describe(ls_display+".coltype"),4) = 'long' or left(ldwc.describe(ls_display+".coltype"),4) = 'deci' then
				ls_value = string(ldwc.getitemnumber(ll_cnt, ls_display))
			else
				ls_value = ldwc.getitemstring(ll_cnt, ls_display)
			end if
			if isnull(ls_datavalue)  or ls_datavalue = '' then continue
			ll_row = dw_select.insertrow(0)
			ll_find = ids_select_item_list.find(" field_data = '"+ls_datavalue+"' ",1, ids_select_item_list.rowcount())
			if isnull(ll_find) then ll_find = 0
			
			If ll_find = 0 Then//Added by gavin 20170424
				For ll_k = 1 To UpperBound( ls_Array_DisplayVaule )
					If Lower( ls_Array_DisplayVaule[ll_k] ) = Lower( ls_value ) Then					
						ll_Find = 1
					End If
				Next				
			End If			
			
			if ll_find > 0 then
				dw_select.setitem(ll_row,"as_choose",'Y')
			else
				dw_select.setitem(ll_row,"as_choose",'N')
			end if
			dw_select.setitem(ll_row,"as_itemcode",ls_datavalue)
			dw_select.setitem(ll_row,"as_itemname",trim(ls_value))
		next
	else
		return 0
	end if
End If

// Set this object on its new Position.
li_rc = inv_dropdown.of_Position(idrg_requestor, False)
If li_rc < 0 Then 
	gnv_debug.of_output(false, ' u_multi_select.of_dropdown(). inv_dropdown.of_Position(idrg_requestor, False) = ' + String(li_rc))
	Return -1
End If

//Added By Jay Chen 01-21-2016 adjust userobject width
ll_width = ll_width * inv_dropdown.idec_zoom
if ll_width > 1115 then
	this.width = ll_width 
	dw_select.width = this.width - 13
	ll_item_width = dw_select.width - 300
	dw_select.modify("as_itemname.width = " + string(ll_item_width))
else
	this.width = 1115 
	dw_select.width = 1102
end if
inv_dropdown.idec_zoom = 0
//end

// Set the current value on the calculator.
//of_Reset()

// Show the object.
gnv_debug.of_output(false, 'u_multi_select.of_dropdown() show the object.')
This.Visible = True	
This.post show( )  //Added By Ken.Guo 2017-05-08. Workaround APB Bug. Task 775 B:Multi-select files don't display the list of options
this.setfocus()
dw_select.post setfocus() //Added By Ken.Guo 2017-05-08. Workaround APB Bug.Task 775 B :Multi-select files don't display the list of options


Return 1

end function

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	The Calculator object.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Added By Jay Chen 12-23-2015
this.Visible = false	
of_SetDropDown(True)

// This is not an updateable object.
this.of_SetUpdateable(False)
end event

on u_multi_select.create
int iCurrent
call super::create
this.dw_select=create dw_select
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_select
end on

on u_multi_select.destroy
call super::destroy
destroy(this.dw_select)
end on

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Destructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Destroy the instantiated services attached.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////


of_SetDropDown(False)

if isvalid(ids_select_item_list) then destroy ids_select_item_list //Added By Jay Chen 12-23-2015
if isvalid(ids_select_item_list_tmp) then destroy ids_select_item_list_tmp
end event

type dw_select from u_dw within u_multi_select
event key pbm_dwnkey
integer x = 5
integer y = 8
integer width = 1102
integer height = 656
integer taborder = 10
string dataobject = "d_multi_select"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event key;////////////////////////////////////////////////////////////////////////////////
////
////	Event:  key
////
////	Arguments:
////	key
////	keyflags
////
////	Returns:  None
////
////	Description:  
////	Provide KeyBoard support.
////
////////////////////////////////////////////////////////////////////////////////
////
////	Revision History
////
////	Version
////	6.0   Initial version
////
////////////////////////////////////////////////////////////////////////////////
////
////	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
////	Any distribution of the PowerBuilder Foundation Classes (PFC)
////	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
////
////////////////////////////////////////////////////////////////////////////////
//
//String	ls_buttontext
//
//// Look out for the Escape and the Tab keys.
//Choose Case key
//	Case KeyEscape! 
//		//If appropriate, hide the Calendar.
//		If IsValid(inv_dropdown) Then
//			If ib_closeonclick Then
//				// Set focus on the Requestor object which in turns hides the calendar.
//				of_SetFocusOnRequestor()
//			End If
//		End If
//		Return
//	Case KeyTab!
//		If IsValid(inv_dropdown) Then
//			Post of_SetFocusOnRequestor()
//		End If
//		Return
//End Choose
//
//// Determine what action to take.
//If KeyDown(KeyDecimal!) or (Not KeyDown(KeyShift!) And KeyDown(KeyPeriod!)) Then
//	ls_buttontext = '.'
//ElseIf KeyDown(KeyNumpad0!) or (Not KeyDown(KeyShift!) And KeyDown(Key0!)) Then
//	ls_buttontext = '0'
//ElseIf KeyDown(KeyNumpad1!) or (Not KeyDown(KeyShift!) And KeyDown(Key1!)) Then
//	ls_buttontext = '1'
//ElseIf KeyDown(KeyNumpad2!) or (Not KeyDown(KeyShift!) And KeyDown(Key2!)) Then
//	ls_buttontext = '2'
//ElseIf KeyDown(KeyNumpad3!) or (Not KeyDown(KeyShift!) And KeyDown(Key3!)) Then
//	ls_buttontext = '3'
//ElseIf KeyDown(KeyNumpad4!) or (Not KeyDown(KeyShift!) And KeyDown(Key4!)) Then
//	ls_buttontext = '4'
//ElseIf KeyDown(KeyNumpad5!) or (Not KeyDown(KeyShift!) And KeyDown(Key5!)) Then
//	ls_buttontext = '5'
//ElseIf KeyDown(KeyNumpad6!) or (Not KeyDown(KeyShift!) And KeyDown(Key6!)) Then
//	ls_buttontext = '6'
//ElseIf KeyDown(KeyNumpad7!) or (Not KeyDown(KeyShift!) And KeyDown(Key7!)) Then
//	ls_buttontext = '7'
//ElseIf KeyDown(KeyNumpad8!) or (Not KeyDown(KeyShift!) And KeyDown(Key8!)) Then
//	ls_buttontext = '8'
//ElseIf KeyDown(KeyNumpad9!) or (Not KeyDown(KeyShift!) And KeyDown(Key9!)) Then
//	ls_buttontext = '9'
//ElseIf KeyDown(KeyAdd!) or (KeyDown(KeyShift!) And KeyDown(KeyEqual!)) Then
//	ls_buttontext = '+'
//ElseIf KeyDown(KeySubtract!) or (Not KeyDown(KeyShift!) And KeyDown(KeyDash!)) Then
//	ls_buttontext = '-'
//ElseIf KeyDown(KeyMultiply!) or (KeyDown(KeyShift!) And KeyDown(Key8!)) Then
//	ls_buttontext = '*'
//ElseIf KeyDown(KeyDivide!) or (Not KeyDown(KeyShift!) And KeyDown(KeySlash!)) Then
//	ls_buttontext = '/'
//ElseIf KeyDown(KeyEnter!) or (Not KeyDown(KeyShift!) And KeyDown(KeyEqual!)) Then
//	ls_buttontext = '='
//Else
//	// Not a key on which action is needed.
//	Return
//End IF
//
//// Tell the object of the clicked button.
//If Len(ls_buttontext) > 0 Then
//	of_ButtonClicked (ls_buttontext)
//End If
//
//// Determine if the Main object should go away.
//If ls_buttontext = '=' Then
//	If IsValid(inv_dropdown) And ib_closeonclick Then			
//		of_SetFocusOnRequestor()
//		Return
//	End If
//End If
//
//Return
end event

event buttonclicked;call super::buttonclicked;////////////////////////////////////////////////////////////////////////////////
////
////	Event:  buttonclicked
////
////	Arguments:	
////	row
////	actionreturncode
////	dwo
////
////	Returns:  None
////
////	Description:  
////	Tell the object which button has been pressed.
////
////////////////////////////////////////////////////////////////////////////////
////
////	Revision History
////
////	Version
////	6.0   Initial version
////
////////////////////////////////////////////////////////////////////////////////
////
////	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
////	Any distribution of the PowerBuilder Foundation Classes (PFC)
////	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
////
////////////////////////////////////////////////////////////////////////////////
//
//Integer	li_rc
//String 	ls_buttonname
//String 	ls_buttontext
//
//If IsNull(dwo) Then Return
//If IsNull(dwo.Name) Then Return
//If IsNull(dwo.Text) Then Return
//
//// Get the clicked information.
//ls_buttonname = Trim(dwo.Name)
//ls_buttontext = Trim(dwo.Text)
//
//// Tell the object of the clicked button.
//If Len(ls_buttontext) > 0 Then
//	of_ButtonClicked (ls_buttontext)
//End If
//
//// Determine if the Main object should go away.
//If ls_buttontext = '=' Then
//	If IsValid(inv_dropdown) And ib_closeonclick Then			
//		of_SetFocusOnRequestor()
//		Return
//	End If
//End If
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Description:
// Make sure there is one row.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// This is not an updateable object.
this.of_SetUpdateable(False)


end event

event getfocus;call super::getfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  getfocus
//
//	Arguments:	None
//
//	Returns:  None
//
//	Description:  
//	Description:	The object may need to redirect focus when not visible.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Prevent this object from having focus while not visible.
Post of_RedirectFocus()

//Added By Jay Chen 12-23-2015
this.border = True
this.borderstyle = StyleBox!
end event

event losefocus;call super::losefocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  losefocus
//
//	Arguments:	None
//
//	Returns:  None
//
//	Description:  
//	If this object is being used as a DropDown object, hide it when focus
// is lost.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////


//Determine if the object is being used as a dropdown object.
gnv_debug.of_output(False, 'u_multi_select.dw_select.lostfocus(). ')
If IsValid(inv_dropdown) Then
	gnv_debug.of_output(false, 'u_multi_select.dw_select.lostfocus() hide the object.')
	// Hide object.
	Parent.Visible = False
End If
//Added By Jay Chen 12-23-2015
dw_select.borderstyle = StyleBox!
Return
end event

event itemchanged;call super::itemchanged;string ls_value,ls_select,ls_data,ls_itemname,ls_itemcode
long ll_row,ll_itemcode,ll_cnt,ll_ctx,ll_find,ll_insertrow
long ll_rowcount,ll_start,ll_number,i,ll_text_width,ll_width
string ls_string,ls_sub,ls_array[]
nv_tooltip		lnv_tooltip
Powerobject	lpo_parent
String ls_multi_code //Added by Ken.Guo 2017/02/14. Support auto fill data for multi select field.

//Added By Jay Chen 12-23-2015
if dwo.name = 'as_choose' then
	If IsValid(idw_requestor) Then
		ll_row = idw_requestor.getrow()
		if ll_row > 0 then
			ll_ctx = idw_requestor.getitemnumber(ll_row,"ctx_id")
		end if
	End If
	
	dw_select.setitem(row, "as_choose", data)
	dw_select.accepttext()
	for ll_row = 1 to dw_select.rowcount()
		ls_select = dw_select.getitemstring(ll_row,"as_choose")
		ls_itemcode = dw_select.getitemstring(ll_row,"as_itemcode")
		if isnull(ls_select) then ls_select = ''
		ll_find = ids_select_item_list.find("field_data = '"+ls_itemcode+"' ",1, ids_select_item_list.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ls_select = 'Y' then
			ls_itemname = dw_select.getitemstring(ll_row,"as_itemname")
			if  ls_value = '' then
				ls_value = ls_itemname
			else
				ls_value = ls_value + ' | ' + ls_itemname  
//				ls_value = ls_value + ',' + ls_itemname  // modified by gavins 20160718
			end if
			
			//Added by Ken.Guo 2017/02/14. Support auto fill data for multi select field.
			If Not isnull(ls_itemcode) and ls_itemcode <> '' Then
				If ls_multi_code = '' Then
					ls_multi_code = ls_itemcode
				Else
					ls_multi_code = ls_multi_code + ' | ' +  ls_itemcode
				End If
			End If			 
			
			if ll_find < 1 then
				ll_insertrow = ids_select_item_list.insertrow(0)
				ids_select_item_list.setitem(ll_insertrow,"view_id", il_view)
				ids_select_item_list.setitem(ll_insertrow,"screen_id", il_screen)
				ids_select_item_list.setitem(ll_insertrow,"ctx_id", ll_ctx)
				ids_select_item_list.setitem(ll_insertrow,"field_name", is_fieldname)
				ids_select_item_list.setitem(ll_insertrow,"field_data", ls_itemcode)
			end if
		else
			if ll_find > 0 then
				ids_select_item_list.deleterow(ll_find)
			end if
		end if
	next

	If IsValid(idw_requestor) Then
		idw_requestor.setitem( idw_requestor.getrow(),is_fieldname, ls_value)
		
		//Added by Ken.Guo 2017/02/14. Support auto fill data for multi select field.
		idw_requestor.of_AutoDataFill(idw_requestor.il_ViewId,idw_requestor.il_ScreenId,is_fieldname, idw_requestor.getrow(),ls_multi_code)
		idw_requestor.of_auto_compute_field( idw_requestor.getrow(), 'E')
	End If
	
	//Added By Jay Chen 01-11-2016
	long ll_column_count,ll_null
	string ls_dddw_name,ls_colname,ls_coltype,ls_style,ls_tag
	datawindowchild dwchild
	if AppeonGetClientType() = 'WEB' then
		ls_coltype = idw_requestor.Describe(is_fieldname+".coltype")
		ls_style = idw_requestor.Describe(is_fieldname+".edit.style")
		if ls_style = 'dddw' and left(ls_coltype,4) = 'char' then
			ls_dddw_name = lower(idw_requestor.Describe(is_fieldname + ".DDDW.Name"))
			ls_tag = idw_requestor.describe(is_fieldname +".tag")
			if ls_dddw_name = "d_dddw_company" or ls_dddw_name = "d_dddw_company_list" or ls_dddw_name = 'dddw_contact_company_new' then 
				if long(ls_value) = 0 then //data value is not single company
					idw_requestor.getchild(is_fieldname, dwchild)
					if ls_dddw_name = 'dddw_contact_company_new' then
						dwchild.settransobject(sqlca)
						dwchild.retrieve(gs_user_id)
					else
						dwchild.settransobject(sqlca)
						dwchild.retrieve(ls_tag)
					end if
				end if
			end if
		end if 
	end if
	//end
	
//	if ids_select_item_list.update() = 1 then
//		commit;
//	end if

//	parent.visible = false

end if
end event

