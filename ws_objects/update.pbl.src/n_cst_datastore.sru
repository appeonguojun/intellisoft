﻿$PBExportHeader$n_cst_datastore.sru
forward
global type n_cst_datastore from datastore
end type
end forward

global type n_cst_datastore from datastore
end type
global n_cst_datastore n_cst_datastore

event dberror;IF Len(Trim(SQLErrText)) <> 0 THEN
	IF IsValid(gnv_logservice)THEN gnv_logservice.of_log(sqlsyntax, SQLErrText,'DB Error')
	IF IsValid(gnv_debug) THEN gnv_debug.of_output(true,"Sql: " + sqlsyntax + " Sql error text: " +  SQLErrText) //Added By Jay Chen 05-28-2014
	gb_upgrade_failed = True
	RETURN 1
END IF

end event

on n_cst_datastore.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_datastore.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//==============================APPEON BEGIN==========================
// EVENt: constructor.n_cst_datastore()
//--------------------------------------------------------------------
// Description: catch db error
//--------------------------------------------------------------------
// Arguments:  
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:	Nova		Date: Apr 09,2008
//--------------------------------------------------------------------
//	All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//	-------------------------------------------------------------------
//==============================APPEON END============================

end event
