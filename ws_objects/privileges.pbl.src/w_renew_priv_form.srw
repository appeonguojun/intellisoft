$PBExportHeader$w_renew_priv_form.srw
forward
global type w_renew_priv_form from window
end type
type cbx_history from checkbox within w_renew_priv_form
end type
type st_4 from statictext within w_renew_priv_form
end type
type cbx_cur from checkbox within w_renew_priv_form
end type
type cb_preview from commandbutton within w_renew_priv_form
end type
type st_3 from statictext within w_renew_priv_form
end type
type rb_all from radiobutton within w_renew_priv_form
end type
type rb_one from radiobutton within w_renew_priv_form
end type
type dw_pracs from datawindow within w_renew_priv_form
end type
type dw_browse from u_dw within w_renew_priv_form
end type
type cb_add from commandbutton within w_renew_priv_form
end type
type st_2 from statictext within w_renew_priv_form
end type
type st_facil from statictext within w_renew_priv_form
end type
type dw_facility from datawindow within w_renew_priv_form
end type
type dw_batchlist from datawindow within w_renew_priv_form
end type
type dw_list from datawindow within w_renew_priv_form
end type
type st_1 from statictext within w_renew_priv_form
end type
type dw_stat from datawindow within w_renew_priv_form
end type
type st_stat from statictext within w_renew_priv_form
end type
type cb_close from commandbutton within w_renew_priv_form
end type
type cb_print from commandbutton within w_renew_priv_form
end type
type dw_1 from datawindow within w_renew_priv_form
end type
type gb_2 from groupbox within w_renew_priv_form
end type
type dw_3 from datawindow within w_renew_priv_form
end type
type dw_2 from datawindow within w_renew_priv_form
end type
type dw_clin from datawindow within w_renew_priv_form
end type
type ddlb_selectform from dropdownlistbox within w_renew_priv_form
end type
end forward

global type w_renew_priv_form from window
integer x = 14
integer y = 80
integer width = 3611
integer height = 2396
boolean titlebar = true
string title = "Practitioners Privilege Forms "
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cbx_history cbx_history
st_4 st_4
cbx_cur cbx_cur
cb_preview cb_preview
st_3 st_3
rb_all rb_all
rb_one rb_one
dw_pracs dw_pracs
dw_browse dw_browse
cb_add cb_add
st_2 st_2
st_facil st_facil
dw_facility dw_facility
dw_batchlist dw_batchlist
dw_list dw_list
st_1 st_1
dw_stat dw_stat
st_stat st_stat
cb_close cb_close
cb_print cb_print
dw_1 dw_1
gb_2 gb_2
dw_3 dw_3
dw_2 dw_2
dw_clin dw_clin
ddlb_selectform ddlb_selectform
end type
global w_renew_priv_form w_renew_priv_form

type variables
long il_pracid
long il_pracs[]
integer ii_clinid
integer ii_facid
integer ii_facs[]
long il_status
long il_reqst
string is_clin_filter
string is_prac_name

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-09 By: Rodger Wu (Inova)
//$<reason> Define this variable for new ddlb object.
Integer ii_selectedform = 1
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_filter (long ai_status)
public function integer of_prac_name (long ai_pracid)
public function integer of_preview ()
public function integer of_dataobject ()
end prototypes

public function integer of_filter (long ai_status);long ll_status
string ls_filt
string ls_filt_col
datawindowchild dwchild
integer fnd


if dw_1.dataobject = "d_prac_priv_list_all_status" or dw_1.dataobject = "d_prac_priv_list_all_status_w_notes" then
	ls_filt_col = "status_code "


	
	ll_status = ai_status
	
	if isnull(ll_status) or ll_status = 0 then
		ls_filt = ""
	elseif ll_status = 1 then //not requested
		if il_reqst < 1 then
			messagebox("Find error","Can't find Reqst code")
		else
			ls_filt = ls_filt_col + " <> " + string(il_reqst)
		end if
	elseif ll_status = 2 then //grant or Cond
		ls_filt = ls_filt_col + " in (24478,24479)" 
	else	
		ls_filt = ls_filt_col + " = " + string(ll_status)
	end if
else
	ls_filt_col = "facility_zip "
	
end if
		
	//filtname = this.getitemstring(row,"status_code")
	

if len(is_clin_filter) > 0 then
	if len(ls_filt) > 0 then
		ls_filt = ls_filt + " and " + is_clin_filter
	else
		ls_filt = is_clin_filter
	end if
end if

//messagebox("filter",ls_filt)

dw_1.Setfilter(ls_filt)
dw_1.filter( )



return 1
end function

public function integer of_prac_name (long ai_pracid);string ls_prac_name

il_pracs[1] = il_pracid
dw_pracs.settransobject(sqlca)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue()
//---------------------------- APPEON END ----------------------------

dw_pracs.retrieve(il_pracs[])
select full_name into :ls_prac_name from v_full_name where prac_id = :ai_pracid;

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

is_prac_name = ls_prac_name

return 1
end function

public function integer of_preview ();//Start Code Change ---- 09.10.2007 #V7 maha corrected code so that it works as it did in version 5
// by copying the v 5 code and modifying for the dropdowns rather than the radio buttons
integer r
integer rc
integer p
integer pc
long g
long ll_procd_id
long stat
string ls_stat
string ls_prac_name
long ll_clins[]
long ll_clin
integer clincnt
integer setvalue
integer fnd_g
integer fnd_r
long ll_nullarray[]

select lookup_code 
into :stat
from code_lookup 
where code = 'GRANTED';

if il_reqst < 1 then
	select lookup_code into :il_reqst from code_lookup where code = 'REQST';
end if

//messagebox("stat",stat)

if ii_facid < 1 then //maha added 8-03 
	messagebox("No Facility","No facility was available to run any report.  Please select Facility.")
	return -1
end if

if il_pracid < 1 then //maha added 8-03 
	messagebox("No Practitoner","No practitioner was available to run any report.")
	return -1
else
	select full_name into :ls_prac_name from v_full_name where prac_id = :il_pracid;
end if

ll_clins[] = ll_nullarray[] //clear array

debugbreak()

if dw_1.dataobject = "d_form_pract_priv_request_d" or dw_1.dataobject = "d_form_pract_priv_request_h" or dw_1.dataobject = "d_form_pract_priv_request_compare"  or dw_1.dataobject =  "d_form_clin_priv_request_master_inova" then
	if cbx_cur.checked = false then  //maha 040504 only if unchecked and no 
		if ii_clinid < 1 then //maha added 8-03 
			messagebox("No Clinical Area ","A Single Clinical Area is required to run this report.  Please select Clinical Area, or check the 'print from current practitoner privileges' checkbox to print a release form for the current Clinical Areas.")
			return -1
		else
			ll_clins[1] = ii_clinid
		end if
	else //checked - using prac current privs
		debugbreak()
		dw_3.settransobject(sqlca) //practitoner current clin areas that are not requested
		pc = dw_3.retrieve(il_pracid,ii_facid)
		if pc > 0 then
			for p = 1 to pc 
				ll_clins[p] = dw_3.getitemnumber(p,"clinical_area_id")
			next
		else // the clin area selected
			ll_clins[1] = ii_clinid
		end if	
	end if
end if



Choose Case ii_selectedform
	Case 1 //Privileges Without Notes
		dw_1.retrieve(il_pracid,ii_facs[])
		setvalue = 0
		IF Not cbx_history.checked THEN
			of_filter(il_status)
		END IF
	Case 2 //Privileges With Notes
		dw_1.retrieve(il_pracid,ii_facs[])
		setvalue = 0
		IF Not cbx_history.checked THEN
			of_filter(il_status)
		END IF
	Case 3 //Request Form with Headers
		rc = dw_1.retrieve(ii_facid,ll_clins)
		setvalue = 1
		dw_1.object.prac_name.text = ls_prac_name
	Case 4 //Request Form with Detail
		rc = dw_1.retrieve(ii_facid,ll_clins)
		setvalue = 1
		dw_1.object.prac_name.text = ls_prac_name
	Case 5 //Comparison Report
		if pc < 1 then
			messagebox("No Data","The practitioner has no active privileges from which to create this report.")
			return 1
		else
			rc = dw_1.retrieve(ii_facid,ll_clins[])
			setvalue = 1
		end if
	Case 6 //Complete Privilege Application with Description
		DataWindowChild ldwc_form
		
		dw_1.Retrieve( ii_facid, ll_clins[1] )
		
		//Start Code Change ---- 11.28.2006 #V7 maha
		dw_1.GetChild( "dw_2", ldwc_form )
		ldwc_form.Modify( "prac_name.text = '" + ls_prac_name + "'" )
		dw_1.GetChild( "dw_3", ldwc_form )
		ldwc_form.Modify( "prac_name.text = '" + ls_prac_name + "'" )
		if of_get_app_setting("set_46","I") = 1 then
			ldwc_form.Modify( "title1.text = 'Section Chief' " )
			ldwc_form.Modify( "title2.text = 'Department Chair'" )
			ldwc_form.Modify( "title3.text = 'Credentials Committee Chair'" )
			ldwc_form.Modify( "title4.text = 'Secretary, Medical Executive Committee'" )
			ldwc_form.Modify( "title5.text = 'Secretary, Inova Health Care Services Board'" )
		end if
		//End Code Change---11.28.2006
		
		dw_1.GetChild( "dw_1", ldwc_form )
		rc = ldwc_form.Rowcount()
		ldwc_form.Modify( "prac_name.text = '" + ls_prac_name + "'" )
		
		dw_2.settransobject(sqlca) //practitoner privs
		pc = dw_2.retrieve(il_pracid,ii_facid)
	
		for r = 1 to rc
			ll_procd_id = ldwc_form.getitemnumber(r,"procd_id")
			g = 0
	
			g = dw_2.find("procd_id = " + string(ll_procd_id)  + " and status_code <> " + string(il_reqst),1,pc)
			if g > 0 then
				ls_stat = dw_2.getitemstring(g,"code")
				ldwc_form.setitem(r,"facility_zip",ls_stat) 
			elseif g < 0 then
				messagebox("Find error in of_preview function","Contact ContractLogix Support")
				return -1
			else
				ldwc_form.setitem(r,"facility_zip","") 
			end if
		next

		Return 1;
End Choose

if setvalue = 1 then
	dw_2.settransobject(sqlca) //practitoner privs
	pc = dw_2.retrieve(il_pracid,ii_facid)
	debugbreak()
	for r = 1 to rc
		ll_procd_id = dw_1.getitemnumber(r,"procd_id") 
		g = 0
	//messagebox("ll_procd_id",ll_procd_id)
	//messagebox("ii_facid",ii_facid)
	//messagebox("gl_prac_id",gl_prac_id)
		g = dw_2.find("procd_id = " + string(ll_procd_id)  + " and status_code <> " + string(il_reqst),1,pc)
		if g > 0 then
			ls_stat = dw_2.getitemstring(g,"code")
			dw_1.setitem(r,"facility_zip",ls_stat) 
		elseif g < 0 then
			messagebox("Find error in of_preview function","Contact ContractLogix Support")
			return -1
		else
			dw_1.setitem(r,"facility_zip","") 
		end if
	next

	IF ii_selectedform = 5 THEN //Comparison Report
		dw_2.setfilter("") 
		dw_2.filter()

		for r = 1 to rc
			//if dw_1.getitemstring(r,"facility_zip","") = "REQST" then dw_1.setitem(r,"facility_zip","") 
			ll_procd_id = dw_1.getitemnumber(r,"procd_id") 
			fnd_r = dw_2.find("procd_id = " + string(ll_procd_id)  + " and status_code = " + string(il_reqst),1,pc)
			if fnd_r > 0 then
				fnd_g = dw_2.find("procd_id = " + string(ll_procd_id)  + " and status_code in (24478,24479)",1,pc)
				if fnd_g = 0 then
					dw_1.setitem(r,"col_r","R")
				elseif fnd_g > 0 then
					dw_1.setitem(r,"col_c","C") 
				end if
			elseif fnd_r = 0 then
				fnd_g = dw_2.find("procd_id = " + string(ll_procd_id)  + " and status_code in (24478,24479)",1,pc)
				if fnd_g > 0 then
					dw_1.setitem(r,"col_n","N")
				elseif fnd_g = 0 then
					dw_1.setitem(r,"col_d","D")
				end if
			else
				messagebox("Find error","Contact ContractLogix Support")
				return -1
			end if
		next
	end if
	
	//select full_name into :ls_prac_name from v_full_name where prac_id = :il_pracid;
	dw_1.object.prac_name.text = ls_prac_name
end if
//dw_1.object.prac_name.text = is_prac_name
//of_filter(il_status)

return 1

end function

public function integer of_dataobject ();//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-10-09 By: Rodger Wu (Inova)
//$<reason> Script adjustment due to old radiobutton objects removed.

/*
if rb_notes.checked then
	dw_1.dataobject = "d_prac_priv_list_all_status_w_notes"
elseif rb_nonotes.checked then
	dw_1.dataobject = "d_prac_priv_list_all_status"
elseif rb_dt.checked then
	dw_1.dataobject = "d_form_pract_priv_request_d"
elseif rb_hd.checked then
	dw_1.dataobject = "d_form_pract_priv_request_h"
elseif rb_comp.checked then
	dw_1.dataobject = "d_form_pract_priv_request_compare"
end if
*/

Choose Case ii_selectedform
	Case 1 //Privileges Without Notes
		IF cbx_history.Checked THEN
			dw_1.dataobject = "d_prac_priv_list_history"
		ELSE
			dw_1.dataobject = "d_prac_priv_list_all_status"
		END IF
	Case 2 //Privileges With Notes
		IF cbx_history.Checked THEN
			dw_1.dataobject = "d_prac_priv_list_history_w_notes"
		ELSE
			dw_1.dataobject = "d_prac_priv_list_all_status_w_notes"
		END IF
	Case 3 //Request Form with Headers
		dw_1.dataobject = "d_form_pract_priv_request_h"
	Case 4 //Request Form with Detail
		dw_1.dataobject = "d_form_pract_priv_request_d"
	Case 5 //Comparison Report
		dw_1.dataobject = "d_form_pract_priv_request_compare"
	Case 6 //Complete Privilege Application with Description
		dw_1.dataobject = "d_form_clin_priv_request_master_inova"
	case 7  //Privileges With staff cat/ dept             //Start Code Change ---- 11.08.2007 #V7 maha
		dw_1.dataobject = ""
End Choose

//---------------------------- APPEON END ----------------------------
	
dw_1.settransobject(sqlca)
	
return 1
end function

on w_renew_priv_form.create
this.cbx_history=create cbx_history
this.st_4=create st_4
this.cbx_cur=create cbx_cur
this.cb_preview=create cb_preview
this.st_3=create st_3
this.rb_all=create rb_all
this.rb_one=create rb_one
this.dw_pracs=create dw_pracs
this.dw_browse=create dw_browse
this.cb_add=create cb_add
this.st_2=create st_2
this.st_facil=create st_facil
this.dw_facility=create dw_facility
this.dw_batchlist=create dw_batchlist
this.dw_list=create dw_list
this.st_1=create st_1
this.dw_stat=create dw_stat
this.st_stat=create st_stat
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_1=create dw_1
this.gb_2=create gb_2
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_clin=create dw_clin
this.ddlb_selectform=create ddlb_selectform
this.Control[]={this.cbx_history,&
this.st_4,&
this.cbx_cur,&
this.cb_preview,&
this.st_3,&
this.rb_all,&
this.rb_one,&
this.dw_pracs,&
this.dw_browse,&
this.cb_add,&
this.st_2,&
this.st_facil,&
this.dw_facility,&
this.dw_batchlist,&
this.dw_list,&
this.st_1,&
this.dw_stat,&
this.st_stat,&
this.cb_close,&
this.cb_print,&
this.dw_1,&
this.gb_2,&
this.dw_3,&
this.dw_2,&
this.dw_clin,&
this.ddlb_selectform}
end on

on w_renew_priv_form.destroy
destroy(this.cbx_history)
destroy(this.st_4)
destroy(this.cbx_cur)
destroy(this.cb_preview)
destroy(this.st_3)
destroy(this.rb_all)
destroy(this.rb_one)
destroy(this.dw_pracs)
destroy(this.dw_browse)
destroy(this.cb_add)
destroy(this.st_2)
destroy(this.st_facil)
destroy(this.dw_facility)
destroy(this.dw_batchlist)
destroy(this.dw_list)
destroy(this.st_1)
destroy(this.dw_stat)
destroy(this.st_stat)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_clin)
destroy(this.ddlb_selectform)
end on

event open;integer li_facility_id


il_pracid = message.doubleparm
of_prac_name(il_pracid)

ii_facid = gi_facil_change
ii_facs[1] = ii_facid
dw_clin.settransobject(sqlca)
DataWindowChild dwchild
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
dw_clin.retrieve()
dw_clin.insertrow(1)
dw_clin.SetItem( 1, "clinical_area_description", "All" )
dw_clin.SetItem( 1, "clinical_area_id",0 )
ii_clinid = 0
dw_clin.GetChild( "clinical_area_description", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(ii_facid)
dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "clinical_area_description", "All" )
dwchild.SetItem( 1, "clinical_area_id",0 )

dw_facility.settransobject(sqlca)

dw_facility.getchild("facility_facility_id",dwchild)
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)
*/
gnv_appeondb.of_startqueue()
//dw_stat. The following script is moved from the constructor event of dw_stat 
dw_stat.retrieve()
dw_stat.GetChild( "status_code", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve()

//dw_batchlist. The following script is moved from the constructor event of dw_batchlist 
dw_batchlist.retrieve()

//The following script is modified
dw_clin.retrieve()
dw_clin.GetChild( "clinical_area_description", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve(ii_facid)

dw_facility.settransobject(sqlca)

dw_facility.getchild("facility_facility_id",dwchild)
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)

gnv_appeondb.of_commitqueue()

//dw_stat. The following script is moved from the constructor event of dw_stat 
dw_stat.InsertRow( 1 )
dw_stat.GetChild( "status_code", dwchild )
dwchild.settransobject(sqlca)

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "code", "All NOT Requested" )
dwchild.SetItem( 1, "lookup_code", 1 )

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "code", "All GRANT or COND" )
dwchild.SetItem( 1, "lookup_code", 2 )

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "code", "All" )
dwchild.SetItem( 1, "lookup_code", 0 )

//dw_batchlist. The following script is moved from the constructor event of dw_batchlist 
dw_batchlist.insertrow(1) 

//The following script is modified
dw_clin.insertrow(1)
dw_clin.SetItem( 1, "clinical_area_description", "All" )
dw_clin.SetItem( 1, "clinical_area_id",0 )
ii_clinid = 0
dw_clin.GetChild( "clinical_area_description", dwchild )
dwchild.settransobject(sqlca)
dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "clinical_area_description", "All" )
dwchild.SetItem( 1, "clinical_area_id",0 )
//---------------------------- APPEON END ----------------------------

//dw_facility.retrieve(gs_user_id)
dw_facility.insertrow(1)
if ii_facid < 1 or isnull(ii_facid) then //if no facility passed then get and set default
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-05
	//$<modify> 02.20.2006 By: Cao YongWang
	//$<reason> Performance tuning.
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*
	SELECT security_users.default_search_facility  
	INTO :li_facility_id  
	FROM security_users  
	WHERE security_users.user_id = :gs_user_id;
	*/
	li_facility_id = integer(gnv_data.of_getitem("security_users" , "default_search_facility" , "upper(user_id)='" + upper(gs_user_id) + "'"))
	//---------------------------- APPEON END ----------------------------
	
	IF Not IsNull( li_facility_id ) THEN //set user default facility
		dw_facility.SetItem( 1, "facility_facility_id", li_facility_id )
		ii_facid = li_facility_id
	else
	END IF
else
	dw_facility.SetItem( 1, "facility_facility_id", ii_facid )
end if




dw_1.settransobject(sqlca)
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-10 By: Rodger Wu (Inova)
//$<reason> Make index 1 as default form/report.

ddlb_selectform.SelectItem( 1 )
ddlb_selectform.Post Event SelectionChanged( 1 )

//---------------------------- APPEON END ----------------------------

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17



end event

type cbx_history from checkbox within w_renew_priv_form
integer x = 2043
integer y = 328
integer width = 942
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Print history privileges"
end type

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-10 By: Rodger Wu (Inova)
//$<reason> This is new object.
//ToDo:
//---------------------------- APPEON END ----------------------------

end event

type st_4 from statictext within w_renew_priv_form
integer x = 2039
integer y = 16
integer width = 448
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Form/Report"
boolean focusrectangle = false
end type

type cbx_cur from checkbox within w_renew_priv_form
integer x = 901
integer y = 328
integer width = 942
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Print from Practitioner current privileges"
end type

type cb_preview from commandbutton within w_renew_priv_form
integer x = 3109
integer y = 124
integer width = 439
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Preview"
end type

event clicked;of_dataobject()
of_preview()
end event

type st_3 from statictext within w_renew_priv_form
integer x = 41
integer y = 404
integer width = 841
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "Double-Click Name to preview report"
boolean focusrectangle = false
end type

type rb_all from radiobutton within w_renew_priv_form
integer x = 2542
integer y = 220
integer width = 178
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "All"
end type

type rb_one from radiobutton within w_renew_priv_form
integer x = 2149
integer y = 220
integer width = 320
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Individual"
boolean checked = true
end type

type dw_pracs from datawindow within w_renew_priv_form
integer x = 23
integer y = 472
integer width = 846
integer height = 1656
integer taborder = 120
boolean titlebar = true
string title = "Practitioners"
string dataobject = "d_practitioner_list"
boolean livescroll = true
end type

event clicked;integer r

r  = this.getclickedrow()
if r < 1 then return

this.setrow(r)
this.selectrow(0,false)
this.selectrow(r,true)

il_pracid = this.getitemnumber(r,"prac_id")
//messagebox("il_pracid",il_pracid)
//dw_browse.settransobject(sqlca)
//dw_browse.retrieve(il_prac,ii_facil)
//of_retrieve_data(is_ret_type)
end event

event retrieveend;//debugbreak()
//if this.rowcount() > 0 then
//	//this.selectrow(0,false)
//	//this.selectrow(1,true)
//	il_prac = this.getitemnumber(1,"prac_id")
//	//of_retrieve_data("R")
//	//messagebox("rc",string(dw_browse.rowcount()))
//	dw_browse.setredraw(true)
//end if
end event

event rowfocuschanged;
//debugbreak()

end event

event doubleclicked;rb_one.checked = true
of_dataobject()
of_preview()
end event

type dw_browse from u_dw within w_renew_priv_form
boolean visible = false
integer x = 1751
integer y = 48
integer width = 165
integer height = 84
integer taborder = 140
boolean titlebar = true
string title = "Requested Privileges"
string dataobject = "d_priv_batch_browse"
boolean hscrollbar = true
boolean livescroll = false
borderstyle borderstyle = styleraised!
end type

event buttonclicked;call super::buttonclicked;integer i

for i = 1 to this.rowcount()
	this.setitem(i,"selected",1)
next
end event

event clicked;
Integer li_row

li_row = This.GetClickedRow( )

IF li_row < 1 THEN
	Return
END IF


This.ScrollToRow( li_row )
This.SetRow( li_row )
//this.selectrow(0,false)
//this.selectrow(li_row,true)

end event

event doubleclicked;call super::doubleclicked;
//long ll_core
//integer li_row
//integer li_end
//
//if this.rowcount() > 0 then
//	tab_1.selecttab (2)
//	
//end if
end event

event rowfocuschanged;call super::rowfocuschanged;
//IF tab_1.tabpage_detail.dw_detail.RowCount() >= currentrow THEN
	//tab_1.tabpage_detail.dw_detail.SetRow( currentrow )
	//tab_1.tabpage_detail.dw_detail.ScrollToRow( currentrow )
//END IF
//this.selectrow(0,false)
//this.selectrow(this.getrow(),true)

//st_recs.Text = "Record " + String(This.GetRow()) + " of " + String(This.RowCount())
end event

event pfc_deleterow;
integer res

res = messagebox("Delete","Are you sure you wish to delete the selected privilege?",Question!,yesno!,2)

if res = 1 then
	this.deleterow(this.getrow())
end if

this.update()

return 0
end event

event pfc_addrow;call super::pfc_addrow;//
integer li_rows
integer li_newrow
long ll_recno
long ll_procd
long ll_core
integer li_ir_stat
string ls_procd
long ll_clin
string ls_clin
string ls_core
integer r
g_str_clin_info lstr_priv
integer li_rowcount
long ll_code
integer checkrow
integer res
date ld_start
date ld_end
date nulldate
long ll_rqs


//Start Code Change ----02.27.2008 #V8 maha
openwithparm(w_clin_area_select,"B*" + string(ii_facid) + "@" + string(il_pracid) )
//openwithparm(w_clin_area_select,"B*" + string(ii_facil))
//End Code Change---02.27.2008

setnull(nulldate)
lstr_priv = message.powerobjectparm
debugbreak()
if isnull(lstr_priv) then return 0


li_rowcount = lstr_priv.row_count
//messagebox("li_rowcount",li_rowcount)
ll_clin = lstr_priv.clin_id
ll_code = lstr_priv.stat
li_ir_stat = lstr_priv.appnt
//messagebox("start",string(lstr_priv.dstart))
//messagebox("end",string(lstr_priv.dend))
if string(lstr_priv.dstart) = "1/1/1900" then
	//messagebox("1/1/1900","1/1/1900")
	ld_start = nulldate
else
	//messagebox("1/1/1900","else")
	ld_start = lstr_priv.dstart
end if
if string(lstr_priv.dend) = "1/1/1900" then
	ld_end  = nulldate
else
	ld_end = lstr_priv.dend
end if
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<modify> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
///$<modification> Write script to retrieve data from a cache instead of from the database.

//select lookup_code into :ll_rqs from code_lookup where lookup_name = 'Privilege Status'  and code = 'REQST';
ll_rqs = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(lookup_name)='" +upper('Privilege Status')+ "' and upper(code)='REQST'"))
//---------------------------- APPEON END ----------------------------

if ll_rqs < 1 then
	messagebox("Lookup table error", "Unable to find the Requested Status Record.  Records not Added.~rCheck your Privilege Status lookup table for a record with the code of 'REQST' ")
	return 0
end if
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<add> 02.14.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
n_ds lds_prac
long ll_find

lds_prac = create n_ds
lds_prac.dataobject = "d_priv_core_procd_all"
lds_prac.of_settransobject(SQLCA)

gnv_appeondb.of_startqueue()
lds_prac.retrieve(lstr_priv.priv_ids[])	

//---------------------------- APPEON END ----------------------------
dw_browse.settransobject(sqlca)
dw_browse.reset()
	SELECT Max( pd_priv_list.rec_id )
	INTO :ll_recno  
	FROM pd_priv_list;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<add> 02.17.2006 By: Wangchao
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------		

if isnull(ll_recno) then ll_recno = 0

for r = 1 to li_rowcount
	checkrow = 0
	ll_procd = lstr_priv.priv_ids[r]
	//check to see if already exists
//	select pd_priv_list.rec_id
//	into :checkrow
//	from pd_priv_list
//	where pd_priv_list.procd_id = :ll_procd and pd_priv_list.prac_id = :gl_prac_id and pd_priv_list.facility_id = :gi_facil_change and pd_priv_list.active_status = 1;
//	//checkrow = this.find("procd_id = " + string(ll_procd),1,this.rowcount())
//	//messagebox("checkrow",checkrow)
//	if checkrow > 0 then
//		continue
//	end if
	//create new row
	dw_browse.insertrow (r)	
		
 
	
	ll_recno++
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-09
	//$<modify> 02.14.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*
	SELECT priv_core_procd.priv_core_id 
	INTO :ll_core  
	FROM priv_core_procd
	where priv_core_procd.procd_id = :ll_procd;
	*/
	ll_find = lds_prac.find("priv_core_procd_procd_id="+string(ll_procd),1,lds_prac.rowcount())
	If ll_find > 0 then ll_core = lds_prac.getitemnumber(ll_find , 'priv_core_procd_priv_core_id')
	//---------------------------- APPEON END ----------------------------

	//messagebox("ll_core ",ll_core )
	dw_browse.setitem(r,"rec_id",ll_recno)
	dw_browse.setitem(r,"facility_id",ii_facid)
	dw_browse.setitem(r,"prac_id",il_pracid)
//	il_clin = dw_store.getitemnumber(li_newrow,"priv_core_clinical_area_id")
	dw_browse.setitem(r,"clinical_area_id",ll_clin)
	dw_browse.setitem(r,"priv_core_id",ll_core)
	dw_browse.setitem(r,"procd_id",ll_procd)
	dw_browse.setitem(r,"active_status",1)
	dw_browse.Setitem(r,"ir_code",li_ir_stat)
	if string(lstr_priv.dstart) <> "1/1/1900" then
		dw_browse.Setitem(r,"start_date",ld_start)
	end if
	if string(lstr_priv.dend) <> "1/1/1900" then
		dw_browse.Setitem(r,"end_date",ld_end)
	end if
	//dw_browse.Settext("Inital")

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-10
	//$<modify> 02.14.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*
	SELECT priv_core.priv_core_description 
	INTO :ls_core  
	FROM priv_core,priv_core_procd
	WHERE priv_core.priv_core_id = priv_core_procd.priv_core_id AND priv_core_procd.procd_id = :ll_procd;
	//messagebox("ls_core ", ls_core )
	SELECT priv_core_procd.core_procd_description 
	INTO :ls_procd  
	FROM priv_core_procd
	WHERE priv_core_procd.procd_id = :ll_procd;
	*/
		
	If ll_find > 0 then 
		ls_core = lds_prac.GetItemString(ll_find , 'priv_core_priv_core_description')
		ls_procd = lds_prac.GetItemString(ll_find , 'priv_core_procd_core_procd_description')
	End If
	//---------------------------- APPEON END ----------------------------
	//ls_procd = dw_store.getitemstring(li_newrow,"core_procd_description")
	dw_browse.setitem(r,"pd_priv_list_priv_text",ls_procd)

	dw_browse.setitem(r,"status_code",ll_rqs)
	dw_browse.setitem(r,"enter_date",datetime(today(),now()))
	//ls_core = dw_store.getitemstring(li_newrow,"priv_core_priv_core_description")
	dw_browse.setitem(r,"priv_core_priv_core_description",ls_core)
	
NEXT
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<add> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_autocommit()
//---------------------------- APPEON END ----------------------------

this.update()
commit using sqlca;
//messagebox("","")
//of_retrieve_data(is_type)



return 1
end event

type cb_add from commandbutton within w_renew_priv_form
integer x = 3109
integer y = 36
integer width = 439
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Privileges"
end type

event clicked;dw_browse.triggerevent("pfc_addrow")
end event

type st_2 from statictext within w_renew_priv_form
integer x = 32
integer y = 168
integer width = 375
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select Batch List"
boolean focusrectangle = false
end type

type st_facil from statictext within w_renew_priv_form
integer x = 32
integer y = 24
integer width = 375
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Facility "
boolean focusrectangle = false
end type

type dw_facility from datawindow within w_renew_priv_form
integer x = 32
integer y = 76
integer width = 832
integer height = 92
integer taborder = 90
string dataobject = "d_facility_users_batch"
boolean border = false
boolean livescroll = true
end type

event itemchanged;ii_facid = integer(data)


end event

type dw_batchlist from datawindow within w_renew_priv_form
integer x = 32
integer y = 228
integer width = 841
integer height = 92
integer taborder = 150
string dataobject = "d_d_batch_list"
boolean border = false
boolean livescroll = true
end type

event itemchanged;
long ll_batch
integer i
integer ic

ll_batch = long(data)

dw_list.settransobject(sqlca)
ic = dw_list.retrieve(ll_batch)

if ic > 0 then
	for i = 1 to ic
		il_pracs[i] = dw_list.getitemnumber(i,"prac_id")
	next
	
	dw_pracs.retrieve(il_pracs[])
	rb_all.checked = true
end if
//dw_list.InsertRow( 1 )
//dw_list.GetChild( "full_name", dwchild )
//dwchild.settransobject(sqlca)
//dwchild.retrieve(ll_batch)

end event

event constructor;this.settransobject(sqlca)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-12
//$<comment> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Move the following script to the Open event of w_renew_priv_form
//$<modification> due to the usage of CreateOnDemand.
/*
this.retrieve()
this.insertrow(1) 
*/
//---------------------------- APPEON END ----------------------------

end event

type dw_list from datawindow within w_renew_priv_form
boolean visible = false
integer x = 471
integer y = 188
integer width = 59
integer height = 80
integer taborder = 70
string dataobject = "d_batch_items_prac_list"
boolean border = false
boolean livescroll = true
end type

event itemchanged;il_pracid = long(data)

of_prac_name(il_pracid)
end event

type st_1 from statictext within w_renew_priv_form
integer x = 901
integer y = 172
integer width = 722
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Clin Area/Department"
boolean focusrectangle = false
end type

type dw_stat from datawindow within w_renew_priv_form
integer x = 901
integer y = 68
integer width = 677
integer height = 92
integer taborder = 100
string dataobject = "d_dddw_priv_status"
boolean border = false
boolean livescroll = true
end type

event constructor;this.settransobject(sqlca)
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-13
//$<comment> 02.20.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
/*
DataWindowChild dwchild
this.retrieve()
this.InsertRow( 1 )
This.GetChild( "status_code", dwchild )
dwchild.settransobject(sqlca)
dwchild.retrieve()


dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "code", "All NOT Requested" )
dwchild.SetItem( 1, "lookup_code", 1 )

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "code", "All GRANT or COND" )
dwchild.SetItem( 1, "lookup_code", 2 )

dwchild.InsertRow( 1 )
dwchild.SetItem( 1, "code", "All" )
dwchild.SetItem( 1, "lookup_code", 0 )
*/
//---------------------------- APPEON END ----------------------------
end event

event itemchanged;integer li_row
long ll_status
string filt
string filtname
datawindowchild dwchild
integer fnd

ll_status = long(data)
//messagebox("",ll_status)
il_status = ll_status


if ll_status = 1 then //not requested
	this.getchild("status_code",dwchild)
	fnd = dwchild.find("code = 'REQST'",1,dwchild.rowcount())
	if fnd < 1 then
		messagebox("Find error","Can't find Reqst code")
		return
	else
		il_reqst = dwchild.getitemnumber(fnd,"lookup_code")
		//filt = "status_code <> " + string(ll_status)
	end if
end if

if dw_1.dataobject = "d_prac_priv_list_all_status" or dw_1.dataobject = "d_prac_priv_list_all_status_w_notes" then
	of_filter(ll_status)
end if
end event

type st_stat from statictext within w_renew_priv_form
integer x = 901
integer y = 16
integer width = 375
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Status Filter "
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_renew_priv_form
integer x = 3109
integer y = 320
integer width = 439
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(parent)
end event

type cb_print from commandbutton within w_renew_priv_form
integer x = 3109
integer y = 212
integer width = 439
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print"
end type

event clicked;integer i
integer orgrow

of_dataobject()

if rb_one.checked then
	of_preview()
//	if ii_clinid < 0 then
//		return
//	end if
	dw_1.print()
else
	for i = 1 to dw_pracs.rowcount()
		dw_pracs.selectrow(0,false) //mark the row being printed
		dw_pracs.selectrow(i,true)
		il_pracid = dw_pracs.getitemnumber(i,"prac_id")
		of_preview()
//		if ii_clinid < 0 then
//			return
//		end if
		if dw_1.rowcount() > 0 then //100903 //Start Code Change ---- 05.12.2006 #473 maha cvorrected from > 1
			dw_1.print()
		end if
	next
	dw_pracs.setrow(1)
	dw_pracs.selectrow(0,false)
	dw_pracs.selectrow(1,true)
end if
end event

type dw_1 from datawindow within w_renew_priv_form
integer x = 896
integer y = 476
integer width = 2651
integer height = 1656
integer taborder = 160
string dataobject = "d_prac_priv_list_all_status"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_renew_priv_form
integer x = 2043
integer y = 160
integer width = 997
integer height = 156
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Print Process"
end type

type dw_3 from datawindow within w_renew_priv_form
boolean visible = false
integer x = 1705
integer y = 216
integer width = 242
integer height = 56
integer taborder = 60
string dataobject = "d_distinct_clin_for_prac"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_renew_priv_form
boolean visible = false
integer x = 1687
integer y = 340
integer width = 265
integer height = 80
integer taborder = 30
string dataobject = "d_prac_priv_list_clin_area"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_clin from datawindow within w_renew_priv_form
integer x = 901
integer y = 228
integer width = 997
integer height = 92
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_dddw_clin_area"
boolean border = false
boolean livescroll = true
end type

event itemchanged;ii_clinid = integer(data)

if ii_clinid > 0 then
	is_clin_filter = "priv_clinical_area_clinical_area_id = " + string(ii_clinid)
else
	is_clin_filter = ""
end if
end event

event constructor;//DataWindowChild dwchild
//this.retrieve()
//this.InsertRow( 1 )
//This.GetChild( "clinical_area_description", dwchild )
//dwchild.settransobject(sqlca)
//dwchild.retrieve(ii_facid)
//
//
//dwchild.InsertRow( 1 )
//dwchild.SetItem( 1, "clinical_area_description", "All" )
//dwchild.SetItem( 1, "clinical_area_id",0 )
end event

type ddlb_selectform from dropdownlistbox within w_renew_priv_form
integer x = 2043
integer y = 68
integer width = 997
integer height = 656
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Privileges Without Notes","Privileges With Notes","Request Form with Headers","Request Form with Detail","Comparison Report","Complete Privilege Application w/ Description","Privileges With Staff Cat/Dept data"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-09 By: Rodger Wu (Inova)
//$<reason> Attention: This is a new object.
//$<reason> Attention: Remove 6 radio button objects.
/*
Attention!!!

3 Datawindows modified:
  d_form_priv_acknowledgement_col adds 2 signaturelines for a total of 5.
  d_form_pract_priv_request_d and d_form_pract_priv_request_h add a signature and date line at the bottom.
  
4 New Datawindow:
  d_form_pract_priv_request_d_inova
  d_form_clin_priv_request_master_inova
  d_prac_priv_list_history
  d_prac_priv_list_history_w_notes
*/

//Start Code Change ---- 11.08.2007 #V7 maha
cb_preview.enabled = true
cb_Print.enabled = true

IF index > 0 THEN
	ii_selectedform = index
	Choose Case index
		Case 1,2
			cbx_history.Enabled = True
			cbx_cur.Enabled = False
			cbx_cur.checked = False
		Case 3,4
			cbx_history.Enabled = False
			cbx_cur.Enabled = True
		case 5
			cbx_history.Enabled = False
			cbx_cur.Enabled = True
			cbx_cur.checked = True
		Case 6
			cbx_history.Enabled = False
			cbx_cur.Enabled = False
			cbx_cur.checked = False
		case 7//Start Code Change ---- 11.08.2007 #V8 maha
			messagebox("New Report","Under developent")
			cbx_history.Enabled = false
			cbx_cur.Enabled = False
			cbx_cur.checked = False
			cb_preview.enabled = false
			cb_Print.enabled = false
	End Choose
//End Code Change---11.08.2007
END IF

//---------------------------- APPEON END ----------------------------

end event

