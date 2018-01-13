$PBExportHeader$n_cst_update.sru
$PBExportComments$db_update tool
forward
global type n_cst_update from nonvisualobject
end type
end forward

global type n_cst_update from nonvisualobject
end type
global n_cst_update n_cst_update

type variables
String is_sql_statements[]



end variables

forward prototypes
public subroutine of_execute_sqls (string as_title)
public function integer of_execute (string as_sql, string as_title)
public function string of_get_development ()
public function integer of_common_updates ()
public function integer of_ver60_updates ()
public function integer of_ver70_updates ()
public function integer of_ver80_updates ()
public function string of_get_from_version ()
public function integer of_ver85_updates ()
public function integer of_ver90_updates ()
public function integer of_ver95_updates ()
public function integer of_ver100_updates ()
public function integer of_ver105_updates ()
public function integer of_ver110_updates ()
public function integer of_ver115_updates ()
public function integer of_ver120_updates ()
public function integer of_ver130_updates ()
public function integer of_ver140_updates ()
public function integer of_ver150_updates ()
public function integer of_get_app_set ()
public subroutine of_disable_fulltext ()
public subroutine of_enable_fulltext ()
end prototypes

public subroutine of_execute_sqls (string as_title);//-----------------------------------------------------------------------------
// [PUBLIC]    : of_execute_sqls
// Arguments 	: string as_title
// Returns   	: [none]   
// Created By	: Alfee 01.30.2008
//------------------------------------------------------------------------------
Long ll_i
String ls_null[]

// IF IsValid(gnv_logservice)THEN gnv_logservice.of_log("work_flow", '****',as_title)
IF UPPERBOUND(is_sql_statements) > 0 THEN 
		if Not isvalid( w_infodisp ) then open(w_infodisp)
		if isvalid(w_infodisp) then w_infodisp.title = "Update DB - " + as_title + "()"
		if isvalid(w_infodisp) then w_infodisp.Center = TRUE
		if isvalid(w_infodisp) then w_infodisp.st_complete.visible = false
		if isvalid(w_infodisp) then w_infodisp.st_3.visible = false
		if isvalid(w_infodisp) then w_infodisp.st_information.visible = false
		if isvalid(w_infodisp) then w_infodisp.st_1.text = as_title
		if isvalid(w_infodisp) then w_infodisp.wf_set_min_max(1,upperbound(is_sql_statements))
			
		FOR ll_i = 1 TO upperbound(is_sql_statements)
			If isvalid(w_infodisp) Then w_infodisp.st_1.text = 'Modification ' +string(ll_i) +' of '+ string(upperbound(is_sql_statements)) +', Please stand by!'
			of_execute(is_sql_statements[ll_i],as_title)
			if isvalid(w_infodisp) then w_infodisp.wf_step_pbar(1)
		NEXT	
     // if isvalid(w_infodisp) then close(w_infodisp)	    
END IF

is_sql_statements = ls_null

RETURN
end subroutine

public function integer of_execute (string as_sql, string as_title);Yield()

EXECUTE Immediate :as_sql Using Sqlca;
IF Sqlca.SQLCode <> 0 THEN
	
	IF IsValid(gnv_logservice)THEN gnv_logservice.of_log(as_sql, Sqlca.SQLErrText,as_title)
	IF IsValid(gnv_debug) THEN gnv_debug.of_output(true,"Sql: " + as_sql + " Sql error text: " +  Sqlca.SQLErrText) //Added By Jay Chen 05-28-2014
	gb_upgrade_failed = TRUE
	RETURN -1
END IF
//IF Sqlca.AutoCommit = False THEN
	COMMIT Using Sqlca;
//END IF


RETURN 1

end function

public function string of_get_development ();//read inifile get development type
//development '0':No,'1':Yes
String ls_original_dev_setting
ls_original_dev_setting = ProfileString(gs_IniFilePathName, "setup", "development", "1")
RETURN ls_original_dev_setting

end function

public function integer of_common_updates ();RETURN 1

end function

public function integer of_ver60_updates ();RETURN 1
end function

public function integer of_ver70_updates ();RETURN 1
end function

public function integer of_ver80_updates ();RETURN 1
end function

public function string of_get_from_version ();//Get the version no upgraded from - Alfee 02.14.2008
Integer li_ver

select set_18 into :li_ver from icred_settings; 
If IsNull(li_ver) Then li_ver = 0
If gs_dbType = 'SQL' and li_ver < 55 then li_ver = 55

Return String(li_ver)

end function

public function integer of_ver85_updates ();//Alfee 07.11.2008

RETURN 1
end function

public function integer of_ver90_updates ();Return 1 //Added by Ken.Guo on 2009-01-05
end function

public function integer of_ver95_updates ();Return 1 //Added by Scofield on 2009-08-12
end function

public function integer of_ver100_updates ();Return 1
end function

public function integer of_ver105_updates ();Return 1
end function

public function integer of_ver110_updates ();Return 1
end function

public function integer of_ver115_updates ();//====================================================================
// Function: of_ver115_updates
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 07/10/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

return 1 
end function

public function integer of_ver120_updates ();//====================================================================
// Function: of_ver120_updates
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 10/19/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

return 1 
end function

public function integer of_ver130_updates ();//====================================================================
// Function: of_ver130_updates
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 08/14/2013
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

return 1 
end function

public function integer of_ver140_updates ();//====================================================================
// Function: of_ver140_updates
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 03/03/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

return 1 
end function

public function integer of_ver150_updates ();//====================================================================
// Function: of_ver150_updates
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/15/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
return 1 
end function

public function integer of_get_app_set ();Long ll_set_9,ll_set_48
long ll_set_cont	//Add By Jervis 09.28.2008

SELECT icred_settings.set_9,
		 icred_settings.set_48,
		 icred_settings.set_cont
	INTO :ll_set_9,
		  :ll_set_48,
		  :ll_set_cont
	From icred_settings  ;

//IF ll_set_9 = 4 THEN //contract module
if ll_set_cont = 1 then
	IF ll_set_48 = 1 THEN//global search turn on
		RETURN 1
	ELSE
		RETURN 0
	END IF
ELSE
	RETURN 0
END IF









end function

public subroutine of_disable_fulltext ();is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"IF EXISTS (SELECT name FROM   sysobjects WHERE  name = 'up_disable_fulltext'  AND  type = 'P') " + &
" drop PROCEDURE up_disable_fulltext "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
" create PROCEDURE up_disable_fulltext "+&
" AS "+&
" BEGIN "+&
"	 exec sp_fulltext_database 'disable' "+&
" END "

of_execute_sqls("up_disable_fulltext")
  
  
 DECLARE up_fulltext_disable PROCEDURE FOR up_disable_fulltext ;
	execute up_fulltext_disable;
if sqlca.sqlcode < 0 then 
	IF IsValid(gnv_logservice)THEN gnv_logservice.of_log("execute up_disable_fulltext", Sqlca.SQLErrText,"of_disable_fulltext")
	IF IsValid(gnv_debug) THEN gnv_debug.of_output(true,"execute up_disable_fulltext: " + " Sql error text: " +  Sqlca.SQLErrText)
	gb_upgrade_failed = TRUE
end if
close up_fulltext_disable;
commit;

end subroutine

public subroutine of_enable_fulltext ();is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"IF EXISTS (SELECT name FROM   sysobjects WHERE  name = 'up_enable_fulltext'  AND  type = 'P') " + &
" drop PROCEDURE up_enable_fulltext "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
" create PROCEDURE up_enable_fulltext "+&
" AS "+&
" BEGIN "+&
"	 exec sp_fulltext_database 'enable' "+&
" END "

of_execute_sqls("of_enable_fulltext")
  
  
 DECLARE up_fulltext_enable PROCEDURE FOR up_enable_fulltext ;
	execute up_fulltext_enable;
if sqlca.sqlcode < 0 then 
	IF IsValid(gnv_logservice)THEN gnv_logservice.of_log("execute up_enable_fulltext", Sqlca.SQLErrText,"of_enable_fulltext")
	IF IsValid(gnv_debug) THEN gnv_debug.of_output(true,"execute up_enable_fulltext: " + " Sql error text: " +  Sqlca.SQLErrText)
	gb_upgrade_failed = TRUE
end if
close up_fulltext_enable;
commit;

end subroutine

on n_cst_update.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_update.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//by Alfee 01.30.2008

end event

event destructor;if isvalid(w_infodisp) then close(w_infodisp)	 

end event

