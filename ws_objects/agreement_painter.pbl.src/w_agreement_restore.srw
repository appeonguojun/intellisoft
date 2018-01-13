$PBExportHeader$w_agreement_restore.srw
forward
global type w_agreement_restore from w_response
end type
type dw_1 from u_dw_contract within w_agreement_restore
end type
type cb_sall from commandbutton within w_agreement_restore
end type
type st_1 from statictext within w_agreement_restore
end type
type cb_ok from commandbutton within w_agreement_restore
end type
type cb_cancel from commandbutton within w_agreement_restore
end type
end forward

global type w_agreement_restore from w_response
string tag = "Restore"
integer width = 2569
integer height = 2096
string title = "Restore"
boolean controlmenu = false
dw_1 dw_1
cb_sall cb_sall
st_1 st_1
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_agreement_restore w_agreement_restore

type variables
string 		is_dataobject
end variables

forward prototypes
public function integer of_checkupdate ()
end prototypes

public function integer of_checkupdate ();//Added By Mark Lee 07/16/2015
long			i, 		ll_count, ll_id, ll_find
n_ds 			lds_folder_restore


if dw_1.rowcount( ) > 0 then 
	if is_dataobject = "d_agreement_clause_restore" then 
		lds_folder_restore = create n_ds 
		lds_folder_restore.dataobject = "d_agreement_clause_folder_restore"
		lds_folder_restore.Settransobject( sqlca)
		ll_count = lds_folder_restore.retrieve( )
		if ll_count > 0 then 
			for i = 1 to dw_1.rowcount( )
				ll_id = dw_1.GetItemnumber( i,"ctx_acp_folder_id")				
				ll_find = lds_folder_restore.find( " ctx_acp_folder_id="+string(ll_id), 1,ll_count)
				if not isnull(ll_find) and ll_find >0 then 
					lds_folder_restore.setitem(ll_find,"deleted",'N')
					lds_folder_restore.setitem(ll_find,"deleted_by",gs_user_id)
					lds_folder_restore.setitem(ll_find,"deleted_date",DateTime(Date(Now()), Time(Now())) )
				end if 
			next 
			if lds_folder_restore.modifiedcount( ) > 0 then 
				lds_folder_restore.update( )
				commit using sqlca;
			end if 
		end if 
		destroy lds_folder_restore
	end if 
	
end if 

return 1 
end function

on w_agreement_restore.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_sall=create cb_sall
this.st_1=create st_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_sall
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_ok
this.Control[iCurrent+5]=this.cb_cancel
end on

on w_agreement_restore.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_sall)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;call super::open;//ib_disableclosequery = true				//close

is_dataobject = Message.StringParm

if isnull(is_dataobject) or trim(is_dataobject) = '' then 
	CloseWithReturn(this, "failure")
else
	if lower(is_dataobject) = 'd_agreement_clause_restore' then 
		this.title = "Clause Library Restore"
		this.tag = "Clause Library Restore"
	elseif lower(is_dataobject) = 'd_agreement_template_restore' then 
		this.title = "Agreement Template Restore"
		this.tag = "Agreement Template Restore"		
	end if 
	
	dw_1.dataobject = is_dataobject
	dw_1.settransobject( sqlca)
	dw_1.retrieve( )
	if dw_1.rowcount( ) > 0 then 
		st_1.text = "Select the restore name: "
		st_1.textcolor = rgb(0,0,0)
	else
		st_1.text = "No restore record. "
		st_1.textcolor = rgb(255,0,0)
	end if 
end if 




//this.event pfc_cancel( )			//	ib_disableclosequery = true				//close


end event

event pfc_postopen;call super::pfc_postopen;this.event pfc_cancel( )			//	ib_disableclosequery = true				//close
end event

type dw_1 from u_dw_contract within w_agreement_restore
integer x = 27
integer y = 96
integer width = 2496
integer height = 1760
integer taborder = 20
string dataobject = "d_agreement_clause_restore"
boolean hscrollbar = true
end type

event constructor;call super::constructor;this.of_SetUpdateAble(true)
this.of_setrowselect( true)
end event

event itemchanged;call super::itemchanged;ib_disableclosequery = false

end event

event pfc_preupdate;call super::pfc_preupdate;//Added By Mark Lee 07/16/2015
if this.rowcount( ) > 0 then 
	return of_checkupdate()
end if 

return 1 
end event

type cb_sall from commandbutton within w_agreement_restore
integer x = 64
integer y = 1880
integer width = 402
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select All"
end type

event clicked;integer i

if dw_1.rowcount() >  0 then
	if this.text = "&Select All" then	
		for i = 1 to dw_1.rowcount()
			dw_1.setitem(i,"deleted","N")
		next
		this.text = "&Deselect All"	
	elseif this.text = "&Deselect All" then	
		for i = 1 to dw_1.rowcount()
			dw_1.setitem(i,"deleted","Y")
		next
		this.text = "&Select All"
	end if
end if 
end event

type st_1 from statictext within w_agreement_restore
integer x = 27
integer y = 32
integer width = 613
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select the restore name:"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_agreement_restore
integer x = 1687
integer y = 1892
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

event clicked;long		i
string 	ls_deleted
boolean	lbn_update =false
DataWindowChild		ldwc_request_name

dw_1.accepttext( )
for i = 1 to dw_1.rowcount()
	ls_deleted = dw_1.getitemString(i,"deleted")
	if ls_deleted = "N" then
		dw_1.setitem(i,"deleted_by",gs_user_id)
		dw_1.setitem(i,"deleted_date",DateTime(Date(Now()), Time(Now())) )
//		dw_1.setitem(i,"modify_date",DateTime(Date(Now()), Time(Now())) )
		lbn_update = true
	end if
Next

if 	lbn_update = true then
	dw_1.event pfc_update(false, true)
	
	commit using sqlca;
	
	CloseWithReturn(Parent, 'success')
else
	CloseWithReturn(Parent, 'failure')
end if 





end event

type cb_cancel from commandbutton within w_agreement_restore
integer x = 2112
integer y = 1892
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
//ib_disableclosequery = true	
Parent.event pfc_cancel( )			//	ib_disableclosequery = true				//close
CloseWithReturn(Parent, 'failure')
end event

