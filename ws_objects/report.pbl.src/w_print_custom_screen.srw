$PBExportHeader$w_print_custom_screen.srw
forward
global type w_print_custom_screen from w_response
end type
type st_1 from statictext within w_print_custom_screen
end type
type cb_output from commandbutton within w_print_custom_screen
end type
type cb_setup from commandbutton within w_print_custom_screen
end type
type cb_print from commandbutton within w_print_custom_screen
end type
type cb_close from commandbutton within w_print_custom_screen
end type
type cb_export from commandbutton within w_print_custom_screen
end type
type dw_report from u_dw within w_print_custom_screen
end type
end forward

global type w_print_custom_screen from w_response
integer width = 4014
integer height = 2336
string title = "Vertical Print"
st_1 st_1
cb_output cb_output
cb_setup cb_setup
cb_print cb_print
cb_close cb_close
cb_export cb_export
dw_report dw_report
end type
global w_print_custom_screen w_print_custom_screen

type variables
str_print_dw istr_print_dw 
end variables

forward prototypes
public subroutine of_show_report ()
public function integer of_gen_report ()
end prototypes

public subroutine of_show_report ();
end subroutine

public function integer of_gen_report ();String ls_objects_string,ls_hide_columns_string
String ls_objects_all[]
String ls_default,ls_sql,ls_syntax,ls_err,ls_mask,ls_format
Long i,j,ll_columns_x[],ll_row_cnt,ll_row,ll_step
String ls_coltype,ls_value,ls_colstyle
Datetime ldt_null

Setnull(ldt_null)
n_cst_string_appeon lnv_string
DataStore lds_report

SetPointer(HourGlass!)
This.SetRedraw(False)
If Not Isvalid(w_appeon_gifofwait) Then 
	Open(w_appeon_gifofwait)
	If Isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.of_settext('Generating Report Data...')
	If Isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.of_setposition(10)
End If

//Create the dw with all fields (no include groupbox)
datawindow ldw_col,ldw_data
ldw_col = istr_print_dw.adw_columns
ldw_data = istr_print_dw.adw_data
//messagebox('',ldw_data.describe('datawindow.syntax'))

Integer li_label_alignment,li_fields_alignment
Choose Case Lower(istr_print_dw.as_label_alignment)
	Case 'left'
		li_label_alignment = 0
	Case 'right'
		li_label_alignment = 1
	Case 'center'
		li_label_alignment = 2
	Case  Else
		li_label_alignment = -1
End Choose
Choose Case Lower(istr_print_dw.as_fields_alignment)
	Case 'left'
		li_fields_alignment = 0
	Case 'right'
		li_fields_alignment = 1
	Case 'center'
		li_fields_alignment = 2
	Case  Else
		li_fields_alignment = -1
End Choose

//Gen column list for SQL
For i = 1 To ldw_col.rowcount()
	If ldw_col.object.object_type[i] = 'GROUPBOX' then continue 
	If ldw_col.object.selected[i] = 0  then continue 
	ls_default = Space(ldw_col.object.col_length[i])
	
	If Left(Lower(String(ldw_col.object.col_type[i])), 4) = 'date' Then //Added By Ken.Guo 04/19/2012. add date column for format
		If ls_sql = '' Then
			ls_sql = ldw_col.object.col_name[i] + " = getdate()"
		Else
			ls_sql += "~r~n , " + ldw_col.object.col_name[i] + " = getdate()"
		End If
	Else
		If ls_sql = '' Then
			ls_sql = ldw_col.object.col_name[i] + " = '" + ls_default + "'"
		Else
			ls_sql += "~r~n , " + ldw_col.object.col_name[i] + " = '" + ls_default + "'"
		End If
	End If
Next

//Create Report datawindow with any table name
ls_sql = 'Select ~r~n' + ls_sql + '~r~n From ctx_basic_info'
ls_syntax = SQLCA.syntaxfromsql( ls_SQL, "style(type=form)",ls_err)
If Len(ls_err) = 0 Then
	dw_report.Create(ls_syntax,ls_err)
	If Len(ls_err) > 0 Then
		If Isvalid(w_appeon_gifofwait) Then Close(w_appeon_gifofwait)
		This.SetRedraw(True)
		gnv_debug.of_output(true,'Failed to print screen data. E1: ' +ls_syntax +'~r~n'+ ls_err)
		Messagebox('Error','Failed to create datawindow, please call support.')
		Return -2
	End If
Else
	If Isvalid(w_appeon_gifofwait) Then Close(w_appeon_gifofwait)
	This.SetRedraw(True)
	gnv_debug.of_output(true,'Failed to print screen data. E2: ' +ls_SQL +'~r~n'+ ls_err)
	Messagebox('Error','Failed to generate SQL syntax, please call support.')
	Return -1
End If

//Modify datawindow properties: column's label text and Alignment
ls_syntax = ''
For i = 1 To ldw_col.rowcount()
	If ldw_col.object.object_type[i] = 'GROUPBOX' then continue 
	If ldw_col.object.selected[i] = 0  then continue 
	If li_fields_alignment = -1 Then
		ls_syntax +=  ldw_col.object.col_name[i] + ".Alignment = '" + ldw_data.Describe(ldw_col.object.col_name[i] + '.Alignment') + "' "	
	Else
		ls_syntax +=  ldw_col.object.col_name[i] + ".Alignment = '" + String(li_fields_alignment) + "' "
	End If
	
	ls_syntax +=  ldw_col.object.col_name[i] + "_t.Text = '" + ldw_col.object.col_label[i] + "' "
	
	If Len(ldw_data.Describe(ldw_col.object.col_name[i] + '_t.Type')) > 1 Then
		If li_label_alignment = -1 Then 
			ls_syntax +=  ldw_col.object.col_name[i] + "_t.Alignment = '" + ldw_data.Describe(ldw_col.object.col_name[i] + '_t.Alignment') + "' "
		Else
			ls_syntax +=  ldw_col.object.col_name[i] + "_t.Alignment = '" +String(li_label_alignment)+ "' "
		End If
	ElseIf Len(ldw_data.Describe(Left(ldw_col.object.col_name[i],Len(String(ldw_col.object.col_name[i])) - 2) + '_t.Type')) > 1 Then
		If li_label_alignment = -1 Then 
			ls_syntax +=  ldw_col.object.col_name[i] + "_t.Alignment = '" + ldw_data.Describe(Left(ldw_col.object.col_name[i],Len(String(ldw_col.object.col_name[i])) - 2) + '_t.Alignment') + "' "
		Else
			ls_syntax +=  ldw_col.object.col_name[i] + "_t.Alignment = '" + String(li_label_alignment) + "' "
		End If
	End If

Next
ls_err = dw_report.Modify(ls_syntax)
If ls_err <> '' Then
	gnv_debug.of_output(true,'Failed to print screen data. E5: ' +ls_syntax +'~r~n'+ ls_err)
End If
If Isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.of_setposition(20)

//Fill Data to dw_target from dw_source
ll_row_cnt = ldw_data.RowCount()
ll_step = Round(ll_row_cnt / 20,0) + 1

For i = 1 To ll_row_cnt
	If Mod(i,ll_step) = 0 Then
		If Isvalid(w_appeon_gifofwait) Then w_appeon_gifofwait.of_setposition(20 + (i/ll_step) * (100 - 20)/20 )
	End If
	ll_row = dw_report.InsertRow(0)
	ls_value = ''
	For j = 1 To ldw_col.rowcount()
		If ldw_col.object.object_type[j] = 'GROUPBOX' then continue 
		If ldw_col.object.selected[j] = 0 then continue 
		ls_mask = ldw_data.Describe(String(ldw_col.object.col_name[j]) + '.EditMask.Mask')
		ls_coltype = ldw_data.Describe(String(ldw_col.object.col_name[j]) + '.coltype')
		If ls_mask <> '!' and ls_mask <> '?' Then
			//For EditMask Column
			Choose Case Left(Lower(ls_coltype),5)
				Case 'char(','char'
					ls_value = String(ldw_data.GetItemString(i,String(ldw_col.object.col_name[j])),ls_mask)
					dw_report.SetItem(ll_row,String(ldw_col.object.col_name[j]),ls_value)
				Case 'date'
					If i = 1 Then
						dw_report.Modify(String(ldw_col.object.col_name[j]) + ".EditMask.Mask = '" + ls_mask + "'" )
					End If					
					dw_report.SetItem(ll_row,String(ldw_col.object.col_name[j]),ldw_data.GetItemDate(i, String(ldw_col.object.col_name[j])))
				Case 'datet'
					If i = 1 Then
						dw_report.Modify(String(ldw_col.object.col_name[j]) + ".EditMask.Mask = '" + ls_mask + "'" )
					End If
					dw_report.SetItem(ll_row,String(ldw_col.object.col_name[j]),ldw_data.GetItemDateTime(i, String(ldw_col.object.col_name[j])))					
				Case 'decim','real'
					ls_value = String(ldw_data.GetItemDecimal(i,String(ldw_col.object.col_name[j])),ls_mask)
					dw_report.SetItem(ll_row,String(ldw_col.object.col_name[j]),ls_value)
				Case 'int','long','numbe','ulong'
					ls_value = String(ldw_data.GetItemNumber(i,String(ldw_col.object.col_name[j])),ls_mask)
					dw_report.SetItem(ll_row,String(ldw_col.object.col_name[j]),ls_value)
				Case Else
					dw_report.SetItem(ll_row,String(ldw_col.object.col_name[j]),ldw_data.Describe("Evaluate('Lookupdisplay("+String(ldw_col.object.col_name[j])+")',"+String(i)+")" ))
			End Choose
		Else
			//For non-EditMask Column
			If Upper(ldw_data.Describe(String(ldw_col.object.col_name[j]) + '.type')) = "COMPUTE" Then
				//For Compute Column
				ls_format = ldw_data.Describe(String(ldw_col.object.col_name[j]) + '.Format')
				ls_coltype = ldw_data.Describe(String(ldw_col.object.col_name[j]) + '.coltype')
				If ls_format <> '!' and ls_format <> '?' Then 
					Choose Case Left(Lower(ls_coltype),5)
						Case 'char(','char'
							ls_value = String(ldw_data.GetItemString(i,String(ldw_col.object.col_name[j])),ls_format)
							dw_report.SetItem(ll_row,String(ldw_col.object.col_name[j]),ls_value)
						Case 'date'
							If i = 1 Then
								dw_report.Modify( String(ldw_col.object.col_name[j]) + ".Format = '" + ls_format + "'" )
							End If							
							dw_report.SetItem(ll_row,String(ldw_col.object.col_name[j]),ldw_data.GetItemDate(i, String(ldw_col.object.col_name[j])))
						Case 'datet'
							If i = 1 Then
								dw_report.Modify( String(ldw_col.object.col_name[j]) + ".Format = '" + ls_format + "'" )
							End If
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ldw_data.GetItemDateTime(i, String(ldw_col.object.col_name[j])))	
						Case 'decim','real'
							ls_value = String(ldw_data.GetItemDecimal(i, String(ldw_col.object.col_name[j])),ls_format)
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ls_value)
						Case 'int','long','numbe','ulong'
							ls_value = String(ldw_data.GetItemNumber(i, String(ldw_col.object.col_name[j])),ls_format)
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ls_value)
						Case Else
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ls_value)
					End Choose
				Else 
					Choose Case Left(Lower(ls_coltype),5)
						Case 'char(','char' //compute column have no length
							ls_value = String(ldw_data.GetItemString(i, String(ldw_col.object.col_name[j])))
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ls_value)
						Case 'date'
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ldw_data.GetItemDate(i, String(ldw_col.object.col_name[j])))	
						Case 'datet'
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ldw_data.GetItemDateTime(i, String(ldw_col.object.col_name[j])))
						Case 'decim','real'
							ls_value = String(ldw_data.GetItemDecimal(i, String(ldw_col.object.col_name[j])))
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ls_value)
						Case 'int','long','numbe','ulong'
							ls_value = String(ldw_data.GetItemNumber(i, String(ldw_col.object.col_name[j])))
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ls_value)
						Case Else
							dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ls_value)
					End Choose					
					
				End If
			Else
				//For Normal Column
				Choose Case Left(Lower( ldw_col.object.col_type[j]), 5)
					Case 'date'
						dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ldw_data.GetItemDate(i, String(ldw_col.object.col_name[j])))	
					Case 'datet'
						dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ldw_data.GetItemDateTime(i, String(ldw_col.object.col_name[j])))	
					Case Else
						ls_colstyle =  ldw_data.describe(String(ldw_col.object.col_name[j]) + '.edit.style') 
						Choose Case ls_colstyle 
							Case  'checkbox'  		
								//set checkbox's text to label
								If trim(lower(ldw_data.describe(String(ldw_col.object.col_name[j]) + '.checkbox.text')))  <> '' Then
									dw_report.Modify(String(ldw_col.object.col_name[j]) + '_t.text = "' +trim(lower(ldw_data.describe(String(ldw_col.object.col_name[j]) + '.checkbox.text'))) + '"')
								End If
								
								//set checkbox's value
								Choose Case Left(Lower(ls_coltype),5)
									Case 'char(','char' 
										ls_value = String(ldw_data.GetItemString(i, String(ldw_col.object.col_name[j])))
									Case 'decim','real'
										ls_value = String(ldw_data.GetItemDecimal(i, String(ldw_col.object.col_name[j])))
									Case 'int','long','numbe','ulong'
										ls_value = String(ldw_data.GetItemNumber(i, String(ldw_col.object.col_name[j])))
								End Choose			
								If trim(lower(ldw_data.describe(String(ldw_col.object.col_name[j]) + '.checkbox.on'))) = trim(lower(ls_value)) Then
									dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),'True')
								Else
									dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),'False')
								End If
							Case 'dddw', 'ddlb'
								//messagebox(String(ldw_col.object.col_name[j]),ldw_data.Describe("Evaluate('Lookupdisplay("+ String(ldw_col.object.col_name[j])+")',"+String(i)+")" ))
								dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ldw_data.Describe("Evaluate('Lookupdisplay("+ String(ldw_col.object.col_name[j])+")',"+String(i)+")" ))	
							Case Else
								Choose Case Left(Lower(ls_coltype),5)
									Case 'char(','char' 
										ls_value = String(ldw_data.GetItemString(i, String(ldw_col.object.col_name[j])))
									Case 'decim','real'
										ls_value = String(ldw_data.GetItemDecimal(i, String(ldw_col.object.col_name[j])))
									Case 'int','long','numbe','ulong'
										ls_value = String(ldw_data.GetItemNumber(i, String(ldw_col.object.col_name[j])))
								End Choose
								dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ls_value)
						End Choose
				End Choose
			End If
			
			//Workaround APB' bug for null value for datetime column
			If Left(Lower(ls_coltype),5) = 'datet' Then
				If IsNull(ldw_data.GetItemDatetime(i, String(ldw_col.object.col_name[j]))) Then
					dw_report.SetItem(ll_row, String(ldw_col.object.col_name[j]),ldt_null)
				End If
			End If
			
		End If
		
		//the height will become zero when value is null or empty. so workaround it.
		IF Left(Lower(ls_coltype),5) = 'datet' Then
			If isnull(dw_report.getitemdatetime(ll_row,String(ldw_col.object.col_name[j]))) Then
				dw_report.setitem(ll_row,String(ldw_col.object.col_name[j]), 1900-01-01)
				dw_report.modify(String(ldw_col.object.col_name[j]) + '.color="'+String(RGB(255,255,255))+'"' )
			End If
		Else
			If isnull(dw_report.getitemstring(ll_row,String(ldw_col.object.col_name[j]))) or dw_report.getitemstring(ll_row,String(ldw_col.object.col_name[j])) = '' Then
				dw_report.setitem(ll_row,String(ldw_col.object.col_name[j]), 'null')
				dw_report.modify(String(ldw_col.object.col_name[j]) + '.color="'+String(RGB(255,255,255))+'"' )
			End If			
		End If
	Next
Next


Integer li_label_space = 20, li_column_space = 50, li_groupbox_space = 120, li_x = 20
Long ll_next_y, ll_grouped,ll_pre_grouped,ll_height
String ls_create, ls_label, ls_modify, ls_name,ls_name_t

//set title to detail band. (cannot set to heaer band, APB bug.)
ls_modify =  'create text(band=detail alignment="' + String(2) +'" text="'+istr_print_dw.as_title+'" border="0" color="0" slideup=allabove height.autosize=yes '&
				+ 'x="' + string(20) + '" y="' + string(50)+'" height="'+String(50)+ '" width="' + String(istr_print_dw.al_fields_width ) + '" '&
				+ ' name=t_title font.face="MS Sans Serif" font.height="'+ String(istr_print_dw.al_title_font_size) +'" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="-1" )'				
ls_err = dw_report.modify(ls_modify)
If ls_err <> '' Then
	gnv_debug.of_output(true,'Failed to print screen data. E04: ' +ls_modify +'~r~n'+ ls_err)
End If
ll_next_y = 100

//Move/Sort the Fields
For i = 1 To ldw_col.rowcount()
	If ldw_col.object.selected[i] = 0 then continue 
	ls_label =  ldw_col.object.col_label[i]
	ls_name = ldw_col.object.col_name[i]
	ls_name_t = ls_name + '_t'
	If ldw_col.object.object_type[i] = 'GROUPBOX' Then
		If i = 1 Then
			ll_next_y = ll_next_y + li_column_space
		Else
			ll_next_y = ll_next_y + li_groupbox_space
		End If
		ll_height = 52
		ls_modify =  'create text(band=detail alignment="' + String(li_label_alignment) +'" text="' + ls_label + '" border="0" color="0" slideup=allabove height.autosize=yes '&
						+ 'x="' + string(li_x) + '" y="' + string(ll_next_y)+'" height="'+String(ll_height)+'" width="' + String(istr_print_dw.al_fields_width ) + '" '&
						+ ' name=t_group' + string(i) + ' font.face="MS Sans Serif" font.height="'+ String(istr_print_dw.al_fields_font_size) +'" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="-1" )'
	Else //For columns
		If  ldw_col.object.grouped[i] = 1 Then
			ll_grouped = 1
		Else
			ll_grouped = 0
		End If
		If ll_pre_grouped = 1 and ll_grouped = 0 Then
			ll_next_y = ll_next_y + li_groupbox_space
		Else
			If i > 1 Then
				If ldw_col.object.object_type[i - 1] = 'GROUPBOX' Then
					ll_next_y = ll_next_y + li_label_space
				Else
					ll_next_y = ll_next_y + li_column_space
				End If
			Else
				ll_next_y = ll_next_y + li_column_space
			End If
		End If
		ll_height = 52
		ll_pre_grouped = ll_grouped
		//for label
		ls_modify =  ls_name_t + '.y="' + String(ll_next_y) + '" '+&
						ls_name_t + '.x="' + String(li_x) +'" '+ &
						ls_name_t +'.height.autosize=yes '+ &
						ls_name_t + '.slideup=allabove ' + &
						ls_name_t + '.font.height="' +String(istr_print_dw.al_fields_font_size )+ '"'+ &
						ls_name_t + '.width="' + String(istr_print_dw.al_fields_width ) + '"'
		//for field				
		ll_next_y = ll_next_y + ll_height + li_label_space
		ls_modify +=   ls_name + '.y="' + String(ll_next_y) + '" '+ &
							ls_name+ '.x="' + String(li_x) +'" '+  &
							ls_name+ '.border="'+ String(istr_print_dw.al_fields_border)+'" '+  &
							ls_name + '.slideup=allabove '+&
							ls_name + '.font.height="' +String(istr_print_dw.al_fields_font_size )+ '"'  +&
							ls_name+'.height.autosize=yes '+ &
							ls_name + '.width="' + String(istr_print_dw.al_fields_width ) + '"'
	End If
	
	//Modify/Create object
	ls_err = dw_report.modify(ls_modify)
	If ls_err = '' Then
		ll_next_y = ll_next_y + ll_height + 10
	Else
		messagebox('Error',ls_err)
		gnv_debug.of_output(true,'Failed to print screen data. E01: '+ ls_modify +'~r~n'+ ls_err)
	End If
Next

//workaround bug. cut off last field. 
ls_modify =  'create text(band=detail alignment="' + String(li_label_alignment) +'" text="" border="0" color="0" slideup=allabove '&
				+ 'x="' + string(li_x) + '" y="' + string(ll_next_y+ll_height)+'" height="'+String(ll_height)+ '" width="' + String(istr_print_dw.al_fields_width ) + '" '&
				+ ' name=t_detail_last font.face="MS Sans Serif" font.height="'+ String(istr_print_dw.al_fields_font_size) +'" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="-1" )'
ls_err = dw_report.modify(ls_modify)
If ls_err <> '' Then
	gnv_debug.of_output(true,'Failed to print screen data. E02: '+ ls_modify +'~r~n'+ ls_err)
End If

//Modify auto height and title
ls_err = dw_report.Modify("DataWindow.Detail.Height.AutoSize=yes")
If ls_err <> '' Then
	gnv_debug.of_output(true,'Failed to print screen data. E03: ' +"DataWindow.Detail.Height.AutoSize=yes" +'~r~n'+ ls_err)
End If

//ls_modify =  'create text(band=header alignment="' + String(2) +'" text="'+istr_print_dw.as_title+'" border="0" color="0" slideup=allabove height.autosize=yes '&
//				+ 'x="' + string(li_x) + '" y="' + string(70)+'" height="'+String(200)+ '" width="' + String(istr_print_dw.al_fields_width ) + '" '&
//				+ ' name=t_title font.face="MS Sans Serif" font.height="'+ String(istr_print_dw.al_title_font_size) +'" font.weight="700"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="-1" )'				
//ls_err = dw_report.modify(ls_modify)
//If ls_err <> '' Then
//	gnv_debug.of_output(true,'Failed to print screen data. E04: ' +ls_modify +'~r~n'+ ls_err)
//End If

//dw_report.Modify("DataWindow.Header.Height='250'")
//ls_err = dw_report.Modify("DataWindow.Header.Height.AutoSize=yes")
//If ls_err <> '' Then
//	gnv_debug.of_output(true,'Failed to print screen data. E04: ' +"DataWindow.Header.Height.AutoSize=yes" +'~r~n'+ ls_err)
//End If

//Print Preview
dw_report.Modify("datawindow.Print.Preview = 'Yes'")
dw_report.Modify("datawindow.Print.Preview.Rulers = 'Yes'")
If Isvalid(w_appeon_gifofwait) Then Close(w_appeon_gifofwait)
st_1.Text = ""
This.SetRedraw(True)
Return 1
end function

on w_print_custom_screen.create
int iCurrent
call super::create
this.st_1=create st_1
this.cb_output=create cb_output
this.cb_setup=create cb_setup
this.cb_print=create cb_print
this.cb_close=create cb_close
this.cb_export=create cb_export
this.dw_report=create dw_report
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cb_output
this.Control[iCurrent+3]=this.cb_setup
this.Control[iCurrent+4]=this.cb_print
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.cb_export
this.Control[iCurrent+7]=this.dw_report
end on

on w_print_custom_screen.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cb_output)
destroy(this.cb_setup)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.cb_export)
destroy(this.dw_report)
end on

event open;call super::open;//Added By Ken.Guo 2015-12-29
If isvalid(Message.powerobjectparm) Then
	istr_print_dw = Message.powerobjectparm
Else
	Messagebox('Error','Failed to get data, please call support')
	Return -1
End If 

end event

event pfc_postopen;call super::pfc_postopen;If Not Isvalid(istr_print_dw.adw_data) Then Return 

of_gen_report()

end event

type st_1 from statictext within w_print_custom_screen
integer x = 27
integer y = 2168
integer width = 937
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_output from commandbutton within w_print_custom_screen
integer x = 2793
integer y = 2092
integer width = 430
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Out&Put Options"
end type

event clicked;m_npdb_options NewMenu 
NewMenu = CREATE m_npdb_options
NewMenu.of_setparent(dw_report)
NewMenu.m_options.m_mailall.visible = false
NewMenu.m_options.m_printall.visible = false
NewMenu.m_options.m_printcurrent.text = 'Print'
NewMenu.m_options.m_mailcurrent.text = 'EMail'
NewMenu.m_options.PopMenu(Parent.pointerx(),Parent.pointerY())
end event

type cb_setup from commandbutton within w_print_custom_screen
integer x = 2053
integer y = 2092
integer width = 352
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print &Setup..."
end type

event clicked;//////////////////////////////////////////////////////////////////////
// $<event>cb_setup::clicked()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2009-03-19 by Ken.Guo
//////////////////////////////////////////////////////////////////////

dw_report.SetRedraw(False)
dw_report.Modify("DataWindow.Print.Paper.Size= '0'") //Workaround APB's Bug
dw_report.Modify("datawindow.Print.Preview = 'No'")
dw_report.Modify("datawindow.Print.Preview.Rulers = 'No'")

PrintSetup ( )

dw_report.Modify("datawindow.Print.Preview = 'Yes'")
dw_report.Modify("datawindow.Print.Preview.Rulers = 'Yes'")
dw_report.SetRedraw(True)
end event

type cb_print from commandbutton within w_print_custom_screen
integer x = 2432
integer y = 2092
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;dw_report.Print()
end event

type cb_close from commandbutton within w_print_custom_screen
integer x = 3575
integer y = 2092
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
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_export from commandbutton within w_print_custom_screen
integer x = 3227
integer y = 2092
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export..."
end type

event clicked;gf_load_dir_path() 
String ls_file,ls_null
Setnull(ls_null)
ls_file = ''
If dw_report.SaveAs(ls_file,Excel5!,True) = 1 Then
	If FileExists(ls_file) Then
		ShellExecuteA(Handle(This),'open',ls_file,ls_null,ls_null,4)
	End If
End If
gf_save_dir_path(' ') 
end event

type dw_report from u_dw within w_print_custom_screen
event ue_syscommand pbm_syscommand
event ue_mail_current ( )
integer x = 27
integer y = 24
integer width = 3895
integer height = 2012
integer taborder = 20
boolean titlebar = true
string title = "Print Preview"
boolean controlmenu = false
boolean hscrollbar = true
end type

event ue_syscommand;if Message.WordParm = 61458 then 
	Message.Processed = true
	Message.ReturnValue = 0 
end if
end event

event ue_mail_current();long	ll_Rtn
ll_Rtn = EVENT ue_save_pdf_for_mailing( )
if ll_Rtn <> 0 then return

if of_get_app_setting("set_56","I") = 1 then
	Super::EVENT ue_mail_bak('Contract','' )
else
	Super::EVENT ue_mail('Contract','' )
end if
end event

event constructor;call super::constructor;This.of_setupdateable(False)
end event

