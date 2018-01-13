$PBExportHeader$w_recred_batch.srw
forward
global type w_recred_batch from w_master
end type
type cb_help from commandbutton within w_recred_batch
end type
type dw_verif from u_dw within w_recred_batch
end type
type dw_exp from u_dw within w_recred_batch
end type
type cbx_manual from checkbox within w_recred_batch
end type
type st_facil from statictext within w_recred_batch
end type
type dw_facility from u_dw within w_recred_batch
end type
type dw_pracs from u_dw within w_recred_batch
end type
type cbx_verif from checkbox within w_recred_batch
end type
type cb_close from commandbutton within w_recred_batch
end type
type cb_run from commandbutton within w_recred_batch
end type
type cbx_priv from checkbox within w_recred_batch
end type
type cb_pracs from commandbutton within w_recred_batch
end type
type gb_1 from groupbox within w_recred_batch
end type
end forward

global type w_recred_batch from w_master
integer width = 2971
integer height = 2260
string title = "Batch Reappointment Process"
cb_help cb_help
dw_verif dw_verif
dw_exp dw_exp
cbx_manual cbx_manual
st_facil st_facil
dw_facility dw_facility
dw_pracs dw_pracs
cbx_verif cbx_verif
cb_close cb_close
cb_run cb_run
cbx_priv cbx_priv
cb_pracs cb_pracs
gb_1 gb_1
end type
global w_recred_batch w_recred_batch

type variables
long ii_facil
long il_pracs[]
long il_appt_id
end variables

on w_recred_batch.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.dw_verif=create dw_verif
this.dw_exp=create dw_exp
this.cbx_manual=create cbx_manual
this.st_facil=create st_facil
this.dw_facility=create dw_facility
this.dw_pracs=create dw_pracs
this.cbx_verif=create cbx_verif
this.cb_close=create cb_close
this.cb_run=create cb_run
this.cbx_priv=create cbx_priv
this.cb_pracs=create cb_pracs
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.dw_verif
this.Control[iCurrent+3]=this.dw_exp
this.Control[iCurrent+4]=this.cbx_manual
this.Control[iCurrent+5]=this.st_facil
this.Control[iCurrent+6]=this.dw_facility
this.Control[iCurrent+7]=this.dw_pracs
this.Control[iCurrent+8]=this.cbx_verif
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_run
this.Control[iCurrent+11]=this.cbx_priv
this.Control[iCurrent+12]=this.cb_pracs
this.Control[iCurrent+13]=this.gb_1
end on

on w_recred_batch.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.dw_verif)
destroy(this.dw_exp)
destroy(this.cbx_manual)
destroy(this.st_facil)
destroy(this.dw_facility)
destroy(this.dw_pracs)
destroy(this.cbx_verif)
destroy(this.cb_close)
destroy(this.cb_run)
destroy(this.cbx_priv)
destroy(this.cb_pracs)
destroy(this.gb_1)
end on

event open;call super::open;//this object created 7-2008 for new batch recredential functionality - maha
long f
string ls_from
gs_batch_search lstr_array
datawindowchild dwchild

dw_pracs.settransobject(sqlca)
dw_facility.settransobject(sqlca)
lstr_array =  message.powerobjectparm

if upperbound(lstr_array.li_prac_id) = 0 then
	messagebox("???","No pracs in array")
else
	il_pracs  =lstr_array.li_prac_id
	ii_facil = lstr_array.ll_facility[1]
	ls_from=lstr_array.ls_name[1]
end if

if ls_from = "AI" then //if run from action items, the facility select is not necessary
	st_facil.visible = false
	dw_facility.visible = false
	cb_pracs.visible = false
	dw_pracs.retrieve(il_pracs,ii_facil)
else
	dw_facility.getchild("facility_facility_id",dwchild)
	dwchild.settransobject(sqlca)
	dwchild.retrieve(gs_user_id)
end if








end event

event closequery;return 0
end event

type cb_help from commandbutton within w_recred_batch
integer x = 2423
integer y = 228
integer width = 462
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&About Options"
end type

event clicked;string ls_mes

ls_mes = "The Reverify Credentials setting will copy the appropriate verifications per the verification rules and will also check for any missing ones and add them.~r~rThe Rollover Privileges setting will add Requested privileges for any Granted privileges the provider has currently.~r~rThe Automatic Using Defaults setting will complete the verification process without prompts to the user, using default settings for the reappointment data."

Messagebox ("About Run Options",ls_mes )
end event

type dw_verif from u_dw within w_recred_batch
boolean visible = false
integer x = 873
integer y = 180
integer width = 137
integer height = 92
integer taborder = 60
string dataobject = "d_copy_verification"
end type

type dw_exp from u_dw within w_recred_batch
boolean visible = false
integer x = 617
integer y = 188
integer width = 119
integer height = 76
integer taborder = 50
string dataobject = "d_ver_exp_appt_for_batch"
end type

type cbx_manual from checkbox within w_recred_batch
integer x = 1691
integer y = 224
integer width = 681
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Automatic Using Defaults"
boolean checked = true
end type

type st_facil from statictext within w_recred_batch
integer x = 41
integer y = 24
integer width = 475
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Parent Facility:"
boolean focusrectangle = false
end type

type dw_facility from u_dw within w_recred_batch
integer x = 37
integer y = 84
integer width = 823
integer height = 92
integer taborder = 30
string dataobject = "d_facility_users_batch"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;ii_facil = integer(data)
end event

type dw_pracs from u_dw within w_recred_batch
integer x = 27
integer y = 348
integer width = 2843
integer height = 1760
integer taborder = 30
string dataobject = "d_practitioner_list_for_recred_batch"
end type

event buttonclicked;call super::buttonclicked;long i
integer v
//debugbreak()
if dwo.name = "b_all" then
	if this.object.b_all.text = 'Select All' then
		v = 1
		this.object.b_all.text = 'Deselect All'
	else
		v = 0
		this.object.b_all.text = 'Select All'
	end if
	
	for i = 1 to this.rowcount()
		this.setitem(i,"selected",v)
	next
end if
end event

type cbx_verif from checkbox within w_recred_batch
integer x = 1691
integer y = 76
integer width = 530
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reverify Credentials"
boolean checked = true
end type

type cb_close from commandbutton within w_recred_batch
integer x = 2423
integer y = 40
integer width = 462
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;close(parent)
end event

type cb_run from commandbutton within w_recred_batch
integer x = 2423
integer y = 132
integer width = 462
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Run"
end type

event clicked;long ll_req
integer res
integer li_silent
integer li_yield
long p
long pc
long pid
long v
long vc
long ll_rec
long ll_row
long dc
long ck
string ls_priv = ''
string ls_auto = ''
string ls_verif = ''
string ls_mes
datetime ldt_null

pfc_n_cst_ai_printletters lnv_recred
datastore lds_prac_privs
dw_pracs.accepttext( )

//setup checking
if dw_facility.visible = true and ii_facil = 0 then
	messagebox("Batch Recredentialing","Please select a facility")
	return
end if

pc = dw_pracs.rowcount() 

If pc < 1 then
	messagebox("Batch Recredentialing","No providers were retrieved. Please click Reselect Providers and select and option.")
	cb_pracs.visible = true
	return
end if

for p = 1 to pc
	if dw_pracs.getitemnumber(p,"selected") = 1 then ck++
next

if ck = 0 then
	messagebox("Batch Recredentialing","No providers were Selected.")
	return
end if

//priv setup
if cbx_priv.checked then
	ll_req = long(gnv_data.of_getitem('code_lookup','lookup_code',"upper(lookup_name) = 'PRIVILEGE STATUS'  and upper(code) = 'REQST'"))
	if ll_req < 19 then
		messagebox("Lookup table error", "Unable to find the Requested Status Record for Privileges.  Unable to continue.~rCheck your Privilege Status lookup table for a record with the code of 'REQST' ")
		Return
	end if
	
	ls_priv = "~r~rAdd Requested privileges based on existing granted privileges,"
	lds_prac_privs  = create datastore
	lds_prac_privs.dataobject = "d_prac_priv_granted_all_area"
	lds_prac_privs.settransobject( sqlca)
	setnull(ldt_null)
end if

//verif message
if cbx_verif.checked then ls_verif = "~r~rRecredential verifications based on the verifying facility verification rules,"	

//silent setting message
if cbx_manual.checked then 
	ls_auto = "~r~rRun without prompts to the user using default program settings."
	li_silent = 1
else
	ls_auto = "~r~rRun manually displaying the Appointment record and Privileges (if selected) for each provider.  Credential reverification (if selected) will be based on the verifying facility verification rules,"
	li_silent = 0
end if


res = messagebox("Batch Recred Process","This function will run the recredentialing process for the selected providers.  You have selected to:" + ls_verif  + ls_priv + ls_auto  + "  ~r~r Do you wish to continue?" ,question!,yesno!,2)
if res = 2 then return

lnv_recred = create pfc_n_cst_ai_printletters

//ADD a break/message window
open(w_yield)
w_yield.st_count.visible = true
w_yield.st_of.visible = true
w_yield.st_total.visible = true
w_yield.st_total.text = string(ck)

for p = 1 to dw_pracs.rowcount()
	if dw_pracs.getitemnumber(p,"selected") = 0 then continue //skip if not selected
	yield()
	if gi_yield = 1 then
		gi_yield = 0
		return
	end if
	pid = dw_pracs.getitemnumber(p,"prac_id")
	
	//check for missing verifications
	lnv_recred.of_find_missing_verifs(pid, ii_facil,li_silent, "R")
	//check verifications
	lnv_recred.of_retrieve_recred(dw_verif,pid, ii_facil)
	
	if lnv_recred.of_start_reappointment_processing_new(dw_verif, dw_exp  , ii_facil,pid, "R", li_silent ) < 0 then continue
	
	if cbx_priv.checked then
		//check to see if renewal privs already exist
		SELECT count( pd_priv_list.rec_id ) INTO :pc	FROM pd_priv_list where prac_id = :pid and facility_id = :ii_facil and active_status = 1 and status_code = :ll_req ;
		if pc > 0 then //if any requested privileges
			//skip
		else
			if li_silent = 1 then //run without user interaction
				debugbreak()
				pc = lds_prac_privs.retrieve(pid,ii_facil)
				//copy and reset the existing privileges
				if pc < 1 then
					//skip //if no privs then skip
				else
					SELECT Max( pd_priv_list.rec_id ) 	INTO :ll_rec  	FROM pd_priv_list;
					
					for v = 1 to pc
						lds_prac_privs.rowscopy( v, v,primary!, lds_prac_privs ,10000, primary!)
						ll_rec++
						ll_row = lds_prac_privs.rowcount()
						lds_prac_privs.setitem(ll_row,"pd_priv_list_rec_id",ll_rec)
						lds_prac_privs.setitem(ll_row,"pd_priv_list_status_code",ll_req) 
						lds_prac_privs.setitem(ll_row,"pd_priv_list_start_date",ldt_null) 
						lds_prac_privs.setitem(ll_row,"pd_priv_list_end_date",ldt_null) 
						lds_prac_privs.setitem(ll_row,"pd_priv_list_appt_stat_id", il_appt_id) //this value is set from the of_start_reapp... function
						lds_prac_privs.setitem(ll_row,"pd_priv_list_enter_date", today())
		
						lds_prac_privs.update( )
					next
				end if //copy privs
	
			else //if not silent open the window for the user to select
				ls_mes = "P*" + string(ii_facil) + "@" + string(pid) //format P*1@234
				openwithparm(w_priv_prac_renewal,ls_mes)
			end if
		end if //existing requested
			
	end if	
	dc++
	w_yield.st_count.text = string(dc)
	
next
if isvalid(w_yield) then close(w_yield)

destroy pfc_n_cst_ai_printletters
if isvalid(lds_prac_privs) then destroy lds_prac_privs

messagebox("Batch Recredentialing","The Recredentialing process has been completed for " + string(dc) + " providers.")
close(parent)
end event

type cbx_priv from checkbox within w_recred_batch
integer x = 1691
integer y = 152
integer width = 498
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rollover Privileges"
boolean checked = true
end type

type cb_pracs from commandbutton within w_recred_batch
integer x = 41
integer y = 212
integer width = 462
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Reselect Providers"
end type

event clicked;long ll_batch_id
long ll_pracs[]
integer ic
integer i
integer li_type
long p
datawindowchild dwchild
integer li_facility_id
gs_batch_search lst_sent

if ii_facil < 1 then
	messagebox("Batch Recred Function","Please select a Facility First.")
	dw_facility.visible = true
	st_facil.visible = true
	return
end if

//get pracs from batch or search screen
lst_sent = of_get_prac_batch()

ll_pracs[] = lst_sent.li_prac_id[]

gnv_appeondb.of_startqueue( )

p = dw_pracs.retrieve(ll_pracs[], ii_facil)

gnv_appeondb.of_commitqueue( )



end event

type gb_1 from groupbox within w_recred_batch
integer x = 1659
integer y = 16
integer width = 727
integer height = 300
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Run Options"
end type

