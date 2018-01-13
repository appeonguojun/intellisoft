$PBExportHeader$w_request_users.srw
forward
global type w_request_users from w_popup
end type
type cb_cancel from commandbutton within w_request_users
end type
type cb_ok from commandbutton within w_request_users
end type
type dw_1 from u_dw within w_request_users
end type
end forward

global type w_request_users from w_popup
integer x = 214
integer y = 221
integer width = 2331
integer height = 1244
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
end type
global w_request_users w_request_users

type variables
string 		is_type				//multi;single
string 		is_name
end variables

on w_request_users.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.dw_1
end on

on w_request_users.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
end on

event open;call super::open;string 				ls_arr[], ls_filter, ls_user
long 					i,	ll_find, ll_row

is_type = message.stringparm
is_name = ""
if not isnull(is_type) then 
	if pos(is_type,";") > 0 then
		is_name = mid(is_type ,pos(is_type,";")  + 1 , len(is_type) )
		is_type = left(is_type,pos(is_type,";") - 1 )
	end if 
	
	if is_type = "single" then 
		dw_1.dataobject = "d_request_users_occ"
		dw_1.settransobject( sqlca)
	elseif is_type = "multi" then 
		dw_1.dataobject = "d_request_users"		
		dw_1.settransobject( sqlca)
	elseif is_type = "multiallow" then 
		dw_1.dataobject = "d_request_multi_allow"		
		dw_1.settransobject( sqlca)
	end if 
		
end if 

if is_type <> "multiallow" then 
	dw_1.retrieve()	
	
	ll_row = dw_1.InsertRow(1)
	dw_1.SetItem(1,'user_id', '$<Creater>$')
	dw_1.SetItem(1,'email_id', '$<CreaterEmail>$')
end if 

//selected user
ll_row = 0 
if dw_1.rowcount( ) > 0 then
	gnv_string.of_parsetoarray(is_name, ";", ls_arr)
	if is_type = "multiallow" then 
		for i = 1 to dw_1.rowcount( )
			ls_user = dw_1.getitemstring( i,"name")
			if UpperBound(ls_arr)  > 0 then
				if gnv_string.of_isexists(ls_arr, lower(ls_user)) then 
					dw_1.setItem( i, "selected", 1)
					if ll_row = 0 then 	ll_row  = i
				else
					dw_1.setItem( i, "selected", 0)
				end if 
			else
				dw_1.setItem( i, "selected", 0)
			end if 
		next 
	Else	
		if not isnull(is_name) and trim(is_name) <> "" and  UpperBound(ls_arr)  > 0 then 
			for i = 1 to UpperBound(ls_arr)
				ll_find = dw_1.find( " user_id ='"+ string(ls_arr[i])+"' ",1, dw_1.rowcount())
				if ll_find > 0 then 
					dw_1.setItem( ll_find, "selected", 1)
					if ll_row = 0 then 	ll_row  = ll_find
				end if 
			next 
		end if 
	end if 
end if 

if ll_row > 0 then 
	dw_1.accepttext( )
	dw_1.setrow( ll_row)
	dw_1.scrolltorow(ll_row)
end if 
end event

type cb_cancel from commandbutton within w_request_users
integer x = 1961
integer y = 1060
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

event clicked;string ls_return

setnull(ls_return)

ClosewithReturn(Parent, ls_return)
//Close(Parent)
end event

type cb_ok from commandbutton within w_request_users
integer x = 1577
integer y = 1060
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;long 			ll_row, ll_selected
string 		ls_return, ls_userid


ls_return = ''
FOR ll_row = 1 to dw_1.RowCount()
	ll_selected = dw_1.GetItemNumber(ll_row, "selected") 
	if is_type = "multiallow" then 
		ls_userid = dw_1.GetItemString(ll_row, "name") 
	else
		ls_userid = dw_1.GetItemString(ll_row, "user_id") 
	end if 
	if ll_selected = 1 then 
		IF NOT IsNull(ls_userid) AND Len(Trim(ls_userid)) > 0 THEN
			if not isnull(is_type) and is_type = "single" then 
				ls_return = ls_userid
				exit
			else
				//Added By Mark Lee 05/10/2016
				if ls_return <> '' and pos(lower(ls_return),  lower(ls_userid) + ";" ) > 0  then 
					continue
				end if 
				ls_return += ls_userid + ";"				
			end if 
		end if 
	end if 
Next

if right(ls_return, 1) = ";" then 
	ls_return = left(ls_return, len(ls_return) - 1)
end if 

ClosewithReturn(Parent, ls_return)
end event

type dw_1 from u_dw within w_request_users
integer y = 20
integer width = 2309
integer height = 1020
integer taborder = 10
string dataobject = "d_request_users"
end type

event constructor;call super::constructor;
of_setupdateable(false)
of_SetRowSelect(true)
end event

event itemchanged;call super::itemchanged;long		i,	ll_rowcount
	
if row <= 0 then return 	

choose case dwo.name
	case "selected"
		if is_type = "single" then 				
			ll_rowcount = this.rowcount( )
			if long(data) = 1 then 
				for i = 1 to ll_rowcount
					if i = row then continue
					this.SetItem(i,"selected",0)
				next 
			end if 	
		end if 
end choose 
end event

