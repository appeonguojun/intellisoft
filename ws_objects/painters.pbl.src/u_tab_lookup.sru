$PBExportHeader$u_tab_lookup.sru
forward
global type u_tab_lookup from u_tab
end type
type tabpage_browse from u_tabpg_lookup_browse within u_tab_lookup
end type
type tabpage_browse from u_tabpg_lookup_browse within u_tab_lookup
end type
type tabpage_detail from u_tabpg_lookup_detail within u_tab_lookup
end type
type tabpage_detail from u_tabpg_lookup_detail within u_tab_lookup
end type
end forward

global type u_tab_lookup from u_tab
integer width = 3209
integer height = 1584
tabposition tabposition = tabsonbottom!
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
event itemfocuschanged ( long row,  dwobject dwo )
event type long itemchanged ( long row,  dwobject dwo,  string data,  datawindow adw )
end type
global u_tab_lookup u_tab_lookup

forward prototypes
public subroutine of_rowfocuschanged ()
end prototypes

event itemfocuschanged(long row, dwobject dwo);String	ls_Name

if dwo.type = "column" then
	ls_Name = dwo.Name
	Tabpage_Browse.dw_Browse.SetColumn(ls_Name)
end if

end event

event type long itemchanged(long row, dwobject dwo, string data, datawindow adw);// Parent.Dynamic Event ItemChanged(Row,Dwo,data, this )

//added by gavins 20141011  check code repeat value

Long			ll_Find, ll_Lookup_Code_ID,ll_cnt
string ls_lookup_name,ls_code

If dwo.Name = "code" Then
	If Len( data ) > 0 Then
		ll_Lookup_Code_ID = adw.GetItemNumber( row, 'lookup_code' )
		ll_Find = adw.Find( "Trim(code) = '" + trim( data ) +"' and lookup_code <> " + string( ll_Lookup_Code_ID ) , 1, adw.RowCount( ) )
		If ll_Find > 0 Then
			if IsValid(m_pfe_cst_mdi_menu_lookup) then
				gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0,'Enabled', true)
			end if
			MessageBox( 'Lookup', 'The lookup code (' + data + ') you input already exists. Please input another value.' )
			adw.SetItem( row, 'code', '' )		
			adw.setfocus()
			adw.setrow(row)
			adw.scrolltorow(row)
			Return 2
		End If		
		
		//Added By Jay Chen 01-08-2015 check code if or not exist in code_lookup_delete_record
		if isvalid(w_lookup_maint) then
			ls_lookup_name = w_lookup_maint.is_lookup_name
			ls_code = trim( data )
			select count(*) into :ll_cnt from code_lookup_delete_record where lookup_name = :ls_lookup_name and code = :ls_code;
			if isnull(ll_cnt) then ll_cnt = 0
			if ll_cnt > 0 then
				if IsValid(m_pfe_cst_mdi_menu_lookup) then
					gnv_app.of_modify_menu_attr( m_pfe_cst_mdi_menu_lookup.m_lookup.m_save0,'Enabled', true)
				end if
				MessageBox( 'Lookup', 'The lookup code (' + data + ') you input already exists in the restore lookup table record. Please input another value or restore the code (' + data + ') from the restore lookup table.' )
				adw.SetItem( row, 'code', '' )	
				adw.setfocus()
				adw.setrow(row)
				adw.scrolltorow(row)
				Return 2
			end if
		end if
		//End
	End If	
End If

Return 0
end event

public subroutine of_rowfocuschanged ();long	ll_Row

ll_Row = Tabpage_Browse.dw_Browse.GetRow()

Tabpage_Detail.dw_Detail.ScrollToRow(ll_Row)
Tabpage_Detail.dw_Detail.SetRow(ll_Row)

end subroutine

on u_tab_lookup.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_browse
this.Control[iCurrent+2]=this.tabpage_detail
end on

on u_tab_lookup.destroy
call super::destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
end on

event selectionchanged;call super::selectionchanged;long	ll_CurRow,ll_Column

if NewIndex = 1 then
	Tabpage_Detail.dw_Detail.AcceptText()
	ll_CurRow = Tabpage_Detail.dw_Detail.GetRow()
	ll_Column = Tabpage_Detail.dw_Detail.GetColumn()
	
	Tabpage_Browse.dw_Browse.ScrollToRow(ll_CurRow)
	Tabpage_Browse.dw_Browse.SetRow(ll_CurRow)
	Tabpage_Browse.dw_Browse.SetColumn(ll_Column)
	Tabpage_Browse.dw_Browse.SetFocus()
else
	Tabpage_Browse.dw_Browse.AcceptText()
	ll_CurRow = Tabpage_Browse.dw_Browse.GetRow()
	ll_Column = Tabpage_Browse.dw_Browse.GetColumn()
	
	Tabpage_Detail.dw_Detail.ScrollToRow(ll_CurRow)
	Tabpage_Detail.dw_Detail.SetRow(ll_CurRow)
	Tabpage_Detail.dw_Detail.SetColumn(ll_Column)
	Tabpage_Detail.dw_Detail.SetFocus()
end if

end event

event resize;call super::resize;Tabpage_Browse.dw_Browse.Accepttext( ) //Added By Ken.Guo 2010-12-30.
end event

type tabpage_browse from u_tabpg_lookup_browse within u_tab_lookup
integer x = 18
integer y = 16
integer width = 3173
integer height = 1456
long tabbackcolor = 67108864
string picturename = "custom065!"
long picturemaskcolor = 12632256
string powertiptext = "Browse"
end type

type tabpage_detail from u_tabpg_lookup_detail within u_tab_lookup
integer x = 18
integer y = 16
integer width = 3173
integer height = 1456
string picturename = "custom100!"
long picturemaskcolor = 12632256
string powertiptext = "Detail"
end type

