﻿$PBExportHeader$w_app_audit_setup.srw
forward
global type w_app_audit_setup from w_response
end type
type tab_audit from tab within w_app_audit_setup
end type
type tabpage_initial from userobject within tab_audit
end type
type dw_initial from u_dw within tabpage_initial
end type
type tabpage_initial from userobject within tab_audit
dw_initial dw_initial
end type
type tabpage_reapp from userobject within tab_audit
end type
type dw_reapp from u_dw within tabpage_reapp
end type
type cb_copy from u_cb within tabpage_reapp
end type
type tabpage_reapp from userobject within tab_audit
dw_reapp dw_reapp
cb_copy cb_copy
end type
type tab_audit from tab within w_app_audit_setup
tabpage_initial tabpage_initial
tabpage_reapp tabpage_reapp
end type
type cb_add from u_cb within w_app_audit_setup
end type
type cb_delete from u_cb within w_app_audit_setup
end type
type cb_print from u_cb within w_app_audit_setup
end type
type cb_save from u_cb within w_app_audit_setup
end type
type cb_close from u_cb within w_app_audit_setup
end type
type dw_data_view from u_dw within w_app_audit_setup
end type
end forward

global type w_app_audit_setup from w_response
integer x = 133
integer y = 336
integer width = 3387
integer height = 1952
string title = "Application Audit Painter"
tab_audit tab_audit
cb_add cb_add
cb_delete cb_delete
cb_print cb_print
cb_save cb_save
cb_close cb_close
dw_data_view dw_data_view
end type
global w_app_audit_setup w_app_audit_setup

type variables
u_dw idw_current

Integer ii_facility_id

end variables

on w_app_audit_setup.create
int iCurrent
call super::create
this.tab_audit=create tab_audit
this.cb_add=create cb_add
this.cb_delete=create cb_delete
this.cb_print=create cb_print
this.cb_save=create cb_save
this.cb_close=create cb_close
this.dw_data_view=create dw_data_view
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_audit
this.Control[iCurrent+2]=this.cb_add
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_print
this.Control[iCurrent+5]=this.cb_save
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.dw_data_view
end on

on w_app_audit_setup.destroy
call super::destroy
destroy(this.tab_audit)
destroy(this.cb_add)
destroy(this.cb_delete)
destroy(this.cb_print)
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.dw_data_view)
end on

event open;call super::open;dw_data_view.Retrieve()

tab_audit.SelectTab(1)
tab_audit.tabpage_initial.dw_initial.SetFocus()

dw_data_view.SelectRow( 1, True )
dw_data_view.ScrollToRow( 1 )
dw_data_view.SetRow( 1 )
end event

type tab_audit from tab within w_app_audit_setup
integer x = 869
integer y = 40
integer width = 2437
integer height = 1792
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean fixedwidth = true
boolean raggedright = true
alignment alignment = center!
integer selectedtab = 1
tabpage_initial tabpage_initial
tabpage_reapp tabpage_reapp
end type

on tab_audit.create
this.tabpage_initial=create tabpage_initial
this.tabpage_reapp=create tabpage_reapp
this.Control[]={this.tabpage_initial,&
this.tabpage_reapp}
end on

on tab_audit.destroy
destroy(this.tabpage_initial)
destroy(this.tabpage_reapp)
end on

event selectionchanged;IF newindex = 1 THEN
	tab_audit.tabpage_initial.dw_initial.SetFocus()
ELSE
	tab_audit.tabpage_reapp.dw_reapp.SetFocus()
END IF
end event

type tabpage_initial from userobject within tab_audit
integer x = 18
integer y = 112
integer width = 2400
integer height = 1664
long backcolor = 79741120
string text = "Initial Appointment Required Data"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DataWindow!"
long picturemaskcolor = 553648127
dw_initial dw_initial
end type

on tabpage_initial.create
this.dw_initial=create dw_initial
this.Control[]={this.dw_initial}
end on

on tabpage_initial.destroy
destroy(this.dw_initial)
end on

type dw_initial from u_dw within tabpage_initial
integer x = 46
integer y = 60
integer width = 2309
integer height = 1440
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_app_audit_rqrd_data"
end type

event constructor;DataWindowChild dwchild

This.of_SetTransObject(SQLCA)

This.GetChild( "default_ver_response_code", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("credentials verification response")
dwchild.insertrow(1)

end event

event getfocus;call super::getfocus;idw_current = This
end event

event itemchanged;call super::itemchanged;Long ll_null_num

SetNull(ll_null_num)

IF (This.GetItemStatus( row, 0, Primary! ) = New! OR +&
	This.GetItemStatus( row, 0, Primary! ) = NewModified!) AND +&
	This.GetColumnName() = "description" THEN
	This.SetItem( row, "fax_description", data )
ELSEIF This.GetColumnName() = "use_as_verification" AND data = "N" THEN
	This.SetItem( row, "default_ver_response_code", ll_null_num )
	This.SetItem( row, "screen_id", ll_null_num )
END IF
end event

type tabpage_reapp from userobject within tab_audit
integer x = 18
integer y = 112
integer width = 2400
integer height = 1664
long backcolor = 79741120
string text = "Reappointment Required Data"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DataWindow5!"
long picturemaskcolor = 553648127
dw_reapp dw_reapp
cb_copy cb_copy
end type

on tabpage_reapp.create
this.dw_reapp=create dw_reapp
this.cb_copy=create cb_copy
this.Control[]={this.dw_reapp,&
this.cb_copy}
end on

on tabpage_reapp.destroy
destroy(this.dw_reapp)
destroy(this.cb_copy)
end on

type dw_reapp from u_dw within tabpage_reapp
integer x = 46
integer y = 60
integer width = 2309
integer height = 1440
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_app_audit_rqrd_data"
end type

event constructor;This.of_SetTransObject(SQLCA)
This.of_SetRowManager(TRUE)

DataWindowChild dwchild

This.of_SetTransObject(SQLCA)

This.GetChild( "default_ver_response_code", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("credentials verification response")
dwchild.insertrow(1)



end event

event getfocus;call super::getfocus;idw_current = This
end event

event itemchanged;call super::itemchanged;Long ll_null_num

SetNull( ll_null_num )

IF (This.GetItemStatus( row, 0, Primary! ) = New! OR +&
	This.GetItemStatus( row, 0, Primary! ) = NewModified!) AND +&
	This.GetColumnName() = "description" THEN
	This.SetItem( row, "fax_description", data )
ELSEIF This.GetColumnName() = "use_as_verification" AND data = "N" THEN
	This.SetItem( row, "default_ver_response_code", ll_null_num )
	This.SetItem( row, "screen_id", ll_null_num )
END IF
end event

type cb_copy from u_cb within tabpage_reapp
integer x = 1088
integer y = 1536
integer width = 325
integer height = 84
integer taborder = 11
boolean bringtotop = true
string text = "Copy Inititial"
end type

event clicked;Integer li_rc
Integer i
Long li_id

li_rc = tab_audit.tabpage_reapp.dw_reapp.RowCount()

IF li_rc > 0 THEN
	MessageBox("Copy Error", "The reappointment audit list must be empty to copy the initial appointment audit list to it." )
	Return -1
END IF

tab_audit.tabpage_initial.dw_initial.RowsCopy(1, 1000, Primary!, tab_audit.tabpage_reapp.dw_reapp, 1, Primary!)

li_rc = tab_audit.tabpage_reapp.dw_reapp.RowCount()

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.17.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
//$<modification> value into database.
/*
li_id = Integer( gnv_app.of_get_id("APPAUDIT") )
*/
li_id = Integer( gnv_app.of_get_id("APPAUDIT",li_rc) ) - 1
//---------------------------- APPEON END ----------------------------


FOR i = 1 TO li_rc
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-02
	//$<modify> 02.17.2006 By: owen chen
	//$<reason> Performance tuning
	//$<modification> Comment out the following script to reduce client-server interaction.
	//$<modification> refer to PT-01 and of_get_id for more information.
	/*
	li_id = Integer( gnv_app.of_get_id("APPAUDIT") )
	*/
	li_id ++
	//---------------------------- APPEON END ----------------------------
	tab_audit.tabpage_reapp.dw_reapp.SetItem( i, "app_audit_id", li_id )
	tab_audit.tabpage_reapp.dw_reapp.SetItem( i, "app_type", "R" )
END FOR
end event

event constructor;call super::constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 01.12.2006 By: LeiWei
//$<reason> Due to one slight defect in Appeon product, the position of this button is incorrect to some degree after migration.
//$<modification> Adjust the position for this button to make sure the presentation of this button looks the same as in PowerBuilder.
If appeongetclienttype() <> 'PB' Then
	this.y += 12
End If
//---------------------------- APPEON END ----------------------------

end event

type cb_add from u_cb within w_app_audit_setup
integer x = 933
integer y = 1688
integer width = 325
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "&Add"
end type

event clicked;Integer li_nr
Integer li_id


li_id = Integer( gnv_app.of_get_id("APPAUDIT") )

li_nr = idw_current.InsertRow( 0 )
idw_current.SetItem( li_nr, "facility_id", ii_facility_id )
idw_current.SetItem( li_nr, "app_audit_id", li_id )
//Start Code Change ---- 12.19.2006 #V7 maha
idw_current.SetItem(li_nr,'use_as_verification',0)
idw_current.SetItem(li_nr,'auto_generate',0)
idw_current.SetItem(li_nr,'receive_from_de',0)
//End Code Change---12.19.2006

//idw_current.SetItem( li_nr, "description", "" )//maha 100400 added to avoid null field database error
IF tab_audit.SelectedTab = 1 THEN
	idw_current.SetItem( li_nr, "app_type", "I" )
ELSE
	idw_current.SetItem( li_nr, "app_type", "R" )
END IF

idw_current.ScrollToRow( li_nr )
idw_current.SetRow( li_nr )
idw_current.SetFocus( )
idw_current.SetColumn( "description" )


end event

type cb_delete from u_cb within w_app_audit_setup
integer x = 1280
integer y = 1688
integer width = 325
integer height = 84
integer taborder = 30
boolean bringtotop = true
string text = "&Delete "
end type

event clicked;Integer li_ans

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03/18/2008 By: Ken.Guo
//$<reason> Add Trap
If tab_audit.selectedtab = 1 Then
	If tab_audit.tabpage_initial.dw_initial.GetRow() < 1 Then Return 0
Else
	If tab_audit.tabpage_reapp.dw_reapp.GetRow() < 1 Then Return 0
End If
//---------------------------- APPEON END ----------------------------


li_ans = MessageBox("Delete Row", "Are you sure you want to delete selected row?", Question!, YesNo!, 1 )

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 01.13.2006 By: Rodger Wu
//$<reason> Fix a defect.

//IF li_ans = 1 THEN
//	idw_current.DeleteRow( 0 )
//END IF
//
//idw_current.SetFocus( )

IF li_ans = 1 THEN
	If tab_audit.selectedtab = 1 Then
		tab_audit.tabpage_initial.dw_initial.DeleteRow(0)
	Else
		tab_audit.tabpage_reapp.dw_reapp.DeleteRow(0)
	End If
END IF
//---------------------------- APPEON END ----------------------------
end event

type cb_print from u_cb within w_app_audit_setup
integer x = 1627
integer y = 1688
integer width = 325
integer height = 84
integer taborder = 40
boolean bringtotop = true
string text = "&Print "
end type

event clicked;idw_current.Print(True)

idw_current.SetFocus( )
end event

type cb_save from u_cb within w_app_audit_setup
integer x = 2560
integer y = 1688
integer width = 325
integer height = 84
integer taborder = 50
boolean bringtotop = true
string text = "&Save"
end type

event clicked;string ls_description
string ls_fax[]  //maha 04.04.2008
long ll_row
long ll_aa_id[]  //maha 04.04.2008
integer li_up_cnt= 0 //maha 04.04.2008
integer i  //maha 04.04.2008


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05.26.2006 By: Liang QingShi
//$<reason> The description field has data and not null.


tab_audit.tabpage_initial.dw_initial.accepttext()
ll_row = tab_audit.tabpage_initial.dw_initial.getrow()
if ll_row > 0 then//Add condition - Rodger Wu on June 20, 2006.
	ls_description = tab_audit.tabpage_initial.dw_initial.getitemstring(ll_row,'description')
	if isnull(ls_description) or trim(ls_description) = '' then
		messagebox('ContractLogix','Required value missing for description on row ' + string(ll_row) + '. ' + 'Please enter a value.')
		tab_audit.tabpage_initial.dw_initial.setfocus()
		tab_audit.tabpage_initial.dw_initial.setcolumn('description')
		return
	end if
//Start Code Change ----04.04.2008 #V8 maha - code to test if record modified to update the prac fax_message field
	if tab_audit.tabpage_initial.dw_initial.getitemstatus( ll_row, "fax_description", primary!) = datamodified! then 
		if tab_audit.tabpage_initial.dw_initial.getitemnumber(ll_row,"auto_generate") = 0 then
			li_up_cnt++
			ll_aa_id[li_up_cnt] = tab_audit.tabpage_initial.dw_initial.getitemnumber(ll_row,"app_audit_id")
			ls_fax[li_up_cnt] = tab_audit.tabpage_initial.dw_initial.getitemstring(ll_row,'fax_description')
		end if
	end if
//End Code Change---04.04.2008
end if
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 01.11.2008 By: Evan
//$<reason> Fix BugS122707	about input no data, directly click Save. The error message is not interactive at all.
tab_audit.tabpage_reapp.dw_reapp.AcceptText()
for ll_row = 1 to tab_audit.tabpage_reapp.dw_reapp.RowCount()
	ls_description = tab_audit.tabpage_reapp.dw_reapp.getitemstring(ll_row,'description')
	if isnull(ls_description) or trim(ls_description) = '' then		
		messagebox('ContractLogix','Required value missing for description on row ' + string(ll_row) + '. ' + 'Please enter a value.')
		tab_audit.SelectTab(2)
		tab_audit.tabpage_reapp.dw_reapp.ScrollToRow(ll_row)
		tab_audit.tabpage_reapp.dw_reapp.setfocus()
		tab_audit.tabpage_reapp.dw_reapp.setcolumn('description')
		return
	end if
	//Start Code Change ----04.04.2008 #V8 maha - code to test if record modified to update the prac fax_message field
	if tab_audit.tabpage_reapp.dw_reapp.getitemstatus( ll_row, "fax_description", primary!) = datamodified! then 
		if tab_audit.tabpage_reapp.dw_reapp.getitemnumber(ll_row,"auto_generate") = 0 then
			li_up_cnt++
			ll_aa_id[li_up_cnt] = tab_audit.tabpage_reapp.dw_reapp.getitemnumber(ll_row,"app_audit_id")
			ls_fax[li_up_cnt] = tab_audit.tabpage_reapp.dw_reapp.getitemstring(ll_row,'fax_description')
		end if
	end if
//End Code Change---04.04.2008
next
//---------------------------- APPEON END ----------------------------

//Start Code Change ----04.04.2008 #V8 maha - code to test if record modified to update the prac fax_message field
//for each modified record update the incomplete prac records
for i = 1 to upperbound(ll_aa_id )
	//update pd_app_audit set fax_message = :ls_fax[i] where app_audit_id = :ll_aa_id[i] and active_status = 1 and date_completed is null;
next
//End Code Change---04.04.2008

Parent.Event pfc_Save()
end event

type cb_close from u_cb within w_app_audit_setup
integer x = 2912
integer y = 1688
integer width = 325
integer height = 84
integer taborder = 60
boolean bringtotop = true
string text = "&Close"
end type

event clicked;Close( Parent )
end event

type dw_data_view from u_dw within w_app_audit_setup
integer x = 32
integer y = 40
integer width = 809
integer height = 1792
integer taborder = 10
boolean titlebar = true
string title = "Select Facility"
string dataobject = "d_facility_list_for_list_view"
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;This.ScrollToRow( This.GetClickedRow() )
end event

event constructor;This.of_SetUpdateable( False )
This.of_SetTransObject( SQLCA )
end event

event retrieveend;call super::retrieveend;//of_get_this_facility_data()
end event

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow( 0, False )
This.SelectRow( currentrow, True )

ii_facility_id = This.GetItemNumber( currentrow, "facility_id" )

tab_audit.tabpage_initial.dw_initial.Retrieve( ii_facility_id, "I" )
tab_audit.tabpage_reapp.dw_reapp.Retrieve( ii_facility_id, "R" )

end event
