﻿$PBExportHeader$w_batch_record_update.srw
forward
global type w_batch_record_update from window
end type
type cb_ibatch from commandbutton within w_batch_record_update
end type
type st_7 from statictext within w_batch_record_update
end type
type cb_syntax from commandbutton within w_batch_record_update
end type
type cb_2 from commandbutton within w_batch_record_update
end type
type st_null3 from statictext within w_batch_record_update
end type
type st_null2 from statictext within w_batch_record_update
end type
type st_null1 from statictext within w_batch_record_update
end type
type cb_view_ver from commandbutton within w_batch_record_update
end type
type cb_view_audit from commandbutton within w_batch_record_update
end type
type cbx_1 from checkbox within w_batch_record_update
end type
type st_date4 from statictext within w_batch_record_update
end type
type sle_valueupdate from singlelineedit within w_batch_record_update
end type
type dw_vupdate from datawindow within w_batch_record_update
end type
type ddlb_3 from dropdownlistbox within w_batch_record_update
end type
type dw_crit3 from datawindow within w_batch_record_update
end type
type dw_select from datawindow within w_batch_record_update
end type
type st_vers_found from statictext within w_batch_record_update
end type
type st_rf from statictext within w_batch_record_update
end type
type cb_view from commandbutton within w_batch_record_update
end type
type st_8 from statictext within w_batch_record_update
end type
type st_date3 from statictext within w_batch_record_update
end type
type st_date2 from statictext within w_batch_record_update
end type
type st_date1 from statictext within w_batch_record_update
end type
type dw_v3 from datawindow within w_batch_record_update
end type
type dw_v2 from datawindow within w_batch_record_update
end type
type dw_v1 from datawindow within w_batch_record_update
end type
type ddlb_2 from dropdownlistbox within w_batch_record_update
end type
type ddlb_1 from dropdownlistbox within w_batch_record_update
end type
type st_6 from statictext within w_batch_record_update
end type
type dw_resp_code from datawindow within w_batch_record_update
end type
type st_5 from statictext within w_batch_record_update
end type
type st_4 from statictext within w_batch_record_update
end type
type st_3 from statictext within w_batch_record_update
end type
type st_2 from statictext within w_batch_record_update
end type
type st_1 from statictext within w_batch_record_update
end type
type sle_value3 from singlelineedit within w_batch_record_update
end type
type dw_crit_update from datawindow within w_batch_record_update
end type
type dw_crit2 from datawindow within w_batch_record_update
end type
type dw_crit1 from datawindow within w_batch_record_update
end type
type sle_value2 from singlelineedit within w_batch_record_update
end type
type sle_value1 from singlelineedit within w_batch_record_update
end type
type dw_table from datawindow within w_batch_record_update
end type
type cb_3 from commandbutton within w_batch_record_update
end type
type cb_find from commandbutton within w_batch_record_update
end type
type cb_1 from commandbutton within w_batch_record_update
end type
type gb_7 from groupbox within w_batch_record_update
end type
type gb_6 from groupbox within w_batch_record_update
end type
type gb_5 from groupbox within w_batch_record_update
end type
type gb_4 from groupbox within w_batch_record_update
end type
type gb_3 from groupbox within w_batch_record_update
end type
type gb_2 from groupbox within w_batch_record_update
end type
type gb_1 from groupbox within w_batch_record_update
end type
type dw_verifs from datawindow within w_batch_record_update
end type
type dw_audit from datawindow within w_batch_record_update
end type
type cb_update from commandbutton within w_batch_record_update
end type
end forward

global type w_batch_record_update from window
integer x = 96
integer y = 36
integer width = 3378
integer height = 2296
boolean titlebar = true
string title = "Batch Update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79680469
cb_ibatch cb_ibatch
st_7 st_7
cb_syntax cb_syntax
cb_2 cb_2
st_null3 st_null3
st_null2 st_null2
st_null1 st_null1
cb_view_ver cb_view_ver
cb_view_audit cb_view_audit
cbx_1 cbx_1
st_date4 st_date4
sle_valueupdate sle_valueupdate
dw_vupdate dw_vupdate
ddlb_3 ddlb_3
dw_crit3 dw_crit3
dw_select dw_select
st_vers_found st_vers_found
st_rf st_rf
cb_view cb_view
st_8 st_8
st_date3 st_date3
st_date2 st_date2
st_date1 st_date1
dw_v3 dw_v3
dw_v2 dw_v2
dw_v1 dw_v1
ddlb_2 ddlb_2
ddlb_1 ddlb_1
st_6 st_6
dw_resp_code dw_resp_code
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
sle_value3 sle_value3
dw_crit_update dw_crit_update
dw_crit2 dw_crit2
dw_crit1 dw_crit1
sle_value2 sle_value2
sle_value1 sle_value1
dw_table dw_table
cb_3 cb_3
cb_find cb_find
cb_1 cb_1
gb_7 gb_7
gb_6 gb_6
gb_5 gb_5
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
dw_verifs dw_verifs
dw_audit dw_audit
cb_update cb_update
end type
global w_batch_record_update w_batch_record_update

type variables
string is_field1
string is_field2
string is_field3
string is_fieldup
string is_table
string is_where
string is_search
long il_v1
long il_v2
long il_v3
long il_vup
long il_resps
long il_upfield_sysid
string is_user
string is_lookup_val
string is_lookup_type
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.18.2006 By: Jack (Inova)
//$<reason> Required Documents Check Box on Data Entry Screen.
long il_prac_id[]
long il_rec_id[]
long il_screen_id
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public subroutine of_insert_row ()
end prototypes

public subroutine of_insert_row ();//////////////////////////////////////////////////////////////////////
// $<function>w_batch_record_updateof_insert_row()
// $<description>Insert an empty row into child datawindow
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 02.20.2006 by Wang Chao
//////////////////////////////////////////////////////////////////////

datawindowchild dwchild
string field

if dw_crit1.getitemstring(1,"lookup_field") = "Y" then	
	if dw_crit1.getitemstring(1,"lookup_type") = "C" then		
		field = "description"
	elseif dw_crit1.getitemstring(1,"lookup_type") = "A" then		
		field = "entity_name_original"
	end if	
	dw_v1.GetChild( field, dwchild )	
	dwchild.SetTransObject( SQLCA )
	dwchild.InsertRow( 1 )
	dw_v1.insertrow(1)
end if

if dw_crit2.getitemstring(1,"lookup_field") = "Y" then	
	if dw_crit2.getitemstring(1,"lookup_type") = "C" then		
		field = "description"
	elseif dw_crit2.getitemstring(1,"lookup_type") = "A" then		
		field = "entity_name_original"
	end if		
	dw_v2.GetChild( field, dwchild )
	dwchild.SetTransObject( SQLCA )	
	dwchild.InsertRow( 1 )
	dw_v2.insertrow(1)
end if

if dw_crit3.getitemstring(1,"lookup_field") = "Y" then	
	if dw_crit3.getitemstring(1,"lookup_type") = "C" then		
		field = "description"
	elseif dw_crit3.getitemstring(1,"lookup_type") = "A" then		
		field = "entity_name_original"
	end if	
	dw_v3.GetChild( field, dwchild )
	dwchild.SetTransObject( SQLCA )	
	dwchild.InsertRow( 1 )
	dw_v3.insertrow(1)
end if

if dw_crit_update.getitemstring(1,"lookup_field") = "Y" then	
	if dw_crit_update.getitemstring(1,"lookup_type") = "C" then		
		field = "description"
	elseif dw_crit_update.getitemstring(1,"lookup_type") = "A" then		
		field = "entity_name_original"
	end if	
	dw_vupdate.GetChild( field, dwchild )
	dwchild.SetTransObject( SQLCA )	
	dwchild.InsertRow( 1 )
	dw_vupdate.insertrow(1)
end if
end subroutine

on w_batch_record_update.create
this.cb_ibatch=create cb_ibatch
this.st_7=create st_7
this.cb_syntax=create cb_syntax
this.cb_2=create cb_2
this.st_null3=create st_null3
this.st_null2=create st_null2
this.st_null1=create st_null1
this.cb_view_ver=create cb_view_ver
this.cb_view_audit=create cb_view_audit
this.cbx_1=create cbx_1
this.st_date4=create st_date4
this.sle_valueupdate=create sle_valueupdate
this.dw_vupdate=create dw_vupdate
this.ddlb_3=create ddlb_3
this.dw_crit3=create dw_crit3
this.dw_select=create dw_select
this.st_vers_found=create st_vers_found
this.st_rf=create st_rf
this.cb_view=create cb_view
this.st_8=create st_8
this.st_date3=create st_date3
this.st_date2=create st_date2
this.st_date1=create st_date1
this.dw_v3=create dw_v3
this.dw_v2=create dw_v2
this.dw_v1=create dw_v1
this.ddlb_2=create ddlb_2
this.ddlb_1=create ddlb_1
this.st_6=create st_6
this.dw_resp_code=create dw_resp_code
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_value3=create sle_value3
this.dw_crit_update=create dw_crit_update
this.dw_crit2=create dw_crit2
this.dw_crit1=create dw_crit1
this.sle_value2=create sle_value2
this.sle_value1=create sle_value1
this.dw_table=create dw_table
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_1=create cb_1
this.gb_7=create gb_7
this.gb_6=create gb_6
this.gb_5=create gb_5
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_verifs=create dw_verifs
this.dw_audit=create dw_audit
this.cb_update=create cb_update
this.Control[]={this.cb_ibatch,&
this.st_7,&
this.cb_syntax,&
this.cb_2,&
this.st_null3,&
this.st_null2,&
this.st_null1,&
this.cb_view_ver,&
this.cb_view_audit,&
this.cbx_1,&
this.st_date4,&
this.sle_valueupdate,&
this.dw_vupdate,&
this.ddlb_3,&
this.dw_crit3,&
this.dw_select,&
this.st_vers_found,&
this.st_rf,&
this.cb_view,&
this.st_8,&
this.st_date3,&
this.st_date2,&
this.st_date1,&
this.dw_v3,&
this.dw_v2,&
this.dw_v1,&
this.ddlb_2,&
this.ddlb_1,&
this.st_6,&
this.dw_resp_code,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_value3,&
this.dw_crit_update,&
this.dw_crit2,&
this.dw_crit1,&
this.sle_value2,&
this.sle_value1,&
this.dw_table,&
this.cb_3,&
this.cb_find,&
this.cb_1,&
this.gb_7,&
this.gb_6,&
this.gb_5,&
this.gb_4,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.dw_verifs,&
this.dw_audit,&
this.cb_update}
end on

on w_batch_record_update.destroy
destroy(this.cb_ibatch)
destroy(this.st_7)
destroy(this.cb_syntax)
destroy(this.cb_2)
destroy(this.st_null3)
destroy(this.st_null2)
destroy(this.st_null1)
destroy(this.cb_view_ver)
destroy(this.cb_view_audit)
destroy(this.cbx_1)
destroy(this.st_date4)
destroy(this.sle_valueupdate)
destroy(this.dw_vupdate)
destroy(this.ddlb_3)
destroy(this.dw_crit3)
destroy(this.dw_select)
destroy(this.st_vers_found)
destroy(this.st_rf)
destroy(this.cb_view)
destroy(this.st_8)
destroy(this.st_date3)
destroy(this.st_date2)
destroy(this.st_date1)
destroy(this.dw_v3)
destroy(this.dw_v2)
destroy(this.dw_v1)
destroy(this.ddlb_2)
destroy(this.ddlb_1)
destroy(this.st_6)
destroy(this.dw_resp_code)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_value3)
destroy(this.dw_crit_update)
destroy(this.dw_crit2)
destroy(this.dw_crit1)
destroy(this.sle_value2)
destroy(this.sle_value1)
destroy(this.dw_table)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_1)
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_verifs)
destroy(this.dw_audit)
destroy(this.cb_update)
end on

event open;//SQLCA.DBMS="ODBC"
//SQLCA.DbParm="ConnectString='DSN=IntelliCred Client;UID=DBA;PWD=SQL;',DelimitIdentifier='No'"
//	
//CONNECT USING SQLCA;
//
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Not Logged In", "Login Failed!")
//ELSE
//	MESSAGEBOX("","LOGIN OK")
//END IF
//

dw_table.settransobject(sqlca)
dw_table.retrieve()
dw_table.insertrow(1)
dw_resp_code.settransobject(sqlca)
dw_resp_code.retrieve()
dw_resp_code.insertrow(1)

st_date1.visible = false
st_date2.visible = false
st_date3.visible = false
st_date4.visible = false

is_user = gs_user_id

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;//disCONNECT USING SQLCA;
end event

type cb_ibatch from commandbutton within w_batch_record_update
integer x = 2784
integer y = 640
integer width = 494
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Save as IBatch"
end type

event clicked;integer res
string ls_bname
long ll_batch
long r
long nr
long pc

res = messagebox("IntelliBatch Save","This will allow you to save the retrieved practitioners in an IntelliBatch List.~rContinue?",question!,yesno!,1)

datawindowchild dwchild
datastore dw_batch_detail
datastore dw_batch_items

openwithparm(w_get_filter_name,"B")

ls_bname = message.stringparm

dw_batch_detail = create datastore
dw_batch_items = create datastore

dw_batch_detail.dataobject = "d_batch_list_detail"
dw_batch_items.dataobject = "d_batch_items_list"

select batch_id into :ll_batch from sys_batch_list where batch_name = :ls_bname;

if ll_batch > 0 then //batch name exists
	open(w_duplicate_name)
	if message.doubleparm = 2 then //resave
		return
	else  //update existing batch and delete list items
		dw_batch_detail.settransobject(sqlca)
		dw_batch_detail.retrieve(ll_batch)
		dw_batch_detail.setitem(1,"batch_name",ls_bname)
		dw_batch_detail.setitem(1,"last_mod",today())
		dw_batch_detail.setitem(1,"mod_by",gs_user_id)
		dw_batch_detail.setitem(1,"create_sql",is_search)
		delete from sys_batch_items where batch_id = :ll_batch; //delete the existing batch items
		commit using sqlca;
	end if
else //create new batch record
	dw_batch_detail.settransobject(sqlca)
	dw_batch_detail.insertrow(1)
	dw_batch_detail.setitem(1,"batch_name",ls_bname)
	dw_batch_detail.setitem(1,"last_mod",today())
	dw_batch_detail.setitem(1,"mod_by",gs_user_id)
	dw_batch_detail.setitem(1,"create_date",today())
	dw_batch_detail.setitem(1,"create_by",gs_user_id)
	dw_batch_detail.setitem(1,"create_sql",is_search)

	select max(batch_id) into :ll_batch from sys_batch_list;
	if isnull(ll_batch) or ll_batch < 1 then ll_batch = 0
	ll_batch++
	dw_batch_detail.setitem(1,"batch_id",ll_batch)
end if

res = dw_batch_detail.update()
if res < 1 then
	messagebox("Save Error","Unable to save batch")
	return -1
end if

//create the batch list items
dw_batch_items.settransobject(sqlca)
dw_batch_items.reset()
pc = dw_select.rowcount()
//messagebox("pc",pc)
for r = 1 to pc
	nr = dw_batch_items.insertrow(r)	
	dw_batch_items.setitem(nr,"batch_id",ll_batch)
	dw_batch_items.setitem(nr,"item_id",nr)
	dw_batch_items.setitem(nr,"prac_id",dw_select.getitemnumber(r,"prac_id"))
//	ist_search.ls_name[r] = lds_prac_list.getitemstring(r,"v_full_name_full_name")
next

res = dw_batch_items.update()
if res < 1 then
	messagebox("Save Error","Unable to save batch Items")
	return -1
end if
commit using sqlca;

DESTROY dw_batch_detail
DESTROY dw_batch_items


end event

type st_7 from statictext within w_batch_record_update
integer x = 3159
integer y = 2040
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event doubleclicked;cb_view_audit.visible = true
cb_view_ver.visible = true
end event

type cb_syntax from commandbutton within w_batch_record_update
integer x = 2784
integer y = 872
integer width = 494
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "View Syntax"
end type

event clicked;messagebox("Select syntax",is_search)
end event

type cb_2 from commandbutton within w_batch_record_update
integer x = 2784
integer y = 280
integer width = 494
integer height = 96
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reset Values"
end type

event clicked;dw_v1.reset()
dw_v2.reset()
dw_v3.reset()
dw_vupdate.reset()
sle_value1.text = ""
sle_value2.text = ""
sle_value3.text = ""
sle_valueupdate.text = ""
setnull(il_v1)
setnull(il_v2)
setnull(il_v3)
setnull(il_vup)
//ddlb_1.reset()
//ddlb_2.text = ""
//ddlb_3.text = ""
end event

type st_null3 from statictext within w_batch_record_update
boolean visible = false
integer x = 1637
integer y = 1196
integer width = 992
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = " Null"
boolean border = true
boolean focusrectangle = false
end type

type st_null2 from statictext within w_batch_record_update
boolean visible = false
integer x = 1637
integer y = 848
integer width = 992
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = " Null"
boolean border = true
boolean focusrectangle = false
end type

type st_null1 from statictext within w_batch_record_update
boolean visible = false
integer x = 1637
integer y = 536
integer width = 992
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean enabled = false
string text = " Null"
boolean border = true
boolean focusrectangle = false
end type

type cb_view_ver from commandbutton within w_batch_record_update
boolean visible = false
integer x = 2930
integer y = 1280
integer width = 402
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "View verif"
end type

event clicked;dw_verifs.visible = true
end event

type cb_view_audit from commandbutton within w_batch_record_update
boolean visible = false
integer x = 2930
integer y = 1144
integer width = 402
integer height = 108
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "View audit"
end type

event clicked;dw_audit.visible = true
end event

type cbx_1 from checkbox within w_batch_record_update
integer x = 274
integer y = 1972
integer width = 686
integer height = 76
integer taborder = 230
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Complete Verifications"
end type

event clicked;if this.checked = true then
	dw_resp_code.enabled = true

else
	dw_resp_code.enabled = false
	messagebox("Verification update","You have selected to not update existing incomplete verifications.  You will have to manually complete these verifications.")
end if
end event

type st_date4 from statictext within w_batch_record_update
integer x = 1600
integer y = 1544
integer width = 1074
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Dates must be entered as yyyy-mm-dd"
boolean focusrectangle = false
end type

type sle_valueupdate from singlelineedit within w_batch_record_update
integer x = 1637
integer y = 1628
integer width = 992
integer height = 92
integer taborder = 200
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type dw_vupdate from datawindow within w_batch_record_update
integer x = 1637
integer y = 1628
integer width = 992
integer height = 100
integer taborder = 300
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;il_vup = long(data)
if is_lookup_type = "C" then 
	select description into :is_lookup_val from code_lookup where lookup_code = :il_vup;		
else
	select entity_name into :is_lookup_val from address_lookup where lookup_code = :il_vup;
end if
		
end event

type ddlb_3 from dropdownlistbox within w_batch_record_update
integer x = 1221
integer y = 1196
integer width = 302
integer height = 368
integer taborder = 290
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"=","<",">","<>","<=",">=","is","is not"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if this.text = "is" or this.text = "is not" then
	st_null3.visible = true
	dw_v3.enabled = false
	sle_value3.enabled = false
else 
	st_null3.visible = false
	dw_v3.enabled = true
	sle_value3.enabled = true
end if

cb_update.enabled = false
end event

type dw_crit3 from datawindow within w_batch_record_update
integer x = 155
integer y = 1140
integer width = 951
integer height = 180
integer taborder = 140
string dataobject = "d_dddw_field_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer r

r = this.getclickedrow()
this.setrow(r)
this.selectrow(0,false)
this.selectrow(r,true)


cb_update.enabled = false
end event

event rowfocuschanged;datawindowchild dwchild
string ltable
string field
string d

if this.getitemstring(currentrow,"lookup_field") = "Y" then
	dw_v3.visible = true
	sle_value3.visible = false
	ltable = this.getitemstring(currentrow,"lookup_code")
	if this.getitemstring(currentrow,"lookup_type") = "C" then
		dw_v3.dataobject = "d_c_look"
		field = "description"
	elseif this.getitemstring(currentrow,"lookup_type") = "A" then
		dw_v3.dataobject = "d_a_look"
		field = "entity_name_original"
	end if
	dw_v3.settransobject(sqlca)
//	dw_v3.retrieve(ltable)
//	dw_v3.insertrow(1)
	dw_v3.GetChild( field, dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve(ltable)
	dwchild.InsertRow( 1 )
	dw_v3.insertrow(1)
else
	dw_v3.visible = false
	sle_value3.visible = true
	sle_value3.text = ""
end if

is_field3 = this.getitemstring(currentrow,"sys_fields_field_name")
d = this.getitemstring(currentrow,"sys_fields_field_type")
if d = "D" then 
	st_date3.visible = true
else
	st_date3.visible = false
end if
end event

type dw_select from datawindow within w_batch_record_update
boolean visible = false
integer y = 212
integer width = 3346
integer height = 564
integer taborder = 250
boolean bringtotop = true
boolean titlebar = true
string title = "Select Results -- Double click to hide"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

event doubleclicked;this.visible = false
end event

type st_vers_found from statictext within w_batch_record_update
integer x = 160
integer y = 1880
integer width = 869
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_rf from statictext within w_batch_record_update
integer x = 2738
integer y = 520
integer width = 626
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_view from commandbutton within w_batch_record_update
integer x = 2784
integer y = 756
integer width = 494
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "View Records"
end type

event clicked;dw_select.visible = true
end event

type st_8 from statictext within w_batch_record_update
integer x = 1312
integer y = 1644
integer width = 114
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "="
alignment alignment = center!
boolean focusrectangle = false
end type

type st_date3 from statictext within w_batch_record_update
integer x = 1595
integer y = 1116
integer width = 1061
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Dates must be entered as yyyy-mm-dd"
boolean focusrectangle = false
end type

type st_date2 from statictext within w_batch_record_update
integer x = 1600
integer y = 760
integer width = 1061
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Dates must be entered as yyyy-mm-dd"
boolean focusrectangle = false
end type

type st_date1 from statictext within w_batch_record_update
integer x = 1595
integer y = 452
integer width = 1061
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Dates must be entered as yyyy-mm-dd"
boolean focusrectangle = false
end type

type dw_v3 from datawindow within w_batch_record_update
integer x = 1637
integer y = 1196
integer width = 992
integer height = 100
integer taborder = 280
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;il_v3 = long(data)
cb_update.enabled = false
end event

type dw_v2 from datawindow within w_batch_record_update
integer x = 1637
integer y = 848
integer width = 992
integer height = 100
integer taborder = 90
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;il_v2 = long(data)

cb_update.enabled = false
end event

type dw_v1 from datawindow within w_batch_record_update
integer x = 1637
integer y = 532
integer width = 992
integer height = 100
integer taborder = 40
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;il_v1 = long(data)

cb_update.enabled = false
end event

type ddlb_2 from dropdownlistbox within w_batch_record_update
integer x = 1221
integer y = 856
integer width = 302
integer height = 368
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"=","<",">","<>","<=",">=","is","is not"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if this.text = "is" or this.text = "is not" then
	st_null2.visible = true
	dw_v2.enabled = false
	sle_value2.enabled = false
else 
	st_null2.visible = false
	dw_v2.enabled = true
	sle_value2.enabled = true
end if

cb_update.enabled = false
end event

type ddlb_1 from dropdownlistbox within w_batch_record_update
integer x = 1221
integer y = 536
integer width = 302
integer height = 368
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"=","<",">","<>","<=",">=","is","is not"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;if this.text = "is" or this.text = "is not" then
	st_null1.visible = true
	dw_v1.enabled = false
	sle_value1.enabled = false
else 
	st_null1.visible = false
	dw_v1.enabled = true
	sle_value1.enabled = true
end if
	
	cb_update.enabled = false
end event

type st_6 from statictext within w_batch_record_update
integer x = 1161
integer y = 1972
integer width = 434
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Response Code"
boolean focusrectangle = false
end type

type dw_resp_code from datawindow within w_batch_record_update
integer x = 1655
integer y = 1960
integer width = 910
integer height = 76
integer taborder = 210
string dataobject = "d_verif_batch"
boolean border = false
boolean livescroll = true
end type

event itemchanged;il_resps = long(data)
end event

type st_5 from statictext within w_batch_record_update
integer x = 1920
integer y = 392
integer width = 247
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Value"
boolean focusrectangle = false
end type

type st_4 from statictext within w_batch_record_update
integer x = 1248
integer y = 436
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Operator"
boolean focusrectangle = false
end type

type st_3 from statictext within w_batch_record_update
integer x = 366
integer y = 404
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Field"
boolean focusrectangle = false
end type

type st_2 from statictext within w_batch_record_update
integer x = 1957
integer y = 1480
integer width = 247
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Value"
boolean focusrectangle = false
end type

type st_1 from statictext within w_batch_record_update
integer x = 325
integer y = 1484
integer width = 247
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Field"
boolean focusrectangle = false
end type

type sle_value3 from singlelineedit within w_batch_record_update
integer x = 1637
integer y = 1200
integer width = 983
integer height = 92
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;cb_update.enabled = false
end event

type dw_crit_update from datawindow within w_batch_record_update
integer x = 155
integer y = 1552
integer width = 946
integer height = 244
integer taborder = 170
string dataobject = "d_dddw_field_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer r

r = this.getclickedrow()
this.setrow(r)
this.selectrow(0,false)
this.selectrow(r,true)
end event

event rowfocuschanged;datawindowchild dwchild
string ltable
string field
string d

if this.getitemstring(currentrow,"lookup_field") = "Y" then
	dw_vupdate.visible = true
	sle_valueupdate.visible = false
	ltable = this.getitemstring(currentrow,"lookup_code")
	if this.getitemstring(currentrow,"lookup_type") = "C" then
		dw_vupdate.dataobject = "d_c_look"
		field = "description"
		is_lookup_type = "C"
	elseif this.getitemstring(currentrow,"lookup_type") = "A" then
		dw_vupdate.dataobject = "d_a_look"
		field = "entity_name_original"
		is_lookup_type = "A"
	end if
	dw_vupdate.settransobject(sqlca)
//	dw_vupdate.retrieve(ltable)
//	dw_vupdate.insertrow(1)
	dw_vupdate.GetChild( field, dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve(ltable)
	dwchild.InsertRow( 1 )
	dw_vupdate.insertrow(1)
else
	is_lookup_type = "N"
	dw_vupdate.visible = false
	sle_valueupdate.visible = true
	sle_valueupdate.text = ""
end if

is_fieldup = this.getitemstring(currentrow,"sys_fields_field_name")
il_upfield_sysid = this.getitemnumber(currentrow,"sys_fields_field_id")
d = this.getitemstring(currentrow,"sys_fields_field_type")
if d = "D" then 
	st_date4.visible = true
else
	st_date4.visible = false
end if
end event

type dw_crit2 from datawindow within w_batch_record_update
integer x = 155
integer y = 792
integer width = 951
integer height = 204
integer taborder = 50
string dataobject = "d_dddw_field_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer r

r = this.getclickedrow()
this.setrow(r)
this.selectrow(0,false)
this.selectrow(r,true)


cb_update.enabled = false
end event

event rowfocuschanged;datawindowchild dwchild
string ltable
string field
string d

if this.getitemstring(currentrow,"lookup_field") = "Y" then
	dw_v2.visible = true
	sle_value2.visible = false
	ltable = this.getitemstring(currentrow,"lookup_code")
	if this.getitemstring(currentrow,"lookup_type") = "C" then
		dw_v2.dataobject = "d_c_look"
		field = "description"
	elseif this.getitemstring(currentrow,"lookup_type") = "A" then
		dw_v2.dataobject = "d_a_look"
		field = "entity_name_original"
	end if
	dw_v2.settransobject(sqlca)
//	dw_v2.retrieve(ltable)
//	dw_v2.insertrow(1)
	dw_v2.GetChild( field, dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve(ltable)
	dwchild.InsertRow( 1 )
	dw_v2.insertrow(1)
else
	dw_v2.visible = false
	sle_value2.visible = true
	sle_value2.text = ""
end if

is_field2 = this.getitemstring(currentrow,"sys_fields_field_name")
d = this.getitemstring(currentrow,"sys_fields_field_type")
if d = "D" then 
	st_date2.visible = true
else
	st_date2.visible = false
end if
end event

type dw_crit1 from datawindow within w_batch_record_update
integer x = 155
integer y = 476
integer width = 955
integer height = 180
integer taborder = 20
string dataobject = "d_dddw_field_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer r

r = this.getclickedrow()
this.setrow(r)
this.selectrow(0,false)
this.selectrow(r,true)


cb_update.enabled = false
end event

event rowfocuschanged;datawindowchild dwchild
string ltable
string field
string d

if this.getitemstring(currentrow,"lookup_field") = "Y" then
	dw_v1.visible = true
	sle_value1.visible = false
	ltable = this.getitemstring(currentrow,"lookup_code")
	if this.getitemstring(currentrow,"lookup_type") = "C" then
		dw_v1.dataobject = "d_c_look"
		field = "description"
	elseif this.getitemstring(currentrow,"lookup_type") = "A" then
		dw_v1.dataobject = "d_a_look"
		field = "entity_name_original"
	end if
	dw_v1.settransobject(sqlca)
	//dw_v1.retrieve()
	dw_v1.GetChild( field, dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve(ltable)
	dwchild.InsertRow( 1 )
	dw_v1.insertrow(1)
else
	dw_v1.visible = false
	sle_value1.visible = true
	sle_value1.text = ""
end if

is_field1 = this.getitemstring(currentrow,"sys_fields_field_name")
d = this.getitemstring(currentrow,"sys_fields_field_type")
if d = "D" then 
	st_date1.visible = true
else
	st_date1.visible = false
end if
end event

type sle_value2 from singlelineedit within w_batch_record_update
integer x = 1637
integer y = 852
integer width = 992
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;cb_update.enabled = false
end event

type sle_value1 from singlelineedit within w_batch_record_update
integer x = 1646
integer y = 536
integer width = 978
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;cb_update.enabled = false
end event

type dw_table from datawindow within w_batch_record_update
integer x = 155
integer y = 88
integer width = 1088
integer height = 92
integer taborder = 10
string dataobject = "d_table_list"
boolean border = false
boolean livescroll = true
end type

event itemchanged;integer ii_screen
integer r
string find
datawindowchild dwchild

ii_screen = integer(data)
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.18.2006 By: Jack (Inova)
//$<reason> Required Documents Check Box on Data Entry Screen.
il_screen_id = ii_screen
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 02.20.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 02.20.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Insert an empty row to prevent the RowFocusChanged event from being triggered by Retrieve.
//$<modification> Due to the usage of Appeon Queue labels, RosFocusChanged will be triggered by Retrieve, which
//$<modification> is incorrect. RowFocusChanged should be triggered after the retrival.  Therefore add 
//$<modification> an empty row to prevent the RowFocusChanged event from being triggered by Retrieve.

/*
//messagebox("",ii_screen)
dw_crit1.settransobject(sqlca)
dw_crit1.retrieve(ii_screen)
//dw_crit1.GetChild( "data_view_fields_screen_id", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve(ii_screen)
//messagebox("crit1",ii_screen)
//dw_crit1.retrieve(ii_screen)
//dw_crit1.InsertRow( 1 )

dw_crit2.settransobject(sqlca)
dw_crit2.retrieve(ii_screen)
dw_crit3.settransobject(sqlca)
dw_crit3.retrieve(ii_screen)
//dw_crit2.GetChild( "data_view_fields_screen_id", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve(ii_screen)
//dw_crit2.InsertRow( 1 )
//
//
dw_crit_update.settransobject(sqlca)
dw_crit_update.retrieve(ii_screen)
//dw_crit_update.GetChild( "data_view_fields_screen_id", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve(ii_screen)
//dwchild.InsertRow( 1 )
//
*/

dw_crit1.settransobject(sqlca)
dw_crit1.insertrow(1)
dw_crit1.retrieve(ii_screen)

dw_crit2.settransobject(sqlca)
dw_crit2.insertrow(1)
dw_crit2.retrieve(ii_screen)

dw_crit3.settransobject(sqlca)
dw_crit3.insertrow(1)
dw_crit3.retrieve(ii_screen)

dw_crit_update.settransobject(sqlca)
dw_crit_update.insertrow(1)
dw_crit_update.retrieve(ii_screen)

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 02.20.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<add> 02.20.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance. 

gnv_appeondb.of_startqueue( )

dw_crit1.trigger event rowfocuschanged(dw_crit1.getrow())
dw_crit2.trigger event rowfocuschanged(dw_crit2.getrow())
dw_crit3.trigger event rowfocuschanged(dw_crit3.getrow())
dw_crit_update.trigger event rowfocuschanged(dw_crit_update.getrow())
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<add> 02.20.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

of_insert_row()
//---------------------------- APPEON END ----------------------------

find = "screen_id = " + data
//messagebox("",find)
r = dw_table.find(find,1,dw_table.rowcount())
//messagebox("r",r)
is_table = dw_table.getitemstring(r,"sys_tables_table_name")
//messagebox("",is_table)
cb_find.enabled = false
cb_update.enabled = false
cb_find.enabled = true
end event

event doubleclicked;//integer is_screen
//integer r
//string find
//
//
//is_screen = this.getitemnumber(row,"data_view_screen_screen_id")
//messagebox("",is_screen)
//dw_crit1.settransobject(sqlca)
////messagebox("crit1",is_screen)
//dw_crit1.retrieve(is_screen)
//
//dw_crit2.settransobject(sqlca)
////messagebox("crit2",is_screen)
//dw_crit2.retrieve(is_screen)
//
//dw_crit_update.settransobject(sqlca)
////messagebox("crit3",is_screen)
//dw_crit_update.retrieve(is_screen)
//
//
//is_table = this.getitemstring(row,"sys_tables_table_name")
//
//messagebox("",is_table)
//
//cb_find.enabled = true
end event

type cb_3 from commandbutton within w_batch_record_update
integer x = 2779
integer y = 24
integer width = 494
integer height = 96
integer taborder = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;CLOSE(PARENT)
end event

type cb_find from commandbutton within w_batch_record_update
integer x = 2784
integer y = 396
integer width = 494
integer height = 96
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "(3) Find Records"
end type

event clicked;string ls_field1
string ls_ftype1
string ls_op1
string ls_val1
string ls_search
string ls_table
string syn
date ld_v1
datetime ldt_v2
string ls_field2
string ls_op2
string ls_val2
string ls_ftype2
string ls_dwsyntax_str
datetime ldt_v3
string ls_field3
string ls_op3
string ls_val3
string ls_ftype3
string ls_presentation_str
string ls_where1
string ls_where2
string ls_where3
string errors
integer rc
integer vc = 0
long lla_recs[]
integer i


ls_table = is_table
ls_field1 = is_field1

//debugbreak()
//first criteria
ls_op1 = ddlb_1.text
//messagebox("ls_field1",ls_field1)
if sle_value1.visible = true then
	ls_val1 = sle_value1.text
else
	ls_val1 = string(il_v1)
end if

if upper(ls_op1) = "IS" or upper(ls_op1) = "IS NOT" then ls_val1 = 'Null'
//messagebox("ls_val1",ls_val1)

if ls_op1  = "" then 
	messagebox("Select Error","No operator for criteria 1")
	return
end if
if ls_val1 = "" then
	messagebox("Select Error","No value for criteria 1")
	return
end if

ls_ftype1 = dw_crit1.getitemstring(dw_crit1.getrow(),"sys_fields_field_type")
ls_ftype2 = dw_crit2.getitemstring(dw_crit2.getrow(),"sys_fields_field_type")
ls_ftype3 = dw_crit3.getitemstring(dw_crit3.getrow(),"sys_fields_field_type")

if upper(ls_val1) = "NULL" then ls_ftype1 = "N"
choose case ls_ftype1
	case "I","N"
		ls_where1  = " where " + is_field1 + " " + ls_op1 + " " + ls_val1
	case "D"
		ls_val1 = ls_val1 + " 00:00:00"
		//messagebox("ldt_v1",ls_val1)
		ls_where1  = " where " + is_field1 + " " + ls_op1 + " " + "'" + ls_val1 + "' "
	Case "C"
		ls_where1  = " where " + is_field1 + " " + ls_op1 + " '" + ls_val1 + "'"
end choose

//second criteria
if sle_value2.visible = true then
	ls_val2 = sle_value2.text
else
	ls_val2 = string(il_v2)
end if

ls_field2 = is_field2
ls_op2 = ddlb_2.text

if upper(ls_op2) = "IS" or upper(ls_op2) = "IS NOT" then ls_val2 = 'Null'

if ls_op2  = "" or ls_val2 = "" then
	is_where = ls_where1
	
else
	if upper(ls_val2) = "NULL" then ls_ftype2 = "N"
//	messagebox("","2 check")
	choose case ls_ftype2
		case "I","N"
			ls_where2  = is_field2 + " " + ls_op2 + " " + ls_val2
		case "D"
			//ldt_v2 = datetime(date(ls_val2))  
			ls_val2 = ls_val2 + " 00:00:00"
			ls_where2  = is_field2 + " " + ls_op2 + " " + "'" + ls_val2 + "' "
		Case "C"
			ls_where2  = is_field2 + " " + ls_op2 + " '" + ls_val2 + "'"
	end choose
		is_where  = ls_where1 + " and " + ls_where2
end if


ls_search = "Select * from " + is_table
 
ls_search = ls_search + is_where
//messagebox("ls_search",ls_search)


//third criteria
if sle_value3.visible = true then
	ls_val3 = sle_value3.text
else
	ls_val3 = string(il_v3)
end if

ls_field3 = is_field3
ls_op3 = ddlb_3.text
if upper(ls_op3) = "IS" or upper(ls_op3) = "IS NOT" then ls_val3 = 'Null'

if ls_op3  = "" or ls_val3 = "" then
	is_where = is_where
else

	if upper(ls_val3) = "NULL" then ls_ftype3 = "N"
	choose case ls_ftype3
		case "I","N"
			ls_where3  = is_field3 + " " + ls_op3 + " " + ls_val3
		case "D"
			//ldt_v2 = datetime(date(ls_val2))  
			ls_val3 = ls_val3 + " 00:00:00"
			ls_where3  = is_field3 + " " + ls_op3 + " " + "'" + ls_val3 + "' "
		Case "C"
			ls_where3  = is_field3 + " " + ls_op3 + " '" + ls_val3 + "'"
	end choose
		is_where  = is_where + " and " + ls_where3
end if


ls_search = "Select * from " + is_table
 
ls_search = ls_search + is_where
//messagebox("ls_search",ls_search)




syn = ls_search
is_search = ls_search

dw_select.Reset()
dw_select.DataObject = ''

//ls_grey = 
//ls_white = 
ls_presentation_str = "style( type=group )" + " Column(Border=0) Datawindow(Color=" + String(rgb(255,255,255)) + " )" + "Text(Border=6 Background.Color=" + String(rgb(192,192,192)) + ")"

//messagebox("", ls_presentation_str)
ls_dwsyntax_str = SQLCA.SyntaxFromSQL(syn, &
	ls_presentation_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"SyntaxFromSQL caused these errors: " + ERRORS)
	RETURN -1
END IF



dw_select.Create( ls_dwsyntax_str, ERRORS)

IF Len(ERRORS) > 0 THEN
	MessageBox("Caution", &
	"Create cause these errors: " + ERRORS)
	RETURN -1
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.05.2006 By: Cao YongWang
//$<reason> Fix a defect for using JConnect JDBC driver in web application.
dw_select.modify("datawindow.table.UpdateWhere=0")
//---------------------------- APPEON END ----------------------------

dw_select.settransobject(sqlca)
rc = dw_select.retrieve()

if rc > 0 then
	cb_ibatch.enabled = true
	cb_update.enabled = true
	cb_view.enabled = true
end if
cb_syntax.enabled = true
st_rf.text = "Records found: " + string(rc)

for i = 1 to rc
	lla_recs[i] = dw_select.getitemnumber(i,"rec_id")
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.18.2006 By: Jack (Inova)
	//$<reason> Required Documents Check Box on Data Entry Screen.
	il_prac_id[i] = dw_select.getitemnumber(i,'prac_id')
	il_rec_id[i] = dw_select.getitemnumber(i,'rec_id')
	//---------------------------- APPEON END ----------------------------
next

dw_verifs.settransobject(sqlca)
if rc > 0 then vc = dw_verifs.retrieve(lla_recs)
st_vers_found.text = "Verifications found: " + string(vc)
end event

type cb_1 from commandbutton within w_batch_record_update
integer x = 2779
integer y = 148
integer width = 494
integer height = 96
integer taborder = 310
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "About"
end type

event clicked;messagebox("To operate this function :","(1) Select a Data entry screen from the Select Table dropdown. ~r(2) Select the field name, the operator type, and the criteria value for the records you wish to update. You can set 1 - 3  criteria. ~r(3) Click FIND RECORDS to retrieve the records to be updated.  You can view the retrieved records by clicking the VIEW RESULTS button.~r(4) Select the field you wish to update and set the update value.  ~r(5) Select the Response code for the related Verification records.~r(6) Click UPDATE.~r~r Note: If update verifications is selected all incomplete verifications connected with the retrieved records will be updated the selected response code, the user name and todays date.  VIEW SYNTAX will allow you to view the SQL being generated.")
end event

type gb_7 from groupbox within w_batch_record_update
integer x = 128
integer y = 1036
integer width = 2551
integer height = 304
integer taborder = 260
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criteria 3"
end type

type gb_6 from groupbox within w_batch_record_update
integer x = 123
integer y = 320
integer width = 2560
integer height = 376
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criteria 1"
end type

type gb_5 from groupbox within w_batch_record_update
integer x = 133
integer y = 696
integer width = 2551
integer height = 340
integer taborder = 270
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criteria 2"
end type

type gb_4 from groupbox within w_batch_record_update
integer x = 1079
integer y = 1888
integer width = 1637
integer height = 192
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "(5) Select response code for Verifications update"
end type

type gb_3 from groupbox within w_batch_record_update
integer x = 91
integer y = 12
integer width = 1271
integer height = 208
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "(1) Select Table"
end type

type gb_2 from groupbox within w_batch_record_update
integer x = 96
integer y = 1416
integer width = 2624
integer height = 460
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "(4) Set Update Value"
end type

type gb_1 from groupbox within w_batch_record_update
integer x = 87
integer y = 252
integer width = 2629
integer height = 1132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 80269524
string text = "(2) Set Filter Criteria for Records to be Updated"
end type

type dw_verifs from datawindow within w_batch_record_update
boolean visible = false
integer x = 46
integer y = 1360
integer width = 3291
integer height = 564
boolean bringtotop = true
boolean titlebar = true
string title = "double click to hide"
string dataobject = "d_verif_update"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;this.visible = false
end event

type dw_audit from datawindow within w_batch_record_update
boolean visible = false
integer x = 46
integer y = 772
integer width = 3282
integer height = 584
integer taborder = 80
boolean bringtotop = true
boolean titlebar = true
string title = "double click to hide"
string dataobject = "d_audit_update_batch"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;this.visible = false
end event

type cb_update from commandbutton within w_batch_record_update
integer x = 2784
integer y = 1940
integer width = 494
integer height = 96
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "(6) Update"
end type

event clicked;string ls_fieldup
string ls_ftype3
string ls_valup
string ls_search
string ls_table
date ld_valup
string ls_where
long i
long v
long vc
long ll_pracid
long ll_rec
long ll_field 
long ll_table 
Long ll_seq
long a 
long ac
string old_val
string new_val
string datetest
string ls_up_look_val
integer res
integer li_reftest = 0
integer li_getref1
integer li_getref2
integer li_pos //maha 011404
integer li_refcnt = 0 //maha 011404
string org_ref //maha 011404
string new_ref //maha 011404
string ls_lookup_type //maha 011504
string ls_fld_type  //maha 011504
string ls_desc  //maha 011504
long ll_lucode
string ls_lookup_field //maha 011504
string ls_lookup_name //maha 011504

 ll_field = dw_crit_update.getitemnumber(dw_crit_update.getrow(),"sys_fields_field_id")
 ll_table = dw_crit_update.getitemnumber(dw_crit_update.getrow(),"sys_fields_table_id")

if cbx_1.checked = true then
	if il_resps < 1 or isnull(il_resps) then
		messagebox("Response Code","You must select a response code to update verifications")
		return
	end if
else
	res = messagebox("Verifications","You have selected to not Complete verifications.  If you continue you will have to complete them manually.  Do you wish to continue?",question!,yesno!,2)
	if res = 2 then	return

end if

ls_table = is_table
ls_fieldup = is_fieldup
if sle_valueupdate.visible = true then
	ls_valup = sle_valueupdate.text
else
	ls_valup = string(il_vup)
end if

if isnull(ls_valup) or ls_valup = "" then
	res = messagebox("Value","No value set. Do you wish to update with a null value?",question!,yesno!,2)
	if res = 1 then 
		ls_valup = "null"
	else
		return
	End if
end if

if dw_vupdate.visible = true and  ls_valup = "0" then //maha 080802 for lookup values set to null.
	res = messagebox("Value","No lookup value set. Do you wish to update with a null value?",question!,yesno!,2)
	if res = 1 then 
		ls_valup = "null"
	else
		return
	End if
end if

ls_search = "Update " + is_table + " set " + is_fieldup + " = "  + ls_valup + " " + is_where
//messagebox("ls_search",ls_search)
ls_ftype3 = dw_crit_update.getitemstring(dw_crit_update.getrow(),"sys_fields_field_type")
if ls_ftype3 = "D" then
	datetest = ls_valup + " 00:00:00"
	ld_valup = date( ls_valup)
	//messagebox("ld_valup",string(ld_valup))
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<add> 02.20.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

datastore lds_sys_audit

lds_sys_audit = create datastore
lds_sys_audit.dataobject = 'd_sys_audit_for_pt'
lds_sys_audit.settransobject(sqlca)

gnv_appeondb.of_startqueue( )

//---------------------------- APPEON END ----------------------------

lds_sys_audit.retrieve()
select reference_field_1 into :li_getref1 from data_view_screen where data_view_id = 1 and table_id = :ll_table;
select reference_field_2 into :li_getref2 from data_view_screen where data_view_id = 1 and table_id = :ll_table;

select field_type into :ls_fld_type from sys_fields where field_id = :ll_field;
select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field;
select lookup_field into :ls_lookup_field from sys_fields where field_id = :ll_field;
select lookup_field_name into :ls_lookup_name from sys_fields where field_id = :ll_field;

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<add> 02.20.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<modify> 02.10.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.

/*
for i = 1 to dw_select.rowcount()
	if upper(ls_valup) = "NULL" then 
		setnull(ls_valup)
		setnull(ld_valup)
	end if
	ll_rec = dw_select.getitemnumber(i,"rec_id")
	ll_pracid = dw_select.getitemnumber(i,"prac_id")
	dw_audit.insertrow(i)
	dw_audit.setitem(i,"rec_id",ll_rec)
	dw_audit.setitem(i,"prac_id",ll_pracid)
	
	choose case ls_ftype3
		case "I","N"
			old_val = string(dw_select.getitemnumber(i,is_fieldup))
			dw_select.setitem(i,is_fieldup,long(ls_valup))
		case "D"
			old_val = string(dw_select.getitemdatetime(i,is_fieldup))
			dw_select.setitem(i,is_fieldup,ld_valup)
		Case "C"
			old_val = dw_select.getitemstring(i,is_fieldup)			
			dw_select.setitem(i,is_fieldup,ls_valup)		
	end choose
	select max(seq_no) into :ll_seq from sys_audit where rec_id = :ll_rec and field_id = :ll_field;
	if ll_seq < 1  or isnull(ll_seq)then ll_seq = 0
	ll_seq++
	dw_audit.setitem(i,"seq_no",ll_seq)
	dw_audit.setitem(i,"table_id",ll_table)
	dw_audit.setitem(i,"field_id",ll_field)
	dw_audit.setitem(i,"old_value",old_val)
	dw_audit.setitem(i,"new_value",ls_valup)
	dw_audit.setitem(i,"user_id",gs_user_id)
	dw_audit.setitem(i,"date_time_modified",datetime(today(),now()))
	dw_audit.setitem(i,"audit_type","B")
next

vc = dw_verifs.rowcount()
	//messagebox("",vc)

 //complete corresponding verifications.
if cbx_1.checked = true then
	
	for v = 1 to vc
		if isnull(dw_verifs.getitemnumber(v,"response_code")) then
			dw_verifs.setitem(v,"response_code",il_resps)
			dw_verifs.setitem(v,"date_recieved",today())
			dw_verifs.setitem(v,"user_name",gs_user_id)
			dw_verifs.setitem(v,"print_flag",0)	
			if dw_verifs.getitemnumber(v,"exp_credential_flag") = 1 then
				dw_verifs.setitem(v,"exp_credential_flag",0)
			end if
		end if
	next
end if	
//if updating exp dates, be sure to update corresponding verifications.	
for v = 1 to vc
	if is_fieldup = "coverage_to" or is_fieldup = "expiration_date" or is_fieldup = "exp_date" then
		//datetest = string(datetime(date( ls_valup),time("00:00:00"))))
		dw_verifs.setitem(v,"expiration_date",datetime(date( ls_valup)))
	end if
	if is_fieldup = "certification_expires" then
		dw_verifs.setitem(v,"expiration_date",datetime(date(integer(ls_valup),12,30)))
	end if		
next

//if updating a reference value, be sure to update corresponding verifications.
//1)get the reference values
//2) check to see if the update field is one of the reference fields
//3) if so get the new value
//4) update the verifications

select reference_field_1 into :li_getref1 from data_view_screen where data_view_id = 1 and table_id = :ll_table;
select reference_field_2 into :li_getref2 from data_view_screen where data_view_id = 1 and table_id = :ll_table;

if ll_field = li_getref1 then //does first ref field match
	li_reftest = 1 
end if
if ll_field = li_getref2 then //does second ref field match
	li_reftest = 2
end if


if li_reftest > 0 then //if a reference field then check 
	select field_type into :ls_fld_type from sys_fields where field_id = :ll_field;
	select lookup_type into :ls_lookup_type from sys_fields where field_id = :ll_field;
	select lookup_field into :ls_lookup_field from sys_fields where field_id = :ll_field;
	select lookup_field_name into :ls_lookup_name from sys_fields where field_id = :ll_field;
	if ls_lookup_field = "Y" then
		ll_lucode = long(ls_valup)
		if ls_lookup_type = "C" then
			if upper(mid(ls_lookup_name,1,1)) = "D" then
				select description into :ls_desc from code_lookup where lookup_code = :ll_lucode;
			else
				select code into :ls_desc from code_lookup where lookup_code = :ll_lucode;
			end if
		elseif ls_lookup_type = "A" then
			if upper(mid(ls_lookup_name,1,1)) = "E" then
				select entity_name into :ls_desc from address_lookup where lookup_code = :ll_lucode;
			else
				select code into :ls_desc from address_lookup where lookup_code = :ll_lucode;
			end if
		end if
		ls_valup = ls_desc

	end if
*/

for i = 1 to dw_select.rowcount()
	if upper(ls_valup) = "NULL" then 
		setnull(ls_valup)
		setnull(ld_valup)
	end if
	ll_rec = dw_select.getitemnumber(i,"rec_id")
	ll_pracid = dw_select.getitemnumber(i,"prac_id")
	dw_audit.insertrow(i)
	dw_audit.setitem(i,"rec_id",ll_rec)
	dw_audit.setitem(i,"prac_id",ll_pracid)
	
	choose case ls_ftype3
		case "I","N"
			old_val = string(dw_select.getitemnumber(i,is_fieldup))
			dw_select.setitem(i,is_fieldup,long(ls_valup))
		case "D"
			old_val = string(dw_select.getitemdatetime(i,is_fieldup))
			dw_select.setitem(i,is_fieldup,ld_valup)
		Case "C"
			old_val = dw_select.getitemstring(i,is_fieldup)			
			dw_select.setitem(i,is_fieldup,ls_valup)		
	end choose
	lds_sys_audit.setfilter('rec_id='+string(ll_rec)+' and field_id='+string(ll_field))
	lds_sys_audit.filter()
	lds_sys_audit.setsort('seq_no D')
	lds_sys_audit.sort()
	long ll_rows
	ll_rows = lds_sys_audit.rowcount()
	if ll_rows>0 then
		ll_seq = lds_sys_audit.getitemnumber(1,'seq_no')
	else
		ll_seq = 0
	end if	
	if ll_seq < 1  or isnull(ll_seq) then ll_seq = 0
	ll_seq++
	dw_audit.setitem(i,"seq_no",ll_seq)
	dw_audit.setitem(i,"table_id",ll_table)
	dw_audit.setitem(i,"field_id",ll_field)
	dw_audit.setitem(i,"old_value",old_val)
	dw_audit.setitem(i,"new_value",ls_valup)
	dw_audit.setitem(i,"user_id",gs_user_id)
	dw_audit.setitem(i,"date_time_modified",datetime(today(),now()))
	dw_audit.setitem(i,"audit_type","B")
next

vc = dw_verifs.rowcount()
	//messagebox("",vc)

 //complete corresponding verifications.
if cbx_1.checked = true then
	
	for v = 1 to vc
		if isnull(dw_verifs.getitemnumber(v,"response_code")) then
			dw_verifs.setitem(v,"response_code",il_resps)
			dw_verifs.setitem(v,"date_recieved",today())
			dw_verifs.setitem(v,"user_name",gs_user_id)
			dw_verifs.setitem(v,"print_flag",0)	
			if dw_verifs.getitemnumber(v,"exp_credential_flag") = 1 then
				dw_verifs.setitem(v,"exp_credential_flag",0)
			end if
		end if
	next
end if	
//if updating exp dates, be sure to update corresponding verifications.	
for v = 1 to vc
	if is_fieldup = "coverage_to" or is_fieldup = "expiration_date" or is_fieldup = "exp_date" then
		//datetest = string(datetime(date( ls_valup),time("00:00:00"))))
		dw_verifs.setitem(v,"expiration_date",datetime(date( ls_valup)))
	end if
	if is_fieldup = "certification_expires" then
		dw_verifs.setitem(v,"expiration_date",datetime(date(integer(ls_valup),12,30)))
	end if		
next

//if updating a reference value, be sure to update corresponding verifications.
//1)get the reference values
//2) check to see if the update field is one of the reference fields
//3) if so get the new value
//4) update the verifications

if ll_field = li_getref1 then //does first ref field match
	li_reftest = 1 
end if
if ll_field = li_getref2 then //does second ref field match
	li_reftest = 2
end if


if li_reftest > 0 then //if a reference field then check 
	if ls_lookup_field = "Y" then
		ll_lucode = long(ls_valup)
		if ls_lookup_type = "C" then
			if upper(mid(ls_lookup_name,1,1)) = "D" then
				//select description into :ls_desc from code_lookup where lookup_code = :ll_lucode;
				ls_desc = gnv_data.of_getitem("code_lookup" , "description" , "lookup_code="+string(ll_lucode))
			else
				//select code into :ls_desc from code_lookup where lookup_code = :ll_lucode;
				ls_desc = gnv_data.of_getitem("code_lookup" , "code" , "lookup_code="+string(ll_lucode))
			end if
		elseif ls_lookup_type = "A" then
			if upper(mid(ls_lookup_name,1,1)) = "E" then
				select entity_name into :ls_desc from address_lookup where lookup_code = :ll_lucode;
			else
				select code into :ls_desc from address_lookup where lookup_code = :ll_lucode;
			end if
		end if
		ls_valup = ls_desc

	end if
destroy lds_sys_audit
//---------------------------- APPEON END ----------------------------


//&*&*&*&*&*&&*&*&*&*&*&*&*&*&*&*&	
	if isnull(ls_valup) or ls_valup = "" then
		messagebox("reference error","Unable to update verification references")
	else
		for v = 1 to vc
			org_ref = dw_verifs.getitemstring(v,"reference_value")
			li_pos = pos(org_ref," - ",1)
			if li_reftest = 1 then
				new_ref = ls_valup + mid(org_ref, li_pos )
			elseif li_reftest = 2 then
				new_ref = mid(org_ref,1, li_pos + 2 ) + ls_valup
			end if
			dw_verifs.setitem(v,"reference_value",new_ref)
		next
	end if
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.18.2006 By: Jack (Inova)
//$<reason> Required Documents Check Box on Data Entry Screen.
pfc_cst_nv_data_entry_functions lnv_data_entry

lnv_data_entry = create pfc_cst_nv_data_entry_functions
lnv_data_entry.of_create_application_audit_record('Modified',il_prac_id,il_screen_id,il_rec_id,new_ref)
destroy lnv_data_entry

//---------------------------- APPEON END ----------------------------

SQLCA.AutoCommit = false
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<add> 02.10.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Update label to reduce client-server interactions to improve runtime performance.

/*
if	dw_select.update() = 1 then
	dw_audit.settransobject(sqlca)
	if	dw_audit.update() = 1 then
		if dw_verifs.update() = 1 then
			commit using sqlca;
			messagebox("Save","Update Complete")
		else
			rollback using sqlca;
			messagebox("Save Error","Unable to Update Verifications.  Save not made")
			return
		end if
	else
		rollback using sqlca;
		messagebox("Save Error","Unable to Update Audit table.  Save not made")
		return
	end if
else
	rollback using sqlca;
	messagebox("Save Error","Unable to Update dw_verifs.  Save not made")
	return
end if
*/

long ll_return
dw_audit.settransobject(sqlca)
ll_return=gnv_appeondb.of_update(dw_select,dw_audit,dw_verifs)
choose case ll_return
	case 1 
		messagebox("Save","Update Complete")
	case 103		
		messagebox("Save Error","Unable to Update Verifications.  Save not made")
		return
	case 102
		messagebox("Save Error","Unable to Update Audit table.  Save not made")
		return
	case 101
		messagebox("Save Error","Unable to Update dw_verifs.  Save not made")
		return
end choose
//---------------------------- APPEON END ----------------------------
SQLCA.AutoCommit = true

cb_update.enabled = false
	
	
end event
