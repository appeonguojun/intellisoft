$PBExportHeader$n_cst_systeminfo.sru
forward
global type n_cst_systeminfo from nonvisualobject
end type
end forward

global type n_cst_systeminfo from nonvisualobject
end type
global n_cst_systeminfo n_cst_systeminfo

type prototypes
Function boolean IsAdmin () library "appeondll.dll"
FUNCTION uLong GetEnvironmentVariableA(String lpName, REF String lpBuffer, uLong nSize) library "Kernel32.dll" Alias for "GetEnvironmentVariable;Ansi"
end prototypes

type variables
oleobject ole_systeminfo 
int ii_ret
end variables

forward prototypes
public function string of_get_username ()
public function string of_get_computername ()
public function string of_get_domainname ()
public function boolean of_isadmin ()
public function integer of_get_uac ()
public function integer of_set_uac (integer ai_value)
public function string of_get_os_version ()
public subroutine of_auto_fix_settings ()
public function string of_get_envvar (string as_varname)
public function boolean of_check_isdomain ()
public function string of_get_domaindnsname ()
end prototypes

public function string of_get_username ();String ls_ret
If ii_ret = -1 Then Return ''
Try
	ls_ret = String(ole_systeminfo.username())
Catch(OLERuntimeError err)
	ls_ret = ''
End Try

Return ls_ret
end function

public function string of_get_computername ();String ls_ret
If ii_ret = -1 Then Return ''
Try
	ls_ret = String(ole_systeminfo.ComputerName())
Catch(OLERuntimeError err)
	ls_ret = ''
End Try

Return ls_ret


end function

public function string of_get_domainname ();String ls_ret
If ii_ret = -1 Then Return ''
Try
	ls_ret = String(ole_systeminfo.DomainName())
Catch(OLERuntimeError err)
	ls_ret = ''
End Try

Return ls_ret
end function

public function boolean of_isadmin ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_systeminfoof_isadmin()
// $<arguments>(None)
// $<returns> boolean
// $<description>
// $<description> Check the current user whether is administraors role.
//////////////////////////////////////////////////////////////////////
// $<add> 2011-01-28 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Return isadmin()
end function

public function integer of_get_uac ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_systeminfoof_get_uac()
// $<arguments>(None)
// $<returns> integer.  1: On, 0: off, -1: error
// $<description>
// $<description> Get Vista UAC value
//////////////////////////////////////////////////////////////////////
// $<add> 2011-01-28 by Ken.Guo
//////////////////////////////////////////////////////////////////////

ulong ll_UAC = -1

If Left(This.of_get_os_version( ), 3) <> '6.0' Then Return 0

RegistryGet( &
 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", &
"EnableLUA", ReguLong!, ll_UAC)

Return ll_UAC
end function

public function integer of_set_uac (integer ai_value);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_systeminfo of_set_uac()
// $<arguments>
//		value	integer	ai_value		
// $<returns> integer
// $<description>
// $<description> Trun On/Off UAC by regedit.
//////////////////////////////////////////////////////////////////////
// $<add> 2011-01-28 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Integer li_ret
String ls_UAC

li_ret = RegistrySet( &
 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System", &
 "EnableLUA", RegULong!, ai_value)

Choose Case ai_value
	Case 1
		ls_UAC = 'ON'
	Case 0
		ls_UAC = 'OFF'
End Choose
 
If li_ret = 1 Then
	Messagebox('UAC Settings','Turn '+ls_UAC+' User Account Control (UAC) successfully. ~r~nYou must restart your computer to apply the change.')
Else
	Messagebox('UAC Settings','Failed to turn '+ls_UAC+' User Account Control (UAC) , Please turn it '+ls_UAC+' manually in Windows User Accounts.',Exclamation! )
End If

Return li_ret

end function

public function string of_get_os_version ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_systeminfoof_get_os_version()
// $<arguments>(None)
// $<returns> string
// $<description>
// $<description> Get windows version
//////////////////////////////////////////////////////////////////////
// $<add> 2011-01-28 by Ken.Guo
//////////////////////////////////////////////////////////////////////

string ls_version
environment env
integer rtn

rtn = GetEnvironment(env)
IF rtn <> 1 THEN RETURN ''

ls_version = String(env.osmajorrevision) + '.' + String(env.osminorrevision)

Return ls_version
end function

public subroutine of_auto_fix_settings ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_systeminfo.of_auto_fix_settings()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description> Auto fix the settings.
//////////////////////////////////////////////////////////////////////
// $<add> 2011-01-28 by Ken.Guo
//////////////////////////////////////////////////////////////////////
If Not of_isadmin() Then
	Messagebox('Checking','The system detects that the current Windows logon user is a non-Administrator role, please log off the Windows and then re-login as Administrator.',Exclamation!)
	Return
End If

If of_get_uac() = 1 and Lower(This.of_get_username()) <> 'administrator' Then
	If Messagebox('Checking','The system detects that the Windows User Account Control (UAC) is turned on, but it must be turned off. ~r~n~r~nDo you want to turn it off now?', Question!, YesNo!) = 1 Then
		of_set_uac(0)
	End If
	Return
End If

Messagebox('Checking','The system will auto register the OCXs by command mode to fix the OCX error, please exit Contract Logix and run it again after the OCXs have been registered successfully.')
of_reg_dllocx_cmd()


end subroutine

public function string of_get_envvar (string as_varname);//////////////////////////////////////////////////////////////////////
// Function: of_get_envvar()
// Arguments:
// 	value    string    as_varname
//--------------------------------------------------------------------
// Return:  string
//--------------------------------------------------------------------
// Author:	 Ken.Guo 2011-06-24.
//--------------------------------------------------------------------
// Description: Get Environment Variable value
//--------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////
ulong lul_rtn
string ls_value

ls_value = Space ( 255 ) 

lul_rtn = GetEnvironmentVariableA ( as_varname, ls_value, 255 )
IF lul_rtn = 0 THEN
	ls_value = ''
END IF

Return ls_value
end function

public function boolean of_check_isdomain ();//====================================================================
// Function: of_check_isdomain
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-06-17 .20
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


//String ls_domainname, ls_computer_name
//ls_domainname = this.of_get_domainname()
//ls_computer_name = this.of_get_computername()
//
////ls_domainname = ls_computer_name means it do not login domain server.
//If ls_domainname <> ls_computer_name Then
//	Return True
//Else
//	Return False
//End If

If This.of_get_domaindnsname( ) = '' Then
	Return False
Else
	Return True
End If
end function

public function string of_get_domaindnsname ();//====================================================================
// Function: of_get_domaindnsname
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-06-22
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_ret
oleobject ole_ad
ole_ad = Create oleobject
If ole_ad.ConnectToNewObject("ADSystemInfo") <> 0 Then
	gnv_debug.of_output(True, 'Failed to connect to  ADSystemInfo.')
	Return ''
End If

Try
	ls_ret = String(ole_ad.DomainDNSName)
	If isnull(ls_ret) Then ls_ret = '' //workarond web bug.
	If ls_ret = 'null' then ls_ret = '' 
Catch (runtimeerror er)
	gnv_debug.of_output(True, 'Failed to get  DomainDNSName from ADSystemInfo.'+  er.text)
	Return ''
End try

Return ls_ret

end function

on n_cst_systeminfo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_systeminfo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////
// $<event>n_cst_systeminfo.constructor()
// $<arguments>(None)
// $<returns> long
// $<description>Use windows object to get system information
// $<description>e.g. user name,domain name,computer name
//////////////////////////////////////////////////////////////////////
// $<Author> 11/08/2007 by Ken.Guo
//////////////////////////////////////////////////////////////////////

ole_systeminfo = Create oleobject
If ole_systeminfo.ConnectToNewObject("WinNTSystemInfo") <> 0 Then
	ii_ret = -1
End If
end event

event destructor;If Isvalid(ole_systeminfo) Then 
	ole_systeminfo.DisconnectObject()
	Destroy ole_systeminfo
End If
end event

