$PBExportHeader$w_oig_on_demand.srw
forward
global type w_oig_on_demand from window
end type
type st_pname from statictext within w_oig_on_demand
end type
type cb_3 from commandbutton within w_oig_on_demand
end type
type cb_2 from commandbutton within w_oig_on_demand
end type
type cb_1 from commandbutton within w_oig_on_demand
end type
type cb_cancel from commandbutton within w_oig_on_demand
end type
type cb_clear from commandbutton within w_oig_on_demand
end type
type cb_none from commandbutton within w_oig_on_demand
end type
type cb_print from commandbutton within w_oig_on_demand
end type
type st_added from statictext within w_oig_on_demand
end type
type st_3 from statictext within w_oig_on_demand
end type
type st_2 from statictext within w_oig_on_demand
end type
type st_1 from statictext within w_oig_on_demand
end type
type cb_view from commandbutton within w_oig_on_demand
end type
type cb_done from commandbutton within w_oig_on_demand
end type
type cb_scan from commandbutton within w_oig_on_demand
end type
type cbx_dob from checkbox within w_oig_on_demand
end type
type cbx_first from checkbox within w_oig_on_demand
end type
type cbx_last from checkbox within w_oig_on_demand
end type
type cb_search from commandbutton within w_oig_on_demand
end type
type cb_batch from commandbutton within w_oig_on_demand
end type
type gb_1 from groupbox within w_oig_on_demand
end type
type dw_copied from datawindow within w_oig_on_demand
end type
type dw_verifs from datawindow within w_oig_on_demand
end type
type dw_oig_data from datawindow within w_oig_on_demand
end type
type dw_prac_list from datawindow within w_oig_on_demand
end type
end forward

global type w_oig_on_demand from window
integer x = 142
integer y = 48
integer width = 3383
integer height = 2280
boolean titlebar = true
string title = "OIG Search"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79680469
st_pname st_pname
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_cancel cb_cancel
cb_clear cb_clear
cb_none cb_none
cb_print cb_print
st_added st_added
st_3 st_3
st_2 st_2
st_1 st_1
cb_view cb_view
cb_done cb_done
cb_scan cb_scan
cbx_dob cbx_dob
cbx_first cbx_first
cbx_last cbx_last
cb_search cb_search
cb_batch cb_batch
gb_1 gb_1
dw_copied dw_copied
dw_verifs dw_verifs
dw_oig_data dw_oig_data
dw_prac_list dw_prac_list
end type
global w_oig_on_demand w_oig_on_demand

type variables
long il_pracid[]
long il_notfound
integer ii_last = 1
integer ii_first = 1
integer ii_dob = 1
string is_verif 
string is_from
string is_auto
end variables

forward prototypes
public function string of_set_where (integer ai_row, integer ai_lname, integer ai_fname, integer ai_dob)
public function integer of_scan_oig_data (string as_auto, integer ai_lname, integer ai_fname, integer ai_dob, string as_type)
public function integer of_add_no_match (integer ai_row)
public function string of_set_filter (integer ai_row, integer ai_lname, integer ai_fname, integer ai_dob)
end prototypes

public function string of_set_where (integer ai_row, integer ai_lname, integer ai_fname, integer ai_dob);long i
long ic
long r
long rc
integer p
string lname
string fname
string syear
string smonth
string sday
date d_dob
string dob
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-08-10 By: Liu Hongxin
//$<reason> Change this function to join all conditions to one.
/*
string ls_where = "WHERE"
*/
n_cst_string ln_string

string ls_where = " ("
//---------------------------- APPEON END ----------------------------

lname = upper(dw_prac_list.getitemstring(ai_row,"last_name"))
//do until p < 1
	p = pos(lname,"'",1) 
if p > 0 then
	lname = mid(lname,1,p - 1) + "'" + mid(lname,p )
end if
p = pos(fname,"'",1) 
if p > 0 then
	lname = mid(fname,1,p - 1) + "'" + mid(fname,p  )
end if

fname = upper(dw_prac_list.getitemstring(ai_row,"first_name"))
if isnull(fname) then fname = ""
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-09-15 By: Liu HongXin
//$<reason> Fix defect.
lname = ln_string.of_globalreplace(lname, "''", "'", False)
lname = ln_string.of_globalreplace(lname, "'", "''", False)
lname = ln_string.of_globalreplace(lname, '"', '', False)

fname = ln_string.of_globalreplace(fname, "''", "'", False)
fname = ln_string.of_globalreplace(fname, "'", "''", False)
fname= ln_string.of_globalreplace(fname, '"', '', False)
//---------------------------- APPEON END ----------------------------

d_dob = date(dw_prac_list.getitemdatetime(ai_row,"date_of_birth"))
syear = mid(string(year(d_dob)),3,2)
smonth = string(month(d_dob))
sday = string(day(d_dob))
if len(smonth) = 1 then smonth = "0" + smonth
if len(sday) = 1 then sday = "0" + sday

dob = smonth + "/" + sday + "/" + syear
if isnull(dob) then dob = ""
//messagebox("dob",dob)
if ai_lname = 1 and ai_fname = 1 and ai_dob = 1 then
	ls_where = ls_where + " upper(oig_data.lastname) = '" + lname + "' and upper(oig_data.firstname) = '" + fname + "' and oig_data.dob = '" + dob + "'"
elseif ai_lname = 1 and ai_fname = 1 then
	ls_where = ls_where + " upper(oig_data.lastname) = '" + lname + "' and upper(oig_data.firstname) = '" + fname + "'"
elseif ai_lname = 1 and ai_dob = 1 then
	ls_where = ls_where + " upper(oig_data.lastname) = '" + lname + "' and oig_data.dob = '" + dob + "'"
elseif ai_fname = 1 and ai_dob = 1 then
	ls_where = ls_where + " upper(oig_data.firstname) = '" + fname + "' and oig_data.dob = '" + dob + "'"
elseif ai_lname = 1 then
	ls_where = ls_where + " upper(oig_data.lastname) = '" + lname + "'"
elseif ai_fname = 1 then
	ls_where = ls_where + " upper(oig_data.firstname) = '" + fname + "'"
elseif ai_dob = 1 then
	ls_where = ls_where + " oig_data.dob = '" + dob + "'"
else
	//messagebox("","No match criteria selected")
	messagebox("Select Criteria","No match criteria was selected")
	return "Fail"
end if

//messagebox("",ls_where)
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-08-10 By: Liu Hongxin
//$<reason> 
ls_where += ") "
//---------------------------- APPEON END ----------------------------

return ls_where
end function

public function integer of_scan_oig_data (string as_auto, integer ai_lname, integer ai_fname, integer ai_dob, string as_type);//of_scan_oig_data()

long i
long ic
long r
long rc
string lname
string fname
string dob
string ls_where = "WHERE"
string ls_sql
string ls_sql_org
string pracname

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03/19/2008 By: Ken.Guo
//$<reason> Add Trap
If dw_prac_list.rowcount() = 0 Then Return 0
//---------------------------- APPEON END ----------------------------



if as_auto = "A" then //if came in as auto scan set the instance variables
	ii_last = ai_lname
	ii_first = ai_fname
	ii_dob = ai_dob
end if

//get the original sql 
dw_oig_data.SetTransObject( SQLCA )
ls_sql_org = dw_oig_data.GetSQLSelect()

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<modify> 02.16.2006 By: Wangchao
//$<reason> Performance tuning
//$<reason> Reduce client-server interactions to improve runtime performance.
//$<modification> Write script to retrieve data from a cache in PT-02 instead of from the database.

/*
debugbreak()
if as_type = "S" then  //if a batch scan scroll through list getting the where clause
	ic = dw_prac_list.rowcount()
	for i = 1 to ic
		if  dw_prac_list.getitemnumber(i,"selected") = 1 then
			//pracname = dw_prac_list.getitemstring(i,"last_name")
			//st_pname.text = pracname
			dw_prac_list.scrolltorow(i)
			dw_prac_list.selectrow(0,false)
			dw_prac_list.selectrow(i,true)
			ls_where = "WHERE"
			ls_sql = ls_sql_org	
			ls_where = of_set_where(i,ai_lname,ai_fname,ai_dob)			
				//messagebox("",ls_where)
			ls_sql = ls_sql + ls_where
			//messagebox("",ls_sql_org)
			//messagebox("",ls_sql)
			//reset dw sql and retrieve
			dw_oig_data.SetSQlSelect( ls_sql )
			dw_oig_data.SetTransObject( SQLCA )
			r = dw_oig_data.Retrieve( )
			
			//copy any results on auto scan
			dw_prac_list.setitem(i,"matchfound",r)
			if r > 0 then
				if r = 1 then
					dw_prac_list.setitem(i,"cust_10",dw_oig_data.getitemstring(1,"sanctype"))
				end if
				dw_oig_data.RowsCopy (1, r, primary!, dw_copied, 100000, primary! )
			else
				of_add_no_match(i)
				dw_prac_list.setitem(i,"cust_10"," No Match")
				dw_oig_data.RowsCopy (1, r, primary!, dw_copied, 100000, primary! )
				dw_oig_data.setitem(dw_oig_data.rowcount(),"sanctype",'None')
				//messagebox("OIG Scan","Scan complete")
			end if	
		end if
	next

	//dw_copied.visible = true
	//cb_view.text = "Hide Report"
	
	messagebox("OIG Scan","Scan complete")

else //single practioner from doubleclick
	//messagebox("","single")
	i = dw_prac_list.getrow()
	//messagebox("row",i)
	ls_where = of_set_where(i,ai_lname,ai_fname,ai_dob)
			//messagebox("",ls_where)
	ls_sql = ls_sql_org	
	ls_sql = ls_sql + ls_where
			//messagebox("",ls_sql_org)
			//messagebox("",ls_sql)
	dw_oig_data.SetSQlSelect( ls_sql )
	dw_oig_data.SetTransObject( SQLCA )
	r = dw_oig_data.Retrieve( )
	if r > 0 then
		dw_prac_list.setitem(i,"matchfound",r)
		if r = 1 then
			dw_prac_list.setitem(i,"cust_10",dw_oig_data.getitemstring(1,"sanctype"))
		end if
	else //maha 082505  creating 'no match' record
		of_add_no_match(i)
		dw_prac_list.setitem(i,"cust_10"," No Match")
		dw_oig_data.RowsCopy (1, r, primary!, dw_copied, 100000, primary! )
		dw_oig_data.setitem(dw_oig_data.rowcount(),"sanctype",'None')
	end if
	st_3.text = string(r) + " records found"
end if
*/	
if as_type = "S" then  //if a batch scan scroll through list getting the where clause
	ic = dw_prac_list.rowcount()

	for i = 1 to ic
		if i = 1 then
			ls_where = "WHERE " + of_set_where(i,ai_lname,ai_fname,ai_dob)
		else
			ls_where += "OR" + of_set_where(i,ai_lname,ai_fname,ai_dob)
		end if
	next
	IF ic > 0 THEN
		ls_sql = ls_sql_org
		ls_sql = ls_sql + ls_where
		dw_oig_data.SetSQlSelect( ls_sql )
		dw_oig_data.SetTransObject( SQLCA )
		dw_oig_data.Retrieve( )
	END IF
	
	for i = 1 to ic
		if  dw_prac_list.getitemnumber(i,"selected") = 1 then
			//pracname = dw_prac_list.getitemstring(i,"last_name")
			//st_pname.text = pracname
			dw_prac_list.scrolltorow(i)
			dw_prac_list.selectrow(0,false)
			dw_prac_list.selectrow(i,true)			
			ls_where = of_set_filter(i,ai_lname,ai_fname,ai_dob)
			dw_oig_data.setfilter(ls_where)	
			dw_oig_data.filter()
			r = dw_oig_data.Rowcount( )
			
			//copy any results on auto scan
			dw_prac_list.setitem(i,"matchfound",r)
			if r > 0 then
				if r = 1 then
					dw_prac_list.setitem(i,"cust_10",dw_oig_data.getitemstring(1,"sanctype"))
				end if
				dw_oig_data.RowsCopy (1, r, primary!, dw_copied, 100000, primary! )
			else
				of_add_no_match(i)
				dw_prac_list.setitem(i,"cust_10"," No Match")
				dw_oig_data.RowsCopy (1, r, primary!, dw_copied, 100000, primary! )
				dw_oig_data.setitem(dw_oig_data.rowcount(),"sanctype",'None')
				//messagebox("OIG Scan","Scan complete")
			end if	
		end if
	next

	//dw_copied.visible = true
	//cb_view.text = "Hide Report"
	
	//messagebox("OIG Scan","Scan complete")
	messagebox("OIG Scan","Scan completed.")

else //single practioner from doubleclick
	i = dw_prac_list.getrow()
	//messagebox("row",i)
	ls_where = "WHERE " + of_set_where(i,ai_lname,ai_fname,ai_dob)
			//messagebox("",ls_where)
	ls_sql = ls_sql_org	
	ls_sql = ls_sql + ls_where
			//messagebox("",ls_sql_org)
			//messagebox("",ls_sql)
	dw_oig_data.SetSQlSelect( ls_sql )
	dw_oig_data.SetTransObject( SQLCA )
	r = dw_oig_data.Retrieve( )
	if r > 0 then
		dw_prac_list.setitem(i,"matchfound",r)
		if r = 1 then
			dw_prac_list.setitem(i,"cust_10",dw_oig_data.getitemstring(1,"sanctype"))
		end if
	else //maha 082505  creating 'no match' record
		of_add_no_match(i)
		dw_prac_list.setitem(i,"cust_10"," No Match")
		dw_oig_data.RowsCopy (1, r, primary!, dw_copied, 100000, primary! )
		dw_oig_data.setitem(dw_oig_data.rowcount(),"sanctype",'None')
	end if
	st_3.text = string(r) + " records found"
end if

//---------------------------- APPEON END ----------------------------

st_added.text = "Report has " + string(dw_copied.rowcount()) + " records."	
	
dw_oig_data.SetSQlSelect( ls_sql_org )
dw_oig_data.SetTransObject( SQLCA )	

if dw_oig_data.rowcount() = 0 then
	st_3.text = "No Records Found"
end if

	
if is_auto = "A" then
	cb_done.triggerevent(clicked!)
end if
	

return 1
end function

public function integer of_add_no_match (integer ai_row);integer r
string ls_date


r = dw_copied.insertrow(0)
dw_copied.setitem(r,"lastname",dw_prac_list.getitemstring(ai_row,"last_name"))
dw_copied.setitem(r,"firstname",dw_prac_list.getitemstring(ai_row,"first_name"))
//dw_oig_data.setitem(r,"midname",dw_prac_list.getitemstring(ai_row,""))
ls_date = of_date_to_string(dw_prac_list.getitemdatetime(ai_row,"date_of_birth"),"mm\dd\yy")
dw_copied.setitem(r,"dob",ls_date)
dw_copied.setitem(r,"sanctype","None")
dw_copied.setitem(r,"code_lookup_description","No Match Found")
//dw_oig_data.setitem(r,"",dw_prac_list.getitemstring(ai_row,""))
//dw_oig_data.setitem(r,"",dw_prac_list.getitemstring(ai_row,""))
//dw_oig_data.setitem(r,"",dw_prac_list.getitemstring(ai_row,""))
//dw_oig_data.setitem(r,"",dw_prac_list.getitemstring(ai_row,""))

return 1
end function

public function string of_set_filter (integer ai_row, integer ai_lname, integer ai_fname, integer ai_dob);
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<add> 02.16.2006 By: Wangchao
//$<reason> Performance tuning
//$<modification> 1)Rewrite the original setfilter(ls_where) function.
//$<modification> 2)Use Filter of datastore to replace of Retrieve of
//$<modification> Retrieve of datawindow to reduce client-server interactions.
//$<modification> Refer to PT-01 for more information.
n_cst_string ln_string
//---------------------------- APPEON END ----------------------------

long i
long ic
long r
long rc
integer p
string lname
string fname
string syear
string smonth
string sday
date d_dob
string dob
string ls_where 

lname = upper(dw_prac_list.getitemstring(ai_row,"last_name"))
//do until p < 1
	p = pos(lname,"'",1) 
if p > 0 then
	lname = mid(lname,1,p - 1) + "'" + mid(lname,p )
end if
p = pos(fname,"'",1) 
if p > 0 then
	lname = mid(fname,1,p - 1) + "'" + mid(fname,p  )
end if

fname = upper(dw_prac_list.getitemstring(ai_row,"first_name"))
if isnull(fname) then fname = ""
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-09-15 By: Liu HongXin
//$<reason> fix defect.
lname = ln_string.of_globalreplace(lname, "''", "'", False)
lname = ln_string.of_globalreplace(lname, '"', '', False)

fname = ln_string.of_globalreplace(fname, "''", "'", False)
fname= ln_string.of_globalreplace(fname, '"', '', False)
//---------------------------- APPEON END ----------------------------
d_dob = date(dw_prac_list.getitemdatetime(ai_row,"date_of_birth"))
syear = mid(string(year(d_dob)),3,2)
smonth = string(month(d_dob))
sday = string(day(d_dob))
if len(smonth) = 1 then smonth = "0" + smonth
if len(sday) = 1 then sday = "0" + sday

dob = smonth + "/" + sday + "/" + syear
if isnull(dob) then dob = ""
//messagebox("dob",dob)
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-09-15 By: Liu HongXin
//$<reason> Fix defect.
/*
if ai_lname = 1 and ai_fname = 1 and ai_dob = 1 then
	ls_where = ls_where + " upper(lastname) = '" + lname + "' and upper(firstname) = '" + fname + "' and dob = '" + dob + "'"
elseif ai_lname = 1 and ai_fname = 1 then
	ls_where = ls_where + " upper(lastname) = '" + lname + "' and upper(firstname) = '" + fname + "'"
elseif ai_lname = 1 and ai_dob = 1 then
	ls_where = ls_where + " upper(lastname) = '" + lname + "' and dob = '" + dob + "'"
elseif ai_fname = 1 and ai_dob = 1 then
	ls_where = ls_where + " upper(firstname) = '" + fname + "' and dob = '" + dob + "'"
elseif ai_lname = 1 then
	ls_where = ls_where + " upper(lastname) = '" + lname + "'"
elseif ai_fname = 1 then
	ls_where = ls_where + " upper(firstname) = '" + fname + "'"
*/
if ai_lname = 1 and ai_fname = 1 and ai_dob = 1 then
	ls_where = ls_where + ' upper(lastname) = "' + lname + '" and upper(firstname) = "' + fname + '" and dob = "' + dob + '"'
elseif ai_lname = 1 and ai_fname = 1 then
	ls_where = ls_where + ' upper(lastname) = "' + lname + '" and upper(firstname) = "' + fname + '"'
elseif ai_lname = 1 and ai_dob = 1 then
	ls_where = ls_where + ' upper(lastname) = "' + lname + '" and dob = "' + dob + '"'
elseif ai_fname = 1 and ai_dob = 1 then
	ls_where = ls_where + ' upper(firstname) = "' + fname + '" and dob = "' + dob + '"'
elseif ai_lname = 1 then
	ls_where = ls_where + ' upper(lastname) = "' + lname + '"'
elseif ai_fname = 1 then
	ls_where = ls_where + ' upper(firstname) = "' + fname + '"'
//---------------------------- APPEON END ----------------------------
elseif ai_dob = 1 then
	ls_where = ls_where + " dob = '" + dob + "'"
else
	//messagebox("","No match criteria selected")
	messagebox("Select Criteria","No match criteria was selected")
	return "Fail"
end if

//messagebox("",ls_where)
return ls_where
end function

on w_oig_on_demand.create
this.st_pname=create st_pname
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_cancel=create cb_cancel
this.cb_clear=create cb_clear
this.cb_none=create cb_none
this.cb_print=create cb_print
this.st_added=create st_added
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_view=create cb_view
this.cb_done=create cb_done
this.cb_scan=create cb_scan
this.cbx_dob=create cbx_dob
this.cbx_first=create cbx_first
this.cbx_last=create cbx_last
this.cb_search=create cb_search
this.cb_batch=create cb_batch
this.gb_1=create gb_1
this.dw_copied=create dw_copied
this.dw_verifs=create dw_verifs
this.dw_oig_data=create dw_oig_data
this.dw_prac_list=create dw_prac_list
this.Control[]={this.st_pname,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_cancel,&
this.cb_clear,&
this.cb_none,&
this.cb_print,&
this.st_added,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_view,&
this.cb_done,&
this.cb_scan,&
this.cbx_dob,&
this.cbx_first,&
this.cbx_last,&
this.cb_search,&
this.cb_batch,&
this.gb_1,&
this.dw_copied,&
this.dw_verifs,&
this.dw_oig_data,&
this.dw_prac_list}
end on

on w_oig_on_demand.destroy
destroy(this.st_pname)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_cancel)
destroy(this.cb_clear)
destroy(this.cb_none)
destroy(this.cb_print)
destroy(this.st_added)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_view)
destroy(this.cb_done)
destroy(this.cb_scan)
destroy(this.cbx_dob)
destroy(this.cbx_first)
destroy(this.cbx_last)
destroy(this.cb_search)
destroy(this.cb_batch)
destroy(this.gb_1)
destroy(this.dw_copied)
destroy(this.dw_verifs)
destroy(this.dw_oig_data)
destroy(this.dw_prac_list)
end on

event open;string ls_auto
string ls_from
string ls_verif
integer i
date ld_imp
integer res

is_verif = mid(message.stringparm,1,1)
is_auto = mid(message.stringparm,2,1)
is_from = mid(message.stringparm,3,1)

select lookup_code into :il_notfound from code_lookup where lookup_code = 11026;

If il_notfound < 1 or isnull(il_notfound) then
	messagebox("Lookup not found","Unable to find the lookup record for Match not found.  Contact customer support")
end if

//is_verif - *V* = comes from verifications ; M = on demand search 
//is_auto -  *A* = automatic;  S = manual scan
//is_from -  *A* = action items; P = practitioner folder; N = on demand search(not verification)

select last_oig_update into :ld_imp from ids;

if isnull(ld_imp) then
	res = messagebox("OIG Data","Do you wish to download the update from the OIG website now?",question!,yesno!,1)
elseif RelativeDate ( ld_imp, 30) < today() then 
	res = messagebox("OIG Data","The last update of the OIG data was " + string(ld_imp) + ".~rDo you wish to download the update from the OIG website now?",question!,yesno!,1)
end if
if res = 1 then 
	close(this)
	open(w_import_oig)
	return
end if


if is_verif = "V" then
	cb_search.enabled = false
	cb_batch.enabled = false
end if
	

if is_auto = "A" then
	cb_search.enabled = false
	cb_batch.enabled = false
	cb_scan.enabled = false
	dw_oig_data.enabled = false
end if
	

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17


end event

type st_pname from statictext within w_oig_on_demand
integer x = 37
integer y = 1312
integer width = 654
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 80269524
long backcolor = 67108864
boolean enabled = false
string text = "Prac name"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_oig_on_demand
integer x = 1806
integer y = 1988
integer width = 370
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Export Report"
end type

event clicked;	dw_copied.saveas()
end event

type cb_2 from commandbutton within w_oig_on_demand
integer x = 2569
integer y = 1988
integer width = 763
integer height = 84
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Verifiy match using OIG Web Site"
end type

event clicked;//Access to the OIG home site for verifying match


String sle_url
inet iinet_base


if gi_citrix = 1 then //maha 040508
	of_open_web("http://exclusions.oig.hhs.gov/search.html")
else
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 06.23.2006 By: Liang QingShi
	//$<reason>  GetContextService is currently unsupported. 
	//$<modification> Replace GetContextService with ShellExecuteA to provide the
	//$<modification> same functionality.
	/*
	GetContextService("Internet", iinet_base)
	iinet_base.HyperlinkToURL("http://exclusions.oig.hhs.gov/search.html")
	*/
	String ls_url,ls_null
	setnull(ls_null)
	ls_url = "http://exclusions.oig.hhs.gov/search.html"
	ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_url , ls_Null, 4)
	
	//---------------------------- APPEON END ----------------------------
	
end if

end event

type cb_1 from commandbutton within w_oig_on_demand
integer x = 1006
integer y = 88
integer width = 178
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Sort"
end type

event clicked;string null_str

SetNull(null_str)

dw_prac_list.SetSort(null_str)

dw_prac_list.Sort( )
end event

type cb_cancel from commandbutton within w_oig_on_demand
integer x = 2789
integer y = 88
integer width = 247
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;close(parent)
end event

type cb_clear from commandbutton within w_oig_on_demand
integer x = 2199
integer y = 1988
integer width = 343
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Clear Report"
end type

event clicked;dw_copied.reset()

st_added.text = "Report has " + string(dw_copied.rowcount()) + " records."
end event

type cb_none from commandbutton within w_oig_on_demand
boolean visible = false
integer x = 59
integer y = 1312
integer width = 297
integer height = 68
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "No Match"
end type

event clicked;	dw_prac_list.setitem(dw_prac_list.getrow(),"matchfound",0)

end event

type cb_print from commandbutton within w_oig_on_demand
integer x = 1449
integer y = 1988
integer width = 338
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print &Report"
end type

event clicked;
	dw_copied.print()

end event

type st_added from statictext within w_oig_on_demand
integer x = 2327
integer y = 1340
integer width = 526
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
string text = "Report has 0 records"
boolean focusrectangle = false
end type

type st_3 from statictext within w_oig_on_demand
integer x = 50
integer y = 1956
integer width = 686
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_2 from statictext within w_oig_on_demand
integer x = 704
integer y = 1336
integer width = 1536
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Double click matched record to add to report list."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_oig_on_demand
integer x = 302
integer y = 216
integer width = 2615
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Double click practitioner name to search, or click Scan List to scan all records selected."
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_view from commandbutton within w_oig_on_demand
integer x = 1093
integer y = 1988
integer width = 338
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&View Report"
end type

event clicked;
if dw_copied.visible = false then
	dw_copied.visible = true
	this.text = "Hide Report"
else
	dw_copied.visible = false
	this.text = "&View Report"
end if
end event

type cb_done from commandbutton within w_oig_on_demand
integer x = 3063
integer y = 88
integer width = 247
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Done"
end type

event clicked;long pracid
integer i
integer ic
integer f
string ls_stype
integer cnt
integer li_sent
long ll_code
long ll_match
string ls_sanct_code
integer res
pfc_n_cst_ai_action_items inv_action_items



if is_verif = "V" then //do following only if from verifications

	if is_from = "A" then//only if from action items 
		inv_action_items = create pfc_n_cst_ai_action_items
	end if
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-03
	//$<modify> 02.16.2006 By: Wangchao
	//$<reason> Performance tuning
	//$<reason> Reduce client-server interactions to improve runtime performance.
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	
	/*
	select lookup_code into :ll_code from code_lookup where lookup_name = 'Credentials Verification Response' and code = 'SAT OIG';
	*/
	
	ll_code = long(gnv_data.of_getitem("code_lookup" ,'lookup_code', "upper(lookup_name) = '" + upper('Credentials Verification Response') + "'" + " and upper(code) = 'SAT OIG'"))
	//---------------------------- APPEON END ----------------------------
	
	//select lookup_code into :ll_match from code_lookup where lookup_name = 'OIG Sanctions' and code = '';

	//create data to send back to verification list
	for i = 1 to dw_prac_list.rowcount()
		pracid = dw_prac_list.getitemnumber(i,"prac_id")
		f = dw_verifs.find( "prac_id = " + string(pracid), 1, dw_verifs.rowcount() )
		//
		//messagebox("f",f)
		if f > 0 then
			cnt = dw_prac_list.getitemnumber(i,"matchfound")
			if isnull(cnt) then cnt = 0
			
			
			//get sanction description
			ls_stype = dw_prac_list.getitemstring(i,"cust_10")
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-04
			//$<modify> 02.16.2006 By: Wangchao
			//$<reason> Performance tuning
			//$<reason> Reduce client-server interactions to improve runtime performance.
			//$<modification> Write script to retrieve data from a cache instead of from the database.
					
			/*
			select description into :ls_sanct_code from code_lookup where lookup_name = 'OIG Sanctions' and code = :ls_stype;
			*/
			
			ls_sanct_code = gnv_data.of_getitem("code_lookup" ,'description', "upper(lookup_name) = '" + upper('OIG Sanctions') + "'" + " and upper(code) = '" + upper(ls_stype) + "'")
			//---------------------------- APPEON END ----------------------------
			
			//set sent data
			if isnull(dw_verifs.getitemdatetime(f,"first_sent")) then dw_verifs.setitem(f,"first_sent",datetime(today(),now()))
			dw_verifs.setitem(f,"last_sent",datetime(today(),now()))
			li_sent = dw_verifs.getitemnumber(f,"number_sent")
			if isnull(li_sent) then
				dw_verifs.setitem(f,"number_sent",1)
			else
				li_sent++
				dw_verifs.setitem(f,"number_sent",li_sent)
			end if
			dw_verifs.setitem(f,"print_flag",0)
			//set completed
			if cnt = 0 then
				//	messagebox("cnt","0")
				dw_verifs.setitem(f,"date_recieved",datetime(today(),now()))
				dw_verifs.setitem(f,"user_name",gs_user_id)
				dw_verifs.setitem(f,"response_code",ll_code)
				dw_verifs.setitem(f,"user_name",gs_user_id)
				//dw_verifs.setitem(f,"notes", string(cnt) + "0 matches found")
			elseif cnt = 1 then
				//messagebox("cnt","1")
				dw_verifs.setitem(f,"notes","1 match found  - " + ls_sanct_code)
			else
				//messagebox("cnt",">1")
				dw_verifs.setitem(f,"notes", string(cnt) + " matches found")
			end if
			
				
				
		end if
		
	next
	if is_auto = "A" then //ask to print report for auto scans
		If dw_copied.rowcount() > 0 then
			res = messagebox("Print Report","Do you want to print the Scan matches report?",question!,yesno!,1)
			if res = 1 then 
				dw_copied.print()
			end if
		end if
	end if
	res = dw_verifs.update()
	if res < 0 then
		messagebox("Save Error","Unable to update verifications.")
	else 
		commit using sqlca;
		if is_verif = "V" then //if from verifications reretrieve the data in the window
			if is_from = "P" then//if from prac folder
				w_prac_data_1.tab_1.tabpage_verif.uo_verif_summary.of_retrieve_detail(w_prac_data_1.tab_1.tabpage_verif.uo_verif_summary.dw_orgs_facilities.getrow() )
				w_prac_data_1.tab_1.tabpage_verif.uo_verif_summary.of_ver_filter()
			elseif is_from = "A" then//if from action items
				inv_action_items.of_filter( w_action_items.ii_org_id, w_action_items.ii_facility_id, w_action_items.is_filter, w_action_items.tab_1.tabpage_detail.tab_view.tabpage_browse.dw_browse, w_action_items.is_user_id, w_action_items.ddplb_filters )
			end if
		end if
	end if
	
	if is_from = "A" then//only if from action items
		destroy inv_action_items
	end if	
	
end if
	
	


		
		
close(parent)
end event

type cb_scan from commandbutton within w_oig_on_demand
integer x = 2510
integer y = 88
integer width = 247
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Scan &List"
end type

event clicked;long i
long ic
long r = 0
long rc



//ic = dw_prac_list.rowcount()
//
//for i = 1 to ic // rebuild the array
//	if dw_prac_list.getitemnumber(i,"selected") = 1 then
//		r++
//		il_pracid[r] = dw_prac_list.getitemnumber(i,"prac_id")
//	end if
//next
if ii_last < 1 and ii_first < 1 and ii_dob < 1 then
	//messagebox("Scan error","No match fields selected.")
	messagebox("Scan Error","No match fields were selected.")
	return
end if

dw_copied.reset()

st_added.text = "Report has " + string(dw_copied.rowcount()) + " records."

of_scan_oig_data("A",ii_last,ii_first,ii_dob,"S")

end event

type cbx_dob from checkbox within w_oig_on_demand
integer x = 2043
integer y = 96
integer width = 379
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date of Birth"
boolean checked = true
end type

event clicked;if this.checked = true then
	ii_dob = 1
else
	ii_dob = 0
end if
end event

type cbx_first from checkbox within w_oig_on_demand
integer x = 1673
integer y = 96
integer width = 434
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "First Name"
boolean checked = true
end type

event clicked;if this.checked = true then
	ii_first = 1
else
	ii_first = 0
end if
end event

type cbx_last from checkbox within w_oig_on_demand
integer x = 1307
integer y = 96
integer width = 434
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last Name"
boolean checked = true
end type

event clicked;if this.checked = true then
	ii_last = 1
else
	ii_last = 0
end if

	
end event

type cb_search from commandbutton within w_oig_on_demand
integer x = 41
integer y = 88
integer width = 457
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Practitioner Search"
end type

event clicked;//Start Code Change ---- 01.19.2006 #205 maha rebuilt code
Integer nr
Integer li_find
integer i
integer ic
integer li_fac
Long ll_prac_id
String ls_full_name

gs_search lstr_string
gs_batch_search  lstr_search

lstr_string.stran_transaction = SQLCA

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-09-22 By: Rodger Wu
//$<reason> Fix a defect.

/* select default_search_facility into :li_fac from security_users; */
select default_search_facility into :li_fac from security_users where user_id = :gs_user_id; 

//---------------------------- APPEON END ----------------------------

if isnull(li_fac) then li_fac = 0

lstr_string.ls_open_for = "REPORTS" + string(li_fac)

//debugbreak()
//messagebox("", lstr_search.ls_open_for )
OpenWithParm( w_extended_search_new , lstr_string )

IF Message.DoubleParm = -1 THEN
	Return -1
END IF

lstr_search = message.powerobjectparm
 
if not isvalid(message.powerobjectparm) then return 0

ic = upperbound(lstr_search.li_prac_id)
nr = upperbound(il_pracid[])

for i = 1 to ic
	nr++
	il_pracid[nr] = lstr_search.li_prac_id[i]
next

dw_prac_list.settransobject(sqlca)
dw_prac_list.retrieve(il_pracid[])
//End Code Change---01.19.2005 


end event

type cb_batch from commandbutton within w_oig_on_demand
integer x = 521
integer y = 88
integer width = 457
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Batch Search"
end type

event clicked;//return

gs_batch_search lst_search
long i
long ic
long r
long rc
long pracids[]
string names[]
string ls_openstring

ls_openstring = "R*ALL" 


openwithparm(w_batch_prac_select_new,ls_openstring)


if message.stringparm = "Cancel" then
	return

else 
	lst_search = message.powerobjectparm
	
	pracids[] = lst_search.li_prac_id[]
	names[] = lst_search.ls_name[]
	ic = upperbound(pracids[]) 
	
	dw_prac_list.settransobject(sqlca)
	ic = dw_prac_list.retrieve(pracids[])
	
	
 
	 
//	for i = 1 to ic
//		dw_prac_list.SetItem( i, "selected", 1)
//	next

	
	
end if

end event

type gb_1 from groupbox within w_oig_on_demand
integer x = 1230
integer y = 40
integer width = 1216
integer height = 156
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Match on:"
end type

type dw_copied from datawindow within w_oig_on_demand
boolean visible = false
integer x = 32
integer y = 16
integer width = 3296
integer height = 1936
integer taborder = 140
boolean bringtotop = true
boolean titlebar = true
string title = "Double click report name to hide."
string dataobject = "d_oig_matched_data_report"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
end type

event doubleclicked;this.visible = false

cb_view.text = "View Report"
end event

type dw_verifs from datawindow within w_oig_on_demand
boolean visible = false
integer x = 2967
integer y = 4
integer width = 343
integer height = 296
integer taborder = 150
string dataobject = "d_ver_sum_rec_view_oig"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_oig_data from datawindow within w_oig_on_demand
integer x = 41
integer y = 1412
integer width = 3282
integer height = 532
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_oig_matched_data"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;integer i

i = this.getrow()
if i > 0 then
	dw_oig_data.RowsCopy (i, i, primary!, dw_copied, 100000, primary! )
	dw_prac_list.setitem(dw_prac_list.getrow(),"matchfound",1)
	dw_prac_list.setitem(dw_prac_list.getrow(),"cust_10",dw_oig_data.getitemstring(1,"sanctype"))
		
	
end if

st_added.text = "Report has " + string(dw_copied.rowcount()) + " records."
end event

event clicked;integer li_nr

li_nr = this.getclickedrow()

this.SelectRow( 0 , False )
this.ScrollToRow( li_nr )
this.SetRow ( li_nr )
this.SelectRow( li_nr , True )
end event

type dw_prac_list from datawindow within w_oig_on_demand
integer x = 41
integer y = 304
integer width = 3282
integer height = 976
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_oig_prac_match_data"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long pracid
long blankarray[]


st_3.text = ""
//il_pracid[] = blankarray[]

//pracid = this.getitemnumber(this.getrow(),"prac_id")
//il_pracid[1] = pracid
if ii_last < 1 and ii_first < 1 and ii_dob < 1 then
	//messagebox("Scan error","No match fields selected.")
	messagebox("Scan Error","No match fields were selected.")
	return
end if

of_scan_oig_data("M",ii_last,ii_first,ii_dob,"M")
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<modify> 05.05.2006 By: Liang QingShi
//$<reason> Try...CATCH... is currently unsupported.
//$<modification> Rewrite the following script and move it to of_scan_oig_data.

/*
try
if dw_oig_data.rowcount() = 0 then
	st_3.text = "No Records Found"
end if
catch (runtimeerror rte)
end try 
*/

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 05.05.2006 By: Liang QingShi
//$<reason> Fix a defect.
/*
cb_none.visible = true
*/
if isvalid(w_oig_on_demand) then
	cb_none.visible = true
end if
//---------------------------- APPEON END ----------------------------
//cb_none.enabled = true
	
end event

event clicked;integer li_nr

li_nr = this.getclickedrow()

this.SelectRow( 0 , False )
this.ScrollToRow( li_nr )
this.SetRow ( li_nr )
this.SelectRow( li_nr , True )
end event

event constructor;this.settransobject(sqlca)
end event

