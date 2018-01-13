$PBExportHeader$n_appeon_download.sru
forward
global type n_appeon_download from nonvisualobject
end type
end forward

global type n_appeon_download from nonvisualobject autoinstantiate
end type

type prototypes
Function long URLDownloadToFile (long pCaller, String szURL, String szFileName, long dwReserved, long lpfnCB) library "urlmon.dll" Alias for "URLDownloadToFileA;Ansi"

Function int fnGetDocTime(string ip , string url, int port , ref string doctime) library "appeondll.dll" alias for "fnGetDocTime;Ansi"

Function long GetSystemDirectory(ref string lpBuffer, long uSize) library "kernel32.dll" alias for "GetSystemDirectoryA;Ansi"
end prototypes

type variables

String is_downurl = 'http:\\172.17.3.2:8080\intellicred\Templates\'

string is_ip
int    ii_port
string is_url
end variables

forward prototypes
public function integer of_downloadpdf (string as_url)
public function integer of_downloadfile (string as_url, string as_filename)
public function string of_parsefile (string as_filepath)
public subroutine of_parsepath (string as_filepath)
public function integer of_downloaddll ()
end prototypes

public function integer of_downloadpdf (string as_url);
inet  linet_web

linet_web = create inet

linet_web.hyperlinktourl( as_url)

return 1
end function

public function integer of_downloadfile (string as_url, string as_filename);
long	ll_pcaller , ll_reserved, ll_lpfn
long		ll_rtn
string	ls_filename , ls_url
string  ls_filedate_local,ls_filedate_server
String ls_downurl

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Zhang XingRen
//$<reason> 
if as_url = "" then
	//$<Modify> 02.26.2008 by Andy
	//ls_downurl = gnv_data.of_getitem( "icred_settings", "downloadurl", false)
	SELECT TOP 1 downloadurl INTO :ls_downurl FROM icred_settings;
	//end of modify 02.26.2008
else
	ls_downurl = as_url
end if
//---------------------------- APPEON END ----------------------------


IF LEN(ls_downurl)>0 THEN is_downurl = ls_downurl

ls_filename = of_parsefile( as_filename)

setnull(ll_pcaller)
setnull(ll_lpfn)

ls_url = is_downurl + ls_filename

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 11.03.2008 By: Ken.Guo
//$<reason> Set file's readonly property to False. Otherwise download failed.
n_cst_filesrvwin32 lnv_FileSrv
lnv_FileSrv = Create n_cst_filesrvwin32 
IF fileexists( as_filename ) THEN
	lnv_FileSrv.of_setfilereadonly( as_filename, False)
END IF
//---------------------------- APPEON END ----------------------------

//download file from web server as_url to local disk as_filename
ll_rtn = URLDownloadToFile(ll_pcaller, ls_url, as_filename, 0, ll_lpfn)

If isvalid(lnv_FileSrv) Then Destroy lnv_FileSrv

return ll_rtn
end function

public function string of_parsefile (string as_filepath);string	ls_filename , ls_tempPath  , ls_path
long		ll_pos

n_cst_filesrvwin32  lnv_filesvr
If not isvalid(lnv_filesvr) Then lnv_filesvr = create n_cst_filesrvwin32

ls_filename = as_filepath
ll_pos = pos(ls_filename , '\')
ls_tempPath = ''

Do While ll_pos > 0
	ls_tempPath = left(ls_filename , ll_pos)
	ls_path     = ls_path + ls_tempPath 
	ls_filename = mid(ls_filename , ll_pos + 1)
	If mid(ls_tempPath,2,1) = ':' Then 
		ll_pos = pos(ls_filename , '\')
		continue
	End If
	
	If not lnv_filesvr.of_directoryexists( ls_path) Then
		lnv_filesvr.of_createdirectory( ls_path)
	End If
	
	ll_pos = pos(ls_filename , '\')
Loop

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.22.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(lnv_filesvr) then Destroy lnv_filesvr
//---------------------------- APPEON END ----------------------------

return ls_filename
end function

public subroutine of_parsepath (string as_filepath);string	ls_filepath , ls_tempPath  , ls_path
long		ll_pos

n_cst_filesrvwin32  lnv_filesvr
If not isvalid(lnv_filesvr) Then lnv_filesvr = create n_cst_filesrvwin32

If lnv_filesvr.of_directoryexists( as_filepath) Then return
	
ls_filepath = as_filepath
ll_pos = pos(ls_filepath , '\')
ls_tempPath = ''

Do While ll_pos > 0
	ls_tempPath = left(ls_filepath , ll_pos)
	ls_path     = ls_path + ls_tempPath 
	ls_filepath = mid(ls_filepath , ll_pos + 1)
	If mid(ls_tempPath,2,1) = ':' Then 
		ll_pos = pos(ls_filepath , '\')
		continue
	End If
	
	If not lnv_filesvr.of_directoryexists( ls_path) Then
		lnv_filesvr.of_createdirectory( ls_path)
	End If
	
	ll_pos = pos(ls_filepath , '\')
Loop

If len(ls_filepath) > 0 Then
	ls_path     = ls_path + ls_filepath 
	If not lnv_filesvr.of_directoryexists( ls_path) Then
		lnv_filesvr.of_createdirectory( ls_path)
	End If
End If

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.22.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(lnv_filesvr) then Destroy lnv_filesvr
//---------------------------- APPEON END ----------------------------
end subroutine

public function integer of_downloaddll ();integer i
integer li_FileCount
string  ls_Sys32Path
string  ls_SourceFile
string  ls_FileFullName
string  ls_FileName[] = {"ConvertPDF.dll", "zlib1.dll"}

// Get system directory
ls_Sys32Path = Space(255)
GetSystemDirectory(ls_Sys32Path, 255)
if Trim(ls_Sys32Path) = "" then
	MessageBox("Error", "Failed to get system directory.")
	Return -1
end if

// Download DLLs if not exists in system directory
n_cst_filesrvwin32  lnv_filesvr
lnv_FileSvr = Create n_cst_filesrvwin32
li_FileCount = UpperBound(ls_FileName[])

string sss

sss = AppeonGetClientType()
messagebox("appeon client type",sss)


for i = 1 to li_FileCount
	ls_FileFullName = ls_Sys32Path + "\" + ls_FileName[i]
	if FileExists(ls_FileFullName) then Continue
	
	if AppeonGetClientType() = "PB" then
		ls_SourceFile = gs_current_path + "\" + ls_FileName[i]
		//lnv_FileSvr.of_FileCopy(ls_SourceFile, ls_FileFullName)
		FileCopy(ls_SourceFile, ls_FileFullName,true) //APB Blob Bug - jervis 03.23.2010
		if not FileExists(ls_FileFullName) then
			//Start Code Change ----09.09.2008 #V85 maha - modified message to display file paths
			MessageBox("Copy File", "Failed to copy '" + ls_SourceFile + "' file to system directory(" + ls_Sys32Path + "). Please contact the system administrator.")
			//MessageBox("Copy File", "Failed to copy '" + ls_FileName[i] + "' file to system directory. Please contact the system administrator.")
			//End Code Change---09.09.2008
		end if
	else
		of_DownloadFile("", ls_FileFullName)
		if not FileExists(ls_FileFullName) then
			MessageBox("Download DLLs", "Failed to download '" + ls_FileName[i] + "' file. Please contact the system administrator.")
		end if
	end if
next
Destroy lnv_FileSvr

Return 1
end function

on n_appeon_download.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_appeon_download.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

