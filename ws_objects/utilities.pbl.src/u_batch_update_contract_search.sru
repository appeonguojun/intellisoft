$PBExportHeader$u_batch_update_contract_search.sru
forward
global type u_batch_update_contract_search from u_tabpg_contract_search
end type
type cb_all from commandbutton within u_batch_update_contract_search
end type
type cb_close from commandbutton within u_batch_update_contract_search
end type
type cb_batch_set_value from commandbutton within u_batch_update_contract_search
end type
type cb_batch_update from commandbutton within u_batch_update_contract_search
end type
type st_tip from statictext within u_batch_update_contract_search
end type
end forward

global type u_batch_update_contract_search from u_tabpg_contract_search
integer width = 3886
integer height = 2028
event ue_create_objects ( )
event ue_create_dw ( )
cb_all cb_all
cb_close cb_close
cb_batch_set_value cb_batch_set_value
cb_batch_update cb_batch_update
st_tip st_tip
end type
global u_batch_update_contract_search u_batch_update_contract_search

type variables
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.15.2007 By: Jack (Contract)
//$<reason> 
long il_category
//---------------------------- APPEON END ----------------------------
Boolean ib_retrieve_all //Added By Ken.Guo 2009-06-19.


str_batch_update_field istr_batch_update_field
String is_syntax_column



end variables

forward prototypes
public function integer of_retrieve ()
public subroutine of_expand_allrow ()
public subroutine of_get_value (long al_row, ref string as_old_value, ref string as_new_value)
end prototypes

event ue_create_objects();String ls_syntax, ls_syntax_label, ls_syntax_select


//Added By Ken.Guo 01/09/2014
String ls_tObjectlist[],ls_tObjects,ls_ObjName,ls_Type
Long ll_tObjcount,ll_i
String ls_ret, ls_coltag, ls_colid

//Create Selected Checkbox Object
//Workaround APB Bug
//ls_syntax_select = 'create column(band=detail id=226 alignment="0" tabsequence=10 border="0" color="33554432" '+&
//				+ ' x="15" y="4" height="60" width="64" format="[general]" html.valueishtml="0"  name=selected visible="1" checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0"'+&
//				+ ' background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'
ls_colid = dw_search_det1.Describe('style.id')
ls_syntax_select = 'create column(band=detail id='+ls_colid+' alignment="0" tabsequence=10 border="0" color="33554432" '+&
				+ ' x="15" y="4" height="60" width="64" format="[general]"   name=selected visible="1"  '+&
				+ ' checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.threed=yes font.face="MS Sans Serif"  '+&
				+ ' font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" '+&
				+ 'background.color="536870912" '+&
				+ ' )'
//font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" 
//				+ 'background.color="536870912" background.transparency="0" background.gradient.color="8421504" '+&
//				+ 'background.gradient.transparency="0"'+&
//				+ ' background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" '+&
//				+ 'background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0"'+&
//				+ 'background.gradient.scale="100" background.gradient.spread="100" '+&
//' transparency="0"  html.valueishtml="0"  checkbox.scale=no checkbox.threed=yes  

ls_ret = dw_search_det1.Modify(ls_syntax_select)
If ls_ret <> '' Then
	gnv_debug.of_output(True, 'Batch Update Contract. Failed to create the selected object.')
	gnv_debug.of_output(True, 'Return:  ' + ls_ret)
	gnv_debug.of_output(True, 'Syntax of selected column:  ' + ls_syntax_select)
	Messagebox('Error','Failed to create the selected column. please see the log file.')
//	Return
End If

//Create Update Column_1  Objects
String ls_id
ls_id = dw_search_det1.Describe( istr_batch_update_field.as_fieldname +   ".ID")
If Not isnumber(ls_id) Then
	Messagebox('Error','This field('+ istr_batch_update_field.as_fieldname+') is not supported because it does not exist in the Contract Browse Screen.')
	Return 
End If
//For DDDW Column
Choose Case istr_batch_update_field.as_fieldlookuptype
	Case 'U'  //User DDDW
//		ls_syntax = 'create column( band=detail  id='+ls_id+' name= '+ istr_batch_update_field.as_fieldname + '_1' +' visible="1"   tabsequence=70 '+&
//					+'x="100" y="4" height="64" width="500" color="0" border="5" alignment="0" format="[general]" dddw.allowedit=no dddw.autohscroll=yes dddw.autoretrieve=no dddw.useasborder=yes dddw.datacolumn=user_id dddw.displaycolumn=user_id dddw.hscrollbar=no dddw.hsplitscroll=no dddw.imemode=0 '  +&
//					+ ' dddw.limit=0 dddw.name=d_dddw_users dddw.nilisnull=yes dddw.percentwidth=200 dddw.required=no dddw.showlist=no dddw.vscrollbar=yes criteria.required=no criteria.override_edit=no background.mode="2"  background.color="16777215~tIf (isRowModified() , RGB(255,255,0),RGB(255,255,255))" font.charset="0" font.face="MS Sans Serif" font.family="2" font.height="-8" font.pitch="2" font.weight="400" accessiblerole=0 )'
		ls_syntax = 'create column( band=detail  id='+ls_id+' name= '+ istr_batch_update_field.as_fieldname + '_1' +' visible="1"   tabsequence=70 '+&
					+' x="100" y="4" height="64" width="500" color="0" border="5" alignment="0" format="[general]" '+&
					+' dddw.allowedit=no dddw.autohscroll=yes dddw.autoretrieve=no dddw.useasborder=yes dddw.datacolumn=user_id  '+&
					+' dddw.displaycolumn=user_id dddw.hscrollbar=no dddw.hsplitscroll=no dddw.imemode=0 '  +&
					+ ' dddw.limit=0 dddw.name=d_dddw_users dddw.nilisnull=yes dddw.percentwidth=200 dddw.required=no  '+&
					+ ' dddw.showlist=no dddw.vscrollbar=yes criteria.required=no criteria.override_edit=no  '+&
					+ ' background.mode="2"  background.color="16777215~tIf (isRowModified() , RGB(255,255,0),RGB(255,255,255))"  '+&
					+ ' font.charset="0" font.face="MS Sans Serif" font.family="2" font.height="-8" font.pitch="2" font.weight="400" )'
		 
Case Else  
		If Left(istr_batch_update_field.as_fieldlookuptype ,1 ) = 'C' Then //Code Looup DDDW
			ls_coltag = Mid(istr_batch_update_field.as_fieldlookuptype, 3, Len(istr_batch_update_field.as_fieldlookuptype))
			//Workaround APB Bug
//			ls_syntax = 'create column(band=detail id='+ls_id+' alignment="0" visible="1" tabsequence=20 border="4" color="33554432" format="[general]" html.valueishtml="0"  ' +&
//					+ ' name=' + istr_batch_update_field.as_fieldname + '_1' +& 
//					+ ' x="100" y="4" height="64" width="500"' +& 
//					+ ' tag="'+ls_coltag+'"  ' +&
//					+ ' dddw.name=d_dddw_code_lookup dddw.displaycolumn=code dddw.datacolumn=lookup_code dddw.percentwidth=300 dddw.lines=20 dddw.limit=0 dddw.allowedit=no dddw.useasborder=yes dddw.case=any dddw.required=yes dddw.hscrollbar=yes dddw.vscrollbar=yes '  +&
//					+ ' font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215~tIf (isRowModified() , RGB(255,255,0),RGB(255,255,255))"  background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" '+&
//					+'background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'
			ls_syntax = 'create column(band=detail id='+ls_id+' alignment="0" visible="1" tabsequence=20 border="4" color="33554432" ' +&
					+ ' format="[general]"  ' +&
					+ ' name=' + istr_batch_update_field.as_fieldname + '_1' +& 
					+ ' x="100" y="4" height="64" width="500"' +& 
					+ ' tag="'+ls_coltag+'"  ' +&
					+ ' dddw.name=d_dddw_code_lookup dddw.displaycolumn=code dddw.datacolumn=lookup_code dddw.percentwidth=300  ' +&
					+ ' dddw.lines=20 dddw.limit=0 dddw.allowedit=no dddw.useasborder=yes dddw.case=any dddw.required=yes dddw.hscrollbar=yes  ' +&
					+ ' dddw.vscrollbar=yes '  +&
					+ ' font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" ' +&
					+ ' background.mode="2" background.color="16777215~tIf (isRowModified() , RGB(255,255,0),RGB(255,255,255))"  ' +&
					+ ' )'

		Else //Edit Column
//			ls_syntax = 'create column(band=detail id='+ls_id+' name= '+ istr_batch_update_field.as_fieldname + '_1' +' alignment="0" tabsequence=30 border="5" color="33554432" '+&
//					+ ' x="100" y="4" height="64" width="500" format="[general]" html.valueishtml="0"  visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0"  '+&
//					+ ' edit.autoselect=yes edit.autovscroll=yes background.mode="2" background.color="16777215~tIf (isRowModified() , RGB(255,255,0),RGB(255,255,255))" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0"  '+&
//					+ ' background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'					
		ls_syntax = 'create column(band=detail id='+ls_id+' name= '+ istr_batch_update_field.as_fieldname + '_1' +' alignment="0" tabsequence=30  '+&
					+ ' border="5" color="33554432" '+&
					+ ' x="100" y="4" height="64" width="500" format="[general]" html.valueishtml="0"  visible="1" edit.limit=0 edit.case=any  '+&
					+ ' edit.focusrectangle=no edit.autoselect=no  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2"  '+&
					+ ' font.pitch="2" font.charset="0"  '+&
					+ ' edit.autoselect=yes edit.autovscroll=yes background.mode="2"  '+&
					+ ' background.color="16777215~tIf (isRowModified() , RGB(255,255,0),RGB(255,255,255))"  '+&
					+ ' )'							
		End If
End Choose
ls_ret = dw_search_det1.Modify(ls_syntax)
If ls_ret <> '' Then
	gnv_debug.of_output(True, 'Batch Update Contract. Failed to create the column object.')
	gnv_debug.of_output(True, 'Return:  ' + ls_ret)
	gnv_debug.of_output(True, 'Syntax of column:  ' + ls_syntax)
	Messagebox('Error','Failed to create the columns. please see the log file.')
//	Return
End If
istr_batch_update_field.as_syntax_field = ls_syntax
istr_batch_update_field.al_fieldid = Long(ls_id)

//Create Label
//ls_syntax_label = 'create text(band=header alignment="0" text="'+istr_batch_update_field.as_fieldname_alias +'" border="0" color="33554432" '+&
//				+ 'x="100" y="4" height="64" width="500" html.valueishtml="0"  name='+ istr_batch_update_field.as_fieldname + '_1_t'+' visible="1"  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" font.underline="0" background.mode="1" background.color="-1" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" '+&
//				+'background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'
ls_syntax_label = 'create text(band=header alignment="0" text="'+istr_batch_update_field.as_fieldname_alias +'" border="0" color="33554432" '+&
				+ ' x="100" y="4" height="64" width="500"  name='+ istr_batch_update_field.as_fieldname + '_1_t'+' visible="1"  '+&
				+ ' font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" font.underline="0"  '+&
				+ ' background.mode="1" background.color="-1"  '+&
				+ ' )'

ls_ret = dw_search_det1.Modify(ls_syntax_label)
If ls_ret <> '' Then
	gnv_debug.of_output(True, 'Batch Update Contract. Failed to create the label object.')
	gnv_debug.of_output(True, 'Return:  ' + ls_ret)
	gnv_debug.of_output(True, 'Syntax of label:  ' + ls_syntax_label)
	Messagebox('Error','Failed to create the label. please see the log file.')
//	Return
End If

//Modify Mask for Datetime field
If istr_batch_update_field.as_fielddatatype = 'D' Then
	If Len(istr_batch_update_field.as_fieldformat) > 1 Then
		dw_search_det1.Modify(istr_batch_update_field.as_fieldname + "_1.EditMask.Mask='"+istr_batch_update_field.as_fieldformat+"'")
	Else
		dw_search_det1.Modify(istr_batch_update_field.as_fieldname + "_1.EditMask.Mask='mm/dd/yyyy'")
	End If
ElseIf Len(istr_batch_update_field.as_fieldformat) > 0 and istr_batch_update_field.as_fieldformat <> '[general]'and isnull(istr_batch_update_field.as_fieldlookuptype)  Then
	dw_search_det1.Modify(istr_batch_update_field.as_fieldname + "_1.EditMask.Mask='"+istr_batch_update_field.as_fieldformat+"'")
End If

ls_tObjects  = dw_search_det1.Describe("DataWindow.Objects")
ll_tObjcount = inv_string.of_parsetoarray(ls_tObjects,'~t',ls_tObjectlist)
for ll_i = 1 to ll_tObjcount
	ls_ObjName = ls_tObjectlist[ll_i]
	If ls_ObjName = 'selected' Then Continue
	If  ls_ObjName = istr_batch_update_field.as_fieldname + '_1' Then Continue
	If  ls_ObjName = istr_batch_update_field.as_fieldname + '_1_t' Then Continue
	ls_Type    = dw_search_det1.Describe(ls_ObjName + ".type")
	Choose Case ls_Type
		Case 'text','column','picture','button','computefield','groupbox','rectangle', 'bitmap'
			If dw_search_det1.Describe(ls_ObjName + ".visible") <> '0' Then
				dw_search_det1.Modify(ls_ObjName + ".x = " + String(Long(dw_search_det1.Describe(ls_ObjName + ".x")) + 620 ))
			End If
	End Choose
next

iw_parent.title = 'Batch Update "' + trim(istr_batch_update_field.as_fieldname_alias) +'" Field'

dw_search_det1.of_SetDropDownCalendar(False)
dw_search_det1.of_SetDropDownCalendar(TRUE)
dw_search_det1.of_set_ib_retrieved_dddw(false)
dw_search_det1.event ue_populatedddws( )

//PopulateDDDW for new column
Integer Li_value
DataWindowChild dwchild
n_ds lnds_user
If ls_coltag <> '' Then
	li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
	IF li_value <> 1 THEN
		gnv_app.of_setcontraccache_code_lookup( ls_coltag )
		li_value = gnv_app.inv_dwcache.of_GetRegistered (ls_coltag,lnds_user)
	END IF
	dw_search_det1.GetChild( istr_batch_update_field.as_fieldname + '_1' , dwchild)
	lnds_user.ShareData ( dwchild )	
End If

//Populate User DW
datawindowchild ldwc_newfield
If istr_batch_update_field.as_fieldlookuptype = 'U' Then
	dw_search_det1.GetChild( istr_batch_update_field.as_fieldname + '_1', ldwc_newfield)
	ldwc_newfield.SettransObject(SQLCA)
	ldwc_newfield.Retrieve()
End If

end event

event ue_create_dw();////////////////////////////////////////////////////////////////////////
//// $<event>constructoru_tabpg_master_contract_search()
//// $<arguments>(None)
//// $<returns> long
//// $<description>
//// $<description>
////////////////////////////////////////////////////////////////////////
//// $<add> 03.15.2007 by Jack (Contract)
////////////////////////////////////////////////////////////////////////
//string ls_parm,ls_company, ls_syntax
//long ll_right
//
////Added By Ken.Guo 2011-07-08.  Dynamic create dw ui as search tab
//Long ll_viewid 
//string ls_tab_name,ls_dw_name[],ls_dataobject[]
//datawindow ld_dw[]
//ls_tab_name = 'tabpage_search'
//ld_dw[1] = dw_search
//ld_dw[2] = dw_search_det1
//ls_dw_name[1] = 'dw_search'
//ls_dw_name[2] = 'dw_search_det1'
//ls_dataobject[1] = 'd_contract_search'
//ls_dataobject[2] = 'd_sp_contract_search'
//If gl_SearchTab_View_id = 0 Then 
//                ll_viewid = 1001
//Else
//                ll_viewid = gl_SearchTab_View_id
//End If
//f_create_contract_dw(ll_viewid,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)
//this.event ue_set_screen_properties( )
//dw_search.Modify( "b_more.text='Less >>'")
//dw_search.event ue_moreandless(false)
//
//dw_search_det1.event ue_populatedddws( )
//
////Added By Ken.Guo 01/09/2014
//String ls_tObjectlist[],ls_tObjects,ls_ObjName,ls_Type
//Long ll_tObjcount,ll_i
//String ls_ret 
//
//ls_ret = dw_search_det1.Modify('create column(band=detail id=226 alignment="0" tabsequence=10 border="0" color="33554432" x="10" y="4" height="60" width="64" format="[general]" html.valueishtml="0"  name=selected visible="1" checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )')
//
////For DDDW Column
//ls_syntax = 'create column(band=detail id=5 alignment="0" visible="1" tabsequence=20 border="5" color="33554432" x="94" y="4" height="64" width="500" format="[general]" html.valueishtml="0"  ' +&
//							   	+ ' name=custom10' +& 
//								+ ' y="4" height="64" ' +& 
//								+ ' tag="Contract Status"  ' +&
//								+ ' dddw.name=d_dddw_code_lookup dddw.displaycolumn=code dddw.datacolumn=lookup_code dddw.percentwidth=300 dddw.lines=20 dddw.limit=0 dddw.allowedit=no dddw.useasborder=yes dddw.case=any dddw.required=yes dddw.hscrollbar=yes dddw.vscrollbar=yes '  +&
//								+ ' font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="1073741824" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'
//
////ls_syntax = 'create column(band=detail id=5 alignment="0" tabsequence=10 border="5" color="33554432" x="384" y="88" height="64" width="480" format="[general]" html.valueishtml="0"  name=app_facility  tag="Contract Status" visible="1" dddw.name=d_dddw_code_lookup dddw.displaycolumn=code dddw.datacolumn=lookup_code dddw.percentwidth=300 dddw.lines=20 dddw.limit=0 dddw.allowedit=no dddw.useasborder=yes dddw.case=any dddw.required=yes dddw.hscrollbar=yes dddw.vscrollbar=yes  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="1073741824" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'
//
//ls_ret = dw_search_det1.Modify(ls_syntax)
//
////For Edit Column
//
////Label
//ls_ret = dw_search_det1.Modify('create text(band=header alignment="0" text="Updated Field" border="0" color="33554432" x="94" y="20" height="52" width="500" html.valueishtml="0"  name=status_t visible="1"  font.face="MS Sans Serif" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" font.underline="1" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )')
//
//ls_tObjects  = dw_search_det1.Describe("DataWindow.Objects")
//ll_tObjcount = inv_string.of_parsetoarray(ls_tObjects,'~t',ls_tObjectlist)
//for ll_i = 1 to ll_tObjcount
//	ls_ObjName = ls_tObjectlist[ll_i]
//	If ls_ObjName = 'selected' Then Continue
//	ls_Type    = dw_search_det1.Describe(ls_ObjName + ".type")
//	Choose Case ls_Type
//		Case 'text','column','picture','button','computefield','groupbox','rectangle'
//			If dw_search_det1.Describe(ls_ObjName + ".visible") <> '0' Then
//				dw_search_det1.Modify(ls_ObjName + ".x = " + String(Long(dw_search_det1.Describe(ls_ObjName + ".x")) + 620 ))
//			End If
//	End Choose
//next
//
//iw_parent.title = 'Batch Update Contracts'
//
//
////--------------------------- APPEON BEGIN ---------------------------
////$< Add  > 2008-05-13 By: Scofield
////$<Reason> Add the right to turn off the more button.
//
//ll_Right = w_mdi.of_security_access(2081)
//if ll_Right = 0 then
//	dw_search.Object.b_more.Visible = false
//	//dw_search.Object.b_clear.X = Long(dw_search.Object.owner.X) + Long(dw_search.Object.owner.Width) - Long(dw_search.Object.b_clear.Width)
//	dw_Search.Object.b_clear.x = dw_Search.Object.b_search.x
//	dw_Search.Object.b_search.x = dw_Search.Object.b_more.x
//end if
////---------------------------- APPEON END ----------------------------
//
//
end event

public function integer of_retrieve ();/******************************************************************************************************************
**  [PUBLIC]   : of_retrieve()
**==================================================================================================================
**  Purpose   	: function fired when the user succufully changes the tab
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner  31 May 2005
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

long ll_ctx_id
long la_any
STRING LS_FILTER
long ll_i,ll_current_contract
long ll_null
long ll_found

if not ib_retriev_detail then return 0
ib_retriev_detail = false
setredraw(false)
//--------------------------- APPEON BEGIN ---------------------------
//$<comment> 08.14.2006 By: Liang QingShi
//$<reason> Contract module modification 
//$<reason> Performance tuning
/*
ids_contract_access.retrieve( )
*/
//---------------------------- APPEON END ----------------------------

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// save current changes as needed
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

gnv_appeondb.of_startqueue()

dw_search_det1.setfilter('')
//dw_search_det1.retrieve( ) 11-22-2007 By Jervis
//dw_search_det1.retrieve(UPPER(gs_user_id )) 

// The following script moved from of_build_filter().
//ids_contract_access.retrieve(UPPER(gs_user_id )) 11-22-2007 By Jervis

// Perofrmanct tuning for of_get_access

//dw_search_det1.retrieve(UPPER(gs_user_id ))  //Commented By Ken.Guo 2016-11-07
gnv_data.of_retrieve( "contract_search" )

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

//Added By Ken.Guo 2016-11-07. fixed bug: failed to retrieve data.
if Not IsValid(ids_search) then
	ids_search = Create DataStore
	ids_search.DataObject = 'd_sp_contract_search'
	ids_search.SetTransObject( sqlca)
end if
if Not IsValid(ids_search_temp) then
	ids_search_temp = Create DataStore
	ids_search_temp.DataObject = 'd_sp_contract_search'
end if
If Not isvalid(inv_ctx_tv) Then
	inv_ctx_tv = Create n_cst_ctx_tv
	inv_ctx_tv.event ue_retrieve( )		
End If	
this.of_retrieve_ctx( )
this.of_filter()


//////////////////////////////////////////////
// set the contracted entity
/////////////////////////////////////////////
IF dw_search_det1.ROWCOUNT() < 1 THEN 
	setredraw(true)
	of_set_message('no rows')
	RETURN  SUCcess
end if

setredraw(true)

return success


///******************************************************************************************************************
//**  [PUBLIC]   : of_retrieve()
//**==================================================================================================================
//**  Purpose   	: function fired when the user succufully changes the tab
//**==================================================================================================================
//**  Arguments 	: [none] 
//**==================================================================================================================
//**  Returns   	: [none]   
//**==================================================================================================================
//**  Notes     	: 	   
//**==================================================================================================================
//**  Created By	: Michael B. Skinner  31 May 2005
//**==================================================================================================================
//**  Modification Log
//**   Changed By  Scofield           Change Date   2008-07-08                                            Reason
//** ------------------------------------------------------------------------------------------------------------------
//********************************************************************************************************************/
//
//if Not ib_retriev_detail then return 0
//
//SetPointer(Hourglass!)
//
//ib_retriev_detail = False
//
//gnv_app.ib_ref_cache = true
//gnv_app.of_setcontraccache( )
//gnv_app.of_setcontraccache_code_lookup( FALSE)
//
//ib_retrieve = False
//
//gnv_appeondb.of_startqueue()
//
//ids_search.setfilter('')
//ids_search.Retrieve(Upper(gs_user_id ))
//
////ids_contract_access_pt.Retrieve( gs_user_id ) //commented by Ken.Guo on 2009-02-12
//ids_contract_access_category.Retrieve( gs_user_id )
//
//gnv_appeondb.of_commitqueue( )
//
//if ids_search.rowcount( ) > 0 then
//	il_contract_array = ids_search.object.ctx_id.current
//end if
//
//of_filter()
//
//if dw_search_det1.RowCount() < 1 then 
//	of_set_message('no rows')
//else
//	dw_search_det1.title = 'Contract Browse ' + "(" + string(dw_search_det1.rowcount()) + ")"
//end if
//
//SetPointer(Arrow!)
//
//return success
//
end function

public subroutine of_expand_allrow ();//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 2009-01-05 By: Alan
//$<Reason> BugE112701
long		ll_i,ll_count,ll_temp
string	ls_stype
long		ll_cnt
long		ll_ctx_id

dw_search_det1.Setredraw(false)

ll_count = dw_search_det1.rowcount()
for ll_i=1 to ll_count
	ll_ctx_id = dw_search_det1.GetItemNumber(ll_i,'ctx_id')
	ls_stype = dw_search_det1.getitemstring(ll_i,'style')
	ll_cnt = dw_search_det1.getitemnumber(ll_i,'master_cnt')
	if ls_stype = '+' and ll_cnt > 0 then
		//of_display_Row(ll_ctx_id,ll_i)
		of_expand_row(ll_ctx_id,ll_i)	//jervis -7.7.2009
		ll_temp = dw_search_det1.rowcount()
		ll_i = ll_i + ll_temp - ll_count
		ll_count = ll_temp
	end if
next

dw_search_det1.Setredraw( True )
//---------------------------- APPEON END ----------------------------

end subroutine

public subroutine of_get_value (long al_row, ref string as_old_value, ref string as_new_value);String ls_old_value, ls_new_value
Datetime ldt_value
Decimal ldc_value
DataWindowChild ldwc_field
Long ll_find

as_old_value = ''
as_new_value = ''

Choose Case istr_batch_update_field.as_fielddatatype
	Case 'D'
		as_new_value = String(dw_search_det1.GetItemDatetime(al_row,istr_batch_update_field.as_fieldname + '_1' ))
		as_old_value = String(dw_search_det1.GetItemDatetime(al_row,istr_batch_update_field.as_fieldname + '_1' ,primary!, True))
	Case 'N'
		as_new_value = String(dw_search_det1.GetItemDecimal(al_row,istr_batch_update_field.as_fieldname + '_1' ))
		as_old_value = String(dw_search_det1.GetItemDecimal(al_row,istr_batch_update_field.as_fieldname + '_1' ,primary!, True))	
	Case 'S'		
		as_new_value = dw_search_det1.GetItemString(al_row,istr_batch_update_field.as_fieldname + '_1' )
		as_old_value = dw_search_det1.GetItemString(al_row,istr_batch_update_field.as_fieldname + '_1' ,primary!, True)	
End Choose

if isnull(as_old_value) then as_old_value = ''
if isnull(as_new_value) then as_new_value = ''

If Left(istr_batch_update_field.as_fieldlookuptype,1) = 'C' Then
	as_old_value = String(Long(as_old_value))
	as_new_value = String(Long(as_new_value))
	If as_old_value <> '' Then
		dw_search_det1.Getchild( istr_batch_update_field.as_fieldname + '_1', ldwc_field)
		ll_find = ldwc_field.Find('lookup_code = ' + as_old_value, 1, ldwc_field.Rowcount())
		If ll_find > 0 Then
			as_old_value = ldwc_field.GetItemString(ll_find,'code')
		End If
	End If
	If as_new_value <> '' Then
		ll_find = ldwc_field.Find('lookup_code = ' + as_new_value, 1, ldwc_field.Rowcount())
		If ll_find > 0 Then
			as_new_value = ldwc_field.GetItemString(ll_find,'code')
		End If
	End If
End If

Return 
end subroutine

on u_batch_update_contract_search.create
int iCurrent
call super::create
this.cb_all=create cb_all
this.cb_close=create cb_close
this.cb_batch_set_value=create cb_batch_set_value
this.cb_batch_update=create cb_batch_update
this.st_tip=create st_tip
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_all
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_batch_set_value
this.Control[iCurrent+4]=this.cb_batch_update
this.Control[iCurrent+5]=this.st_tip
end on

on u_batch_update_contract_search.destroy
call super::destroy
destroy(this.cb_all)
destroy(this.cb_close)
destroy(this.cb_batch_set_value)
destroy(this.cb_batch_update)
destroy(this.st_tip)
end on

event constructor;//Override Ancestor Script

//////////////////////////////////////////////////////////////////////
// $<event>constructoru_tabpg_master_contract_search()
// $<arguments>(None)
// $<returns> long
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 03.15.2007 by Jack (Contract)
//////////////////////////////////////////////////////////////////////
string ls_parm,ls_company, ls_syntax
long ll_right

this.of_getparentwindow( iw_parent)

//Added By Ken.Guo 03/25/2015.  cannot pass the object by message.powerobject
If isvalid(w_choose_batch_update_column) Then
	istr_batch_update_field = w_choose_batch_update_column.istr_batch_update_field
Else
	Messagebox('Error','Failed to pass the window object')
End If

//Added By Ken.Guo 2011-07-08.  Dynamic create dw ui as search tab
Long ll_viewid 
string ls_tab_name,ls_dw_name[],ls_dataobject[]
datawindow ld_dw[]
ls_tab_name = 'tabpage_search'
ld_dw[1] = dw_search
ld_dw[2] = dw_search_det1
ls_dw_name[1] = 'dw_search'
ls_dw_name[2] = 'dw_search_det1'
ls_dataobject[1] = 'd_contract_search'
ls_dataobject[2] = 'd_sp_contract_search'
//If gl_SearchTab_View_id = 0 Then 
//                ll_viewid = 1001
//Else
//                ll_viewid = gl_SearchTab_View_id
//End If
f_create_contract_dw(istr_batch_update_field.al_viewid,ls_tab_name,ld_dw,ls_dw_name,ls_dataobject)
this.event ue_set_screen_properties( )
dw_search.Modify( "b_more.text='Less >>'")
dw_search.event ue_moreandless(false)

dw_search_det1.event ue_populatedddws( )


//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-05-13 By: Scofield
//$<Reason> Add the right to turn off the more button.

ll_Right = w_mdi.of_security_access(2081)
if ll_Right = 0 then
	dw_search.Object.b_more.Visible = false
	//dw_search.Object.b_clear.X = Long(dw_search.Object.owner.X) + Long(dw_search.Object.owner.Width) - Long(dw_search.Object.b_clear.Width)
	dw_Search.Object.b_clear.x = dw_Search.Object.b_search.x
	dw_Search.Object.b_search.x = dw_Search.Object.b_more.x
end if
//---------------------------- APPEON END ----------------------------

If Not isvalid(iu_PowerFilter) Then
	iu_PowerFilter = create n_cst_PowerFilter
Else
	iu_PowerFilter.of_reset( ) 
	iu_PowerFilter.of_Reset_OriginalFilter( )
End If
iu_PowerFilter.of_setdw(dw_search_det1)
iu_PowerFilter.of_SetParentWindow( iw_parent )
iu_PowerFilter.checked = true
iu_PowerFilter.of_setoriginalfilter( )
iu_PowerFilter.event ue_clicked()

end event

event ue_set_security;//Override ancestor script;
end event

type st_1 from u_tabpg_contract_search`st_1 within u_batch_update_contract_search
end type

type cb_2 from u_tabpg_contract_search`cb_2 within u_batch_update_contract_search
boolean visible = false
integer x = 823
integer width = 375
end type

event cb_2::clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-07-08 By: Scofield
//$<Reason> Return all selected ctx_id.

//Override ancestor script;
Long		ll_RowCnt, ll_Cycle, ll_facility_id, ll_found, ll_rows_company
long		ll_master_contract_id,ll_ctx_id,ll_master_cnt,ll_Selected
String	ls_Return, ls_company,ls_Style

DatawindowChild ldwc_company

For ll_Cycle = 1 To dw_search_det1.RowCount()
	ll_ctx_id = dw_search_det1.GetItemNumber(ll_Cycle,'ctx_id')
	ll_master_contract_id = dw_search_det1.GetItemNumber(ll_Cycle,'master_contract_id')
	ll_master_cnt = dw_search_det1.GetItemNumber(ll_Cycle,'master_cnt')
//	ls_Style = dw_search_det1.GetItemString(ll_Cycle,'style')
//	If ls_Style = '+' and ll_master_contract_id = 0 And ll_master_cnt > 0 Then
//		//of_display_row(ll_ctx_id,ll_Cycle)
//		of_expand_row(ll_ctx_id,ll_Cycle)	//jervis -7.7.2009
//	End If
Next

dw_search_det1.GetChild("app_facility", ldwc_company)
ll_rows_company = ldwc_company.RowCount()

ll_RowCnt = dw_search_det1.RowCount()
For ll_Cycle = 1 to ll_RowCnt
	ll_Selected = Long(dw_search_det1.GetItemString(ll_Cycle, "selected"))
	if IsNull(ll_Selected) then ll_Selected = 0
	
	if ll_Selected = 0 then continue;

	ll_ctx_id = dw_search_det1.GetItemNumber(ll_Cycle, "ctx_id")
	ll_facility_id = dw_search_det1.GetItemNumber(ll_Cycle, "app_facility")
	ll_found = ldwc_company.Find("facility_id = " + string(ll_facility_id), 1, ll_rows_company)
	if ll_found > 0 then
		ls_company = ldwc_company.GetItemString(ll_found, "facility_name")
	else
		ls_company = string(ll_ctx_id)
	end if

	ls_Return += string(ll_ctx_id) + '~t' + ls_company + '|'
Next

if ls_Return <> '' then ls_Return = Left(ls_Return, Len(ls_Return) - 1)

if IsValid(w_custom_report) then
	w_custom_report.ib_Select = true
end if

CloseWithReturn(iw_parent, ls_Return)
//---------------------------- APPEON END ----------------------------

end event

type cb_1 from u_tabpg_contract_search`cb_1 within u_batch_update_contract_search
integer x = 3145
integer height = 92
end type

event cb_1::clicked;dw_search_det1.ib_retrieve_drop_downs = false
parent.ib_retriev_detail = true
parent.of_retrieve( )
parent.ib_retriev_detail = false
//dw_search_det1.event ue_populatedddws( )

dw_search_det1.title = 'Contract Browse ' + "(" + string(dw_search_det1.rowcount()) + ")"

if ib_PostOpen then
	ib_PostOpen  = false
	return
end if


If Not isvalid(cb_all) Then Return
if cb_all.text = "&Deselect All" then
	cb_all.text = "Select &All"
end if
end event

type cb_3 from u_tabpg_contract_search`cb_3 within u_batch_update_contract_search
integer x = 2779
end type

event cb_3::clicked;
//Modified By Alan on 2009-1-16
//if ib_retriev_detail = true then
	cb_1.triggerevent("clicked")
//else

//Commented By Ken.Guo 2016-11-07
//	of_build_filter( )
//	
//	//Start Code By Jervis 11-22-2007 
//	If ib_retrieve_all Then//Added By Ken.Guo 2009-06-19.
//		//Added By Ken.Guo 2009-06-19.
//	Else
////Commented By Ken.Guo 2009-12-23. Support Treeview mode, so support multi-level
////		if len(is_filter_string) > 0 then
////			is_filter_string =is_filter_string +  ' and (master_contract_id = 0 or isnull(master_contract_id) )'
////		else
////			is_filter_string = '(master_contract_id = 0 or isnull(master_contract_id) ) '
////		end if
//		If il_ctx_id > 0 Then
//			If len(is_filter_string) = 0 Then
//				is_filter_string = "ctx_id <> " + string(il_ctx_id)
//			Else
//				is_filter_string = is_filter_string + " AND ctx_id <> " + string(il_ctx_id)
//			End If
//		End If	
//	End If
//	
//	dw_search_det1.SETFILTER(is_filter_string)
//	dw_search_det1.FILTER()
	
	dw_search_det1.title = 'Contract Browse ' + "(" + string(dw_search_det1.rowcount()) + ")"

	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2007-08-17 By: Scofield
	//$<Reason> If there is no row and isn't called by post_open event,then give use a message.
	if dw_search_det1.RowCount() < 1 then
		iw_parent.title = 'Contract Logix'
		//Added By Mark Lee 07/18/2016 modify the message.
		MessageBox(gnv_app.iapp_object.DisplayName,'No Search Results. This could be because:~r~n1) None of the contracts in the system meet your search criteria.~r~n2) The company you selected has no contracts associated with them.~r~n3) You do not have access to some contracts based on your contract category security settings. ~r~nPlease see your administrator.')
	end if
	//---------------------------- APPEON END ----------------------------
//end if



end event

type cb_print from u_tabpg_contract_search`cb_print within u_batch_update_contract_search
boolean visible = false
end type

type dw_search from u_tabpg_contract_search`dw_search within u_batch_update_contract_search
integer height = 496
boolean hscrollbar = true
boolean vscrollbar = true
end type

type dw_search_det1 from u_tabpg_contract_search`dw_search_det1 within u_batch_update_contract_search
integer y = 528
integer height = 1352
string dataobject = "d_rpt_sp_contract_search"
end type

event dw_search_det1::clicked;//Override ancestor script;
//if IsNull(xpos) or IsNull(ypos) or IsNull(row) or IsNull(dwo) then return
//if IsValid (inv_Sort) then inv_Sort.Event pfc_clicked ( xpos, ypos, row, dwo ) 

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-07-08 By: Scofield
//$<Reason> Expand row or collapse row.

String 	ls_ObjName,ls_SortCol
long		ll_ctx_id

if IsNull(xpos) or IsNull(ypos) or IsNull(Row) or IsNull(dwo) then Return

SetPointer(hourglass!)

if Row > 0 then 
	This.SelectRow(0, false)
   This.SelectRow(Row, true)
	
	ll_ctx_id = This.GetItemNumber(Row,'ctx_id')
	
	if dwo.name = 'p_1' then
		//of_display_Row(ll_ctx_id,Row)
		of_expand_row(ll_ctx_id,row)	//06.23.2009 by jervis
	elseif dwo.name = 'p_2' then
		of_collapse_Row(ll_ctx_id, Row)
	End if
END if

ls_ObjName = string(dwo.name) 
if Row = 0 and this.Describe(ls_ObjName+".band") = "header" and this.Describe(ls_ObjName + ".text") <> "!" then 
	ls_SortCol = left(ls_ObjName,len(ls_ObjName) - 2) 
	this.Event ue_set_sort(xpos,ypos,Row,dwo,ls_SortCol)
End if

SetPointer(Arrow!)
//---------------------------- APPEON END ----------------------------



end event

event dw_search_det1::constructor;//Override ancestor script;

//of_settransobject( sqlca)
//of_SetSort(TRUE)
//inv_sort.of_SetColumnHeader(TRUE)
//inv_sort.of_setusedisplay( TRUE )


//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-07-08 By: Scofield
//$<Reason> Init dw_search_det1.

of_SetTransObject( sqlca)
This.Event ue_Populatedddws( )
of_SetSort(TRUE)
inv_sort.of_SetColumnHeader(TRUE)
inv_sort.of_SetUseDisplay(TRUE)
//---------------------------- APPEON END ----------------------------

end event

event dw_search_det1::doubleclicked;//Override ancestor script;
end event

event dw_search_det1::rowfocuschanged;//Override ancestor script;
end event

event dw_search_det1::rowfocuschanging;//Override ancestor script;
end event

event dw_search_det1::editchanged;call super::editchanged;If dwo.name = 'selected' Then
	This.SetItemStatus(row, 'selected', primary!,notmodified!)
End If
end event

event dw_search_det1::itemchanged;call super::itemchanged;If dwo.name = 'selected' Then
	This.Post SetItemStatus(row, 'selected', primary!,notmodified!)
End If
end event

type cbx_1 from u_tabpg_contract_search`cbx_1 within u_batch_update_contract_search
end type

type cb_5 from u_tabpg_contract_search`cb_5 within u_batch_update_contract_search
end type

type cb_4 from u_tabpg_contract_search`cb_4 within u_batch_update_contract_search
end type

type st_vbar2 from u_tabpg_contract_search`st_vbar2 within u_batch_update_contract_search
end type

type st_hbar from u_tabpg_contract_search`st_hbar within u_batch_update_contract_search
end type

type gb_document_view from u_tabpg_contract_search`gb_document_view within u_batch_update_contract_search
end type

type tv_ctx from u_tabpg_contract_search`tv_ctx within u_batch_update_contract_search
end type

type gb_to_do_list from u_tabpg_contract_search`gb_to_do_list within u_batch_update_contract_search
end type

type st_vbar from u_tabpg_contract_search`st_vbar within u_batch_update_contract_search
end type

type st_hbar2 from u_tabpg_contract_search`st_hbar2 within u_batch_update_contract_search
end type

type pb_1 from u_tabpg_contract_search`pb_1 within u_batch_update_contract_search
end type

type pb_2 from u_tabpg_contract_search`pb_2 within u_batch_update_contract_search
end type

type pb_3 from u_tabpg_contract_search`pb_3 within u_batch_update_contract_search
end type

type pb_4 from u_tabpg_contract_search`pb_4 within u_batch_update_contract_search
end type

type sle_page from u_tabpg_contract_search`sle_page within u_batch_update_contract_search
end type

type uo_page from u_tabpg_contract_search`uo_page within u_batch_update_contract_search
end type

type cb_all from commandbutton within u_batch_update_contract_search
integer x = 9
integer y = 1900
integer width = 375
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select &All"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-07-08 By: Scofield
//$<Reason> Select all or deselect all.

Long ll_Cycle

SetPointer(HourGlass!)
//Added By Alan on 2009-1-5 BugE112701
of_expand_allrow()

if this.text = "Select &All" then
	if dw_search_det1.rowcount() < 1 then return
	dw_search_det1.SetRedraw(False)
	for ll_Cycle = 1 to dw_search_det1.rowcount()
		dw_search_det1.setitem(ll_Cycle,"selected",'1')
		dw_search_det1.Event ItemChanged(ll_Cycle,dw_search_det1.Object.selected,'1')
		dw_search_det1.SetItemStatus(ll_Cycle, 'selected', primary!,notmodified!)
		st_tip.text = 'Selected ' +String(ll_Cycle)+ '/' + String(dw_search_det1.rowcount()) + ''
		If ll_Cycle >= 100 and Mod(ll_Cycle, 100) = 0 Then  Yield()
	next
	dw_search_det1.SetRedraw(True)
	
	this.text = "&Deselect All"
else
	if dw_search_det1.rowcount() < 1 then return
	dw_search_det1.SetRedraw(False)
	for ll_Cycle = 1 to dw_search_det1.rowcount()
		dw_search_det1.setitem(ll_Cycle,"selected",'0')
		dw_search_det1.Event ItemChanged(ll_Cycle,dw_search_det1.Object.selected,'0')
		dw_search_det1.SetItemStatus(ll_Cycle, 'selected', primary!,notmodified!)
		st_tip.text = 'Deselected ' +String(ll_Cycle)+ '/' + String(dw_search_det1.rowcount()) + ''
		If ll_Cycle >= 100 and Mod(ll_Cycle, 100) = 0 Then  Yield()
	next
	dw_search_det1.SetRedraw(True)
	this.text = "Select &All"
end if

st_tip.text = ''

SetPointer(Arrow!)
//---------------------------- APPEON END ----------------------------

end event

type cb_close from commandbutton within u_batch_update_contract_search
integer x = 3515
integer y = 1900
integer width = 352
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(iw_parent)
end event

type cb_batch_set_value from commandbutton within u_batch_update_contract_search
integer x = 393
integer y = 1900
integer width = 466
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch Set &Value..."
end type

event clicked;Long ll_find, i, li_x, ll_auto_number, ll_cnt
str_batch_update_field lstr_batch_update_field_ret
Long  ll_auto_start, ll_increment, ll_pos_auto

//Check Selected Contract
ll_find = dw_search_det1.Find('selected = "1"', 1, dw_search_det1.Rowcount() )
If ll_find = 0 Then
	Messagebox('Batch Update','Please select contract(s) you want to update. ')
	Return
End If

OpenwithParm(w_batch_update_values,istr_batch_update_field )

If Isvalid(Message.PowerObjectParm) Then
	//Check Selected Contract again
	If Message.PowerObjectParm.classname( ) = 'str_batch_update_field' Then
		lstr_batch_update_field_ret = Message.PowerObjectParm
		ll_find = dw_search_det1.Find('selected = "1"', 1, dw_search_det1.Rowcount() )
		Do While ll_find > 0
			ll_cnt++
			If ll_find = dw_search_det1.rowcount() Then Exit
			ll_find = dw_search_det1.Find('selected = "1"', ll_find + 1, dw_search_det1.Rowcount() )
			If i >= 100 and Mod(i, 100) = 0 Then  Yield()
			i++
		Loop			
			
		If ll_cnt = 0 Then
			Messagebox('Batch Update','Please select the contract(s) you want to update. ')
			Return
		End If
		SetPointer(HourGlass!)
		
		//Set Auto Number
		i = 0
		ll_find = dw_search_det1.Find('selected = "1"', 1, dw_search_det1.Rowcount() )
		ll_pos_auto = Pos(lstr_batch_update_field_ret.as_fieldvalue, '%AutoNumber%')
		If ll_pos_auto > 0 Then
			ll_auto_start = Long(Left(lstr_batch_update_field_ret.as_fieldvalue, ll_pos_auto - 1))
			ll_increment = Long(Mid(lstr_batch_update_field_ret.as_fieldvalue, ll_pos_auto +Len( '%AutoNumber%')))
			ll_auto_number = ll_auto_start
			Choose Case lstr_batch_update_field_ret.as_fielddatatype
				Case 'S'
					Do While ll_find > 0 
						dw_search_det1.SetItem(ll_find, lstr_batch_update_field_ret.as_fieldname + '_1',  String(ll_auto_number) )
						st_tip.text = 'Batch Set Value ' +String(i+1)+ '/' + String(ll_cnt) + ' ...'
						If i >= 100 and Mod(i, 100) = 0 Then  Yield()
						If ll_find = dw_search_det1.rowcount() Then Exit
						ll_find = dw_search_det1.Find('selected = "1"', ll_find + 1, dw_search_det1.Rowcount() )
						ll_auto_number = ll_auto_number + ll_increment
					Loop
				Case 'N'
					Do While ll_find > 0 
						dw_search_det1.SetItem(ll_find, lstr_batch_update_field_ret.as_fieldname + '_1',  ll_auto_number)
						st_tip.text = 'Batch Set Value ' +String(i+1)+ '/' + String(ll_cnt) + '...'
						If i >= 100 and Mod(i, 100) = 0 Then  Yield()
						If ll_find = dw_search_det1.rowcount() Then Exit
						ll_find = dw_search_det1.Find('selected = "1"', ll_find + 1, dw_search_det1.Rowcount() )
						ll_auto_number = ll_auto_number + ll_increment
					Loop
			End Choose
			st_tip.text = 'Batch Set Value is completed, please click Batch Update button to commit.'
		Else
			//Set fixed Value
			Choose Case lstr_batch_update_field_ret.as_fielddatatype
				Case 'S'   //String Column
					Do While ll_find > 0 
						dw_search_det1.SetItem(ll_find, lstr_batch_update_field_ret.as_fieldname + '_1',  lstr_batch_update_field_ret.as_fieldvalue )
						st_tip.text = 'Batch Set Value ' +String(i+1)+ '/' + String(ll_cnt) + ' ...'
						If i >= 100 and Mod(i, 100) = 0 Then  Yield()
						If ll_find = dw_search_det1.rowcount() Then Exit
						ll_find = dw_search_det1.Find('selected = "1"', ll_find + 1, dw_search_det1.Rowcount() )
						i++
					Loop
				Case 'D'  //DateTime Column
					Do While ll_find > 0 
						dw_search_det1.SetItem(ll_find, lstr_batch_update_field_ret.as_fieldname + '_1',  lstr_batch_update_field_ret.adt_fieldvalue )
						st_tip.text = 'Batch Set Value ' +String(i+1)+ '/' + String(ll_cnt) + ' ...'
						If i >= 100 and Mod(i, 100) = 0 Then  Yield()
						If ll_find = dw_search_det1.rowcount() Then Exit
						ll_find = dw_search_det1.Find('selected = "1"', ll_find + 1, dw_search_det1.Rowcount() )
						i++
					Loop
				Case 'N' //Numeric Column
					Do While ll_find > 0 
						dw_search_det1.SetItem(ll_find, lstr_batch_update_field_ret.as_fieldname + '_1',  Dec(lstr_batch_update_field_ret.as_fieldvalue ))
						st_tip.text = 'Batch Set Value ' +String(i+1)+ '/' + String(ll_cnt) + ' ...'
						If i >= 100 and Mod(i, 100) = 0 Then  Yield()
						If ll_find = dw_search_det1.rowcount() Then Exit
						ll_find = dw_search_det1.Find('selected = "1"', ll_find + 1, dw_search_det1.Rowcount() )
						i++
					Loop				
			End Choose
			st_tip.text = 'Batch Set Value is completed, please click Save button to commit the changes.'
		End If
		SetPointer(Arrow!)
	End If
End If



end event

type cb_batch_update from commandbutton within u_batch_update_contract_search
integer x = 873
integer y = 1900
integer width = 375
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;Long ll_find, ll_cnt,i, ll_ctx_id
String ls_sql, ls_value, ls_old_value, ls_new_value

dw_search_det1.AcceptText()
ll_find = dw_search_det1.Find('selected = "1"', 1, dw_search_det1.Rowcount() )
Do While ll_find > 0
	ll_cnt++
	If ll_find = dw_search_det1.rowcount() Then Exit
	ll_find = dw_search_det1.Find('selected = "1"', ll_find + 1, dw_search_det1.Rowcount() )
Loop	

If ll_cnt = 0 Then
	Messagebox('Batch Update','Please select the contract(s) you want to save. ')
	Return
End If

If Messagebox('Batch Update','Are sure that you want to batch update the data?' , Question!, Yesno!) = 2  Then Return

Long ll_seq_no

Select Isnull(max(seq_no),0)  Into :ll_seq_no From sys_audit Where  table_id = 1003;

SetPointer(Hourglass!)
ll_find = dw_search_det1.Find('selected = "1"', 1, dw_search_det1.Rowcount() )
Do While ll_find > 0
	i++
	If i >= 100 and Mod(i, 100) = 0 Then  Yield()
	ll_ctx_id = dw_search_det1.GetItemNumber(ll_find, 'ctx_id')
	Choose Case istr_batch_update_field.as_fielddatatype
		Case 'D'
			ls_value = String(dw_search_det1.GetItemDatetime(ll_find, istr_batch_update_field.as_fieldname + '_1' ), 'yyyy-mm-dd hh:mm:ss')
			If isnull(ls_value) Then
				ls_sql = "Update ctx_basic_info set " + istr_batch_update_field.as_fieldname + " = null where ctx_id = " + String(ll_ctx_id)
			Else
				ls_sql = "Update ctx_basic_info set " + istr_batch_update_field.as_fieldname + " = '" + ls_value+ "' where ctx_id = " + String(ll_ctx_id)
			End If
		Case 'S'
			ls_value = dw_search_det1.GetItemString(ll_find, istr_batch_update_field.as_fieldname + '_1' )
			If isnull(ls_value) or ls_value = '' Then
				ls_sql = "Update ctx_basic_info set " + istr_batch_update_field.as_fieldname + " = null where ctx_id = " + String(ll_ctx_id)
			Else
				ls_sql = "Update ctx_basic_info set " + istr_batch_update_field.as_fieldname + " = '" + ls_value + "' where ctx_id = " + String(ll_ctx_id)			
			End If
		Case 'N'
			ls_value = String(dw_search_det1.GetItemDecimal(ll_find, istr_batch_update_field.as_fieldname + '_1' ))
			If isnull(ls_value) Then
				ls_sql = "Update ctx_basic_info set " + istr_batch_update_field.as_fieldname + " = null where ctx_id = " + String(ll_ctx_id)
			Else
				ls_sql = "Update ctx_basic_info set " + istr_batch_update_field.as_fieldname + " = " + ls_value + " where ctx_id = " + String(ll_ctx_id)			
			End If
	End Choose
	
	EXECUTE Immediate :ls_sql Using Sqlca;
	IF Sqlca.SQLCode <> 0 THEN
		Messagebox('Error','Failed to save the contract # ' + String(ll_ctx_id) + '. '+ sqlca.sqlerrtext ,StopSign!)
		Return
	Else
		st_tip.text = 'Saving data ' +String(i)+ '/' + String(ll_cnt) + ' ...'
		
		//Insert Audit	
		ll_seq_no++
		Parent.of_get_value( ll_find, ls_old_value, ls_new_value)
		insert into sys_audit (rec_id,field_id,seq_no,table_id,prac_id,old_value,new_value,user_id,date_time_modified,audit_type,exported,export_date,facility_id,tfield_name,tfield_name_allias)   
		values(:ll_ctx_id, -9999,:ll_seq_no,1003,:ll_ctx_id,:ls_old_value,:ls_new_value,:gs_user_id,getdate(),'E', 0, null,0,:istr_batch_update_field.as_fieldname ,:istr_batch_update_field.as_fieldname_alias + '(Batch Update)' );
		
		dw_search_det1.SetItemStatus(ll_find, 0, Primary!, NotModified!)
	End If
	If ll_find = dw_search_det1.rowcount() Then Exit
	ll_find = dw_search_det1.Find('selected = "1"', ll_find + 1, dw_search_det1.Rowcount() )
Loop	

If i = ll_cnt Then
	Messagebox('Batch Update','Data saved successfully! Please reopen Contract window and verify it. ')
	st_tip.text = 'Save data is completed.'
End If
dw_search_det1.SetFocus()
SetPointer(Arrow!)

end event

type st_tip from statictext within u_batch_update_contract_search
integer x = 1326
integer y = 1916
integer width = 1765
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 134217856
long backcolor = 67108864
string text = "Status:"
boolean focusrectangle = false
end type

