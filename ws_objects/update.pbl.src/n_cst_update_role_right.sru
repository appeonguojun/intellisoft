$PBExportHeader$n_cst_update_role_right.sru
$PBExportComments$Sql of Role Right
forward
global type n_cst_update_role_right from nonvisualobject
end type
end forward

global type n_cst_update_role_right from nonvisualobject
end type
global n_cst_update_role_right n_cst_update_role_right

type variables
string is_init
string is_sql_statments[]


end variables

forward prototypes
public subroutine of_update_version_70 ()
public subroutine of_update_version_60 ()
public subroutine of_update_version_80 ()
public subroutine of_update_right_bak (long al_module_id[], long al_sub_module_id[])
public subroutine of_update_document_right ()
public function integer of_execute_sqls (string as_title)
public subroutine of_update_version_85 ()
public subroutine of_update_right ()
public subroutine of_update_version_90 ()
public subroutine of_update_version_95 ()
public subroutine of_update_version_100 ()
public subroutine of_update_version_105 ()
public subroutine of_update_version_110 ()
public subroutine of_update_version_115 ()
public subroutine of_update_version_120 ()
public subroutine of_update_version_130 ()
public subroutine of_update_version_140 ()
public subroutine of_update_version_150 ()
public subroutine of_update_contract_status ()
public subroutine of_set_batch_update_ctx_default ()
end prototypes

public subroutine of_update_version_70 ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_role_right_sqlof_update_version_7()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2007.09.18 by Jack
//////////////////////////////////////////////////////////////////////
long ll_module_id[],ll_sub_module_id[]

//Update secuity Rights
//To Do List Painter
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 63)    " + &
"Insert Into security_modules Values(63, 0,'To Do List Painter', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 602)    " + &
"Insert Into security_sub_module Values(602, 63, 'Main', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5840)    " + &
"Insert Into security_rights_action Values(5840, 63, 602, 'View Rights', 2)"

//To Do List
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 64)    " + &
"Insert Into security_modules Values(64, 0,'To Do List', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 603)    " + &
"Insert Into security_sub_module Values(603, 64, 'Main', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5850)    " + &
"Insert Into security_rights_action Values(5850, 64, 603, 'View Rights', 2)"

//Four new records used for the role rights of Letter Storage Area Painter.
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 51)    " + &
"insert security_modules( module_id, software_version, module_name) values( 51, 4, 'Letter Storage Area Painter' ) " 
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 510)    " + &
"insert security_sub_module( sub_module_id, module_id, sub_module_name ) values( 510, 51, 'Main' )" 
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5010)    " + &
"insert security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5010, 51, 510, 'View Rights', 2 )" 

//Fix a defect that no rights data for Question Painter.
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 34)    " + & 
"insert security_modules( module_id, software_version, module_name) values( 34, 4, 'Question Painter' ) " 
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 420)    " + &
"insert security_sub_module( sub_module_id, module_id, sub_module_name ) values( 420, 34, 'Main' )" 
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 2210)    " + &
"insert security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 2210, 34, 420, 'Access Rights', 1 )" 

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 128)    " + &
"insert security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 128, 2, 5, 'Attest Quest Full Access', 1 )" 

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 65)    " + &
"insert into security_modules(module_id,software_version,module_name,prod_id) values (65,4,'WebView Required Documents Template Painter',1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 604)    " + &
"INSERT INTO security_sub_module ( sub_module_id, module_id,sub_module_name,prod_id ) VALUES ( 604, 65,'Main',1 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6927)    " + &
"INSERT INTO security_rights_action ( action_id, module_id,sub_module_id,action_name,dddw_type ) values(6927,65,604,'View Rights',1 )"

IF gs_dbtype = "SQL" THEN
	is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 2076)    " + &
	"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 2076, 33, 290, 'Global Search', 2 ) "
END IF

//is_sql_statments[upperbound(is_sql_statments) + 1] = "DELETE FROM security_roles_rights WHERE action_id IN (6800,6801,6802,6803)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 58)    " + &
"INSERT INTO security_modules ( module_id, software_version, module_name ,prod_id) values( 58, 4, 'Clause Library Painter',1 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 580)    " + &
"INSERT INTO security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id )  values ( 58, 580, 'Main' ,1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6800)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6800, 58, 580, 'View Rights', 2 )"

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 59)    " + & 
"INSERT INTO security_modules ( module_id, software_version, module_name ,prod_id) values( 59, 4, 'Template Library Painter',1 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id =581)    " + &
"INSERT INTO security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id )  values( 59,581,  'Main' ,1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6801)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6801, 59, 581, 'View Rights', 2 )"

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 60)    " + &
"INSERT INTO security_modules ( module_id, software_version,module_name ,prod_id) values ( 60, 4, 'Document Library Painter',1 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 582)    " + &
"INSERT INTO security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id ) values (  60, 582,'Main' ,1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6802)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6802, 60, 582, 'View Rights', 2 )"

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 583)    " + &
"INSERT INTO security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id ) values ( 9,583, 'Contract Management Rights' ,1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6803)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6803, 9, 583, 'View Rights', 2 )"

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 61)    " + &
"Insert Into security_modules ( module_id, software_version,module_name ,prod_id) Values (61, 0,'Work Flow Painter', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 600)    " + &
"Insert Into security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id ) Values (61,600, 'Main', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5830)    " + &
"Insert Into security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) Values(5830, 61, 600, 'View Rights', 2)"

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 62)    " + & 
"Insert Into security_modules ( module_id, software_version,module_name ,prod_id) Values (62, 0,'Email Painter', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 601)    " + &
"Insert Into security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id )  Values ( 62, 601,'Main', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5831)    " + &
"Insert Into security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) Values(5831, 62, 601, 'View Rights', 2)"
//is_sql_statments[UpperBound(is_sql_statments) + 1] = "DELETE FROM security_roles_rights WHERE action_id IN (5831)"

is_sql_statments[upperbound(is_sql_statments) + 1] = "UPDATE security_sub_module SET sub_module_name = 'Document Manager' WHERE sub_module_id = 370;"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6901)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6901, 33, 370, 'Add Buy', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6902)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6902, 33, 370, 'Add Sell', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6903)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6903, 33, 370, 'Properties', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6904)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6904, 33, 370, 'Report', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6905)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6905, 33, 370, 'Email', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id =6906)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6906, 33, 370, 'Output->Print', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6907)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6907, 33, 370, 'Output->Email', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id =6909)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6909, 33, 370, 'Output->Save to File', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id =6910)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6910, 33, 370, 'Check In', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6911)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6911, 33, 370, 'Check Out', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6912)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6912, 33, 370, 'Save', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6913)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6913, 33, 370, 'Add Clause', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id =6914)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6914, 33, 370, 'Merge Field', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6915)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6915, 33, 370, 'Merge Data', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6916)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6916, 33, 370, 'Work Flow', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6917)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6917, 33, 370, 'Clause Map', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6918)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6918, 33, 370, 'Add Action Item', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6919)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6919, 33, 370, 'Delete Action Item', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6920)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6920, 33, 370, 'Print Letters', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6921)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6921, 33, 370, 'Revision Control', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6922)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6922, 33, 370, 'Delete Document', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6925)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6925, 33, 370, 'Modify Other Users AI', 2 )"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6926)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6926, 33, 370, 'Add Other', 2 )"
//is_sql_statments[UpperBound(is_sql_statments) + 1] = "DELETE FROM security_roles_rights WHERE action_id IN (6901,6902,6903,6904,6905,6906,6907,6908,6909,6910,6911,6912,6913,6914,6915,6916,6917,6918,6919,6920,6921,6922,6925,6926)"

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 552)    " + &
"INSERT INTO security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id )  values( 25,552,  'User ID Batch Update' ,1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5511)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5511, 25, 552, 'View Rights', 2 )"
//is_sql_statments[UpperBound(is_sql_statments) + 1] = "DELETE FROM security_roles_rights WHERE action_id IN (5511)"

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 66)    " + &
"INSERT INTO security_modules ( module_id, software_version, module_name ,prod_id) values( 66, 4, 'Import Painter', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 605)    " + & 
"INSERT INTO security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id ) values ( 66, 605, 'Main', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6928)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6928, 66, 605, 'View Rights', 2)"
is_sql_statments[upperbound(is_sql_statments) + 1] = "UPDATE security_sub_module SET SUB_MODULE_NAME = 'Fee Schedules' where SUB_MODULE_ID = 360 ; "
//is_sql_statments[UpperBound(is_sql_statments) + 1] = "DELETE FROM security_roles_rights WHERE action_id IN (6928)"
of_execute_sqls('of_update_version_70')

//--------------------------- APPEON BEGIN ---------------------------
//$<Comment> 2007-12-20 By: Scofield
//$<Reason> the interface of of_update_right has been adjusted.

//ll_module_id[upperbound(ll_module_id) + 1] = 63	 //To Do List Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 64	 //To Do List
//ll_module_id[upperbound(ll_module_id) + 1] = 51	 //Letter Storage Area Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 34	 //Question Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 2	 //Practitioner Folder
//ll_module_id[upperbound(ll_module_id) + 1] = 65	 //WebView Required Document Template
//ll_module_id[upperbound(ll_module_id) + 1] = 58  //Clause Library Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 59  //Template Library Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 60  //Document Library Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 9  //Roles Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 61  //Work Flow Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 62  //Email Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 33  //Contract
//ll_module_id[upperbound(ll_module_id) + 1] = 25	 //System
//ll_module_id[upperbound(ll_module_id) + 1] = 66	 //Import Painter
//ll_module_id[upperbound(ll_module_id) + 1] = 33  //Contract
//
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 602	//Main 
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 603	//Main 
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 510	//Main 
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 402	//Main 
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 5	//Appointment Status 
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 604	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 580	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 581	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 582	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 583	//Contract Management Rights
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 600	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 601	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 370	//Document Manager
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 552	//User ID Batch Update
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 605	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 290	//Main
//---------------------------- APPEON END ----------------------------

of_update_right()

end subroutine

public subroutine of_update_version_60 ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_role_right_sqlof_update_version_7()
// $<arguments>(None)
// $<returns> (none)
// $<description>
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 2007.09.18 by Jack
//////////////////////////////////////////////////////////////////////
datastore lds_user,lds_currentview
string ls_new_syntax,ls_sql,ls_error,ls_userid
long ll_max_userviewid,ll_temp,ll_rows,ll_found,i
long ll_module_id[],ll_sub_module_id[]

//) 

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5820)    " + &
" insert security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5820, 1, 1, 'Print/Export Search Results', 1 ) " 

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 520)    " + & 
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 3, 520, 'Application Status') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5200)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5200, 3, 520, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 521)    " + &  
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 3, 521, 'Contracts') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5210)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5210, 3, 521, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 53)    " + & 
"insert into security_modules( module_id, software_version, module_name ) values( 53, 4, 'Screen Painter - Contract') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 530)    " + & 
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 53, 530, 'Main') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5300)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5300, 53, 530, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 531)    " + &  
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 53, 531, 'View Manager') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5310)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5310, 53, 531, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 532)    " + & 
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 53, 532, 'Field Properties') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5320)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5320, 53, 532, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 533)    " + &  
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 53, 533, 'Screen Parameters') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5330)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5330, 53, 533, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 54)    " + & 
"insert into security_modules( module_id, software_version, module_name ) values( 54, 4, 'View Painter - Contract') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 540)    " + & 
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 54, 540, 'Main') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5400)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5400, 54, 540, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 550)    " + & 
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 25, 550, 'Scan OIG') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5500)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5500, 25, 550, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 551)    " + &  
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 25, 551, 'Import OIG') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5510)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5510, 25, 551, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 56)    " + &
"insert into security_modules( module_id, software_version, module_name ) values( 56, 4, 'Contract Requirement Profile') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 560)    " + &  
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 56, 560, 'Main') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5600)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5600, 56, 560, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 57)    " + & 
"insert into security_modules( module_id, software_version, module_name ) values( 57, 4, 'Code Import (CPT Code)') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 570)    " + &  
"insert security_sub_module( module_id, sub_module_id, sub_module_name ) values( 57, 570, 'Main') "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5700)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5700, 57, 570, 'View Rights', 2 ) "

is_sql_statments[upperbound(is_sql_statments) + 1] = "Update security_modules Set prod_id = 1 Where module_id in(3,5,53,9,10,11,13,16,19,23,25,28,33,54,56,57,51) "
is_sql_statments[upperbound(is_sql_statments) + 1] = "Update security_sub_module Set prod_id = 1 Where sub_module_id in(521,15,530,531,532,533,28,29,30,32,35,540,37,60,80,150,170,290,300,310,320,330,340,350,360,370,380,390,400,430,560,570,510) "
is_sql_statments[upperbound(is_sql_statments) + 1] = "UPDATE security_sub_module SET SUB_MODULE_NAME = 'Fee Schedules' where SUB_MODULE_ID = 360 ; "
is_sql_statments[upperbound(is_sql_statments) + 1] = "Update security_modules Set module_name = 'Screen Painter - Prac Data' Where module_id = 6; "
is_sql_statments[upperbound(is_sql_statments) + 1] = "Update security_modules Set module_name = 'View Painter - Prac Data' Where module_id = 18; "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5800)    " + & 
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5800, 25, 150, 'Practitioner Data', 2 ) "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 5810)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 5810, 25, 150, 'Contract Data', 2 ) "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 2075)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 2075, 33, 290, 'Add Lookup Data', 2 ) " 
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id =2078)    " + &
"insert into security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 2078, 33, 290, 'Delete Contract', 2 ) "


lds_user = CREATE datastore
lds_user.DataObject = "d_dddw_users"
lds_user.SetTransObject( SQLCA )

lds_currentview = CREATE datastore
ls_sql = "select security_user_views.user_id, security_user_views.view_id from security_user_views"
ls_new_syntax = SQLCA.SyntaxFromSQL( ls_sql, "", ls_error )
lds_currentview.Create( ls_new_syntax, ls_error )
lds_currentview.SetTransObject(SQLCA)

lds_user.Retrieve()
lds_currentview.Retrieve()
select max( user_view_id ) into :ll_max_userviewid from security_user_views;
select top 1 rights_id into :ll_temp from ids;

ll_rows = lds_currentview.rowcount()
if ll_rows > 0 then
	ll_rows = lds_user.RowCount()
	if isnull( ll_max_userviewid ) then ll_max_userviewid = 0
	if isnull( ll_temp ) then ll_temp = 0
	if ll_temp > ll_max_userviewid then ll_max_userviewid = ll_temp;
	
	For i = 1 to ll_rows
		ls_userid = lds_user.GetItemString( i, "user_id" )
		ll_found = lds_currentview.Find( "user_id = '" + ls_userid + "' and view_id = 1001 ", 1, lds_currentview.rowcount() )
		if ll_found < 1 then
			ll_max_userviewid ++
			is_sql_statments[upperbound(is_sql_statments) + 1] = "insert security_user_views( user_view_id, user_id, view_id, access_rights) VALUES( " + string( ll_max_userviewid ) + ", '" + ls_userid + "', 1001, 1 ) "
		end if
	Next
	is_sql_statments[upperbound(is_sql_statments) + 1] = "UPDATE ids SET rights_id = " + string( ll_max_userviewid ) + ";"	//Rodger Wu modified.
end if
of_execute_sqls('of_update_version_60')
DESTROY lds_user;
DESTROY lds_currentview;

//--------------------------- APPEON BEGIN ---------------------------
//$<Comment> 2007-12-20 By: Scofield
//$<Reason> the interface of of_update_right has been adjusted.

//ll_module_id[upperbound(ll_module_id) + 1] = 1	 //Practitioner Search
//ll_module_id[upperbound(ll_module_id) + 1] = 3	 //Action Items
//ll_module_id[upperbound(ll_module_id) + 1] = 3	 //Action Items
//ll_module_id[upperbound(ll_module_id) + 1] = 53	 //Screen Painter - Contract
//ll_module_id[upperbound(ll_module_id) + 1] = 53	 //Screen Painter - Contract
//ll_module_id[upperbound(ll_module_id) + 1] = 53	 //Screen Painter - Contract
//ll_module_id[upperbound(ll_module_id) + 1] = 53	 //Screen Painter - Contract
//ll_module_id[upperbound(ll_module_id) + 1] = 54	 //View Painter - Contract
//ll_module_id[upperbound(ll_module_id) + 1] = 25	 //System
//ll_module_id[upperbound(ll_module_id) + 1] = 25	 //System
//ll_module_id[upperbound(ll_module_id) + 1] = 56	 //Contract Requirement Profile
//ll_module_id[upperbound(ll_module_id) + 1] = 57	 //Code Import (CPT Code)
//ll_module_id[upperbound(ll_module_id) + 1] = 25	 //System
//ll_module_id[upperbound(ll_module_id) + 1] = 33  //Contract
//
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 1	//Main 
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 520	//Application Status
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 521	//Contracts
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 530	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 531	//'View Manager
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 532	//Field Properties
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 533	//Screen Parameters
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 540	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 550	//Scan OIG
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 551	//Import OIG
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 560	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 570	//Main
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 150	//Audit Trail
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 290	//Main
//---------------------------- APPEON END ----------------------------

of_update_right()

end subroutine

public subroutine of_update_version_80 ();//////////////////////////////////////////////////////////////////////
// $<function>n_cst_role_right_sql.of_update_version_80()
// $<arguments>(None)
// $<returns> (none)
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 11.22.2007 Alfee
//////////////////////////////////////////////////////////////////////
long ll_module_id[],ll_sub_module_id[]

//Update secuity Rights

//Add approve/reject control in document manager
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6929)    " + & 
"Insert Into security_rights_action Values(6929, 33, 370, 'Approve/Reject', 2)"

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-12-19 By: Scofield
//$<Reason> Add contact control.
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_modules where module_id = 67)    " + &  
"INSERT INTO security_modules ( module_id, software_version, module_name ,prod_id) values( 67, 4, 'Contact', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_sub_module where sub_module_id = 606)    " + & 
"INSERT INTO security_sub_module ( module_id, sub_module_id, sub_module_name,prod_id ) values ( 67, 606, 'Main', 1)"
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6930)    " + & 
"INSERT INTO security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6930, 67, 606, 'View Rights', 2 ) "
//---------------------------- APPEON END ----------------------------
//==============================APPEON BEGIN==========================
// $<Added>:   Date: Jan 03,2008       Author:Nova
//--------------------------------------------------------------------
// $<reason>   
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 1345)    " + &  
"INSERT INTO security_rights_action VALUES ( 1345, 25, 80, 'Admin Utilities ', 1) "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 2081)    " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type) Values (2081,33,300,'More Button',2)    " 

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 6924)    " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type) Values (6924,33,370,'Search Criteria',2)    " 

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 2091)    " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type)    " + &  
"     Values (2091,33,310,'Custom Data',2)    " 
 
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 2092)    " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type)    " + &  
"     Values (2092,33,310,'Notes',2)    " 
 
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 2093)    " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type)    "  + &  
 "    Values (2093,33,310,'Audit Trail',2)    " 

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 6935)    " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type)    " + &  
"     Values (6935,33,370,'Work Flow Painter',2)    " 
 
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 6936)    " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type)    " + &  
"     Values (6936,33,370,'Audit Trail Painter',2)    "

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 2094) " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type) " + &  
"     Values (2094,33,310,'Status Track',2) " 


//==============================APPEON END============================
of_execute_sqls('of_update_version_80')

//--------------------------- APPEON BEGIN ---------------------------
//$<Comment> 2007-12-20 By: Scofield
//$<Reason> the interface of of_update_right has been adjusted.

//ll_module_id[upperbound(ll_module_id) + 1] = 33  //Contract
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 370	//Document Manager
//
//ll_module_id[upperbound(ll_module_id) + 1] = 67  //Contact
//ll_sub_module_id[upperbound(ll_sub_module_id) + 1] = 606	//Main

//---------------------------- APPEON END ----------------------------
of_update_right()

//03.19.2008 By Jervis
//update document catagory right for contract
of_update_document_right()

end subroutine

public subroutine of_update_right_bak (long al_module_id[], long al_sub_module_id[]);datastore lds_actions,lds_roles,lds_rights
string ls_filter,ls_find
long i,j,k,ll_module_id[],ll_sub_module_id[]
long ll_find,ll_module_id1,ll_sub_module_id1,ll_role_id,ll_action_id,ll_rights_id
long ll_row,ll_action_rowcount,ll_role_rowcount,ll_right_rowcount

lds_actions = CREATE datastore
lds_actions.DataObject = 'd_security_all_actions'
lds_actions.SetTransObject( SQLCA )

lds_roles = CREATE datastore
lds_roles.dataobject = 'd_security_roles'
lds_roles.settransobject(sqlca)

lds_rights = CREATE datastore
lds_rights.dataobject = 'd_security_roles_rights'
lds_rights.settransobject(sqlca)

lds_actions.retrieve()
lds_roles.retrieve()
lds_rights.retrieve()
Select Max( rights_id ) Into :ll_rights_id From security_roles_rights;

If IsNull( ll_rights_id ) Then ll_rights_id = 0;
ll_role_rowcount = lds_roles.rowcount()
ll_right_rowcount = lds_rights.rowcount()
ll_module_id = al_module_id
ll_sub_module_id = al_sub_module_id

For i = 1 To upperbound(ll_module_id)
	ll_module_id1 = ll_module_id[i]
	ll_sub_module_id1 = ll_sub_module_id[i]
	ls_filter = "module_id = " + string(ll_module_id1) + " And sub_module_id = " + string(ll_sub_module_id1)
	lds_actions.setfilter(ls_filter)
	lds_actions.filter()
	ll_action_rowcount = lds_actions.rowcount()
	For j = 1 To ll_role_rowcount
		ll_role_id = lds_roles.getitemnumber(j,'role_id')				
		For k = 1 To ll_action_rowcount
			ll_action_id = lds_actions.getitemnumber(k,'action_id')
			ls_find = "role_id = " + string(ll_role_id) + " and action_id = " + string(ll_action_id)
			ll_find = lds_rights.find(ls_find,1,ll_right_rowcount)
			If ll_find < 1 Then
				ll_row = lds_rights.insertrow(0)
				ll_rights_id ++
				lds_rights.setitem(ll_row,'rights_id',ll_rights_id)
				lds_rights.setitem(ll_row,'role_id',ll_role_id)
				lds_rights.setitem(ll_row,'action_id',ll_action_id)
				lds_rights.setitem(ll_row,'value_id',2)
			End If
		Next
	Next
Next
lds_rights.update()
UPDATE ids SET rights_id = :ll_rights_id;	

Destroy lds_actions
Destroy lds_roles
Destroy lds_rights

end subroutine

public subroutine of_update_document_right ();//Start Add Code By Jervis 03.19.2008
//Update document right for contract
//Copy from w_security_roles_painter.of_contract_management_rights
Long ll_roles_count
Long ll_lookup_count
Long ll_rowcount
Long i,j
Long ll_role_id
Long ll_category
Long ll_find
Long ll_row
String ls_filter

n_cst_datastore lds_contract_management_rights
n_cst_datastore lds_code_lookup
n_cst_datastore lds_roles

SetPointer(HourGlass!)
lds_roles = Create n_cst_datastore
lds_roles.DataObject = 'd_dddw_security_roles'
lds_roles.SetTransObject(sqlca)

lds_code_lookup = Create n_cst_datastore
lds_code_lookup.DataObject = 'd_g_code_lookup'
lds_code_lookup.SetTransObject(sqlca)

lds_contract_management_rights = Create n_cst_datastore
lds_contract_management_rights.DataObject = 'd_contract_management_rights'
lds_contract_management_rights.SetTransObject(sqlca)

gnv_appeondb.of_startqueue( )
lds_roles.Retrieve()

lds_code_lookup.Retrieve()
gnv_appeondb.of_commitqueue( )

ll_roles_count = lds_roles.RowCount()

//ls_filter = "lookup_name = 'Contract Category'"
//lds_code_lookup.SetFilter(ls_filter)
//lds_code_lookup.Filter()	
//ll_lookup_count = lds_code_lookup.RowCount()

For j  = 1 To ll_roles_count
	ll_role_id = lds_roles.GetItemNumber( j,"role_id")
	//modified by nova 2008-04-08
	lds_contract_management_rights.Retrieve(ll_role_id)
   ll_rowcount = lds_contract_management_rights.RowCount()
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 02.14.2007 By: Jervis
	//$<reason> 
	ls_filter = "lookup_name = 'Contract Category'"
	lds_code_lookup.SetFilter(ls_filter)
	lds_code_lookup.Filter()
	ll_lookup_count = lds_code_lookup.RowCount()
	
	For i = 1 To ll_lookup_count
		ll_category = lds_code_lookup.GetItemNumber(i,'lookup_code')
		//ll_find = lds_contract_management_rights.find("category = " + string(ll_category),1,ll_rowcount)
		ll_find = lds_contract_management_rights.Find("category = " + String(ll_category) + " and types = 1",1,ll_rowcount)
		If ll_find < 1 Then
			ll_row = lds_contract_management_rights.InsertRow(0)
			lds_contract_management_rights.SetItem(ll_row,'role_id',ll_role_id)
			lds_contract_management_rights.SetItem(ll_row,'category',ll_category)
			lds_contract_management_rights.SetItem(ll_row,'types',1)
			lds_contract_management_rights.SetItem(ll_row,'rights','11')
		End If
	Next
	
	
	
	//Start Changed 02.13.2007 By Jervis
	//Replace "Contract Clause Category" to "Contract Category"
	ls_filter = "lookup_name = 'Contract Clause Category'"  //Modify by Jack 03/12/2007
	//	ls_filter = "lookup_name = 'Contract Category'"
	//End Changed
	
	lds_code_lookup.SetFilter(ls_filter)
	lds_code_lookup.Filter()
	ll_lookup_count = lds_code_lookup.RowCount()
	ll_rowcount = lds_contract_management_rights.RowCount() //Add By Jervis 02.14.2007
	For i = 1 To ll_lookup_count
		ll_category = lds_code_lookup.GetItemNumber(i,'lookup_code')
		ll_find = lds_contract_management_rights.Find("category = " + String(ll_category) + " and types = 2",1,ll_rowcount)
		If ll_find < 1 Then
			ll_row = lds_contract_management_rights.InsertRow(0)
			lds_contract_management_rights.SetItem(ll_row,'role_id',ll_role_id)
			lds_contract_management_rights.SetItem(ll_row,'category',ll_category)
			lds_contract_management_rights.SetItem(ll_row,'types',2)
			lds_contract_management_rights.SetItem(ll_row,'rights','21')
		End If
	Next
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 02.14.2007 By: Jervis
	//$<reason> Replace "Contract Document Category" to "Contract Category"
	//ls_filter = "lookup_name = 'Contract Document Category'" //Rodger changed on Jan. 19, 2007.
	ls_filter = "lookup_name = 'Contract Category'"
	//---------------------------- APPEON END ----------------------------
	
	
	lds_code_lookup.SetFilter(ls_filter)
	lds_code_lookup.Filter()
	ll_lookup_count = lds_code_lookup.RowCount()
	ll_rowcount = lds_contract_management_rights.RowCount() //Add by jervis 02.14.2007
	For i = 1 To ll_lookup_count
		ll_category = lds_code_lookup.GetItemNumber(i,'lookup_code')
		ll_find = lds_contract_management_rights.Find("category = " + String(ll_category) + " and types = 3",1,ll_rowcount)
		If ll_find < 1 Then
			ll_row = lds_contract_management_rights.InsertRow(0)
			lds_contract_management_rights.SetItem(ll_row,'role_id',ll_role_id)
			lds_contract_management_rights.SetItem(ll_row,'category',ll_category)
			lds_contract_management_rights.SetItem(ll_row,'types',3)
			lds_contract_management_rights.SetItem(ll_row,'rights','31')
		End If
	Next
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 02.14.2007 By: Jervis
	//$<reason> 
	//ls_filter = "lookup_name = 'Contract Document Category'"
	ls_filter = "lookup_name = 'Contract Category'"
	//---------------------------- APPEON END ----------------------------
	
	
	lds_code_lookup.SetFilter(ls_filter)
	lds_code_lookup.Filter()
	ll_lookup_count = lds_code_lookup.RowCount()
	ll_rowcount = lds_contract_management_rights.RowCount()
	For i = 1 To ll_lookup_count
		ll_category = lds_code_lookup.GetItemNumber(i,'lookup_code')
		ll_find = lds_contract_management_rights.Find("category = " + String(ll_category) + " and types = 4",1,ll_rowcount)
		If ll_find < 1 Then
			ll_row = lds_contract_management_rights.InsertRow(0)
			lds_contract_management_rights.SetItem(ll_row,'role_id',ll_role_id)
			lds_contract_management_rights.SetItem(ll_row,'category',ll_category)
			lds_contract_management_rights.SetItem(ll_row,'types',4)
			lds_contract_management_rights.SetItem(ll_row,'rights','41')
		End If
	Next
	
	//Added By Jay Chen 03-18-2015 add right for contract division,department,type
	ls_filter = "lookup_name = 'Contract Division'"
	lds_code_lookup.SetFilter(ls_filter)
	lds_code_lookup.Filter()
	ll_lookup_count = lds_code_lookup.RowCount()
	ll_rowcount = lds_contract_management_rights.RowCount()
	For i = 1 To ll_lookup_count
		ll_category = lds_code_lookup.GetItemNumber(i,'lookup_code')
		ll_find = lds_contract_management_rights.Find("category = " + String(ll_category) + " and types = 6",1,ll_rowcount)
		If ll_find < 1 Then
			ll_row = lds_contract_management_rights.InsertRow(0)
			lds_contract_management_rights.SetItem(ll_row,'role_id',ll_role_id)
			lds_contract_management_rights.SetItem(ll_row,'category',ll_category)
			lds_contract_management_rights.SetItem(ll_row,'types',6)
			lds_contract_management_rights.SetItem(ll_row,'rights','61')
		End If
	Next
	
	ls_filter = "lookup_name = 'Contract Department'"
	lds_code_lookup.SetFilter(ls_filter)
	lds_code_lookup.Filter()
	ll_lookup_count = lds_code_lookup.RowCount()
	ll_rowcount = lds_contract_management_rights.RowCount()
	For i = 1 To ll_lookup_count
		ll_category = lds_code_lookup.GetItemNumber(i,'lookup_code')
		ll_find = lds_contract_management_rights.Find("category = " + String(ll_category) + " and types = 7",1,ll_rowcount)
		If ll_find < 1 Then
			ll_row = lds_contract_management_rights.InsertRow(0)
			lds_contract_management_rights.SetItem(ll_row,'role_id',ll_role_id)
			lds_contract_management_rights.SetItem(ll_row,'category',ll_category)
			lds_contract_management_rights.SetItem(ll_row,'types',7)
			lds_contract_management_rights.SetItem(ll_row,'rights','71')
		End If
	Next
	
	ls_filter = "lookup_name = 'Contract Type'"
	lds_code_lookup.SetFilter(ls_filter)
	lds_code_lookup.Filter()
	ll_lookup_count = lds_code_lookup.RowCount()
	ll_rowcount = lds_contract_management_rights.RowCount()
	For i = 1 To ll_lookup_count
		ll_category = lds_code_lookup.GetItemNumber(i,'lookup_code')
		ll_find = lds_contract_management_rights.Find("category = " + String(ll_category) + " and types = 8",1,ll_rowcount)
		If ll_find < 1 Then
			ll_row = lds_contract_management_rights.InsertRow(0)
			lds_contract_management_rights.SetItem(ll_row,'role_id',ll_role_id)
			lds_contract_management_rights.SetItem(ll_row,'category',ll_category)
			lds_contract_management_rights.SetItem(ll_row,'types',8)
			lds_contract_management_rights.SetItem(ll_row,'rights','81')
		End If
	Next
	//end add
	
	//modified by nova 2008-04-10
	gnv_appeondb.of_autocommitrollback( )
	lds_contract_management_rights.Update()
	commit;

Next

//---------------------------- APPEON END ----------------------------

SetPointer(Arrow!)

Destroy lds_code_lookup
Destroy lds_contract_management_rights
destroy lds_roles

//End Code By Jervis 03.19.2008

end subroutine

public function integer of_execute_sqls (string as_title);/******************************************************************************************************************
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
**  Created By	: 
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/
Long ll_i
String ls_null[]
Boolean lb_ref_cache
String ls_Error
Boolean   lb_Flag

IF UpperBound(is_sql_statments) > 0 THEN  lb_ref_cache  = True

IF UpperBound(is_sql_statments) > 0 THEN
	//is_sql_statments[UpperBound(is_sql_statments) + 1] = "commit;"
	
	IF Not IsValid( w_infodisp ) THEN Open(w_infodisp)
	
	IF IsValid(w_infodisp) THEN w_infodisp.Title = 'Updating Role Right'
	IF IsValid(w_infodisp) THEN w_infodisp.Center = True
	IF IsValid(w_infodisp) THEN w_infodisp.st_complete.Visible = False
	IF IsValid(w_infodisp) THEN w_infodisp.st_3.Visible = False
	IF IsValid(w_infodisp) THEN w_infodisp.st_information.Visible = False
	IF IsValid(w_infodisp) THEN w_infodisp.st_1.Text = 'Updating Role Right, Please stand by!'
	IF IsValid(w_infodisp) THEN w_infodisp.wf_set_min_max(1,UpperBound(is_sql_statments))
	
	FOR ll_i = 1 To UpperBound(is_sql_statments)
		IF IsValid(w_infodisp) THEN w_infodisp.st_1.Text = 'Modification:' +String(ll_i) +' of '+ String(UpperBound(is_sql_statments)) +', Please stand by!'
		EXECUTE Immediate :is_sql_statments[ll_i] Using sqlca;
		IF sqlca.SQLCode <> 0 THEN
			IF IsValid(gnv_logservice)THEN gnv_logservice.of_log(is_sql_statments[ll_i], sqlca.SQLErrText,'Updating Role Right Information ')
			IF IsValid(gnv_debug) THEN gnv_debug.of_output(true,"Sql: " + is_sql_statments[ll_i] + " Sql error text: " +  Sqlca.SQLErrText)
			gb_upgrade_failed = True
		ELSE
			COMMIT;
		END IF
		
		IF IsValid(w_infodisp) THEN w_infodisp.wf_step_pbar(1)
	NEXT
	
	IF IsValid(w_infodisp) THEN w_infodisp.st_1.Text = 'Committing modifications Please stand by!'
	
	// if isvalid(w_infodisp) then close(w_infodisp)
	
END IF


is_sql_statments = ls_null

RETURN 1


end function

public subroutine of_update_version_85 ();
//--------------------------- APPEON BEGIN ---------------------------
//Added by Nova.zhang on 2008-11-20
//moved from n_cst_updte_data.of_ver85_release_data1
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_sub_module where sub_module_id = 650)    " + &
"INSERT INTO security_sub_module  values (650, 25, 'Batch Import Document Queue', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_rights_action where action_id = 6937)    " + &
 "INSERT INTO security_rights_action values (6937, 25, 650, 'Access Rights', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_modules where module_id = 69)    " + &
"Insert Into security_modules Values(69, 4,'Report Painter - Provider Data ', NULL)"

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_sub_module where sub_module_id = 660)    " + &
"Insert Into security_sub_module Values(660, 69, 'Main', 1)"
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_sub_module where sub_module_id = 670)    " + &
"Insert Into security_sub_module Values(670, 69, 'View Manager', 1)"
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_sub_module where sub_module_id = 680)    " + &
"Insert Into security_sub_module Values(680, 69, 'Field Properties', 1)"
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_sub_module where sub_module_id = 690)    " + &
"Insert Into security_sub_module Values(690, 69, 'Screen Parameters', 1)"

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_rights_action where action_id = 6938)    " + &
"Insert Into security_rights_action Values(6938, 69, 660, 'View Rights', 2)"
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_rights_action where action_id = 6939)    " + &
"Insert Into security_rights_action Values(6939, 69, 670, 'View Rights', 2)"
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_rights_action where action_id = 6940)    " + &
"Insert Into security_rights_action Values(6940, 69, 680, 'View Rights', 2)"
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_rights_action where action_id = 6941)    " + &
"Insert Into security_rights_action Values(6941, 69, 690, 'View Rights', 2)"

//$<add> 11.20.2008 By: Ken.Guo
//$<reason> For Dashboard V8.5

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 70) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(70, 4, 'Dashboard', 1) "
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 700) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (70, 700, 'Main', 1) "
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6942) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6942, 70, 700, 'View Rights', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 710) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (70, 710, 'Tab', 1) "
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6943) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6943, 70, 710, 'Add', 1) "
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6944) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6944, 70, 710, 'Delete', 1) "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6945)    " + & 
"INSERT INTO security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6945, 70, 710, 'Settings', 1 ) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 730) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (70, 730, 'Save As', 1) "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6946)    " + & 
"INSERT INTO security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6946, 70, 730, 'View Rights', 1 ) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 740) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (70, 740, 'Load', 1) "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6947)    " + & 
"INSERT INTO security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6947, 70, 740, 'View Rights', 1 ) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 750) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (70, 750, 'Management', 1) "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6948)    " + & 
"INSERT INTO security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6948, 70, 750, 'View Rights', 1 ) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 760) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (70, 760, 'Banners Settings', 1) "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6949)    " + & 
"INSERT INTO security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6949, 70, 760, 'View Rights', 1 ) "

//Fixed BugJ042301 -- Jervis 04.24.2009
/*
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 770) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (70, 770, 'Close', 1) "
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6950)    " + & 
"INSERT INTO security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6950, 70, 770, 'View Rights', 1 ) "
*/


of_execute_sqls('of_update_version_85')

of_update_right()
//---------------------------- APPEON END ----------------------------



end subroutine

public subroutine of_update_right ();//////////////////////////////////////////////////////////////////////
// $<Function>of_Update_Right()
// $<Arguments> ai_action_value  1: When DDDW_type is 1; 2: When DDDW_type is 2 //Added By Ken.Guo 2008-11-20 
// $<Returns> (None)
// $<Description>
//////////////////////////////////////////////////////////////////////
// $<Add> 2007.12.20 By Scofield
//////////////////////////////////////////////////////////////////////

/* Ken.Guo. Add Description 2008-11-20
When DDDW_type is 1, use 2 States CheckBox. On: 1, Off: 0
When DDDW_type is 2, use 3 States CheckBox. On: 2, Off: 0 OtherState: 1
*/


long		ll_Roles,ll_Actions,ll_RoleCnt,ll_ActionCnt,ll_RightCnt,ll_Row,ll_Find
long		ll_Role_Id,ll_Action_Id,ll_Rights_Id,ll_dddw_value
String	ls_Find

DataStore lds_Roles,lds_Actions,lds_Rights
datastore  lds_extra_action //Added By Jay Chen 10-15-2015
long ll_found

SetPointer(HourGlass!)

lds_Roles = CREATE DataStore
lds_Roles.DataObject = 'd_security_roles'
lds_Roles.SetTransObject(SQLCA)

lds_Actions = CREATE DataStore
lds_Actions.DataObject = 'd_security_all_actions'
lds_Actions.SetTransObject(SQLCA)

lds_Rights = CREATE DataStore
lds_Rights.DataObject = 'd_security_roles_rights'
lds_Rights.SetTransObject(SQLCA)

lds_extra_action = CREATE DataStore
lds_extra_action.DataObject = 'd_no_right_action_id'
//lds_extra_action.SetTransObject(SQLCA)
//lds_extra_action.retrieve()

lds_Roles.Retrieve()
lds_Actions.Retrieve()
lds_Rights.Retrieve()

Select Max(rights_id) Into :ll_Rights_Id From security_roles_rights;
If IsNull(ll_Rights_Id) Then ll_Rights_Id = 0;

ll_RoleCnt = lds_Roles.RowCount()
ll_ActionCnt = lds_Actions.RowCount()
ll_RightCnt = lds_Rights.RowCount()

for ll_Roles = 1 to ll_RoleCnt
	ll_Role_Id = lds_Roles.GetItemNumber(ll_Roles,"role_id")
	for ll_Actions = 1 to ll_ActionCnt
		ll_Action_Id = lds_Actions.GetItemNumber(ll_Actions,"action_id")
		ll_dddw_value = lds_Actions.GetItemNumber(ll_Actions,"dddw_type")
		//dddw_type
		ls_Find = "role_id = " + String(ll_Role_Id) + " and action_id = " + String(ll_Action_Id)
		ll_Find = lds_Rights.Find(ls_Find,1,ll_RightCnt)
		if ll_find <= 0 then
			ll_Row = lds_Rights.insertrow(0)
			ll_Rights_Id ++
			lds_Rights.SetItem(ll_Row,'rights_id',ll_Rights_Id)
			lds_Rights.SetItem(ll_Row,'role_id',ll_Role_Id)
			lds_Rights.SetItem(ll_Row,'action_id',ll_Action_Id)
//			lds_Rights.SetItem(ll_Row,'value_id',ll_dddw_value)//modified by nova 09/18/2008 //Ken.Guo use 'ai_action_value' var 2008-11-20
			//Added By Jay Chen 10-15-2015
			ll_found = lds_extra_action.find("action_id = " + string(ll_Action_Id), 1, lds_extra_action.rowcount())
			if isnull(ll_found) then ll_found = 0
			if ll_found > 0 then 
				lds_Rights.SetItem(ll_Row,'value_id',0)
			else
				lds_Rights.SetItem(ll_Row,'value_id',ll_dddw_value)//modified by nova 09/18/2008 //Ken.Guo use 'ai_action_value' var 2008-11-20
			end if
			//end
		end if
	next
next

lds_Rights.update()

UPDATE ids SET rights_id = :ll_Rights_Id;	

Destroy lds_Actions
Destroy lds_Roles
Destroy lds_Rights
Destroy lds_extra_action


SetPointer(Arrow!)

end subroutine

public subroutine of_update_version_90 ();is_sql_statments[upperbound(is_sql_statments) + 1] =& 
" if not exists (select 1 from security_rights_action where action_id = 6951)    " + & 
"INSERT INTO security_rights_action( action_id, module_id, sub_module_id, action_name, dddw_type ) values( 6951, 33, 310, 'Group Access', 2 ) "


is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 6952)    " + &  
"Insert Into security_rights_action(action_id,module_id,sub_module_id,action_name,dddw_type) Values (6952,33,300,'Report Button',1)    " 

//Added By Ken.Guo 2009-06-04.
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"if not exists (select 1 from security_rights_action where action_id = 6953)    " + &  
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6953, 33, 370, 'Options', 2 )"


//Fixed BugJ042301 -- Jervis 04.24.2009
is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"delete security_roles_rights where action_id = 6950"

is_sql_statments[upperbound(is_sql_statments) + 1] =& 
"delete security_rights_action where module_id = 70 and sub_module_id = 770 and action_id = 6950"

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"delete security_sub_module where module_id = 70 and sub_module_id = 770 and prod_id = 1"

//Added By Ken.Guo 2009-06-30.
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_rights_action where action_id =6954)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6954, 33, 370, 'Insert Reqmnt.', 2 )"


of_execute_sqls('of_update_version_90')

of_update_right()
end subroutine

public subroutine of_update_version_95 ();//Added By Ken.Guo 2009-08-27.
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_rights_action where action_id =6955)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6955, 33, 290, 'Use Template', 1 )"

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
" if not exists (select 1 from security_rights_action where action_id =6956)    " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6956, 33, 310, 'Save As...', 1 )"

//Added by jervis 2009-9-27
//Change 'Screen Parameters' to 'Depend'
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"update security_sub_module set sub_module_name = 'Depend' where module_id = 53 and sub_module_id = 533"

//BEGIN---Modify by Scofield on 2010-01-13
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 71) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(71, 4, 'Calendar', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 770) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (71, 770, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6957) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6957, 71, 770, 'View Rights', 1) "
//END---Modify by Scofield on 2010-01-13

//Begin - Added By Ken.Guo 2010-01-13.
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6958) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6958, 58, 580, 'Add Clause', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6959) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6959, 58, 580, 'Add Folder', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6960) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6960, 58, 580, 'Copy Clause', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6961) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6961, 58, 580, 'Delete', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6962) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6962, 58, 580, 'Save', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6963) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6963, 58, 580, 'Save As', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6964) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6964, 58, 580, 'Check In', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6965) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6965, 58, 580, 'Check Out', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6966) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6966, 58, 580, 'Insert Field', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6967) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6967, 58, 580, 'Insert Reqmnt', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6968) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6968, 58, 580, 'Merge Data', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6969) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6969, 58, 580, 'Properties', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6970) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6970, 58, 580, 'Rules', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6971) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6971, 58, 580, 'Email', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6972) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6972, 58, 580, 'Print', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6973) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6973, 58, 580, 'Auto Num', 1) "

//is_sql_statments[UpperBound(is_sql_statments) + 1] = &
//"if not exists (select 1 from security_rights_action where action_id = 6974) " + &
//"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6974, 58, 580, 'Revision', 1) "
//
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6975) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6975, 58, 580, 'Compare', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6976) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6976, 58, 580, 'Analysis', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6977) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6977, 58, 580, 'Version Settings', 1) "
//End - Added By Ken.Guo 2010-01-13.

//Added By Ken.Guo 2010-02-22.
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6978) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6978, 33, 300, 'Display Options', 1) "



of_execute_sqls('of_update_version_95')

of_update_right()

end subroutine

public subroutine of_update_version_100 ();//Added by Ken on 2010-09-07
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 72) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(72, 4, 'Documents', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 780) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (72, 780, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6979) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6979, 72, 780, 'View Rights', 2) "


//Added By Ken.Guo 2010-12-23.
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 790) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (68, 790, 'Getting Started', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6980) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6980, 68, 790, 'View Rights', 1) "


of_execute_sqls('of_update_version_100')

of_update_right()
end subroutine

public subroutine of_update_version_105 ();//Added by Jervis 05.13.2011
//is_sql_statments[UpperBound(is_sql_statments) + 1] = &
//"if not exists (select 1 from security_modules where module_id = 72) " + &
//"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(72, 4, 'Documents', 1) "


of_execute_sqls('of_update_version_105')

of_update_right()
end subroutine

public subroutine of_update_version_110 ();////Added By Ken.Guo 2010-12-23.
//is_sql_statments[UpperBound(is_sql_statments) + 1] = &
//"if not exists (select 1 from security_sub_module where sub_module_id = 790) " + &
//"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (68, 790, 'Getting Started', 1) "
//
//is_sql_statments[UpperBound(is_sql_statments) + 1] = &
//"if not exists (select 1 from security_rights_action where action_id = 6981) " + &
//"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6980, 68, 790, 'View Rights', 1) "
//
//
of_execute_sqls('of_update_version_110')

of_update_right()


end subroutine

public subroutine of_update_version_115 ();//====================================================================
// Function: of_update_version_115
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 07/10/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6981) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6981, 58, 580, 'Batch Update', 1) "

//Added By Mark Lee 09/11/12
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6982) " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6982, 33, 380, 'Modify Other Users AI', 1 ) "

of_execute_sqls('of_update_version_115')

of_update_right()


end subroutine

public subroutine of_update_version_120 ();//====================================================================
// Function: of_update_version_120
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 07/10/12
//--------------------------------------------------------------------
//	Copyright (c) 2008-2012 Contract Logix,Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

////Added By Mark Lee 09/11/12
//is_sql_statments[UpperBound(is_sql_statments) + 1] = &
//"if not exists (select 1 from security_rights_action where action_id = 6982) " + &
//"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6982, 33, 380, 'Modify Other Users AI', 1 ) "
//

//Added by gavins 20121229
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6983) " + &
"INSERT INTO security_rights_action ( action_id, module_id, sub_module_id, action_name, dddw_type ) values ( 6983, 67, 606, 'Batch Update', 1 ) "

//Added By Mark Lee 02/06/2013
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 800) " + &
 "INSERT	INTO	security_sub_module	(	module_id		, sub_module_id		, sub_module_name, prod_id	)	VALUES		(	33		, 800	, 'Email Manager' , 1	) "
 
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6984) " + &
 "INSERT	INTO	security_rights_action	(	module_id	, sub_module_id		, action_id	, action_name	, dddw_type	)	VALUES	(	33	, 800	,6984 , 'Access Rights'	, 1	) "

//Added by gavins 20130312
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 73) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(73, 4, 'EZ Menu Painter', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 801) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (73, 801, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6985) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6985, 73, 801, 'View Rights', 1) "

//is_sql_statments[UpperBound(is_sql_statments) + 1] = &
//"if not exists (select 1 from security_rights_action where action_id = 6986) " + &
//"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6986, 73, 801, 'System Level Settings', 1) "

//Added By Ken.Guo 03/27/2013
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 74) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(74, 4, 'Picture Painter', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 802) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (74, 802, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6987) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6987, 74, 802, 'View Rights', 2) "

//Added by gavins 20130329
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if exists (select 1 from security_rights_action where action_id = 6986) " + &
"   Begin~r~n" + &
"delete security_roles_rights where action_id = 6986 ~r~n" +&
"Delete From security_rights_action where action_id = 6986 and module_id = 73 and sub_module_id = 801~r~n" + &
"  end~r~n"

//Added By Ken.Guo 04/17/2013
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6988) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6988, 33, 290, 'New CTX', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6989) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6989, 33, 290, 'Copy CTX', 1) "




of_execute_sqls('of_update_version_120')

of_update_right()


end subroutine

public subroutine of_update_version_130 ();//====================================================================
// Function: of_update_version_130
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

//Added By Ken.Guo 08/28/2013
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 75) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(75, 4, 'Getting Started', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 803) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (75, 803, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6990) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6990, 75, 803, 'View Rights', 1) "

//Added By Mark Lee 09/27/2013
  is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 76) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(76, 4, 'Request Form Painter', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 804) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (76, 804, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6991) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6991, 76, 804, 'View Rights', 1) "

//Added By Mark Lee 10/24/2013
 is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 77) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(77, 4, 'Request Webform Approve', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 805) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (77, 805, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6992) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6992, 77, 805, 'Access Rights', 1) "

 is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6993) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6993, 77, 805, 'Approve/Reject', 1) "
 
  is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6994) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6994, 77, 805, 'View Other Users'' Requests', 1) "

//Added By Ken.Guo 11/27/2013
  is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6995) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6995, 33, 370, 'Show History Documents', 1) "

//Added By Mark Lee 02/17/2014
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 806) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (68, 806, 'Environment Check', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6996) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6996, 68, 806, 'Access Rights', 1) "

//Run Date Email Alarm Query 
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 807) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (25, 807, 'Run Date Email Alarm Query', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6997) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6997, 25, 807, 'Access Rights', 1) "

//Refresh Document Signature Data 
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 808) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (25, 808, 'Refresh Document Signature Data', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6998) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6998, 25, 808, 'Access Rights', 1) "

//Refresh Document Approval Data 
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 809) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (25, 809, 'Refresh Document Approval', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 6999) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(6999, 25, 809, 'Access Rights', 1) "

//Refresh All Data
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 810) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (25, 810, 'Refresh All Data', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7000) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7000, 25, 810, 'Access Rights', 1) "

//windows
 is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 78) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(78, 4, 'Window', 1) "

//Preload Contract Folder objects 
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 811) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (78, 811, 'Preload Contract Folder objects', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7001) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7001, 78, 811, 'Access Rights', 1) "

//Save Contract Folder State
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 812) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (78, 812, 'Save Contract Folder State', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7002) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7002, 78, 812, 'Access Rights', 1) "

of_execute_sqls('of_update_version_130')

of_update_right()

end subroutine

public subroutine of_update_version_140 ();//====================================================================
// Function: of_update_version_140
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 03/03/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contract Logix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//Added By Mark Lee 03/11/2014
  is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 79) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(79, 4, 'Web API Key Painter', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 813) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (79, 813, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7003) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7003, 79, 813, 'View Rights', 1) "

//Added By Jay Chen 05-21-2014
 is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 80) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(80, 4, 'Request Thin Web', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 814) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (80, 814, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7004) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7004, 80, 814, 'Access Rights', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7005) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7005, 80, 814, 'Global CSS Settings', 1) "

//Added By Jay Chen 07-02-2014
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7006) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7006, 80, 814, 'Add Company', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7007) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7007, 80, 814, 'Add Contact', 1) "

//Added By Mark Lee 08/19/2014
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7008) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7008, 80, 814, 'Add as Account', 1) "

of_execute_sqls('of_update_version_140')

of_update_right()


end subroutine

public subroutine of_update_version_150 ();//====================================================================
// Function: of_update_version_150
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/15/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

////Added By Mark Lee 08/19/2014
//is_sql_statments[UpperBound(is_sql_statments) + 1] = &
//"if not exists (select 1 from security_rights_action where action_id = 7008) " + &
//"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7008, 80, 814, 'Add as Account', 1) "
//
//of_execute_sqls('of_update_version_150')

//Added By Jay Chen 10-10-2014
 is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_modules where module_id = 81) " + &
"INSERT INTO security_modules (module_id, software_version, module_name, prod_id) values(81, 4, 'Data Synchronization Painter', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 815) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (81, 815, 'Main', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7009) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7009, 81, 815, 'View Rights', 2) "

//Added By Mark Lee 10/22/2014
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7010) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7010, 76, 804, 'Delete', 1) "

//Added By Mark Lee 11/10/2014
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7011) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7011, 76, 804, 'Role Group Rights', 1) "

//Added By Ken.Guo 03/24/2015
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_sub_module where sub_module_id = 816) " + &
"INSERT INTO security_sub_module (module_id, sub_module_id, sub_module_name, prod_id) values (25, 816, 'Batch Update Contracts', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7012) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7012, 25, 816, 'View Rights', 1) "

//Added By Mark Lee 04/07/2015
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7013) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7013, 28, 170, 'Create and Modify', 1) "

is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7014) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7014, 28, 170, 'Output', 1) "

//Added By Mark Lee 04/20/2015
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7015) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7015, 77, 805, 'Delete', 1) "

//Added By Mark Lee 05/29/2015
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7016) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7016, 80, 814, 'Page Text Settings', 1) "

//Added By Mark Lee 09/21/2015
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7017) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7017, 80, 814, 'Global Column Visibility Settings', 1) "

//Added By Jay Chen 09-22-2015
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7018) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7018, 33, 370, 'Check Out Compare', 1) "

//Added By Jay Chen 12-02-2015
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7019) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7019, 80, 814, 'Modify Account Settings', 1) "

//Added By Jay Chen 02-22-2016
is_sql_statments[UpperBound(is_sql_statments) + 1] = &
"if not exists (select 1 from security_rights_action where action_id = 7021) " + &
"INSERT INTO security_rights_action (action_id, module_id, sub_module_id, action_name, dddw_type) values(7021, 33, 800, 'View Email Log', 1) "

of_execute_sqls('of_update_version_150')
of_update_right()

of_update_document_right() //Added By Jay Chen 03-19-2015

//Added By Ken.Guo 02/05/2015
This.of_update_contract_status( )

//Added By Ken.Guo 03/30/2015
of_set_batch_update_ctx_default()

end subroutine

public subroutine of_update_contract_status ();//====================================================================
// Function: of_update_contract_status
//--------------------------------------------------------------------
// Description:  Update Contract Status for all Role .
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo           Date: 02/04/2015
//--------------------------------------------------------------------
//Copyright (c) 2008-2013 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Insert Into ctx_acp_contract_management_right
Select r.role_id, c.lookup_code, 5,51
From security_roles r, code_lookup c
Where c.lookup_name = 'contract status' and 
Not exists
(select 1 from ctx_acp_contract_management_right m 
where m.role_id = r.role_id and m.category = c.lookup_code and  m.types = 5 )  ;



end subroutine

public subroutine of_set_batch_update_ctx_default ();//====================================================================
// Function: of_set_batch_update_ctx_default
//--------------------------------------------------------------------
// Description: Only Admin have this right by default.
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:         Ken.Guo 03/30/2015
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_main_version, ls_patch_version
Select set_18,set_patch_ver Into :ls_main_version, :ls_patch_version From icred_settings;
If ls_main_version < '150' or ( ls_main_version = '150' and ls_patch_version < '035' ) Then
	Update SECURITY_ROLES_RIGHTS Set Value_id = 0 Where action_id= 7012 and Role_id <> 1;
End If

Return 


end subroutine

on n_cst_update_role_right.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_update_role_right.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

