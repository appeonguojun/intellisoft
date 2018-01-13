$PBExportHeader$w_wf_category.srw
forward
global type w_wf_category from w_response
end type
type mle_1 from multilineedit within w_wf_category
end type
type dw_view from u_dw within w_wf_category
end type
type cb_cancel from commandbutton within w_wf_category
end type
type cb_ok from commandbutton within w_wf_category
end type
end forward

global type w_wf_category from w_response
integer x = 214
integer y = 221
integer width = 1490
integer height = 1524
string title = "Set Work Flow for Category"
mle_1 mle_1
dw_view dw_view
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_wf_category w_wf_category

type variables
boolean ib_refresh = false


end variables

on w_wf_category.create
int iCurrent
call super::create
this.mle_1=create mle_1
this.dw_view=create dw_view
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_1
this.Control[iCurrent+2]=this.dw_view
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_ok
end on

on w_wf_category.destroy
call super::destroy
destroy(this.mle_1)
destroy(this.dw_view)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;call super::open;//====================================================================
// Event: open
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 08-06-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

datawindowchild dwchild
dw_view.settransobject(SQLCA)
dw_view.retrieve()
dw_view.GetChild( "custom_5", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.SetFilter("wf_triggered_by = '002'")				
dwchild.Retrieve( "03" )	
dwchild.InsertRow(1)
dwchild.SetItem(1,"wf_name","")		
dw_view.scrolltorow(1)
dw_view.setrow(1)



end event

event closequery;dw_view.of_Setupdateable( False )
end event

type mle_1 from multilineedit within w_wf_category
integer x = 23
integer y = 1172
integer width = 1435
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "A New Contract type work flow cannot be triggered when creating a new contract before it is associated with a contract category."
boolean border = false
boolean displayonly = true
end type

type dw_view from u_dw within w_wf_category
integer x = 23
integer y = 12
integer width = 1431
integer height = 1148
integer taborder = 10
string dataobject = "d_code_lookup_category"
end type

event constructor;call super::constructor;This.of_Setupdateable( True )
end event

type cb_cancel from commandbutton within w_wf_category
integer x = 1111
integer y = 1312
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

event clicked;dw_view.of_Setupdateable( False )
CloseWithReturn(Parent, 'cancel')
end event

type cb_ok from commandbutton within w_wf_category
integer x = 745
integer y = 1312
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
boolean default = true
end type

event clicked;integer li_retval
datawindowchild dwchild,dwchild2

dw_view.accepttext( )

li_retval = Event pfc_save()
if li_Retval = 1 then 
	//refresh the cache now.
	gnv_app.IB_ref_cache = TRUE
	gnv_data.of_retrieve( "code_lookup" )
	gnv_app.of_setcontraccache_code_lookup( 'Contract Category', true)	
	//Refresh lookup painter data
	if isvalid(w_lookup_maint) then  
		if Lower(w_lookup_maint.is_lookup_name) = 'contract category' then
			w_lookup_maint.Tab_1.Tabpage_Browse.dw_Browse.GetChild( "custom_5", dwchild )
			dwchild.SetTransObject( SQLCA )
			dwchild.SetFilter("wf_triggered_by = '002'")			
			dwchild.Retrieve( "03" )	
			dwchild.InsertRow(1)
			dwchild.SetItem(1,"wf_name","")							
			w_lookup_maint.Tab_1.Tabpage_Detail.dw_Detail.GetChild( "custom_5", dwchild2 )
			dwchild2.SetTransObject( SQLCA )
			dwchild2.SetFilter("wf_triggered_by = '002'")	
			dwchild2.Retrieve( "03" )	
			dwchild2.InsertRow(1)
			dwchild2.SetItem(1,"wf_name","")
			w_lookup_maint.Tab_1.Tabpage_Browse.dw_Browse.Event pfc_Retrieve()
		end if
	end if
	//Refresh workflow properties window trigger category 
	if isvalid(w_workflow_properties) then
		w_workflow_properties.wf_trigger_category('002')
	end if
End If

CloseWithReturn(Parent, 'ok')


end event

