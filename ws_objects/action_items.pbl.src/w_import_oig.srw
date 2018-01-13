$PBExportHeader$w_import_oig.srw
forward
global type w_import_oig from window
end type
type cb_5 from commandbutton within w_import_oig
end type
type st_5 from statictext within w_import_oig
end type
type st_4 from statictext within w_import_oig
end type
type st_3 from statictext within w_import_oig
end type
type st_2 from statictext within w_import_oig
end type
type st_1 from statictext within w_import_oig
end type
type st_progress from statictext within w_import_oig
end type
type cb_stst from commandbutton within w_import_oig
end type
type dw_fac from datawindow within w_import_oig
end type
type sle_app from singlelineedit within w_import_oig
end type
type cb_getapp from commandbutton within w_import_oig
end type
type cb_13 from commandbutton within w_import_oig
end type
type dw_table from datawindow within w_import_oig
end type
type cb_10 from commandbutton within w_import_oig
end type
type cb_3 from commandbutton within w_import_oig
end type
type sle_1 from singlelineedit within w_import_oig
end type
type cb_1 from commandbutton within w_import_oig
end type
type dw_copy from datawindow within w_import_oig
end type
end forward

global type w_import_oig from window
integer x = 297
integer y = 304
integer width = 3127
integer height = 1800
boolean titlebar = true
string title = "Data update"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
cb_5 cb_5
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
st_progress st_progress
cb_stst cb_stst
dw_fac dw_fac
sle_app sle_app
cb_getapp cb_getapp
cb_13 cb_13
dw_table dw_table
cb_10 cb_10
cb_3 cb_3
sle_1 sle_1
cb_1 cb_1
dw_copy dw_copy
end type
global w_import_oig w_import_oig

type variables
string is_dwname
end variables

on w_import_oig.create
this.cb_5=create cb_5
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_progress=create st_progress
this.cb_stst=create cb_stst
this.dw_fac=create dw_fac
this.sle_app=create sle_app
this.cb_getapp=create cb_getapp
this.cb_13=create cb_13
this.dw_table=create dw_table
this.cb_10=create cb_10
this.cb_3=create cb_3
this.sle_1=create sle_1
this.cb_1=create cb_1
this.dw_copy=create dw_copy
this.Control[]={this.cb_5,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.st_progress,&
this.cb_stst,&
this.dw_fac,&
this.sle_app,&
this.cb_getapp,&
this.cb_13,&
this.dw_table,&
this.cb_10,&
this.cb_3,&
this.sle_1,&
this.cb_1,&
this.dw_copy}
end on

on w_import_oig.destroy
destroy(this.cb_5)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_progress)
destroy(this.cb_stst)
destroy(this.dw_fac)
destroy(this.sle_app)
destroy(this.cb_getapp)
destroy(this.cb_13)
destroy(this.dw_table)
destroy(this.cb_10)
destroy(this.cb_3)
destroy(this.sle_1)
destroy(this.cb_1)
destroy(this.dw_copy)
end on

event close;//disCONNECT USING SQLCA;
end event

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_5 from commandbutton within w_import_oig
integer x = 91
integer y = 224
integer width = 539
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Unzip"
end type

event clicked;//Access the default Internet browser to navigate to the OIG home site 
// to download the monthly OIG LEIE update zip file

String sle_url

run(gs_dir_path + gs_DefDirName + "\oig\updatedleie.exe")

end event

type st_5 from statictext within w_import_oig
integer x = 727
integer y = 428
integer width = 1591
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
string text = "5) Click Import to delete existing records and import update"
boolean focusrectangle = false
end type

type st_4 from statictext within w_import_oig
integer x = 727
integer y = 332
integer width = 1147
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
string text = "4) Browse to unzipped update.dbf file."
boolean focusrectangle = false
end type

type st_3 from statictext within w_import_oig
integer x = 727
integer y = 232
integer width = 1385
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
string text = "3) Run the downloaded .exe file to unzip the update."
boolean focusrectangle = false
end type

type st_2 from statictext within w_import_oig
integer x = 727
integer y = 144
integer width = 1102
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
string text = "2) SAVE file in your ContractLogix\OIG folder."
boolean focusrectangle = false
end type

type st_1 from statictext within w_import_oig
integer x = 727
integer y = 48
integer width = 1175
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
string text = "1) Click retrieve to get file from OIG website."
boolean focusrectangle = false
end type

type st_progress from statictext within w_import_oig
integer x = 55
integer y = 656
integer width = 2944
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 80269524
boolean enabled = false
string text = "Import Status"
boolean focusrectangle = false
end type

type cb_stst from commandbutton within w_import_oig
integer x = 87
integer y = 40
integer width = 539
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
end type

event clicked;//Access the default Internet browser to navigate to the OIG home site 
// to download the monthly OIG LEIE update zip file

String sle_url
inet iinet_base

if gi_citrix = 1 then //maha 040805
	of_open_web("http://www.oig.hhs.gov/fraud/exclusions/downloadables/updatedleie.exe")
else
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 06.23.2006 By: Liang QingShi
	//$<reason>  GetContextService is currently unsupported. 
	//$<modification> Replace GetContextService with ShellExecuteA to provide the
	//$<modification> same functionality.
	/*
	GetContextService("Internet", iinet_base)
	iinet_base.HyperlinkToURL("http://www.oig.hhs.gov/fraud/exclusions/downloadables/updatedleie.exe")	
	*/
	String ls_url,ls_null
	setnull(ls_null)
	ls_url = "http://www.oig.hhs.gov/fraud/exclusions/downloadables/updatedleie.exe"
	ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_url , ls_Null, 4)

	//---------------------------- APPEON END ----------------------------
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07.20.2006 By: Rodger Wu
//$<reason> Fix a defect.
//$<reason> Create the path if it does not exist.

gnv_appeondll.of_parsepath( gs_dir_path + gs_DefDirName + "\oig\" )
//---------------------------- APPEON END ----------------------------

run("explorer.exe /n,/e," + gs_dir_path + gs_DefDirName + "\oig\")
//End of routine


end event

type dw_fac from datawindow within w_import_oig
boolean visible = false
integer x = 114
integer y = 260
integer width = 1070
integer height = 96
integer taborder = 80
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type sle_app from singlelineedit within w_import_oig
boolean visible = false
integer x = 82
integer y = 180
integer width = 1691
integer height = 92
integer taborder = 60
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

type cb_getapp from commandbutton within w_import_oig
boolean visible = false
integer x = 1806
integer y = 184
integer width = 475
integer height = 76
integer taborder = 70
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
value =	ln_getfilename.of_getopenfilename("Select File",&
+ docname, named, "DOC", &
	+ "text Files (*.txt),*.txt")
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value = 1 THEN
	sle_app.text = docname
END IF
end event

type cb_13 from commandbutton within w_import_oig
integer x = 87
integer y = 428
integer width = 539
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
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
long c


pointer oldpointer // Declares a pointer variable
oldpointer = SetPointer(HourGlass!)

//Step 1 before importing verify if the file actually exists

IF not FileExists(sle_1.text)  THEN 
	//messagebox("","Unable to find file! Please use the Retrieve button to select a valid file name!")
	messagebox("File Not Found","Unable to find file! Please use the Retrieve button to select a valid file name!")
	return
end if 

dw_copy.settransobject(sqlca)
dw_copy.reset()
dw_table.settransobject(sqlca)
dw_table.reset()

file = sle_1.text
fileapp = sle_app.text

//Step 2 delete the old OIG records and display a message  
// erase all data from present oig_data table before proceeding with import

st_progress.text = (" Deleting all the old OIG records,(may take a few minutes)  Please wait.")
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 04.14.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Add Appeon Commit label to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_autocommit( )
//---------------------------- APPEON END ----------------------------

		DELETE FROM OIG_DATA;
		commit using sqlca;

//Step 3 start importing the new OIG records and display a message
//dwcontrol.ImportFile ( filename {, startrow {, endrow {, startcolumn {, endcolumn {, dwstartcolumn } } } } } )

st_progress.text = (" Importing the new OIG records,  Please wait!")
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 04.14.2006 By: Cao YongWang
//$<reason> Import data from a DBF file is unsupportted by Appeon. 
//$<modification> Call Appeon DLL function to export the DBF file data to
//$<modification>  a TXT file. Then, import data from the TXT file on web application.
If appeongetclienttype() <> 'PB' Then
	string ls_datafile
	long	 ll_rtn
	//If the 'gs_dir_path + gs_DefDirName + "\oig\"' directory is not exsits, Then create it.
	gnv_appeondll.of_parsepath(gs_dir_path + gs_DefDirName + "\oig\")
	ls_datafile = gs_dir_path + gs_DefDirName + "\oig\update.txt"
	ll_rtn = gnv_appeondll.of_output(file , ls_datafile , 'updated')
	If ll_rtn <> 1 Then 
		return
	End If
	file = ls_datafile
End If
//---------------------------- APPEON END ----------------------------

rc = dw_table.ImportFile(file,1)



//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 12/12/2007 By: Ken.Guo
//$<reason> For Performance
/*
for i = 1 to rc
		ll_fldid++
		dw_table.setitem(i,"rec_id",ll_fldid)
next
//Step 4 start updating the database with the new OIG records and display a message
st_progress.text = (" Updating database with new OIG records,(may take a few minutes)  Please wait! ")
c = 0
for i = 1 to rc
	dw_table.rowscopy(i,i,primary!,dw_copy,1000000,primary!)
	c++
	ac++
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 07.20.2006 By: Rodger Wu
	//$<reason> Fix a defect.
	/*
	if c = 500 then
	*/
	if c = 500 or i = rc then
	//---------------------------- APPEON END ----------------------------
	
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-02
		//$<add> 04.14.2006 By: Cao YongWang
		//$<reason> Performance tuning.
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

		gnv_appeondb.of_autocommit( )
		//---------------------------- APPEON END ----------------------------
		dw_copy.update()
		commit using sqlca;
		c = 0
		dw_copy.reset()
		st_progress.text = " Updating database with new OIG records,(may take a few minutes)  Please wait! " + string (ac)
	end if
next
*/
Long ll_fldid_arr[]

If rc <=0 Then Return

For i = 1 To rc
		ll_fldid_arr[i] = i
Next
dw_table.object.rec_id[1,rc] = ll_fldid_arr[]

//Step 4 start updating the database with the new OIG records and display a message
st_progress.text = (" Updating database with new OIG records,(may take a few minutes)  Please wait! ")
Long ll_times
Long ll_base = 500
ll_times = Ceiling(rc/ll_base)
for i = 1 to ll_times
	dw_table.rowscopy((i - 1)*ll_base+1,i*ll_base,primary!,dw_copy,1,primary!)
	gnv_appeondb.of_autocommit()
	dw_copy.update()
	commit using sqlca;
	dw_copy.reset()
	If i*ll_base > rc Then 
		ac = rc
	Else
		ac = i*ll_base
	End If
	st_progress.text = " Updating database with new OIG records,(may take a few minutes)  Please wait! 	" + String (ac)+'/'+String(rc)
next
//---------------------------- APPEON END ----------------------------	
	
	
	
//if dw_table.update() < 1 then
//	st_progress.text = "Save failure.  Unable to update OIG records."
//	
//else
//	commit using sqlca;	
	//Step 5 display the number of records imported
	ls_string = string(rc)	
	st_progress.text = ("Import complete. Total number of new OIG records imported = " + ls_string ) 
	
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 07.20.2006 By: Rodger Wu
//$<reason> fix a defect.
/* update ids set last_oig_update = today(); */

if gs_dbtype = "ASA" then
	update ids set last_oig_update = today();
else
	update ids set last_oig_update = getdate();
end if

//---------------------------- APPEON END ----------------------------
//end if

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<add> 04.14.2006 By: Cao YongWang
//$<reason> Delete the file after inporting data.
//$<modification> Add FileDelete(file) to delete the file.
//FileDelete(file)
FileDelete(ls_datafile)  //Modified by Ken.Guo 12/13/2007. Need delete temp file, Not Original data file.
//---------------------------- APPEON END ----------------------------


SetPointer(oldpointer)
end event

type dw_table from datawindow within w_import_oig
integer x = 37
integer y = 764
integer width = 2999
integer height = 848
integer taborder = 40
string dataobject = "d_data_view_oig"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type cb_10 from commandbutton within w_import_oig
integer x = 87
integer y = 324
integer width = 539
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse OIG file"
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

type cb_3 from commandbutton within w_import_oig
integer x = 2638
integer y = 16
integer width = 402
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;CLOSE(PARENT)
end event

type sle_1 from singlelineedit within w_import_oig
integer x = 50
integer y = 540
integer width = 1691
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_import_oig
integer x = 2638
integer y = 120
integer width = 402
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&About"
end type

event clicked;messagebox("About Importing","Use the Retrieve OIG file button to browse to and select the OIG file to import.  Clicking on Import will erase the present OIG records before importing and updating the new records to the database!")
end event

type dw_copy from datawindow within w_import_oig
integer x = 297
integer y = 436
integer width = 311
integer height = 60
integer taborder = 30
string dataobject = "d_data_view_oig"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

