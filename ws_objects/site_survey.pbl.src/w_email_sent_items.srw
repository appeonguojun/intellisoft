$PBExportHeader$w_email_sent_items.srw
forward
global type w_email_sent_items from w_sheet
end type
type cb_refresh from commandbutton within w_email_sent_items
end type
type rb_all from radiobutton within w_email_sent_items
end type
type rb_select from radiobutton within w_email_sent_items
end type
type st_split from u_st_splitbar within w_email_sent_items
end type
type cb_delete from commandbutton within w_email_sent_items
end type
type cb_close from commandbutton within w_email_sent_items
end type
type dw_browse from u_dw within w_email_sent_items
end type
type ole_mail_view from u_email_edit within w_email_sent_items
end type
end forward

global type w_email_sent_items from w_sheet
integer width = 3758
integer height = 1772
string title = "Email Sent Items"
windowstate windowstate = maximized!
cb_refresh cb_refresh
rb_all rb_all
rb_select rb_select
st_split st_split
cb_delete cb_delete
cb_close cb_close
dw_browse dw_browse
ole_mail_view ole_mail_view
end type
global w_email_sent_items w_email_sent_items

type variables
Integer ii_open_type   //Added By Ken.Guo 2009-05-20.
Boolean ib_retrieved_all = False,ib_retrieved_single = False //Added By Ken.Guo 2009-05-25.
end variables

forward prototypes
public function blob of_downloadfile (long al_id)
public subroutine of_dealfilter (integer ai_opentype)
end prototypes

public function blob of_downloadfile (long al_id);blob lb_data
blob lb_all_data
long ll_data_length
long ll_start
long ll_counter
long ll_loops

If gs_dbtype = "ASA" Or appeongetclienttype() <> 'PB' Then
	SELECTBLOB mail_content INTO :lb_all_data
	FROM em_sent_items
	WHERE id = :al_id;
Else
	SELECT DataLength(mail_content) INTO :ll_data_length
	FROM em_sent_items
	WHERE id = :al_id;
	
	If isnull(ll_data_length) Then ll_data_length = 0
	
	If ll_data_length > 8000 Then 
		If Mod(ll_data_length,8000) = 0 Then
			ll_loops = ll_data_length / 8000 
		Else
			ll_loops = (ll_data_length / 8000) + 1
		End If 
	ElseIf ll_data_length > 0 Then 
		ll_loops = 1 
	End If 
	
	For ll_counter = 1 To ll_loops			
		ll_start = (ll_counter - 1) * 8000 + 1
		SELECTBLOB substring(mail_content,:ll_start,8000) INTO :lb_data
		FROM em_sent_items
		WHERE id = :al_id;
		lb_all_data += lb_data
	Next
End If
If isnull(lb_all_data) Then lb_all_data = blob('')

Return lb_all_data
end function

public subroutine of_dealfilter (integer ai_opentype);//ai_opentype:1-Contract,2-Document Manager Action Item,3-Contract Action Item
//Added By Alan on 2009-2-19
long	ll_ctx_id,ll_doc_id,ll_action_item_id
long	i,ll_count
long	ll_row,ll_findrow
String ls_sql

SetPointer(HourGlass!)
if ai_opentype=0 then	
	//Added By Ken.Guo 2009-05-20.
	//cbx_all.Checked = True   
	If ib_retrieved_all = False Then
		dw_browse.Dataobject = 'd_email_sent_items'
		dw_browse.SetTransObject(SQLCA)
		ls_sql = dw_browse.getsqlselect( )
		ls_sql += " Where em_sent_items.user_id = '" + gs_user_id + "'"
		If dw_browse.SetSQLSelect(ls_sql) <> 1 Then
			Messagebox('Error','Failed to create datawindow, please call support.')
			Return 
		End If		
		
		dw_browse.SetTransObject(SQLCA)
		dw_browse.SetRedraw(False)
		dw_browse.Retrieve(gs_user_id)
		dw_browse.SetRedraw(True)
		ib_retrieved_all = True
	End If	
	
	rb_select.checked = false
	rb_all.checked = true
	dw_browse.setfilter("")
	dw_browse.filter()
else
	rb_select.checked = true
	rb_all.checked = false
	ll_ctx_id=w_contract.tab_contract_details.tabpage_search.dw_search_det1.getitemdecimal(w_contract.tab_contract_details.tabpage_search.dw_search_det1.getrow(),"ctx_id")
	if isnull(ll_ctx_id) then return	//jervis 04.13.2009
	rb_select.text = 'Selected Contract - '+String(ll_ctx_id)
	
	If ib_retrieved_all Then
		dw_browse.setfilter("ctx_id="+string(ll_ctx_id)	)
		dw_browse.filter()
	Else
		If ib_retrieved_single Then
			//
		Else
			dw_browse.dataobject = 'd_email_sent_items'
			dw_browse.SetTransObject(SQLCA)
			ls_sql = dw_browse.getsqlselect( )
			ls_sql += " Where em_sent_items.user_id = '"+ gs_user_id +"'" + " And em_sent_items.ctx_id = " + String(ll_ctx_id)
			If dw_browse.SetSQLSelect(ls_sql) <> 1 Then
				Messagebox('Error','Failed to create datawindow, please call support.')
				Return 
			End If
			dw_browse.SetTransObject(SQLCA)
			dw_browse.SetRedraw(False)
			dw_browse.Retrieve(gs_user_id)
			dw_browse.setfilter("")
			dw_browse.filter()	
			dw_browse.SetRedraw(True)
			ib_retrieved_single = True
		End If
	End If
	
	ll_count=dw_browse.rowcount()
	if ai_opentype=2 then	//Document manager Action Item
		ll_row=w_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail.getrow()
		if ll_row=0 then return
		ll_doc_id=w_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail.getitemdecimal(ll_row,'doc_id')
		ll_action_item_id=w_contract.tab_contract_details.tabpage_images.tab_1.tabpage_action.tab_1.tabpage_detail.dw_detail.getitemdecimal(ll_row,'seq_id')
		if isnull(ll_doc_id) or isnull(ll_action_item_id) then return   //jervis 04.13.2009
		ll_findrow=dw_browse.find("doc_id="+string(ll_doc_id)+" and action_item_id="+string(ll_action_item_id),1,ll_count)
		if ll_findrow>0 then
			dw_browse.scrolltorow(ll_findrow)
			dw_browse.selectrow(0,false)
			dw_browse.selectrow(ll_findrow,true)
		end if
	elseif ai_opentype=3 then
		ll_row=w_contract.tab_contract_details.tabpage_action_items.tab_1.tabpage_detail.dw_1.getrow()
		if ll_row=0 then return
		ll_action_item_id=w_contract.tab_contract_details.tabpage_action_items.tab_1.tabpage_detail.dw_1.getitemdecimal(ll_row,'ctx_action_item_id')
		if isnull(ll_action_Item_id) then return  //jervis 04.13.2009
		//ll_findrow=dw_browse.find("doc_id="+string(ll_doc_id)+" and action_item_id="+string(ll_action_item_id),1,ll_count)
		ll_findrow=dw_browse.find("ctx_id="+string(ll_ctx_id)+" and action_item_id="+string(ll_action_item_id),1,ll_count)
		if ll_findrow>0 then
			dw_browse.scrolltorow(ll_findrow)
			dw_browse.selectrow(0,false)
			dw_browse.selectrow(ll_findrow,true)
		end if
	end if	
end if

dw_browse.event rowfocuschanged(dw_browse.GetRow()) //Added By Ken.Guo 2009-05-22.
end subroutine

on w_email_sent_items.create
int iCurrent
call super::create
this.cb_refresh=create cb_refresh
this.rb_all=create rb_all
this.rb_select=create rb_select
this.st_split=create st_split
this.cb_delete=create cb_delete
this.cb_close=create cb_close
this.dw_browse=create dw_browse
this.ole_mail_view=create ole_mail_view
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_refresh
this.Control[iCurrent+2]=this.rb_all
this.Control[iCurrent+3]=this.rb_select
this.Control[iCurrent+4]=this.st_split
this.Control[iCurrent+5]=this.cb_delete
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.dw_browse
this.Control[iCurrent+8]=this.ole_mail_view
end on

on w_email_sent_items.destroy
call super::destroy
destroy(this.cb_refresh)
destroy(this.rb_all)
destroy(this.rb_select)
destroy(this.st_split)
destroy(this.cb_delete)
destroy(this.cb_close)
destroy(this.dw_browse)
destroy(this.ole_mail_view)
end on

event open;call super::open;ii_open_type = message.doubleparm   //Added By Ken.Guo 2009-05-20.

//Added By Ken.Guo 2009-05-27.
If ii_open_type <> 0 and Isvalid(gw_contract) Then
	If gw_contract.tab_contract_details.tabpage_search.dw_search_det1.RowCount() = 0 Then
		ii_open_type = 0
	End If
End If

if ii_open_type = 0 then
	rb_select.enabled = false
	rb_all.enabled = false
end if

//inherit
this.of_SetResize(true)
inv_resize.of_setorigsize( this.workspacewidth(), this.workspaceheight())
inv_resize.of_setminsize( this.workspacewidth(),this.workspaceheight())

inv_resize.of_Register(dw_browse, inv_resize.SCALERIGHT)
inv_resize.of_Register(ole_mail_view, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register(st_split, inv_resize.SCALERIGHT)
//inv_resize.of_Register(cb_delete, 100, 100, 0, 0)
//inv_resize.of_Register(cb_close, 100, 100, 0, 0)
inv_resize.of_Register(cb_delete,inv_resize.FIXEDRIGHTBOTTOM)
inv_resize.of_Register(cb_close, inv_resize.FIXEDRIGHTBOTTOM)
inv_resize.of_Register(cb_refresh, inv_resize.FIXEDRIGHTBOTTOM)
//inv_resize.of_Register(cbx_all, inv_resize.FIXEDBOTTOM)   //Added By Ken.Guo 2009-05-20.
inv_resize.of_Register(rb_all, inv_resize.FIXEDBOTTOM)   //Added By Ken.Guo 2009-05-20.
inv_resize.of_Register(rb_select, inv_resize.FIXEDBOTTOM)   //Added By Ken.Guo 2009-05-20.

st_split.of_Register(dw_browse, st_split.ABOVE)
st_split.of_Register(ole_mail_view , st_split.BELOW)


end event

event activate;call super::activate;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2009-04-21 By: Scofield
//$<Reason> Change to m_pfe_cst_mdi_menu menu.

If w_mdi.MenuName <> "m_pfe_cst_mdi_menu" Then
	w_mdi.ChangeMenu(m_pfe_cst_mdi_menu)
	w_mdi.of_menu_security(w_mdi.MenuName)
End If
//---------------------------- APPEON END ----------------------------


//Added By Ken.Guo 2011-05-05. Workaround Office OCX's bug
If gs_imageview_version = '5.0' and isvalid(ole_mail_view ) Then
	ole_mail_view.object.activate(true)
End If
end event

event close;ole_mail_view.of_Close()		//Added by Scofield on 2009-04-21

end event

event pfc_postopen;call super::pfc_postopen;//Add By Alan on 2009-2-19
//of_dealfilter(message.doubleparm)
of_dealfilter(ii_open_type)     //Modified By Ken.Guo 2009-05-20
end event

event deactivate;call super::deactivate;//
////Added By Ken.Guo 2011-05-05. Workaround Office OCX's bug
//If gs_imageview_version = '5.0' and isvalid(ole_mail_view ) Then
//	ole_mail_view.object.activate(false)
//End If
end event

type cb_refresh from commandbutton within w_email_sent_items
integer x = 2592
integer y = 1528
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
end type

event clicked; ib_retrieved_all = False
 ib_retrieved_single = False 
 
If rb_all.checked then
	of_dealfilter(0)
Else
	of_dealfilter(ii_open_type)
END IF
end event

type rb_all from radiobutton within w_email_sent_items
integer x = 46
integer y = 1544
integer width = 343
integer height = 64
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "All Emails"
end type

event clicked;if this.checked then
	of_dealfilter(0)
END IF
end event

type rb_select from radiobutton within w_email_sent_items
integer x = 389
integer y = 1544
integer width = 905
integer height = 64
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selected Contract"
boolean checked = true
end type

event clicked;if this.checked then
	of_dealfilter(ii_open_type)
end if

end event

type st_split from u_st_splitbar within w_email_sent_items
integer x = 18
integer y = 716
integer width = 3680
end type

type cb_delete from commandbutton within w_email_sent_items
integer x = 2958
integer y = 1528
integer width = 343
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete Email"
end type

event clicked;long ll_Row

ll_Row = dw_browse.GetRow()
if ll_Row > 0 then
	if MessageBox("Delete",  "Are you sure that you want to permanently delete the selected email?", Question!, YesNo!) = 2 then Return
else
	Return
end if	
dw_browse.DeleteRow(ll_Row)

if ll_Row = 1 and dw_browse.GetRow() > 0 then
	dw_browse.Event RowFocusChanged(dw_browse.GetRow())
end if
dw_browse.SelectRow(0, false)
dw_browse.SelectRow(dw_browse.GetRow(), true)

if dw_browse.Update() = 1 then
	Commit;
else
	Rollback;
	MessageBox("Error", "Failed to delete email.", StopSign!)
end if
end event

type cb_close from commandbutton within w_email_sent_items
integer x = 3319
integer y = 1528
integer width = 343
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean default = true
end type

event clicked;Close(Parent)
end event

type dw_browse from u_dw within w_email_sent_items
integer x = 18
integer y = 16
integer width = 3680
integer height = 700
integer taborder = 10
string dataobject = "d_email_sent_items"
boolean hscrollbar = true
end type

event clicked;call super::clicked;//inherit
long ll_Row

ll_Row = this.GetSelectedRow(1)
this.SetRow(ll_Row)
end event

event constructor;call super::constructor;//inherit
This.of_setrowselect(True)
this.of_SetSort(true)
inv_sort.of_SetColumnHeader(true)
this.SetTransObject(SQLCA)
this.Modify("DataWindow.ReadOnly='yes'")
end event

event rowfocuschanged;call super::rowfocuschanged;//inherit
long ll_id
blob lblb_MailContent

if CurrentRow <= 0 then
	ole_mail_view.SetRedraw(false)
	ole_mail_view.of_Open()
	ole_mail_view.SetRedraw(true)
	Return
end if

// Open content of mail
ll_id = this.object.id[CurrentRow]
//BEGIN---Modify by Evan 10/24/2008
//SELECTBLOB mail_content INTO :lblb_MailContent FROM em_sent_items WHERE id = :ll_id;
lblb_MailContent = of_DownloadFile(ll_id)
//END---Modify by Evan 10/24/2008

ole_mail_view.SetRedraw(false)
if Len(lblb_MailContent) > 0 then
	ole_mail_view.of_Open(lblb_MailContent)
else
	ole_mail_view.of_Open()
end if
ole_mail_view.SetRedraw(true)

// Select row
this.SelectRow(0, false)
this.SelectRow(CurrentRow, true)
this.Post SetFocus()
end event

type ole_mail_view from u_email_edit within w_email_sent_items
integer x = 18
integer y = 740
integer width = 3680
integer height = 760
integer taborder = 20
string binarykey = "w_email_sent_items.win"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fw_email_sent_items.bin 
2E00000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000cb24a4b001cc729d00000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b13000000000cb24a4b001cc729dcb24a4b001cc729d0000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd00005333000013a38000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234abcd00005333000013a38000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fw_email_sent_items.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
