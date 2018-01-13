$PBExportHeader$w_print_columns_select.srw
forward
global type w_print_columns_select from w_response
end type
type ddlb_border from dropdownlistbox within w_print_columns_select
end type
type st_5 from statictext within w_print_columns_select
end type
type st_4 from statictext within w_print_columns_select
end type
type ddlb_title_font_size from dropdownlistbox within w_print_columns_select
end type
type ddlb_fields_font_size from dropdownlistbox within w_print_columns_select
end type
type st_3 from statictext within w_print_columns_select
end type
type em_fields_width from editmask within w_print_columns_select
end type
type st_2 from statictext within w_print_columns_select
end type
type ddlb_fields_alignment from dropdownlistbox within w_print_columns_select
end type
type ddlb_label_alignment from dropdownlistbox within w_print_columns_select
end type
type st_fields_alignment from statictext within w_print_columns_select
end type
type st_label_alignment from statictext within w_print_columns_select
end type
type sle_title from singlelineedit within w_print_columns_select
end type
type st_1 from statictext within w_print_columns_select
end type
type cb_select from commandbutton within w_print_columns_select
end type
type cb_cancel from commandbutton within w_print_columns_select
end type
type cb_ok from commandbutton within w_print_columns_select
end type
type dw_list from u_dw within w_print_columns_select
end type
type gb_1 from groupbox within w_print_columns_select
end type
type gb_2 from groupbox within w_print_columns_select
end type
end forward

global type w_print_columns_select from w_response
integer width = 2025
integer height = 1880
string title = "Vertical Print Settings"
ddlb_border ddlb_border
st_5 st_5
st_4 st_4
ddlb_title_font_size ddlb_title_font_size
ddlb_fields_font_size ddlb_fields_font_size
st_3 st_3
em_fields_width em_fields_width
st_2 st_2
ddlb_fields_alignment ddlb_fields_alignment
ddlb_label_alignment ddlb_label_alignment
st_fields_alignment st_fields_alignment
st_label_alignment st_label_alignment
sle_title sle_title
st_1 st_1
cb_select cb_select
cb_cancel cb_cancel
cb_ok cb_ok
dw_list dw_list
gb_1 gb_1
gb_2 gb_2
end type
global w_print_columns_select w_print_columns_select

type variables
u_dw idw_search
Long il_width = 3968 ,il_height = 2224
Long il_header_band_h,il_detail_band_h,il_foot_band_h,il_summary_band_h
end variables

forward prototypes
public function integer of_gen_col_list ()
public subroutine of_get_bands_height ()
public function boolean of_is_out_band (string as_col_name)
public subroutine of_group_columns ()
end prototypes

public function integer of_gen_col_list ();String ls_objects_string,ls_hide_columns_string,ls_coltype
String ls_objects_all[],ls_columns[],ls_columns_label[],ls_column_type[],ll_columns_object_type[]
String ls_char500,ls_sql,ls_syntax,ls_err,ls_objtype
Long i,j,ll_row_cnt,ll_row,ll_columns_x[],ll_column_len[],ll_col_cnt,ll_columns_y[],ll_columns_w[],ll_columns_h[]
Integer li_char_len
n_cst_string_appeon lnv_string
DataStore lds_report
ls_char500 = Space(500)


SetPointer(HourGlass!)
dw_list.reset()
ls_objects_string = idw_search.Describe("datawindow.Objects")
lnv_string.of_parsetoarray(ls_objects_string,'~t',ls_objects_all[])

of_get_bands_height()

//Get Visible Columns or Compute 
For i = 1 To UpperBound(ls_objects_all[])
	//If not exists
	If idw_search.Describe(ls_objects_all[i]+'.Attributes') = '!' or idw_search.Describe(ls_objects_all[i]+'.Attributes') = '?' Then Continue
	//If invisible
	If idw_search.Describe(ls_objects_all[i]+'.visible') = '0' Or Pos(Upper(ls_hide_columns_string),'/' + Upper(ls_objects_all[i]) + '/') > 0 Then
		Continue	
	End If
	ls_objtype = Upper(idw_search.Describe(ls_objects_all[i]+'.type')) 
	If ls_objtype = 'COLUMN' or  ls_objtype = 'COMPUTE' or  ls_objtype = 'GROUPBOX' Then
		If of_is_out_band(ls_objects_all[i]) Then Continue
		ls_columns[UpperBound(ls_columns[]) + 1] = ls_objects_all[i]
		ll_columns_x[UpperBound(ll_columns_x[]) + 1] = Long(idw_search.Describe(ls_objects_all[i]+'.x'))
		ll_columns_y[UpperBound(ll_columns_y[]) + 1] = Long(idw_search.Describe(ls_objects_all[i]+'.y'))
		ll_columns_w[UpperBound(ll_columns_w[]) + 1] = Long(idw_search.Describe(ls_objects_all[i]+'.width'))
		ll_columns_h[UpperBound(ll_columns_h[]) + 1] = Long(idw_search.Describe(ls_objects_all[i]+'.height'))
		
		ll_columns_object_type[UpperBound(ll_columns_object_type[]) + 1] = ls_objtype

		
		//Gen column/groupbox label
		If ls_objtype = 'GROUPBOX' Then
			ls_columns_label[UpperBound(ls_columns_label[]) + 1] = idw_search.Describe(ls_objects_all[i] + '.Text')
		Else
			//for column
			If Len(idw_search.Describe(ls_objects_all[i] + '_t.Attributes')) > 1 Then
				ls_columns_label[UpperBound(ls_columns_label[]) + 1] = idw_search.Describe(ls_objects_all[i] + '_t.Text')
			Else
				If Len(idw_search.Describe(Left(ls_objects_all[i],Len(ls_objects_all[i]) - 2) + '_t.Attributes')) > 1 Then
					//For Compute Column
					ls_columns_label[UpperBound(ls_columns_label[]) + 1] = idw_search.Describe(Left(ls_objects_all[i],Len(ls_objects_all[i]) - 2) + '_t.Text')
				Else
					ls_columns_label[UpperBound(ls_columns_label[]) + 1] = ls_objects_all[i]
				End If
			End If
		End If
		
		//Gen column length
		ls_coltype = idw_search.Describe(ls_objects_all[i] + '.coltype')
		ls_column_type[UpperBound(ls_column_type[]) + 1] = ls_coltype //Added By Ken.Guo 04/19/2012		
		Choose Case Left(Lower(ls_coltype),5)
			Case 'char(','char'
				li_char_len = Integer(Mid(ls_coltype,6,2))
				If li_char_len > 0 Then
					ll_column_len[UpperBound(ll_column_len[]) + 1] = li_char_len
				Else
					ll_column_len[UpperBound(ll_column_len[]) + 1] = 150
				End If
			Case 'date','datet'
				ll_column_len[UpperBound(ll_column_len[]) + 1] = 20 
			Case Else //'decim','real','int','long','numbe','ulong'
				Choose Case lower(ls_objects_all[i])
					Case 'app_facility'
						ll_column_len[UpperBound(ll_column_len[]) + 1] = 150
					Case 'ctx_id','master_contract_id','master_cnt'
						ll_column_len[UpperBound(ll_column_len[]) + 1] = 15
					Case Else
						ll_column_len[UpperBound(ll_column_len[]) + 1] = 75		
				End Choose
		End Choose
	End If
Next

ll_col_cnt = UpperBound(ls_columns[])
If  ll_col_cnt > 0 Then 
	dw_list.SetRedraw(False)
	For i = 1 To ll_col_cnt
		dw_list.InsertRow(0)
	Next
	dw_list.object.col_name[1,ll_col_cnt] = ls_columns[]
	dw_list.object.col_label[1,ll_col_cnt] = ls_columns_label[]
	dw_list.object.col_x[1,ll_col_cnt] = ll_columns_x[]
	dw_list.object.col_y[1,ll_col_cnt] = ll_columns_y[]
	dw_list.object.col_w[1,ll_col_cnt] = ll_columns_w[]
	dw_list.object.col_h[1,ll_col_cnt] = ll_columns_h[]
	dw_list.object.col_length[1,ll_col_cnt] = ll_column_len[]
	dw_list.object.col_type[1,ll_col_cnt] = ls_column_type[] 
	dw_list.object.object_type[1,ll_col_cnt] = ll_columns_object_type[]
	
	dw_list.SetSort('col_y Asc col_x ASC')
	dw_list.Sort()
	dw_list.SetRedraw(True)
Else
	cb_ok.enabled = False
	Return -1
End If

Return 1
end function

public subroutine of_get_bands_height ();il_header_band_h	=	Long(idw_search.Describe("DataWindow.Header.Height"))
il_detail_band_h	=	Long(idw_search.Describe("DataWindow.Detail.Height"))
il_foot_band_h		=	Long(idw_search.Describe("DataWindow.Footer.Height"))
il_summary_band_h	=	Long(idw_search.Describe("DataWindow.Summary.Height"))



end subroutine

public function boolean of_is_out_band (string as_col_name);String ls_band
Long ll_y
ls_band = idw_search.Describe(as_col_name+ ".Band")
ll_y = Long(idw_search.Describe(as_col_name+ ".y"))
Choose Case lower(ls_band)
	Case 'header'
		If ll_y >= il_header_band_h Then Return True
	Case 'detail'
		If ll_y >= il_detail_band_h Then Return True
	Case 'summary'
		If ll_y >= il_summary_band_h Then Return True
	Case 'footer'
		If ll_y >= il_foot_band_h Then Return True
End Choose

Return False



end function

public subroutine of_group_columns ();//====================================================================
// Function: of_group_columns
//--------------------------------------------------------------------
// Description: Sort Objects in the GroupBox
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-12-23
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long ll_find_gb, ll_gb_x, ll_gb_y, ll_gb_w, ll_gb_h, ll_find_col, ll_cnt, ll_rowmove,i, ll_col_x,ll_col_y,ll_col2_x, ll_col2_y
String ls_find
ll_find_gb = dw_list.find('object_type = "GROUPBOX" and grouped = 0', 1, dw_list.rowcount())

Do while ll_find_gb > 0 
	ll_gb_x =  dw_list.getitemnumber(ll_find_gb, 'col_x')
	ll_gb_y =  dw_list.getitemnumber(ll_find_gb, 'col_y')
	ll_gb_w =  dw_list.getitemnumber(ll_find_gb, 'col_w')
	ll_gb_h =  dw_list.getitemnumber(ll_find_gb, 'col_h')
	
	ls_find = 'object_type <> "GROUPBOX" and col_x > ' + String(ll_gb_x) + ' and col_x < ' + String(ll_gb_x+ll_gb_w) +&
					' and col_y > ' + String(ll_gb_y) + ' and col_y < ' + String(ll_gb_y+ll_gb_h) + ' and grouped = 0'
	ll_find_col = dw_list.find(ls_find, 1, dw_list.rowcount())
	ll_cnt = 0
	Do While ll_find_col > 0 
		ll_col_x =  dw_list.getitemnumber(ll_find_col, 'col_x')
		ll_col_y =  dw_list.getitemnumber(ll_find_col, 'col_y')
		//get the tartget  row to move
		ll_rowmove = ll_find_gb+1
		If ll_cnt > 0 Then 
			For i = ll_find_gb + 1 To ll_find_gb + ll_cnt
				ll_col2_x =  dw_list.getitemnumber(i, 'col_x')
				ll_col2_y =  dw_list.getitemnumber(i, 'col_y')
				If (ll_col_y > ll_col2_y) or (ll_col_y=ll_col2_y and ll_col_x > ll_col2_x ) Then
					ll_rowmove = i + 1
				End If
			Next
		End If
		dw_list.rowsmove( ll_find_col, ll_find_col, primary!, dw_list,ll_rowmove, primary!)		
		ll_cnt++
		dw_list.setitem(ll_rowmove, 'grouped', 1)
		If ll_find_col < ll_find_gb Then ll_find_gb = ll_find_gb - 1
		
		ll_find_col = dw_list.find(ls_find, 1, dw_list.rowcount())
	Loop
	
	dw_list.setitem(ll_find_gb, 'grouped', 1)
	ll_find_gb = dw_list.find('object_type = "GROUPBOX" and grouped = 0', 1, dw_list.rowcount())
Loop


end subroutine

on w_print_columns_select.create
int iCurrent
call super::create
this.ddlb_border=create ddlb_border
this.st_5=create st_5
this.st_4=create st_4
this.ddlb_title_font_size=create ddlb_title_font_size
this.ddlb_fields_font_size=create ddlb_fields_font_size
this.st_3=create st_3
this.em_fields_width=create em_fields_width
this.st_2=create st_2
this.ddlb_fields_alignment=create ddlb_fields_alignment
this.ddlb_label_alignment=create ddlb_label_alignment
this.st_fields_alignment=create st_fields_alignment
this.st_label_alignment=create st_label_alignment
this.sle_title=create sle_title
this.st_1=create st_1
this.cb_select=create cb_select
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_list=create dw_list
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_border
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.ddlb_title_font_size
this.Control[iCurrent+5]=this.ddlb_fields_font_size
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.em_fields_width
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.ddlb_fields_alignment
this.Control[iCurrent+10]=this.ddlb_label_alignment
this.Control[iCurrent+11]=this.st_fields_alignment
this.Control[iCurrent+12]=this.st_label_alignment
this.Control[iCurrent+13]=this.sle_title
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.cb_select
this.Control[iCurrent+16]=this.cb_cancel
this.Control[iCurrent+17]=this.cb_ok
this.Control[iCurrent+18]=this.dw_list
this.Control[iCurrent+19]=this.gb_1
this.Control[iCurrent+20]=this.gb_2
end on

on w_print_columns_select.destroy
call super::destroy
destroy(this.ddlb_border)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.ddlb_title_font_size)
destroy(this.ddlb_fields_font_size)
destroy(this.st_3)
destroy(this.em_fields_width)
destroy(this.st_2)
destroy(this.ddlb_fields_alignment)
destroy(this.ddlb_label_alignment)
destroy(this.st_fields_alignment)
destroy(this.st_label_alignment)
destroy(this.sle_title)
destroy(this.st_1)
destroy(this.cb_select)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_list)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;//Added By Ken.Guo 2015-12-29
If isvalid(Message.powerobjectparm) Then
	idw_search = Message.powerobjectparm
Else
	Messagebox('Error','Failed to get data, please call support')
	Close(This)
End If

//Load last settings
If gnv_user_option.of_get_option_value( 'Vertical Print Settings-Title Font Size') <> '' Then
	 ddlb_title_font_size.text = gnv_user_option.of_get_option_value( 'Vertical Print Settings-Title Font Size')
End If

If gnv_user_option.of_get_option_value( 'Vertical Print Settings-Fields Font Size') <> '' Then
	 ddlb_fields_font_size.text = gnv_user_option.of_get_option_value( 'Vertical Print Settings-Fields Font Size')
End If

If gnv_user_option.of_get_option_value( 'Vertical Print Settings-Fields Width') <> '' Then
	em_fields_width.text = gnv_user_option.of_get_option_value( 'Vertical Print Settings-Fields Width')
End If

If gnv_user_option.of_get_option_value( 'Vertical Print Settings-Fields Alignment' ) <> '' Then
	ddlb_fields_alignment.text = gnv_user_option.of_get_option_value( 'Vertical Print Settings-Fields Alignment' )
End If

If gnv_user_option.of_get_option_value( 'Vertical Print Settings-Label Alignment' ) <> '' Then
	ddlb_label_alignment.text = gnv_user_option.of_get_option_value( 'Vertical Print Settings-Label Alignment' )
End If

If gnv_user_option.of_get_option_value( 'Vertical Print Settings-Fields Border') <> '' Then
	ddlb_border.text = gnv_user_option.of_get_option_value( 'Vertical Print Settings-Fields Border')
End If

of_gen_col_list()
of_group_columns()

//auto set default title
powerobject lpo_parent
userobject luo_1
window w_1
If idw_search.titlebar and  idw_search.title <> '' Then
	sle_title.text = idw_search.title
Else 
	lpo_parent = idw_search.getparent()
	Do While isvalid(lpo_parent) 
		Choose Case lpo_parent.typeof()
			Case userobject!
				luo_1 = lpo_parent
				If trim(luo_1.text) <> '' Then
					sle_title.text = Trim(luo_1.text)
					Exit
				End If
			Case window!
				w_1 = lpo_parent
				If trim(w_1.title	) <> '' Then
					sle_title.text = Trim(w_1.title	)
					Exit
				End If
		End Choose
		lpo_parent = lpo_parent.getparent()
	Loop
		
End If


end event

type ddlb_border from dropdownlistbox within w_print_columns_select
integer x = 1591
integer y = 932
integer width = 325
integer height = 444
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Box"
string item[] = {"None","Shadow","Box","Underline","3D Lowered","3D Raised"}
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_print_columns_select
integer x = 1211
integer y = 948
integer width = 370
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fields Border:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_print_columns_select
integer x = 1207
integer y = 320
integer width = 347
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Title Font Size:"
boolean focusrectangle = false
end type

type ddlb_title_font_size from dropdownlistbox within w_print_columns_select
integer x = 1586
integer y = 300
integer width = 325
integer height = 324
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "12"
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"7","8","9","10","12","14","16","20"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_fields_font_size from dropdownlistbox within w_print_columns_select
integer x = 1591
integer y = 440
integer width = 325
integer height = 324
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "9"
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"7","8","9","10","12","14","16","20"}
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_print_columns_select
integer x = 1211
integer y = 456
integer width = 352
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fieds Font Size:"
boolean focusrectangle = false
end type

type em_fields_width from editmask within w_print_columns_select
integer x = 1614
integer y = 560
integer width = 306
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "5.00"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "####.00"
boolean spin = true
double increment = 0.5
string minmax = "1~~100"
end type

type st_2 from statictext within w_print_columns_select
integer x = 1211
integer y = 584
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fields Width (CM):"
boolean focusrectangle = false
end type

type ddlb_fields_alignment from dropdownlistbox within w_print_columns_select
integer x = 1591
integer y = 684
integer width = 325
integer height = 444
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Left"
string item[] = {"Left","Center","Right","Original"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_label_alignment from dropdownlistbox within w_print_columns_select
integer x = 1591
integer y = 812
integer width = 325
integer height = 444
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Left"
string item[] = {"Left","Center","Right","Original"}
borderstyle borderstyle = stylelowered!
end type

type st_fields_alignment from statictext within w_print_columns_select
integer x = 1211
integer y = 700
integer width = 370
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fields Alignment:"
boolean focusrectangle = false
end type

type st_label_alignment from statictext within w_print_columns_select
integer x = 1211
integer y = 824
integer width = 366
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Label Alignment:"
boolean focusrectangle = false
end type

type sle_title from singlelineedit within w_print_columns_select
integer x = 1207
integer y = 180
integer width = 718
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_print_columns_select
integer x = 1211
integer y = 112
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
string text = "Report Title:"
boolean focusrectangle = false
end type

type cb_select from commandbutton within w_print_columns_select
integer x = 14
integer y = 1664
integer width = 379
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "De&select ALL"
end type

event clicked;Long i, ll_cnt
Integer li_value_0[],li_value_1[]

ll_cnt = dw_list.RowCount()
If ll_cnt < 1 Then Return 1
For i = 1 To ll_cnt
	li_value_0[UpperBound(li_value_0[]) + 1 ] = 0
	li_value_1[UpperBound(li_value_1[]) + 1 ] = 1	
Next

If This.Text = '&Select ALL' Then
	dw_list.object.selected[1,ll_cnt] = li_value_1[]
	This.Text = 'De&select ALL'
Else
	dw_list.object.selected[1,ll_cnt] = li_value_0[]
	This.Text = '&Select ALL'
End If

end event

type cb_cancel from commandbutton within w_print_columns_select
integer x = 1591
integer y = 1664
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_print_columns_select
integer x = 1248
integer y = 1664
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;Long ll_cnt
str_print_dw lstr_print_dw
//n_ds lds_list

ll_cnt = dw_list.Find('Selected = 1',1,dw_list.rowcount())

If ll_cnt = 0 Then
	Messagebox('Selection Error','You must at least select one column.')
	Return -1
End If

//check arguments
lstr_print_dw.adw_data = idw_search 
lstr_print_dw.adw_columns = dw_list

lstr_print_dw.as_title = sle_title.text
If double(em_fields_width.text) <= 0 Then
	Messagebox('Tips','Fields Width must large than zero. ')
	em_fields_width.setfocus()
	Return
End If
lstr_print_dw.al_fields_width = double(em_fields_width.text)  * 172.8

If Not isnumber(ddlb_title_font_size.text) or Long(ddlb_title_font_size.text) < 0  Then
	Messagebox('Tips','Font Size must large than zero. ')
	ddlb_title_font_size.setfocus()
	Return	
End If
If Not isnumber(ddlb_fields_font_size.text) or Long(ddlb_fields_font_size.text) < 0 Then
	Messagebox('Tips','Font Size must large than zero. ')
	ddlb_fields_font_size.setfocus()
	Return	
End If

//Pass arguments
lstr_print_dw.al_title_font_size = 0 - Long(ddlb_title_font_size.text)
lstr_print_dw.al_fields_font_size = 0 - Long(ddlb_fields_font_size.text)
lstr_print_dw.as_fields_alignment = ddlb_fields_alignment.text
lstr_print_dw.as_label_alignment = ddlb_label_alignment.text

Choose Case ddlb_border.text
	Case 'None'
		lstr_print_dw.al_fields_border = 0
	Case 'Shadow'
		lstr_print_dw.al_fields_border = 1
	Case 'Box'
		lstr_print_dw.al_fields_border = 2
	Case 'Underline'
		lstr_print_dw.al_fields_border = 4
	Case '3D Lowered'
		lstr_print_dw.al_fields_border = 5
	Case '3D Raised'
		lstr_print_dw.al_fields_border = 6
End Choose

//Save settings
gnv_user_option.of_set_option_value( 'Vertical Print Settings-Title Font Size', ddlb_title_font_size.text )
gnv_user_option.of_set_option_value( 'Vertical Print Settings-Fields Font Size', ddlb_fields_font_size.text )
gnv_user_option.of_set_option_value( 'Vertical Print Settings-Fields Width', em_fields_width.text )
gnv_user_option.of_set_option_value( 'Vertical Print Settings-Fields Alignment', ddlb_fields_alignment.text )
gnv_user_option.of_set_option_value( 'Vertical Print Settings-Label Alignment', ddlb_label_alignment.text )
gnv_user_option.of_set_option_value( 'Vertical Print Settings-Fields Border', ddlb_border.text )

Hide(Parent)
OpenWithParm(w_print_custom_screen,lstr_print_dw)
Close(Parent)

end event

type dw_list from u_dw within w_print_columns_select
integer x = 46
integer y = 88
integer width = 1051
integer height = 1512
integer taborder = 10
string title = "none"
string dataobject = "d_print_column_list"
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.of_setupdateable(False)
end event

type gb_1 from groupbox within w_print_columns_select
integer x = 14
integer y = 28
integer width = 1115
integer height = 1600
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Fields"
end type

type gb_2 from groupbox within w_print_columns_select
integer x = 1166
integer y = 28
integer width = 805
integer height = 1592
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Properties"
end type

