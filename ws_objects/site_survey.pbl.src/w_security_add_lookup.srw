$PBExportHeader$w_security_add_lookup.srw
forward
global type w_security_add_lookup from w_response
end type
type cb_close from commandbutton within w_security_add_lookup
end type
type cb_save from commandbutton within w_security_add_lookup
end type
type dw_2 from u_dw within w_security_add_lookup
end type
type dw_1 from u_dw within w_security_add_lookup
end type
end forward

global type w_security_add_lookup from w_response
integer width = 2555
integer height = 1532
string title = "Security Role Settings"
cb_close cb_close
cb_save cb_save
dw_2 dw_2
dw_1 dw_1
end type
global w_security_add_lookup w_security_add_lookup

type variables
Int ai_type
end variables

forward prototypes
public function integer of_validate_right ()
end prototypes

public function integer of_validate_right ();//====================================================================
// Function: of_validate_right
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Harry		Date: 06-05-2017
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

long ll_right1,ll_right2,ll_right3,li_row_cnt,i

li_row_cnt = dw_1.rowcount()

for i = 1 to li_row_cnt
	ll_right1 = dw_1.GetItemNumber( i, "right1" ) 
	ll_right2 = dw_1.GetItemNumber( i, "right2" )
	ll_right3 = dw_1.GetItemNumber( i, "right3" )
	if isnull(ll_right1) then ll_right1 = 0
	if isnull(ll_right2) then ll_right2 = 0
	if isnull(ll_right3) then ll_right3 = 0

	
	if ll_right1 = 0 and ll_right2 = 0 and ll_right3 = 0 then
		Messagebox(gnv_app.iapp_object.displayname,"You must select a permission!")
		dw_1.setrow(i)
		dw_1.scrolltorow(i) //Added By Ken.Guo 2016-11-25
		dw_1.selectrow(0,false)
		dw_1.selectrow(i,true)
		return -1
	end if
next

return 1
end function

on w_security_add_lookup.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_save=create cb_save
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_save
this.Control[iCurrent+3]=this.dw_2
this.Control[iCurrent+4]=this.dw_1
end on

on w_security_add_lookup.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;call super::open;long ll_lookup_code[]
str_add_lookup lstr_lookup

lstr_lookup = message.PowerObjectParm	
ll_lookup_code = lstr_lookup.al_lookup_code

dw_2.settransobject(sqlca)
dw_2.retrieve(ll_lookup_code)

dw_2.setrow(1)
dw_2.scrolltorow(1)
end event

type cb_close from commandbutton within w_security_add_lookup
integer x = 2185
integer y = 1320
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
end type

event clicked;CloseWithReturn(Parent, "ok")
end event

type cb_save from commandbutton within w_security_add_lookup
integer x = 1829
integer y = 1320
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;if of_validate_right() < 1 then return 1
dw_1.Update()
end event

type dw_2 from u_dw within w_security_add_lookup
integer x = 5
integer y = 12
integer width = 928
integer height = 1284
integer taborder = 20
string dataobject = "d_added_lookups"
end type

event clicked;call super::clicked;////Added by harry 20170506 for task723
//Long ll_row
//Long ll_lookup_code
//String ls_lookup_name
//datawindowchild ldwc
//
//if row < 1 then return
//ll_row = this.getrow()
//this.selectrow(0, false)
//this.selectrow(row, true)
//
//
//if dw_1.modifiedcount( ) > 0 then
//	if messagebox(gnv_app.iapp_object.DisplayName,'Do you want to save changes?',question!,yesno!) = 1 then
//		if of_validate_right() < 1 then 
//			this.selectrow(0, false)
//			this.selectrow(ll_row, true)
//			return 1
//		end if
//		dw_1.update()
//	end if
//end if
//ll_lookup_code = this.getitemnumber(row, 'lookup_code')
//ls_lookup_name = this.getitemstring(row, 'lookup_name')
//
//Choose Case ls_lookup_name
//	Case 'Contract Category'
//		ai_type = 1
//	Case 'Contract Division'
//		ai_type = 6
//	Case 'Contract Department'
//		ai_type = 7
//	Case 'Contract Type'
//		ai_type = 8
//End Choose
//
//dw_1.settransobject(sqlca)
//dw_1.retrieve( ai_type, ll_lookup_code )


end event

event rowfocuschanged;call super::rowfocuschanged;//Added by harry 20170506 for task723
Long ll_row
Long ll_lookup_code
String ls_lookup_name
datawindowchild ldwc

if currentrow < 1 then return
ll_row = this.getrow()
this.selectrow(0, false)
this.selectrow(currentrow, true)


if dw_1.modifiedcount( ) > 0 then
	if messagebox(gnv_app.iapp_object.DisplayName,'Do you want to save changes?',question!,yesno!) = 1 then
		if of_validate_right() < 1 then 
			this.selectrow(0, false)
			this.selectrow(ll_row, true)
			return 1
		end if
		dw_1.update()
	end if
end if
ll_lookup_code = this.getitemnumber(currentrow, 'lookup_code')
ls_lookup_name = this.getitemstring(currentrow, 'lookup_name')

Choose Case ls_lookup_name
	Case 'Contract Category'
		ai_type = 1
	Case 'Contract Division'
		ai_type = 6
	Case 'Contract Department'
		ai_type = 7
	Case 'Contract Type'
		ai_type = 8
End Choose

dw_1.settransobject(sqlca)
dw_1.retrieve( ai_type, ll_lookup_code )
end event

type dw_1 from u_dw within w_security_add_lookup
integer x = 937
integer y = 12
integer height = 1284
integer taborder = 10
string dataobject = "d_contract_management_roles"
end type

event buttonclicked;call super::buttonclicked;long	i,	ll_rowcount,j
string ls_column,ls_visible,ls_string,ls_objectname
boolean lb_select_all = false
	
ls_objectname = dwo.name 

if ls_objectname = 'b_1' or ls_objectname = 'b_2' or ls_objectname= 'b_3' then
	ls_column = 'right' + right(dwo.name,1)
	if dw_1.describe(ls_objectname + ".text") ='All' then lb_select_all = true
 	FOR i = 1 To dw_1.RowCount() 
		if  lb_select_all then
			dw_1.SetItem(i,ls_column,1)
			for j = 1 to 5
				ls_string = 'right' + string(j)
				if ls_column = ls_string then continue
				ls_visible = dw_1.describe(ls_string + ".Visible")
				if ls_visible = '1' then
					dw_1.SetItem(i,ls_string,0)
				end if
			next
			//set value for ctx_acp_contract_management_right.rights
			choose case ai_type
				case 1
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'11')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'12')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'13')
					end if
				case 6
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'61')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'62')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'63')
					end if
				case 7
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'71')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'72')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'73')
					end if
				case 8
					if ls_column = 'right1' then
						dw_1.SetItem(i,"rights",'81')
					elseif ls_column = 'right2' then
						dw_1.SetItem(i,"rights",'82')
					elseif ls_column = 'right3' then
						dw_1.SetItem(i,"rights",'83')
					end if
			end choose
		else
			dw_1.SetItem(i,ls_column,0)
			dw_1.SetItem(i,"rights",'')
		end if
	NEXT
	
	if lb_select_all then
		dw_1.modify(ls_objectname + ".text = 'None' ")
	else
		dw_1.modify(ls_objectname + ".text = 'All' ")
	end if
END IF

end event

event itemchanged;call super::itemchanged;
long	i,	ll_rowcount
string ls_column,ls_visible,ls_string
	
if row <= 0 then return 	
this.accepttext( )
//Added by harry 20170506 for task723
if long(data) = 1 then 
	for i = 1 to 5
		ls_column = 'right' + string(i)
		if ls_column = dwo.name then continue
		ls_visible = this.describe(ls_column + ".Visible")
		if ls_visible = '1' then
			this.SetItem(row,ls_column,0)
		end if
	next
	//set value for ctx_acp_contract_management_right.rights
	choose case ai_type
		case 1
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'11')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'12')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'13')
			end if
		case 2
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'21')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'22')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'23')
			elseif dwo.name = 'right4' then
				this.SetItem(row,"rights",'24')
			elseif dwo.name = 'right5' then
				this.SetItem(row,"rights",'25')
			end if
		case 3
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'31')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'32')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'33')
			elseif dwo.name = 'right4' then
				this.SetItem(row,"rights",'34')
			end if
		case 4
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'41')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'42')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'43')
			elseif dwo.name = 'right4' then
				this.SetItem(row,"rights",'44')
			end if
		case 6
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'61')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'62')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'63')
			end if
		case 7
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'71')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'72')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'73')
			end if
		case 8
			if dwo.name = 'right1' then
				this.SetItem(row,"rights",'81')
			elseif dwo.name = 'right2' then
				this.SetItem(row,"rights",'82')
			elseif dwo.name = 'right3' then
				this.SetItem(row,"rights",'83')
			end if
	end choose
end if



end event

