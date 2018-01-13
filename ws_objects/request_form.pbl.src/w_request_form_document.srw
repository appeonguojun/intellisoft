$PBExportHeader$w_request_form_document.srw
forward
global type w_request_form_document from w_response
end type
type cb_save from commandbutton within w_request_form_document
end type
type cb_delete from commandbutton within w_request_form_document
end type
type cb_add from commandbutton within w_request_form_document
end type
type cb_close from commandbutton within w_request_form_document
end type
type dw_1 from u_dw within w_request_form_document
end type
end forward

global type w_request_form_document from w_response
string tag = "Request Form Document"
integer x = 214
integer y = 221
integer width = 2281
integer height = 1436
string title = "Request Form Document"
cb_save cb_save
cb_delete cb_delete
cb_add cb_add
cb_close cb_close
dw_1 dw_1
end type
global w_request_form_document w_request_form_document

type variables
long		il_request_id

end variables

on w_request_form_document.create
int iCurrent
call super::create
this.cb_save=create cb_save
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.cb_close=create cb_close
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_save
this.Control[iCurrent+2]=this.cb_delete
this.Control[iCurrent+3]=this.cb_add
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.dw_1
end on

on w_request_form_document.destroy
call super::destroy
destroy(this.cb_save)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.cb_close)
destroy(this.dw_1)
end on

event open;call super::open;DataWindowChild			ldwc_ctx_doc_type


il_request_id = Message.doubleparm

if isnull(il_request_id ) then
	this.event close( )
elseif il_request_id > 0 then 
	dw_1.reset( )
	dw_1.retrieve( il_request_id )
end if 

//Added By Mark Lee 09/11/2015
dw_1.getchild( "ctx_doc_type", ldwc_ctx_doc_type)
ldwc_ctx_doc_type.settransobject( sqlca)
ldwc_ctx_doc_type.retrieve("Contract Document Type" )

If dw_1.rowcount() <= 0 then 
	dw_1.insertrow(0)
end if
end event

type cb_save from commandbutton within w_request_form_document
integer x = 1417
integer y = 1240
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;if Event pfc_save() >= 0 then 
	if isvalid(w_request_form) then
		w_request_form.of_sync_update("","")
	end if
	parent.cb_close.event clicked( )
end if 

end event

type cb_delete from commandbutton within w_request_form_document
integer x = 992
integer y = 1240
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete"
end type

event clicked;
if dw_1.Getrow() > 0 then 
	dw_1.deleterow( dw_1.GetRow())
	
	if dw_1.rowcount() > 0 then 
		dw_1.scrolltorow( dw_1.rowcount())
		dw_1.SetRow(dw_1.rowcount())
		dw_1.SetFocus()
//	else
//		parent.cb_add.event clicked( )
	end if 
end if 
end event

type cb_add from commandbutton within w_request_form_document
integer x = 567
integer y = 1240
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;long		ll_row

ll_row = dw_1.insertrow(0)
dw_1.scrolltorow( ll_row)
dw_1.SetRow(ll_row)
dw_1.SetFocus()
end event

type cb_close from commandbutton within w_request_form_document
integer x = 1842
integer y = 1240
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type dw_1 from u_dw within w_request_form_document
integer x = 27
integer y = 24
integer width = 2213
integer height = 1184
integer taborder = 10
string dataobject = "d_request_form_document"
end type

event constructor;call super::constructor;SetRowFocusIndicator(Hand!)
end event

event pfc_preupdate;call super::pfc_preupdate;//Added By Mark Lee 09/24/2013
long			i,	ll_document_id, ll_cnt, ll_rowcount, ll_request_id, ll_new
string 		ls_document_name

ll_rowcount  = this.rowcount()
if ll_rowcount > 0 then 
	for i = 1 to ll_rowcount
		ll_document_id = this.GetItemNumber(i,"document_id")
		if isnull(ll_document_id) or ll_document_id <= 0 then 
			ll_cnt ++
		end if 
		ll_request_id = this.GetItemNumber(i,"request_id")
		if isnull(ll_request_id) or ll_request_id <= 0 then 
			this.SetItem(i,"request_id",il_request_id)
		end if 
		
		ls_document_name = this.GetitemString(i,"description")
		if isnull(ls_document_name) or ls_document_name = '' then 
			this.scrolltorow( i)
			this.SetRow(i)
			this.SetColumn("description")
			this.SetFocus()
			messagebox('Alert','The Document description field cannot be empty. ~r~nPlease enter a Document Name.')
			return -1
		end if
		
		this.SetItem( i,"user_id", gs_user_id)
		this.SetItem( i,"modify_date", DateTime(Date(Now()), Time(Now())) )
	next 

	if ll_cnt > 0 then 
		ll_new = gnv_app.of_get_id(upper("request_form_document_id"), ll_cnt)	
	end if 

	for i = 1 to ll_rowcount
		if ll_cnt > 0 then 
			ll_document_id = this.GetItemNumber(i,"document_id")
			if isnull(ll_document_id) or ll_document_id <= 0 then 
				this.SetItem( i, "document_id", ll_new )
				ll_new ++
			end if 
		end if
	next 
end if 

return 1
end event

