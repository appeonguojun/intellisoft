$PBExportHeader$w_requester_advanced_security.srw
forward
global type w_requester_advanced_security from w_response
end type
type cb_cancel from commandbutton within w_requester_advanced_security
end type
type cb_ok from commandbutton within w_requester_advanced_security
end type
type cbx_no from checkbox within w_requester_advanced_security
end type
type cbx_read from checkbox within w_requester_advanced_security
end type
type cbx_full from checkbox within w_requester_advanced_security
end type
type dw_rights from u_dw within w_requester_advanced_security
end type
type dw_type from u_dw within w_requester_advanced_security
end type
type ds_user from n_ds within w_requester_advanced_security
end type
end forward

global type w_requester_advanced_security from w_response
integer x = 214
integer y = 221
integer width = 2629
integer height = 1772
string title = "Advanced Security Settings"
boolean controlmenu = false
cb_cancel cb_cancel
cb_ok cb_ok
cbx_no cbx_no
cbx_read cbx_read
cbx_full cbx_full
dw_rights dw_rights
dw_type dw_type
ds_user ds_user
end type
global w_requester_advanced_security w_requester_advanced_security

type variables
string is_user_id
long il_advanced_security

string is_ret = "cancel"

boolean ib_retrieving

end variables

forward prototypes
public function integer of_checkall (string as_col, string as_val)
end prototypes

public function integer of_checkall (string as_col, string as_val);// Set the checkbox column as_col to value as_val in dw_rights
//
long ll_row

FOR ll_row = 1 TO dw_rights.rowCount()
	dw_rights.event ue_processItemChanged(ll_row, as_col, as_val)
NEXT

return 1

end function

event open;call super::open;// Input parm (via message.StringParm) user_id + "~t" (tab) + previous value of user_requester.advanced_security
//
// Returns (via message.StringParm) "ok" or "cancel"
//
string ls_parm, ls_element[]
powerobject lpo_update[]
n_cst_string lnv_string

ls_parm = message.StringParm

IF lnv_string.of_parseToArray(ls_parm, "~t", ls_element) > 0 THEN
	is_user_id = ls_element[1]
	IF upperBound(ls_element) > 1 THEN
		IF isNumber(ls_element[2]) THEN
			il_advanced_security = integer(ls_element[2])
		END IF
	END IF
END IF

this.backColor = rgb(244, 244, 244)

dw_type.event pfc_retrieve()
dw_rights.setRedraw(FALSE)
dw_rights.event pfc_retrieve()
IF dw_type.rowCount() > 0 THEN
	IF dw_type.getRow() = 1 THEN
		dw_type.event rowfocuschanged(1)
	ELSE
		dw_type.setRow(1)
	END IF
END IF
dw_rights.setRedraw(TRUE)

/* Set update objects to include ds_user. */
lpo_update[1] = dw_rights
lpo_update[2] = ds_user
of_setUpdateObjects(lpo_update)
ds_user.object.datawindow.table.updatewhere = 0
ds_user.of_setTransObject(SQLCA)

end event

on w_requester_advanced_security.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cbx_no=create cbx_no
this.cbx_read=create cbx_read
this.cbx_full=create cbx_full
this.dw_rights=create dw_rights
this.dw_type=create dw_type
this.ds_user=create ds_user
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cbx_no
this.Control[iCurrent+4]=this.cbx_read
this.Control[iCurrent+5]=this.cbx_full
this.Control[iCurrent+6]=this.dw_rights
this.Control[iCurrent+7]=this.dw_type
end on

on w_requester_advanced_security.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cbx_no)
destroy(this.cbx_read)
destroy(this.cbx_full)
destroy(this.dw_rights)
destroy(this.dw_type)
destroy(this.ds_user)
end on

type cb_cancel from commandbutton within w_requester_advanced_security
string tag = "o3lswf"
integer x = 2208
integer y = 1572
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;parent.ib_disableCloseQuery = TRUE

closeWithReturn(parent, is_ret)

end event

type cb_ok from commandbutton within w_requester_advanced_security
string tag = "o3lswf"
integer x = 1787
integer y = 1572
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
end type

event clicked;IF parent.event pfc_save() < 0 THEN
	return
ELSE
	is_ret = "ok"
	closeWithReturn(parent, is_ret)
END IF

end event

type cbx_no from checkbox within w_requester_advanced_security
integer x = 2363
integer y = 24
integer width = 146
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "all"
end type

event constructor;this.backColor = rgb(230, 230, 230)
this.textColor = rgb(96, 96, 96)

end event

event clicked;cbx_read.checked = FALSE
cbx_full.checked = FALSE

IF this.checked THEN
	of_checkAll("no_access_flag", "Y")
ELSE
	of_checkAll("no_access_flag", "N")
END IF

end event

type cbx_read from checkbox within w_requester_advanced_security
integer x = 2085
integer y = 24
integer width = 146
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "all"
end type

event constructor;this.backColor = rgb(230, 230, 230)
this.textColor = rgb(96, 96, 96)

end event

event clicked;cbx_full.checked = FALSE
cbx_no.checked = FALSE

IF this.checked THEN
	of_checkAll("read_access_flag", "Y")
ELSE
	of_checkAll("read_access_flag", "N")
END IF

end event

type cbx_full from checkbox within w_requester_advanced_security
integer x = 1806
integer y = 24
integer width = 146
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "all"
end type

event constructor;this.backColor = rgb(230, 230, 230)
this.textColor = rgb(96, 96, 96)

end event

event clicked;cbx_read.checked = FALSE
cbx_no.checked = FALSE

IF this.checked THEN
	of_checkAll("full_access_flag", "Y")
ELSE
	of_checkAll("full_access_flag", "N")
END IF

end event

type dw_rights from u_dw within w_requester_advanced_security
event ue_processitemchanged ( long al_row,  string as_col,  string as_data )
event ue_sync_cbx ( )
integer x = 846
integer y = 8
integer width = 1765
integer height = 1544
integer taborder = 20
string dataobject = "d_user_requester_ctx_op_type_right"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_processitemchanged(long al_row, string as_col, string as_data);// Handle itemchanged logic here. Changes are rejected in itemchanged and this event is invoked instead.
//
CHOOSE CASE as_col
	CASE "full_access_flag"
		this.object.full_access_flag[al_row] = as_data
		IF as_data = "Y" THEN
			this.object.read_access_flag[al_row] = "N"
			this.object.no_access_flag[al_row] = "N"
			/* Calculate new value for rights */
			this.object.rights[al_row] = string(this.object.ctx_op_type_id[al_row]) + "1"
		ELSE
			/* If all flags are de-selected, then select "no access" */
			this.object.no_access_flag[al_row] = "Y"
			this.object.rights[al_row] = string(this.object.ctx_op_type_id[al_row]) + "3"
		END IF
	CASE "read_access_flag"
		this.object.read_access_flag[al_row] = as_data
		IF as_data = "Y" THEN
			this.object.full_access_flag[al_row] = "N"
			this.object.no_access_flag[al_row] = "N"
			/* Calculate new value for rights */
			this.object.rights[al_row] = string(this.object.ctx_op_type_id[al_row]) + "2"
		ELSE
			this.object.no_access_flag[al_row] = "Y"
			this.object.rights[al_row] = string(this.object.ctx_op_type_id[al_row]) + "3"
		END IF
	CASE "no_access_flag"
		IF as_data = "N" THEN
			/* Don't allow explicitly setting this value. Default value is "Y", which can be changed by setting one of the other flags */
			return
		ELSE
			this.object.full_access_flag[al_row] = "N"
			this.object.read_access_flag[al_row] = "N"
			this.object.no_access_flag[al_row] = "Y"
			/* Calculate new value for rights */
			this.object.rights[al_row] = string(this.object.ctx_op_type_id[al_row]) + "3"
		END IF
END CHOOSE

end event

event ue_sync_cbx();// Synchronize cbx_full, cbx_read and cbx_no with the current state of the data
//
long ll_row

/* Check full_access_flag */
ll_row = this.find("full_access_flag = 'N'", 1, this.rowCount())
cbx_full.checked = (ll_row = 0)

/* Check read_access_flag */
ll_row = this.find("read_access_flag = 'N'", 1, this.rowCount())
cbx_read.checked = (ll_row = 0)

/* Check no_access_flag */
ll_row = this.find("no_access_flag = 'N'", 1, this.rowCount())
cbx_no.checked = (ll_row = 0)

end event

event constructor;call super::constructor;of_setTransObject(SQLCA)

end event

event pfc_retrieve;call super::pfc_retrieve;return this.retrieve(is_user_id)

end event

event retrieveend;call super::retrieveend;long ll_row

ll_row = this.find("new_flag = 'Y'", 1, this.rowCount())

DO WHILE ll_row > 0
	/* Set up row for insert. */
	this.setItemStatus(ll_row, 0, primary!, newModified!)
	this.object.new_flag[ll_row] = "N"
	ll_row = this.find("new_flag = 'Y'", ll_row + 1, this.rowCount() + 1)
LOOP

end event

event itemchanged;call super::itemchanged;IF ancestorreturnvalue <> 0 THEN
	return ancestorreturnvalue
END IF

CHOOSE CASE dwo.name
	CASE "full_access_flag", "read_access_flag", "no_access_flag"
		cbx_full.checked = FALSE
		cbx_read.checked = FALSE
		cbx_no.checked = FALSE
		this.event post ue_processItemChanged(row, dwo.name, data)
		return 2
END CHOOSE

return 0

end event

event pfc_updatespending;call super::pfc_updatespending;IF il_advanced_security = 0 THEN
	/* Set up ds_user to update user_requestor.advanced_security */
	IF ds_user.rowCount() = 0 THEN
		ds_user.insertRow(0)
	END IF
	ds_user.object.user_id[1] = is_user_id
	ds_user.resetUpdate()
	ds_user.object.advanced_security[1] = 1
	return 1
ELSE
	ds_user.reset()
	return ancestorreturnvalue
END IF

end event

event pfc_resetupdate;call super::pfc_resetupdate;il_advanced_security = 1

return ancestorreturnvalue

end event

type dw_type from u_dw within w_requester_advanced_security
event ue_filterrights ( )
integer x = 9
integer y = 8
integer width = 823
integer height = 1544
integer taborder = 10
string dataobject = "d_ctx_op_type_list"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_filterrights();string ls_filter = ""
long ll_row

ll_row = this.getRow()
IF ll_row > 0 THEN
	ls_filter = "ctx_op_type_id = " + string(this.object.ctx_op_type_id[ll_row])
END IF

dw_rights.setRedraw(FALSE)
dw_rights.setFilter(ls_filter)
dw_rights.filter()
dw_rights.sort()
dw_rights.setRedraw(TRUE)

// Synchronize cbx_full, cbx_read and cbx_no with the current state of the data in dw_rights
//
/* cbx_full */
ll_row = dw_rights.find("full_access_flag = 'N'", 1, this.rowCount())
cbx_full.checked = (ll_row = 0)

/* cbx_read */
ll_row = dw_rights.find("read_access_flag = 'N'", 1, this.rowCount())
cbx_read.checked = (ll_row = 0)

/* cbx_no */
ll_row = dw_rights.find("no_access_flag = 'N'", 1, this.rowCount())
cbx_no.checked = (ll_row = 0)

end event

event constructor;call super::constructor;of_setTransObject(SQLCA)

end event

event pfc_retrieve;call super::pfc_retrieve;long ll_ret

// Set flag, so that rowfocuschanged can be suppressed
ib_retrieving = TRUE
ll_ret = this.retrieve()
ib_retrieving = FALSE

return ll_ret

end event

event rowfocuschanged;call super::rowfocuschanged;string ls_filter = ""

IF ib_retrieving THEN
	return
END IF

this.selectRow(0, FALSE)

IF currentrow > 0 THEN
	this.selectRow(currentrow, TRUE)
END IF

this.event ue_filterRights()

end event

type ds_user from n_ds within w_requester_advanced_security descriptor "pb_nvo" = "true" 
string dataobject = "d_requester_account_edit"
end type

on ds_user.create
call super::create
end on

on ds_user.destroy
call super::destroy
end on

