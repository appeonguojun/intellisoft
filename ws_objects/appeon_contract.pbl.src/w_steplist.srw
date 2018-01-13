$PBExportHeader$w_steplist.srw
forward
global type w_steplist from window
end type
type dw_1 from datawindow within w_steplist
end type
type cb_2 from commandbutton within w_steplist
end type
type cb_1 from commandbutton within w_steplist
end type
end forward

global type w_steplist from window
integer width = 1248
integer height = 1064
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_steplist w_steplist

type variables

end variables

forward prototypes
public subroutine of_refresh_position_express (string as_object)
public function integer of_auto_sync_screen (string as_fieldname)
end prototypes

public subroutine of_refresh_position_express (string as_object);//====================================================================
// Function: of_refresh_position_express
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string    as_Object
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-29-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_find
string ls_express,ls_x,ls_y,ls_w,ls_h,ls_x1,ls_x2,ls_y1,ls_y2

if isvalid(w_contract_data_design) then
	ll_find = w_contract_data_design.uo_design.ids_object.find("colname = '" + as_Object + "'",1,w_contract_data_design.uo_design.ids_object.rowcount())
	if ll_find > 0 then
		if w_contract_data_design.uo_design.uo_band.dw_syntax.describe(as_Object + ".type") <> 'line' then
			ls_x = w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(as_Object + ".X")
			ls_y = w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(as_Object + ".Y")
			ls_w = w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(as_Object + ".Width")
			ls_h = w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(as_Object + ".Height")
			if not Pos( ls_x, '~t' ) > 0 then w_contract_data_design.uo_design.ids_object.setitem(ll_find,"xexp","")
			if not Pos( ls_y, '~t' ) > 0 then w_contract_data_design.uo_design.ids_object.setitem(ll_find,"yexp","")
			if not Pos( ls_w, '~t' ) > 0 then w_contract_data_design.uo_design.ids_object.setitem(ll_find,"wexp","")
			if not Pos( ls_h, '~t' ) > 0 then w_contract_data_design.uo_design.ids_object.setitem(ll_find,"hexp","")
		else
			ls_x1 = w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(as_Object + ".x1")
			ls_x2 = w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(as_Object + ".x2")
			ls_y1 = w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(as_Object + ".y1")
			ls_y2 = w_contract_data_design.uo_design.uo_band.dw_syntax.Describe(as_Object + ".y2")
			if not Pos( ls_x1, '~t' ) > 0 then w_contract_data_design.uo_design.ids_object.setitem(ll_find,"xexp","")
			if not Pos( ls_y2, '~t' ) > 0 then w_contract_data_design.uo_design.ids_object.setitem(ll_find,"yexp","")
			if not Pos( ls_x2, '~t' ) > 0 then w_contract_data_design.uo_design.ids_object.setitem(ll_find,"wexp","")
			if not Pos( ls_y2, '~t' ) > 0 then w_contract_data_design.uo_design.ids_object.setitem(ll_find,"hexp","")
		end if
	end if	
end if
end subroutine

public function integer of_auto_sync_screen (string as_fieldname);//====================================================================
// Function: of_auto_sync_screen
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 02-23-2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//BEGIN---Modify by Scofield on 2009-09-29
String 	ls_FieldName,ls_Visible, ls_TCol,ls_sync_screen_contact,ls_ObjName,ls_Type,ls_ColName
long		ll_Row,ll_AlwaysUpdate,ll_RtnVal,ll_rtn,ll_Cnts,ll_Cycle1

//Commented By Ken.Guo 2016-04-14
//ll_Cnts = UpperBound(w_contract_data_design.uo_design.istr_selectobj)
//if ll_Cnts <= 0 then Return -1
//for ll_Cycle1 = 1 to ll_Cnts

	ls_FieldName = as_fieldname
	if IsNull(ls_FieldName) or Trim(ls_FieldName) = "" then Return 0
	
	ls_Type = w_contract_data_design.uo_design.uo_band.dw_Syntax.Describe(ls_FieldName + ".Type")
	if ls_Type <> "column" and ls_Type <> "text" then Return 0
	
	if ls_Type = "column" then
		ls_ColName = ls_FieldName
		if w_contract_data_design.uo_design.is_open_style = "screen" and w_contract_data_design.uo_design.ii_Screen_id >=3 and w_contract_data_design.uo_design.ii_Screen_id <= 10   Then
			if ( w_contract_data_design.uo_design.ii_Screen_id >=6 and w_contract_data_design.uo_design.ii_Screen_id  <=7  and Pos( lower(ls_FieldName),'owner' ) > 0 )  then
				w_contract_data_design.uo_design.Post of_AutoUpdateSearchScreen(ls_FieldName, 'owner' )		
			elseif Not( w_contract_data_design.uo_design.ii_Screen_id >=6 and w_contract_data_design.uo_design.ii_Screen_id  <=7 ) Then
				if w_contract_data_design.uo_design.ii_Screen_id = 10 then 
					ls_TCol = 'custom2_' + ls_FieldName
					w_contract_data_design.uo_design.of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )	
					w_contract_data_design.uo_design.of_AutoUpdateDetailScreen(ls_FieldName)
				else
					w_contract_data_design.uo_design.Post of_AutoUpdateSearchScreen(ls_FieldName)
					w_contract_data_design.uo_design.Post of_AutoUpdateDetailScreen(ls_FieldName)	
				end if
			end if
		elseif (w_contract_data_design.uo_design.is_open_style = "screen" and (w_contract_data_design.uo_design.ii_Screen_id = 53 or w_contract_data_design.uo_design.ii_Screen_id  =54)) Then
			w_contract_data_design.uo_design.Post of_AutoUpdateScreen("Custom Multi",ls_FieldName)	
		end if

		if w_contract_data_design.uo_design.is_open_style = "screen" and ( w_contract_data_design.uo_design.ii_Screen_id = 6 Or w_contract_data_design.uo_design.ii_Screen_id = 7 or w_contract_data_design.uo_design.ii_Screen_id = 1) then  
			if w_contract_data_design.uo_design.ii_Screen_id <> 1 then 
				If w_contract_data_design.uo_design.ii_Screen_id = 6 Then
					ls_TCol = 'ccci_' + ls_FieldName
				Else
					ls_TCol = 'occi_' + ls_FieldName
				ENd If
				If Pos( 'association,custom_n1, custom_1' , lower(ls_FieldName) ) > 0  Or  Pos(  'association_t,custom_n1_t, custom_1_t' , lower(ls_FieldName) ) > 0  Then
					w_contract_data_design.uo_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )		
			//		w_contract_data_design.uo_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )	
				End If
			end if
	
			ls_sync_screen_contact = gnv_data.of_getitem("icred_settings", "sync_screen_contact", false)
			if isnull(ls_sync_screen_contact) then ls_sync_screen_contact = '0'
			if ls_sync_screen_contact = '1' then
				if left(lower(ls_FieldName),20) = 'ctx_contacts_custom_' or left(lower(ls_FieldName),20) = 'app_facility_custom_' then
					if Not w_contract_data_design.uo_design.ib_alwayssync then
						if w_contract_data_design.uo_design.ib_alwayssync then 
							ll_AlwaysUpdate = 10 
						else 
							ll_AlwaysUpdate = 0
						end if
						OpenWithParm(w_sync_confirm,String(ll_AlwaysUpdate))
						ll_RtnVal = Message.DoubleParm
						if ll_RtnVal >= 10 then
							w_contract_data_design.uo_design.ib_alwayssync = true
						else
							w_contract_data_design.uo_design.ib_alwayssync = false
						end if
						ll_rtn = Mod(ll_RtnVal,2) 
					else
						ll_rtn = 1
					end if
					if ll_rtn = 1 then
						w_contract_data_design.uo_design.of_auto_update_contact_custom(ls_FieldName)
						//Added By Jay Chen 11-30-2015 sync search screen and contract contact screen
						if left(lower(ls_FieldName),20) = 'app_facility_custom_' then
							if w_contract_data_design.uo_design.ii_Screen_id = 1 then
								w_contract_data_design.uo_design.of_auto_update_contactsyntax(6, ls_FieldName)
								w_contract_data_design.uo_design.of_auto_update_contactsyntax(7, ls_FieldName)
							elseif w_contract_data_design.uo_design.ii_Screen_id = 6 then
								w_contract_data_design.uo_design.of_auto_update_contactsyntax(1, ls_FieldName)
								w_contract_data_design.uo_design.of_auto_update_contactsyntax(7, ls_FieldName)
							elseif w_contract_data_design.uo_design.ii_Screen_id = 7 then
								w_contract_data_design.uo_design.of_auto_update_contactsyntax(1, ls_FieldName)
								w_contract_data_design.uo_design.of_auto_update_contactsyntax(6, ls_FieldName)
							end if
						end if
						//end
					end if
				end if
			end if
		end if
		//added by gavins 20120607
		if w_contract_data_design.uo_design.is_open_style = "screen" and ( w_contract_data_design.uo_design.ii_Screen_id =31 ) then
			ls_TCol = 'feesched_' + ls_FieldName
			w_contract_data_design.uo_design.Post of_AutoUpdateSearchScreen(ls_FieldName, ls_TCol )		
		End If
			
		If w_contract_data_design.uo_design.is_open_style = "screen" and ( w_contract_data_design.uo_design.ii_Screen_id =51 or w_contract_data_design.uo_design.ii_Screen_id =52 Or w_contract_data_design.uo_design.ii_Screen_id =56 ) then
			w_contract_data_design.uo_design.Post of_AutoUpdateDocumentScreen(ls_FieldName )	
		End If
		
	end if
	Yield() //Added By Ken.Guo 2016-04-14
//Next

////Added By Jay Chen 01-20-2014
//w_contract_data_design.uo_design.of_Refresh_Object_Inforamtion()


return 1
end function

on w_steplist.create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_2,&
this.cb_1}
end on

on w_steplist.destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;long ll_row,li_insert
string ls_step,ls_syntax,ls_field_name,ls_syntax2

//Added By Ken.Guo 2016-04-11
If gi_test_mode = 1 Then
	dw_1.modify('step_syntax.visible = "1" step_syntax_t.visible = "1"')
End If

if isvalid(w_contract_data_design) then
	this.x = w_contract_data_design.il_pointerx
//	this.y = w_contract_data_design.il_pointery
//	If AppeonGetClientType() = 'WEB' Then //Modified By Ken.Guo 2016-04-11
//		this.y = w_mdi.workspacey( ) + 400
//	Else
//		this.y = w_mdi.workspacey( ) + 160
//	End If
	If AppeonGetClientType() = 'WEB' Then
		this.y = 0 + 160
	Else
		this.y = 0 + 160
	End If	
	If This.x < 0 Then This.x = 0 //Added By Ken.Guo 2016-04-11

	for ll_row = 1 to w_contract_data_design.uo_design.ids_step_list.rowcount()
		ls_field_name = w_contract_data_design.uo_design.ids_step_list.getitemstring(ll_row,"field_name")
		ls_step = w_contract_data_design.uo_design.ids_step_list.getitemstring(ll_row,"step_name")
		ls_syntax = w_contract_data_design.uo_design.ids_step_list.getitemstring(ll_row,"step_syntax")
		ls_syntax2 = w_contract_data_design.uo_design.ids_step_list.getitemstring(ll_row,"step_syntax2")
		li_insert = dw_1.insertrow(0)
		dw_1.setitem(li_insert, "field_name", ls_field_name)
		dw_1.setitem(li_insert, "step_name", ls_step)
		dw_1.setitem(li_insert, "step_syntax", ls_syntax)
		dw_1.setitem(li_insert, "step_syntax2", ls_syntax2)
	next
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type dw_1 from datawindow within w_steplist
integer x = 18
integer y = 12
integer width = 1198
integer height = 912
integer taborder = 10
string title = "none"
string dataobject = "d_undo_syntax_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event itemchanged;//Added By Jay Chen 02-24-2016

long i,	ll_rowcount
	
if row <= 0 then return 	

choose case dwo.name
	case "choose"
		ll_rowcount = this.rowcount( )
		if long(data) = 1 then 
			for i = 1 to row
				if i = row then continue
				this.SetItem(i,"choose",1)
			next 
		else
//			for i = 1 to row  //Commented By Jay 2016-04-26
//				if i = row then continue
//				this.SetItem(row,"choose",0)
//			next 
			
//			//Begin - Modified By Jay 2016-04-26
//			
//			If ( row = ll_rowcount ) Then
//				SetItem ( Row, 'choose', 0 )
//			Else
//				If GetItemNumber ( Row + 1, 'choose' ) = 1 Then
//					SetItem ( Row, 'choose', 1 )
//					Return 2
//				Else
//					SetItem ( Row, 'choose', 0 )					
//				End If
//			End If
//			
//			//End - Modified By Jay 2016-04-26

			for i = row to ll_RowCount  //Modified By Jay 2016-04-26
				if i = row then continue
				If GetItemNumber ( i, 'choose' ) = 1 Then
					SetItem(i,"choose",0)
				End If
			next 

		end if 	 
end choose 
end event

type cb_2 from commandbutton within w_steplist
integer x = 430
integer y = 936
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;//Added By Jay Chen 02-24-2016
long ll_row,ll_select,ll_pos,ll_pos2
string ls_Modify,ls_err,ls_field_name,ls_LabelName,ls_Column_Name,ls_LabelBand,ls_ret,ls_Modify2
String ls_ObjectBand,ls_modify_create, ls_modify_destroy,ls_ObjectBand1 //Added By Ken.Guo 2016-04-11
pfc_cst_u_band	 ldw_band
string ls_string,ls_step_name
boolean lb_undo_sync = false,lb_modify = false
long ll_find,ll_insert
datastore lds_undo_sync_field
Boolean lb_header_recreate, lb_detail_recreate, lb_SUMMARY_recreate, lb_FOOTER_recreate, lb_HEADERGROUP_recreate, lb_TRAILERGROUP_recreate //Added By Ken.Guo 2016-04-13

lds_undo_sync_field = create datastore
lds_undo_sync_field.dataobject = 'd_contract_object_list'

for ll_row = 1 to dw_1.rowcount()
	ll_select = dw_1.getitemnumber(ll_row, "choose")
	if ll_select = 1 then
		ls_step_name = dw_1.getitemstring(ll_row, "step_name")
		ls_Modify = dw_1.getitemstring(ll_row, "step_syntax")
		ls_Modify2 = dw_1.getitemstring(ll_row, "step_syntax2")
		ls_field_name = dw_1.getitemstring(ll_row, "field_name")
		if pos(lower(ls_step_name),'field style') > 0 or pos(lower(ls_step_name),'display name') > 0 or pos(lower(ls_step_name),'lookup table name') > 0 or pos(lower(ls_step_name),'labeltext') > 0 then
			ll_find = lds_undo_sync_field.find("colname = '"+ls_field_name+"'",1,lds_undo_sync_field.rowcount())
			if ll_find = 0 then
				ll_insert = lds_undo_sync_field.insertrow(0)
				lds_undo_sync_field.setitem(ll_insert, "colname", ls_field_name)
			end if
		end if
	else
		continue
	end if

	if Right(ls_field_name,2) = "_t" then
		ls_LabelName = ls_field_name
		ls_Column_Name = Left(ls_field_name,Len(ls_field_name) - 2)
	else
		ls_LabelName = ls_field_name + "_t"
		ls_Column_Name = ls_field_name
	end if

	if IsNull(ls_LabelName) or Trim(ls_LabelName) = "" then Return 1
	if IsNull(ls_Column_Name) or Trim(ls_Column_Name) = "" then Return 1
	
	if isvalid(w_contract_data_design) then
		
//		ls_LabelBand = w_contract_data_design.uo_design.uo_band.dw_Syntax.Describe(ls_LabelName + ".Band")
//		//Added By Jay Chen 02-26-2016
//		if ls_LabelBand = '?' or ls_LabelBand = '!' then
//			ls_LabelBand = w_contract_data_design.uo_design.uo_band.dw_Syntax.Describe(ls_Column_Name + ".Band")
//			if ls_LabelBand = '?' or ls_LabelBand = '!' then
//				ll_pos = pos(ls_Modify,"band=")
//				ls_string = right(ls_Modify, len(ls_Modify) - ll_pos + 1)
//				ll_pos2 = pos(ls_string," ")
//				ls_LabelBand = trim(mid(ls_string,6,ll_pos2 - 6))
//				if ls_LabelBand = '?' or ls_LabelBand = '!' then ls_LabelBand = 'DETAIL'
//			end if
//		end if
//		//end
		//Modified By Ken.Guo 2016-04-11
		ls_ObjectBand = w_contract_data_design.uo_design.uo_band.dw_Syntax.Describe(ls_field_name + ".Band")
		//Added By Jay Chen 02-26-2016
		if ls_ObjectBand = '?' or ls_ObjectBand = '!' then
			ll_pos = pos(ls_Modify,"band=")
			ls_string = right(ls_Modify, len(ls_Modify) - ll_pos + 1)
			ll_pos2 = pos(ls_string," ")
			ls_ObjectBand = trim(mid(ls_string,6,ll_pos2 - 6))
			if ls_ObjectBand = '?' or ls_ObjectBand = '!' then ls_ObjectBand = 'DETAIL'
		end if
		//end
		
		CHOOSE CASE UPPER(ls_ObjectBand) //Modified By Ken.Guo 2016-04-11
			CASE 'HEADER'
				ldw_band = w_contract_data_design.uo_design.uo_band.dw_Header
				lb_header_recreate = True //Added By Ken.Guo 2016-04-13
			CASE 'DETAIL'
				ldw_band = w_contract_data_design.uo_design.uo_band.dw_detail
				 lb_detail_recreate = True //Added By Ken.Guo 2016-04-13
			CASE 'SUMMARY'
				ldw_band = w_contract_data_design.uo_design.uo_band.dw_Summary
				lb_SUMMARY_recreate = True //Added By Ken.Guo 2016-04-13
			CASE 'FOOTER'
				ldw_Band = w_contract_data_design.uo_design.uo_band.dw_Footer
				lb_FOOTER_recreate = True //Added By Ken.Guo 2016-04-13
			CASE 'HEADERGROUP','HEADER.1'
				ldw_band = w_contract_data_design.uo_design.uo_band.dw_Headergroup
				lb_HEADERGROUP_recreate = True//Added By Ken.Guo 2016-04-13
			CASE 'TRAILERGROUP','TRAILER.1'
				ldw_band = w_contract_data_design.uo_design.uo_band.dw_trailergroup
				lb_TRAILERGROUP_recreate = True//Added By Ken.Guo 2016-04-13
			CASE else
		END CHOOSE
		
		if IsValid(ldw_band) then 
			
			//Begin Modified By Ken.Guo 2016-04-11
			//ls_ret = ldw_band.Modify(ls_Modify) 
			If Left(ls_Modify, 7) = 'destroy' Then //desoty on current band, create on target band.
				ll_pos = pos(ls_Modify, 'create')
				If ll_pos > 0 Then
					//get destroy and create syntax
					ls_modify_destroy = Left(ls_Modify, ll_pos - 1)
					ls_modify_create = Mid(ls_Modify, ll_pos )
					//destroy object in current band
					ls_ret = ldw_band.Modify(ls_modify_destroy)
					//Get band from the create syntax
					ll_pos = pos(ls_Modify,"band=")
					ls_string = right(ls_Modify, len(ls_Modify) - ll_pos + 1)
					ll_pos2 = pos(ls_string," ")
					ls_ObjectBand1 = trim(mid(ls_string,6,ll_pos2 - 6))
					if ls_ObjectBand1 = '?' or ls_ObjectBand1 = '!' then ls_ObjectBand1 = 'DETAIL'
					CHOOSE CASE UPPER(ls_ObjectBand1) //Modified By Ken.Guo 2016-04-11
						CASE 'HEADER'
							ldw_band = w_contract_data_design.uo_design.uo_band.dw_Header
						CASE 'DETAIL'
							ldw_band = w_contract_data_design.uo_design.uo_band.dw_detail
						CASE 'SUMMARY'
							ldw_band = w_contract_data_design.uo_design.uo_band.dw_Summary
						CASE 'FOOTER'
							ldw_Band = w_contract_data_design.uo_design.uo_band.dw_Footer
						CASE 'HEADERGROUP','HEADER.1'
							ldw_band = w_contract_data_design.uo_design.uo_band.dw_Headergroup
						CASE 'TRAILERGROUP','TRAILER.1'
							ldw_band = w_contract_data_design.uo_design.uo_band.dw_trailergroup
						CASE else
					END CHOOSE
					//create object in target band
					ls_ret = ldw_band.Modify(ls_modify_create)
					
				Else
					ls_ret = ldw_band.Modify(ls_Modify)
				End If
				//End Modified By Ken.Guo 2016-04-11
				
			ElseIf  Pos(ls_Modify, ls_Column_Name + '.visible = ') > 0  and Pos(ls_Modify, ls_LabelName + '.visible = ') > 0 Then
				//Added By Ken.Guo 2016-04-29. If column in detail. label in header.
				ll_pos = Pos(ls_Modify, ls_LabelName + '.visible = ')
				ldw_band.modify(Mid(ls_Modify, 1,ll_pos - 1)) //modify field
				ls_LabelBand = w_contract_data_design.uo_design.uo_band.dw_Syntax.Describe(ls_LabelName + ".Band")
				If ls_LabelBand = '?' or ls_LabelBand = '!' Then ls_LabelBand = 'DETAIL'
				CHOOSE CASE UPPER(ls_LabelBand) //Modified By Ken.Guo 2016-04-11
					CASE 'HEADER'
						ldw_band = w_contract_data_design.uo_design.uo_band.dw_Header
					CASE 'DETAIL'
						ldw_band = w_contract_data_design.uo_design.uo_band.dw_detail
					CASE 'SUMMARY'
						ldw_band = w_contract_data_design.uo_design.uo_band.dw_Summary
					CASE 'FOOTER'
						ldw_Band = w_contract_data_design.uo_design.uo_band.dw_Footer
					CASE 'HEADERGROUP','HEADER.1'
						ldw_band = w_contract_data_design.uo_design.uo_band.dw_Headergroup
					CASE 'TRAILERGROUP','TRAILER.1'
						ldw_band = w_contract_data_design.uo_design.uo_band.dw_trailergroup
					CASE else
				END CHOOSE
				ldw_band.modify(Mid(ls_Modify, ll_pos )) //modify label
				
			Else
				ls_ret = ldw_band.Modify(ls_Modify)
			End If
			
			
			ls_ret = w_contract_data_design.uo_design.Event ue_SetModify(ls_Modify2)
			lb_modify = true
		end if
		if len(ls_ret) = 0 then
			if pos(lower(ls_Modify2),'.x') > 0 or pos(lower(ls_Modify2),'.y') > 0 or pos(lower(ls_Modify2),'.width') > 0 or pos(lower(ls_Modify2),'.height') > 0 or &
				pos(lower(ls_Modify2),'.x1') > 0 or pos(lower(ls_Modify2),'.y1') > 0 or pos(lower(ls_Modify2),'.x2') > 0 or pos(lower(ls_Modify2),'.y2') > 0 then
				 of_refresh_position_express(ls_field_name)
				 w_contract_data_design.uo_design.of_RefreshMarkPos() //Added By Jay Chen 03-01-2016
			end if
		end if
		if len(ls_ret) = 0 then
//			dw_1.deleterow(ll_row)
			ll_find = w_contract_data_design.uo_design.ids_step_list.find("lower(step_name) = '"+lower(ls_step_name)+"'",1,w_contract_data_design.uo_design.ids_step_list.rowcount())
			if ll_find > 0 then
				w_contract_data_design.uo_design.ids_step_list.deleterow(ll_find)
			end if
		else
			messagebox("Error","Undo " + ls_step_name + ' failed.')
			gnv_debug.of_output(true, 'Undo failed. ' + ls_step_name + ', Syntax: ' + ls_Modify2  + '. Error:' + ls_ret) //Added By Ken.Guo 2016-04-11
		end if
	end if
	
next

//Added By Ken.Guo 2016-04-13. need regenerate column. e.g. taborder, border, dddw, autoheitght
If lb_header_recreate Then
	w_contract_data_design.uo_design.uo_band.dw_header. event ue_regenerate()
End If
If lb_detail_recreate Then
	w_contract_data_design.uo_design.uo_band.dw_detail. event ue_regenerate()
End If 
If lb_SUMMARY_recreate Then
	w_contract_data_design.uo_design.uo_band.dw_summary. event ue_regenerate()
End If
If lb_FOOTER_recreate Then
	w_contract_data_design.uo_design.uo_band.dw_footer. event ue_regenerate()
End If
If lb_HEADERGROUP_recreate Then
	w_contract_data_design.uo_design.uo_band.dw_HEADERGROUP. event ue_regenerate()
End If
If lb_TRAILERGROUP_recreate Then
	w_contract_data_design.uo_design.uo_band.dw_TRAILERGROUP. event ue_regenerate()
End If

for ll_row = 1 to lds_undo_sync_field.rowcount()
	ls_field_name = lds_undo_sync_field.getitemstring(ll_row,"colname")
	of_auto_sync_screen(ls_field_name)
next

//Added By Jay Chen 02-25-2016 refresh field properties
if isvalid(w_contract_data_design) and lb_modify then
	w_contract_data_design.uo_design.ib_undo_refresh = true
	w_contract_data_design.uo_design.of_retrieve_dw_properties(w_contract_data_design.uo_design.uo_band.dw_Syntax )
//	w_contract_data_design.uo_design.of_Refresh_Object_Inforamtion()
	w_contract_data_design.uo_design.ib_undo_refresh = false
	w_contract_data_design.uo_design.of_unselectallobject() //Added By Ken.Guo 2016-04-11
end if

close(parent)
end event

type cb_1 from commandbutton within w_steplist
integer x = 786
integer y = 936
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

event clicked;close(parent)
end event

