$PBExportHeader$u_tabpg_lookup_detail.sru
forward
global type u_tabpg_lookup_detail from u_tabpg
end type
type dw_detail from u_dw within u_tabpg_lookup_detail
end type
end forward

global type u_tabpg_lookup_detail from u_tabpg
integer width = 3575
integer height = 1600
string text = "Detail"
event itemfocuschanged ( long row,  dwobject dwo )
event type long itemchanged ( long row,  dwobject dwo,  string data,  datawindow adw )
dw_detail dw_detail
end type
global u_tabpg_lookup_detail u_tabpg_lookup_detail

type variables
String	is_lookup_name,is_lookup_type

end variables

forward prototypes
public subroutine of_set_lookup_name (string as_lookup_name)
public subroutine of_set_lookup_type (string as_lookup_type)
end prototypes

event itemfocuschanged(long row, dwobject dwo);Parent.Dynamic Event ItemFocusChanged(Row,Dwo)
end event

event type long itemchanged(long row, dwobject dwo, string data, datawindow adw);Return Parent.Dynamic Event ItemChanged(Row,Dwo,data, adw)
end event

public subroutine of_set_lookup_name (string as_lookup_name);is_lookup_name = as_lookup_name
end subroutine

public subroutine of_set_lookup_type (string as_lookup_type);is_lookup_type = as_lookup_type
end subroutine

on u_tabpg_lookup_detail.create
int iCurrent
call super::create
this.dw_detail=create dw_detail
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_detail
end on

on u_tabpg_lookup_detail.destroy
call super::destroy
destroy(this.dw_detail)
end on

type dw_detail from u_dw within u_tabpg_lookup_detail
integer x = 18
integer y = 16
integer width = 3534
integer height = 1564
integer taborder = 10
boolean vscrollbar = false
boolean livescroll = false
end type

event itemchanged;call super::itemchanged;//Modify By Jervis 09.11.2009

if IsValid(m_pfe_cst_mdi_menu_lookup) then
	gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0,'Enabled', true)
end if


IF lower(dwo.name) = 'code' THEN
	IF LEN(data) > 0 THEN
		IF Lower(is_lookup_name) = 'contract action type' THEN
			IF NOT f_validstr(This.GetitemString(row, "custom_1")) THEN
				This.Setitem(row, "custom_1", data)
			END IF
		END IF
		IF NOT f_validstr(This.GetitemString(row, "description")) THEN
			This.Setitem(row, "description", data)
			this.selectedtext( )
		END IF
	END IF
	Return Parent.Dynamic Event ItemChanged(Row,Dwo,data, this )//added by gavins 20141011
END IF


end event

event itemfocuschanged;call super::itemfocuschanged;Parent.Dynamic Event ItemFocusChanged(Row,Dwo)

end event

event rbuttondown;call super::rbuttondown;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2008-01-16 By: Scofield
//$<Reason> Popup a dialog to modify column label.

String	ls_ColName
long		ll_Rtn
DateTime	ldt_Null

ls_ColName = Lower(dwo.Name)
if dw_Detail.Describe(ls_ColName + ".Type") <> "column" then return

if ls_ColName = "datetime_1" or ls_ColName = "datetime_2" then
	SetNull(ldt_Null)
	ll_Rtn = MessageBox("Set Null", "Would you like to set this Date to null?", question!, yesno!, 2)
	if ll_Rtn = 1 then this.SetItem(Row,ls_ColName,ldt_Null)
	return
end if

//---------------------------- APPEON END ----------------------------

end event

event doubleclicked;call super::doubleclicked;String	ls_Text,ls_ObjName

if This.AcceptText() <> 1 then return

ls_ObjName = dwo.Name
if ls_ObjName = 'large_description_1' or ls_ObjName = 'large_description_2' then
	This.SetColumn(ls_ObjName)
	ls_Text = This.GetItemString(Row,ls_ObjName)
	OpenWithParm(w_cp_desc,ls_Text)
	if Message.Doubleparm = -1 then return
	This.SetItem(Row,ls_ObjName,Message.StringParm)
	This.AcceptText()
	if IsValid(m_pfe_cst_mdi_menu_lookup) then m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0.Enabled = true
	Return
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2008-08-01 By: Scofield
//$<Reason> Popup a dialog to input the phone

String	ls_Phone,ls_fax,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
			if IsValid(m_pfe_cst_mdi_menu_lookup) then m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0.Enabled = true
		end if
		This.SetColumn('phone')
	elseif dwo.name = 'fax' then
		ls_fax = This.GetItemString(row,'fax')
		if IsNull(ls_fax) then ls_fax = ""
		OpenWithParm(w_phonedetail,"Fax:" + ls_fax)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'fax',ls_RetParm)
			if IsValid(m_pfe_cst_mdi_menu_lookup) then m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0.Enabled = true
		end if
		This.SetColumn('fax')
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event rbuttonup;//Modified By Ken.Guo 2016-05-26. added cut/copy/paste/selectall
//comment ancestor script
Long ll_cnt_org,i,ll_getrow
String ls_val, ls_type,ls_currcolname,ls_editstyle,ls_colname,ls_protect,ls_expression
Boolean lb_readonly,lb_desired,lb_editstyleattrib
Integer li_tabsequence
n_cst_conversion	lnv_conversion
menu lm_pop
m_dw lm_dw
m_pfe_cst_mdi_menu_lookup lm_pfe_cst_mdi_menu_lookup
lm_dw = Create m_dw
lm_pop = Create menu
lm_pfe_cst_mdi_menu_lookup = Create m_pfe_cst_mdi_menu_lookup
lm_dw.of_setparent(This)

if IsValid(w_Mdi) and IsValid(m_pfe_cst_mdi_menu_lookup) then
	//m_pfe_cst_mdi_menu_lookup.m_lookup.PopMenu(w_Mdi.PointerX(),w_Mdi.PointerY())//Commented By Ken.Guo 2016-05-26
	
	ls_type = dwo.type
	ll_getrow = This.GetRow()
	// Only for editable column
	ls_val = This.Object.DataWindow.Readonly
	lb_readonly = lnv_conversion.of_Boolean (ls_val)

	// Get column properties
	ls_currcolname = This.GetColumnName()
	If ls_type = "column" Then
		ls_editstyle = dwo.Edit.Style
		ls_colname = dwo.Name
		ls_protect = dwo.Protect
		If Not IsNumber(ls_protect) Then
			// Since it is not a number, it must be an expression.
			ls_expression = Right(ls_protect, Len(ls_protect) - Pos(ls_protect, "~t"))
			ls_expression = "Evaluate(~""+ls_expression+","+String(row)+")"
			ls_protect = This.Describe(ls_expression)
		End If
		ls_val = dwo.TabSequence
		If IsNumber (ls_val) Then
			li_tabsequence = Integer (ls_val)
		End If
	End If
	
	//////////////////////////////////////////////////////////////////////////////
	// Transfer operations.  Only enable for editable column edit styles
	//////////////////////////////////////////////////////////////////////////////
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_copy,'Enabled', False)
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_cut,'Enabled', False)
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_paste,'Enabled', False)
	gnv_app.of_modify_menu_attr( lm_dw.m_table.m_selectall,'Enabled', False)
	
	// Get the column/editystyle specific editable flag.
	If ls_type = "column" And Not lb_readonly Then
		Choose Case ls_editstyle
			Case "edit"
				ls_val = dwo.Edit.DisplayOnly
			Case "editmask"
				ls_val = dwo.EditMask.Readonly
			Case "ddlb"
				ls_val = dwo.DDLB.AllowEdit
			Case "dddw"
				ls_val = dwo.DDDW.AllowEdit
			Case Else
				ls_val = ""
		End Choose
		lb_editstyleattrib = lnv_conversion.of_Boolean (ls_val)
		If IsNull(lb_editstyleattrib) Then lb_editstyleattrib = False
	End If
	
	//Added By Ken.Guo 2016-03-31.   uncomment these script.
	if ls_type = "column" and not lb_readonly then
		if dwo.BitmapName = "no" and ls_editstyle <> "checkbox" and ls_editstyle <> "radiobuttons" then
			
			if Len (this.SelectedText()) > 0 and ll_getrow = row and ls_currcolname = ls_colname then
				// Copy
				lm_dw.m_table.m_copy.Enabled = true
	
				// Cut
				if li_tabsequence > 0 and ls_protect = "0" then
					lb_desired = false
					choose case ls_editstyle
						case "edit", "editmask"
							lb_desired = not lb_editstyleattrib
						case "ddlb", "dddw"
							lb_desired = lb_editstyleattrib
					end choose
					lm_dw.m_table.m_cut.Enabled = lb_desired
				end if
			end if
				
			if li_tabsequence > 0 and ls_protect = "0" then
				// Paste
				if Len (ClipBoard()) > 0 then
					lb_desired = false
					choose case ls_editstyle
						case "edit", "editmask"
							lb_desired = not lb_editstyleattrib
						case "ddlb", "dddw"
							lb_desired = lb_editstyleattrib
					end choose
					lm_dw.m_table.m_paste.Enabled = lb_desired
				end if
	
				// Select All
				if Len (this.GetText()) > 0 and ll_getrow = row and ls_currcolname = ls_colname then
					choose case ls_editstyle
						case "ddlb", "dddw"
							lb_desired = lb_editstyleattrib						
						case else
							lb_desired = true
					end choose
					lm_dw.m_table.m_selectall.Enabled = lb_desired				
				end if
			end if
	
		end if
	end if

	lm_pop.item[1] = lm_dw.m_table.m_cut	
	lm_pop.item[2] = lm_dw.m_table.m_copy	
	lm_pop.item[3] = lm_dw.m_table.m_paste	
	lm_pop.item[4] = lm_dw.m_table.m_selectall	
	lm_pop.item[5] = lm_dw.m_table.m_dash11	
	
	ll_cnt_org = UpperBound(lm_pfe_cst_mdi_menu_lookup.m_lookup.item[])
	For i = 1 To ll_cnt_org 
		lm_pop.item[UpperBound(lm_pop.item[]) + 1] = lm_pfe_cst_mdi_menu_lookup.m_lookup.item[i]
	Next
	lm_pop.PopMenu(w_Mdi.PointerX(),w_Mdi.PointerY())
end if

Destroy lm_dw
//Destroy lm_pfe_cst_mdi_menu_lookup //should comment. otherwise popup error after change lookup table
Return 1

end event

event itemerror;call super::itemerror;Return 1
end event

event buttonclicked;call super::buttonclicked;if dwo.Name = "b_description_1" then
	This.Trigger Event DoubleClicked(0,0,row,This.Object.large_description_1)
elseif dwo.Name = "b_description_2" then
	This.Trigger Event DoubleClicked(0,0,row,This.Object.large_description_2)
end if

end event

