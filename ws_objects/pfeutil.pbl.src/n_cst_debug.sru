﻿$PBExportHeader$n_cst_debug.sru
$PBExportComments$Extension Debug service
forward
global type n_cst_debug from pfc_n_cst_debug
end type
end forward

global type n_cst_debug from pfc_n_cst_debug
end type
global n_cst_debug n_cst_debug

forward prototypes
public function integer of_output (boolean ab_force, string as_value)
public function integer of_output (string as_value)
public function integer of_output (boolean ab_force, string as_value, boolean as_db)
public function integer of_output (string as_logfilename, boolean ab_force, string as_value, boolean as_db)
public function integer of_output (string as_logfilename, boolean ab_force, string as_value, boolean as_db, boolean abln_form)
public function integer of_output_debug_log ()
end prototypes

public function integer of_output (boolean ab_force, string as_value);//////////////////////////////////////////////////////////////////////
// $<function>n_cst_output::of_output()
// $<arguments>
//		value boolean ab_force
//		value	string	as_value		
// $<returns> Integer
// $<description> Only for debugging or testing.
// $<description> It will print log to file.
//////////////////////////////////////////////////////////////////////
// $<add> 12.19.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////

Return of_output( ab_force, as_value, true )//modified by gavins 20121010

//integer li_FileNo, li_Writes, li_Cnt
//String ls_FileName, ls_SQL, ls_Version
//
//ls_FileName = gs_dir_path + gs_DefDirName + '\Debug.Log'
//
////Both Debug Mode and ab_force = true can write log
//If Not ab_force and gnv_data.of_getitem('icred_settings', 'set_10', False) <> '1' Then //Debug Mode
//	Return 0
//End If
///*************************************///added by gavins 20120914
//ls_SQL = " if not exists( select 1 from sysobjects where type = 'U' and name = 'sys_debug_log' )" + "~r~n" 
//ls_SQL += " create table sys_debug_log( id int identity(1,1) , value text, debug_date datetime default getdate(), user_id  varchar(20), version varchar(100), user_ip varchar(20) ) "
//execute immediate :ls_SQL;
///*************************************/
//il_no++
//as_value = String(il_no,'000')+ '. ' +String(Today(),'yyyy-mm-dd hh:mm:ss fff') + ' : '+ as_value 
//
///*************************************///added by gavins 20120914
//gnv_appeondb.of_startqueue()
//delete from  sys_debug_log  where datediff(day , debug_date , getdate( ) ) > 30  and ( select count(*) from sys_debug_log ) > 10000;
//Insert into sys_debug_log( value, user_id, version, user_ip ) values( :as_value, :gs_user_id, :gs_user_version, :gs_client_ip );
//gnv_appeondb.of_commitqueue( )
///*************************************/
////bak old file if the file size large than 1MB. //Added By Ken.Guo 2011-04-21.
//If FileLength(ls_FileName) > 1024000 Then
//	If FileCopy(ls_FileName, gs_dir_path + gs_DefDirName + '\Debug' + String(today(),'yyyymmddhhmmss') + '.log',True) = 1 Then
//		FileDelete(ls_FileName)
//	End If
//End If
//
//li_FileNo = FileOpen(ls_FileName, LineMode!, Write!, LockWrite!, Append!)
//If li_FileNo < 0 Then 
//	Messagebox('Debug','Failed to open the debug log file.')
//	Return -1
//End If
//
//If FileWrite(li_FileNo, as_value) = -1 Then
//	Messagebox('Debug','Failed to write to the debug log file ' + ls_FileName + '.')
//End if
//FileClose(li_FileNo)
//
//Return 1
end function

public function integer of_output (string as_value);Return of_output(True, as_value)
end function

public function integer of_output (boolean ab_force, string as_value, boolean as_db);
Return of_output('',ab_force, as_value, as_db)

////////////////////////////////////////////////////////////////////////
//// $<function>n_cst_output::of_output()
//// $<arguments>
////		value boolean ab_force
////		value	string	as_value		
//// $<returns> Integer
//// $<description> Only for debugging or testing.
//// $<description> It will print log to file.
////////////////////////////////////////////////////////////////////////
//// $<add> 12.19.2008 by Ken.Guo
////////////////////////////////////////////////////////////////////////
//
//integer li_FileNo, li_Writes, li_Cnt
//String ls_FileName, ls_SQL, ls_Version
//
//ls_FileName = gs_dir_path + gs_DefDirName + '\Debug.Log'
//
////Both Debug Mode and ab_force = true can write log
//If Not ab_force and gnv_data.of_getitem('icred_settings', 'set_10', False) <> '1' Then //Debug Mode
//	Return 0
//End If
//
///*************************************///added by gavins 20120914
//If as_db Then
//	ls_SQL = " if not exists( select 1 from sysobjects where type = 'U' and name = 'sys_debug_log' )" + "~r~n" 
//	ls_SQL += " create table sys_debug_log( id int identity(1,1) , value text, debug_date datetime default getdate(), user_id  varchar(20), version varchar(100), user_ip varchar(20) ) "
//	execute immediate :ls_SQL;
//End If
///*************************************/
//il_no++
//as_value = String(il_no,'000')+ '. ' +String(Today(),'yyyy-mm-dd hh:mm:ss fff') + ' : '+ as_value 
//
///*************************************///added by gavins 20120914
//If as_db Then
//	gnv_appeondb.of_startqueue()
//	delete from  sys_debug_log  where datediff(day , debug_date , getdate( ) ) > 30  and ( select count(*) from sys_debug_log ) > 10000;
//	Insert into sys_debug_log( value, user_id, version, user_ip ) values( :as_value, :gs_user_id, :gs_user_version, :gs_client_ip );
//	gnv_appeondb.of_commitqueue( )
//End If
///*************************************/
////bak old file if the file size large than 1MB. //Added By Ken.Guo 2011-04-21.
//If FileLength(ls_FileName) > 1024000 Then
//	If FileCopy(ls_FileName, gs_dir_path + gs_DefDirName + '\Debug' + String(today(),'yyyymmddhhmmss') + '.log',True) = 1 Then
//		FileDelete(ls_FileName)
//	End If
//End If
//
//li_FileNo = FileOpen(ls_FileName, LineMode!, Write!, LockWrite!, Append!)
//If li_FileNo < 0 Then 
//	Messagebox('Debug','Failed to open the debug log file.')
//	Return -1
//End If
//
//If FileWrite(li_FileNo, as_value) = -1 Then
//	Messagebox('Debug','Failed to write to the debug log file ' + ls_FileName + '.')
//End if
//FileClose(li_FileNo)
//
//Return 1
end function

public function integer of_output (string as_logfilename, boolean ab_force, string as_value, boolean as_db);Return of_output(as_logfilename,ab_force, as_value, as_db,false)

////////////////////////////////////////////////////////////////////////
//// $<function>n_cst_output::of_output()
//// $<arguments>
////		value string as_logfilename
////		value boolean ab_force
////		value	string	as_value	
////		value boolean as_db
//// $<returns> Integer
//// $<description> Only for debugging or testing.
//// $<description> It will print log to file.
////////////////////////////////////////////////////////////////////////
////Added By Ken.Guo 08/15/2013
////////////////////////////////////////////////////////////////////////
//
//integer li_FileNo, li_Writes, li_Cnt
//String ls_FileName, ls_SQL, ls_Version, ls_file
//
////Added By Ken.Guo 08/15/2013
//If as_logfilename = '' Then
//	ls_FileName = gs_dir_path + gs_DefDirName + '\Debug.Log'
//	ls_file = 'debug'
//Else
//	ls_FileName = gs_dir_path + gs_DefDirName + '\' + as_logfilename + '.log'
//	ls_file = as_logfilename
//End If
//
////Both Debug Mode and ab_force = true can write log
//If Not ab_force and gnv_data.of_getitem('icred_settings', 'set_10', False) <> '1' Then //Debug Mode
//	Return 0
//End If
//
///*************************************///added by gavins 20120914
//If as_db Then
//	ls_SQL = " if not exists( select 1 from sysobjects where type = 'U' and name = 'sys_debug_log' )" + "~r~n" 
//	ls_SQL += " create table sys_debug_log( id int identity(1,1) , value text, debug_date datetime default getdate(), user_id  varchar(20), version varchar(100), user_ip varchar(20) ) "
//	execute immediate :ls_SQL;
//End If
///*************************************/
//il_no++
//as_value = String(il_no,'000')+ '. ' +String(Today(),'yyyy-mm-dd hh:mm:ss fff') + ' : '+ as_value 
//
///*************************************///added by gavins 20120914
//If as_db Then
//	gnv_appeondb.of_startqueue()
//	delete from  sys_debug_log  where datediff(day , debug_date , getdate( ) ) > 30  and ( select count(*) from sys_debug_log ) > 10000;
//	Insert into sys_debug_log( value, user_id, version, user_ip ) values( :as_value, :gs_user_id, :gs_user_version, :gs_client_ip );
//	gnv_appeondb.of_commitqueue( )
//End If
///*************************************/
////bak old file if the file size large than 1MB. //Added By Ken.Guo 2011-04-21.
//If FileLength(ls_FileName) > 1024000 Then
//	If FileCopy(ls_FileName, gs_dir_path + gs_DefDirName + '\' + ls_file + String(today(),'yyyymmddhhmmss') + '.log',True) = 1 Then
//		FileDelete(ls_FileName)
//	End If
//End If
//
//li_FileNo = FileOpen(ls_FileName, LineMode!, Write!, LockWrite!, Append!)
//If li_FileNo < 0 Then 
//	Messagebox('Debug','Failed to open the '+ls_file+' log file.')
//	Return -1
//End If
//
//If FileWrite(li_FileNo, as_value) = -1 Then
//	Messagebox('Debug','Failed to write to the '+ls_file+' log file ' + ls_FileName + '.')
//End if
//FileClose(li_FileNo)
//
//Return 1
end function

public function integer of_output (string as_logfilename, boolean ab_force, string as_value, boolean as_db, boolean abln_form);//====================================================================
// Function: of_output
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    string     as_logfilename
// 	value    boolean    ab_force
// 	value    string     as_value
// 	value    boolean    as_db
// 	value    boolean    abln_form
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 04/03/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
integer li_FileNo, li_Writes, li_Cnt
String ls_FileName, ls_SQL, ls_Version, ls_file
String ls_var,ls_path
ulong lul_chars 

If as_logfilename = '' Then
	If gs_dir_path = '' or gs_DefDirName = '' Then //Added By Ken.Guo 2016-06-22
		ls_var = "APPDATA"
		ls_path = Space( 1024 )
		lul_chars = GetEnvironmentVariableA( ls_var, ls_path, 1024 )
		ls_FileName = ls_path + '\Contractlogix\Debug.Log'
		CreateDirectory ( ls_path + '\Contractlogix\' ) //Added By Ken.Guo 2016-09-22
	Else
		ls_FileName = gs_dir_path + gs_DefDirName + '\Debug.Log'
	End If
	ls_file = 'debug'
Else
	ls_FileName = gs_dir_path + gs_DefDirName + '\' + as_logfilename + '.log'
	ls_file = as_logfilename
End If


//Both Debug Mode and ab_force = true can write log
If Not ab_force and gnv_data.of_getitem('icred_settings', 'set_10', False) <> '1' Then //Debug Mode
	Return 0
End If

If as_db Then
	ls_SQL = " if not exists( select 1 from sysobjects where type = 'U' and name = 'sys_debug_log' )" + "~r~n" 
	ls_SQL += " create table sys_debug_log( id int identity(1,1) , value text, debug_date datetime default getdate(), user_id  varchar(20), version varchar(100), user_ip varchar(20) ) "
	execute immediate :ls_SQL;
End If

if abln_form =false then
	il_no++
	as_value = String(il_no,'000')+ '. ' +String(Today(),'yyyy-mm-dd hh:mm:ss fff') + ' : '+ as_value 
end if 

If as_db Then
	gnv_appeondb.of_startqueue()
	delete from  sys_debug_log  where datediff(day , debug_date , getdate( ) ) > 30  and ( select count(*) from sys_debug_log ) > 10000;
	Insert into sys_debug_log( value, user_id, version, user_ip ) values( :as_value, :gs_user_id, :gs_user_version, :gs_client_ip );
	gnv_appeondb.of_commitqueue( )
End If

//bak old file if the file size large than 1MB. 
If FileLength(ls_FileName) > 1024000 Then
	If FileCopy(ls_FileName, gs_dir_path + gs_DefDirName + '\' + ls_file + String(today(),'yyyymmddhhmmss') + '.log',True) = 1 Then
		FileDelete(ls_FileName)
	End If
End If

li_FileNo = FileOpen(ls_FileName, LineMode!, Write!, LockWrite!, Append!)
If li_FileNo < 0 Then 
	Messagebox('Debug','Failed to open the '+ls_file+' log file.')
	Return -1
End If

If FileWrite(li_FileNo, as_value) = -1 Then
	Messagebox('Debug','Failed to write to the '+ls_file+' log file ' + ls_FileName + '.')
End if
FileClose(li_FileNo)

Return 1
end function

public function integer of_output_debug_log ();integer 			li_return 
long				i, ll_count
string 			ls_value


ll_count = ids_debuglog.rowcount( )
if ll_count > 0 then 
	for i  = 1 to ll_count
		ls_value = string(ids_debuglog.GetItemdatetime( i, "when"))
		ls_value = ls_value + "   "+ string(ids_debuglog.GetItemString( i, "msg"))
		 of_output('',false, ls_value, false,true)
	next 
else
	return 0
end if 

return 1
end function

on n_cst_debug.create
call super::create
end on

on n_cst_debug.destroy
call super::destroy
end on

