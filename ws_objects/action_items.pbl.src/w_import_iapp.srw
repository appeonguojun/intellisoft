$PBExportHeader$w_import_iapp.srw
forward
global type w_import_iapp from window
end type
type st_progress from statictext within w_import_iapp
end type
type cb_5 from commandbutton within w_import_iapp
end type
type cb_4 from commandbutton within w_import_iapp
end type
type cb_stst from commandbutton within w_import_iapp
end type
type dw_cl_stat from datawindow within w_import_iapp
end type
type cb_2 from commandbutton within w_import_iapp
end type
type dw_badrecs from datawindow within w_import_iapp
end type
type st_high from statictext within w_import_iapp
end type
type st_next from statictext within w_import_iapp
end type
type dw_fac from datawindow within w_import_iapp
end type
type dw_app from datawindow within w_import_iapp
end type
type sle_app from singlelineedit within w_import_iapp
end type
type cb_getapp from commandbutton within w_import_iapp
end type
type cb_13 from commandbutton within w_import_iapp
end type
type cb_11 from commandbutton within w_import_iapp
end type
type dw_table from datawindow within w_import_iapp
end type
type cb_10 from commandbutton within w_import_iapp
end type
type cb_3 from commandbutton within w_import_iapp
end type
type sle_1 from singlelineedit within w_import_iapp
end type
type cb_1 from commandbutton within w_import_iapp
end type
end forward

global type w_import_iapp from window
integer x = 256
integer y = 716
integer width = 3141
integer height = 1188
boolean titlebar = true
string title = "Data update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
st_progress st_progress
cb_5 cb_5
cb_4 cb_4
cb_stst cb_stst
dw_cl_stat dw_cl_stat
cb_2 cb_2
dw_badrecs dw_badrecs
st_high st_high
st_next st_next
dw_fac dw_fac
dw_app dw_app
sle_app sle_app
cb_getapp cb_getapp
cb_13 cb_13
cb_11 cb_11
dw_table dw_table
cb_10 cb_10
cb_3 cb_3
sle_1 sle_1
cb_1 cb_1
end type
global w_import_iapp w_import_iapp

type variables
string is_dwname
end variables

on w_import_iapp.create
this.st_progress=create st_progress
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_stst=create cb_stst
this.dw_cl_stat=create dw_cl_stat
this.cb_2=create cb_2
this.dw_badrecs=create dw_badrecs
this.st_high=create st_high
this.st_next=create st_next
this.dw_fac=create dw_fac
this.dw_app=create dw_app
this.sle_app=create sle_app
this.cb_getapp=create cb_getapp
this.cb_13=create cb_13
this.cb_11=create cb_11
this.dw_table=create dw_table
this.cb_10=create cb_10
this.cb_3=create cb_3
this.sle_1=create sle_1
this.cb_1=create cb_1
this.Control[]={this.st_progress,&
this.cb_5,&
this.cb_4,&
this.cb_stst,&
this.dw_cl_stat,&
this.cb_2,&
this.dw_badrecs,&
this.st_high,&
this.st_next,&
this.dw_fac,&
this.dw_app,&
this.sle_app,&
this.cb_getapp,&
this.cb_13,&
this.cb_11,&
this.dw_table,&
this.cb_10,&
this.cb_3,&
this.sle_1,&
this.cb_1}
end on

on w_import_iapp.destroy
destroy(this.st_progress)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_stst)
destroy(this.dw_cl_stat)
destroy(this.cb_2)
destroy(this.dw_badrecs)
destroy(this.st_high)
destroy(this.st_next)
destroy(this.dw_fac)
destroy(this.dw_app)
destroy(this.sle_app)
destroy(this.cb_getapp)
destroy(this.cb_13)
destroy(this.cb_11)
destroy(this.dw_table)
destroy(this.cb_10)
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.cb_1)
end on

event open;SQLCA.DBMS="ODBC"
SQLCA.DbParm="ConnectString='DSN=IntelliCred Client;UID=DBA;PWD=SQL;',DelimitIdentifier='Yes'"

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-14 By: Scofield
//$<Reason> Set the connection cache dynamically on Web
if AppeonGetClientType() = 'WEB' then
	SQLCA.DBMS = gs_CacheType
	SQLCA.DBParm = gs_CacheSet
end if
//---------------------------- APPEON END ----------------------------

CONNECT USING SQLCA;

IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Not Logged In", "Login Failed!")
ELSE
	//MESSAGEBOX("","LOGIN OK")
END IF

 is_dwname = "None"
 
 gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;DISCONNECT USING SQLCA;
end event

type st_progress from statictext within w_import_iapp
integer x = 46
integer y = 108
integer width = 1687
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 80269524
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_import_iapp
integer x = 2373
integer y = 1692
integer width = 421
integer height = 104
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Step 2"
end type

event clicked;// Columbia Presbyterian
// This code will set the Appointment dept active status:
// Use longs names not correlations


pointer oldpointer // Declares a pointer variable

oldpointer = SetPointer(HourGlass!)
//... // Performs some long activity
//SetPointer(oldpointer)

Update pd_affil_dept, imp_tblpractitioner 
Set pd_affil_dept.active_status = 1
Where (imp_tblpractitioner.status = 1) 
	and pd_affil_dept.memberships = imp_tblpractitioner.credsysid; 

Update pd_affil_dept, imp_tblpractitioner 
Set pd_affil_dept.active_status = 1
Where (imp_tblpractitioner.status = 6) 
	and pd_affil_dept.memberships = imp_tblpractitioner.credsysid; 

Update pd_affil_dept, imp_tblpractitioner 
Set pd_affil_dept.active_status = 3
Where (imp_tblpractitioner.status = 4) 
	and pd_affil_dept.memberships = imp_tblpractitioner.credsysid;

// Performs some long activity
SetPointer(oldpointer)

commit using sqlca;

end event

type cb_4 from commandbutton within w_import_iapp
integer x = 1509
integer y = 1652
integer width = 421
integer height = 104
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Address2"
end type

event clicked;// Columbia Presbyterian
// This code will set the Appointment active_status code.
//Use long names not correlations

//Update pd_affil_stat s1, imp_tblpractitioner s2
//Set s1.active_status = 1
//Where (s2.status = 1) and s1.custom_1 = s2.credsysid; 
//
//Update pd_affil_stat s1, imp_tblpractitioner s2
//Set s1.active_status = 1
//Where (s2.status = 6) and s1.custom_1 = s2.credsysid; 
//

pointer oldpointer // Declares a pointer variable

oldpointer = SetPointer(HourGlass!)
//... // Performs some long activity
//SetPointer(oldpointer)

//Update pd_affil_stat, imp_tblpractitioner 
//Set pd_affil_stat.active_status = 3
//Where (imp_tblpractitioner.status = 4) 
//	and pd_affil_stat.custom_1 = imp_tblpractitioner.credsysid;

// Performs some long activity

Delete from data_view_fields
Where screen_id = 31;


SetPointer(oldpointer)



commit using sqlca;
//messagebox("Done","Address2 screen fields ids deleted")
messagebox("Done","Address2 screen fields IDs have been successfully deleted.")

end event

type cb_stst from commandbutton within w_import_iapp
integer x = 1778
integer y = 32
integer width = 489
integer height = 104
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Internet access"
end type

event clicked;//Access the default Internet browser to navigate to the OIG home site 
// to download the monthly OIG LEIE update zip file

String sle_url

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.23.2006 By: Liang QingShi
//$<reason>  GetContextService is currently unsupported. 
//$<modification> Replace GetContextService with ShellExecuteA to provide the
//$<modification> same functionality.
/*
inet iinet_base // instance variable used with the "Internet" or GetUrl functions

//Line - below opens your default web browser

GetContextService("Internet", iinet_base)

//Home OIG web site below:
//iinet_base.HyperlinkToURL("http://www.oig.hhs.gov/fraud/exclusions/database.html#1") // (sle_url.text)


//Downloadable OIG site for the monthly update sanction file below:

iinet_base.HyperlinkToURL("http://www.oig.hhs.gov/fraud/exclusions/downloadables/updatedleie.exe")
*/
String ls_url,ls_null
setnull(ls_null)
ls_url = "http://www.oig.hhs.gov/fraud/exclusions/downloadables/updatedleie.exe"
ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_url , ls_Null, 4)

//---------------------------- APPEON END ----------------------------


// NEXT set the directory where to save the downloaded file and run it to unzip the UPDATED.DBF file



//End of routine


end event

type dw_cl_stat from datawindow within w_import_iapp
integer x = 832
integer y = 1300
integer width = 562
integer height = 344
integer taborder = 80
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
end type

type cb_2 from commandbutton within w_import_iapp
integer x = 2633
integer y = 1320
integer width = 421
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "save bad recs"
end type

event clicked;dw_table.update()
commit using sqlca;
end event

type dw_badrecs from datawindow within w_import_iapp
integer x = 2039
integer y = 1300
integer width = 562
integer height = 344
integer taborder = 40
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type st_high from statictext within w_import_iapp
integer x = 928
integer y = 1708
integer width = 261
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type st_next from statictext within w_import_iapp
integer x = 279
integer y = 1716
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 80269524
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type dw_fac from datawindow within w_import_iapp
boolean visible = false
integer x = 114
integer y = 260
integer width = 1070
integer height = 96
integer taborder = 140
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_app from datawindow within w_import_iapp
integer x = 46
integer y = 1300
integer width = 562
integer height = 344
integer taborder = 90
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type sle_app from singlelineedit within w_import_iapp
boolean visible = false
integer x = 82
integer y = 180
integer width = 1691
integer height = 92
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_getapp from commandbutton within w_import_iapp
boolean visible = false
integer x = 1806
integer y = 184
integer width = 475
integer height = 76
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "get app prop file"
end type

event clicked;
//sle_2.text = "addr_new"

string docname, named
n_getfilename ln_getfilename
integer value
gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//modified by gavins 20140814
//value = GetFileOpenName("Select File",& 
//+ docname, named, "DOC", &
//	+ "text Files (*.txt),*.txt")
value =  ln_getfilename.of_getopenfilename("Select File",& 
+ docname, named, "DOC", &
	+ "text Files (*.txt),*.txt")

gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value = 1 THEN
	sle_app.text = docname
END IF
end event

type cb_13 from commandbutton within w_import_iapp
integer x = 1778
integer y = 352
integer width = 489
integer height = 104
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Import"
end type

event clicked;string object
string file
string fileapp
string mes
string ls_string
long ll_code
long ll_appid
long ll_facid
long ll_fldid
long ll_app_org
long i
integer a
long rc
long ac

pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

//Step 1 before importing verify if the file actually exists

IF not FileExists(sle_1.text)  THEN 
	//messagebox("","Unable to find file! Please use the Retrieve button to select a valid file name!")
	messagebox("File Not Found","Unable to find file! Please use the Retrieve button to select a valid file name!")
	return
end if 


dw_table.settransobject(sqlca)
dw_table.reset()

file = sle_1.text
fileapp = sle_app.text

//Step 2 delete the old OIG records and display a message  
// erase all data from present oig_data table before proceeding with import

st_progress.text = (" Deleteing all the old OIG records,  Please wait!")

		DELETE FROM OIG_DATA;
		commit using sqlca;

//Step 3 start importing the new OIG records and display a message
//dwcontrol.ImportFile ( filename {, startrow {, endrow {, startcolumn {, endcolumn {, dwstartcolumn } } } } } )

st_progress.text = (" Importing the new OIG records,  Please wait!")

rc = dw_table.ImportFile(file,1)

for i = 1 to rc
		ll_fldid++
		dw_table.setitem(i,"rec_id",ll_fldid)
next

//Step 4 start updating the database with the new OIG records and display a message

st_progress.text = (" Updating database with new OIG records,  Please wait! ")
if dw_table.update() < 1 then
	//messagebox("","Unable to update screen id")
	messagebox("Update Screen ID","Unable to update screen ID")
	return
end if

commit using sqlca;
	
//Step 5 display the number of records imported

ls_string = string(rc)	
st_progress.text = (" Total number of new OIG records imported = " + ls_string ) 

//messagebox("Done","Import complete")

SetPointer(oldpointer)


end event

type cb_11 from commandbutton within w_import_iapp
integer x = 1568
integer y = 1436
integer width = 421
integer height = 104
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "adj"
end type

event clicked;//integer i 
//integer ic
//integer fac
//string facname
//string prac
//long icprac
//long recid
//string sms
//integer r
//integer rc
//string scode
//datetime edate
//long lcode
//integer hcnt = 0
//
//
//ic = dw_table.rowcount()
//st_high.text = string(ic)
//for i = 1 to ic
//	st_next.text = string(i)
//
//	recid = long(dw_table.getitemstring(i,"recid"))
//	//select ic_prac_id into :icprac from conv_prac_syn_tbl where imp_prac_id = :prac;
//
//	facname = dw_table.getitemstring(i,"street")
//	//messagebox("",facname)
//	update pd_address
//	set street = :facname where rec_id = :recid;
//	commit using sqlca;
//next
////	rc = dw_app.retrieve(long(recid))
//////	if rc > hcnt then 
//////		hcnt = rc
//////		st_high.text = string(hcnt)
//////		//messagebox("","")
//////	end if
////	//messagebox("code",ncnt)
////	if rc > 0 then
////		select lookup_code into :lcode from code_lookup where lookup_name = 'A&O' and code = :scode;
//////messagebox("code",scode)
////		dw_app.setitem(1,"other_role",string(lcode))
//////		end if
////		//for r = 1 to rc
////
//////			if isnull(dw_app.getitemstring(r,"cust_2")) then
//////				dw_app.setitem(r,"cust_2",sdate)
//////			elseif isnull(dw_app.getitemstring(r,"cust_3")) then
//////				dw_app.setitem(r,"cust_3",sdate)
//////			elseif isnull(dw_app.getitemstring(r,"cust_4")) then
//////				dw_app.setitem(r,"cust_4",sdate)		
//////			end if
////		///next
////	//	messagebox("rc",rc)
////		dw_app.update()
////		commit using sqlca;
////	else
////		dw_table.RowsCopy (i, i, primary!, dw_badrecs, 1000, 	primary! )
////	end if
////	//messagebox("fac",fac)
////next
////	
end event

type dw_table from datawindow within w_import_iapp
integer x = 46
integer y = 540
integer width = 2999
integer height = 424
integer taborder = 30
string dataobject = "d_data_view_oig"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type cb_10 from commandbutton within w_import_iapp
integer x = 1778
integer y = 192
integer width = 489
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retrieve OIG file"
end type

event clicked;
//sle_2.text = "addr_new"

string dbfname, named
n_getfilename ln_getfilename
integer value
gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//modified by gavins 20140814
//value = GetFileOpenName("Select File",&
//+ dbfname, named, "DBF", &
//	+ "dbf Files (*.dbf),*.dbf")
value = ln_getfilename.of_getopenfilename("Select File",&
+ dbfname, named, "DBF", &
	+ "dbf Files (*.dbf),*.dbf")

gf_save_dir_path(dbfname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value = 1 THEN
	sle_1.text = dbfname
END IF
end event

type cb_3 from commandbutton within w_import_iapp
integer x = 2638
integer y = 352
integer width = 402
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Quit"
end type

event clicked;CLOSE(PARENT)
end event

type sle_1 from singlelineedit within w_import_iapp
integer x = 46
integer y = 196
integer width = 1691
integer height = 92
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_import_iapp
integer x = 2638
integer y = 32
integer width = 402
integer height = 104
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "About"
end type

event clicked;messagebox("About Importing","Use the Retrieve OIG file button to browse to and select the OIG file to import.  Clicking on Import will erase the present OIG records before importing and updating the new records to the database!")
end event

