$PBExportHeader$n_cst_platform.sru
$PBExportComments$Extension Cross Platform service
forward
global type n_cst_platform from pfc_n_cst_platform
end type
end forward

global type n_cst_platform from pfc_n_cst_platform
end type
global n_cst_platform n_cst_platform

type prototypes

Function boolean getMemoryPhysInfo(ref ulong Total,ref ulong Avail) Library "appeondll.dll" //Added By Ken 09/19/2011. 
end prototypes

forward prototypes
public subroutine of_getfreememory (ref unsignedlong al_totalmem, ref unsignedlong al_avamem)
end prototypes

public subroutine of_getfreememory (ref unsignedlong al_totalmem, ref unsignedlong al_avamem);//////////////////////////////////////////////////////////////////////
// $<function>pfc_n_cst_platformwin32.of_getfreememory()
// $<arguments>
//		value	ulong	al_totalmem	 Total Memery(MB)	 
//		value	ulong	al_avamem  	 Avaial Memory(MB)	
// $<returns> (none)  
// $<description> Get Memory with MB.
// $<description> Because Web not support LongLong type.
//////////////////////////////////////////////////////////////////////
//Added By Ken 09/19/2011. 
//////////////////////////////////////////////////////////////////////

ulong ll_Total,ll_Avail

GetMemoryPhysInfo(al_totalmem,al_avamem)

Return
end subroutine

on n_cst_platform.create
call super::create
end on

on n_cst_platform.destroy
call super::destroy
end on

