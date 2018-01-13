$PBExportHeader$w_request_form_detail_property.srw
forward
global type w_request_form_detail_property from w_popup
end type
type cb_ok from commandbutton within w_request_form_detail_property
end type
type tab_1 from tab within w_request_form_detail_property
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from u_dw within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tab_1 from tab within w_request_form_detail_property
tabpage_1 tabpage_1
end type
type cb_cancel from commandbutton within w_request_form_detail_property
end type
end forward

global type w_request_form_detail_property from w_popup
integer width = 1586
integer height = 1964
string title = "Detail Properties"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_ok cb_ok
tab_1 tab_1
cb_cancel cb_cancel
end type
global w_request_form_detail_property w_request_form_detail_property

type variables
long			il_row
end variables

on w_request_form_detail_property.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.tab_1=create tab_1
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.cb_cancel
end on

on w_request_form_detail_property.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.tab_1)
destroy(this.cb_cancel)
end on

event open;call super::open;long 		ll_detail_id, ll_row
string 	ls_msg, ls_types, ls_export_col_name, ls_export_field_name, ls_tmp
string 	ls_title, ls_coltype, ls_lookup_field_style

//ll_detail_id  = message.doubleparm
il_row  = message.doubleparm
//ll_detail_id = w_request_form.dw_detail.GetItemNumber(il_row,"detail_id")
this.tab_1.tabpage_1.dw_1.Settransobject( sqlca)
//this.tab_1.tabpage_1.dw_1.retrieve(ll_detail_id)		//Added By Mark Lee 12/03/2014	
this.tab_1.tabpage_1.dw_1.reset( )

if il_row > 0 and  isvalid(w_request_form) then 
	w_request_form.dw_detail.RowsCopy(il_row, il_row,Primary!, this.tab_1.tabpage_1.dw_1, 1, Primary!)
//	tab_1.tabpage_1.dw_1.SetItemStatus(1, 0, Primary!,NotModified!)	
end if 

ll_row = this.tab_1.tabpage_1.dw_1.getRow()
if ll_row > 0 then 
	ls_export_col_name = this.tab_1.tabpage_1.dw_1.GetItemString(ll_row,"export_col_name")
	ls_export_field_name = this.tab_1.tabpage_1.dw_1.GetItemString(ll_row,"export_field_name")

	if isnull(ls_export_col_name) then ls_export_col_name = ""
	if isnull(ls_export_field_name) then ls_export_field_name = ""
	ls_tmp = ls_export_col_name
	
	ls_types = this.tab_1.tabpage_1.dw_1.GetItemString(ll_row,"types")
	Choose case ls_types
		case "line"
			ls_msg = "<Line>"
			ls_title = "Line"
		case "text"
			ls_msg = "<Text>"
			ls_title = "Text"			
		case"step"
			ls_msg = "<New Step>"
			ls_title = "Step"
		case "header"
			ls_msg = "<HDR>"
			ls_title = "Header"
		case "column"
			ls_msg = ""
			ls_tmp = ls_export_field_name
			ls_title = "Column"
	end choose 
	
	this.title = ls_title+" Properties | " +ls_msg+ls_tmp+ " | "
	//Added By Mark 07/03/2014
	ls_coltype = this.tab_1.tabpage_1.dw_1.GetItemString(ll_row,"col_type")
	ls_lookup_field_style = this.tab_1.tabpage_1.dw_1.GetItemString(ll_row,"lookup_field_style") 
	If (lower(ls_coltype) = 'int' or lower(ls_coltype) = 'integer' or lower(ls_coltype) = 'real' or lower(ls_coltype) = 'float' or &
		lower(ls_coltype) = 'smallint'  or lower(ls_coltype) = 'tinyint' or lower(ls_coltype) = 'numeric'  or lower(ls_coltype) = 'money'  or &
		lower(ls_coltype) = 'char'  or lower(ls_coltype) = 'varchar' or lower(ls_coltype) = 'nchar'  or lower(ls_coltype) = 'nvarchar'  or &
		lower(ls_coltype) = 'datetime' or lower(ls_coltype) = 'smalldatetime'  ) and &
		(isnull(ls_lookup_field_style) or trim(ls_lookup_field_style) = '') then 
		this.tab_1.tabpage_1.dw_1.modify("formats.ddlb.allowedit=yes")
	Else
		this.tab_1.tabpage_1.dw_1.modify("formats.ddlb.allowedit=no formats.tabsequence=0 formats.background.color=536870912")		
	End if 
end if 
end event

type cb_ok from commandbutton within w_request_form_detail_property
integer x = 841
integer y = 1776
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
end type

event clicked;long 					ll_row, ll_return,ll_detail_id
string 				ls_export_col_name, ls_hint_message, ls_required, ls_formats
string 				ls_export_col_name_old, ls_hint_message_old, ls_required_old, ls_formats_old
boolean				lbn_flag
dwItemStatus	 	l_status
	
tab_1.tabpage_1.dw_1.accepttext( )
ll_row =  tab_1.tabpage_1.dw_1.Modifiedcount( )	
if ll_row > 0 then 
////	l_status = tab_1.tabpage_1.dw_1.GetItemStatus(1, 0, Primary!)
////	tab_1.tabpage_1.dw_1.SetItemStatus(1, 0, Primary!,DataModified!)	
////	if Event pfc_save() >= 0 then 			///Added By Mark 07/15/2014   item error 
//	  ll_return = tab_1.tabpage_1.dw_1.event pfc_update( true, true) 
	  ll_return = tab_1.tabpage_1.dw_1.event pfc_preupdate( )
	  if ll_return > 0 then
		If  isvalid(w_request_form) then 
			ll_detail_id = w_request_form.dw_detail.GetItemNumber(il_row,"detail_id")
			w_request_form.dw_detail.SetRedraw(false)			
			w_request_form.dw_detail.deleterow(il_row)
			ll_return = tab_1.tabpage_1.dw_1.Rowscopy( 1,1, Primary!, w_request_form.dw_detail, il_row, Primary!)	
			
//			w_request_form.dw_detail.GroupCalc()			
			w_request_form.dw_detail.SetRedraw(true)
			
//			if isnull(ll_detail_id) or ll_detail_id <= 0 then 
//				//NewModified!
//			else
//				w_request_form.dw_detail.SetItemStatus(il_row, 0, Primary!, DataModified!)
//			end if 
			
//			w_request_form.dw_detail.SetItem(il_row,"export_col_name", tab_1.tabpage_1.dw_1.GetItemString(1,"export_col_name"))
//			w_request_form.dw_detail.SetItem(il_row,"hint_message", tab_1.tabpage_1.dw_1.GetItemString(1,"hint_message"))
//			w_request_form.dw_detail.SetItem(il_row,"required",tab_1.tabpage_1.dw_1.GetItemString(1,"required"))
//			w_request_form.dw_detail.SetItem(il_row,"formats",tab_1.tabpage_1.dw_1.GetItemString(1,"formats"))	
//			w_request_form.dw_detail.SetItem(il_row,"column_height",tab_1.tabpage_1.dw_1.GetItemNumber(1,"column_height"))
//			w_request_form.dw_detail.SetItem(il_row,"column_width",tab_1.tabpage_1.dw_1.GetItemNumber(1,"column_width"))
//			w_request_form.dw_detail.SetItem(il_row,"steps_num",tab_1.tabpage_1.dw_1.GetItemNumber(1,"steps_num"))
//			w_request_form.dw_detail.SetItem(il_row,"steps_mark",tab_1.tabpage_1.dw_1.GetItemNumber(1,"steps_mark"))			
//			w_request_form.dw_detail.SetItemStatus(il_row, 0, Primary!,NotModified!)		//Added By Mark Lee 12/03/2014
//			w_request_form.dw_detail.accepttext()
		End If		
		CloseWithReturn(Parent, il_row)
	End if
else
	
	CloseWithReturn(Parent, il_row)
end if 

end event

type tab_1 from tab within w_request_form_detail_property
integer width = 1563
integer height = 1768
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 100
integer width = 1527
integer height = 1652
long backcolor = 79741120
string text = "Settings"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from u_dw within tabpage_1
integer x = 9
integer y = 4
integer width = 1518
integer height = 1656
integer taborder = 20
string dataobject = "d_request_form_detail_property"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;//this.of_SetUpdateAble(true)
this.of_SetUpdateAble(false)			//Added By Mark Lee 12/03/2014
ib_disableclosequery = true

end event

event itemchanged;call super::itemchanged;string 	ls_col_name, ls_table_name, ls_formats
long		ll_column_height

if row <=0  then return 

this.accepttext()
Choose case dwo.name 
	case "required" 
		if this.GetItemString( row,"types") = "column" then
			ls_col_name = this.GetItemString( row,"col_name") 
			ls_table_name = this.GetItemString( row,"table_name") 
			
			if lower(ls_table_name) = "ctx_products" and (lower(ls_col_name) = "product_id" or lower(ls_col_name) = "product_type" ) then 
				if string(data) = "N" Then
					this.SetItem(row,"required","Y")
					messagebox(gnv_app.iapp_object.DisplayName,"The column "+ls_col_name + " from the table "+lower(ls_table_name)+" is a required column.")
					return 2
				end if
			end if 
			
			if lower(ls_table_name) = "ctx_basic_info" and (lower(ls_col_name) = "app_facility" ) then 
				if string(data) = "N" Then
					this.SetItem(row,"required","Y")
					messagebox(gnv_app.iapp_object.DisplayName,"The column "+ls_col_name + " from the table "+lower(ls_table_name)+" is a required column.")
					return 2
				end if
			end if 
			
			if lower(ls_table_name) = "app_facility" and (lower(ls_col_name) = "facility_name" ) then 
				if string(data) = "N" Then
					this.SetItem(row,"required","Y")
					messagebox(gnv_app.iapp_object.DisplayName,"The column "+ls_col_name + " from the table "+lower(ls_table_name)+" is a required column.")
					return 2
				end if
			end if 
			
			if lower(ls_table_name) = "ctx_contacts" and (lower(ls_col_name) = "first_name" or lower(ls_col_name) = "last_name" ) then 
				if string(data) = "N" Then
					this.SetItem(row,"required","Y")
					messagebox(gnv_app.iapp_object.DisplayName,"The column "+ls_col_name + " from the table "+lower(ls_table_name)+" is a required column.")
					return 2
				end if
			end if 
			
		end if
case "column_height"  
	if not isnumber(data)  then
		this.SetItem(row,"column_height",1)
		messagebox(gnv_app.iapp_object.DisplayName,"The column value must be a number.")
		return 2
	end if 
	
	if this.GetItemString( row,"types") = "column" then
		ls_formats = this.GetItemString( row,"formats")
		if not( isnull(ls_formats) or trim(ls_formats) ="" or ls_formats ="None" ) and string(data) <>"1" then
			this.SetItem(row,"column_height",1)
			messagebox(gnv_app.iapp_object.DisplayName,"When column format is set, the column height can only be set to 1.")			//Added By Mark Lee 06/23/2015
			return 2
		end if 
	end if 
//	case "steps_num"
//		if this.GetItemString( row,"types") = "step" then
//			if string(data) = "1" Then
//				this.SetItem(row,"required","Y")
//			else
//				this.SetItem(row,"required","N")
//			end if 
//		end if 
case "formats"
	if this.GetItemString( row,"types") = "column" then
		ll_column_height = this.GetITemNumber( row,"column_height")
		if not isnull(ll_column_height) and ll_column_height <> 1 and not( isnull(string(data)) or trim(string(data)) ="" or string(data) ="None" ) then 
			this.SetItem(row,"formats","None")
			messagebox(gnv_app.iapp_object.DisplayName,"When column height is not set to 1, you cannot set the column format.")			//Added By Mark Lee 06/23/2015
			return 2
		end if 
	end if 
End Choose 



end event

event pfc_preupdate;call super::pfc_preupdate;long			ll_rowcount, ll_column_height
string 		ls_types


ll_rowcount = this.rowcount()
if ll_rowcount > 0 then
	ls_types = this.GetItemString(ll_rowcount, "types")
	ll_column_height = this.GetItemNumber(ll_rowcount,"column_height")
	if ls_types = "column" then
		if  isnull(ll_column_height )  or ll_column_height <= 0 or ll_column_height > 100 then
			this.SetColumn("column_height")
			this.SetFocus()
			Messagebox(gnv_app.iapp_object.DisplayName,"The value of this column (Column Height) has to be in the range of 1 to 100.")
			return -1
		end if
	end if 
end if 

return 1
end event

event buttonclicked;call super::buttonclicked;String			ls_Visible 
str_pass		lstr_pass

//Added by gavins 20160817
If dwo.Name = 'b_visible_expression' Then
	ls_visible =  this.GetItemString(row,'visible_expression')
	If Pos( ls_visible, '~t' ) > 0 Then ls_visible = Mid( ls_visible, pos( ls_visible, '~t' ) + 1 ) 
	If right( ls_visible , 1 ) = '"' or right( ls_visible, 1 ) = "'" Then ls_visible = left( ls_visible, len( ls_visible ) - 1 )
	lstr_pass.s_long[1] = 12	
	lstr_pass.s_long[2] =  this.GetItemNumber( row,'request_id')	
	lstr_pass.s_string          = ls_visible
	lstr_pass.as_search_type = "visible"
	lstr_pass.s_string_array[1] = this.GetItemString( Row, 'table_name' ) + "." + this.GetItemString( Row, 'col_name' )
	lstr_pass.s_string_array[2] = "column"
	lstr_pass.s_string_array[3] = this.GetItemString( Row, 'table_name' )
	lstr_pass.s_string_array[4] =  this.GetItemString( Row, 'design' )
	lstr_pass.s_u_dw   = dw_1
	OpenWithParm(w_export_expression, lstr_pass)
	lstr_pass = Message.PowerObjectParm
	if isvalid(lstr_pass) then
		if  trim(lstr_pass.s_string) <> "" then
			this.SetItem(row,"visible_expression",lstr_pass.s_string)
		end if
	end if
End If
end event

type cb_cancel from commandbutton within w_request_form_detail_property
integer x = 1216
integer y = 1776
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;long 			ll_row

ib_disableclosequery = true			

CloseWithReturn(Parent, il_row)
end event

