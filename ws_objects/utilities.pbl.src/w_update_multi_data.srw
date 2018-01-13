$PBExportHeader$w_update_multi_data.srw
forward
global type w_update_multi_data from w_response
end type
type mle_1 from multilineedit within w_update_multi_data
end type
type dw_1 from u_dw_contract within w_update_multi_data
end type
type cb_2 from commandbutton within w_update_multi_data
end type
type cb_1 from commandbutton within w_update_multi_data
end type
type dw_select from datawindow within w_update_multi_data
end type
end forward

global type w_update_multi_data from w_response
integer x = 214
integer y = 221
integer width = 2121
integer height = 572
string title = "Fix Multi-Select Dropdown List"
mle_1 mle_1
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
dw_select dw_select
end type
global w_update_multi_data w_update_multi_data

forward prototypes
public subroutine of_batch_update ()
end prototypes

public subroutine of_batch_update ();Long ll_view_id, ll_screen_id
long i, j, k

string ls_tab_name
string ls_dw_name[]
string ls_dataobject[]
String ls_field_name, ls_lookup_name, ls_lookup_field
integer li_view_id,ll_i
String ls_sql, ls_dwsyntax_str,ls_presentation_str,ERRORS
String ls_sql_lookup
Long ll_rowcount, ll_rowcount_lookup, ll_rowcount_datas
Long ll_ctx_id
Long ll_lookup_code
Long ll_findrow, ll_findrow2, ll_currow
String ls_values
String ls_value[], ls_init[] 
datawindow ld_dw[]
DataStore lds_multi_fields, lds_data, lds_data_lookup, lds_multi_datas

n_cst_string lnv_string

ll_view_id = dw_select.getitemnumber(1, 'view_id')
ll_screen_id = dw_select.getitemnumber(1, 'screen_id')

lds_data = CREATE DataStore
lds_data_lookup = CREATE DataStore

lds_multi_datas = CREATE DataStore
lds_multi_datas.DataObject = 'd_screen_field_multi_item'
lds_multi_datas.SetTransObject(sqlca)


lds_multi_fields = Create DataStore
lds_multi_fields.DataObject = 'd_setted_multi_fields'
lds_multi_fields.SetTransObject(sqlca)

SetPointer(HourGlass!)

gnv_appeondb.of_startqueue( )
lds_multi_fields.retrieve(ll_view_id, ll_screen_id)
lds_multi_datas.retrieve(ll_view_id, ll_screen_id)
gnv_appeondb.of_commitqueue( )
ll_rowcount_datas = lds_multi_datas.rowcount( )

//dynamic create dw 
ls_tab_name = 'tabpage_details'
ld_dw[1] = this.dw_1
ls_dw_name[1] = 'dw_1'
if ll_screen_id = 9 then
	ls_dataobject[1] = 'd_contract_det_custom'
elseif  ll_screen_id = 10 then
	ls_dataobject[1] = 'd_contract_det_custom_2'
end if
f_create_contract_dw(ll_view_id,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)	

ls_presentation_str = "style(type=grid)"		
for i = 1 to lds_multi_fields.rowcount()
	//get the multi fields from current screen
	ls_field_name = lds_multi_fields.getitemstring(i, 'object_name')
	ls_lookup_name = dw_1.Describe(ls_field_name + ".tag")
	ls_lookup_field =  dw_1.Describe(ls_field_name + ".dddw.DisplayColumn")
	
	//create datastore to get the values of multi field and ctx_id field from ctx_basic_info/ctx_custom
	if  ll_screen_id = 9 then
		ls_sql =" select ctx_basic_info.ctx_id as ctx_id, ctx_basic_info." + ls_field_name + " as field_name  from  ctx_basic_info,code_lookup where code_lookup.lookup_code = ctx_basic_info.category and code_lookup.ic_n = "  + string(ll_view_id) + " and len(ctx_basic_info." + ls_field_name + ") > 0"
	elseif ll_screen_id = 10 then
		ls_sql =" select ctx_basic_info.ctx_id as ctx_id , ctx_custom." + ls_field_name + " as field_name from  ctx_basic_info,code_lookup,ctx_custom where ctx_basic_info.ctx_id = ctx_custom.ctx_id and code_lookup.lookup_code = ctx_basic_info.category and code_lookup.ic_n = "  + string(ll_view_id) + " and len(ctx_custom." + ls_field_name + ") > 0"
	end if	
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql, ls_presentation_str, ERRORS)
	if Len(ERRORS) > 0 then
		Continue
	end if
	lds_data.Create( ls_dwsyntax_str, ERRORS)
	lds_data.SetTransObject( SQLCA )
	ll_rowcount = lds_data.retrieve()
	
	//create datastore to get the lookup_code from lookup
	ls_sql_lookup = " select lookup_code, " +  ls_lookup_field + " as lookup_field from  code_lookup where lookup_name = '" + ls_lookup_name + "'"
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql_lookup, ls_presentation_str, ERRORS)
	lds_data_lookup.Create( ls_dwsyntax_str, ERRORS)
	lds_data_lookup.SetTransObject( SQLCA )
	ll_rowcount_lookup = lds_data_lookup.retrieve()
	
	for j = 1 to ll_rowcount
		ll_ctx_id = lds_data.getitemnumber( j, 'ctx_basic_info_ctx_id')
		if  ll_screen_id = 9 then
			ls_values = lds_data.getitemstring(j, 'ctx_basic_info_field_name')
		elseif ll_screen_id = 10 then
			ls_values = lds_data.getitemstring(j, 'ctx_custom_field_name')
		end if
		ls_value[] = ls_init[]  //Added by harry 2017-04-27
		lnv_string.of_parsetoarray( ls_values, '|', ls_value[] )
		
		for k = 1 to UpperBound(ls_value)
			ll_findrow = lds_data_lookup.find( "lookup_field = '" + Trim(ls_value[k]) + "'", 1, ll_rowcount_lookup)
			if ll_findrow >0 then
				ll_lookup_code = lds_data_lookup.getitemnumber(ll_findrow, 'lookup_code')
				ll_findrow2 = lds_multi_datas.find("ctx_id = " + string(ll_ctx_id) + " and field_name = '" + ls_field_name + "' and field_data = '" + string(ll_lookup_code) + "'", 1, ll_rowcount_datas)
				//insert the lookup into screen_field_select_item
				if ll_findrow2 <= 0 then
					insert into screen_field_select_item(view_id, screen_id, ctx_id, field_name, field_data) values (:ll_view_id, :ll_screen_id, :ll_ctx_id, :ls_field_name, :ll_lookup_code) ;
				end if
			end if
		next
	next
next


Messagebox('Save', 'Batch update succeeded:(View = ' + dw_select.Describe ( "Evaluate('LookupDisplay(view_id)',1)" ) + ' and Screen = ' + dw_select.Describe ( "Evaluate('LookupDisplay(screen_id)',1)" ) + ')')

SetPointer(Arrow!)

if isvalid(lds_data) then Destroy(lds_data)
if isvalid(lds_data_lookup) then Destroy(lds_data_lookup)
if isvalid(lds_multi_fields) then Destroy(lds_multi_fields)
if isvalid(lds_multi_datas) then Destroy(lds_multi_datas)


end subroutine

on w_update_multi_data.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_select=create dw_select
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.dw_select
end on

on w_update_multi_data.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_select)
end on

event open;call super::open;datawindowchild dwchild

dw_select.settransobject(sqlca)
dw_select.insertrow(0)

dw_select.GetChild( "view_id", dwchild )
dwchild.SetTransObject( SQLCA )
dw_select.setitem(1,  "view_id", 1001)
//dwchild.Retrieve()
//dwchild.InsertRow( 1 )

end event

type mle_1 from multilineedit within w_update_multi_data
integer x = 23
integer y = 208
integer width = 2062
integer height = 120
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "This function is to batch fix the history data where the dropdown list is missing the checkmarks in some multi-select fields, even though the selected items are showing correctly in the fields."
boolean border = false
end type

type dw_1 from u_dw_contract within w_update_multi_data
boolean visible = false
integer x = 114
integer y = 484
integer taborder = 30
end type

type cb_2 from commandbutton within w_update_multi_data
integer x = 1737
integer y = 364
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type cb_1 from commandbutton within w_update_multi_data
integer x = 1362
integer y = 364
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
end type

event clicked;of_batch_update()
end event

type dw_select from datawindow within w_update_multi_data
integer y = 40
integer width = 2103
integer height = 180
integer taborder = 10
string title = "none"
string dataobject = "dw_choose_view_and_screen"
boolean border = false
boolean livescroll = true
end type

event itemfocuschanged;

datawindowchild dwchild
long ll_view_id 
if dwo.name = 'screen_id' then
	ll_view_id = this.getitemnumber( 1,  "view_id")
	dw_select.GetChild( "screen_id", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.retrieve(ll_view_id)
	dwchild.setfilter("screen_id = 9 or screen_id = 10")
	dwchild.filter()
end if

end event

