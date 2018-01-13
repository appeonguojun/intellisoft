$PBExportHeader$u_tabpg_lookup_browse.sru
forward
global type u_tabpg_lookup_browse from u_tabpg
end type
type dw_browse from u_dw within u_tabpg_lookup_browse
end type
end forward

global type u_tabpg_lookup_browse from u_tabpg
integer width = 3575
integer height = 1600
string text = "Browse"
event type long itemchanged ( long row,  dwobject dwo,  string data,  datawindow adw )
dw_browse dw_browse
end type
global u_tabpg_lookup_browse u_tabpg_lookup_browse

type variables
String	is_lookup_name,is_lookup_type

end variables

forward prototypes
public subroutine of_set_lookup_name (string as_lookup_name)
public subroutine of_set_lookup_type (string as_lookup_type)
public function long of_security ()
public subroutine of_movetodetailtab ()
public subroutine of_rowfocuschanged ()
end prototypes

event type long ItemChanged(long row, dwobject dwo, string data, datawindow adw);Return Parent.Dynamic Event ItemChanged(Row,Dwo,data, adw)
end event

public subroutine of_set_lookup_name (string as_lookup_name);is_lookup_name = as_lookup_name
end subroutine

public subroutine of_set_lookup_type (string as_lookup_type);is_lookup_type = as_lookup_type
end subroutine

public function long of_security ();Return w_mdi.of_security_access(560)
end function

public subroutine of_movetodetailtab ();Parent.Dynamic Function SelectTab(2)

end subroutine

public subroutine of_rowfocuschanged ();Parent.Dynamic Function of_RowFocusChanged()

end subroutine

on u_tabpg_lookup_browse.create
int iCurrent
call super::create
this.dw_browse=create dw_browse
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_browse
end on

on u_tabpg_lookup_browse.destroy
call super::destroy
destroy(this.dw_browse)
end on

type dw_browse from u_dw within u_tabpg_lookup_browse
integer x = 18
integer y = 16
integer width = 3534
integer height = 1564
integer taborder = 10
boolean hscrollbar = true
end type

event clicked;call super::clicked;//Start Code Change ---- 10.15.2007 #V7 maha
long	ll_Row

ll_Row = This.GetClickedRow()
This.SetRow(ll_Row)
//End Code Change---10.15.2007

end event

event constructor;call super::constructor;This.of_SetSort(True)
This.inv_sort.of_SetStyle(3)
This.of_SetReqColumn(True)

This.inv_sort.of_SetColumnHeader(True)
This.of_SetUpdatEable(false)

end event

event doubleclicked;call super::doubleclicked;String	ls_Text,ls_ObjName

if This.AcceptText() <> 1 then return

ls_ObjName = dwo.Name
if ls_ObjName = 'large_description_1' or ls_ObjName = 'large_description_2' then
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
	else
		of_MoveToDetailTab()
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event dropdown;call super::dropdown;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.27.2006 By: LeiWei
//$<reason> Browse word document for Contract Action Type.

String ls_column
string docpath, docname
Long ll_row
integer li_rtn
Integer li_word_storage_type

ls_column = This.Getcolumnname()

IF Lower(is_lookup_name) = 'contract action type' THEN
	ll_row = This.Getrow()
	IF ls_column = 'custom_6' THEN
		li_word_storage_type = Integer(gnv_data.of_getitem( "icred_settings", "set_50", FALSE))
		IF Isnull(li_word_storage_type) THEN li_word_storage_type = 0
		IF Upper( AppeonGetClientType() ) = "PB" AND li_word_storage_type = 0 THEN
			// Store on Hard Disk
			gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//			li_rtn = GetFileOpenName("Select File", docpath, docname, "DOC", "Doc Files (*.DOC),*.DOC")		//Added By Mark Lee 08/15/2014
			n_getfilename     ln_getfilename
			li_rtn = ln_getfilename.of_getopenfilename("Select File", docpath, docname, "DOC", "Doc Files (*.DOC),*.DOC")
			gf_save_dir_path(docpath) //Added by Ken.Guo on 2009-03-10
			//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008
			IF li_rtn = 1 THEN
				This.Setitem( ll_row, "custom_6", docname)
			END IF
			RETURN 1
		END IF
	END IF
END IF

if ls_Column = "datetime_1" or ls_Column = "datetime_2" then return 1		//Added by scofield on 2008-03-03

//---------------------------- APPEON END ----------------------------

end event

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
	Return Parent.Dynamic Event ItemChanged(Row,Dwo,data, this )
END IF


end event

event pfc_postupdate;call super::pfc_postupdate;

// mskinner 09 March 2006 -- begin
//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 09.04.2006 By: LeiWei
//$<reason> Fix a defect.
/*
if pos(string(dw_name.inv_base.of_getItem( 1, 'lookup_name')), 'Contract' ) > 0 then 
      ib_refresh_cache = true
end if 
*/
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 04.05.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Have the application refresh the data in ids_code_lookup if the
//$<modification> data in code_lookup table is changed. 
gnv_appeondb.of_startqueue()
update code_lookup set modify_date = getdate() where lookup_name = :is_lookup_name; //11.30.2006 Added by henry.
gnv_data.of_retrieve( "code_lookup" )
gnv_data.of_retrieve('code_lookup_2') //Added 11.30.2006 henry
gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.29.2006 By: LeiWei
//$<reason> Referesh cache for contract.

gnv_app.of_setcontraccache_code_lookup(is_lookup_name)
//18.12.2006 by Allen:Refresh dddw of dw_dashboard if lookup Table changed.
IF IsValid(w_todolist_painter) THEN
	w_todolist_painter.dw_dashboard.Event ue_refresh_dddw(True)
END IF
//---------------------------- APPEON END ----------------------------

RETURN SUCcess

// mskinner 09 March 2006 -- end 


end event

event pfc_preupdate;call super::pfc_preupdate;Boolean lb_updated = False
Integer i
Integer li_Rc
DateTime ldt_dt
string ls_code //maha 031406

li_rc = This.RowCount()

if li_rc < 1 then return - 1

if of_security() = 0 then //maha 040204  view only security sets modified to no so that if the user modifies records
	for i = 1 to li_rc
		This.setItemStatus( i, 0, Primary!,NotModified! ) 
	next
	Return Success
end if

FOR i = 1 TO li_rc
	IF ( This.GetItemStatus( i, 0, Primary! ) = DataModified! OR This.GetItemStatus( i, 0, Primary! ) = NewModified! ) AND is_lookup_type = "A" THEN
		lb_updated = True
	END IF
	
	if IsValid(w_lookup_maint) then
		IF w_lookup_maint.ii_dept_secure_setting = 1 Then
			//if a department is added and the department security is turned on then add to security department table.
			IF This.GetItemStatus( i, 0, Primary! ) = NewModified! THEN
				w_lookup_maint.of_add_security_dept( i )
			END IF
		END IF
	end if
END FOR

//Start Code Change ---- 03.14.2006 #319 maha
if this.getitemstring(1,"lookup_name") = "Affiliation Status" then
	for i = 1 to li_rc
		if len (this.getitemstring(i,"code")) > 1 then
			messagebox("Lookup Data","In the Affilation Status table CODE values must be one character in length and cannot be duplicated. ")
			return - 1
		end if
	next
	for i = 1 to li_rc - 1
		ls_code = this.getitemstring(i ,"code")
		if this.find("code ='" + ls_code + "'", i + 1, li_rc) > 0 then
			messagebox("Lookup Data for code - " + ls_code,"In the Affilation Status table CODE values must be one character in length and cannot be duplicated. ")
			return - 1
		end if
	next
end if

//End Code Change---03.14.2006

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.19.2006 By: Davis
//$<reason> Fix a defect.

IF Lower(is_lookup_name) = 'contract action type' THEN
	FOR i = 1 TO This.Rowcount( )
		IF NOT f_validstr(This.GetitemString(i, "custom_1")) THEN
			This.Setitem(i, "custom_1", This.GetitemString(i, "code"))
		END IF
	END FOR
END IF

//---------------------------- APPEON END ----------------------------

IF lb_updated = True THEN
	ldt_dt = DateTime( Today(), Now() )
	UPDATE ids SET lookup_cache = :ldt_dt;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "SQL ERROR", SQLCA.SQLERRTEXT )
		Return -1
	END IF
	COMMIT USING SQLCA;
END IF

Return Success

end event

event pfc_retrieve;call super::pfc_retrieve;Return This.Retrieve(is_lookup_name)
end event

event rbuttondown;call super::rbuttondown;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2008-01-16 By: Scofield
//$<Reason> Popup a dialog to modify column label.

String	ls_ColName
long		ll_Rtn
DateTime	ldt_Null

ls_ColName = Lower(dwo.Name)
if dw_Browse.Describe(ls_ColName + ".Type") <> "column" then return

if ls_ColName = "datetime_1" or ls_ColName = "datetime_2" then
	SetNull(ldt_Null)
	ll_Rtn = MessageBox("Set Null", "Would you like to set this Date to null?", question!, yesno!, 2)
	if ll_Rtn = 1 then this.SetItem(Row,ls_ColName,ldt_Null)
	return
end if
//---------------------------- APPEON END ----------------------------

end event

event itemfocuschanged;call super::itemfocuschanged;if dwo.name = "code" or dwo.name = "description" or &
   dwo.name = "large_description_1" or dwo.name = "large_description_2" then
	if IsValid(m_pfe_cst_mdi_menu_lookup) then
		gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_columnproperties,'Enabled', false)
	end if
else
	if IsValid(m_pfe_cst_mdi_menu_lookup) then
		gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_columnproperties,'Enabled', true)
	end if
end if

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

event rowfocuschanged;call super::rowfocuschanged;of_RowFocusChanged()

end event

event itemerror;call super::itemerror;Return 1

end event

event pfc_addrow;//Added By Jay Chen 01-22-2015
if isvalid(w_lookup_maint) then
	w_lookup_maint.TriggerEvent("ue_add")
	return 1
end if

end event

