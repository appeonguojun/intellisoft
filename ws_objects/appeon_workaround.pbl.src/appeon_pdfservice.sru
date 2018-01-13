$PBExportHeader$appeon_pdfservice.sru
forward
global type appeon_pdfservice from nonvisualobject
end type
end forward

global type appeon_pdfservice from nonvisualobject
end type
global appeon_pdfservice appeon_pdfservice

type prototypes
private function boolean SHGetSpecialFolderPathA(Long  hwndOwner, ref string docPath,int nFolder, boolean fCreate) library "shell32.dll" alias for "SHGetSpecialFolderPathA;Ansi"
private function boolean Sleep(Long dwMilliseconds) library "kernel32.dll"

end prototypes

type variables
private:

CONSTANT String APPEON_PATH = "<PATH>="
CONSTANT String PRINTER_DIR = "Appeon Printer"
CONSTANT Long	NULL_HANDLE = 0
CONSTANT int	CSIDL_PERSONAL = 5

//query interval for print
int ii_queryinterval = 1
//related datawindow with save as pdf
datastore ids_source
//related datastore with save as pdf
datawindow idw_source
//PDF Printer Name
String is_printername = "Customer PDFPrinter"
//error code
int ii_errorcode = 0

//the max seconds when waiting to write pdf file
int ii_waittime 
end variables

forward prototypes
public function string of_getdocumentname ()
public function integer of_writepathfile (string as_filename, string as_pdffilename)
public function string of_getprinterpath ()
public function String of_getpathdelimiter ()
public subroutine of_setqueryinterval (integer ai_interval)
public subroutine of_setrelateddw (ref datawindow ad_dw)
public subroutine of_setrelatedds (ref datastore ad_ds)
public subroutine of_setprintername (string as_printername)
public function string of_getlasterror ()
public function integer of_saveas (string as_filename, boolean ab_sync)
public function integer of_syncprintwork (string as_pdffilename)
end prototypes

public function string of_getdocumentname ();string ls_docname

Randomize (cpu())

ls_docname = "PDF"+string(Rand(999999))

return ls_docname
end function

public function integer of_writepathfile (string as_filename, string as_pdffilename);int fhandle,li_rtn
string ls_file

ls_file = of_getprinterpath() + of_getpathdelimiter() + PRINTER_DIR

if not DirectoryExists (ls_file) then
	CreateDirectory(ls_file)
end if

ls_file = ls_file + of_getpathdelimiter() + as_filename

fhandle = FileOpen(ls_file, StreamMode!, Write!, LockWrite!, Replace!)

if fhandle = 0 then
	return -1
end if

if (lower(right(as_pdffilename,4)) = ".pdf") then
	as_pdffilename = left(as_pdffilename,len(as_pdffilename) - 4 )
end if

li_rtn = FileWrite(fhandle,as_pdffilename)

if li_rtn < 0 then
	return -1
end if

li_rtn = FileClose(fhandle)

if li_rtn <> 1 then
	return -1
end if

return 1
end function

public function string of_getprinterpath ();String ls_path

ls_path = space(255)

SHGetSpecialFolderPathA(NULL_HANDLE,ls_path,CSIDL_PERSONAL,false)

return ls_path;
end function

public function String of_getpathdelimiter ();return "\"
end function

public subroutine of_setqueryinterval (integer ai_interval);
this.ii_queryinterval = ai_interval
end subroutine

public subroutine of_setrelateddw (ref datawindow ad_dw);this.idw_source = ad_dw
setnull(ids_source)
end subroutine

public subroutine of_setrelatedds (ref datastore ad_ds);this.ids_source = ad_ds
setnull(idw_source)
end subroutine

public subroutine of_setprintername (string as_printername);this.is_printername = as_printername
end subroutine

public function string of_getlasterror ();String ls_error

choose case ii_errorcode
	case 0
		ls_error = ""
	case 1
		ls_error = "set printer error or invalid printer name!"
	case 2
		ls_error = "datastore or datawindow is a invalid object!"
	case 3
		ls_error = "write file error!"
	case 4
		ls_error = "print pdf file error!"
	case 5
		ls_error = "sync print pdf file error!"
end choose

return ls_error
end function

public function integer of_saveas (string as_filename, boolean ab_sync);string 	ls_docname
int 		li_rtn

as_filename = lower(trim(as_filename))

if right(as_filename,4) <> ".pdf" then 
	messagebox("Prompt","Please input the PDF type file.")
	return -1
end if

if pos(as_filename,":\",1) <> 2 then 
	messagebox("Prompt","Please input the full path file.")
	return -1
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2007-11-09 By: Scofield
//$<Reason> Install printers

li_rtn = f_PrinterSetup(1)
if li_rtn = 1 then
	ii_errorcode = 1
	return -1
elseif li_rtn = 4 then
	return 1
end if
//---------------------------- APPEON END ----------------------------

//delete the same name file 
if fileexists(as_filename) then filedelete(as_filename)

ls_docname = of_getdocumentname()

li_rtn = PrintSetPrinter(this.is_printername)

if li_rtn <> 1 then
	ii_errorcode = 1
	return -1
end if

if (isnull(this.idw_source)) and (isnull(this.ids_source)) then
	ii_errorcode = 2
	return -1
end if


li_rtn = of_writepathfile(ls_docname,as_filename)

if li_rtn <> 1 then
	ii_errorcode = 3
	return -1
end if

if (not isnull(this.ids_source)) then
	this.ids_source.Object.DataWindow.Print.DocumentName = APPEON_PATH +ls_docname
	this.ids_source.Object.DataWindow.Print.Prompt= "no"
	li_rtn = this.ids_source.print(false)
end if

if (not isnull(this.idw_source)) then
	this.idw_source.Object.DataWindow.Print.DocumentName = APPEON_PATH +ls_docname
	this.idw_source.Object.DataWindow.Print.Prompt= "no"
	li_rtn = this.idw_source.print(false)
end if

if li_rtn <> 1 then
	ii_errorcode = 4
	return -1
end if

if (ab_sync) then
	li_rtn = of_syncprintwork(as_filename)
	if li_rtn <> 1 then
		ii_errorcode = 5
		return -1
	end if
end if

ii_errorcode = 0

return 1
end function

public function integer of_syncprintwork (string as_pdffilename);boolean lb_continue = true
Long ll_handle
Long ll_second

//Sleep(2000)
do while ll_second <= ii_waittime
	sleep(50)
	ll_second = ll_second + 50
	if FileExists(as_pdffilename) then exit
loop

if (lower(right(as_pdffilename,4))) <> ".pdf" then
	as_pdffilename = as_pdffilename + ".pdf"
end if

do while lb_continue
	
	if (FileExists(as_pdffilename)) then
		ll_handle = FileOpen(as_pdffilename,StreamMode!,Write!,LockWrite!,Append!);
	
		if ll_handle < 0 then
			lb_continue = true
			Sleep(this.ii_queryinterval)
		else
			FileClose(ll_handle)
			lb_continue = false
		end if
	else
		return -1
	end if
loop

return 1
end function

on appeon_pdfservice.create
call super::create
TriggerEvent( this, "constructor" )
end on

on appeon_pdfservice.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;setNull(ids_source)
setNull(idw_source)

//init the max time when waiting to write pdf file
//ii_waittime = long(ProfileString(theprogram.g_ini, "time", "waittime",'2000'))
//is_printername = trim(ProfileString(theprogram.g_ini, "PROGRAM", "PDFPRINTER",'Customer PDFPrinter'))

end event

