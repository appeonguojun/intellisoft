$PBExportHeader$w_contract_report_design.srw
forward
global type w_contract_report_design from w_main
end type
type cb_resize from commandbutton within w_contract_report_design
end type
type cb_exit from commandbutton within w_contract_report_design
end type
type cb_save from commandbutton within w_contract_report_design
end type
type uo_design from pfc_cst_u_contract_data_design within w_contract_report_design
end type
end forward

global type w_contract_report_design from w_main
integer width = 4745
integer height = 2316
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_nclbuttondblclk pbm_nclbuttondblclk
cb_resize cb_resize
cb_exit cb_exit
cb_save cb_save
uo_design uo_design
end type
global w_contract_report_design w_contract_report_design

type variables
//added by gavin on 2009-03-04
Boolean  ib_disable_activate
String   is_OrgSyntax
//------------end--------------
end variables

event ue_nclbuttondblclk;if This.Windowstate = Maximized! then
	This.Windowstate = Normal!
else
	This.Windowstate = Maximized!
end if

Return 1

end event

on w_contract_report_design.create
int iCurrent
call super::create
this.cb_resize=create cb_resize
this.cb_exit=create cb_exit
this.cb_save=create cb_save
this.uo_design=create uo_design
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_resize
this.Control[iCurrent+2]=this.cb_exit
this.Control[iCurrent+3]=this.cb_save
this.Control[iCurrent+4]=this.uo_design
end on

on w_contract_report_design.destroy
call super::destroy
destroy(this.cb_resize)
destroy(this.cb_exit)
destroy(this.cb_save)
destroy(this.uo_design)
end on

event activate;call super::activate;IF ib_disable_activate THEN RETURN

end event

event closequery;string   ls_Syntax
int  li

//uo_design.dw_properties_dw.AcceptText() //Add by Evan 07/18/2008
ls_Syntax = uo_design.uo_band.dw_syntax.describe("datawindow.syntax")

//IF ls_Syntax <> is_OrgSyntax or uo_design.dw_properties_dw.ModifiedCount() > 0 THEN //Modify by Evan 07/18/2008
IF ls_Syntax <> uo_design.is_OrgSyntax then
	li = messagebox(gnv_app.iapp_object.DisplayName,'Do you want to save changes?',question!,yesnocancel!)
	IF li = 1 THEN
		cb_save.triggerevent("clicked")
	ELSEIF li = 3 THEN
		return 1
	END IF
END IF

uo_design.of_deletepicfile( )
end event

event open;call super::open;//
//modify by gavin on 2009/3/4
this.of_SetBase(true)
this.inv_base.of_center()

str_custom_report lstr
datawindow ldw_item
long       li_data_view

IF gb_se_version THEN
	uo_design.il_data_view_id = 2
	This.Title = "Report Writer"
END IF

lstr = message.PowerObjectParm
ldw_item = lstr.adw_preview
li_data_view = lstr.al_view_id

uo_design.of_set_parent_window( This )
//uo_design.of_Setup( False )
uo_design.of_Setup_painter()

//modify by gavin on 2009/3/2
uo_design.of_init(this,'report',ldw_item,li_data_view)
uo_design.of_set_datagroup(true)

this.resize( 4059,2500)

uo_design.x = 1
uo_design.y = 1

uo_design.width = 4030
uo_design.height = 2300

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2007-11-07 By: Andy
uo_design.uo_band.dw_header.of_setuserobject( uo_design)
uo_design.uo_band.dw_detail.of_setuserobject( uo_design)
uo_design.uo_band.dw_Summary.of_setuserobject( uo_design)
uo_design.uo_band.dw_footer.of_setuserobject( uo_design)
//modify by gavin 2009/3/2
uo_design.uo_band.dw_headergroup.of_setuserobject( uo_design)
uo_design.uo_band.dw_trailergroup.of_setuserobject( uo_design)
//---------------------------- APPEON END ----------------------------

IF NOT gb_se_version THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 01.10.2008 By: Evan
	//$<reason> Close window if cancel select view.
	//uo_design.TriggerEvent( "pfc_cst_select_view" )//maha 030802
	integer li_Return
	li_Return = uo_design.Event pfc_cst_select_view()
	if li_Return = -1 then
		Close(this)
		Return
	end if
	//---------------------------- APPEON END ----------------------------
END IF



end event

event resize;call super::resize;//Modified by gavin on 2009-03-05
uo_Design.x = 1
uo_Design.y = 1
uo_Design.height = this.height - 250
uo_Design.width = this.width - 20

cb_save.y   = uo_Design.y + uo_Design.height + 10
cb_exit.y   = cb_save.y

//BEGIN---Modify by Scofield on 2009-12-30
//cb_Resize.X = This.Width - cb_Resize.Width - 30
cb_Resize.Y = cb_save.y

cb_exit.x = This.Width - cb_exit.width - 30
cb_save.x = cb_exit.x - cb_save.width - 20
cb_resize.x = cb_save.x - cb_resize.width - 20

if SizeType = 0 then
	cb_resize.text = '&Maximized'
elseif SizeType = 2 then
	cb_resize.text = '&Normal'
end if
//END---Modify by Scofield on 2009-12-30

end event

event timer;call super::timer;if uo_design.uo_band.ib_MouseDown and KeyDown(KeyLeftButton!) then
	uo_design.uo_band.of_Modify_Rectangle_Frame()
else
	Timer(0)
	uo_design.uo_band.TriggerEvent("lbuttonup")	
end if

end event

event pfc_preopen;call super::pfc_preopen;long ll_i
string ls_scale

uo_design.of_set_isshowtree(False)

end event

type cb_resize from commandbutton within w_contract_report_design
integer x = 3657
integer y = 2132
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Maximized"
end type

event clicked;if Parent.WindowState = Maximized! then
	Parent.WindowState = Normal!
else
	Parent.WindowState = Maximized!
end if

end event

type cb_exit from commandbutton within w_contract_report_design
integer x = 4389
integer y = 2132
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

event clicked;//Exit
Close(parent)
end event

type cb_save from commandbutton within w_contract_report_design
integer x = 4023
integer y = 2132
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;//modify by gavin on 2009/3/4
parent.uo_design.of_save_report()

//Added By Jay Chen 08-14-2015 remark: set custom report window's column display is checked after add new field from advanced design
datastore lds_dw
string ls_dw_syntax,ls_error,ls_col,ls_visible,ls_type,ls_obj
long ll_find,li_pos
datawindow ldw_view_fields	
if isvalid(w_custom_report) then
	ldw_view_fields = w_custom_report.tab_1.tabpage_columns.dw_view_fields
	ls_dw_Syntax = w_custom_report.of_GetSyntax(w_custom_report.il_view_id)
	lds_dw = Create DataStore
	lds_dw.Create(ls_dw_Syntax,ls_error)
	ls_obj = lds_dw.describe('datawindow.objects') + "~t"
	do
		li_pos = pos(ls_obj, "~t") - 1
		ls_col = mid(ls_obj, 1, li_pos)
		ls_visible = lds_dw.describe(ls_col + ".visible")
		ls_type    = lds_dw.describe(ls_col + ".type")
		if (ls_visible = '1' or ls_visible = '-1') and lower(ls_type) =  'column' then  //Modified By Ken.Guo 2016-01-19. added ls_visible = '-1' for web.
			ll_find = ldw_view_fields.find( " lower(field_alias)='"+lower(ls_col)+"' ", 1, ldw_view_fields.rowcount())
			if ll_find > 0 then
				ldw_view_fields.setitem( ll_find, "field_visible", 1)
			end if
			ls_obj = mid(ls_obj, li_pos + len("~t") + 1)
		else
			if lower(ls_type) =  'column' then 
				ll_find = ldw_view_fields.find( " lower(field_alias)='"+lower(ls_col)+"' ", 1, ldw_view_fields.rowcount())
				if ll_find > 0 then
					ldw_view_fields.setitem( ll_find, "field_visible", 0)
				end if
			end if
			ls_obj = mid(ls_obj, li_pos + len("~t") + 1)
		end if
	loop until pos(ls_obj, "~t") = 0
end if
//end 
end event

type uo_design from pfc_cst_u_contract_data_design within w_contract_report_design
integer height = 2124
integer taborder = 40
end type

on uo_design.destroy
call pfc_cst_u_contract_data_design::destroy
end on

