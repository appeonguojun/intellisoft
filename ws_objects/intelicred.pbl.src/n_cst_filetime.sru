$PBExportHeader$n_cst_filetime.sru
forward
global type n_cst_filetime from nonvisualobject
end type
type os_filedatetime from structure within n_cst_filetime
end type
type os_fileopeninfo from structure within n_cst_filetime
end type
type os_finddata from structure within n_cst_filetime
end type
type os_securityattributes from structure within n_cst_filetime
end type
type os_systemtime from structure within n_cst_filetime
end type
end forward

type os_filedatetime from structure
	unsignedlong		ul_lowdatetime
	unsignedlong		ul_highdatetime
end type

type os_fileopeninfo from structure
	character		c_length
	character		c_fixed_disk
	unsignedinteger		ui_dos_error
	unsignedinteger		ui_na1
	unsignedinteger		ui_na2
	character		c_pathname[260]
end type

type os_finddata from structure
	unsignedlong		ul_fileattributes
	os_filedatetime		str_creationtime
	os_filedatetime		str_lastaccesstime
	os_filedatetime		str_lastwritetime
	unsignedlong		ul_filesizehigh
	unsignedlong		ul_filesizelow
	unsignedlong		ul_reserved0
	unsignedlong		ul_reserved1
	character		ch_filename[260]
	character		ch_alternatefilename[100]
end type

type os_securityattributes from structure
	unsignedlong		ul_length
	string		ch_description
	boolean		b_inherit
end type

type os_systemtime from structure
	unsignedinteger		ui_wyear
	unsignedinteger		ui_wmonth
	unsignedinteger		ui_wdayofweek
	unsignedinteger		ui_wday
	unsignedinteger		ui_whour
	unsignedinteger		ui_wminute
	unsignedinteger		ui_wsecond
	unsignedinteger		ui_wmilliseconds
end type

global type n_cst_filetime from nonvisualobject autoinstantiate
end type

type prototypes
// 
//Function uint GetModuleFileNameA(ulong hModule,ref string lpFilename,ulong nSize) Library "kernel32.dll" // 
FUNCTION ulong CreateFileA(ref string fname, ulong f_access, ulong f_share, ulong f_sec, ulong f_create, ulong f_flag, ulong f_attrib) LIBRARY "kernel32.dll"  alias for "CreateFileA;Ansi"

Function long FindFirstFileA (ref string filename, ref os_finddata findfiledata) library "kernel32.dll" alias for "FindFirstFileA;Ansi" 
Function boolean FindNextFileA (long handle, ref os_finddata findfiledata) library "kernel32.dll" alias for "FindNextFileA;Ansi" 
Function boolean FindClose (long handle) library "kernel32.dll" 
Function long    OpenFile (ref string filename, ref os_fileopeninfo of_struct, ulong action) LIBRARY "kernel32.dll" alias for "OpenFile;Ansi" 
Function boolean CloseHandle (long file_hand) LIBRARY "kernel32.dll" 
Function boolean GetFileTime(long hFile, ref os_filedatetime  lpCreationTime, ref os_filedatetime  lpLastAccessTime, ref os_filedatetime  lpLastWriteTime  )  library "kernel32.dll" alias for "GetFileTime;Ansi" 
Function boolean FileTimeToSystemTime(ref os_filedatetime lpFileTime, ref os_systemtime lpSystemTime) library "kernel32.dll" alias for "FileTimeToSystemTime;Ansi" 
Function boolean FileTimeToLocalFileTime(ref os_filedatetime lpFileTime, ref os_filedatetime lpLocalFileTime) library "kernel32.dll" alias for "FileTimeToLocalFileTime;Ansi" 
Function boolean SetFileTime(long hFile, os_filedatetime  lpCreationTime, os_filedatetime  lpLastAccessTime, os_filedatetime  lpLastWriteTime  )  library "kernel32.dll" alias for "SetFileTime;Ansi" 
Function boolean SystemTimeToFileTime(os_systemtime lpSystemTime, ref os_filedatetime lpFileTime) library "kernel32.dll" alias for "SystemTimeToFileTime;Ansi" 
Function boolean LocalFileTimeToFileTime(ref os_filedatetime lpLocalFileTime, ref os_filedatetime lpFileTime) library "kernel32.dll" alias for "LocalFileTimeToFileTime;Ansi"  

Function long SetFileDateTime (  string filename,  os_filedatetime lpFileTime,string errInfo ) Library "ContractlogixINET.dll"  

end prototypes

type variables


end variables

forward prototypes
public function integer of_getcreatedatetime (string as_filename, ref datetime adt)
public function integer of_getlastwritedatetime (string as_filename, ref datetime adt)
public function integer of_setlastwritedatetime (string as_filename, datetime adt)
private function integer of_convertfiledatetimetopb (os_filedatetime astr_filetime, ref datetime adt)
private function integer of_convertpbdatetimetofile (datetime adt, ref os_filedatetime astr_filetime)
public function integer of_getlastwritedatetime (string as_filename, ref string as_lastdate)
end prototypes

public function integer of_getcreatedatetime (string as_filename, ref datetime adt);// 
long ll_handle 
os_finddata    lstr_FindData 


If gnv_user_option.of_get_option_value(gs_user_id, "cache_files" )  = '0' Then Return -1 //Added By Ken.Guo 2015-07-28

If not fileExists(as_filename) then Return 0 //Added By Ken.Guo 2015-07-21

// Get the file information 
ll_handle = FindFirstFileA(as_FileName, lstr_FindData) 
If ll_handle <= 0 Then 
	messagebox('','error to open')
	Return -1
end if
FindClose(ll_handle) 

// Convert the date and time 
Return of_ConvertFileDatetimeToPB(lstr_FindData.str_CreationTime, adt) 

end function

public function integer of_getlastwritedatetime (string as_filename, ref datetime adt);// 
long    ll_handle 
os_finddata    lstr_FindData 



If gnv_user_option.of_get_option_value(gs_user_id, "cache_files" )  = '0' Then Return -1 //Added By Ken.Guo 2015-07-28

If Fileexists(as_filename) Then					//Added By Mark Lee 07/10/2015
	// Get the file information 
	Try
		ll_handle = FindFirstFileA(as_FileName, lstr_FindData) 
	Catch (runtimeerror e1)
		//Added By Ken.Guo 2016-04-19 added try catch.
		gnv_debug.of_output(True, 'Failed to get files last modified  datetime.   ' + e1.text)
		setnull(adt)
		Return -1
	End Try
	
	If ll_handle <= 0 Then 
		setnull(adt)
		gnv_debug.of_output(True, 'Failed to get files last modified  datetime.  FindFirstFileA ()=  -1 ' + as_FileName)
		Return -1 
	End If
	FindClose(ll_handle) 
else					//Added By Mark Lee 07/10/2015
	setnull(adt)	
	gnv_debug.of_output(True, 'The file does not exist.  of_getlastwritedatetime ()=  -1 ' + as_FileName)
	Return -1 
end if 

// Convert the date and time 
Return of_ConvertFileDatetimeToPB(lstr_FindData.str_LastWriteTime, adt) 

end function

public function integer of_setlastwritedatetime (string as_filename, datetime adt);
//Use our dll to set the last modify date. workaround this issue: faild to set the date in 64bit OS for APB651045
string ls_error
long			ll_return 
os_filedatetime lstr_FileTime


If gnv_user_option.of_get_option_value(gs_user_id, "cache_files" )  = '0' Then Return 0 //Added By Ken.Guo 2015-07-28

If not fileExists(as_filename) then Return 0 //Added By Ken.Guo 2015-07-21

this.of_convertpbdatetimetofile( adt, lstr_FileTime)

ls_error = Space(200)
Try 
	ll_return  = SetFileDateTime(as_filename, lstr_FileTime,ls_error) 			//Added By Mark Lee 07/10/2015
Catch (runtimeerror e1)  
	//Added By Ken.Guo 2016-04-19. Add  try catch.
	gnv_debug.of_output(true, 'Faile to set the file ('+as_filename+') date. return:'+string(e1.text) )
	Return -1
End Try

If ll_return  = 0 Then	
	Return 1
Else
	gnv_debug.of_output(true, 'Faile to set the file ('+as_filename+') date. return:'+string(ll_return)+" ; error:" + ls_error)
	Return -1
End if



//boolean lb_Ret 
//long ll_handle 
//os_filedatetime lstr_FileTime, lstr_Empty 
//os_finddata lstr_FindData 
//os_fileopeninfo lstr_FileInfo 
//
//// Get the file information. 
//// This is required to keep the Last Access date from changing. 
//// It will be changed by the OpenFile function. 
//ll_handle = FindFirstFileA(as_FileName, lstr_FindData) 
//If ll_handle <= 0 Then 
//	gnv_debug.of_output(True, 'Failed to set files last modified  datetime.  FindFirstFileA() =  '+String(ll_handle)+'. ' + as_FileName)
//	Return -1 
//End If
//
//FindClose(ll_handle) 
//
//// Convert the date and time 
//If of_ConvertPBDatetimeToFile(adt, lstr_FileTime) < 0 Then 
//	gnv_debug.of_output(True, 'Failed to set files last modified  datetime.  of_ConvertPBDatetimeToFile ()=  -1 ' + as_FileName)
//	Return -1 
//End If
//
//// Set the file structure information 
//lstr_FileInfo.c_fixed_disk = "~000" 
//lstr_FileInfo.c_pathname = as_FileName 
//lstr_FileInfo.c_length = "~142"  
//
//
//// Open the file 
////ll_handle = OpenFile ( as_filename, lstr_FileInfo, 2 )  //you cannot use the OpenFile function to open a file with a path length that exceeds 128 characters. The CreateFile function does not have this path length limitation.
//ll_handle = CreateFileA(as_FileName, 3221225472, 0, 0, 3, 128, 0) 
//
//If ll_handle < 1 Then 
//	gnv_debug.of_output(True, 'Failed to set files last modified  datetime.  CreateFileA() =  '+String(ll_handle)+'. ' + as_FileName)
//	Return -1 
//End If
//
//lb_Ret = SetFileTime(ll_handle, lstr_Empty, lstr_FindData.str_LastAccessTime, lstr_FileTime) 
//
//CloseHandle(ll_handle) 
//
//If lb_Ret Then 
//	//messagebox('','set ok')
//	Return 1 
//Else 
//	gnv_debug.of_output(True, 'Failed to set files last modified  datetime.  SetFileTime() =  '+String(lb_Ret)+'. ' + as_FileName)
//	Return -1 
//End If 
//
//
end function

private function integer of_convertfiledatetimetopb (os_filedatetime astr_filetime, ref datetime adt);//PB 
os_filedatetime    lstr_LocalTime 
os_systemtime    lstr_SystemTime 

If Not FileTimeToLocalFileTime(astr_FileTime, lstr_LocalTime) Then 
	gnv_debug.of_output(True, 'Failed to  convert datetime.  FileTimeToLocalFileTime() =  False ' )
	Return -1 
end if

If Not FileTimeToSystemTime(lstr_LocalTime, lstr_SystemTime) Then 
	gnv_debug.of_output(True, 'Failed to  convert datetime.  FileTimeToSystemTime() =  False ' )
	Return -1 
end If
	
	adt = Datetime(Date(String(lstr_SystemTime.ui_wyear) + "-" + & 
      	String(lstr_SystemTime.ui_WMonth) + "-" + & 
      	String(lstr_SystemTime.ui_WDay) ), Time(  String(lstr_SystemTime.ui_wHour) + ":" + & 
      	String(lstr_SystemTime.ui_wMinute) + ":" + & 
      	String(lstr_SystemTime.ui_wSecond) ))
			
Return 1 

end function

private function integer of_convertpbdatetimetofile (datetime adt, ref os_filedatetime astr_filetime);//PB 
os_filedatetime    lstr_LocalTime 
os_systemtime    lstr_SystemTime 

lstr_SystemTime.ui_wyear = year(date(adt)) 
lstr_SystemTime.ui_WMonth = Month(date(adt)) 
lstr_SystemTime.ui_WDay = Day(date(adt)) 

lstr_SystemTime.ui_wHour = hour(time(adt)) 
lstr_SystemTime.ui_wMinute = Minute(time(adt)) 
lstr_SystemTime.ui_wSecond = Second(time(adt)) 
lstr_SystemTime.ui_wMilliseconds = Long(String(adt, "fff")) 

If Not SystemTimeToFileTime(lstr_SystemTime, lstr_LocalTime) Then Return -1 

If Not LocalFileTimeToFileTime(lstr_LocalTime, astr_FileTime) Then Return -1 

Return 1 

end function

public function integer of_getlastwritedatetime (string as_filename, ref string as_lastdate);datetime ldt_lastdate 
integer li_ret



If not fileExists(as_filename) then Return 0 //Added By Ken.Guo 2015-07-21

li_ret = of_getlastwritedatetime(as_filename,ldt_lastdate)
If li_ret > 0 Then
	as_lastdate = String(ldt_lastdate, 'mm/dd/yyyy hh:mm:ss')
	Return li_ret
Else
	setnull(as_lastdate)
	Return -1
End If

end function

on n_cst_filetime.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_filetime.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

