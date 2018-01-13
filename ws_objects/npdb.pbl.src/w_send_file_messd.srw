$PBExportHeader$w_send_file_messd.srw
forward
global type w_send_file_messd from window
end type
type cb_1 from commandbutton within w_send_file_messd
end type
type dw_1 from datawindow within w_send_file_messd
end type
type st_3 from statictext within w_send_file_messd
end type
type st_2 from statictext within w_send_file_messd
end type
type cb_view from commandbutton within w_send_file_messd
end type
type dw_bad_pracs from datawindow within w_send_file_messd
end type
type st_process from statictext within w_send_file_messd
end type
type st_1 from statictext within w_send_file_messd
end type
type cb_step_2 from commandbutton within w_send_file_messd
end type
type cb_step_1 from commandbutton within w_send_file_messd
end type
type st_hipdb from statictext within w_send_file_messd
end type
type st_npdb from statictext within w_send_file_messd
end type
type cb_step_4 from commandbutton within w_send_file_messd
end type
type cb_cancel from commandbutton within w_send_file_messd
end type
type cb_step_3 from commandbutton within w_send_file_messd
end type
type dw_verifs from datawindow within w_send_file_messd
end type
type dw_hipdb from datawindow within w_send_file_messd
end type
end forward

global type w_send_file_messd from window
integer x = 887
integer y = 552
integer width = 1792
integer height = 1580
boolean titlebar = true
string title = "NPDB File Transfer"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_1 cb_1
dw_1 dw_1
st_3 st_3
st_2 st_2
cb_view cb_view
dw_bad_pracs dw_bad_pracs
st_process st_process
st_1 st_1
cb_step_2 cb_step_2
cb_step_1 cb_step_1
st_hipdb st_hipdb
st_npdb st_npdb
cb_step_4 cb_step_4
cb_cancel cb_cancel
cb_step_3 cb_step_3
dw_verifs dw_verifs
dw_hipdb dw_hipdb
end type
global w_send_file_messd w_send_file_messd

type prototypes

end prototypes

type variables
String is_parent_facility_id
String is_file_name
integer ii_up_check
string is_exceptions 
end variables

on w_send_file_messd.create
this.cb_1=create cb_1
this.dw_1=create dw_1
this.st_3=create st_3
this.st_2=create st_2
this.cb_view=create cb_view
this.dw_bad_pracs=create dw_bad_pracs
this.st_process=create st_process
this.st_1=create st_1
this.cb_step_2=create cb_step_2
this.cb_step_1=create cb_step_1
this.st_hipdb=create st_hipdb
this.st_npdb=create st_npdb
this.cb_step_4=create cb_step_4
this.cb_cancel=create cb_cancel
this.cb_step_3=create cb_step_3
this.dw_verifs=create dw_verifs
this.dw_hipdb=create dw_hipdb
this.Control[]={this.cb_1,&
this.dw_1,&
this.st_3,&
this.st_2,&
this.cb_view,&
this.dw_bad_pracs,&
this.st_process,&
this.st_1,&
this.cb_step_2,&
this.cb_step_1,&
this.st_hipdb,&
this.st_npdb,&
this.cb_step_4,&
this.cb_cancel,&
this.cb_step_3,&
this.dw_verifs,&
this.dw_hipdb}
end on

on w_send_file_messd.destroy
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_view)
destroy(this.dw_bad_pracs)
destroy(this.st_process)
destroy(this.st_1)
destroy(this.cb_step_2)
destroy(this.cb_step_1)
destroy(this.st_hipdb)
destroy(this.st_npdb)
destroy(this.cb_step_4)
destroy(this.cb_cancel)
destroy(this.cb_step_3)
destroy(this.dw_verifs)
destroy(this.dw_hipdb)
end on

event closequery;//integer i 
//
//if ii_up_check = 1 then
//	i = messagebox("Update not complete.","You have created the NPDB file, but you have not completed the entire process.  ~rTo update the verification records, you must click the CHECK STATUS CODE button.~rDo you wish to close without updating?" ,question!,yesno!,2)
//	if i = 2 then return
//end if
//	
end event

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_1 from commandbutton within w_send_file_messd
integer x = 1509
integer y = 1304
integer width = 247
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;DataWindowChild dwchild

dw_1.SetTransObject( SQLCA )
dw_1.InsertRow( 0 )
dw_1.GetChild( "facility_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( gs_user_id )
end event

type dw_1 from datawindow within w_send_file_messd
integer x = 320
integer y = 140
integer width = 1051
integer height = 92
integer taborder = 70
string dataobject = "d_select_facility_npdb"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;DataWindowChild dwchild

dw_1.SetTransObject( SQLCA )
dw_1.InsertRow( 0 )
dw_1.GetChild( "facility_id", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( gs_user_id )
end event

event itemchanged;is_parent_facility_id = data

cb_step_1.Enabled = True
end event

type st_3 from statictext within w_send_file_messd
integer x = 329
integer y = 48
integer width = 585
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
string text = "Select Parent Facility"
boolean focusrectangle = false
end type

type st_2 from statictext within w_send_file_messd
integer x = 155
integer y = 1016
integer width = 283
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
string text = "No update"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_view from commandbutton within w_send_file_messd
integer x = 471
integer y = 1140
integer width = 759
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "No Exceptions"
end type

event clicked;openwithparm(w_npdb_exceptions,is_exceptions )
end event

type dw_bad_pracs from datawindow within w_send_file_messd
boolean visible = false
integer x = 1312
integer y = 788
integer width = 475
integer height = 612
integer taborder = 30
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
end type

type st_process from statictext within w_send_file_messd
integer x = 46
integer y = 512
integer width = 1655
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
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_send_file_messd
integer x = 9
integer y = 1252
integer width = 247
integer height = 224
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;dw_verifs.visible = true
parent.height = 2000
parent.width = 3500
parent.x = 10
parent.y = 10
dw_bad_pracs.visible = true
end event

type cb_step_2 from commandbutton within w_send_file_messd
integer x = 466
integer y = 756
integer width = 763
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Verify File was Created"
end type

event clicked;messagebox("is_file_name",is_file_name)
IF FileExists( is_file_name ) THEN
	MessageBox("Success", "The NPDB upload file was created successfuly.~r" + is_file_name )
	cb_step_3.Enabled = True
ELSE
	MessageBox("Failed", "The NPDB upload file was NOT created successfuly." )
	cb_step_3.Enabled = false
END IF
end event

type cb_step_1 from commandbutton within w_send_file_messd
integer x = 466
integer y = 628
integer width = 763
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Create Upload File"
end type

event clicked;Integer li_parent_facility_id
String ls_param
integer c

this.enabled = false

if not(fileexists("c:\icd\itp.ini")) then
	messagebox("File not found","Unable to find file itp.ini, check if itp.ini file is in " + gs_dir_path + "icp directory.~r If this directory does not exist you will not be able to continue. ")
	return -1
end if
//ls_command = " intellicred client-f1*c:\icd\"
ii_up_check = 0
pfc_n_cst_npdb lnv_npdb

lnv_npdb = CREATE pfc_n_cst_npdb

ls_param = " intellicred client-f" + String( is_parent_facility_id ) + "*" + gs_dir_path + "icd\"

st_npdb.text = "Retrieving practitioner NPDB records for processing."
st_hipdb.text = "Retrieving HIPDB records for processing."
is_file_name = lnv_npdb.of_npdb_sub( ls_param )

IF is_file_name  <> "-1" THEN
	MessageBox("NPDB", "The NPDB export file has been saved as " + is_file_name )
	cb_step_2.Enabled = True
	cb_step_3.Enabled = True
	ii_up_check = 1
END IF

DESTROY lnv_npdb

Return 0
end event

type st_hipdb from statictext within w_send_file_messd
integer x = 41
integer y = 388
integer width = 1614
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "click Create Upload File button."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_npdb from statictext within w_send_file_messd
integer x = 41
integer y = 288
integer width = 1614
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Select parent facility and"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_step_4 from commandbutton within w_send_file_messd
integer x = 466
integer y = 1012
integer width = 763
integer height = 108
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Check Status Code"
end type

event clicked;Integer li_FileNum
Integer i
String ls_retval
String ls_error
Integer li_status_cd

li_FileNum = FileOpen( gs_dir_path + "icd\itpstat.dat" ) 

FOR i = 1 TO 10
	FileRead ( li_FileNum, ls_retval )
	IF Pos( Upper( ls_retval ), "STATUSCODE" ) > 0  THEN
		Exit
	END IF
END FOR

//messagebox("", ls_retval)
li_status_cd = Integer( Mid( ls_retval, Pos( ls_retval, "=" ) +1, 100 ))

CHOOSE CASE li_status_cd
	CASE 0
		ls_error = "Success, no errors"
		//update the records at this point
		//update the action item detail view by updating then re-retrieving data
//		IF dw_verifs.Update() <> 1 THEN
//			MessageBox("7 Update Failed", "Error while updating " + dw_verifs.DataObject )
//			Return -1
//		ELSE
//			COMMIT USING SQLCA;
//			w_send_file.dw_verifs.reset()
//		END IF
//		
//		IF dw_HIPDB.Update() <> 1 THEN
//			MessageBox("7 Update Failed", "Error while updating " + dw_HIPDB.DataObject )
//			ii_up_check = 0
//			Return -1
//		ELSE
//			COMMIT USING SQLCA;
//		END IF
	CASE -1
		ls_error = "Error on NPDB-HPDB server, reattempt transfer."		
	CASE -4
		ls_error = "Database error on NPDB-HIPDB server, reattempt transfer."		
	CASE -18
		ls_error = "Error in downloaded ICD response files, reattempt transfer."		
	CASE -19		
		ls_error = "Error in getting information from the downloaded file, reattempt transfer."		
	CASE -20
		ls_error = "Unable to open downloaded file, check if sufficient disk space is available to download file and reattempt transfer."		
	CASE -21
		ls_error = "Generic error code, some failure occured."		
	CASE -22
		ls_error = "Usage error, check command line parameter."		
	CASE -23 
		ls_error = "Error in reading Initialization file itp.ini, check if itp.ini file is in C:\icp directory."		
	CASE -24
		ls_error = "Unable to open program lg file, check if disk space is available."		
	CASE -25
		ls_error = "Error in username and password validation, check that the Data Bank Id number and Password are correct."		
	CASE -30
		ls_error = "Error validating parameter in itp.ini, a parameter is missing or value is invalid."		
	CASE -31
		ls_error = "Error validating UploadFile, upload file missing or a file listed in the upload file does not exist."		
	CASE -32
		ls_error = "Error validating DownloadDir, directory does not exist.  Check to see if C:\icp\download directory exists."		
	CASE -40
		ls_error = "Error opening connection to NPDB-HIPDB server, check internet connection and reattempt transfer."
	CASE -41
		ls_error = "Error getting input stream to NPDB-HIPDB server, check internet connection and reattempt transfer."		
	CASE -42
		ls_error = "Error getting output stream from NPDB-HIPDB server, check internet connection and reattempt transfer."		
	CASE -50
		ls_error = "Error reading status response from NPDB-HIPDB server, reattempt transfer."		
	CASE -51
		ls_error = "Error processing web request, reattempt transfer."		
	CASE -52
		ls_error = "Error getting status code, reattempt transfer."				
	CASE -53
		ls_error = "Error sending ICD submission files, reattempt transfer."				
	CASE -54
		ls_error = "Error downloading ICD response files, reattempt transfer."				
	CASE	-55
		ls_error = "Error movng ICD response files to the download directory, no permission to write to the directory or the device has run out of space."				
	CASE -56
		ls_error = "Error getting the list of ICD response file downloaded, reattempt transfer."				
	CASE ELSE
		ls_error = "Unkown error message."
END CHOOSE

FileClose( li_FileNum )
ii_up_check = 0
MessageBox( "Return Code  " + string(li_status_cd), ls_error )

end event

type cb_cancel from commandbutton within w_send_file_messd
integer x = 466
integer y = 1304
integer width = 763
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
boolean cancel = true
end type

event clicked;integer i 

if ii_up_check = 1 then
	i = messagebox("Update not complete.","You have created the NPDB file, but you have not completed the entire process.  ~rTo update the verification records, you must click the CHECK STATUS CODE button.~rDo you wish to close without updating?" ,question!,yesno!,2)
	if i = 2 then 
		return
	else
		close(parent)
	end if
else
	close(parent)
end if
end event

type cb_step_3 from commandbutton within w_send_file_messd
integer x = 466
integer y = 884
integer width = 763
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Start File Transfer"
end type

event clicked;//Integer li_filenum
//String ls_sub_file
//messagebox("", is_file_name )
//li_FileNum = FileOpen( is_file_name , StreamMode!, Read!, LockWrite!, Replace!)
//FileRead( li_filenum, ls_sub_file )
//MessageBox("just read", ls_sub_file )
//FileClose( li_filenum )
//
//li_sub_file = Mid( ls_sub_file, 1, Len( ls_sub_file ) -1)
//MessFileNum = FileOpen( is_file_name , StreamMode!, Write!, LockWrite!, Replace!)
//ls_ageBox("", ls_sub_file )
//FileWrite( li_filenum, ls_sub_file )
//FileClose( li_filenum )
ii_up_check = 1
Run( "c:\icd\send.bat", Maximized! )//orig code 
//Run( "c:\icd\java Itp send", Maximized! )//maha 031302
MessageBox("Completed", "Click Check Status Code to continue." )
cb_step_4.Enabled = True





end event

type dw_verifs from datawindow within w_send_file_messd
boolean visible = false
integer x = 14
integer y = 8
integer width = 215
integer height = 880
integer taborder = 50
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
end type

type dw_hipdb from datawindow within w_send_file_messd
integer x = 617
integer y = 768
integer width = 457
integer height = 76
integer taborder = 80
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

