$PBExportHeader$w_request_form_role.srw
forward
global type w_request_form_role from w_response
end type
type cb_unselectall2 from commandbutton within w_request_form_role
end type
type cb_selectall2 from commandbutton within w_request_form_role
end type
type cb_unselectall1 from commandbutton within w_request_form_role
end type
type cb_selectall1 from commandbutton within w_request_form_role
end type
type dw_2 from u_dw within w_request_form_role
end type
type st_msg from statictext within w_request_form_role
end type
type cb_ok from commandbutton within w_request_form_role
end type
type cb_cancel from commandbutton within w_request_form_role
end type
type dw_1 from u_dw within w_request_form_role
end type
type gb_1 from groupbox within w_request_form_role
end type
type gb_2 from groupbox within w_request_form_role
end type
type gb_3 from groupbox within w_request_form_role
end type
end forward

global type w_request_form_role from w_response
string tag = "Request Form Role"
integer x = 214
integer y = 221
integer width = 1559
integer height = 2096
string title = "Request Form Role"
cb_unselectall2 cb_unselectall2
cb_selectall2 cb_selectall2
cb_unselectall1 cb_unselectall1
cb_selectall1 cb_selectall1
dw_2 dw_2
st_msg st_msg
cb_ok cb_ok
cb_cancel cb_cancel
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_request_form_role w_request_form_role

type variables
long			il_request_id
string 		is_admin
end variables

on w_request_form_role.create
int iCurrent
call super::create
this.cb_unselectall2=create cb_unselectall2
this.cb_selectall2=create cb_selectall2
this.cb_unselectall1=create cb_unselectall1
this.cb_selectall1=create cb_selectall1
this.dw_2=create dw_2
this.st_msg=create st_msg
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_unselectall2
this.Control[iCurrent+2]=this.cb_selectall2
this.Control[iCurrent+3]=this.cb_unselectall1
this.Control[iCurrent+4]=this.cb_selectall1
this.Control[iCurrent+5]=this.dw_2
this.Control[iCurrent+6]=this.st_msg
this.Control[iCurrent+7]=this.cb_ok
this.Control[iCurrent+8]=this.cb_cancel
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.gb_1
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.gb_3
end on

on w_request_form_role.destroy
call super::destroy
destroy(this.cb_unselectall2)
destroy(this.cb_selectall2)
destroy(this.cb_unselectall1)
destroy(this.cb_selectall1)
destroy(this.dw_2)
destroy(this.st_msg)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;n_ds		lds_role_select
long		ll_cnt, i, ll_insertrow
string		ls_user, ls_arr_admin[]

il_request_id = Message.doubleparm

if isnull(il_request_id ) then
	this.event close( )
elseif il_request_id > 0 then 
	lds_role_select 	=	create n_ds
	lds_role_select.dataobject = "d_request_form_role_select"
	lds_role_select.settransobject( sqlca)
	
	dw_1.reset( )
	dw_2.reset( )
	gnv_appeondb.of_startqueue( )
	dw_1.retrieve( il_request_id )
	lds_role_select.retrieve(il_request_id )

	dw_2.retrieve( )
	Select admin 
	Into :is_admin
	From request_form 
	Where request_id = :il_request_id using sqlca;
	gnv_appeondb.of_commitqueue( )
	
	ll_cnt = lds_role_select.rowcount( )
	if ll_cnt > 0 then 
		for i = 1 to ll_cnt
			ll_insertrow	= dw_1.insertrow(0)
			dw_1.setItem( ll_insertrow, 'role_id',	lds_role_select.GetItemNumber(i,'role_id')	)
			dw_1.setItem( ll_insertrow, 'request_id',	il_request_id)
		next
	end if 
	
	destroy lds_role_select
	
	if dw_2.rowcount() > 0 then
		if not isnull(is_admin) and trim(is_admin) <> "" then
			gnv_string.of_parsetoarray(lower(is_admin), ";", ls_arr_admin)				//Added By Mark Lee 10/22/2015
			for i = 1 to dw_2.rowcount()
				ls_user = dw_2.GetItemString(i, "user_id")
				if not isnull(ls_user) and trim(ls_user) <> "" and gnv_string.of_isexists( ls_arr_admin, lower(ls_user))  then 
					dw_2.SetItem(i,"selected",1)
					dw_2.SelectRow( 0,false)
					dw_2.Setrow( i)
					dw_2.scrolltorow(i)
					dw_2.SelectRow( i,True)
//					exit																			//Commented By Mark Lee 10/22/2015
				end if 
			next 
		end if 
	end if 
	
end if 

ib_disableclosequery = true				//close
end event

type cb_unselectall2 from commandbutton within w_request_form_role
integer x = 466
integer y = 1776
integer width = 402
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Unselect All"
end type

event clicked;integer i

if dw_2.rowcount() >  0 then
	for i = 1 to dw_2.rowcount()
		dw_2.setitem(i,"selected",0)
	next
end if 
end event

type cb_selectall2 from commandbutton within w_request_form_role
integer x = 46
integer y = 1776
integer width = 402
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All"
end type

event clicked;integer i

if dw_2.rowcount() >  0 then
	for i = 1 to dw_2.rowcount()
		dw_2.setitem(i,"selected",1)
	next
end if 
end event

type cb_unselectall1 from commandbutton within w_request_form_role
integer x = 466
integer y = 972
integer width = 402
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Unselect All"
end type

event clicked;integer i

if dw_1.rowcount() >  0 then
	for i = 1 to dw_1.rowcount()
		dw_1.setitem(i,"checked","N")
	next
end if 
end event

type cb_selectall1 from commandbutton within w_request_form_role
integer x = 46
integer y = 972
integer width = 402
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All"
end type

event clicked;integer i

if dw_1.rowcount() >  0 then
	for i = 1 to dw_1.rowcount()
		dw_1.setitem(i,"checked","Y")
	next
end if 
end event

type dw_2 from u_dw within w_request_form_role
integer x = 50
integer y = 1148
integer width = 1445
integer height = 620
integer taborder = 20
string dataobject = "d_security_users_list"
boolean hscrollbar = true
end type

event constructor;call super::constructor;this.of_SetUpdateAble(false)
this.of_setrowselect( true)
end event

event itemchanged;call super::itemchanged;long		i,	ll_rowcount
	
if row <= 0 then return 	

//Added By Mark Lee 10/22/2015
//choose case dwo.name
//	case "selected"
//		ll_rowcount = this.rowcount( )
//		if long(data) = 1 then 
//			for i = 1 to ll_rowcount
//				if i = row then continue
//				this.SetItem(i,"selected",0)
//			next 
//		end if 	
//end choose 
end event

type st_msg from statictext within w_request_form_role
integer x = 64
integer y = 68
integer width = 1431
integer height = 184
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "The current permission role settings determine whether a user of a certain role has access to the Request Template name in the Contract Request application’s New Request module."
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_request_form_role
integer x = 690
integer y = 1904
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;string 		ls_userid, ls_admin	
integer 		li_selected
long			ll_row
boolean		lbn_update = false 

if dw_1.modifiedcount( ) + dw_1.deletedcount( ) > 0 then 
	if Event pfc_save() >= 0 then 
		lbn_update = true
	end if 
end if 

ls_admin = ''
FOR ll_row = 1 to dw_2.RowCount()
	li_selected = dw_2.GetItemNumber(ll_row, "selected") 
	ls_userid = dw_2.GetItemString(ll_row, "user_id") 
	if li_selected = 1 then 
		IF NOT IsNull(ls_userid) AND Len(Trim(ls_userid)) > 0 THEN				
//			if (isnull(is_admin) or trim(is_admin) = '' ) or  lower(is_admin) <> lower(ls_userid)  then				//Commented By Mark Lee 10/22/2015
//				lbn_update = true
				ls_admin += ls_userid+";"
//			end if
//			exit
		end if 
	end if 
Next

//Added By Mark Lee 10/22/2015
if right(ls_admin, 1) = ";" then 
	ls_admin = left(ls_admin, len(ls_admin) - 1)
end if 

if len(ls_admin)  > 2000 then 									//Added By Mark Lee 10/22/2015
	messagebox(gnv_app.iapp_object.DisplayName,"The users you selected exceed 2000 characters. ~r~nPlease select fewer users. ")
	return 
end if 

if (isnull(is_admin) or trim(is_admin) = "")  and  trim(ls_admin) <> "" then
	lbn_update = true
elseif not isnull(is_admin) and trim(is_admin) <> "" and lower(ls_admin) <> lower(is_admin) then 
	lbn_update = true
end if 

if lbn_update = true then
	if isvalid(w_request_form) then
		if trim(ls_admin) <> "" then
			w_request_form.of_sync_update("admin",ls_admin)
		else
			w_request_form.of_sync_update("","")
		end if 
	end if
end if 

Close(Parent)
end event

type cb_cancel from commandbutton within w_request_form_role
integer x = 1115
integer y = 1904
integer width = 402
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;//dw_1.reset()
ib_disableclosequery = true	
Close(Parent)
end event

type dw_1 from u_dw within w_request_form_role
integer x = 46
integer y = 344
integer width = 1458
integer height = 620
integer taborder = 10
string dataobject = "d_request_form_role"
boolean hscrollbar = true
end type

event constructor;call super::constructor;//SetRowFocusIndicator(Hand!)

this.of_SetUpdateAble(true)
this.of_setrowselect( true)
end event

event pfc_preupdate;call super::pfc_preupdate;long			i,	ll_request_role_id, ll_cnt, ll_rowcount, ll_request_id, ll_new

ll_rowcount  = this.rowcount()
if ll_rowcount > 0 then 
	for i = 1 to ll_rowcount
		ll_request_role_id = this.GetItemNumber(i,"request_role_id")
		if isnull(ll_request_role_id) or ll_request_role_id <= 0 then 
			ll_cnt ++
		end if 
//		ll_request_id = this.GetItemNumber(i,"request_id")
//		if isnull(ll_request_id) or ll_request_id <= 0 then 
//			this.SetItem(i,"request_id",il_request_id)
//		end if 
	next 

	if ll_cnt > 0 then 
		ll_new = gnv_app.of_get_id(upper("request_form_role_id"), ll_cnt)	

		for i = 1 to ll_rowcount
			ll_request_role_id = this.GetItemNumber(i,"request_role_id")
			if isnull(ll_request_role_id) or ll_request_role_id <= 0 then 
				this.SetItem( i, "request_role_id", ll_new )
				ll_new ++
			end if 
		next 
	end if 
end if 

return 1
end event

event itemchanged;call super::itemchanged;if row <= 0 then return

ib_disableclosequery = false


end event

event rowfocuschanged;call super::rowfocuschanged;//long		ll_role_id
//
//if currentrow > 0 then
//	ll_role_id = this.getItemNumber( currentrow, "role_id")
//	dw_2.reset()
//	dw_2.retrieve( ll_role_id)
//end if 
//
end event

type gb_1 from groupbox within w_request_form_role
integer x = 32
integer y = 8
integer width = 1481
integer height = 260
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "Note:"
end type

type gb_2 from groupbox within w_request_form_role
integer x = 32
integer y = 280
integer width = 1481
integer height = 792
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Role Name"
end type

type gb_3 from groupbox within w_request_form_role
integer x = 32
integer y = 1088
integer width = 1481
integer height = 788
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Template Administrator"
end type

