$PBExportHeader$n_cst_pdf.sru
forward
global type n_cst_pdf from nonvisualobject
end type
end forward

global type n_cst_pdf from nonvisualobject autoinstantiate
end type

type prototypes
FUNCTION ulong GetCurrentDirectoryA(ulong BufferLen, ref string currentdir) LIBRARY "Kernel32.dll" alias for "GetCurrentDirectoryA;Ansi"
//FUNCTION ulong GetEnvironmentVariableA( string szVarName,REF string lpValue, ulong dwSize ) LIBRARY "kernel32.dll" 
//Then, use SetEnvironmentVariable to change it: 
//FUNCTION boolean SetEnvironmentVariableA( string szVarName, string szValue ) LIBRARY "kernel32.dll"
FUNCTION long ShellExecuteA (long hwnd, string lpOperation, string lpFile, string lpParameters,  string lpDirectory, integer nShowCmd ) LIBRARY "SHELL32" alias for "ShellExecuteA;Ansi"
//added by gavins 20140218
function ulong RegOpenKeyEx( ulong hkey, string subkey, ulong uloptions, long samdesired, ref long result ) library "Advapi32.dll"  alias for "RegOpenKeyExW"
function long RegQueryValueEx( long hkey, string lpvaluename, long lpReserved, ref long lptype, ref string lpdata, ref long lpcbdata ) library "Advapi32.dll" alias for "RegQueryValueExW"
Function Long  RegCloseKey ( Long hkey )    Library "advapi32.dll" Alias for "RegCloseKey" 
end prototypes

type variables
CONSTANT STRING IS_PDF_PRINTER = 'Intellisoft PDF Printer'///'IntelliPDF' //'Sybase Datawindow PS' 
end variables

forward prototypes
public function integer of_add_pdf_printer ()
public function integer of_set_path ()
public function integer of_registryget (string as_subkey, string as_keyname, ref string as_value)
end prototypes

public function integer of_add_pdf_printer ();/******************************************************************************************************************
**  [PUBLIC]   : 
**==================================================================================================================
**  Purpose   	: 
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 03 November 2005  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

integer li_FileNum
string ls_run, ls_null
string PRINTER_PATH
string ls_printer_key, ls_ARCHITECTURE
string ls_message[]
n_cst_systeminfo lnv_systeminfo
////////////////////////////////////////////////////////////////////////////
// check to see if diver exist
////////////////////////////////////////////////////////////////////////////

//Start Code Change ---- 04.26.2006 #416 maha changed variable
//if not FileExists(gnv_app.is_application_path  + "\drivers\ADIST5.INF"  )   then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
if not FileExists(gnv_app.is_application_path  + "\drivers\ghostpdf.inf"  )   then ls_message[upperbound(ls_message) + 1] = 'The ghostpdf.inf file is missing, PDF Printer Installiation cannot continue.' //Modified By Ken.Guo 2010-10-18
//$<comment> 03.13.2008 by Andy
//$Reason:It will failed to install the PDF print with PB9 drivers in Windows 2003,
//        it should use PB11 drivers.
//if not FileExists(gnv_app.is_application_path  + "\drivers\PSCRIPT.DRV"  )  then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
//if not FileExists(gnv_app.is_application_path  + "\drivers\PSCRPTUI.DLL"  ) then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
//if not FileExists(gnv_app.is_application_path  + "\drivers\PSCRIPT.DLL"  )  then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
//if not FileExists(gnv_app.is_application_path  + "\drivers\ADIST5K.PPD"  )  then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
//end of comment 03.13.2008
/*
if not FileExists(gs_dir_path  + gs_DefDirName + "\drivers\ADIST5.INF"  )   then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
if not FileExists(gs_dir_path  + gs_DefDirName + "\drivers\PSCRIPT.DRV"  )  then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
if not FileExists(gs_dir_path  + gs_DefDirName + "\drivers\PSCRPTUI.DLL"  ) then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
if not FileExists(gs_dir_path  + gs_DefDirName + "\drivers\PSCRIPT.DLL"  )  then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
if not FileExists(gs_dir_path  + gs_DefDirName + "\drivers\ADIST5K.PPD"  )  then ls_message[upperbound(ls_message) + 1] = 'The ADIST5.INF file is missing, PDF Printer Installiation cannot continue.'
*/
//End Code Change---04.25.2006

if upperbound(ls_message) > 0 then 
	//Messagebox('PDF Printer Driver','There are files missing in the drivers directory. You will need to call intelisoft support.')
	f_system_error_handler ("There are files missing in the drivers directory. You will need to call intelisoft support.")
	return -1
end if 

////////////////////////////////////////////////////////////////////////////
// check to see if the printer is there
////////////////////////////////////////////////////////////////////////////

PRINTER_PATH = 'HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Devices'
gnv_appeondll.of_RegistryGet(PRINTER_PATH, IS_PDF_PRINTER, regString!,ls_printer_key) //Modified By Ken.Guo 08/22/2014.User appeondll to get registry key.
 

lnv_systeminfo = create n_cst_systeminfo
If lnv_systeminfo.of_get_envvar('ProgramW6432') <> '' or lnv_systeminfo.of_get_envvar('ProgramFiles(x86)')  <> '' Then //Modified By Ken.Guo 03/22/2013
	ls_ARCHITECTURE = '64-bit'
Else
	ls_ARCHITECTURE = '32-bit'
End If 

If ls_ARCHITECTURE = '64-bit' Then
	gnv_appeondll.of_RegistryGet(PRINTER_PATH, "Sybase DataWindow PS", regString!,ls_printer_key) //Modified By Ken.Guo 08/22/2014.User appeondll to get registry key.
	if not f_validstr(ls_printer_key) then
//		run( gnv_app.is_application_path + "\PDFPrinterX64_V10.exe" )
		setnull( ls_null )
		ShellExecuteA( handle( this ), "open",  gnv_app.is_application_path + "\PDFPrinterX64_V10.exe", ls_null, ls_null , 4 ) 
		return -1
	End If
Else

	if not f_validstr(ls_printer_key) then
		//$<modify> 03.13.2008 by Andy
		messagebox('Installing Printers', 'The printer ' + IS_PDF_PRINTER + ' is missing. This printer is required for saving  datawindows in pdf format. IntelliSoft will now add it. If a dialog box comes up please click continue. This process may take a few minutes to complete')
		//ls_run = " printui.dll,PrintUIEntry /if /b " + '"' +  IS_PDF_PRINTER + '"' + ' /f "' + gnv_app.is_application_path  + '\drivers\ADIST5.INF"' + " /r " + '"com4:"' +' /m' +  ' "Acrobat Distiller CS"' 
		ls_run = " printui.dll,PrintUIEntry /if /b " + '"' +  IS_PDF_PRINTER + '"' + ' /f "' + gnv_app.is_application_path  + '\drivers\ghostpdf.inf"' + " /r " + '"com4:"' +' /m' +  ' "GhostScript PDF"'  //Modified By Ken.Guo 2010-10-18. Replase sybase PS driver with GS Driver.
		//end of modify 03.13.2008
		run('rundll32.exe'  + ls_run)
	end if 
End If
	
long ll_start
ll_start = cpu()

DO UNTIL f_validstr(ls_printer_key)
	Yield()
	
	//Failed to install printer
	if cpu() - ll_start > 10000 then	
		//f_system_error_handler ("Failed to install printer. You will need to call intelisoft support.")
		return -1
	end if
   gnv_appeondll.of_RegistryGet(PRINTER_PATH, IS_PDF_PRINTER, regString!,ls_printer_key) //Modified By Ken.Guo 08/22/2014.User appeondll to get registry key.
LOOP


return 0
end function

public function integer of_set_path ();/******************************************************************************************************************
**  [PUBLIC]   : of_set_path
**==================================================================================================================
**  Purpose   	: Set the current "system path" for this session
**==================================================================================================================
**  Arguments 	: [none] 
**==================================================================================================================
**  Returns   	: -1 : Failure, 0 - Success
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: Michael B. Skinner 31 January 2006  © Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/

//FUNCTION ulong GetEnvironmentVariableA( string szVarName,REF string lpValue, ulong dwSize ) LIBRARY "kernel32.dll" 
//FUNCTION boolean SetEnvironmentVariableA( string szVarName, string szValue ) LIBRARY "kernel32.dll" 

ulong    lul_chars 
string    ls_path, ls_var 
string ls_null
setnull(ls_null)
string bin_path,ls_ARCHITECTURE
n_cst_systeminfo lnv_systeminfo

ls_var = "PATH" 
ls_path = Space( 1024 ) 
lul_chars = GetEnvironmentVariableA( ls_var, ls_path, 1024 ) 

lnv_systeminfo = create n_cst_systeminfo
If lnv_systeminfo.of_get_envvar('ProgramW6432') <> '' or lnv_systeminfo.of_get_envvar('ProgramFiles(x86)')  <> '' Then //Modified By Ken.Guo 03/22/2013
	ls_ARCHITECTURE = '64-bit'
Else
	ls_ARCHITECTURE = '32-bit'
End If

gnv_appeondll.of_RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\AFPL Ghostscript\8.53", "GS_DLL", RegString!, bin_path) //Modified By Ken.Guo 08/22/2014.User appeondll to get registry key.
If ls_ARCHITECTURE = '64-bit'  and ( isnull( bin_path ) or trim( bin_path ) = '' )  Then//added by gavins 20140218
	of_RegistryGet( "SOFTWARE\AFPL Ghostscript\8.53", "GS_DLL" , ref bin_path ) 
End If

//Start Code Change ----09.09.2008 #V85 maha - made changes to reflect 8.54 as well as 8.53
if not f_validstr(bin_path) then 
	gnv_appeondll.of_RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\AFPL Ghostscript\8.54", "GS_DLL", RegString!, bin_path) //Modified By Ken.Guo 08/22/2014.User appeondll to get registry key.
	If ls_ARCHITECTURE = '64-bit'  and ( isnull( bin_path ) or trim( bin_path ) = '' )  Then//added by gavins 20140218
		of_RegistryGet( "SOFTWARE\AFPL Ghostscript\8.54", "GS_DLL" , ref bin_path )
	End If
end if

if not f_validstr(bin_path) then  
	If ls_ARCHITECTURE = '64-bit'   Then//modified by gavins 20140218
		if MessageBox('Ghostscript Missing', 'The Ghostscript install is missing from this machine. Do you want to install it from then web? Once it is downloaded please install it or this message will appear again.',Question!,YesNo!) = 1 then 
//			run( gnv_app.is_application_path + "\PDFPrinterX64_V10.exe" )			//Added By Mark 07/24/2014  change for the win8 64-bit.
//				 ShellExecuteA ( Handle( This ), "open", 'IEXPLORE',"http://www.contractlogix.com/ftpdownload/CL_Web_INSTALL/Web_Deploy/gs910w64.exe" ,ls_Null, 4 )
			ShellExecuteA( handle( this ), "open",  gnv_app.is_application_path + "\PDFPrinterX64_V10.exe", ls_null, ls_null , 4 ) 
		End If
		 Return -1
	End If

	if messagebox('Missing Application', 'Ghostscript has not been installed on this machine. Would you like to install it?',question!,yesNO!,1) = 1 then 
		//Start Code Change ---- 04.26.2006 #418 maha	
		if not fileexists(gs_dir_path + gs_DefDirName + "\ghostscript\gs853w32.exe") and  not fileexists(gs_dir_path + gs_DefDirName + "\ghostscript\gs854w32.exe") then
			if MessageBox('Ghostscript Missing', 'The Ghostscript install is missing from this machine. Do you want to install it from then web? Once it is downloaded please install it or this message will appear again.',Question!,YesNo!) = 1 then 
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 03.24.2006 By: Liang QingShi
				//$<reason> Performance tuning
				//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
				//$<reason> Open a new IE window.
				/*
			   ShellExecuteA ( Handle( This ), "open", "ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/AFPL/gs853/gs853w32.exe" , ls_Null, ls_Null, 4) 
				*/
			//Start Code Change ----07.30.2008 #V85 maha - changed download site
			
			 ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', "http://downloads.sourceforge.net/ghostscript/gs854w32.exe?modtime=1148943324&big_mirror=1" , ls_Null, 4) 
			// ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', "ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/AFPL/gs853/gs853w32.exe" , ls_Null, 4) 
			//End Code Change---07.30.2008
				//---------------------------- APPEON END ----------------------------   
		   end if 
			return -1
		end if
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<modify> 03.24.2006 By: Liang QingShi
		//$<reason> Performance tuning
		//$<reason> Reduce the frequency of client-server interactions to improve runtime performance.
		//$<reason> Open a new IE window.
		/*
		ShellExecuteA ( Handle( This ), "open", gs_dir_path + gs_DefDirName + "\ghostscript\gs853w32.exe" , ls_Null, ls_Null, 4) 
		*/
		
		//ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', gs_dir_path + gs_DefDirName + "\ghostscript\gs854w32.exe" , ls_Null, 4) //Start Code Change ----09.09.2008 #V85 maha - changed to reflect 854 download 		
		
		If ls_ARCHITECTURE = '64-bit'  And  fileexists(gs_dir_path + gs_DefDirName + "\ghostscript\gs910w64.exe") Then
			ShellExecuteA ( Handle( This ), "open", gs_dir_path + gs_DefDirName + "\ghostscript\gs910w64.exe" , ls_Null, ls_Null, 4) 
			Return -1
		End If
		//Added by Scofield on 2009-02-16
		if fileexists(gs_dir_path + gs_DefDirName + "\ghostscript\gs853w32.exe") then
			ShellExecuteA ( Handle( This ), "open", gs_dir_path + gs_DefDirName + "\ghostscript\gs853w32.exe" , ls_Null, ls_Null, 4) 
		elseif fileexists(gs_dir_path + gs_DefDirName + "\ghostscript\gs854w32.exe") then
			ShellExecuteA ( Handle( This ), "open", gs_dir_path + gs_DefDirName + "\ghostscript\gs854w32.exe" , ls_Null, ls_Null, 4) 
		end if
		//End Add by Scofield on 2009-02-16
		//---------------------------- APPEON END ----------------------------
	end if 
	return -1
	
end if
//End Code Change---09.09.2008

/////////////////////////////////////////////////////////////////////////////////////
// do not set the path if it already exists
/////////////////////////////////////////////////////////////////////////////////////

if pos(bin_path, '\bin') > 0 then 
	ls_path = mid(bin_path,1, pos(bin_path, '\bin') + 3)

end if 


if Pos ( ls_path, bin_path ) > 0 then return 0

IF lul_chars > 0 THEN 
 	ls_path += ( ";" +bin_path )
    IF NOT SetEnvironmentVariableA( ls_var, ls_path ) THEN 
    END IF 
END IF


return 0


end function

public function integer of_registryget (string as_subkey, string as_keyname, ref string as_value);//added by gavins 20140218
Long hk_machine = 2147483650
string result 
result = space( 1024 )
long resultsize , handle
resultsize = 1024
long lptype 
lptype = 0
string     subkey
subkey = as_subkey// "SOFTWARE\AFPL Ghostscript\8.53"
string		keyname
keyname =  as_keyname//"GS_DLL"

RegOpenKeyEx( hk_machine, subkey, 0,257, ref  handle )

RegQueryValueEx( handle, keyname , 0, ref lptype,ref result , ref resultsize )

as_value = result

RegCloseKey( handle )






Return 0
end function

on n_cst_pdf.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pdf.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;

n_cst_filesrvwin32 inv_filesrv
inv_filesrv = create n_cst_filesrvwin32

//Start Code Change ---- 04.26.2006 #417 maha
IF NOT inv_filesrv.of_DirectoryExists (gs_dir_path + gs_DefDirName + '\Mail') THEN
       inv_filesrv.of_CreateDirectory (gs_dir_path + gs_DefDirName + '\Mail')
END IF
//End Code Change---04.26.2006
end event

