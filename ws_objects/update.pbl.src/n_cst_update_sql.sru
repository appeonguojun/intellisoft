$PBExportHeader$n_cst_update_sql.sru
forward
global type n_cst_update_sql from n_cst_update
end type
end forward

global type n_cst_update_sql from n_cst_update
end type
global n_cst_update_sql n_cst_update_sql

type variables
n_cst_update_sql_v140 					inv_sql140					//Added By Mark Lee 12/22/2015
end variables

forward prototypes
public function integer of_ver80_updates ()
public function integer of_ver60_updates ()
public function integer of_ver70_updates ()
public function integer of_ver85_updates ()
public function integer of_ver90_updates ()
public function integer of_ver95_updates ()
public function integer of_ver100_updates ()
public subroutine of_release_fulltext ()
public subroutine of_release_fulltext (boolean ab_do_drop)
public function integer of_ver105_updates ()
public function integer of_ver110_updates ()
public function integer of_ver115_updates ()
public function integer of_ver120_updates ()
public function integer of_ver130_updates ()
public function integer of_ver140_updates ()
public function integer of_ver150_release_table1 ()
public function integer of_ver150_release_trigger1 ()
public function integer of_ver150_release_view1 ()
public function integer of_ver150_release_createfulltext1 ()
public function integer of_ver150_release_dropfulltext1 ()
public function integer of_ver150_updates ()
public function integer of_ver150_release_storeprocedure1 ()
public function integer of_ver150_release_storeprocedure2 ()
public function integer of_ver150_release_storeprocedure3 ()
public function integer of_ver150_release_storeprocedure4 ()
public function integer of_ver150_release_storeprocedure5 ()
public function integer of_ver150_release_storeprocedure6 ()
public function integer of_ver150_release_storeprocedure7 ()
public function integer of_ver150_release_storeprocedure8 ()
public function integer of_ver150_release_storeprocedure9 ()
public function string of_ver150_get_sp_contract_search_2 ()
public function integer of_ver150_release_table2 ()
end prototypes

public function integer of_ver80_updates ();inv_sql140.of_ver80_updates( )						//Added By Mark Lee 12/22/2015
RETURN 1

end function

public function integer of_ver60_updates ();inv_sql140.of_ver60_updates( )						//Added By Mark Lee 12/22/2015
RETURN 1
end function

public function integer of_ver70_updates ();inv_sql140.of_ver70_updates( )						//Added By Mark Lee 12/22/2015
RETURN 1

end function

public function integer of_ver85_updates ();inv_sql140.of_ver85_updates( )						//Added By Mark Lee 12/22/2015
RETURN 1

end function

public function integer of_ver90_updates ();inv_sql140.of_ver90_updates( )						//Added By Mark Lee 12/22/2015
Return 1
end function

public function integer of_ver95_updates ();inv_sql140.of_ver95_updates( )						//Added By Mark Lee 12/22/2015
Return 1

end function

public function integer of_ver100_updates ();inv_sql140.of_ver100_updates( )						//Added By Mark Lee 12/22/2015
Return 1

end function

public subroutine of_release_fulltext ();of_release_fulltext(True)
end subroutine

public subroutine of_release_fulltext (boolean ab_do_drop);
If of_get_app_set() = 1 Then
//	of_ver70_release_createfulltext1( )						
//	If ab_do_drop Then of_ver85_release_dropfulltext1( )
//	of_ver85_release_createfulltext1( )						
//	If ab_do_drop Then of_ver95_release_dropfulltext1( )	
//	of_ver95_release_createfulltext1( )						
//	If ab_do_drop Then of_ver100_release_dropfulltext1( )	
//	of_ver100_release_createfulltext1( )						
//	If ab_do_drop Then of_ver110_release_dropfulltext1( )	
//	of_ver110_release_createfulltext1( )						
//	If ab_do_drop Then of_ver115_release_dropfulltext1( )	
//	of_ver115_release_createfulltext1( )						
//	If ab_do_drop Then of_ver120_release_dropfulltext1( )	
//	of_ver120_release_createfulltext1( )						
//	If ab_do_drop Then of_ver130_release_dropfulltext1( )	
//	of_ver130_release_createfulltext1( )						
//	If ab_do_drop Then of_ver140_release_dropfulltext1( )	
//	of_ver140_release_createfulltext1( )	
	inv_sql140.of_release_fulltext( ab_do_drop)				//Added By Mark Lee 12/23/2015
	//Added By Mark Lee 09/15/2014
	If ab_do_drop Then of_ver150_release_dropfulltext1( )	
	of_ver150_release_createfulltext1( )	
End If


end subroutine

public function integer of_ver105_updates ();inv_sql140.of_ver105_updates( )							//Added By Mark Lee 12/22/2015

Return 1

end function

public function integer of_ver110_updates ();inv_sql140.of_ver110_updates( )						//Added By Mark Lee 12/22/2015
Return 1

end function

public function integer of_ver115_updates ();inv_sql140.of_ver115_updates( )						//Added By Mark Lee 12/22/2015
Return 1

end function

public function integer of_ver120_updates ();inv_sql140.of_ver120_updates( )						//Added By Mark Lee 12/22/2015
Return 1

end function

public function integer of_ver130_updates ();inv_sql140.of_ver130_updates( )						//Added By Mark Lee 12/22/2015
return 1
end function

public function integer of_ver140_updates ();inv_sql140.of_ver140_updates( )						//Added By Mark Lee 12/22/2015

Return 1
end function

public function integer of_ver150_release_table1 ();//====================================================================
// Function: of_ver150_release_table1
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
//Add SQL Here

//e.g.
//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//"IF Not EXISTS(SELECT name  FROM  sysobjects WHERE  name = 'security_user_options'  AND ~t type = 'U')~r~n" + &
//"CREATE TABLE security_user_options~r~n" + &
//"(~r~n" + &
//"user_id varchar(50) not null,~r~n" + &
//"option_name varchar(100)  not null,~r~n" + &
//"option_value varchar(100) null,~r~n" + &
//"last_update datetime null,~r~n" + &
//"Primary Key(user_id,option_name)~r~n" + &
//"~t)"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='bypass' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	Alter table request_form add  bypass char(1) null~r~n"


//Added By Mark Lee 09/18/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"~twhere c.id=t.id  and c.name='status' and t.name='ctx_bidq_doc'~tand t.type = 'U')~r~n" + &
"~tAlter table ctx_bidq_doc add  status int null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"~twhere c.id=t.id  and c.name='received_by' and t.name='ctx_bidq_doc'~tand t.type = 'U')~r~n" + &
"~tAlter table ctx_bidq_doc add  received_by varchar(20) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"~twhere c.id=t.id  and c.name='received_date' and t.name='ctx_bidq_doc'~tand t.type = 'U')~r~n" + &
"~tAlter table ctx_bidq_doc add  received_date datetime  null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='steps' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	Alter table request_form add  steps bit null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='steps' and t.name='request_webform'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform add  steps bit null~r~n"

//Added By Jimmy Lee 09/22/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='bypass' and t.name='request_webform'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform add  bypass char(1) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='submit_step' and t.name='request_webform'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform add  submit_step varchar(500) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='need_submit_step' and t.name='request_webform'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform add  need_submit_step varchar(500) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='submitted' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  submitted int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='submitted' and t.name='request_webform_document'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_document add  submitted int null~r~n"

//Added By Mark Lee 09/22/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='updated' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  updated char(1) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='updated' and t.name='request_webform_document'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_document add  updated char(1) null~r~n"

//Added By Ken.Guo 10/08/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'ctx_batch_update_log' )~r~n" + &
"~tCreate Table ctx_batch_update_log ~r~n" + &
"~t(~r~n" + &
"~t~tid  numeric(10,0) identity  not null,~r~n" + &
"~t~tlogin_user varchar(50) not null,~r~n" + &
"~t~tupdate_text varchar(8000),~r~n" + &
"~t~tupdate_result varchar(30) null,~r~n" + &
"~t~tupdate_log varchar(8000) null,~r~n" + &
"~t~tupdate_ctxid_list varchar(8000) null,~r~n" + &
"~t~tupdate_templateid_list varchar(8000) null,~r~n" + &
"~t~tupdate_date datetime null~r~n" + &
"~t~tPrimary Key(id)~r~n" + &
"~t)~r~n" + &
""
//Added By Jay Chen 10-10-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='salesforce_id' and t.name='ctx_am_document'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_am_document add salesforce_id varchar(30) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='sync_salesforce' and t.name='import_hdr'~tand t.type = 'U')~r~n" + &
"	Alter table import_hdr add sync_salesforce int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'security_user_salesforce' )~r~n" + &
"~tCreate Table security_user_salesforce ~r~n" + &
"~t(~r~n" + &
"~t~tid  numeric(10,0) identity  not null,~r~n" + &
"~t~tsalesforce_user varchar(50) not null,~r~n" + &
"~t~tsalesforce_pwd varchar(200),~r~n" + &
"~t~tsalesforce_token varchar(200),~r~n" + &
"~t~tclx_user varchar(50) null,~r~n" + &
"~t~tupdate_by varchar(50) null,~r~n" + &
"~t~tupdate_date datetime null~r~n" + &
"~t~tPrimary Key(id)~r~n" + &
"~t)~r~n" + &
""
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='webrequest' and t.name='icred_settings' and t.type = 'U') " + &
"alter table icred_settings add webrequest int null "

//Added By Jay Chen 10-13-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='field_edit_type' and t.name='import_file_fields'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE import_file_fields ADD field_edit_type VARCHAR(100)  null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='field_required' and t.name='import_file_fields'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE import_file_fields ADD field_required CHAR(1)  null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'import_process_result' )~r~n" + &
"~tCreate Table import_process_result ~r~n" + &
"~t(~r~n" + &
"~t~t rec_id numeric(10,0) identity not null,~r~n" + &
"~t~timp_table varchar(50) not null,~r~n" + &
"~t~timp_id1 int not null,~r~n" + &
"~t~timp_id2 varchar(30) not null,~r~n" + &
"~t~t sync_type varchar(50),~r~n" + &
"~t~tPrimary Key(rec_id)~r~n" + &
"~t)~r~n" + &
""

//Added By Jay Chen 10-16-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'code_lookup_delete_record' )~r~n" + &
"~tCreate Table code_lookup_delete_record ~r~n" + &
"~t(~r~n" + &
"~t~t lookup_code numeric(6,0)  not null,~r~n" + &
"~t~t lookup_name varchar(35)  not null,~r~n" + &
"~t~t code varchar(30)  not null,~r~n" + &
"~t~t description varchar(75)  not null,~r~n" + &
"~t~t type VARCHAR (1) null,~r~n" + &
"~t~t	custom_1 VARCHAR (50) null,~r~n" + &
"~t~t	custom_2 VARCHAR (50) null,~r~n" + &
"~t~t	custom_3 VARCHAR (50) null,~r~n" + &
"~t~t	custom_4 VARCHAR (50) null,~r~n" + &
"~t~t	custom_5 VARCHAR (50) null,~r~n" + &
"~t~t custom_6 VARCHAR (50) null,~r~n" + &
"~t~t	caqh_code INT null,~r~n" + &
"~t~t	ic_n NUMERIC (10,0) null,~r~n" + &
"~t~t	ic_c VARCHAR (50) null,~r~n" + &
"~t~t	modify_date DATETIME null,~r~n" + &
"~t~t	Large_Description_1 VARCHAR (2000) null,~r~n" + &
"~t~t	Large_Description_2 VARCHAR (2000) null,~r~n" + &
"~t~t	Money_1 DECIMAL (10, 2) null,~r~n" + &
"~t~t	Money_2 DECIMAL (10, 2) null,~r~n" + &
"~t~t	Integer_1 INT null,~r~n" + &
"~t~t	Integer_2 INT null,~r~n" + &
"~t~t	Integer_3 INT null,~r~n" + &
"~t~t	Integer_4 INT null,~r~n" + &
"~t~t	Integer_5 INT null,~r~n" + &
"~t~t	Integer_6 INT null,~r~n" + &
"~t~t	Integer_7 INT null,~r~n" + &
"~t~t	Integer_8 INT null,~r~n" + &
"~t~t	datetime_1 DATETIME null,~r~n" + &
"~t~t	datetime_2 DATETIME null,~r~n" + &
"~t~t delete_by varchar(50) null,~r~n" + &
"~t~t delete_date datetime null, ~r~n" + &
"~t~tPrimary Key(lookup_code)~r~n" + &
"~t)~r~n" + &
""
//Added By Mark Lee 10/22/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	Alter table request_form add  deleted char(1) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted_by' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	Alter table request_form add  deleted_by varchar(50) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted_date' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	Alter table request_form add  deleted_date datetime null~r~n"

//Add by Jimmy Lee 10/03/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='parent_table_name' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  parent_table_name varchar(50) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='parent_rowid' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  parent_rowid INT null~r~n"

//Added By Mark Lee 11/07/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"~tif not exists(select 1 from sysobjects where name = 'request_relation_table' and type = 'U')~r~n" + &
"~tBegin~r~n" + &
"~t~tCreate Table request_relation_table~r~n" + &
"~t~t(~r~n" + &
"~t~t~tid int identity(1,1) not null,~t~t~t~r~n" + &
"~t~t~ttablename varchar(50) not null,~r~n" + &
"~t~t~trowid int not null,~r~n" + &
"~t~t~trwf_id int not null,~r~n" + &
"~t~t~tctx_id int null,~r~n" + &
"~t~t~tprimarykey varchar(500) null,~r~n" + &
"~t~t~tkey1 int null,~r~n" + &
"~t~t~tconstraint PK_request_relation_table_id primary key (id)~r~n" + &
"~t~t)~r~n" + &
"~tEnd "

//Added By Mark Lee 11/10/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='admin' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	Alter table request_form add  admin varchar(50) null~r~n"

//Added By Jay Chen 11-17-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"~tif not exists(select 1 from sysobjects where name = 'screen_field_special_attribute' and type = 'U')~r~n" + &
"~tBegin~r~n" + &
"~t~tCreate Table screen_field_special_attribute~r~n" + &
"~t~t(~r~n" + &
"~t~t~tview_id int not null,~r~n" + &
"~t~t~tscreen_id int not null,~r~n" + &
"~t~t~tobject_type varchar(50) not null,~r~n" + &
"~t~t~tobject_name varchar(50) not null,~r~n" + &
"~t~t~tobject_format varchar(50) null,~r~n" + &
"~t~t~tconstraint PK_screen_field_special_attribute primary key (view_id,screen_id,object_type)~r~n" + &
"~t~t)~r~n" + &
"~tEnd "

//Added By Jay Chen 11-18-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='enable_special_attribute' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add  enable_special_attribute char(1) null~r~n"

//Added By Mark Lee 11/20/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='email_account_day' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  email_account_day int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='email_account_date' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  email_account_date datetime null~r~n"

//Added By Mark Lee 11/24/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='steps_num' and t.name='request_form_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_form_detail add  steps_num int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='steps_num' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  steps_num int null~r~n"

//Add by Jimmy Lee 11/24/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='reject_step' and t.name='request_webform'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform add  reject_step varchar(500) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='steps_mark' and t.name='request_form_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_form_detail add  steps_mark int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='steps_mark' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  steps_mark int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='steps_mark' and t.name='request_form_document'~tand t.type = 'U')~r~n" + &
"	Alter table request_form_document add  steps_mark int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='steps_mark' and t.name='request_webform_document'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_document add  steps_mark int null~r~n"

//Added By Jay Chen 12-05-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"~tif not exists(select 1 from sysobjects where name = 'ctx_user_access_tmp' and type = 'U')~r~n" + &
"~tBegin~r~n" + &
"~t~tCreate Table ctx_user_access_tmp~r~n" + &
"~t~t(~r~n" + &
"~t~t~tctx_id int not null,~r~n" + &
"~t~t~tuser_id varchar(20) not null,~r~n" + &
"~t~t~taccess char(1) null,~r~n" + &
"~t~t~tconstraint PK_ctx_user_access_tmp primary key (ctx_id,user_id)~r~n" + &
"~t~t)~r~n" + &
"~tEnd "

//Added By Gavin 12/16/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if Not exists( select 1 from sysobjects where name = 'DF_sys_audit_date_time_modified' )~r~n" + &
"	ALTER TABLE sys_audit ADD CONSTRAINT~r~n" + &
"		DF_sys_audit_date_time_modified DEFAULT Getdate( ) FOR date_time_modified~r~n"  
//Added By Gavin 12/16/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
"if exists( select 1 from sysobjects where name = 'PK_SYS_AUDIT' )~r~n" + &
"	 ALTER TABLE sys_audit	DROP CONSTRAINT PK_SYS_AUDIT~r~n"  
//Added By Gavin 12/16/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if Not exists( select 1 from sysobjects where name = 'PK_SYS_AUDIT' )			~r~n" + &
"	ALTER TABLE sys_audit ADD CONSTRAINT~r~n" + &
"				PK_SYS_AUDIT PRIMARY KEY CLUSTERED ~r~n" + &
"				(~r~n" + &
"				rec_id,~r~n" + &
"				field_id,~r~n" + &
"				seq_no,~r~n" + &
"				date_time_modified~r~n" + &
"				) ON [PRIMARY]~r~n"


//Added By Jay Chen 12-17-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"~tif not exists(select 1 from sysobjects where name = 'import_outbound_records' and type = 'U')~r~n" + &
"~tBegin~r~n" + &
"~t~tCREATE TABLE import_outbound_records ~r~n" + &
"~t~t( ~r~n" + &
"~t~t~trec_id             INT IDENTITY NOT NULL, ~r~n" + &
"~t~t~texport_type        INT NOT NULL,~r~n" + &
"~t~t~texport_object      NVARCHAR (50) NOT NULL, ~r~n" + &
"~t~t~texport_fieldname   NVARCHAR (50), ~r~n" + &
"~t~t~texport_external_id NVARCHAR (50),~r~n" + &
"~t~t~tctx_tablename      NVARCHAR (50), ~r~n" + &
"~t~t~tctx_fieldname      NVARCHAR (50), ~r~n" + &
"~t~t~tctx_record_id      NVARCHAR (50), ~r~n" + &
"~t~t~tstatus             INT, ~r~n" + &
"~t~t~tmodify_date        DATETIME, ~r~n" + &
"~t~t~tCONSTRAINT PK_import_outbound_records PRIMARY KEY (rec_id) ~r~n" + &
"~t~t) ~r~n" + &
"~tEnd "

//Added By Jay Chen 12-31-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"~tif not exists(select 1 from sysobjects where name = 'sertifi_template' and type = 'U')~r~n" + &
"~tBegin~r~n" + &
"~t~tCREATE TABLE sertifi_template ~r~n" + &
"~t~t( ~r~n" + &
"~t~t~trec_id             INT IDENTITY NOT NULL, ~r~n" + &
"~t~t~ttemplate_id      NVARCHAR (100), ~r~n" + &
"~t~t~ttemplate_name      NVARCHAR (100), ~r~n" + &
"~t~t~ttemplate_desc      NVARCHAR (100), ~r~n" + &
"~t~t~tCONSTRAINT PK_sertifi_template PRIMARY KEY (rec_id) ~r~n" + &
"~t~t) ~r~n" + &
"~tEnd "

//Added By Mark Lee 01/05/2015 the column  tfield_name_allias and tfield_name does not enought longger.
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'tfield_name_allias' and t.name = 'sys_audit' and t.type = 'U' )~r~n" + &
"alter table sys_audit alter column  tfield_name_allias varchar(255) null ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'tfield_name' and t.name = 'sys_audit' and t.type = 'U' )~r~n" + &
"alter table sys_audit alter column  tfield_name varchar(255) null ~r~n" 

//Added By Mark Lee 01/16/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='dw_select' and t.name='ctx_report_syntax'~tand t.type = 'U')~r~n" + &
"	alter table ctx_report_syntax add dw_select varchar(max) null~r~n"

//Added By Mark Lee 01/29/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'cc_owner_user' and t.name = 'request_form' and t.type = 'U' )~r~n" + &
"alter table request_form alter column cc_owner_user varchar(2000) null ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'cc_approve_user' and t.name = 'request_form' and t.type = 'U' )~r~n" + &
"alter table request_form alter column cc_approve_user varchar(2000) null ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'cc_reject_user' and t.name = 'request_form' and t.type = 'U' )~r~n" + &
"alter table request_form alter column cc_reject_user varchar(2000) null ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'cc_owner_user' and t.name = 'request_webform' and t.type = 'U' )~r~n" + &
"alter table request_webform alter column cc_owner_user varchar(2000) null ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'cc_approve_user' and t.name = 'request_webform' and t.type = 'U' )~r~n" + &
"alter table request_webform alter column cc_approve_user varchar(2000) null ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'cc_reject_user' and t.name = 'request_webform' and t.type = 'U' )~r~n" + &
"alter table request_webform alter column cc_reject_user varchar(2000) null ~r~n" 

//Added By Jay Chen 02-06-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='use_name_login' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add use_name_login char(1) null~r~n"

//Added By Mark Lee 02/06/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='auto_sync_field' and t.name='export_fields'~tand t.type = 'U')~r~n" + &
"	Alter table export_fields add  auto_sync_field int null~r~n"

//Added By Jay Chen 03-19-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='contract_department' and t.name='ctx_basic_info'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_basic_info add contract_department numeric(6,0) null~r~n"

//Added By Mark Lee 05/13/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"~twhere c.id=t.id  and c.name='design' and t.name='request_form_detail'~tand t.type = 'U')~r~n" + &
"~tAlter table request_form_detail add design varchar(1) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"~twhere c.id=t.id  and c.name='design' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"~tAlter table request_webform_detail add design varchar(1) null"


//added by gavins 05/18/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
" if not exists(select 1 from sysobjects where name = 'ctx_basic_info_log' and type = 'U') ~r~n" + &
" Begin ~r~n" + &
"  CREATE TABLE ctx_basic_info_log  ~r~n" + &
"  (  ~r~n" + &
"   user_id   varchar (20) NULL,~r~n" + &
"~t session_id   varchar (20) NOT NULL,~r~n" + &
"~t pcount   int  NULL,~r~n" + &
"~t rcount   int  NULL,~r~n" + &
"~t sqlsyntax   text  NULL,~r~n" + &
"~t lastdate   datetime  NULL,~r~n" + &
"~t errorinfo   varchar (8000) NULL,~r~n" + &
"~t sqlwhere   varchar (4000) NULL,~r~n" + &
"~t sqlsort   varchar (1000) NULL,~r~n" + &
"~t cpage   int  NULL,~r~n" + &
"~t treewhere   varchar (4000) NULL,~r~n" + &
"~t modifydate_contract   datetime  default getdate( ),~r~n" + &
"~t modifydate_permission   datetime  default getdate( ),~r~n" + &
"   CONSTRAINT PK_ctx_basic_info_log  PRIMARY KEY (session_id)  ~r~n" + &
"  )  ~r~n" + &
" End" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
" if not exists(select 1 from sysobjects where name = 'ctx_basic_info_pagedata' and type = 'U') ~r~n" + &
" Begin ~r~n" + &
"~tCREATE TABLE  ctx_basic_info_pagedata (~r~n" + &
"~t~t app_facility   numeric (5, 0) NULL,~r~n" + &
"~t~t product_code   numeric (6, 0) NULL,~r~n" + &
"~t~t product_name    nvarchar (max) NULL,~r~n" + &
"~t~t effective_date   datetime  NULL,~r~n" + &
"~t~t expriation_date   datetime  NULL,~r~n" + &
"~t~t status   numeric (6, 0) NULL,~r~n" + &
"~t~t group_multi_loc_id   numeric (6, 0) NULL,~r~n" + &
"~t~t ctx_id   int  NOT NULL,~r~n" + &
"~t~t master_contract_id   numeric (6, 0) NULL,~r~n" + &
"~t~t master_cnt   int  NULL,~r~n" + &
"~t~t category   numeric (6, 0) NULL,~r~n" + &
"~t~t facility_id   int  NULL,~r~n" + &
"~t~t contract_type   numeric (6, 0) NULL,~r~n" + &
"~t~t product_type    nvarchar (max) NULL,~r~n" + &
"~t~t reimbursment_menth   numeric (6, 0) NULL,~r~n" + &
"~t~t file_location   varchar (150) NULL,~r~n" + &
"~t~t review_date   datetime  NULL,~r~n" + &
"~t~t review_by   varchar (10) NULL,~r~n" + &
"~t~t term_date   datetime  NULL,~r~n" + &
"~t~t term_reason   numeric (6, 0) NULL,~r~n" + &
"~t~t last_revis_date   datetime  NULL,~r~n" + &
"~t~t other_date_1   datetime  NULL,~r~n" + &
"~t~t other_date_2   datetime  NULL,~r~n" + &
"~t~t oc_signed_by   varchar (75) NULL,~r~n" + &
"~t~t oc_title   numeric (6, 0) NULL,~r~n" + &
"~t~t oc_department   numeric (6, 0) NULL,~r~n" + &
"~t~t oc_legal_rep   varchar (75) NULL,~r~n" + &
"~t~t cc_signed_by   varchar (75) NULL,~r~n" + &
"~t~t cc_title   varchar (75) NULL,~r~n" + &
"~t~t cc_department   varchar (75) NULL,~r~n" + &
"~t~t cc_legal_rep   varchar (75) NULL,~r~n" + &
"~t~t notes   varchar (8000) NULL,~r~n" + &
"~t~t keyword   varchar (30) NULL,~r~n" + &
"~t~t dvision   numeric (6, 0) NULL,~r~n" + &
"~t~t custom_1   varchar (255) NULL,~r~n" + &
"~t~t custom_2   varchar (255) NULL,~r~n" + &
"~t~t custom_3   varchar (255) NULL,~r~n" + &
"~t~t custom_4   varchar (255) NULL,~r~n" + &
"~t~t custom_5   varchar (255) NULL,~r~n" + &
"~t~t custom_6   varchar (255) NULL,~r~n" + &
"~t~t custom_7   varchar (255) NULL,~r~n" + &
"~t~t custom_8   varchar (255) NULL,~r~n" + &
"~t~t custom_9   varchar (255) NULL,~r~n" + &
"~t~t custom_10   varchar (255) NULL,~r~n" + &
"~t~t group_id   numeric (6, 0) NULL,~r~n" + &
"~t~t revision_reason   varchar (255) NULL,~r~n" + &
"~t~t record_id   numeric (10, 0) NOT NULL,~r~n" + &
"~t~t owner   varchar (100) NULL,~r~n" + &
"~t~t contracted_entity   numeric (8, 0) NULL,~r~n" + &
"~t~t facility_name   varchar (150) NULL,~r~n" + &
"~t~t custom_date1   datetime  NULL,~r~n" + &
"~t~t custom_date2   datetime  NULL,~r~n" + &
"~t~t custom_date3   datetime  NULL,~r~n" + &
"~t~t custom_date4   datetime  NULL,~r~n" + &
"~t~t custom_date5   datetime  NULL,~r~n" + &
"~t~t inserted_by_user   varchar (128) NULL,~r~n" + &
"~t~t inserted_at_date_time   datetime  NULL,~r~n" + &
"~t~t updated_by_user   varchar (128) NULL,~r~n" + &
"~t~t updated_at_date_time   datetime  NULL,~r~n" + &
"~t~t custom_11   varchar (255) NULL,~r~n" + &
"~t~t custom_12   varchar (255) NULL,~r~n" + &
"~t~t custom_13   varchar (255) NULL,~r~n" + &
"~t~t custom_14   varchar (255) NULL,~r~n" + &
"~t~t custom_15   varchar (255) NULL,~r~n" + &
"~t~t custom_16   varchar (255) NULL,~r~n" + &
"~t~t custom_17   varchar (255) NULL,~r~n" + &
"~t~t custom_18   varchar (255) NULL,~r~n" + &
"~t~t custom_19   varchar (255) NULL,~r~n" + &
"~t~t custom_20   varchar (255) NULL,~r~n" + &
"~t~t custom_date6   datetime  NULL,~r~n" + &
"~t~t custom_date7   datetime  NULL,~r~n" + &
"~t~t custom_date8   datetime  NULL,~r~n" + &
"~t~t custom_date9   datetime  NULL,~r~n" + &
"~t~t custom_date10   datetime  NULL,~r~n" + &
"~t~t custom_date11   datetime  NULL,~r~n" + &
"~t~t custom_date12   datetime  NULL,~r~n" + &
"~t~t custom_date13   datetime  NULL,~r~n" + &
"~t~t custom_date14   datetime  NULL,~r~n" + &
"~t~t custom_date15   datetime  NULL,~r~n" + &
"~t~t custom_n1   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n2   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n3   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n4   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n5   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n6   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n7   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n8   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n9   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n10   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n11   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n12   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n13   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n14   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n15   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n16   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n17   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n18   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n19   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n20   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n21   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n22   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n23   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n24   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n25   numeric (12, 2) NULL,~r~n" + &
"~t~t version_number   varchar (15) NULL,~r~n" + &
"~t~t version_date   datetime  NULL,~r~n" + &
"~t~t master_contract_name   varchar (255) NULL,~r~n" + &
"~t~t fee_sched_calc_field_1   money  NULL,~r~n" + &
"~t~t fee_sched_calc_field_2   money  NULL,~r~n" + &
"~t~t fee_sched_calc_field_3   money  NULL,~r~n" + &
"~t~t access   varchar (1) NULL,~r~n" + &
"~t~t status_name    nvarchar (max) NULL,~r~n" + &
"~t~t category_name    nvarchar (max) NULL,~r~n" + &
"~t~t contract_type_name    nvarchar (max) NULL,~r~n" + &
"~t~t dvision_name    nvarchar (max) NULL,~r~n" + &
"~t~t unread_email_cnt   int  NOT NULL,~r~n" + &
"~t~t custom_percent_1   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_2   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_3   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_4   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_5   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_6   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_7   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_8   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_9   numeric (12, 4) NULL,~r~n" + &
"~t~t custom_percent_10   numeric (12, 4) NULL,~r~n" + &
"~t~t work_flow_n1   numeric (12, 2) NULL,~r~n" + &
"~t~t work_flow_n2   numeric (12, 2) NULL,~r~n" + &
"~t~t work_flow_n3   numeric (12, 2) NULL,~r~n" + &
"~t~t work_flow_n4   numeric (12, 2) NULL,~r~n" + &
"~t~t work_flow_n5   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_status1   int  NULL,~r~n" + &
"~t~t custom_status2   int  NULL,~r~n" + &
"~t~t custom_21   varchar (255) NULL,~r~n" + &
"~t~t custom_22   varchar (255) NULL,~r~n" + &
"~t~t custom_n26   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_n27   numeric (12, 2) NULL,~r~n" + &
"~t~t custom_date16   datetime  NULL,~r~n" + &
"~t~t custom_date17   datetime  NULL,~r~n" + &
"~t~t city   varchar (35) NULL,~r~n" + &
"~t~t state   varchar (5) NULL,~r~n" + &
"~t~t country   numeric (8, 0) NULL,~r~n" + &
"~t~t zip   varchar (12) NULL,~r~n" + &
"~t~t street   varchar (150) NULL,~r~n" + &
"~t~t custom2_custom_1   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_2   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_3   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_4   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_5   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_6   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_7   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_8   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_9   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_10   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_11   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_12   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_13   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_14   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_15   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_16   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_17   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_18   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_19   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_20   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_date1   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date2   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date3   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date4   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date5   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date6   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date7   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date8   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date9   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date10   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date11   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date12   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date13   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date14   datetime  NULL,~r~n" + &
"~t~t custom2_custom_date15   datetime  NULL,~r~n" + &
"~t~t custom2_custom_n1   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n2   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n3   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n4   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n5   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n6   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n7   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n8   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n9   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n10   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n11   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n12   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n13   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n14   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n15   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n16   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n17   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n18   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n19   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n20   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n21   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n22   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n23   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n24   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_n25   numeric (12, 2) NULL,~r~n" + &
"~t~t custom2_custom_21   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_22   varchar (255) NULL,~r~n" + &
"~t~t custom2_custom_notes_1   varchar (8000) NULL,~r~n" + &
"~t~t custom2_custom_notes_2   varchar (8000) NULL,~r~n" + &
"~t~t custom2_custom_notes_3   varchar (8000) NULL,~r~n" + &
"~t~t custom2_custom_notes_4   varchar (8000) NULL,~r~n" + &
"~t~t custom2_custom_notes_5   varchar (8000) NULL,~r~n" + &
"~t~t custom2_custom_money_1   money  NULL,~r~n" + &
"~t~t custom2_custom_money_2   money  NULL,~r~n" + &
"~t~t custom2_custom_money_3   money  NULL,~r~n" + &
"~t~t custom2_custom_percent_1   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_2   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_3   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_4   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_5   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_6   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_7   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_8   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_9   numeric (12, 4) NULL,~r~n" + &
"~t~t custom2_custom_percent_10   numeric (12, 4) NULL,~r~n" + &
"~t~t has_docs   int  NOT NULL,~r~n" + &
"~t~t contract_department   numeric (6, 0) NULL,~r~n" + &
"~t~t occi_name   nvarchar (max) NULL,~r~n" + &
"~t~t ccci_name   nvarchar (max) NULL ) ~r~n  " + &
"end"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"If Not  Exists ( select * from sysindexes where name = N'IX_ctx_basic_info_pagedata' and id = OBJECT_ID( N'ctx_basic_info_pagedata' ) ) ~r~n" + &
" Begin ~r~n" + &
"~t  CREATE CLUSTERED INDEX IX_ctx_basic_info_pagedata ON ctx_basic_info_pagedata~r~n" + &
"~t(~r~n" + &
"~t~tctx_id ASC~r~n" + &
"~t) ON [PRIMARY]~r~n" + &
"END~r~n" + &
""



is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from sysobjects where name = 'ctx_basic_info_users' and type = 'U') ~r~n" + &
"begin~r~n" + &
"CREATE TABLE  ctx_basic_info_users (~r~n" + &
"~t ctx_id   numeric (10, 0) NOT NULL,~r~n" + &
"~t user_id   varchar (10) NOT NULL,~r~n" + &
"~t access   varchar (1) NULL,~r~n" + &
" CONSTRAINT  PK_ctx_basic_info_users  PRIMARY KEY ( ctx_id  , user_id  )~r~n" + &
" )~r~n" + &
"end"


//Added By Mark Lee 01/16/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from sysobjects where name = 'page_text_settings' and type = 'U') ~r~n" + &
"begin~r~n" + &
"CREATE TABLE  page_text_settings(~r~n" + &
"~tsettings_id int NOT NULL,~r~n" + &
"~tpage_name nvarchar(50) NULL,~r~n" + &
"~telement_name nvarchar(50) NULL,~r~n" + &
"~telement_text nvarchar(4000) NULL,~r~n" + &
"~tCONSTRAINT PK_page_text_settings PRIMARY KEY CLUSTERED( settings_id ASC ) ~r~n" + &
") ~r~n"+&
"end"

//Added By Ken.Guo 2015-06-18
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='trigger_wf' and t.name='import_hdr'~tand t.type = 'U')~r~n" + &
"	Alter table import_hdr add  trigger_wf integer null~r~n"

//Added By Ken.Guo 2015-07-13
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='set_word_safemode' and t.name='icred_settings' and t.type = 'U') " + &
"alter table icred_settings add set_word_safemode int null "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='unload_word_addins' and t.name='icred_settings' and t.type = 'U') " + &
"alter table icred_settings add unload_word_addins int null "

//Added By Mark Lee 07/14/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted' and t.name='ctx_acp_clause'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_clause add  deleted char(1) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted_by' and t.name='ctx_acp_clause'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_clause add  deleted_by varchar(50) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted_date' and t.name='ctx_acp_clause'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_clause add  deleted_date datetime null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted' and t.name='ctx_acp_template'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_template add  deleted char(1) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted_by' and t.name='ctx_acp_template'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_template add  deleted_by varchar(50) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted_date' and t.name='ctx_acp_template'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_template add  deleted_date datetime null~r~n"

//ctx_acp_folder
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted' and t.name='ctx_acp_folder'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_folder add  deleted char(1) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted_by' and t.name='ctx_acp_folder'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_folder add  deleted_by varchar(50) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='deleted_date' and t.name='ctx_acp_folder'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_acp_folder add  deleted_date datetime null~r~n"

//Added By Jay Chen 07-17-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from sysobjects where name = 'ctx_screen_field_tips' and type = 'U') ~r~n" + &
"begin~r~n" + &
"CREATE TABLE  ctx_screen_field_tips(~r~n" + &
"   view_id int NOT NULL,~r~n" + &
"   screen_id int NOT NULL,~r~n" + &
"   field_name varchar(50) NOT NULL,~r~n" + &
"   field_tip varchar(1000) NULL,~r~n" + &
" CONSTRAINT  PK_ctx_screen_field_tips  PRIMARY KEY ( view_id,screen_id,field_name)~r~n" + &
") ~r~n"+&
"end"

//Added By Jay Chen 07-20-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='show_column_tip' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add show_column_tip char(1) null~r~n"

//Added By Mark Lee 07/23/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='clause_update_prompt' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add clause_update_prompt char(1) null~r~n"

//Added By Jay Chen 08-03-2015
string ls_custom,ls_custom_n
int i
for i = 26 to 50
	ls_custom = 'custom_' + string(i)
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select 1 from syscolumns c, sysobjects t   ~r~n" + &
	"where c.id=t.id  and c.name='"+ls_custom+"'  and t.name='ctx_custom' and t.type = 'U')~r~n" + &
	"ALTER table ctx_custom add "+ls_custom+" varchar(255) null  ~r~n"
next
for i = 26 to 50
	ls_custom_n = 'custom_n' + string(i)
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select 1 from syscolumns c, sysobjects t   ~r~n" + &
	"where c.id=t.id  and c.name='"+ls_custom_n+"'  and t.name='ctx_custom' and t.type = 'U')~r~n" + &
	"ALTER table ctx_custom add "+ls_custom_n+"  numeric(12, 2) null  ~r~n"
next

//Added By Jay Chen 08-05-2015
for i = 1 to 10
	ls_custom = 'custom_' + string(i)
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select 1 from syscolumns c, sysobjects t   ~r~n" + &
	"where c.id=t.id  and c.name='"+ls_custom+"'  and t.name='app_facility' and t.type = 'U')~r~n" + &
	"ALTER table app_facility add "+ls_custom+" varchar(255) null  ~r~n"
next

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='field_falg' and t.name='ctx_contact_custom_config'~tand t.type = 'U')~r~n" + &
" alter table ctx_contact_custom_config add field_falg char(1) null "

//Added By Ken.Guo 2015-08-05
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='roles_can_view' and t.name='conv_view'~tand t.type = 'U')~r~n" + &
" alter table conv_view add roles_can_view varchar(2000) null "

//Added By Jay Chen 08-06-2015
string ls_custom_notes
for i = 51 to 75
	ls_custom = 'custom_' + string(i)
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select 1 from syscolumns c, sysobjects t   ~r~n" + &
	"where c.id=t.id  and c.name='"+ls_custom+"'  and t.name='ctx_custom' and t.type = 'U')~r~n" + &
	"ALTER table ctx_custom add "+ls_custom+" varchar(255) null  ~r~n"
next
for i = 51 to 70
	ls_custom_n = 'custom_n' + string(i)
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select 1 from syscolumns c, sysobjects t   ~r~n" + &
	"where c.id=t.id  and c.name='"+ls_custom_n+"'  and t.name='ctx_custom' and t.type = 'U')~r~n" + &
	"ALTER table ctx_custom add "+ls_custom_n+"  numeric(12, 2) null  ~r~n"
next
for i = 6 to 10
	ls_custom_notes = 'custom_notes_' + string(i)
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select 1 from syscolumns c, sysobjects t   ~r~n" + &
	"where c.id=t.id  and c.name='"+ls_custom_notes+"'  and t.name='ctx_custom' and t.type = 'U')~r~n" + &
	"ALTER table ctx_custom add "+ls_custom_notes+"  varchar(8000) null  ~r~n"
next

//Added By Mark Lee 08/19/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='issuser' and t.name='idp_servers'~tand t.type = 'U')~r~n" + &
"	Alter table idp_servers alter column issuser varchar(200) ~r~n"

//Added By Mark Lee 08/26/2015
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
" where c.id=t.id  and c.name='col_label' and t.name='request_webform_detail'	and t.type = 'U')~r~n" + &
 " alter table request_webform_detail alter column col_label varchar(500) null "
 
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='clause_update_template' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add clause_update_template char(1) null~r~n"

//Added By Jay Chen 08-31-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from sysobjects where name = 'ctx_clause_email' and type = 'U') ~r~n" + &
"begin~r~n" + &
"CREATE TABLE  ctx_clause_email(~r~n" + &
"	email_id   INT NOT NULL, ~r~n" + &
"	email_name VARCHAR (100), ~r~n" + &
"	subject    VARCHAR (255), ~r~n" + &
"	email_msg  TEXT, ~r~n" + &
"	export_id  INT,~r~n" + &
"	email_message IMAGE,~r~n" + &
"	auto_sign  VARCHAR (1),~r~n" + &
"	email_to   VARCHAR (2000),~r~n" + &
"	email_cc   VARCHAR (2000),~r~n" + &
"	email_type VARCHAR (1),~r~n" + &
"	email_enable VARCHAR (1)~r~n" + &
" CONSTRAINT  PK_ctx_clause_email  PRIMARY KEY ( email_id)~r~n" + &
") ~r~n"+&
"end"

//Added By Mark Lee 09/11/2015
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ctx_doc_type' and t.name='request_form_document'~tand t.type = 'U')~r~n" + &
"	Alter table request_form_document add ctx_doc_type varchar(30) null~r~n"
  
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ctx_doc_type' and t.name='request_webform_document'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_document add ctx_doc_type varchar(30) null~r~n"
  
  //Added By Mark Lee 09/22/2015
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='col_decimal_value' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE request_webform_detail ALTER COLUMN col_decimal_value DECIMAL(16,6)~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from sysobjects where name = 'column_visibility_settings' and type = 'U') ~r~n" + &
"BEGIN~r~n" + &
"~tCREATE TABLE column_visibility_settings(~r~n" + &
"~t~tsettings_id int NOT NULL,~r~n" + &
"~t~tlist_name nvarchar(50) NULL,~r~n" + &
"~t~tcolumn_name nvarchar(50) NULL,~r~n" + &
"~t~tvisibility int NULL,~r~n" + &
"~t~tCONSTRAINT PK_column_visibility_settings PRIMARY KEY CLUSTERED (settings_id ASC)~r~n" + &
"~t)~r~n" + &
"END"

//Added By Mark Lee 10/22/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='admin' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	Alter table request_form alter column  admin varchar(2000) null~r~n"

//Added By Jay Chen 10-27-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='sync_screen_contact' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add sync_screen_contact char(1) null~r~n"

//Added By Jay Chen 10-29-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='filter_company_contact' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add filter_company_contact char(1) null~r~n"
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='status' and t.name='app_facility'~tand t.type = 'U')~r~n" + &
"	Alter table app_facility add status char(1) null~r~n"
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='status' and t.name='ctx_contacts'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_contacts add status char(1) null~r~n"

//Added by Gavins 20151106
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='clx_weblink' and t.name='icred_settings' and t.type = 'U') " + &
"alter table icred_settings add clx_weblink varchar(200) null "

//Added By Mark Lee 11/12/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='use_default' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  use_default integer null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='default_value' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  default_value varchar(30) null~r~n"

//Added By Jay Chen 11-17-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='requester_user_d' and t.name='ctx_contacts'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_contacts add requester_user_d varchar(50) null~r~n"
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='contact_type' and t.name='user_requester'~tand t.type = 'U')~r~n" + &
"	Alter table user_requester add contact_type varchar(1) null~r~n"
//Added By Jay Chen 11-25-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='facility_id' and t.name='user_requester'~tand t.type = 'U')~r~n" + &
"	Alter table user_requester add facility_id int null~r~n"

//Added By Ken.Guo 2015-11-26
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='data_from' and t.name='ctx_screen_datafill'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_screen_datafill add data_from varchar(100) null~r~n"

//Added By Jay Chen 12-23-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"~tif not exists(select 1 from sysobjects where name = 'screen_field_select_item' and type = 'U')~r~n" + &
"~tBegin~r~n" + &
"~t~tCreate Table screen_field_select_item~r~n" + &
"~t~t(~r~n" + &
"~t~t~tid  numeric(10,0) identity  not null,~r~n" + &
"~t~t~tview_id int not null,~r~n" + &
"~t~t~tscreen_id int not null,~r~n" + &
"~t~t~tctx_id int not null,~r~n" + &
"~t~t~tfield_name varchar(50) not null,~r~n" + &
"~t~t~tfield_data varchar(50) not null,~r~n" + &
"~t~t~tconstraint PK_screen_field_select_item primary key (id)~r~n" + &
"~t~t)~r~n" + &
"~tEnd "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"~tif not exists(select 1 from sysobjects where name = 'screen_field_select_item_attribute' and type = 'U')~r~n" + &
"~tBegin~r~n" + &
"~t~tCreate Table screen_field_select_item_attribute~r~n" + &
"~t~t(~r~n" + &
"~t~t~tview_id int not null,~r~n" + &
"~t~t~tscreen_id int not null,~r~n" + &
"~t~t~tobject_name varchar(50) not null,~r~n" + &
"~t~t~tobject_type varchar(50) not null,~r~n" + &
"~t~t~tobject_format varchar(50) null,~r~n" + &
"~t~t~tconstraint PK_screen_field_select_item_attribute primary key (view_id,screen_id,object_name)~r~n" + &
"~t~t)~r~n" + &
"~tEnd "

//Added By Jay Chen 12-30-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='add_doc_merge' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add add_doc_merge char(1) null~r~n"

//Added By Mark Lee 01/08/2016
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='object_type' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  object_type varchar(50) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='multi_select_text' and t.name='request_webform_detail'~tand t.type = 'U')~r~n" + &
"	Alter table request_webform_detail add  multi_select_text VARCHAR(8000) null~r~n"

//Added By Ken.Guo 2016-01-11
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='comments' and t.name='security_login_tracking'~tand t.type = 'U')~r~n" + &
"	Alter table security_login_tracking add  comments VARCHAR(2000) null~r~n"

//Added By Jay Chen 02-03-2016
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='esign_client_id' and t.name='personal_license_setting'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE personal_license_setting add esign_client_id varchar(200) null~r~n"
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='esign_client_secret' and t.name='personal_license_setting'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE personal_license_setting add esign_client_secret varchar(200) null~r~n"
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='esign_access_token' and t.name='personal_license_setting'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE personal_license_setting add esign_access_token varchar(200) null~r~n"
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='esign_refresh_token' and t.name='personal_license_setting'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE personal_license_setting add esign_refresh_token varchar(200) null~r~n"
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='esign_token_date' and t.name='personal_license_setting'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE personal_license_setting add esign_token_date datetime null~r~n"

//Added By Jay Chen 02-04-2016
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='track_document_change' and t.name='icred_settings' and t.type = 'U') " + &
"alter table icred_settings add track_document_change char(1) null "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='echosign_method' and t.name='icred_settings' and t.type = 'U') " + &
"alter table icred_settings add echosign_method varchar(20) null "

//Added By Jay Chen 02-17-2016
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(	select 1 from syscolumns c, sysobjects t   ~r~n" + &
"where c.id=t.id  and c.name='echosign_method' and t.name='ctx_am_document' and t.type = 'U')~r~n" + &
"ALTER table ctx_am_document add echosign_method varchar(20) null  ~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(	select 1 from syscolumns c, sysobjects t   ~r~n" + &
"where c.id=t.id  and c.name='echosign_method' and t.name='ctx_am_doc_audit'	and t.type = 'U')~r~n" + &
"ALTER table ctx_am_doc_audit add echosign_method varchar(20) null  ~r~n"

//Added By Jay Chen 02-23-2016
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'esign_download_file' )~r~n" + &
"~tCreate Table esign_download_file ~r~n" + &
"~t(~r~n" + &
"~t~tdownloadId  numeric(10,0) identity  not null,~r~n" + &
"~t~tagreementId varchar(500),~r~n" + &
"~t~tdocumentId varchar(500),~r~n" + &
"~t~tdocumentData IMAGE null,~r~n" + &
"~t~tuserId varchar(20) null,~r~n" + &
"~t~tdateTime datetime null~r~n" + &
"~t~tPrimary Key(downloadId)~r~n" + &
"~t)~r~n" + &
""

//Added By Jay Chen 03-08-2016
for i = 71 to 100
	ls_custom_n = 'custom_n' + string(i)
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select 1 from syscolumns c, sysobjects t   ~r~n" + &
	"where c.id=t.id  and c.name='"+ls_custom_n+"'  and t.name='ctx_custom' and t.type = 'U')~r~n" + &
	"ALTER table ctx_custom add "+ls_custom_n+"  numeric(20, 10) null  ~r~n"
next
//Modified by gaivins 20160527   In regards to Task 542 – We want to remove the 10 new fields with 20 digit length from Fee Schedule (NM) but keep the 30 new fields with 20 digit length in Custom Data 2.  
//for i = 6 to 15
//	ls_custom_n = 'custom_n' + string(i)
//	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//	"if not exists(select 1 from syscolumns c, sysobjects t   ~r~n" + &
//	"where c.id=t.id  and c.name='"+ls_custom_n+"'  and t.name='ctx_fee_sched_nm' and t.type = 'U')~r~n" + &
//	"ALTER table ctx_fee_sched_nm add "+ls_custom_n+"  numeric(20, 10) null  ~r~n"
//next

//Added By Mark Lee 03/11/2016
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='multi_allow' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE request_form ADD multi_allow  varchar(500) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='cbx_display' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE request_form ADD cbx_display int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='multi_allow' and t.name='request_webform'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE request_webform ADD multi_allow  varchar(500) null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='cbx_display' and t.name='request_webform'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE request_webform ADD cbx_display int null~r~n"
 
 //Added By Mark Lee 03/31/2016
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='edit_company' and t.name='request_form'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE request_form ADD edit_company int null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='edit_company' and t.name='request_webform'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE request_webform ADD edit_company  int null~r~n"

//Added By Ken.Guo 2016-04-05
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='notify_user_dm' and t.name='icred_settings' and t.type = 'U') " + &
"alter table icred_settings add notify_user_dm int null "
 
//Added By Ken.Guo 2016-04-22
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='triggered_ai_changed_wf' and t.name='ctx_am_image_approve_detail' and t.type = 'U') " + &
"alter table ctx_am_image_approve_detail add triggered_ai_changed_wf int null "
 
 //Added By Mark Lee 04/27/2016
  is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='workflow_userid' and t.name='ctx_am_image_approve_detail'~tand t.type = 'U')~r~n" + &
"	ALTER TABLE ctx_am_image_approve_detail ADD workflow_userid varchar(50) null~r~n"

//Added By Ken.Guo 2016-05-27
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='triggered_ai_changed_wf' and t.name='ctx_am_image_approve' and t.type = 'U') " + &
"alter table ctx_am_image_approve add triggered_ai_changed_wf int null "
 
 //Added By Ken.Guo 2016-06-15
   is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ad_status' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  ad_status integer null~r~n"
 
  is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ad_server' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  ad_server varchar(100) null~r~n"
 
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ad_user' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  ad_user varchar(100) null~r~n"

 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ad_password' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  ad_password varchar(100) null~r~n"

   is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ad_save_pwd' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  ad_save_pwd integer null~r~n"
 
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ad_pc_domainname' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  ad_pc_domainname varchar(100) null~r~n"

 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='ad_pc_username' and t.name='security_users'~tand t.type = 'U')~r~n" + &
"	Alter table security_users add  ad_pc_username varchar(100) null~r~n"

 //Added By Ken.Guo 2016-06-27
  is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='use_ad_password' and t.name='em_smtp_accounts'~tand t.type = 'U')~r~n" + &
"	Alter table em_smtp_accounts add  use_ad_password integer null~r~n"
 
 //Added By Jay 2016-07-21
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'wf_trigger_time_settings' )~r~n" + &
"~tCREATE TABLE wf_trigger_time_settings (~r~n" + &
"~tid int NOT NULL,~r~n" + &
"~ttimes_setting varchar(100)  NULL,~r~n" + &
"~ttime_option varchar(1000)  NULL~r~n" + &
"CONSTRAINT PK_wf_trigger_time_settings  PRIMARY KEY (id)~r~n" + &
") ON [PRIMARY]" + &
""
 
//Added By Ken.Guo 2016-08-16
  is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='field_use_compute' and t.name='ctx_screen_field_ex'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_screen_field_ex add  field_use_compute integer null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='field_compute_expression' and t.name='ctx_screen_field_ex'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_screen_field_ex add  field_compute_expression varchar(2000) null~r~n"
 
//Added by gavins 20160817 
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
 " if not exists(select 1 from syscolumns c, sysobjects t  ~r~n" + &
" ~twhere c.id=t.id  and c.name='visible_expression' and t.name='request_form_detail' and t.type = 'U') ~r~n" + &
" ~tAlter table request_form_detail add visible_expression   varchar(2000) null  "
 
 //Added By Ken.Guo 2016-08-18
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
 "if not exists( select 1 from sysobjects where name = 'ctx_screen_field_compute' )~r~n" + &
"~tCreate Table ctx_screen_field_compute ~r~n" + &
"~t(~r~n" + &
"~t~tid  numeric(10,0) identity  not null,~r~n" + &
"~t~tview_id int not null,~r~n" + &
"~t~tscreen_id int not null,~r~n" + &
"~t~tturnon int,~r~n" + &
"~t~tfield_compute_conditions varchar(2000) null,~r~n" + &
"~t~tfield_compute_expression_true varchar(2000) null,~r~n" + &
"~t~tfield_compute_fields_true varchar(2000) null,~r~n" + &
"~t~tfield_compute_expression_false varchar(2000) null,~r~n" + &
"~t~tfield_compute_fields_false varchar(2000) null,~r~n" + &
"~t~tPrimary Key(id)~r~n" + &
"~t)~r~n" 
 
 //Added By Ken.Guo 2016-08-23
  is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'email_template_settings' )~r~n" + &
 " Create Table email_template_settings ~r~n" + &
"(~r~n" + &
"                id  numeric(10,0) identity  not null,~r~n" + &
"                email_type varchar(100) not null,~r~n" + &
"				email_template_id int null,~r~n" + &
"                Primary Key(id)~r~n" + &
")~r~n" + &
""

 //Added By Ken.Guo 2016-08-25
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='email_message_blob' and t.name='ctx_am_image_approve_detail'~tand t.type = 'U')~r~n" + &
" alter table ctx_am_image_approve_detail add email_message_blob image null "

 //Added By Ken.Guo 2016-08-26
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='subject' and t.name='ctx_am_image_approve_detail'~tand t.type = 'U')~r~n" + &
" alter table ctx_am_image_approve_detail add subject varchar(1000) null "

 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='email_template_id' and t.name='ctx_am_image_approve_detail'~tand t.type = 'U')~r~n" + &
" alter table ctx_am_image_approve_detail add email_template_id int null "

//Added by gavins 20160829
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='current_saml' and t.name='idp_servers'~tand t.type = 'U')~r~n" + &
" Alter table idp_servers add  current_saml varchar(10) null "
 
 //Added By Ken.Guo 2016-08-29. for Jimmy
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
 "IF object_id(N'request_webform_detail',N'U') is not null~r~n" + &
"~tBEGIN~r~n" + &
"~t~tIF col_length('request_webform_detail','visible_expression') is not null~r~n" + &
"~t~t~tBEGIN~r~n" + &
"~t~t~t~tALTER TABLE request_webform_detail ALTER COLUMN visible_expression varchar(2000)~r~n" + &
"~t~t~tEND~r~n" + &
"~t~tELSE~r~n" + &
"~t~t~tBEGIN~r~n" + &
"~t~t~t~tALTER TABLE request_webform_detail ADD visible_expression varchar(2000)~r~n" + &
"~t~t~tEND~r~n" + &
"~tEND"
 
 //Added by gavins 20160919
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='ctx_search_rows_per_page' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
" ALTER TABLE icred_settings ADD ctx_search_rows_per_page INT NULL "

//Added By Ken.Guo 2016-10-24
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='mail_cc' and t.name='ctx_am_image_approve'~tand t.type = 'U')~r~n" + &
" ALTER TABLE ctx_am_image_approve ADD mail_cc varchar(500) NULL "

 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='mail_cc_message' and t.name='ctx_am_image_approve'~tand t.type = 'U')~r~n" + &
" ALTER TABLE ctx_am_image_approve ADD mail_cc_message varchar(8000) NULL "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='mail_cc_message_image' and t.name='ctx_am_image_approve'~tand t.type = 'U')~r~n" + &
" ALTER TABLE ctx_am_image_approve ADD mail_cc_message_image image NULL "
 
  //Added by gavins 20161116 
  //ctx_basic_info.app_facility is of type numeric(5, 0)
//app_facility.facility_id is of type int
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
" if exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
" where c.id=t.id  and c.name='app_facility' and t.name='ctx_basic_info' and t.type = 'U') ~r~n" + &
"  ALTER TABLE ctx_basic_info  alter column app_facility numeric(10,0) null "

//Added By Ken.Guo 2016-11-21
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"where c.id=t.id  and c.name='delete_new_doc_local_file' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
" ALTER TABLE dbo.icred_settings ADD delete_new_doc_local_file INT NOT NULL DEFAULT 0"
 
 //Added By Ken.Guo 2016-12-22
  is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
" if not exists(select 1 from syscolumns c, sysobjects  t ~r~n" + &
" where c.id=t.id  and c.name='salesforceurl' and t.name='security_user_salesforce' and t.type = 'U')  ~r~n" + &
"  ALTER TABLE security_user_salesforce ADD salesforceurl varchar(500) NULL  "

//Added By Harry 2016-12-27 for task711
 is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='email_checkin' and t.name='icred_settings' and t.type = 'U') " + &
"ALTER TABLE icred_settings ADD email_checkin int  NOT NULL DEFAULT 0 "

//Added By Ken.Guo 2017-03-01 for task722
 is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='sort_expression' and t.name='ctx_screen_field_ex' and t.type = 'U') " + &
"ALTER TABLE ctx_screen_field_ex ADD sort_expression varchar(2000)  null  "

 is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select  1 from syscolumns c, sysobjects t where c.id=t.id and " + &
"   c.name='filter_expression' and t.name='ctx_screen_field_ex' and t.type = 'U') " + &
"ALTER TABLE ctx_screen_field_ex ADD filter_expression varchar(2000)  null  "

//Added By Ken.Guo 2017-03-07
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'option_value' and t.name = 'security_user_options' and t.type = 'U' )~r~n" + &
"alter table security_user_options alter column  option_value varchar(500) null ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'esign_client_id' and t.name = 'personal_license_setting' and t.type = 'U' )~r~n" + &
"alter table personal_license_setting alter column  esign_client_id varchar(500) null ~r~n" 

 is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'esign_client_secret' and t.name = 'personal_license_setting' and t.type = 'U' )~r~n" + &
"alter table personal_license_setting alter column  esign_client_secret varchar(500) null ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'esign_access_token' and t.name = 'personal_license_setting' and t.type = 'U' )~r~n" + &
"alter table personal_license_setting alter column  esign_access_token varchar(500) null ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'esign_refresh_token' and t.name = 'personal_license_setting' and t.type = 'U' )~r~n" + &
"alter table personal_license_setting alter column  esign_refresh_token varchar(500) null ~r~n" 
  
//Added By Ken.Guo 2017-03-09
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'esign_apicode' and t.name = 'personal_license_setting' and t.type = 'U' )~r~n" + &
"alter table personal_license_setting alter column  esign_apicode varchar(500) null ~r~n"   
   
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'es_apicode' and t.name = 'icred_settings' and t.type = 'U' )~r~n" + &
"alter table icred_settings alter column  es_apicode varchar(500) null ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'echo_apicode' and t.name = 'icred_settings' and t.type = 'U' )~r~n" + &
"alter table icred_settings alter column  echo_apicode varchar(500) null ~r~n"   
  
 
  //Added By Ken.Guo 2017-04-07 Taks 751
 is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if Not exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'field_label' and t.name = 'sys_audit' and t.type = 'U' )~r~n" + &
"alter table sys_audit add  field_label varchar(200) null ~r~n"   
  
 is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if Not exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'field_label_updatedate' and t.name = 'sys_audit' and t.type = 'U' )~r~n" + &
"alter table sys_audit add  field_label_updatedate datetime null ~r~n"   
  
//Added By Ken.Guo 2017-04-10   
  is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if Not exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'image_file' and t.name = 'Import_webform_detail' and t.type = 'U' )~r~n" + &
"alter table Import_webform_detail add  image_file  image null ~r~n"   
  
//Added By Harry 2017-04-11  Web requester project - merged
  is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if Not exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'submission_approver' and t.name = 'security_users' and t.type = 'U' )~r~n" + &
"alter table security_users add submission_approver int DEFAULT 0 ~r~n"  

  is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if Not exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'require_presubmission_approval' and t.name = 'request_form' and t.type = 'U' )~r~n" + &
"alter table request_form add require_presubmission_approval int DEFAULT 0 ~r~n"  

 is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if Not exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'advanced_security' and t.name = 'user_requester' and t.type = 'U' )~r~n" + &
"alter table user_requester add advanced_security int DEFAULT 0 ~r~n"  

 is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if Not exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'submission_approver' and t.name = 'user_requester' and t.type = 'U' )~r~n" + &
"alter table user_requester add submission_approver int DEFAULT 0 ~r~n"  

  is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'ctx_op_type' )~r~n" + &
 " Create Table ctx_op_type ~r~n" + &
"(~r~n" + &
"                ctx_op_type_id int  not null,~r~n" + &
"                lookup_name  varchar(35) not null,~r~n" + &
"                Primary Key(ctx_op_type_id)~r~n" + &
")~r~n" + &
""

  is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'user_requester_ctx_op_type_right' )~r~n" + &
 " Create Table user_requester_ctx_op_type_right ~r~n" + &
"(~r~n" + &
"                user_id varchar(50) NOT NULL,~r~n" + &
"                ctx_op_type_id int NOT NULL ,~r~n" + &
"                lookup_code numeric(6, 0) NOT NULL,~r~n" + &
"                rights varchar(2) NOT NULL,~r~n" + &
"                PRIMARY KEY (user_id, ctx_op_type_id, lookup_code)~r~n" + &
")~r~n" + &
""
//Ended Added 

//Added by Harry 2017-04-17 for task747
  is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if Not exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'export_cur_selected_doc' and t.name = 'icred_settings' and t.type = 'U' )~r~n" + &
"alter table icred_settings add export_cur_selected_doc int DEFAULT 0 ~r~n"  

//Added by Harry 2017-04-26
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'col_value' and t.name = 'import_webform_detail' and t.type = 'U' )~r~n" + &
"alter table import_webform_detail alter column col_value varchar(8000) null ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if  exists( select 1 from syscolumns c , sysobjects t ~r~n" + &
"where c.id = t.id and c.name = 'fvalues' and t.name = 'sys_notifications_sobject' and t.type = 'U' )~r~n" + &
"alter table sys_notifications_sobject alter column fvalues varchar(8000) null ~r~n" 

//Added by Harry 2017-05-02
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='auto_sync_salesforce' and t.name='import_hdr'~tand t.type = 'U')~r~n" + &
"	Alter table import_hdr add auto_sync_salesforce int null~r~n"


of_execute_sqls("of_ver150_release_table1")

Return 1
end function

public function integer of_ver150_release_trigger1 ();//====================================================================
// Function: of_ver150_release_trigger1
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

// added code here
//is_sql_statements[UpperBound(is_sql_statements) + 1] = &
//"if exists(select 1 from sysobjects where name = 'tri_ctx_custom_update' and type = 'TR') ~r~n" + &
//"	drop trigger tri_ctx_custom_update ~r~n" 

//of_execute_sqls("of_ver150_release_trigger1")


return 1
end function

public function integer of_ver150_release_view1 ();//====================================================================
// Function: of_ver150_release_view1
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
//Add SQL Here

//e.g.


//Added By Ken.Guo 09/15/2014
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"if exists(select 1 from sysobjects where name = 'v_users') ~r~n" + &
" drop view v_users"

is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"CREATE VIEW v_users AS~r~n" + &
"Select ~r~n" + &
"user_id,~r~n" + &
"user_fullname = user_name,~r~n" + &
"role_name = (select role_name from security_roles where security_roles.role_id = security_users.role_id),~r~n" + &
"email_address = email_id,~r~n" + &
"default_viewname = (select data_view_name from data_view where data_view.data_view_id = security_users.contract_default_view ),~r~n" + &
"readonly = ( Case readonly when 1 then 'True' else 'False' end  ),~r~n" + &
"run_mode = (Case autoexport when 0 then 'Normal Mode' when 1 then 'Automatic Export Mode'~r~n" + &
"~t~twhen 2 then 'Automatic OCR Mode' when 3 then 'Automatic Import Mode' when 4 then 'Automatic Report Mode' end),~r~n" + &
"account_is_disabled = (Case disabled_status when 1 then 'True' else 'False' end),~r~n" + &
"dynamic_search_tab = (Case dynamic_search_tab when 1 then 'True' else 'False' end),~r~n" + &
"run_date_alarm_on_login = (Case run_date_alarm when 1 then 'True' else 'False' end),~r~n" + &
"refresh_signature_data_on_login  = (Case refresh_sertifi when 1 then 'True' else 'False' end),~r~n" + &
"refresh_signature_data_on_dm = (Case refresh_sertifi_dm when 1 then 'True' else 'False' end),~r~n" + &
"check_email_on_login = (Case check_email when 1 then 'True' else 'False' end),~r~n" + &
"last_login_date = (select top 1 log_date from security_login_tracking where security_login_tracking.user_id = security_users.user_id ~r~n" + &
"~t~t~tand security_login_tracking.pass_fail = 'PASS' order by security_login_tracking.log_date desc ),~r~n" + &
"groups_name = ~r~n" + &
"(~r~n" + &
"Select ~r~n" + &
"Stuff(Replace(Replace(~r~n" + &
"(Select security_groups.group_name From security_group_users,security_groups~r~n" + &
"~t~t~tWhere security_users.user_id = security_group_users.user_id~r~n" + &
"~t~t~tAnd  security_groups.id = security_group_users.group_id FOR XML AUTO)~r~n" + &
",'<security_groups group_name=~"',';'),'~"/>',''),1,1,'')~r~n" + &
")~r~n" + &
"From security_users"

//Added By Jay Chen 03-24-2015  add contract_department
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"if exists(select 1 from sysobjects where name = 'v_ctx_basic_info') ~r~n" + &
" drop view v_ctx_basic_info"
//Added By Mark Lee 08/11/2015 add other datetime column 
//Modified By Ken.Guo 2017-06-12. added custom percent columns.
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"CREATE VIEW v_ctx_basic_info AS~r~n" + &
"SELECT TOP 100 percent~r~n" + &
"       app_facility.facility_name AS Company_Name,~r~n" + &
"       app_facility.street AS Company_street_1,~r~n" + &
"       app_facility.street_2 AS Company_street_2,~r~n" + &
"       app_facility.city AS Company_city,~r~n" + &
"       app_facility.state AS Company_state,~r~n" + &
"       app_facility.zip AS Company_zip,~r~n" + &
"       app_facility.country AS Company_country,~r~n" + &
"       app_facility.phone AS Company_phone,~r~n" + &
"       app_facility.fax AS Company_fax,~r~n" + &
"       app_facility.web_address AS Company_web_address,~r~n" + &
"       app_facility.contact_type2 AS Company_contact_type2,~r~n" + &
"       app_facility.corp_office_flag AS Company_corp_office_flag,~r~n" + &
"       app_facility.corp_office_link AS Company_corp_office_link,~r~n" + &
"       code_lookup.code AS Contract_Category_code,~r~n" + &
"       code_lookup.description AS Contract_Category_description,~r~n" + &
"       code_lookup_1.code AS Contract_Status_code,~r~n" + &
"       code_lookup_2.code AS contract_type_code,~r~n" + &
"       code_lookup_2.description AS contract_type_Description,~r~n" + &
"       code_lookup_3.code AS term_reason_code,~r~n" + &
"       code_lookup_3.description AS term_Reason_Desciption,~r~n" + &
"       code_lookup_4.description AS product_type_desc,~r~n" + &
"       code_lookup_4.code AS product_type_code,~r~n" + &
"       code_lookup_5.code AS product_code,~r~n" + &
"       code_lookup_5.description AS product_description,~r~n" + &
"       ctx_basic_info.ctx_id,~r~n" + &
"       ctx_basic_info.category,~r~n" + &
"       ctx_basic_info.status,~r~n" + &
"       ctx_basic_info.facility_id,~r~n" + &
"       ctx_basic_info.contract_type,~r~n" + &
"       ctx_basic_info.product_type,~r~n" + &
"       ctx_basic_info.product_name,~r~n" + &
"       ctx_basic_info.reimbursment_menth,~r~n" + &
"       ctx_basic_info.file_location,~r~n" + &
"       ctx_basic_info.effective_date,~r~n" + &
"       ctx_basic_info.expriation_date,~r~n" + &
"       ctx_basic_info.review_date,~r~n" + &
"       ctx_basic_info.review_by,~r~n" + &
"       ctx_basic_info.term_date,~r~n" + &
"       ctx_basic_info.term_reason,~r~n" + &
"       ctx_basic_info.last_revis_date,~r~n" + &
"       ctx_basic_info.other_date_1,~r~n" + &
"       ctx_basic_info.other_date_2,~r~n" + &
"       ctx_basic_info.oc_signed_by,~r~n" + &
"       ctx_basic_info.oc_title,~r~n" + &
"       ctx_basic_info.oc_department,~r~n" + &
"       ctx_basic_info.oc_legal_rep,~r~n" + &
"       ctx_basic_info.cc_signed_by,~r~n" + &
"       ctx_basic_info.cc_title,~r~n" + &
"       ctx_basic_info.cc_department,~r~n" + &
"       ctx_basic_info.cc_legal_rep,~r~n" + &
"       ctx_basic_info.keyword,~r~n" + &
"       ctx_basic_info.dvision,~r~n" + &
"       ctx_basic_info.custom_1,~r~n" + &
"       ctx_basic_info.custom_2,~r~n" + &
"       ctx_basic_info.custom_3,~r~n" + &
"       ctx_basic_info.custom_4,~r~n" + &
"       ctx_basic_info.custom_5,~r~n" + &
"       ctx_basic_info.custom_6,~r~n" + &
"       ctx_basic_info.custom_7,~r~n" + &
"       ctx_basic_info.custom_8,~r~n" + &
"       ctx_basic_info.custom_9,~r~n" + &
"       ctx_basic_info.custom_10,~r~n" + &
"       ctx_basic_info.group_multi_loc_id,~r~n" + &
"       ctx_basic_info.revision_reason,~r~n" + &
"       ctx_basic_info.group_id,~r~n" + &
"       ctx_basic_info.record_id,~r~n" + &
"       ctx_basic_info.custom_11,~r~n" + &
"       ctx_basic_info.custom_12,~r~n" + &
"       ctx_basic_info.custom_13,~r~n" + &
"       ctx_basic_info.custom_14,~r~n" + &
"       ctx_basic_info.custom_15,~r~n" + &
"       ctx_basic_info.custom_16,~r~n" + &
"       ctx_basic_info.custom_17,~r~n" + &
"       ctx_basic_info.custom_18,~r~n" + &
"       ctx_basic_info.custom_19,~r~n" + &
"       ctx_basic_info.custom_20,~r~n" + &
"       ctx_basic_info.custom_21,~r~n" + &
"       ctx_basic_info.custom_22,~r~n" + &
"       ctx_basic_info.custom_date1,~r~n" + &
"       ctx_basic_info.custom_date2,~r~n" + &
"       ctx_basic_info.custom_date3,~r~n" + &
"       ctx_basic_info.custom_date4,~r~n" + &
"       ctx_basic_info.custom_date5,~r~n" + &
"       ctx_basic_info.custom_date6,~r~n" + &
"       ctx_basic_info.custom_date7,~r~n" + &
"       ctx_basic_info.custom_date8,~r~n" + &
"       ctx_basic_info.custom_date9,~r~n" + &
"       ctx_basic_info.custom_date10,~r~n" + &
"	    ctx_basic_info.custom_date11,~r~n" + &
"	    ctx_basic_info.custom_date12,~r~n" + &
"	    ctx_basic_info.custom_date13,~r~n" + &
"	    ctx_basic_info.custom_date14,~r~n" + &
"	    ctx_basic_info.custom_date15,~r~n" + &
"       ctx_basic_info.custom_date16,~r~n" + &
"       ctx_basic_info.custom_date17,~r~n" + &
"       ctx_basic_info.custom_n1,~r~n" + &
"       ctx_basic_info.custom_n2,~r~n" + &
"       ctx_basic_info.custom_n3,~r~n" + &
"       ctx_basic_info.custom_n4,~r~n" + &
"       ctx_basic_info.custom_n5,~r~n" + &
"       ctx_basic_info.custom_n6,~r~n" + &
"       ctx_basic_info.custom_n7,~r~n" + &
"       ctx_basic_info.custom_n8,~r~n" + &
"       ctx_basic_info.custom_n9,~r~n" + &
"       ctx_basic_info.custom_n10,~r~n" + &
"       ctx_basic_info.custom_n11,~r~n" + &
"       ctx_basic_info.custom_n12,~r~n" + &
"       ctx_basic_info.custom_n13,~r~n" + &
"       ctx_basic_info.custom_n14,~r~n" + &
"       ctx_basic_info.custom_n15,~r~n" + &
"       ctx_basic_info.custom_n16,~r~n" + &
"       ctx_basic_info.custom_n17,~r~n" + &
"       ctx_basic_info.custom_n18,~r~n" + &
"       ctx_basic_info.custom_n19,~r~n" + &
"       ctx_basic_info.custom_n20,~r~n" + &
"       ctx_basic_info.custom_n21,~r~n" + &
"       ctx_basic_info.custom_n22,~r~n" + &
"       ctx_basic_info.custom_n23,~r~n" + &
"       ctx_basic_info.custom_n24,~r~n" + &
"       ctx_basic_info.custom_n25,~r~n" + &
"       ctx_basic_info.custom_n26,~r~n" + &
"       ctx_basic_info.custom_n27,~r~n" + &
"       ctx_basic_info.custom_notes_1,~r~n" + &
"       ctx_basic_info.custom_notes_2,~r~n" + &
"       ctx_basic_info.custom_notes_3,~r~n" + &
"       ctx_basic_info.custom_notes_4,~r~n" + &
"       ctx_basic_info.custom_notes_5,~r~n" + &
"       ctx_basic_info.custom_percent_1,~r~n" + &
"       ctx_basic_info.custom_percent_2,~r~n" + &
"       ctx_basic_info.custom_percent_3,~r~n" + &
"       ctx_basic_info.custom_percent_4,~r~n" + &
"       ctx_basic_info.custom_percent_5,~r~n" + &
"       ctx_basic_info.custom_percent_6,~r~n" + &
"       ctx_basic_info.custom_percent_7,~r~n" + &
"       ctx_basic_info.custom_percent_8,~r~n" + &
"       ctx_basic_info.custom_percent_9,~r~n" + &
"       ctx_basic_info.custom_percent_10,~r~n" + &
"       ctx_basic_info.work_flow_n1,~r~n" + &
"       ctx_basic_info.work_flow_n2,~r~n" + &
"       ctx_basic_info.work_flow_n3,~r~n" + &
"       ctx_basic_info.work_flow_n4,~r~n" + &
"       ctx_basic_info.work_flow_n5,~r~n" + &
"       ctx_basic_info.custom_status1,~r~n" + &
"       ctx_basic_info.custom_status2,~r~n" + &
"       ctx_basic_info.salesforce_id,~r~n" + &
"       ctx_basic_info.version_number,~r~n" + &
"       ctx_basic_info.version_date,~r~n" + &
"       ctx_basic_info.notes,~r~n" + &
"       ctx_basic_info.app_facility,~r~n" + &
"       ctx_basic_info.master_contract_id AS master_ctx_id,~r~n" + &
"       ctx_basic_info.master_contract_name,~r~n" + &
"       code_lookup_6.code AS dvision_code,~r~n" + &
"       code_lookup_6.description AS dvision_description,~r~n" + &
"       ctx_basic_info.contract_department~r~n" + &
"  FROM (((((((ctx_basic_info LEFT OUTER JOIN code_lookup ON ctx_basic_info.category = code_lookup.lookup_code)~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_1 ON ctx_basic_info.status = code_lookup_1.lookup_code)~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_2 ON ctx_basic_info.contract_type = code_lookup_2.lookup_code)~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_3 ON ctx_basic_info.term_reason = code_lookup_3.lookup_code)~r~n" + &
"       Left OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id)~r~n" + &
"       Left OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id)~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_4 ON ctx_products.product_type = code_lookup_4.lookup_code)~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_5 ON ctx_products.product_id = code_lookup_5.lookup_code~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_6 ON ctx_basic_info.dvision = code_lookup_6.lookup_code~r~n" + &
"	WHERE ctx_basic_info.is_template = 0 ~r~n" + &
"ORDER BY ctx_basic_info.ctx_id"

//Added By Mark Lee 07/20/2015
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"if exists(select 1 from sysobjects where name = 'v_clause_library') ~r~n" + &
"drop view v_clause_library ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"Create View v_clause_library As    ~r~n" + &
"~tSELECT ctx_acp_clause_id as clause_id,      ~r~n" + &
"~t~trevision,          ~r~n" + &
"~t~tfolder_name = (select ctx_acp_folder.folder_name from ctx_acp_folder ~r~n" + &
"~t~t~twhere ctx_acp_folder.ctx_acp_folder_id = ctx_acp_clause.ctx_acp_folder_id ),           ~r~n" + &
"~t~tclause_name,~r~n" + &
"        approved_by as reviewed_by,             ~r~n" + &
"        date_approved as date_reviewed, ~r~n" + &
"        approval_status as review_status,               ~r~n" + &
"        category,       ~r~n" + &
"        checkout_by,    ~r~n" + &
"        checkout_date,     ~r~n" + &
"        temp_usage as template_usage,~r~n" + &
"        dm_usage as document_manager_usage,    ~r~n" + &
"        negotiated,~r~n" + &
"        negotiated_percent =  (Case when dm_usage is null then 0.00~r~n" + &
"~t~t~twhen dm_usage = 0 then  0.00~r~n" + &
"~t~t~tElse negotiated * 1.00 / dm_usage end )  , ~r~n" + &
"        description,    ~r~n" + &
"        information_message      ~r~n" + &
"~tFROM ctx_acp_clause~r~n" + &
"~tWhere (deleted is null Or deleted <> 'Y') "

//Added By Jay Chen 08-03-2015
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"if exists(select 1 from sysobjects where name = 'v_ctx_custom2') ~r~n" + &
" drop view v_ctx_custom2"

is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"CREATE VIEW v_ctx_custom2 ~r~n" + &
"AS ~r~n" + &
"SELECT     ctx_id, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, custom_7, custom_8, custom_9, custom_10, custom_11, custom_12,  ~r~n" + &
"                custom_13, custom_14, custom_15, custom_16, custom_17, custom_18, custom_19, custom_20, custom_date1, custom_date2, custom_date3,  ~r~n" + &
"                custom_date4, custom_date5, custom_date6, custom_date7, custom_date8, custom_date9, custom_date10, custom_date11, custom_date12,  ~r~n" + &
"                custom_date13, custom_date14, custom_date15, custom_n1, custom_n2, custom_n3, custom_n4, custom_n5, custom_n6, custom_n7, custom_n8,  ~r~n" + &
"                custom_n9, custom_n10, custom_n11, custom_n12, custom_n13, custom_n14, custom_n15, custom_n16, custom_n17, custom_n18, custom_n19,  ~r~n" + &
"                custom_n20, custom_n21, custom_n22, custom_n23, custom_n24, custom_n25, custom_21, custom_22, custom_notes_1, custom_notes_2,  ~r~n" + &
"                custom_notes_3, custom_notes_4, custom_notes_5, custom_money_1, custom_money_2, custom_money_3, custom_percent_1, custom_percent_2,  ~r~n" + &
"                custom_percent_3, custom_percent_4, custom_percent_5, custom_percent_6, custom_percent_7, custom_percent_8, custom_percent_9, custom_percent_10, ~r~n" + &
"                custom_26,custom_27,custom_28,custom_29,custom_30,custom_31,custom_32,custom_33,custom_34,custom_35,~r~n" + &
" 			    custom_36,custom_37,custom_38,custom_39,custom_40,custom_41,custom_42,custom_43,custom_44,custom_45, ~r~n" + &
" 			    custom_46,custom_47,custom_48,custom_49,custom_50,custom_n26,custom_n27,custom_n28,custom_n29,custom_n30, ~r~n" + &
" 			    custom_n31,custom_n32,custom_n33,custom_n34,custom_n35,custom_n36,custom_n37,custom_n38,custom_n39,custom_n40, ~r~n" + &
" 			    custom_n41,custom_n42,custom_n43,custom_n44,custom_n45,custom_n46,custom_n47,custom_n48,custom_n49,custom_n50, ~r~n" + &
" 			    custom_51,custom_52,custom_53,custom_54,custom_55,custom_56,custom_57,custom_58,custom_59,custom_60, ~r~n" + &
" 			    custom_61,custom_62,custom_63,custom_64,custom_65,custom_66,custom_67,custom_68,custom_69,custom_70, ~r~n" + &
" 			    custom_71,custom_72,custom_73,custom_74,custom_75,custom_n51,custom_n52,custom_n53,custom_n54,custom_n55, ~r~n" + &
" 			    custom_n56,custom_n57,custom_n58,custom_n59,custom_n60,custom_n61,custom_n62,custom_n63,custom_n64,custom_n65, ~r~n" + &
" 			    custom_n66,custom_n67,custom_n68,custom_n69,custom_n70,custom_notes_6,custom_notes_7,custom_notes_8,custom_notes_9,custom_notes_10, ~r~n" + &
"                custom_n71,custom_n72,custom_n73,custom_n74,custom_n75,custom_n76,custom_n77,custom_n78,custom_n79,custom_n80,~r~n" + &
"                custom_n81,custom_n82,custom_n83,custom_n84,custom_n85,custom_n86,custom_n87,custom_n88,custom_n89,custom_n90,~r~n" + &
"                custom_n91,custom_n92,custom_n93,custom_n94,custom_n95,custom_n96,custom_n97,custom_n98,custom_n99,custom_n100~r~n" + &
"FROM         ctx_custom ~r~n" 

//Added By Jay Chen 10-28-2015
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select 1 from  sysobjects where  name='v_ctx_contacts_internal' and type = 'V')  " + &
"  drop view v_ctx_contacts_internal "

is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"CREATE VIEW v_ctx_contacts_internal AS~r~n" + &
"SELECT TOP 100 PERCENT~r~n" + &
"       v_ctx_contract_contacts.ctx_id,~r~n" + &
"       app_facility.facility_name,~r~n" + &
"       app_facility.contact as Company_Custom_ID#,~r~n" + &
"       code_lookup.code AS contact_type_code,~r~n" + &
"       code_lookup.description AS contact_type_description,~r~n" + &
"       CTX_CONTACTS.first_name,~r~n" + &
"       CTX_CONTACTS.last_name,~r~n" + &
"       CTX_CONTACTS.middle_name,~r~n" + &
"       code_lookup_4.description AS contact_title,~r~n" + &
"       code_lookup_1.code AS contract_department_code,~r~n" + &
"       code_lookup_1.description AS contract_department_des,~r~n" + &
"       app_facility.street,~r~n" + &
"       app_facility.street_2,~r~n" + &
"       app_facility.street_3,~r~n" + &
"       app_facility.city,~r~n" + &
"       app_facility.zip,~r~n" + &
"       app_facility.state,~r~n" + &
"       app_facility.custom_1 as Company_Custom_1,~r~n" + &
"       app_facility.custom_2 as Company_Custom_2,~r~n" + &
"       app_facility.custom_3 as Company_Custom_3,~r~n" + &
"       app_facility.custom_4 as Company_Custom_4,~r~n" + &
"       app_facility.custom_5 as Company_Custom_5,~r~n" + &
"       app_facility.custom_6 as Company_Custom_6,~r~n" + &
"       app_facility.custom_7 as Company_Custom_7,~r~n" + &
"       app_facility.custom_8 as Company_Custom_8,~r~n" + &
"       app_facility.custom_9 as Company_Custom_9,~r~n" + &
"       app_facility.custom_10 as Company_Custom_10,~r~n" + &
"       CTX_CONTACTS.custom_1,~r~n" + &
"       CTX_CONTACTS.custom_2,~r~n" + &
"       CTX_CONTACTS.custom_3,~r~n" + &
"       CTX_CONTACTS.custom_4,~r~n" + &
"       CTX_CONTACTS.custom_5,~r~n" + &
"       CTX_CONTACTS.custom_6,~r~n" + &
"       CTX_CONTACTS.custom_7,~r~n" + &
"       CTX_CONTACTS.custom_8,~r~n" + &
"       CTX_CONTACTS.custom_9,~r~n" + &
"       CTX_CONTACTS.custom_10,~r~n" + &
"       v_ctx_contract_contacts.access,~r~n" + &
"       v_ctx_contract_contacts.owner,~r~n" + &
"       v_ctx_contract_contacts.notes,~r~n" + &
"       v_ctx_contract_contacts.ext,~r~n" + &
"       v_ctx_contract_contacts.contact_Fax,~r~n" + &
"       v_ctx_contract_contacts.contact_email,~r~n" + &
"       v_ctx_contract_contacts.contact_phone AS phone,~r~n" + &
"       NULL AS Phone_Type_code,~r~n" + &
"       NULL AS Phone_type_Description,~r~n" + &
"       v_ctx_contract_contacts.contact_id,~r~n" + &
"       v_ctx_contract_contacts.association,~r~n" + &
"       v_ctx_contract_contacts.association2,~r~n" + &
"       v_ctx_contract_contacts.association3,~r~n" + &
"       v_ctx_contract_contacts.association4,~r~n" + &
"       v_ctx_contract_contacts.association5,~r~n" + &
"       v_ctx_contract_contacts.association6,~r~n" + &
"       v_ctx_contract_contacts.association7,~r~n" + &
"       v_ctx_contract_contacts.association8,~r~n" + &
"       v_ctx_contract_contacts.association9,~r~n" + &
"       v_ctx_contract_contacts.association10,~r~n" + &
"       v_ctx_contract_contacts.default_email as default_to~r~n" + &
"  FROM CTX_CONTACTS~r~n" + &
"       INNER JOIN v_ctx_contract_contacts ON CTX_CONTACTS.contact_id = v_ctx_contract_contacts.contact_id~t    ~r~n" + &
"       INNER JOIN app_facility ON CTX_CONTACTS.facility_id = app_facility.facility_id ~t~t~r~n" + &
"       LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = Convert(varchar(50),code_lookup_4.lookup_code)~r~n" + &
" WHERE v_ctx_contract_contacts.ic_area='i'~r~n" + &
"ORDER BY v_ctx_contract_contacts.ctx_id"
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select 1 from  sysobjects where  name='v_ctx_contacts_external' and type = 'V')  " + &
"  drop view v_ctx_contacts_external "

//Added By Mark Lee 01/19/2016 delete table CTX_BASIC_INFO
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"CREATE VIEW  v_ctx_contacts_external AS  ~r~n" + &
"SELECT TOP 100 PERCENT~r~n" + &
"~tv_ctx_contract_contacts.ctx_id,~r~n" + &
"~tapp_facility.facility_name,~r~n" + &
"~tapp_facility.contact as Company_Custom_ID#,~r~n" + &
"~tcode_lookup.code AS contact_type_code,~r~n" + &
"~tcode_lookup.description AS contact_type_description,~r~n" + &
"~tCTX_CONTACTS.first_name,~r~n" + &
"~tCTX_CONTACTS.last_name,~r~n" + &
"~tCTX_CONTACTS.middle_name,~r~n" + &
"~tcode_lookup_4.description AS contact_title,~r~n" + &
"~tcode_lookup_1.code AS contract_department_code,~r~n" + &
"~tcode_lookup_1.description AS contract_department_des,~r~n" + &
"~tapp_facility.street,~r~n" + &
"~tapp_facility.street_2,~r~n" + &
"~tapp_facility.street_3,~r~n" + &
"~tapp_facility.city,~r~n" + &
"~tapp_facility.zip,~r~n" + &
"~tapp_facility.state,~r~n" + &
"~tapp_facility.custom_1 as Company_Custom_1,~r~n" + &
"~tapp_facility.custom_2 as Company_Custom_2,~r~n" + &
"~tapp_facility.custom_3 as Company_Custom_3,~r~n" + &
"~tapp_facility.custom_4 as Company_Custom_4,~r~n" + &
"~tapp_facility.custom_5 as Company_Custom_5,~r~n" + &
"~tapp_facility.custom_6 as Company_Custom_6,~r~n" + &
"~tapp_facility.custom_7 as Company_Custom_7,~r~n" + &
"~tapp_facility.custom_8 as Company_Custom_8,~r~n" + &
"~tapp_facility.custom_9 as Company_Custom_9,~r~n" + &
"~tapp_facility.custom_10 as Company_Custom_10,~r~n" + &
"~tCTX_CONTACTS.custom_1,~r~n" + &
"~tCTX_CONTACTS.custom_2,~r~n" + &
"~tCTX_CONTACTS.custom_3,~r~n" + &
"~tCTX_CONTACTS.custom_4,~r~n" + &
"~tCTX_CONTACTS.custom_5,~r~n" + &
"~tCTX_CONTACTS.custom_6,~r~n" + &
"~tCTX_CONTACTS.custom_7,~r~n" + &
"~tCTX_CONTACTS.custom_8,~r~n" + &
"~tCTX_CONTACTS.custom_9,~r~n" + &
"~tCTX_CONTACTS.custom_10,~r~n" + &
"~tv_ctx_contract_contacts.access,~r~n" + &
"~tv_ctx_contract_contacts.owner,~r~n" + &
"~tv_ctx_contract_contacts.notes,~r~n" + &
"~tv_ctx_contract_contacts.ext,~r~n" + &
"~tv_ctx_contract_contacts.contact_Fax,~r~n" + &
"~tv_ctx_contract_contacts.contact_email,~r~n" + &
"~tv_ctx_contract_contacts.contact_phone AS phone,~r~n" + &
"~tv_ctx_contract_contacts.custom_n1,~r~n" + &
"~tv_ctx_contract_contacts.custom_n2,~r~n" + &
"~tv_ctx_contract_contacts.custom_n3,~r~n" + &
"~tv_ctx_contract_contacts.custom_percent_1,~r~n" + &
"~tv_ctx_contract_contacts.custom_percent_2,~r~n" + &
"~tv_ctx_contract_contacts.custom_1 as contract_contact_custom_1,~r~n" + &
"~tv_ctx_contract_contacts.custom_2 as contract_contact_custom_2,~r~n" + &
"~tv_ctx_contract_contacts.custom_3 as contract_contact_custom_3,~r~n" + &
"~tNULL AS Phone_Type_code,~r~n" + &
"~tNULL AS Phone_type_Description,~r~n" + &
"~tv_ctx_contract_contacts.contact_id,~r~n" + &
"~tv_ctx_contract_contacts.association,~r~n" + &
"~tv_ctx_contract_contacts.association2,~r~n" + &
"~tv_ctx_contract_contacts.association3,~r~n" + &
"~tv_ctx_contract_contacts.association4,~r~n" + &
"~tv_ctx_contract_contacts.association5,~r~n" + &
"~tv_ctx_contract_contacts.association6,~r~n" + &
"~tv_ctx_contract_contacts.association7,~r~n" + &
"~tv_ctx_contract_contacts.association8,~r~n" + &
"~tv_ctx_contract_contacts.association9,~r~n" + &
"~tv_ctx_contract_contacts.association10,~r~n" + &
"~tv_ctx_contract_contacts.default_email as default_to  ~r~n" + &
"  FROM CTX_CONTACTS~r~n" + &
"       INNER JOIN v_ctx_contract_contacts ON CTX_CONTACTS.contact_id = v_ctx_contract_contacts.contact_id~r~n" + &
"       INNER JOIN app_facility ON CTX_CONTACTS.facility_id = app_facility.facility_id ~r~n" + &
"       LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code~r~n" + &
"       LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = Convert(varchar(50),code_lookup_4.lookup_code)~r~n" + &
" WHERE v_ctx_contract_contacts.ic_area='e'~r~n" + &
"ORDER BY v_ctx_contract_contacts.ctx_id"

//Added By Jay Chen 03-09-2016
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"if exists(select 1 from sysobjects where name = 'v_ctx_fee_schedule_nm') ~r~n" + &
"drop view v_ctx_fee_schedule_nm ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] = &
"Create View v_ctx_fee_schedule_nm As    ~r~n" + &
" SELECT  top 100 percent    ctx_fee_sched_nm.ctx_id,   ctx_fee_sched_nm.fee_sched_nm_id, ~r~n" + &
" code_lookup.code AS category_code,   code_lookup.description AS category_description,   code_lookup_1.code AS system_item_code, ~r~n" + &
" code_lookup_1.description AS system_item_Description,   ctx_fee_sched_nm.description,   ctx_fee_sched_nm.fee, ~r~n" + &
" code_lookup_2.code AS item_status_code,   ctx_fee_sched_nm.start_date,   ctx_fee_sched_nm.end_date,   ctx_fee_sched_nm.service_name, ~r~n" + &   
" ctx_fee_sched_nm.custom_int1,   ctx_fee_sched_nm.custom_int2,   ctx_fee_sched_nm.custom_fee1,   ctx_fee_sched_nm.custom_fee2, ~r~n" + &  
" ctx_fee_sched_nm.custom_fee3,   ctx_fee_sched_nm.custom_text1,   ctx_fee_sched_nm.custom_text2,   ctx_fee_sched_nm.custom_text3, ~r~n" + &  
" ctx_fee_sched_nm.notes,   ctx_fee_sched_nm.record_id,  ctx_fee_sched_nm.custom_text4,  ctx_fee_sched_nm.custom_text5,  ~r~n" + & 
" ctx_fee_sched_nm.custom_text6,  ctx_fee_sched_nm.custom_text7,  ctx_fee_sched_nm.custom_text8,  ctx_fee_sched_nm.custom_n1, ~r~n" + &
" ctx_fee_sched_nm.custom_n2,  ctx_fee_sched_nm.custom_n3,  ctx_fee_sched_nm.custom_n4,  ctx_fee_sched_nm.custom_n5, ~r~n" + &  
" code_lookup_3.code AS billing_Cycle,   code_lookup_3.description AS billing_cycle_description, ~r~n" + &
" ctx_fee_sched_nm.custom_date1, ctx_fee_sched_nm.custom_date2,ctx_fee_sched_nm.custom_date3,ctx_fee_sched_nm.custom_date4,ctx_fee_sched_nm.custom_date5  ~r~n" + &
" FROM (((ctx_fee_sched_nm LEFT OUTER JOIN code_lookup ON ctx_fee_sched_nm.category = code_lookup.lookup_code) ~r~n" + & 
" LEFT OUTER JOIN code_lookup AS code_lookup_1 ON ctx_fee_sched_nm.service_item = code_lookup_1.lookup_code)  ~r~n" + &
" LEFT OUTER JOIN code_lookup AS code_lookup_2 ON ctx_fee_sched_nm.item_status = code_lookup_2.lookup_code)  ~r~n" + &
" LEFT OUTER JOIN code_lookup AS code_lookup_3 ON ctx_fee_sched_nm.billing_cycle = code_lookup_3.lookup_code  ~r~n" + &
" ORDER BY ctx_fee_sched_nm.ctx_id ~r~n" 
//Modified by gavins 20160527
//" ctx_fee_sched_nm.custom_n6,ctx_fee_sched_nm.custom_n7,ctx_fee_sched_nm.custom_n8,ctx_fee_sched_nm.custom_n9,ctx_fee_sched_nm.custom_n10,  ~r~n" + &   
//" ctx_fee_sched_nm.custom_n11,ctx_fee_sched_nm.custom_n12,ctx_fee_sched_nm.custom_n13,ctx_fee_sched_nm.custom_n14,ctx_fee_sched_nm.custom_n15  ~r~n" + &  
of_execute_sqls("of_ver150_release_view1")

Return 1
end function

public function integer of_ver150_release_createfulltext1 ();//====================================================================
// Function: of_ver150_release_createfulltext1
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
//if use this function, need enable this comment.
//of_enable_fulltext()

//is_sql_statements[upperbound(is_sql_statements) + 1] = &
//"if not exists (select TOP 1 1 from sysfulltextcatalogs where name = 'ctx_custom_catalog') " + &
//"begin " + &
//"   	exec sp_fulltext_catalog 'ctx_custom_catalog','create' " + &
//"end "

//if use this function, need enable this comment.
//of_execute_sqls("of_ver150_release_createfulltext1")


//Added by Harry 2016-11-24
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_26','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_26','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_27','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_27','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_28','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_28','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_29','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_29','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_30','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_30','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_31','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_31','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_32','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_32','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_33','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_33','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_34','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_34','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_35','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_35','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_36','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_36','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_37','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_37','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_38','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_38','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_39','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_39','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_40','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_40','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_41','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_41','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_42','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_42','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_43','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_43','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_44','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_44','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_45','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_45','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_46','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_46','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_47','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_47','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_48','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_48','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_49','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_49','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_50','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_50','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_51','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_51','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_52','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_52','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_53','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_53','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_54','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_54','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_55','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_55','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_56','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_56','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_57','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_57','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_58','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_58','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_59','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_59','add'  "


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_60','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_60','add'  "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_61','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_61','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_62','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_62','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_63','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_63','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_64','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_64','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_65','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_65','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_66','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_66','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_67','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_67','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_68','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_68','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_69','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_69','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_70','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_70','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_71','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_71','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_72','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_72','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_73','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_73','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_74','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_74','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_75','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_75','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_6','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_6','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_7','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_7','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_8','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_8','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_9','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_9','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_10','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_10','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_custom') , 'TableFullTextPopulateStatus' )=0)  " + &
"	exec sp_fulltext_table 'ctx_custom','start_full' "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_custom') , 'TableFullTextChangeTrackingOn' )=0)  " + &
" exec sp_fulltext_table 'ctx_custom','start_change_tracking' "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_custom') , 'TableFullTextBackgroundUpdateIndexOn' )=0)  " + &
" exec sp_fulltext_table 'ctx_custom','start_background_updateindex' "


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_1','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_1','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_2','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_2','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_3','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_3','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_4','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_4','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_5','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_5','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_6','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_6','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_7','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_7','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_8','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_8','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_9','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_9','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_10','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_am_document', 'custom_10','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_am_document') , 'TableFullTextPopulateStatus' )=0)  " + &
"	exec sp_fulltext_table 'ctx_am_document','start_full' "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_am_document') , 'TableFullTextChangeTrackingOn' )=0)  " + &
" exec sp_fulltext_table 'ctx_am_document','start_change_tracking' "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_am_document') , 'TableFullTextBackgroundUpdateIndexOn' )=0)  " + &
" exec sp_fulltext_table 'ctx_am_document','start_background_updateindex' "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'Subject','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_action_items', 'Subject','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'custom_1','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_action_items', 'custom_1','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'custom_2','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_action_items', 'custom_2','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'custom_3','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_action_items', 'custom_3','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'custom_4','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_action_items', 'custom_4','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_action_items') , 'TableFullTextPopulateStatus' )=0)  " + &
"	exec sp_fulltext_table 'ctx_action_items','start_full' "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_action_items') , 'TableFullTextChangeTrackingOn' )=0)  " + &
" exec sp_fulltext_table 'ctx_action_items','start_change_tracking' "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_action_items') , 'TableFullTextBackgroundUpdateIndexOn' )=0)  " + &
" exec sp_fulltext_table 'ctx_action_items','start_background_updateindex' "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_loc'),'local','IsFulltextIndexed' ) = 0)  " + &
" 	exec sp_fulltext_column 'ctx_loc', 'local','add'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_loc') , 'TableFullTextPopulateStatus' )=0)  " + &
"	exec sp_fulltext_table 'ctx_loc','start_full' "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_loc') , 'TableFullTextChangeTrackingOn' )=0)  " + &
" exec sp_fulltext_table 'ctx_loc','start_change_tracking' "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if  (OBJECTPROPERTY (OBJECT_ID('ctx_loc') , 'TableFullTextBackgroundUpdateIndexOn' )=0)  " + &
" exec sp_fulltext_table 'ctx_loc','start_background_updateindex' "


of_execute_sqls("of_ver150_release_createfulltext1")


return 1 
end function

public function integer of_ver150_release_dropfulltext1 ();//====================================================================
// Function: of_ver150_release_dropfulltext1
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
//if use this function, need enable this comment.
//of_enable_fulltext()

//is_sql_statements[UpperBound(is_sql_statements) + 1] = &
//"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'ctx_id','IsFulltextIndexed' ) = 1) " + &
//"begin " + &
//"	exec sp_fulltext_column 'ctx_custom','ctx_id','drop' " + &
//"end "

//if use this function, need enable this comment.
//of_execute_sqls("of_ver150_release_dropfulltext1")


//Added by Harry 2016-11-24

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_26','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_26','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_27','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_27','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_28','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_28','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_29','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_29','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_30','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_30','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_31','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_31','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_32','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_32','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_33','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_33','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_34','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_34','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_35','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_35','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_36','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_36','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_37','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_37','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_38','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_38','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_39','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_39','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_40','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_40','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_41','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_41','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_42','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_42','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_43','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_43','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_44','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_44','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_45','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_45','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_46','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_46','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_47','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_47','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_48','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_48','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_49','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_49','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_50','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_50','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_51','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_51','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_52','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_52','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_53','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_53','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_54','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_54','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_55','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_55','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_56','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_56','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_57','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_57','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_58','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_58','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_59','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_59','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_60','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_60','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_61','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_61','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_62','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_62','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_63','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_63','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_64','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_64','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_65','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_65','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_66','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_66','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_67','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_67','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_68','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_68','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_69','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_69','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_70','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_70','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_71','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_71','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_72','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_72','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_73','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_73','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_74','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_74','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_75','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_75','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_6','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_6','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_7','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_7','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_8','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_8','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_9','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_9','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_custom'),'custom_notes_10','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_custom','custom_notes_10','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_1','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_1','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_2','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_2','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_3','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_3','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_4','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_4','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_5','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_5','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_6','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_6','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_7','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_7','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_8','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_8','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_9','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_9','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_am_document'),'custom_10','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_am_document','custom_10','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'Subject','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_action_items','Subject','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'custom_1','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_action_items','custom_1','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'custom_2','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_action_items','custom_2','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'custom_3','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_action_items','custom_3','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_action_items'),'custom_4','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_action_items','custom_4','drop'  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if (COLUMNPROPERTY (OBJECT_ID('ctx_loc'), 'local','IsFulltextIndexed' ) = 1)  " + &
" 	exec sp_fulltext_column 'ctx_loc', 'local','drop'  "


of_execute_sqls("of_ver150_release_dropfulltext1")


return 1

end function

public function integer of_ver150_updates ();//Added By Mark Lee 09/15/2014

of_ver150_release_table1()
of_ver150_release_table2()
of_ver150_release_view1()
of_ver150_release_storeprocedure1()
of_ver150_release_storeprocedure2()
of_ver150_release_storeprocedure3()
of_ver150_release_storeprocedure4()
of_ver150_release_storeprocedure5()
of_ver150_release_storeprocedure6( )
of_ver150_release_storeprocedure7()
of_ver150_release_storeprocedure8()
of_ver150_release_storeprocedure9()
of_ver150_release_trigger1() 

//Added By Jay Chen 08-06-2015. update v_ctx_custom2 alias
n_cst_update_view_fields_alias lnv_alias
String ls_main_version,ls_patch_version
Select set_18,set_patch_ver Into :ls_main_version, :ls_patch_version From icred_settings;
If ls_main_version < '150' or ( ls_main_version = '150' and ls_patch_version <= '058' ) Then
	lnv_alias = Create n_cst_update_view_fields_alias
	lnv_alias.of_update_view_fields_alias(0,0,False,'v_name = "v_ctx_custom2"')
	If isvalid(lnv_alias) Then Destroy lnv_alias
End If

return 1
end function

public function integer of_ver150_release_storeprocedure1 ();//====================================================================
// Function: of_ver150_release_storeprocedure1
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

//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//"If Exists (SELECT name FROM sysobjects WHERE name = 'up_calculate_date_alarms' AND type = 'P')~r~n" + &
//"~tDROP PROCEDURE up_calculate_date_alarms~r~n" 

//Added By Mark Lee 09/17/2014
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'up_export_table_data' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure up_export_table_data~r~n" + &
"End ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"Create Procedure up_export_table_data(@export_id int,@sql_where varchar(2000),@table_header int,@display_key int,@err_msg varchar(2000) output)~r~n" + &
"AS~r~n" + &
"Begin~r~n" + &
"~tDeclare @count int, @export_type int, @export_field_length int,@ctx_id int, @num int, @level int~r~n" + &
"~tDeclare @where varchar(max), @sql_text varchar(max), @return varchar(10), @collation_order nvarchar(128),@export_fields_expression varchar(2000)~r~n" + &
"~tDeclare @version_sql varchar(300), @row_code varchar(10),@strip_char varchar(8),@ctx_table_name varchar(50), @exec_sql varchar(max),@expression varchar(max)~r~n" + &
"~tDeclare @export_field_name varchar(50), @ctx_column_name varchar(50), @insert_column varchar(max),@select_col varchar(max), @nexec nvarchar(max)~r~n" + &
"~tDeclare @field_value varchar(8000), @sql_order_col varchar(8000),  @table_header_col varchar(max), @convert_sql varchar(max), @exec varchar(max)~r~n" + &
"~t~r~n" + &
"~r~n" + &
"~tSET @collation_order = 'select @level = compatibility_level from sys.databases where name = db_name()'~r~n" + &
"    EXEC SP_EXECUTESQL @collation_order, N'@level int output',@level OUTPUT~r~n" + &
"~r~n" + &
"~tif (@level is null or @level <= 80)~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = 'Please set the database compatibility level more than SQL Server 2000. Otherwise, the export data functions will not work.'~r~n" + &
"~t~treturn  -1~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tSet @num = 1 ~r~n" + &
"~tBEGIN TRY~r~n" + &
"~t~tSelect @where = prac_sql, @sql_text = sql_text, @strip_char = strip_char from export_header where export_id =  convert(varchar(20),@export_id)~t~r~n" + &
"~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~tEND TRY~r~n" + &
"~tBEGIN CATCH~r~n" + &
"~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~treturn  ~r~n" + &
"~tEND CATCH~r~n" + &
"~tIf convert(int,@return) <> 0 ~r~n" + &
"~tBegin ~r~n" + &
"~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; ErrorNumber:'+@return~r~n" + &
"~t~treturn  @return  ~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tIf (@sql_text is null ) or (datalength(@sql_text)<= 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = 'no data'~r~n" + &
"~t~tReturn ~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tIf (@sql_where is null) or (ltrim(rtrim(@sql_where)) = '')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @where = 'select distinct  ctx_id from ctx_basic_info '~r~n" + &
"~tEnd ~r~n" + &
"~tElse If left(ltrim(@sql_where),6) = 'ctx_id' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @where ='select distinct ctx_id from ctx_basic_info where '+ @sql_where~r~n" + &
"~tEnd~r~n" + &
"~tElse If left(ltrim(@sql_where),7) = 'default' ~r~n" + &
"~tBegin~r~n" + &
"~t~tIF (@where is null) or (datalength(@where)= 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @where = 'select distinct  ctx_id from ctx_basic_info '~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tIf Charindex(';',@where) > 0 ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @where = left(@where,Charindex(';',@where) - 1  )~r~n" + &
"~t~tEnd ~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tSelect @sql_text = replace(@sql_text,'(***)',@where)~t~r~n" + &
"~tSet @count = 0~r~n" + &
"~tSelect @count = count(1) from sysobjects where name = '#export_tmp_data' and type = 'U';~r~n" + &
"~tIf (@count is not null ) and (@count = 1 ) ~r~n" + &
"~tBegin~r~n" + &
"~t~tDrop TABLE #export_tmp_data;~r~n" + &
"~tEnd ~r~n" + &
"~t~t~r~n" + &
"~tSet @num = 2~r~n" + &
"~tBEGIN TRY~r~n" + &
"~t~tCreate Table #export_tmp_data ( exp_tmp_id int identity(1,1) not null, rec_id int not null, fieldseqid varchar(50) not null,~r~n" + &
"~t~t~tfield_value varchar(8000) null, field_data_type char(1) null, row_no int null ) ;~r~n" + &
"~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~tEND TRY~r~n" + &
"~tBEGIN CATCH~r~n" + &
"~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~treturn  ~r~n" + &
"~tEND CATCH~r~n" + &
"~tIf convert(int,@return) <> 0 ~r~n" + &
"~tBegin ~r~n" + &
"~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~treturn  ~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tselect @collation_order = CONVERT(sysname, SERVERPROPERTY('Collation'))~r~n" + &
"~r~n" + &
"~tIf charindex('_CI_',@collation_order) > 0 ~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @collation_order = replace(@collation_order,'_CI_','_CS_')~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tIf charindex('_CS_',@collation_order) = 0 ~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @collation_order =''~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tselect @version_sql = @@version~r~n" + &
"~r~n" + &
"~t~tSet @row_code = ',row_no'~r~n" + &
"~tSelect @sql_text = 'Insert into #export_tmp_data(rec_id, fieldseqid,field_value,field_data_type' + @row_code + ') ' + @sql_text ~r~n" + &
"~tSet @num = 3  ~r~n" + &
"~tBEGIN TRY~r~n" + &
"~t~texecute(@sql_text)~r~n" + &
"~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~tEND TRY~r~n" + &
"~tBEGIN CATCH~r~n" + &
"~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~treturn  ~r~n" + &
"~tEND CATCH~r~n" + &
"~tIf convert(int,@return) <> 0 ~r~n" + &
"~tBegin ~r~n" + &
"~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~treturn  ~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tSet @sql_text = ''~t~t~r~n" + &
"~tSet @expression = ''~t~r~n" + &
"~tSelect @expression = '['+lower(export_field_name) + '], '+@expression FROM export_fields WHERE export_id = @export_id;~r~n" + &
"~tSet @count = 0 ~r~n" + &
"~tselect @count = count(1) from #export_tmp_data ;~r~n" + &
"~tIf (@count is not null ) and (@count > 0 ) ~r~n" + &
"~tBegin~r~n" + &
"~r~n" + &
"~t~tSet @insert_column = ''~r~n" + &
"~t~tSet @sql_order_col = 'Select rec_id, '~r~n" + &
"~t~tSet @field_value = ''~r~n" + &
"~t~tSet @exec_sql = ''~r~n" + &
"~t~tSet @table_header_col = 'select top 1 ''0'''~t~t~t~t~t/*ctx_id int*/~t~t~r~n" + &
"~t~tDECLARE export_cursor CURSOR FOR ~r~n" + &
"      ~t~tSELECT  export_field_name,ctx_column_name, field_value, export_type, export_field_length,ctx_table_name,export_fields_expression~r~n" + &
"~t~tFROM export_fields~r~n" + &
"~t~tWHERE export_fields.export_id =  @export_id  ~r~n" + &
"~t~tOrder by  export_order, rec_id asc~r~n" + &
"~t~t/*the order number maybe as same in the export fields table, so we need the field name in the order list.*/~r~n" + &
"~t~tOPEN export_cursor~r~n" + &
"~t~tFETCH NEXT FROM export_cursor INTO @export_field_name, @ctx_column_name, @field_value, @export_type, @export_field_length,@ctx_table_name,@export_fields_expression~r~n" + &
"  ~r~n" + &
"~t~tWHILE @@FETCH_STATUS = 0~r~n" + &
"~t~tBEGIN~r~n" + &
"~t~t~t/*Character to strip from all data fields*/~r~n" + &
"~t~t~tSet~t@where = ''~r~n" + &
"~t~t~tIf (@export_field_length is not null and @export_field_length > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @where = 'convert(varchar('+convert(varchar,@export_field_length)+'),'+@export_field_name+') '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @where = @export_field_name~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tIF(@strip_char is not null) and len(@strip_char) > 0~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tIf len(@collation_order) > 0 ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @where = replace(@where,@export_field_name,'replace('+@export_field_name+' collate '+@collation_order+','''+@strip_char+''','''')')~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @where = replace(@where,@export_field_name,'replace('+@export_field_name+','''+@strip_char+''','''')')~r~n" + &
"~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tSelect @insert_column = @insert_column +' alter table #export_tmp_data1 add ' + @export_field_name +' varchar(8000) NULL;'~r~n" + &
"~t~t~tSelect @exec_sql  = isnull(@exec_sql, '') + ' , ' + @where + ' as ' + @export_field_name~r~n" + &
"~t~t~tSelect @sql_order_col = @sql_order_col + @export_field_name + ', '~r~n" + &
"~t~t~tSelect @table_header_col = @table_header_col + ', '+ ''''+@export_field_name+''' '~r~n" + &
"~r~n" + &
"~t~t~tif (@export_type = 3 and (@export_fields_expression is not null and len(ltrim(rtrim(@export_fields_expression))) > 0 ) )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet~t@where = ''~r~n" + &
"~r~n" + &
"~t~t~t~tif (charindex('['+lower(ltrim(rtrim(@export_fields_expression)))+'],',@expression) > 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @field_value = @export_fields_expression~t~t~t~t~t~r~n" + &
"~t~t~t~t~tIf (@export_field_length is not null and @export_field_length > 0 )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @where = 'convert(varchar('+convert(varchar,@export_field_length)+'),'+@field_value+') '~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @where = @field_value~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @field_value = null~t~t~r~n" + &
"~t~t~t~t~tSet @nexec =  N'select @field_value = (case when '+@export_fields_expression+N' then ''true'' else ''false'' end )   from ids '~r~n" + &
"~t~t~t~t~tEXEC SP_EXECUTESQL @nexec, N'@field_value varchar(8000) output',@field_value OUTPUT~r~n" + &
"~r~n" + &
"~t~t~t~t~tIf (@export_field_length is not null and @export_field_length > 0 )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @where = 'convert(varchar('+convert(varchar,@export_field_length)+'),'''+@field_value+''') '~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @where = ''''+@field_value+''''~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~t~tSet @sql_text  = @sql_text + ' Update #export_tmp_data1 Set '+@export_field_name+'=' + @where + ' ; ' ~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t~tFETCH NEXT FROM export_cursor INTO @export_field_name, @ctx_column_name, @field_value, @export_type, @export_field_length,@ctx_table_name,@export_fields_expression~r~n" + &
"~t~tEND~r~n" + &
"~t~tCLOSE export_cursor~r~n" + &
"~t~tDEALLOCATE export_cursor~r~n" + &
"~r~n" + &
"~t~t/*create table*/~r~n" + &
"~t~tSet @count = 0 ~r~n" + &
"~t~tSelect @count = count(1) from sysobjects where name = '#export_tmp_data1' and type = 'U' ;~t~r~n" + &
"~t~tIf (@count is not null and @count = 1 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tDrop Table #export_tmp_data1;~r~n" + &
"~t~tEnd~t~r~n" + &
"~r~n" + &
"~t~tSet @num = 4~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~t~tCreate Table #export_tmp_data1 ( rec_id int null, row_no int null ) ;~r~n" + &
"~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~ttruncate table #export_tmp_data~r~n" + &
"~t~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~treturn  ~r~n" + &
"~t~tEND CATCH~r~n" + &
"~t~tIf convert(int,@return) <> 0 ~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~ttruncate table #export_tmp_data~r~n" + &
"~t~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~treturn  ~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tIF len(@insert_column) > 0~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~tSet @num = 5~r~n" + &
"~t~t~tBEGIN TRY~r~n" + &
"~t~t~t~tExecute(@insert_column)~r~n" + &
"~t~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~t~tEND TRY~r~n" + &
"~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~treturn  ~r~n" + &
"~t~t~tEND CATCH~r~n" + &
"~t~t~tIf convert(int,@return) <> 0 ~r~n" + &
"~t~t~tBegin ~r~n" + &
"~t~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~treturn  ~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tselect  @convert_sql = isnull(@convert_sql,'') + ( case when export_type = 1 then '[' + export_field_name  + '],' ~r~n" + &
"~t~t~t~twhen export_type = 2  and field_value is not null and len(field_value) > 0 then + ''''+ field_value + ''''+  ' as ' + '[' + export_field_name + ']' + ','~t~t~t~t~r~n" + &
"~t~t~t~telse '''''' +  'as ' + '[' + export_field_name + ']' + ','  end ) ,~r~n" + &
"~t~t~t@select_col = isnull(@select_col+ '],[','') + export_field_name~r~n" + &
"~t~t~tfrom ( select  distinct  b.export_field_name,b.export_order,b.export_type, b.field_value, b.rec_id, b.export_fields_expression from export_fields b ~r~n" + &
"~t~t~t~t   where b.export_id = @export_id  ~r~n" + &
"~t~t~t~t~t) c  order by c.export_order,c.rec_id asc ;~r~n" + &
"~r~n" + &
"~t~tSet @select_col = '[' + @select_col+ ']'~r~n" + &
"~t~tSet @convert_sql = substring( @convert_sql, 1, len(@convert_sql ) -1 )~r~n" + &
"~r~n" + &
"~t~tSet @exec = ''~r~n" + &
"~t~tSelect @exec = ' select rec_id,row_no,' + @convert_sql + ' from (~r~n" + &
"~t~t~tselect fieldseqid,field_value,rec_id, 1 as row_no from~r~n" + &
"~t~t~t(select b.export_field_name as fieldseqid,a.field_value,a.rec_id, a.row_no ~r~n" + &
"~t~t~t~tfrom   ( select rec_id,field_value,fieldseqid,  row_number() over(partition by fieldseqid , rec_id order by fieldseqid , rec_id asc) row_no  from #export_tmp_data )  a ~r~n" + &
"~t~t~tleft join ( select row_number() over ( order by export_order, rec_id asc) as num, export_id, export_type, export_order as export_order2,export_field_name,intcred_record_number  ~r~n" + &
"~t~t~t~t~t~tfrom export_fields where export_id = '+convert(varchar,@export_id)+' and export_type = 1 ) b ~r~n" + &
"~t~t~t~ton a.fieldseqid = b.num and a.row_no = b.intcred_record_number) dd ) aa~r~n" + &
"~t~t~tpivot (min( field_value ) for fieldseqid  in (' + @select_col + ')) bb order by rec_id,row_no ' ;~r~n" + &
"~r~n" + &
"~t~tSet @num = 6~r~n" + &
"~t~tBEGIN TRY~t~t~t~t~t~r~n" + &
"~t~t~tInsert #export_tmp_data1 Exec(@exec)~r~n" + &
"~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~ttruncate table #export_tmp_data~r~n" + &
"~t~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~t~ttruncate table #export_tmp_data1~r~n" + &
"~t~t~tdrop table #export_tmp_data1~r~n" + &
"~t~r~n" + &
"~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~treturn  ~r~n" + &
"~t~tEND CATCH~r~n" + &
"~t~tIf convert(int,@return) <> 0 ~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~ttruncate table #export_tmp_data~r~n" + &
"~t~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~t~ttruncate table #export_tmp_data1~r~n" + &
"~t~t~tdrop table #export_tmp_data1~r~n" + &
"~r~n" + &
"~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~treturn   ~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t/* Calculated Field  */~t~t~r~n" + &
"~t~tIf(@sql_text is not null and len(@sql_text) > 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @num = 7~r~n" + &
"~t~t~tBEGIN TRY~t~t~t~r~n" + &
"~r~n" + &
"~t~t~t~tExec(@sql_text)~r~n" + &
"~t~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~t~tEND TRY~r~n" + &
"~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~ttruncate table #export_tmp_data~r~n" + &
"~t~t~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~t~t~ttruncate table #export_tmp_data1~r~n" + &
"~t~t~t~tdrop table #export_tmp_data1~r~n" + &
"~t~r~n" + &
"~t~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~treturn  ~r~n" + &
"~t~t~tEND CATCH~r~n" + &
"~t~t~tIf convert(int,@return) <> 0 ~r~n" + &
"~t~t~tBegin ~r~n" + &
"~t~t~t~ttruncate table #export_tmp_data~r~n" + &
"~t~t~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~t~t~ttruncate table #export_tmp_data1~r~n" + &
"~t~t~t~tdrop table #export_tmp_data1~r~n" + &
"~r~n" + &
"~t~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~treturn   ~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~tEnd ~r~n" + &
"~t~tSelect @sql_order_col = Left(@sql_order_col,len(@sql_order_col) - 1)~r~n" + &
"~t~tSet @exec = ' #export_tmp_data1 '~r~n" + &
"~t~r~n" + &
"~t~t/* order column*/~r~n" + &
"~t~tIf (@display_key is null) or (@display_key <> 1 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @select_col = ' select '+substring(@sql_order_col, charindex('rec_id,',@sql_order_col)+ 7 , len(@sql_order_col) - charindex('rec_id,',@sql_order_col) - 6)~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @select_col = @sql_order_col~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* the header column*/~r~n" + &
"~t~tIf (@table_header is not null) and (@table_header = 1)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @exec_sql =  @select_col + ' from ('+@sql_order_col+',row_no from ( Select rec_id,row_no '+@exec_sql+' from '+@exec+'  ) dd  union all ' +@table_header_col + ',0 from ids ) a order by rec_id,row_no '~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @exec_sql =  @select_col + ' from ( Select rec_id,row_no '+@exec_sql+' from '+@exec+' ) dd order by rec_id,row_no '~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @num = 8~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~t~tExecute(@exec_sql)~t~t~t~r~n" + &
"~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~ttruncate table #export_tmp_data~r~n" + &
"~t~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~t~ttruncate table #export_tmp_data1~r~n" + &
"~t~t~tdrop table #export_tmp_data1~r~n" + &
"~r~n" + &
"~t~t~tSet @return = CONVERT(varchar(10),@@ERROR)~r~n" + &
"~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~treturn  ~r~n" + &
"~t~tEND CATCH~r~n" + &
"~t~tIf convert(int,@return) <> 0 ~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~ttruncate table #export_tmp_data~r~n" + &
"~t~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~t~ttruncate table #export_tmp_data1~r~n" + &
"~t~t~tdrop table #export_tmp_data1~r~n" + &
"~r~n" + &
"~t~t~tSelect @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~treturn  ~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~ttruncate table #export_tmp_data~r~n" + &
"~t~tdrop table #export_tmp_data~r~n" + &
"~r~n" + &
"~t~ttruncate table #export_tmp_data1~r~n" + &
"~t~tdrop table #export_tmp_data1~r~n" + &
"~r~n" + &
"~tEnd ~r~n" + &
"~tElse~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = 'no temp data'~r~n" + &
"~t~treturn~t~t~t~r~n" + &
"~tEnd ~r~n" + &
"End~r~n" + &
"~r~n"

//Added By Jay Chen 12-15-2014
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if exists (SELECT name FROM sysobjects WHERE name = 'sp_contract_search' AND type = 'P') " + &
"    DROP PROCEDURE sp_contract_search"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
 "CREATE  PROCEDURE sp_contract_search(  @user_d VARCHAR(10)   )~r~n" + &
 "AS    ~r~n" + &
 "DECLARE @display_multi_products VARCHAR(10) ~r~n" + &
 "SELECT @display_multi_products = option_value FROM security_user_options WHERE user_id = @user_d and option_name='display_multi_product'	~r~n" + &
 "if (@display_multi_products is null) set @display_multi_products = '1' ~r~n" + &
 "~t~r~n" + &
 "/*******initial #temp_ctx_user********/~r~n" + &
 "IF object_id('tempdb..#temp_ctx_user') is not null~r~n" + &
 "Begin~r~n" + &
 "	Drop TABLE #temp_ctx_user;~r~n" + &
 "End ~r~n" + &
 "~t~r~n" + &
 "/*******initial #temp_right********/~r~n" + &
 "IF object_id('tempdb..#temp_right') is not null~r~n" + &
 "Begin~r~n" + &
 "	Drop TABLE #temp_right;~r~n" + &
 "End ~r~n" + &
"~t~r~n" + &
 "/*********prepare #temp_ctx_user data********/~r~n" + &
 "SELECT ctx_contacts.user_d,ctx_contract_contacts.ctx_id into #temp_ctx_user~r~n" + &
 "FROM ctx_contract_contacts, ctx_contacts   ~r~n" + &
 "WHERE ctx_contacts.contact_id = ctx_contract_contacts.contact_id ~r~n" + &
 "AND ctx_contract_contacts.ic_area = 'I'~r~n" + &
 "UNION     ~r~n" + &
 "SELECT security_group_users.user_id user_d,ctx_group_access.ctx_id~r~n" + &
 "FROM ctx_group_access,security_group_users,icred_settings ~r~n" + &
 "WHERE icred_settings.group_access = 1 ~r~n" + &
 "AND ctx_group_access.group_id = security_group_users.group_id~r~n" + &
"~t~r~n" + &
 "/*********prepare #temp_right data********/~r~n" + &
 "SELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id, ~r~n" + &
 "	   user_id = ctx_contacts.user_d, ~r~n" + &
 "	   access = (CASE ctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END)   into #temp_right~r~n" + &
 "FROM ctx_contract_contacts Left Outer Join ~r~n" + &
 "( ~r~n" + &
 "Select ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d  ~r~n" + &
 "From ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1 ~r~n" + &
 "Where ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id And ctx_contacts1.user_d = @user_d ~r~n" + &
 "Group By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d ~r~n" + &
 "Having Count(ctx_contract_contacts1.ctx_id) > 1 ~r~n" + &
 ") ccc ~r~n" + &
 "On ctx_contract_contacts.ctx_id = ccc.ctx_id ~r~n" + &
 ",ctx_contacts ~r~n" + &
 "WHERE ctx_contacts.user_d = @user_d ~r~n" + &
 "	AND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' ) ~r~n" + &
 "	AND ctx_contract_contacts.contact_id = ctx_contacts.contact_id  ~r~n" + &
 "	AND ( ctx_contract_contacts.access IN ('F','R')  ~r~n" + &
 "	OR ctx_contract_contacts.owner = 'Y' ) ~r~n" + &
 "	AND ctx_contract_contacts.ic_area = 'I' ~r~n" + &
 "UNION  ~r~n" + &
 "SELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id,~r~n" + &
 "	   user_id = security_group_users.user_id, ~r~n" + &
 "	   access =  ctx_group_access.access ~r~n" + &
 "FROM  ctx_group_access ,security_group_users,icred_settings ~r~n" + &
 "WHERE security_group_users.user_id = @user_d ~r~n" + &
 "   AND ctx_group_access.group_id = security_group_users.group_id ~r~n" + &
 "	AND ctx_group_access.access =  ~r~n" + &
 "		(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access  ~r~n" + &
 "		From ctx_group_access a1,security_group_users u1 ~r~n" + &
 "		Where a1.group_id = u1.group_id  ~r~n" + &
 "		And a1.ctx_id = ctx_group_access.ctx_id ~r~n" + &
 "		And u1.user_id = security_group_users.user_id	 ~r~n" + &
 "		And a1.access = 'F') Then 'F' Else 'R' End)  ~r~n" + &
 "	AND icred_settings.group_access = 1 ~r~n" + &
 "	AND ctx_group_access.access in ('F','R') ~r~n" + &
 "	AND NOT EXISTS	(SELECT 1 FROM ctx_contract_contacts, ctx_contacts ~r~n" + &
 "			WHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )  ~r~n" + &
 "			AND ( ctx_contacts.user_d = security_group_users.user_id ) ~r~n" + &
 "			AND ( ctx_contract_contacts.ic_area = 'I' ) ~r~n" + &
 "			AND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id ) ~r~n" + &
 "			) ~r~n" + &
 "UNION ~r~n" + &
"SELECT b.ctx_id,b.user_id,(CASE WHEN b.rcnt=0 THEN 'F' ELSE 'R' END) access ~r~n" + &
"FROM~r~n" + &
"(~r~n" + &
"	SELECT DISTINCT a.ctx_id,a.user_id,~r~n" + &
"		SUM(CASE a.access WHEN 'F' THEN 1 ELSE 0 END) fcnt,~r~n" + &
"		SUM(CASE a.access WHEN 'R' THEN 1 ELSE 0 END) rcnt~r~n" + &
"	FROM ~r~n" + &
"	(~r~n" + &
"		SELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, ~r~n" + &
"            			user_id = security_users.user_id,~r~n" + &
" 					access = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END) ~r~n" + &
"		FROM ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"		WHERE security_users.user_id = @user_d   ~r~n" + &
" 		AND ctx_acp_contract_management_right.role_id = security_users.role_id ~r~n" + &
" 		And ctx_basic_info.is_template = 0  ~r~n" + &
" 		AND ctx_acp_contract_management_right.types=1~r~n" + &
"      	AND ctx_acp_contract_management_right.category = ctx_basic_info.category ~r~n" + &
"      	AND ctx_acp_contract_management_right.rights In ('11','12','13') ~r~n" + &
" 		AND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)~r~n" + &
"       union~r~n" + &
"		SELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, ~r~n" + &
"            			user_id = security_users.user_id,~r~n" + &
" 					access = (CASE ctx_acp_contract_management_right.rights WHEN '61' THEN 'F' WHEN '62' THEN 'R' ELSE 'N' END) ~r~n" + &
"		FROM ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"		WHERE security_users.user_id = @user_d   ~r~n" + &
" 		AND ctx_acp_contract_management_right.role_id = security_users.role_id ~r~n" + &
" 		And ctx_basic_info.is_template = 0  ~r~n" + &
" 		AND ctx_acp_contract_management_right.types=6~r~n" + &
"      	AND ctx_acp_contract_management_right.category = ctx_basic_info.dvision ~r~n" + &
"      	AND ctx_acp_contract_management_right.rights In ('61','62','63') ~r~n" + &
" 		AND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)~r~n" + &
"        union~r~n" + &
"		SELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, ~r~n" + &
"            			user_id = security_users.user_id,~r~n" + &
" 					access = (CASE ctx_acp_contract_management_right.rights WHEN '71' THEN 'F' WHEN '72' THEN 'R' ELSE 'N' END) ~r~n" + &
"		FROM ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"		WHERE security_users.user_id = @user_d   ~r~n" + &
" 		AND ctx_acp_contract_management_right.role_id = security_users.role_id ~r~n" + &
" 		And ctx_basic_info.is_template = 0  ~r~n" + &
" 		AND ctx_acp_contract_management_right.types=7~r~n" + &
"      	AND ctx_acp_contract_management_right.category = ctx_basic_info.contract_department ~r~n" + &
"      	AND ctx_acp_contract_management_right.rights In ('71','72','73') ~r~n" + &
" 		AND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)~r~n" + &
"		union~r~n" + &
"		SELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, ~r~n" + &
"            			user_id = security_users.user_id,~r~n" + &
" 					access = (CASE ctx_acp_contract_management_right.rights WHEN '81' THEN 'F' WHEN '82' THEN 'R' ELSE 'N' END) ~r~n" + &
"		FROM ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"		WHERE security_users.user_id = @user_d   ~r~n" + &
" 		AND ctx_acp_contract_management_right.role_id = security_users.role_id ~r~n" + &
" 		And ctx_basic_info.is_template = 0  ~r~n" + &
" 		AND ctx_acp_contract_management_right.types=8~r~n" + &
"      	AND ctx_acp_contract_management_right.category = ctx_basic_info.contract_type ~r~n" + &
"      	AND ctx_acp_contract_management_right.rights In ('81','82','83') ~r~n" + &
" 		AND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)~r~n" + &
"	) a~r~n" + &
"	GROUP BY a.ctx_id,a.user_id~r~n" + &
"   HAVING SUM(CASE a.access WHEN 'N' THEN 1 ELSE 0 END) = 0~r~n" + &
") b~r~n" + &
"~t~r~n" + &
 "/*********display multi row if ctx have multi product*******/~r~n" + &
 "if @display_multi_products = '1' ~r~n" + &
 "BEGIN       ~r~n" + &
"	WITH v_ctx_ccci as~r~n" + &
"	(~r~n" + &
" 	 SELECT ctx_contract_contacts.ctx_id,   ~r~n" + &
"         'name' = ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'')~r~n" + &
"   	FROM  ctx_contract_contacts,ctx_contacts~r~n" + &
"   	WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id~r~n" + &    
"   	AND   ctx_contract_contacts.ic_area = 'E' ~r~n" + &
"	),~r~n" + &
"	v_ctx_ccci2 as ~r~n" + &
"	( ~r~n" + &
"  	 select aa.ctx_id, ~r~n" + &
"	      ccci_name = ltrim(stuff((select '; ' + name from v_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))~r~n" + &
"  	 from v_ctx_ccci aa~r~n" + &
"  	 group by aa.ctx_id~r~n" + &
"	),~r~n" + &
"	v_ctx_occi as~r~n" + &
"	(~r~n" + &
"   	SELECT ctx_contract_contacts.ctx_id,   ~r~n" + &
"         'name' = ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'')~r~n" + &
"   	FROM  ctx_contract_contacts,ctx_contacts~r~n" + &
"   	WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id    ~r~n" + &
"   	AND   ctx_contract_contacts.ic_area = 'I'~r~n" + &
"	),~r~n" + &
"	v_ctx_occi2 as ~r~n" + &
"	( ~r~n" + &
"	 select aa.ctx_id, ~r~n" + &
"	 occi_name = ltrim(stuff((select '; ' + name from v_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))~r~n" + &
"     from v_ctx_occi aa~r~n" + &
"     group by aa.ctx_id~r~n" + &
"	)~r~n" + &
 "	SELECT DISTINCT ctx_basic_info.app_facility,  ~r~n" + &
 "	ctx_products.product_id product_code,~r~n" + &
 "	code_lookup.code product_name,    ~r~n" + &
 "	ctx_basic_info.effective_date,    ~r~n" + &
 "	ctx_basic_info.expriation_date,   ~r~n" + &
 "	ctx_basic_info.status,      ~r~n" + &
 "	ctx_basic_info.group_multi_loc_id,~r~n" + &
 "	ctx_basic_info.ctx_id, ~r~n" + &
 "	ctx_basic_info.master_contract_id,~r~n" + &
 "	master_cnt = (SELECT Count(ctx_basic_info1.ctx_id) ~r~n" + &
 "			FROM ctx_basic_info ctx_basic_info1  ~r~n" + &
 "			WHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ),~r~n" + &
 "	ctx_basic_info.category,         ~r~n" + &
 "	ctx_basic_info.facility_id,      ~r~n" + &
 "	ctx_basic_info.contract_type,    ~r~n" + &
 "	code_lookup1.code product_type,  ~r~n" + &
 "	ctx_basic_info.reimbursment_menth,~r~n" + &
 "	ctx_basic_info.file_location,    ~r~n" + &
 "	ctx_basic_info.review_date,      ~r~n" + &
 "	ctx_basic_info.review_by,       ~r~n" + & 
 "	ctx_basic_info.term_date,        ~r~n" + &
 "	ctx_basic_info.term_reason,     ~r~n" + & 
 "	ctx_basic_info.last_revis_date,  ~r~n" + &
 "	ctx_basic_info.other_date_1,     ~r~n" + &
 "	ctx_basic_info.other_date_2,     ~r~n" + &
 "	ctx_basic_info.oc_signed_by,     ~r~n" + &
 "	ctx_basic_info.oc_title,         ~r~n" + &
 "	ctx_basic_info.oc_department,    ~r~n" + &
 "	ctx_basic_info.oc_legal_rep,     ~r~n" + &
 "	ctx_basic_info.cc_signed_by,     ~r~n" + &
 "	ctx_basic_info.cc_title,         ~r~n" + &
 "	ctx_basic_info.cc_department,    ~r~n" + &
 "	ctx_basic_info.cc_legal_rep,     ~r~n" + &
 "	ctx_basic_info.notes,        	 ~r~n" + &
 "	ctx_basic_info.keyword,          ~r~n" + &
 "	ctx_basic_info.dvision,          ~r~n" + &
 "	ctx_basic_info.custom_1,         ~r~n" + &
 "	ctx_basic_info.custom_2,         ~r~n" + &
 "	ctx_basic_info.custom_3,         ~r~n" + &
 "	ctx_basic_info.custom_4,         ~r~n" + &
 "	ctx_basic_info.custom_5,         ~r~n" + &
 "	ctx_basic_info.custom_6,         ~r~n" + &
 "	ctx_basic_info.custom_7,        ~r~n" + &
 "	ctx_basic_info.custom_8,        ~r~n" + &
 "	ctx_basic_info.custom_9,        ~r~n" + &
 "	ctx_basic_info.custom_10,       ~r~n" + &
 "	ctx_basic_info.group_id,        ~r~n" + &
 "	ctx_basic_info.revision_reason, ~r~n" + &
 "	ctx_basic_info.record_id ,    ~r~n" + &
 "	owner = upper((SELECT top 1 ctx_contacts.user_d ~r~n" + &
 "			FROM ctx_contacts,ctx_contract_contacts  ~r~n" + &
 "			WHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) ~r~n" + &
 "			AND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )  ~r~n" + &
 "			  AND ( ctx_contract_contacts.owner = 'Y' )  ~r~n" + &
 "			  AND ( ctx_contract_contacts.ic_area = 'I' ) )),  ~r~n" + &
 "	contracted_entity = (SELECT top 1 group_multi_loc.rec_id       ~r~n" + &
 "	  			FROM ctx_loc,                  group_multi_loc  ~r~n" + &
 "				WHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id) ~r~n" + &
 "				AND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)  ~r~n" + &
 "				AND ctx_loc.loc_id = 0),     ~r~n" + &
 "	app_facility.facility_name facility_name,    ~r~n" + &
 "	ctx_basic_info.custom_date1,       ~r~n" + &
 "	ctx_basic_info.custom_date2,       ~r~n" + &
 "	ctx_basic_info.custom_date3,       ~r~n" + &
 "	ctx_basic_info.custom_date4,   ~r~n" + &
 "	ctx_basic_info.custom_date5,       ~r~n" + &
 "	ctx_basic_info.inserted_by_user,    ~r~n" + & 
 "	ctx_basic_info.inserted_at_date_time,  ~r~n" + &     
 "	ctx_basic_info.updated_by_user,    ~r~n" + &
 "	ctx_basic_info.updated_at_date_time,  ~r~n" + &     
 "	ctx_basic_info.custom_11,       ~r~n" + &
 "	ctx_basic_info.custom_12,    ~r~n" + &
 "	ctx_basic_info.custom_13,       ~r~n" + &
 "	ctx_basic_info.custom_14,       ~r~n" + &
 "	ctx_basic_info.custom_15,   ~r~n" + &
 "	ctx_basic_info.custom_16,       ~r~n" + &
 "	ctx_basic_info.custom_17,       ~r~n" + &
 "	ctx_basic_info.custom_18,       ~r~n" + &
 "	ctx_basic_info.custom_19,       ~r~n" + &
 "	ctx_basic_info.custom_20,      ~r~n" + &
 "	ctx_basic_info.custom_date6,     ~r~n" + &  
 "	ctx_basic_info.custom_date7,     ~r~n" + &  
 "	ctx_basic_info.custom_date8,   ~r~n" + &
 "	ctx_basic_info.custom_date9,       ~r~n" + &
 "	ctx_basic_info.custom_date10,     ~r~n" + &  
 "	ctx_basic_info.custom_date11,     ~r~n" + &  
 "	ctx_basic_info.custom_date12,     ~r~n" + &  
 "	ctx_basic_info.custom_date13,   ~r~n" + &
 "	ctx_basic_info.custom_date14,       ~r~n" + &
 "	ctx_basic_info.custom_date15,       ~r~n" + &
 "	ctx_basic_info.custom_n1,  ~r~n" + &
 "	ctx_basic_info.custom_n2,       ~r~n" + &
 "	ctx_basic_info.custom_n3,       ~r~n" + &
 "	ctx_basic_info.custom_n4,       ~r~n" + &
 "	ctx_basic_info.custom_n5,       ~r~n" + &
 "	ctx_basic_info.custom_n6,   ~r~n" + &
 "	ctx_basic_info.custom_n7,       ~r~n" + &
 "	ctx_basic_info.custom_n8,       ~r~n" + &
 "	ctx_basic_info.custom_n9,    ~r~n" + &
 "	ctx_basic_info.custom_n10,       ~r~n" + &
 "	ctx_basic_info.custom_n11,       ~r~n" + &
 "	ctx_basic_info.custom_n12,       ~r~n" + &
 "	ctx_basic_info.custom_n13,       ~r~n" + &
 "	ctx_basic_info.custom_n14,       ~r~n" + &
 "	ctx_basic_info.custom_n15,       ~r~n" + &
 "	ctx_basic_info.custom_n16,       ~r~n" + &
 "	ctx_basic_info.custom_n17,       ~r~n" + &
 "	ctx_basic_info.custom_n18,       ~r~n" + &
 "	ctx_basic_info.custom_n19,       ~r~n" + &
 "	ctx_basic_info.custom_n20,       ~r~n" + &
 "	ctx_basic_info.custom_n21,       ~r~n" + &
 "	ctx_basic_info.custom_n22,       ~r~n" + &
 "	ctx_basic_info.custom_n23,       ~r~n" + &
 "	ctx_basic_info.custom_n24,       ~r~n" + &
 "	ctx_basic_info.custom_n25,       ~r~n" + &
 "	ctx_basic_info.version_number,      ~r~n" + & 
 "	ctx_basic_info.version_date,       ~r~n" + &
 "	ctx_basic_info.master_contract_name , ~r~n" + &
 "	ctx_basic_info.fee_sched_calc_field_1 , ~r~n" + &
 "	ctx_basic_info.fee_sched_calc_field_2 , ~r~n" + &
 "	ctx_basic_info.fee_sched_calc_field_3 , ~r~n" + &
 "	access = AA.access   , ~r~n" + &
 "	code_lookup2.code status_name, ~r~n" + &
 "	code_lookup3.code category_name, ~r~n" + &
 "	code_lookup4.code contract_type_name, ~r~n" + &
 "	code_lookup5.code dvision_name , ~r~n" + &
 "	unread_email_cnt = 0,  ~r~n" + &
 "	ctx_basic_info.custom_percent_1,~r~n" + &
 "	ctx_basic_info.custom_percent_2, ~r~n" + &
 "	ctx_basic_info.custom_percent_3, ~r~n" + &
 "	ctx_basic_info.custom_percent_4, ~r~n" + &
 "	ctx_basic_info.custom_percent_5, ~r~n" + &
 "	ctx_basic_info.custom_percent_6, ~r~n" + &
 "	ctx_basic_info.custom_percent_7, ~r~n" + &
 "	ctx_basic_info.custom_percent_8, ~r~n" + &
 "	ctx_basic_info.custom_percent_9, ~r~n" + &
 "	ctx_basic_info.custom_percent_10,~r~n" + & 
 "	ctx_basic_info.work_flow_n1, ~r~n" + &
 "	ctx_basic_info.work_flow_n2, ~r~n" + &
 "	ctx_basic_info.work_flow_n3, ~r~n" + &
 "	ctx_basic_info.work_flow_n4, ~r~n" + &
 "	ctx_basic_info.work_flow_n5, ~r~n" + &
 "	ctx_basic_info.custom_status1, ~r~n" + &
 "	ctx_basic_info.custom_status2, ~r~n" + &
 "	ctx_basic_info.custom_21, ~r~n" + &
 "	ctx_basic_info.custom_22, ~r~n" + &
 "	ctx_basic_info.custom_n26, ~r~n" + &
 "	ctx_basic_info.custom_n27, ~r~n" + &
 "	ctx_basic_info.custom_date16, ~r~n" + &
 "	ctx_basic_info.custom_date17, ~r~n" + &
 "	app_facility.city, ~r~n" + &
 "	app_facility.state, ~r~n" + &
 "	app_facility.country, ~r~n" + &
 "	app_facility.zip, ~r~n" + &
 "	app_facility.street, ~r~n" + &
 "	ctx_custom.custom_1 as custom2_custom_1, ~r~n" + &
 "  ctx_custom.custom_2 as custom2_custom_2,    ~r~n" + &
 "  ctx_custom.custom_3 as custom2_custom_3,    ~r~n" + &
 "  ctx_custom.custom_4 as custom2_custom_4,    ~r~n" + &
 "   ctx_custom.custom_5 as custom2_custom_5,    ~r~n" + &
 "   ctx_custom.custom_6 as custom2_custom_6,    ~r~n" + &
 "    ctx_custom.custom_7 as custom2_custom_7,  ~r~n" + &  
 "    ctx_custom.custom_8 as custom2_custom_8,  ~r~n" + &  
 "    ctx_custom.custom_9 as custom2_custom_9,  ~r~n" + &  
 "    ctx_custom.custom_10 as custom2_custom_10, ~r~n" + &   
 "    ctx_custom.custom_11 as custom2_custom_11,   ~r~n" + & 
 "    ctx_custom.custom_12 as custom2_custom_12,   ~r~n" + & 
 "    ctx_custom.custom_13 as custom2_custom_13,   ~r~n" + & 
 "    ctx_custom.custom_14 as custom2_custom_14,   ~r~n" + & 
 "    ctx_custom.custom_15 as custom2_custom_15,   ~r~n" + & 
 "    ctx_custom.custom_16 as custom2_custom_16,   ~r~n" + & 
 "    ctx_custom.custom_17 as custom2_custom_17,   ~r~n" + & 
 "    ctx_custom.custom_18 as custom2_custom_18,    ~r~n" + &
 "    ctx_custom.custom_19 as custom2_custom_19,    ~r~n" + &
 "    ctx_custom.custom_20 as custom2_custom_20,    ~r~n" + &
 "    ctx_custom.custom_date1 as custom2_custom_date1, ~r~n" + &   
 "    ctx_custom.custom_date2 as custom2_custom_date2, ~r~n" + &   
 "    ctx_custom.custom_date3 as custom2_custom_date3, ~r~n" + &   
 "    ctx_custom.custom_date4 as custom2_custom_date4,  ~r~n" + &  
 "    ctx_custom.custom_date5 as custom2_custom_date5,   ~r~n" + & 
 "    ctx_custom.custom_date6 as custom2_custom_date6,   ~r~n" + & 
 "    ctx_custom.custom_date7 as custom2_custom_date7,   ~r~n" + & 
 "    ctx_custom.custom_date8 as custom2_custom_date8,   ~r~n" + & 
 "    ctx_custom.custom_date9 as custom2_custom_date9,   ~r~n" + & 
 "    ctx_custom.custom_date10 as custom2_custom_date10, ~r~n" + &   
 "    ctx_custom.custom_date11 as custom2_custom_date11,   ~r~n" + & 
 "    ctx_custom.custom_date12 as custom2_custom_date12,   ~r~n" + & 
 "    ctx_custom.custom_date13 as custom2_custom_date13,   ~r~n" + & 
 "    ctx_custom.custom_date14 as custom2_custom_date14, ~r~n" + &   
 "    ctx_custom.custom_date15 as custom2_custom_date15, ~r~n" + &   
 "    ctx_custom.custom_n1 as custom2_custom_n1,    ~r~n" + &
 "    ctx_custom.custom_n2 as custom2_custom_n2,    ~r~n" + &
 "    ctx_custom.custom_n3 as custom2_custom_n3,    ~r~n" + &
 "    ctx_custom.custom_n4 as custom2_custom_n4,    ~r~n" + &
 "    ctx_custom.custom_n5 as custom2_custom_n5,    ~r~n" + &
 "    ctx_custom.custom_n6 as custom2_custom_n6,    ~r~n" + &
 "    ctx_custom.custom_n7 as custom2_custom_n7,    ~r~n" + &
 "    ctx_custom.custom_n8 as custom2_custom_n8,    ~r~n" + &
 "    ctx_custom.custom_n9 as custom2_custom_n9,    ~r~n" + &
 "    ctx_custom.custom_n10 as custom2_custom_n10,    ~r~n" + &
 "    ctx_custom.custom_n11 as custom2_custom_n11,    ~r~n" + &
 "    ctx_custom.custom_n12 as custom2_custom_n12,    ~r~n" + &
 "    ctx_custom.custom_n13 as custom2_custom_n13,    ~r~n" + &
 "    ctx_custom.custom_n14 as custom2_custom_n14,    ~r~n" + &
 "    ctx_custom.custom_n15 as custom2_custom_n15,    ~r~n" + &
 "    ctx_custom.custom_n16 as custom2_custom_n16,    ~r~n" + &
 "    ctx_custom.custom_n17 as custom2_custom_n17,    ~r~n" + &
 "    ctx_custom.custom_n18 as custom2_custom_n18,    ~r~n" + &
 "    ctx_custom.custom_n19 as custom2_custom_n19,    ~r~n" + &
 "    ctx_custom.custom_n20 as custom2_custom_n20,    ~r~n" + &
 "    ctx_custom.custom_n21 as custom2_custom_n21,    ~r~n" + &
 "    ctx_custom.custom_n22 as custom2_custom_n22,    ~r~n" + &
 "    ctx_custom.custom_n23 as custom2_custom_n23,    ~r~n" + &
 "    ctx_custom.custom_n24 as custom2_custom_n24,    ~r~n" + &
 "    ctx_custom.custom_n25 as custom2_custom_n25,    ~r~n" + &
 "    ctx_custom.custom_21 as custom2_custom_21,    ~r~n" + &
 "    ctx_custom.custom_22 as custom2_custom_22,    ~r~n" + &
 "    ctx_custom.custom_notes_1 as custom2_custom_notes_1,   ~r~n" + &
 "    ctx_custom.custom_notes_2 as custom2_custom_notes_2,    ~r~n" + &
 "    ctx_custom.custom_notes_3 as custom2_custom_notes_3,    ~r~n" + &
 "    ctx_custom.custom_notes_4 as custom2_custom_notes_4,    ~r~n" + &
 "    ctx_custom.custom_notes_5 as custom2_custom_notes_5,    ~r~n" + &
 "    ctx_custom.custom_money_1 as custom2_custom_money_1,    ~r~n" + &
 "    ctx_custom.custom_money_2 as custom2_custom_money_2,    ~r~n" + &
 "    ctx_custom.custom_money_3 as custom2_custom_money_3,    ~r~n" + &
 "    ctx_custom.custom_percent_1 as custom2_custom_percent_1,    ~r~n" + &
 "	ctx_custom.custom_percent_2 as custom2_custom_percent_2,    ~r~n" + &
 "    ctx_custom.custom_percent_3 as custom2_custom_percent_3,    ~r~n" + &
 "    ctx_custom.custom_percent_4 as custom2_custom_percent_4,    ~r~n" + &
 "    ctx_custom.custom_percent_5 as custom2_custom_percent_5,    ~r~n" + &
 "    ctx_custom.custom_percent_6 as custom2_custom_percent_6,    ~r~n" + &
 "    ctx_custom.custom_percent_7 as custom2_custom_percent_7,    ~r~n" + &
 "    ctx_custom.custom_percent_8 as custom2_custom_percent_8,    ~r~n" + &
 "    ctx_custom.custom_percent_9 as custom2_custom_percent_9,    ~r~n" + &
 "    ctx_custom.custom_percent_10 as custom2_custom_percent_10,   ~r~n" + &
 "    has_docs = Isnull(ctx_am_documents.has_docs,0), ~r~n" + &
 "   ctx_basic_info.contract_department, ~r~n" + &
  "  v_ctx_occi2.occi_name,~r~n" + &
 "   v_ctx_ccci2.ccci_name~r~n" + &
 "	FROM  ctx_basic_info   ~r~n" + &
 "	LEFT OUTER JOIN v_ctx_ccci2 ON ctx_basic_info.ctx_id = v_ctx_ccci2.ctx_id	 ~r~n" + &
 "	LEFT OUTER JOIN v_ctx_occi2 ON ctx_basic_info.ctx_id = v_ctx_occi2.ctx_id~r~n" + &
 "	LEFT OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id ~r~n" + &  
 "	LEFT OUTER JOIN code_lookup ON ctx_products.product_id = code_lookup.lookup_code   ~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup1 ON ctx_products.product_type = code_lookup1.lookup_code~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code ~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code ~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code ~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code ~r~n" + &
 "	LEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id   ~r~n" + &
 "	LEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id  ~r~n" + &
 "	LEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id,   ~r~n" + &
 "	#temp_right AA  ~r~n" + &
 "	WHERE ctx_basic_info.ctx_id = AA.ctx_id and ctx_basic_info.is_template = 0  ~r~n" + &
 "	ORDER BY ctx_basic_info.master_contract_id Asc, ctx_basic_info.ctx_id  Asc  ~r~n" + &   
 "END ~r~n" + &
 "/*********display one row if ctx have multi product*******/~r~n" + &
 "else ~r~n" + &
 "BEGIN ~r~n" + &
 "	WITH v_ctx_ccci as~r~n" + &
"	(~r~n" + &
" 	 SELECT ctx_contract_contacts.ctx_id,   ~r~n" + &
"         'name' = ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'')~r~n" + &
"   	FROM  ctx_contract_contacts,ctx_contacts~r~n" + &
"   	WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id    ~r~n" + &
"   	AND   ctx_contract_contacts.ic_area = 'E' ~r~n" + &
"	),~r~n" + &
"	v_ctx_ccci2 as ~r~n" + &
"	( ~r~n" + &
"  	 select aa.ctx_id, ~r~n" + &
"	      ccci_name = ltrim(stuff((select '; ' + name from v_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))~r~n" + &
"  	 from v_ctx_ccci aa~r~n" + &
"  	 group by aa.ctx_id~r~n" + &
"	),~r~n" + &
"	v_ctx_occi as~r~n" + &
"	(~r~n" + &
"   	SELECT ctx_contract_contacts.ctx_id,   ~r~n" + &
"         'name' = ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'')~r~n" + &
"   	FROM  ctx_contract_contacts,ctx_contacts~r~n" + &
"   	WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id   ~r~n" + & 
"   	AND   ctx_contract_contacts.ic_area = 'I'~r~n" + &
"	),~r~n" + &
"	v_ctx_occi2 as ~r~n" + &
"	( ~r~n" + &
"	 select aa.ctx_id, ~r~n" + &
"	 occi_name = ltrim(stuff((select '; ' + name from v_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))~r~n" + &
"     from v_ctx_occi aa~r~n" + &
"     group by aa.ctx_id~r~n" + &
"	),~r~n" + &
 "	v_ctx_products as~r~n" + &
 "	( ~r~n" + &
 "	  select a.ctx_id,a.product_id,a.product_type,b.code product_name,c.code product_type_name ~r~n" + &
 "	  from ctx_products a ~r~n" + &
 "	  LEFT OUTER JOIN code_lookup b ON a.product_id = b.lookup_code   ~r~n" + &
 "    LEFT OUTER JOIN code_lookup c ON a.product_type = c.lookup_code ~r~n" + &
 "	 ),~r~n" + &
 "	v_ctx_products2 as ~r~n" + &
 "	( ~r~n" + &
 "	  select aa.ctx_id, ~r~n" + &
 "  	  product_id = (select top 1 product_id from v_ctx_products where ctx_id = aa.ctx_id),~r~n" + &
 "	  product_name = stuff((select ',' + product_name from v_ctx_products where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''),~r~n" + &
 "	  product_type_name = stuff((select ',' + product_type_name from v_ctx_products where ctx_id=aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , '')~r~n" + &
 "     from v_ctx_products aa~r~n" + &
 "     group by aa.ctx_id~r~n" + &
 "    )~r~n" + &
 "	SELECT DISTINCT  ~r~n" + &
 "	ctx_basic_info.app_facility,     ~r~n" + &
 "	v_ctx_products2.product_id product_code,     ~r~n" + &
 "	v_ctx_products2.product_name,        ~r~n" + &
 "	ctx_basic_info.effective_date,       ~r~n" + &
 "	ctx_basic_info.expriation_date,        ~r~n" + &
 "	ctx_basic_info.status,      ~r~n" + &
 "	ctx_basic_info.group_multi_loc_id,   ~r~n" + &
 "	ctx_basic_info.ctx_id, ~r~n" + &
 " 	ctx_basic_info.master_contract_id,~r~n" + &
 " 	master_cnt = (SELECT Count(ctx_basic_info1.ctx_id)~r~n" + &
 "			FROM ctx_basic_info ctx_basic_info1  ~r~n" + &
 "			WHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ),  ~r~n" + &
 "	ctx_basic_info.category,         ~r~n" + &
 "	ctx_basic_info.facility_id,      ~r~n" + &
 "	ctx_basic_info.contract_type,        ~r~n" + &
 "	v_ctx_products2.product_type_name product_type,~r~n" + &
 "	ctx_basic_info.reimbursment_menth,        ~r~n" + &
 "	ctx_basic_info.file_location,     ~r~n" + &
 "	ctx_basic_info.review_date,        ~r~n" + &
 "	ctx_basic_info.review_by,      ~r~n" + &
 "	ctx_basic_info.term_date,        ~r~n" + &
 "	ctx_basic_info.term_reason,      ~r~n" + &
 "	ctx_basic_info.last_revis_date,   ~r~n" + &
 "	ctx_basic_info.other_date_1,      ~r~n" + &
 "	ctx_basic_info.other_date_2,      ~r~n" + &
 "	ctx_basic_info.oc_signed_by,        ~r~n" + &
 "	ctx_basic_info.oc_title,       ~r~n" + &
 "	ctx_basic_info.oc_department,        ~r~n" + &
 "	ctx_basic_info.oc_legal_rep,        ~r~n" + &
 "	ctx_basic_info.cc_signed_by,      ~r~n" + &
 "	ctx_basic_info.cc_title,        ~r~n" + &
 "	ctx_basic_info.cc_department,        ~r~n" + &
 "	ctx_basic_info.cc_legal_rep,      ~r~n" + &
 "	ctx_basic_info.notes,        ~r~n" + &
 "	ctx_basic_info.keyword,        ~r~n" + &
 "	ctx_basic_info.dvision,    ~r~n" + &
 "	ctx_basic_info.custom_1,        ~r~n" + &
 "	ctx_basic_info.custom_2,        ~r~n" + &
 "	ctx_basic_info.custom_3,        ~r~n" + &
 "	ctx_basic_info.custom_4,        ~r~n" + &
 "	ctx_basic_info.custom_5,      ~r~n" + &
 "	ctx_basic_info.custom_6,       ~r~n" + &
 "	ctx_basic_info.custom_7,        ~r~n" + &
 "	ctx_basic_info.custom_8,  ~r~n" + &
 "	ctx_basic_info.custom_9,        ~r~n" + &
 "	ctx_basic_info.custom_10,     ~r~n" + &
 "	ctx_basic_info.group_id, ~r~n" + &
 "	ctx_basic_info.revision_reason,   ~r~n" + &
 "	ctx_basic_info.record_id ,    ~r~n" + &
 "	owner = upper((SELECT top 1 ctx_contacts.user_d ~r~n" + &     
 "			FROM ctx_contacts,ctx_contract_contacts  ~r~n" + &
 "			WHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )  ~r~n" + &
 "			AND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )  ~r~n" + &
 "			  AND ( ctx_contract_contacts.owner = 'Y' )  ~r~n" + &
 "			  AND ( ctx_contract_contacts.ic_area = 'I' ) )),   ~r~n" + &
 "	contracted_entity = (SELECT top 1 group_multi_loc.rec_id   ~r~n" + &
 "	  			FROM ctx_loc,                  group_multi_loc  ~r~n" + &
 "				WHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id)  ~r~n" + &
 "				AND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)  ~r~n" + &
 "				AND ctx_loc.loc_id = 0),     ~r~n" + &
 "	app_facility.facility_name facility_name,    ~r~n" + &
 "	ctx_basic_info.custom_date1,       ~r~n" + &
 "	ctx_basic_info.custom_date2,       ~r~n" + &
 "	ctx_basic_info.custom_date3,       ~r~n" + &
 "	ctx_basic_info.custom_date4,   ~r~n" + &
 "	ctx_basic_info.custom_date5,       ~r~n" + &
 "	ctx_basic_info.inserted_by_user,     ~r~n" + &
 "	ctx_basic_info.inserted_at_date_time, ~r~n" + &
 "	ctx_basic_info.updated_by_user,    ~r~n" + &
 "	ctx_basic_info.updated_at_date_time,  ~r~n" + &
 "	ctx_basic_info.custom_11,       ~r~n" + &
 "	ctx_basic_info.custom_12,    ~r~n" + &
 "	ctx_basic_info.custom_13,       ~r~n" + &
 "	ctx_basic_info.custom_14,       ~r~n" + &
 "	ctx_basic_info.custom_15,   ~r~n" + &
 "	ctx_basic_info.custom_16,       ~r~n" + &
 "	ctx_basic_info.custom_17,       ~r~n" + &
 "	ctx_basic_info.custom_18,       ~r~n" + &
 "	ctx_basic_info.custom_19,       ~r~n" + &
 "	ctx_basic_info.custom_20,      ~r~n" + &
 "	ctx_basic_info.custom_date6,     ~r~n" + &
 "	ctx_basic_info.custom_date7,    ~r~n" + &
 "	ctx_basic_info.custom_date8,   ~r~n" + &
 "	ctx_basic_info.custom_date9,     ~r~n" + &
 "	ctx_basic_info.custom_date10,    ~r~n" + &
 "	ctx_basic_info.custom_date11,   ~r~n" + &
 "	ctx_basic_info.custom_date12,    ~r~n" + &
 "	ctx_basic_info.custom_date13,   ~r~n" + &
 "	ctx_basic_info.custom_date14,    ~r~n" + &
 "	ctx_basic_info.custom_date15,    ~r~n" + &
 "	ctx_basic_info.custom_n1,  ~r~n" + &
 "	ctx_basic_info.custom_n2,       ~r~n" + &
 "	ctx_basic_info.custom_n3,       ~r~n" + &
 "	ctx_basic_info.custom_n4,       ~r~n" + &
 "	ctx_basic_info.custom_n5,       ~r~n" + &
 "	ctx_basic_info.custom_n6,   ~r~n" + &
 "	ctx_basic_info.custom_n7,    ~r~n" + &
 "	ctx_basic_info.custom_n8,       ~r~n" + &
 "	ctx_basic_info.custom_n9,    ~r~n" + &
 "	ctx_basic_info.custom_n10,       ~r~n" + &
 "	ctx_basic_info.custom_n11,       ~r~n" + &
 "	ctx_basic_info.custom_n12,       ~r~n" + &
 "	ctx_basic_info.custom_n13,       ~r~n" + &
 "	ctx_basic_info.custom_n14,       ~r~n" + &
 "	ctx_basic_info.custom_n15,       ~r~n" + &
 "	ctx_basic_info.custom_n16,       ~r~n" + &
 "	ctx_basic_info.custom_n17,       ~r~n" + &
 "	ctx_basic_info.custom_n18,       ~r~n" + &
 "	ctx_basic_info.custom_n19,       ~r~n" + &
 "	ctx_basic_info.custom_n20,       ~r~n" + &
 "	ctx_basic_info.custom_n21,       ~r~n" + &
 "	ctx_basic_info.custom_n22,       ~r~n" + &
 "	ctx_basic_info.custom_n23,       ~r~n" + &
 "	ctx_basic_info.custom_n24,       ~r~n" + &
 "	ctx_basic_info.custom_n25,       ~r~n" + &
 "	ctx_basic_info.version_number,   ~r~n" + &
 "	ctx_basic_info.version_date,      ~r~n" + &
 "	ctx_basic_info.master_contract_name , ~r~n" + &
 "	ctx_basic_info.fee_sched_calc_field_1 , ~r~n" + &
 "	ctx_basic_info.fee_sched_calc_field_2 , ~r~n" + &
 "	ctx_basic_info.fee_sched_calc_field_3 , ~r~n" + &
 "	access = AA.access   , ~r~n" + &
 "	code_lookup2.code status_name, ~r~n" + &
 "	code_lookup3.code category_name, ~r~n" + &
 "	code_lookup4.code contract_type_name, ~r~n" + &
 "	code_lookup5.code dvision_name , ~r~n" + &
 "	unread_email_cnt = 0,  ~r~n" + &
 "	ctx_basic_info.custom_percent_1, ~r~n" + &
 "	ctx_basic_info.custom_percent_2, ~r~n" + &
 "	ctx_basic_info.custom_percent_3, ~r~n" + &
 "	ctx_basic_info.custom_percent_4, ~r~n" + &
 "	ctx_basic_info.custom_percent_5, ~r~n" + &
 "	ctx_basic_info.custom_percent_6, ~r~n" + &
 "	ctx_basic_info.custom_percent_7, ~r~n" + &
 "	ctx_basic_info.custom_percent_8, ~r~n" + &
 "	ctx_basic_info.custom_percent_9, ~r~n" + &
 "	ctx_basic_info.custom_percent_10, ~r~n" + &
 "	ctx_basic_info.work_flow_n1, ~r~n" + &
 "	ctx_basic_info.work_flow_n2, ~r~n" + &
 "	ctx_basic_info.work_flow_n3, ~r~n" + &
 "	ctx_basic_info.work_flow_n4, ~r~n" + &
 "	ctx_basic_info.work_flow_n5, ~r~n" + &
 "	ctx_basic_info.custom_status1, ~r~n" + &
 "	ctx_basic_info.custom_status2, ~r~n" + &
 "	ctx_basic_info.custom_21, ~r~n" + &
 "	ctx_basic_info.custom_22, ~r~n" + &
 "	ctx_basic_info.custom_n26, ~r~n" + &
 "	ctx_basic_info.custom_n27, ~r~n" + &
 "	ctx_basic_info.custom_date16, ~r~n" + &
 "	ctx_basic_info.custom_date17, ~r~n" + &
 "	app_facility.city, ~r~n" + &
 "	app_facility.state, ~r~n" + &
 "	app_facility.country, ~r~n" + &
 "	app_facility.zip, ~r~n" + &
 "	app_facility.street, ~r~n" + &
 "	ctx_custom.custom_1 as custom2_custom_1,   ~r~n" + &
 "    ctx_custom.custom_2 as custom2_custom_2,   ~r~n" + &
 "    ctx_custom.custom_3 as custom2_custom_3,   ~r~n" + &
 "    ctx_custom.custom_4 as custom2_custom_4,   ~r~n" + &
 "    ctx_custom.custom_5 as custom2_custom_5,   ~r~n" + &
 "    ctx_custom.custom_6 as custom2_custom_6,    ~r~n" + &
 "    ctx_custom.custom_7 as custom2_custom_7,    ~r~n" + &
 "    ctx_custom.custom_8 as custom2_custom_8,    ~r~n" + &
 "    ctx_custom.custom_9 as custom2_custom_9,    ~r~n" + &
 "    ctx_custom.custom_10 as custom2_custom_10,    ~r~n" + &
 "    ctx_custom.custom_11 as custom2_custom_11,    ~r~n" + &
 "   ctx_custom.custom_12 as custom2_custom_12,    ~r~n" + &
 "    ctx_custom.custom_13 as custom2_custom_13,    ~r~n" + &
 "    ctx_custom.custom_14 as custom2_custom_14,    ~r~n" + &
 "    ctx_custom.custom_15 as custom2_custom_15,    ~r~n" + &
 "    ctx_custom.custom_16 as custom2_custom_16,    ~r~n" + &
 "    ctx_custom.custom_17 as custom2_custom_17,    ~r~n" + &
 "    ctx_custom.custom_18 as custom2_custom_18,    ~r~n" + &
 "    ctx_custom.custom_19 as custom2_custom_19,    ~r~n" + &
 "    ctx_custom.custom_20 as custom2_custom_20,    ~r~n" + &
 "    ctx_custom.custom_date1 as custom2_custom_date1, ~r~n" + &   
 "  ctx_custom.custom_date2 as custom2_custom_date2,   ~r~n" + & 
 "   ctx_custom.custom_date3 as custom2_custom_date3,   ~r~n" + & 
 "   ctx_custom.custom_date4 as custom2_custom_date4,   ~r~n" + & 
 "    ctx_custom.custom_date5 as custom2_custom_date5,   ~r~n" + & 
 "    ctx_custom.custom_date6 as custom2_custom_date6,   ~r~n" + & 
 "    ctx_custom.custom_date7 as custom2_custom_date7,   ~r~n" + & 
 "    ctx_custom.custom_date8 as custom2_custom_date8,   ~r~n" + & 
 "    ctx_custom.custom_date9 as custom2_custom_date9,   ~r~n" + & 
 "    ctx_custom.custom_date10 as custom2_custom_date10, ~r~n" + &   
 "    ctx_custom.custom_date11 as custom2_custom_date11,   ~r~n" + & 
 "    ctx_custom.custom_date12 as custom2_custom_date12,   ~r~n" + & 
 "    ctx_custom.custom_date13 as custom2_custom_date13,   ~r~n" + & 
 "    ctx_custom.custom_date14 as custom2_custom_date14,   ~r~n" + & 
 "    ctx_custom.custom_date15 as custom2_custom_date15,   ~r~n" + & 
 "    ctx_custom.custom_n1 as custom2_custom_n1,    ~r~n" + &
 "    ctx_custom.custom_n2 as custom2_custom_n2,    ~r~n" + &
 "    ctx_custom.custom_n3 as custom2_custom_n3,    ~r~n" + &
 "    ctx_custom.custom_n4 as custom2_custom_n4,    ~r~n" + &
 "    ctx_custom.custom_n5 as custom2_custom_n5,    ~r~n" + &
 "    ctx_custom.custom_n6 as custom2_custom_n6,    ~r~n" + &
 "    ctx_custom.custom_n7 as custom2_custom_n7,    ~r~n" + &
 "    ctx_custom.custom_n8 as custom2_custom_n8,    ~r~n" + &
 "    ctx_custom.custom_n9 as custom2_custom_n9,    ~r~n" + &
 "    ctx_custom.custom_n10 as custom2_custom_n10,    ~r~n" + &
 "    ctx_custom.custom_n11 as custom2_custom_n11,  ~r~n" + &  
 "    ctx_custom.custom_n12 as custom2_custom_n12,    ~r~n" + &
 "    ctx_custom.custom_n13 as custom2_custom_n13,    ~r~n" + &
 "   ctx_custom.custom_n14 as custom2_custom_n14,  ~r~n" + &  
 "    ctx_custom.custom_n15 as custom2_custom_n15,   ~r~n" + & 
 "    ctx_custom.custom_n16 as custom2_custom_n16,   ~r~n" + &
 "    ctx_custom.custom_n17 as custom2_custom_n17,   ~r~n" + & 
 "    ctx_custom.custom_n18 as custom2_custom_n18,    ~r~n" + &
 "    ctx_custom.custom_n19 as custom2_custom_n19,    ~r~n" + &
 "    ctx_custom.custom_n20 as custom2_custom_n20,    ~r~n" + &
 "    ctx_custom.custom_n21 as custom2_custom_n21,    ~r~n" + &
 "    ctx_custom.custom_n22 as custom2_custom_n22,    ~r~n" + &
 "    ctx_custom.custom_n23 as custom2_custom_n23,    ~r~n" + &
 "    ctx_custom.custom_n24 as custom2_custom_n24,    ~r~n" + &
 "    ctx_custom.custom_n25 as custom2_custom_n25,    ~r~n" + &
 "    ctx_custom.custom_21 as custom2_custom_21,    ~r~n" + &
 "    ctx_custom.custom_22 as custom2_custom_22,    ~r~n" + &
 "    ctx_custom.custom_notes_1 as custom2_custom_notes_1,   ~r~n" + &
 "    ctx_custom.custom_notes_2 as custom2_custom_notes_2,   ~r~n" + & 
 "    ctx_custom.custom_notes_3 as custom2_custom_notes_3,   ~r~n" + & 
 "    ctx_custom.custom_notes_4 as custom2_custom_notes_4,   ~r~n" + & 
 "    ctx_custom.custom_notes_5 as custom2_custom_notes_5,    ~r~n" + &
 "    ctx_custom.custom_money_1 as custom2_custom_money_1,  ~r~n" + &  
 "    ctx_custom.custom_money_2 as custom2_custom_money_2,  ~r~n" + &  
 "    ctx_custom.custom_money_3 as custom2_custom_money_3,  ~r~n" + &  
 "    ctx_custom.custom_percent_1 as custom2_custom_percent_1,  ~r~n" + &  
 "    ctx_custom.custom_percent_2 as custom2_custom_percent_2,  ~r~n" + &  
 "    ctx_custom.custom_percent_3 as custom2_custom_percent_3,   ~r~n" + & 
 "    ctx_custom.custom_percent_4 as custom2_custom_percent_4,   ~r~n" + & 
 "    ctx_custom.custom_percent_5 as custom2_custom_percent_5,   ~r~n" + & 
 "    ctx_custom.custom_percent_6 as custom2_custom_percent_6,   ~r~n" + & 
 "    ctx_custom.custom_percent_7 as custom2_custom_percent_7,  ~r~n" + &  
 "    ctx_custom.custom_percent_8 as custom2_custom_percent_8,   ~r~n" + & 
 "    ctx_custom.custom_percent_9 as custom2_custom_percent_9,   ~r~n" + & 
 "    ctx_custom.custom_percent_10 as custom2_custom_percent_10, ~r~n" + &  
 "    has_docs = Isnull(ctx_am_documents.has_docs,0), ~r~n" + &
 "   ctx_basic_info.contract_department, ~r~n" + &
 "   v_ctx_occi2.occi_name,~r~n" + &
 "   v_ctx_ccci2.ccci_name~r~n" + &
 "	FROM  ctx_basic_info ~r~n" + &
 "	LEFT OUTER JOIN v_ctx_ccci2 ON ctx_basic_info.ctx_id = v_ctx_ccci2.ctx_id	 ~r~n" + &
 "	LEFT OUTER JOIN v_ctx_occi2 ON ctx_basic_info.ctx_id = v_ctx_occi2.ctx_id~r~n" + &
 "	LEFT OUTER JOIN v_ctx_products2 ON ctx_basic_info.ctx_id = v_ctx_products2.ctx_id    ~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code ~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code ~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code ~r~n" + &
 "	LEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code	~r~n" + &
 "	LEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id   ~r~n" + &
 "	LEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id ~r~n" + &
 "	LEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id,   ~r~n" + &
 "	#temp_right AA  ~r~n" + &
 "	WHERE ctx_basic_info.ctx_id = AA.ctx_id and ctx_basic_info.is_template = 0  ~r~n" + &
 "	ORDER BY ctx_basic_info.master_contract_id Asc, ctx_basic_info.ctx_id  Asc  ~r~n" + & 
 "END  "


//Added By Jay Chen 11-18-2014
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from sysobjects where name = 'uf_get_masterchild_sort' and type = 'FN') " + &
"  DROP FUNCTION uf_get_masterchild_sort "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create FUNCTION uf_get_masterchild_sort(@parent_ctx_id INT,@ctx_id INT ) RETURNS  VARCHAR(500) ~r~n " + &
"AS~r~n" + &
"BEGIN~r~n" + &
"~t~tDECLARE @master_ctx_id INT~r~n" + &
"~t~tDECLARE @new_ctx_id INT~r~n" + &
"~t~tDECLARE @return_string VARCHAR(500)~r~n" + &
"~t~tDECLARE @pos BIGINT~r~n" + &
"~t~tSET @return_string = ''~r~n" + &
"~t~tIF @parent_ctx_id > 0 ~r~n" + &
"~t~tBEGIN~r~n" + &
"~t~t~t~tSELECT @pos = a.pos~r~n" + &
"~t~t~t~tFROM~r~n" + &
"~t~t~t~t(~r~n" + &
"~t~t~t~tSELECT ctx_id,ROW_NUMBER() OVER(ORDER BY ctx_id ASC) pos FROM CTX_BASIC_INFO WHERE master_contract_id = @parent_ctx_id AND is_template = 0~r~n" + &
"~t~t~t~t) a~r~n" + &
"~t~t~t~tWHERE  a.ctx_id = @CTX_ID~r~n" + &
"~t~t~t~tIF @pos > 0 ~r~n" + &
"~t~t~t~tBEGIN~r~n" + &
"~t~t~t~t~t~tSET @return_string = CAST(@pos AS VARCHAR) ~r~n" + &
"~t~t~t~tEND~r~n" + &
"~t~tEND~r~n" + &
"~t~tELSE~r~n" + &
"~t~tBEGIN~r~n" + &
"~t~t~t~tSELECT @master_ctx_id = master_contract_id FROM CTX_BASIC_INFO WHERE ctx_id = @CTX_ID~r~n" + &
"~t~t~t~tWHILE (@master_ctx_id > 0) ~r~n" + &
"~t~t~t~tBEGIN~r~n" + &
"~t~t~t~t~t~tSELECT @pos = a.pos~r~n" + &
"~t~t~t~t~t~tFROM~r~n" + &
"~t~t~t~t~t~t(~r~n" + &
"~t~t~t~t~t~tSELECT ctx_id,ROW_NUMBER() OVER(ORDER BY ctx_id ASC) pos FROM CTX_BASIC_INFO WHERE master_contract_id = @master_ctx_id AND is_template = 0 ~r~n" + &
"~t~t~t~t~t~t) a~r~n" + &
"~t~t~t~t~t~tWHERE  a.ctx_id = @CTX_ID~r~n" + &
"~t~t~t~t~t~tIF @pos > 0 ~r~n" + &
"~t~t~t~t~t~t~t~tIF (@return_string IS NULL) OR (@return_string = '')~r~n" + &
"~t~t~t~t~t~t~t~tBEGIN~r~n" + &
"~t~t~t~t~t~t~t~t~t~tSET @return_string = CAST(@master_ctx_id AS VARCHAR) + '-' + CAST(@pos AS VARCHAR)~r~n" + &
"~t~t~t~t~t~t~t~tEND~r~n" + &
"~t~t~t~t~t~t~t~tELSE~r~n" + &
"~t~t~t~t~t~t~t~tBEGIN~r~n" + &
"~t~t~t~t~t~t~t~t~t~tSET @return_string = CAST(@master_ctx_id AS VARCHAR) + '-' + CAST(@pos AS VARCHAR) + '\' + @return_string~r~n" + &
"~t~t~t~t~t~t~t~tEND~r~n" + &
"~t~t~t~t~t~tSET @ctx_id = @master_ctx_id~r~n" + &
"~t~t~t~t~t~tSELECT @master_ctx_id = master_contract_id FROM CTX_BASIC_INFO WHERE ctx_id = @ctx_id~r~n" + &
"~t~t~t~tEND~r~n" + &
"~t~tEND~r~n" + &
"~t~tRETURN @return_string~r~n" + &
"END" 

//Added By Jay Chen 12-01-2014
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from sysobjects where name = 'uf_get_ctx_user_access' and type = 'TF') " + &
"  DROP FUNCTION uf_get_ctx_user_access "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create FUNCTION uf_get_ctx_user_access(@user_d VARCHAR(8000),@tdl_id INT)  RETURNS @tmp TABLE (ctx_id INT,user_id VARCHAR(20),access CHAR(1))~r~n " + &
"AS~r~n" + &
"BEGIN~r~n" + &
"~t~tDECLARE @temp_user TABLE(user_id VARCHAR(20))~r~n" + &
"~r~n" + &
"~t~tIF @user_d = ''~r~n" + &
"~t~tBEGIN~r~n" + &
"~t~t~t~tINSERT INTO @temp_user(user_id)~r~n" + &
"~t~t~t~tSelect Distinct security_users.user_id ~r~n" + &
"~t~t~t~tFROM tdl_basic_info,tdl_security_roles_rights,security_users 	~r~n" + &
"~t~t~t~tWHERE tdl_basic_info.tdl_id = tdl_security_roles_rights.tdl_id  ~r~n" + &
"~t~t~t~tAND tdl_security_roles_rights.role_id = security_users.role_id  ~r~n" + &
"~t~t~t~tAND tdl_security_roles_rights.access_rights = 1 ~r~n" + &
"~t~t~t~tAND tdl_basic_info.tdl_id = @tdl_id~r~n" + &
"~t~tEND~r~n" + &
"~t~tELSE~r~n" + &
"~t~tBEGIN~r~n" + &
"~t~t~t~tINSERT INTO @temp_user(user_id)~r~n" + &
"~t~t~t~tSelect @user_d ~r~n" + &
"~t~tEND~r~n" + &
"~r~n" + &
"~t~tINSERT INTO @tmp(ctx_id,user_id,access) ~r~n" + &
"~t~tSELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id, user_id = ctx_contacts.user_d, access = (CASE~r~n" + & 
"~t~tctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END) ~r~n" + &
"~t~tFROM ctx_contract_contacts Left Outer Join ~r~n" + &
"~t~t( ~r~n" + &
"~t~tSelect ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d  ~r~n" + &
"~t~tFrom ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1 ~r~n" + &
"~t~tWhere ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id ~r~n" + &
"~t~tAND EXISTS (SELECT 1 FROM @temp_user WHERE user_id = ctx_contacts1.user_d)~r~n" + &
"~t~tGroup By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d ~r~n" + &
"~t~tHaving Count(ctx_contract_contacts1.ctx_id) > 1 ~r~n" + &
"~t~t) ccc ~r~n" + &
"~t~tOn ctx_contract_contacts.ctx_id = ccc.ctx_id ~r~n" + &
"~t~t,ctx_contacts ~r~n" + &
"~t~tWHERE EXISTS (SELECT 1 FROM @temp_user WHERE user_id = ctx_contacts.user_d)~r~n" + &
"~t~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' ) ~r~n" + &
"~t~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id  ~r~n" + &
"~t~tAND ( ctx_contract_contacts.access IN ('F','R')  ~r~n" + &
"~t~tOR ctx_contract_contacts.owner = 'Y' ) ~r~n" + &
"~t~tAND ctx_contract_contacts.ic_area = 'I' ~r~n" + &
"~t~tUNION  ~r~n" + &
"~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id,user_id = security_group_users.user_id, access =  ~r~n" + &
"~t~tctx_group_access.access ~r~n" + &
"~t~tFROM  ~r~n" + &
"~t~tctx_group_access , ~r~n" + &
"~t~tsecurity_group_users, ~r~n" + &
"~t~ticred_settings ~r~n" + &
"~t~tWHERE EXISTS (SELECT 1 FROM @temp_user WHERE user_id = security_group_users.user_id)~r~n" + &
"~t~tAND ctx_group_access.group_id = security_group_users.group_id ~r~n" + &
"~t~tAND ctx_group_access.access =  ~r~n" + &
"~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access  ~r~n" + &
"~t~tFrom ctx_group_access a1,security_group_users u1 ~r~n" + &
"~t~tWhere a1.group_id = u1.group_id  ~r~n" + &
"~t~tAnd a1.ctx_id = ctx_group_access.ctx_id ~r~n" + &
"~t~tAnd u1.user_id = security_group_users.user_id	 ~r~n" + &
"~t~tAnd a1.access = 'F') Then 'F' Else 'R' End)  ~r~n" + &
"~t~tAND icred_settings.group_access = 1 ~r~n" + &
"~t~tAND ctx_group_access.access in ('F','R') ~r~n" + &
"~t~tAND NOT EXISTS	(SELECT 1 FROM ctx_contract_contacts, ctx_contacts ~r~n" + &
"~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )  ~r~n" + &
"~t~tAND ( ctx_contacts.user_d = security_group_users.user_id ) ~r~n" + &
"~t~tAND ( ctx_contract_contacts.ic_area = 'I' ) ~r~n" + &
"~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id ) ~r~n" + &
"~t~t) ~r~n" + &
"~t~tUNION ~r~n" + &
"~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, user_id = security_users.user_id, access = (CASE ~r~n" + &
"~t~tctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END) ~r~n" + &
"~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"~t~tWHERE EXISTS (SELECT 1 FROM @temp_user WHERE user_id = security_users.user_id)~r~n" + &
"~t~tAND ctx_acp_contract_management_right.types = 1 ~r~n" + &
"~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id ~r~n" + &
"~t~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category ~r~n" + &
"~t~tAnd ctx_basic_info.is_template = 0  ~r~n" + &
"~t~tAND ctx_acp_contract_management_right.rights In ('11','12') ~r~n" + &
"~t~tAND NOT EXISTS (SELECT 1 FROM ctx_contract_contacts, ctx_contacts   ~r~n" + &
"~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )  ~r~n" + &
"~t~tAND ( ctx_contacts.user_d = security_users.user_id AND ctx_contract_contacts.ic_area = 'I')  ~r~n" + &
"~t~tAND ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )  ~r~n" + &
"~t~tUNION ~r~n" + &
"~t~tSELECT 1 FROM ctx_group_access,security_group_users,icred_settings ~r~n" + &
"~t~tWHERE icred_settings.group_access = 1 ~r~n" + &
"~t~tAND (ctx_group_access.group_id = security_group_users.group_id ) ~r~n" + &
"~t~tAND ( security_group_users.user_id = security_users.user_id )	 ~r~n" + &
"~t~tAND ( ctx_group_access.ctx_id = ctx_basic_info.ctx_id ) ~r~n" + &
"~t~t) ~r~n" + &
"~t~tRETURN ~r~n" + &
"END"

//Added By Jay Chen 12-05-2014
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (SELECT name FROM sysobjects WHERE name = 'up_get_ctx_user_access' AND type = 'P') " + &
"    DROP PROCEDURE up_get_ctx_user_access "

//Modified By Jay Chen 03-24-2015
//"~t/*********prepare #temp_role data********/~r~n" + &
//		"~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,ctx_acp_contract_management_right.role_id,~r~n" + &
//			   "~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END)~r~n" + &
//		"~tinto #temp_role ~r~n" + &
//		"~tFROM ctx_acp_contract_management_right, ctx_basic_info ~r~n" + &
//		"~tWHERE ctx_acp_contract_management_right.types = 1 ~r~n" + &
//		"~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category ~r~n" + &
//		"~tAnd ctx_basic_info.is_template = 0  ~r~n" + &
//		"~tAND ctx_acp_contract_management_right.rights In ('11','12') ~r~n" + &
		
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create PROCEDURE up_get_ctx_user_access (@user_d VARCHAR(20)) ~r~n" + &
"AS~r~n" + &
"BEGIN~r~n" + &
		"~tIF object_id('tempdb..#temp_user') is not null ~r~n" + &
		"~tBegin~r~n" + &
			"~t~tDrop TABLE #temp_user;~r~n" + &
		"~tEnd ~r~n" + &
		"~t~r~n" + &
		"~tIF object_id('tempdb..#temp_ctx') is not null~r~n" + &
		"~tBegin~r~n" + &
			"~t~tDrop TABLE #temp_ctx;~r~n" + &
		"~tEnd ~r~n" + &
		"~t~r~n" + &
		"~tIF object_id('tempdb..#temp_role') is not null~r~n" + &
		"~tBegin~r~n" + &
			"~t~tDrop TABLE #temp_role;~r~n" + &
		"~tEnd ~r~n" + &
		"~t~r~n" + &
		"~t/*********prepare #temp_ctx data********/~r~n" + &
		"~tSELECT ctx_contacts.user_d,ctx_contract_contacts.ctx_id into #temp_ctx~r~n" + &
		"~tFROM ctx_contract_contacts, ctx_contacts   ~r~n" + &
		"~tWHERE ctx_contacts.contact_id = ctx_contract_contacts.contact_id ~r~n" + &  
		"~tAND ctx_contract_contacts.ic_area = 'I'~r~n" + &
		"~tUNION     ~r~n" + &
		"~tSELECT security_group_users.user_id user_d,ctx_group_access.ctx_id~r~n" + &
		"~tFROM ctx_group_access,security_group_users,icred_settings ~r~n" + &
		"~tWHERE icred_settings.group_access = 1 ~r~n" + &
		"~tAND ctx_group_access.group_id = security_group_users.group_id~r~n" + &
		"~t~r~n" + &
		"~t/*********prepare #temp_role data********/~r~n" + &
		"~tSELECT b.ctx_id,b.role_id,(CASE WHEN b.rcnt=0 THEN 'F' ELSE 'R' END) access  ~r~n" + &
		"~tinto #temp_role ~r~n" + &
		"~tFROM ~r~n" + &
		"~t( ~r~n" + &
		"~tSELECT DISTINCT a.ctx_id,a.role_id, ~r~n" + &
		"~tSUM(CASE a.access WHEN 'F' THEN 1 ELSE 0 END) fcnt, ~r~n" + &
		"~tSUM(CASE a.access WHEN 'R' THEN 1 ELSE 0 END) rcnt ~r~n" + &
		"~tFROM  ~r~n" + &
		"~t( ~r~n" + &
		"~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,ctx_acp_contract_management_right.role_id,~r~n" + &
	     "~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END)~r~n" + &
		"~tFROM ctx_acp_contract_management_right, ctx_basic_info ~r~n" + &
		"~tWHERE ctx_acp_contract_management_right.types = 1 ~r~n" + &
		"~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category ~r~n" + &
		"~tAnd ctx_basic_info.is_template = 0  ~r~n" + &
		"~tAND ctx_acp_contract_management_right.rights In ('11','12','13') ~r~n" + &
		"~tunion~r~n" + &
		"~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,ctx_acp_contract_management_right.role_id,~r~n" + &
	     "~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '61' THEN 'F' WHEN '62' THEN 'R' ELSE 'N' END)~r~n" + &
		"~tFROM ctx_acp_contract_management_right, ctx_basic_info ~r~n" + &
		"~tWHERE ctx_acp_contract_management_right.types = 6 ~r~n" + &
		"~tAND ctx_acp_contract_management_right.category = ctx_basic_info.dvision ~r~n" + &
		"~tAnd ctx_basic_info.is_template = 0  ~r~n" + &
		"~tAND ctx_acp_contract_management_right.rights In ('61','62','63') ~r~n" + &
		"~tunion~r~n" + &
		"~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,ctx_acp_contract_management_right.role_id,~r~n" + &
	     "~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '71' THEN 'F' WHEN '72' THEN 'R' ELSE 'N' END)~r~n" + &
		"~tFROM ctx_acp_contract_management_right, ctx_basic_info ~r~n" + &
		"~tWHERE ctx_acp_contract_management_right.types = 7 ~r~n" + &
		"~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_department ~r~n" + &
		"~tAnd ctx_basic_info.is_template = 0  ~r~n" + &
		"~tAND ctx_acp_contract_management_right.rights In ('71','72','73') ~r~n" + &
		"~tunion~r~n" + &
		"~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,ctx_acp_contract_management_right.role_id,~r~n" + &
	     "~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '81' THEN 'F' WHEN '82' THEN 'R' ELSE 'N' END)~r~n" + &
		"~tFROM ctx_acp_contract_management_right, ctx_basic_info ~r~n" + &
		"~tWHERE ctx_acp_contract_management_right.types = 8 ~r~n" + &
		"~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_type ~r~n" + &
		"~tAnd ctx_basic_info.is_template = 0  ~r~n" + &
		"~tAND ctx_acp_contract_management_right.rights In ('81','82','83') ~r~n" + &
		"~t) a ~r~n" + &
		"~tGROUP BY a.ctx_id,a.role_id ~r~n" + &
   	    	"~tHAVING SUM(CASE a.access WHEN 'N' THEN 1 ELSE 0 END) = 0 ~r~n" + &
		"~t) b ~r~n" + &
		"~t~r~n" + &
		"~tIF @user_d = ''   /*********initial ctx_user_access_tmp data********/~r~n" + &
		"~tBEGIN~r~n" + &
			"~t~tSelect Distinct security_users.user_id into #temp_user~r~n" + &
			"~t~tFROM tdl_basic_info,tdl_security_roles_rights,security_users 	~r~n" + &
			"~t~tWHERE tdl_basic_info.tdl_id = tdl_security_roles_rights.tdl_id  ~r~n" + &
			"~t~tAND tdl_security_roles_rights.role_id = security_users.role_id  ~r~n" + &
			"~t~tAND tdl_security_roles_rights.access_rights = 1 ~r~n" + &
			"~t~r~n" + &
			"~t~ttruncate table ctx_user_access_tmp;~r~n" + &
		"~tEND~r~n" + &
		"~tELSE~r~n" + &
		"~tBEGIN~r~n" + &
			"~t~tdelete from ctx_user_access_tmp where user_id = @user_d;~r~n" + &
		"~tEND~r~n" + &
		"~t~r~n" + &
		"~tIF @user_d = ''   ~r~n" + &
		"~tbegin~r~n" + &
			"~t~tINSERT INTO ctx_user_access_tmp(ctx_id,user_id,access) ~r~n" + &
			"~t~tSELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id, user_id = ctx_contacts.user_d, access = (CASE~r~n" + &
			"~t~tctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END) ~r~n" + &
			"~t~tFROM ctx_contract_contacts Left Outer Join ~r~n" + &
			"~t~t( ~r~n" + &
			"~t~tSelect ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d  ~r~n" + &
			"~t~tFrom ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1 ~r~n" + &
			"~t~tWhere ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id ~r~n" + &
			"~t~tGroup By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d ~r~n" + &
			"~t~tHaving Count(ctx_contract_contacts1.ctx_id) > 1 ~r~n" + &
			"~t~t) ccc ~r~n" + &
			"~t~tOn ctx_contract_contacts.ctx_id = ccc.ctx_id ~r~n" + &
			"~t~t,ctx_contacts ~r~n" + &
			"~t~tWHERE EXISTS (SELECT 1 FROM #temp_user WHERE user_id = ctx_contacts.user_d)~r~n" + &
			"~t~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' ) ~r~n" + &
			"~t~tand ccc.user_d = ctx_contacts.user_d~r~n" + &
			"~t~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id  ~r~n" + &
			"~t~tAND ( ctx_contract_contacts.access IN ('F','R') OR ctx_contract_contacts.owner = 'Y' ) ~r~n" + &
			"~t~tAND ctx_contract_contacts.ic_area = 'I' ~r~n" + &
			"~t~tUNION  ~r~n" + &
			"~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id,user_id = security_group_users.user_id,access = ctx_group_access.access ~r~n" + &
			"~t~tFROM ctx_group_access ,security_group_users, icred_settings ~r~n" + &
			"~t~tWHERE EXISTS (SELECT 1 FROM #temp_user WHERE user_id = security_group_users.user_id)~r~n" + &
			"~t~tAND ctx_group_access.group_id = security_group_users.group_id ~r~n" + &
			"~t~tAND ctx_group_access.access =  ~r~n" + &
			"~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access  ~r~n" + &
			"~t~tFrom ctx_group_access a1,security_group_users u1 ~r~n" + &
			"~t~tWhere a1.group_id = u1.group_id  ~r~n" + &
			"~t~tAnd a1.ctx_id = ctx_group_access.ctx_id ~r~n" + &
			"~t~tAnd u1.user_id = security_group_users.user_id	 ~r~n" + &
			"~t~tAnd a1.access = 'F') Then 'F' Else 'R' End)  ~r~n" + &
			"~t~tAND icred_settings.group_access = 1 ~r~n" + &
			"~t~tAND ctx_group_access.access in ('F','R') ~r~n" + &
			"~t~tAND NOT EXISTS	(SELECT 1 FROM ctx_contract_contacts, ctx_contacts ~r~n" + &
			"~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )  ~r~n" + &
			"~t~tAND ( ctx_contacts.user_d = security_group_users.user_id ) ~r~n" + &
			"~t~tAND ( ctx_contract_contacts.ic_area = 'I' ) ~r~n" + &
			"~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id ) ~r~n" + &
			"~t~t) ~r~n" + &
			"~t~tUNION ~r~n" + &
			"~t~tselect #temp_role.ctx_id,security_users.user_id,#temp_role.access~r~n" + &
			"~t~tfrom #temp_role join security_users on #temp_role.role_id = security_users.role_id~r~n" + &
			"~t~tWHERE EXISTS (SELECT 1 FROM #temp_user WHERE user_id = security_users.user_id)~r~n" + &
			"~t~tAND NOT EXISTS(select 1 from #temp_ctx where #temp_ctx.user_d = security_users.user_id and #temp_ctx.ctx_id = #temp_role.ctx_id)~r~n" + &
		"~tend~r~n" + &
		"~t~r~n" + &
		"~telse  ~r~n" + &
		"~tbegin~r~n" + &
			"~t~tINSERT INTO ctx_user_access_tmp(ctx_id,user_id,access) ~r~n" + &
			"~t~tSELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id, user_id = ctx_contacts.user_d, access = (CASE~r~n" + &
			"~t~tctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END) ~r~n" + &
			"~t~tFROM ctx_contract_contacts Left Outer Join ~r~n" + &
			"~t~t( ~r~n" + &
			"~t~tSelect ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d  ~r~n" + &
			"~t~tFrom ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1 ~r~n" + &
			"~t~tWhere ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id ~r~n" + &
			"~t~tAND ctx_contacts1.user_d = @user_d~r~n" + &
			"~t~tGroup By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d ~r~n" + &
			"~t~tHaving Count(ctx_contract_contacts1.ctx_id) > 1 ~r~n" + &
			"~t~t) ccc ~r~n" + &
			"~t~tOn ctx_contract_contacts.ctx_id = ccc.ctx_id ~r~n" + &
			"~t~t,ctx_contacts ~r~n" + &
			"~t~tWHERE ctx_contacts.user_d = @user_d~r~n" + &
			"~t~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' ) ~r~n" + &
			"~t~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id  ~r~n" + &
			"~t~tAND ( ctx_contract_contacts.access IN ('F','R')  ~r~n" + &
			"~t~tOR ctx_contract_contacts.owner = 'Y' ) ~r~n" + &
			"~t~tAND ctx_contract_contacts.ic_area = 'I' ~r~n" + &
			"~t~tUNION  ~r~n" + &
			"~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id,user_id = security_group_users.user_id, access = ctx_group_access.access ~r~n" + &
			"~t~tFROM  ctx_group_access , security_group_users, icred_settings ~r~n" + &
			"~t~tWHERE security_group_users.user_id = @user_d~r~n" + &
			"~t~tAND ctx_group_access.group_id = security_group_users.group_id ~r~n" + &
			"~t~tAND ctx_group_access.access =  ~r~n" + &
			"~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access  ~r~n" + &
			"~t~tFrom ctx_group_access a1,security_group_users u1 ~r~n" + &
			"~t~tWhere a1.group_id = u1.group_id  ~r~n" + &
			"~t~tAnd a1.ctx_id = ctx_group_access.ctx_id ~r~n" + &
			"~t~tAnd u1.user_id = security_group_users.user_id	 ~r~n" + &
			"~t~tAnd a1.access = 'F') Then 'F' Else 'R' End)  ~r~n" + &
			"~t~tAND icred_settings.group_access = 1 ~r~n" + &
			"~t~tAND ctx_group_access.access in ('F','R') ~r~n" + &
			"~t~tAND NOT EXISTS	(SELECT 1 FROM ctx_contract_contacts, ctx_contacts ~r~n" + &
			"~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )  ~r~n" + &
			"~t~tAND ( ctx_contacts.user_d = security_group_users.user_id ) ~r~n" + &
			"~t~tAND ( ctx_contract_contacts.ic_area = 'I' ) ~r~n" + &
			"~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id ) ~r~n" + &
			"~t~t) ~r~n" + &
			"~t~tUNION ~r~n" + &
			"~t~tselect #temp_role.ctx_id,security_users.user_id,#temp_role.access~r~n" + &
			"~t~tfrom #temp_role join security_users on #temp_role.role_id = security_users.role_id~r~n" + &
			"~t~tWHERE security_users.user_id = @user_d~r~n" + &
			"~t~tAND NOT EXISTS(select 1 from #temp_ctx where #temp_ctx.user_d = security_users.user_id and #temp_ctx.ctx_id = #temp_role.ctx_id) ~r~n" + &
		"~tend	~r~n" + &
"END"



//Added By Mark Lee 01/19/2015
//Modified By Ken.Guo 2015-08-05. added roles_can_view column. modify create_date to getdate()
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'up_copy_reportwriter' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure up_copy_reportwriter~r~n" + &
"End ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"Create procedure  up_copy_reportwriter(@SourceDBName nvarchar(100),@TargetDBName nvarchar(100),@ReportID nvarchar(100),@NewReportName nvarchar(50),~r~n" + &
"~t~t~t~t@NewDataViewID nvarchar(100),@NewCategroy nvarchar(50),@NewModuser nvarchar(50),@CreateBy nvarchar(50))~r~n" + &
"As   ~r~n" + &
"Begin    ~r~n" + &
"~tdeclare @MaxReportID nvarchar(100), @SqlString nvarchar(4000), @ParmDefinition nvarchar(100)         ~r~n" + &
"~r~n" + &
"~t/*Get Seq No*/    ~r~n" + &
"~tselect @SqlString = 'select @MaxReportIDOUT = isnull(max(view_id),0) + 1  from ' + @TargetDBName + '.dbo.conv_view'    ~r~n" + &
"~tselect @ParmDefinition = '@MaxReportIDOUT int Output'    ~r~n" + &
"~texec sp_executesql @SqlString,@ParmDefinition,@MaxReportIDOUT=@MaxReportID output    ~r~n" + &
"~r~n" + &
"~t/*Insert conv_View Table*/    ~r~n" + &
"~tselect @SqlString = 'insert ' + @TargetDBName + '.dbo.conv_view (view_id,view_name,category,mod_user,created_by,data_view_id,project_id,add_rec_id_fld,'+~r~n" + &
"~t~t~t~t~t' distinct_sql,orientation,font_size,post_import_sql,create_date,detail_height,report_type,profile_title,header_height,footer_height,'+~r~n" + &
"~t~t~t~t~t' summary_height,module,advanced_linking,newpage_group,roles_can_view)'    ~r~n" + &
"~r~n" + &
"~tselect @SqlString = @SqlString + 'select ' + @MaxReportID + ',''' + @NewReportName +''',''' +  @NewCategroy +''',''' +  @NewModuser +''',''' +~r~n" + &
"~t~t~t~t~t@CreateBy +''',' +  @NewDataViewID +',project_id ,add_rec_id_fld,distinct_sql,orientation,font_size,post_import_sql,getdate(),'+~r~n" + &
"~t~t~t~t~t~t' detail_height ,report_type,profile_title,header_height,footer_height,summary_height,module,advanced_linking,newpage_group,roles_can_view from '+ ~r~n" + &
"~t~t~t~t~t@SourceDBName + '.dbo.conv_view where view_id = ' + @ReportID        ~r~n" + &
"~r~n" + &
"~texec sp_executesql @SqlString    ~r~n" + &
"~r~n" + &
"~t/*Insert conv_view_table Table*/    ~r~n" + &
"~tselect @SqlString = 'insert ' + @TargetDBName + '.dbo.conv_view_table (view_id,project_id,cust_table_name ,table_id,table_name)' ~r~n" + &
"~r~n" + &
"~tselect @SqlString = @SqlString + 'select ' + @MaxReportID + ',project_id,cust_table_name,table_id,table_name from ' +~r~n" + &
"~t~t~t~t~t@SourceDBName + '.dbo.conv_view_table where view_id = ' + @ReportID     ~r~n" + &
"~t~r~n" + &
"~texec sp_executesql @SqlString    ~r~n" + &
"~r~n" + &
"~t/*Insert conv_view_links Table*/    ~r~n" + &
"~tselect @SqlString = 'insert ' + @TargetDBName + '.dbo.conv_view_links (view_id ,link_id,project_id,link_from_table,link_from_field,link_type,'+~r~n" + &
"~t~t~t~t~t' link_to_table,link_to_field,link_from_table_nm ,link_from_field_nm,link_to_table_nm,link_to_field_nm)'   ~r~n" + &
"~r~n" + &
"~tselect @SqlString = @SqlString + 'select ' + @MaxReportID + ',link_id,project_id,link_from_table ,link_from_field ,link_type ,link_to_table ,'+~r~n" + &
"~t~t~t~t~t' link_to_field ,link_from_table_nm ,link_from_field_nm ,link_to_table_nm ,link_to_field_nm from ' + ~r~n" + &
"~t~t~t~t~t@SourceDBName + '.dbo.conv_view_links where view_id = ' + @ReportID ~r~n" + &
"~r~n" + &
"~texec sp_executesql @SqlString    ~r~n" + &
"~r~n" + &
"~t/*Insert conv_view_fields Table*/    ~r~n" + &
"~tselect @SqlString = 'insert ' + @TargetDBName + '.dbo.conv_view_fields (view_id,field_id,project_id,table_name,field_name,field_options,field_alias,'+~r~n" + &
"~t~t~t~t~t' sel_table_id,sel_field_id,field_order,field_display_width,field_x,field_wizard_name,field_wizard_type,field_align,label_align,'+~r~n" + &
"~t~t~t~t~t'label_text,group_by_field,aggregate_type,avg_fld,sum_fld,count_fld,label_font_style,field_font_style,field_y,label_x,label_y,'+~r~n" + &
"~t~t~t~t~t'label_width,field_height,label_height,lu_field_name,lookup_type,Filter_by_field)'    ~r~n" + &
"~tselect @SqlString = @SqlString + 'select ' + @MaxReportID + ',field_id,project_id,table_name,field_name,field_options,field_alias,sel_table_id,'+~r~n" + &
"~t~t~t~t~t' sel_field_id,field_order,field_display_width,field_x,field_wizard_name,field_wizard_type,field_align,label_align,label_text,'+~r~n" + &
"~t~t~t~t~t' group_by_field,aggregate_type,avg_fld,sum_fld,count_fld,label_font_style,field_font_style,field_y,label_x,label_y,label_width,'+~r~n" + &
"~t~t~t~t~t' field_height,label_height,lu_field_name,lookup_type,Filter_by_field from ' + ~r~n" + &
"~t~t~t~t~t@SourceDBName + '.dbo.conv_view_fields where view_id = ' + @ReportID     ~r~n" + &
"~r~n" + &
"~texec sp_executesql @SqlString    ~r~n" + &
"~r~n" + &
"~t/*Insert conv_view_where Table*/    ~r~n" + &
"~tselect @SqlString = 'insert ' + @TargetDBName + '.dbo.conv_view_where (view_id,where_id ,project_id ,table_field_name ,field_name ,operator ,value ,'+~r~n" + &
"~t~t~t~t~t' connector ,table_id ,field_id ,value_display ,lu_field_name,lookup_type ,field_type ,lookup_name ,left_bracket ,right_bracket ,logical)'~r~n" + &
"~t~t~t~t~t    ~r~n" + &
"~tselect @SqlString = @SqlString + 'select ' + @MaxReportID + ',where_id ,project_id ,table_field_name ,field_name ,operator ,value ,connector ,table_id ,'+~r~n" + &
"~t~t~t~t~t' field_id ,value_display ,lu_field_name ,lookup_type ,field_type ,lookup_name ,left_bracket ,right_bracket ,logical from ' + ~r~n" + &
"~t~t~t~t~t@SourceDBName + '.dbo.conv_view_where where view_id = ' + @ReportID     ~r~n" + &
"~texec sp_executesql @SqlString    ~r~n" + &
"~r~n" + &
"~t/*Insert conv_view_sort Table*/    ~r~n" + &
"~tselect @SqlString = 'insert ' + @TargetDBName + '.dbo.conv_view_sort (view_id ,sort_id ,project_id ,table_name ,field_name ,sort_dir ,sort_order)'  ~r~n" + &
"~t  ~r~n" + &
"~tselect @SqlString = @SqlString + 'select ' + @MaxReportID + ',sort_id ,project_id ,table_name ,field_name ,sort_dir ,sort_order from ' + ~r~n" + &
"~t~t~t~t~t@SourceDBName + '.dbo.conv_view_sort where view_id = ' + @ReportID     ~r~n" + &
"~r~n" + &
"~texec sp_executesql @SqlString    ~r~n" + &
"~r~n" + &
"~t/*Insert ctx_report_syntax Table*/    ~r~n" + &
"~tselect @SqlString = 'insert ' + @TargetDBName + '.dbo.ctx_report_syntax (view_id ,dw_sql ,dw_syntax ,modify_date,dw_select)'  ~r~n" + &
"~r~n" + &
"~tselect @SqlString = @SqlString + 'select ' + @MaxReportID + ',dw_sql ,dw_syntax ,modify_date ,dw_select from ' + ~r~n" + &
"~t~t~t~t~t@SourceDBName + '.dbo.ctx_report_syntax where view_id = ' + @ReportID     ~r~n" + &
"~r~n" + &
"~texec sp_executesql @SqlString    ~r~n" + &
"~r~n" + &
"~t/*Insert Conv_view_pic Table*/    ~r~n" + &
"~tselect @SqlString = 'insert ' + @TargetDBName + '.dbo.Conv_view_pic (view_id ,Screen_id ,pic_type ,pic_band ,pic_name ,pic_filename ,pic_bitmap ,'+~r~n" + &
"~t~t~t~t~t' pic_x ,pic_y ,pic_width ,pic_height ,pic_tag)'    ~r~n" + &
"~t~r~n" + &
"~tselect @SqlString = @SqlString + 'select ' + @MaxReportID + ',Screen_id ,pic_type ,pic_band ,pic_name ,pic_filename ,pic_bitmap ,pic_x ,pic_y ,'+~r~n" + &
"~t~t~t~t~t' pic_width ,pic_height ,pic_tag from ' + @SourceDBName + '.dbo.Conv_view_pic where view_id = ' + @ReportID  ~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~texec sp_executesql @SqlString    select Cast(@MaxReportID as int)   ~r~n" + &
"~r~n" + &
"end~r~n" + &
"~r~n"

//Added By Jay Chen 06-18-2014
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from sysobjects where name = 'uf_get_contact_address' and type = 'FN') " + &
"  DROP FUNCTION uf_get_contact_address "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create function uf_get_contact_address( @ctx_id INT,@as_user_id NUMERIC) returns varchar(8000) ~r~n " + &
"as ~r~n" + &
" begin	~r~n" + &
"~t~tdeclare @returnstring varchar(4000) ~r~n" + &
"~t~tdeclare @contact_id int ~r~n" + &
"~t~tdeclare @user_d varchar(50) ~r~n" + &
"~t~tdeclare @contact_email varchar(50)~r~n " + &
"~t~tdeclare @smtp_email varchar(50) ~r~n" + &
" ~t~tset  @returnstring = '' ~r~n " + &
" ~t~t/* Get the contact_id value */~r~n " + &
" ~t~tdeclare cur_get_contact_id cursor for~r~n " + &
"~t~tselect contact_id from ctx_contract_contacts where ctx_contract_contacts.ctx_id = @ctx_id ~r~n" + &
"~t~t AND (@as_user_id in (ctx_contract_contacts.association,ctx_contract_contacts.association2,ctx_contract_contacts.association3,~r~n" + &
"~t~t ctx_contract_contacts.association4,ctx_contract_contacts.association5,ctx_contract_contacts.association6,~r~n" + &
"~t~t ctx_contract_contacts.association7,ctx_contract_contacts.association8,~r~n" + &
"~t~tctx_contract_contacts.association9,ctx_contract_contacts.association10)) ~r~n" + &
"~t~t AND ctx_contract_contacts.ic_area = 'I' ~r~n" + &
"~t~topen cur_get_contact_id ~r~n" + &
"~t~tfetch next from cur_get_contact_id into @contact_id ~r~n" + &
"~t~twhile @@fetch_status = 0 ~r~n" + &
"~t~tbegin ~r~n" + &
"~t~t~tset @user_d = '' ~r~n" + &
"~t~t~tselect @user_d = user_d from ctx_contacts where contact_id = @contact_id  /* check the user_d */ ~r~n" + &
"~t~t~tif (@user_d is NULL) OR (@user_d = '')		/* get email address from contact number when user_d is null */ ~r~n" + &
"~t~t~tbegin ~r~n" + &
"~t~t~t~tset @contact_email = '' ~r~n" + &
"~t~t~t~tselect @contact_email = contact_email from ctx_contacts_numbers where contact_id = @contact_id ~r~n " + &
"~t~t~t~tand via = (SELECT lookup_code FROM code_lookup WHERE code = 'EMAIL' AND lookup_name = 'Contract Contact VIA')~r~n " + &
"~t~t~t~tif @contact_email is not NULL~r~n " + &
"~t~t~t~tbegin~r~n " + &
"~t~t~t~t~tif (@returnstring IS NULL) OR (@returnstring = '')~r~n " + &
"~t~t~t~t~tbegin ~r~n" + &
"~t~t~t~t~t~tset @returnstring = @contact_email~r~n " + &
"~t~t~t~t~tend~r~n " + &
"~t~t~t~t~telse ~r~n" + &
"~t~t~t~t~tbegin ~r~n" + &
"~t~t~t~t~t~tset @returnstring = @returnstring + ';' + @contact_email~r~n " + &
"~t~t~t~t~tend ~r~n" + &
"~t~t~t~tend~r~n " + &
"~t~t~tend ~r~n" + &
"~t~t~telse					/* get email address from email painter when user_d is not null */~r~n " + &
"~t~t~tbegin ~r~n" + &
"~t~t~t~tset @smtp_email = '' ~r~n" + &
"~t~t~t~tselect @smtp_email = em_smtp_accounts.email from ctx_contract_contacts,ctx_contacts,em_smtp_accounts~r~n " + &
"~t~t~t~twhere ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contacts.user_d = em_smtp_accounts.user_id~r~n " + &
"~t~t~t~tand ctx_contract_contacts.ctx_id = @ctx_id and ctx_contract_contacts.ic_area = 'I'  ~r~n" + &
"~t~t~t~tand (@as_user_id in (ctx_contract_contacts.association,ctx_contract_contacts.association2,ctx_contract_contacts.association3,~r~n " + &
"~t~t~t~t~t~t~t~t~t~t~t~t~tctx_contract_contacts.association4,ctx_contract_contacts.association5,ctx_contract_contacts.association6,~r~n " + &
"~t~t~t~t~t~t~t~t~t~t~t~t~tctx_contract_contacts.association7,ctx_contract_contacts.association8,~r~n " + &
"~t~t~t~t~t~t~t~t~t~t~t~t~tctx_contract_contacts.association9,ctx_contract_contacts.association10))  ~r~n " + &
"~t~t~t~tand em_smtp_accounts.Is_Default = 'Y' and em_smtp_accounts.Email is not NULL ~r~n" + &
"~t~t~t~tand ctx_contacts.user_d = @user_d ~r~n" + &
"~t~t~t~tif (@smtp_email is NULL) OR (@smtp_email = '')~r~n " + &
"~t~t~t~tbegin ~r~n" + &
"~t~t~t~t~tset @contact_email = '' ~r~n" + &
"~t~t~t~t~tselect @contact_email = contact_email from ctx_contacts_numbers where contact_id = @contact_id ~r~n " + &
"~t~t~t~t~tand via = (SELECT lookup_code FROM code_lookup WHERE code = 'EMAIL' AND lookup_name = 'Contract Contact VIA')~r~n " + &
"~t~t~t~t~tif @contact_email is not NULL~r~n " + &
"~t~t~t~t~tbegin~r~n " + &
"~t~t~t~t~t~tif (@returnstring IS NULL) OR (@returnstring = '')~r~n " + &
"~t~t~t~t~t~tbegin ~r~n " + &
"~t~t~t~t~t~t~tset @returnstring = @contact_email ~r~n" + &
"~t~t~t~t~t~tend~r~n " + &
"~t~t~t~t~t~telse~r~n " + &
"~t~t~t~t~t~tbegin~r~n " + &
"~t~t~t~t~t~t~tset @returnstring = @returnstring + ';' + @contact_email~r~n " + &
"~t~t~t~t~t~tend ~r~n" + &
"~t~t~t~t~tend ~r~n" + &
"~t~t~t~tend ~r~n" + &
"~t~t~t~telse~r~n " + &
"~t~t~t~tbegin~r~n " + &
"~t~t~t~tif (@returnstring IS NULL) OR (@returnstring = '')~r~n " + &
"~t~t~t~tbegin ~r~n" + &
"~t~t~t~t~tset @returnstring = @smtp_email~r~n " + &
"~t~t~t~tend~r~n " + &
"~t~t~t~telse~r~n " + &
"~t~t~t~tbegin ~r~n" + &
"~t~t~t~t~tset @returnstring = @returnstring + ';' + @smtp_email ~r~n" + &
"~t~t~t~tend ~r~n" + &
"~t~t~tend ~r~n" + &
"~t~tend ~r~n" + &
"~t~tfetch next from cur_get_contact_id into @contact_id ~r~n" + &
"~tend ~r~n" + &
"~tCLOSE cur_get_contact_id ~r~n" + &
"~tDEALLOCATE cur_get_contact_id  ~r~n" + &
"~treturn @returnstring ~r~n" + &
"end " 

of_execute_sqls("of_ver150_release_storeprocedure1")
return 1
end function

public function integer of_ver150_release_storeprocedure2 ();//====================================================================
// Function: of_ver150_release_storeprocedure2
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 09/26/2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//"If Exists (SELECT name FROM sysobjects WHERE name = 'up_calculate_date_alarms' AND type = 'P')~r~n" + &
//"~tDROP PROCEDURE up_calculate_date_alarms~r~n" 

//Modified By Mark Lee 11/26/2015
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_create_request_data_table' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure sp_create_request_data_table~r~n" + &
"End "
//modified by Harry 2017-06-29 for Task 784:Request puts incorrect value into "percent" formatted field of created contract
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create Procedure sp_create_request_data_table( @rwf_id int,@user_id varchar(50),@do_steps varchar(500),@ctx_id int, @sql_delete varchar(max) output, @err_msg varchar(8000) output)~r~n" + &
"AS~r~n" + &
"Begin~r~n" + &
"~tDeclare~t@num tinyint, @count int, @col_number_value int, @scale int, @rowid int, @order_no int,~t@table_id int, @record_id int, @seq_no int~r~n" + &
"~tDeclare @exists_num int, @rowid_old int, @update_or_insert int, @id int, @fee_sched_nm_id int, @error_sum int, @rwfd_id int, @submitted int, @submitted_new int~r~n" + &
"~tDeclare @col_decimal_value numeric(14,4),@key1 int, @key2 int, @key3 int,@parent_rowid int, @data_view_id int ~r~n" + &
"~tDeclare @col_type varchar(128),~t@col_string_value varchar(max),@col_name varchar(50),@table_name varchar(50),@table_old varchar(50)~r~n" + &
"~tDeclare @primarykey varchar(500), @parent_table varchar(50), @otherkey varchar(500),@object_type varchar(50),@multi_select_text varchar(8000),@formats varchar(50),@col_type_org varchar(50)~r~n" + &
"~tDeclare @col_datetime_value datetime~r~n" + &
"~tDeclare @sql_insert varchar(max),@sql_value varchar(max), @sql varchar(max),@sql_delete2 varchar(max), @sql_log varchar(max), @sql_where varchar(max),@temp_value varchar(max)~r~n" + &
"~tDeclare @sql_execute nvarchar(1000), @sql_update varchar(max), @sql_detail_key varchar(max), @sql_multi_select varchar(max), @sql_multi_select_delete varchar(max)~r~n" + &
"~t~r~n" + &
"~tSet @count = 0 ~r~n" + &
"~tSet @sql_delete2 = ''~r~n" + &
"~tSet @sql = ''~r~n" + &
"~tSet @sql_insert = ''~r~n" + &
"~tSet @sql_value = ''~r~n" + &
"~tSet @sql_log = ''~r~n" + &
"~tSet @sql_where = ''~r~n" + &
"~tSet @num = 20~r~n" + &
"~tSet @exists_num = 0~r~n" + &
"~tSet @seq_no = 0~r~n" + &
"~tSet @rowid_old = 0~r~n" + &
"~tSet @table_old = ''~r~n" + &
"~tSet @update_or_insert = 0~t~r~n" + &
"~tSet @fee_sched_nm_id = 0~r~n" + &
"~tSet @id = 0~r~n" + &
"~tSet @sql_update = ''~r~n" + &
"~tSet @sql_detail_key = ''~r~n" + &
"~tSet @sql_multi_select =''~r~n" + &
"~tSet @sql_multi_select_delete = ''~r~n" + &
"~r~n" + &
"~tSelect @data_view_id = view_id from export_header where export_id =(select export_id From request_webform Where rwf_id =@rwf_id);~r~n" + &
"~t~r~n" + &
"~tDECLARE request_table_insert_cursor CURSOR FOR ~r~n" + &
"      ~tSelect table_name,rowid,order_no,col_name,col_string_value,col_datetime_value,col_number_value,col_decimal_value,col_type,scale,rwfd_id,parent_table_name,parent_rowid,submitted,object_type,multi_select_text,formats,  ~r~n" + &
"      ~t~t(select systypes.name as col_type From syscolumns , systypes where syscolumns.xtype = systypes.xtype and syscolumns.name = request_webform_detail.col_name and object_name(syscolumns.id) = request_webform_detail.table_name) as col_type_org  ~r~n" + &
"~t~tFrom request_webform_detail~r~n" + &
"~t~tWhere types='column' and table_name in( 'ctx_custom','ctx_products','ctx_fee_sched_nm','ctx_custom_multi_hdr','ctx_custom_multi_detail') and rwf_id = @rwf_id ~r~n" + &
"~t~tand ( col_string_value is not null or col_datetime_value is not null or col_number_value is not null or col_decimal_value is not null  ) ~r~n" + &
"~t~tand ( submitted = 1 or submitted = 2 ) and ( updated is null or updated <> 'Y') and (design is null or design = 'm')~r~n" + &
"~t~tand ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ~r~n" + &
"~t~tOrder by parent_table_name,parent_rowid,table_name,rowid,order_no,col_name;~r~n" + &
"~t~t/* Priority Primary table, Middle Detail table */~r~n" + &
"~tOPEN request_table_insert_cursor~r~n" + &
"~tFETCH NEXT FROM request_table_insert_cursor INTO  @table_name,@rowid,@order_no,@col_name,@col_string_value,@col_datetime_value,@col_number_value,@col_decimal_value,@col_type,@scale,@rwfd_id,@parent_table,@parent_rowid,@submitted,@object_type,@multi_select_text,@formats,@col_type_org   ~r~n" + &
"~t~t~t~t~r~n" + &
"~tWHILE @@FETCH_STATUS = 0~r~n" + &
"~tBEGIN~r~n" + &
"~t~tSet @table_name = lower(@table_name)~r~n" + &
"~t~tif (@submitted = 1 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @submitted_new = 3~r~n" + &
"~t~tEnd ~r~n" + &
"~t~telse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @submitted_new = 4~r~n" + &
"~t~tEnd ~r~n" + &
"~t~t/*the table ctx_products need to control the data value that were completed.*/~r~n" + &
"~t~tif (@table_name = 'ctx_products')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @exists_num~t = 0 ~r~n" + &
"~t~t~tSelect @exists_num = sum(num) From (~r~n" + &
"~t~t~t~tSelect count(1) as num From request_webform_detail~r~n" + &
"~t~t~t~tWhere rwf_id = @rwf_id~tand table_name = 'ctx_products'~tand rowid = @rowid~tand col_name = 'product_type' ~r~n" + &
"~t~t~t~tand ( submitted = 1 or submitted = 2 ) and ( updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ~r~n" + &
"~t~t~t~tand col_number_value in (Select lookup_code From code_lookup Where lookup_name = 'Contract Product Type')~r~n" + &
"~t~t~t~tUnion all~r~n" + &
"~t~t~t~tSelect count(1) as num from request_webform_detail~r~n" + &
"~t~t~t~tWhere rwf_id = @rwf_id and table_name = 'ctx_products'~tand rowid = @rowid~tand col_name = 'product_id' ~r~n" + &
"~t~t~t~tand ( submitted = 1 or submitted = 2 ) and ( updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ~r~n" + &
"~t~t~t~tand col_number_value in (Select lookup_code From code_lookup Where lookup_name = 'Contract Product Name')~r~n" + &
"~t~t~t~t) dd ;~t~t~t~r~n" + &
"~t~t~tif (@exists_num <> 2 )~r~n" + &
"~t~t~tBegin~t~t~r~n" + &
"~t~t~t~tSet @table_old = @table_name~r~n" + &
"~t~t~t~tSet @rowid_old = @rowid~r~n" + &
"~t~t~t~t/*~tneed it for table ctx_products setting~t*/~r~n" + &
"~t~t~t~tFETCH NEXT FROM request_table_insert_cursor INTO  @table_name,@rowid,@order_no,@col_name,@col_string_value,@col_datetime_value,@col_number_value,@col_decimal_value,@col_type,@scale,@rwfd_id,@parent_table,@parent_rowid,@submitted,@object_type,@multi_select_text,@formats,@col_type_org   ~r~n" + &
"~t~t~t~tCONTINUE  ~t~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* first create  data or multi-row (the frist rowid is 0 ,so @rowid > 0 )*/~r~n" + &
"~t~tif ((@table_old <> @table_name) or (@rowid_old <> @rowid and @rowid > 0 and  @table_old = @table_name ) ) ~r~n" + &
"~t~tBegin~t~t~r~n" + &
"~t~t~tSet @table_old = @table_name~r~n" + &
"~t~t~tSet @rowid_old = @rowid~r~n" + &
"~t~t~t~t~t~t~t~r~n" + &
"~t~t~tif len(@sql_where) > 0 ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif(right(@sql_insert,1) = ',')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/* update table action */~r~n" + &
"~t~t~t~t~tSet @sql_insert = left(@sql_insert, len(@sql_insert) - 1)~r~n" + &
"~t~t~t~t~tSet @sql = @sql + @sql_insert +  @sql_where + ' ; '~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/* insert table action */~r~n" + &
"~t~t~t~t~tSet @sql = @sql + @sql_insert+ @sql_where + @sql_value+ ') ; '~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tSet @sql_value = ''~t~t~t~r~n" + &
"~t~t~tSet @update_or_insert = 0 ~r~n" + &
"~t~t~tSet @primarykey =''~r~n" + &
"~t~t~t/* That only create one record in this tables(ctx_custom ) when use create a contract. */~r~n" + &
"~t~t~tif (@table_name = 'ctx_custom' )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_execute = 'Select @update_or_insert = count(1) From '+@table_name+ ' Where ctx_id ='+convert(varchar,@ctx_id)~r~n" + &
"~t~t~t~tSet @primarykey = ' Where ctx_id ='+convert(varchar,@ctx_id)~r~n" + &
"~t~t~t~tEXEC SP_EXECUTESQL @sql_execute, N'@update_or_insert int output',@update_or_insert OUTPUT~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if(@table_name = 'ctx_products')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @key1 = col_number_value From request_webform_detail~r~n" + &
"~t~t~t~t~t~tWhere rwf_id = @rwf_id~tand table_name = 'ctx_products'~tand rowid = @rowid~tand col_name = 'product_type'~r~n" + &
"~t~t~t~t~t~tand col_number_value in (Select lookup_code From code_lookup Where lookup_name = 'Contract Product Type') ~r~n" + &
"~t~t~t~t~t~tand ( submitted = 1 or submitted = 2 ) and ( updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ; ~r~n" + &
"~t~t~t~tSelect @key2 = col_number_value   from request_webform_detail~r~n" + &
"~t~t~t~t~t~tWhere rwf_id = @rwf_id and table_name = 'ctx_products'~tand rowid = @rowid~tand col_name = 'product_id' ~r~n" + &
"~t~t~t~t~t~tand col_number_value in (Select lookup_code From code_lookup Where lookup_name = 'Contract Product Name') ~r~n" + &
"~t~t~t~t~t~tand ( submitted = 1 or submitted = 2 ) and ( updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~r~n" + &
"~t~t~t~tSet @primarykey = ' Where ctx_id ='+convert(varchar,@ctx_id)+ ' and product_type='+convert(varchar,@key1)+ ' and product_id='+convert(varchar,@key2)~t~t~t~t~r~n" + &
"~t~t~t~tSet @sql_execute = 'Select @update_or_insert = count(1) From '+@table_name+ ' '+ @primarykey~r~n" + &
"~t~t~t~tEXEC SP_EXECUTESQL @sql_execute, N'@update_or_insert int output',@update_or_insert OUTPUT~t~t~r~n" + &
"~t~t~tEnd~t~t~r~n" + &
"~t~t~telse if( @table_name = 'ctx_fee_sched_nm' or @table_name = 'ctx_custom_multi_hdr'or @table_name = 'ctx_custom_multi_detail')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~t/* if the table maybe have multi records in the contracts, you must be to record the insert data in the table request_relation_table. */~r~n" + &
"~t~t~t~tSelect @primarykey = primarykey from request_relation_table ~r~n" + &
"~t~t~t~tWhere tablename = @table_name and rowid = @rowid and rwf_id = @rwf_id and ctx_id =@ctx_id ;~r~n" + &
"~t~t~t~tif (@primarykey is null or charindex('where ',lower(@primarykey)) = 0 ) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @primarykey = ''~r~n" + &
"~t~t~t~t~tSet @update_or_insert = 0~t~t~t~t~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @sql_execute = 'Select @update_or_insert = count(1) From '+@table_name+ ' '+ @primarykey~r~n" + &
"~t~t~t~t~tEXEC SP_EXECUTESQL @sql_execute, N'@update_or_insert int output',@update_or_insert OUTPUT~t~t~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~t~r~n" + &
"~t~t~tif (@update_or_insert = 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @table_id = table_id from sys_tables where lower(import_table_name) = @table_name;~t~r~n" + &
"~t~t~t~tSet @num = 21~r~n" + &
"~t~t~t~tSelect @record_id = isnull(record_id, 0) From ids;~t~r~n" + &
"~t~t~t~tUPDATE ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id = @record_id ;~t~t~t~t~r~n" + &
"~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~tBegin~t~t~t~t~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Table Position:'+convert(varchar,@num)+'; Invalid record_id. '~t~t~t~t~r~n" + &
"~t~t~t~t~tCLOSE request_table_insert_cursor~r~n" + &
"~t~t~t~t~tDEALLOCATE request_table_insert_cursor~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEnd~t~r~n" + &
"~t~t~t~tSet @record_id = @record_id + 1 ~r~n" + &
"~r~n" + &
"~t~t~t~tif (@seq_no = 0)~t~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~tend ~t~t~t~r~n" + &
"~t~t~t~tSet @seq_no = @seq_no + 1~t~t~t~r~n" + &
"~t~t~t~r~n" + &
"~t~t~t~tSet @sql_log = @sql_log + ' INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type ) VALUES('~r~n" + &
"~t~t~t~t~t~t~t+convert(varchar,@record_id)+' ,1001, '+convert(varchar,@seq_no)+' ,'+convert(varchar,@table_id) +','+convert(varchar, @ctx_id) ~r~n" + &
"~t~t~t~t~t~t~t+','''',''INSERT'','''+@user_id+''',getdate(),1,''I'') ; '~r~n" + &
"~r~n" + &
"~t~t~t~t/* insert table action (product_id, ctx_id, product_type)*/~r~n" + &
"~t~t~t~tif (@table_name = 'ctx_products')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @sql_insert = ' INSERT INTO '+@table_name+' ( ctx_id,record_id '~r~n" + &
"~t~t~t~t~tSet @sql_where = ') VALUES ('+ convert(varchar,@ctx_id )+', '+convert(varchar,@record_id )+ ' '~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From '+@table_name+ ' Where ctx_id ='+ convert(varchar,@ctx_id )+ ' and record_id ='+convert(varchar,@record_id )+' ; '~r~n" + &
"~r~n" + &
"~t~t~t~t~tSelect @key1 = col_number_value From request_webform_detail~r~n" + &
"~t~t~t~t~t~tWhere rwf_id = @rwf_id~tand table_name = 'ctx_products'~tand rowid = @rowid~tand col_name = 'product_type' ~r~n" + &
"~t~t~t~t~t~tand ( submitted = 1 or submitted = 2 ) and ( updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ~r~n" + &
"~t~t~t~t~t~tand col_number_value in (Select lookup_code From code_lookup Where lookup_name = 'Contract Product Type') ; ~r~n" + &
"~t~t~t~t~tSelect @key2 = col_number_value   from request_webform_detail~r~n" + &
"~t~t~t~t~t~tWhere rwf_id = @rwf_id and table_name = 'ctx_products'~tand rowid = @rowid~tand col_name = 'product_id' ~r~n" + &
"~t~t~t~t~t~tand ( submitted = 1 or submitted = 2 ) and ( updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ~r~n" + &
"~t~t~t~t~t~tand col_number_value in (Select lookup_code From code_lookup Where lookup_name = 'Contract Product Name') ;~r~n" + &
"~r~n" + &
"~t~t~t~t~t/*Select @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey) Values( '''+@table_name+ ''','~r~n" + &
"~t~t~t~t~t~t+CONVERT(varchar,@rowid)+', '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t~t' and product_type='+convert(varchar,@key1)+' and product_id='+convert(varchar,@key2)+' ''); '~t*/~t~t~t~t~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~telse if (@table_name = 'ctx_custom')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*  table(ctx_custom) */~r~n" + &
"~t~t~t~t~tSet @sql_insert = ' INSERT INTO '+@table_name+' ( ctx_id '~r~n" + &
"~t~t~t~t~tSet @sql_where = ') VALUES ('+ convert(varchar,@ctx_id )+' '~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From '+@table_name+ ' Where ctx_id ='+ convert(varchar,@ctx_id )+ ' ; '~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t/*Select @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey) Values( '''+@table_name+ ''','~r~n" + &
"~t~t~t~t~t~t+CONVERT(varchar,@rowid)+', '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+' ); ' */~r~n" + &
"~t~t~t~tEnd~t~t~r~n" + &
"~t~t~t~telse if (@table_name = 'ctx_custom_multi_hdr')~r~n" + &
"~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t/* the rec_id column value need to change the PB code and it use @record_id value replace */~r~n" + &
"~t~t~t~t~t/*~tno update the column calc_field_1\calc_field_2\calc_field_3 value on table ctx_custom_multi_hdr */~r~n" + &
"~t~t~t~t~tif(@id = 0 )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @num = 22~r~n" + &
"~t~t~t~t~t~tSELECT @id = ids.custom_id1 FROM ids ~r~n" + &
"~t~t~t~t~t~tUpdate ids SET custom_id1 =( isnull ( custom_id1 , 0 ) + 1 ) Where custom_id1 = @id ;~r~n" + &
"~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Table Position:'+convert(varchar,@num)+'; Invalid custom_id1. '~r~n" + &
"~t~t~t~t~t~t~tCLOSE request_table_insert_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE request_table_insert_cursor~r~n" + &
"~t~t~t~t~t~t~treturn ~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSet @id = @id + 1 ~r~n" + &
"~r~n" + &
"~t~t~t~t~tSet @sql_insert = ' INSERT INTO '+@table_name+' ( ctx_id,hdr_id '~r~n" + &
"~t~t~t~t~tSet @sql_where = ') VALUES ('+ convert(varchar,@ctx_id )+', '+convert(varchar,@id )+ ' '~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From '+@table_name+ ' Where ctx_id ='+ convert(varchar,@ctx_id )+ ' and hdr_id= '+convert(varchar,@id )+' ; '~r~n" + &
"~r~n" + &
"~t~t~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey, key1) Values( '''+@table_name+ ''','~r~n" + &
"~t~t~t~t~t~t+CONVERT(varchar,@rowid)+', '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t~t' and hdr_id='+convert(varchar,@id)+' '','+convert(varchar,@id)+' ); '~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename='''+@table_name+''' and rowid='+CONVERT(varchar,@rowid)+' and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~t  ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse if (@table_name = 'ctx_custom_multi_detail')~r~n" + &
"~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~tif(@id = 0 )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @num = 23~r~n" + &
"~t~t~t~t~t~tSELECT @id = ids.custom_id1 FROM ids ~r~n" + &
"~t~t~t~t~t~tUpdate ids SET custom_id1 =( isnull ( custom_id1 , 0 ) + 1 ) Where custom_id1 = @id ;~r~n" + &
"~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Table Position:'+convert(varchar,@num)+'; Invalid custom_id1. '~r~n" + &
"~t~t~t~t~t~t~tCLOSE request_table_insert_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE request_table_insert_cursor~r~n" + &
"~t~t~t~t~t~t~treturn ~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSet @id = @id + 1~r~n" + &
"~t~t~t~t~tSet @key1 = 0~r~n" + &
"~t~t~t~t~tSelect @key1 = key1 From request_relation_table Where tablename = @parent_table and rowid = @parent_rowid ~r~n" + &
"~t~t~t~t~t~tand rwf_id = @rwf_id and ctx_id = @ctx_id ;~r~n" + &
"~t~t~t~t~tif(@key1 is null )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Table Position:'+convert(varchar,@num)+'; Invalid '+@parent_table+' key. '~r~n" + &
"~t~t~t~t~t~tCLOSE request_table_insert_cursor~r~n" + &
"~t~t~t~t~t~tDEALLOCATE request_table_insert_cursor~r~n" + &
"~t~t~t~t~t~treturn ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~telse if(@key1 = 0 )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_detail_key = @sql_detail_key + ' Update '+@table_name+ ' Set hdr_id =' + ~r~n" + &
"~t~t~t~t~t~t~t~t'(Select key1 From request_relation_table Where tablename = '''+@parent_table+''' and rowid = '+convert(varchar,@parent_rowid)+ ~r~n" + &
"~t~t~t~t~t~t~t~t~t' and rwf_id = '+convert(varchar,@rwf_id)+' and ctx_id = '+convert(varchar,@ctx_id)+' )' +~r~n" + &
"~t~t~t~t~t~t~t~t' Where ctx_id='+ convert(varchar,@ctx_id )+ 'and hdr_id = 0 and detail_id='+convert(varchar,@id)+' ; '~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tSelect @sql_detail_key = @sql_detail_key + ' Update request_relation_table Set primarykey=left(primarykey, charindex(''and'', primarykey) + 3 ) + ' +~r~n" + &
"~t~t~t~t~t~t~t~t~t''' hdr_id =''+ (Select convert(varchar,key1) From request_relation_table Where tablename = '''+@parent_table+''' and rowid = '+convert(varchar,@parent_rowid)+ ~r~n" + &
"~t~t~t~t~t~t~t~t~t' and rwf_id = '+convert(varchar,@rwf_id)+' and ctx_id = '+convert(varchar,@ctx_id)+' ) + ' +~r~n" + &
"~t~t~t~t~t~t~t~t~t+ 'right(primarykey,len(primarykey) - charindex(''and'', primarykey,charindex(''and'', primarykey)+ 3) + 3 )'~r~n" + &
"~t~t~t~t~t~t~t~t+ ' Where tablename='''+@table_name+''' and rowid='+CONVERT(varchar,@rowid)+' and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSet @sql_insert = ' INSERT INTO '+@table_name+' ( ctx_id,hdr_id, detail_id '~r~n" + &
"~t~t~t~t~tSet @sql_where = ') VALUES ('+ convert(varchar,@ctx_id )+', '+convert(varchar,@key1 )+ ' '+', '+convert(varchar,@id )+ ' '~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From '+@table_name+ ' Where ctx_id ='+ convert(varchar,@ctx_id )+ ' and hdr_id= '+convert(varchar,@key1 )+ ' and detail_id= '+convert(varchar,@id )+' ; '~r~n" + &
"~r~n" + &
"~t~t~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey, key1) Values( '''+@table_name+ ''','~r~n" + &
"~t~t~t~t~t~t+CONVERT(varchar,@rowid)+', '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t~t' and hdr_id='+convert(varchar,@key1)+' and detail_id ='+convert(varchar,@id)+ ' '','+convert(varchar,@id)+' ); '  ~r~n" + &
"~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename='''+@table_name+''' and rowid='+CONVERT(varchar,@rowid)+' and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse if (@table_name = 'ctx_fee_sched_nm')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (@fee_sched_nm_id = 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @fee_sched_nm_id = Max(fee_sched_nm_id ) FROM ctx_fee_sched_nm WHERE ctx_id =@ctx_id ;~r~n" + &
"~t~t~t~t~t~tif(@fee_sched_nm_id is null or @fee_sched_nm_id <= 0 )~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @fee_sched_nm_id = 0~r~n" + &
"~t~t~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~t~t~tEnd ~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSet @fee_sched_nm_id = @fee_sched_nm_id + 1 ~t~r~n" + &
"~r~n" + &
"~t~t~t~t~tSet @sql_insert = ' INSERT INTO '+@table_name+' ( ctx_id,fee_sched_nm_id '~r~n" + &
"~t~t~t~t~tSet @sql_where = ') VALUES ('+ convert(varchar,@ctx_id )+', '+convert(varchar,@fee_sched_nm_id )+ ' '~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From '+@table_name+ ' Where ctx_id ='+ convert(varchar,@ctx_id )+ ' and fee_sched_nm_id= '+convert(varchar,@fee_sched_nm_id )+' ; '~r~n" + &
"~r~n" + &
"~t~t~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey,key1) Values( '''+@table_name+ ''','~r~n" + &
"~t~t~t~t~t~t+CONVERT(varchar,@rowid)+', '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t~t' and fee_sched_nm_id='+convert(varchar,@fee_sched_nm_id)+' '','+convert(varchar,@fee_sched_nm_id)+'); '  ~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename='''+@table_name+''' and rowid='+CONVERT(varchar,@rowid)+' and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~t~r~n" + &
"~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~t/* jaduge the request_relation_table table record */~t~t~t~t~r~n" + &
"~t~t~t~tSet @sql_insert = ' Update '+@table_name+' set '~r~n" + &
"~t~t~t~tSet @sql_where =  ' '+ @primarykey~t~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~tSet @temp_value = @col_string_value~r~n" + &
"~t~t/* multi-select dropdown option 0 */~r~n" + &
"~t~tif (@table_name = 'ctx_custom' and ((@object_type is not null) and lower(@object_type) = 'multi-select') ) ~r~n" + &
"~t~tBegin~t~t~t~t~r~n" + &
"~t~t~tif (@multi_select_text is not null) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @col_string_value = @multi_select_text~r~n" + &
"~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @col_string_value =''~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* make a distinction for commit sql ( 0 , 1 ) insert or update */~r~n" + &
"~t~tif (@update_or_insert = 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~t/* insert table action */~r~n" + &
"~t~t~tSet @count = 0 ~r~n" + &
"~r~n" + &
"~t~t~tif(@col_type ='datetime' or @col_type ='smalldatetime')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_datetime_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value = @sql_value + ', convert(datetime,''' + convert(varchar,@col_datetime_value,101)+ ''') '~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if(@col_type ='int' or @col_type ='integer' or @col_type ='real' or @col_type ='float' or @col_type ='smallint'or @col_type ='tinyint')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_number_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value = @sql_value + ',' + convert(varchar,@col_number_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if( (@col_type ='numeric' and @scale = 0) or (@col_type ='decimal' and @scale = 0) or (@col_type ='money' and @scale = 0))~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_number_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value = @sql_value + ',' + convert(varchar,@col_number_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if((@col_type ='numeric' and @scale > 0) or (@col_type ='decimal' and @scale > 0) or (@col_type ='money' and @scale > 0))~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_decimal_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value = @sql_value + ',' + convert(varchar,@col_decimal_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~telse if (@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_string_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*convert the percentage data to Decimal point data*/~r~n" + &
"~t~t~t~t~tif (RIGHT(@formats, 1) = '%' and ISNUMERIC(@col_string_value) = 1 and (@col_type_org = 'numeric' or @col_type_org ='decimal'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @col_string_value = CONVERT(varchar,(CONVERT(numeric(14,4),@col_string_value) / 100)) ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~t~t~tSet @col_string_value = REPLACE(@col_string_value,char(39),char(39)+char(39))~t~r~n" + &
"~t~t~t~t~tSelect @sql_value = @sql_value + ',''' +@col_string_value+''' ' ~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_string_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*convert the percentage data to Decimal point data*/~r~n" + &
"~t~t~t~t~tif (RIGHT(@formats, 1) = '%' and ISNUMERIC(@col_string_value) = 1 and (@col_type_org = 'numeric' or @col_type_org ='decimal'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @col_string_value = CONVERT(varchar,(CONVERT(numeric(14,4),@col_string_value) / 100)) ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~t~t~tSet @col_string_value = REPLACE(@col_string_value,char(39),char(39)+char(39))~t~r~n" + &
"~t~t~t~t~tSelect @sql_value = @sql_value + ',''' +@col_string_value+''' ' ~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tIf ( @count = 1)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_insert = @sql_insert +' , '+ @col_name +  ' '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~t/* update table action */~r~n" + &
"~t~t~tSet @count = 0 ~r~n" + &
"~t~t~tif(@col_type ='datetime' or @col_type ='smalldatetime')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_datetime_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value = ' convert(datetime,''' + convert(varchar,@col_datetime_value,101)+ ''') '~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if(@col_type ='int' or @col_type ='integer' or @col_type ='real' or @col_type ='float' or @col_type ='smallint'or @col_type ='tinyint')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_number_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value =  convert(varchar,@col_number_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if( (@col_type ='numeric' and @scale = 0) or (@col_type ='decimal' and @scale = 0) or (@col_type ='money' and @scale = 0))~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_number_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value =  convert(varchar,@col_number_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if((@col_type ='numeric' and @scale > 0) or (@col_type ='decimal' and @scale > 0) or (@col_type ='money' and @scale > 0))~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_decimal_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value =  convert(varchar,@col_decimal_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~telse if (@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_string_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*convert the percentage data to Decimal point data*/~r~n" + &
"~t~t~t~t~tif (RIGHT(@formats, 1) = '%' and ISNUMERIC(@col_string_value) = 1 and (@col_type_org = 'numeric' or @col_type_org ='decimal'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @col_string_value = CONVERT(varchar,(CONVERT(numeric(14,4),@col_string_value) / 100)) ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~t~t~tSet @col_string_value = REPLACE(@col_string_value,char(39),char(39)+char(39))~t~r~n" + &
"~t~t~t~t~tSelect @sql_value = ' ''' +@col_string_value+''' ' ~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_string_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*convert the percentage data to Decimal point data*/~r~n" + &
"~t~t~t~t~tif (RIGHT(@formats, 1) = '%' and ISNUMERIC(@col_string_value) = 1 and (@col_type_org = 'numeric' or @col_type_org ='decimal'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @col_string_value = CONVERT(varchar,(CONVERT(numeric(14,4),@col_string_value) / 100)) ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~t~t~tSet @col_string_value = REPLACE(@col_string_value,char(39),char(39)+char(39))~t~r~n" + &
"~t~t~t~t~tSelect @sql_value =  ' ''' +@col_string_value+''' ' ~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tIf ( @count = 1)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert +' '+ @col_name + '= '+ @sql_value + ' ,'~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~t/* multi-select dropdown option 1 */~r~n" + &
"~t~tif (@table_name = 'ctx_custom' and ((@object_type is not null) and lower(@object_type) = 'multi-select') ) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (RIGHT(ltrim(rtrim(@temp_value)),1) <>';') Set @temp_value=@temp_value+';'~r~n" + &
"~t~t~tWHILE (CHARINDEX(';',@temp_value) > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_multi_select = @sql_multi_select + 'INSERT INTO screen_field_select_item (view_id,screen_id,ctx_id,field_name,field_data) VALUES ('+~t~r~n" + &
"~t~t~t~t~tconvert(varchar,@data_view_id)+',10,'+convert(varchar,@ctx_id)+','''+@col_name+''','''+ rtrim(ltrim(left(@temp_value,CHARINDEX(';',@temp_value) - 1 )))+''') ; ' ~t~r~n" + &
"~t~t~t~tSelect @sql_multi_select_delete = @sql_multi_select_delete +' Delete From screen_field_select_item Where view_id='+convert(varchar,@data_view_id)+' and '+~r~n" + &
"~t~t~t~t~t' screen_id = 10 and ctx_id='+convert(varchar,@ctx_id)+' and field_name='''+@col_name+''' and field_data='''+rtrim(ltrim(left(@temp_value,CHARINDEX(';',@temp_value) - 1 )))+''' ; '~t~r~n" + &
"~t~t~t~tSet @temp_value = SUBSTRING(@temp_value,CHARINDEX(';',@temp_value) + 1,len(@temp_value) - CHARINDEX(';',@temp_value) )~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd ~t~t~t~t~t~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~tSelect @sql_update = @sql_update + ' Update request_webform_detail set updated = ''Y'', submitted='+convert(varchar,@submitted_new)+' Where types=''column'' and table_name = '''+@table_name+''' and rowid = '+convert(varchar,@rowid)+' and rwfd_id = '+convert(varchar,@rwfd_id)+' and col_name = '''+@col_name+''' ;'~t~t~t~t~t~t~t~r~n" + &
"~t~tSelect @sql_delete2 = @sql_delete2 + ' Update request_webform_detail set updated = ''N'', submitted ='+convert(varchar,@submitted)+' Where types=''column'' and table_name = '''+@table_name+''' and rowid = '+convert(varchar,@rowid)+' and rwfd_id = '+convert(varchar,@rwfd_id)+' and col_name = '''+@col_name+''' ;'~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~tFETCH NEXT FROM request_table_insert_cursor INTO  @table_name,@rowid,@order_no,@col_name,@col_string_value,@col_datetime_value,@col_number_value,@col_decimal_value,@col_type,@scale,@rwfd_id,@parent_table,@parent_rowid,@submitted,@object_type,@multi_select_text,@formats,@col_type_org   ~r~n" + &
"~tEnd~r~n" + &
"~tCLOSE request_table_insert_cursor~r~n" + &
"~tDEALLOCATE request_table_insert_cursor~r~n" + &
"~r~n" + &
"~tif len(@sql_where) > 0 ~r~n" + &
"~tBegin~r~n" + &
"~t~tif(right(@sql_insert,1) = ',')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~t/* update table action */~r~n" + &
"~t~t~tSet @sql_insert = left(@sql_insert, len(@sql_insert) - 1)~r~n" + &
"~t~t~tSet @sql = @sql + @sql_insert +  @sql_where + ' ; '~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~t/* insert table action */~r~n" + &
"~t~t~tSet @sql = @sql + @sql_insert+ @sql_where + @sql_value+ ') ; '~r~n" + &
"~t~tEnd ~r~n" + &
"~tEnd~r~n" + &
"~t~r~n" + &
"~tSet @num = 24 ~r~n" + &
"~tSet @error_sum = 0~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~tSet @sql_delete2 = ''~r~n" + &
"~r~n" + &
"~tBEGIN TRY~r~n" + &
"~tBEGIN TRANSACTION ctx_request_table;~t~t~t~r~n" + &
"~t~tExecute(@sql) ;~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~t~t~r~n" + &
"~r~n" + &
"~t~tSet @num = 25~r~n" + &
"~t~tExecute(@sql_update)~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~t~t~r~n" + &
"~r~n" + &
"~t~tSet @num = 26~r~n" + &
"~t~tExecute(@sql_log) ;~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~t~r~n" + &
"~t~t~r~n" + &
"~t~tSet @num = 27~r~n" + &
"~t~t/* multi-select dropdown option value */~t~t~r~n" + &
"~t~tif (len(@sql_multi_select) > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tExecute(@sql_multi_select) ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + @sql_multi_select_delete~t~t~t~t~r~n" + &
"~t~tEnd ~t~r~n" + &
"~tEND TRY~r~n" + &
"~tBEGIN CATCH~r~n" + &
"~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+' Table? ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() +' ; Sql:'+@sql_multi_select~r~n" + &
"~t~tROLLBACK TRANSACTION ctx_request_table;~r~n" + &
"~t~tExecute(@sql_delete );~r~n" + &
"~t~tif (@@error <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~tEnd~r~n" + &
"~t~treturn ~r~n" + &
"~tEND CATCH;~t~r~n" + &
"~r~n" + &
"~tIf (@error_sum <> 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' ; Sql:'+@sql_multi_select~r~n" + &
"~t~tROLLBACK TRANSACTION ctx_request_table;~r~n" + &
"~t~tExecute(@sql_delete );~r~n" + &
"~t~tif (@@error <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~tEnd~r~n" + &
"~t~treturn ~t~r~n" + &
"~tEnd~r~n" + &
"~telse~r~n" + &
"~tBegin~r~n" + &
"~t~tCOMMIT TRANSACTION ctx_request_table;~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/*reset delete sql again. */~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~r~n" + &
"~t/* update the ctx_custom_multi_hdr table's key word and update the request_relation_table table relationship */~r~n" + &
"~tif(len(@sql_detail_key) > 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @num = 28 ~r~n" + &
"~t~tSet @error_sum = 0~r~n" + &
"~t~tExecute(@sql_detail_key)~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~t~r~n" + &
"~t~tif (@@error <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_detail_key ~r~n" + &
"~t~tEnd~r~n" + &
"~t~treturn ~t~r~n" + &
"~tEnd~r~n" + &
"End~r~n"

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_create_request_data_update' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure sp_create_request_data_update~r~n" + &
"End ~r~n" 
//modified by Harry 2017-06-29 for Task 784:Request puts incorrect value into "percent" formatted field of created contract
//modified by Harry 2017-08-24 add param @IFdelete  int 
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create Procedure sp_create_request_data_update( @rwf_id int,@user_id varchar(50),@notes varchar(8000),@do_steps varchar(500),@ctx_id int,@sql_delete varchar(max) output, @err_msg varchar(8000) output, @IFdelete int )~r~n" + &
"AS~r~n" + &
"Begin~r~n" + &
"~tDeclare @num tinyint, @error_sum int~r~n" + &
"~tDeclare~t@count int,~t @template_id int, @category int, @status int, @record_id int, @app_facility int, @data_view_id int ~r~n" + &
"~tDeclare~t@table_id int, @seq_no int,@contact_id int, @steps int, @submitted int, @submitted_new int,@lookup_code int ,@master_contract_id int   ~r~n" + &
"~tDeclare @rowid int, @order_no int,@col_number_value int,@scale int, @doc_id int, @document_id int, @request_id int, @rwfdoc_id int, @contact_type int~r~n" + &
"~tDeclare @col_decimal_value numeric(14,4)~r~n" + &
"~tDeclare @table_name varchar(50), @col_name varchar(50), @col_string_value varchar(max), @col_type varchar(128),@owner_user varchar(50), @creator varchar(50)~r~n" + &
"~tDeclare @document_name varchar(200), @doc_ext varchar(10), @description varchar(2000), @doc_type varchar(6), @ctx_doc_type varchar(30), @submit_step varchar(500)~r~n" + &
"~tDeclare @object_type varchar(50), @multi_select_text varchar(8000), @master_contract_name varchar(255),@formats varchar(50),@col_type_org varchar(50)~r~n" + &
"~tDeclare @col_datetime_value datetime~r~n" + &
"~tDeclare @allow_update_doc char(1), @default_email char(1),@owner char(1), @update_document char(1), @contact_type2 char(1)~r~n" + &
"~tDeclare @sql_insert varchar(max),@sql_value varchar(max), @sql varchar(max), @sql_delete2 varchar(max),@sql_delete_ctx varchar(max)~r~n" + &
"~tDeclare @sql_temp1 varchar(max),@sql_temp2 varchar(max),@sql_temp3 varchar(max),@sql_temp4 varchar(max), @sql_update varchar(max)~r~n" + &
"~tDeclare @sql_multi_select varchar(max), @sql_multi_select_delete varchar(max),@temp_value varchar(max)~r~n" + &
"~r~n" + &
"~tSET ANSI_NULLS ON;~r~n" + &
"~r~n" + &
"~tSET QUOTED_IDENTIFIER ON;~r~n" + &
"~tSet @sql_delete =''~r~n" + &
"~tSet @sql_delete2 = ''~r~n" + &
"~tSet @sql_multi_select = ''~r~n" + &
"~tSet @sql_multi_select_delete = ''~r~n" + &
"~tSet @num = 100~r~n" + &
"~t/* add adjuest status is 'Waiting for Approval' */~r~n" + &
"~t/* when you choose the auto commit, submitted value is 1 else 2. */~r~n" + &
"~tSELECT @count = Count(1) From request_webform Where rwf_id =@rwf_id ;~r~n" + &
"~tif(@count = 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; The @rwf_id is a invalid.'~r~n" + &
"~t~treturn~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif (@ctx_id is null or @ctx_id = 0)~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; The @ctx_id is not exists.'~r~n" + &
"~t~treturn~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tSelect @category =category, @owner_user =owner_user, @allow_update_doc =allow_update_doc, @template_id = template_id,@creator =create_user, @steps = steps,~r~n" + &
"~t~t@submit_step = isnull(submit_step,'') From request_webform Where rwf_id =@rwf_id;~r~n" + &
"~tif (@owner_user is not null and @owner_user = '$<Creater>$')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @owner_user = @creator~r~n" + &
"~tEnd~r~n" + &
"~t~r~n" + &
"~tSelect @data_view_id = view_id from export_header where export_id =(select export_id From request_webform Where rwf_id =@rwf_id);~r~n" + &
"~t~r~n" + &
"~t/* use the template create the request webform data.*/~r~n" + &
"~t/* the value need to be obtain in the beginning run the funcation.*/~r~n" + &
"~tSelect top 1 @contact_id = col_number_value from request_webform_detail where table_name = 'ctx_contacts' and col_name = 'contact_id' ~r~n" + &
"~t~t~tand (col_type = 'numeric' or col_type = 'int' ) and rwf_id =@rwf_id  ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~t~t~t~r~n" + &
"~tSelect @app_facility = col_number_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='app_facility' ~r~n" + &
"~t~t~tand (col_type = 'numeric' or col_type = 'int' )~tand rwf_id =@rwf_id  ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~t~t~t~t~t~t~t~r~n" + &
"~tSelect @master_contract_id = col_number_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='master_contract_id' ~r~n" + &
"~t~t~tand (col_type = 'numeric' or col_type = 'int' )~tand rwf_id =@rwf_id  ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~r~n" + &
"~tSet @update_document ='N'~r~n" + &
"~tSet @count = 0~r~n" + &
"~tSelect @count = col_number_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='category' and rwf_id =@rwf_id ~r~n" + &
"~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~r~n" + &
"~t/* when use the category, need to change the document category. */~r~n" + &
"~tif(@count is not null and @count > 0 ) ~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @update_document ='Y'~r~n" + &
"~t~tSet @category = @count~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tSet @sql_temp1 = ''~r~n" + &
"~tSet @sql_temp2 = ''~r~n" + &
"~tSet @sql_insert = ' Update ctx_basic_info set '~r~n" + &
"~tSet @sql = ' Where ctx_id ='+ convert(varchar,@ctx_id ) + ' ; '  ~r~n" + &
"~tSet @sql_value = ''~r~n" + &
"~tSet @sql_delete_ctx = ' delete from ctx_location_contacts where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_location_specialty where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_location_pracs where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_loc where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_elements where ctx_req_profile_hdr_id in ( select a.ctx_req_profile_hdr_id from ctx_req_profile_hdr a where a.ctx_id ='+ convert(varchar,@ctx_id) +' ) ; ' + ~r~n" + &
"~t~t' delete from ctx_req_profile_hdr where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_fee_sched_data where fee_sched_location_id in ( select a.fee_sched_location_id from ctx_fee_sched_locations a where a.fee_sched_id in ( select b.fee_sched_id from ctx_fee_sched_hdr b where b.ctx_id ='+ convert(varchar,@ctx_id) +' ) )  ; ' +~r~n" + &
"~t~t' delete from ctx_fee_sched_locations where fee_sched_id in ( select a.fee_sched_id from ctx_fee_sched_hdr a where a.ctx_id ='+ convert(varchar,@ctx_id) +') ; ' + ~r~n" + &
"~t~t' delete from ctx_fee_sched_pracs where fee_sched_id in ( select a.fee_sched_id from ctx_fee_sched_hdr a where a.ctx_id ='+ convert(varchar,@ctx_id) +' ) ; ' + ~r~n" + &
"~t~t' delete from ctx_fee_sched_hdr where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_file_location where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' +~r~n" + &
"~t~t' delete from ctx_orgs_contact where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_ai_notification_users where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_ai_alarm_attachment where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_ai_notification where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_action_items where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_image where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_images where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_notification_users where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_alarm_attachment where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_notification where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_fee_sched_nm where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_products where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_contract_contacts where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_custom where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_custom_multi_detail where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_custom_multi_hdr where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_version where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from sys_statusaudit where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from dashboard_gadgets_recent where upper ( recent_type ) =''CTX'' and data_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_templates_info where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_am_doc_audit where doc_id in ( select doc_id from ctx_am_document where ctx_id ='+ convert(varchar,@ctx_id) +') ; ' + ~r~n" + &
"~t~t' delete from ctx_am_ai_notification_users where doc_id in ( select doc_id from ctx_am_document where ctx_id ='+ convert(varchar,@ctx_id) +')  ; ' +~r~n" + &
"~t~t' delete from ctx_am_ai_alarm_attachment where doc_id in ( select doc_id from ctx_am_document where ctx_id ='+ convert(varchar,@ctx_id) +' ) ; ' + ~r~n" + &
"~t~t' delete from ctx_am_ai_notification where doc_id in ( select doc_id from ctx_am_document where ctx_id ='+ convert(varchar,@ctx_id) +' )  ; ' +~r~n" + &
"~t~t' delete from ctx_am_action_item where doc_id in ( select doc_id from ctx_am_document where ctx_id ='+ convert(varchar,@ctx_id) +') ; ' +  ~r~n" + &
"~t~t' delete from ctx_am_document_clause where doc_id in ( select doc_id from ctx_am_document where ctx_id ='+ convert(varchar,@ctx_id) +') ; ' +~r~n" + &
"~t~t' delete from ctx_am_doc_image where doc_id in ( select doc_id from ctx_am_document where ctx_id ='+ convert(varchar,@ctx_id) +' ) ; ' + ~r~n" + &
"~t~t' delete from ctx_am_document where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_alarm_attachment where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_ai_alarm_attachment where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_ai_notification where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_products where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from sys_statusaudit where ctx_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' update ctx_basic_info set master_contract_id =0 where master_contract_id ='+ convert(varchar,@ctx_id) +' ; ' + ~r~n" + &
"~t~t' delete from ctx_basic_info where ctx_id = '+ convert(varchar,@ctx_id) +' ; ' +~r~n" + &
"~t~t' UPDATE ids SET ctx_id =( ctx_id - 1 ) Where ctx_id ='+convert(varchar,@ctx_id)+' ; '~r~n" + &
"~r~n" + &
"~tif( @steps is not null and @steps = 1 )~r~n" + &
"~tBegin~t~t~t~r~n" + &
"~t~tSet @sql_delete_ctx = @sql_delete_ctx + ' Update request_webform Set submit_step = null~tWhere rwf_id ='+convert(varchar,@rwf_id) + ' ; '~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif (@master_contract_id is not null and @master_contract_id > 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @master_contract_name = facility_name from app_facility ~r~n" + &
"~t~t~twhere facility_id = (select app_facility from CTX_BASIC_INFO Where ctx_id =@master_contract_id ) ;~r~n" + &
"~t~tSet @master_contract_name = CONVERT(varchar,@master_contract_id) + '-'+@master_contract_name~r~n" + &
"~r~n" + &
"~t~tSet @submitted = 0~r~n" + &
"~t~tSelect @submitted = submitted From request_webform_detail~r~n" + &
"~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and(col_number_value is not null) ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 )  and (updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') and col_name = 'master_contract_id' ;~r~n" + &
"~t~tif(@submitted = 1 ) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @submitted_new = 3~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @submitted_new = 4~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @sql_insert = @sql_insert + ' master_contract_id='+convert(varchar,@master_contract_id)+' , master_contract_name='''+@master_contract_name+''' ,'~r~n" + &
"~t~tSelect @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info''  and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''master_contract_id'' ;'~t/*rowid = +convert(varchar,@rowid)*/~r~n" + &
"~t~tSelect @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info''  and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''master_contract_id'' ;'~t~t/*rowid = +convert(varchar,@rowid)*/~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/* set delete value */~r~n" + &
"~tSet @sql_delete = @sql_delete_ctx~r~n" + &
"~r~n" + &
"~tDECLARE template_cursor CURSOR FOR ~r~n" + &
"      ~tSelect table_name,rowid,order_no,col_name,col_string_value,col_datetime_value,col_number_value,col_decimal_value,col_type,scale,submitted,object_type,multi_select_text,formats,  ~r~n" + &
"      ~t~t(select systypes.name as col_type From syscolumns , systypes where syscolumns.xtype = systypes.xtype and syscolumns.name = request_webform_detail.col_name and object_name(syscolumns.id) = request_webform_detail.table_name) as col_type_org" + &
"~t~tFrom request_webform_detail~r~n" + &
"~t~tWhere types='column' and table_name ='ctx_basic_info' and rwf_id = @rwf_id and (design is null or design = 'm')~r~n" + &
"~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ~r~n" + &
"~t~tand ( col_string_value is not null or col_decimal_value is not null or col_number_value is not null or col_datetime_value is not null)~r~n" + &
"~t~tGroup by table_name,rowid,order_no,col_name,col_string_value,col_datetime_value,col_number_value,col_decimal_value,col_type,scale,submitted,object_type,multi_select_text,formats ;~r~n" + &
"~t~t~t~r~n" + &
"~tOPEN template_cursor~r~n" + &
"~tFETCH NEXT FROM template_cursor INTO  @table_name,@rowid,@order_no,@col_name,@col_string_value,@col_datetime_value,@col_number_value,@col_decimal_value,@col_type,@scale,@submitted,@object_type,@multi_select_text,@formats,@col_type_org  ~r~n" + &
"~t~t~t~t~r~n" + &
"~tWHILE @@FETCH_STATUS = 0~r~n" + &
"~tBEGIN~r~n" + &
"~t~tSet @temp_value = @col_string_value~r~n" + &
"~t~t/* multi-select dropdown option 0 */~r~n" + &
"~t~tif (@table_name = 'ctx_basic_info' and ((@object_type is not null) and lower(@object_type) = 'multi-select') ) ~r~n" + &
"~t~tBegin~t~t~t~t~r~n" + &
"~t~t~tif (@multi_select_text is not null) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @col_string_value = @multi_select_text~r~n" + &
"~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @col_string_value =''~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tif (@table_name = 'ctx_basic_info' and @col_name <> 'master_contract_id') ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @count = 0 ~r~n" + &
"~r~n" + &
"~t~t~tif(@col_type ='datetime' or @col_type ='smalldatetime')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_datetime_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value = ' convert(datetime,''' + convert(varchar,@col_datetime_value,101)+ ''') '~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if(@col_type ='int' or @col_type ='integer' or @col_type ='real' or @col_type ='float' or @col_type ='smallint'or @col_type ='tinyint')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_number_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value =  convert(varchar,@col_number_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if( (@col_type ='numeric' and @scale = 0) or (@col_type ='decimal' and @scale = 0) or (@col_type ='money' and @scale = 0))~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_number_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value =  convert(varchar,@col_number_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if((@col_type ='numeric' and @scale > 0) or (@col_type ='decimal' and @scale > 0) or (@col_type ='money' and @scale > 0))~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_decimal_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_value =  convert(varchar,@col_decimal_value)~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~telse if (@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_string_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*convert the percentage data to Decimal point data*/~r~n" + &
"~t~t~t~t~tif (RIGHT(@formats, 1) = '%' and ISNUMERIC(@col_string_value) = 1 and (@col_type_org = 'numeric' or @col_type_org ='decimal'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @col_string_value = CONVERT(varchar,(CONVERT(numeric(14,4),@col_string_value) / 100)) ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~t~t~tSet @col_string_value = REPLACE(@col_string_value,char(39),char(39)+char(39))~r~n" + &
"~t~t~t~t~tSelect @sql_value = ' ''' +@col_string_value+''' ' ~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@col_string_value is not null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*convert the percentage data to Decimal point data*/~r~n" + &
"~t~t~t~t~tif (RIGHT(@formats, 1) = '%' and ISNUMERIC(@col_string_value) = 1 and (@col_type_org = 'numeric' or @col_type_org ='decimal'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @col_string_value = CONVERT(varchar,(CONVERT(numeric(14,4),@col_string_value) / 100)) ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~t~t~tSet @col_string_value = REPLACE(@col_string_value,char(39),char(39)+char(39))~r~n" + &
"~t~t~t~t~tSelect @sql_value =  ' ''' +@col_string_value+''' ' ~r~n" + &
"~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tIf ( @count = 1)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert +' '+ @col_name + '= '+ @sql_value + ' ,'~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~t/*update the data flag*/~r~n" + &
"~t~t~tif (@submitted = 1 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~tSelect @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info'' and rowid = '+convert(varchar,@rowid)+' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = '''+@col_name+''' ;'~r~n" + &
"~t~t~tSelect @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info'' and rowid = '+convert(varchar,@rowid)+' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = '''+@col_name+''' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~t/* multi-select dropdown option 1 */~r~n" + &
"~t~tif (@table_name = 'ctx_basic_info' and ((@object_type is not null) and lower(@object_type) = 'multi-select') ) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (RIGHT(ltrim(rtrim(@temp_value)),1) <>';') Set @temp_value=@temp_value+';'~r~n" + &
"~t~t~tWHILE (CHARINDEX(';',@temp_value) > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_multi_select = @sql_multi_select + 'INSERT INTO screen_field_select_item (view_id,screen_id,ctx_id,field_name,field_data) VALUES ('+~t~r~n" + &
"~t~t~t~t~tconvert(varchar,@data_view_id)+',9,'+convert(varchar,@ctx_id)+','''+@col_name+''','''+ rtrim(ltrim(left(@temp_value,CHARINDEX(';',@temp_value) - 1 )))+''') ; ' ~t~r~n" + &
"~t~t~t~tSelect @sql_multi_select_delete = @sql_multi_select_delete +' Delete From screen_field_select_item Where view_id='+convert(varchar,@data_view_id)+' and '+~r~n" + &
"~t~t~t~t~t' screen_id = 9 and ctx_id='+convert(varchar,@ctx_id)+' and field_name='''+@col_name+''' and field_data='''+rtrim(ltrim(left(@temp_value,CHARINDEX(';',@temp_value) - 1 )))+''' ; '~t~r~n" + &
"~t~t~t~tSet @temp_value = SUBSTRING(@temp_value,CHARINDEX(';',@temp_value) + 1,len(@temp_value) - CHARINDEX(';',@temp_value) )~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd ~r~n" + &
"~t~tFETCH NEXT FROM template_cursor INTO  @table_name,@rowid,@order_no,@col_name,@col_string_value,@col_datetime_value,@col_number_value,@col_decimal_value,@col_type,@scale,@submitted,@object_type,@multi_select_text,@formats,@col_type_org~r~n" + &
"~tEnd~r~n" + &
"~tCLOSE template_cursor~r~n" + &
"~tDEALLOCATE template_cursor~r~n" + &
"~r~n" + &
"~tif(right(@sql_insert,1) = ',')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @sql_insert = left(@sql_insert, len(@sql_insert) - 1)~r~n" + &
"~t~tSelect @sql_insert = @sql_insert + @sql~r~n" + &
"~r~n" + &
"~t~tSet @num = 101~r~n" + &
"~t~tSet @error_sum = 0~t~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = ''~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~tBEGIN TRANSACTION ctx_template1;~t~r~n" + &
"~t~t~tExecute(@sql_insert + @sql_temp1);~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~t~r~n" + &
"~t~t~tSet @sql_delete2 = @sql_delete2 + @sql_temp2~r~n" + &
"~t~t~t~r~n" + &
"~t~t~t/* multi-select dropdown option value */~r~n" + &
"~t~t~tif (len(@sql_multi_select) > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_multi_select) ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + @sql_multi_select_delete~t~t~t~t~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() +' ; Sql:'+@sql_insert + @sql_temp1+' ?sql_multi_select:'+@sql_multi_select~r~n" + &
"~t~t~tROLLBACK TRANSACTION ctx_template1;~r~n" + &
"~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~t~tif @@error <> 0 ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Delete Ctx:'+@sql_delete  ~r~n" + &
"~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~t~r~n" + &
"~t~tEND CATCH;~t~r~n" + &
"~r~n" + &
"~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' ; Sql:'+@sql_insert + @sql_temp1+' ?sql_multi_select:'+@sql_multi_select~r~n" + &
"~t~t~tROLLBACK TRANSACTION ctx_template1;~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~t~tif @@error <> 0 ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ 'Error-  Delete Ctx:'+@sql_delete ~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~t~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tCOMMIT TRANSACTION ctx_template1;~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/* set delete2 value */~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~tSet @sql_delete2 = ''~r~n" + &
"~r~n" + &
"~t/* insert ctx_contract_contacts table */~r~n" + &
"~tif(@app_facility is null or @app_facility <= 0)~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @app_facility = ctx_basic_info.app_facility FROM ctx_templates_info, ctx_basic_info~r~n" + &
"~t~twhere ctx_templates_info.ctx_id = ctx_basic_info.ctx_id~r~n" + &
"~t~tAnd ctx_templates_info.ib_contract_detail = 1 and ctx_templates_info.clear_company = 0  ~r~n" + &
"~t~tAnd ctx_basic_info.app_facility is not null and len(ctx_basic_info.app_facility ) > 0 and ctx_templates_info.id = @template_id ;~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif(@contact_id is not null and @contact_id > 0 )~r~n" + &
"~tBegin~t~t~r~n" + &
"~t~t/*~tcheck the contacts if not exsist the company */~r~n" + &
"~t~tSet @count =0~r~n" + &
"~t~tSELECT @count =Count(1) FROM ctx_contacts WHERE facility_id = @app_facility and contact_id= @contact_id;~r~n" + &
"~t~tif (@count > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @num = 102~r~n" + &
"~t~t~tSet @count =0~r~n" + &
"~t~t~tSELECT @count =Count(1)  FROM ctx_contract_contacts WHERE ctx_id = @ctx_id and contact_id= @contact_id and ic_area = 'E';~r~n" + &
"~t~t~tif ( @count = 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~t~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@record_id  ;~r~n" + &
"~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid record_id. '~r~n" + &
"~t~t~t~t~If (@IFdelete = 0) ~r~n" + &
"~t~t~t~t~Begin~r~n" + &
"~t~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~tSet @record_id = @record_id + 1~r~n" + &
"~r~n" + &
"~t~t~t~tSelect @table_id = table_id from sys_tables where charindex('d_contract_det_contact_',lower(table_name) ) > 0~r~n" + &
"~t~t~t~t~tand charindex('contracted company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~t~t~tSELECT @contact_type = contact_type FROM ctx_contacts WHERE facility_id = @app_facility and contact_id= @contact_id;~r~n" + &
"~t~t~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~t~tSet @error_sum = 0~r~n" + &
"~t~t~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~t~t~tSet @sql_delete2 = ''~r~n" + &
"~t~t~t~tSet @sql_update = ''~r~n" + &
"~t~t~t~tBEGIN TRY~r~n" + &
"~t~t~t~tBEGIN TRANSACTION CTX2;~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t/*update ctx_contract_contacts table 5E */~r~n" + &
"~t~t~t~t~tif (@contact_type is null or @contact_type = 0 )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) ~r~n" + &
"~t~t~t~t~t~tVALUES ( @ctx_id , @contact_id, 'E', @record_id, 'Y', 'N', 'F' )~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access,association ) ~r~n" + &
"~t~t~t~t~t~tVALUES ( @ctx_id , @contact_id, 'E', @record_id, 'Y', 'N', 'F',convert(varchar,@contact_type) )~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''E'' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey, key1) Values( ''ctx_contract_contacts'','~r~n" + &
"~t~t~t~t~t~t+'0, '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t~t' and contact_id='+convert(varchar,@contact_id)+' and record_id='+convert(varchar,@record_id)+''','+convert(varchar,@contact_id)+' ); '~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename=''ctx_contract_contacts'' and rowid=0 and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~t  ~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~t~t~t~r~n" + &
"~r~n" + &
"~t~t~t~t~tINSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type )~r~n" + &
"~t~t~t~t~t~tVALUES(@record_id ,1001, @seq_no ,@table_id, @ctx_id ,'','INSERT',@user_id,getdate(),1,'I') ~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From sys_audit Where rec_id = '+convert(varchar,@record_id)+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~t~t~t~t~t~t~r~n" + &
"~t~t~t~tEND TRY~r~n" + &
"~t~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~tROLLBACK TRANSACTION CTX2;~r~n" + &
"~t~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEND CATCH;~r~n" + &
"~r~n" + &
"~t~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~t~tROLLBACK TRANSACTION CTX2;~r~n" + &
"~t~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~t~tEnd~t~t~t~t~t~r~n" + &
"~t~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tCOMMIT TRANSACTION CTX2;~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/*update ctx_contract_contacts table 5I */~r~n" + &
"~tSet @contact_id = null~t/* reset contact_id, maybe is not exists in system. And this cannot be use ccc contact. */~r~n" + &
"~tif(@owner_user is null or rtrim(ltrim(@owner_user)) = '')~r~n" + &
"~tBegin~r~n" + &
"~t~tif (@template_id is not null and @template_id > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @contact_id = ctx_contract_contacts.contact_id, @owner_user = ctx_contacts.user_d, @contact_type = ctx_contacts.contact_type ~r~n" + &
"~t~t~tFrom ctx_templates_info, ctx_contract_contacts, ctx_contacts~r~n" + &
"~t~t~tWhere ctx_templates_info.ctx_id = ctx_contract_contacts.ctx_id ~r~n" + &
"~t~t~tAnd ctx_contacts.contact_id = ctx_contract_contacts.contact_id~r~n" + &
"~t~t~tAnd ctx_templates_info.ib_our_contacts = 1 and ctx_templates_info.add_contact = 1 and ctx_templates_info.ib_owner = 1~r~n" + &
"~t~t~tAnd ctx_contract_contacts.ic_area = 'I' and ctx_contract_contacts.owner = 'Y' and ctx_templates_info.id = @template_id;~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~tElse~r~n" + &
"~tBegin~t~t~t~t~r~n" + &
"~t~tSelect top 1 @contact_id = contact_id, @contact_type = contact_type from ctx_contacts where user_d = @owner_user;~t~t~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif ((@contact_id is null or @contact_id = 0) and @owner_user is not null and DATALENGTH(ltrim(rtrim(@owner_user))) > 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = @err_msg+' Request creator ('+@owner_user+') is not associated with a company contact. Contact must be entered and associated. ';~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~t/*~tcheck the contacts if not exsist the Our Company Contacts */~r~n" + &
"~tSet @count =0~r~n" + &
"~tSELECT @count =Count(1)  FROM ctx_contract_contacts WHERE ctx_id = @ctx_id and contact_id= @contact_id and ic_area ='I' ;~r~n" + &
"~tif (@count = 0 and (@contact_id is not null and @contact_id > 0 ) )~t~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @num = 103~r~n" + &
"~t~tSet @sql_update = ''~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~tSet @error_sum = 0~r~n" + &
"~r~n" + &
"~t~tSet @default_email = 'Y'~r~n" + &
"~t~tSet @owner = 'Y'~r~n" + &
"~t~tSet @count =0~r~n" + &
"~t~tselect @count = isnull(contact_id,0) from ctx_contract_contacts WHERE ctx_id = @ctx_id and ic_area ='I' and default_email = 'Y'~r~n" + &
"~t~tif ( @count > 0  )~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~t/* Set @default_email = 'N' */~r~n" + &
"~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set default_email =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and default_email = ''Y'' ; '~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set default_email =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@count)+' ; '~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @count =0~r~n" + &
"~t~tselect @count = isnull(contact_id,0) from ctx_contract_contacts WHERE ctx_id = @ctx_id and ic_area ='I' and owner = 'Y'~r~n" + &
"~t~tif ( @count > 0  )~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~t/* Set @owner = 'N' */~r~n" + &
"~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set owner =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and owner = ''Y'' ; '~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set owner =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@count)+' ; '~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tif (len(ltrim(rtrim(@sql_update))) > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tBEGIN TRY~r~n" + &
"~t~t~tBEGIN TRANSACTION ctx_contract_trans;~t~r~n" + &
"~t~t~t~tExecute(@sql_update)~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tEND TRY~r~n" + &
"~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION ctx_contract_trans;~r~n" + &
"~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd CATCH~r~n" + &
"~r~n" + &
"~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION ctx_contract_trans;~r~n" + &
"~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tCOMMIT TRANSACTION ctx_contract_trans;~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @num = 104~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~tSelect @record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@record_id  ;~r~n" + &
"~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid record_id. '~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd~r~n" + &
"~t~tSet @record_id = @record_id + 1 ~r~n" + &
"~r~n" + &
"~t~tSelect @table_id = table_id from sys_tables where charindex('d_contract_det_contact_',lower(table_name) ) > 0~r~n" + &
"~t~t~tand charindex('our company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~r~n" + &
"~t~tSet @num = 105~r~n" + &
"~t~tSet @error_sum = 0~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~tSet @sql_update = ''~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~tBEGIN TRANSACTION CTX3;~t~r~n" + &
"~t~t~t~r~n" + &
"~t~t~t/*update ctx_contract_contacts table 5I */~r~n" + &
"~t~t~tif (@contact_type is null or @contact_type = 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) ~r~n" + &
"~t~t~t~tVALUES ( @ctx_id , @contact_id, 'I', @record_id , @default_email, @owner, 'F' )~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access, association ) ~r~n" + &
"~t~t~t~tVALUES ( @ctx_id , @contact_id, 'I', @record_id , @default_email, @owner, 'F',convert(varchar,@contact_type) )~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~r~n" + &
"~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey, key1) Values( ''ctx_contract_contacts'','~r~n" + &
"~t~t~t~t+'0, '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t' and contact_id='+convert(varchar,@contact_id)+' and record_id='+convert(varchar,@record_id)+''','+convert(varchar,@contact_id)+' ); '~r~n" + &
"~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename=''ctx_contract_contacts'' and rowid=0 and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~t  ~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~t~t~t~r~n" + &
"~r~n" + &
"~t~t~tINSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type )~r~n" + &
"~t~t~t~tVALUES(@record_id,1001, @seq_no ,@table_id, @ctx_id ,'','INSERT',@user_id,getdate(),1,'I') ~t~t~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From sys_audit Where rec_id = '+convert(varchar,@record_id )+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~tROLLBACK TRANSACTION CTX3;~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEND CATCH;~t~r~n" + &
"~t~t~t~r~n" + &
"~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~tROLLBACK TRANSACTION CTX3;~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd ~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tCOMMIT TRANSACTION CTX3;~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~telse if(@count = 1 and (@contact_id is not null and @contact_id > 0 ) )~t~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @num = 106~r~n" + &
"~t~tSet @sql_update = ''~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~tSet @error_sum = 0~r~n" + &
"~t~t~t~r~n" + &
"~t~tSet @default_email = ''~r~n" + &
"~t~tSet @owner = ''~t~t~t~r~n" + &
"~t~tselect @default_email = default_email, @owner = owner from ctx_contract_contacts WHERE ctx_id = @ctx_id and contact_id= @contact_id  and ic_area ='I' ; ~r~n" + &
"~t~tif ( upper(@default_email) <> 'Y'  )~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~tSet @count =0~r~n" + &
"~t~t~tselect @count = isnull(contact_id,0) from ctx_contract_contacts WHERE ctx_id = @ctx_id and ic_area ='I' and default_email = 'Y' ;~r~n" + &
"~t~t~tif(@count > 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set default_email =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and default_email = ''Y'' and contact_id='+convert(varchar,@count)+' ; '~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set default_email =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@count)+' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set default_email =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set default_email =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@contact_id)+' ; '~t~t~t~t~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~t~r~n" + &
"~t~tif ( upper(@owner) <> 'Y'  )~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~tSet @count =0~r~n" + &
"~t~t~tselect @count = isnull(contact_id,0) from ctx_contract_contacts WHERE ctx_id = @ctx_id and ic_area ='I' and owner = 'Y' ;~r~n" + &
"~t~t~tif(@count > 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set owner =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and owner = ''Y'' and contact_id='+convert(varchar,@count)+' ; '~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set owner =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@count)+' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set owner =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set owner =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@contact_id)+' ; '~t~t~t~t~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tif (len(ltrim(rtrim(@sql_update))) > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tBEGIN TRY~r~n" + &
"~t~t~tBEGIN TRANSACTION ctx_contract_trans2;~t~r~n" + &
"~t~t~t~tExecute(@sql_update)~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tEND TRY~r~n" + &
"~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION ctx_contract_trans2;~r~n" + &
"~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd CATCH~r~n" + &
"~r~n" + &
"~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION ctx_contract_trans2;~r~n" + &
"~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tCOMMIT TRANSACTION ctx_contract_trans2;~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/* request CTX_CONTACTS data or contractlogix user */~r~n" + &
"~tSet @num =107~t~t~r~n" + &
"~tSet @error_sum = 0~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~tSet @sql_delete2 = '' ~r~n" + &
"~tSet @sql_update = ''~r~n" + &
"~r~n" + &
"~tSelect @lookup_code = lookup_code from code_lookup where lookup_name ='Contract Contact Type' and lower(code)=lower('REQUESTER');~r~n" + &
"~tSelect @contact_type2 = ( case when app_facility.contact_type2 is not null and app_facility.contact_type2 = 'A' then 'I'~r~n" + &
"~t~t~twhen app_facility.contact_type2 is not null and app_facility.contact_type2 = 'B' then 'E'  else '' end ),~r~n" + &
"~t~t~t@contact_type = ctx_contacts.contact_type, @contact_id =ctx_contacts.contact_id~r~n" + &
"~t~t~tfrom ctx_contacts left join app_facility on ctx_contacts.facility_id = app_facility.facility_id~r~n" + &
"~t~tWhere (ctx_contacts.requester_user_d = (select create_user from request_webform where rwf_id = @rwf_id) ~r~n" + &
"~t~t~t~tor ctx_contacts.user_d =(select create_user from request_webform where rwf_id = @rwf_id));~t~r~n" + &
"~r~n" + &
"~tSet @count = 0~r~n" + &
"~tSelect @count = Count(1) from ctx_contract_contacts Where ctx_id =@ctx_id and contact_id =@contact_id and ic_area = @contact_type2;~r~n" + &
"~tif(@contact_type2 is not null and @contact_type2 <> '' and @count= 0)~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@record_id  ;~r~n" + &
"~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid record_id. '~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd~r~n" + &
"~t~tSet @record_id = @record_id + 1 ~r~n" + &
"~r~n" + &
"~t~tIf (@contact_type2 ='A')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @table_id = table_id from sys_tables where charindex('d_contract_det_contact_',lower(table_name) ) > 0~r~n" + &
"~t~t~t~tand charindex('our company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @table_id = table_id from sys_tables where charindex('d_contract_det_contact_',lower(table_name) ) > 0~r~n" + &
"~t~t~t~tand charindex('contracted company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~tBEGIN TRANSACTION ctx_contract_request_update;~t~t~t~t~r~n" + &
"~t~t~t/*update ctx_contract_contacts */~r~n" + &
"~t~t~tif (@contact_type is null or @contact_type = 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access,association10 ) ~r~n" + &
"~t~t~t~tVALUES ( @ctx_id , @contact_id, @contact_type2, @record_id , 'N', 'N', 'F',convert(varchar,@lookup_code) )~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access, association,association10 ) ~r~n" + &
"~t~t~t~tVALUES ( @ctx_id , @contact_id, @contact_type2, @record_id , 'N', 'N', 'F',convert(varchar,@contact_type),convert(varchar,@lookup_code) )~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@ctx_id)+' and ic_area ='''+@contact_type2+''' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~r~n" + &
"~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey, key1) Values( ''ctx_contract_contacts'','~r~n" + &
"~t~t~t~t+'0, '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t' and contact_id='+convert(varchar,@contact_id)+' and record_id='+convert(varchar,@record_id)+''','+convert(varchar,@contact_id)+' ); '~r~n" + &
"~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename=''ctx_contract_contacts'' and rowid=0 and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~t  ~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~t~t~t~r~n" + &
"~r~n" + &
"~t~t~tINSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type )~r~n" + &
"~t~t~t~tVALUES(@record_id,1001, @seq_no ,@table_id, @ctx_id ,'','INSERT',@user_id,getdate(),1,@contact_type2) ~t~t~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From sys_audit Where rec_id = '+convert(varchar,@record_id )+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~tROLLBACK TRANSACTION ctx_contract_request_update;~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEND CATCH;~t~r~n" + &
"~t~t~t~r~n" + &
"~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~tROLLBACK TRANSACTION ctx_contract_request_update;~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd ~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tCOMMIT TRANSACTION ctx_contract_request_update;~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~tElse if (@count= 1)~r~n" + &
"~tBegin~r~n" + &
"~t~tUpdate ctx_contract_contacts set association10 = convert(varchar,@lookup_code) ~r~n" + &
"~t~t~tWhere ctx_id =@ctx_id and contact_id =@contact_id and ic_area = @contact_type2;~r~n" + &
"~t~tSelect @sql_delete2 = @sql_delete2+ ' Update ctx_contract_contacts set association10='''' Where ctx_id ='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t' and contact_id ='+convert(varchar,@contact_id)+' and ic_area ='''+@contact_type2+''' ; '~r~n" + &
"~tEnd~r~n" + &
"~t/* except ctx_basic_info table */~r~n" + &
"~tSet @num = 108~r~n" + &
"~tSet @error_sum = 0~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~tSet @sql_delete2 = '' ~r~n" + &
"~texecute sp_create_request_data_table @rwf_id ,@user_id,@do_steps,@ctx_id , @sql_delete2 output, @err_msg output~r~n" + &
"~tSet @error_sum = @error_sum + @@error~r~n" + &
"~tif (@error_sum <> 0 or charindex('error',lower(@err_msg)) > 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd ~t~t~t~r~n" + &
"~t~treturn ~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/*update request_webform_document table  */~r~n" + &
"~tSet @sql = ''~r~n" + &
"~tSet @sql_insert = ''~r~n" + &
"~tSet @sql_value = ''~r~n" + &
"~tSet @sql_update = ''~r~n" + &
"~tSet @sql_temp1 = ''~r~n" + &
"~tSet @sql_temp2 = ''~r~n" + &
"~tSet @sql_temp3 = ''~r~n" + &
"~tSet @sql_temp4 = ''~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~tSet @sql_delete2 = '' ~t~r~n" + &
"~t~t~r~n" + &
"~tSet @status = NULL~r~n" + &
"~tselect @status = lookup_code from code_lookup where upper(lookup_name) = upper('Contract Document Status') and upper(code) = upper('New') ;~r~n" + &
"~r~n" + &
"~tSet @num = 150~r~n" + &
"~tSet @count = 0~r~n" + &
"~tSelect @count = count(*) from request_webform_document Where datalength(document_content) > 0 and rwf_id = @rwf_id ~r~n" + &
"~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~r~n" + &
"~tif (@count > 0 )~r~n" + &
"~tBegin~t~r~n" + &
"~t~tSELECT @doc_id = doc_id FROM ids ;~r~n" + &
"~t~tUpdate ids SET doc_id =( isnull ( doc_id , 0 ) + @count ) where doc_id = @doc_id;~r~n" + &
"~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid doc_id. '~r~n" + &
"~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @count = 0~r~n" + &
"~t~tDeclare document_template_cursor Cursor For ~r~n" + &
"~t~t~tSelect rwfdoc_id,document_id,doc_type,request_id,submitted,ctx_doc_type from request_webform_document ~r~n" + &
"~t~t~tWhere datalength(document_content) > 0 and rwf_id = @rwf_id~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~t~r~n" + &
"~t~tOpen document_template_cursor~r~n" + &
"~t~tFetch Next From document_template_cursor Into @rwfdoc_id, @document_id, @doc_type, @request_id,@submitted, @ctx_doc_type ;~r~n" + &
"~t~tWhile @@FETCH_STATUS = 0~r~n" + &
"~t~tBegin~t~r~n" + &
"~t~t~tif (@submitted = 1 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~tSet @count = @count + 1~r~n" + &
"~t~t~tSelect @sql_insert = @sql_insert + 'INSERT INTO ctx_am_document ( doc_id, ctx_id, doc_name, revision, doc_type,doc_ext, category, base_type, create_by, create_date,~r~n" + &
"~t~t~t~t~t~tstatus,status_by, status_date, filename, revision_control, received_by, received_date,notes )' +~r~n" + &
"~t~t~t~t~t~t' Select '+convert(varchar, @doc_id + @count)+','+ convert(varchar,@ctx_id)+',document_name,1.0,'''+@ctx_doc_type+''', (case when lower(doc_ext) = ''docx'' or lower(doc_ext) = ''xlsx'' then left(doc_ext,3) else doc_ext end), '+ convert(varchar, @category)+~r~n" + &
"~t~t~t~t~t~t', ''3'',''' +@user_id+''',GETDATE(),'+ convert(varchar, @status) +', '''+@user_id+''',GETDATE(), document_name +'+'''.'''+ '+doc_ext,1, ''' +~r~n" + &
"~t~t~t~t~t~t@user_id+''' ,GETDATE(),description From request_webform_document Where rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id ='+convert(varchar,@rwfdoc_id)+' ; '~r~n" + &
"~t~t~tSelect @sql_temp1 = @sql_temp1 + ' Delete From ctx_am_document Where doc_id ='+convert(varchar, @doc_id + @count)+' ; '~r~n" + &
"~r~n" + &
"~t~t~tSelect @sql = @sql + 'INSERT INTO ctx_am_doc_image ( doc_id , revision, image_file , doc_ext , modify_date , doc_ext_full ) ' +~r~n" + &
"~t~t~t~t~t~t~t' Select '+convert(varchar, @doc_id + @count)+', 1.0,document_content, (case when lower(doc_ext) = ''docx'' or lower(doc_ext) = ''xlsx'' then left(doc_ext,3) else doc_ext end), getdate() , doc_ext From request_webform_document~r~n" + &
"~t~t~t~t~t~t~t~tWhere rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id ='+convert(varchar,@rwfdoc_id)+' ; '~t~r~n" + &
"~t~t~tSelect @sql_temp2 = @sql_temp2 + ' Delete From ctx_am_doc_image Where doc_id ='+convert(varchar, @doc_id + @count)+' and revision =1.0 ; '~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~tSelect @sql_value = @sql_value + 'INSERT INTO ctx_am_doc_audit ( doc_id, audit_id, revision, doc_ext, action, action_by, action_date,~r~n" + &
"~t~t~t~t~t~t~t~tfilename,notes,esign_type) Select '+convert(varchar, @doc_id + @count)+', 1, 1.0, (case when lower(doc_ext) = ''docx'' or lower(doc_ext) = ''xlsx'' then left(doc_ext,3) else doc_ext end),''New - Existing'','''+@user_id+''',~r~n" + &
"~t~t~t~t~t~t~t~tGETDATE(),document_name +'+'''.'''+ '+doc_ext,description,''sertifi'' From request_webform_document ~r~n" + &
"~t~t~t~t~t~t~t~tWhere rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id ='+convert(varchar,@rwfdoc_id)+' ; '~t~t~r~n" + &
"~t~t~tSelect @sql_temp3 = @sql_temp3 + ' Delete From ctx_am_doc_audit Where doc_id ='+convert(varchar, @doc_id + @count)+' and audit_id =1 ; '~t~t~t~t~t~t~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~r~n" + &
"~t~t~tSelect @sql_update = @sql_update + ' Update request_webform_document Set file_id ='+convert(varchar, @doc_id + @count)+ ', updated = ''Y'',submitted='+convert(varchar,@submitted_new)+' From request_webform_document ~r~n" + &
"~t~t~t~t~t~t~t~tWhere rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id = '+convert(varchar,@rwfdoc_id)+' ; '~r~n" + &
"~t~t~tSelect @sql_temp4 = @sql_temp4 + ' Update request_webform_document Set file_id = null , updated = ''N'', submitted ='+convert(varchar,@submitted)+' From request_webform_document ~r~n" + &
"~t~t~t~t~t~t~t~tWhere rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id = '+convert(varchar,@rwfdoc_id)+' ; '~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey,key1) Values( ''ctx_am_document'',' +~r~n" + &
"~t~t~t~t~t'0, '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and doc_id='+convert(varchar, @doc_id + @count)+' '','+convert(varchar, @doc_id + @count)+'); '  ~t~t~t~t~t~r~n" + &
"~t~t~tSet @sql_temp4 = @sql_temp4 + ' Delete From request_relation_table Where tablename=''ctx_am_document'' and rowid=0 and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' and key1 ='+convert(varchar, @doc_id + @count)+' ; '~t~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~tFetch Next From document_template_cursor Into @rwfdoc_id, @document_id, @doc_type, @request_id,@submitted, @ctx_doc_type ;~r~n" + &
"~t~tEnd~t~r~n" + &
"~t~tClose document_template_cursor~r~n" + &
"~t~tDeallocate document_template_cursor~r~n" + &
"~r~n" + &
"~t~tif (@count > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @num = 151~r~n" + &
"~t~t~tSet @error_sum = 0~t~t~r~n" + &
"~t~t~tBEGIN TRY~r~n" + &
"~t~t~tBEGIN TRANSACTION document_trans;~t~t~t~t~t~r~n" + &
"~r~n" + &
"~t~t~t~tExecute(@sql_insert) ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t/* Select @sql_delete2 = @sql_delete2 + @sql_temp1 */~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~tExecute(@sql) ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t/* Select @sql_delete2 = @sql_delete2 + @sql_temp2 */~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~tExecute(@sql_value) ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t/* Select @sql_delete2 = @sql_delete2 + @sql_temp3 */~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t/* Select @sql_delete2 = @sql_delete2 + @sql_temp4 */~r~n" + &
"~t~t~t~t/*change the delete data of the order sentence*/~t~t~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + @sql_temp3 + @sql_temp2 + @sql_temp1 + @sql_temp4~r~n" + &
"~r~n" + &
"~t~t~tEnd TRY~r~n" + &
"~t~t~r~n" + &
"~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() +' ; Sql:'+@sql_insert~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION document_trans;~r~n" + &
"~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEND CATCH;~t~r~n" + &
"~r~n" + &
"~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' ; Sql:'+@sql_insert~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION document_trans;~r~n" + &
"~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~treturn ~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tCOMMIT TRANSACTION document_trans;~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/*~tupdate the category value in the document. */~r~n" + &
"~tSet @num = 152~r~n" + &
"~tSet @error_sum = 0~t~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~tSet @sql_delete2 = '' ~r~n" + &
"~tif(@update_document = 'Y')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @count = 0~r~n" + &
"~t~tSelect @count = count(1) from ctx_am_document where ctx_id = @ctx_id and category <> @category~r~n" + &
"~t~t~tand doc_id in (select key1 from request_relation_table where  tablename='ctx_am_document' and rowid=0 and rwf_id = @rwf_id and ctx_id = @ctx_id )~r~n" + &
"~t~tif (@count  > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tUpdate ctx_am_document Set category = @category where ctx_id = @ctx_id and category <> @category~r~n" + &
"~t~t~t~tand doc_id in (select key1 from request_relation_table where  tablename='ctx_am_document' and rowid=0 and rwf_id = @rwf_id and ctx_id = @ctx_id )~r~n" + &
"~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd ~t~t~t~r~n" + &
"~t~t~t~treturn ~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/*update request_webform table and add the log */~r~n" + &
"~tSet @num = 153~r~n" + &
"~tSet @error_sum = 0~t~r~n" + &
"~tSet @count = 0~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~tSet @sql_delete2 = '' ~t~r~n" + &
"~tif(@template_id is null)~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @template_id = 0~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif(@notes is null or ltrim(rtrim(@notes))= '')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @notes = 'Your contract #'+ convert(varchar,@ctx_id)+ ' has been successfully created.'~r~n" + &
"~tEnd ~r~n" + &
"~tElse~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @notes = 'Your contract #'+ convert(varchar,@ctx_id)+ ' has been successfully created. '+char(10)+char(13) + @notes~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tif(DATALENGTH(@err_msg) > 0 and @err_msg <>'' )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @notes = @notes +char(10)+char(13) + left(@err_msg,8000 - datalength(@notes) - 2) ;~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tBEGIN TRY~r~n" + &
"~tBEGIN TRANSACTION ctx_template_log;~t~r~n" + &
"~t~tUpdate request_webform~tSet status ='Completed', ctx_id = @ctx_id Where rwf_id = @rwf_id ;~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~t~t~r~n" + &
"~t~t~r~n" + &
"~t~tUpdate request_webform_detail ~r~n" + &
"~t~tSet submitted = (case when submitted = 1 then 3 else 4 end ), updated = 'Y' ~r~n" + &
"~t~twhere rwf_id =@rwf_id ~t~t~t~t~r~n" + &
"~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~t~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~r~n" + &
"~t~tUpdate request_webform_document ~r~n" + &
"~t~tSet submitted = (case when submitted = 1 then 3 else 4 end ), updated = 'Y' ~r~n" + &
"~t~twhere rwf_id =@rwf_id ~t~r~n" + &
"~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~t~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~r~n" + &
"~t~tif exists( select 1 from request_webform where rwf_id =@rwf_id ~tand (reject_step is null or ltrim(rtrim(reject_step)) = '') ~r~n" + &
"~t~t~tand not exists( select 1 from request_webform_detail ~r~n" + &
"~t~t~t~twhere request_webform_detail.rwf_id = request_webform.rwf_id and request_webform_detail.types = 'step' ~r~n" + &
"~t~t~t~tand ( request_webform_detail.submitted is null or (request_webform_detail.submitted <> 3 and request_webform_detail.submitted <> 4) ) ) ~r~n" + &
"~t~t~tand not exists( select 1 from request_webform_document where request_webform_document.rwf_id = request_webform.rwf_id   ~r~n" + &
"~t~t~t~t~tand ( request_webform_document.submitted is null or (request_webform_document.submitted <> 3 and request_webform_document.submitted <> 4)))  ) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @count = count(1) from request_webform_document where request_webform_document.rwf_id = @rwf_id;~r~n" + &
"~t~t~tif ( (( @allow_update_doc is not null and @allow_update_doc ='1') and (@count > 0 or (@count = 0 and ~r~n" + &
"~t~t~t~t(charindex(';-999;',@do_steps) > 0 or @do_steps = 'all' or charindex(';-999;',@submit_step) > 0 )))) or (@allow_update_doc is null or @allow_update_doc ='0' ) )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tUpdate request_webform Set submit_step = 'C' Where rwf_id = @rwf_id ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~t~t~tEnd~t~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~t~t~t~t~t~t~r~n" + &
"~t~tINSERT INTO request_webform_log (rwf_id,notes ,user_id,modify_date ,action, ctx_id)~r~n" + &
"~t~t~tValues(@rwf_id, @notes, @user_id, getdate(), 'Approved', @ctx_id) ;~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~t~r~n" + &
"~t~t/*Set @sql_delete2 = @sql_delete2 +' Delete From request_webform_log Where rwf_id ='+convert(varchar,@rwf_id) + ' and action = ''Approved'' and ctx_id ='+convert(varchar,@ctx_id)+ ' ; ' */~r~n" + &
"~t~t~r~n" + &
"~t~tUpdate ctx_basic_info Set come_from = ( case when charindex(')',come_from) > 0 then 'request('+ substring(come_from,charindex('(',come_from)+ 1 ,charindex(')',come_from) - charindex('(',come_from) - 1 ) + ')-completed'~r~n" + &
"~t~t~t~telse 'request('+convert(varchar,@rwf_id)+')-completed' end ) Where ctx_id = @ctx_id ;~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~t~r~n" + &
"~tEND TRY~r~n" + &
"~tBEGIN CATCH~r~n" + &
"~t~tSelect @err_msg = ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~tROLLBACK TRANSACTION ctx_template_log;~r~n" + &
"~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd ~t~t~t~r~n" + &
"~t~treturn ~t~r~n" + &
"~tEND CATCH;~t~r~n" + &
"~r~n" + &
"~tIf (@error_sum <> 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~tROLLBACK TRANSACTION ctx_template_log;~r~n" + &
"~t~tIf (@IFdelete = 0) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd ~t~t~t~r~n" + &
"~t~treturn ~t~r~n" + &
"~tEnd~r~n" + &
"~telse~r~n" + &
"~tBegin~r~n" + &
"~t~tCOMMIT TRANSACTION ctx_template_log;~r~n" + &
"~tEnd~r~n" + &
"End ~r~n"


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_create_request_data' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure sp_create_request_data~r~n" + &
"End ~r~n"

// Modified sp_create_request_data for DataFill for Company field. By Ken.Guo 2015-11-30			//Modified By Mark Lee 07/27/2016
//Modified By Harry 2017-03-02 convert doc_ext field from docx or xlsx to doc or xls 
//is_sql_statements[upperbound(is_sql_statements) + 1] = &
String ls_sql1, ls_sql2   //Modified By Harry 2017-07-10  Task 784:Request puts incorrect value into "percent" formatted field of created contract
ls_sql1 = "Create Procedure sp_create_request_data( @rwf_id int,@user_id varchar(50),@notes varchar(8000),@do_steps varchar(500),@ctx_id int output, @err_msg varchar(8000) output, @IFdelete  int)~r~n" + &
"AS~r~n" + &
"Begin~r~n" + &
"~tDeclare @num tinyint, @error_sum int, @relative_days int, @col_length int, @parent_rowid int~r~n" + &
"~tDeclare~t@count int,~t@max int, @template_id int, @category int, @lookup_code int,@status int, @record_id int, @app_facility int, @data_view_id int ~r~n" + &
"~tDeclare~t@table_id int, @custom_status1 int,~t@custom_status2 int, @seq_no int,@contact_id int, @steps int, @submitted int, @submitted_new int, @master_contract_id int  ~r~n" + &
"~tDeclare @rowid int, @order_no int,@col_number_value int,@scale int, @doc_id int, @document_id int, @request_id int, @rwfdoc_id int, @contact_type int~r~n" + &
"~tDeclare @col_decimal_value numeric(14,4)~r~n" + &
"~tDeclare @version_number varchar(15), @master_contract_name varchar(255),@return varchar(10), @submit_step varchar(500), @default_value varchar(30), @data_from varchar(100)~r~n" + &
"~tDeclare @table_name varchar(50), @col_name varchar(50), @col_string_value varchar(max), @col_type varchar(128),@owner_user varchar(50), @creator varchar(50)~r~n" + &
"~tDeclare @document_name varchar(200), @doc_ext varchar(10), @description varchar(2000), @doc_type varchar(6), @ctx_doc_type varchar(30), @multi_select_text varchar(8000),@formats varchar(50),@col_type_org varchar(50)~r~n" + &
"~tDeclare @field_name_fill varchar(50), @parent_table varchar(50), @field_name_map varchar(50), @code varchar(40), @primarykey varchar(500), @object_type varchar(50)~r~n" + &
"~tDeclare @version_date datetime, @col_datetime_value datetime~r~n" + &
"~tDeclare @allow_update_doc char(1), @default_email char(1),@owner char(1), @update_document char(1), @lookup_field_style char(1), @contact_type2 char(1)~r~n" + &
"~tDeclare @sql_insert varchar(max),@sql_value varchar(max), @sql varchar(max), @sql_delete varchar(max),@sql_delete2 varchar(max),@sql_delete_ctx varchar(max)~r~n" + &
"~tDeclare @sql_temp1 varchar(max),@sql_temp2 varchar(max),@sql_temp3 varchar(max),@sql_temp4 varchar(max), @sql_update varchar(max), @autofill varchar(max)~r~n" + &
"~tDeclare @sql_execute nvarchar(1000), @sql_multi_select varchar(max), @sql_multi_select_delete varchar(max),@temp_value varchar(max)~r~n" + &
"~r~n" + &
"~tSET ANSI_NULLS ON;~r~n" + &
"~r~n" + &
"~tSET QUOTED_IDENTIFIER ON;~r~n" + &
"~r~n" + &
"~tSet NOCOUNT ON;~r~n" + &
"~r~n" + &
"~tSet @sql_delete = ''~r~n" + &
"~tSet @sql_delete2 = ''~r~n" + &
"~tSet @sql_multi_select = ''~r~n" + &
"~tSet @sql_multi_select_delete = ''~r~n" + &
"~tSet @error_sum = 0~r~n" + &
"~tSet @err_msg = ''~r~n" + &
"~tSet @num = 1~r~n" + &
"~r~n" + &
"~t/* add adjuest status is 'Waiting for Approval' */~r~n" + &
"~t/* when you choose the auto commit, submitted value is 1 else 2. */~r~n" + &
"~tSELECT @count = Count(1) From request_webform Where rwf_id =@rwf_id ;~r~n" + &
"~tif(@count = 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; The @rwf_id is a invalid.'~r~n" + &
"~t~treturn~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif (@do_steps is null or rtrim(ltrim(@do_steps)) = '') ~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @do_steps = 'all'~r~n" + &
"~tEnd~r~n" + &
"~t~r~n" + &
"~tSelect @category =category, @owner_user =owner_user, @allow_update_doc =allow_update_doc, @template_id = template_id,@creator =create_user, @steps = steps, ~r~n" + &
"~t~t@submit_step = isnull(submit_step,'') From request_webform Where rwf_id =@rwf_id;~r~n" + &
"~tif (@owner_user is not null and @owner_user = '$<Creater>$')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @owner_user = @creator~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tSelect @data_view_id = view_id from export_header where export_id =(select export_id From request_webform Where rwf_id =@rwf_id);~r~n" + &
"~r~n" + &
"~t/* @ctx_id is come from template module of create value */~r~n" + &
"~tif (@ctx_id is null or @ctx_id = 0)~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @count = 0~r~n" + &
"~t~tSELECT @count = Count(*) FROM ctx_basic_info;~r~n" + &
"~t~tSELECT @max = isnull(MaxContractCnt,0) FROM icred_settings;~r~n" + &
"~r~n" + &
"~t~tSet @num = 4~r~n" + &
"~t~tif (@max > 0 and @count >= @max)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+';Your record limit for number of contracts has been reached. Call Contract Logix sales at 866-371-4445 to purchase an upgrade.'~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/*new*/~r~n" + &
"~t~tSet @count = 0~r~n" + &
"~t~tSelect @lookup_code~t= lookup_code from code_lookup where   upper(lookup_name) = upper('Contract Status') and upper(code) = upper('active');~r~n" + &
"~t~t~t~t~r~n" + &
"~t~tSelect @count = col_number_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='category' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~t~r~n" + &
"~t~tSelect @status = col_number_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='status' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~r~n" + &
"~t~tSelect @version_date = col_datetime_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='version_date' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~r~n" + &
"~t~tSelect @version_number = col_string_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='version_number' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~r~n" + &
"~t~tSelect @master_contract_name = col_string_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='master_contract_name' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~t~t~r~n" + &
"~t~tSelect @master_contract_id = col_number_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='master_contract_id' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~t~t~r~n" + &
"~t~tSelect @custom_status1 = count(1) from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='custom_status1' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~r~n" + &
"~t~tSelect @custom_status2 = count(1) from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='custom_status2' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~r~n" + &
"~t~tSelect @app_facility = col_number_value from request_webform_detail where table_name = 'ctx_basic_info' and col_name ='app_facility' and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~r~n" + &
"~t~tSelect @contact_id = col_number_value from request_webform_detail where table_name = 'ctx_contacts' and col_name = 'contact_id' and (col_type = 'numeric' or col_type = 'int' ) and rwf_id =@rwf_id ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~r~n" + &
"~t~r~n" + &
"~t~t/*update default the category value*/~r~n" + &
"~t~tif (@count is not null and @count > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @category = @count~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tif(@version_number is null or @version_number ='')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @version_number~t= '1.0'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tif(@version_date is null )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @version_date~t= getdate()~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tif(@master_contract_name is null)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @master_contract_name = ''~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~tif (@master_contract_id is null)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @master_contract_id = 0~t~r~n" + &
"~t~tEnd ~r~n" + &
"~t~tElse if (@master_contract_id > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @master_contract_name = facility_name from app_facility ~r~n" + &
"~t~t~t~twhere facility_id = (select app_facility from CTX_BASIC_INFO Where ctx_id =@master_contract_id ) ;~r~n" + &
"~t~t~tSet @master_contract_name = CONVERT(varchar,@master_contract_id) + '-'+@master_contract_name~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tif(@status is null or @status = 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @status = @lookup_code~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* checked the value if there are a valid. */~r~n" + &
"~t~tif(@app_facility is null or @app_facility =0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid Company. '~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t/*~tget ctx_basic_info table id*/~r~n" + &
"~t~tselect @table_id = table_id from sys_tables where lower(import_table_name) = lower('ctx_basic_info') ;~r~n" + &
"~t~tselect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~tif (@seq_no is null )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @seq_no = MIN(seq_no)  from sys_audit ;~r~n" + &
"~t~t~tif (@seq_no is null )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tset @seq_no = 1~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tset @seq_no = @seq_no - 1~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (@seq_no = 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tset @seq_no = 1~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tset @seq_no = @seq_no + 1~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @num = 5~r~n" + &
"~t~tSelect @ctx_id = isnull(ctx_id, 0) From ids;~t~r~n" + &
"~t~tUPDATE ids  SET ctx_id = (isnull(ctx_id , 0) + 1) Where ctx_id = @ctx_id ;~r~n" + &
"~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid CTX Id. '~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tSet @ctx_id = @ctx_id + 1 ~r~n" + &
"~t~tSet @num = 6~t~r~n" + &
"~t~tSelect @record_id = isnull(record_id, 0) From ids;~t~r~n" + &
"~t~tUPDATE ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id = @record_id ;~r~n" + &
"~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid record_id. '~r~n" + &
"~t~t~tUPDATE ids~tSET ctx_id =( ctx_id - 1 ) Where ctx_id = @ctx_id; ~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tSet @record_id = @record_id + 1 ~r~n" + &
"~t~tSet @sql_temp1 = ''~r~n" + &
"~t~tSet @sql_temp2 = ''~r~n" + &
"~t~tSet @submitted = 0~r~n" + &
"~t~tSelect @submitted = submitted From request_webform_detail~t~r~n" + &
"~t~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and (col_number_value is not null) ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') and col_name = 'category' ;~t~t~r~n" + &
"~t~tif (@submitted <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@submitted = 1 ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info''~tand rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''category'' ;'~r~n" + &
"~t~t~tSet @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info'' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''category'' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @submitted = 0~r~n" + &
"~t~tSelect @submitted = submitted From request_webform_detail~r~n" + &
"~t~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and(col_datetime_value is not null) ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 )  and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all')  and col_name = 'version_date' ;~r~n" + &
"~t~tif (@submitted <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@submitted = 1 ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info''~tand rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''version_date'' ;'~r~n" + &
"~t~t~tSet @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'',submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info''~tand rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''version_date'' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @submitted = 0~r~n" + &
"~t~tSelect @submitted = submitted From request_webform_detail~r~n" + &
"~t~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and(col_string_value is not null) ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 )  and (updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') and col_name = 'version_number' ;~r~n" + &
"~t~tif (@submitted <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@submitted = 1 ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info''~tand rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''version_number'' ;'~r~n" + &
"~t~t~tSet @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info'' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''version_number'' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @submitted = 0~r~n" + &
"~t~tSelect @submitted = submitted From request_webform_detail~r~n" + &
"~t~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and(col_string_value is not null) ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 )  and (updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') and col_name = 'master_contract_name' ;~r~n" + &
"~t~tif (@submitted <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@submitted = 1 ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info''~tand rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''master_contract_name'' ;'~r~n" + &
"~t~t~tSet @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info'' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''master_contract_name'' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @submitted = 0~r~n" + &
"~t~tSelect @submitted = submitted From request_webform_detail~r~n" + &
"~t~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and(col_number_value is not null) ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 )  and (updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') and col_name = 'master_contract_id' ;~r~n" + &
"~t~tif (@submitted <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@submitted = 1 ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info''~tand rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''master_contract_id'' ;'~r~n" + &
"~t~t~tSet @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info'' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''master_contract_id'' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @submitted = 0~r~n" + &
"~t~tSelect @submitted = submitted  From request_webform_detail~r~n" + &
"~t~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and(col_number_value is not null) ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 )  and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all')  and col_name = 'app_facility' ;~r~n" + &
"~t~tif (@submitted <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@submitted = 1 ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info''~tand rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''app_facility'' ;'~r~n" + &
"~t~t~tSet @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info'' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''app_facility'' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @submitted = 0~r~n" + &
"~t~tSelect @submitted = submitted  From request_webform_detail~r~n" + &
"~t~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and(col_number_value is not null) ~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y')  and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') and col_name = 'status' ;~r~n" + &
"~t~tif (@submitted <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@submitted = 1 ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info''~tand rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''status'' ;'~r~n" + &
"~t~t~tSet @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info'' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = ''status'' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @sql_insert = 'INSERT INTO ctx_basic_info ( ctx_id, category, status,  record_id, version_number,version_date, app_facility, master_contract_name, master_contract_id, come_from '~r~n" + &
"~t~tSet @sql_value = ' VALUES ('+ convert(varchar,@ctx_id )+','+convert(varchar, @category)+','+convert(varchar, @status)+','+convert(varchar, @record_id)+~r~n" + &
"~t~t~t~t~t~t','''+ @version_number+''',convert(datetime,'''+convert(varchar,@version_date)+'''),'+convert(varchar, @app_facility)+','''+@master_contract_name +''', ' +~r~n" + &
"~t~t~t~t~t~tconvert(varchar,@master_contract_id)+' , ''request('+convert(varchar,@rwf_id)+')-completed'' '~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~tDECLARE request_cursor CURSOR FOR ~r~n" + &
"      ~t~tSelect table_name,rowid,order_no,col_name,col_string_value,col_datetime_value,col_number_value,col_decimal_value,col_type,scale,submitted,object_type,multi_select_text,formats, ~r~n" + &
"      ~t~t~t(select systypes.name as col_type From syscolumns , systypes where syscolumns.xtype = systypes.xtype and syscolumns.name = request_webform_detail.col_name and object_name(syscolumns.id) = request_webform_detail.table_name) as col_type_org ~r~n" + &
"~t~t~tFrom request_webform_detail~r~n" + &
"~t~t~tWhere types='column' and table_name ='ctx_basic_info'~tand rwf_id = @rwf_id and (design is null or design = 'm')~t~t~t~r~n" + &
"~t~t~tand ( col_string_value is not null or col_decimal_value is not null or col_number_value is not null or col_datetime_value is not null)~r~n" + &
"~t~t~tand (submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all')~r~n" + &
"~t~t~tGroup by table_name,rowid,order_no,col_name,col_string_value,col_datetime_value,col_number_value,col_decimal_value,col_type,scale,submitted,object_type,multi_select_text,formats ;~r~n" + &
"~t~t~t~r~n" + &
"~t~tOPEN request_cursor~r~n" + &
"~t~tFETCH NEXT FROM request_cursor INTO  @table_name,@rowid,@order_no,@col_name,@col_string_value,@col_datetime_value,@col_number_value,@col_decimal_value,@col_type,@scale,@submitted,@object_type,@multi_select_text,@formats,@col_type_org ~r~n" + &
"~t~t~t~t~r~n" + &
"~t~tWHILE @@FETCH_STATUS = 0~r~n" + &
"~t~tBEGIN~r~n" + &
"~t~t~tSet @temp_value = @col_string_value~r~n" + &
"~t~t~t/* multi-select dropdown option 0 */~r~n" + &
"~t~t~tif (@table_name = 'ctx_basic_info' and ((@object_type is not null) and lower(@object_type) = 'multi-select') ) ~r~n" + &
"~t~t~tBegin~t~t~t~t~r~n" + &
"~t~t~t~tif (@multi_select_text is not null) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @col_string_value = @multi_select_text~r~n" + &
"~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @col_string_value =''~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tif (@table_name = 'ctx_basic_info' and ( @col_name <> 'category'and @col_name <> 'version_date'and @col_name <> 'version_number'and @col_name <> 'master_contract_name'and @col_name <> 'app_facility' and @col_name <> 'status' and @col_name <> 'master_contract_id') ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @count = 0 ~r~n" + &
"~r~n" + &
"~t~t~t~tif(@col_type ='datetime' or @col_type ='smalldatetime')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (@col_datetime_value is not null)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_value = @sql_value + ', convert(datetime,''' + convert(varchar,@col_datetime_value,101)+ ''') '~r~n" + &
"~t~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse if(@col_type ='int' or @col_type ='integer' or @col_type ='real' or @col_type ='float' or @col_type ='smallint'or @col_type ='tinyint')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (@col_number_value is not null)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_value = @sql_value + ',' + convert(varchar,@col_number_value)~r~n" + &
"~t~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse if( (@col_type ='numeric' and @scale = 0) or (@col_type ='decimal' and @scale = 0) or (@col_type ='money' and @scale = 0))~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (@col_number_value is not null)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_value = @sql_value + ',' + convert(varchar,@col_number_value)~r~n" + &
"~t~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse if((@col_type ='numeric' and @scale > 0) or (@col_type ='decimal' and @scale > 0) or (@col_type ='money' and @scale > 0))~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (@col_decimal_value is not null)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_value = @sql_value + ',' + convert(varchar,@col_decimal_value)~r~n" + &
"~t~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~telse if (@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (@col_string_value is not null)~r~n" + &
"~t~t~t~t~tBegin~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~t/*convert the percentage data to Decimal point data*/~r~n" + &
"~t~t~t~t~t~tif (RIGHT(@formats, 1) = '%' and ISNUMERIC(@col_string_value) = 1 and (@col_type_org = 'numeric' or @col_type_org ='decimal'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @col_string_value = CONVERT(varchar,(CONVERT(numeric(14,4),@col_string_value) / 100)) ~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~t~t~t~tSet @col_string_value = REPLACE(@col_string_value,char(39),char(39)+char(39))~t~t~t~r~n" + &
"~t~t~t~t~t~tSelect @sql_value = @sql_value + ',''' +@col_string_value+''' ' ~r~n" + &
"~t~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (@col_string_value is not null)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t/*convert the percentage data to Decimal point data*/~r~n" + &
"~t~t~t~t~t~tif (RIGHT(@formats, 1) = '%' and ISNUMERIC(@col_string_value) = 1 and (@col_type_org = 'numeric' or @col_type_org ='decimal'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @col_string_value = CONVERT(varchar,(CONVERT(numeric(14,4),@col_string_value) / 100)) ~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~t~t~t~tSet @col_string_value = REPLACE(@col_string_value,char(39),char(39)+char(39))~t~t~t~r~n" + &
"~t~t~t~t~t~tSelect @sql_value = @sql_value + ',''' +@col_string_value+''' ' ~r~n" + &
"~t~t~t~t~t~tSet @count = 1~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t~tIf ( @count = 1)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_insert = @sql_insert + ', '+ @col_name~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t~t/*update the data flag*/~t~t~r~n" + &
"~t~t~t~tif (@submitted = 1 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~telse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~tSelect @sql_temp1 = @sql_temp1 + ' Update request_webform_detail Set updated = ''Y'',submitted='+convert(varchar,@submitted_new)+' where  types=''column'' and table_name =''ctx_basic_info'' and rowid = '+convert(varchar,@rowid)+' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = '''+@col_name+''' ;'~r~n" + &
"~t~t~t~tSelect @sql_temp2 = @sql_temp2 + ' Update request_webform_detail Set updated = ''N'', submitted ='+convert(varchar,@submitted)+' where  types=''column'' and table_name =''ctx_basic_info'' and rowid = '+convert(varchar,@rowid)+' and rwf_id = '+convert(varchar,@rwf_id)+' and col_name = '''+@col_name+''' ;'~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t/* multi-select dropdown option 1 */~r~n" + &
"~t~t~tif (@table_name = 'ctx_basic_info' and ((@object_type is not null) and lower(@object_type) = 'multi-select') ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (RIGHT(ltrim(rtrim(@temp_value)),1) <>';') Set @temp_value=@temp_value+';'~r~n" + &
"~t~t~t~tWHILE (CHARINDEX(';',@temp_value) > 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_multi_select = @sql_multi_select + 'INSERT INTO screen_field_select_item (view_id,screen_id,ctx_id,field_name,field_data) VALUES ('+~t~r~n" + &
"~t~t~t~t~t~tconvert(varchar,@data_view_id)+',9,'+convert(varchar,@ctx_id)+','''+@col_name+''','''+ rtrim(ltrim(left(@temp_value,CHARINDEX(';',@temp_value) - 1 )))+''') ; ' ~t~r~n" + &
"~t~t~t~t~tSelect @sql_multi_select_delete = @sql_multi_select_delete +' Delete From screen_field_select_item Where view_id='+convert(varchar,@data_view_id)+' and '+~r~n" + &
"~t~t~t~t~t~t' screen_id = 9 and ctx_id='+convert(varchar,@ctx_id)+' and field_name='''+@col_name+''' and field_data='''+rtrim(ltrim(left(@temp_value,CHARINDEX(';',@temp_value) - 1 )))+''' ; '~t~r~n" + &
"~t~t~t~t~tSet @temp_value = SUBSTRING(@temp_value,CHARINDEX(';',@temp_value) + 1,len(@temp_value) - CHARINDEX(';',@temp_value) )~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t~tFETCH NEXT FROM request_cursor INTO  @table_name,@rowid,@order_no,@col_name,@col_string_value,@col_datetime_value,@col_number_value,@col_decimal_value,@col_type,@scale,@submitted,@object_type,@multi_select_text,@formats,@col_type_org~r~n" + &
"~t~tEnd~r~n" + &
"~t~tCLOSE request_cursor~r~n" + &
"~t~tDEALLOCATE request_cursor~r~n" + &
"~r~n" 
ls_sql2 = "~t~tSet @num = 7~r~n" + &
"~t~tSelect @sql_insert = @sql_insert + ' ) '~r~n" + &
"~t~tSelect @sql_value = @sql_value + ' ) '~r~n" + &
"~t~tSet @sql = @sql_insert + @sql_value~r~n" + &
"~r~n" + &
"~t~t/*about the app_facility table will use new company id */~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~tBEGIN TRANSACTION CTX1;~t~t~t~r~n" + &
"~t~t~tExecute(@sql) ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t/* move the detele Statement to the end */~t~t~t~r~n" + &
"~r~n" + &
"~t~t~t/*update sys_audit table 2 */~r~n" + &
"~t~t~tINSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type )~r~n" + &
"~t~t~t~tVALUES(@record_id, 1001,@seq_no ,@table_id,@ctx_id ,'','INSERT',@user_id,getdate(),1,'I') ~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit where rec_id ='+convert(varchar,@record_id)+' and field_id = ''1001'' and seq_no = '+convert(varchar,@seq_no) + ' ; '~t~t~t~r~n" + &
"~r~n" + &
"~t~t~t/*update ctx_version table 3 */~r~n" + &
"~t~t~tINSERT INTO ctx_version (ctx_id,version_id,version_number,version_date,user_id,old_value,new_value)~r~n" + &
"~t~t~t~tValues(@ctx_id ,1,@version_number,@version_date,@user_id, '',@version_number);~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' Delete From ctx_version where ctx_id ='+convert(varchar,@ctx_id)+' and version_id =1 ; '~r~n" + &
"~t~t~t~r~n" + &
"~t~t~t/*update sys_statusaudit table 4 status*/~r~n" + &
"~t~t~tINSERT INTO sys_statusaudit(ctx_id,seq_no,status,start_time,user_id,field_name)~r~n" + &
"~t~t~t~tVALUES (@ctx_id ,1,@lookup_code,getdate(),@user_id,'status');~t~t~t~t~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_statusaudit where ctx_id ='+convert(varchar,@ctx_id)+' and seq_no = 1 and field_name =''status'' ; '~r~n" + &
"~t~t~t~r~n" + &
"~t~t~t/*update sys_statusaudit table 4 if exists custom_status1 column*/~r~n" + &
"~t~t~tif (@custom_status1 > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tINSERT INTO sys_statusaudit(ctx_id,seq_no,status,start_time,user_id,field_name)~r~n" + &
"~t~t~t~t~tVALUES (@ctx_id ,1,@lookup_code,getdate(),@user_id,'custom_status1');~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_statusaudit where ctx_id ='+convert(varchar,@ctx_id)+' and seq_no = 1 and field_name =''custom_status1'' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~t/*update sys_statusaudit table 4 if exists custom_status2*/~r~n" + &
"~t~t~tif(@custom_status2 > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tINSERT INTO sys_statusaudit(ctx_id,seq_no,status,start_time,user_id,field_name)~r~n" + &
"~t~t~t~t~tVALUES (@ctx_id ,1,@lookup_code,getdate(),@user_id,'custom_status2');~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_statusaudit where ctx_id ='+convert(varchar,@ctx_id)+' and seq_no = 1 and field_name =''custom_status2'' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~t~t/*update the flag*/~r~n" + &
"~t~t~tExecute(@sql_temp1) ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + @sql_temp2~r~n" + &
"~r~n" + &
"~t~t~t/* multi-select dropdown option value */~r~n" + &
"~t~t~tif (len(@sql_multi_select) > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_multi_select) ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + @sql_multi_select_delete~t~t~t~t~r~n" + &
"~t~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' Delete From ctx_basic_info Where ctx_id ='+convert(varchar,@ctx_id)+' ; '~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' UPDATE ids~tSET ctx_id =( ctx_id - 1 ) Where ctx_id ='+convert(varchar,@ctx_id)+' ; '~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() +' ; Sql:'+@sql_multi_select~r~n" + &
"~t~t~tROLLBACK TRANSACTION CTX1;~r~n" + &
"~t~t~tUPDATE ids~tSET ctx_id =( ctx_id - 1 ) Where ctx_id = @ctx_id;~r~n" + &
"~t~t~tReturn  ~r~n" + &
"~t~tEND CATCH;~r~n" + &
"~r~n" + &
"~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' ; Sql:'+@sql_multi_select~r~n" + &
"~t~t~tROLLBACK TRANSACTION CTX1;~r~n" + &
"~t~t~tUPDATE ids~tSET ctx_id =( ctx_id - 1 ) Where ctx_id = @ctx_id;~r~n" + &
"~t~t~treturn  ~r~n" + &
"~t~tEnd ~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tCOMMIT TRANSACTION CTX1;~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* ctx_contract_contacts table */~t~t~t~t~r~n" + &
"~t~tSet @count =0~r~n" + &
"~t~tSELECT @count =Count(1)  FROM ctx_contract_contacts WHERE ctx_id = @ctx_id and contact_id= @contact_id and ic_area = 'E';~r~n" + &
"~t~tif((@contact_id is not null and @contact_id > 0 ) and @count =0 )~r~n" + &
"~t~tBegin~t~t~r~n" + &
"~t~t~t/*~tcheck the contacts if not exsist the company */~r~n" + &
"~t~t~tSet @count =0~r~n" + &
"~t~t~tSELECT @count =Count(1) FROM ctx_contacts WHERE facility_id = @app_facility and contact_id= @contact_id;~r~n" + &
"~t~t~tif (@count > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @num = 8~r~n" + &
"~t~t~t~tSelect @record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~t~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@record_id  ;~r~n" + &
"~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid record_id. '~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~tSet @record_id = @record_id + 1~r~n" + &
"~r~n" + &
"~t~t~t~tSelect @table_id = table_id from sys_tables where charindex('d_contract_det_contact_',lower(table_name) ) > 0~r~n" + &
"~t~t~t~t~tand charindex('contracted company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~t~t~tSELECT @contact_type = contact_type FROM ctx_contacts WHERE facility_id = @app_facility and contact_id= @contact_id;~r~n" + &
"~t~t~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~t~t~t~tSet @error_sum = 0~r~n" + &
"~t~t~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~t~t~tSet @sql_delete2 = ''~r~n" + &
"~t~t~t~tSet @sql_update = ''~r~n" + &
"~t~t~t~tBEGIN TRY~r~n" + &
"~t~t~t~tBEGIN TRANSACTION CTX2;~t~r~n" + &
"~t~t~t~t~t/*update ctx_contract_contacts table 5E */~r~n" + &
"~t~t~t~t~tif (@contact_type is null or @contact_type = 0 )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) ~r~n" + &
"~t~t~t~t~t~tVALUES ( @ctx_id , @contact_id, 'E', @record_id, 'Y', 'N', 'F' )~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access,association ) ~r~n" + &
"~t~t~t~t~t~tVALUES ( @ctx_id , @contact_id, 'E', @record_id, 'Y', 'N', 'F',convert(varchar,@contact_type) )~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''E'' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey, key1) Values( ''ctx_contract_contacts'','~r~n" + &
"~t~t~t~t~t~t+'0, '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t~t' and contact_id='+convert(varchar,@contact_id)+' and record_id='+convert(varchar,@record_id)+''','+convert(varchar,@contact_id)+' ); '~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename=''ctx_contract_contacts'' and rowid=0 and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~t  ~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~t~t~t~r~n" + &
"~r~n" + &
"~t~t~t~t~tINSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type )~r~n" + &
"~t~t~t~t~t~tVALUES(@record_id ,1001, @seq_no ,@table_id, @ctx_id ,'','INSERT',@user_id,getdate(),1,'I') ~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From sys_audit Where rec_id = '+convert(varchar,@record_id)+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~r~n" + &
"~r~n" + &
"~t~t~t~tEND TRY~r~n" + &
"~t~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~tROLLBACK TRANSACTION CTX2;~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEND CATCH;~r~n" + &
"~r~n" + &
"~t~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~t~tROLLBACK TRANSACTION CTX2;~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tCOMMIT TRANSACTION CTX2;~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/*update ctx_contract_contacts table 5I */~r~n" + &
"~t~tSet @contact_id = null~t/* reset contact_id, maybe is not exists in system. And this cannot be use ccc contact. */~r~n" + &
"~t~tif(@owner_user is null or rtrim(ltrim(@owner_user)) = '')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (@template_id is not null and @template_id > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @contact_id = ctx_contract_contacts.contact_id,@owner_user = ctx_contacts.user_d, @contact_type = ctx_contacts.contact_type ~r~n" + &
"~t~t~t~tFrom ctx_templates_info, ctx_contract_contacts, ctx_contacts~r~n" + &
"~t~t~t~tWhere ctx_templates_info.ctx_id = ctx_contract_contacts.ctx_id ~r~n" + &
"~t~t~t~tAnd ctx_contacts.contact_id = ctx_contract_contacts.contact_id~r~n" + &
"~t~t~t~tAnd ctx_templates_info.ib_our_contacts = 1 and ctx_templates_info.add_contact = 1 and ctx_templates_info.ib_owner = 1~r~n" + &
"~t~t~t~tAnd ctx_contract_contacts.ic_area = 'I' and ctx_contract_contacts.owner = 'Y' and ctx_templates_info.id = @template_id;~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~t~t~t~t~r~n" + &
"~t~t~tSelect top 1 @contact_id = contact_id, @contact_type = contact_type from ctx_contacts where user_d = @owner_user;~t~t~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tif ((@contact_id is null or @contact_id = 0) and @owner_user is not null and DATALENGTH(ltrim(rtrim(@owner_user))) > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+' Request creator ('+@owner_user+') is not associated with a company contact. Contact must be entered and associated. ';~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tSet @num = 9~r~n" + &
"~t~tSet @count =0~r~n" + &
"~t~tSELECT @count =Count(1)  FROM ctx_contract_contacts WHERE ctx_id = @ctx_id and contact_id= @contact_id and ic_area = 'I';~r~n" + &
"~t~tif ( @count = 0 and (@contact_id is not null and @contact_id > 0 ) )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@record_id  ;~r~n" + &
"~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid record_id. '~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @record_id = @record_id + 1 ~r~n" + &
"~r~n" + &
"~t~t~tSelect @table_id = table_id from sys_tables where charindex('d_contract_det_contact_',lower(table_name) ) > 0~r~n" + &
"~t~t~t~tand charindex('our company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~r~n" + &
"~t~t~tSet @num = 10~r~n" + &
"~t~t~tSet @error_sum = 0~r~n" + &
"~t~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~t~tSet @sql_update = ''~r~n" + &
"~t~t~tBEGIN TRY~r~n" + &
"~t~t~tBEGIN TRANSACTION CTX3;~t~r~n" + &
"~t~t~t~r~n" + &
"~t~t~t~t/*update ctx_contract_contacts table 5I */~r~n" + &
"~t~t~t~tif (@contact_type is null or @contact_type = 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) ~r~n" + &
"~t~t~t~t~tVALUES ( @ctx_id , @contact_id, 'I', @record_id , 'Y', 'Y', 'F' )~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access, association ) ~r~n" + &
"~t~t~t~t~tVALUES ( @ctx_id , @contact_id, 'I', @record_id , 'Y', 'Y', 'F',convert(varchar,@contact_type) )~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey, key1) Values( ''ctx_contract_contacts'','~r~n" + &
"~t~t~t~t~t+'0, '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and contact_id='+convert(varchar,@contact_id)+' and record_id='+convert(varchar,@record_id)+''','+convert(varchar,@contact_id)+' ); '~r~n" + &
"~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename=''ctx_contract_contacts'' and rowid=0 and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~t  ~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~t~t~t~r~n" + &
"~r~n" + &
"~t~t~t~tINSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type )~r~n" + &
"~t~t~t~t~tVALUES(@record_id,1001, @seq_no ,@table_id, @ctx_id ,'','INSERT',@user_id,getdate(),1,'I') ~t~t~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From sys_audit Where rec_id = '+convert(varchar,@record_id )+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~r~n" + &
"~t~t~tEND TRY~r~n" + &
"~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION CTX3;~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEND CATCH;~t~r~n" + &
"~t~t~t~r~n" + &
"~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION CTX3;~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tCOMMIT TRANSACTION CTX3;~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse if(@count = 1 and (@contact_id is not null and @contact_id > 0 ) )~t~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @num = 11~r~n" + &
"~t~t~tSet @sql_update = ''~r~n" + &
"~t~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~t~tSet @error_sum = 0~r~n" + &
"~t~t~t~r~n" + &
"~t~t~tSet @default_email = ''~r~n" + &
"~t~t~tSet @owner = ''~t~t~t~r~n" + &
"~t~t~tselect @default_email = default_email, @owner = owner from ctx_contract_contacts WHERE ctx_id = @ctx_id and contact_id= @contact_id  and ic_area ='I' ; ~r~n" + &
"~t~t~tif ( upper(@default_email) <> 'Y'  )~r~n" + &
"~t~t~tBegin ~r~n" + &
"~t~t~t~tSet @count =0~r~n" + &
"~t~t~t~tselect @count = isnull(contact_id,0) from ctx_contract_contacts WHERE ctx_id = @ctx_id and ic_area ='I' and default_email = 'Y' ;~r~n" + &
"~t~t~t~tif(@count > 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set default_email =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and default_email = ''Y'' and contact_id='+convert(varchar,@count)+' ; '~r~n" + &
"~t~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set default_email =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@count)+' ; '~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set default_email =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set default_email =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@contact_id)+' ; '~t~t~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~t~r~n" + &
"~t~t~tif ( upper(@owner) <> 'Y'  )~r~n" + &
"~t~t~tBegin ~r~n" + &
"~t~t~t~tSet @count =0~r~n" + &
"~t~t~t~tselect @count = isnull(contact_id,0) from ctx_contract_contacts WHERE ctx_id = @ctx_id and ic_area ='I' and owner = 'Y' ;~r~n" + &
"~t~t~t~tif(@count > 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set owner =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and owner = ''Y'' and contact_id='+convert(varchar,@count)+' ; '~r~n" + &
"~t~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set owner =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@count)+' ; '~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update ctx_contract_contacts set owner =''Y'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Update ctx_contract_contacts set owner =''N'' WHERE ctx_id = '+convert(varchar,@ctx_id)+' and ic_area =''I'' and contact_id = '+convert(varchar,@contact_id)+' ; '~t~t~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tif (len(ltrim(rtrim(@sql_update))) > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tBEGIN TRY~r~n" + &
"~t~t~t~tBEGIN TRANSACTION ctx_contract_trans_ci2;~t~r~n" + &
"~t~t~t~t~tExecute(@sql_update)~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~r~n" + &
"~t~t~t~tEND TRY~r~n" + &
"~t~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~tROLLBACK TRANSACTION ctx_contract_trans_ci2;~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEnd CATCH~r~n" + &
"~r~n" + &
"~t~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~t~tROLLBACK TRANSACTION ctx_contract_trans_ci2;~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tCOMMIT TRANSACTION ctx_contract_trans_ci2;~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* request CTX_CONTACTS data or contractlogix user */~r~n" + &
"~t~tSet @num =12~t~t~r~n" + &
"~t~tSet @error_sum = 0~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~tSet @sql_update = ''~r~n" + &
"~r~n" + &
"~t~tSelect @lookup_code = lookup_code from code_lookup where lookup_name ='Contract Contact Type' and lower(code)=lower('REQUESTER');~r~n" + &
"~t~tSelect @contact_type2 = ( case when app_facility.contact_type2 is not null and app_facility.contact_type2 = 'A' then 'I'~r~n" + &
"~t~t~t~twhen app_facility.contact_type2 is not null and app_facility.contact_type2 = 'B' then 'E'  else '' end ),~r~n" + &
"~t~t~t~t@contact_type = ctx_contacts.contact_type, @contact_id =ctx_contacts.contact_id~r~n" + &
"~t~t~t~tfrom ctx_contacts left join app_facility on ctx_contacts.facility_id = app_facility.facility_id~r~n" + &
"~t~t~tWhere (ctx_contacts.requester_user_d = (select create_user from request_webform where rwf_id = @rwf_id) ~r~n" + &
"~t~t~t~tor ctx_contacts.user_d =(select create_user from request_webform where rwf_id = @rwf_id));~t~t~r~n" + &
"~r~n" + &
"~t~tSet @count = 0~r~n" + &
"~t~tSelect @count = Count(1) from ctx_contract_contacts Where ctx_id =@ctx_id and contact_id =@contact_id and ic_area = @contact_type2;~r~n" + &
"~t~tif(@contact_type2 is not null and @contact_type2 <> '' and @count= 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@record_id  ;~r~n" + &
"~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid record_id. '~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @record_id = @record_id + 1 ~r~n" + &
"~r~n" + &
"~t~t~tIf (@contact_type2 ='A')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @table_id = table_id from sys_tables where charindex('d_contract_det_contact_',lower(table_name) ) > 0~r~n" + &
"~t~t~t~t~tand charindex('our company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @table_id = table_id from sys_tables where charindex('d_contract_det_contact_',lower(table_name) ) > 0~r~n" + &
"~t~t~t~t~tand charindex('contracted company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~r~n" + &
"~t~t~tBEGIN TRY~r~n" + &
"~t~t~tBEGIN TRANSACTION ctx_contract_request;~t~t~t~t~r~n" + &
"~t~t~t~t/*update ctx_contract_contacts */~r~n" + &
"~t~t~t~tif (@contact_type is null or @contact_type = 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access,association10 ) ~r~n" + &
"~t~t~t~t~tVALUES ( @ctx_id , @contact_id, @contact_type2, @record_id , 'N', 'N', 'F',convert(varchar,@lookup_code))~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tINSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access, association,association10 ) ~r~n" + &
"~t~t~t~t~tVALUES ( @ctx_id , @contact_id, @contact_type2, @record_id , 'N', 'N', 'F',convert(varchar,@contact_type),convert(varchar,@lookup_code) )~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@ctx_id)+' and ic_area ='''+@contact_type2+''' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey, key1) Values( ''ctx_contract_contacts'','~r~n" + &
"~t~t~t~t~t+'0, '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and contact_id='+convert(varchar,@contact_id)+' and record_id='+convert(varchar,@record_id)+''','+convert(varchar,@contact_id)+' ); '~r~n" + &
"~t~t~t~tSet @sql_delete2 = @sql_delete2 + ' Delete From request_relation_table Where tablename=''ctx_contract_contacts'' and rowid=0 and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' ; '~t  ~r~n" + &
"~t~t~t~t~t~r~n" + &
"~t~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~t~t~t~r~n" + &
"~r~n" + &
"~t~t~t~tINSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type )~r~n" + &
"~t~t~t~t~tVALUES(@record_id,1001, @seq_no ,@table_id, @ctx_id ,'','INSERT',@user_id,getdate(),1,@contact_type2) ~t~t~r~n" + &
"~t~t~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~t~t~t~tSelect @sql_delete2 = @sql_delete2 + ' Delete From sys_audit Where rec_id = '+convert(varchar,@record_id )+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~r~n" + &
"~t~t~tEND TRY~r~n" + &
"~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION ctx_contract_request;~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEND CATCH;~t~r~n" + &
"~t~t~t~r~n" + &
"~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~tROLLBACK TRANSACTION ctx_contract_request;~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tCOMMIT TRANSACTION ctx_contract_request;~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse if (@count= 1)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tUpdate ctx_contract_contacts set association10 = convert(varchar,@lookup_code) ~r~n" + &
"~t~t~t~tWhere ctx_id =@ctx_id and contact_id =@contact_id and ic_area = @contact_type2;~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2+ ' Update ctx_contract_contacts set association10='''' Where ctx_id ='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t' and contact_id ='+convert(varchar,@contact_id)+' and ic_area ='''+@contact_type2+''' ; '~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~t/* except ctx_basic_info table */~r~n" + &
"~t~tSet @num = 13~r~n" + &
"~t~tSet @error_sum = 0~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~texecute sp_create_request_data_table @rwf_id ,@user_id,@do_steps,@ctx_id , @sql_delete2 output, @err_msg output~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~tif (@error_sum <> 0 or charindex('error',lower(@err_msg)) > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/*update request_webform_document table  */~r~n" + &
"~t~tSet @sql = ''~r~n" + &
"~t~tSet @sql_insert = ''~r~n" + &
"~t~tSet @sql_value = ''~r~n" + &
"~t~tSet @sql_update = ''~r~n" + &
"~t~tSet @sql_temp1 = ''~r~n" + &
"~t~tSet @sql_temp2 = ''~r~n" + &
"~t~tSet @sql_temp3 = ''~r~n" + &
"~t~tSet @sql_temp4 = ''~t~t~r~n" + &
"~t~tSet @status = NULL~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~r~n" + &
"~r~n" + &
"~t~tselect @status = lookup_code from code_lookup where upper(lookup_name) = upper('Contract Document Status') and upper(code) = upper('New') ;~r~n" + &
"~r~n" + &
"~t~tSet @num = 14~r~n" + &
"~t~tSet @count = 0~r~n" + &
"~t~tSelect @count = count(*) from request_webform_document Where datalength(document_content) > 0 and rwf_id = @rwf_id ~r~n" + &
"~t~tand (submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~r~n" + &
"~t~tif (@count > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSELECT @doc_id = doc_id FROM ids ;~r~n" + &
"~t~t~tupdate ids SET doc_id =( isnull ( doc_id , 0 ) + @count ) Where doc_id~t= @doc_id ;~r~n" + &
"~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ 'Error- Position:'+convert(varchar,@num)+'; Invalid doc_id. '~r~n" + &
"~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~treturn ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~t~tSet @count = 0~r~n" + &
"~t~t~tDeclare document_cursor Cursor For ~r~n" + &
"~t~t~t~tSelect rwfdoc_id,document_id,doc_type,request_id,submitted,ctx_doc_type from request_webform_document ~r~n" + &
"~t~t~t~tWhere datalength(document_content) > 0 and rwf_id = @rwf_id ~r~n" + &
"~t~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all') ;~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~tOpen document_cursor~r~n" + &
"~t~t~tFetch Next From document_cursor Into @rwfdoc_id,@document_id, @doc_type, @request_id,@submitted, @ctx_doc_type ;~r~n" + &
"~t~t~tWhile @@FETCH_STATUS = 0~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@submitted = 1 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @submitted_new = 3~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~telse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @submitted_new = 4~r~n" + &
"~t~t~t~tEnd ~r~n" + &
"~t~t~t~tSet @count = @count + 1~r~n" + &
"~t~t~t~tSelect @sql_insert = @sql_insert + 'INSERT INTO ctx_am_document ( doc_id, ctx_id, doc_name, revision, doc_type,doc_ext, category, base_type, create_by, create_date,~r~n" + &
"~t~t~t~t~t~t status,status_by, status_date, filename, revision_control, received_by, received_date,notes )' +~r~n" + &
"~t~t~t~t~t~t~t' Select '+convert(varchar, @doc_id + @count)+','+ convert(varchar,@ctx_id)+',document_name,1.0,'''+@ctx_doc_type+''', (case when lower(doc_ext) = ''docx'' or lower(doc_ext) = ''xlsx'' then left(doc_ext,3) else doc_ext end), '+ convert(varchar, @category)+~r~n" + &
"~t~t~t~t~t~t~t', ''3'',''' +@user_id+''',GETDATE(),'+ convert(varchar, @status) +', '''+@user_id+''',GETDATE(), document_name +'+'''.'''+ '+doc_ext,1, ''' +~r~n" + &
"~t~t~t~t~t~t~t@user_id+''' ,GETDATE(),description From request_webform_document Where rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id ='+convert(varchar,@rwfdoc_id)+' ; '~r~n" + &
"~t~t~t~tSelect @sql_temp1 = @sql_temp1 + ' Delete From ctx_am_document Where doc_id ='+convert(varchar, @doc_id + @count)+' ; '~r~n" + &
"~r~n" + &
"~t~t~t~tSelect @sql = @sql + 'INSERT INTO ctx_am_doc_image ( doc_id , revision, image_file , doc_ext , modify_date , doc_ext_full ) ' +~r~n" + &
"~t~t~t~t~t~t~t~t' Select '+convert(varchar, @doc_id + @count)+', 1.0,document_content, (case when lower(doc_ext) = ''docx'' or lower(doc_ext) = ''xlsx'' then left(doc_ext,3) else doc_ext end), getdate() , doc_ext From request_webform_document~r~n" + &
"~t~t~t~t~t~t~t~t Where rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id ='+convert(varchar,@rwfdoc_id)+'  ; '~t~r~n" + &
"~t~t~t~tSelect @sql_temp2 = @sql_temp2 + ' Delete From ctx_am_doc_image Where doc_id ='+convert(varchar, @doc_id + @count)+' and revision =1.0 ; '~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_value = @sql_value + 'INSERT INTO ctx_am_doc_audit ( doc_id, audit_id, revision, doc_ext, action, action_by, action_date,~r~n" + &
"~t~t~t~t~t~t~t~t filename,notes,esign_type) Select '+convert(varchar, @doc_id + @count)+', 1, 1.0, (case when lower(doc_ext) = ''docx'' or lower(doc_ext) = ''xlsx'' then left(doc_ext,3) else doc_ext end),''New - Existing'','''+@user_id+''',~r~n" + &
"~t~t~t~t~t~t~t~t GETDATE(),document_name +'+'''.'''+ '+doc_ext,description,''sertifi'' From request_webform_document ~r~n" + &
"~t~t~t~t~t~t~t~t Where rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id ='+convert(varchar,@rwfdoc_id)+' ; '~t~t~r~n" + &
"~t~t~t~tSelect @sql_temp3 = @sql_temp3 + ' Delete From ctx_am_doc_audit Where doc_id ='+convert(varchar, @doc_id + @count)+' and audit_id =1 ; '~t~t~t~t~t~t~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update request_webform_document Set file_id ='+convert(varchar, @doc_id + @count)+ ', updated = ''Y'',submitted ='+convert(varchar,@submitted_new)+' From request_webform_document ~r~n" + &
"~t~t~t~t~t~t~t~t Where rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ ' and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id ='+convert(varchar,@rwfdoc_id)+' ; '~r~n" + &
"~t~t~t~tSelect @sql_temp4 = @sql_temp4 + ' Update request_webform_document Set file_id = null, updated = ''N'', submitted ='+convert(varchar,@submitted)+' From request_webform_document ~r~n" + &
"~t~t~t~t~t~t~t~t Where rwf_id = '+convert(varchar,@rwf_id)+' and document_id ='+~r~n" + &
"~t~t~t~t~t~t~tconvert(varchar,@document_id) +' and request_id ='+convert(varchar, @request_id)+ 'and doc_type = '''+convert(varchar,@doc_type) +''' and rwfdoc_id ='+convert(varchar,@rwfdoc_id)+' ; '~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Insert into request_relation_table( tablename,rowid,rwf_id,ctx_id,primarykey,key1) Values( ''ctx_am_document'',' +~r~n" + &
"~t~t~t~t~t~t'0, '+convert(varchar,@rwf_id)+', '+convert(varchar,@ctx_id)+','' Where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t~t' and doc_id='+convert(varchar, @doc_id + @count)+' '','+convert(varchar, @doc_id + @count)+'); '  ~t~t~t~t~t~r~n" + &
"~t~t~t~tSet @sql_temp4 = @sql_temp4 + ' Delete From request_relation_table Where tablename=''ctx_am_document'' and rowid=0 and rwf_id='+convert(varchar,@rwf_id)+' and ctx_id='+convert(varchar,@ctx_id)+' and key1 ='+convert(varchar, @doc_id + @count)+' ; '~t~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~tFetch Next From document_cursor Into @rwfdoc_id,@document_id, @doc_type, @request_id,@submitted , @ctx_doc_type ;~r~n" + &
"~t~t~tEnd~t~r~n" + &
"~t~t~tClose document_cursor~r~n" + &
"~t~t~tDeallocate document_cursor~r~n" + &
"~r~n" + &
"~t~t~tif (@count > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @num = 15~r~n" + &
"~t~t~t~tSet @error_sum = 0~t~t~t~r~n" + &
"~t~t~t~tBEGIN TRY~r~n" + &
"~t~t~t~tBEGIN TRANSACTION document_trans;~t~r~n" + &
"~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~tExecute(@sql_insert) ;~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~t/* Select @sql_delete2 = @sql_delete2 + @sql_temp1 */~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~tExecute(@sql) ;~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~t/* Select @sql_delete2 = @sql_delete2 + @sql_temp2 */~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~tExecute(@sql_value) ;~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~t/* Select @sql_delete2 = @sql_delete2 + @sql_temp3 */~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t~t~t~t/* Select @sql_delete2 = @sql_delete2 + @sql_temp4 */~r~n" + &
"~t~t~t~t~t/*change the delete data of the order sentence*/~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSelect @sql_delete2 = @sql_delete2 + @sql_temp3 + @sql_temp2 + @sql_temp1 + @sql_temp4~r~n" + &
"~t~t~t~tEnd TRY~r~n" + &
"~t~t~r~n" + &
"~t~t~t~tBEGIN CATCH~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~tROLLBACK TRANSACTION document_trans;~r~n" + &
"~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~treturn ~r~n" + &
"~t~t~t~tEND CATCH;~t~r~n" + &
"~r~n" + &
"~t~t~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~t~t~tROLLBACK TRANSACTION document_trans;~r~n" + &
"~t~t~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~treturn ~t~t~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~telse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tCOMMIT TRANSACTION document_trans;~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~t~r~n" + &
"~t~t/*update request_webform table and add the log */~r~n" + &
"~t~tSet @num = 16~r~n" + &
"~t~tSet @error_sum = 0~t~r~n" + &
"~t~tSet @count = 0~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~t~r~n" + &
"~t~tif(@notes is null or ltrim(rtrim(@notes))= '')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @notes = 'Your contract #'+ convert(varchar,@ctx_id)+ ' has been successfully created.'~r~n" + &
"~t~tEnd ~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @notes = 'Your contract #'+ convert(varchar,@ctx_id)+ ' has been successfully created. '+char(10)+char(13) + @notes~r~n" + &
"~t~tEnd ~r~n" + &
"~r~n" + &
"~t~tif(DATALENGTH(@err_msg) > 0 and @err_msg <>'' )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @notes = @notes +char(10)+char(13) + left(@err_msg,8000 - datalength(@notes) - 2) ;~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~tBEGIN TRANSACTION ctx_request_log;~t~r~n" + &
"~t~t~tUpdate request_webform~tSet status ='Completed', ctx_id = @ctx_id Where rwf_id = @rwf_id ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~r~n" + &
"~t~t~tSet @sql_delete2 = @sql_delete2 +' Update request_webform Set status =''Rejected'', ctx_id =0, submit_step =null, reject_step ='''' Where rwf_id ='+convert(varchar,@rwf_id) + ' ; ' ~r~n" + &
"~r~n" + &
"~t~t~tUpdate request_webform_detail ~r~n" + &
"~t~t~tSet submitted = (case when submitted = 1 then 3 else 4 end ), updated = 'Y' ~r~n" + &
"~t~t~twhere rwf_id =@rwf_id ~t~t~t~t~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~t~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~r~n" + &
"~t~t~tSet @sql_delete2 = @sql_delete2 +' Update request_webform_detail Set submitted =-1 where (submitted = 3 or submitted = 4 ) and (updated is null or updated = ''N'') and  rwf_id ='+ ~r~n" + &
"~t~t~t~t~tconvert(varchar,@rwf_id) + ' and ( charindex( '';''+ convert(varchar,steps_mark)+'';'','''+@do_steps+''') > 0 or '''+@do_steps+'''= ''all'') ; '~t~r~n" + &
"~r~n" + &
"~t~t~tUpdate request_webform_document ~r~n" + &
"~t~t~tSet submitted = (case when submitted = 1 then 3 else 4 end ), updated = 'Y' ~r~n" + &
"~t~t~twhere rwf_id =@rwf_id ~t~r~n" + &
"~t~t~tand ( submitted = 1 or submitted = 2 ) and (updated is null or updated <> 'Y') and ( charindex( ';'+ convert(varchar,steps_mark)+';',@do_steps) > 0 or @do_steps = 'all');~t~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~t~t~tSet @sql_delete2 = @sql_delete2 +' Update request_webform_document Set submitted =-1 where (submitted = 3 or submitted = 4 ) and (updated is null or updated = ''N'') and  rwf_id ='+ ~r~n" + &
"~t~t~t~t~tconvert(varchar,@rwf_id) + ' and ( charindex( '';''+ convert(varchar,steps_mark)+'';'','''+@do_steps+''') > 0 or '''+@do_steps+'''= ''all'') ; '~t~r~n" + &
"~r~n" + &
"~t~t~tif exists( select 1 from request_webform where rwf_id =@rwf_id ~tand (reject_step is null or ltrim(rtrim(reject_step)) = '') ~r~n" + &
"~t~t~tand not exists( select 1 from request_webform_detail ~r~n" + &
"~t~t~t~twhere request_webform_detail.rwf_id = request_webform.rwf_id and request_webform_detail.types = 'step' ~r~n" + &
"~t~t~t~tand ( request_webform_detail.submitted is null or (request_webform_detail.submitted <> 3 and request_webform_detail.submitted <> 4) ) ) ~r~n" + &
"~t~t~tand not exists( select 1 from request_webform_document where request_webform_document.rwf_id = request_webform.rwf_id   ~r~n" + &
"~t~t~t~t~tand ( request_webform_document.submitted is null or (request_webform_document.submitted <> 3 and request_webform_document.submitted <> 4)))  ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @count = count(1) from request_webform_document where request_webform_document.rwf_id = @rwf_id;~r~n" + &
"~t~t~t~tif ( (( @allow_update_doc is not null and @allow_update_doc ='1') and (@count > 0 or (@count = 0 and ~r~n" + &
"~t~t~t~t~t(charindex(';-999;',@do_steps) > 0 or @do_steps = 'all' or charindex(';-999;',@submit_step) > 0 )))) or (@allow_update_doc is null or @allow_update_doc ='0' ) )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tUpdate request_webform Set submit_step = 'C' Where rwf_id = @rwf_id ;~r~n" + &
"~t~t~t~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~t~t~t~t~tSet @sql_delete2 = @sql_delete2 +' Update request_webform Set submit_step =''''  Where rwf_id ='+convert(varchar,@rwf_id) + ' ; ' ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tINSERT INTO request_webform_log (rwf_id,notes ,user_id,modify_date ,action, ctx_id)~r~n" + &
"~t~t~t~tValues(@rwf_id, @notes, @user_id, getdate(), 'Approved', @ctx_id) ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~t~r~n" + &
"~t~t~tSet @sql_delete2 = @sql_delete2 +' Delete From request_webform_log Where rwf_id ='+convert(varchar,@rwf_id) + ' and action =''Approved'' and notes='''+@notes+''' and user_id='''+@user_id+''' and ctx_id ='+convert(varchar,@ctx_id)+ ' ; ' ~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~tSet @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~tROLLBACK TRANSACTION ctx_request_log;~r~n" + &
"~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~treturn ~t~r~n" + &
"~t~tEND CATCH;~t~r~n" + &
"~r~n" + &
"~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~tROLLBACK TRANSACTION ctx_request_log;~r~n" + &
"~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~treturn ~t~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tCOMMIT TRANSACTION ctx_request_log;~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~telse~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~t~tSet @sql_delete2 = '' ~r~n" + &
"~t~tSet @num = 99~r~n" + &
"~t~tSet @error_sum = 0~r~n" + &
"~t~texecute sp_create_request_data_update @rwf_id,@user_id,@notes, @do_steps, @ctx_id, @sql_delete2 output, @err_msg output, @IFdelete ~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~t/* Set @sql_delete = @sql_delete2 + @sql_delete */~r~n" + &
"~t~tif (@error_sum <> 0 or charindex('error',lower(@err_msg)) > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~t~t~t~t~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete~r~n" + &
"~tSet @sql_delete2 = '' ~r~n" + &
"~tSet @sql_update = ''~r~n" + &
"~tSet @num = 100~r~n" + &
"~tSet @error_sum = 0~r~n" + &
"~r~n" + &
"~t/* set default value */~r~n" + &
"~tDECLARE request_fefault_value_cursor CURSOR FOR ~r~n" + &
"~t~tSELECT export_fields.rec_id, export_fields.ctx_table_name,export_fields.ctx_column_name, aa.col_length, aa.col_type, aa.scale~r~n" + &
"~t~t~t, (Case~twhen (aa.col_type ='datetime' or aa.col_type ='smalldatetime') and lower(ltrim(rtrim(export_fields.default_value)))='today' ~r~n" + &
"~t~t~t~tthen convert(varchar,getdate(),101) ~r~n" + &
"~t~t~t~twhen (aa.col_type ='datetime' or aa.col_type ='smalldatetime') and lower(ltrim(rtrim(export_fields.default_value)))<>'today' and ISDATE(export_fields.default_value) =1 ~r~n" + &
"~t~t~t~tthen export_fields.default_value~r~n" + &
"~t~t~t~twhen (aa.col_type ='int' or aa.col_type ='integer' or aa.col_type ='real' or aa.col_type ='float' or aa.col_type ='smallint' or ~r~n" + &
"~t~t~t~t~taa.col_type ='tinyint' or aa.col_type ='numeric' or aa.col_type ='money' ) and ISNUMERIC(export_fields.default_value)= 1~r~n" + &
"~t~t~t~tthen export_fields.default_value~r~n" + &
"~t~t~t~twhen (aa.col_type ='char' or aa.col_type ='varchar' or aa.col_type ='nchar' or aa.col_type ='nvarchar') and lower(ltrim(rtrim(export_fields.default_value)))='today' ~r~n" + &
"~t~t~t~tthen convert(varchar,getdate(),101)~r~n" + &
"~t~t~t~twhen (aa.col_type ='char' or aa.col_type ='varchar' or aa.col_type ='nchar' or aa.col_type ='nvarchar') and lower(ltrim(rtrim(export_fields.default_value)))<>'today' ~r~n" + &
"~t~t~t~tthen export_fields.default_value~r~n" + &
"~t~t~t~telse null end ) as defaults~r~n" + &
"~t~tFROM export_fields  inner join (select object_name(syscolumns.id) as table_name, syscolumns.name as col_name, syscolumns.length as col_length,~r~n" + &
"~t~t~t~tsystypes.name as col_type, syscolumns.prec as prec, syscolumns.scale as scale From syscolumns , systypes ~r~n" + &
"~t~t~t~twhere syscolumns.xtype = systypes.xtype ) aa ~r~n" + &
"~t~t~tOn export_fields.ctx_table_name = aa.table_name and export_fields.ctx_column_name = aa.col_name~r~n" + &
"~t~t~tWHERE ( export_fields.export_id = (select export_id from request_webform where rwf_id = @rwf_id ) ) AND  ~r~n" + &
"~t~t~t~t( export_fields.export_type = 1 ) AND  (export_fields.use_default = 1 or export_fields.use_default = 4) and ~r~n" + &
"~t~t~t~t( export_fields.default_value is not null ) and ~r~n" + &
"~t~t~t~t( not (export_fields.ctx_table_name = 'ctx_basic_info' and export_fields.ctx_column_name = 'ctx_id')) ~r~n" + &
"~t~tOrder by export_order;~r~n" + &
"~tOPEN request_fefault_value_cursor ;~r~n" + &
"~tFETCH NEXT FROM request_fefault_value_cursor INTO @record_id, @table_name, @col_name,@col_length, @col_type, @scale,@default_value~r~n" + &
"~r~n" + &
"~tWHILE @@FETCH_STATUS = 0~r~n" + &
"~tBEGIN~t~t~r~n" + &
"~t~tif (@default_value is null)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tFETCH NEXT FROM request_fefault_value_cursor INTO @record_id, @table_name, @col_name,@col_length, @col_type, @scale,@default_value~r~n" + &
"~t~t~tContinue~r~n" + &
"~t~tEnd ~r~n" + &
"~t~t~r~n" + &
"~t~tSet @count =0 ~r~n" + &
"~t~tSet @sql_execute = 'Select @count = count(1) From request_webform_detail Where types = ''column'' and rwf_id ='+convert(varchar,@rwf_id)+~r~n" + &
"~t~t~t' and table_name='''+@table_name+''' and col_name ='''+@col_name+''' ; '~r~n" + &
"~t~tEXEC SP_EXECUTESQL @sql_execute, N'@count int output',@count OUTPUT~t~r~n" + &
"~r~n" + &
"~t~tif(@count > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tFETCH NEXT FROM request_fefault_value_cursor INTO @record_id, @table_name, @col_name,@col_length, @col_type, @scale,@default_value~r~n" + &
"~t~t~tContinue~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @count =0 ~r~n" + &
"~t~tSet @sql_execute = 'Select @count = count(1) From '+@table_name+ ' Where ctx_id ='+convert(varchar,@ctx_id)+' and '+@col_name+' is not null ; '~r~n" + &
"~t~tEXEC SP_EXECUTESQL @sql_execute, N'@count int output',@count OUTPUT~t~r~n" + &
"~t~tiF (@count = 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@col_type ='datetime' or @col_type ='smalldatetime')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update '+@table_name+' Set ' +@col_name+'= convert(datetime,''' + convert(varchar,@default_value,101)+ ''') where ctx_id ='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and '+ @col_name+' is null ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if(@col_type ='int' or @col_type ='integer' or @col_type ='real' or @col_type ='float' or @col_type ='smallint'or @col_type ='tinyint')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update '+@table_name+' Set ' +@col_name+'='+@default_value+' where ctx_id ='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and '+ @col_name+' is null ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if( (@col_type ='numeric' and @scale = 0) or (@col_type ='decimal' and @scale = 0) or (@col_type ='money' and @scale = 0))~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update '+@table_name+' Set ' +@col_name+'='+@default_value+' where ctx_id ='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and '+ @col_name+' is null ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if((@col_type ='numeric' and @scale > 0) or (@col_type ='decimal' and @scale > 0) or (@col_type ='money' and @scale > 0))~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update '+@table_name+' Set ' +@col_name+'='+@default_value+' where ctx_id ='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and '+ @col_name+' is null ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if (@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @default_value = REPLACE(@default_value,char(39),char(39)+char(39))~t~t~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update '+@table_name+' Set ' +@col_name+'='''+@default_value+''' where ctx_id ='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and '+ @col_name+' is null ; '~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @default_value = REPLACE(@default_value,char(39),char(39)+char(39))~t~r~n" + &
"~t~t~t~tSelect @sql_update = @sql_update + ' Update '+@table_name+' Set ' +@col_name+'='''+@default_value+''' where ctx_id ='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and '+ @col_name+' is null ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSelect @sql_delete2 = @sql_delete2 +' Update '+@table_name+' Set ' +@col_name+'= null where ctx_id ='+convert(varchar,@ctx_id)+' and '+ @col_name+' is not null ; '~r~n" + &
"~t~tEnd~r~n" + &
"~t~tFETCH NEXT FROM request_fefault_value_cursor INTO @record_id, @table_name, @col_name,@col_length, @col_type, @scale,@default_value~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tClose request_fefault_value_cursor~r~n" + &
"~tDeallocate request_fefault_value_cursor~r~n" + &
"~t~r~n" + &
"~tif (len(@sql_update) > 0 )~r~n" + &
"~tBegin ~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~tBEGIN TRANSACTION ctx_default_value_trans;~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~tExecute(@sql_update) ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~tEnd TRY~r~n" + &
"~t~t~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~tROLLBACK TRANSACTION ctx_default_value_trans;~r~n" + &
"~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~treturn ~r~n" + &
"~t~tEND CATCH;~t~r~n" + &
"~r~n" + &
"~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)~r~n" + &
"~t~t~tROLLBACK TRANSACTION ctx_default_value_trans;~r~n" + &
"~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~treturn ~t~t~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tCOMMIT TRANSACTION ctx_default_value_trans;~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~t/* autodatafill function */ ~r~n" + &
"~tSet @num = 101~r~n" + &
"~tSet @autofill = ''~r~n" + &
"~tSet @sql_temp1 = ''~r~n" + &
"~tSet @error_sum = 0~r~n" + &
"~tSet @sql_delete = @sql_delete2 + @sql_delete ~r~n" + &
"~tSet @sql_delete2 =''~r~n" + &
"~t~r~n" + &
"~tDECLARE request_filldata_cursor CURSOR FOR ~r~n" + &
"~t~tSelect bb.field_name_fill, bb.field_name_map, bb.relative_days, bb.data_from, aa.table_name, aa.col_name,aa.col_type,aa.scale~r~n" + &
"~t~t~tFROM export_fields  ~r~n" + &
"~t~t~tinner join (select object_name(syscolumns.id) as table_name, syscolumns.name as col_name, syscolumns.length as col_length,~r~n" + &
"~t~t~t~t~tsystypes.name as col_type, syscolumns.prec as prec, syscolumns.scale as scale From syscolumns , systypes ~r~n" + &
"~t~t~t~t~twhere syscolumns.xtype = systypes.xtype ) aa On export_fields.ctx_table_name = aa.table_name and export_fields.ctx_column_name = aa.col_name~r~n" + &
"~t~t~tinner join (select * from ctx_screen_datafill where ctx_screen_datafill.data_view_id = ~r~n" + &
"~t~t~t~t~t~t~t(select isnull(view_id,1001) from export_header where export_id = (select export_id from request_webform where rwf_id = @rwf_id)) ) bb~r~n" + &
"~t~t~t~t~t~ton export_fields.ctx_scrn_id = bb.screen_id and lower(export_fields.ctx_column_name) = lower(bb.field_name)~r~n" + &
"~t~tWHERE ( export_fields.export_id = (select export_id from request_webform where rwf_id = @rwf_id ) )  AND  ~r~n" + &
"~t~t~t( export_fields.export_type = 1 )~r~n" + &
"~t~torder by export_fields.export_order, export_fields.rec_id ;~r~n" + &
"~t~t~t~t~t~t~t~r~n" + &
"~tOPEN request_filldata_cursor ;~r~n" + &
"~tFETCH NEXT FROM request_filldata_cursor INTO @field_name_fill, @field_name_map, @relative_days, @data_from, @table_name, @col_name,@col_type, @scale~r~n" + &
"~r~n" + &
"~tWHILE @@FETCH_STATUS = 0~r~n" + &
"~tBEGIN~t~t~r~n" + &
"~t~t/* check original column data is null, then return */~r~n" + &
"~t~tSet @count = 0 ~r~n" + &
"~t~tSet @sql_execute = 'Select @count = count(1) From '+@table_name+ ' where ctx_id='+convert(varchar,@ctx_id)+' and '+@col_name+' is not null ; '~r~n" + &
"~t~tEXEC SP_EXECUTESQL @sql_execute, N'@count int output',@count OUTPUT~t~r~n" + &
"~t~tif (@count= 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tFETCH NEXT FROM request_filldata_cursor INTO @field_name_fill, @field_name_map, @relative_days, @data_from, @table_name, @col_name,@col_type, @scale~r~n" + &
"~t~t~tContinue~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* except target column in the web. */~r~n" + &
"~t~tSet @count =0 ~r~n" + &
"~t~tSet @sql_execute = 'Select @count = count(1) From request_webform_detail Where types = ''column'' and rwf_id ='+convert(varchar,@rwf_id)+~r~n" + &
"~t~t~t' and table_name='''+@table_name+''' and col_name ='''+@field_name_fill+''' ; '~r~n" + &
"~t~tEXEC SP_EXECUTESQL @sql_execute, N'@count int output',@count OUTPUT~t~r~n" + &
"~r~n" + &
"~t~tif(@count > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tFETCH NEXT FROM request_filldata_cursor INTO @field_name_fill, @field_name_map, @relative_days, @data_from, @table_name, @col_name,@col_type, @scale~r~n" + &
"~t~t~tContinue~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* check original column data must be in request module.*/~r~n" + &
"~t~tSet @count =0 ~r~n" + &
"~t~tSet @sql_execute = 'Select @count = count(1) From request_webform_detail Where types = ''column'' and rwf_id ='+convert(varchar,@rwf_id)+~r~n" + &
"~t~t~t' and table_name='''+@table_name+''' and col_name ='''+@col_name+''' and ((col_string_value is not null and ltrim(rtrim(col_string_value))<>'''') or col_datetime_value is not null or col_number_value is not null or col_decimal_value is not null) ; '~r~n" + &
"~t~tEXEC SP_EXECUTESQL @sql_execute, N'@count int output',@count OUTPUT~t~r~n" + &
"~t~tif (@count= 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tFETCH NEXT FROM request_filldata_cursor INTO @field_name_fill, @field_name_map, @relative_days, @data_from, @table_name, @col_name,@col_type, @scale~r~n" + &
"~t~t~tContinue~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~t/* check datafill column data is not null, then return. delete it */~r~n" + &
"~t~t/*Set @count =0 ~r~n" + &
"~t~tSet @sql_execute = 'Select @count = count(1) From '+@table_name+ ' where ctx_id='+convert(varchar,@ctx_id)+' and '+@field_name_fill+' is null ; '~r~n" + &
"~t~tEXEC SP_EXECUTESQL @sql_execute, N'@count int output',@count OUTPUT~t~r~n" + &
"~t~tif (@count= 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tFETCH NEXT FROM request_filldata_cursor INTO @field_name_fill, @field_name_map, @relative_days, @data_from, @table_name, @col_name,@col_type, @scale~r~n" + &
"~t~t~tContinue~r~n" + &
"~t~tEnd */~r~n" + &
"~r~n" + &
"~t~t/*  and ('+@field_name_fill+' is null) ~r~n" + &
"~t~t~tThis will not be use adjudge the exists of the data fill coumn value.  */~r~n" + &
"~t~tif (@col_type='datetime' or @col_type='smalldatetime')~r~n" + &
"~t~tBegin~t~t~t~t~t~t~r~n" + &
"~t~t~tif (@relative_days is null) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @relative_days = 0~r~n" + &
"~t~t~tEnd~t~t~t~t~t~t~t~t~r~n" + &
"~t~t~tSet @sql_temp1 =''~r~n" + &
"~t~t~tSet @sql_execute = 'select @sql_temp1=systypes.name from syscolumns , systypes where syscolumns.xtype = systypes.xtype and object_name(syscolumns.id)='''+@table_name+''' and syscolumns.name='''+@field_name_fill+''' '~t~t~t~t~r~n" + &
"~t~t~tEXEC SP_EXECUTESQL @sql_execute, N'@sql_temp1 varchar(max) output',@sql_temp1 OUTPUT~t~t~r~n" + &
"~t~t~tif( @sql_temp1<>'' and DATALENGTH(@sql_temp1) > 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @autofill = @autofill+' Update '+ @table_name+ ' Set '+ @field_name_fill+~r~n" + &
"~t~t~t~t~t' = convert('+@sql_temp1+', convert(varchar,dateadd(day,'+convert(varchar,@relative_days)+','+@col_name+' ),101) ) where ctx_id='+convert(varchar,@ctx_id)+~r~n" + &
"~t~t~t~t~t' and ('+@col_name+' is not null and ISDATE('+@col_name+') = 1) ; '~t~t~t~t~r~n" + &
"~t~t~tEnd~t~t~t~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse if ((@col_type<>'datetime' and @col_type<>'smalldatetime') and (@data_from is null or lower(@data_from)='code_lookup' or lower(@data_from)='app_facility') )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~t/* It doesn't need compare the multi-row data primary key. */~r~n" + &
"~t~t~tif ( (@col_type ='int' or @col_type ='integer' or @col_type ='real' or @col_type ='float' or @col_type ='smallint'or @col_type ='tinyint') or~r~n" + &
"~t~t~t~t (@col_type ='numeric') or (@col_type ='decimal') or (@col_type ='money') )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t/* (@col_type ='numeric' and @scale = 0) or (@col_type ='decimal' and @scale = 0) or (@col_type ='money' and @scale = 0) ~r~n" + &
"~t~t~t~tThis condition donot need to adjudge the @scale value(? = 0 or ? > 0 ).~r~n" + &
"~t~t~t */~r~n" + &
"~t~t~t~tSet @sql_temp1 =''~r~n" + &
"~t~t~t~tSet @col_length = 0~r~n" + &
"~t~t~t~tSet @sql_execute = 'select @sql_temp1=systypes.name, @col_length=syscolumns.length from syscolumns , systypes where syscolumns.xtype = systypes.xtype and object_name(syscolumns.id)='''+@table_name+''' and syscolumns.name='''+@field_name_fill+''' '~t~t~t~t~r~n" + &
"~t~t~t~tEXEC SP_EXECUTESQL @sql_execute, N'@sql_temp1 varchar(max) output, @col_length int output',@sql_temp1 OUTPUT, @col_length output~t~t~r~n" + &
"~t~t~t~tif( @sql_temp1<>'' and DATALENGTH(@sql_temp1) > 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tIf (lower(@data_from)='app_facility')~r~n" + &
"~t~t~t~t~tBegin~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tif (lower(@field_name_map) = 'state' and ( (@sql_temp1 <>'char' and @sql_temp1 <>'varchar' and @sql_temp1 <>'nchar' and @sql_temp1 <>'nvarchar') or ~r~n" + &
"~t~t~t~t~t~t~t~t(@sql_temp1 ='char' and @sql_temp1 ='varchar' and @sql_temp1 ='nchar' and @sql_temp1 ='nvarchar' and @col_length < 2 ) ) )~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @num = 102~r~n" + &
"~t~t~t~t~t~t~tSet @err_msg = @err_msg+ 'Autodatafill function Failed. Position:'+convert(varchar,@num)+'; SQL Syntax Error: The format of the column '+@field_name_fill +' from table '+@table_name+' is not text type or its length is less than 2 characters. '~r~n" + &
"~t~t~t~t~t~t~tCLOSE request_filldata_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE request_filldata_cursor~r~n" + &
"~r~n" + &
"~t~t~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~t~t~tEnd~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~t~treturn~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tSelect @autofill = @autofill + ' Update '+@table_name+' Set '+@field_name_fill+'= ('+~r~n" + &
"~t~t~t~t~t~t~t~t'Select convert('+@sql_temp1+','+@field_name_map+') from app_facility where facility_id = convert(integer,'+@table_name+'.'+@col_name+')) where ctx_id='+convert(varchar,@ctx_id) +~t~t~t~r~n" + &
"~t~t~t~t~t~t~t~t' and ('+@col_name+' is not null and ISNUMERIC('+@col_name+') = 1) ; '~t~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @autofill = @autofill + ' Update '+@table_name+' Set '+@field_name_fill+'= ('+~r~n" + &
"~t~t~t~t~t~t~t'Select convert('+@sql_temp1+','+@field_name_map+') from code_lookup where lookup_code = convert(integer,'+@table_name+'.'+@col_name+')) where ctx_id='+convert(varchar,@ctx_id) +~t~t~t~r~n" + &
"~t~t~t~t~t~t~t' and ('+@col_name+' is not null and ISNUMERIC('+@col_name+') = 1) ; '~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tElse If(@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_temp1 =''~r~n" + &
"~t~t~t~tSet @col_length = 0~r~n" + &
"~t~t~t~tSet @sql_execute = 'select @sql_temp1=systypes.name, @col_length=syscolumns.length from syscolumns , systypes where syscolumns.xtype = systypes.xtype and object_name(syscolumns.id)='''+@table_name+''' and syscolumns.name='''+@field_name_fill+''' '~t~t~t~t~r~n" + &
"~t~t~t~tEXEC SP_EXECUTESQL @sql_execute, N'@sql_temp1 varchar(max) output, @col_length int output',@sql_temp1 OUTPUT, @col_length output~r~n" + &
"~t~t~t~tif( @sql_temp1<>'' and DATALENGTH(@sql_temp1) > 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tIf (lower(@data_from)='app_facility')~r~n" + &
"~t~t~t~t~tBegin~t~t~t~r~n" + &
"~t~t~t~t~t~tif (lower(@field_name_map) = 'state' and ( (@sql_temp1 <>'char' and @sql_temp1 <>'varchar' and @sql_temp1 <>'nchar' and @sql_temp1 <>'nvarchar') or ~r~n" + &
"~t~t~t~t~t~t~t~t~t(@sql_temp1 ='char' and @sql_temp1 ='varchar' and @sql_temp1 ='nchar' and @sql_temp1 ='nvarchar' and @col_length < 2 ) ) )~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @num = 103~r~n" + &
"~t~t~t~t~t~t~tSet @err_msg = @err_msg+ 'Autodatafill function Failed. Position:'+convert(varchar,@num)+'; SQL Syntax Error: The format of the column '+@field_name_fill +' from table '+@table_name+' is not text type or its length is less than 2 characters. '~r~n" + &
"~t~t~t~t~t~t~tCLOSE request_filldata_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE request_filldata_cursor~r~n" + &
"~r~n" + &
"~t~t~t~t~t~t~tExecute(@sql_delete);~r~n" + &
"~t~t~t~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSelect @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete~r~n" + &
"~t~t~t~t~t~t~tEnd~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~t~treturn~r~n" + &
"~t~t~t~t~t~tEnd~t~t~r~n" + &
"~r~n" + &
"~t~t~t~t~t~tSelect @autofill = @autofill + ' Update '+@table_name+' Set '+@field_name_fill+'= ('+~r~n" + &
"~t~t~t~t~t~t~t~t'Select convert('+@sql_temp1+','+@field_name_map+') from app_facility where facility_id = convert(integer,'+@table_name+'.'+@col_name+')) where ctx_id='+convert(varchar,@ctx_id) +~t~t~t~r~n" + &
"~t~t~t~t~t~t~t~t' and ('+@col_name+' is not null and ISNUMERIC('+@col_name+') = 1) ; '~t~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @autofill = @autofill + ' Update '+@table_name+' Set '+@field_name_fill+'= ('+~r~n" + &
"~t~t~t~t~t~t~t'Select convert('+@sql_temp1+','+@field_name_map+') from code_lookup where lookup_code = convert(integer,'+@table_name+'.'+@col_name+')) where ctx_id='+convert(varchar,@ctx_id) +~t~t~t~r~n" + &
"~t~t~t~t~t~t~t' and ('+@col_name+' is not null and ISNUMERIC('+@col_name+') = 1) ; '~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tFETCH NEXT FROM request_filldata_cursor INTO @field_name_fill, @field_name_map, @relative_days, @rowid, @table_name, @col_name, @lookup_field_style, @code,~r~n" + &
"~t~t~t~t~t~t@col_length, @col_type, @col_string_value, @col_decimal_value, @col_number_value, @col_datetime_value, @scale, @parent_table, @parent_rowid  ~r~n" + &
"~t~t~t~tContinue~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~tFETCH NEXT FROM request_filldata_cursor INTO @field_name_fill, @field_name_map, @relative_days, @data_from, @table_name, @col_name,@col_type, @scale~r~n" + &
"~tEnd~r~n" + &
"~tCLOSE request_filldata_cursor~r~n" + &
"~tDEALLOCATE request_filldata_cursor~r~n" + &
"~r~n" + &
"~tif(datalength(@autofill) > 0)~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @num = 104~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~tBEGIN TRANSACTION CtxAutoFill;~t~t~t~t~t~r~n" + &
"~t~t~tExecute(@autofill) ;~r~n" + &
"~t~t~tSet @error_sum = @error_sum + @@error~t~t~t~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~tSet @err_msg = 'Autodatafill function Failed. Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() +' ; Sql:'+@autofill~r~n" + &
"~t~t~tROLLBACK TRANSACTION CtxAutoFill;~r~n" + &
"~t~t~tif (datalength(ltrim(rtrim(@sql_delete)))> 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @err_msg = @err_msg+ 'Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~tReturn  ~r~n" + &
"~t~tEND CATCH;~r~n" + &
"~r~n" + &
"~t~tIf (@error_sum <> 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tset @err_msg = @err_msg+ 'Autodatafill function Failed. Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' ; Sql:'+@autofill~r~n" + &
"~t~t~tROLLBACK TRANSACTION CtxAutoFill;~r~n" + &
"~t~t~tif (datalength(ltrim(rtrim(@sql_delete)))> 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tExecute(@sql_delete );~r~n" + &
"~t~t~t~tif (@@error <> 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @err_msg = @err_msg+ ' Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~treturn  ~r~n" + &
"~t~tEnd ~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tCOMMIT TRANSACTION CtxAutoFill;~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd ~r~n" + &
"End~r~n"
is_sql_statements[upperbound(is_sql_statements) + 1] = ls_sql1 + ls_sql2



of_execute_sqls("of_ver150_release_storeprocedure2")


return 1

end function

public function integer of_ver150_release_storeprocedure3 ();//====================================================================
// Function: of_ver150_release_storeprocedure2
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Gavin		Date: 05/18/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//"If Exists (SELECT name FROM sysobjects WHERE name = 'up_calculate_date_alarms' AND type = 'P')~r~n" + &
//"~tDROP PROCEDURE up_calculate_date_alarms~r~n" 
//added by gavin 20150518
is_sql_statements[upperbound(is_sql_statements) + 1] = &
" If Exists ( Select 1 From sysobjects where type = 'IF' and name = 'uf_get_contract_tree' ) ~r~n" + &
" Begin ~r~n" + &
"~t Drop FUNCTION uf_get_contract_tree  ~r~n" + &
" End ~r~n" + &
" "
is_sql_statements[upperbound(is_sql_statements) + 1] = &
" create function uf_get_contract_tree ( @ctxid int, @user_d varchar(50) ) returns  table as  ~r~n" + &
" return(~r~n" + &
"with temp0 as ~r~n" + &
"( select a.ctx_id, a.master_contract_id  from  ctx_basic_info_pagedata a inner join ctx_basic_info_users b on a.ctx_id=b.ctx_id and b.user_id =@user_d )~r~n" + &
",~r~n" + &
"temp1 as~r~n" + &
"( select master_contract_id ,ctx_id    from temp0  where ctx_id = @ctxid~r~n" + &
"  union all ~r~n" + &
"  select a.master_contract_id,a.ctx_id from temp0 a inner join temp1 b on a.ctx_id = b.master_contract_id )~r~n" + &
",  ~r~n" + &
" temp2 as~r~n" + &
"( select master_contract_id ,ctx_id  from temp0 where ctx_id = ( select ctx_id from temp1 where master_contract_id = 0 )~r~n" + &
"  union all ~r~n" + &
"  select a.master_contract_id,a.ctx_id  from temp0 a inner join temp2 b on a.master_contract_id = b.ctx_id )~r~n" + &
"  select ctx_id from temp2 ~r~n" + &
"  )"


is_sql_statements[upperbound(is_sql_statements) + 1] = &
" If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_contract_user_permission' )~r~n" + &
" Begin~r~n" + &
"~tDrop Procedure sp_contract_user_permission ~r~n" + &
" End  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
" CREATE procedure sp_contract_user_permission ~r~n" + &
" ( @user_d varchar(20) ) as ~r~n" + &
" ~r~n" + &
" /*******initial #temp_ctx_user********/ ~r~n" + &
"  IF object_id('tempdb..#temp_ctx_user') is not null ~r~n" + &
"  Begin ~r~n" + &
"  ~tDrop TABLE #temp_ctx_user; ~r~n" + &
"  End  ~r~n" + &
"    ~r~n" + &
"  /*********prepare #temp_ctx_user data********/ ~r~n" + &
"  SELECT ctx_contacts.user_d,ctx_contract_contacts.ctx_id into #temp_ctx_user ~r~n" + &
"  FROM ctx_contract_contacts, ctx_contacts    ~r~n" + &
"  WHERE ctx_contacts.contact_id = ctx_contract_contacts.contact_id  ~r~n" + &
"  AND ctx_contract_contacts.ic_area = 'I' ~r~n" + &
"  UNION      ~r~n" + &
"  SELECT security_group_users.user_id user_d,ctx_group_access.ctx_id ~r~n" + &
"  FROM ctx_group_access,security_group_users,icred_settings  ~r~n" + &
"  WHERE icred_settings.group_access = 1  ~r~n" + &
"  AND ctx_group_access.group_id = security_group_users.group_id ~r~n" + &
"   ~r~n" + &
"  /*********prepare #temp_right data********/ ~r~n" + &
"  delete from ctx_basic_info_users where user_id = @user_d~r~n" + &
"~r~n" + &
"  insert into ctx_basic_info_users ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id,  ~r~n" + &
"  ~t   user_id = ctx_contacts.user_d,  ~r~n" + &
"  ~t   access = (CASE ctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END)    ~r~n" + &
"  FROM ctx_contract_contacts Left Outer Join  ~r~n" + &
"  (  ~r~n" + &
"  Select ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d   ~r~n" + &
"  From ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1  ~r~n" + &
"  Where ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id And ctx_contacts1.user_d = @user_d  ~r~n" + &
"  Group By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d  ~r~n" + &
"  Having Count(ctx_contract_contacts1.ctx_id) > 1  ~r~n" + &
"  ) ccc  ~r~n" + &
"  On ctx_contract_contacts.ctx_id = ccc.ctx_id  ~r~n" + &
"  ,ctx_contacts  ~r~n" + &
"  WHERE ctx_contacts.user_d = @user_d  ~r~n" + &
"  ~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' )  ~r~n" + &
"  ~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id   ~r~n" + &
"  ~tAND ( ctx_contract_contacts.access IN ('F','R')   ~r~n" + &
"  ~tOR ctx_contract_contacts.owner = 'Y' )  ~r~n" + &
"  ~tAND ctx_contract_contacts.ic_area = 'I'  ~r~n" + &
"  UNION   ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id, ~r~n" + &
"  ~t   user_id = security_group_users.user_id,  ~r~n" + &
"  ~t   access =  ctx_group_access.access  ~r~n" + &
"  FROM  ctx_group_access ,security_group_users,icred_settings  ~r~n" + &
"  WHERE security_group_users.user_id = @user_d  ~r~n" + &
"     AND ctx_group_access.group_id = security_group_users.group_id  ~r~n" + &
"  ~tAND ctx_group_access.access =   ~r~n" + &
"  ~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access   ~r~n" + &
"  ~t~tFrom ctx_group_access a1,security_group_users u1  ~r~n" + &
"  ~t~tWhere a1.group_id = u1.group_id   ~r~n" + &
"  ~t~tAnd a1.ctx_id = ctx_group_access.ctx_id  ~r~n" + &
"  ~t~tAnd u1.user_id = security_group_users.user_id~t  ~r~n" + &
"  ~t~tAnd a1.access = 'F') Then 'F' Else 'R' End)   ~r~n" + &
"  ~tAND icred_settings.group_access = 1  ~r~n" + &
"  ~tAND ctx_group_access.access in ('F','R')  ~r~n" + &
"  ~tAND NOT EXISTS~t(SELECT 1 FROM ctx_contract_contacts, ctx_contacts  ~r~n" + &
"  ~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )   ~r~n" + &
"  ~t~t~tAND ( ctx_contacts.user_d = security_group_users.user_id )  ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ic_area = 'I' )  ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id )  ~r~n" + &
"  ~t~t~t)  ~r~n" + &
"  UNION  ~r~n" + &
" SELECT b.ctx_id,b.user_id,(CASE WHEN b.rcnt=0 THEN 'F' ELSE 'R' END) access  ~r~n" + &
" FROM ~r~n" + &
" ( ~r~n" + &
" ~tSELECT DISTINCT a.ctx_id,a.user_id, ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'F' THEN 1 ELSE 0 END) fcnt, ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'R' THEN 1 ELSE 0 END) rcnt ~r~n" + &
" ~tFROM  ~r~n" + &
" ~t( ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,  ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id, ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END)  ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info  ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d    ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id  ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0   ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=1 ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category  ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('11','12','13')  ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id) ~r~n" + &
"        union ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,  ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id, ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '61' THEN 'F' WHEN '62' THEN 'R' ELSE 'N' END)  ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info  ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d    ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id  ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0   ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=6 ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.dvision  ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('61','62','63')  ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id) ~r~n" + &
"         union ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,  ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id, ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '71' THEN 'F' WHEN '72' THEN 'R' ELSE 'N' END)  ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info  ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d    ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id  ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0   ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=7 ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_department  ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('71','72','73')  ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id) ~r~n" + &
" ~t~tunion ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,  ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id, ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '81' THEN 'F' WHEN '82' THEN 'R' ELSE 'N' END)  ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info  ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d    ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id  ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0   ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=8 ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_type  ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('81','82','83')  ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id) ~r~n" + &
" ~t) a ~r~n" + &
" ~tGROUP BY a.ctx_id,a.user_id ~r~n" + &
"    HAVING SUM(CASE a.access WHEN 'N' THEN 1 ELSE 0 END) = 0 ~r~n" + &
" ) b "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
" If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_contract_rowset' )~r~n" + &
" Begin~r~n" + &
"~tDrop Procedure sp_contract_rowset ~r~n" + &
" End  ~r~n" + &
""

is_sql_statements[upperbound(is_sql_statements) + 1] = &
" CREATE procedure sp_contract_rowset( @user_d  varchar(50)  )~r~n" + &
"  AS~r~n" + &
" DECLARE @display_multi_products VARCHAR(10)  ~r~n" + &
" ~r~n" + &
"   BEGIN~r~n" + &
"~t~t~r~n" + &
"~t~tSELECT @display_multi_products = option_value FROM security_user_options WHERE user_id = @user_d and option_name='display_multi_product'~t ~r~n" + &
"~t~tif (@display_multi_products is null) set @display_multi_products = '1'  ~r~n" + &
"~t~tTRUNCATE TABLE ctx_basic_info_pagedata~r~n" + &
"   END~r~n" + &
"    ~r~n" + &
"  /*********display multi row if ctx have multi product*******/ ~r~n" + &
"  if @display_multi_products = '1'    ~r~n" + &
"  BEGIN        ~r~n" + &
" ~tWITH v_ctx_ccci as ~r~n" + &
" ~t( ~r~n" + &
"  ~t SELECT ctx_contract_contacts.ctx_id,    ~r~n" + &
"          'name' = ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'') ~r~n" + &
"    ~tFROM  ctx_contract_contacts,ctx_contacts ~r~n" + &
"    ~tWHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id     ~r~n" + &
"    ~tAND   ctx_contract_contacts.ic_area = 'E'  ~r~n" + &
" ~t), ~r~n" + &
" ~tv_ctx_ccci2 as  ~r~n" + &
" ~t(  ~r~n" + &
"   ~t select aa.ctx_id,  ~r~n" + &
" ~t      ccci_name = ltrim(stuff((select '; ' + name from v_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , '')) ~r~n" + &
"   ~t from v_ctx_ccci aa ~r~n" + &
"   ~t group by aa.ctx_id ~r~n" + &
" ~t), ~r~n" + &
" ~tv_ctx_occi as ~r~n" + &
" ~t( ~r~n" + &
"    ~tSELECT ctx_contract_contacts.ctx_id,    ~r~n" + &
"          'name' = ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'') ~r~n" + &
"    ~tFROM  ctx_contract_contacts,ctx_contacts ~r~n" + &
"    ~tWHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id     ~r~n" + &
"    ~tAND   ctx_contract_contacts.ic_area = 'I' ~r~n" + &
" ~t), ~r~n" + &
" ~tv_ctx_occi2 as  ~r~n" + &
" ~t(  ~r~n" + &
" ~t select aa.ctx_id,  ~r~n" + &
" ~t occi_name = ltrim(stuff((select '; ' + name from v_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , '')) ~r~n" + &
"      from v_ctx_occi aa ~r~n" + &
"      group by aa.ctx_id ~r~n" + &
" ~t) ~r~n" + &
"~tinsert ctx_basic_info_pagedata ~r~n" + &
"  ~tSELECT DISTINCT ctx_basic_info.app_facility,   ~r~n" + &
"  ~tctx_products.product_id product_code, ~r~n" + &
"  ~tcode_lookup.code product_name,     ~r~n" + &
"  ~tctx_basic_info.effective_date,     ~r~n" + &
"  ~tctx_basic_info.expriation_date,    ~r~n" + &
"  ~tctx_basic_info.status,       ~r~n" + &
"  ~tctx_basic_info.group_multi_loc_id, ~r~n" + &
"  ~tctx_basic_info.ctx_id,  ~r~n" + &
"  ~tctx_basic_info.master_contract_id, ~r~n" + &
"  ~tmaster_cnt = (SELECT Count(ctx_basic_info1.ctx_id)  ~r~n" + &
"  ~t~t~tFROM ctx_basic_info ctx_basic_info1   ~r~n" + &
"  ~t~t~tWHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ), ~r~n" + &
"  ~tctx_basic_info.category,          ~r~n" + &
"  ~tctx_basic_info.facility_id,       ~r~n" + &
"  ~tctx_basic_info.contract_type,     ~r~n" + &
"  ~tcode_lookup1.code product_type,   ~r~n" + &
"  ~tctx_basic_info.reimbursment_menth, ~r~n" + &
"  ~tctx_basic_info.file_location,     ~r~n" + &
"  ~tctx_basic_info.review_date,       ~r~n" + &
"  ~tctx_basic_info.review_by,         ~r~n" + &
"  ~tctx_basic_info.term_date,         ~r~n" + &
"  ~tctx_basic_info.term_reason,       ~r~n" + &
"  ~tctx_basic_info.last_revis_date,   ~r~n" + &
"  ~tctx_basic_info.other_date_1,      ~r~n" + &
"  ~tctx_basic_info.other_date_2,      ~r~n" + &
"  ~tctx_basic_info.oc_signed_by,      ~r~n" + &
"  ~tctx_basic_info.oc_title,          ~r~n" + &
"  ~tctx_basic_info.oc_department,     ~r~n" + &
"  ~tctx_basic_info.oc_legal_rep,      ~r~n" + &
"  ~tctx_basic_info.cc_signed_by,      ~r~n" + &
"  ~tctx_basic_info.cc_title,          ~r~n" + &
"  ~tctx_basic_info.cc_department,     ~r~n" + &
"  ~tctx_basic_info.cc_legal_rep,      ~r~n" + &
"  ~tctx_basic_info.notes,        ~t  ~r~n" + &
"  ~tctx_basic_info.keyword,           ~r~n" + &
"  ~tctx_basic_info.dvision,           ~r~n" + &
"  ~tctx_basic_info.custom_1,          ~r~n" + &
"  ~tctx_basic_info.custom_2,          ~r~n" + &
"  ~tctx_basic_info.custom_3,          ~r~n" + &
"  ~tctx_basic_info.custom_4,          ~r~n" + &
"  ~tctx_basic_info.custom_5,          ~r~n" + &
"  ~tctx_basic_info.custom_6,          ~r~n" + &
"  ~tctx_basic_info.custom_7,         ~r~n" + &
"  ~tctx_basic_info.custom_8,         ~r~n" + &
"  ~tctx_basic_info.custom_9,         ~r~n" + &
"  ~tctx_basic_info.custom_10,        ~r~n" + &
"  ~tctx_basic_info.group_id,         ~r~n" + &
"  ~tctx_basic_info.revision_reason,  ~r~n" + &
"  ~tctx_basic_info.record_id ,     ~r~n" + &
"  ~towner = upper((SELECT top 1 ctx_contacts.user_d  ~r~n" + &
"  ~t~t~tFROM ctx_contacts,ctx_contract_contacts   ~r~n" + &
"  ~t~t~tWHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )  ~r~n" + &
"  ~t~t~tAND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )   ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.owner = 'Y' )   ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.ic_area = 'I' ) )),   ~r~n" + &
"  ~tcontracted_entity = (SELECT top 1 group_multi_loc.rec_id        ~r~n" + &
"  ~t  ~t~t~tFROM ctx_loc,                  group_multi_loc   ~r~n" + &
"  ~t~t~t~tWHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id)  ~r~n" + &
"  ~t~t~t~tAND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)   ~r~n" + &
"  ~t~t~t~tAND ctx_loc.loc_id = 0),      ~r~n" + &
"  ~tapp_facility.facility_name facility_name,     ~r~n" + &
"  ~tctx_basic_info.custom_date1,        ~r~n" + &
"  ~tctx_basic_info.custom_date2,        ~r~n" + &
"  ~tctx_basic_info.custom_date3,        ~r~n" + &
"  ~tctx_basic_info.custom_date4,    ~r~n" + &
"  ~tctx_basic_info.custom_date5,        ~r~n" + &
"  ~tctx_basic_info.inserted_by_user,      ~r~n" + &
"  ~tctx_basic_info.inserted_at_date_time,        ~r~n" + &
"  ~tctx_basic_info.updated_by_user,     ~r~n" + &
"  ~tctx_basic_info.updated_at_date_time,        ~r~n" + &
"  ~tctx_basic_info.custom_11,        ~r~n" + &
"  ~tctx_basic_info.custom_12,     ~r~n" + &
"  ~tctx_basic_info.custom_13,        ~r~n" + &
"  ~tctx_basic_info.custom_14,        ~r~n" + &
"  ~tctx_basic_info.custom_15,    ~r~n" + &
"  ~tctx_basic_info.custom_16,        ~r~n" + &
"  ~tctx_basic_info.custom_17,        ~r~n" + &
"  ~tctx_basic_info.custom_18,        ~r~n" + &
"  ~tctx_basic_info.custom_19,        ~r~n" + &
"  ~tctx_basic_info.custom_20,       ~r~n" + &
"  ~tctx_basic_info.custom_date6,        ~r~n" + &
"  ~tctx_basic_info.custom_date7,        ~r~n" + &
"  ~tctx_basic_info.custom_date8,    ~r~n" + &
"  ~tctx_basic_info.custom_date9,        ~r~n" + &
"  ~tctx_basic_info.custom_date10,        ~r~n" + &
"  ~tctx_basic_info.custom_date11,        ~r~n" + &
"  ~tctx_basic_info.custom_date12,        ~r~n" + &
"  ~tctx_basic_info.custom_date13,    ~r~n" + &
"  ~tctx_basic_info.custom_date14,        ~r~n" + &
"  ~tctx_basic_info.custom_date15,        ~r~n" + &
"  ~tctx_basic_info.custom_n1,   ~r~n" + &
"  ~tctx_basic_info.custom_n2,        ~r~n" + &
"  ~tctx_basic_info.custom_n3,        ~r~n" + &
"  ~tctx_basic_info.custom_n4,        ~r~n" + &
"  ~tctx_basic_info.custom_n5,        ~r~n" + &
"  ~tctx_basic_info.custom_n6,    ~r~n" + &
"  ~tctx_basic_info.custom_n7,        ~r~n" + &
"  ~tctx_basic_info.custom_n8,        ~r~n" + &
"  ~tctx_basic_info.custom_n9,     ~r~n" + &
"  ~tctx_basic_info.custom_n10,        ~r~n" + &
"  ~tctx_basic_info.custom_n11,        ~r~n" + &
"  ~tctx_basic_info.custom_n12,        ~r~n" + &
"  ~tctx_basic_info.custom_n13,        ~r~n" + &
"  ~tctx_basic_info.custom_n14,        ~r~n" + &
"  ~tctx_basic_info.custom_n15,        ~r~n" + &
"  ~tctx_basic_info.custom_n16,        ~r~n" + &
"  ~tctx_basic_info.custom_n17,        ~r~n" + &
"  ~tctx_basic_info.custom_n18,        ~r~n" + &
"  ~tctx_basic_info.custom_n19,        ~r~n" + &
"  ~tctx_basic_info.custom_n20,        ~r~n" + &
"  ~tctx_basic_info.custom_n21,        ~r~n" + &
"  ~tctx_basic_info.custom_n22,        ~r~n" + &
"  ~tctx_basic_info.custom_n23,        ~r~n" + &
"  ~tctx_basic_info.custom_n24,        ~r~n" + &
"  ~tctx_basic_info.custom_n25,        ~r~n" + &
"  ~tctx_basic_info.version_number,        ~r~n" + &
"  ~tctx_basic_info.version_date,        ~r~n" + &
"  ~tctx_basic_info.master_contract_name ,  ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_1 ,  ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_2 ,  ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_3 ,  ~r~n" + &
"  ~t'F' access   ,  ~r~n" + &
"  ~tcode_lookup2.code status_name,  ~r~n" + &
"  ~tcode_lookup3.code category_name,  ~r~n" + &
"  ~tcode_lookup4.code contract_type_name,  ~r~n" + &
"  ~tcode_lookup5.code dvision_name ,  ~r~n" + &
"  ~tunread_email_cnt = 0,   ~r~n" + &
"  ~tctx_basic_info.custom_percent_1, ~r~n" + &
"  ~tctx_basic_info.custom_percent_2,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_3,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_4,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_5,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_6,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_7,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_8,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_9,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_10,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n1,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n2,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n3,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n4,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n5,  ~r~n" + &
"  ~tctx_basic_info.custom_status1,  ~r~n" + &
"  ~tctx_basic_info.custom_status2,  ~r~n" + &
"  ~tctx_basic_info.custom_21,  ~r~n" + &
"  ~tctx_basic_info.custom_22,  ~r~n" + &
"  ~tctx_basic_info.custom_n26,  ~r~n" + &
"  ~tctx_basic_info.custom_n27,  ~r~n" + &
"  ~tctx_basic_info.custom_date16,  ~r~n" + &
"  ~tctx_basic_info.custom_date17,  ~r~n" + &
"  ~tapp_facility.city,  ~r~n" + &
"  ~tapp_facility.state,  ~r~n" + &
"  ~tapp_facility.country,  ~r~n" + &
"  ~tapp_facility.zip,  ~r~n" + &
"  ~tapp_facility.street,  ~r~n" + &
"  ~tctx_custom.custom_1 as custom2_custom_1,  ~r~n" + &
"    ctx_custom.custom_2 as custom2_custom_2,     ~r~n" + &
"    ctx_custom.custom_3 as custom2_custom_3,     ~r~n" + &
"    ctx_custom.custom_4 as custom2_custom_4,     ~r~n" + &
"     ctx_custom.custom_5 as custom2_custom_5,     ~r~n" + &
"     ctx_custom.custom_6 as custom2_custom_6,     ~r~n" + &
"      ctx_custom.custom_7 as custom2_custom_7,     ~r~n" + &
"      ctx_custom.custom_8 as custom2_custom_8,     ~r~n" + &
"      ctx_custom.custom_9 as custom2_custom_9,     ~r~n" + &
"      ctx_custom.custom_10 as custom2_custom_10,     ~r~n" + &
"      ctx_custom.custom_11 as custom2_custom_11,     ~r~n" + &
"      ctx_custom.custom_12 as custom2_custom_12,     ~r~n" + &
"      ctx_custom.custom_13 as custom2_custom_13,     ~r~n" + &
"      ctx_custom.custom_14 as custom2_custom_14,     ~r~n" + &
"      ctx_custom.custom_15 as custom2_custom_15,     ~r~n" + &
"      ctx_custom.custom_16 as custom2_custom_16,     ~r~n" + &
"      ctx_custom.custom_17 as custom2_custom_17,     ~r~n" + &
"      ctx_custom.custom_18 as custom2_custom_18,     ~r~n" + &
"      ctx_custom.custom_19 as custom2_custom_19,     ~r~n" + &
"      ctx_custom.custom_20 as custom2_custom_20,     ~r~n" + &
"      ctx_custom.custom_date1 as custom2_custom_date1,     ~r~n" + &
"      ctx_custom.custom_date2 as custom2_custom_date2,     ~r~n" + &
"      ctx_custom.custom_date3 as custom2_custom_date3,     ~r~n" + &
"      ctx_custom.custom_date4 as custom2_custom_date4,     ~r~n" + &
"      ctx_custom.custom_date5 as custom2_custom_date5,     ~r~n" + &
"      ctx_custom.custom_date6 as custom2_custom_date6,     ~r~n" + &
"      ctx_custom.custom_date7 as custom2_custom_date7,     ~r~n" + &
"      ctx_custom.custom_date8 as custom2_custom_date8,     ~r~n" + &
"      ctx_custom.custom_date9 as custom2_custom_date9,     ~r~n" + &
"      ctx_custom.custom_date10 as custom2_custom_date10,     ~r~n" + &
"      ctx_custom.custom_date11 as custom2_custom_date11,     ~r~n" + &
"      ctx_custom.custom_date12 as custom2_custom_date12,     ~r~n" + &
"      ctx_custom.custom_date13 as custom2_custom_date13,     ~r~n" + &
"      ctx_custom.custom_date14 as custom2_custom_date14,     ~r~n" + &
"      ctx_custom.custom_date15 as custom2_custom_date15,     ~r~n" + &
"      ctx_custom.custom_n1 as custom2_custom_n1,     ~r~n" + &
"      ctx_custom.custom_n2 as custom2_custom_n2,     ~r~n" + &
"      ctx_custom.custom_n3 as custom2_custom_n3,     ~r~n" + &
"      ctx_custom.custom_n4 as custom2_custom_n4,     ~r~n" + &
"      ctx_custom.custom_n5 as custom2_custom_n5,     ~r~n" + &
"      ctx_custom.custom_n6 as custom2_custom_n6,     ~r~n" + &
"      ctx_custom.custom_n7 as custom2_custom_n7,     ~r~n" + &
"      ctx_custom.custom_n8 as custom2_custom_n8,     ~r~n" + &
"      ctx_custom.custom_n9 as custom2_custom_n9,     ~r~n" + &
"      ctx_custom.custom_n10 as custom2_custom_n10,     ~r~n" + &
"      ctx_custom.custom_n11 as custom2_custom_n11,     ~r~n" + &
"      ctx_custom.custom_n12 as custom2_custom_n12,     ~r~n" + &
"      ctx_custom.custom_n13 as custom2_custom_n13,     ~r~n" + &
"      ctx_custom.custom_n14 as custom2_custom_n14,     ~r~n" + &
"      ctx_custom.custom_n15 as custom2_custom_n15,     ~r~n" + &
"      ctx_custom.custom_n16 as custom2_custom_n16,     ~r~n" + &
"      ctx_custom.custom_n17 as custom2_custom_n17,     ~r~n" + &
"      ctx_custom.custom_n18 as custom2_custom_n18,     ~r~n" + &
"      ctx_custom.custom_n19 as custom2_custom_n19,     ~r~n" + &
"      ctx_custom.custom_n20 as custom2_custom_n20,     ~r~n" + &
"      ctx_custom.custom_n21 as custom2_custom_n21,     ~r~n" + &
"      ctx_custom.custom_n22 as custom2_custom_n22,     ~r~n" + &
"      ctx_custom.custom_n23 as custom2_custom_n23,     ~r~n" + &
"      ctx_custom.custom_n24 as custom2_custom_n24,     ~r~n" + &
"      ctx_custom.custom_n25 as custom2_custom_n25,     ~r~n" + &
"      ctx_custom.custom_21 as custom2_custom_21,     ~r~n" + &
"      ctx_custom.custom_22 as custom2_custom_22,     ~r~n" + &
"      ctx_custom.custom_notes_1 as custom2_custom_notes_1,    ~r~n" + &
"      ctx_custom.custom_notes_2 as custom2_custom_notes_2,     ~r~n" + &
"      ctx_custom.custom_notes_3 as custom2_custom_notes_3,     ~r~n" + &
"      ctx_custom.custom_notes_4 as custom2_custom_notes_4,     ~r~n" + &
"      ctx_custom.custom_notes_5 as custom2_custom_notes_5,     ~r~n" + &
"      ctx_custom.custom_money_1 as custom2_custom_money_1,     ~r~n" + &
"      ctx_custom.custom_money_2 as custom2_custom_money_2,     ~r~n" + &
"      ctx_custom.custom_money_3 as custom2_custom_money_3,     ~r~n" + &
"      ctx_custom.custom_percent_1 as custom2_custom_percent_1,     ~r~n" + &
"  ~tctx_custom.custom_percent_2 as custom2_custom_percent_2,     ~r~n" + &
"      ctx_custom.custom_percent_3 as custom2_custom_percent_3,     ~r~n" + &
"      ctx_custom.custom_percent_4 as custom2_custom_percent_4,     ~r~n" + &
"      ctx_custom.custom_percent_5 as custom2_custom_percent_5,     ~r~n" + &
"      ctx_custom.custom_percent_6 as custom2_custom_percent_6,     ~r~n" + &
"      ctx_custom.custom_percent_7 as custom2_custom_percent_7,     ~r~n" + &
"      ctx_custom.custom_percent_8 as custom2_custom_percent_8,     ~r~n" + &
"      ctx_custom.custom_percent_9 as custom2_custom_percent_9,     ~r~n" + &
"      ctx_custom.custom_percent_10 as custom2_custom_percent_10,    ~r~n" + &
"      has_docs = Isnull(ctx_am_documents.has_docs,0),  ~r~n" + &
"     ctx_basic_info.contract_department,  ~r~n" + &
"     v_ctx_occi2.occi_name, ~r~n" + &
"     v_ctx_ccci2.ccci_name ~r~n" + &
"  ~tFROM  ctx_basic_info    ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_ccci2 ON ctx_basic_info.ctx_id = v_ctx_ccci2.ctx_id~t  ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_occi2 ON ctx_basic_info.ctx_id = v_ctx_occi2.ctx_id ~r~n" + &
"  ~tLEFT OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id    ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup ON ctx_products.product_id = code_lookup.lookup_code    ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup1 ON ctx_products.product_type = code_lookup1.lookup_code ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code  ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code  ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code  ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code  ~r~n" + &
"  ~tLEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id    ~r~n" + &
"  ~tLEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id   ~r~n" + &
"  ~tLEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id    ~r~n" + &
"   ~tWHERE  ctx_basic_info.is_template = 0   ~r~n" + &
"  ~t     ~r~n" + &
"  END  ~r~n" + &
"  /*********display one row if ctx have multi product*******/ ~r~n" + &
"  else  ~r~n" + &
"  ~r~n" + &
"  BEGIN  ~r~n" + &
"  ~tWITH v_ctx_ccci as ~r~n" + &
" ~t( ~r~n" + &
"  ~t SELECT ctx_contract_contacts.ctx_id,    ~r~n" + &
"          'name' = ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'') ~r~n" + &
"    ~tFROM  ctx_contract_contacts,ctx_contacts ~r~n" + &
"    ~tWHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id     ~r~n" + &
"    ~tAND   ctx_contract_contacts.ic_area = 'E'  ~r~n" + &
" ~t), ~r~n" + &
" ~tv_ctx_ccci2 as  ~r~n" + &
" ~t(  ~r~n" + &
"   ~t select aa.ctx_id,  ~r~n" + &
" ~t      ccci_name = ltrim(stuff((select '; ' + name from v_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , '')) ~r~n" + &
"   ~t from v_ctx_ccci aa ~r~n" + &
"   ~t group by aa.ctx_id ~r~n" + &
" ~t), ~r~n" + &
" ~tv_ctx_occi as ~r~n" + &
" ~t( ~r~n" + &
"    ~tSELECT ctx_contract_contacts.ctx_id,    ~r~n" + &
"          'name' = ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'') ~r~n" + &
"    ~tFROM  ctx_contract_contacts,ctx_contacts ~r~n" + &
"    ~tWHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id     ~r~n" + &
"    ~tAND   ctx_contract_contacts.ic_area = 'I' ~r~n" + &
" ~t), ~r~n" + &
" ~tv_ctx_occi2 as  ~r~n" + &
" ~t(  ~r~n" + &
" ~t select aa.ctx_id,  ~r~n" + &
" ~t occi_name = ltrim(stuff((select '; ' + name from v_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , '')) ~r~n" + &
"      from v_ctx_occi aa ~r~n" + &
"      group by aa.ctx_id ~r~n" + &
" ~t), ~r~n" + &
"  ~tv_ctx_products as ~r~n" + &
"  ~t(  ~r~n" + &
"  ~t  select a.ctx_id,a.product_id,a.product_type,b.code product_name,c.code product_type_name  ~r~n" + &
"  ~t  from ctx_products a  ~r~n" + &
"  ~t  LEFT OUTER JOIN code_lookup b ON a.product_id = b.lookup_code    ~r~n" + &
"      LEFT OUTER JOIN code_lookup c ON a.product_type = c.lookup_code  ~r~n" + &
"  ~t ), ~r~n" + &
"  ~tv_ctx_products2 as  ~r~n" + &
"  ~t(  ~r~n" + &
"  ~t  select aa.ctx_id,  ~r~n" + &
"    ~t  product_id = (select top 1 product_id from v_ctx_products where ctx_id = aa.ctx_id), ~r~n" + &
"  ~t  product_name = stuff((select ',' + product_name from v_ctx_products where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''), ~r~n" + &
"  ~t  product_type_name = stuff((select ',' + product_type_name from v_ctx_products where ctx_id=aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , '') ~r~n" + &
"       from v_ctx_products aa ~r~n" + &
"       group by aa.ctx_id ~r~n" + &
"      ) ~r~n" + &
"~tinsert ctx_basic_info_pagedata~r~n" + &
"  ~tSELECT DISTINCT   ~r~n" + &
"  ~tctx_basic_info.app_facility,      ~r~n" + &
"  ~tv_ctx_products2.product_id product_code,      ~r~n" + &
"  ~tv_ctx_products2.product_name,         ~r~n" + &
"  ~tctx_basic_info.effective_date,        ~r~n" + &
"  ~tctx_basic_info.expriation_date,         ~r~n" + &
"  ~tctx_basic_info.status,       ~r~n" + &
"  ~tctx_basic_info.group_multi_loc_id,    ~r~n" + &
"  ~tctx_basic_info.ctx_id,  ~r~n" + &
"   ~tctx_basic_info.master_contract_id, ~r~n" + &
"   ~tmaster_cnt = (SELECT Count(ctx_basic_info1.ctx_id) ~r~n" + &
"  ~t~t~tFROM ctx_basic_info ctx_basic_info1   ~r~n" + &
"  ~t~t~tWHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ),   ~r~n" + &
"  ~tctx_basic_info.category,          ~r~n" + &
"  ~tctx_basic_info.facility_id,       ~r~n" + &
"  ~tctx_basic_info.contract_type,         ~r~n" + &
"  ~tv_ctx_products2.product_type_name product_type, ~r~n" + &
"  ~tctx_basic_info.reimbursment_menth,         ~r~n" + &
"  ~tctx_basic_info.file_location,      ~r~n" + &
"  ~tctx_basic_info.review_date,         ~r~n" + &
"  ~tctx_basic_info.review_by,       ~r~n" + &
"  ~tctx_basic_info.term_date,         ~r~n" + &
"  ~tctx_basic_info.term_reason,       ~r~n" + &
"  ~tctx_basic_info.last_revis_date,    ~r~n" + &
"  ~tctx_basic_info.other_date_1,       ~r~n" + &
"  ~tctx_basic_info.other_date_2,       ~r~n" + &
"  ~tctx_basic_info.oc_signed_by,         ~r~n" + &
"  ~tctx_basic_info.oc_title,        ~r~n" + &
"  ~tctx_basic_info.oc_department,         ~r~n" + &
"  ~tctx_basic_info.oc_legal_rep,         ~r~n" + &
"  ~tctx_basic_info.cc_signed_by,       ~r~n" + &
"  ~tctx_basic_info.cc_title,         ~r~n" + &
"  ~tctx_basic_info.cc_department,         ~r~n" + &
"  ~tctx_basic_info.cc_legal_rep,       ~r~n" + &
"  ~tctx_basic_info.notes,         ~r~n" + &
"  ~tctx_basic_info.keyword,         ~r~n" + &
"  ~tctx_basic_info.dvision,     ~r~n" + &
"  ~tctx_basic_info.custom_1,         ~r~n" + &
"  ~tctx_basic_info.custom_2,         ~r~n" + &
"  ~tctx_basic_info.custom_3,         ~r~n" + &
"  ~tctx_basic_info.custom_4,         ~r~n" + &
"  ~tctx_basic_info.custom_5,       ~r~n" + &
"  ~tctx_basic_info.custom_6,        ~r~n" + &
"  ~tctx_basic_info.custom_7,         ~r~n" + &
"  ~tctx_basic_info.custom_8,   ~r~n" + &
"  ~tctx_basic_info.custom_9,         ~r~n" + &
"  ~tctx_basic_info.custom_10,      ~r~n" + &
"  ~tctx_basic_info.group_id,  ~r~n" + &
"  ~tctx_basic_info.revision_reason,    ~r~n" + &
"  ~tctx_basic_info.record_id ,     ~r~n" + &
"  ~towner = upper((SELECT top 1 ctx_contacts.user_d       ~r~n" + &
"  ~t~t~tFROM ctx_contacts,ctx_contract_contacts   ~r~n" + &
"  ~t~t~tWHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )   ~r~n" + &
"  ~t~t~tAND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )   ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.owner = 'Y' )   ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.ic_area = 'I' ) )),    ~r~n" + &
"  ~tcontracted_entity = (SELECT top 1 group_multi_loc.rec_id    ~r~n" + &
"  ~t  ~t~t~tFROM ctx_loc,                  group_multi_loc   ~r~n" + &
"  ~t~t~t~tWHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id)   ~r~n" + &
"  ~t~t~t~tAND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)   ~r~n" + &
"  ~t~t~t~tAND ctx_loc.loc_id = 0),      ~r~n" + &
"  ~tapp_facility.facility_name facility_name,     ~r~n" + &
"  ~tctx_basic_info.custom_date1,        ~r~n" + &
"  ~tctx_basic_info.custom_date2,        ~r~n" + &
"  ~tctx_basic_info.custom_date3,        ~r~n" + &
"  ~tctx_basic_info.custom_date4,    ~r~n" + &
"  ~tctx_basic_info.custom_date5,        ~r~n" + &
"  ~tctx_basic_info.inserted_by_user,      ~r~n" + &
"  ~tctx_basic_info.inserted_at_date_time,  ~r~n" + &
"  ~tctx_basic_info.updated_by_user,     ~r~n" + &
"  ~tctx_basic_info.updated_at_date_time,   ~r~n" + &
"  ~tctx_basic_info.custom_11,        ~r~n" + &
"  ~tctx_basic_info.custom_12,     ~r~n" + &
"  ~tctx_basic_info.custom_13,        ~r~n" + &
"  ~tctx_basic_info.custom_14,        ~r~n" + &
"  ~tctx_basic_info.custom_15,    ~r~n" + &
"  ~tctx_basic_info.custom_16,        ~r~n" + &
"  ~tctx_basic_info.custom_17,        ~r~n" + &
"  ~tctx_basic_info.custom_18,        ~r~n" + &
"  ~tctx_basic_info.custom_19,        ~r~n" + &
"  ~tctx_basic_info.custom_20,       ~r~n" + &
"  ~tctx_basic_info.custom_date6,      ~r~n" + &
"  ~tctx_basic_info.custom_date7,     ~r~n" + &
"  ~tctx_basic_info.custom_date8,    ~r~n" + &
"  ~tctx_basic_info.custom_date9,      ~r~n" + &
"  ~tctx_basic_info.custom_date10,     ~r~n" + &
"  ~tctx_basic_info.custom_date11,    ~r~n" + &
"  ~tctx_basic_info.custom_date12,     ~r~n" + &
"  ~tctx_basic_info.custom_date13,    ~r~n" + &
"  ~tctx_basic_info.custom_date14,     ~r~n" + &
"  ~tctx_basic_info.custom_date15,     ~r~n" + &
"  ~tctx_basic_info.custom_n1,   ~r~n" + &
"  ~tctx_basic_info.custom_n2,        ~r~n" + &
"  ~tctx_basic_info.custom_n3,        ~r~n" + &
"  ~tctx_basic_info.custom_n4,        ~r~n" + &
"  ~tctx_basic_info.custom_n5,        ~r~n" + &
"  ~tctx_basic_info.custom_n6,    ~r~n" + &
"  ~tctx_basic_info.custom_n7,     ~r~n" + &
"  ~tctx_basic_info.custom_n8,        ~r~n" + &
"  ~tctx_basic_info.custom_n9,     ~r~n" + &
"  ~tctx_basic_info.custom_n10,        ~r~n" + &
"  ~tctx_basic_info.custom_n11,        ~r~n" + &
"  ~tctx_basic_info.custom_n12,        ~r~n" + &
"  ~tctx_basic_info.custom_n13,        ~r~n" + &
"  ~tctx_basic_info.custom_n14,        ~r~n" + &
"  ~tctx_basic_info.custom_n15,        ~r~n" + &
"  ~tctx_basic_info.custom_n16,        ~r~n" + &
"  ~tctx_basic_info.custom_n17,        ~r~n" + &
"  ~tctx_basic_info.custom_n18,        ~r~n" + &
"  ~tctx_basic_info.custom_n19,        ~r~n" + &
"  ~tctx_basic_info.custom_n20,        ~r~n" + &
"  ~tctx_basic_info.custom_n21,        ~r~n" + &
"  ~tctx_basic_info.custom_n22,        ~r~n" + &
"  ~tctx_basic_info.custom_n23,        ~r~n" + &
"  ~tctx_basic_info.custom_n24,        ~r~n" + &
"  ~tctx_basic_info.custom_n25,        ~r~n" + &
"  ~tctx_basic_info.version_number,    ~r~n" + &
"  ~tctx_basic_info.version_date,       ~r~n" + &
"  ~tctx_basic_info.master_contract_name ,  ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_1 ,  ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_2 ,  ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_3 ,  ~r~n" + &
"  ~t'F' access  ,  ~r~n" + &
"  ~tcode_lookup2.code status_name,  ~r~n" + &
"  ~tcode_lookup3.code category_name,  ~r~n" + &
"  ~tcode_lookup4.code contract_type_name,  ~r~n" + &
"  ~tcode_lookup5.code dvision_name ,  ~r~n" + &
"  ~tunread_email_cnt = 0,   ~r~n" + &
"  ~tctx_basic_info.custom_percent_1,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_2,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_3,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_4,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_5,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_6,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_7,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_8,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_9,  ~r~n" + &
"  ~tctx_basic_info.custom_percent_10,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n1,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n2,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n3,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n4,  ~r~n" + &
"  ~tctx_basic_info.work_flow_n5,  ~r~n" + &
"  ~tctx_basic_info.custom_status1,  ~r~n" + &
"  ~tctx_basic_info.custom_status2,  ~r~n" + &
"  ~tctx_basic_info.custom_21,  ~r~n" + &
"  ~tctx_basic_info.custom_22,  ~r~n" + &
"  ~tctx_basic_info.custom_n26,  ~r~n" + &
"  ~tctx_basic_info.custom_n27,  ~r~n" + &
"  ~tctx_basic_info.custom_date16,  ~r~n" + &
"  ~tctx_basic_info.custom_date17,  ~r~n" + &
"  ~tapp_facility.city,  ~r~n" + &
"  ~tapp_facility.state,  ~r~n" + &
"  ~tapp_facility.country,  ~r~n" + &
"  ~tapp_facility.zip,  ~r~n" + &
"  ~tapp_facility.street,  ~r~n" + &
"  ~tctx_custom.custom_1 as custom2_custom_1,    ~r~n" + &
"      ctx_custom.custom_2 as custom2_custom_2,    ~r~n" + &
"      ctx_custom.custom_3 as custom2_custom_3,    ~r~n" + &
"      ctx_custom.custom_4 as custom2_custom_4,    ~r~n" + &
"      ctx_custom.custom_5 as custom2_custom_5,    ~r~n" + &
"      ctx_custom.custom_6 as custom2_custom_6,     ~r~n" + &
"      ctx_custom.custom_7 as custom2_custom_7,     ~r~n" + &
"      ctx_custom.custom_8 as custom2_custom_8,     ~r~n" + &
"      ctx_custom.custom_9 as custom2_custom_9,     ~r~n" + &
"      ctx_custom.custom_10 as custom2_custom_10,     ~r~n" + &
"      ctx_custom.custom_11 as custom2_custom_11,     ~r~n" + &
"     ctx_custom.custom_12 as custom2_custom_12,     ~r~n" + &
"      ctx_custom.custom_13 as custom2_custom_13,     ~r~n" + &
"      ctx_custom.custom_14 as custom2_custom_14,     ~r~n" + &
"      ctx_custom.custom_15 as custom2_custom_15,     ~r~n" + &
"      ctx_custom.custom_16 as custom2_custom_16,     ~r~n" + &
"      ctx_custom.custom_17 as custom2_custom_17,     ~r~n" + &
"      ctx_custom.custom_18 as custom2_custom_18,     ~r~n" + &
"      ctx_custom.custom_19 as custom2_custom_19,     ~r~n" + &
"      ctx_custom.custom_20 as custom2_custom_20,     ~r~n" + &
"      ctx_custom.custom_date1 as custom2_custom_date1,     ~r~n" + &
"    ctx_custom.custom_date2 as custom2_custom_date2,     ~r~n" + &
"     ctx_custom.custom_date3 as custom2_custom_date3,     ~r~n" + &
"     ctx_custom.custom_date4 as custom2_custom_date4,     ~r~n" + &
"      ctx_custom.custom_date5 as custom2_custom_date5,     ~r~n" + &
"      ctx_custom.custom_date6 as custom2_custom_date6,     ~r~n" + &
"      ctx_custom.custom_date7 as custom2_custom_date7,     ~r~n" + &
"      ctx_custom.custom_date8 as custom2_custom_date8,     ~r~n" + &
"      ctx_custom.custom_date9 as custom2_custom_date9,     ~r~n" + &
"      ctx_custom.custom_date10 as custom2_custom_date10,     ~r~n" + &
"      ctx_custom.custom_date11 as custom2_custom_date11,     ~r~n" + &
"      ctx_custom.custom_date12 as custom2_custom_date12,     ~r~n" + &
"      ctx_custom.custom_date13 as custom2_custom_date13,     ~r~n" + &
"      ctx_custom.custom_date14 as custom2_custom_date14,     ~r~n" + &
"      ctx_custom.custom_date15 as custom2_custom_date15,     ~r~n" + &
"      ctx_custom.custom_n1 as custom2_custom_n1,     ~r~n" + &
"      ctx_custom.custom_n2 as custom2_custom_n2,     ~r~n" + &
"      ctx_custom.custom_n3 as custom2_custom_n3,     ~r~n" + &
"      ctx_custom.custom_n4 as custom2_custom_n4,     ~r~n" + &
"      ctx_custom.custom_n5 as custom2_custom_n5,     ~r~n" + &
"      ctx_custom.custom_n6 as custom2_custom_n6,     ~r~n" + &
"      ctx_custom.custom_n7 as custom2_custom_n7,     ~r~n" + &
"      ctx_custom.custom_n8 as custom2_custom_n8,     ~r~n" + &
"      ctx_custom.custom_n9 as custom2_custom_n9,     ~r~n" + &
"      ctx_custom.custom_n10 as custom2_custom_n10,     ~r~n" + &
"      ctx_custom.custom_n11 as custom2_custom_n11,     ~r~n" + &
"      ctx_custom.custom_n12 as custom2_custom_n12,     ~r~n" + &
"      ctx_custom.custom_n13 as custom2_custom_n13,     ~r~n" + &
"     ctx_custom.custom_n14 as custom2_custom_n14,     ~r~n" + &
"      ctx_custom.custom_n15 as custom2_custom_n15,     ~r~n" + &
"      ctx_custom.custom_n16 as custom2_custom_n16,    ~r~n" + &
"      ctx_custom.custom_n17 as custom2_custom_n17,     ~r~n" + &
"      ctx_custom.custom_n18 as custom2_custom_n18,     ~r~n" + &
"      ctx_custom.custom_n19 as custom2_custom_n19,     ~r~n" + &
"      ctx_custom.custom_n20 as custom2_custom_n20,     ~r~n" + &
"      ctx_custom.custom_n21 as custom2_custom_n21,     ~r~n" + &
"      ctx_custom.custom_n22 as custom2_custom_n22,     ~r~n" + &
"      ctx_custom.custom_n23 as custom2_custom_n23,     ~r~n" + &
"      ctx_custom.custom_n24 as custom2_custom_n24,     ~r~n" + &
"      ctx_custom.custom_n25 as custom2_custom_n25,     ~r~n" + &
"      ctx_custom.custom_21 as custom2_custom_21,     ~r~n" + &
"      ctx_custom.custom_22 as custom2_custom_22,     ~r~n" + &
"      ctx_custom.custom_notes_1 as custom2_custom_notes_1,    ~r~n" + &
"      ctx_custom.custom_notes_2 as custom2_custom_notes_2,     ~r~n" + &
"      ctx_custom.custom_notes_3 as custom2_custom_notes_3,     ~r~n" + &
"      ctx_custom.custom_notes_4 as custom2_custom_notes_4,     ~r~n" + &
"      ctx_custom.custom_notes_5 as custom2_custom_notes_5,     ~r~n" + &
"      ctx_custom.custom_money_1 as custom2_custom_money_1,     ~r~n" + &
"      ctx_custom.custom_money_2 as custom2_custom_money_2,     ~r~n" + &
"      ctx_custom.custom_money_3 as custom2_custom_money_3,     ~r~n" + &
"      ctx_custom.custom_percent_1 as custom2_custom_percent_1,     ~r~n" + &
"      ctx_custom.custom_percent_2 as custom2_custom_percent_2,     ~r~n" + &
"      ctx_custom.custom_percent_3 as custom2_custom_percent_3,     ~r~n" + &
"      ctx_custom.custom_percent_4 as custom2_custom_percent_4,     ~r~n" + &
"      ctx_custom.custom_percent_5 as custom2_custom_percent_5,     ~r~n" + &
"      ctx_custom.custom_percent_6 as custom2_custom_percent_6,     ~r~n" + &
"      ctx_custom.custom_percent_7 as custom2_custom_percent_7,     ~r~n" + &
"      ctx_custom.custom_percent_8 as custom2_custom_percent_8,     ~r~n" + &
"      ctx_custom.custom_percent_9 as custom2_custom_percent_9,     ~r~n" + &
"      ctx_custom.custom_percent_10 as custom2_custom_percent_10,    ~r~n" + &
"      has_docs = Isnull(ctx_am_documents.has_docs,0),  ~r~n" + &
"     ctx_basic_info.contract_department,  ~r~n" + &
"     v_ctx_occi2.occi_name, ~r~n" + &
"     v_ctx_ccci2.ccci_name ~r~n" + &
"  ~tFROM  ctx_basic_info  ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_ccci2 ON ctx_basic_info.ctx_id = v_ctx_ccci2.ctx_id~t  ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_occi2 ON ctx_basic_info.ctx_id = v_ctx_occi2.ctx_id ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_products2 ON ctx_basic_info.ctx_id = v_ctx_products2.ctx_id     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code  ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code  ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code  ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code~t ~r~n" + &
"  ~tLEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id    ~r~n" + &
"  ~tLEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id  ~r~n" + &
"  ~tLEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id   ~r~n" + &
"   ~tWHERE ctx_basic_info.is_template = 0   ~r~n" + &
"  ~t~r~n" + &
"  END  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_contract_search_page' ) ~r~n" + &
" Begin ~r~n" + &
"~t Drop Procedure sp_contract_search_page  ~r~n" + &
" End  "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
" CREATE PROCEDURE sp_contract_search_page~r~n" + &
"(~r~n" + &
"@sessionid varchar(50),~r~n" + &
"@user_d varchar(50),~r~n" + &
"@sys_Table varchar(2000),    ~r~n" + &
"@sys_Key varchar(50),        ~r~n" + &
"@sys_Order varchar(2000),   ~r~n" + &
"@sys_PageIndex int=1,        ~r~n" + &
"@sys_PageSize int=100,@refresh varchar(10) ,@ctxid int    ) as~r~n" + &
"~r~n" + &
" ~r~n" + &
"DECLARE @new_where1 VARCHAR(3000)~r~n" + &
"DECLARE @new_where2 VARCHAR(3000)~r~n" + &
"DECLARE @new_order1 VARCHAR(100)~r~n" + &
"DECLARE @new_order2 VARCHAR(100)~r~n" + &
"DECLARE @Sql VARCHAR(MAX)~r~n" + &
"DECLARE @SqlCount NVARCHAR(4000)~r~n" + &
"DECLARE @PCount int    ~r~n" + &
"DECLARE @RCount int    ~r~n" + &
"DECLARE @Top int~r~n" + &
"DECLARE @Where varchar(4000)~r~n" + &
"DECLARE @TreeWhere varchar(4000)~r~n" + &
"DECLARE @table VARCHAR(8000)~r~n" + &
"DECLARE @sort varchar(2000)~r~n" + &
"DECLARE @error varchar(2000)~r~n" + &
"DECLARE @sys_Fields varchar(8000),  @sys_Where varchar(4000)  , @ch varchar(100)~r~n" + &
"DECLARE @TempCount int, @refreshSEC_Contract int, @refreshSEC_User int~r~n" + &
"DECLARE @treeTable table( ctx_id int )~r~n" + &
"~r~n" + &
"set @error = ''~r~n" + &
"~r~n" + &
"If @sys_PageIndex < -2~r~n" + &
"~tset @sys_PageIndex = 1~r~n" + &
"IF @sys_PageSize <1~r~n" + &
"~tset @sys_PageSize = 1~r~n" + &
"~r~n" + &
"select top 1 @TempCount = ctx_id from ctx_basic_info_pagedata~r~n" + &
"~r~n" + &
"IF (@refresh = '1' ) or @TempCount is null ~r~n" + &
"BEGIN~r~n" + &
"~tselect @refreshSEC_User = isnull(datediff(ss, max(isnull(modifydate_contract, '1900-01-01') ),getdate()),2) from ctx_basic_info_log  where user_id = @user_d~r~n" + &
"~tselect @refreshSEC_Contract = isnull(datediff(ss, max(isnull( modifydate_permission, '1900-01-01' )),getdate()),2) from ctx_basic_info_log ~r~n" + &
"~tif( @refreshSEC_User > 1 or @refreshSEC_User = 0 )~r~n" + &
"~t~tbegin~r~n" + &
"~t~t~texec sp_contract_user_permission @user_d~r~n" + &
"~t~t~tupdate ctx_basic_info_log set modifydate_permission = getdate() where session_id = @sessionid~t~r~n" + &
"~t~tend~r~n" + &
"~t ~r~n" + &
"~tif( @refreshSEC_Contract > 1 or @refreshSEC_Contract = 0 )~r~n" + &
"~t~tbegin~r~n" + &
"~t~t~texec sp_contract_rowset @user_d~r~n" + &
"~t~t~tupdate ctx_basic_info_log set modifydate_contract = getdate() where session_id = @sessionid~t~t~r~n" + &
"~t~tend~r~n" + &
"~t~t~t~r~n" + &
"END~r~n" + &
"~r~n" + &
"~tselect @where = ( case when @sys_PageIndex=-2 then  treewhere else sqlwhere end ), @sort = sqlsort  from ctx_basic_info_log  where session_id = @sessionid~r~n" + &
"~r~n" + &
"IF len(@where) > 0~r~n" + &
"~tbegin~r~n" + &
"~t~tset @TreeWhere  = @where~r~n" + &
"~t~tset @where = REPLACE( @where, 'ctx_id', 'a.ctx_id') ~r~n" + &
"~t~tset @where = ' and ' + @where~r~n" + &
"~tend ~r~n" + &
"ELSE~r~n" + &
"~tset @where = ''~r~n" + &
"~r~n" + &
"IF Len(@sort) >0~r~n" + &
"~tBEGIN~r~n" + &
"~t~tset @sort = REPLACE( @sort, 'ctx_id', 'a.ctx_id') ~r~n" + &
"~tEND~r~n" + &
"ELSE~r~n" + &
"~tset @sort = ''~r~n" + &
"~r~n" + &
"IF  @ctxid >0~r~n" + &
"~tBEGIN~r~n" + &
"~t set @SqlCount = N'select @sys_PageIndex = ceiling((n +0.0) / ' + convert(varchar(20),@sys_PageSize) + ') from ('+~r~n" + &
"~t   'select   row_number() OVER (ORDER BY master_contract_id  , ctx_id  ) n,  ctx_id  from ' +~r~n" + &
"~t   '(select a.*,b.access as access2  from ctx_basic_info_pagedata a inner join ctx_basic_info_users b on a.ctx_id=b.ctx_id' +~r~n" + &
"~t  ' where b.user_id=''' + @user_d  +''' '+ @where +  ')t1' + '  )tab  where ctx_id = ' +convert(varchar(20), @ctxid )~r~n" + &
"~r~n" + &
"~t    EXEC SP_EXECUTESQL @SqlCount,N'@sys_PageIndex INT OUTPUT', @sys_PageIndex OUTPUT ~r~n" + &
"~t    if @sys_PageIndex <=0 ~r~n" + &
"~tset @error = 'ctx_id=' + convert(varchar(10),@ctxid) + ' do not found.' ~r~n" + &
"~t END~r~n" + &
"~r~n" + &
"~r~n" + &
"IF @sys_PageIndex = -1 ~r~n" + &
"~tBegin~r~n" + &
"~t~tset @table = '(select ctx_id, access from ctx_basic_info_pagedata where 1=1 ' + @where +  ')'~r~n" + &
"~tEND~r~n" + &
"ELSE~r~n" + &
"~tBegin~r~n" + &
"~t~tset @table = '(select a.*,b.access as access2  from ctx_basic_info_pagedata a inner join ctx_basic_info_users b on a.ctx_id=b.ctx_id' +~r~n" + &
"~t~t' where b.user_id=''' + @user_d  +''' '+ @where +  ')'~r~n" + &
"~tEND~r~n" + &
" ~r~n" + &
"IF @sys_PageIndex > -2 ~r~n" + &
"~tBEGIN~r~n" + &
" ~r~n" + &
"~t~tSET @sys_Table = @table~r~n" + &
"~t~tSET @sys_fields = 'ctx_id, access2 as access '~r~n" + &
"~r~n" + &
"~t~tSET @new_where1 = ''~r~n" + &
"~t~tSET @new_where2 = ''~r~n" + &
"~r~n" + &
"~t~tIf Len( @sort ) > 0 ~r~n" + &
"~t~t~tBEGIN~r~n" + &
"~t~t~t~tSET @new_order1 = @sort~r~n" + &
"~t~t~t~tSET @new_order2 = ' ORDER BY ' + @sort~r~n" + &
"~t~t~tEND~r~n" + &
"~t~tELSE~r~n" + &
"~t~t~tBEGIN~r~n" + &
"~t~t~t~tSET @new_order1 = '   master_contract_id  , ctx_id '~r~n" + &
"~t~t~t~tSET @new_order2 = ' ORDER BY master_contract_id, w1.ctx_id'~r~n" + &
"~t~t~tEND~r~n" + &
"~r~n" + &
"~r~n" + &
"~t~tSET @SqlCount = N'SELECT @RCount=COUNT(1),@PCount=CEILING((COUNT(1)+0.0)/'~r~n" + &
"~t~t~t~t~t+ CAST(@sys_PageSize AS NVARCHAR)+') FROM ' + @sys_Table + 't1 ' + @new_where1~r~n" + &
"~r~n" + &
"~t~tEXEC SP_EXECUTESQL @SqlCount,N'@RCount INT OUTPUT,@PCount INT OUTPUT', @RCount OUTPUT,@PCount OUTPUT~r~n" + &
"~r~n" + &
"~r~n" + &
"~t~tIF @sys_PageIndex > CEILING((@RCount+0.0)/@sys_PageSize)    ~r~n" + &
"~t~tBEGIN~r~n" + &
"~t~t~tSET @sys_PageIndex =  CEILING((@RCount+0.0)/@sys_PageSize)~r~n" + &
"~t~tEND~r~n" + &
"~tEND ~r~n" + &
"~r~n" + &
"IF @sys_PageIndex = 1 ~r~n" + &
"~tBEGIN~r~n" + &
"~t~tset @sql = 'SELECT TOP ' + ltrim(STR(@sys_PageSize)) +' '+ @sys_fields +' from ' + @sys_Table + 'w1 ' + @new_where1 + @new_order2~r~n" + &
"~tEND~r~n" + &
"ELSE IF @sys_PageIndex = -1 ~r~n" + &
"~tBegin~r~n" + &
"~t~tset @sql = 'select a.ctx_id, a.access from ctx_basic_info_users a inner join ' + @sys_Table +  'b on a.ctx_id = b.ctx_id where a.user_id=''' + @user_d + '''' ~r~n" + &
"~tEND~r~n" + &
"ELSE IF @sys_PageIndex = -2  ~r~n" + &
"~tBEGIN~r~n" + &
"~t~tset @TreeWhere = @TreeWhere + ','~r~n" + &
"~t~twhile(@TreeWhere <> '' )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tset @ch=left(@TreeWhere, charindex( ',', @treewhere,1 )-1 )~r~n" + &
"~t~t~t~tif( ISNUMERIC( @ch) = 1 )~r~n" + &
"~t~t~t~t   insert @treeTable select ctx_id from dbo.uf_get_contract_tree( @ch, @user_d )~r~n" + &
"~t~t~t~tset @TreeWhere = STUFF( @TreeWhere, 1, CHARINDEX(',',@TreeWhere, 1 ), '' )~r~n" + &
"~t~t~tend~t~r~n" + &
"~t~t~t~r~n" + &
"~tEND~r~n" + &
"ELSE~r~n" + &
"~tBEGIN~r~n" + &
"~t~r~n" + &
"~t~tset @sql = 'SELECT w1.'+ @sys_fields +' from ' + @sys_Table + 'w1 ,'~r~n" + &
"~t~t+ '( ' +~r~n" + &
"~t~t'　SELECT TOP ' + ltrim(STR(@sys_PageSize * @sys_PageIndex )) + ~r~n" + &
"~t~t' row_number() OVER (ORDER BY ' + @new_order1 + ' ) n, ' + @sys_Key + ' FROM ' +  @sys_Table + 't1 '+ @new_where1 + ~r~n" + &
"~t~t' )w2 ~r~n" + &
"~t~tWHERE w1.' + @sys_Key + ' = w2.' + @sys_Key + @new_where2 + ' AND w2.n > ' + ~r~n" + &
"~t~tltrim(STR(@sys_PageSize * ( @sys_PageIndex - 1))) +  @new_order2~r~n" + &
"~tEND~r~n" + &
"IF @sys_PageIndex <> -2~t~r~n" + &
"BEGIN~r~n" + &
"~tif ( select count(1) from ctx_basic_info_log where session_id = @sessionid   ) >0 ~r~n" + &
"~t~tbegin~r~n" + &
"~t~t~tupdate ctx_basic_info_log set  pcount =@PCount,rcount = @RCount, sqlsyntax = @sql, lastdate = getdate(),errorinfo=  @error,cpage = @sys_PageIndex where session_id = @sessionid~r~n" + &
"~t~tend~r~n" + &
"~telse~r~n" + &
"~t~tbegin~r~n" + &
"~t~t~tinsert ~tctx_basic_info_log ( user_id, session_id, pcount, rcount, sqlsyntax , lastdate,errorinfo, cpage ) values( @user_d, @sessionid, @PCount, @RCount, @sql, getdate(),@error,@sys_PageIndex );~r~n" + &
"~t~tend~r~n" + &
"END~r~n" + &
"~r~n" + &
"~r~n" + &
"IF ( @RCount = 0 or @sys_PageIndex = 0 or len(@error ) > 0 )  ~r~n" + &
"~tBEGIN~r~n" + &
"~t~tset @sql = 'SELECT TOP 0 '+ @sys_fields +' from ' + @sys_Table + 'w1 ' + @new_where1 + @new_order2~r~n" + &
"~tEND~r~n" + &
"~r~n" + &
"IF @sys_PageIndex = -2~r~n" + &
"~tselect  a.ctx_id, access from ctx_basic_info_users a inner join (select distinct * from @treeTable) b on a.ctx_id = b.ctx_id~r~n" + &
"~t~t   where user_id= @user_d ~r~n" + &
"ELSE~r~n" + &
"~texec ( @sql )~r~n" + &
""

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_contract_search_web' ) ~r~n" + &
" Begin ~r~n" + &
"~t Drop Procedure sp_contract_search_web  ~r~n" + &
" End   ~r~n" + &
""
is_sql_statements[upperbound(is_sql_statements) + 1] = &
" CREATE  PROCEDURE sp_contract_search_web(  @user_d VARCHAR(50),@refresh varchar(10), @cpage int,@pagesize int, @sessionid varchar(50),@ctxid int )~r~n" + &
"AS    ~r~n" + &
"declare @fields varchar(8000)~r~n" + &
"declare @tables varchar(4000)~r~n" + &
"declare @ctxtable table( ctx_id int,  access varchar(1)  )~r~n" + &
"~r~n" + &
"IF @cpage = -1 and @refresh <> '1'~r~n" + &
"~tinsert into @ctxtable select ctx_id, access from ctx_basic_info_users where user_id = @user_d~r~n" + &
"ELSE~t~r~n" + &
"~tinsert into @ctxtable exec sp_contract_search_page @sessionid, @user_d, @tables,'ctx_id', @fields, @cpage, @pagesize, @refresh, @ctxid~r~n" + &
"~t~t~t~r~n" + &
"~r~n" + &
"select  app_facility,product_code,product_name,effective_date,expriation_date,status,~r~n" + &
"group_multi_loc_id,a.ctx_id,master_contract_id,master_cnt,category,facility_id,~r~n" + &
"contract_type,product_type,reimbursment_menth,file_location,review_date,~r~n" + &
"review_by,term_date,term_reason,last_revis_date,other_date_1,other_date_2,~r~n" + &
"oc_signed_by,oc_title,oc_department,oc_legal_rep,cc_signed_by,cc_title,~r~n" + &
"cc_department,cc_legal_rep,notes,keyword,dvision,custom_1,custom_2,~r~n" + &
"custom_3,custom_4,custom_5,custom_6,custom_7,custom_8,custom_9,custom_10,~r~n" + &
"group_id,revision_reason,record_id,owner,contracted_entity,facility_name,custom_date1,~r~n" + &
"custom_date2,custom_date3,custom_date4,custom_date5,inserted_by_user,inserted_at_date_time,~r~n" + &
"updated_by_user,updated_at_date_time,custom_11,custom_12,custom_13,custom_14,~r~n" + &
"custom_15,custom_16,custom_17,custom_18,custom_19,custom_20,custom_date6,~r~n" + &
"custom_date7,custom_date8,custom_date9,custom_date10,custom_date11,custom_date12,~r~n" + &
"custom_date13,custom_date14,custom_date15,custom_n1,custom_n2,custom_n3,~r~n" + &
"custom_n4,custom_n5,custom_n6,custom_n7,custom_n8,custom_n9,custom_n10,~r~n" + &
"custom_n11,custom_n12,custom_n13,custom_n14,custom_n15,custom_n16,custom_n17,~r~n" + &
"custom_n18,custom_n19,custom_n20,custom_n21,custom_n22,custom_n23,custom_n24,~r~n" + &
"custom_n25,version_number,version_date,master_contract_name,fee_sched_calc_field_1,~r~n" + &
"fee_sched_calc_field_2,fee_sched_calc_field_3,b.access as access,status_name,category_name,~r~n" + &
"contract_type_name,dvision_name,unread_email_cnt,custom_percent_1,custom_percent_2,~r~n" + &
"custom_percent_3,custom_percent_4,custom_percent_5,custom_percent_6,custom_percent_7,~r~n" + &
"custom_percent_8,custom_percent_9,custom_percent_10,work_flow_n1,work_flow_n2,~r~n" + &
"work_flow_n3,work_flow_n4,work_flow_n5,custom_status1,custom_status2,custom_21,~r~n" + &
"custom_22,custom_n26,custom_n27,custom_date16,custom_date17,city,state,~r~n" + &
"country,zip,street,custom2_custom_1,custom2_custom_2,custom2_custom_3,~r~n" + &
"custom2_custom_4,custom2_custom_5,custom2_custom_6,custom2_custom_7,~r~n" + &
"custom2_custom_8,custom2_custom_9,custom2_custom_10,custom2_custom_11,~r~n" + &
"custom2_custom_12,custom2_custom_13,custom2_custom_14,custom2_custom_15,~r~n" + &
"custom2_custom_16,custom2_custom_17,custom2_custom_18,custom2_custom_19,~r~n" + &
"custom2_custom_20,custom2_custom_date1,custom2_custom_date2,custom2_custom_date3,~r~n" + &
"custom2_custom_date4,custom2_custom_date5,custom2_custom_date6,custom2_custom_date7,~r~n" + &
"custom2_custom_date8,custom2_custom_date9,custom2_custom_date10,custom2_custom_date11,~r~n" + &
"custom2_custom_date12,custom2_custom_date13,custom2_custom_date14,custom2_custom_date15,~r~n" + &
"custom2_custom_n1,custom2_custom_n2,custom2_custom_n3,custom2_custom_n4,~r~n" + &
"custom2_custom_n5,custom2_custom_n6,custom2_custom_n7,custom2_custom_n8,~r~n" + &
"custom2_custom_n9,custom2_custom_n10,custom2_custom_n11,custom2_custom_n12,~r~n" + &
"custom2_custom_n13,custom2_custom_n14,custom2_custom_n15,custom2_custom_n16,~r~n" + &
"custom2_custom_n17,custom2_custom_n18,custom2_custom_n19,custom2_custom_n20,~r~n" + &
"custom2_custom_n21,custom2_custom_n22,custom2_custom_n23,custom2_custom_n24,~r~n" + &
"custom2_custom_n25,custom2_custom_21,custom2_custom_22,custom2_custom_notes_1,~r~n" + &
"custom2_custom_notes_2,custom2_custom_notes_3,custom2_custom_notes_4,custom2_custom_notes_5,~r~n" + &
"custom2_custom_money_1,custom2_custom_money_2,custom2_custom_money_3,custom2_custom_percent_1,~r~n" + &
"custom2_custom_percent_2,custom2_custom_percent_3,custom2_custom_percent_4,~r~n" + &
"custom2_custom_percent_5,custom2_custom_percent_6,custom2_custom_percent_7,~r~n" + &
"custom2_custom_percent_8,custom2_custom_percent_9,custom2_custom_percent_10,~r~n" + &
"has_docs,contract_department,occi_name,ccci_name from ctx_basic_info_pagedata a inner join ( select distinct * from @ctxtable ) b on a.ctx_id = b.ctx_id   order by master_contract_id, a.ctx_id"



of_execute_sqls("of_ver150_release_storeprocedure3")


return 1
end function

public function integer of_ver150_release_storeprocedure4 ();//====================================================================
// Function: of_ver150_release_storeprocedure4
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-09-15
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


//Added By Ken.Guo 2015-09-15
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'up_get_alarm_datevalue' ) ~r~n" + &
" Begin ~r~n" + &
"~t Drop Procedure up_get_alarm_datevalue  ~r~n" + &
" End   ~r~n" + &
""
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create procedure up_get_alarm_datevalue~r~n" + &
"~t@ctx_id Int, ~r~n" + &
"~t@doc_id Int, ~r~n" + &
"~t@level_id1 Int, ~r~n" + &
"~t@level_id2 Int ,~r~n" + &
"~t@alm_table varchar(100), ~r~n" + &
"~t@alm_column varchar(100) ~r~n" + &
"AS  ~r~n" + &
"Begin~t ~r~n" + &
"~tDeclare @ldt_date datetime~r~n" + &
"~tDeclare @ls_sql nvarchar(2000)~r~n" + &
"~t~t~r~n" + &
"~tIf  @alm_table = 'ctx_basic_info' or @alm_table = 'ctx_custom' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'select @ldt_date = ' + @alm_column + ' from ' + @alm_table + ' where ctx_id = ' + convert(varchar(20), @ctx_id )  ~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_action_item' or @alm_table = 'ctx_action_items' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'select @ldt_date = ' + @alm_column + ' from ctx_action_items'  + ' where ctx_id = ' + convert(varchar(20), @ctx_id ) +~r~n" + &
"~t~t~t ' and ctx_action_item_id = ' + convert(varchar(20), @level_id1 )~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_am_action_item' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'select @ldt_date = ' + @alm_column + ' from ' + @alm_table + ' where doc_id = ' + convert(varchar(20), @doc_id ) +~r~n" + &
"~t~t~t' and seq_id = ' + convert(varchar(20), @level_id1 )~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_custom_multi_hdr' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'select @ldt_date = ' + @alm_column + ' from ' + @alm_table + ' where ctx_id = ' + convert(varchar(20), @ctx_id ) +~r~n" + &
"~t~t~t' and hdr_id = ' + convert(varchar(20), @level_id1 )~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_custom_multi_detail' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'select @ldt_date = ' + @alm_column + ' from ' + @alm_table + ' where ctx_id = ' + convert(varchar(20), @ctx_id ) +~r~n" + &
"~t~t~t' and hdr_id = ' + convert(varchar(20), @level_id1 ) + ' and detail_id = ' + convert(varchar(20), @level_id2 )~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_fee_sched_nm' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'select @ldt_date = ' + @alm_column + ' from ' + @alm_table + ' where ctx_id = ' + convert(varchar(20), @ctx_id ) +~r~n" + &
"~t~t~t' and fee_sched_nm_id = ' + convert(varchar(20), @level_id1 ) ~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tIf @ls_sql = ''~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'select @ldt_date = ' + @alm_column + ' from ' + @alm_table + ' where ctx_id = ' + convert(varchar(20), @ctx_id )  ~r~n" + &
"~tEnd ~t~t~r~n" + &
"~t~r~n" + &
"~texec sp_executesql   @ls_sql , N'@ldt_date datetime out'  , @ldt_date out~r~n" + &
"~tSelect @ldt_date~r~n" + &
"End "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'up_update_alarm_datevalue' ) ~r~n" + &
" Begin ~r~n" + &
"~t Drop Procedure up_update_alarm_datevalue  ~r~n" + &
" End   ~r~n" + &
""
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create procedure up_update_alarm_datevalue~r~n" + &
"~t@ctx_id Int, ~r~n" + &
"~t@doc_id Int, ~r~n" + &
"~t@level_id1 Int, ~r~n" + &
"~t@level_id2 Int ,~r~n" + &
"~t@alm_table varchar(100), ~r~n" + &
"~t@alm_column varchar(100) ~r~n" + &
"AS  ~r~n" + &
"Begin~t ~r~n" + &
"~tDeclare @ls_sql nvarchar(2000)~r~n" + &
"~t~t~r~n" + &
"~tIf  @alm_table = 'ctx_basic_info' or @alm_table = 'ctx_custom' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'update ctx_notification set ctx_notification.alm_date = '+~r~n" + &
"~t~t~t~t~t~t~t~t'(select ' + @alm_column + ' from ' + @alm_table + ' where '+@alm_table+'.ctx_id = ' + convert(varchar(20), @ctx_id ) + ') ' +~r~n" + &
" ~t~t~t~t~t~t~t~t' where ctx_notification.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ctx_notification.alm_table = ''' + @alm_table + ''' and ctx_notification.alm_column = ''' + @alm_column + ''''~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_action_item' or @alm_table = 'ctx_action_items' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'update ctx_ai_notification set ctx_ai_notification.alm_date = '+~r~n" + &
"~t~t~t~t~t~t~t~t'(select ' + @alm_column + ' from ctx_action_items where ctx_action_items.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ctx_action_items.ctx_action_item_id = ' + + convert(varchar(20), @level_id1 ) + ' ) ' +~r~n" + &
" ~t~t~t~t~t~t~t~t' where ctx_ai_notification.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ctx_ai_notification.alm_table = ''' + @alm_table + ''' and ctx_ai_notification.alm_column = ''' + @alm_column + '''' + ~r~n" + &
"~t~t~t~t~t~t~t~t' and ctx_ai_notification.ctx_action_item_id = ' + convert(varchar(20), @level_id1 ) ~r~n" + &
"~tEnd~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_am_action_item' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'update ctx_am_ai_notification set ctx_am_ai_notification.alm_date = '+~r~n" + &
"~t~t~t~t~t~t~t~t'(select ' + @alm_column + ' from ' + @alm_table + ' where '+@alm_table+'.doc_id = ' + convert(varchar(20), @doc_id ) + ' and ' + @alm_table+'.seq_id = ' + convert(varchar(20), @level_id1 ) +  ') ' +~r~n" + &
" ~t~t~t~t~t~t~t~t' where ctx_am_ai_notification.doc_id = ' + convert(varchar(20), @doc_id ) + ' and ctx_am_ai_notification.alm_table = ''' + @alm_table + ''' and ctx_am_ai_notification.alm_column = ''' + @alm_column + '''' + ~r~n" + &
"~t~t~t~t~t~t~t~t' and ctx_am_ai_notification.seq_id = ' + convert(varchar(20), @level_id1 ) ~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_custom_multi_hdr' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'update ctx_all_notification set ctx_all_notification.alm_date = '+~r~n" + &
"~t~t~t~t~t~t~t~t'(select ' + @alm_column + ' from ' + @alm_table + ' where '+@alm_table+'.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ' + @alm_table+'.hdr_id = ' + convert(varchar(20), @level_id1 ) + ') ' +~r~n" + &
" ~t~t~t~t~t~t~t~t' where ctx_all_notification.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ctx_all_notification.alm_table = ''' + @alm_table + ''' and ctx_all_notification.alm_column = ''' + @alm_column + '''' + ~r~n" + &
"~t~t~t~t~t~t~t~t' and ctx_all_notification.level_id1 = ' + convert(varchar(20), @level_id1 ) ~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_custom_multi_detail' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'update ctx_all_notification set ctx_all_notification.alm_date = '+~r~n" + &
"~t~t~t~t~t~t~t~t'(select ' + @alm_column + ' from ' + @alm_table + ' where '+@alm_table+'.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ' + @alm_table+'.hdr_id = ' + convert(varchar(20), @level_id1 )+ ' and ' + @alm_table+'.detail_id = ' + convert(varchar(20), @level_id2 ) + ') ' +~r~n" + &
" ~t~t~t~t~t~t~t~t' where ctx_all_notification.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ctx_all_notification.alm_table = ''' + @alm_table + ''' and ctx_all_notification.alm_column = ''' + @alm_column + '''' + ~r~n" + &
"~t~t~t~t~t~t~t~t' and ctx_all_notification.level_id1 = ' + convert(varchar(20), @level_id1 ) + ' and ctx_all_notification.level_id2 = ' + convert(varchar(20), @level_id2 ) ~r~n" + &
"~tEnd ~r~n" + &
"~t~r~n" + &
"~tIf  @alm_table = 'ctx_fee_sched_nm' ~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ls_sql  = 'update ctx_all_notification set ctx_all_notification.alm_date = '+~r~n" + &
"~t~t~t~t~t~t~t~t'(select ' + @alm_column + ' from ' + @alm_table + ' where '+@alm_table+'.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ' + @alm_table+'.fee_sched_nm_id = ' + convert(varchar(20), @level_id1 ) + ') ' +~r~n" + &
" ~t~t~t~t~t~t~t~t' where ctx_all_notification.ctx_id = ' + convert(varchar(20), @ctx_id ) + ' and ctx_all_notification.alm_table = ''' + @alm_table + ''' and ctx_all_notification.alm_column = ''' + @alm_column + '''' + ~r~n" + &
"~t~t~t~t~t~t~t~t' and ctx_all_notification.level_id1 = ' + convert(varchar(20), @level_id1 ) ~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tEXEC sp_executesql  @ls_sql~r~n" + &
"~r~n" + &
"End "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'up_update_all_alarms_datevalue' ) ~r~n" + &
" Begin ~r~n" + &
"~t Drop Procedure up_update_all_alarms_datevalue  ~r~n" + &
" End   ~r~n" + &
""
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create procedure up_update_all_alarms_datevalue~r~n" + &
"AS  ~r~n" + &
"Begin~t ~r~n" + &
"~tDeclare @ctx_id int,@doc_id int, @level_id1 int, @level_id2 int,@col varchar(100), @tab varchar(100)~r~n" + &
"~r~n" + &
"~tDeclare cc1 cursor for select ctx_id, alm_table, alm_column from CTX_NOTIFICATION where alm_date is null  ~r~n" + &
"~tOpen cc1~r~n" + &
"~tFetch cc1 into @ctx_id, @tab, @col~r~n" + &
"~tWhile @@FETCH_STATUS = 0 ~r~n" + &
"~tBegin~r~n" + &
"~t~texec up_update_alarm_datevalue @ctx_id,0,0,0,@tab,@col~t~t~r~n" + &
"~t~tfetch cc1 into @ctx_id, @tab, @col~r~n" + &
"~tEnd~r~n" + &
"~tClose cc1~r~n" + &
"~tDeallocate cc1  ~r~n" + &
"~r~n" + &
"~tDeclare cc2 cursor for select  ctx_id, ctx_action_item_id, alm_table, alm_column  from ctx_ai_notification where alm_date is null  ~r~n" + &
"~tOpen cc2~r~n" + &
"~tFetch cc2 into  @ctx_id, @level_id1, @tab, @col~r~n" + &
"~tWhile @@FETCH_STATUS = 0 ~r~n" + &
"~tBegin~r~n" + &
"~t~texec up_update_alarm_datevalue @ctx_id,0,@level_id1,0,@tab,@col~t~t~r~n" + &
"~t~tfetch cc2 into @ctx_id, @level_id1, @tab, @col~r~n" + &
"~tEnd~r~n" + &
"~tClose cc2~r~n" + &
"~tDeallocate cc2~r~n" + &
"~r~n" + &
"~tDeclare cc3 cursor for select  doc_id, seq_id, alm_table, alm_column  from ctx_am_ai_notification where alm_date is null  ~r~n" + &
"~tOpen cc3~r~n" + &
"~tFetch cc3 into  @doc_id, @level_id1, @tab, @col~r~n" + &
"~tWhile @@FETCH_STATUS = 0 ~r~n" + &
"~tBegin~r~n" + &
"~t~texec up_update_alarm_datevalue 0,@doc_id,@level_id1,0,@tab,@col~t~t~r~n" + &
"~t~tfetch cc3 into @doc_id, @level_id1, @tab, @col~r~n" + &
"~tEnd~r~n" + &
"~tClose cc3~r~n" + &
"~tDeallocate cc3~r~n" + &
"~r~n" + &
"~tDeclare cc4 cursor for select  ctx_id, level_id1, level_id2, alm_table, alm_column  from ctx_all_notification where alm_date is null  ~r~n" + &
"~tOpen cc4~r~n" + &
"~tFetch cc4 into  @ctx_id, @level_id1,@level_id2, @tab, @col~r~n" + &
"~tWhile @@FETCH_STATUS = 0 ~r~n" + &
"~tBegin~r~n" + &
"~t~texec up_update_alarm_datevalue @ctx_id,0,@level_id1,@level_id2,@tab,@col~t~t~r~n" + &
"~t~tfetch cc4 into @ctx_id, @level_id1,@level_id2, @tab, @col~r~n" + &
"~tEnd~r~n" + &
"~tClose cc4~r~n" + &
"~tDeallocate cc4~r~n" + &
"~r~n" + &
"End "

of_execute_sqls("of_ver150_release_storeprocedure4")

Return 1
end function

public function integer of_ver150_release_storeprocedure5 ();//====================================================================
// Function: of_ver150_release_storeprocedure5
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Mark Lee		Date: 12/03/2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2015 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//Added By Mark Lee 12/03/2015
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_create_import_data' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure sp_create_import_data~r~n" + &
"End ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create Procedure sp_create_import_data( @id int,@notification_pid int,@notes varchar(8000), @err_msg varchar(8000) output)~r~n" + &
"AS~r~n" + &
"Begin~r~n" + &
"~tDeclare @num tinyint, @error_sum int,@rowid int,@count int~r~n" + &
"~tDeclare @scale int,@table_name varchar(50), @col varchar(100), @col_value varchar(1000),@origin_col_value varchar(1000), @col_type varchar(128)~r~n" + &
"~tDeclare @sql_insert varchar(max),@sql_value varchar(max),@sql_delete varchar(max), @sql_update varchar(max),@sql_where varchar(max),@sql_param nvarchar(max)~r~n" + &
"~tDeclare @table_records_id int, @col_length smallint, @prec smallint, @key_field tinyint, @no_match_procd tinyint, @lu_type char(1), @lu_table varchar(50), @lu_field_name varchar(50)~r~n" + &
"~tDeclare @sys_ctx_id int,@primary_key varchar(1000), @sys_record_id int, @filter_table varchar(100), @sys_id int, @sys_facility_id int, @sys_contact_id int~r~n" + &
"~tDeclare @old_table_name varchar(50), @old_rowid int, @flag varchar(10),@tmp_id int, @salesforce_id varchar(30),@fieldname varchar(50), @owner varchar(1)~r~n" + &
"~tDeclare @contact_id int, @ic_area char(1),@contact_id1 int, @ic_area1 char(1), @table_id int,@seq_no int, @status int,@custom_status1 int,@custom_status2 int~r~n" + &
"~r~n" + &
"~tSet @count = 0~r~n" + &
"~tSelect @count = count(1) from sysobjects where name = '#import_external_tmp_data' and type = 'U';~r~n" + &
"~tIf (@count is not null ) and (@count = 1 ) ~r~n" + &
"~tBegin~r~n" + &
"~t~tDrop TABLE #import_external_tmp_data;~r~n" + &
"~tEnd ~r~n" + &
"~t~t~r~n" + &
"~tSet @num = 1~r~n" + &
"~tBEGIN TRY~r~n" + &
"~t~tselect import_webform_detail.table_records_id,import_webform_detail.table_name, import_webform_detail.rowid,~r~n" + &
"~t~timport_webform_detail.col, import_webform_detail.col_value, aa.col_type,aa.col_length,aa.prec, aa.scale, import_mapping_fields.key_field, ~r~n" + &
"~t~timport_mapping_fields.no_match_procd, import_mapping_fields.lu_type, import_mapping_fields.lu_table, import_mapping_fields.lu_field_name,~r~n" + &
"~t~tspace(1000) as actual_value into #import_external_tmp_data~r~n" + &
"~t~tfrom import_webform_detail ~r~n" + &
"~t~tinner join ~t(select object_name(syscolumns.id) as table_name, syscolumns.name as col_name, syscolumns.length as col_length,systypes.name as col_type, ~r~n" + &
"~t~tsyscolumns.prec as prec, syscolumns.scale as scale from syscolumns , systypes where syscolumns.xtype = systypes.xtype ) aa ~t~t~t~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~tOn import_webform_detail.table_name = aa.table_name and import_webform_detail.col = aa.col_name ~r~n" + &
"~t~tinner join (select import_fields.field_id, import_fields.field_name,import_tables.table_id, import_tables.table_name~r~n" + &
"~t~t~tfrom import_fields, import_tables where import_fields.table_id = import_tables.table_id~tand import_tables.isoft_module = 2 ) bb ~r~n" + &
"~t~t~ton import_webform_detail.table_name = bb.table_name and import_webform_detail.col = bb.field_name~r~n" + &
"~t~tleft join import_mapping_fields on import_mapping_fields.table_records_id = import_webform_detail.table_records_id and import_mapping_fields.isoft_field_id = bb.field_id~r~n" + &
"~t~twhere import_webform_detail.rowid >= 0 and import_webform_detail.main_id = @id and (import_webform_detail.col_value is not null)~r~n" + &
"~t~torder by import_webform_detail.table_records_id,import_webform_detail.rowid, import_webform_detail.col~r~n" + &
"~r~n" + &
"~t~tSet @error_sum = @@ERROR~r~n" + &
"~tEND TRY~r~n" + &
"~tBEGIN CATCH~r~n" + &
"~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~tSelect @err_msg ='('+Convert(varchar,@id)+') '+ 'Position:'+convert(varchar,@num)+'; Error:'+Convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~treturn -1 ~r~n" + &
"~tEND CATCH~r~n" + &
"~tIf @error_sum <> 0 ~r~n" + &
"~tBegin ~r~n" + &
"~t~tSelect @err_msg ='('+Convert(varchar,@id)+') '+ 'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~treturn -1 ~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tSet @count = 0~r~n" + &
"~tSelect @count = count(1) from #import_external_tmp_data;~r~n" + &
"~tif (@count <= 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+ 'Error: No data need to import.'~r~n" + &
"~t~treturn -1 ~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~t/*~tGet the foreign key value */~r~n" + &
"~tSet @sql_where = ''~r~n" + &
"~tSet @filter_table = ''~r~n" + &
"~tSet @contact_id = 0~r~n" + &
"~tSet @contact_id1 = 0~r~n" + &
"~tSet @ic_area=''~r~n" + &
"~tSet @ic_area1=''~r~n" + &
"~tSet @sys_ctx_id = 0~r~n" + &
"~tSet @sys_id = 0~r~n" + &
"~tSet @sys_facility_id = 0~r~n" + &
"~tSelect @sql_where = @sql_where +' [' + ab.table_name + ']' from (select distinct table_name from #import_external_tmp_data) ab ;~r~n" + &
"~tif (charindex('[ctx_basic_info]',@sql_where) > 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @filter_table = 'ctx_contract_contacts'~r~n" + &
"~t~tif (charindex('[ctx_contract_contacts]',@sql_where) > 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @contact_id =col_value from #import_external_tmp_data where table_name = 'ctx_contract_contacts' and col ='contact_id' and rowid =0~r~n" + &
"~t~t~tSelect @ic_area = col_value from #import_external_tmp_data where table_name = 'ctx_contract_contacts' and col ='ic_area' and rowid =0~r~n" + &
"~t~t~tSelect @contact_id1 =col_value from #import_external_tmp_data where table_name = 'ctx_contract_contacts' and col ='contact_id' and rowid =1~r~n" + &
"~t~t~tSelect @ic_area1 = col_value from #import_external_tmp_data where table_name = 'ctx_contract_contacts' and col ='ic_area' and rowid =1~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~t~r~n" + &
"~t/*~tupdate the column of actual value */~r~n" + &
"~tSet @num = 2~r~n" + &
"~tSet @sql_update =''~r~n" + &
"~tUpdate #import_external_tmp_data~r~n" + &
"~tSet actual_value = col_value~r~n" + &
"~tWhere lu_type is null or ltrim(rtrim(lu_type)) = '' ;~r~n" + &
"~tSet @error_sum = @@ERROR~r~n" + &
"~tIf @error_sum <> 0 ~r~n" + &
"~tBegin ~r~n" + &
"~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+ 'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~treturn -1  ~r~n" + &
"~tEnd ~r~n" + &
"~r~n" + &
"~tDeclare update_import_data_cursor Cursor For~r~n" + &
"~tselect table_records_id,table_name,rowid,col,col_value,col_type,col_length,prec,scale,key_field,no_match_procd,lu_type,lu_table,lu_field_name~r~n" + &
"~tfrom #import_external_tmp_data Where   table_name <> @filter_table ~r~n" + &
"~torder by table_records_id,rowid, col~r~n" + &
"~tOpen update_import_data_cursor~r~n" + &
"~tFetch Next From update_import_data_cursor Into @table_records_id,@table_name,@rowid,@col,@col_value,@col_type,@col_length,@prec,@scale,@key_field,@no_match_procd,@lu_type,@lu_table,@lu_field_name~r~n" + &
"~tWhile @@FETCH_STATUS = 0~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @count = 0 ~r~n" + &
"~t~tSet @tmp_id = 0~r~n" + &
"~t~tSet @sql_param = ''~t~r~n" + &
"~t~tif (@lu_type is not null and datalength(ltrim(rtrim(@lu_type))) > 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @num = 3~t~r~n" + &
"~t~t~tSelect @sql_param =  Case @lu_type ~tWhen 'A' then N'Select top 1 @tmp_id = lookup_code From address_lookup Where '+ @lu_field_name + N' =''' +@col_value+ N''' and lookup_name =''' + @lu_table+ N'''' ~t~t~r~n" + &
"~t~t~t~tWhen 'C' then N'Select top 1 @tmp_id = lookup_code From code_lookup Where '+ @lu_field_name + N' =''' +@col_value+ N''' and lookup_name =''' + @lu_table+ N'''' ~t~r~n" + &
"~t~t~t~tWhen 'F' then N'Select top 1 @tmp_id = facility_id From facility Where '+ @lu_field_name + N' =''' +@col_value+ N''' ' ~t~t~t~r~n" + &
"~t~t~t~tWhen 'M' then N'Select top 1 @tmp_id = committee_id From committee_lookup Where '+ @lu_field_name + N' =''' +@col_value+ N''' ' ~r~n" + &
"~t~t~t~tWhen 'I' then N'Select top 1 @tmp_id = facility_id From app_facility Where '+ @lu_field_name + N' =''' +@col_value+ N''' ' ~r~n" + &
"~t~t~t~tWhen 'J' then N'Select top 1 @tmp_id = ctx_id From ctx_basic_info Where '+ @lu_field_name + N' =''' +@col_value+ N''' '~tEnd~r~n" + &
"~t~t~tEXEC SP_EXECUTESQL @sql_param, N'@tmp_id int output',@tmp_id OUTPUT~r~n" + &
"~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~tBegin ~r~n" + &
"~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+ 'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~treturn -1 ~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~t~tif (@tmp_id is null or @tmp_id = 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (@no_match_procd is not null and @no_match_procd = 1 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*~tadd lookup table value */~r~n" + &
"~t~t~t~t~tSet @tmp_id =0~r~n" + &
"~t~t~t~t~tif (@lu_type='A')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @num = 4~t~r~n" + &
"~t~t~t~t~t~tSELECT @tmp_id = isnull(ids.lookup_code_id,0)  ~tFROM ids ;~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tUPDATE ids~tSET lookup_code_id =( isnull ( lookup_code_id , 0 ) + 1 ) Where lookup_code_id = @tmp_id ;~r~n" + &
"~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+ 'Position:'+convert(varchar,@num)+'; Invalid lookup_code_id ('+convert(varchar,@tmp_id)+').'~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t~t~t~t~tSet @num = 5~r~n" + &
"~t~t~t~t~t~tInsert Into address_lookup(lookup_code,lookup_name,code,entity_name) Values(@tmp_id+1,left(@lu_table,20),left(@col_value,15),left(@col_value,100)) ;~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+ 'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1 ~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~tSet @col_value =  convert(varchar,@tmp_id+ 1)~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif (@lu_type='C')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @num = 6~r~n" + &
"~t~t~t~t~t~tSELECT @tmp_id = isnull(ids.lookup_code_id,0)  ~tFROM ids ;~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tUPDATE ids~tSET lookup_code_id =( isnull ( lookup_code_id , 0 ) + 1 ) Where lookup_code_id = @tmp_id ;~r~n" + &
"~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+ 'Position:'+convert(varchar,@num)+'; Invalid lookup_code_id ('+convert(varchar,@tmp_id)+').'~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t~t~t~t~tSet @num = 7~r~n" + &
"~t~t~t~t~t~tInsert Into code_lookup(lookup_code,lookup_name,code,description) Values(@tmp_id+1,left(@lu_table,35),left(@col_value,30),left(@col_value,75)) ;~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1 ~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~tSet @col_value =  convert(varchar,@tmp_id+ 1)~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif (@lu_type='F')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @num = 8~r~n" + &
"~t~t~t~t~t~tSELECT @tmp_id = isnull(ids.facility_id,0)  ~tFROM ids ;~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tUPDATE ids~tSET facility_id =( isnull ( facility_id , 0 ) + 1 ) Where facility_id = @tmp_id ;~r~n" + &
"~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid facility_id ('+convert(varchar,@tmp_id)+').'~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t~t~t~t~tSet @num = 9~r~n" + &
"~t~t~t~t~t~tInsert Into facility(facility_id,facility_name) Values(@tmp_id+1,left(@col_value,100)) ;~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~tSet @col_value =  convert(varchar,@tmp_id+ 1)~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif (@lu_type='M')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @num = 10~r~n" + &
"~t~t~t~t~t~tSELECT @tmp_id = isnull(ids.committee_id,0)  ~tFROM ids ;~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tUPDATE ids~tSET committee_id =( isnull ( committee_id , 0 ) + 1 ) Where committee_id = @tmp_id ;~r~n" + &
"~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid committee_id ('+convert(varchar,@tmp_id)+').'~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t~t~t~t~tSet @num = 11~r~n" + &
"~t~t~t~t~t~tInsert Into committee_lookup(committee_id,committee_name,facility_id) Values(@tmp_id+1,left(@col_value,50), 1) ;~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tSet @col_value =  convert(varchar,@tmp_id+ 1)~t~t~t~t~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif (@lu_type='I')~r~n" + &
"~t~t~t~t~tBegin~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tif (lower(@lu_field_name) <> 'facility_name')~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @err_msg = '('+Convert(varchar,@id)+') '+'Error: When the value for Lu Type is ''company'' and the Lu field value is not ''company name'', the system will ignore ''no match procd'' option. If the imported value does not match any value in company lookup, it will be written to the error log.'~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @num = 12~r~n" + &
"~t~t~t~t~t~t~tSELECT @tmp_id = max(facility_id) FROM app_facility;~t~r~n" + &
"~t~t~t~t~t~t~tInsert Into app_facility(facility_id,facility_name,contact_type2,corp_office_flag) Values(@tmp_id+1,left(@col_value,150),'B',0) ;~r~n" + &
"~t~t~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~tSet @col_value =  convert(varchar,@tmp_id+ 1)~t~t~t~t~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif (@lu_type='J')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @err_msg = '('+Convert(varchar,@id)+') '+'Error: no match '+@col_value+ ' in the '+@table_name+'.ctx_id column.'~r~n" + &
"~t~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t~t~tSet @num = 13~r~n" + &
"~t~t~t~t~tEXEC SP_EXECUTESQL @sql_param, N'@tmp_id int output',@tmp_id OUTPUT~r~n" + &
"~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @err_msg = '('+Convert(varchar,@id)+') '+'Error: no match '+@col_value+ ' in the '+@table_name+'.'+@col+' column.'~r~n" + &
"~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @col_value =  convert(varchar,@tmp_id)~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@col_type ='datetime' or @col_type ='smalldatetime')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (isdate(@col_value) = 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @err_msg = '('+Convert(varchar,@id)+') '+'Error: this value ('+@col_value+') is not of the valid data type ('+ @col_type +') for this column ('+@table_name+'.'+@col+'). Please correct the import data.'~r~n" + &
"~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~telse if(@col_type ='int' or @col_type ='integer' or @col_type ='real' or @col_type ='float' or @col_type ='smallint'or @col_type ='tinyint'or @col_type ='bigint'or @col_type ='money'or @col_type ='smallmoney' or @col_type ='numeric' or @col_type ='decimal')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif (isnumeric(@col_value) = 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @err_msg = '('+Convert(varchar,@id)+') '+'Error: this value ('+@col_value+ ') is not of the valid data type ('+ @col_type +') for this column ('+@table_name+'.'+@col+'). Please correct the import data or if the field is a lookup type please set it as Lookup in the Import Painter.'~r~n" + &
"~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~t~t~t~r~n" + &
"~t~t~telse if (@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tif(DATALENGTH(@col_value) > @col_length)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @err_msg = '('+Convert(varchar,@id)+') '+'Error: the length of this value('+@col_value+ ') exceeds the defined length ('+convert(varchar,@col_length)+') for this column ('+@table_name+'.'+@col+'). Please correct the import data.'~r~n" + &
"~t~t~t~t~tClose update_import_data_cursor~r~n" + &
"~t~t~t~t~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~t~t~r~n" + &
"~t~tif(@col_type ='datetime' or @col_type ='smalldatetime')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @col_value = ' convert(datetime,''' + convert(varchar,@col_value,101)+ ''') '~t~t~t~t~t~t~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse if (@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~t~tSet @col_value = REPLACE(@col_value,char(39),char(39)+char(39))~t~t~r~n" + &
"~t~t~tSelect @col_value = ' ''' +@col_value+''' ' ~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~t~t~t~r~n" + &
"~t~tSelect @sql_update = @sql_update + ' Update #import_external_tmp_data Set actual_value ='+@col_value+' where table_records_id='+convert(varchar,@table_records_id)+~r~n" + &
"~t~t~t' and table_name ='''+@table_name+''' and rowid='+convert(varchar,@rowid)+' and col='''+@col+''' ;'~r~n" + &
"~t~tFetch Next From update_import_data_cursor Into @table_records_id,@table_name,@rowid,@col,@col_value,@col_type,@col_length,@prec,@scale,@key_field,@no_match_procd,@lu_type,@lu_table,@lu_field_name~r~n" + &
"~tEnd~r~n" + &
"~tClose update_import_data_cursor~r~n" + &
"~tDEALLOCATE update_import_data_cursor~r~n" + &
"~t~r~n" + &
"~tif (ltrim(rtrim(@sql_update))  <> '')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @num = 14  ~r~n" + &
"~t~tBEGIN TRY~r~n" + &
"~t~t~texecute(@sql_update)~r~n" + &
"~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~tEND TRY~r~n" + &
"~t~tBEGIN CATCH~r~n" + &
"~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~treturn -1~r~n" + &
"~t~tEND CATCH~r~n" + &
"~t~tIf @error_sum <> 0 ~r~n" + &
"~t~tBegin ~r~n" + &
"~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~treturn -1~r~n" + &
"~t~tEnd ~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tSet @old_rowid = 0~r~n" + &
"~tSet @old_table_name = ''~r~n" + &
"~tSet @sql_insert = ''~r~n" + &
"~tSet @sql_value =''~r~n" + &
"~tSet @sql_update = ''~r~n" + &
"~tSet @sql_where = ''~r~n" + &
"~tSet @sql_delete =''~r~n" + &
"~tSet @flag = ''~r~n" + &
"~tSet @status = 0~r~n" + &
"~tSet @custom_status1 = 0~r~n" + &
"~tSet @custom_status2 = 0~r~n" + &
"~tSet @sys_record_id = 0~r~n" + &
"~tSet @sys_contact_id = 0~r~n" + &
"~tSet @fieldname =''~r~n" + &
"~tSet @origin_col_value =''~r~n" + &
"~tSet @seq_no = 0~r~n" + &
"~tSet @num = 15~r~n" + &
"~tDeclare external_import_cursor Cursor For~r~n" + &
"~tselect table_records_id,table_name,rowid,col,actual_value,col_type,col_length,prec,scale,key_field,no_match_procd,lu_type,lu_table,lu_field_name~r~n" + &
"~tfrom #import_external_tmp_data Where table_name <> @filter_table ~r~n" + &
"~torder by table_records_id,rowid, col~r~n" + &
"~tOpen external_import_cursor~r~n" + &
"~tFetch Next From external_import_cursor Into @table_records_id,@table_name,@rowid,@col,@col_value,@col_type,@col_length,@prec,@scale,@key_field,@no_match_procd,@lu_type,@lu_table,@lu_field_name~r~n" + &
"~tWHILE @@FETCH_STATUS = 0~r~n" + &
"~tBegin~r~n" + &
"~t~t/* convert the single quotes in the values. */~r~n" + &
"~t~tSet @col_value = REPLACE(@col_value,char(39),char(39)+char(39))~t~r~n" + &
"~t~tSet @origin_col_value = @col_value~r~n" + &
"~t~tSet @count = 0 ~t~t~r~n" + &
"~t~tif(@col_type ='datetime' or @col_type ='smalldatetime')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (@col_value is not null)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSelect @col_value = ' convert(datetime,''' + convert(varchar,@col_value,101)+ ''') '~t~t~t~t~t~t~r~n" + &
"~t~t~t~tSet @count = 1~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse if(@col_type ='int' or @col_type ='integer' or @col_type ='real' or @col_type ='float' or @col_type ='smallint'or @col_type ='tinyint' or @col_type ='numeric')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (@col_value is not null)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~t/* Select @col_value =  convert(varchar,@col_value) */~r~n" + &
"~t~t~t~tSet @count = 1~r~n" + &
"~t~t~tEnd ~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse if (@col_type ='char' or @col_type ='varchar' or @col_type ='nchar' or @col_type ='nvarchar' ) ~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (@col_value is not null)~r~n" + &
"~t~t~tBegin~t~r~n" + &
"~t~t~t~tSelect @col_value = ' ''' +@col_value+''' ' ~r~n" + &
"~t~t~t~tSet @count = 1~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~telse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (@col_value is not null)~r~n" + &
"~t~t~tBegin~t~r~n" + &
"~t~t~t~tSelect @col_value =  ' ''' +@col_value+''' ' ~r~n" + &
"~t~t~t~tSet @count = 1~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tIf ( @count = 1)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif (@old_table_name <> @table_name or @old_rowid <>  @rowid )~r~n" + &
"~t~t~tBegin ~t~t~t~t~t~r~n" + &
"~t~t~t~tif (Datalength(@sql_update) > 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (right(@sql_update,1)=',')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_where = replace(@sql_where,'top 1','')~r~n" + &
"~t~t~t~t~t~tSet @sql_update = left(@sql_update,datalength(@sql_update) -1 ) + ' where '+ @sql_where + ' ;'~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSet @sql_where = ''~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tif (Datalength(@sql_insert) > 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif (right(@sql_insert,1)=',')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @sql_insert = left(@sql_insert,len(@sql_insert) - 1)+ ') ' + left(@sql_value,len(@sql_value ) -1 ) + ') ;'~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSet @sql_value = ''~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~t~r~n" + &
"~t~t~t~tif (lower(@old_table_name) ='ctx_contacts' and lower(@table_name) = 'ctx_contacts_numbers')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @table_id = 10004~r~n" + &
"~t~t~t~t~tif (@seq_no = 0)~t~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id =-9999 ;~t~t~t~t~r~n" + &
"~t~t~t~t~tend ~t~t~t~r~n" + &
"~t~t~t~t~tSet @seq_no = @seq_no + 1~t~r~n" + &
"~t~t~t~t~tif (@flag = 'insert')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,facility_id,tfield_name,tfield_name_allias,sql_syntax )'+~r~n" + &
"~t~t~t~t~t~t~t~t' VALUES('+convert(varchar,@sys_id)+', -9999,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+',0 ,'''',''INSERT'',''salesforce user'',getdate(),0,''I'','+convert(varchar,@notification_pid)+','+convert(varchar,@sys_facility_id)+','''+@fieldname+''','''+@fieldname+''','''+left(replace(@sql_insert,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @sql_update = @sql_update + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,facility_id,tfield_name,tfield_name_allias,sql_syntax )' +~r~n" + &
"~t~t~t~t~t~t~t~t' VALUES('+convert(varchar,@sys_id)+', -9999,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+',0 ,'''',''UPDATE'',''salesforce user'',getdate(),0,''I'','+convert(varchar,@notification_pid)+','+convert(varchar,@sys_facility_id)+','''+@fieldname+''','''+@fieldname+''','''+left(replace(@sql_update,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit where rec_id ='+convert(varchar,@sys_id)+' and field_id = -9999 and seq_no = '+convert(varchar,@seq_no) + ' ;'~t~t~t~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t~tSet @old_table_name = @table_name~r~n" + &
"~t~t~t~tSet @old_rowid = @rowid~r~n" + &
"~t~t~t~tSet @sql_param = ''~t~t~t~t~r~n" + &
"~t~t~t~tSet @tmp_id = 0~r~n" + &
"~t~t~t~tSet @primary_key = ''~r~n" + &
"~r~n" + &
"~t~t~t~tif (lower(@table_name) <> 'ctx_contacts_numbers')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @num = 16~r~n" + &
"~t~t~t~t~tSelect @salesforce_id = CONVERT(varchar(30),actual_value) from #import_external_tmp_data ~r~n" + &
"~t~t~t~t~t~twhere  col = 'salesforce_id' and table_records_id = @table_records_id and table_name = @table_name and rowid = @rowid ;~r~n" + &
"~t~t~t~t~tSet @sql_param = N'select @tmp_id = count(1) from ' +@table_name+ N' where salesforce_id='''+ @salesforce_id+ N''' '~r~n" + &
"~t~t~t~t~tEXEC SP_EXECUTESQL @sql_param, N'@tmp_id int output',@tmp_id OUTPUT~r~n" + &
"~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t~tif (@tmp_id is not null and @tmp_id > 0 )~r~n" + &
"~t~t~t~tBegin ~t~t~t~t~t~r~n" + &
"~t~t~t~t~tSet @flag = 'update'~r~n" + &
"~t~t~t~t~tSet @sql_update = @sql_update +' Update '+@table_name+ ' Set '~r~n" + &
"~t~t~t~t~tif(lower(@table_name) = lower('app_facility'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_where =' top 1 facility_id='+ convert(varchar,facility_id) from app_facility where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~t~tSelect top 1 @sys_id = facility_id  from app_facility where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~tEnd~t~t~r~n" + &
"~t~t~t~t~tif(lower(@table_name) = lower('ctx_contacts'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_where =' top 1 contact_id='+ convert(varchar,contact_id) from ctx_contacts where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~t~tSelect top 1 @sys_id = contact_id  from ctx_contacts where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~t~tSet @sys_contact_id = @sys_id~r~n" + &
"~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~tif(lower(@table_name) = lower('ctx_basic_info'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_where =' top 1 ctx_id='+ convert(varchar,ctx_id) from ctx_basic_info where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~t~tSelect @sys_ctx_id = ctx_id from ctx_basic_info where salesforce_id =@salesforce_id; ~r~n" + &
"~t~t~t~t~t~tSelect @status = Case  when ISNUMERIC(actual_value) = 1 then CONVERT(int,actual_value) else 0 end ~r~n" + &
"~t~t~t~t~t~t~t~tfrom #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col ='status';~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif(lower(@table_name) = lower('ctx_products'))~r~n" + &
"~t~t~t~t~tBegin~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tSelect @sql_where =' top 1 ctx_id='+ convert(varchar,ctx_id)+ ' and product_id='+convert(varchar,product_id)+' and product_type='+convert(varchar,product_type) from ctx_products where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~t~tSelect @sys_ctx_id = ctx_id from ctx_products where salesforce_id =@salesforce_id; ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif(lower(@table_name) = lower('ctx_fee_sched_nm'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_where =' top 1 ctx_id='+ convert(varchar,ctx_id)+' and fee_sched_nm_id='+ convert(varchar,fee_sched_nm_id) from ctx_fee_sched_nm where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~t~tSelect @sys_ctx_id = ctx_id from ctx_fee_sched_nm where salesforce_id =@salesforce_id; ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif(lower(@table_name) = lower('ctx_custom'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_where =' top 1 ctx_id='+ convert(varchar,ctx_id) from ctx_custom where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~t~tSelect @sys_ctx_id = ctx_id from ctx_custom where salesforce_id =@salesforce_id; ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tif(lower(@table_name) = lower('ctx_custom_multi_hdr'))~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_where =' top 1 ctx_id='+ convert(varchar,ctx_id)+' and hdr_id='+ convert(varchar,hdr_id) from ctx_custom_multi_hdr where salesforce_id =@salesforce_id;~r~n" + &
"~t~t~t~t~t~tSelect @sys_ctx_id = ctx_id from ctx_custom_multi_hdr where salesforce_id =@salesforce_id; ~r~n" + &
"~t~t~t~t~tEnd~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @sql_param =''~r~n" + &
"~t~t~t~t~tSet @tmp_id =0~r~n" + &
"~t~t~t~t~tif (lower(@table_name) <> 'ctx_contacts_numbers')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSelect @sql_param = @sql_param + ' and ' + col + ' ='+~r~n" + &
"~t~t~t~t~t~tcase when col_type ='datetime' or col_type ='smalldatetime' then ' convert(datetime,''' + convert(varchar,actual_value,101)+ ''') '~r~n" + &
"~t~t~t~t~t~t~twhen col_type ='int' or col_type ='integer' or col_type ='real' or col_type ='float' or col_type ='smallint'or col_type ='tinyint' ~r~n" + &
"~t~t~t~t~t~t~t~t or col_type ='numeric' then actual_value~r~n" + &
"~t~t~t~t~t~t~twhen col_type ='char' or col_type ='varchar' or col_type ='nchar' or col_type ='nvarchar' then ' ''' +actual_value+''' ' ~r~n" + &
"~t~t~t~t~t~t~telse ' ''' +actual_value+''' ' end ~r~n" + &
"~t~t~t~t~t~t  from #import_external_tmp_data where key_field ='1' and col <> 'salesforce_id' and table_records_id = @table_records_id and table_name = @table_name and rowid = @rowid ;~r~n" + &
"~t~t~t~t~t~tif(@sql_param is not null and ltrim(rtrim(@sql_param)) <> '')~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @num = 17~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = stuff(@sql_param, 1, 4,'')~r~n" + &
"~t~t~t~t~t~t~tSet @sql_where = @sql_param~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select @tmp_id = count(1) from '+@table_name+ N' where '+ @sql_param~r~n" + &
"~t~t~t~t~t~t~tEXEC SP_EXECUTESQL @sql_param, N'@tmp_id int output',@tmp_id OUTPUT~r~n" + &
"~t~t~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t/*~tThe column contact_email must be in the front of other column orders.~t*/~r~n" + &
"~t~t~t~t~t~tSet @tmp_id =0 ~r~n" + &
"~t~t~t~t~t~tif (@col = 'contact_email')~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSelect @tmp_id = count(1) from ctx_contacts_numbers where contact_email = @origin_col_value and contact_id = @sys_contact_id;~r~n" + &
"~t~t~t~t~t~t~tSet @sql_where = ' contact_email = '''+convert(varchar,@origin_col_value)+''' and contact_id = '+convert(varchar,@sys_contact_id)~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSelect @tmp_id = count(1) from #import_external_tmp_data where table_records_id = @table_records_id and table_name = @table_name and rowid = @rowid and (col = 'phone' or col = 'ext');~r~n" + &
"~t~t~t~t~t~t~tif (@tmp_id > 1 )~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSelect @tmp_id = count(1) from ctx_contacts_numbers ~r~n" + &
"~t~t~t~t~t~t~t~twhere phone = (Select actual_value from #import_external_tmp_data where table_records_id = @table_records_id and table_name = @table_name and rowid = @rowid and (col = 'phone')) ~r~n" + &
"~t~t~t~t~t~t~t~tand ext = (Select actual_value from #import_external_tmp_data where table_records_id = @table_records_id and table_name = @table_name and rowid = @rowid and (col = 'ext')) ~r~n" + &
"~t~t~t~t~t~t~t~tand contact_id = @sys_contact_id;~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_where = ' phone = '''+convert(varchar,(Select actual_value from #import_external_tmp_data where table_records_id = @table_records_id and table_name = @table_name and rowid = @rowid and (col = 'phone')) )~r~n" + &
"~t~t~t~t~t~t~t~t~t+ ''' and ext = '''+convert(varchar,(Select actual_value from #import_external_tmp_data where table_records_id = @table_records_id and table_name = @table_name and rowid = @rowid and (col = 'ext')) )~r~n" + &
"~t~t~t~t~t~t~t~t~t+''' and contact_id = '+convert(varchar,@sys_contact_id)~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~tElse if(@tmp_id = 1)~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tif (@col = 'phone')~r~n" + &
"~t~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~t~tSelect @tmp_id = count(1) from ctx_contacts_numbers where phone = @origin_col_value and contact_id = @sys_contact_id and ext is null;~r~n" + &
"~t~t~t~t~t~t~t~t~tSet @sql_where = ' phone = '''+convert(varchar,@origin_col_value)+''' and contact_id = '+convert(varchar,@sys_contact_id)~r~n" + &
"~t~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~t~tElse if (@col = 'ext')~r~n" + &
"~t~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~t~tSelect @tmp_id = count(1) from ctx_contacts_numbers where ext = @origin_col_value and contact_id = @sys_contact_id and phone is null;~r~n" + &
"~t~t~t~t~t~t~t~t~tSet @sql_where = ' ext = '''+convert(varchar,@origin_col_value)+''' and contact_id = '+convert(varchar,@sys_contact_id)~r~n" + &
"~t~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t~t~tif (@tmp_id is not null and @tmp_id > 0 )~r~n" + &
"~t~t~t~t~tBegin~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tSet @flag = 'update'~r~n" + &
"~t~t~t~t~t~tSet @sql_update = @sql_update +' Update '+@table_name+ ' Set '~r~n" + &
"~t~t~t~t~t~tSet @tmp_id = 0~r~n" + &
"~t~t~t~t~t~tSet @num = 18~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('app_facility'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select top 1 @primary_key = '' facility_id='' + convert(varchar,facility_id) from '+@table_name+ N' where '+ @sql_where~r~n" + &
"~t~t~t~t~t~tEnd~t~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_contacts'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select top 1 @primary_key = '' contact_id='' + convert(varchar,contact_id) from '+@table_name+ N' where '+ @sql_where~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_contacts_numbers'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select top 1 @primary_key = '' contact_num_id='' + convert(varchar,contact_num_id) from '+@table_name+ N' where '+ @sql_where~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_basic_info'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select top 1 @primary_key = '' ctx_id='' + convert(varchar,ctx_id) from '+@table_name+ N' where '+ @sql_where~r~n" + &
"~t~t~t~t~t~t~tSelect @status = Case  when ISNUMERIC(actual_value) = 1 then CONVERT(int,actual_value) else 0 end ~r~n" + &
"~t~t~t~t~t~t~t~tfrom #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col ='status';~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_products'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select top 1 @primary_key = '' product_id='' + convert(varchar,product_id) + '' and ctx_id=''+ convert(varchar,ctx_id) + '' and product_type=''+ convert(varchar,product_type) from '+@table_name+ N' where '+ @sql_where~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_fee_sched_nm'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select top 1 @primary_key = '' ctx_id='' + convert(varchar,ctx_id) + '' and fee_sched_nm_id=''+ convert(varchar,fee_sched_nm_id) from '+@table_name+ N' where '+ @sql_where~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_custom'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select top 1 @primary_key = '' ctx_id='' + convert(varchar,ctx_id) from '+@table_name+ N' where '+ @sql_where~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_custom_multi_hdr'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_param = N'select top 1 @primary_key = '' ctx_id='' + convert(varchar,ctx_id) + '' and hdr_id=''+ convert(varchar,hdr_id) from '+@table_name+ N' where '+ @sql_where~r~n" + &
"~t~t~t~t~t~tEnd~t~t~t~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tEXEC SP_EXECUTESQL @sql_param, N'@primary_key varchar(1000) output',@primary_key OUTPUT~r~n" + &
"~t~t~t~t~t~tSet @error_sum = @@ERROR~r~n" + &
"~t~t~t~t~t~tIf @error_sum <> 0 ~r~n" + &
"~t~t~t~t~t~tBegin ~r~n" + &
"~t~t~t~t~t~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~tEnd ~r~n" + &
"~r~n" + &
"~t~t~t~t~t~tif (@primary_key is not null and ltrim(rtrim(@primary_key)) <> '')~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @sql_where = @sql_where + ' and ' + @primary_key~r~n" + &
"~r~n" + &
"~t~t~t~t~t~t~tif(lower(@table_name) = 'ctx_basic_info')~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @sys_ctx_id = convert(int, right(@primary_key,len(@primary_key) - charindex('=',@primary_key)) )~r~n" + &
"~t~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~t~tElse if(lower(@table_name) = 'ctx_contacts')~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @sys_contact_id = convert(int, right(@primary_key,len(@primary_key) - charindex('=',@primary_key)) )~r~n" + &
"~t~t~t~t~t~t~tEnd~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @flag = 'insert'~r~n" + &
"~t~t~t~t~t~tSet @sql_insert =@sql_insert + ' Insert Into '+@table_name+ ' ( '~r~n" + &
"~t~t~t~t~t~tSet @sql_value = ' VALUES( '~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tSet @tmp_id = 0~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('app_facility'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @primary_key = ' facility_id '~r~n" + &
"~t~t~t~t~t~t~tSELECT @tmp_id = max(facility_id) FROM app_facility; ~r~n" + &
"~t~t~t~t~t~t~tif (@tmp_id is null or @tmp_id <= 0 )~t~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @tmp_id = 0 ~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~tSet @tmp_id = @tmp_id + 1~r~n" + &
"~t~t~t~t~t~t~tSet @sys_id = @tmp_id ~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~t~tSelect @fieldname =  isnull(actual_value,'')  from #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col in ('facility_name');~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~t~tSet @sql_insert = @sql_insert +' '+ @primary_key + ','~r~n" + &
"~t~t~t~t~t~t~tSet @sql_value = @sql_value + ' '+CONVERT(varchar,@tmp_id)+ ','~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tEnd~t~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_contacts'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @primary_key = ' contact_id '~r~n" + &
"~t~t~t~t~t~t~tSELECT @tmp_id = max(contact_id) FROM ctx_contacts; ~r~n" + &
"~t~t~t~t~t~t~tif (@tmp_id is null or @tmp_id <= 0 )~t~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @tmp_id = 0 ~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~tSet @tmp_id = @tmp_id + 1~r~n" + &
"~t~t~t~t~t~t~tSet @sys_id = @tmp_id ~r~n" + &
"~t~t~t~t~t~t~tSet @num = 19~r~n" + &
"~t~t~t~t~t~t~tSelect @sys_record_id = isnull(record_id, 0) From ids;~t~r~n" + &
"~t~t~t~t~t~t~tUPDATE ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id = @sys_record_id ;~r~n" + &
"~t~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid record_id ('+CONVERT(varchar,@sys_record_id)+'). '~r~n" + &
"~t~t~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~t~tSet @sys_record_id = @sys_record_id + 1~r~n" + &
"~t~t~t~t~t~t~tSet @sys_id = @tmp_id ~r~n" + &
"~t~t~t~t~t~t~tSet @sys_contact_id = @tmp_id ~r~n" + &
"~t~t~t~t~t~t~tSelect @sys_facility_id = Case  when ISNUMERIC(actual_value) = 1 then CONVERT(int,actual_value) else 0 end ~r~n" + &
"~t~t~t~t~t~t~t~tfrom #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col ='facility_id';~r~n" + &
"~t~t~t~t~t~t~tSelect @fieldname = @fieldname + isnull(actual_value,'') + ' ' from #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col in ('first_name','last_name') order by col;~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~t~tSet @fieldname =ltrim(rtrim(@fieldname))~r~n" + &
"~t~t~t~t~t~t~tSet @sql_insert = @sql_insert +' '+ @primary_key + ', record_id,'~r~n" + &
"~t~t~t~t~t~t~tSet @sql_value = @sql_value + ' '+CONVERT(varchar,@tmp_id)+ ','+CONVERT(varchar,@sys_record_id) + ','~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_contacts_numbers'))~r~n" + &
"~t~t~t~t~t~tBegin~t~t~t~r~n" + &
"~t~t~t~t~t~t~tSet @num = 20~r~n" + &
"~t~t~t~t~t~t~tSelect @sys_record_id = isnull(record_id, 0) From ids;~t~r~n" + &
"~t~t~t~t~t~t~tUPDATE ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id = @sys_record_id ;~r~n" + &
"~t~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.record_id('+CONVERT(varchar,@sys_record_id)+'). '~r~n" + &
"~t~t~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~t~tSet @sys_record_id = @sys_record_id + 1~r~n" + &
"~r~n" + &
"~t~t~t~t~t~t~tSet @sql_insert = @sql_insert +' contact_id,record_id,'~r~n" + &
"~t~t~t~t~t~t~tSet @sql_value = @sql_value + ' '+CONVERT(varchar,@sys_contact_id)+ ','~t+CONVERT(varchar,@sys_record_id)+ ','~t~r~n" + &
"~r~n" + &
"~t~t~t~t~t~t~tif (lower(@col) =lower('contact_email'))~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSelect @tmp_id = lookup_code FROM code_lookup WHERE ( code_lookup.lookup_name = 'Contract Contact VIA' ) and lower(code) = lower('EMAIL');~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSelect @tmp_id = lookup_code FROM code_lookup WHERE ( code_lookup.lookup_name = 'Contract Contact VIA' ) and lower(code) = lower('PHONE');~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~tif(@tmp_id > 0 )~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_insert = @sql_insert +' via,'~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_value = @sql_value + ' '+CONVERT(varchar,@tmp_id)+ ','~t~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_basic_info'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @primary_key = ' ctx_id  '~r~n" + &
"~t~t~t~t~t~t~tSet @num = 21~r~n" + &
"~t~t~t~t~t~t~tSelect @tmp_id = isnull(ctx_id, 0) From ids;~t~r~n" + &
"~t~t~t~t~t~t~tUPDATE ids~tSET ctx_id =( isnull ( ctx_id , 0 ) + 1 ) Where ctx_id = @tmp_id ;~r~n" + &
"~t~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.ctx_id ('+convert(varchar,@tmp_id)+').'~r~n" + &
"~t~t~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~t~tSet @tmp_id =@tmp_id + 1~r~n" + &
"~t~t~t~t~t~t~tSet @sys_ctx_id = @tmp_id~r~n" + &
"~t~t~t~t~t~t~tSet @num = 22~r~n" + &
"~t~t~t~t~t~t~tSelect @sys_record_id = isnull(record_id, 0) From ids;~t~r~n" + &
"~t~t~t~t~t~t~tUPDATE ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id = @sys_record_id ;~r~n" + &
"~t~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.record_id ('+convert(varchar,@sys_record_id)+').'~r~n" + &
"~t~t~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~t~tSet @sys_record_id = @sys_record_id + 1~r~n" + &
"~t~t~t~t~t~t~tSet @sql_insert = @sql_insert +' '+ @primary_key + ', record_id,'~r~n" + &
"~t~t~t~t~t~t~tSet @sql_value = @sql_value + ' '+CONVERT(varchar,@tmp_id)+ ','+CONVERT(varchar,@sys_record_id ) + ','~r~n" + &
"~t~t~t~t~t~t~tSelect @status = Case  when ISNUMERIC(actual_value) = 1 then CONVERT(int,actual_value) else 0 end ~r~n" + &
"~t~t~t~t~t~t~t~tfrom #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col ='status';~r~n" + &
"~t~t~t~t~t~t~tSelect @custom_status1 = Case  when ISNUMERIC(actual_value) = 1 then CONVERT(int,actual_value) else 0 end ~r~n" + &
"~t~t~t~t~t~t~t~tfrom #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col ='custom_status1';~r~n" + &
"~t~t~t~t~t~t~tSelect @custom_status2 = Case  when ISNUMERIC(actual_value) = 1 then CONVERT(int,actual_value) else 0 end ~r~n" + &
"~t~t~t~t~t~t~t~tfrom #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col ='custom_status2';~r~n" + &
"~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_products') or lower(@table_name) = lower('ctx_fee_sched_nm') or lower(@table_name) = lower('ctx_custom') or lower(@table_name) = lower('ctx_custom_multi_hdr'))~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSelect @sys_ctx_id = CONVERT(int,actual_value) from #import_external_tmp_data where table_records_id =@table_records_id and table_name = @table_name and rowid =@rowid and col ='ctx_id';~r~n" + &
"~t~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_products') or lower(@table_name) = lower('ctx_fee_sched_nm') )~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @num = 23~r~n" + &
"~t~t~t~t~t~t~t~tSelect @sys_record_id = isnull(record_id, 0) From ids;~t~r~n" + &
"~t~t~t~t~t~t~t~tUPDATE ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id = @sys_record_id ;~r~n" + &
"~t~t~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.record_id ('+convert(varchar,@sys_record_id)+').'~r~n" + &
"~t~t~t~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~t~t~t~tEnd ~r~n" + &
"~t~t~t~t~t~t~t~tSet @sys_record_id = @sys_record_id + 1~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_insert = @sql_insert +' record_id,'~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_value = @sql_value + ' '+CONVERT(varchar,@sys_record_id ) + ','~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_fee_sched_nm'))~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @tmp_id = 0 ~r~n" + &
"~t~t~t~t~t~t~t~tSelect @tmp_id = Max(fee_sched_nm_id ) FROM ctx_fee_sched_nm WHERE ctx_id =@sys_ctx_id ;~r~n" + &
"~t~t~t~t~t~t~t~tif(@tmp_id is null or @tmp_id <= 0 )~r~n" + &
"~t~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~t~tSet @tmp_id = 0~r~n" + &
"~t~t~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~t~t~tSet @tmp_id = @tmp_id + 1 ~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_insert = @sql_insert +' fee_sched_nm_id,'~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_value = @sql_value + ' '+CONVERT(varchar,@tmp_id ) + ','~t~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~t~t~t~t~tif(lower(@table_name) = lower('ctx_custom_multi_hdr'))~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @num = 24~r~n" + &
"~t~t~t~t~t~t~t~tSet @tmp_id = 0 ~r~n" + &
"~t~t~t~t~t~t~t~tSELECT @tmp_id = ids.custom_id1 FROM ids ~r~n" + &
"~t~t~t~t~t~t~t~tUpdate ids SET custom_id1 =( isnull ( custom_id1 , 0 ) + 1 ) Where custom_id1 = @tmp_id ;~r~n" + &
"~t~t~t~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.custom_id1 ('+convert(varchar,@tmp_id)+').'~r~n" + &
"~t~t~t~t~t~t~t~t~tClose external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~t~tDEALLOCATE external_import_cursor~r~n" + &
"~t~t~t~t~t~t~t~t~treturn - 1~r~n" + &
"~t~t~t~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~t~t~t~t~tSet @tmp_id = @tmp_id + 1 ~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_insert = @sql_insert +' hdr_id,'~r~n" + &
"~t~t~t~t~t~t~t~tSet @sql_value = @sql_value + ' '+CONVERT(varchar,@tmp_id ) + ','~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tif (@flag = 'insert')~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert +' '+ @col + ','~r~n" + &
"~t~t~t~tSet @sql_value = @sql_value + ' '+@col_value+ ','~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tElse~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_update = @sql_update +' '+ @col + '= '+ @col_value + ' ,'~r~n" + &
"~t~t~tEnd~r~n" + &
"~r~n" + &
"~t~t~tif (lower(@col) = 'contact_email' and lower(@table_name) = 'ctx_contacts_numbers' and lower(@old_table_name) = 'ctx_contacts_numbers' )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @old_table_name =''~t~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~tFetch Next From external_import_cursor Into @table_records_id,@table_name,@rowid,@col,@col_value,@col_type,@col_length,@prec,@scale,@key_field,@no_match_procd,@lu_type,@lu_table,@lu_field_name~r~n" + &
"~tEnd~r~n" + &
"~tCLOSE external_import_cursor~r~n" + &
"~tDEALLOCATE external_import_cursor~r~n" + &
"~r~n" + &
"~tif(datalength(ltrim(rtrim(@sql_update))) > 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @sql_where = replace(@sql_where,'top 1','')~r~n" + &
"~t~tif (right(@sql_update,1)=',')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @sql_update = left(@sql_update,datalength(@sql_update) -1 ) + ' where '+ @sql_where + ' ;'~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~tif(datalength(ltrim(rtrim(@sql_insert))) > 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tif (right(@sql_insert,1)=',')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @sql_insert = left(@sql_insert,len(@sql_insert) - 1)+ ') ' + left(@sql_value,len(@sql_value ) -1 ) + ') ;'~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif (lower(@table_name) = 'ctx_basic_info')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @seq_no = 0~r~n" + &
"~t~tselect top 1 @table_id = table_id from sys_tables where lower(import_table_name) = lower('ctx_basic_info');~r~n" + &
"~t~tselect @seq_no = max(seq_no) from sys_audit where field_id =1001 ;~r~n" + &
"~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~t~tif (@flag = 'insert')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,sql_syntax )'+~r~n" + &
"~t~t~t~t' VALUES('+convert(varchar,@sys_record_id)+', 1001,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+','+convert(varchar,@sys_ctx_id)+' ,'''',''INSERT'',''salesforce user'',getdate(),1,''I'','+convert(varchar,@notification_pid)+','''+left(replace(@sql_insert,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit where rec_id ='+convert(varchar,@sys_record_id)+' and field_id = 1001 and seq_no = '+convert(varchar,@seq_no) + ' ;'~t~t~t~r~n" + &
"~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO ctx_version (ctx_id,version_id,version_number,version_date,user_id,old_value,new_value)'+~r~n" + &
"~t~t~t~t' Values('+convert(varchar,@sys_ctx_id)+',1,''1.0'',getdate(),''salesforce user'', '''',''1.0'') ;' ~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' Delete From ctx_version where ctx_id ='+convert(varchar,@sys_ctx_id)+' and version_id =1 ; '~r~n" + &
"~t~t~tif(@status > 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_statusaudit(ctx_id,seq_no,status,start_time,user_id,field_name) '+~r~n" + &
"~t~t~t~t~t' VALUES ('+convert(varchar,@sys_ctx_id)+',1,'+convert(varchar,@status)+',getdate(),''salesforce user'',''status'') ;'~t~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_statusaudit where ctx_id ='+convert(varchar,@sys_ctx_id)+' and seq_no = 1 and field_name =''status'' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tif(@custom_status1 > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_statusaudit(ctx_id,seq_no,status,start_time,user_id,field_name)' +~r~n" + &
"~t~t~t~t~t' VALUES ('+convert(varchar,@sys_ctx_id)+',1,'+convert(varchar,@custom_status1)+',getdate(),''salesforce user'',''custom_status1'') ;'~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_statusaudit where ctx_id ='+convert(varchar,@sys_ctx_id)+' and seq_no = 1 and field_name =''custom_status1'' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tif(@custom_status2 > 0 )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_statusaudit(ctx_id,seq_no,status,start_time,user_id,field_name)' +~r~n" + &
"~t~t~t~t~t' VALUES ('+convert(varchar,@sys_ctx_id)+',1,'+convert(varchar,@custom_status2)+',getdate(),''salesforce user'',''custom_status2'') ;'~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_statusaudit where ctx_id ='+convert(varchar,@sys_ctx_id)+' and seq_no = 1 and field_name =''custom_status2'' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' Delete From ctx_basic_info Where ctx_id ='+convert(varchar,@sys_ctx_id)+' ; '~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' UPDATE ids~tSET ctx_id =( ctx_id - 1 ) Where ctx_id ='+convert(varchar,@sys_ctx_id)+' ; '~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tif(@status > 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @count = 0~r~n" + &
"~t~t~t~tSelect @count = Max ( sys_statusaudit.seq_no ) FROM sys_statusaudit WHERE sys_statusaudit.ctx_id =@sys_ctx_id and field_name ='status' ;~r~n" + &
"~t~t~t~tif(@count is null)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSet @count = 0~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tSet @count = @count + 1~r~n" + &
"~t~t~t~tSet @sql_update = @sql_update + 'INSERT INTO sys_statusaudit(ctx_id,seq_no,status,start_time,user_id,field_name)'+~r~n" + &
"~t~t~t~t~t' VALUES ('+convert(varchar,@sys_ctx_id)+','+convert(varchar,@count)+','+convert(varchar,@status)+',getdate(),''salesforce user'',''status'') ;'~t~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_statusaudit where ctx_id ='+convert(varchar,@sys_ctx_id)+' and seq_no = '+convert(varchar,@count)+' and field_name =''status'' ;'~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @sql_update = @sql_update + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,sql_syntax )'+~r~n" + &
"~t~t~t~t' VALUES('+convert(varchar,@sys_record_id)+', 1001,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+','+convert(varchar,@sys_ctx_id)+' ,'''',''UPDATE'',''salesforce user'',getdate(),1,''I'','+convert(varchar,@notification_pid)+','''+left(replace(@sql_update,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit where rec_id ='+convert(varchar,@sys_record_id)+' and field_id = 1001 and seq_no = '+convert(varchar,@seq_no) + ' ;'~t~t~t~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tSet @origin_col_value = ''~r~n" + &
"~t~tSet @owner = 'N'~r~n" + &
"~t~tSet @tmp_id = 0 ~r~n" + &
"~t~tselect @tmp_id = ctxcta_contact_id from import_project inner join import_hdr on import_project.project_id = import_hdr.project_id  inner join import_webform on import_webform.import_id = import_hdr.import_id where import_webform.id = @id;~r~n" + &
"~t~tif (@tmp_id > 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @count = 0~r~n" + &
"~t~t~tSelect @count = count(1) from ctx_contract_contacts where contact_id = @tmp_id and ic_area = 'I' and ctx_id = @sys_ctx_id~r~n" + &
"~t~t~tif (@count = 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @num = 25~r~n" + &
"~t~t~t~tif (@seq_no = 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~t~t~t~tif (@sys_record_id = 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sys_record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~t~t~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@sys_record_id  ;~r~n" + &
"~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.record_id ('+convert(varchar,@sys_record_id)+'). '~r~n" + &
"~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~tEnd~t~r~n" + &
"~t~t~t~tSet @sys_record_id = @sys_record_id + 1~r~n" + &
"~t~t~t~tSelect top 1 @table_id =table_id from sys_tables where charindex('our company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert + ' INSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) '+~r~n" + &
"~t~t~t~t~t~t ' VALUES ( '+convert(varchar,@sys_ctx_id)+' , '+convert(varchar,@tmp_id)+', ''I'', '+convert(varchar,@sys_record_id)+', ''Y'', ''Y'', ''F'' ) ;'~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@sys_ctx_id)+' and ic_area =''I'' and contact_id='+convert(varchar,@tmp_id)+' ; '~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid ,sql_syntax)'+~r~n" + &
"~t~t~t~t~t' VALUES('+convert(varchar,@sys_record_id)+',1001,'+convert(varchar,@seq_no)+','+convert(varchar,@table_id)+','+convert(varchar,@sys_ctx_id)+','''',''INSERT'',''salesforce user'',getdate(),1,''I'','+convert(varchar,@notification_pid)+','''+left(replace(@sql_insert,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit Where rec_id = '+convert(varchar,@sys_record_id)+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~t~tSet @origin_col_value = 'N'~r~n" + &
"~t~tEnd~r~n" + &
"~r~n" + &
"~t~tif(@contact_id is not null and @contact_id > 0 and @ic_area is not null and ltrim(ltrim(@ic_area)) <> '' )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @count = 0~r~n" + &
"~t~t~tSelect @count = count(1) from ctx_contract_contacts where contact_id = @contact_id and ic_area = @ic_area and ctx_id = @sys_ctx_id~r~n" + &
"~t~t~tif (@count = 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @num = 26~r~n" + &
"~t~t~t~tif (@seq_no = 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~t~t~t~tif (@sys_record_id = 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sys_record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~t~t~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@sys_record_id  ;~r~n" + &
"~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.record_id ('+convert(varchar,@sys_record_id)+'). '~r~n" + &
"~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~tEnd~t~r~n" + &
"~t~t~t~tEnd~t~r~n" + &
"~t~t~t~tSet @sys_record_id = @sys_record_id + 1~r~n" + &
"~t~t~t~tif(@ic_area='E')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect top 1 @table_id =table_id from sys_tables where  charindex('contracted company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~t~t~tSet @sql_insert = @sql_insert + ' INSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) '+~r~n" + &
"~t~t~t~t~t~t ' VALUES ( '+convert(varchar,@sys_ctx_id)+' , '+convert(varchar,@contact_id)+', ''E'', '+convert(varchar,@sys_record_id)+', ''Y'', ''N'', ''F'' ) ;'~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif(@origin_col_value <> 'N')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @count = 0~r~n" + &
"~t~t~t~t~t~tselect @count = count(1) from ctx_contacts where user_d is not null and len(user_d) > 0 and contact_id = @contact_id1; ~r~n" + &
"~t~t~t~t~t~tif (@count > 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @owner = 'Y'~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSelect top 1 @table_id =table_id from sys_tables where charindex('our company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~t~t~tSet @sql_insert = @sql_insert + ' INSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) '+~r~n" + &
"~t~t~t~t~t~t ' VALUES ( '+convert(varchar,@sys_ctx_id)+' , '+convert(varchar,@contact_id)+', ''I'', '+convert(varchar,@sys_record_id)+', '''+@owner+''', '''+@owner+''', ''F'' ) ;'~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@sys_ctx_id)+' and ic_area ='''+@ic_area+''' and contact_id='+convert(varchar,@contact_id)+' ; '~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid ,sql_syntax)'+~r~n" + &
"~t~t~t~t~t' VALUES('+convert(varchar,@sys_record_id)+',1001,'+convert(varchar,@seq_no)+','+convert(varchar,@table_id)+','+convert(varchar,@sys_ctx_id)+','''',''INSERT'',''salesforce user'',getdate(),1,'''+@ic_area+''','+convert(varchar,@notification_pid)+','''+left(replace(@sql_insert,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit Where rec_id = '+convert(varchar,@sys_record_id)+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~t~t~r~n" + &
"~t~tif(@contact_id1 is not null and @contact_id1 > 0 and @ic_area1 is not null and ltrim(ltrim(@ic_area1)) <> '' )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @count = 0~r~n" + &
"~t~t~tSelect @count = count(1) from ctx_contract_contacts where contact_id = @contact_id1 and ic_area = @ic_area1 and ctx_id = @sys_ctx_id~r~n" + &
"~t~t~tif (@count = 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @num = 27~r~n" + &
"~t~t~t~tif (@seq_no = 0)~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id in (1001);~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tSet @seq_no = @seq_no + 1~r~n" + &
"~t~t~t~tif(@sys_record_id = 0 )~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect @sys_record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~t~t~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@sys_record_id  ;~r~n" + &
"~t~t~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.record_id ('+convert(varchar,@sys_record_id)+'). '~r~n" + &
"~t~t~t~t~t~treturn -1~r~n" + &
"~t~t~t~t~tEnd~t~t~t~r~n" + &
"~t~t~t~tEnd~t~r~n" + &
"~t~t~t~tSet @sys_record_id = @sys_record_id + 1~r~n" + &
"~r~n" + &
"~t~t~t~tif(@ic_area1='E')~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tSelect top 1 @table_id =table_id from sys_tables where  charindex('contracted company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~t~t~tSet @sql_insert = @sql_insert + ' INSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) '+~r~n" + &
"~t~t~t~t~t~t ' VALUES ( '+convert(varchar,@sys_ctx_id)+' , '+convert(varchar,@contact_id1)+', ''E'', '+convert(varchar,@sys_record_id)+', ''Y'', ''N'', ''F'' ) ;'~r~n" + &
"~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~tBegin~r~n" + &
"~t~t~t~t~tif(@origin_col_value <> 'N')~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @count = 0~r~n" + &
"~t~t~t~t~t~tselect @count = count(1) from ctx_contacts where user_d is not null and len(user_d) > 0 and contact_id = @contact_id1; ~r~n" + &
"~t~t~t~t~t~tif (@count > 0)~r~n" + &
"~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~tSet @owner = 'Y'~r~n" + &
"~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~tSelect top 1 @table_id =table_id from sys_tables where charindex('our company contact info',lower(table_name_allias) ) > 0 ;~r~n" + &
"~t~t~t~t~tSet @sql_insert = @sql_insert + ' INSERT INTO ctx_contract_contacts ( ctx_id, contact_id, ic_area, record_id, default_email, owner, access ) '+~r~n" + &
"~t~t~t~t~t~t ' VALUES ( '+convert(varchar,@sys_ctx_id)+' , '+convert(varchar,@contact_id1)+', ''I'', '+convert(varchar,@sys_record_id)+', '''+@owner+''', '''+@owner+''', ''F'' ) ;'~r~n" + &
"~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From ctx_contract_contacts Where ctx_id = '+convert(varchar,@sys_ctx_id)+' and ic_area ='''+@ic_area1+''' and contact_id='+convert(varchar,@contact_id1)+' ; '~r~n" + &
"~t~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,sql_syntax )' +~r~n" + &
"~t~t~t~t~t' VALUES('+convert(varchar,@sys_record_id)+',1001,'+convert(varchar,@seq_no)+','+convert(varchar,@table_id)+','+convert(varchar,@sys_ctx_id)+','''',''INSERT'',''salesforce user'',getdate(),1,'''+@ic_area1+''','+convert(varchar,@notification_pid)+','''+left(replace(@sql_insert,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~t~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit Where rec_id = '+convert(varchar,@sys_record_id)+' and field_id =1001 and seq_no ='+convert(varchar,@seq_no)+' ; '~r~n" + &
"~t~t~tEnd~r~n" + &
"~t~tEnd~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif (lower(@table_name) ='ctx_products' or lower(@table_name)='ctx_fee_sched_nm'or lower(@table_name)='ctx_custom'or lower(@table_name)='ctx_custom_multi_hdr')~r~n" + &
"~tBegin~r~n" + &
"~t~tif (@seq_no = 0)~t~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id =1001;~t~t~t~t~t~t~t~r~n" + &
"~t~tend ~t~t~t~r~n" + &
"~t~tSet @seq_no = @seq_no + 1~t~r~n" + &
"~t~tSelect top 1 @table_id =table_id from sys_tables where import_table_name = @table_name ;~r~n" + &
"~t~tif(@sys_record_id = 0 )~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @num = 28~r~n" + &
"~t~t~tSelect @sys_record_id = isnull(record_id, 0) From ids;~r~n" + &
"~t~t~tUpdate ids~tSET record_id =( isnull ( record_id , 0 ) + 1 ) Where record_id =@sys_record_id  ;~r~n" + &
"~t~t~tif (@@ROWCOUNT = 0)~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet @err_msg ='('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Invalid '+@table_name+'.record_id ('+convert(varchar,@sys_record_id)+'). '~r~n" + &
"~t~t~t~treturn -1~r~n" + &
"~t~t~tEnd~t~t~t~r~n" + &
"~t~tEnd~t~r~n" + &
"~t~tSet @sys_record_id = @sys_record_id + 1~r~n" + &
"~t~tif (@flag = 'insert')~r~n" + &
"~t~tBegin~t~t~r~n" + &
"~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,sql_syntax )'+~r~n" + &
"~t~t~t~t' VALUES('+convert(varchar,@sys_record_id)+', 1001,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+','+convert(varchar,@sys_ctx_id)+' ,'''',''INSERT'',''salesforce user'',getdate(),1,''I'','+convert(varchar,@notification_pid)+','''+left(replace(@sql_insert,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @sql_update = @sql_update + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,sql_syntax )'+~r~n" + &
"~t~t~t~t' VALUES('+convert(varchar,@sys_record_id)+', 1001,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+','+convert(varchar,@sys_ctx_id)+' ,'''',''UPDATE'',''salesforce user'',getdate(),1,''I'','+convert(varchar,@notification_pid)+','''+left(replace(@sql_update,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~tEnd~r~n" + &
"~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit where rec_id ='+convert(varchar,@sys_record_id)+' and field_id = 1001 and seq_no = '+convert(varchar,@seq_no) + ' ;'~t~t~t~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif (lower(@table_name)='app_facility')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @table_id = 10003~r~n" + &
"~t~tif (@seq_no = 0)~t~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id =-9999 ;~t~t~t~t~r~n" + &
"~t~tend ~t~t~t~r~n" + &
"~t~tSet @seq_no = @seq_no + 1~t~r~n" + &
"~t~tif (@flag = 'insert')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,facility_id,tfield_name,tfield_name_allias,sql_syntax )' +~r~n" + &
"~t~t~t~t~t' VALUES('+convert(varchar,@sys_id)+', -9999,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+',0 ,'''',''INSERT'',''salesforce user'',getdate(),0,''I'','+convert(varchar,@notification_pid)+','+convert(varchar,@sys_id)+','''+@fieldname+''','''+@fieldname+''','''+left(replace(@sql_insert,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @sql_update = @sql_update + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,facility_id,tfield_name,tfield_name_allias,sql_syntax )' +~r~n" + &
"~t~t~t~t~t' VALUES('+convert(varchar,@sys_id)+', -9999,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+',0 ,'''',''UPDATE'',''salesforce user'',getdate(),0,''I'','+convert(varchar,@notification_pid)+','+convert(varchar,@sys_id)+','''+@fieldname+''','''+@fieldname+''','''+left(replace(@sql_update,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~tEnd~r~n" + &
"~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit where rec_id ='+convert(varchar,@sys_id)+' and field_id = -9999 and seq_no = '+convert(varchar,@seq_no) + ' ;'~t~t~t~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"~tif (lower(@table_name) ='ctx_contacts')~r~n" + &
"~tBegin~r~n" + &
"~t~tSet @table_id = 10004~r~n" + &
"~t~tif (@seq_no = 0)~t~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @seq_no = max(seq_no) from sys_audit where field_id =-9999 ;~t~t~t~t~r~n" + &
"~t~tend ~t~t~t~r~n" + &
"~t~tSet @seq_no = @seq_no + 1~t~r~n" + &
"~t~tif (@flag = 'insert')~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @sql_insert = @sql_insert + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,facility_id,tfield_name,tfield_name_allias,sql_syntax )'+~r~n" + &
"~t~t~t~t~t' VALUES('+convert(varchar,@sys_id)+', -9999,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+',0 ,'''',''INSERT'',''salesforce user'',getdate(),0,''I'','+convert(varchar,@notification_pid)+','+convert(varchar,@sys_facility_id)+','''+@fieldname+''','''+@fieldname+''','''+left(replace(@sql_insert,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~tEnd~r~n" + &
"~t~tElse~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSet @sql_update = @sql_update + 'INSERT INTO sys_audit ( rec_id, field_id, seq_no, table_id, prac_id, old_value, new_value, user_id, date_time_modified, exported, audit_type,sys_notification_pid,facility_id,tfield_name,tfield_name_allias,sql_syntax )' +~r~n" + &
"~t~t~t~t~t' VALUES('+convert(varchar,@sys_id)+', -9999,'+convert(varchar,@seq_no)+' , '+convert(varchar,@table_id)+',0 ,'''',''UPDATE'',''salesforce user'',getdate(),0,''I'','+convert(varchar,@notification_pid)+','+convert(varchar,@sys_facility_id)+','''+@fieldname+''','''+@fieldname+''','''+left(replace(@sql_update,char(39),char(39)+char(39)),8000)+''') ;'~r~n" + &
"~t~tEnd~r~n" + &
"~t~tSelect @sql_delete = @sql_delete + ' Delete From sys_audit where rec_id ='+convert(varchar,@sys_id)+' and field_id = -9999 and seq_no = '+convert(varchar,@seq_no) + ' ;'~t~t~t~r~n" + &
"~tEnd~r~n" + &
"~t~r~n" + &
"~tSet @num = 29~r~n" + &
"~tBegin Try~r~n" + &
"~tBegin Transaction ImportDataTrans~r~n" + &
"~t~tExecute(@sql_insert) ;~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~t~tExecute(@sql_update) ;~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~t~r~n" + &
"~tEnd Try~r~n" + &
"~tBegin Catch~r~n" + &
"~t~tSet @error_sum = @error_sum + @@error~r~n" + &
"~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~tRollback Transaction ImportDataTrans~r~n" + &
"~t~tExecute(@sql_delete);~r~n" + &
"~t~tif (@@error <> 0)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tSelect @err_msg = @err_msg+ ' ('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; ErrorNumber:'+ convert(varchar,@error_sum)+' Delete Sql:'+@sql_delete ~r~n" + &
"~t~tEnd~r~n" + &
"~t~treturn -1~r~n" + &
"~tEnd Catch~r~n" + &
"~r~n" + &
"~tIf (@error_sum <> 0 )~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @err_msg = '('+Convert(varchar,@id)+') '+'Position:'+convert(varchar,@num)+'; Error:'+convert(varchar,@error_sum)+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE() ~r~n" + &
"~t~tROLLBACK TRANSACTION ImportDataTrans;~r~n" + &
"~t~treturn -1~r~n" + &
"~tEnd~r~n" + &
"~telse~r~n" + &
"~tBegin~r~n" + &
"~t~tCOMMIT TRANSACTION ImportDataTrans;~r~n" + &
"~tEnd~r~n" + &
"End~r~n"

of_execute_sqls("of_ver150_release_storeprocedure5")
return 1
end function

public function integer of_ver150_release_storeprocedure6 ();//====================================================================
// Function: of_ver150_release_storeprocedure6
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	 Gavin 	Date: 03/01/2016
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


//Added By gavin 03/01/2016
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'up_export_table_data' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure up_export_table_data~r~n" + &
"End ~r~n" 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
" create  Procedure up_export_table_data(@export_id int,@sql_where varchar(2000),@table_header int,@display_key int,@err_msg varchar(2000) output) ~r~n" + &
" AS ~r~n" + &
" Begin ~r~n" + &
"  Declare @count int, @export_type int, @export_field_length int,@ctx_id int, @num int, @level int ~r~n" + &
"  Declare @where varchar(max), @sql_text varchar(max), @return varchar(10), @collation_order nvarchar(128),@export_fields_expression varchar(2000) ~r~n" + &
"  Declare @version_sql varchar(300), @row_code varchar(10),@strip_char varchar(8),@ctx_table_name varchar(50), @exec_sql varchar(max),@expression varchar(max) ~r~n" + &
"  Declare @export_field_name varchar(50), @ctx_column_name varchar(50), @insert_column varchar(max),@select_col varchar(max), @nexec nvarchar(max) ~r~n" + &
"  Declare @field_value varchar(8000), @sql_order_col varchar(8000),  @table_header_col varchar(max), @convert_sql varchar(max), @exec varchar(max) ~r~n" + &
"   ~r~n" + &
"  ~r~n" + &
"  SET @collation_order = 'select @level = compatibility_level from sys.databases where name = db_name()' ~r~n" + &
"     EXEC SP_EXECUTESQL @collation_order, N'@level int output',@level OUTPUT ~r~n" + &
"  ~r~n" + &
"  if (@level is null or @level <= 80) ~r~n" + &
"  Begin ~r~n" + &
"   Select @err_msg = 'Please set the database compatibility level more than SQL Server 2000. Otherwise, the export data functions will not work.' ~r~n" + &
"   return  -1 ~r~n" + &
"  End ~r~n" + &
"  ~r~n" + &
"  Set @num = 1  ~r~n" + &
"  BEGIN TRY ~r~n" + &
"   Select @where = prac_sql, @sql_text = sql_text, @strip_char = strip_char from export_header where export_id =  convert(varchar(20),@export_id)  ~r~n" + &
"   Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"  END TRY ~r~n" + &
"  BEGIN CATCH ~r~n" + &
"   Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"   Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"   return   ~r~n" + &
"  END CATCH ~r~n" + &
"  If convert(int,@return) <> 0  ~r~n" + &
"  Begin  ~r~n" + &
"   Select @err_msg = 'Position:'+convert(varchar,@num)+'; ErrorNumber:'+@return ~r~n" + &
"   return  @return   ~r~n" + &
"  End  ~r~n" + &
"  ~r~n" + &
"  If (@sql_text is null ) or (datalength(@sql_text)<= 0 ) ~r~n" + &
"  Begin ~r~n" + &
"   Select @err_msg = 'no data' ~r~n" + &
"   Return  ~r~n" + &
"  End ~r~n" + &
"  ~r~n" + &
"  If (@sql_where is null) or (ltrim(rtrim(@sql_where)) = '') ~r~n" + &
"  Begin ~r~n" + &
"   Set @where = 'select distinct  ctx_id from ctx_basic_info ' ~r~n" + &
"  End  ~r~n" + &
"  Else If left(ltrim(@sql_where),6) = 'ctx_id'  ~r~n" + &
"  Begin ~r~n" + &
"   Set @where ='select distinct ctx_id from ctx_basic_info where '+ @sql_where ~r~n" + &
"  End ~r~n" + &
"  Else If left(ltrim(@sql_where),7) = 'default'  ~r~n" + &
"  Begin ~r~n" + &
"   IF (@where is null) or (datalength(@where)= 0 ) ~r~n" + &
"   Begin ~r~n" + &
"    Set @where = 'select distinct  ctx_id from ctx_basic_info ' ~r~n" + &
"   End  ~r~n" + &
"  ~r~n" + &
"   If Charindex(';',@where) > 0  ~r~n" + &
"   Begin ~r~n" + &
"    Set @where = left(@where,Charindex(';',@where) - 1  ) ~r~n" + &
"   End  ~r~n" + &
"  End ~r~n" + &
"  ~r~n" + &
"  Select @sql_text = replace(@sql_text,'(***)',@where)  ~r~n" + &
"  Set @count = 0 ~r~n" + &
"  Select @count = count(1) from sysobjects where name = '#export_tmp_data' and type = 'U'; ~r~n" + &
"  If (@count is not null ) and (@count = 1 )  ~r~n" + &
"  Begin ~r~n" + &
"   Drop TABLE #export_tmp_data; ~r~n" + &
"  End  ~r~n" + &
"    ~r~n" + &
"  Set @num = 2 ~r~n" + &
"  BEGIN TRY ~r~n" + &
"   Create Table #export_tmp_data ( exp_tmp_id int identity(1,1) not null, rec_id int not null, fieldseqid varchar(50) not null, ~r~n" + &
"    field_value varchar(8000) null, field_data_type char(1) null, row_no int null ) ; ~r~n" + &
"   Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"  END TRY ~r~n" + &
"  BEGIN CATCH ~r~n" + &
"   Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"   Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"   return   ~r~n" + &
"  END CATCH ~r~n" + &
"  If convert(int,@return) <> 0  ~r~n" + &
"  Begin  ~r~n" + &
"   Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"   return   ~r~n" + &
"  End  ~r~n" + &
"  ~r~n" + &
"  select @collation_order = CONVERT(sysname, SERVERPROPERTY('Collation')) ~r~n" + &
"  ~r~n" + &
"  If charindex('_CI_',@collation_order) > 0  ~r~n" + &
"  Begin ~r~n" + &
"   Set @collation_order = replace(@collation_order,'_CI_','_CS_') ~r~n" + &
"  End ~r~n" + &
"  ~r~n" + &
"  If charindex('_CS_',@collation_order) = 0  ~r~n" + &
"  Begin ~r~n" + &
"   Set @collation_order ='' ~r~n" + &
"  End ~r~n" + &
"  ~r~n" + &
"  select @version_sql = @@version ~r~n" + &
"  ~r~n" + &
"   Set @row_code = ',row_no' ~r~n" + &
"  Select @sql_text = 'Insert into #export_tmp_data(rec_id, fieldseqid,field_value,field_data_type' + @row_code + ') ' + @sql_text  ~r~n" + &
"  Set @num = 3   ~r~n" + &
"  BEGIN TRY ~r~n" + &
"   execute(@sql_text) ~r~n" + &
"   Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"  END TRY ~r~n" + &
"  BEGIN CATCH ~r~n" + &
"   drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"   Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"   Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"   return   ~r~n" + &
"  END CATCH ~r~n" + &
"  If convert(int,@return) <> 0  ~r~n" + &
"  Begin  ~r~n" + &
"   drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"   Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"   return   ~r~n" + &
"  End  ~r~n" + &
"  ~r~n" + &
"  Set @sql_text = ''   ~r~n" + &
"  Set @expression = ''  ~r~n" + &
"  Select @expression = '['+lower(export_field_name) + '], '+@expression FROM export_fields WHERE export_id = @export_id; ~r~n" + &
"  Set @count = 0  ~r~n" + &
"  select @count = count(1) from #export_tmp_data ; ~r~n" + &
"  If (@count is not null ) and (@count > 0 )  ~r~n" + &
"  Begin ~r~n" + &
"  ~r~n" + &
"   Set @insert_column = '' ~r~n" + &
"   Set @sql_order_col = 'Select rec_id, ' ~r~n" + &
"   Set @field_value = '' ~r~n" + &
"   Set @exec_sql = '' ~r~n" + &
"   Set @table_header_col = 'select top 1 ''0'''     /*ctx_id int*/   ~r~n" + &
"   DECLARE export_cursor CURSOR FOR  ~r~n" + &
"         SELECT  export_field_name,ctx_column_name, field_value, export_type, export_field_length,ctx_table_name,export_fields_expression ~r~n" + &
"   FROM export_fields ~r~n" + &
"   WHERE export_fields.export_id =  @export_id   ~r~n" + &
"   Order by  export_order, rec_id asc ~r~n" + &
"   /*the order number maybe as same in the export fields table, so we need the field name in the order list.*/ ~r~n" + &
"   OPEN export_cursor ~r~n" + &
"   FETCH NEXT FROM export_cursor INTO @export_field_name, @ctx_column_name, @field_value, @export_type, @export_field_length,@ctx_table_name,@export_fields_expression ~r~n" + &
"    ~r~n" + &
"   WHILE @@FETCH_STATUS = 0 ~r~n" + &
"   BEGIN ~r~n" + &
"    /*Character to strip from all data fields*/ ~r~n" + &
"    Set @where = '' ~r~n" + &
"    If (@export_field_length is not null and @export_field_length > 0 ) ~r~n" + &
"    Begin ~r~n" + &
"     Set @where = 'convert(varchar('+convert(varchar,@export_field_length)+'),'+@export_field_name+') ' ~r~n" + &
"    End ~r~n" + &
"    Else ~r~n" + &
"    Begin ~r~n" + &
"     Set @where = @export_field_name ~r~n" + &
"    End ~r~n" + &
"  ~r~n" + &
"    IF(@strip_char is not null) and len(@strip_char) > 0 ~r~n" + &
"    Begin ~r~n" + &
"     If len(@collation_order) > 0  ~r~n" + &
"     Begin ~r~n" + &
"      Select @where = replace(@where,@export_field_name,'replace('+@export_field_name+' collate '+@collation_order+','''+@strip_char+''','''')') ~r~n" + &
"     End ~r~n" + &
"     Else ~r~n" + &
"     Begin ~r~n" + &
"      Select @where = replace(@where,@export_field_name,'replace('+@export_field_name+','''+@strip_char+''','''')') ~r~n" + &
"     End     ~r~n" + &
"    End ~r~n" + &
"  ~r~n" + &
"    Select @insert_column = @insert_column +' alter table #export_tmp_data1 add ' + @export_field_name +' varchar(8000) NULL;' ~r~n" + &
"    Select @exec_sql  = isnull(@exec_sql, '') + ' , ' + @where + ' as ' + @export_field_name ~r~n" + &
"    Select @sql_order_col = @sql_order_col + @export_field_name + ', ' ~r~n" + &
"    Select @table_header_col = @table_header_col + ', '+ ''''+@export_field_name+''' ' ~r~n" + &
"  ~r~n" + &
"   ~tif (@export_type = 3 and (@export_fields_expression is not null and len(ltrim(rtrim(@export_fields_expression))) > 0 ) )~r~n" + &
"~t~t~tBegin~r~n" + &
"~t~t~t~tSet~t@where = ''~r~n" + &
"~r~n" + &
"~t~t~t~tif (charindex('['+lower(ltrim(rtrim(@export_fields_expression)))+'],',@expression) > 0 )~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @field_value = @export_fields_expression~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tIf (@export_field_length is not null and @export_field_length > 0 )~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @where = 'convert(varchar('+convert(varchar,@export_field_length)+'),'+@field_value+') '~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @where = @field_value~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tSet @sql_text  = @sql_text + ' Update #export_tmp_data1 Set '+@export_field_name+'=' + @where + ' ; ' ~r~n" + &
"~t~t~t~t~tEnd~r~n" + &
"~t~t~t~tElse~r~n" + &
"~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~tSet @field_value = @export_fields_expression~t~t~r~n" + &
"~t~t~t~t~t~tselect @field_value = REPLACE(  @field_value , export_field_name,  ~r~n" + &
"~t~t~t~t~t~t(case when ctx_column_datatype = 'N'  then 'convert(numeric, isnull( ' + '#'+convert(varchar(20),rec_id ) + ',0))' else '#'+convert(varchar(20),rec_id ) end ) )~r~n" + &
"~t~t~t~t~t~tFROM export_fields with (nolock) WHERE export_id = @export_id and charindex( export_field_name , @export_fields_expression ) > 0 order by Len(export_field_name) desc ;~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tselect @field_value = REPLACE(  @field_value , '#'+convert(varchar(20),rec_id ) ,   export_field_name )~r~n" + &
"~t~t~t~t~t~tFROM export_fields WHERE export_id = @export_id;~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tIf (@export_field_length is not null and @export_field_length > 0 )~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tset @where = 'convert(varchar('+convert(varchar,@export_field_length)+'),'+@field_value+') '~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~tElse~r~n" + &
"~t~t~t~t~t~t~tBegin~r~n" + &
"~t~t~t~t~t~t~t~tSet @where = ''''+@field_value+''''~r~n" + &
"~t~t~t~t~t~t~tEnd~r~n" + &
"~t~t~t~t~t~t~r~n" + &
"~t~t~t~t~t~tset @where = 'cal1.' +@export_field_name+' from ( select rec_id,'   + @where +  ' as ' +@export_field_name + ' from #export_tmp_data1  ) cal1' ~r~n" + &
"~t~t~t~t~t~tset @where = @where + ' where cal1.rec_id = #export_tmp_data1.rec_id' ~r~n" + &
"~t~t~t~t~t~tSet @sql_text  = @sql_text + ' Update #export_tmp_data1 Set '+@export_field_name+'=' + @where + ' ; ' ~r~n" + &
"~t~t~t~t~tEnd~t~t~t~t~r~n" + &
"~t~t~t   End ~r~n" + &
"~r~n" + &
"~t~t~tFETCH NEXT FROM export_cursor INTO @export_field_name, @ctx_column_name, @field_value, @export_type, @export_field_length,@ctx_table_name,@export_fields_expression~r~n" + &
"~t~tEND~r~n" + &
"   CLOSE export_cursor ~r~n" + &
"   DEALLOCATE export_cursor ~r~n" + &
"  ~r~n" + &
"   /*create table*/ ~r~n" + &
"   Set @count = 0  ~r~n" + &
"   Select @count = count(1) from sysobjects where name = '#export_tmp_data1' and type = 'U' ;  ~r~n" + &
"   If (@count is not null and @count = 1 ) ~r~n" + &
"   Begin ~r~n" + &
"    Drop Table #export_tmp_data1; ~r~n" + &
"   End  ~r~n" + &
"  ~r~n" + &
"   Set @num = 4 ~r~n" + &
"   BEGIN TRY ~r~n" + &
"    Create Table #export_tmp_data1 ( rec_id int null, row_no int null ) ; ~r~n" + &
"    Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"   END TRY ~r~n" + &
"   BEGIN CATCH ~r~n" + &
"    truncate table #export_tmp_data ~r~n" + &
"    drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"    Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"    Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"    return   ~r~n" + &
"   END CATCH ~r~n" + &
"   If convert(int,@return) <> 0  ~r~n" + &
"   Begin  ~r~n" + &
"    truncate table #export_tmp_data ~r~n" + &
"    drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"    Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"    return   ~r~n" + &
"   End  ~r~n" + &
"  ~r~n" + &
"   IF len(@insert_column) > 0 ~r~n" + &
"   Begin  ~r~n" + &
"    Set @num = 5 ~r~n" + &
"    BEGIN TRY ~r~n" + &
"     Execute(@insert_column) ~r~n" + &
"     Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"    END TRY ~r~n" + &
"    BEGIN CATCH ~r~n" + &
"     Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"     Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"     return   ~r~n" + &
"    END CATCH ~r~n" + &
"    If convert(int,@return) <> 0  ~r~n" + &
"    Begin  ~r~n" + &
"     Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"     return   ~r~n" + &
"    End  ~r~n" + &
"   End  ~r~n" + &
"  ~r~n" + &
"   select  @convert_sql = isnull(@convert_sql,'') + ( case when export_type = 1 then '[' + export_field_name  + '],'  ~r~n" + &
"     when export_type = 2  and field_value is not null and len(field_value) > 0 then + ''''+ field_value + ''''+  ' as ' + '[' + export_field_name + ']' + ','     ~r~n" + &
"     else '''''' +  'as ' + '[' + export_field_name + ']' + ','  end ) , ~r~n" + &
"    @select_col = isnull(@select_col+ '],[','') + export_field_name ~r~n" + &
"    from ( select  distinct  b.export_field_name,b.export_order,b.export_type, b.field_value, b.rec_id, b.export_fields_expression from export_fields b  ~r~n" + &
"        where b.export_id = @export_id   ~r~n" + &
"      ) c  order by c.export_order,c.rec_id asc ; ~r~n" + &
"  ~r~n" + &
"   Set @select_col = '[' + @select_col+ ']' ~r~n" + &
"   Set @convert_sql = substring( @convert_sql, 1, len(@convert_sql ) -1 ) ~r~n" + &
"  ~r~n" + &
"   Set @exec = '' ~r~n" + &
"   Select @exec = ' select rec_id,row_no,' + @convert_sql + ' from ( ~r~n" + &
"    select fieldseqid,field_value,rec_id, 1 as row_no from ~r~n" + &
"    (select b.export_field_name as fieldseqid,a.field_value,a.rec_id, a.row_no  ~r~n" + &
"     from   ( select rec_id,field_value,fieldseqid,  row_number() over(partition by fieldseqid , rec_id order by fieldseqid , rec_id asc) row_no  from #export_tmp_data )  a  ~r~n" + &
"    left join ( select row_number() over ( order by export_order, rec_id asc) as num, export_id, export_type, export_order as export_order2,export_field_name,intcred_record_number   ~r~n" + &
"       from export_fields where export_id = '+convert(varchar,@export_id)+' and export_type = 1 ) b  ~r~n" + &
"     on a.fieldseqid = b.num and a.row_no = b.intcred_record_number) dd ) aa ~r~n" + &
"    pivot (min( field_value ) for fieldseqid  in (' + @select_col + ')) bb order by rec_id,row_no ' ; ~r~n" + &
"  ~r~n" + &
"   Set @num = 6 ~r~n" + &
"   BEGIN TRY      ~r~n" + &
"    Insert #export_tmp_data1 Exec(@exec) ~r~n" + &
"    Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"   END TRY ~r~n" + &
"   BEGIN CATCH ~r~n" + &
"    truncate table #export_tmp_data ~r~n" + &
"    drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"    truncate table #export_tmp_data1 ~r~n" + &
"    drop table #export_tmp_data1 ~r~n" + &
"   ~r~n" + &
"    Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"    Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"    return   ~r~n" + &
"   END CATCH ~r~n" + &
"   If convert(int,@return) <> 0  ~r~n" + &
"   Begin  ~r~n" + &
"    truncate table #export_tmp_data ~r~n" + &
"    drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"    truncate table #export_tmp_data1 ~r~n" + &
"    drop table #export_tmp_data1 ~r~n" + &
"  ~r~n" + &
"    Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"    return    ~r~n" + &
"   End  ~r~n" + &
"  ~r~n" + &
"   /* Calculated Field  */   ~r~n" + &
"   If(@sql_text is not null and len(@sql_text) > 0) ~r~n" + &
"   Begin ~r~n" + &
"    Set @num = 7 ~r~n" + &
"    BEGIN TRY    ~r~n" + &
"  ~r~n" + &
"     Exec(@sql_text) ~r~n" + &
"     Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"    END TRY ~r~n" + &
"    BEGIN CATCH ~r~n" + &
"     truncate table #export_tmp_data ~r~n" + &
"     drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"     truncate table #export_tmp_data1 ~r~n" + &
"     drop table #export_tmp_data1 ~r~n" + &
"   ~r~n" + &
"     Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"     Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"     return   ~r~n" + &
"    END CATCH ~r~n" + &
"    If convert(int,@return) <> 0  ~r~n" + &
"    Begin  ~r~n" + &
"     truncate table #export_tmp_data ~r~n" + &
"     drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"     truncate table #export_tmp_data1 ~r~n" + &
"     drop table #export_tmp_data1 ~r~n" + &
"  ~r~n" + &
"     Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"     return    ~r~n" + &
"    End  ~r~n" + &
"   End  ~r~n" + &
"   Select @sql_order_col = Left(@sql_order_col,len(@sql_order_col) - 1) ~r~n" + &
"   Set @exec = ' #export_tmp_data1 ' ~r~n" + &
"   ~r~n" + &
"   /* order column*/ ~r~n" + &
"   If (@display_key is null) or (@display_key <> 1 ) ~r~n" + &
"   Begin ~r~n" + &
"    Set @select_col = ' select '+substring(@sql_order_col, charindex('rec_id,',@sql_order_col)+ 7 , len(@sql_order_col) - charindex('rec_id,',@sql_order_col) - 6) ~r~n" + &
"   End ~r~n" + &
"   Else ~r~n" + &
"   Begin ~r~n" + &
"    Set @select_col = @sql_order_col ~r~n" + &
"   End ~r~n" + &
"  ~r~n" + &
"   /* the header column*/ ~r~n" + &
"   If (@table_header is not null) and (@table_header = 1) ~r~n" + &
"   Begin ~r~n" + &
"    Select @exec_sql =  @select_col + ' from ('+@sql_order_col+',row_no from ( Select rec_id,row_no '+@exec_sql+' from '+@exec+'  ) dd  union all ' +@table_header_col + ',0 from ids ) a order by rec_id,row_no ' ~r~n" + &
"   End ~r~n" + &
"   Else ~r~n" + &
"   Begin ~r~n" + &
"    Select @exec_sql =  @select_col + ' from ( Select rec_id,row_no '+@exec_sql+' from '+@exec+' ) dd order by rec_id,row_no ' ~r~n" + &
"   End ~r~n" + &
"  ~r~n" + &
"   Set @num = 8 ~r~n" + &
"   BEGIN TRY ~r~n" + &
"    Execute(@exec_sql)    ~r~n" + &
"    Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"   END TRY ~r~n" + &
"   BEGIN CATCH ~r~n" + &
"    truncate table #export_tmp_data ~r~n" + &
"    drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"    truncate table #export_tmp_data1 ~r~n" + &
"    drop table #export_tmp_data1 ~r~n" + &
"  ~r~n" + &
"    Set @return = CONVERT(varchar(10),@@ERROR) ~r~n" + &
"    Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"    return   ~r~n" + &
"   END CATCH ~r~n" + &
"   If convert(int,@return) <> 0  ~r~n" + &
"   Begin  ~r~n" + &
"    truncate table #export_tmp_data ~r~n" + &
"    drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"    truncate table #export_tmp_data1 ~r~n" + &
"    drop table #export_tmp_data1 ~r~n" + &
"  ~r~n" + &
"    Select @err_msg = 'Position:'+convert(varchar,@num)+'; Error:'+@return+'; ErrorNumber:'+ convert(varchar,ERROR_NUMBER()) +'; ErrorSeverity:'+ convert(varchar,ERROR_SEVERITY())+'; ErrorState:'+ convert(varchar,ERROR_STATE())+'; ErrorMessage:'+ ERROR_MESSAGE()  ~r~n" + &
"    return   ~r~n" + &
"   End ~r~n" + &
"  ~r~n" + &
"   truncate table #export_tmp_data ~r~n" + &
"   drop table #export_tmp_data ~r~n" + &
"  ~r~n" + &
"   truncate table #export_tmp_data1 ~r~n" + &
"   drop table #export_tmp_data1 ~r~n" + &
"  ~r~n" + &
"  End  ~r~n" + &
"  Else ~r~n" + &
"  Begin ~r~n" + &
"   Select @err_msg = 'no temp data' ~r~n" + &
"   return    ~r~n" + &
"  End  ~r~n" + &
" End ~r~n" + &
" ~r~n" + &
""
//modified by gavins 20160512 change "Full name" fromat to first name + last name + middle name
is_sql_statements[upperbound(is_sql_statements) + 1] = &
" if exists (SELECT name FROM sysobjects WHERE name = 'sp_contract_search' AND type = 'P')    ~r~n" + &
"     DROP PROCEDURE sp_contract_search ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"  CREATE  PROCEDURE sp_contract_search(  @user_d VARCHAR(10)   )    ~r~n" + &
"  AS        ~r~n" + &
"  DECLARE @display_multi_products VARCHAR(10)     ~r~n" + &
"  SELECT @display_multi_products = option_value FROM security_user_options WHERE user_id = @user_d and option_name='display_multi_product'~t    ~r~n" + &
"  if (@display_multi_products is null) set @display_multi_products = '1'     ~r~n" + &
"       ~r~n" + &
"  /*******initial #temp_ctx_user********/    ~r~n" + &
"  IF object_id('tempdb..#temp_ctx_user') is not null    ~r~n" + &
"  Begin    ~r~n" + &
"  ~tDrop TABLE #temp_ctx_user;    ~r~n" + &
"  End     ~r~n" + &
"       ~r~n" + &
"  /*******initial #temp_right********/    ~r~n" + &
"  IF object_id('tempdb..#temp_right') is not null    ~r~n" + &
"  Begin    ~r~n" + &
"  ~tDrop TABLE #temp_right;    ~r~n" + &
"  End     ~r~n" + &
"      ~r~n" + &
"  /*********prepare #temp_ctx_user data********/    ~r~n" + &
"  SELECT ctx_contacts.user_d,ctx_contract_contacts.ctx_id into #temp_ctx_user    ~r~n" + &
"  FROM ctx_contract_contacts, ctx_contacts       ~r~n" + &
"  WHERE ctx_contacts.contact_id = ctx_contract_contacts.contact_id     ~r~n" + &
"  AND ctx_contract_contacts.ic_area = 'I'    ~r~n" + &
"  UNION         ~r~n" + &
"  SELECT security_group_users.user_id user_d,ctx_group_access.ctx_id    ~r~n" + &
"  FROM ctx_group_access,security_group_users,icred_settings     ~r~n" + &
"  WHERE icred_settings.group_access = 1     ~r~n" + &
"  AND ctx_group_access.group_id = security_group_users.group_id    ~r~n" + &
"      ~r~n" + &
"  /*********prepare #temp_right data********/    ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id,     ~r~n" + &
"  ~t   user_id = ctx_contacts.user_d,     ~r~n" + &
"  ~t   access = (CASE ctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END)   into #temp_right    ~r~n" + &
"  FROM ctx_contract_contacts Left Outer Join     ~r~n" + &
"  (     ~r~n" + &
"  Select ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d      ~r~n" + &
"  From ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1     ~r~n" + &
"  Where ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id And ctx_contacts1.user_d = @user_d     ~r~n" + &
"  Group By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d     ~r~n" + &
"  Having Count(ctx_contract_contacts1.ctx_id) > 1     ~r~n" + &
"  ) ccc     ~r~n" + &
"  On ctx_contract_contacts.ctx_id = ccc.ctx_id     ~r~n" + &
"  ,ctx_contacts     ~r~n" + &
"  WHERE ctx_contacts.user_d = @user_d     ~r~n" + &
"  ~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' )     ~r~n" + &
"  ~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id      ~r~n" + &
"  ~tAND ( ctx_contract_contacts.access IN ('F','R')      ~r~n" + &
"  ~tOR ctx_contract_contacts.owner = 'Y' )     ~r~n" + &
"  ~tAND ctx_contract_contacts.ic_area = 'I'     ~r~n" + &
"  UNION      ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id,    ~r~n" + &
"  ~t   user_id = security_group_users.user_id,     ~r~n" + &
"  ~t   access =  ctx_group_access.access     ~r~n" + &
"  FROM  ctx_group_access ,security_group_users,icred_settings     ~r~n" + &
"  WHERE security_group_users.user_id = @user_d     ~r~n" + &
"     AND ctx_group_access.group_id = security_group_users.group_id     ~r~n" + &
"  ~tAND ctx_group_access.access =      ~r~n" + &
"  ~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access      ~r~n" + &
"  ~t~tFrom ctx_group_access a1,security_group_users u1     ~r~n" + &
"  ~t~tWhere a1.group_id = u1.group_id      ~r~n" + &
"  ~t~tAnd a1.ctx_id = ctx_group_access.ctx_id     ~r~n" + &
"  ~t~tAnd u1.user_id = security_group_users.user_id~t     ~r~n" + &
"  ~t~tAnd a1.access = 'F') Then 'F' Else 'R' End)      ~r~n" + &
"  ~tAND icred_settings.group_access = 1     ~r~n" + &
"  ~tAND ctx_group_access.access in ('F','R')     ~r~n" + &
"  ~tAND NOT EXISTS~t(SELECT 1 FROM ctx_contract_contacts, ctx_contacts     ~r~n" + &
"  ~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )      ~r~n" + &
"  ~t~t~tAND ( ctx_contacts.user_d = security_group_users.user_id )     ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ic_area = 'I' )     ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id )     ~r~n" + &
"  ~t~t~t)     ~r~n" + &
"  UNION     ~r~n" + &
" SELECT b.ctx_id,b.user_id,(CASE WHEN b.rcnt=0 THEN 'F' ELSE 'R' END) access     ~r~n" + &
" FROM    ~r~n" + &
" (    ~r~n" + &
" ~tSELECT DISTINCT a.ctx_id,a.user_id,    ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'F' THEN 1 ELSE 0 END) fcnt,    ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'R' THEN 1 ELSE 0 END) rcnt    ~r~n" + &
" ~tFROM     ~r~n" + &
" ~t(    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=1    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('11','12','13')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
"        union    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '61' THEN 'F' WHEN '62' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=6    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.dvision     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('61','62','63')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
"         union    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '71' THEN 'F' WHEN '72' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=7    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_department     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('71','72','73')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
" ~t~tunion    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '81' THEN 'F' WHEN '82' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=8    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_type     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('81','82','83')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
" ~t) a    ~r~n" + &
" ~tGROUP BY a.ctx_id,a.user_id    ~r~n" + &
"    HAVING SUM(CASE a.access WHEN 'N' THEN 1 ELSE 0 END) = 0    ~r~n" + &
" ) b    ~r~n" + &
"      ~r~n" + &
"  /*********display multi row if ctx have multi product*******/    ~r~n" + &
"  if @display_multi_products = '1'     ~r~n" + &
"  BEGIN           ~r~n" + &
" ~tWITH v_ctx_ccci as    ~r~n" + &
" ~t(    ~r~n" + &
"  ~t SELECT ctx_contract_contacts.ctx_id,       ~r~n" + &
"          'name' = ctx_contacts.first_name +','+ ctx_contacts.last_name +''+ IsNull(ctx_contacts.middle_name,'')    ~r~n" + &
"    ~tFROM  ctx_contract_contacts,ctx_contacts    ~r~n" + &
"    ~tWHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id        ~r~n" + &
"    ~tAND   ctx_contract_contacts.ic_area = 'E'     ~r~n" + &
" ~t),    ~r~n" + &
" ~tv_ctx_ccci2 as     ~r~n" + &
" ~t(     ~r~n" + &
"   ~t select aa.ctx_id,     ~r~n" + &
" ~t      ccci_name = ltrim(stuff((select '; ' + name from v_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))    ~r~n" + &
"   ~t from v_ctx_ccci aa    ~r~n" + &
"   ~t group by aa.ctx_id    ~r~n" + &
" ~t),    ~r~n" + &
" ~tv_ctx_occi as    ~r~n" + &
" ~t(    ~r~n" + &
"    ~tSELECT ctx_contract_contacts.ctx_id,       ~r~n" + &
"          'name' = ctx_contacts.first_name +','+ ctx_contacts.last_name +''+ IsNull(ctx_contacts.middle_name,'')    ~r~n" + &
"    ~tFROM  ctx_contract_contacts,ctx_contacts    ~r~n" + &
"    ~tWHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id        ~r~n" + &
"    ~tAND   ctx_contract_contacts.ic_area = 'I'    ~r~n" + &
" ~t),    ~r~n" + &
" ~tv_ctx_occi2 as     ~r~n" + &
" ~t(     ~r~n" + &
" ~t select aa.ctx_id,     ~r~n" + &
" ~t occi_name = ltrim(stuff((select '; ' + name from v_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))    ~r~n" + &
"      from v_ctx_occi aa    ~r~n" + &
"      group by aa.ctx_id    ~r~n" + &
" ~t)    ~r~n" + &
"  ~tSELECT DISTINCT ctx_basic_info.app_facility,      ~r~n" + &
"  ~tctx_products.product_id product_code,    ~r~n" + &
"  ~tcode_lookup.code product_name,        ~r~n" + &
"  ~tctx_basic_info.effective_date,        ~r~n" + &
"  ~tctx_basic_info.expriation_date,       ~r~n" + &
"  ~tctx_basic_info.status,          ~r~n" + &
"  ~tctx_basic_info.group_multi_loc_id,    ~r~n" + &
"  ~tctx_basic_info.ctx_id,     ~r~n" + &
"  ~tctx_basic_info.master_contract_id,    ~r~n" + &
"  ~tmaster_cnt = (SELECT Count(ctx_basic_info1.ctx_id)     ~r~n" + &
"  ~t~t~tFROM ctx_basic_info ctx_basic_info1      ~r~n" + &
"  ~t~t~tWHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ),    ~r~n" + &
"  ~tctx_basic_info.category,             ~r~n" + &
"  ~tctx_basic_info.facility_id,          ~r~n" + &
"  ~tctx_basic_info.contract_type,        ~r~n" + &
"  ~tcode_lookup1.code product_type,      ~r~n" + &
"  ~tctx_basic_info.reimbursment_menth,    ~r~n" + &
"  ~tctx_basic_info.file_location,        ~r~n" + &
"  ~tctx_basic_info.review_date,          ~r~n" + &
"  ~tctx_basic_info.review_by,            ~r~n" + &
"  ~tctx_basic_info.term_date,            ~r~n" + &
"  ~tctx_basic_info.term_reason,          ~r~n" + &
"  ~tctx_basic_info.last_revis_date,      ~r~n" + &
"  ~tctx_basic_info.other_date_1,         ~r~n" + &
"  ~tctx_basic_info.other_date_2,         ~r~n" + &
"  ~tctx_basic_info.oc_signed_by,         ~r~n" + &
"  ~tctx_basic_info.oc_title,             ~r~n" + &
"  ~tctx_basic_info.oc_department,        ~r~n" + &
"  ~tctx_basic_info.oc_legal_rep,         ~r~n" + &
"  ~tctx_basic_info.cc_signed_by,         ~r~n" + &
"  ~tctx_basic_info.cc_title,             ~r~n" + &
"  ~tctx_basic_info.cc_department,        ~r~n" + &
"  ~tctx_basic_info.cc_legal_rep,         ~r~n" + &
"  ~tctx_basic_info.notes,        ~t     ~r~n" + &
"  ~tctx_basic_info.keyword,              ~r~n" + &
"  ~tctx_basic_info.dvision,              ~r~n" + &
"  ~tctx_basic_info.custom_1,             ~r~n" + &
"  ~tctx_basic_info.custom_2,             ~r~n" + &
"  ~tctx_basic_info.custom_3,             ~r~n" + &
"  ~tctx_basic_info.custom_4,             ~r~n" + &
"  ~tctx_basic_info.custom_5,             ~r~n" + &
"  ~tctx_basic_info.custom_6,             ~r~n" + &
"  ~tctx_basic_info.custom_7,            ~r~n" + &
"  ~tctx_basic_info.custom_8,            ~r~n" + &
"  ~tctx_basic_info.custom_9,            ~r~n" + &
"  ~tctx_basic_info.custom_10,           ~r~n" + &
"  ~tctx_basic_info.group_id,            ~r~n" + &
"  ~tctx_basic_info.revision_reason,     ~r~n" + &
"  ~tctx_basic_info.record_id ,        ~r~n" + &
"  ~towner = upper((SELECT top 1 ctx_contacts.user_d     ~r~n" + &
"  ~t~t~tFROM ctx_contacts,ctx_contract_contacts      ~r~n" + &
"  ~t~t~tWHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )     ~r~n" + &
"  ~t~t~tAND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )      ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.owner = 'Y' )      ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.ic_area = 'I' ) )),      ~r~n" + &
"  ~tcontracted_entity = (SELECT top 1 group_multi_loc.rec_id           ~r~n" + &
"  ~t  ~t~t~tFROM ctx_loc,                  group_multi_loc      ~r~n" + &
"  ~t~t~t~tWHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id)     ~r~n" + &
"  ~t~t~t~tAND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)      ~r~n" + &
"  ~t~t~t~tAND ctx_loc.loc_id = 0),         ~r~n" + &
"  ~tapp_facility.facility_name facility_name,        ~r~n" + &
"  ~tctx_basic_info.custom_date1,           ~r~n" + &
"  ~tctx_basic_info.custom_date2,           ~r~n" + &
"  ~tctx_basic_info.custom_date3,           ~r~n" + &
"  ~tctx_basic_info.custom_date4,       ~r~n" + &
"  ~tctx_basic_info.custom_date5,           ~r~n" + &
"  ~tctx_basic_info.inserted_by_user,         ~r~n" + &
"  ~tctx_basic_info.inserted_at_date_time,           ~r~n" + &
"  ~tctx_basic_info.updated_by_user,        ~r~n" + &
"  ~tctx_basic_info.updated_at_date_time,           ~r~n" + &
"  ~tctx_basic_info.custom_11,           ~r~n" + &
"  ~tctx_basic_info.custom_12,        ~r~n" + &
"  ~tctx_basic_info.custom_13,           ~r~n" + &
"  ~tctx_basic_info.custom_14,           ~r~n" + &
"  ~tctx_basic_info.custom_15,       ~r~n" + &
"  ~tctx_basic_info.custom_16,           ~r~n" + &
"  ~tctx_basic_info.custom_17,           ~r~n" + &
"  ~tctx_basic_info.custom_18,           ~r~n" + &
"  ~tctx_basic_info.custom_19,           ~r~n" + &
"  ~tctx_basic_info.custom_20,          ~r~n" + &
"  ~tctx_basic_info.custom_date6,           ~r~n" + &
"  ~tctx_basic_info.custom_date7,           ~r~n" + &
"  ~tctx_basic_info.custom_date8,       ~r~n" + &
"  ~tctx_basic_info.custom_date9,           ~r~n" + &
"  ~tctx_basic_info.custom_date10,           ~r~n" + &
"  ~tctx_basic_info.custom_date11,           ~r~n" + &
"  ~tctx_basic_info.custom_date12,           ~r~n" + &
"  ~tctx_basic_info.custom_date13,       ~r~n" + &
"  ~tctx_basic_info.custom_date14,           ~r~n" + &
"  ~tctx_basic_info.custom_date15,           ~r~n" + &
"  ~tctx_basic_info.custom_n1,      ~r~n" + &
"  ~tctx_basic_info.custom_n2,           ~r~n" + &
"  ~tctx_basic_info.custom_n3,           ~r~n" + &
"  ~tctx_basic_info.custom_n4,           ~r~n" + &
"  ~tctx_basic_info.custom_n5,           ~r~n" + &
"  ~tctx_basic_info.custom_n6,       ~r~n" + &
"  ~tctx_basic_info.custom_n7,           ~r~n" + &
"  ~tctx_basic_info.custom_n8,           ~r~n" + &
"  ~tctx_basic_info.custom_n9,        ~r~n" + &
"  ~tctx_basic_info.custom_n10,           ~r~n" + &
"  ~tctx_basic_info.custom_n11,           ~r~n" + &
"  ~tctx_basic_info.custom_n12,           ~r~n" + &
"  ~tctx_basic_info.custom_n13,           ~r~n" + &
"  ~tctx_basic_info.custom_n14,           ~r~n" + &
"  ~tctx_basic_info.custom_n15,           ~r~n" + &
"  ~tctx_basic_info.custom_n16,           ~r~n" + &
"  ~tctx_basic_info.custom_n17,           ~r~n" + &
"  ~tctx_basic_info.custom_n18,           ~r~n" + &
"  ~tctx_basic_info.custom_n19,           ~r~n" + &
"  ~tctx_basic_info.custom_n20,           ~r~n" + &
"  ~tctx_basic_info.custom_n21,           ~r~n" + &
"  ~tctx_basic_info.custom_n22,           ~r~n" + &
"  ~tctx_basic_info.custom_n23,           ~r~n" + &
"  ~tctx_basic_info.custom_n24,           ~r~n" + &
"  ~tctx_basic_info.custom_n25,           ~r~n" + &
"  ~tctx_basic_info.version_number,           ~r~n" + &
"  ~tctx_basic_info.version_date,           ~r~n" + &
"  ~tctx_basic_info.master_contract_name ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_1 ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_2 ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_3 ,     ~r~n" + &
"  ~taccess = AA.access   ,     ~r~n" + &
"  ~tcode_lookup2.code status_name,     ~r~n" + &
"  ~tcode_lookup3.code category_name,     ~r~n" + &
"  ~tcode_lookup4.code contract_type_name,     ~r~n" + &
"  ~tcode_lookup5.code dvision_name ,     ~r~n" + &
"  ~tunread_email_cnt = 0,      ~r~n" + &
"  ~tctx_basic_info.custom_percent_1,    ~r~n" + &
"  ~tctx_basic_info.custom_percent_2,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_3,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_4,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_5,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_6,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_7,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_8,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_9,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_10,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n1,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n2,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n3,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n4,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n5,     ~r~n" + &
"  ~tctx_basic_info.custom_status1,     ~r~n" + &
"  ~tctx_basic_info.custom_status2,     ~r~n" + &
"  ~tctx_basic_info.custom_21,     ~r~n" + &
"  ~tctx_basic_info.custom_22,     ~r~n" + &
"  ~tctx_basic_info.custom_n26,     ~r~n" + &
"  ~tctx_basic_info.custom_n27,     ~r~n" + &
"  ~tctx_basic_info.custom_date16,     ~r~n" + &
"  ~tctx_basic_info.custom_date17,     ~r~n" + &
"  ~tapp_facility.city,     ~r~n" + &
"  ~tapp_facility.state,     ~r~n" + &
"  ~tapp_facility.country,     ~r~n" + &
"  ~tapp_facility.zip,     ~r~n" + &
"  ~tapp_facility.street,     ~r~n" + &
"  ~tctx_custom.custom_1 as custom2_custom_1,     ~r~n" + &
"    ctx_custom.custom_2 as custom2_custom_2,        ~r~n" + &
"    ctx_custom.custom_3 as custom2_custom_3,        ~r~n" + &
"    ctx_custom.custom_4 as custom2_custom_4,        ~r~n" + &
"     ctx_custom.custom_5 as custom2_custom_5,        ~r~n" + &
"     ctx_custom.custom_6 as custom2_custom_6,        ~r~n" + &
"      ctx_custom.custom_7 as custom2_custom_7,        ~r~n" + &
"      ctx_custom.custom_8 as custom2_custom_8,        ~r~n" + &
"      ctx_custom.custom_9 as custom2_custom_9,        ~r~n" + &
"      ctx_custom.custom_10 as custom2_custom_10,        ~r~n" + &
"      ctx_custom.custom_11 as custom2_custom_11,        ~r~n" + &
"      ctx_custom.custom_12 as custom2_custom_12,        ~r~n" + &
"      ctx_custom.custom_13 as custom2_custom_13,        ~r~n" + &
"      ctx_custom.custom_14 as custom2_custom_14,        ~r~n" + &
"      ctx_custom.custom_15 as custom2_custom_15,        ~r~n" + &
"      ctx_custom.custom_16 as custom2_custom_16,        ~r~n" + &
"      ctx_custom.custom_17 as custom2_custom_17,        ~r~n" + &
"      ctx_custom.custom_18 as custom2_custom_18,        ~r~n" + &
"      ctx_custom.custom_19 as custom2_custom_19,        ~r~n" + &
"      ctx_custom.custom_20 as custom2_custom_20,        ~r~n" + &
"      ctx_custom.custom_date1 as custom2_custom_date1,        ~r~n" + &
"      ctx_custom.custom_date2 as custom2_custom_date2,        ~r~n" + &
"      ctx_custom.custom_date3 as custom2_custom_date3,        ~r~n" + &
"      ctx_custom.custom_date4 as custom2_custom_date4,        ~r~n" + &
"      ctx_custom.custom_date5 as custom2_custom_date5,        ~r~n" + &
"      ctx_custom.custom_date6 as custom2_custom_date6,        ~r~n" + &
"      ctx_custom.custom_date7 as custom2_custom_date7,        ~r~n" + &
"      ctx_custom.custom_date8 as custom2_custom_date8,        ~r~n" + &
"      ctx_custom.custom_date9 as custom2_custom_date9,        ~r~n" + &
"      ctx_custom.custom_date10 as custom2_custom_date10,        ~r~n" + &
"      ctx_custom.custom_date11 as custom2_custom_date11,        ~r~n" + &
"      ctx_custom.custom_date12 as custom2_custom_date12,        ~r~n" + &
"      ctx_custom.custom_date13 as custom2_custom_date13,        ~r~n" + &
"      ctx_custom.custom_date14 as custom2_custom_date14,        ~r~n" + &
"      ctx_custom.custom_date15 as custom2_custom_date15,        ~r~n" + &
"      ctx_custom.custom_n1 as custom2_custom_n1,        ~r~n" + &
"      ctx_custom.custom_n2 as custom2_custom_n2,        ~r~n" + &
"      ctx_custom.custom_n3 as custom2_custom_n3,        ~r~n" + &
"      ctx_custom.custom_n4 as custom2_custom_n4,        ~r~n" + &
"      ctx_custom.custom_n5 as custom2_custom_n5,        ~r~n" + &
"      ctx_custom.custom_n6 as custom2_custom_n6,        ~r~n" + &
"      ctx_custom.custom_n7 as custom2_custom_n7,        ~r~n" + &
"      ctx_custom.custom_n8 as custom2_custom_n8,        ~r~n" + &
"      ctx_custom.custom_n9 as custom2_custom_n9,        ~r~n" + &
"      ctx_custom.custom_n10 as custom2_custom_n10,        ~r~n" + &
"      ctx_custom.custom_n11 as custom2_custom_n11,        ~r~n" + &
"      ctx_custom.custom_n12 as custom2_custom_n12,        ~r~n" + &
"      ctx_custom.custom_n13 as custom2_custom_n13,        ~r~n" + &
"      ctx_custom.custom_n14 as custom2_custom_n14,        ~r~n" + &
"      ctx_custom.custom_n15 as custom2_custom_n15,        ~r~n" + &
"      ctx_custom.custom_n16 as custom2_custom_n16,        ~r~n" + &
"      ctx_custom.custom_n17 as custom2_custom_n17,        ~r~n" + &
"      ctx_custom.custom_n18 as custom2_custom_n18,        ~r~n" + &
"      ctx_custom.custom_n19 as custom2_custom_n19,        ~r~n" + &
"      ctx_custom.custom_n20 as custom2_custom_n20,        ~r~n" + &
"      ctx_custom.custom_n21 as custom2_custom_n21,        ~r~n" + &
"      ctx_custom.custom_n22 as custom2_custom_n22,        ~r~n" + &
"      ctx_custom.custom_n23 as custom2_custom_n23,        ~r~n" + &
"      ctx_custom.custom_n24 as custom2_custom_n24,        ~r~n" + &
"      ctx_custom.custom_n25 as custom2_custom_n25,        ~r~n" + &
"      ctx_custom.custom_21 as custom2_custom_21,        ~r~n" + &
"      ctx_custom.custom_22 as custom2_custom_22,        ~r~n" + &
"      ctx_custom.custom_notes_1 as custom2_custom_notes_1,       ~r~n" + &
"      ctx_custom.custom_notes_2 as custom2_custom_notes_2,        ~r~n" + &
"      ctx_custom.custom_notes_3 as custom2_custom_notes_3,        ~r~n" + &
"      ctx_custom.custom_notes_4 as custom2_custom_notes_4,        ~r~n" + &
"      ctx_custom.custom_notes_5 as custom2_custom_notes_5,        ~r~n" + &
"      ctx_custom.custom_money_1 as custom2_custom_money_1,        ~r~n" + &
"      ctx_custom.custom_money_2 as custom2_custom_money_2,        ~r~n" + &
"      ctx_custom.custom_money_3 as custom2_custom_money_3,        ~r~n" + &
"      ctx_custom.custom_percent_1 as custom2_custom_percent_1,        ~r~n" + &
"  ~tctx_custom.custom_percent_2 as custom2_custom_percent_2,        ~r~n" + &
"      ctx_custom.custom_percent_3 as custom2_custom_percent_3,        ~r~n" + &
"      ctx_custom.custom_percent_4 as custom2_custom_percent_4,        ~r~n" + &
"      ctx_custom.custom_percent_5 as custom2_custom_percent_5,        ~r~n" + &
"      ctx_custom.custom_percent_6 as custom2_custom_percent_6,        ~r~n" + &
"      ctx_custom.custom_percent_7 as custom2_custom_percent_7,        ~r~n" + &
"      ctx_custom.custom_percent_8 as custom2_custom_percent_8,        ~r~n" + &
"      ctx_custom.custom_percent_9 as custom2_custom_percent_9,        ~r~n" + &
"      ctx_custom.custom_percent_10 as custom2_custom_percent_10,       ~r~n" + &
"      has_docs = Isnull(ctx_am_documents.has_docs,0),     ~r~n" + &
"     ctx_basic_info.contract_department,     ~r~n" + &
"     v_ctx_occi2.occi_name,    ~r~n" + &
"     v_ctx_ccci2.ccci_name    ~r~n" + &
"  ~tFROM  ctx_basic_info       ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_ccci2 ON ctx_basic_info.ctx_id = v_ctx_ccci2.ctx_id~t     ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_occi2 ON ctx_basic_info.ctx_id = v_ctx_occi2.ctx_id    ~r~n" + &
"  ~tLEFT OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id       ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup ON ctx_products.product_id = code_lookup.lookup_code       ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup1 ON ctx_products.product_type = code_lookup1.lookup_code    ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id       ~r~n" + &
"  ~tLEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id      ~r~n" + &
"  ~tLEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id,       ~r~n" + &
"  ~t#temp_right AA      ~r~n" + &
"  ~tWHERE ctx_basic_info.ctx_id = AA.ctx_id and ctx_basic_info.is_template = 0      ~r~n" + &
"  ~tORDER BY ctx_basic_info.master_contract_id Asc, ctx_basic_info.ctx_id  Asc         ~r~n" + &
"  END     ~r~n" + &
"  /*********display one row if ctx have multi product*******/    ~r~n" + &
"  else     ~r~n" + &
"  BEGIN     ~r~n" + &
"  ~tWITH v_ctx_ccci as    ~r~n" + &
" ~t(    ~r~n" + &
"  ~t SELECT ctx_contract_contacts.ctx_id,       ~r~n" + &
"          'name' = ctx_contacts.first_name +','+ ctx_contacts.last_name +''+ IsNull(ctx_contacts.middle_name,'')    ~r~n" + &
"    ~tFROM  ctx_contract_contacts,ctx_contacts    ~r~n" + &
"    ~tWHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id        ~r~n" + &
"    ~tAND   ctx_contract_contacts.ic_area = 'E'     ~r~n" + &
" ~t),    ~r~n" + &
" ~tv_ctx_ccci2 as     ~r~n" + &
" ~t(     ~r~n" + &
"   ~t select aa.ctx_id,     ~r~n" + &
" ~t      ccci_name = ltrim(stuff((select '; ' + name from v_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))    ~r~n" + &
"   ~t from v_ctx_ccci aa    ~r~n" + &
"   ~t group by aa.ctx_id    ~r~n" + &
" ~t),    ~r~n" + &
" ~tv_ctx_occi as    ~r~n" + &
" ~t(    ~r~n" + &
"    ~tSELECT ctx_contract_contacts.ctx_id,       ~r~n" + &
"          'name' = ctx_contacts.first_name +','+ ctx_contacts.last_name +''+ IsNull(ctx_contacts.middle_name,'')    ~r~n" + &
"    ~tFROM  ctx_contract_contacts,ctx_contacts    ~r~n" + &
"    ~tWHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id        ~r~n" + &
"    ~tAND   ctx_contract_contacts.ic_area = 'I'    ~r~n" + &
" ~t),    ~r~n" + &
" ~tv_ctx_occi2 as     ~r~n" + &
" ~t(     ~r~n" + &
" ~t select aa.ctx_id,     ~r~n" + &
" ~t occi_name = ltrim(stuff((select '; ' + name from v_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))    ~r~n" + &
"      from v_ctx_occi aa    ~r~n" + &
"      group by aa.ctx_id    ~r~n" + &
" ~t),    ~r~n" + &
"  ~tv_ctx_products as    ~r~n" + &
"  ~t(     ~r~n" + &
"  ~t  select a.ctx_id,a.product_id,a.product_type,b.code product_name,c.code product_type_name     ~r~n" + &
"  ~t  from ctx_products a     ~r~n" + &
"  ~t  LEFT OUTER JOIN code_lookup b ON a.product_id = b.lookup_code       ~r~n" + &
"      LEFT OUTER JOIN code_lookup c ON a.product_type = c.lookup_code     ~r~n" + &
"  ~t ),    ~r~n" + &
"  ~tv_ctx_products2 as     ~r~n" + &
"  ~t(     ~r~n" + &
"  ~t  select aa.ctx_id,     ~r~n" + &
"    ~t  product_id = (select top 1 product_id from v_ctx_products where ctx_id = aa.ctx_id),    ~r~n" + &
"  ~t  product_name = stuff((select ',' + product_name from v_ctx_products where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''),    ~r~n" + &
"  ~t  product_type_name = stuff((select ',' + product_type_name from v_ctx_products where ctx_id=aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , '')    ~r~n" + &
"       from v_ctx_products aa    ~r~n" + &
"       group by aa.ctx_id    ~r~n" + &
"      )    ~r~n" + &
"  ~tSELECT DISTINCT      ~r~n" + &
"  ~tctx_basic_info.app_facility,         ~r~n" + &
"  ~tv_ctx_products2.product_id product_code,         ~r~n" + &
"  ~tv_ctx_products2.product_name,            ~r~n" + &
"  ~tctx_basic_info.effective_date,           ~r~n" + &
"  ~tctx_basic_info.expriation_date,            ~r~n" + &
"  ~tctx_basic_info.status,          ~r~n" + &
"  ~tctx_basic_info.group_multi_loc_id,       ~r~n" + &
"  ~tctx_basic_info.ctx_id,     ~r~n" + &
"   ~tctx_basic_info.master_contract_id,    ~r~n" + &
"   ~tmaster_cnt = (SELECT Count(ctx_basic_info1.ctx_id)    ~r~n" + &
"  ~t~t~tFROM ctx_basic_info ctx_basic_info1      ~r~n" + &
"  ~t~t~tWHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ),      ~r~n" + &
"  ~tctx_basic_info.category,             ~r~n" + &
"  ~tctx_basic_info.facility_id,          ~r~n" + &
"  ~tctx_basic_info.contract_type,            ~r~n" + &
"  ~tv_ctx_products2.product_type_name product_type,    ~r~n" + &
"  ~tctx_basic_info.reimbursment_menth,            ~r~n" + &
"  ~tctx_basic_info.file_location,         ~r~n" + &
"  ~tctx_basic_info.review_date,            ~r~n" + &
"  ~tctx_basic_info.review_by,          ~r~n" + &
"  ~tctx_basic_info.term_date,            ~r~n" + &
"  ~tctx_basic_info.term_reason,          ~r~n" + &
"  ~tctx_basic_info.last_revis_date,       ~r~n" + &
"  ~tctx_basic_info.other_date_1,          ~r~n" + &
"  ~tctx_basic_info.other_date_2,          ~r~n" + &
"  ~tctx_basic_info.oc_signed_by,            ~r~n" + &
"  ~tctx_basic_info.oc_title,           ~r~n" + &
"  ~tctx_basic_info.oc_department,            ~r~n" + &
"  ~tctx_basic_info.oc_legal_rep,            ~r~n" + &
"  ~tctx_basic_info.cc_signed_by,          ~r~n" + &
"  ~tctx_basic_info.cc_title,            ~r~n" + &
"  ~tctx_basic_info.cc_department,            ~r~n" + &
"  ~tctx_basic_info.cc_legal_rep,          ~r~n" + &
"  ~tctx_basic_info.notes,            ~r~n" + &
"  ~tctx_basic_info.keyword,            ~r~n" + &
"  ~tctx_basic_info.dvision,        ~r~n" + &
"  ~tctx_basic_info.custom_1,            ~r~n" + &
"  ~tctx_basic_info.custom_2,            ~r~n" + &
"  ~tctx_basic_info.custom_3,            ~r~n" + &
"  ~tctx_basic_info.custom_4,            ~r~n" + &
"  ~tctx_basic_info.custom_5,          ~r~n" + &
"  ~tctx_basic_info.custom_6,           ~r~n" + &
"  ~tctx_basic_info.custom_7,            ~r~n" + &
"  ~tctx_basic_info.custom_8,      ~r~n" + &
"  ~tctx_basic_info.custom_9,            ~r~n" + &
"  ~tctx_basic_info.custom_10,         ~r~n" + &
"  ~tctx_basic_info.group_id,     ~r~n" + &
"  ~tctx_basic_info.revision_reason,       ~r~n" + &
"  ~tctx_basic_info.record_id ,        ~r~n" + &
"  ~towner = upper((SELECT top 1 ctx_contacts.user_d          ~r~n" + &
"  ~t~t~tFROM ctx_contacts,ctx_contract_contacts      ~r~n" + &
"  ~t~t~tWHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )      ~r~n" + &
"  ~t~t~tAND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )      ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.owner = 'Y' )      ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.ic_area = 'I' ) )),       ~r~n" + &
"  ~tcontracted_entity = (SELECT top 1 group_multi_loc.rec_id       ~r~n" + &
"  ~t  ~t~t~tFROM ctx_loc,                  group_multi_loc      ~r~n" + &
"  ~t~t~t~tWHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id)      ~r~n" + &
"  ~t~t~t~tAND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)      ~r~n" + &
"  ~t~t~t~tAND ctx_loc.loc_id = 0),         ~r~n" + &
"  ~tapp_facility.facility_name facility_name,        ~r~n" + &
"  ~tctx_basic_info.custom_date1,           ~r~n" + &
"  ~tctx_basic_info.custom_date2,           ~r~n" + &
"  ~tctx_basic_info.custom_date3,           ~r~n" + &
"  ~tctx_basic_info.custom_date4,       ~r~n" + &
"  ~tctx_basic_info.custom_date5,           ~r~n" + &
"  ~tctx_basic_info.inserted_by_user,         ~r~n" + &
"  ~tctx_basic_info.inserted_at_date_time,     ~r~n" + &
"  ~tctx_basic_info.updated_by_user,        ~r~n" + &
"  ~tctx_basic_info.updated_at_date_time,      ~r~n" + &
"  ~tctx_basic_info.custom_11,           ~r~n" + &
"  ~tctx_basic_info.custom_12,        ~r~n" + &
"  ~tctx_basic_info.custom_13,           ~r~n" + &
"  ~tctx_basic_info.custom_14,           ~r~n" + &
"  ~tctx_basic_info.custom_15,       ~r~n" + &
"  ~tctx_basic_info.custom_16,           ~r~n" + &
"  ~tctx_basic_info.custom_17,           ~r~n" + &
"  ~tctx_basic_info.custom_18,           ~r~n" + &
"  ~tctx_basic_info.custom_19,           ~r~n" + &
"  ~tctx_basic_info.custom_20,          ~r~n" + &
"  ~tctx_basic_info.custom_date6,         ~r~n" + &
"  ~tctx_basic_info.custom_date7,        ~r~n" + &
"  ~tctx_basic_info.custom_date8,       ~r~n" + &
"  ~tctx_basic_info.custom_date9,         ~r~n" + &
"  ~tctx_basic_info.custom_date10,        ~r~n" + &
"  ~tctx_basic_info.custom_date11,       ~r~n" + &
"  ~tctx_basic_info.custom_date12,        ~r~n" + &
"  ~tctx_basic_info.custom_date13,       ~r~n" + &
"  ~tctx_basic_info.custom_date14,        ~r~n" + &
"  ~tctx_basic_info.custom_date15,        ~r~n" + &
"  ~tctx_basic_info.custom_n1,      ~r~n" + &
"  ~tctx_basic_info.custom_n2,           ~r~n" + &
"  ~tctx_basic_info.custom_n3,           ~r~n" + &
"  ~tctx_basic_info.custom_n4,           ~r~n" + &
"  ~tctx_basic_info.custom_n5,           ~r~n" + &
"  ~tctx_basic_info.custom_n6,       ~r~n" + &
"  ~tctx_basic_info.custom_n7,        ~r~n" + &
"  ~tctx_basic_info.custom_n8,           ~r~n" + &
"  ~tctx_basic_info.custom_n9,        ~r~n" + &
"  ~tctx_basic_info.custom_n10,           ~r~n" + &
"  ~tctx_basic_info.custom_n11,           ~r~n" + &
"  ~tctx_basic_info.custom_n12,           ~r~n" + &
"  ~tctx_basic_info.custom_n13,           ~r~n" + &
"  ~tctx_basic_info.custom_n14,           ~r~n" + &
"  ~tctx_basic_info.custom_n15,           ~r~n" + &
"  ~tctx_basic_info.custom_n16,           ~r~n" + &
"  ~tctx_basic_info.custom_n17,           ~r~n" + &
"  ~tctx_basic_info.custom_n18,           ~r~n" + &
"  ~tctx_basic_info.custom_n19,           ~r~n" + &
"  ~tctx_basic_info.custom_n20,           ~r~n" + &
"  ~tctx_basic_info.custom_n21,           ~r~n" + &
"  ~tctx_basic_info.custom_n22,           ~r~n" + &
"  ~tctx_basic_info.custom_n23,           ~r~n" + &
"  ~tctx_basic_info.custom_n24,           ~r~n" + &
"  ~tctx_basic_info.custom_n25,           ~r~n" + &
"  ~tctx_basic_info.version_number,       ~r~n" + &
"  ~tctx_basic_info.version_date,          ~r~n" + &
"  ~tctx_basic_info.master_contract_name ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_1 ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_2 ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_3 ,     ~r~n" + &
"  ~taccess = AA.access   ,     ~r~n" + &
"  ~tcode_lookup2.code status_name,     ~r~n" + &
"  ~tcode_lookup3.code category_name,     ~r~n" + &
"  ~tcode_lookup4.code contract_type_name,     ~r~n" + &
"  ~tcode_lookup5.code dvision_name ,     ~r~n" + &
"  ~tunread_email_cnt = 0,      ~r~n" + &
"  ~tctx_basic_info.custom_percent_1,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_2,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_3,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_4,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_5,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_6,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_7,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_8,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_9,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_10,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n1,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n2,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n3,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n4,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n5,     ~r~n" + &
"  ~tctx_basic_info.custom_status1,     ~r~n" + &
"  ~tctx_basic_info.custom_status2,     ~r~n" + &
"  ~tctx_basic_info.custom_21,     ~r~n" + &
"  ~tctx_basic_info.custom_22,     ~r~n" + &
"  ~tctx_basic_info.custom_n26,     ~r~n" + &
"  ~tctx_basic_info.custom_n27,     ~r~n" + &
"  ~tctx_basic_info.custom_date16,     ~r~n" + &
"  ~tctx_basic_info.custom_date17,     ~r~n" + &
"  ~tapp_facility.city,     ~r~n" + &
"  ~tapp_facility.state,     ~r~n" + &
"  ~tapp_facility.country,     ~r~n" + &
"  ~tapp_facility.zip,     ~r~n" + &
"  ~tapp_facility.street,     ~r~n" + &
"  ~tctx_custom.custom_1 as custom2_custom_1,       ~r~n" + &
"      ctx_custom.custom_2 as custom2_custom_2,       ~r~n" + &
"      ctx_custom.custom_3 as custom2_custom_3,       ~r~n" + &
"      ctx_custom.custom_4 as custom2_custom_4,       ~r~n" + &
"      ctx_custom.custom_5 as custom2_custom_5,       ~r~n" + &
"      ctx_custom.custom_6 as custom2_custom_6,        ~r~n" + &
"      ctx_custom.custom_7 as custom2_custom_7,        ~r~n" + &
"      ctx_custom.custom_8 as custom2_custom_8,        ~r~n" + &
"      ctx_custom.custom_9 as custom2_custom_9,        ~r~n" + &
"      ctx_custom.custom_10 as custom2_custom_10,        ~r~n" + &
"      ctx_custom.custom_11 as custom2_custom_11,        ~r~n" + &
"     ctx_custom.custom_12 as custom2_custom_12,        ~r~n" + &
"      ctx_custom.custom_13 as custom2_custom_13,        ~r~n" + &
"      ctx_custom.custom_14 as custom2_custom_14,        ~r~n" + &
"      ctx_custom.custom_15 as custom2_custom_15,        ~r~n" + &
"      ctx_custom.custom_16 as custom2_custom_16,        ~r~n" + &
"      ctx_custom.custom_17 as custom2_custom_17,        ~r~n" + &
"      ctx_custom.custom_18 as custom2_custom_18,        ~r~n" + &
"      ctx_custom.custom_19 as custom2_custom_19,        ~r~n" + &
"      ctx_custom.custom_20 as custom2_custom_20,        ~r~n" + &
"      ctx_custom.custom_date1 as custom2_custom_date1,        ~r~n" + &
"    ctx_custom.custom_date2 as custom2_custom_date2,        ~r~n" + &
"     ctx_custom.custom_date3 as custom2_custom_date3,        ~r~n" + &
"     ctx_custom.custom_date4 as custom2_custom_date4,        ~r~n" + &
"      ctx_custom.custom_date5 as custom2_custom_date5,        ~r~n" + &
"      ctx_custom.custom_date6 as custom2_custom_date6,        ~r~n" + &
"      ctx_custom.custom_date7 as custom2_custom_date7,        ~r~n" + &
"      ctx_custom.custom_date8 as custom2_custom_date8,        ~r~n" + &
"      ctx_custom.custom_date9 as custom2_custom_date9,        ~r~n" + &
"      ctx_custom.custom_date10 as custom2_custom_date10,        ~r~n" + &
"      ctx_custom.custom_date11 as custom2_custom_date11,        ~r~n" + &
"      ctx_custom.custom_date12 as custom2_custom_date12,        ~r~n" + &
"      ctx_custom.custom_date13 as custom2_custom_date13,        ~r~n" + &
"      ctx_custom.custom_date14 as custom2_custom_date14,        ~r~n" + &
"      ctx_custom.custom_date15 as custom2_custom_date15,        ~r~n" + &
"      ctx_custom.custom_n1 as custom2_custom_n1,        ~r~n" + &
"      ctx_custom.custom_n2 as custom2_custom_n2,        ~r~n" + &
"      ctx_custom.custom_n3 as custom2_custom_n3,        ~r~n" + &
"      ctx_custom.custom_n4 as custom2_custom_n4,        ~r~n" + &
"      ctx_custom.custom_n5 as custom2_custom_n5,        ~r~n" + &
"      ctx_custom.custom_n6 as custom2_custom_n6,        ~r~n" + &
"      ctx_custom.custom_n7 as custom2_custom_n7,        ~r~n" + &
"      ctx_custom.custom_n8 as custom2_custom_n8,        ~r~n" + &
"      ctx_custom.custom_n9 as custom2_custom_n9,        ~r~n" + &
"      ctx_custom.custom_n10 as custom2_custom_n10,        ~r~n" + &
"      ctx_custom.custom_n11 as custom2_custom_n11,        ~r~n" + &
"      ctx_custom.custom_n12 as custom2_custom_n12,        ~r~n" + &
"      ctx_custom.custom_n13 as custom2_custom_n13,        ~r~n" + &
"     ctx_custom.custom_n14 as custom2_custom_n14,        ~r~n" + &
"      ctx_custom.custom_n15 as custom2_custom_n15,        ~r~n" + &
"      ctx_custom.custom_n16 as custom2_custom_n16,       ~r~n" + &
"      ctx_custom.custom_n17 as custom2_custom_n17,        ~r~n" + &
"      ctx_custom.custom_n18 as custom2_custom_n18,        ~r~n" + &
"      ctx_custom.custom_n19 as custom2_custom_n19,        ~r~n" + &
"      ctx_custom.custom_n20 as custom2_custom_n20,        ~r~n" + &
"      ctx_custom.custom_n21 as custom2_custom_n21,        ~r~n" + &
"      ctx_custom.custom_n22 as custom2_custom_n22,        ~r~n" + &
"      ctx_custom.custom_n23 as custom2_custom_n23,        ~r~n" + &
"      ctx_custom.custom_n24 as custom2_custom_n24,        ~r~n" + &
"      ctx_custom.custom_n25 as custom2_custom_n25,        ~r~n" + &
"      ctx_custom.custom_21 as custom2_custom_21,        ~r~n" + &
"      ctx_custom.custom_22 as custom2_custom_22,        ~r~n" + &
"      ctx_custom.custom_notes_1 as custom2_custom_notes_1,       ~r~n" + &
"      ctx_custom.custom_notes_2 as custom2_custom_notes_2,        ~r~n" + &
"      ctx_custom.custom_notes_3 as custom2_custom_notes_3,        ~r~n" + &
"      ctx_custom.custom_notes_4 as custom2_custom_notes_4,        ~r~n" + &
"      ctx_custom.custom_notes_5 as custom2_custom_notes_5,        ~r~n" + &
"      ctx_custom.custom_money_1 as custom2_custom_money_1,        ~r~n" + &
"      ctx_custom.custom_money_2 as custom2_custom_money_2,        ~r~n" + &
"      ctx_custom.custom_money_3 as custom2_custom_money_3,        ~r~n" + &
"      ctx_custom.custom_percent_1 as custom2_custom_percent_1,        ~r~n" + &
"      ctx_custom.custom_percent_2 as custom2_custom_percent_2,        ~r~n" + &
"      ctx_custom.custom_percent_3 as custom2_custom_percent_3,        ~r~n" + &
"      ctx_custom.custom_percent_4 as custom2_custom_percent_4,        ~r~n" + &
"      ctx_custom.custom_percent_5 as custom2_custom_percent_5,        ~r~n" + &
"      ctx_custom.custom_percent_6 as custom2_custom_percent_6,        ~r~n" + &
"      ctx_custom.custom_percent_7 as custom2_custom_percent_7,        ~r~n" + &
"      ctx_custom.custom_percent_8 as custom2_custom_percent_8,        ~r~n" + &
"      ctx_custom.custom_percent_9 as custom2_custom_percent_9,        ~r~n" + &
"      ctx_custom.custom_percent_10 as custom2_custom_percent_10,       ~r~n" + &
"      has_docs = Isnull(ctx_am_documents.has_docs,0),     ~r~n" + &
"     ctx_basic_info.contract_department,     ~r~n" + &
"     v_ctx_occi2.occi_name,    ~r~n" + &
"     v_ctx_ccci2.ccci_name    ~r~n" + &
"  ~tFROM  ctx_basic_info     ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_ccci2 ON ctx_basic_info.ctx_id = v_ctx_ccci2.ctx_id~t     ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_occi2 ON ctx_basic_info.ctx_id = v_ctx_occi2.ctx_id    ~r~n" + &
"  ~tLEFT OUTER JOIN v_ctx_products2 ON ctx_basic_info.ctx_id = v_ctx_products2.ctx_id        ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code~t    ~r~n" + &
"  ~tLEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id       ~r~n" + &
"  ~tLEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id     ~r~n" + &
"  ~tLEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id,       ~r~n" + &
"  ~t#temp_right AA      ~r~n" + &
"  ~tWHERE ctx_basic_info.ctx_id = AA.ctx_id and ctx_basic_info.is_template = 0      ~r~n" + &
"  ~tORDER BY ctx_basic_info.master_contract_id Asc, ctx_basic_info.ctx_id  Asc       ~r~n" + &
"  END   "

//modified by gavins 20160512 change "Full name" fromat to first name + last name + middle name
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"  If Exists ( Select 1 From sysobjects where type = 'P' and name = 'sp_contract_rowset' )    ~r~n" + &
"  Begin    ~r~n" + &
"  Drop Procedure sp_contract_rowset     ~r~n" + &
"  End      ~r~n"  

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"  CREATE procedure sp_contract_rowset( @user_d  varchar(50)  )    ~r~n" + &
"   AS    ~r~n" + &
"  DECLARE @display_multi_products VARCHAR(10)      ~r~n" + &
"      ~r~n" + &
"    BEGIN    ~r~n" + &
"       ~r~n" + &
"   SELECT @display_multi_products = option_value FROM security_user_options WHERE user_id = @user_d and option_name='display_multi_product'      ~r~n" + &
"   if (@display_multi_products is null) set @display_multi_products = '1'      ~r~n" + &
"   TRUNCATE TABLE ctx_basic_info_pagedata    ~r~n" + &
"    END    ~r~n" + &
"         ~r~n" + &
"   /*********display multi row if ctx have multi product*******/     ~r~n" + &
"   if @display_multi_products = '1'        ~r~n" + &
"   BEGIN            ~r~n" + &
"   WITH v_ctx_ccci as     ~r~n" + &
"   (     ~r~n" + &
"     SELECT ctx_contract_contacts.ctx_id,        ~r~n" + &
"           'name' = ctx_contacts.first_name +','+ ctx_contacts.last_name +''+ IsNull(ctx_contacts.middle_name,'')     ~r~n" + &
"      FROM  ctx_contract_contacts,ctx_contacts     ~r~n" + &
"      WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id         ~r~n" + &
"      AND   ctx_contract_contacts.ic_area = 'E'      ~r~n" + &
"   ),     ~r~n" + &
"   v_ctx_ccci2 as      ~r~n" + &
"   (      ~r~n" + &
"      select aa.ctx_id,      ~r~n" + &
"         ccci_name = ltrim(stuff((select '; ' + name from v_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))     ~r~n" + &
"      from v_ctx_ccci aa     ~r~n" + &
"      group by aa.ctx_id     ~r~n" + &
"   ),     ~r~n" + &
"   v_ctx_occi as     ~r~n" + &
"   (     ~r~n" + &
"      SELECT ctx_contract_contacts.ctx_id,        ~r~n" + &
"           'name' = ctx_contacts.first_name +','+ ctx_contacts.last_name +''+ IsNull(ctx_contacts.middle_name,'')     ~r~n" + &
"      FROM  ctx_contract_contacts,ctx_contacts     ~r~n" + &
"      WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id         ~r~n" + &
"      AND   ctx_contract_contacts.ic_area = 'I'     ~r~n" + &
"   ),     ~r~n" + &
"   v_ctx_occi2 as      ~r~n" + &
"   (      ~r~n" + &
"    select aa.ctx_id,      ~r~n" + &
"    occi_name = ltrim(stuff((select '; ' + name from v_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))     ~r~n" + &
"       from v_ctx_occi aa     ~r~n" + &
"       group by aa.ctx_id     ~r~n" + &
"   )     ~r~n" + &
"  insert ctx_basic_info_pagedata     ~r~n" + &
"    SELECT DISTINCT ctx_basic_info.app_facility,       ~r~n" + &
"    ctx_products.product_id product_code,     ~r~n" + &
"    code_lookup.code product_name,         ~r~n" + &
"    ctx_basic_info.effective_date,         ~r~n" + &
"    ctx_basic_info.expriation_date,        ~r~n" + &
"    ctx_basic_info.status,           ~r~n" + &
"    ctx_basic_info.group_multi_loc_id,     ~r~n" + &
"    ctx_basic_info.ctx_id,      ~r~n" + &
"    ctx_basic_info.master_contract_id,     ~r~n" + &
"    master_cnt = (SELECT Count(ctx_basic_info1.ctx_id)      ~r~n" + &
"      FROM ctx_basic_info ctx_basic_info1       ~r~n" + &
"      WHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ),     ~r~n" + &
"    ctx_basic_info.category,              ~r~n" + &
"    ctx_basic_info.facility_id,           ~r~n" + &
"    ctx_basic_info.contract_type,         ~r~n" + &
"    code_lookup1.code product_type,       ~r~n" + &
"    ctx_basic_info.reimbursment_menth,     ~r~n" + &
"    ctx_basic_info.file_location,         ~r~n" + &
"    ctx_basic_info.review_date,           ~r~n" + &
"    ctx_basic_info.review_by,             ~r~n" + &
"    ctx_basic_info.term_date,             ~r~n" + &
"    ctx_basic_info.term_reason,           ~r~n" + &
"    ctx_basic_info.last_revis_date,       ~r~n" + &
"    ctx_basic_info.other_date_1,          ~r~n" + &
"    ctx_basic_info.other_date_2,          ~r~n" + &
"    ctx_basic_info.oc_signed_by,          ~r~n" + &
"    ctx_basic_info.oc_title,              ~r~n" + &
"    ctx_basic_info.oc_department,         ~r~n" + &
"    ctx_basic_info.oc_legal_rep,          ~r~n" + &
"    ctx_basic_info.cc_signed_by,          ~r~n" + &
"    ctx_basic_info.cc_title,              ~r~n" + &
"    ctx_basic_info.cc_department,         ~r~n" + &
"    ctx_basic_info.cc_legal_rep,          ~r~n" + &
"    ctx_basic_info.notes,               ~r~n" + &
"    ctx_basic_info.keyword,               ~r~n" + &
"    ctx_basic_info.dvision,               ~r~n" + &
"    ctx_basic_info.custom_1,              ~r~n" + &
"    ctx_basic_info.custom_2,              ~r~n" + &
"    ctx_basic_info.custom_3,              ~r~n" + &
"    ctx_basic_info.custom_4,              ~r~n" + &
"    ctx_basic_info.custom_5,              ~r~n" + &
"    ctx_basic_info.custom_6,              ~r~n" + &
"    ctx_basic_info.custom_7,             ~r~n" + &
"    ctx_basic_info.custom_8,             ~r~n" + &
"    ctx_basic_info.custom_9,             ~r~n" + &
"    ctx_basic_info.custom_10,            ~r~n" + &
"    ctx_basic_info.group_id,             ~r~n" + &
"    ctx_basic_info.revision_reason,      ~r~n" + &
"    ctx_basic_info.record_id ,         ~r~n" + &
"    owner = upper((SELECT top 1 ctx_contacts.user_d      ~r~n" + &
"      FROM ctx_contacts,ctx_contract_contacts       ~r~n" + &
"      WHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )      ~r~n" + &
"      AND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )       ~r~n" + &
"        AND ( ctx_contract_contacts.owner = 'Y' )       ~r~n" + &
"        AND ( ctx_contract_contacts.ic_area = 'I' ) )),       ~r~n" + &
"    contracted_entity = (SELECT top 1 group_multi_loc.rec_id            ~r~n" + &
"         FROM ctx_loc,                  group_multi_loc       ~r~n" + &
"       WHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id)      ~r~n" + &
"       AND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)       ~r~n" + &
"       AND ctx_loc.loc_id = 0),          ~r~n" + &
"    app_facility.facility_name facility_name,         ~r~n" + &
"    ctx_basic_info.custom_date1,            ~r~n" + &
"    ctx_basic_info.custom_date2,            ~r~n" + &
"    ctx_basic_info.custom_date3,            ~r~n" + &
"    ctx_basic_info.custom_date4,        ~r~n" + &
"    ctx_basic_info.custom_date5,            ~r~n" + &
"    ctx_basic_info.inserted_by_user,          ~r~n" + &
"    ctx_basic_info.inserted_at_date_time,            ~r~n" + &
"    ctx_basic_info.updated_by_user,         ~r~n" + &
"    ctx_basic_info.updated_at_date_time,            ~r~n" + &
"    ctx_basic_info.custom_11,            ~r~n" + &
"    ctx_basic_info.custom_12,         ~r~n" + &
"    ctx_basic_info.custom_13,            ~r~n" + &
"    ctx_basic_info.custom_14,            ~r~n" + &
"    ctx_basic_info.custom_15,        ~r~n" + &
"    ctx_basic_info.custom_16,            ~r~n" + &
"    ctx_basic_info.custom_17,            ~r~n" + &
"    ctx_basic_info.custom_18,            ~r~n" + &
"    ctx_basic_info.custom_19,            ~r~n" + &
"    ctx_basic_info.custom_20,           ~r~n" + &
"    ctx_basic_info.custom_date6,            ~r~n" + &
"    ctx_basic_info.custom_date7,            ~r~n" + &
"    ctx_basic_info.custom_date8,        ~r~n" + &
"    ctx_basic_info.custom_date9,            ~r~n" + &
"    ctx_basic_info.custom_date10,            ~r~n" + &
"    ctx_basic_info.custom_date11,            ~r~n" + &
"    ctx_basic_info.custom_date12,            ~r~n" + &
"    ctx_basic_info.custom_date13,        ~r~n" + &
"    ctx_basic_info.custom_date14,            ~r~n" + &
"    ctx_basic_info.custom_date15,            ~r~n" + &
"    ctx_basic_info.custom_n1,       ~r~n" + &
"    ctx_basic_info.custom_n2,            ~r~n" + &
"    ctx_basic_info.custom_n3,            ~r~n" + &
"    ctx_basic_info.custom_n4,            ~r~n" + &
"    ctx_basic_info.custom_n5,            ~r~n" + &
"    ctx_basic_info.custom_n6,        ~r~n" + &
"    ctx_basic_info.custom_n7,            ~r~n" + &
"    ctx_basic_info.custom_n8,            ~r~n" + &
"    ctx_basic_info.custom_n9,         ~r~n" + &
"    ctx_basic_info.custom_n10,            ~r~n" + &
"    ctx_basic_info.custom_n11,            ~r~n" + &
"    ctx_basic_info.custom_n12,            ~r~n" + &
"    ctx_basic_info.custom_n13,            ~r~n" + &
"    ctx_basic_info.custom_n14,            ~r~n" + &
"    ctx_basic_info.custom_n15,            ~r~n" + &
"    ctx_basic_info.custom_n16,            ~r~n" + &
"    ctx_basic_info.custom_n17,            ~r~n" + &
"    ctx_basic_info.custom_n18,            ~r~n" + &
"    ctx_basic_info.custom_n19,            ~r~n" + &
"    ctx_basic_info.custom_n20,            ~r~n" + &
"    ctx_basic_info.custom_n21,            ~r~n" + &
"    ctx_basic_info.custom_n22,            ~r~n" + &
"    ctx_basic_info.custom_n23,            ~r~n" + &
"    ctx_basic_info.custom_n24,            ~r~n" + &
"    ctx_basic_info.custom_n25,            ~r~n" + &
"    ctx_basic_info.version_number,            ~r~n" + &
"    ctx_basic_info.version_date,            ~r~n" + &
"    ctx_basic_info.master_contract_name ,      ~r~n" + &
"    ctx_basic_info.fee_sched_calc_field_1 ,      ~r~n" + &
"    ctx_basic_info.fee_sched_calc_field_2 ,      ~r~n" + &
"    ctx_basic_info.fee_sched_calc_field_3 ,      ~r~n" + &
"    'F' access   ,      ~r~n" + &
"    code_lookup2.code status_name,      ~r~n" + &
"    code_lookup3.code category_name,      ~r~n" + &
"    code_lookup4.code contract_type_name,      ~r~n" + &
"    code_lookup5.code dvision_name ,      ~r~n" + &
"    unread_email_cnt = 0,       ~r~n" + &
"    ctx_basic_info.custom_percent_1,     ~r~n" + &
"    ctx_basic_info.custom_percent_2,      ~r~n" + &
"    ctx_basic_info.custom_percent_3,      ~r~n" + &
"    ctx_basic_info.custom_percent_4,      ~r~n" + &
"    ctx_basic_info.custom_percent_5,      ~r~n" + &
"    ctx_basic_info.custom_percent_6,      ~r~n" + &
"    ctx_basic_info.custom_percent_7,      ~r~n" + &
"    ctx_basic_info.custom_percent_8,      ~r~n" + &
"    ctx_basic_info.custom_percent_9,      ~r~n" + &
"    ctx_basic_info.custom_percent_10,      ~r~n" + &
"    ctx_basic_info.work_flow_n1,      ~r~n" + &
"    ctx_basic_info.work_flow_n2,      ~r~n" + &
"    ctx_basic_info.work_flow_n3,      ~r~n" + &
"    ctx_basic_info.work_flow_n4,      ~r~n" + &
"    ctx_basic_info.work_flow_n5,      ~r~n" + &
"    ctx_basic_info.custom_status1,      ~r~n" + &
"    ctx_basic_info.custom_status2,      ~r~n" + &
"    ctx_basic_info.custom_21,      ~r~n" + &
"    ctx_basic_info.custom_22,      ~r~n" + &
"    ctx_basic_info.custom_n26,      ~r~n" + &
"    ctx_basic_info.custom_n27,      ~r~n" + &
"    ctx_basic_info.custom_date16,      ~r~n" + &
"    ctx_basic_info.custom_date17,      ~r~n" + &
"    app_facility.city,      ~r~n" + &
"    app_facility.state,      ~r~n" + &
"    app_facility.country,      ~r~n" + &
"    app_facility.zip,      ~r~n" + &
"    app_facility.street,      ~r~n" + &
"    ctx_custom.custom_1 as custom2_custom_1,      ~r~n" + &
"     ctx_custom.custom_2 as custom2_custom_2,         ~r~n" + &
"     ctx_custom.custom_3 as custom2_custom_3,         ~r~n" + &
"     ctx_custom.custom_4 as custom2_custom_4,         ~r~n" + &
"      ctx_custom.custom_5 as custom2_custom_5,         ~r~n" + &
"      ctx_custom.custom_6 as custom2_custom_6,         ~r~n" + &
"       ctx_custom.custom_7 as custom2_custom_7,         ~r~n" + &
"       ctx_custom.custom_8 as custom2_custom_8,         ~r~n" + &
"       ctx_custom.custom_9 as custom2_custom_9,         ~r~n" + &
"       ctx_custom.custom_10 as custom2_custom_10,         ~r~n" + &
"       ctx_custom.custom_11 as custom2_custom_11,         ~r~n" + &
"       ctx_custom.custom_12 as custom2_custom_12,         ~r~n" + &
"       ctx_custom.custom_13 as custom2_custom_13,         ~r~n" + &
"       ctx_custom.custom_14 as custom2_custom_14,         ~r~n" + &
"       ctx_custom.custom_15 as custom2_custom_15,         ~r~n" + &
"       ctx_custom.custom_16 as custom2_custom_16,         ~r~n" + &
"       ctx_custom.custom_17 as custom2_custom_17,         ~r~n" + &
"       ctx_custom.custom_18 as custom2_custom_18,         ~r~n" + &
"       ctx_custom.custom_19 as custom2_custom_19,         ~r~n" + &
"       ctx_custom.custom_20 as custom2_custom_20,         ~r~n" + &
"       ctx_custom.custom_date1 as custom2_custom_date1,         ~r~n" + &
"       ctx_custom.custom_date2 as custom2_custom_date2,         ~r~n" + &
"       ctx_custom.custom_date3 as custom2_custom_date3,         ~r~n" + &
"       ctx_custom.custom_date4 as custom2_custom_date4,         ~r~n" + &
"       ctx_custom.custom_date5 as custom2_custom_date5,         ~r~n" + &
"       ctx_custom.custom_date6 as custom2_custom_date6,         ~r~n" + &
"       ctx_custom.custom_date7 as custom2_custom_date7,         ~r~n" + &
"       ctx_custom.custom_date8 as custom2_custom_date8,         ~r~n" + &
"       ctx_custom.custom_date9 as custom2_custom_date9,         ~r~n" + &
"       ctx_custom.custom_date10 as custom2_custom_date10,         ~r~n" + &
"       ctx_custom.custom_date11 as custom2_custom_date11,         ~r~n" + &
"       ctx_custom.custom_date12 as custom2_custom_date12,         ~r~n" + &
"       ctx_custom.custom_date13 as custom2_custom_date13,         ~r~n" + &
"       ctx_custom.custom_date14 as custom2_custom_date14,         ~r~n" + &
"       ctx_custom.custom_date15 as custom2_custom_date15,         ~r~n" + &
"       ctx_custom.custom_n1 as custom2_custom_n1,         ~r~n" + &
"       ctx_custom.custom_n2 as custom2_custom_n2,         ~r~n" + &
"       ctx_custom.custom_n3 as custom2_custom_n3,         ~r~n" + &
"       ctx_custom.custom_n4 as custom2_custom_n4,         ~r~n" + &
"       ctx_custom.custom_n5 as custom2_custom_n5,         ~r~n" + &
"       ctx_custom.custom_n6 as custom2_custom_n6,         ~r~n" + &
"       ctx_custom.custom_n7 as custom2_custom_n7,         ~r~n" + &
"       ctx_custom.custom_n8 as custom2_custom_n8,         ~r~n" + &
"       ctx_custom.custom_n9 as custom2_custom_n9,         ~r~n" + &
"       ctx_custom.custom_n10 as custom2_custom_n10,         ~r~n" + &
"       ctx_custom.custom_n11 as custom2_custom_n11,         ~r~n" + &
"       ctx_custom.custom_n12 as custom2_custom_n12,         ~r~n" + &
"       ctx_custom.custom_n13 as custom2_custom_n13,         ~r~n" + &
"       ctx_custom.custom_n14 as custom2_custom_n14,         ~r~n" + &
"       ctx_custom.custom_n15 as custom2_custom_n15,         ~r~n" + &
"       ctx_custom.custom_n16 as custom2_custom_n16,         ~r~n" + &
"       ctx_custom.custom_n17 as custom2_custom_n17,         ~r~n" + &
"       ctx_custom.custom_n18 as custom2_custom_n18,         ~r~n" + &
"       ctx_custom.custom_n19 as custom2_custom_n19,         ~r~n" + &
"       ctx_custom.custom_n20 as custom2_custom_n20,         ~r~n" + &
"       ctx_custom.custom_n21 as custom2_custom_n21,         ~r~n" + &
"       ctx_custom.custom_n22 as custom2_custom_n22,         ~r~n" + &
"       ctx_custom.custom_n23 as custom2_custom_n23,         ~r~n" + &
"       ctx_custom.custom_n24 as custom2_custom_n24,         ~r~n" + &
"       ctx_custom.custom_n25 as custom2_custom_n25,         ~r~n" + &
"       ctx_custom.custom_21 as custom2_custom_21,         ~r~n" + &
"       ctx_custom.custom_22 as custom2_custom_22,         ~r~n" + &
"       ctx_custom.custom_notes_1 as custom2_custom_notes_1,        ~r~n" + &
"       ctx_custom.custom_notes_2 as custom2_custom_notes_2,         ~r~n" + &
"       ctx_custom.custom_notes_3 as custom2_custom_notes_3,         ~r~n" + &
"       ctx_custom.custom_notes_4 as custom2_custom_notes_4,         ~r~n" + &
"       ctx_custom.custom_notes_5 as custom2_custom_notes_5,         ~r~n" + &
"       ctx_custom.custom_money_1 as custom2_custom_money_1,         ~r~n" + &
"       ctx_custom.custom_money_2 as custom2_custom_money_2,         ~r~n" + &
"       ctx_custom.custom_money_3 as custom2_custom_money_3,         ~r~n" + &
"       ctx_custom.custom_percent_1 as custom2_custom_percent_1,         ~r~n" + &
"    ctx_custom.custom_percent_2 as custom2_custom_percent_2,         ~r~n" + &
"       ctx_custom.custom_percent_3 as custom2_custom_percent_3,         ~r~n" + &
"       ctx_custom.custom_percent_4 as custom2_custom_percent_4,         ~r~n" + &
"       ctx_custom.custom_percent_5 as custom2_custom_percent_5,         ~r~n" + &
"       ctx_custom.custom_percent_6 as custom2_custom_percent_6,         ~r~n" + &
"       ctx_custom.custom_percent_7 as custom2_custom_percent_7,         ~r~n" + &
"       ctx_custom.custom_percent_8 as custom2_custom_percent_8,         ~r~n" + &
"       ctx_custom.custom_percent_9 as custom2_custom_percent_9,         ~r~n" + &
"       ctx_custom.custom_percent_10 as custom2_custom_percent_10,        ~r~n" + &
"       has_docs = Isnull(ctx_am_documents.has_docs,0),      ~r~n" + &
"      ctx_basic_info.contract_department,      ~r~n" + &
"      v_ctx_occi2.occi_name,     ~r~n" + &
"      v_ctx_ccci2.ccci_name     ~r~n" + &
"    FROM  ctx_basic_info        ~r~n" + &
"    LEFT OUTER JOIN v_ctx_ccci2 ON ctx_basic_info.ctx_id = v_ctx_ccci2.ctx_id       ~r~n" + &
"    LEFT OUTER JOIN v_ctx_occi2 ON ctx_basic_info.ctx_id = v_ctx_occi2.ctx_id     ~r~n" + &
"    LEFT OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id        ~r~n" + &
"    LEFT OUTER JOIN code_lookup ON ctx_products.product_id = code_lookup.lookup_code        ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup1 ON ctx_products.product_type = code_lookup1.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code      ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code      ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code      ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code      ~r~n" + &
"    LEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id        ~r~n" + &
"    LEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id       ~r~n" + &
"    LEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id        ~r~n" + &
"     WHERE  ctx_basic_info.is_template = 0       ~r~n" + &
"             ~r~n" + &
"   END      ~r~n" + &
"   /*********display one row if ctx have multi product*******/     ~r~n" + &
"   else      ~r~n" + &
"       ~r~n" + &
"   BEGIN      ~r~n" + &
"    WITH v_ctx_ccci as     ~r~n" + &
"   (     ~r~n" + &
"     SELECT ctx_contract_contacts.ctx_id,        ~r~n" + &
"           'name' = ctx_contacts.first_name +','+ ctx_contacts.last_name +''+ IsNull(ctx_contacts.middle_name,'')     ~r~n" + &
"      FROM  ctx_contract_contacts,ctx_contacts     ~r~n" + &
"      WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id         ~r~n" + &
"      AND   ctx_contract_contacts.ic_area = 'E'      ~r~n" + &
"   ),     ~r~n" + &
"   v_ctx_ccci2 as      ~r~n" + &
"   (      ~r~n" + &
"      select aa.ctx_id,      ~r~n" + &
"         ccci_name = ltrim(stuff((select '; ' + name from v_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))     ~r~n" + &
"      from v_ctx_ccci aa     ~r~n" + &
"      group by aa.ctx_id     ~r~n" + &
"   ),     ~r~n" + &
"   v_ctx_occi as     ~r~n" + &
"   (     ~r~n" + &
"      SELECT ctx_contract_contacts.ctx_id,        ~r~n" + &
"           'name' = ctx_contacts.first_name +','+ ctx_contacts.last_name +''+ IsNull(ctx_contacts.middle_name,'')     ~r~n" + &
"      FROM  ctx_contract_contacts,ctx_contacts     ~r~n" + &
"      WHERE ctx_contract_contacts.contact_id = ctx_contacts.contact_id         ~r~n" + &
"      AND   ctx_contract_contacts.ic_area = 'I'     ~r~n" + &
"   ),     ~r~n" + &
"   v_ctx_occi2 as      ~r~n" + &
"   (      ~r~n" + &
"    select aa.ctx_id,      ~r~n" + &
"    occi_name = ltrim(stuff((select '; ' + name from v_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''))     ~r~n" + &
"       from v_ctx_occi aa     ~r~n" + &
"       group by aa.ctx_id     ~r~n" + &
"   ),     ~r~n" + &
"    v_ctx_products as     ~r~n" + &
"    (      ~r~n" + &
"      select a.ctx_id,a.product_id,a.product_type,b.code product_name,c.code product_type_name      ~r~n" + &
"      from ctx_products a      ~r~n" + &
"      LEFT OUTER JOIN code_lookup b ON a.product_id = b.lookup_code        ~r~n" + &
"       LEFT OUTER JOIN code_lookup c ON a.product_type = c.lookup_code      ~r~n" + &
"     ),     ~r~n" + &
"    v_ctx_products2 as      ~r~n" + &
"    (      ~r~n" + &
"      select aa.ctx_id,      ~r~n" + &
"        product_id = (select top 1 product_id from v_ctx_products where ctx_id = aa.ctx_id),     ~r~n" + &
"      product_name = stuff((select ',' + product_name from v_ctx_products where ctx_id = aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , ''),     ~r~n" + &
"      product_type_name = stuff((select ',' + product_type_name from v_ctx_products where ctx_id=aa.ctx_id for xml path(''),type).value('.','VARCHAR(MAX)') , 1 , 1 , '')     ~r~n" + &
"        from v_ctx_products aa     ~r~n" + &
"        group by aa.ctx_id     ~r~n" + &
"       )     ~r~n" + &
"  insert ctx_basic_info_pagedata    ~r~n" + &
"    SELECT DISTINCT       ~r~n" + &
"    ctx_basic_info.app_facility,          ~r~n" + &
"    v_ctx_products2.product_id product_code,          ~r~n" + &
"    v_ctx_products2.product_name,             ~r~n" + &
"    ctx_basic_info.effective_date,            ~r~n" + &
"    ctx_basic_info.expriation_date,             ~r~n" + &
"    ctx_basic_info.status,           ~r~n" + &
"    ctx_basic_info.group_multi_loc_id,        ~r~n" + &
"    ctx_basic_info.ctx_id,      ~r~n" + &
"     ctx_basic_info.master_contract_id,     ~r~n" + &
"     master_cnt = (SELECT Count(ctx_basic_info1.ctx_id)     ~r~n" + &
"      FROM ctx_basic_info ctx_basic_info1       ~r~n" + &
"      WHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ),       ~r~n" + &
"    ctx_basic_info.category,              ~r~n" + &
"    ctx_basic_info.facility_id,           ~r~n" + &
"    ctx_basic_info.contract_type,             ~r~n" + &
"    v_ctx_products2.product_type_name product_type,     ~r~n" + &
"    ctx_basic_info.reimbursment_menth,             ~r~n" + &
"    ctx_basic_info.file_location,          ~r~n" + &
"    ctx_basic_info.review_date,             ~r~n" + &
"    ctx_basic_info.review_by,           ~r~n" + &
"    ctx_basic_info.term_date,             ~r~n" + &
"    ctx_basic_info.term_reason,           ~r~n" + &
"    ctx_basic_info.last_revis_date,        ~r~n" + &
"    ctx_basic_info.other_date_1,           ~r~n" + &
"    ctx_basic_info.other_date_2,           ~r~n" + &
"    ctx_basic_info.oc_signed_by,             ~r~n" + &
"    ctx_basic_info.oc_title,            ~r~n" + &
"    ctx_basic_info.oc_department,             ~r~n" + &
"    ctx_basic_info.oc_legal_rep,             ~r~n" + &
"    ctx_basic_info.cc_signed_by,           ~r~n" + &
"    ctx_basic_info.cc_title,             ~r~n" + &
"    ctx_basic_info.cc_department,             ~r~n" + &
"    ctx_basic_info.cc_legal_rep,           ~r~n" + &
"    ctx_basic_info.notes,             ~r~n" + &
"    ctx_basic_info.keyword,             ~r~n" + &
"    ctx_basic_info.dvision,         ~r~n" + &
"    ctx_basic_info.custom_1,             ~r~n" + &
"    ctx_basic_info.custom_2,             ~r~n" + &
"    ctx_basic_info.custom_3,             ~r~n" + &
"    ctx_basic_info.custom_4,             ~r~n" + &
"    ctx_basic_info.custom_5,           ~r~n" + &
"    ctx_basic_info.custom_6,            ~r~n" + &
"    ctx_basic_info.custom_7,             ~r~n" + &
"    ctx_basic_info.custom_8,       ~r~n" + &
"    ctx_basic_info.custom_9,             ~r~n" + &
"    ctx_basic_info.custom_10,          ~r~n" + &
"    ctx_basic_info.group_id,      ~r~n" + &
"    ctx_basic_info.revision_reason,        ~r~n" + &
"    ctx_basic_info.record_id ,         ~r~n" + &
"    owner = upper((SELECT top 1 ctx_contacts.user_d           ~r~n" + &
"      FROM ctx_contacts,ctx_contract_contacts       ~r~n" + &
"      WHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )       ~r~n" + &
"      AND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )       ~r~n" + &
"        AND ( ctx_contract_contacts.owner = 'Y' )       ~r~n" + &
"        AND ( ctx_contract_contacts.ic_area = 'I' ) )),        ~r~n" + &
"    contracted_entity = (SELECT top 1 group_multi_loc.rec_id        ~r~n" + &
"         FROM ctx_loc,                  group_multi_loc       ~r~n" + &
"       WHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id)       ~r~n" + &
"       AND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)       ~r~n" + &
"       AND ctx_loc.loc_id = 0),          ~r~n" + &
"    app_facility.facility_name facility_name,         ~r~n" + &
"    ctx_basic_info.custom_date1,            ~r~n" + &
"    ctx_basic_info.custom_date2,            ~r~n" + &
"    ctx_basic_info.custom_date3,            ~r~n" + &
"    ctx_basic_info.custom_date4,        ~r~n" + &
"    ctx_basic_info.custom_date5,            ~r~n" + &
"    ctx_basic_info.inserted_by_user,          ~r~n" + &
"    ctx_basic_info.inserted_at_date_time,      ~r~n" + &
"    ctx_basic_info.updated_by_user,         ~r~n" + &
"    ctx_basic_info.updated_at_date_time,       ~r~n" + &
"    ctx_basic_info.custom_11,            ~r~n" + &
"    ctx_basic_info.custom_12,         ~r~n" + &
"    ctx_basic_info.custom_13,            ~r~n" + &
"    ctx_basic_info.custom_14,            ~r~n" + &
"    ctx_basic_info.custom_15,        ~r~n" + &
"    ctx_basic_info.custom_16,            ~r~n" + &
"    ctx_basic_info.custom_17,            ~r~n" + &
"    ctx_basic_info.custom_18,            ~r~n" + &
"    ctx_basic_info.custom_19,            ~r~n" + &
"    ctx_basic_info.custom_20,           ~r~n" + &
"    ctx_basic_info.custom_date6,          ~r~n" + &
"    ctx_basic_info.custom_date7,         ~r~n" + &
"    ctx_basic_info.custom_date8,        ~r~n" + &
"    ctx_basic_info.custom_date9,          ~r~n" + &
"    ctx_basic_info.custom_date10,         ~r~n" + &
"    ctx_basic_info.custom_date11,        ~r~n" + &
"    ctx_basic_info.custom_date12,         ~r~n" + &
"    ctx_basic_info.custom_date13,        ~r~n" + &
"    ctx_basic_info.custom_date14,         ~r~n" + &
"    ctx_basic_info.custom_date15,         ~r~n" + &
"    ctx_basic_info.custom_n1,       ~r~n" + &
"    ctx_basic_info.custom_n2,            ~r~n" + &
"    ctx_basic_info.custom_n3,            ~r~n" + &
"    ctx_basic_info.custom_n4,            ~r~n" + &
"    ctx_basic_info.custom_n5,            ~r~n" + &
"    ctx_basic_info.custom_n6,        ~r~n" + &
"    ctx_basic_info.custom_n7,         ~r~n" + &
"    ctx_basic_info.custom_n8,            ~r~n" + &
"    ctx_basic_info.custom_n9,         ~r~n" + &
"    ctx_basic_info.custom_n10,            ~r~n" + &
"    ctx_basic_info.custom_n11,            ~r~n" + &
"    ctx_basic_info.custom_n12,            ~r~n" + &
"    ctx_basic_info.custom_n13,            ~r~n" + &
"    ctx_basic_info.custom_n14,            ~r~n" + &
"    ctx_basic_info.custom_n15,            ~r~n" + &
"    ctx_basic_info.custom_n16,            ~r~n" + &
"    ctx_basic_info.custom_n17,            ~r~n" + &
"    ctx_basic_info.custom_n18,            ~r~n" + &
"    ctx_basic_info.custom_n19,            ~r~n" + &
"    ctx_basic_info.custom_n20,            ~r~n" + &
"    ctx_basic_info.custom_n21,            ~r~n" + &
"    ctx_basic_info.custom_n22,            ~r~n" + &
"    ctx_basic_info.custom_n23,            ~r~n" + &
"    ctx_basic_info.custom_n24,            ~r~n" + &
"    ctx_basic_info.custom_n25,            ~r~n" + &
"    ctx_basic_info.version_number,        ~r~n" + &
"    ctx_basic_info.version_date,           ~r~n" + &
"    ctx_basic_info.master_contract_name ,      ~r~n" + &
"    ctx_basic_info.fee_sched_calc_field_1 ,      ~r~n" + &
"    ctx_basic_info.fee_sched_calc_field_2 ,      ~r~n" + &
"    ctx_basic_info.fee_sched_calc_field_3 ,      ~r~n" + &
"    'F' access  ,      ~r~n" + &
"    code_lookup2.code status_name,      ~r~n" + &
"    code_lookup3.code category_name,      ~r~n" + &
"    code_lookup4.code contract_type_name,      ~r~n" + &
"    code_lookup5.code dvision_name ,      ~r~n" + &
"    unread_email_cnt = 0,       ~r~n" + &
"    ctx_basic_info.custom_percent_1,      ~r~n" + &
"    ctx_basic_info.custom_percent_2,      ~r~n" + &
"    ctx_basic_info.custom_percent_3,      ~r~n" + &
"    ctx_basic_info.custom_percent_4,      ~r~n" + &
"    ctx_basic_info.custom_percent_5,      ~r~n" + &
"    ctx_basic_info.custom_percent_6,      ~r~n" + &
"    ctx_basic_info.custom_percent_7,      ~r~n" + &
"    ctx_basic_info.custom_percent_8,      ~r~n" + &
"    ctx_basic_info.custom_percent_9,      ~r~n" + &
"    ctx_basic_info.custom_percent_10,      ~r~n" + &
"    ctx_basic_info.work_flow_n1,      ~r~n" + &
"    ctx_basic_info.work_flow_n2,      ~r~n" + &
"    ctx_basic_info.work_flow_n3,      ~r~n" + &
"    ctx_basic_info.work_flow_n4,      ~r~n" + &
"    ctx_basic_info.work_flow_n5,      ~r~n" + &
"    ctx_basic_info.custom_status1,      ~r~n" + &
"    ctx_basic_info.custom_status2,      ~r~n" + &
"    ctx_basic_info.custom_21,      ~r~n" + &
"    ctx_basic_info.custom_22,      ~r~n" + &
"    ctx_basic_info.custom_n26,      ~r~n" + &
"    ctx_basic_info.custom_n27,      ~r~n" + &
"    ctx_basic_info.custom_date16,      ~r~n" + &
"    ctx_basic_info.custom_date17,      ~r~n" + &
"    app_facility.city,      ~r~n" + &
"    app_facility.state,      ~r~n" + &
"    app_facility.country,      ~r~n" + &
"    app_facility.zip,      ~r~n" + &
"    app_facility.street,      ~r~n" + &
"    ctx_custom.custom_1 as custom2_custom_1,        ~r~n" + &
"       ctx_custom.custom_2 as custom2_custom_2,        ~r~n" + &
"       ctx_custom.custom_3 as custom2_custom_3,        ~r~n" + &
"       ctx_custom.custom_4 as custom2_custom_4,        ~r~n" + &
"       ctx_custom.custom_5 as custom2_custom_5,        ~r~n" + &
"       ctx_custom.custom_6 as custom2_custom_6,         ~r~n" + &
"       ctx_custom.custom_7 as custom2_custom_7,         ~r~n" + &
"       ctx_custom.custom_8 as custom2_custom_8,         ~r~n" + &
"       ctx_custom.custom_9 as custom2_custom_9,         ~r~n" + &
"       ctx_custom.custom_10 as custom2_custom_10,         ~r~n" + &
"       ctx_custom.custom_11 as custom2_custom_11,         ~r~n" + &
"      ctx_custom.custom_12 as custom2_custom_12,         ~r~n" + &
"       ctx_custom.custom_13 as custom2_custom_13,         ~r~n" + &
"       ctx_custom.custom_14 as custom2_custom_14,         ~r~n" + &
"       ctx_custom.custom_15 as custom2_custom_15,         ~r~n" + &
"       ctx_custom.custom_16 as custom2_custom_16,         ~r~n" + &
"       ctx_custom.custom_17 as custom2_custom_17,         ~r~n" + &
"       ctx_custom.custom_18 as custom2_custom_18,         ~r~n" + &
"       ctx_custom.custom_19 as custom2_custom_19,         ~r~n" + &
"       ctx_custom.custom_20 as custom2_custom_20,         ~r~n" + &
"       ctx_custom.custom_date1 as custom2_custom_date1,         ~r~n" + &
"     ctx_custom.custom_date2 as custom2_custom_date2,         ~r~n" + &
"      ctx_custom.custom_date3 as custom2_custom_date3,         ~r~n" + &
"      ctx_custom.custom_date4 as custom2_custom_date4,         ~r~n" + &
"       ctx_custom.custom_date5 as custom2_custom_date5,         ~r~n" + &
"       ctx_custom.custom_date6 as custom2_custom_date6,         ~r~n" + &
"       ctx_custom.custom_date7 as custom2_custom_date7,         ~r~n" + &
"       ctx_custom.custom_date8 as custom2_custom_date8,         ~r~n" + &
"       ctx_custom.custom_date9 as custom2_custom_date9,         ~r~n" + &
"       ctx_custom.custom_date10 as custom2_custom_date10,         ~r~n" + &
"       ctx_custom.custom_date11 as custom2_custom_date11,         ~r~n" + &
"       ctx_custom.custom_date12 as custom2_custom_date12,         ~r~n" + &
"       ctx_custom.custom_date13 as custom2_custom_date13,         ~r~n" + &
"       ctx_custom.custom_date14 as custom2_custom_date14,         ~r~n" + &
"       ctx_custom.custom_date15 as custom2_custom_date15,         ~r~n" + &
"       ctx_custom.custom_n1 as custom2_custom_n1,         ~r~n" + &
"       ctx_custom.custom_n2 as custom2_custom_n2,         ~r~n" + &
"       ctx_custom.custom_n3 as custom2_custom_n3,         ~r~n" + &
"       ctx_custom.custom_n4 as custom2_custom_n4,         ~r~n" + &
"       ctx_custom.custom_n5 as custom2_custom_n5,         ~r~n" + &
"       ctx_custom.custom_n6 as custom2_custom_n6,         ~r~n" + &
"       ctx_custom.custom_n7 as custom2_custom_n7,         ~r~n" + &
"       ctx_custom.custom_n8 as custom2_custom_n8,         ~r~n" + &
"       ctx_custom.custom_n9 as custom2_custom_n9,         ~r~n" + &
"       ctx_custom.custom_n10 as custom2_custom_n10,         ~r~n" + &
"       ctx_custom.custom_n11 as custom2_custom_n11,         ~r~n" + &
"       ctx_custom.custom_n12 as custom2_custom_n12,         ~r~n" + &
"       ctx_custom.custom_n13 as custom2_custom_n13,         ~r~n" + &
"      ctx_custom.custom_n14 as custom2_custom_n14,         ~r~n" + &
"       ctx_custom.custom_n15 as custom2_custom_n15,         ~r~n" + &
"       ctx_custom.custom_n16 as custom2_custom_n16,        ~r~n" + &
"       ctx_custom.custom_n17 as custom2_custom_n17,         ~r~n" + &
"       ctx_custom.custom_n18 as custom2_custom_n18,         ~r~n" + &
"       ctx_custom.custom_n19 as custom2_custom_n19,         ~r~n" + &
"       ctx_custom.custom_n20 as custom2_custom_n20,         ~r~n" + &
"       ctx_custom.custom_n21 as custom2_custom_n21,         ~r~n" + &
"       ctx_custom.custom_n22 as custom2_custom_n22,         ~r~n" + &
"       ctx_custom.custom_n23 as custom2_custom_n23,         ~r~n" + &
"       ctx_custom.custom_n24 as custom2_custom_n24,         ~r~n" + &
"       ctx_custom.custom_n25 as custom2_custom_n25,         ~r~n" + &
"       ctx_custom.custom_21 as custom2_custom_21,         ~r~n" + &
"       ctx_custom.custom_22 as custom2_custom_22,         ~r~n" + &
"       ctx_custom.custom_notes_1 as custom2_custom_notes_1,        ~r~n" + &
"       ctx_custom.custom_notes_2 as custom2_custom_notes_2,         ~r~n" + &
"       ctx_custom.custom_notes_3 as custom2_custom_notes_3,         ~r~n" + &
"       ctx_custom.custom_notes_4 as custom2_custom_notes_4,         ~r~n" + &
"       ctx_custom.custom_notes_5 as custom2_custom_notes_5,         ~r~n" + &
"       ctx_custom.custom_money_1 as custom2_custom_money_1,         ~r~n" + &
"       ctx_custom.custom_money_2 as custom2_custom_money_2,         ~r~n" + &
"       ctx_custom.custom_money_3 as custom2_custom_money_3,         ~r~n" + &
"       ctx_custom.custom_percent_1 as custom2_custom_percent_1,         ~r~n" + &
"       ctx_custom.custom_percent_2 as custom2_custom_percent_2,         ~r~n" + &
"       ctx_custom.custom_percent_3 as custom2_custom_percent_3,         ~r~n" + &
"       ctx_custom.custom_percent_4 as custom2_custom_percent_4,         ~r~n" + &
"       ctx_custom.custom_percent_5 as custom2_custom_percent_5,         ~r~n" + &
"       ctx_custom.custom_percent_6 as custom2_custom_percent_6,         ~r~n" + &
"       ctx_custom.custom_percent_7 as custom2_custom_percent_7,         ~r~n" + &
"       ctx_custom.custom_percent_8 as custom2_custom_percent_8,         ~r~n" + &
"       ctx_custom.custom_percent_9 as custom2_custom_percent_9,         ~r~n" + &
"       ctx_custom.custom_percent_10 as custom2_custom_percent_10,        ~r~n" + &
"       has_docs = Isnull(ctx_am_documents.has_docs,0),      ~r~n" + &
"      ctx_basic_info.contract_department,      ~r~n" + &
"      v_ctx_occi2.occi_name,     ~r~n" + &
"      v_ctx_ccci2.ccci_name     ~r~n" + &
"    FROM  ctx_basic_info      ~r~n" + &
"    LEFT OUTER JOIN v_ctx_ccci2 ON ctx_basic_info.ctx_id = v_ctx_ccci2.ctx_id       ~r~n" + &
"    LEFT OUTER JOIN v_ctx_occi2 ON ctx_basic_info.ctx_id = v_ctx_occi2.ctx_id     ~r~n" + &
"    LEFT OUTER JOIN v_ctx_products2 ON ctx_basic_info.ctx_id = v_ctx_products2.ctx_id         ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code      ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code      ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code      ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code      ~r~n" + &
"    LEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id        ~r~n" + &
"    LEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id      ~r~n" + &
"    LEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id       ~r~n" + &
"     WHERE ctx_basic_info.is_template = 0       ~r~n" + &
"        ~r~n" + &
"   END   "

//modified by gavins 20160607  convert number to varchar
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from sysobjects where name = 'uf_get_contact_address' and type = 'FN') " + &
"  DROP FUNCTION uf_get_contact_address "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
" Create function uf_get_contact_address( @ctx_id INT,@as_user_id NUMERIC) returns varchar(8000)     ~r~n" + &
" as     ~r~n" + &
"  begin~t      ~r~n" + &
"    declare @returnstring varchar(4000)       ~r~n" + &
"    declare @contact_id int       ~r~n" + &
"    declare @user_d varchar(50)       ~r~n" + &
"    declare @contact_email varchar(50)       ~r~n" + &
"    declare @smtp_email varchar(50)       ~r~n" + &
"     set  @returnstring = ''        ~r~n" + &
"     /* Get the contact_id value */       ~r~n" + &
"     declare cur_get_contact_id cursor for       ~r~n" + &
"    select contact_id from ctx_contract_contacts where ctx_contract_contacts.ctx_id = @ctx_id       ~r~n" + &
"     AND ( convert(varchar(30),@as_user_id ) in (ctx_contract_contacts.association,ctx_contract_contacts.association2,ctx_contract_contacts.association3,      ~r~n" + &
"     ctx_contract_contacts.association4,ctx_contract_contacts.association5,ctx_contract_contacts.association6,      ~r~n" + &
"     ctx_contract_contacts.association7,ctx_contract_contacts.association8,      ~r~n" + &
"    ctx_contract_contacts.association9,ctx_contract_contacts.association10))       ~r~n" + &
"     AND ctx_contract_contacts.ic_area = 'I'       ~r~n" + &
"    open cur_get_contact_id       ~r~n" + &
"    fetch next from cur_get_contact_id into @contact_id       ~r~n" + &
"    while @@fetch_status = 0       ~r~n" + &
"    begin       ~r~n" + &
"       set @user_d = ''       ~r~n" + &
"       select @user_d = user_d from ctx_contacts where contact_id = @contact_id  /* check the user_d */       ~r~n" + &
"       if (@user_d is NULL) OR (@user_d = '')~t~t/* get email address from contact number when user_d is null */       ~r~n" + &
"       begin       ~r~n" + &
"       set @contact_email = ''       ~r~n" + &
"       select @contact_email = contact_email from ctx_contacts_numbers where contact_id = @contact_id        ~r~n" + &
"       and via = (SELECT lookup_code FROM code_lookup WHERE code = 'EMAIL' AND lookup_name = 'Contract Contact VIA')       ~r~n" + &
"       if @contact_email is not NULL       ~r~n" + &
"       begin       ~r~n" + &
"          if (@returnstring IS NULL) OR (@returnstring = '')       ~r~n" + &
"          begin       ~r~n" + &
"          set @returnstring = @contact_email       ~r~n" + &
"          end       ~r~n" + &
"          else       ~r~n" + &
"          begin       ~r~n" + &
"          set @returnstring = @returnstring + ';' + @contact_email       ~r~n" + &
"          end       ~r~n" + &
"       end       ~r~n" + &
"       end       ~r~n" + &
"       else~t~t~t~t~t/* get email address from email painter when user_d is not null */       ~r~n" + &
"       begin       ~r~n" + &
"       set @smtp_email = ''       ~r~n" + &
"       select @smtp_email = em_smtp_accounts.email from ctx_contract_contacts,ctx_contacts,em_smtp_accounts       ~r~n" + &
"       where ctx_contract_contacts.contact_id = ctx_contacts.contact_id and ctx_contacts.user_d = em_smtp_accounts.user_id       ~r~n" + &
"       and ctx_contract_contacts.ctx_id = @ctx_id and ctx_contract_contacts.ic_area = 'I'        ~r~n" + &
"       and ( convert(varchar(30),@as_user_id ) in (ctx_contract_contacts.association,ctx_contract_contacts.association2,ctx_contract_contacts.association3,       ~r~n" + &
"                      ctx_contract_contacts.association4,ctx_contract_contacts.association5,ctx_contract_contacts.association6,       ~r~n" + &
"                      ctx_contract_contacts.association7,ctx_contract_contacts.association8,       ~r~n" + &
"                      ctx_contract_contacts.association9,ctx_contract_contacts.association10))         ~r~n" + &
"       and em_smtp_accounts.Is_Default = 'Y' and em_smtp_accounts.Email is not NULL       ~r~n" + &
"       and ctx_contacts.user_d = @user_d       ~r~n" + &
"       if (@smtp_email is NULL) OR (@smtp_email = '')       ~r~n" + &
"       begin       ~r~n" + &
"          set @contact_email = ''       ~r~n" + &
"          select @contact_email = contact_email from ctx_contacts_numbers where contact_id = @contact_id        ~r~n" + &
"          and via = (SELECT lookup_code FROM code_lookup WHERE code = 'EMAIL' AND lookup_name = 'Contract Contact VIA')       ~r~n" + &
"          if @contact_email is not NULL       ~r~n" + &
"          begin       ~r~n" + &
"          if (@returnstring IS NULL) OR (@returnstring = '')       ~r~n" + &
"          begin        ~r~n" + &
"             set @returnstring = @contact_email       ~r~n" + &
"          end       ~r~n" + &
"          else       ~r~n" + &
"          begin       ~r~n" + &
"             set @returnstring = @returnstring + ';' + @contact_email       ~r~n" + &
"          end       ~r~n" + &
"          end       ~r~n" + &
"       end       ~r~n" + &
"       else       ~r~n" + &
"       begin       ~r~n" + &
"       if (@returnstring IS NULL) OR (@returnstring = '')       ~r~n" + &
"       begin       ~r~n" + &
"          set @returnstring = @smtp_email       ~r~n" + &
"       end       ~r~n" + &
"       else       ~r~n" + &
"       begin       ~r~n" + &
"          set @returnstring = @returnstring + ';' + @smtp_email       ~r~n" + &
"       end       ~r~n" + &
"       end       ~r~n" + &
"    end       ~r~n" + &
"    fetch next from cur_get_contact_id into @contact_id       ~r~n" + &
"    end       ~r~n" + &
"    CLOSE cur_get_contact_id       ~r~n" + &
"    DEALLOCATE cur_get_contact_id        ~r~n" + &
"    return @returnstring       ~r~n" + &
" end   "


of_execute_sqls("of_ver150_release_storeprocedure6")
return 1
end function

public function integer of_ver150_release_storeprocedure7 ();is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'up_ctx_access_list' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure up_ctx_access_list~r~n" + &
"End ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"create procedure up_ctx_access_list~r~n" + &
"  @user_id varchar(10)~r~n" + &
"as~r~n" + &
"~r~n" + &
"~r~n" + &
"  INSERT #tmp_ctx~r~n" + &
"/* Original query from d_doc_br_browse */~r~n" + &
"  SELECT DISTINCT~r~n" + &
"    ctx_id = ctx_contract_contacts.ctx_id,~r~n" + &
"    user_id = ctx_contacts.user_d,~r~n" + &
"    access = (CASE ctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx_id~r~n" + &
"    JOIN ctx_contract_contacts ON ( #tmp_ctx_id.ctx_id = ctx_contract_contacts.ctx_id )~r~n" + &
"    Left Outer Join~r~n" + &
"~t~t(~r~n" + &
"~t~tSelect ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d ~r~n" + &
"~t~tFrom ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1~r~n" + &
"~t~tWhere ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id And ctx_contacts1.user_d = @user_id~r~n" + &
"~t~tGroup By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d~r~n" + &
"~t~tHaving Count(ctx_contract_contacts1.ctx_id) > 1~r~n" + &
"~t~t) ccc~r~n" + &
"~t~tOn ctx_contract_contacts.ctx_id = ccc.ctx_id~r~n" + &
"~t~t,ctx_contacts~r~n" + &
"~t~tWHERE ctx_contacts.user_d = @user_id~r~n" + &
"~t~t~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' )~r~n" + &
"~t~t~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id ~r~n" + &
"~t~t~tAND ( ctx_contract_contacts.access IN ('F','R') ~r~n" + &
"~t~t~tOR ctx_contract_contacts.owner = 'Y' )~r~n" + &
"~t~t~tAND ctx_contract_contacts.ic_area = 'I'~r~n" + &
"~r~n" + &
"~r~n" + &
"  INSERT #tmp_ctx~r~n" + &
"~t~tSELECT DISTINCT ctx_id = ctx_group_access.ctx_id,user_id = security_group_users.user_id, access =  ctx_group_access.access~r~n" + &
"~t~tFROM ~r~n" + &
"         #tmp_ctx_id, ~r~n" + &
"~t~tctx_group_access ,~r~n" + &
"~t~tsecurity_group_users,~r~n" + &
"~t~ticred_settings~r~n" + &
"~t~tWHERE ctx_group_access.ctx_id = #tmp_ctx_id.ctx_id ~r~n" + &
"              AND security_group_users.user_id = @user_id~r~n" + &
"~t~t~tAND ctx_group_access.group_id = security_group_users.group_id~r~n" + &
"~t~t~tAND ctx_group_access.access = ~r~n" + &
"~t~t~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access ~r~n" + &
"~t~t~t~tFrom ctx_group_access a1,security_group_users u1~r~n" + &
"~t~t~t~tWhere a1.group_id = u1.group_id ~r~n" + &
"~t~t~t~tAnd a1.ctx_id = ctx_group_access.ctx_id~r~n" + &
"~t~t~t~tAnd u1.user_id = security_group_users.user_id~t~r~n" + &
"~t~t~t~tAnd a1.access = 'F') Then 'F' Else 'R' End) ~r~n" + &
"~t~t~tAND icred_settings.group_access = 1~r~n" + &
"~t~t~tAND ctx_group_access.access in ('F','R')~r~n" + &
"~t~t~tAND NOT EXISTS~t(SELECT 1 FROM ctx_contract_contacts, ctx_contacts  ~r~n" + &
"~t~t~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) ~r~n" + &
"~t~t~t~t~tAND ( ctx_contacts.user_d = security_group_users.user_id )~r~n" + &
"~t~t~t~t~tAND ( ctx_contract_contacts.ic_area = 'I' )~r~n" + &
"~t~t~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id )~r~n" + &
"~t~t~t~t~t)~r~n" + &
"~r~n" + &
"~r~n" + &
"~r~n" + &
"  INSERT #tmp_ctx~r~n" + &
"~t~tSELECT b.ctx_id,b.user_id,(CASE WHEN b.rcnt=0 THEN 'F' ELSE 'R' END) access ~r~n" + &
"~t~tFROM~r~n" + &
"~t~t(~r~n" + &
"~t~t~t~tSELECT DISTINCT a.ctx_id,a.user_id,~r~n" + &
"~t~t~t~tSUM(CASE a.access WHEN 'F' THEN 1 ELSE 0 END) fcnt,~r~n" + &
"~t~t~t~tSUM(CASE a.access WHEN 'R' THEN 1 ELSE 0 END) rcnt~r~n" + &
"~t~t~t~tFROM ~r~n" + &
"~t~t~t~t(~r~n" + &
"~t~t~t~t~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, ~r~n" + &
"            ~t~t~t~tuser_id = security_users.user_id,~r~n" + &
" ~t~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END) ~r~n" + &
"~t~t~t~t~t~tFROM #tmp_ctx_id, ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"~t~t~t~t~t~tWHERE ctx_basic_info.ctx_id = #tmp_ctx_id.ctx_id~r~n" + &
"                           AND security_users.user_id = @user_id ~r~n" + &
" ~t~t~t~t~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id ~r~n" + &
" ~t~t~t~t~t~tAND ctx_acp_contract_management_right.types=1~r~n" + &
"      ~t~t~t~t~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category ~r~n" + &
"      ~t~t~t~t~tAND ctx_acp_contract_management_right.rights In ('11','12','13') ~r~n" + &
" ~t~t~t~t~t~tAND NOT EXISTS (SELECT 1 FROM ctx_contract_contacts, ctx_contacts  ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_contacts.user_d = security_users.user_id AND ctx_contract_contacts.ic_area = 'I') ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tUNION~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tSELECT 1 FROM ctx_group_access,security_group_users,icred_settings~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tWHERE icred_settings.group_access = 1~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND (ctx_group_access.group_id = security_group_users.group_id )~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND ( security_group_users.user_id = security_users.user_id )~t~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_group_access.ctx_id = ctx_basic_info.ctx_id )~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~t)~r~n" + &
"       ~t~t~t~t~tunion~r~n" + &
"~t~t~t~t~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, ~r~n" + &
"            ~t~t~t~tuser_id = security_users.user_id,~r~n" + &
" ~t~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '61' THEN 'F' WHEN '62' THEN 'R' ELSE 'N' END) ~r~n" + &
"~t~t~t~t~t~tFROM #tmp_ctx_id, ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"~t~t~t~t~t~tWHERE ctx_basic_info.ctx_id = #tmp_ctx_id.ctx_id~r~n" + &
"                           AND security_users.user_id = @user_id~r~n" + &
" ~t~t~t~t~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id ~r~n" + &
" ~t~t~t~t~t~tAND ctx_acp_contract_management_right.types=6~r~n" + &
"      ~t~t~t~t~tAND ctx_acp_contract_management_right.category = ctx_basic_info.dvision ~r~n" + &
"      ~t~t~t~t~tAND ctx_acp_contract_management_right.rights In ('61','62','63') ~r~n" + &
" ~t~t~t~t~t~tAND NOT EXISTS (SELECT 1 FROM ctx_contract_contacts, ctx_contacts  ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_contacts.user_d = security_users.user_id AND ctx_contract_contacts.ic_area = 'I') ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tUNION~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tSELECT 1 FROM ctx_group_access,security_group_users,icred_settings~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tWHERE icred_settings.group_access = 1~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND (ctx_group_access.group_id = security_group_users.group_id )~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND ( security_group_users.user_id = security_users.user_id )~t~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_group_access.ctx_id = ctx_basic_info.ctx_id )~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t~t)~r~n" + &
"        ~t~t~t~tunion~r~n" + &
"~t~t~t~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, ~r~n" + &
"            ~t~t~tuser_id = security_users.user_id,~r~n" + &
" ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '71' THEN 'F' WHEN '72' THEN 'R' ELSE 'N' END) ~r~n" + &
"~t~t~t~t~tFROM #tmp_ctx_id, ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"~t~t~t~t~tWHERE ctx_basic_info.ctx_id = #tmp_ctx_id.ctx_id~r~n" + &
"                       AND security_users.user_id = @user_id~r~n" + &
" ~t~t~t~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id  ~r~n" + &
" ~t~t~t~t~tAND ctx_acp_contract_management_right.types=7~r~n" + &
"      ~t~t~t~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_department ~r~n" + &
"      ~t~t~t~tAND ctx_acp_contract_management_right.rights In ('71','72','73') ~r~n" + &
" ~t   ~t~t~t~tAND NOT EXISTS (SELECT 1 FROM ctx_contract_contacts, ctx_contacts  ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_contacts.user_d = security_users.user_id AND ctx_contract_contacts.ic_area = 'I') ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tUNION~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tSELECT 1 FROM ctx_group_access,security_group_users,icred_settings~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tWHERE icred_settings.group_access = 1~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND (ctx_group_access.group_id = security_group_users.group_id )~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND ( security_group_users.user_id = security_users.user_id )~t~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_group_access.ctx_id = ctx_basic_info.ctx_id )~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t)~r~n" + &
"~t~t~t~t~tunion~r~n" + &
"~t~t~t~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id, ~r~n" + &
"            ~t~t~tuser_id = security_users.user_id,~r~n" + &
" ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '81' THEN 'F' WHEN '82' THEN 'R' ELSE 'N' END) ~r~n" + &
"~t~t~t~t~tFROM #tmp_ctx_id, ctx_acp_contract_management_right, security_users, ctx_basic_info ~r~n" + &
"~t~t~t~t~tWHERE ctx_basic_info.ctx_id = #tmp_ctx_id.ctx_id~r~n" + &
"                       AND security_users.user_id = @user_id~r~n" + &
" ~t~t~t~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id ~r~n" + &
" ~t~t~t~t~tAND ctx_acp_contract_management_right.types=8~r~n" + &
"      ~t~t~t~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_type ~r~n" + &
"      ~t~t~t~tAND ctx_acp_contract_management_right.rights In ('81','82','83') ~r~n" + &
" ~t~t~t~t~tAND NOT EXISTS (SELECT 1 FROM ctx_contract_contacts, ctx_contacts  ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_contacts.user_d = security_users.user_id AND ctx_contract_contacts.ic_area = 'I') ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) ~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tUNION~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tSELECT 1 FROM ctx_group_access,security_group_users,icred_settings~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tWHERE icred_settings.group_access = 1~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND (ctx_group_access.group_id = security_group_users.group_id )~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND ( security_group_users.user_id = security_users.user_id )~t~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~tAND ( ctx_group_access.ctx_id = ctx_basic_info.ctx_id )~r~n" + &
"~t~t~t~t~t~t~t~t~t~t~t)~r~n" + &
"~t~t~t) a~r~n" + &
"~t~t~tGROUP BY a.ctx_id,a.user_id~r~n" + &
"     ~t~tHAVING SUM(CASE a.access WHEN 'N' THEN 1 ELSE 0 END) = 0~r~n" + &
"~t) b;~r~n" + &
""
//-----------------------------------------------------------------------------------------------------------------------------------------------//
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If Exists ( Select 1 From sysobjects where type = 'P' and name = 'up_document_browse' )~r~n" + &
"Begin~r~n" + &
"~tDrop Procedure up_document_browse~r~n" + &
"End ~r~n" 
 
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"create procedure up_document_browse~r~n" + &
"  @user_id varchar(10),~r~n" + &
"  @readonly_flag char(1), ~r~n" + &
"  @ctx_id int = NULL, ~r~n" + &
"  @doc_id int = NULL, ~r~n" + &
"  @doc_name varchar(100) = NULL, ~r~n" + &
"  @doc_ext varchar(10) = NULL, ~r~n" + &
"  @doc_type varchar(30) = NULL, ~r~n" + &
"  @doc_status numeric(6, 0) = NULL, ~r~n" + &
"  @create_by varchar(10) = NULL, ~r~n" + &
"  @facility_name varchar(150) = NULL, ~r~n" + &
"  @checkout_by varchar(10) = NULL, ~r~n" + &
"  @category numeric(6, 0) = NULL,~r~n" + &
"  @checkout_status varchar(3) = NULL,~r~n" + &
"  @custom_1_style varchar(30) = NULL,~r~n" + &
"  @custom_2_style varchar(30) = NULL,~r~n" + &
"  @custom_3_style varchar(30) = NULL,~r~n" + &
"  @custom_4_style varchar(30) = NULL,~r~n" + &
"  @custom_5_style varchar(30) = NULL,~r~n" + &
"  @custom_6_style varchar(30) = NULL,~r~n" + &
"  @custom_7_style varchar(30) = NULL,~r~n" + &
"  @custom_8_style varchar(30) = NULL,~r~n" + &
"  @custom_9_style varchar(30) = NULL,~r~n" + &
"  @custom_10_style varchar(30) = NULL,~r~n" + &
"  @custom_1 varchar(75) = NULL,~r~n" + &
"  @custom_2 varchar(75) = NULL,~r~n" + &
"  @custom_3 varchar(75) = NULL,~r~n" + &
"  @custom_4 varchar(75) = NULL,~r~n" + &
"  @custom_5 varchar(75) = NULL,~r~n" + &
"  @custom_6 varchar(75) = NULL,~r~n" + &
"  @custom_7 varchar(75) = NULL,~r~n" + &
"  @custom_8 varchar(75) = NULL,~r~n" + &
"  @custom_9 varchar(75) = NULL,~r~n" + &
"  @custom_10 varchar(75) = NULL,~r~n" + &
"  @custom_n1 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n2 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n3 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n4 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n5 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n6 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n7 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n8 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n9 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_n10 numeric(12, 2) = NULL, ~r~n" + &
"  @custom_date1 datetime = NULL,~r~n" + &
"  @custom_date2 datetime = NULL,~r~n" + &
"  @custom_date3 datetime = NULL,~r~n" + &
"  @custom_date4 datetime = NULL,~r~n" + &
"  @custom_date5 datetime = NULL,~r~n" + &
"  @custom_date6 datetime = NULL~r~n" + &
"as~r~n" + &
"~r~n" + &
"/*~r~n" + &
"  Revision History:~r~n" + &
"  7.9.2016 - Initial version by Ronnie Po~r~n" + &
"~r~n" + &
"  Notes:~r~n" + &
"~r~n" + &
"  @readonly_flag~r~n" + &
"    - provided for backward compatability. A check is performed on the front end to determine whether~r~n" + &
"    user has read-only access to the relevant module.~r~n" + &
"    If 'Y', then return all rows regardless of the value of #tmp_ctx.access~r~n" + &
"    Else, return only those rows where access IN ('F', 'R')~r~n" + &
"  ~r~n" + &
"~r~n" + &
"exec up_document_browse~r~n" + &
"  @user_id = 'MASTER', ~r~n" + &
"  @category = 117856~r~n" + &
";~r~n" + &
"~r~n" + &
"Test with User ID's~r~n" + &
"CBX1134~r~n" + &
"LNC7344~r~n" + &
"JTH2304~r~n" + &
"RBT4578~r~n" + &
"PXR7925~r~n" + &
"1 = 1  And category = 117856~r~n" + &
"~r~n" + &
"Front end filter by document name:~r~n" + &
"doc_name + ' ' + String(  doc_id )+ '.' + String(  revision ,'##0.0') + '.' +  doc_ext~r~n" + &
"~r~n" + &
"*/~r~n" + &
"~r~n" + &
"create table #tmp_ctx (~r~n" + &
"  ctx_id int,~r~n" + &
"  user_id varchar(10),~r~n" + &
"  access char(1)~r~n" + &
")~r~n" + &
"~r~n" + &
"IF ltrim(rtrim(isNull(@readonly_flag, 'N'))) = 'N'~r~n" + &
"BEGIN~r~n" + &
"  /* Will need to search by ~"access~" */~r~n" + &
"  create index xie1tmp_ctx on #tmp_ctx (~r~n" + &
"    access~r~n" + &
"  )~r~n" + &
"END~r~n" + &
"~r~n" + &
"/* Temp table to store list of unique ctx_id */~r~n" + &
"create table #tmp_ctx_id (~r~n" + &
"  ctx_id int~r~n" + &
")~r~n" + &
"~r~n" + &
"/* Temp table for initial matching records */~r~n" + &
"create table #tmp_match (~r~n" + &
"  doc_id int,~r~n" + &
"  ctx_id int,~r~n" + &
"  facility_id int, ~r~n" + &
"  Revision numeric(5, 1) DEFAULT ((0)),~r~n" + &
"/* For compatability with front-end filtering */~r~n" + &
"  doc_full_name varchar(255)~r~n" + &
")~r~n" + &
"~r~n" + &
"/* Temp tables for view_id */~r~n" + &
"create table #tmp_ctx_group_view (~r~n" + &
"  ctx_id int,~r~n" + &
"  view_id numeric(10, 0)~r~n" + &
")~r~n" + &
"create table #tmp_ctx_view (~r~n" + &
"  ctx_id int,~r~n" + &
"  view_id numeric(10, 0)~r~n" + &
")~r~n" + &
"~r~n" + &
"~r~n" + &
"/* Table for result set */~r~n" + &
"  create table #tmp_doc (~r~n" + &
"    row_id int, ~r~n" + &
"~tDoc_id int,~r~n" + &
"~tctx_id int,~r~n" + &
"~tdoc_name varchar(200),~r~n" + &
"~tRevision numeric(5, 1) DEFAULT ((0)),~r~n" + &
"~tdoc_type varchar(30),~r~n" + &
"~tdoc_ext varchar(10) DEFAULT ('doc'),~r~n" + &
"~texport_id int NULL,~r~n" + &
"~tWf_id int NULL,~r~n" + &
"~tCreate_by char(10) NULL,~r~n" + &
"~tCreate_date datetime NULL DEFAULT (getdate()),~r~n" + &
"~tStatus numeric(6, 0) NULL,~r~n" + &
"~tStatus_by char(10) NULL,~r~n" + &
"~tStatus_date datetime NULL,~r~n" + &
"~tfilename varchar(500) NULL,~r~n" + &
"~tcategory numeric(6, 0) NULL,~r~n" + &
"~tDoc_from_type char(1) NULL,~r~n" + &
"~tDoc_from_name varchar(20) NULL,~r~n" + &
"~tNotes varchar(255) NULL,~r~n" + &
"~tcheckout_by varchar(10) NULL,~r~n" + &
"~tcheckout_date datetime NULL,~r~n" + &
"~tcheckout_status char(1) NULL DEFAULT ('0'),~r~n" + &
"~tRevision_control char(1) NULL DEFAULT ('0'),~r~n" + &
"~tReceived_By varchar(20) NULL,~r~n" + &
"~tReceived_Date datetime NULL,~r~n" + &
"~tBase_type char(1) NULL,~r~n" + &
"~tNotes_2 varchar(255) NULL,~r~n" + &
"    facility_name varchar(150), ~r~n" + &
"    ctx_basic_info_category numeric(6, 0), ~r~n" + &
"    style char(1),~r~n" + &
"    level int, ~r~n" + &
"    compare_status char(1),~r~n" + &
"    audit_version int,~r~n" + &
"    audit_count int,~r~n" + &
"~tFrom_templete_id numeric(6, 0) NULL,~r~n" + &
"~tes_apicode varchar(50) NULL,~r~n" + &
"~tes_fileid varchar(500) NULL,~r~n" + &
"~tes_docid varchar(500) NULL,~r~n" + &
"~tes_sender varchar(50) NULL,~r~n" + &
"~tes_sender_email varchar(100) NULL,~r~n" + &
"~tapprove_id numeric(10, 0) NULL,~r~n" + &
"~tprimary_doc char(1) NULL,~r~n" + &
"~tesign_type varchar(50) NULL,~r~n" + &
"~tcustom_1 varchar(75) NULL,~r~n" + &
"~tcustom_2 varchar(75) NULL,~r~n" + &
"~tcustom_3 varchar(75) NULL,~r~n" + &
"~tcustom_4 varchar(75) NULL,~r~n" + &
"~tcustom_5 varchar(75) NULL,~r~n" + &
"~tcustom_6 varchar(75) NULL,~r~n" + &
"~tcustom_7 varchar(75) NULL,~r~n" + &
"~tcustom_8 varchar(75) NULL,~r~n" + &
"~tcustom_9 varchar(75) NULL,~r~n" + &
"~tcustom_10 varchar(75) NULL,~r~n" + &
"~tcustom_n1 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n2 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n3 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n4 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n5 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n6 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n7 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n8 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n9 numeric(12, 2) NULL,~r~n" + &
"~tcustom_n10 numeric(12, 2) NULL,~r~n" + &
"~tcustom_date1 datetime NULL,~r~n" + &
"~tcustom_date2 datetime NULL,~r~n" + &
"~tcustom_date3 datetime NULL,~r~n" + &
"~tcustom_date4 datetime NULL,~r~n" + &
"~tcustom_date5 datetime NULL,~r~n" + &
"~tcustom_date6 datetime NULL~r~n" + &
")~r~n" + &
"~r~n" + &
"create unique index xak1tmp_doc on #tmp_doc ( row_id )~r~n" + &
"create index xietmp_doc on #tmp_doc ( ctx_id )~r~n" + &
"~r~n" + &
"/* NOTE: Index won't help since we're searching by pattern within doc_full_name */~r~n" + &
"~r~n" + &
"/* 8.15.2016 - handle single quotes within arguments; handle percent sign literal */~r~n" + &
"  SELECT~r~n" + &
"    @doc_name = replace(replace(@doc_name, '''', ''''''), '%', '[%]'),~r~n" + &
"    @facility_name = replace(replace(@facility_name, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_1 = replace(replace(@custom_1, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_2 = replace(replace(@custom_2, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_3 = replace(replace(@custom_3, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_4 = replace(replace(@custom_4, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_5 = replace(replace(@custom_5, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_6 = replace(replace(@custom_6, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_7 = replace(replace(@custom_7, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_8 = replace(replace(@custom_8, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_9 = replace(replace(@custom_9, '''', ''''''), '%', '[%]'),~r~n" + &
"    @custom_10 = replace(replace(@custom_10, '''', ''''''), '%', '[%]')~r~n" + &
"~r~n" + &
"  DECLARE @sql_text varchar(4000),~r~n" + &
"    @sql_dynamic varchar(3000)~r~n" + &
"~r~n" + &
"/*----------------------------------------------------------------------------------------*/~r~n" + &
"/* Dynamic portion of the query */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic = ''~r~n" + &
"  +~r~n" + &
"  CASE WHEN @category IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.category = ' + convert(varchar, @category) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @ctx_id IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.ctx_id = ' + convert(varchar, @ctx_id) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @doc_id IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.doc_id = ' + convert(varchar, @doc_id) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@doc_ext, ''))) = '' THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.doc_ext = ''' + @doc_ext + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@doc_type, ''))) = '' THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.doc_type = ''' + @doc_type + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @doc_status IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.status = ' + convert(varchar, @doc_status) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@create_by, ''))) = '' THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_am_document.create_by = ''' + @create_by + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@facility_name, ''))) = '' THEN '' ELSE ' AND~r~n" + &
"    ( app_facility.facility_name LIKE ''%' + @facility_name + '%'' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@checkout_by, ''))) = '' THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_am_document.checkout_by = ''' + @checkout_by + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE ltrim(rtrim(isNull(@checkout_status, '')))~r~n" + &
"    WHEN '' THEN ''~r~n" + &
"    WHEN '100' THEN ' AND~r~n" + &
"    ( checkout_status IN (''1'', ''2'', ''3'', ''5'', ''6'') )'~r~n" + &
"    WHEN '2' THEN ' AND ~r~n" + &
"    ( checkout_status IN (''2'', ''3'') )'~r~n" + &
"    WHEN '5' THEN ' AND~r~n" + &
"    ( checkout_status IN (''5'', ''6'') )'~r~n" + &
"    ELSE ' AND~r~n" + &
"    ( checkout_status = ''' + @checkout_status + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_1, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_1_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_1 = ''' + @custom_1 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_1 LIKE ''%' + @custom_1 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_2, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_2_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_2 = ''' + @custom_2 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_2 LIKE ''%' + @custom_2 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_3, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_3_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_3 = ''' + @custom_3 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_3 LIKE ''%' + @custom_3 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_4, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_4_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_4 = ''' + @custom_4 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_4 LIKE ''%' + @custom_4 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_5, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_5_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_5 = ''' + @custom_5 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_5 LIKE ''%' + @custom_5 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_6, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_6_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_6 = ''' + @custom_6 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_6 LIKE ''%' + @custom_6 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_7, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_7_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_7 = ''' + @custom_7 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_7 LIKE ''%' + @custom_7 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_8, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_8_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_8 = ''' + @custom_8 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_8 LIKE ''%' + @custom_8 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_9, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_9_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_9 = ''' + @custom_9 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_9 LIKE ''%' + @custom_9 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN ltrim(rtrim(isNull(@custom_10, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_10_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_am_document.custom_10 = ''' + @custom_10 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_10 LIKE ''%' + @custom_10 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"~r~n" + &
"~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n1 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n1 = ' + convert(varchar, @custom_n1) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n2 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n2 = ' + convert(varchar, @custom_n2) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n3 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n3 = ' + convert(varchar, @custom_n3) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n4 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n4 = ' + convert(varchar, @custom_n4) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n5 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n5 = ' + convert(varchar, @custom_n5) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n6 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n6 = ' + convert(varchar, @custom_n6) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n7 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n7 = ' + convert(varchar, @custom_n7) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n8 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n8 = ' + convert(varchar, @custom_n8) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n9 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n9 = ' + convert(varchar, @custom_n9) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_n1 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_n10 = ' + convert(varchar, @custom_n10) + ' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_date1 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_date1 = ''' + convert(varchar, @custom_date1) + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_date2 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_date2 = ''' + convert(varchar, @custom_date2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_date3 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_date3 = ''' + convert(varchar, @custom_date3) + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_date4 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_date4 = ''' + convert(varchar, @custom_date4) + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_date5 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_date5 = ''' + convert(varchar, @custom_date5) + ''' )'~r~n" + &
"  END~r~n" + &
"  +~r~n" + &
"  CASE WHEN @custom_date6 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_am_document.custom_date6 = ''' + convert(varchar, @custom_date6) + ''' )'~r~n" + &
"  END~r~n" + &
"/*----------------------------------------------------------------------------------------*/~r~n" + &
"~r~n" + &
"~r~n" + &
"~r~n" + &
"/*********************************************************************/~r~n" + &
"IF ltrim(rtrim(isNull(@doc_name, ''))) <> '' BEGIN~r~n" + &
"  /* Need intermediate SELECT to resolve name match */~r~n" + &
"  SELECT~r~n" + &
"    @sql_text = '~r~n" + &
"  INSERT #tmp_match~r~n" + &
"  SELECT~r~n" + &
"    ctx_am_document.doc_id,   ~r~n" + &
"    ctx_am_document.ctx_id,   ~r~n" + &
"    app_facility.facility_id, ~r~n" + &
"    ctx_am_document.revision,   ~r~n" + &
"    ctx_am_document.doc_name + '' '' + convert(varchar, ctx_am_document.doc_id) + convert(varchar, ctx_am_document.revision) + ''.'' + ctx_am_document.doc_ext~r~n" + &
"  FROM~r~n" + &
"    ctx_am_document,~r~n" + &
"    ctx_basic_info,~r~n" + &
"    app_facility,~r~n" + &
"    ctx_am_doc_image~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_am_document.ctx_id = ctx_basic_info.ctx_id ) AND ~r~n" + &
"    ( ctx_basic_info.ctx_id > 0 ) AND ~r~n" + &
"    ( ctx_basic_info.app_facility = app_facility.facility_id ) AND~r~n" + &
"    ( ctx_am_document.doc_id = ctx_am_doc_image.doc_id ) AND ~r~n" + &
"    ( ctx_am_document.revision = ctx_am_doc_image.revision )'~r~n" + &
"  +~r~n" + &
"  @sql_dynamic~r~n" + &
"  +~r~n" + &
"'~r~n" + &
"  ORDER BY~r~n" + &
"    ctx_am_document.ctx_id Asc,~r~n" + &
"    ctx_am_document.doc_name Asc'~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text)~r~n" + &
"  /* #tmp_match is now populated */~r~n" + &
"~r~n" + &
"  INSERT #tmp_doc~r~n" + &
"  SELECT~r~n" + &
"    ROW_NUMBER() OVER ( ORDER BY ctx_am_document.ctx_id Asc, ctx_am_document.doc_name Asc ),~r~n" + &
"    ctx_am_document.doc_id,   ~r~n" + &
"    ctx_am_document.ctx_id,   ~r~n" + &
"    ctx_am_document.doc_name,   ~r~n" + &
"    ctx_am_document.revision,   ~r~n" + &
"    ctx_am_document.doc_type,   ~r~n" + &
"    ctx_am_document.doc_ext,   ~r~n" + &
"    ctx_am_document.export_id,   ~r~n" + &
"    ctx_am_document.wf_id,   ~r~n" + &
"    ctx_am_document.create_by,   ~r~n" + &
"    ctx_am_document.create_date,   ~r~n" + &
"    ctx_am_document.status,   ~r~n" + &
"    ctx_am_document.status_by,   ~r~n" + &
"    ctx_am_document.status_date,   ~r~n" + &
"    ctx_am_document.filename,   ~r~n" + &
"    ctx_am_document.category,~r~n" + &
"    ctx_am_document.doc_from_type,   ~r~n" + &
"    ctx_am_document.doc_from_name,   ~r~n" + &
"    ctx_am_document.notes,   ~r~n" + &
"    ctx_am_document.checkout_by,   ~r~n" + &
"    ctx_am_document.checkout_date,   ~r~n" + &
"    ctx_am_document.checkout_status,   ~r~n" + &
"    ctx_am_document.revision_control,   ~r~n" + &
"    ctx_am_document.Received_By,~r~n" + &
"    ctx_am_document.Received_date,~r~n" + &
"    ctx_am_document.base_type,~r~n" + &
"    ctx_am_document.notes,~r~n" + &
"    app_facility.facility_name,~r~n" + &
"    ctx_basic_info.category,~r~n" + &
"    style = ' ',~r~n" + &
"    level = 1,~r~n" + &
"    compare_status = ' ',~r~n" + &
"    audit_version = 0,~r~n" + &
"    audit_count = 0 ,~r~n" + &
"    from_templete_id = ctx_am_document.from_templete_id ,~r~n" + &
"    ctx_am_document.es_apicode,   ~r~n" + &
"    ctx_am_document.es_fileid,   ~r~n" + &
"    ctx_am_document.es_docid,   ~r~n" + &
"    ctx_am_document.es_sender,   ~r~n" + &
"    ctx_am_document.es_sender_email,~r~n" + &
"    ctx_am_document.approve_id,~r~n" + &
"    ctx_am_document.primary_doc,~r~n" + &
"    ctx_am_document.esign_type ,~r~n" + &
"    ctx_am_document.custom_1,   ~r~n" + &
"    ctx_am_document.custom_2,   ~r~n" + &
"    ctx_am_document.custom_3,   ~r~n" + &
"    ctx_am_document.custom_4,   ~r~n" + &
"    ctx_am_document.custom_5,   ~r~n" + &
"    ctx_am_document.custom_6,   ~r~n" + &
"    ctx_am_document.custom_7,   ~r~n" + &
"    ctx_am_document.custom_8,   ~r~n" + &
"    ctx_am_document.custom_9,   ~r~n" + &
"    ctx_am_document.custom_10,   ~r~n" + &
"    ctx_am_document.custom_n1,   ~r~n" + &
"    ctx_am_document.custom_n2,   ~r~n" + &
"    ctx_am_document.custom_n3,   ~r~n" + &
"    ctx_am_document.custom_n4,   ~r~n" + &
"    ctx_am_document.custom_n5,   ~r~n" + &
"    ctx_am_document.custom_n6,   ~r~n" + &
"    ctx_am_document.custom_n7,   ~r~n" + &
"    ctx_am_document.custom_n8,   ~r~n" + &
"    ctx_am_document.custom_n9,   ~r~n" + &
"    ctx_am_document.custom_n10,   ~r~n" + &
"    ctx_am_document.custom_date1,   ~r~n" + &
"    ctx_am_document.custom_date2,   ~r~n" + &
"    ctx_am_document.custom_date3,   ~r~n" + &
"    ctx_am_document.custom_date4,   ~r~n" + &
"    ctx_am_document.custom_date5,   ~r~n" + &
"    ctx_am_document.custom_date6~r~n" + &
"  FROM~r~n" + &
"    #tmp_match, ~r~n" + &
"    ctx_am_document,~r~n" + &
"    ctx_basic_info, ~r~n" + &
"    app_facility,~r~n" + &
"    ctx_am_doc_image~r~n" + &
"  WHERE~r~n" + &
"    ( #tmp_match.doc_full_name LIKE '%' + @doc_name + '%' ) AND~r~n" + &
"    ( ctx_am_document.doc_id = #tmp_match.doc_id ) AND ~r~n" + &
"    ( ctx_basic_info.ctx_id = #tmp_match.ctx_id ) AND ~r~n" + &
"    ( app_facility.facility_id = #tmp_match.facility_id ) AND~r~n" + &
"    ( ctx_am_doc_image.doc_id = #tmp_match.doc_id ) AND ~r~n" + &
"    ( ctx_am_doc_image.revision = #tmp_match.revision )~r~n" + &
"~r~n" + &
"  GOTO have_documents~r~n" + &
"~r~n" + &
"END~r~n" + &
"/* IF ltrim(rtrim(isNull(@doc_name, ''))) <> '' BEGIN */~r~n" + &
"/*********************************************************************/~r~n" + &
"~r~n" + &
"~r~n" + &
"/* If we're here, then we're not searching by @doc_name */~r~n" + &
"~r~n" + &
"  SELECT~r~n" + &
"    @sql_text = '~r~n" + &
"  INSERT #tmp_doc~r~n" + &
"  SELECT~r~n" + &
"    ROW_NUMBER() OVER ( ORDER BY ctx_am_document.ctx_id Asc, ctx_am_document.doc_name Asc ),~r~n" + &
"    ctx_am_document.doc_id,   ~r~n" + &
"    ctx_am_document.ctx_id,   ~r~n" + &
"    ctx_am_document.doc_name,   ~r~n" + &
"    ctx_am_document.revision,   ~r~n" + &
"    ctx_am_document.doc_type,   ~r~n" + &
"    ctx_am_document.doc_ext,   ~r~n" + &
"    ctx_am_document.export_id,   ~r~n" + &
"    ctx_am_document.wf_id,   ~r~n" + &
"    ctx_am_document.create_by,   ~r~n" + &
"    ctx_am_document.create_date,   ~r~n" + &
"    ctx_am_document.status,   ~r~n" + &
"    ctx_am_document.status_by,   ~r~n" + &
"    ctx_am_document.status_date,   ~r~n" + &
"    ctx_am_document.filename,   ~r~n" + &
"    ctx_am_document.category,~r~n" + &
"    ctx_am_document.doc_from_type,   ~r~n" + &
"    ctx_am_document.doc_from_name,   ~r~n" + &
"    ctx_am_document.notes,   ~r~n" + &
"    ctx_am_document.checkout_by,   ~r~n" + &
"    ctx_am_document.checkout_date,   ~r~n" + &
"    ctx_am_document.checkout_status,   ~r~n" + &
"    ctx_am_document.revision_control,   ~r~n" + &
"    ctx_am_document.Received_By,~r~n" + &
"    ctx_am_document.Received_date,~r~n" + &
"    ctx_am_document.base_type,~r~n" + &
"    ctx_am_document.notes,~r~n" + &
"    app_facility.facility_name,~r~n" + &
"    ctx_basic_info.category,~r~n" + &
"    style = '' '',~r~n" + &
"    level = 1,~r~n" + &
"    compare_status = '' '',~r~n" + &
"    audit_version = 0,~r~n" + &
"    audit_count = 0 ,~r~n" + &
"    from_templete_id = ctx_am_document.from_templete_id ,~r~n" + &
"    ctx_am_document.es_apicode,   ~r~n" + &
"    ctx_am_document.es_fileid,   ~r~n" + &
"    ctx_am_document.es_docid,   ~r~n" + &
"    ctx_am_document.es_sender,   ~r~n" + &
"    ctx_am_document.es_sender_email,~r~n" + &
"    ctx_am_document.approve_id,~r~n" + &
"    ctx_am_document.primary_doc,~r~n" + &
"    ctx_am_document.esign_type ,~r~n" + &
"    ctx_am_document.custom_1,   ~r~n" + &
"    ctx_am_document.custom_2,   ~r~n" + &
"    ctx_am_document.custom_3,   ~r~n" + &
"    ctx_am_document.custom_4,   ~r~n" + &
"    ctx_am_document.custom_5,   ~r~n" + &
"    ctx_am_document.custom_6,   ~r~n" + &
"    ctx_am_document.custom_7,   ~r~n" + &
"    ctx_am_document.custom_8,   ~r~n" + &
"    ctx_am_document.custom_9,   ~r~n" + &
"    ctx_am_document.custom_10,   ~r~n" + &
"    ctx_am_document.custom_n1,   ~r~n" + &
"    ctx_am_document.custom_n2,   ~r~n" + &
"    ctx_am_document.custom_n3,   ~r~n" + &
"    ctx_am_document.custom_n4,   ~r~n" + &
"    ctx_am_document.custom_n5,   ~r~n" + &
"    ctx_am_document.custom_n6,   ~r~n" + &
"    ctx_am_document.custom_n7,   ~r~n" + &
"    ctx_am_document.custom_n8,   ~r~n" + &
"    ctx_am_document.custom_n9,   ~r~n" + &
"    ctx_am_document.custom_n10,   ~r~n" + &
"    ctx_am_document.custom_date1,   ~r~n" + &
"    ctx_am_document.custom_date2,   ~r~n" + &
"    ctx_am_document.custom_date3,   ~r~n" + &
"    ctx_am_document.custom_date4,   ~r~n" + &
"    ctx_am_document.custom_date5,   ~r~n" + &
"    ctx_am_document.custom_date6~r~n" + &
"  FROM~r~n" + &
"    ctx_am_document,~r~n" + &
"    ctx_basic_info,~r~n" + &
"    app_facility,~r~n" + &
"    ctx_am_doc_image~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_am_document.ctx_id = ctx_basic_info.ctx_id ) AND ~r~n" + &
"    ( ctx_basic_info.ctx_id > 0 ) AND ~r~n" + &
"    ( ctx_basic_info.app_facility = app_facility.facility_id ) AND~r~n" + &
"    ( ctx_am_document.doc_id = ctx_am_doc_image.doc_id ) AND ~r~n" + &
"    ( ctx_am_document.revision = ctx_am_doc_image.revision )'~r~n" + &
"  +~r~n" + &
"  @sql_dynamic~r~n" + &
"  +~r~n" + &
"'~r~n" + &
"  ORDER BY~r~n" + &
"    ctx_am_document.ctx_id Asc,~r~n" + &
"    ctx_am_document.doc_name Asc'~r~n" + &
"~r~n" + &
" EXECUTE (@sql_text)~r~n" + &
"/* #tmp_doc is now populated */~r~n" + &
"~r~n" + &
"~r~n" + &
"have_documents:~r~n" + &
"~r~n" + &
"/* Get unique ctx_id for access list calc */~r~n" + &
"  INSERT #tmp_ctx_id~r~n" + &
"  SELECT DISTINCT~r~n" + &
"    ctx_id~r~n" + &
"  FROM~r~n" + &
"    #tmp_doc~r~n" + &
"~r~n" + &
"  EXEC up_ctx_access_list @user_id~r~n" + &
"~r~n" + &
"/* #tmp_ctx is now populated */~r~n" + &
"IF ltrim(rtrim(isNull(@readonly_flag, 'N'))) = 'N'~r~n" + &
"BEGIN~r~n" + &
"  /* Keep only those ctx_id to which user has 'F' or 'R' access */~r~n" + &
"  DELETE FROM #tmp_ctx~r~n" + &
"  WHERE~r~n" + &
"    access IS NULL~r~n" + &
"~r~n" + &
"  DELETE FROM #tmp_ctx~r~n" + &
"  WHERE~r~n" + &
"    access = 'N'~r~n" + &
"END~r~n" + &
"~r~n" + &
"~r~n" + &
"~r~n" + &
"/* Determine view_id by group */~r~n" + &
"  INSERT #tmp_ctx_group_view~r~n" + &
"  SELECT DISTINCT~r~n" + &
"    ctx_group_access.ctx_id,~r~n" + &
"    ctx_group_access.view_id~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx_id, ~r~n" + &
"    ctx_group_access,~r~n" + &
"    security_group_users ,~r~n" + &
"    icred_settings~r~n" + &
"  WHERE~r~n" + &
"    ( icred_settings.group_access = 1 ) And ~r~n" + &
"    ( security_group_users.user_id = @user_id ) And ~r~n" + &
"    ( ctx_group_access.ctx_id = #tmp_ctx_id.ctx_id ) and ~r~n" + &
"    ( ctx_group_access.group_id = security_group_users.group_id ) And ~r~n" + &
"    ( ctx_group_access.view_id IS NOT NULL ) And ~r~n" + &
"    ( ctx_group_access.access IN ('F','R') )~r~n" + &
"~r~n" + &
"/* Get ctx view_id */~r~n" + &
"  INSERT #tmp_ctx_view~r~n" + &
"  SELECT~r~n" + &
"    #tmp_ctx_id.ctx_id,~r~n" + &
"    isNull(#tmp_ctx_group_view.view_id, isNull(code_lookup.ic_n, isNull(security_users.contract_default_view, 1001)))~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx_id~r~n" + &
"    JOIN ctx_basic_info ON ( #tmp_ctx_id.ctx_id = ctx_basic_info.ctx_id )~r~n" + &
"    LEFT OUTER JOIN code_lookup ON ( ctx_basic_info.category = code_lookup.lookup_code )~r~n" + &
"    LEFT OUTER JOIN #tmp_ctx_group_view ON ( #tmp_ctx_id.ctx_id = #tmp_ctx_group_view.ctx_id ),~r~n" + &
"    security_users~r~n" + &
"  WHERE~r~n" + &
"    ( security_users.user_id = @user_id )~r~n" + &
"~r~n" + &
"~r~n" + &
"/* If a corresponding ctx_screen does not exist, then cannot view that ctx */~r~n" + &
"  DELETE FROM~r~n" + &
"    #tmp_doc~r~n" + &
"  WHERE NOT EXISTS (~r~n" + &
"    SELECT *~r~n" + &
"    FROM~r~n" + &
"      #tmp_ctx_view,~r~n" + &
"      ctx_screen~r~n" + &
"    WHERE~r~n" + &
"      ( #tmp_ctx_view.ctx_id = #tmp_doc.ctx_id ) and~r~n" + &
"      ( ctx_screen.data_view_id = #tmp_ctx_view.view_id ) and~r~n" + &
"      ( ctx_screen.tab_name = 'tabpage_images' )~r~n" + &
"  )~r~n" + &
"~r~n" + &
"/* If icred_settings.filter_documents = 1, then if lookup_code = ctx_am_document.category then NO ACCESS */~r~n" + &
"  DELETE FROM~r~n" + &
"    #tmp_doc~r~n" + &
"  FROM~r~n" + &
"    icred_settings,~r~n" + &
"    code_lookup,~r~n" + &
"    ctx_acp_contract_management_right,~r~n" + &
"    security_users~r~n" + &
"  WHERE~r~n" + &
"    ( icred_settings.filter_documents = 1 ) and~r~n" + &
"    ( code_lookup.lookup_code = #tmp_doc.category ) and~r~n" + &
"    ( security_users.user_id = @user_id ) AND  ~r~n" + &
"    ( ctx_acp_contract_management_right.types = 1 ) AND  ~r~n" + &
"    ( ctx_acp_contract_management_right.rights in ('13','24','34','44') ) and ~r~n" + &
"    ( ctx_acp_contract_management_right.role_id = security_users.role_id ) and  ~r~n" + &
"    ( ctx_acp_contract_management_right.category = code_lookup.lookup_code ) and  ~r~n" + &
"    ( code_lookup.lookup_name IN ('Contract Clause Category', 'Contract Category') )~r~n" + &
"~r~n" + &
"~r~n" + &
"  /* Result set */~r~n" + &
"  SELECT~r~n" + &
"~tDoc_id,~r~n" + &
"~t#tmp_doc.ctx_id,~r~n" + &
"~tdoc_name,~r~n" + &
"~tRevision,~r~n" + &
"~tdoc_type,~r~n" + &
"~tdoc_ext,~r~n" + &
"~texport_id,~r~n" + &
"~tWf_id,~r~n" + &
"~tCreate_by,~r~n" + &
"~tCreate_date,~r~n" + &
"~tStatus,~r~n" + &
"~tStatus_by,~r~n" + &
"~tStatus_date,~r~n" + &
"~tfilename,~r~n" + &
"~tcategory,~r~n" + &
"~tDoc_from_type,~r~n" + &
"~tDoc_from_name,~r~n" + &
"~tNotes,~r~n" + &
"~tcheckout_by,~r~n" + &
"~tcheckout_date,~r~n" + &
"~tcheckout_status,~r~n" + &
"~tRevision_control,~r~n" + &
"~tReceived_By,~r~n" + &
"~tReceived_Date,~r~n" + &
"~tBase_type,~r~n" + &
"~tNotes_2,~r~n" + &
"    facility_name, ~r~n" + &
"    ctx_basic_info_category, ~r~n" + &
"    ctx_access_list_access = #tmp_ctx.access, ~r~n" + &
"    style,~r~n" + &
"    level, ~r~n" + &
"    compare_status,~r~n" + &
"    audit_version,~r~n" + &
"    audit_count,~r~n" + &
"~tFrom_templete_id,~r~n" + &
"~tes_apicode,~r~n" + &
"~tes_fileid,~r~n" + &
"~tes_docid,~r~n" + &
"~tes_sender,~r~n" + &
"~tes_sender_email,~r~n" + &
"~tapprove_id,~r~n" + &
"~tprimary_doc,~r~n" + &
"~tesign_type,~r~n" + &
"~tcustom_1,~r~n" + &
"~tcustom_2,~r~n" + &
"~tcustom_3,~r~n" + &
"~tcustom_4,~r~n" + &
"~tcustom_5,~r~n" + &
"~tcustom_6,~r~n" + &
"~tcustom_7,~r~n" + &
"~tcustom_8,~r~n" + &
"~tcustom_9,~r~n" + &
"~tcustom_10,~r~n" + &
"~tcustom_n1,~r~n" + &
"~tcustom_n2,~r~n" + &
"~tcustom_n3,~r~n" + &
"~tcustom_n4,~r~n" + &
"~tcustom_n5,~r~n" + &
"~tcustom_n6,~r~n" + &
"~tcustom_n7,~r~n" + &
"~tcustom_n8,~r~n" + &
"~tcustom_n9,~r~n" + &
"~tcustom_n10,~r~n" + &
"~tcustom_date1,~r~n" + &
"~tcustom_date2,~r~n" + &
"~tcustom_date3,~r~n" + &
"~tcustom_date4,~r~n" + &
"~tcustom_date5,~r~n" + &
"~tcustom_date6~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx,~r~n" + &
"    #tmp_doc~r~n" + &
"  WHERE~r~n" + &
"    ( #tmp_doc.ctx_id = #tmp_ctx.ctx_id ) ~r~n" + &
"  ORDER BY    row_id"
//-----------------------------------------------------------------------------------------//



of_execute_sqls("of_ver150_release_storeprocedure7")
return 1
end function

public function integer of_ver150_release_storeprocedure8 ();//Added by gavins 08162016

//modified by gavins 09272016
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if object_id('sp_contract_search_2_result') is not null~r~n" + &
"Begin~r~n" + &
"  drop procedure sp_contract_search_2_result;~r~n"  + &
"End ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"create procedure sp_contract_search_2_result~r~n" + &
"  @user_d varchar(10), ~r~n" + &
"  @product_type numeric(6, 0) = NULL, ~r~n" + &
"  @product_name varchar(150) = NULL, ~r~n" + &
"  @display_multi_products varchar(10),~r~n" + &
"  @check_rowcount_flag char(1) = 'N'~r~n" + &
"as~r~n" + &
"  DECLARE @sql_text varchar(5000)~r~n" + &
"  DECLARE @rows_per_page int, @ctx_rowcount int~r~n" + &
"  SELECT @rows_per_page = ctx_search_rows_per_page FROM icred_settings~r~n" + &
"  IF @rows_per_page IS NULL SELECT @check_rowcount_flag = 'N'~r~n" + &
"  /*********prepare #temp_ctx_user data********/    ~r~n" + &
"  INSERT #temp_ctx_user~r~n" + &
"  SELECT ctx_contacts.user_d,ctx_contract_contacts.ctx_id~r~n" + &
"  FROM #tmp_ctx, ctx_contract_contacts, ctx_contacts       ~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = #tmp_ctx.ctx_id ) and~r~n" + &
"    ( ctx_contract_contacts.ic_area = 'I' ) AND ~r~n" + &
"    ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )~r~n" + &
"  UNION         ~r~n" + &
"  SELECT security_group_users.user_id, ctx_group_access.ctx_id    ~r~n" + &
"  FROM #tmp_ctx, ctx_group_access,security_group_users,icred_settings     ~r~n" + &
"  WHERE~r~n" + &
"    ( icred_settings.group_access = 1 ) AND~r~n" + &
"    ( ctx_group_access.ctx_id = #tmp_ctx.ctx_id ) AND ~r~n" + &
"    ( ctx_group_access.group_id = security_group_users.group_id )~r~n" + &
"~r~n" + &
"  /*********prepare #temp_right data********/    ~r~n" + &
"  INSERT #temp_right~r~n" + &
"  SELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id,     ~r~n" + &
"  ~t   user_id = ctx_contacts.user_d,     ~r~n" + &
"  ~t   access = (CASE ctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END)~r~n" + &
"  FROM #tmp_ctx JOIN ctx_contract_contacts ON ( #tmp_ctx.ctx_id = ctx_contract_contacts.ctx_id )~r~n" + &
"  Left Outer Join     ~r~n" + &
"  (     ~r~n" + &
"  Select ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d      ~r~n" + &
"  From ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1     ~r~n" + &
"  Where ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id And ctx_contacts1.user_d = @user_d     ~r~n" + &
"  Group By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d     ~r~n" + &
"  Having Count(ctx_contract_contacts1.ctx_id) > 1     ~r~n" + &
"  ) ccc     ~r~n" + &
"  On ctx_contract_contacts.ctx_id = ccc.ctx_id     ~r~n" + &
"  ,ctx_contacts     ~r~n" + &
"  WHERE ctx_contacts.user_d = @user_d     ~r~n" + &
"  ~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' )     ~r~n" + &
"  ~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id      ~r~n" + &
"  ~tAND ( ctx_contract_contacts.access IN ('F','R')      ~r~n" + &
"  ~tOR ctx_contract_contacts.owner = 'Y' )     ~r~n" + &
"  ~tAND ctx_contract_contacts.ic_area = 'I'     ~r~n" + &
"  UNION      ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id,    ~r~n" + &
"  ~t   user_id = security_group_users.user_id,     ~r~n" + &
"  ~t   access =  ctx_group_access.access     ~r~n" + &
"  FROM  #tmp_ctx, ctx_group_access ,security_group_users,icred_settings     ~r~n" + &
"  WHERE security_group_users.user_id = @user_d     ~r~n" + &
"     AND ctx_group_access.ctx_id = #tmp_ctx.ctx_id ~r~n" + &
"     AND ctx_group_access.group_id = security_group_users.group_id     ~r~n" + &
"  ~tAND ctx_group_access.access =      ~r~n" + &
"  ~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access      ~r~n" + &
"  ~t~tFrom ctx_group_access a1,security_group_users u1     ~r~n" + &
"  ~t~tWhere a1.group_id = u1.group_id      ~r~n" + &
"  ~t~tAnd a1.ctx_id = ctx_group_access.ctx_id     ~r~n" + &
"  ~t~tAnd u1.user_id = security_group_users.user_id~t     ~r~n" + &
"  ~t~tAnd a1.access = 'F') Then 'F' Else 'R' End)      ~r~n" + &
"  ~tAND icred_settings.group_access = 1     ~r~n" + &
"  ~tAND ctx_group_access.access in ('F','R')     ~r~n" + &
"  ~tAND NOT EXISTS~t(SELECT 1 FROM ctx_contract_contacts, ctx_contacts     ~r~n" + &
"  ~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )      ~r~n" + &
"  ~t~t~tAND ( ctx_contacts.user_d = security_group_users.user_id )     ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ic_area = 'I' )     ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id )     ~r~n" + &
"  ~t~t~t)     ~r~n" + &
"  UNION     ~r~n" + &
" SELECT b.ctx_id,b.user_id,(CASE WHEN b.rcnt=0 THEN 'F' ELSE 'R' END) access     ~r~n" + &
" FROM    ~r~n" + &
" (    ~r~n" + &
" ~tSELECT DISTINCT a.ctx_id,a.user_id,    ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'F' THEN 1 ELSE 0 END) fcnt,    ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'R' THEN 1 ELSE 0 END) rcnt    ~r~n" + &
" ~tFROM     ~r~n" + &
" ~t(    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM #tmp_ctx, ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"         AND ctx_basic_info.ctx_id = #tmp_ctx.ctx_id~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=1    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('11','12','13')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
"        union    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '61' THEN 'F' WHEN '62' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM #tmp_ctx, ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"         AND ctx_basic_info.ctx_id = #tmp_ctx.ctx_id~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=6    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.dvision     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('61','62','63')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
"         union    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '71' THEN 'F' WHEN '72' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM #tmp_ctx, ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"         AND ctx_basic_info.ctx_id = #tmp_ctx.ctx_id~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=7    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_department     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('71','72','73')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
" ~t~tunion    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '81' THEN 'F' WHEN '82' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM #tmp_ctx, ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"         AND ctx_basic_info.ctx_id = #tmp_ctx.ctx_id~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=8    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_type     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('81','82','83')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
" ~t) a    ~r~n" + &
" ~tGROUP BY a.ctx_id,a.user_id    ~r~n" + &
"    HAVING SUM(CASE a.access WHEN 'N' THEN 1 ELSE 0 END) = 0    ~r~n" + &
" ) b    ~r~n" + &
"~r~n" + &
"/*****************************************************************************/~r~n" + &
"/* Build concatenated contact and product lists */~r~n" + &
"/* ccci name */~r~n" + &
"  INSERT #tmp_ctx_ccci~r~n" + &
"  SELECT~r~n" + &
"    ctx_contract_contacts.ctx_id,       ~r~n" + &
"    ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'')    ~r~n" + &
"  FROM ~r~n" + &
"    #tmp_ctx, ~r~n" + &
"    ctx_contract_contacts,~r~n" + &
"    ctx_contacts~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = #tmp_ctx.ctx_id ) AND ~r~n" + &
"    ( ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) AND~r~n" + &
"    ( ctx_contract_contacts.ic_area = 'E' )~r~n" + &
"~r~n" + &
"  INSERT #tmp_ctx_ccci2~r~n" + &
"  SELECT~r~n" + &
"    aa.ctx_id,~r~n" + &
"    left(ltrim(stuff(convert(varchar(max), (select '; ' + name from #tmp_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type)) , 1 , 1 , '')), 100)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx_ccci aa    ~r~n" + &
"  GROUP BY aa.ctx_id    ~r~n" + &
"~r~n" + &
"/* occi name */~r~n" + &
"  INSERT #tmp_ctx_occi~r~n" + &
"  SELECT~r~n" + &
"    ctx_contract_contacts.ctx_id,       ~r~n" + &
"    ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'')    ~r~n" + &
"  FROM ~r~n" + &
"    #tmp_ctx, ~r~n" + &
"    ctx_contract_contacts,~r~n" + &
"    ctx_contacts~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = #tmp_ctx.ctx_id ) AND ~r~n" + &
"    ( ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) AND~r~n" + &
"    ( ctx_contract_contacts.ic_area = 'I' )~r~n" + &
"~r~n" + &
"  INSERT #tmp_ctx_occi2~r~n" + &
"  SELECT~r~n" + &
"    aa.ctx_id,~r~n" + &
"    left(ltrim(stuff(convert(varchar(max), (select '; ' + name from #tmp_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type)) , 1 , 1 , '')), 100)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx_occi aa    ~r~n" + &
"  GROUP BY aa.ctx_id    ~r~n" + &
"~r~n" + &
"/* product name */~r~n" + &
"  SELECT~r~n" + &
"    @sql_text = '  INSERT #tmp_ctx_products~r~n" + &
"  SELECT~r~n" + &
"    ctx_products.ctx_id,~r~n" + &
"    ctx_products.product_id,~r~n" + &
"    ctx_products.product_type,~r~n" + &
"    product_id.code,~r~n" + &
"    product_type.code~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx,~r~n" + &
"    ctx_products ~r~n" + &
"    LEFT OUTER JOIN code_lookup product_id ON ctx_products.product_id = product_id.lookup_code~r~n" + &
"    LEFT OUTER JOIN code_lookup product_type ON ctx_products.product_type = product_type.lookup_code~r~n" + &
"  WHERE~r~n" + &
"    ( #tmp_ctx.ctx_id = ctx_products.ctx_id )'~r~n" + &
"  +  CASE WHEN @product_type IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_products.product_type = ' + convert(varchar, @product_type) + ' )'~r~n" + &
"  END  +  CASE WHEN ltrim(rtrim(isNull(@product_name, ''))) = '' THEN '' ELSE ' AND~r~n" + &
"    ( ctx_products.product_id = ' + @product_name + ' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"EXECUTE (@sql_text)~r~n" + &
"~r~n" + &
"IF @display_multi_products <> '1'~r~n" + &
"BEGIN~r~n" + &
"  INSERT #tmp_ctx_products2~r~n" + &
"  SELECT~r~n" + &
"    aa.ctx_id,     ~r~n" + &
"    product_id = (select top 1 product_id from #tmp_ctx_products where ctx_id = aa.ctx_id),    ~r~n" + &
"    product_name = left(stuff(convert(varchar(max),(select ',' + product_name from #tmp_ctx_products where ctx_id = aa.ctx_id for xml path(''),type).value('.','varchar(max)') ), 1 , 1 , ''), 1000),    ~r~n" + &
"    product_type_name = left(stuff(convert(varchar(max),(select ',' + product_type_name from #tmp_ctx_products where ctx_id=aa.ctx_id for xml path(''),type).value('.','varchar(max)') ), 1 , 1 , ''), 1000)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx_products aa    ~r~n" + &
"  GROUP BY aa.ctx_id    ~r~n" + &
"END~r~n" + &
"~r~n" + &
"IF @check_rowcount_flag = 'Y' BEGIN~r~n" + &
"  SELECT @ctx_rowcount = count(*)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx~r~n" + &
"    JOIN #temp_right ON #tmp_ctx.ctx_id = #temp_right.ctx_id ~r~n" + &
"  IF @ctx_rowcount > @rows_per_page BEGIN~r~n" + &
"    INSERT #tmp_result (app_facility, product_name)~r~n" + &
"    VALUES (-1, 'Your search has found ' + convert(varchar, @ctx_rowcount) + ' rows and may require a considerable amount of time to return.' + char(13) + char(10) + char(13) + char(10) + 'Would you like to proceed?')~r~n" + &
"    RETURN~r~n" + &
"  END~r~n" + &
"END~r~n" + &
"~r~n" + &
"IF @display_multi_products = '1'     ~r~n" + &
"BEGIN ~r~n" + &
"  INSERT #tmp_result~r~n" + &
"  SELECT DISTINCT~r~n" + &
"    ctx_basic_info.app_facility,         #tmp_ctx_products.product_id,        #tmp_ctx_products.product_name,        ~r~n" + &
"    ctx_basic_info.effective_date,            ctx_basic_info.expriation_date,           ctx_basic_info.status,          ~r~n" + &
"    ctx_basic_info.group_multi_loc_id,        ctx_basic_info.ctx_id,         ctx_basic_info.master_contract_id,    ~r~n" + &
"    master_cnt = #tmp_master_count.master_count,    ctx_basic_info.category,                 ctx_basic_info.facility_id,          ~r~n" + &
"    ctx_basic_info.contract_type,            #tmp_ctx_products.product_type,      ctx_basic_info.reimbursment_menth,    ~r~n" + &
"    ctx_basic_info.file_location,            ctx_basic_info.review_date,              ctx_basic_info.review_by,            ~r~n" + &
"    ctx_basic_info.term_date,                ctx_basic_info.term_reason,              ctx_basic_info.last_revis_date,      ~r~n" + &
"    ctx_basic_info.other_date_1,             ctx_basic_info.other_date_2,             ctx_basic_info.oc_signed_by,         ~r~n" + &
"    ctx_basic_info.oc_title,                 ctx_basic_info.oc_department,            ctx_basic_info.oc_legal_rep,         ~r~n" + &
"    ctx_basic_info.cc_signed_by,             ctx_basic_info.cc_title,                 ctx_basic_info.cc_department,        ~r~n" + &
"    ctx_basic_info.cc_legal_rep,             ctx_basic_info.notes,        ~t         ctx_basic_info.keyword,              ~r~n" + &
"    ctx_basic_info.dvision,                  ctx_basic_info.custom_1,                 ctx_basic_info.custom_2,             ~r~n" + &
"    ctx_basic_info.custom_3,                 ctx_basic_info.custom_4,                 ctx_basic_info.custom_5,             ~r~n" + &
"    ctx_basic_info.custom_6,                 ctx_basic_info.custom_7,                ctx_basic_info.custom_8,            ~r~n" + &
"    ctx_basic_info.custom_9,                ctx_basic_info.custom_10,               ctx_basic_info.group_id,            ~r~n" + &
"    ctx_basic_info.revision_reason,         ctx_basic_info.record_id ,            owner = upper(#tmp_owner.owner_user_d), ~r~n" + &
"    contracted_entity = #tmp_contracted_entity.rec_id,     app_facility.facility_name facility_name, ~r~n" + &
"    ctx_basic_info.custom_date1,               ctx_basic_info.custom_date2,               ctx_basic_info.custom_date3,           ~r~n" + &
"    ctx_basic_info.custom_date4,           ctx_basic_info.custom_date5,               ctx_basic_info.inserted_by_user,         ~r~n" + &
"    ctx_basic_info.inserted_at_date_time,               ctx_basic_info.updated_by_user,            ctx_basic_info.updated_at_date_time,           ~r~n" + &
"    ctx_basic_info.custom_11,               ctx_basic_info.custom_12,            ctx_basic_info.custom_13,           ~r~n" + &
"    ctx_basic_info.custom_14,               ctx_basic_info.custom_15,           ctx_basic_info.custom_16,           ~r~n" + &
"    ctx_basic_info.custom_17,               ctx_basic_info.custom_18,               ctx_basic_info.custom_19,           ~r~n" + &
"    ctx_basic_info.custom_20,              ctx_basic_info.custom_date6,               ctx_basic_info.custom_date7,           ~r~n" + &
"    ctx_basic_info.custom_date8,           ctx_basic_info.custom_date9,               ctx_basic_info.custom_date10,           ~r~n" + &
"    ctx_basic_info.custom_date11,               ctx_basic_info.custom_date12,               ctx_basic_info.custom_date13,       ~r~n" + &
"    ctx_basic_info.custom_date14,               ctx_basic_info.custom_date15,               ctx_basic_info.custom_n1,      ~r~n" + &
"    ctx_basic_info.custom_n2,               ctx_basic_info.custom_n3,               ctx_basic_info.custom_n4,           ~r~n" + &
"    ctx_basic_info.custom_n5,               ctx_basic_info.custom_n6,           ctx_basic_info.custom_n7,           ~r~n" + &
"    ctx_basic_info.custom_n8,               ctx_basic_info.custom_n9,            ctx_basic_info.custom_n10,           ~r~n" + &
"    ctx_basic_info.custom_n11,               ctx_basic_info.custom_n12,               ctx_basic_info.custom_n13,           ~r~n" + &
"    ctx_basic_info.custom_n14,               ctx_basic_info.custom_n15,               ctx_basic_info.custom_n16,           ~r~n" + &
"    ctx_basic_info.custom_n17,               ctx_basic_info.custom_n18,               ctx_basic_info.custom_n19,           ~r~n" + &
"    ctx_basic_info.custom_n20,               ctx_basic_info.custom_n21,               ctx_basic_info.custom_n22,           ~r~n" + &
"    ctx_basic_info.custom_n23,               ctx_basic_info.custom_n24,               ctx_basic_info.custom_n25,           ~r~n" + &
"    ctx_basic_info.version_number,               ctx_basic_info.version_date,               ctx_basic_info.master_contract_name ,     ~r~n" + &
"    ctx_basic_info.fee_sched_calc_field_1 ,         ctx_basic_info.fee_sched_calc_field_2 ,         ctx_basic_info.fee_sched_calc_field_3 ,     ~r~n" + &
"    #temp_right.access,      code_lookup2.code status_name,         code_lookup3.code category_name,     ~r~n" + &
"    code_lookup4.code contract_type_name,         code_lookup5.code dvision_name ,         unread_email_cnt = 0,      ~r~n" + &
"    ctx_basic_info.custom_percent_1,        ctx_basic_info.custom_percent_2,         ctx_basic_info.custom_percent_3,     ~r~n" + &
"    ctx_basic_info.custom_percent_4,         ctx_basic_info.custom_percent_5,         ctx_basic_info.custom_percent_6,     ~r~n" + &
"    ctx_basic_info.custom_percent_7,         ctx_basic_info.custom_percent_8,         ctx_basic_info.custom_percent_9,     ~r~n" + &
"    ctx_basic_info.custom_percent_10,         ctx_basic_info.work_flow_n1,         ctx_basic_info.work_flow_n2,     ~r~n" + &
"    ctx_basic_info.work_flow_n3,         ctx_basic_info.work_flow_n4,         ctx_basic_info.work_flow_n5,     ~r~n" + &
"    ctx_basic_info.custom_status1,         ctx_basic_info.custom_status2,         ctx_basic_info.custom_21,     ~r~n" + &
"    ctx_basic_info.custom_22,         ctx_basic_info.custom_n26,         ctx_basic_info.custom_n27,         ctx_basic_info.custom_date16,     ~r~n" + &
"    ctx_basic_info.custom_date17,         app_facility.city,         app_facility.state,         app_facility.country,     ~r~n" + &
"    app_facility.zip,         app_facility.street,         ctx_custom.custom_1 as custom2_custom_1,     ~r~n" + &
"    ctx_custom.custom_2 as custom2_custom_2,            ctx_custom.custom_3 as custom2_custom_3,            ctx_custom.custom_4 as custom2_custom_4,        ~r~n" + &
"    ctx_custom.custom_5 as custom2_custom_5,            ctx_custom.custom_6 as custom2_custom_6,            ctx_custom.custom_7 as custom2_custom_7,        ~r~n" + &
"    ctx_custom.custom_8 as custom2_custom_8,            ctx_custom.custom_9 as custom2_custom_9,        ctx_custom.custom_10 as custom2_custom_10,        ~r~n" + &
"    ctx_custom.custom_11 as custom2_custom_11,            ctx_custom.custom_12 as custom2_custom_12,            ctx_custom.custom_13 as custom2_custom_13,        ~r~n" + &
"    ctx_custom.custom_14 as custom2_custom_14,            ctx_custom.custom_15 as custom2_custom_15,            ctx_custom.custom_16 as custom2_custom_16,        ~r~n" + &
"    ctx_custom.custom_17 as custom2_custom_17,            ctx_custom.custom_18 as custom2_custom_18,          ctx_custom.custom_19 as custom2_custom_19,        ~r~n" + &
"    ctx_custom.custom_20 as custom2_custom_20,            ctx_custom.custom_date1 as custom2_custom_date1,        ctx_custom.custom_date2 as custom2_custom_date2,        ~r~n" + &
"    ctx_custom.custom_date3 as custom2_custom_date3,            ctx_custom.custom_date4 as custom2_custom_date4,        ctx_custom.custom_date5 as custom2_custom_date5,        ~r~n" + &
"    ctx_custom.custom_date6 as custom2_custom_date6,            ctx_custom.custom_date7 as custom2_custom_date7,        ~r~n" + &
"    ctx_custom.custom_date8 as custom2_custom_date8,            ctx_custom.custom_date9 as custom2_custom_date9,        ~r~n" + &
"    ctx_custom.custom_date10 as custom2_custom_date10,          ctx_custom.custom_date11 as custom2_custom_date11,        ~r~n" + &
"    ctx_custom.custom_date12 as custom2_custom_date12,          ctx_custom.custom_date13 as custom2_custom_date13,        ~r~n" + &
"    ctx_custom.custom_date14 as custom2_custom_date14,          ctx_custom.custom_date15 as custom2_custom_date15,        ~r~n" + &
"    ctx_custom.custom_n1 as custom2_custom_n1,            ctx_custom.custom_n2 as custom2_custom_n2,        ~r~n" + &
"    ctx_custom.custom_n3 as custom2_custom_n3,            ctx_custom.custom_n4 as custom2_custom_n4,        ~r~n" + &
"    ctx_custom.custom_n5 as custom2_custom_n5,            ctx_custom.custom_n6 as custom2_custom_n6,        ~r~n" + &
"    ctx_custom.custom_n7 as custom2_custom_n7,            ctx_custom.custom_n8 as custom2_custom_n8,        ~r~n" + &
"    ctx_custom.custom_n9 as custom2_custom_n9,            ctx_custom.custom_n10 as custom2_custom_n10,        ~r~n" + &
"    ctx_custom.custom_n11 as custom2_custom_n11,          ctx_custom.custom_n12 as custom2_custom_n12,       ~r~n" + &
"    ctx_custom.custom_n13 as custom2_custom_n13,          ctx_custom.custom_n14 as custom2_custom_n14,        ~r~n" + &
"    ctx_custom.custom_n15 as custom2_custom_n15,          ctx_custom.custom_n16 as custom2_custom_n16,        ~r~n" + &
"    ctx_custom.custom_n17 as custom2_custom_n17,          ctx_custom.custom_n18 as custom2_custom_n18,        ~r~n" + &
"    ctx_custom.custom_n19 as custom2_custom_n19,          ctx_custom.custom_n20 as custom2_custom_n20,        ~r~n" + &
"    ctx_custom.custom_n21 as custom2_custom_n21,          ctx_custom.custom_n22 as custom2_custom_n22,        ~r~n" + &
"    ctx_custom.custom_n23 as custom2_custom_n23,          ctx_custom.custom_n24 as custom2_custom_n24,        ~r~n" + &
"    ctx_custom.custom_n25 as custom2_custom_n25,          ctx_custom.custom_21 as custom2_custom_21,        ~r~n" + &
"    ctx_custom.custom_22 as custom2_custom_22,            ctx_custom.custom_notes_1 as custom2_custom_notes_1,       ~r~n" + &
"    ctx_custom.custom_notes_2 as custom2_custom_notes_2,         ctx_custom.custom_notes_3 as custom2_custom_notes_3,        ~r~n" + &
"    ctx_custom.custom_notes_4 as custom2_custom_notes_4,         ctx_custom.custom_notes_5 as custom2_custom_notes_5,        ~r~n" + &
"    ctx_custom.custom_money_1 as custom2_custom_money_1,            ctx_custom.custom_money_2 as custom2_custom_money_2,        ~r~n" + &
"    ctx_custom.custom_money_3 as custom2_custom_money_3,            ctx_custom.custom_percent_1 as custom2_custom_percent_1,       ~r~n" + &
"    ctx_custom.custom_percent_2 as custom2_custom_percent_2,            ctx_custom.custom_percent_3 as custom2_custom_percent_3,        ~r~n" + &
"    ctx_custom.custom_percent_4 as custom2_custom_percent_4,            ctx_custom.custom_percent_5 as custom2_custom_percent_5,        ~r~n" + &
"    ctx_custom.custom_percent_6 as custom2_custom_percent_6,            ctx_custom.custom_percent_7 as custom2_custom_percent_7,            ctx_custom.custom_percent_8 as custom2_custom_percent_8,        ~r~n" + &
"    ctx_custom.custom_percent_9 as custom2_custom_percent_9,            ctx_custom.custom_percent_10 as custom2_custom_percent_10,       ~r~n" + &
"    #tmp_doc_count.has_docs,     ctx_basic_info.contract_department,         #tmp_ctx_occi2.occi_name,        #tmp_ctx_ccci2.ccci_name    ~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx~r~n" + &
"    JOIN #temp_right ON #tmp_ctx.ctx_id = #temp_right.ctx_id ~r~n" + &
"    JOIN ctx_basic_info ON #temp_right.ctx_id = ctx_basic_info.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_master_count ON ctx_basic_info.ctx_id = #tmp_master_count.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_owner ON ctx_basic_info.ctx_id = #tmp_owner.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_contracted_entity ON ctx_basic_info.ctx_id = #tmp_contracted_entity.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_doc_count ON ctx_basic_info.ctx_id = #tmp_doc_count.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_ctx_ccci2 ON ctx_basic_info.ctx_id = #tmp_ctx_ccci2.ctx_id~t     ~r~n" + &
"    LEFT OUTER JOIN #tmp_ctx_occi2 ON ctx_basic_info.ctx_id = #tmp_ctx_occi2.ctx_id    ~r~n" + &
"    LEFT OUTER JOIN #tmp_ctx_products ON ctx_basic_info.ctx_id = #tmp_ctx_products.ctx_id       ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id       ~r~n" + &
"    LEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id      ~r~n" + &
"END     ~r~n" + &
"/* IF @display_multi_products = '1' */~r~n" + &
"ELSE~r~n" + &
"BEGIN~r~n" + &
"  INSERT #tmp_result~r~n" + &
"  SELECT DISTINCT ~r~n" + &
"    ctx_basic_info.app_facility,     #tmp_ctx_products2.product_id,     #tmp_ctx_products2.product_name, ~r~n" + &
"    ctx_basic_info.effective_date,     ctx_basic_info.expriation_date,     ctx_basic_info.status, ~r~n" + &
"    ctx_basic_info.group_multi_loc_id,     ctx_basic_info.ctx_id,     ctx_basic_info.master_contract_id, ~r~n" + &
"    master_cnt = #tmp_master_count.master_count,     ctx_basic_info.category,     ctx_basic_info.facility_id, ~r~n" + &
"    ctx_basic_info.contract_type,     #tmp_ctx_products2.product_type_name,     ctx_basic_info.reimbursment_menth, ~r~n" + &
"    ctx_basic_info.file_location,     ctx_basic_info.review_date,     ctx_basic_info.review_by, ~r~n" + &
"    ctx_basic_info.term_date,     ctx_basic_info.term_reason,     ctx_basic_info.last_revis_date, ~r~n" + &
"    ctx_basic_info.other_date_1,     ctx_basic_info.other_date_2,     ctx_basic_info.oc_signed_by, ~r~n" + &
"    ctx_basic_info.oc_title,     ctx_basic_info.oc_department,     ctx_basic_info.oc_legal_rep, ~r~n" + &
"    ctx_basic_info.cc_signed_by,     ctx_basic_info.cc_title,     ctx_basic_info.cc_department, ~r~n" + &
"    ctx_basic_info.cc_legal_rep,     ctx_basic_info.notes,     ctx_basic_info.keyword, ~r~n" + &
"    ctx_basic_info.dvision,     ctx_basic_info.custom_1,     ctx_basic_info.custom_2, ~r~n" + &
"    ctx_basic_info.custom_3,     ctx_basic_info.custom_4,     ctx_basic_info.custom_5, ~r~n" + &
"    ctx_basic_info.custom_6,     ctx_basic_info.custom_7,     ctx_basic_info.custom_8, ~r~n" + &
"    ctx_basic_info.custom_9,     ctx_basic_info.custom_10,     ctx_basic_info.group_id, ~r~n" + &
"    ctx_basic_info.revision_reason,     ctx_basic_info.record_id , ~r~n" + &
"    owner = upper(#tmp_owner.owner_user_d),     contracted_entity = #tmp_contracted_entity.rec_id, ~r~n" + &
"    app_facility.facility_name facility_name,     ctx_basic_info.custom_date1, ~r~n" + &
"    ctx_basic_info.custom_date2,     ctx_basic_info.custom_date3,    ctx_basic_info.custom_date4, ~r~n" + &
"    ctx_basic_info.custom_date5,     ctx_basic_info.inserted_by_user,     ctx_basic_info.inserted_at_date_time, ~r~n" + &
"    ctx_basic_info.updated_by_user,     ctx_basic_info.updated_at_date_time,     ctx_basic_info.custom_11, ~r~n" + &
"    ctx_basic_info.custom_12,     ctx_basic_info.custom_13,     ctx_basic_info.custom_14, ~r~n" + &
"    ctx_basic_info.custom_15,     ctx_basic_info.custom_16,     ctx_basic_info.custom_17, ~r~n" + &
"    ctx_basic_info.custom_18,     ctx_basic_info.custom_19,     ctx_basic_info.custom_20, ~r~n" + &
"    ctx_basic_info.custom_date6,     ctx_basic_info.custom_date7,     ctx_basic_info.custom_date8, ~r~n" + &
"    ctx_basic_info.custom_date9,     ctx_basic_info.custom_date10,     ctx_basic_info.custom_date11, ~r~n" + &
"    ctx_basic_info.custom_date12,     ctx_basic_info.custom_date13,     ctx_basic_info.custom_date14, ~r~n" + &
"    ctx_basic_info.custom_date15,     ctx_basic_info.custom_n1,     ctx_basic_info.custom_n2, ~r~n" + &
"    ctx_basic_info.custom_n3,     ctx_basic_info.custom_n4,     ctx_basic_info.custom_n5, ~r~n" + &
"    ctx_basic_info.custom_n6,     ctx_basic_info.custom_n7,     ctx_basic_info.custom_n8, ~r~n" + &
"    ctx_basic_info.custom_n9,     ctx_basic_info.custom_n10,     ctx_basic_info.custom_n11, ~r~n" + &
"    ctx_basic_info.custom_n12,     ctx_basic_info.custom_n13,     ctx_basic_info.custom_n14, ~r~n" + &
"    ctx_basic_info.custom_n15,     ctx_basic_info.custom_n16,     ctx_basic_info.custom_n17, ~r~n" + &
"    ctx_basic_info.custom_n18,     ctx_basic_info.custom_n19,     ctx_basic_info.custom_n20, ~r~n" + &
"    ctx_basic_info.custom_n21,     ctx_basic_info.custom_n22,     ctx_basic_info.custom_n23, ~r~n" + &
"    ctx_basic_info.custom_n24,     ctx_basic_info.custom_n25,     ctx_basic_info.version_number, ~r~n" + &
"    ctx_basic_info.version_date,     ctx_basic_info.master_contract_name ,     ctx_basic_info.fee_sched_calc_field_1 , ~r~n" + &
"    ctx_basic_info.fee_sched_calc_field_2 ,     ctx_basic_info.fee_sched_calc_field_3 ,     #temp_right.access,  ~r~n" + &
"    code_lookup2.code status_name,     code_lookup3.code category_name,     code_lookup4.code contract_type_name, ~r~n" + &
"    code_lookup5.code dvision_name ,     unread_email_cnt = 0,     ctx_basic_info.custom_percent_1, ~r~n" + &
"    ctx_basic_info.custom_percent_2,     ctx_basic_info.custom_percent_3,     ctx_basic_info.custom_percent_4, ~r~n" + &
"    ctx_basic_info.custom_percent_5,     ctx_basic_info.custom_percent_6,     ctx_basic_info.custom_percent_7, ~r~n" + &
"    ctx_basic_info.custom_percent_8,     ctx_basic_info.custom_percent_9,     ctx_basic_info.custom_percent_10, ~r~n" + &
"    ctx_basic_info.work_flow_n1,     ctx_basic_info.work_flow_n2,     ctx_basic_info.work_flow_n3, ~r~n" + &
"    ctx_basic_info.work_flow_n4,     ctx_basic_info.work_flow_n5,     ctx_basic_info.custom_status1, ~r~n" + &
"    ctx_basic_info.custom_status2,     ctx_basic_info.custom_21,     ctx_basic_info.custom_22, ~r~n" + &
"    ctx_basic_info.custom_n26,     ctx_basic_info.custom_n27,     ctx_basic_info.custom_date16, ~r~n" + &
"    ctx_basic_info.custom_date17,     app_facility.city,     app_facility.state, ~r~n" + &
"    app_facility.country,     app_facility.zip,     app_facility.street, ~r~n" + &
"    ctx_custom.custom_1 as custom2_custom_1,     ctx_custom.custom_2 as custom2_custom_2, ~r~n" + &
"    ctx_custom.custom_3 as custom2_custom_3,     ctx_custom.custom_4 as custom2_custom_4, ~r~n" + &
"    ctx_custom.custom_5 as custom2_custom_5,     ctx_custom.custom_6 as custom2_custom_6, ~r~n" + &
"    ctx_custom.custom_7 as custom2_custom_7,     ctx_custom.custom_8 as custom2_custom_8, ~r~n" + &
"    ctx_custom.custom_9 as custom2_custom_9,     ctx_custom.custom_10 as custom2_custom_10, ~r~n" + &
"    ctx_custom.custom_11 as custom2_custom_11,     ctx_custom.custom_12 as custom2_custom_12, ~r~n" + &
"    ctx_custom.custom_13 as custom2_custom_13,     ctx_custom.custom_14 as custom2_custom_14, ~r~n" + &
"    ctx_custom.custom_15 as custom2_custom_15,     ctx_custom.custom_16 as custom2_custom_16, ~r~n" + &
"    ctx_custom.custom_17 as custom2_custom_17,     ctx_custom.custom_18 as custom2_custom_18, ~r~n" + &
"    ctx_custom.custom_19 as custom2_custom_19,     ctx_custom.custom_20 as custom2_custom_20, ~r~n" + &
"    ctx_custom.custom_date1 as custom2_custom_date1,     ctx_custom.custom_date2 as custom2_custom_date2, ~r~n" + &
"    ctx_custom.custom_date3 as custom2_custom_date3,     ctx_custom.custom_date4 as custom2_custom_date4, ~r~n" + &
"    ctx_custom.custom_date5 as custom2_custom_date5,     ctx_custom.custom_date6 as custom2_custom_date6, ~r~n" + &
"    ctx_custom.custom_date7 as custom2_custom_date7,     ctx_custom.custom_date8 as custom2_custom_date8, ~r~n" + &
"    ctx_custom.custom_date9 as custom2_custom_date9,     ctx_custom.custom_date10 as custom2_custom_date10, ~r~n" + &
"    ctx_custom.custom_date11 as custom2_custom_date11,     ctx_custom.custom_date12 as custom2_custom_date12, ~r~n" + &
"    ctx_custom.custom_date13 as custom2_custom_date13,     ctx_custom.custom_date14 as custom2_custom_date14, ~r~n" + &
"    ctx_custom.custom_date15 as custom2_custom_date15,     ctx_custom.custom_n1 as custom2_custom_n1, ~r~n" + &
"    ctx_custom.custom_n2 as custom2_custom_n2,     ctx_custom.custom_n3 as custom2_custom_n3, ~r~n" + &
"    ctx_custom.custom_n4 as custom2_custom_n4,     ctx_custom.custom_n5 as custom2_custom_n5, ~r~n" + &
"    ctx_custom.custom_n6 as custom2_custom_n6,     ctx_custom.custom_n7 as custom2_custom_n7, ~r~n" + &
"    ctx_custom.custom_n8 as custom2_custom_n8,     ctx_custom.custom_n9 as custom2_custom_n9, ~r~n" + &
"    ctx_custom.custom_n10 as custom2_custom_n10,    ctx_custom.custom_n11 as custom2_custom_n11, ~r~n" + &
"    ctx_custom.custom_n12 as custom2_custom_n12,    ctx_custom.custom_n13 as custom2_custom_n13, ~r~n" + &
"    ctx_custom.custom_n14 as custom2_custom_n14,    ctx_custom.custom_n15 as custom2_custom_n15, ~r~n" + &
"    ctx_custom.custom_n16 as custom2_custom_n16,    ctx_custom.custom_n17 as custom2_custom_n17, ~r~n" + &
"    ctx_custom.custom_n18 as custom2_custom_n18,    ctx_custom.custom_n19 as custom2_custom_n19, ~r~n" + &
"    ctx_custom.custom_n20 as custom2_custom_n20,    ctx_custom.custom_n21 as custom2_custom_n21, ~r~n" + &
"    ctx_custom.custom_n22 as custom2_custom_n22,    ctx_custom.custom_n23 as custom2_custom_n23, ~r~n" + &
"    ctx_custom.custom_n24 as custom2_custom_n24,    ctx_custom.custom_n25 as custom2_custom_n25, ~r~n" + &
"    ctx_custom.custom_21 as custom2_custom_21,     ctx_custom.custom_22 as custom2_custom_22, ~r~n" + &
"    ctx_custom.custom_notes_1 as custom2_custom_notes_1,     ctx_custom.custom_notes_2 as custom2_custom_notes_2, ~r~n" + &
"    ctx_custom.custom_notes_3 as custom2_custom_notes_3,     ctx_custom.custom_notes_4 as custom2_custom_notes_4, ~r~n" + &
"    ctx_custom.custom_notes_5 as custom2_custom_notes_5,     ctx_custom.custom_money_1 as custom2_custom_money_1, ~r~n" + &
"    ctx_custom.custom_money_2 as custom2_custom_money_2,     ctx_custom.custom_money_3 as custom2_custom_money_3, ~r~n" + &
"    ctx_custom.custom_percent_1 as custom2_custom_percent_1,     ctx_custom.custom_percent_2 as custom2_custom_percent_2, ~r~n" + &
"    ctx_custom.custom_percent_3 as custom2_custom_percent_3,     ctx_custom.custom_percent_4 as custom2_custom_percent_4, ~r~n" + &
"    ctx_custom.custom_percent_5 as custom2_custom_percent_5,     ctx_custom.custom_percent_6 as custom2_custom_percent_6, ~r~n" + &
"    ctx_custom.custom_percent_7 as custom2_custom_percent_7,     ctx_custom.custom_percent_8 as custom2_custom_percent_8, ~r~n" + &
"    ctx_custom.custom_percent_9 as custom2_custom_percent_9,     ctx_custom.custom_percent_10 as custom2_custom_percent_10, ~r~n" + &
"    #tmp_doc_count.has_docs,     ctx_basic_info.contract_department,     #tmp_ctx_occi2.occi_name,        #tmp_ctx_ccci2.ccci_name    ~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx~r~n" + &
"    JOIN #temp_right ON #tmp_ctx.ctx_id = #temp_right.ctx_id ~r~n" + &
"    JOIN ctx_basic_info ON #temp_right.ctx_id = ctx_basic_info.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_master_count ON ctx_basic_info.ctx_id = #tmp_master_count.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_owner ON ctx_basic_info.ctx_id = #tmp_owner.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_contracted_entity ON ctx_basic_info.ctx_id = #tmp_contracted_entity.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_doc_count ON ctx_basic_info.ctx_id = #tmp_doc_count.ctx_id~r~n" + &
"    LEFT OUTER JOIN #tmp_ctx_ccci2 ON ctx_basic_info.ctx_id = #tmp_ctx_ccci2.ctx_id~t     ~r~n" + &
"    LEFT OUTER JOIN #tmp_ctx_occi2 ON ctx_basic_info.ctx_id = #tmp_ctx_occi2.ctx_id    ~r~n" + &
"    LEFT OUTER JOIN #tmp_ctx_products ON ctx_basic_info.ctx_id = #tmp_ctx_products.ctx_id       ~r~n" + &
"    LEFT OUTER JOIN #tmp_ctx_products2 ON ctx_basic_info.ctx_id = #tmp_ctx_products2.ctx_id ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code     ~r~n" + &
"    LEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id       ~r~n" + &
"    LEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id      ~r~n" + &
"END   "

//----------------------------------------------------------------------------------------------------------------------//

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if object_id('sp_contract_search_2') is not null~r~n" + &
"Begin~r~n" + &
"  drop procedure sp_contract_search_2;~r~n"  + &
"End ~r~n" 

//modified by gavins 08082016 09/19/2016 //20161116  change app_facility numeric( 5,0) to app_facility numeric(10, 0),
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"create procedure sp_contract_search_2~r~n" + &
"  @user_d VARCHAR(10), ~r~n" + &
"  @ctx_id int = NULL, ~r~n" + &
"  @category numeric(6, 0) = NULL,~r~n" + &
"  @status numeric(6, 0) = NULL,~r~n" + &
"  @contract_type numeric(6, 0) = NULL, ~r~n" + &
"  @contracted_entity numeric(8, 0) = NULL, ~r~n" + &
"  @group_id numeric(6, 0) = NULL,~r~n" + &
"  @product_type numeric(6, 0) = NULL, ~r~n" + &
"  @product_name varchar(150) = NULL, ~r~n" + &
"  @effective_date datetime = NULL,~r~n" + &
"  @effective_date2 datetime = NULL,~r~n" + &
"  @expriation_date datetime = NULL,            ~r~n" + &
"  @expriation_date2 datetime = NULL,            ~r~n" + &
"  @last_revis_date datetime = NULL,       ~r~n" + &
"  @last_revis_date_2 datetime = NULL,       ~r~n" + &
"  @review_date datetime = NULL,            ~r~n" + &
"  @review_date_2 datetime = NULL,            ~r~n" + &
"  @term_date datetime = NULL,            ~r~n" + &
"  @term_date_2 datetime = NULL,            ~r~n" + &
"  @version_date datetime = NULL,          ~r~n" + &
"  @version_date_2 datetime = NULL,          ~r~n" + &
"  @custom_date1 datetime = NULL, ~r~n" + &
"  @custom_date1_2 datetime = NULL, ~r~n" + &
"  @custom_date2 datetime = NULL, ~r~n" + &
"  @custom_date2_2 datetime = NULL, ~r~n" + &
"  @custom_1_style varchar(30) = NULL, @custom_2_style varchar(30) = NULL, @custom_3_style varchar(30) = NULL, @custom_4_style varchar(30) = NULL,~r~n" + &
"  @custom_1 varchar(255) = NULL, @custom_2 varchar(255) = NULL, @custom_3 varchar(255) = NULL, @custom_4 varchar(255) = NULL,~r~n" + &
"  @custom_n1 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n2 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n3 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n4 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n5 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n6 numeric(12,2) = NULL, ~r~n" + &
"  @owner varchar(10) = NULL, ~r~n" + &
"  @dvision numeric(6, 0) = NULL,~r~n" + &
"  @ccci_name varchar(93) = NULL,~r~n" + &
"  @ccci_association varchar(100) = NULL,~r~n" + &
"  @ccci_contact_email varchar(50) = NULL,~r~n" + &
"  @ccci_custom_n1 numeric(12, 2) = NULL,~r~n" + &
"  @ccci_custom_1 varchar(255) = NULL,~r~n" + &
"  @occi_name varchar(93) = NULL,~r~n" + &
"  @occi_association varchar(100) = NULL,~r~n" + &
"  @occi_contact_email varchar(50) = NULL,~r~n" + &
"  @occi_custom_n1 numeric(12, 2) = NULL,~r~n" + &
"  @occi_custom_1 varchar(255) = NULL,~r~n" + &
"  /* Dynamic SQL additions from front end */~r~n" + &
"  @other_from_text varchar(1000) = '',~r~n" + &
"  @other_where_text varchar(2000) = '',~r~n" + &
"  /* 9.15.2016 - pagination */~r~n" + &
"  @check_rowcount_flag char(1) = 'N'~r~n" + &
"as~r~n" + &
"/* Result set temp table */~r~n" + &
"create table #tmp_result ( app_facility numeric(10, 0), product_code numeric(6, 0), product_name varchar(1000), ~r~n" + &
"  effective_date datetime, expriation_date datetime, status numeric(6, 0), group_multi_loc_id numeric(6, 0), ~r~n" + &
"  ctx_id int, master_contract_id numeric(6, 0), master_cnt int, category numeric(6, 0), facility_id int, ~r~n" + &
"  contract_type numeric(6, 0), product_type varchar(1000), reimbursment_menth numeric(6, 0), file_location varchar(150), ~r~n" + &
"  review_date datetime, review_by varchar(10), term_date datetime, term_reason numeric(6, 0), last_revis_date datetime, ~r~n" + &
"  other_date_1 datetime, other_date_2 datetime, oc_signed_by varchar(75), oc_title numeric(6, 0), ~r~n" + &
"  oc_department numeric(6, 0), oc_legal_rep varchar(75), cc_signed_by varchar(75), cc_title varchar(75), ~r~n" + &
"  cc_department varchar(75), cc_legal_rep varchar(75), notes varchar(8000), keyword varchar(30), dvision numeric(6, 0), ~r~n" + &
"  custom_1 varchar(255), custom_2 varchar(255), custom_3 varchar(255), custom_4 varchar(255), custom_5 varchar(255), ~r~n" + &
"  custom_6 varchar(255), custom_7 varchar(255), custom_8 varchar(255), custom_9 varchar(255), custom_10 varchar(255), ~r~n" + &
"  group_id numeric(6, 0), revision_reason varchar(255), record_id numeric(10, 0), owner varchar(10), ~r~n" + &
"  contracted_entity numeric(8, 0), facility_name varchar(150), custom_date1 datetime, custom_date2 datetime, ~r~n" + &
"  custom_date3 datetime, custom_date4 datetime, custom_date5 datetime, inserted_by_user varchar(128), ~r~n" + &
"  inserted_at_date_time datetime, updated_by_user varchar(128), updated_at_date_time datetime, custom_11 varchar(255), ~r~n" + &
"  custom_12 varchar(255), custom_13 varchar(255), custom_14 varchar(255), custom_15 varchar(255), ~r~n" + &
"  custom_16 varchar(255), custom_17 varchar(255), custom_18 varchar(255), custom_19 varchar(255), ~r~n" + &
"  custom_20 varchar(255), custom_date6 datetime, custom_date7 datetime, custom_date8 datetime, custom_date9 datetime, ~r~n" + &
"  custom_date10 datetime, custom_date11 datetime, custom_date12 datetime, custom_date13 datetime, ~r~n" + &
"  custom_date14 datetime, custom_date15 datetime, custom_n1 numeric(12, 2), custom_n2 numeric(12, 2), ~r~n" + &
"  custom_n3 numeric(12, 2), custom_n4 numeric(12, 2), custom_n5 numeric(12, 2), custom_n6 numeric(12, 2), ~r~n" + &
"  custom_n7 numeric(12, 2), custom_n8 numeric(12, 2), custom_n9 numeric(12, 2), custom_n10 numeric(12, 2), ~r~n" + &
"  custom_n11 numeric(12, 2), custom_n12 numeric(12, 2), custom_n13 numeric(12, 2), custom_n14 numeric(12, 2), ~r~n" + &
"  custom_n15 numeric(12, 2), custom_n16 numeric(12, 2), custom_n17 numeric(12, 2), custom_n18 numeric(12, 2), ~r~n" + &
"  custom_n19 numeric(12, 2), custom_n20 numeric(12, 2), custom_n21 numeric(12, 2), custom_n22 numeric(12, 2), ~r~n" + &
"  custom_n23 numeric(12, 2), custom_n24 numeric(12, 2), custom_n25 numeric(12, 2), version_number varchar(15), ~r~n" + &
"  version_date datetime, master_contract_name varchar(255), fee_sched_calc_field_1 money, fee_sched_calc_field_2 money, ~r~n" + &
"  fee_sched_calc_field_3 money, access char(1), status_name varchar(30), category_name varchar(30), ~r~n" + &
"  contract_type_name varchar(30), dvision_name varchar(30), unread_email_cnt int, custom_percent_1 numeric(12, 4), ~r~n" + &
"  custom_percent_2 numeric(12, 4), custom_percent_3 numeric(12, 4), custom_percent_4 numeric(12, 4), ~r~n" + &
"  custom_percent_5 numeric(12, 4), custom_percent_6 numeric(12, 4), custom_percent_7 numeric(12, 4), ~r~n" + &
"  custom_percent_8 numeric(12, 4), custom_percent_9 numeric(12, 4), custom_percent_10 numeric(12, 4), ~r~n" + &
"  work_flow_n1 numeric(12, 2), work_flow_n2 numeric(12, 2), work_flow_n3 numeric(12, 2), work_flow_n4 numeric(12, 2), ~r~n" + &
"  work_flow_n5 numeric(12, 2), custom_status1 int, custom_status2 int, custom_21 varchar(255), custom_22 varchar(255), ~r~n" + &
"  custom_n26 numeric(12, 2), custom_n27 numeric(12, 2), custom_date16 datetime, custom_date17 datetime, city varchar(35), ~r~n" + &
"  state varchar(5), country numeric(8, 0), zip varchar(12), street varchar(150), custom2_custom_1 varchar(255), ~r~n" + &
"  custom2_custom_2 varchar(255), custom2_custom_3 varchar(255), custom2_custom_4 varchar(255), ~r~n" + &
"  custom2_custom_5 varchar(255), custom2_custom_6 varchar(255), custom2_custom_7 varchar(255), ~r~n" + &
"  custom2_custom_8 varchar(255), custom2_custom_9 varchar(255), custom2_custom_10 varchar(255), ~r~n" + &
"  custom2_custom_11 varchar(255), custom2_custom_12 varchar(255), custom2_custom_13 varchar(255), ~r~n" + &
"  custom2_custom_14 varchar(255), custom2_custom_15 varchar(255), custom2_custom_16 varchar(255), ~r~n" + &
"  custom2_custom_17 varchar(255), custom2_custom_18 varchar(255), custom2_custom_19 varchar(255), ~r~n" + &
"  custom2_custom_20 varchar(255), custom2_custom_date1 datetime, custom2_custom_date2 datetime, ~r~n" + &
"  custom2_custom_date3 datetime, custom2_custom_date4 datetime, custom2_custom_date5 datetime, ~r~n" + &
"  custom2_custom_date6 datetime, custom2_custom_date7 datetime, custom2_custom_date8 datetime, ~r~n" + &
"  custom2_custom_date9 datetime, custom2_custom_date10 datetime, custom2_custom_date11 datetime, ~r~n" + &
"  custom2_custom_date12 datetime, custom2_custom_date13 datetime, custom2_custom_date14 datetime, ~r~n" + &
"  custom2_custom_date15 datetime, custom2_custom_n1 numeric(12, 2), custom2_custom_n2 numeric(12, 2), ~r~n" + &
"  custom2_custom_n3 numeric(12, 2), custom2_custom_n4 numeric(12, 2), custom2_custom_n5 numeric(12, 2), ~r~n" + &
"  custom2_custom_n6 numeric(12, 2), custom2_custom_n7 numeric(12, 2), custom2_custom_n8 numeric(12, 2), ~r~n" + &
"  custom2_custom_n9 numeric(12, 2), custom2_custom_n10 numeric(12, 2), custom2_custom_n11 numeric(12, 2), ~r~n" + &
"  custom2_custom_n12 numeric(12, 2), custom2_custom_n13 numeric(12, 2), custom2_custom_n14 numeric(12, 2), ~r~n" + &
"  custom2_custom_n15 numeric(12, 2), custom2_custom_n16 numeric(12, 2), custom2_custom_n17 numeric(12, 2), ~r~n" + &
"  custom2_custom_n18 numeric(12, 2), custom2_custom_n19 numeric(12, 2), custom2_custom_n20 numeric(12, 2), ~r~n" + &
"  custom2_custom_n21 numeric(12, 2), custom2_custom_n22 numeric(12, 2), custom2_custom_n23 numeric(12, 2), ~r~n" + &
"  custom2_custom_n24 numeric(12, 2), custom2_custom_n25 numeric(12, 2), custom2_custom_21 varchar(255), ~r~n" + &
"  custom2_custom_22 varchar(255), custom2_custom_notes_1 varchar(8000), custom2_custom_notes_2 varchar(8000), ~r~n" + &
"  custom2_custom_notes_3 varchar(8000), custom2_custom_notes_4 varchar(8000), custom2_custom_notes_5 varchar(8000), ~r~n" + &
"  custom2_custom_money_1 money, custom2_custom_money_2 money, custom2_custom_money_3 money, ~r~n" + &
"  custom2_custom_percent_1 numeric(12, 4), custom2_custom_percent_2 numeric(12, 4), ~r~n" + &
"  custom2_custom_percent_3 numeric(12, 4), custom2_custom_percent_4 numeric(12, 4), ~r~n" + &
"  custom2_custom_percent_5 numeric(12, 4), custom2_custom_percent_6 numeric(12, 4), ~r~n" + &
"  custom2_custom_percent_7 numeric(12, 4), custom2_custom_percent_8 numeric(12, 4), ~r~n" + &
"  custom2_custom_percent_9 numeric(12, 4), custom2_custom_percent_10 numeric(12, 4), ~r~n" + &
"  has_docs int, contract_department numeric(6, 0), occi_name varchar(100), ccci_name varchar(100)  ~r~n" + &
")~r~n" + &
"~r~n" + &
"/* Temp table for master rows */~r~n" + &
"create table #tmp_ctx ( ctx_id int, is_template int )~r~n" + &
"/* ~"owner~" */~r~n" + &
"create table #tmp_owner ( ctx_id int, owner_user_d varchar(10)   )~r~n" + &
"create index xietmp_owner on #tmp_owner ( ctx_id )~r~n" + &
"/* When filtering by contact */~r~n" + &
"create table #tmp_contact ( ctx_id int, contact_id int, ic_area char(1), name varchar(100)  )~r~n" + &
"/* Master count */~r~n" + &
"create table #tmp_master_count ( ctx_id int, master_count int )~r~n" + &
"create unique index xak1tmp_master_count on #tmp_master_count ( ctx_id )~r~n" + &
"/* contracted_entity */~r~n" + &
"create table #tmp_contracted_entity ( ctx_id int, rec_id numeric(8, 0) )~r~n" + &
"create unique index xak1tmp_contracted_entity on #tmp_contracted_entity ( ctx_id )~r~n" + &
"/* for backward compatability, column name = ~"has_docs~" */~r~n" + &
"create table #tmp_doc_count ( ctx_id int, has_docs int )~r~n" + &
"create unique index xak1tmp_doc_count on #tmp_doc_count (ctx_id )~r~n" + &
"~r~n" + &
"  DECLARE @filter_by_contact int~r~n" + &
"  DECLARE @display_multi_products VARCHAR(10)     ~r~n" + &
"  DECLARE @sql_text varchar(5000),~r~n" + &
"    @sql_text2 varchar(5000), ~r~n" + &
"    @sql_dynamic_where varchar(2000),~r~n" + &
"    @sql_dynamic_from varchar(1000)~r~n" + &
"~r~n" + &
"/* Determine whether to display multiple products */~r~n" + &
"  SELECT~r~n" + &
"    @display_multi_products = option_value~r~n" + &
"  FROM~r~n" + &
"    security_user_options~r~n" + &
"  WHERE ~r~n" + &
"    ( user_id = @user_d ) and ~r~n" + &
"    ( option_name = 'display_multi_product' )~r~n" + &
"~r~n" + &
"  if (@display_multi_products is null) SELECT @display_multi_products = '1'~r~n" + &
"/*~r~n" + &
"  Pre-process datetime parameters:~r~n" + &
"   - set ~"minimum~" dates to midnight of same day~r~n" + &
"   - set ~"maximum~" dates to midnight of following day~r~n" + &
"*/~r~n" + &
"  SELECT @effective_date = CAST (floor(CAST(@effective_date as float)) as datetime)~r~n" + &
"  SELECT @effective_date2 = CAST (floor(CAST(@effective_date2 as float)) as datetime)~r~n" + &
"  SELECT @effective_date2 = dateadd(day, 1, @effective_date2)~r~n" + &
"  SELECT @expriation_date = CAST (floor(CAST(@expriation_date as float)) as datetime)~r~n" + &
"  SELECT @expriation_date2 = CAST (floor(CAST(@expriation_date2 as float)) as datetime)~r~n" + &
"  SELECT @expriation_date2 = dateadd(day, 1, @expriation_date2)~r~n" + &
"  SELECT @last_revis_date = CAST (floor(CAST(@last_revis_date as float)) as datetime)~r~n" + &
"  SELECT @last_revis_date_2 = CAST (floor(CAST(@last_revis_date_2 as float)) as datetime)~r~n" + &
"  SELECT @last_revis_date_2 = dateadd(day, 1, @last_revis_date_2)~r~n" + &
"  SELECT @review_date = CAST (floor(CAST(@review_date as float)) as datetime)~r~n" + &
"  SELECT @review_date_2 = CAST (floor(CAST(@review_date_2 as float)) as datetime)~r~n" + &
"  SELECT @review_date_2 = dateadd(day, 1, @review_date_2)~r~n" + &
"  SELECT @term_date = CAST (floor(CAST(@term_date as float)) as datetime)~r~n" + &
"  SELECT @term_date_2 = CAST (floor(CAST(@term_date_2 as float)) as datetime)~r~n" + &
"  SELECT @term_date_2 = dateadd(day, 1, @term_date_2)~r~n" + &
"  SELECT @version_date = CAST (floor(CAST(@version_date as float)) as datetime)~r~n" + &
"  SELECT @version_date_2 = CAST (floor(CAST(@version_date_2 as float)) as datetime)~r~n" + &
"  SELECT @version_date_2 = dateadd(day, 1, @version_date_2)~r~n" + &
"  SELECT @custom_date1 = CAST (floor(CAST(@custom_date1 as float)) as datetime)~r~n" + &
"  SELECT @custom_date1_2 = CAST (floor(CAST(@custom_date1_2 as float)) as datetime)~r~n" + &
"  SELECT @custom_date1_2 = dateadd(day, 1, @custom_date1_2)~r~n" + &
"  SELECT @custom_date2 = CAST (floor(CAST(@custom_date2 as float)) as datetime)~r~n" + &
"  SELECT @custom_date2_2 = CAST (floor(CAST(@custom_date2_2 as float)) as datetime)~r~n" + &
"  SELECT @custom_date2_2 = dateadd(day, 1, @custom_date2_2)~r~n" + &
"~r~n" + &
"/*----------------------------------------------------------------------------------------*/~r~n" + &
"/* Dynamic portion of the query */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_where = ' AND~r~n" + &
"    ( ctx_basic_info.is_template = 0 )'~r~n" + &
"  +  CASE WHEN @ctx_id IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.ctx_id = ' + convert(varchar, @ctx_id) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @category IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.category = ' + convert(varchar, @category) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @status IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.status = ' + convert(varchar, @status) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @contract_type IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.contract_type = ' + convert(varchar, @contract_type) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @contracted_entity IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_loc.ctx_id = ctx_basic_info.ctx_id ) AND~r~n" + &
"    ( ctx_loc.loc_id = 0 ) AND~r~n" + &
"    ( group_multi_loc.rec_id = ctx_loc.parent_comp_id )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN (@product_type IS NULL) AND (ltrim(rtrim(isNull(@product_name, ''))) = '') THEN '' ELSE ' AND~r~n" + &
"    ( ctx_products.ctx_id = ctx_basic_info.ctx_id )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @product_type IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_products.product_type = ' + convert(varchar, @product_type) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@product_name, ''))) = '' THEN '' ELSE ' AND~r~n" + &
"    ( ctx_products.product_id = ''' + @product_name + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @group_id IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.group_id = ' + convert(varchar, @group_id) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @effective_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.effective_date >= ''' + convert(varchar, @effective_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @effective_date2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.effective_date < ''' + convert(varchar, @effective_date2) + ''' )'~r~n" + &
"  END~r~n" + &
"  + CASE WHEN @expriation_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.expriation_date >= ''' + convert(varchar, @expriation_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @expriation_date2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.expriation_date < ''' + convert(varchar, @expriation_date2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @last_revis_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.last_revis_date >= ''' + convert(varchar, @last_revis_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @last_revis_date_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.last_revis_date < ''' + convert(varchar, @last_revis_date_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @review_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.review_date >= ''' + convert(varchar, @review_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @review_date_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.review_date < ''' + convert(varchar, @review_date_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @term_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.term_date >= ''' + convert(varchar, @term_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @term_date_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.term_date < ''' + convert(varchar, @term_date_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @version_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.version_date >= ''' + convert(varchar, @version_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @version_date_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.version_date < ''' + convert(varchar, @version_date_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_date1 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.custom_date1 >= ''' + convert(varchar, @custom_date1) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_date1_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.custom_date1 < ''' + convert(varchar, @custom_date1_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_date2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.custom_date2 >= ''' + convert(varchar, @custom_date2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_date2_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.custom_date2 < ''' + convert(varchar, @custom_date2_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@custom_1, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_1_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_basic_info.custom_1 = ''' + @custom_1 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_1 LIKE ''%' + @custom_1 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@custom_2, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_2_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_basic_info.custom_2 = ''' + @custom_2 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_2 LIKE ''%' + @custom_2 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@custom_3, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_3_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_basic_info.custom_3 = ''' + @custom_3 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_3 LIKE ''%' + @custom_3 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@custom_4, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_4_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_basic_info.custom_4 = ''' + @custom_4 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_4 LIKE ''%' + @custom_4 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n1 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n1 = ' + convert(varchar, @custom_n1) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n2 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n2 = ' + convert(varchar, @custom_n2) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n3 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n3 = ' + convert(varchar, @custom_n3) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n4 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n4 = ' + convert(varchar, @custom_n4) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n5 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n5 = ' + convert(varchar, @custom_n5) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n6 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n6 = ' + convert(varchar, @custom_n6) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @dvision IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.dvision = ' + convert(varchar, @dvision) + ' )'~r~n" + &
"  END~r~n" + &
"  +  @other_where_text~r~n" + &
"~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_from = ''  +~r~n" + &
"  CASE WHEN @contracted_entity IS NULL THEN '' ELSE ',  ctx_loc,    group_multi_loc'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN (@product_type IS NULL) AND (ltrim(rtrim(isNull(@product_name, ''))) = '') THEN '' ELSE ',  ctx_products'~r~n" + &
"  END  +  @other_from_text~r~n" + &
"/*-----------------------------------------------------------------------------------------------------------*/~r~n" + &
"/* Owner */~r~n" + &
"  /* Filter by owner */~r~n" + &
"  SELECT~r~n" + &
"    @sql_text = '  INSERT #tmp_owner  SELECT~r~n" + &
"    ctx_basic_info.ctx_id,~r~n" + &
"    min(ctx_contacts.user_d)~r~n" + &
"  FROM~r~n" + &
"    ctx_basic_info,~r~n" + &
"    ctx_contacts,~r~n" + &
"    ctx_contract_contacts'~r~n" + &
"  +   @sql_dynamic_from  +~r~n" + &
"'  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) AND~r~n" + &
"    ( ctx_contract_contacts.owner = ''Y'' ) AND~r~n" + &
"    ( ctx_contract_contacts.ic_area = ''I'' ) AND~r~n" + &
"    ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )'~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@owner, ''))) = '' THEN '' ELSE ' AND~r~n" + &
"    ( ctx_contacts.user_d = ''' + @owner + ''' )'~r~n" + &
"  END~r~n" + &
"  +  @sql_dynamic_where  +~r~n" + &
"'  GROUP BY~r~n" + &
"    ctx_basic_info.ctx_id'~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text)~r~n" + &
"~r~n" + &
"  /* #tmp_owner is now populated */~r~n" + &
"~r~n" + &
"IF ltrim(rtrim(isNull(@owner, ''))) <> ''~r~n" + &
"BEGIN~r~n" + &
"  /* Append to @sql_dynamic_from */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_from = @sql_dynamic_from + ',   #tmp_owner'~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_where */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_where = @sql_dynamic_where + ' AND    ( #tmp_owner.ctx_id = ctx_basic_info.ctx_id )'~r~n" + &
"END~r~n" + &
"/* Owner */~r~n" + &
"/*-------------------------------------------------------------------------------------------------------------------------*/~r~n" + &
"/* Filter by contact */~r~n" + &
"/* ic_area = 'E' */~r~n" + &
"  SELECT~r~n" + &
"    @ccci_name = ltrim(rtrim(isNull(@ccci_name, ''))),~r~n" + &
"    @ccci_association = ltrim(rtrim(isNull(@ccci_association,''))),~r~n" + &
"    @ccci_contact_email = ltrim(rtrim(isNull(@ccci_contact_email,''))),~r~n" + &
"    @ccci_custom_1 = ltrim(rtrim(isNull(@ccci_custom_1,''))),~r~n" + &
"/* ic_area = 'I' */~r~n" + &
"    @occi_name = ltrim(rtrim(isNull(@occi_name,''))),~r~n" + &
"    @occi_association = ltrim(rtrim(isNull(@occi_association,''))),~r~n" + &
"    @occi_contact_email = ltrim(rtrim(isNull(@occi_contact_email,''))),~r~n" + &
"    @occi_custom_1 = ltrim(rtrim(isNull(@occi_custom_1,'')))~r~n" + &
"  /* Base query for contacts */~r~n" + &
"/*~r~n" + &
"  RP 8.12.2016 - refer to Bug2016080309: original query limits to those contacts which have an email address defined.~r~n" + &
"  Comment out the joins to tables code_lookup and ctx_contacts_numbers~r~n" + &
"*/~r~n" + &
"  SELECT @sql_text = '  INSERT #tmp_contact~r~n" + &
"  SELECT~r~n" + &
"    ctx_contract_contacts.ctx_id,~r~n" + &
"    ctx_contract_contacts.contact_id,~r~n" + &
"    ctx_contract_contacts.ic_area,~r~n" + &
"    ctx_contacts.last_name + '',''  + ctx_contacts.first_name + ''''+ isnull(ctx_contacts.middle_name,'''')~r~n" + &
"  FROM~r~n" + &
"    ctx_basic_info, ~r~n" + &
"    ctx_contract_contacts,~r~n" + &
"    ctx_contacts'~r~n" + &
"  +  @sql_dynamic_from  +~r~n" + &
"'  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) and ~r~n" + &
"    ( ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) and~r~n" + &
"    ( ctx_contacts.facility_id > 0 )'~r~n" + &
"  +  @sql_dynamic_where~r~n" + &
"~r~n" + &
"/* ic_area = 'E' */~r~n" + &
"IF (@ccci_name = '') AND (@ccci_association = '') AND (@ccci_contact_email = '') AND (@ccci_custom_n1 IS NULL) AND (@ccci_custom_1 = '')~r~n" + &
"BEGIN~r~n" + &
"  /* Do nothing */~r~n" + &
"  SELECT @filter_by_contact = 0~r~n" + &
"END ELSE BEGIN~r~n" + &
"  SELECT @filter_by_contact = 1~r~n" + &
"~r~n" + &
"  SELECT @sql_text2 = @sql_text + ' and    ( ctx_contract_contacts.ic_area = ''E'' )'~r~n" + &
"  +  CASE WHEN @ccci_association = '' THEN '' ELSE ' and~r~n" + &
"    ( ctx_contract_contacts.association = ''' + @ccci_association + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @ccci_contact_email = '' THEN '' ELSE ' and   ( ctx_contract_contacts.contact_email LIKE ''%' + @ccci_contact_email + '%'' )'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @ccci_custom_1 = '' THEN '' ELSE ' and    ( ctx_contract_contacts.custom_1 = ''' + @ccci_custom_1 + ''' )'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @ccci_custom_n1 IS NULL THEN '' ELSE ' and    ( ctx_contract_contacts.custom_n1 = ' + convert(varchar, @ccci_custom_n1) + ' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text2)~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_from */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_from = @sql_dynamic_from + ',    #tmp_contact contact_e'~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_where */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_where = @sql_dynamic_where + ' and  ( contact_e.ctx_id = ctx_basic_info.ctx_id ) and    ( contact_e.ic_area = ''E'' )'~r~n" + &
"  +  CASE WHEN @ccci_name = '' THEN '' ELSE ' and   ( contact_e.name LIKE ''%' + @ccci_name + '%'' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"END~r~n" + &
"~r~n" + &
"/* ic_area = 'I' */~r~n" + &
"IF (@occi_name = '') AND (@occi_association = '') AND (@occi_contact_email = '') AND (@occi_custom_n1 IS NULL) AND (@occi_custom_1 = '')~r~n" + &
"BEGIN~r~n" + &
"  /* Do nothing */~r~n" + &
"  SELECT @filter_by_contact = @filter_by_contact~r~n" + &
"END ELSE BEGIN~r~n" + &
"  SELECT @filter_by_contact = 1~r~n" + &
"~r~n" + &
"  SELECT @sql_text2 = @sql_text + ' and    ( ctx_contract_contacts.ic_area = ''I'' )'~r~n" + &
"  +~r~n" + &
"  CASE WHEN @occi_association = '' THEN '' ELSE ' and    ( ctx_contract_contacts.association = ''' + @occi_association + ''' )'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @occi_contact_email = '' THEN '' ELSE ' and    ( ctx_contract_contacts.contact_email LIKE ''%' + @occi_contact_email + '%'' )'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @occi_custom_1 = '' THEN '' ELSE ' and    ( ctx_contract_contacts.custom_1 = ''' + @occi_custom_1 + ''' )'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @occi_custom_n1 IS NULL THEN '' ELSE ' and    ( ctx_contract_contacts.custom_n1 = ' + convert(varchar, @occi_custom_n1) + ' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text2)~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_from */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_from = @sql_dynamic_from + ',    #tmp_contact contact_i'~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_where */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_where = @sql_dynamic_where + ' and    ( contact_i.ctx_id = ctx_basic_info.ctx_id ) and    ( contact_i.ic_area = ''I'' )'~r~n" + &
"  +  CASE WHEN @occi_name = '' THEN '' ELSE ' and    ( contact_i.name LIKE ''%' + @occi_name + '%'' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"END~r~n" + &
"~r~n" + &
"/* End filter by contact */~r~n" + &
"/*-------------------------------------------------------------------------------------------------------------------------*/~r~n" + &
"~r~n" + &
"/* Main query */~r~n" + &
"  SELECT~r~n" + &
"    @sql_text = '  INSERT~r~n" + &
"    #tmp_ctx~r~n" + &
"  SELECT DISTINCT~r~n" + &
"    ctx_basic_info.ctx_id,~r~n" + &
"    ctx_basic_info.is_template~r~n" + &
"  FROM~r~n" + &
"    ctx_basic_info'~r~n" + &
"  +  @sql_dynamic_from  + '  WHERE~r~n" + &
"    ( ctx_basic_info.ctx_id > 0 )'~r~n" + &
"  +  @sql_dynamic_where~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text)~r~n" + &
"~r~n" + &
"  /* #tmp_ctx is now populated */~r~n" + &
"~r~n" + &
"  /* Determine master count per selected ctx_id */~r~n" + &
"  INSERT #tmp_master_count~r~n" + &
"  SELECT~r~n" + &
"    #tmp_ctx.ctx_id, ~r~n" + &
"    count(ctx_basic_info.ctx_id)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx,~r~n" + &
"    ctx_basic_info~r~n" + &
"  WHERE~r~n" + &
"    ( #tmp_ctx.is_template = 0 ) AND~r~n" + &
"    ( ctx_basic_info.master_contract_id = #tmp_ctx.ctx_id )~r~n" + &
"  GROUP BY~r~n" + &
"    #tmp_ctx.ctx_id ~r~n" + &
"~r~n" + &
"  /* Determine contracted entity per selected ctx_id */~r~n" + &
"  INSERT #tmp_contracted_entity~r~n" + &
"  SELECT~r~n" + &
"    #tmp_ctx.ctx_id,~r~n" + &
"    min(group_multi_loc.rec_id)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx,~r~n" + &
"    ctx_loc,~r~n" + &
"    group_multi_loc~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_loc.ctx_id = #tmp_ctx.ctx_id ) and~r~n" + &
"    ( ctx_loc.loc_id = 0 ) and ~r~n" + &
"    ( group_multi_loc.rec_id = ctx_loc.parent_comp_id )~r~n" + &
"  GROUP BY~r~n" + &
"    #tmp_ctx.ctx_id~r~n" + &
"~r~n" + &
"/* Determine document count */~r~n" + &
"  INSERT #tmp_doc_count~r~n" + &
"  SELECT~r~n" + &
"    ctx_am_document.ctx_id,~r~n" + &
"    count(DISTINCT ctx_am_document.doc_id)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx,~r~n" + &
"    ctx_am_document~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_am_document.ctx_id = #tmp_ctx.ctx_id )~r~n" + &
"  GROUP BY~r~n" + &
"    ctx_am_document.ctx_id~r~n" + &
"~r~n" + &
"/*--------------------------------------------------------------------------------------------------------------------------------------------*/~r~n" + &
"/*~r~n" + &
"  <RP> note: Preserve logic from original sp_contract_search, but limit each query to the filtered list of ctx_id values~r~n" + &
"  in table #tmp_ctx~r~n" + &
"*/~r~n" + &
"create table #temp_ctx_user ( user_d varchar(10) collate SQL_Latin1_General_CP1_CI_AS, ctx_id int )~r~n" + &
"create table #temp_right ( ctx_id int, user_d varchar(10) collate SQL_Latin1_General_CP1_CI_AS, access char(1) )~r~n" + &
"~r~n" + &
"/*****************************************************************************/~r~n" + &
"/* Build concatenated contact and product lists */~r~n" + &
"/* ccci name */~r~n" + &
"create table #tmp_ctx_ccci ( ctx_id int, name varchar(100) )~r~n" + &
"create table #tmp_ctx_ccci2 ( ctx_id int, ccci_name varchar(100) )~r~n" + &
"create unique index xak1tmp_ctx_ccci2 on #tmp_ctx_ccci2 ( ctx_id )~r~n" + &
"~r~n" + &
"/* occi name */~r~n" + &
"create table #tmp_ctx_occi ( ctx_id int, name varchar(100) )~r~n" + &
"create table #tmp_ctx_occi2 ( ctx_id int, occi_name varchar(100) )~r~n" + &
"create unique index xak1tmp_ctx_occi2 on #tmp_ctx_occi2 ( ctx_id )~r~n" + &
"~r~n" + &
"/* product name */~r~n" + &
"create table #tmp_ctx_products ( ctx_id int, product_id numeric(6, 0), product_type numeric(6, 0), product_name varchar(1000), product_type_name varchar(1000) )~r~n" + &
"create table #tmp_ctx_products2 ( ctx_id int, product_id numeric(6, 0), product_name varchar(1000), product_type_name varchar(1000) )~r~n" + &
"create unique index xak1tmp_ctx_products2 on #tmp_ctx_products2 ( ctx_id )~r~n" + &
"~r~n" + &
"/* RP 8.5.2016: Move statements to procedure usp_contract_search_2, to overcome Appeon limitation of 1000 lines in source file. */~r~n" + &
"~r~n" + &
"  EXEC sp_contract_search_2_result @user_d, @product_type, @product_name, @display_multi_products, @check_rowcount_flag~r~n" + &
"~r~n" + &
"/* Result set */~r~n" + &
"  SELECT~r~n" + &
"    app_facility,     product_code,     product_name,     effective_date,     expriation_date,     status, ~r~n" + &
"    group_multi_loc_id,     ctx_id,     master_contract_id,     master_cnt,     category,     facility_id, ~r~n" + &
"    contract_type,     product_type,     reimbursment_menth,     file_location,     review_date,     review_by, ~r~n" + &
"    term_date,     term_reason,     last_revis_date,     other_date_1,     other_date_2,     oc_signed_by, ~r~n" + &
"    oc_title,     oc_department,     oc_legal_rep,     cc_signed_by,     cc_title,     cc_department,     cc_legal_rep, ~r~n" + &
"    notes,     keyword,     dvision,     custom_1,     custom_2,     custom_3,     custom_4,     custom_5, ~r~n" + &
"    custom_6,     custom_7,     custom_8,     custom_9,     custom_10,     group_id,     revision_reason,     record_id, ~r~n" + &
"    owner,     contracted_entity,     facility_name,     custom_date1,     custom_date2,     custom_date3,     custom_date4, ~r~n" + &
"    custom_date5,     inserted_by_user,     inserted_at_date_time,     updated_by_user,     updated_at_date_time, ~r~n" + &
"    custom_11,     custom_12,     custom_13,     custom_14,     custom_15,     custom_16,     custom_17,     custom_18, ~r~n" + &
"    custom_19,     custom_20,     custom_date6,     custom_date7,     custom_date8,     custom_date9,     custom_date10, ~r~n" + &
"    custom_date11,     custom_date12,     custom_date13,     custom_date14,     custom_date15,     custom_n1,     custom_n2, ~r~n" + &
"    custom_n3,     custom_n4,     custom_n5,     custom_n6,     custom_n7,     custom_n8,     custom_n9,     custom_n10, ~r~n" + &
"    custom_n11,     custom_n12,     custom_n13,     custom_n14,     custom_n15,     custom_n16,     custom_n17,     custom_n18, ~r~n" + &
"    custom_n19,     custom_n20,     custom_n21,     custom_n22,     custom_n23,     custom_n24,     custom_n25,     version_number, ~r~n" + &
"    version_date,     master_contract_name,     fee_sched_calc_field_1,     fee_sched_calc_field_2,     fee_sched_calc_field_3, ~r~n" + &
"    access,     status_name,     category_name,     contract_type_name,     dvision_name,     unread_email_cnt, ~r~n" + &
"    custom_percent_1,     custom_percent_2,     custom_percent_3,     custom_percent_4,     custom_percent_5, ~r~n" + &
"    custom_percent_6,     custom_percent_7,     custom_percent_8,     custom_percent_9,     custom_percent_10, ~r~n" + &
"    work_flow_n1,     work_flow_n2,     work_flow_n3,     work_flow_n4,     work_flow_n5,     custom_status1,     custom_status2, ~r~n" + &
"    custom_21,     custom_22,     custom_n26,     custom_n27,     custom_date16,     custom_date17,     city,     state, ~r~n" + &
"    country,     zip,     street,     custom2_custom_1,     custom2_custom_2,     custom2_custom_3,     custom2_custom_4, ~r~n" + &
"    custom2_custom_5,     custom2_custom_6,     custom2_custom_7,     custom2_custom_8,     custom2_custom_9,     custom2_custom_10, ~r~n" + &
"    custom2_custom_11,     custom2_custom_12,     custom2_custom_13,     custom2_custom_14,     custom2_custom_15, ~r~n" + &
"    custom2_custom_16,     custom2_custom_17,     custom2_custom_18,     custom2_custom_19,     custom2_custom_20, ~r~n" + &
"    custom2_custom_date1,     custom2_custom_date2,     custom2_custom_date3,     custom2_custom_date4,     custom2_custom_date5, ~r~n" + &
"    custom2_custom_date6,     custom2_custom_date7,     custom2_custom_date8,     custom2_custom_date9,     custom2_custom_date10, ~r~n" + &
"    custom2_custom_date11,     custom2_custom_date12,     custom2_custom_date13,     custom2_custom_date14,     custom2_custom_date15, ~r~n" + &
"    custom2_custom_n1,     custom2_custom_n2,     custom2_custom_n3,     custom2_custom_n4,     custom2_custom_n5,     custom2_custom_n6, ~r~n" + &
"    custom2_custom_n7,     custom2_custom_n8,     custom2_custom_n9,     custom2_custom_n10,     custom2_custom_n11,     custom2_custom_n12, ~r~n" + &
"    custom2_custom_n13,     custom2_custom_n14,     custom2_custom_n15,     custom2_custom_n16,     custom2_custom_n17,     custom2_custom_n18, ~r~n" + &
"    custom2_custom_n19,     custom2_custom_n20,     custom2_custom_n21,     custom2_custom_n22,     custom2_custom_n23,     custom2_custom_n24, ~r~n" + &
"    custom2_custom_n25,     custom2_custom_21,     custom2_custom_22,     custom2_custom_notes_1,     custom2_custom_notes_2, ~r~n" + &
"    custom2_custom_notes_3,     custom2_custom_notes_4,     custom2_custom_notes_5,     custom2_custom_money_1,     custom2_custom_money_2, ~r~n" + &
"    custom2_custom_money_3,     custom2_custom_percent_1,     custom2_custom_percent_2,     custom2_custom_percent_3,     custom2_custom_percent_4, ~r~n" + &
"    custom2_custom_percent_5,     custom2_custom_percent_6,     custom2_custom_percent_7,     custom2_custom_percent_8,     custom2_custom_percent_9, ~r~n" + &
"    custom2_custom_percent_10,     has_docs,     contract_department,     occi_name,     ccci_name~r~n" + &
"  FROM~r~n" + &
"    #tmp_result~r~n" + &
"  ORDER BY~r~n" + &
"    master_contract_id Asc,~r~n" + &
"    ctx_id  Asc~r~n" + &
""

//----------------------------------------------------------------------------------------------------------------------------------------------------------------------//




of_execute_sqls("of_ver150_release_storeprocedure8")
return 1
end function

public function integer of_ver150_release_storeprocedure9 ();
//====================================================================
// Function: of_ver150_release_storeprocedure9
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2016-08-11
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

//Added By Ken.Guo 2016-08-11
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if object_id('sp_contract_search_related') is not null~r~n" + &
"Begin~r~n" + &
"  drop procedure sp_contract_search_related;~r~n"  + &
"End ~r~n" 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Create procedure sp_contract_search_related~r~n" + &
"@ctx_id integer = NULL,~r~n" + &
"@user_d varchar(100) = NULL~r~n" + &
"As~r~n" + &
"Declare @ll_ctx_id integer~r~n" + &
"Declare @ll_parent_root_ctx_id integer~r~n" + &
"Declare @ll_parent_ctx_id integer~r~n" + &
"Declare @ll_count integer~r~n" + &
"Declare @ll_count_new integer~r~n" + &
"~r~n" + &
"create table #tmp_ctx (~r~n" + &
"  ctx_id int~r~n" + &
")~r~n" + &
"~r~n" + &
"Select @ll_ctx_id = @ctx_id~r~n" + &
"~r~n" + &
"/* Get Root Parent ctx id */~r~n" + &
"While (@ll_ctx_id > 0)~r~n" + &
"Begin~r~n" + &
"~tIf Exists(Select 1 From ctx_basic_info Where ctx_id = @ll_ctx_id)~r~n" + &
"~t~tBegin~r~n" + &
"~t~t~tInsert #tmp_ctx Values(@ll_ctx_id) ~r~n" + &
"~t~t~tSelect @ll_parent_root_ctx_id = @ll_ctx_id~r~n" + &
"~t~tEnd ~r~n" + &
"~tSelect @ll_parent_ctx_id = master_contract_id From ctx_basic_info Where ctx_id = @ll_ctx_id~r~n" + &
"~tIf @ll_parent_ctx_id > 0 and (not exists(Select 1 From #tmp_ctx Where ctx_id = @ll_parent_ctx_id))~r~n" + &
"~t~tSelect @ll_ctx_id = @ll_parent_ctx_id, @ll_parent_root_ctx_id = @ll_parent_ctx_id~r~n" + &
"~tElse~r~n" + &
"~t~tSelect @ll_ctx_id = 0~r~n" + &
"End~r~n" + &
"~r~n" + &
"/* Get all child/ref ctx id */~r~n" + &
"Delete From #tmp_ctx~r~n" + &
"If @ll_parent_root_ctx_id > 0 ~r~n" + &
"Begin~t~r~n" + &
"~t/*insert root ctx */~r~n" + &
"~tInsert  #tmp_ctx ~r~n" + &
"~t~tSelect ctx_basic_info.ctx_id From ctx_basic_info Where ctx_id = @ll_parent_root_ctx_id and is_template = 0 ~r~n" + &
"~t~t~tand ctx_basic_info.ctx_id not in (Select ctx_id From #tmp_ctx)~r~n" + &
"~t/*insert child ctx */~r~n" + &
"~tInsert  #tmp_ctx ~r~n" + &
"~t~tSelect ctx_basic_info.ctx_id From ctx_basic_info Where master_contract_id = @ll_parent_root_ctx_id and is_template = 0 ~r~n" + &
"~t~t~tand ctx_basic_info.ctx_id not in (Select ctx_id From #tmp_ctx)~r~n" + &
"~t/*insert all child ctx */~r~n" + &
"~tSelect @ll_count = count(1) From #tmp_ctx~t~r~n" + &
"~tselect @ll_count_new = 0~r~n" + &
"~tWhile @ll_count > 0 and @ll_count <> @ll_count_new~r~n" + &
"~tBegin~r~n" + &
"~t~tSelect @ll_count = count(1) From #tmp_ctx~t~t~r~n" + &
"~t~tDECLARE cursor_ctx CURSOR FOR Select ctx_id From #tmp_ctx~t~t~t~r~n" + &
"~t~tOPEN cursor_ctx~r~n" + &
"~t~tFETCH NEXT From cursor_ctx INTO @ll_ctx_id~r~n" + &
"~t~tInsert  #tmp_ctx ~r~n" + &
"~t~t~t~tSelect ctx_basic_info.ctx_id From ctx_basic_info Where master_contract_id = @ll_ctx_id and is_template = 0 ~r~n" + &
"~t~t~t~t~tand ctx_basic_info.ctx_id not in (Select ctx_id From #tmp_ctx)~t~t ~r~n" + &
"~t~tWHILE @@FETCH_STATUS = 0~r~n" + &
"~t~tBEGIN~r~n" + &
"~t~t   FETCH NEXT From cursor_ctx INTO @ll_ctx_id~r~n" + &
"~t~t~tInsert  #tmp_ctx ~r~n" + &
"~t~t~t~t~tSelect ctx_basic_info.ctx_id From ctx_basic_info Where master_contract_id = @ll_ctx_id and is_template = 0 ~r~n" + &
"~t~t~t~t~t~tand ctx_basic_info.ctx_id not in (Select ctx_id From #tmp_ctx)~r~n" + &
"~t~tEND~r~n" + &
"~t~t~r~n" + &
"~t~tCLOSE cursor_ctx~r~n" + &
"~t~tDEALLOCATE cursor_ctx~r~n" + &
"~t~tSelect @ll_count_new = count(1) From #tmp_ctx~r~n" + &
"~tEnd~r~n" + &
"~r~n" + &
"End ~r~n" + &
"~r~n" + &
"~r~n" + &
"/*****************************************************************************/~r~n" + &
"/* Build concatenated contact and product lists */~r~n" + &
"/* ccci name */~r~n" + &
"create table #tmp_ctx_ccci (~r~n" + &
"  ctx_id int,~r~n" + &
"  name varchar(100)~r~n" + &
")~r~n" + &
"  INSERT #tmp_ctx_ccci~r~n" + &
"  SELECT~r~n" + &
"    ctx_contract_contacts.ctx_id,       ~r~n" + &
"    ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'')    ~r~n" + &
"  FROM ~r~n" + &
"    #tmp_ctx, ~r~n" + &
"    ctx_contract_contacts,~r~n" + &
"    ctx_contacts~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = #tmp_ctx.ctx_id ) AND ~r~n" + &
"    ( ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) AND~r~n" + &
"    ( ctx_contract_contacts.ic_area = 'E' )~r~n" + &
"~r~n" + &
"create table #tmp_ctx_ccci2 (~r~n" + &
"  ctx_id int,~r~n" + &
"  ccci_name varchar(100)~r~n" + &
")~r~n" + &
"create unique index xak1tmp_ctx_ccci2 on #tmp_ctx_ccci2 ( ctx_id )~r~n" + &
"~r~n" + &
"  INSERT #tmp_ctx_ccci2~r~n" + &
"  SELECT~r~n" + &
"    aa.ctx_id,~r~n" + &
"    left(ltrim(stuff(convert(varchar(max), (select '; ' + name from #tmp_ctx_ccci where ctx_id = aa.ctx_id for xml path(''),type)) , 1 , 1 , '')), 100)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx_ccci aa    ~r~n" + &
"  GROUP BY aa.ctx_id    ~r~n" + &
"~r~n" + &
"~r~n" + &
"/* occi name */~r~n" + &
"create table #tmp_ctx_occi (~r~n" + &
"  ctx_id int,~r~n" + &
"  name varchar(100)~r~n" + &
")~r~n" + &
"  INSERT #tmp_ctx_occi~r~n" + &
"  SELECT~r~n" + &
"    ctx_contract_contacts.ctx_id,       ~r~n" + &
"    ctx_contacts.last_name +','+ ctx_contacts.first_name +''+ IsNull(ctx_contacts.middle_name,'')    ~r~n" + &
"  FROM ~r~n" + &
"    #tmp_ctx, ~r~n" + &
"    ctx_contract_contacts,~r~n" + &
"    ctx_contacts~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = #tmp_ctx.ctx_id ) AND ~r~n" + &
"    ( ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) AND~r~n" + &
"    ( ctx_contract_contacts.ic_area = 'I' )~r~n" + &
"~r~n" + &
"create table #tmp_ctx_occi2 (~r~n" + &
"  ctx_id int,~r~n" + &
"  occi_name varchar(100)~r~n" + &
")~r~n" + &
"create unique index xak1tmp_ctx_occi2 on #tmp_ctx_occi2 ( ctx_id )~r~n" + &
"~r~n" + &
"  INSERT #tmp_ctx_occi2~r~n" + &
"  SELECT~r~n" + &
"    aa.ctx_id,~r~n" + &
"    left(ltrim(stuff(convert(varchar(max), (select '; ' + name from #tmp_ctx_occi where ctx_id = aa.ctx_id for xml path(''),type)) , 1 , 1 , '')), 100)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx_occi aa    ~r~n" + &
"  GROUP BY aa.ctx_id  ~r~n" + &
"~r~n" + &
"  IF object_id('tempdb..#temp_ctx_user') is not null    ~r~n" + &
"  Begin    ~r~n" + &
"  ~tDrop TABLE #temp_ctx_user;    ~r~n" + &
"  End     ~r~n" + &
"       ~r~n" + &
"  /*******initial #temp_right********/    ~r~n" + &
"  IF object_id('tempdb..#temp_right') is not null    ~r~n" + &
"  Begin    ~r~n" + &
"  ~tDrop TABLE #temp_right;    ~r~n" + &
"  End     ~r~n" + &
"      ~r~n" + &
"  /*********prepare #temp_ctx_user data********/    ~r~n" + &
"  SELECT ctx_contacts.user_d,ctx_contract_contacts.ctx_id into #temp_ctx_user    ~r~n" + &
"  FROM ctx_contract_contacts, ctx_contacts       ~r~n" + &
"  WHERE ctx_contacts.contact_id = ctx_contract_contacts.contact_id     ~r~n" + &
"  AND ctx_contract_contacts.ic_area = 'I'    ~r~n" + &
"  UNION         ~r~n" + &
"  SELECT security_group_users.user_id user_d,ctx_group_access.ctx_id    ~r~n" + &
"  FROM ctx_group_access,security_group_users,icred_settings     ~r~n" + &
"  WHERE icred_settings.group_access = 1     ~r~n" + &
"  AND ctx_group_access.group_id = security_group_users.group_id    ~r~n" + &
"      ~r~n" + &
"  /*********prepare #temp_right data********/    ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id,     ~r~n" + &
"  ~t   user_id = ctx_contacts.user_d,     ~r~n" + &
"  ~t   access = (CASE ctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END)   into #temp_right    ~r~n" + &
"  FROM ctx_contract_contacts Left Outer Join     ~r~n" + &
"  (     ~r~n" + &
"  Select ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d      ~r~n" + &
"  From ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1     ~r~n" + &
"  Where ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id And ctx_contacts1.user_d = @user_d     ~r~n" + &
"  Group By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d     ~r~n" + &
"  Having Count(ctx_contract_contacts1.ctx_id) > 1     ~r~n" + &
"  ) ccc     ~r~n" + &
"  On ctx_contract_contacts.ctx_id = ccc.ctx_id     ~r~n" + &
"  ,ctx_contacts     ~r~n" + &
"  WHERE ctx_contacts.user_d = @user_d     ~r~n" + &
"  ~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' )     ~r~n" + &
"  ~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id      ~r~n" + &
"  ~tAND ( ctx_contract_contacts.access IN ('F','R')      ~r~n" + &
"  ~tOR ctx_contract_contacts.owner = 'Y' )     ~r~n" + &
"  ~tAND ctx_contract_contacts.ic_area = 'I'     ~r~n" + &
"  UNION      ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id,    ~r~n" + &
"  ~t   user_id = security_group_users.user_id,     ~r~n" + &
"  ~t   access =  ctx_group_access.access     ~r~n" + &
"  FROM  ctx_group_access ,security_group_users,icred_settings     ~r~n" + &
"  WHERE security_group_users.user_id = @user_d     ~r~n" + &
"     AND ctx_group_access.group_id = security_group_users.group_id     ~r~n" + &
"  ~tAND ctx_group_access.access =      ~r~n" + &
"  ~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access      ~r~n" + &
"  ~t~tFrom ctx_group_access a1,security_group_users u1     ~r~n" + &
"  ~t~tWhere a1.group_id = u1.group_id      ~r~n" + &
"  ~t~tAnd a1.ctx_id = ctx_group_access.ctx_id     ~r~n" + &
"  ~t~tAnd u1.user_id = security_group_users.user_id~t     ~r~n" + &
"  ~t~tAnd a1.access = 'F') Then 'F' Else 'R' End)      ~r~n" + &
"  ~tAND icred_settings.group_access = 1     ~r~n" + &
"  ~tAND ctx_group_access.access in ('F','R')     ~r~n" + &
"  ~tAND NOT EXISTS~t(SELECT 1 FROM ctx_contract_contacts, ctx_contacts     ~r~n" + &
"  ~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )      ~r~n" + &
"  ~t~t~tAND ( ctx_contacts.user_d = security_group_users.user_id )     ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ic_area = 'I' )     ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id )     ~r~n" + &
"  ~t~t~t)     ~r~n" + &
"  UNION     ~r~n" + &
" SELECT b.ctx_id,b.user_id,(CASE WHEN b.rcnt=0 THEN 'F' ELSE 'R' END) access     ~r~n" + &
" FROM    ~r~n" + &
" (    ~r~n" + &
" ~tSELECT DISTINCT a.ctx_id,a.user_id,    ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'F' THEN 1 ELSE 0 END) fcnt,    ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'R' THEN 1 ELSE 0 END) rcnt    ~r~n" + &
" ~tFROM     ~r~n" + &
" ~t(    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=1    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('11','12','13')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
"        union    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '61' THEN 'F' WHEN '62' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=6    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.dvision     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('61','62','63')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
"         union    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '71' THEN 'F' WHEN '72' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=7    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_department     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('71','72','73')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
" ~t~tunion    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '81' THEN 'F' WHEN '82' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=8    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_type     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('81','82','83')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
" ~t) a    ~r~n" + &
" ~tGROUP BY a.ctx_id,a.user_id    ~r~n" + &
"    HAVING SUM(CASE a.access WHEN 'N' THEN 1 ELSE 0 END) = 0    ~r~n" + &
" ) b   ~r~n" + &
"~r~n" + &
"~r~n" + &
"SELECT DISTINCT ctx_basic_info.app_facility,      ~r~n" + &
"  ~tctx_products.product_id product_code,    ~r~n" + &
"  ~tcode_lookup.code product_name,        ~r~n" + &
"  ~tctx_basic_info.effective_date,        ~r~n" + &
"  ~tctx_basic_info.expriation_date,       ~r~n" + &
"  ~tctx_basic_info.status,          ~r~n" + &
"  ~tctx_basic_info.group_multi_loc_id,    ~r~n" + &
"  ~tctx_basic_info.ctx_id,     ~r~n" + &
"  ~tctx_basic_info.master_contract_id,    ~r~n" + &
"  ~tmaster_cnt = (SELECT Count(ctx_basic_info1.ctx_id)     ~r~n" + &
"  ~t~t~tFROM ctx_basic_info ctx_basic_info1      ~r~n" + &
"  ~t~t~tWHERE ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id and ctx_basic_info.is_template = 0 ),    ~r~n" + &
"  ~tctx_basic_info.category,             ~r~n" + &
"  ~tctx_basic_info.facility_id,          ~r~n" + &
"  ~tctx_basic_info.contract_type,        ~r~n" + &
"  ~tcode_lookup1.code product_type,      ~r~n" + &
"  ~tctx_basic_info.reimbursment_menth,    ~r~n" + &
"  ~tctx_basic_info.file_location,        ~r~n" + &
"  ~tctx_basic_info.review_date,          ~r~n" + &
"  ~tctx_basic_info.review_by,            ~r~n" + &
"  ~tctx_basic_info.term_date,            ~r~n" + &
"  ~tctx_basic_info.term_reason,          ~r~n" + &
"  ~tctx_basic_info.last_revis_date,      ~r~n" + &
"  ~tctx_basic_info.other_date_1,         ~r~n" + &
"  ~tctx_basic_info.other_date_2,         ~r~n" + &
"  ~tctx_basic_info.oc_signed_by,         ~r~n" + &
"  ~tctx_basic_info.oc_title,             ~r~n" + &
"  ~tctx_basic_info.oc_department,        ~r~n" + &
"  ~tctx_basic_info.oc_legal_rep,         ~r~n" + &
"  ~tctx_basic_info.cc_signed_by,         ~r~n" + &
"  ~tctx_basic_info.cc_title,             ~r~n" + &
"  ~tctx_basic_info.cc_department,        ~r~n" + &
"  ~tctx_basic_info.cc_legal_rep,         ~r~n" + &
"  ~tctx_basic_info.notes,        ~t     ~r~n" + &
"  ~tctx_basic_info.keyword,              ~r~n" + &
"  ~tctx_basic_info.dvision,              ~r~n" + &
"  ~tctx_basic_info.custom_1,             ~r~n" + &
"  ~tctx_basic_info.custom_2,             ~r~n" + &
"  ~tctx_basic_info.custom_3,             ~r~n" + &
"  ~tctx_basic_info.custom_4,             ~r~n" + &
"  ~tctx_basic_info.custom_5,             ~r~n" + &
"  ~tctx_basic_info.custom_6,             ~r~n" + &
"  ~tctx_basic_info.custom_7,            ~r~n" + &
"  ~tctx_basic_info.custom_8,            ~r~n" + &
"  ~tctx_basic_info.custom_9,            ~r~n" + &
"  ~tctx_basic_info.custom_10,           ~r~n" + &
"  ~tctx_basic_info.group_id,            ~r~n" + &
"  ~tctx_basic_info.revision_reason,     ~r~n" + &
"  ~tctx_basic_info.record_id ,        ~r~n" + &
"  ~towner = upper((SELECT top 1 ctx_contacts.user_d     ~r~n" + &
"  ~t~t~tFROM ctx_contacts,ctx_contract_contacts      ~r~n" + &
"  ~t~t~tWHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id )     ~r~n" + &
"  ~t~t~tAND (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id )      ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.owner = 'Y' )      ~r~n" + &
"  ~t~t~t  AND ( ctx_contract_contacts.ic_area = 'I' ) )),      ~r~n" + &
"  ~tcontracted_entity = (SELECT top 1 group_multi_loc.rec_id           ~r~n" + &
"  ~t  ~t~t~tFROM ctx_loc,                  group_multi_loc      ~r~n" + &
"  ~t~t~t~tWHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id)     ~r~n" + &
"  ~t~t~t~tAND ( ctx_loc.ctx_id = ctx_basic_info.ctx_id)      ~r~n" + &
"  ~t~t~t~tAND ctx_loc.loc_id = 0),         ~r~n" + &
"  ~tapp_facility.facility_name facility_name,        ~r~n" + &
"  ~tctx_basic_info.custom_date1,           ~r~n" + &
"  ~tctx_basic_info.custom_date2,           ~r~n" + &
"  ~tctx_basic_info.custom_date3,           ~r~n" + &
"  ~tctx_basic_info.custom_date4,       ~r~n" + &
"  ~tctx_basic_info.custom_date5,           ~r~n" + &
"  ~tctx_basic_info.inserted_by_user,         ~r~n" + &
"  ~tctx_basic_info.inserted_at_date_time,           ~r~n" + &
"  ~tctx_basic_info.updated_by_user,        ~r~n" + &
"  ~tctx_basic_info.updated_at_date_time,           ~r~n" + &
"  ~tctx_basic_info.custom_11,           ~r~n" + &
"  ~tctx_basic_info.custom_12,        ~r~n" + &
"  ~tctx_basic_info.custom_13,           ~r~n" + &
"  ~tctx_basic_info.custom_14,           ~r~n" + &
"  ~tctx_basic_info.custom_15,       ~r~n" + &
"  ~tctx_basic_info.custom_16,           ~r~n" + &
"  ~tctx_basic_info.custom_17,           ~r~n" + &
"  ~tctx_basic_info.custom_18,           ~r~n" + &
"  ~tctx_basic_info.custom_19,           ~r~n" + &
"  ~tctx_basic_info.custom_20,          ~r~n" + &
"  ~tctx_basic_info.custom_date6,           ~r~n" + &
"  ~tctx_basic_info.custom_date7,           ~r~n" + &
"  ~tctx_basic_info.custom_date8,       ~r~n" + &
"  ~tctx_basic_info.custom_date9,           ~r~n" + &
"  ~tctx_basic_info.custom_date10,           ~r~n" + &
"  ~tctx_basic_info.custom_date11,           ~r~n" + &
"  ~tctx_basic_info.custom_date12,           ~r~n" + &
"  ~tctx_basic_info.custom_date13,       ~r~n" + &
"  ~tctx_basic_info.custom_date14,           ~r~n" + &
"  ~tctx_basic_info.custom_date15,           ~r~n" + &
"  ~tctx_basic_info.custom_n1,      ~r~n" + &
"  ~tctx_basic_info.custom_n2,           ~r~n" + &
"  ~tctx_basic_info.custom_n3,           ~r~n" + &
"  ~tctx_basic_info.custom_n4,           ~r~n" + &
"  ~tctx_basic_info.custom_n5,           ~r~n" + &
"  ~tctx_basic_info.custom_n6,       ~r~n" + &
"  ~tctx_basic_info.custom_n7,           ~r~n" + &
"  ~tctx_basic_info.custom_n8,           ~r~n" + &
"  ~tctx_basic_info.custom_n9,        ~r~n" + &
"  ~tctx_basic_info.custom_n10,           ~r~n" + &
"  ~tctx_basic_info.custom_n11,           ~r~n" + &
"  ~tctx_basic_info.custom_n12,           ~r~n" + &
"  ~tctx_basic_info.custom_n13,           ~r~n" + &
"  ~tctx_basic_info.custom_n14,           ~r~n" + &
"  ~tctx_basic_info.custom_n15,           ~r~n" + &
"  ~tctx_basic_info.custom_n16,           ~r~n" + &
"  ~tctx_basic_info.custom_n17,           ~r~n" + &
"  ~tctx_basic_info.custom_n18,           ~r~n" + &
"  ~tctx_basic_info.custom_n19,           ~r~n" + &
"  ~tctx_basic_info.custom_n20,           ~r~n" + &
"  ~tctx_basic_info.custom_n21,           ~r~n" + &
"  ~tctx_basic_info.custom_n22,           ~r~n" + &
"  ~tctx_basic_info.custom_n23,           ~r~n" + &
"  ~tctx_basic_info.custom_n24,           ~r~n" + &
"  ~tctx_basic_info.custom_n25,           ~r~n" + &
"  ~tctx_basic_info.version_number,           ~r~n" + &
"  ~tctx_basic_info.version_date,           ~r~n" + &
"  ~tctx_basic_info.master_contract_name ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_1 ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_2 ,     ~r~n" + &
"  ~tctx_basic_info.fee_sched_calc_field_3 ,  ~r~n" + &
"~taccess = AA.access,     ~r~n" + &
"  ~tcode_lookup2.code status_name,     ~r~n" + &
"  ~tcode_lookup3.code category_name,     ~r~n" + &
"  ~tcode_lookup4.code contract_type_name,     ~r~n" + &
"  ~tcode_lookup5.code dvision_name ,     ~r~n" + &
"  ~tunread_email_cnt = 0,      ~r~n" + &
"  ~tctx_basic_info.custom_percent_1,    ~r~n" + &
"  ~tctx_basic_info.custom_percent_2,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_3,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_4,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_5,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_6,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_7,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_8,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_9,     ~r~n" + &
"  ~tctx_basic_info.custom_percent_10,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n1,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n2,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n3,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n4,     ~r~n" + &
"  ~tctx_basic_info.work_flow_n5,     ~r~n" + &
"  ~tctx_basic_info.custom_status1,     ~r~n" + &
"  ~tctx_basic_info.custom_status2,     ~r~n" + &
"  ~tctx_basic_info.custom_21,     ~r~n" + &
"  ~tctx_basic_info.custom_22,     ~r~n" + &
"  ~tctx_basic_info.custom_n26,     ~r~n" + &
"  ~tctx_basic_info.custom_n27,     ~r~n" + &
"  ~tctx_basic_info.custom_date16,     ~r~n" + &
"  ~tctx_basic_info.custom_date17,     ~r~n" + &
"  ~tapp_facility.city,     ~r~n" + &
"  ~tapp_facility.state,     ~r~n" + &
"  ~tapp_facility.country,     ~r~n" + &
"  ~tapp_facility.zip,     ~r~n" + &
"  ~tapp_facility.street,     ~r~n" + &
"  ~tctx_custom.custom_1 as custom2_custom_1,     ~r~n" + &
"    ctx_custom.custom_2 as custom2_custom_2,        ~r~n" + &
"    ctx_custom.custom_3 as custom2_custom_3,        ~r~n" + &
"    ctx_custom.custom_4 as custom2_custom_4,        ~r~n" + &
"     ctx_custom.custom_5 as custom2_custom_5,        ~r~n" + &
"     ctx_custom.custom_6 as custom2_custom_6,        ~r~n" + &
"      ctx_custom.custom_7 as custom2_custom_7,        ~r~n" + &
"      ctx_custom.custom_8 as custom2_custom_8,        ~r~n" + &
"      ctx_custom.custom_9 as custom2_custom_9,        ~r~n" + &
"      ctx_custom.custom_10 as custom2_custom_10,        ~r~n" + &
"      ctx_custom.custom_11 as custom2_custom_11,        ~r~n" + &
"      ctx_custom.custom_12 as custom2_custom_12,        ~r~n" + &
"      ctx_custom.custom_13 as custom2_custom_13,        ~r~n" + &
"      ctx_custom.custom_14 as custom2_custom_14,        ~r~n" + &
"      ctx_custom.custom_15 as custom2_custom_15,        ~r~n" + &
"      ctx_custom.custom_16 as custom2_custom_16,        ~r~n" + &
"      ctx_custom.custom_17 as custom2_custom_17,        ~r~n" + &
"      ctx_custom.custom_18 as custom2_custom_18,        ~r~n" + &
"      ctx_custom.custom_19 as custom2_custom_19,        ~r~n" + &
"      ctx_custom.custom_20 as custom2_custom_20,        ~r~n" + &
"      ctx_custom.custom_date1 as custom2_custom_date1,        ~r~n" + &
"      ctx_custom.custom_date2 as custom2_custom_date2,        ~r~n" + &
"      ctx_custom.custom_date3 as custom2_custom_date3,        ~r~n" + &
"      ctx_custom.custom_date4 as custom2_custom_date4,        ~r~n" + &
"      ctx_custom.custom_date5 as custom2_custom_date5,        ~r~n" + &
"      ctx_custom.custom_date6 as custom2_custom_date6,        ~r~n" + &
"      ctx_custom.custom_date7 as custom2_custom_date7,        ~r~n" + &
"      ctx_custom.custom_date8 as custom2_custom_date8,        ~r~n" + &
"      ctx_custom.custom_date9 as custom2_custom_date9,        ~r~n" + &
"      ctx_custom.custom_date10 as custom2_custom_date10,        ~r~n" + &
"      ctx_custom.custom_date11 as custom2_custom_date11,        ~r~n" + &
"      ctx_custom.custom_date12 as custom2_custom_date12,        ~r~n" + &
"      ctx_custom.custom_date13 as custom2_custom_date13,        ~r~n" + &
"      ctx_custom.custom_date14 as custom2_custom_date14,        ~r~n" + &
"      ctx_custom.custom_date15 as custom2_custom_date15,        ~r~n" + &
"      ctx_custom.custom_n1 as custom2_custom_n1,        ~r~n" + &
"      ctx_custom.custom_n2 as custom2_custom_n2,        ~r~n" + &
"      ctx_custom.custom_n3 as custom2_custom_n3,        ~r~n" + &
"      ctx_custom.custom_n4 as custom2_custom_n4,        ~r~n" + &
"      ctx_custom.custom_n5 as custom2_custom_n5,        ~r~n" + &
"      ctx_custom.custom_n6 as custom2_custom_n6,        ~r~n" + &
"      ctx_custom.custom_n7 as custom2_custom_n7,        ~r~n" + &
"      ctx_custom.custom_n8 as custom2_custom_n8,        ~r~n" + &
"      ctx_custom.custom_n9 as custom2_custom_n9,        ~r~n" + &
"      ctx_custom.custom_n10 as custom2_custom_n10,        ~r~n" + &
"      ctx_custom.custom_n11 as custom2_custom_n11,        ~r~n" + &
"      ctx_custom.custom_n12 as custom2_custom_n12,        ~r~n" + &
"      ctx_custom.custom_n13 as custom2_custom_n13,        ~r~n" + &
"      ctx_custom.custom_n14 as custom2_custom_n14,        ~r~n" + &
"      ctx_custom.custom_n15 as custom2_custom_n15,        ~r~n" + &
"      ctx_custom.custom_n16 as custom2_custom_n16,        ~r~n" + &
"      ctx_custom.custom_n17 as custom2_custom_n17,        ~r~n" + &
"      ctx_custom.custom_n18 as custom2_custom_n18,        ~r~n" + &
"      ctx_custom.custom_n19 as custom2_custom_n19,        ~r~n" + &
"      ctx_custom.custom_n20 as custom2_custom_n20,        ~r~n" + &
"      ctx_custom.custom_n21 as custom2_custom_n21,        ~r~n" + &
"      ctx_custom.custom_n22 as custom2_custom_n22,        ~r~n" + &
"      ctx_custom.custom_n23 as custom2_custom_n23,        ~r~n" + &
"      ctx_custom.custom_n24 as custom2_custom_n24,        ~r~n" + &
"      ctx_custom.custom_n25 as custom2_custom_n25,        ~r~n" + &
"      ctx_custom.custom_21 as custom2_custom_21,        ~r~n" + &
"      ctx_custom.custom_22 as custom2_custom_22,        ~r~n" + &
"      ctx_custom.custom_notes_1 as custom2_custom_notes_1,       ~r~n" + &
"      ctx_custom.custom_notes_2 as custom2_custom_notes_2,        ~r~n" + &
"      ctx_custom.custom_notes_3 as custom2_custom_notes_3,        ~r~n" + &
"      ctx_custom.custom_notes_4 as custom2_custom_notes_4,        ~r~n" + &
"      ctx_custom.custom_notes_5 as custom2_custom_notes_5,        ~r~n" + &
"    ctx_custom.custom_money_1 as custom2_custom_money_1,        ~r~n" + &
"      ctx_custom.custom_money_2 as custom2_custom_money_2,        ~r~n" + &
"      ctx_custom.custom_money_3 as custom2_custom_money_3,        ~r~n" + &
"      ctx_custom.custom_percent_1 as custom2_custom_percent_1,        ~r~n" + &
"  ~tctx_custom.custom_percent_2 as custom2_custom_percent_2,        ~r~n" + &
"      ctx_custom.custom_percent_3 as custom2_custom_percent_3,        ~r~n" + &
"      ctx_custom.custom_percent_4 as custom2_custom_percent_4,        ~r~n" + &
"      ctx_custom.custom_percent_5 as custom2_custom_percent_5,        ~r~n" + &
"      ctx_custom.custom_percent_6 as custom2_custom_percent_6,        ~r~n" + &
"      ctx_custom.custom_percent_7 as custom2_custom_percent_7,        ~r~n" + &
"      ctx_custom.custom_percent_8 as custom2_custom_percent_8,        ~r~n" + &
"      ctx_custom.custom_percent_9 as custom2_custom_percent_9,        ~r~n" + &
"      ctx_custom.custom_percent_10 as custom2_custom_percent_10,       ~r~n" + &
"      has_docs = Isnull(ctx_am_documents.has_docs,0),     ~r~n" + &
"     ctx_basic_info.contract_department,     ~r~n" + &
"     #tmp_ctx_occi2.occi_name,    ~r~n" + &
"     #tmp_ctx_ccci2.ccci_name    ~r~n" + &
"  ~tFROM  ctx_basic_info       ~r~n" + &
"  ~tLEFT OUTER JOIN #tmp_ctx_ccci2 ON ctx_basic_info.ctx_id = #tmp_ctx_ccci2.ctx_id~t     ~r~n" + &
"  ~tLEFT OUTER JOIN #tmp_ctx_occi2 ON ctx_basic_info.ctx_id = #tmp_ctx_occi2.ctx_id    ~r~n" + &
"  ~tLEFT OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id       ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup ON ctx_products.product_id = code_lookup.lookup_code       ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup1 ON ctx_products.product_type = code_lookup1.lookup_code    ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup2 ON ctx_basic_info.status = code_lookup2.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup3 ON ctx_basic_info.category = code_lookup3.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup4 ON ctx_basic_info.contract_type = code_lookup4.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN code_lookup code_lookup5 ON ctx_basic_info.dvision = code_lookup5.lookup_code     ~r~n" + &
"  ~tLEFT OUTER JOIN ctx_custom ON ctx_basic_info.ctx_id = ctx_custom.ctx_id       ~r~n" + &
"  ~tLEFT OUTER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id      ~r~n" + &
"  ~tLEFT OUTER JOIN ( select count(1) has_docs, ctx_id from  ctx_am_document group by ctx_id ) ctx_am_documents ON ctx_basic_info.ctx_id = ctx_am_documents.ctx_id       ~r~n" + &
"  ~t, #tmp_ctx,#temp_right AA~r~n" + &
"~tWHERE ctx_basic_info.ctx_id = #tmp_ctx.ctx_id and AA.ctx_id = ctx_basic_info.ctx_id and ctx_basic_info.is_template = 0      ~r~n" + &
"  ~tORDER BY ctx_basic_info.ctx_id  Asc    ~r~n" + &
""


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if object_id('up_user_ctx_access_list') is not null~r~n" + &
"Begin~r~n" + &
"  drop procedure up_user_ctx_access_list;~r~n"  + &
"End ~r~n" 
//added by gavins 08082016
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"  create procedure up_user_ctx_access_list ( @user_d varchar(50)  ) as~r~n" + &
" begin~r~n" + &
"   /*******initial #temp_ctx_user********/    ~r~n" + &
"  IF object_id('tempdb..#temp_ctx_user') is not null    ~r~n" + &
"  Begin    ~r~n" + &
"  ~tDrop TABLE #temp_ctx_user;    ~r~n" + &
"  End     ~r~n" + &
"        ~r~n" + &
"  /*********prepare #temp_ctx_user data********/    ~r~n" + &
"  SELECT ctx_contacts.user_d,ctx_contract_contacts.ctx_id into #temp_ctx_user    ~r~n" + &
"  FROM ctx_contract_contacts, ctx_contacts       ~r~n" + &
"  WHERE ctx_contacts.contact_id = ctx_contract_contacts.contact_id     ~r~n" + &
"  AND ctx_contract_contacts.ic_area = 'I'    ~r~n" + &
"  UNION         ~r~n" + &
"  SELECT security_group_users.user_id user_d,ctx_group_access.ctx_id    ~r~n" + &
"  FROM ctx_group_access,security_group_users,icred_settings     ~r~n" + &
"  WHERE icred_settings.group_access = 1     ~r~n" + &
"  AND ctx_group_access.group_id = security_group_users.group_id    ~r~n" + &
"      ~r~n" + &
"  /*********prepare #temp_right data********/    ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent  ctx_id = ctx_contract_contacts.ctx_id,     ~r~n" + &
"  ~t   access = (CASE ctx_contract_contacts.owner WHEN 'Y' THEN 'F' ELSE ctx_contract_contacts.access END)     ~r~n" + &
"  FROM ctx_contract_contacts Left Outer Join     ~r~n" + &
"  (     ~r~n" + &
"  Select ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d      ~r~n" + &
"  From ctx_contract_contacts ctx_contract_contacts1 ,ctx_contacts ctx_contacts1     ~r~n" + &
"  Where ctx_contract_contacts1.contact_id = ctx_contacts1.contact_id And ctx_contacts1.user_d = @user_d     ~r~n" + &
"  Group By ctx_contract_contacts1.ctx_id,ctx_contacts1.user_d     ~r~n" + &
"  Having Count(ctx_contract_contacts1.ctx_id) > 1     ~r~n" + &
"  ) ccc     ~r~n" + &
"  On ctx_contract_contacts.ctx_id = ccc.ctx_id     ~r~n" + &
"  ,ctx_contacts     ~r~n" + &
"  WHERE ctx_contacts.user_d = @user_d     ~r~n" + &
"  ~tAND (ccc.ctx_id is null or ctx_contract_contacts.access = 'F' )     ~r~n" + &
"  ~tAND ctx_contract_contacts.contact_id = ctx_contacts.contact_id      ~r~n" + &
"  ~tAND ( ctx_contract_contacts.access IN ('F','R')      ~r~n" + &
"  ~tOR ctx_contract_contacts.owner = 'Y' )     ~r~n" + &
"  ~tAND ctx_contract_contacts.ic_area = 'I'     ~r~n" + &
"  UNION      ~r~n" + &
"  SELECT DISTINCT TOP 100 Percent ctx_id = ctx_group_access.ctx_id,    ~r~n" + &
"  ~t   access =  ctx_group_access.access     ~r~n" + &
"  FROM  ctx_group_access ,security_group_users,icred_settings     ~r~n" + &
"  WHERE security_group_users.user_id = @user_d     ~r~n" + &
"     AND ctx_group_access.group_id = security_group_users.group_id     ~r~n" + &
"  ~tAND ctx_group_access.access =      ~r~n" + &
"  ~t~t(Case When Exists (Select u1.user_id,a1.ctx_id,a1.access      ~r~n" + &
"  ~t~tFrom ctx_group_access a1,security_group_users u1     ~r~n" + &
"  ~t~tWhere a1.group_id = u1.group_id      ~r~n" + &
"  ~t~tAnd a1.ctx_id = ctx_group_access.ctx_id     ~r~n" + &
"  ~t~tAnd u1.user_id = security_group_users.user_id~t     ~r~n" + &
"  ~t~tAnd a1.access = 'F') Then 'F' Else 'R' End)      ~r~n" + &
"  ~tAND icred_settings.group_access = 1     ~r~n" + &
"  ~tAND ctx_group_access.access in ('F','R')     ~r~n" + &
"  ~tAND NOT EXISTS~t(SELECT 1 FROM ctx_contract_contacts, ctx_contacts     ~r~n" + &
"  ~t~t~tWHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id )      ~r~n" + &
"  ~t~t~tAND ( ctx_contacts.user_d = security_group_users.user_id )     ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ic_area = 'I' )     ~r~n" + &
"  ~t~t~tAND ( ctx_contract_contacts.ctx_id = ctx_group_access.ctx_id )     ~r~n" + &
"  ~t~t~t)     ~r~n" + &
"  UNION     ~r~n" + &
" SELECT b.ctx_id,(CASE WHEN b.rcnt=0 THEN 'F' ELSE 'R' END) access     ~r~n" + &
" FROM    ~r~n" + &
" (    ~r~n" + &
" ~tSELECT DISTINCT a.ctx_id,a.user_id,    ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'F' THEN 1 ELSE 0 END) fcnt,    ~r~n" + &
" ~t~tSUM(CASE a.access WHEN 'R' THEN 1 ELSE 0 END) rcnt    ~r~n" + &
" ~tFROM     ~r~n" + &
" ~t(    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '11' THEN 'F' WHEN '12' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=1    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.category     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('11','12','13')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
"        union    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '61' THEN 'F' WHEN '62' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=6    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.dvision     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('61','62','63')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
"         union    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '71' THEN 'F' WHEN '72' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=7    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_department     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('71','72','73')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
" ~t~tunion    ~r~n" + &
" ~t~tSELECT DISTINCT TOP 100 Percent ctx_id = ctx_basic_info.ctx_id,     ~r~n" + &
"             ~t~t~tuser_id = security_users.user_id,    ~r~n" + &
"  ~t~t~t~t~taccess = (CASE ctx_acp_contract_management_right.rights WHEN '81' THEN 'F' WHEN '82' THEN 'R' ELSE 'N' END)     ~r~n" + &
" ~t~tFROM ctx_acp_contract_management_right, security_users, ctx_basic_info     ~r~n" + &
" ~t~tWHERE security_users.user_id = @user_d       ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.role_id = security_users.role_id     ~r~n" + &
"  ~t~tAnd ctx_basic_info.is_template = 0      ~r~n" + &
"  ~t~tAND ctx_acp_contract_management_right.types=8    ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.category = ctx_basic_info.contract_type     ~r~n" + &
"       ~tAND ctx_acp_contract_management_right.rights In ('81','82','83')     ~r~n" + &
"  ~t~tAND NOT EXISTS(select 1 from #temp_ctx_user where #temp_ctx_user.user_d = security_users.user_id and #temp_ctx_user.ctx_id = ctx_basic_info.ctx_id)    ~r~n" + &
" ~t) a    ~r~n" + &
" ~tGROUP BY a.ctx_id,a.user_id    ~r~n" + &
"    HAVING SUM(CASE a.access WHEN 'N' THEN 1 ELSE 0 END) = 0    ~r~n" + &
" ) b   ~r~n" + &
" end "

//Added By Jay 2017-02-23
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if object_id('sp_contract_search_2') is not null~r~n" + &
"Begin~r~n" + &
" drop procedure sp_contract_search_2;~r~n"  + &
"End ~r~n" 

//Added By Jay 2017-02-23
 is_sql_statements[upperbound(is_sql_statements) + 1] = of_ver150_get_sp_contract_search_2()



of_execute_sqls("of_ver150_release_storeprocedure9")
return 1
end function

public function string of_ver150_get_sp_contract_search_2 ();// Function: of_ver150_get_sp_contract_search_2
//--------------------------------------------------------------------
// Description: modify storeprocedure:sp_contract_search_2 for Task 543:Add the contract_contact_type field to the Search Criteria 
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	Gavin.Jay		Date: 2017-02-23
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string 	ls_sp_contract_search_2a, ls_sp_contract_search_2b, ls_sp_contract_search_2c

ls_sp_contract_search_2a =  &
"create procedure sp_contract_search_2~r~n" + &
"  @user_d VARCHAR(10), ~r~n" + &
"  @ctx_id int = NULL, ~r~n" + &
"  @category numeric(6, 0) = NULL,~r~n" + &
"  @status numeric(6, 0) = NULL,~r~n" + &
"  @contract_type numeric(6, 0) = NULL, ~r~n" + &
"  @contracted_entity numeric(8, 0) = NULL, ~r~n" + &
"  @group_id numeric(6, 0) = NULL,~r~n" + &
"  @product_type numeric(6, 0) = NULL, ~r~n" + &
"  @product_name varchar(150) = NULL, ~r~n" + &
"  @effective_date datetime = NULL,~r~n" + &
"  @effective_date2 datetime = NULL,~r~n" + &
"  @expriation_date datetime = NULL,            ~r~n" + &
"  @expriation_date2 datetime = NULL,            ~r~n" + &
"  @last_revis_date datetime = NULL,       ~r~n" + &
"  @last_revis_date_2 datetime = NULL,       ~r~n" + &
"  @review_date datetime = NULL,            ~r~n" + &
"  @review_date_2 datetime = NULL,            ~r~n" + &
"  @term_date datetime = NULL,            ~r~n" + &
"  @term_date_2 datetime = NULL,            ~r~n" + &
"  @version_date datetime = NULL,          ~r~n" + &
"  @version_date_2 datetime = NULL,          ~r~n" + &
"  @custom_date1 datetime = NULL, ~r~n" + &
"  @custom_date1_2 datetime = NULL, ~r~n" + &
"  @custom_date2 datetime = NULL, ~r~n" + &
"  @custom_date2_2 datetime = NULL, ~r~n" + &
"  @custom_1_style varchar(30) = NULL, @custom_2_style varchar(30) = NULL, @custom_3_style varchar(30) = NULL, @custom_4_style varchar(30) = NULL,~r~n" + &
"  @custom_1 varchar(255) = NULL, @custom_2 varchar(255) = NULL, @custom_3 varchar(255) = NULL, @custom_4 varchar(255) = NULL,~r~n" + &
"  @custom_n1 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n2 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n3 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n4 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n5 numeric(12,2) = NULL, ~r~n" + &
"  @custom_n6 numeric(12,2) = NULL, ~r~n" + &
"  @owner varchar(10) = NULL, ~r~n" + &
"  @dvision numeric(6, 0) = NULL,~r~n" + &
"  @ccci_name varchar(93) = NULL,~r~n" + &
"  @ccci_association varchar(100) = NULL,~r~n" + &
"  @ccci_contact_email varchar(50) = NULL,~r~n" + &
"  @ccci_custom_n1 numeric(12, 2) = NULL,~r~n" + &
"  @ccci_custom_1 varchar(255) = NULL,~r~n" + &
"  @occi_name varchar(93) = NULL,~r~n" + &
"  @occi_association varchar(100) = NULL,~r~n" + &
"  @occi_contact_email varchar(50) = NULL,~r~n" + &
"  @occi_custom_n1 numeric(12, 2) = NULL,~r~n" + &
"  @occi_custom_1 varchar(255) = NULL,~r~n" + &
"  /* Dynamic SQL additions from front end */~r~n" + &
"  @other_from_text varchar(1000) = '',~r~n" + &
"  @other_where_text varchar(2000) = '',~r~n" + &
"  /* 9.15.2016 - pagination */~r~n" + &
"  @check_rowcount_flag char(1) = 'N'~r~n" + &
"as~r~n" + &
"~r~n" + &
"/* Result set temp table */~r~n" + &
"create table #tmp_result ( app_facility numeric(10, 0), product_code numeric(6, 0), product_name varchar(1000), ~r~n" + &
"  effective_date datetime, expriation_date datetime, status numeric(6, 0), group_multi_loc_id numeric(6, 0), ~r~n" + &
"  ctx_id int, master_contract_id numeric(6, 0), master_cnt int, category numeric(6, 0), facility_id int, ~r~n" + &
"  contract_type numeric(6, 0), product_type varchar(1000), reimbursment_menth numeric(6, 0), file_location varchar(150), ~r~n" + &
"  review_date datetime, review_by varchar(10), term_date datetime, term_reason numeric(6, 0), last_revis_date datetime, ~r~n" + &
"  other_date_1 datetime, other_date_2 datetime, oc_signed_by varchar(75), oc_title numeric(6, 0), ~r~n" + &
"  oc_department numeric(6, 0), oc_legal_rep varchar(75), cc_signed_by varchar(75), cc_title varchar(75), ~r~n" + &
"  cc_department varchar(75), cc_legal_rep varchar(75), notes varchar(8000), keyword varchar(30), dvision numeric(6, 0), ~r~n" + &
"  custom_1 varchar(255), custom_2 varchar(255), custom_3 varchar(255), custom_4 varchar(255), custom_5 varchar(255), ~r~n" + &
"  custom_6 varchar(255), custom_7 varchar(255), custom_8 varchar(255), custom_9 varchar(255), custom_10 varchar(255), ~r~n" + &
"  group_id numeric(6, 0), revision_reason varchar(255), record_id numeric(10, 0), owner varchar(10), ~r~n" + &
"  contracted_entity numeric(8, 0), facility_name varchar(150), custom_date1 datetime, custom_date2 datetime, ~r~n" + &
"  custom_date3 datetime, custom_date4 datetime, custom_date5 datetime, inserted_by_user varchar(128), ~r~n" + &
"  inserted_at_date_time datetime, updated_by_user varchar(128), updated_at_date_time datetime, custom_11 varchar(255), ~r~n" + &
"  custom_12 varchar(255), custom_13 varchar(255), custom_14 varchar(255), custom_15 varchar(255), ~r~n" + &
"  custom_16 varchar(255), custom_17 varchar(255), custom_18 varchar(255), custom_19 varchar(255), ~r~n" + &
"  custom_20 varchar(255), custom_date6 datetime, custom_date7 datetime, custom_date8 datetime, custom_date9 datetime, ~r~n" + &
"  custom_date10 datetime, custom_date11 datetime, custom_date12 datetime, custom_date13 datetime, ~r~n" + &
"  custom_date14 datetime, custom_date15 datetime, custom_n1 numeric(12, 2), custom_n2 numeric(12, 2), ~r~n" + &
"  custom_n3 numeric(12, 2), custom_n4 numeric(12, 2), custom_n5 numeric(12, 2), custom_n6 numeric(12, 2), ~r~n" + &
"  custom_n7 numeric(12, 2), custom_n8 numeric(12, 2), custom_n9 numeric(12, 2), custom_n10 numeric(12, 2), ~r~n" + &
"  custom_n11 numeric(12, 2), custom_n12 numeric(12, 2), custom_n13 numeric(12, 2), custom_n14 numeric(12, 2), ~r~n" + &
"  custom_n15 numeric(12, 2), custom_n16 numeric(12, 2), custom_n17 numeric(12, 2), custom_n18 numeric(12, 2), ~r~n" + &
"  custom_n19 numeric(12, 2), custom_n20 numeric(12, 2), custom_n21 numeric(12, 2), custom_n22 numeric(12, 2), ~r~n" + &
"  custom_n23 numeric(12, 2), custom_n24 numeric(12, 2), custom_n25 numeric(12, 2), version_number varchar(15), ~r~n" + &
"  version_date datetime, master_contract_name varchar(255), fee_sched_calc_field_1 money, fee_sched_calc_field_2 money, ~r~n" + &
"  fee_sched_calc_field_3 money, access char(1), status_name varchar(30), category_name varchar(30), ~r~n" + &
"  contract_type_name varchar(30), dvision_name varchar(30), unread_email_cnt int, custom_percent_1 numeric(12, 4), ~r~n" + &
"  custom_percent_2 numeric(12, 4), custom_percent_3 numeric(12, 4), custom_percent_4 numeric(12, 4), ~r~n" + &
"  custom_percent_5 numeric(12, 4), custom_percent_6 numeric(12, 4), custom_percent_7 numeric(12, 4), ~r~n" + &
"  custom_percent_8 numeric(12, 4), custom_percent_9 numeric(12, 4), custom_percent_10 numeric(12, 4), ~r~n" + &
"  work_flow_n1 numeric(12, 2), work_flow_n2 numeric(12, 2), work_flow_n3 numeric(12, 2), work_flow_n4 numeric(12, 2), ~r~n" + &
"  work_flow_n5 numeric(12, 2), custom_status1 int, custom_status2 int, custom_21 varchar(255), custom_22 varchar(255), ~r~n" + &
"  custom_n26 numeric(12, 2), custom_n27 numeric(12, 2), custom_date16 datetime, custom_date17 datetime, city varchar(35), ~r~n" + &
"  state varchar(5), country numeric(8, 0), zip varchar(12), street varchar(150), custom2_custom_1 varchar(255), ~r~n" + &
"  custom2_custom_2 varchar(255), custom2_custom_3 varchar(255), custom2_custom_4 varchar(255), ~r~n" + &
"  custom2_custom_5 varchar(255), custom2_custom_6 varchar(255), custom2_custom_7 varchar(255), ~r~n" + &
"  custom2_custom_8 varchar(255), custom2_custom_9 varchar(255), custom2_custom_10 varchar(255), ~r~n" + &
"  custom2_custom_11 varchar(255), custom2_custom_12 varchar(255), custom2_custom_13 varchar(255), ~r~n" + &
"  custom2_custom_14 varchar(255), custom2_custom_15 varchar(255), custom2_custom_16 varchar(255), ~r~n" + &
"  custom2_custom_17 varchar(255), custom2_custom_18 varchar(255), custom2_custom_19 varchar(255), ~r~n" + &
"  custom2_custom_20 varchar(255), custom2_custom_date1 datetime, custom2_custom_date2 datetime, ~r~n" + &
"  custom2_custom_date3 datetime, custom2_custom_date4 datetime, custom2_custom_date5 datetime, ~r~n" + &
"  custom2_custom_date6 datetime, custom2_custom_date7 datetime, custom2_custom_date8 datetime, ~r~n" + &
"  custom2_custom_date9 datetime, custom2_custom_date10 datetime, custom2_custom_date11 datetime, ~r~n" + &
"  custom2_custom_date12 datetime, custom2_custom_date13 datetime, custom2_custom_date14 datetime, ~r~n" + &
"  custom2_custom_date15 datetime, custom2_custom_n1 numeric(12, 2), custom2_custom_n2 numeric(12, 2), ~r~n" + &
"  custom2_custom_n3 numeric(12, 2), custom2_custom_n4 numeric(12, 2), custom2_custom_n5 numeric(12, 2), ~r~n" + &
"  custom2_custom_n6 numeric(12, 2), custom2_custom_n7 numeric(12, 2), custom2_custom_n8 numeric(12, 2), ~r~n" + &
"  custom2_custom_n9 numeric(12, 2), custom2_custom_n10 numeric(12, 2), custom2_custom_n11 numeric(12, 2), ~r~n" + &
"  custom2_custom_n12 numeric(12, 2), custom2_custom_n13 numeric(12, 2), custom2_custom_n14 numeric(12, 2), ~r~n" + &
"  custom2_custom_n15 numeric(12, 2), custom2_custom_n16 numeric(12, 2), custom2_custom_n17 numeric(12, 2), ~r~n" + &
"  custom2_custom_n18 numeric(12, 2), custom2_custom_n19 numeric(12, 2), custom2_custom_n20 numeric(12, 2), ~r~n" + &
"  custom2_custom_n21 numeric(12, 2), custom2_custom_n22 numeric(12, 2), custom2_custom_n23 numeric(12, 2), ~r~n" + &
"  custom2_custom_n24 numeric(12, 2), custom2_custom_n25 numeric(12, 2), custom2_custom_21 varchar(255), ~r~n" + &
"  custom2_custom_22 varchar(255), custom2_custom_notes_1 varchar(8000), custom2_custom_notes_2 varchar(8000), ~r~n" + &
"  custom2_custom_notes_3 varchar(8000), custom2_custom_notes_4 varchar(8000), custom2_custom_notes_5 varchar(8000), ~r~n" + &
"  custom2_custom_money_1 money, custom2_custom_money_2 money, custom2_custom_money_3 money, ~r~n" + &
"  custom2_custom_percent_1 numeric(12, 4), custom2_custom_percent_2 numeric(12, 4), ~r~n" + &
"  custom2_custom_percent_3 numeric(12, 4), custom2_custom_percent_4 numeric(12, 4), ~r~n" + &
"  custom2_custom_percent_5 numeric(12, 4), custom2_custom_percent_6 numeric(12, 4), ~r~n" + &
"  custom2_custom_percent_7 numeric(12, 4), custom2_custom_percent_8 numeric(12, 4), ~r~n" + &
"  custom2_custom_percent_9 numeric(12, 4), custom2_custom_percent_10 numeric(12, 4), ~r~n" + &
"  has_docs int, contract_department numeric(6, 0), occi_name varchar(100), ccci_name varchar(100)  ~r~n" + &
")~r~n" + &
"~r~n" 

ls_sp_contract_search_2b = +&
"/* Temp table for master rows */~r~n" + &
"create table #tmp_ctx ( ctx_id int, is_template int )~r~n" + &
"/* ~"owner~" */~r~n" + &
"create table #tmp_owner ( ctx_id int, owner_user_d varchar(10)   )~r~n" + &
"create index xietmp_owner on #tmp_owner ( ctx_id )~r~n" + &
"/* When filtering by contact */~r~n" + &
"create table #tmp_contact ( ctx_id int, contact_id int, ic_area char(1), name varchar(100)  )~r~n" + &
"/* Master count */~r~n" + &
"create table #tmp_master_count ( ctx_id int, master_count int )~r~n" + &
"create unique index xak1tmp_master_count on #tmp_master_count ( ctx_id )~r~n" + &
"/* contracted_entity */~r~n" + &
"create table #tmp_contracted_entity ( ctx_id int, rec_id numeric(8, 0) )~r~n" + &
"create unique index xak1tmp_contracted_entity on #tmp_contracted_entity ( ctx_id )~r~n" + &
"/* for backward compatability, column name = ~"has_docs~" */~r~n" + &
"create table #tmp_doc_count ( ctx_id int, has_docs int )~r~n" + &
"create unique index xak1tmp_doc_count on #tmp_doc_count (ctx_id )~r~n" + &
"~r~n" + &
"  DECLARE @filter_by_contact int~r~n" + &
"  DECLARE @display_multi_products VARCHAR(10)     ~r~n" + &
"  DECLARE @sql_text varchar(5000),~r~n" + &
"    @sql_text2 varchar(5000), ~r~n" + &
"    @sql_dynamic_where varchar(2000),~r~n" + &
"    @sql_dynamic_from varchar(1000)~r~n" + &
"~r~n" + &
"/* Determine whether to display multiple products */~r~n" + &
"  SELECT~r~n" + &
"    @display_multi_products = option_value~r~n" + &
"  FROM~r~n" + &
"    security_user_options~r~n" + &
"  WHERE ~r~n" + &
"    ( user_id = @user_d ) and ~r~n" + &
"    ( option_name = 'display_multi_product' )~r~n" + &
"~r~n" + &
"  if (@display_multi_products is null) SELECT @display_multi_products = '1'~r~n" + &
"/*~r~n" + &
"  Pre-process datetime parameters:~r~n" + &
"   - set ~"minimum~" dates to midnight of same day~r~n" + &
"   - set ~"maximum~" dates to midnight of following day~r~n" + &
"*/~r~n" + &
"  SELECT @effective_date = CAST (floor(CAST(@effective_date as float)) as datetime)~r~n" + &
"  SELECT @effective_date2 = CAST (floor(CAST(@effective_date2 as float)) as datetime)~r~n" + &
"  SELECT @effective_date2 = dateadd(day, 1, @effective_date2)~r~n" + &
"  SELECT @expriation_date = CAST (floor(CAST(@expriation_date as float)) as datetime)~r~n" + &
"  SELECT @expriation_date2 = CAST (floor(CAST(@expriation_date2 as float)) as datetime)~r~n" + &
"  SELECT @expriation_date2 = dateadd(day, 1, @expriation_date2)~r~n" + &
"  SELECT @last_revis_date = CAST (floor(CAST(@last_revis_date as float)) as datetime)~r~n" + &
"  SELECT @last_revis_date_2 = CAST (floor(CAST(@last_revis_date_2 as float)) as datetime)~r~n" + &
"  SELECT @last_revis_date_2 = dateadd(day, 1, @last_revis_date_2)~r~n" + &
"  SELECT @review_date = CAST (floor(CAST(@review_date as float)) as datetime)~r~n" + &
"  SELECT @review_date_2 = CAST (floor(CAST(@review_date_2 as float)) as datetime)~r~n" + &
"  SELECT @review_date_2 = dateadd(day, 1, @review_date_2)~r~n" + &
"  SELECT @term_date = CAST (floor(CAST(@term_date as float)) as datetime)~r~n" + &
"  SELECT @term_date_2 = CAST (floor(CAST(@term_date_2 as float)) as datetime)~r~n" + &
"  SELECT @term_date_2 = dateadd(day, 1, @term_date_2)~r~n" + &
"  SELECT @version_date = CAST (floor(CAST(@version_date as float)) as datetime)~r~n" + &
"  SELECT @version_date_2 = CAST (floor(CAST(@version_date_2 as float)) as datetime)~r~n" + &
"  SELECT @version_date_2 = dateadd(day, 1, @version_date_2)~r~n" + &
"  SELECT @custom_date1 = CAST (floor(CAST(@custom_date1 as float)) as datetime)~r~n" + &
"  SELECT @custom_date1_2 = CAST (floor(CAST(@custom_date1_2 as float)) as datetime)~r~n" + &
"  SELECT @custom_date1_2 = dateadd(day, 1, @custom_date1_2)~r~n" + &
"  SELECT @custom_date2 = CAST (floor(CAST(@custom_date2 as float)) as datetime)~r~n" + &
"  SELECT @custom_date2_2 = CAST (floor(CAST(@custom_date2_2 as float)) as datetime)~r~n" + &
"  SELECT @custom_date2_2 = dateadd(day, 1, @custom_date2_2)~r~n" + &
"~r~n" + &
"/*----------------------------------------------------------------------------------------*/~r~n" + &
"/* Dynamic portion of the query */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_where = ' AND~r~n" + &
"    ( ctx_basic_info.is_template = 0 )'~r~n" + &
"  +  CASE WHEN @ctx_id IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.ctx_id = ' + convert(varchar, @ctx_id) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @category IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.category = ' + convert(varchar, @category) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @status IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.status = ' + convert(varchar, @status) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @contract_type IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.contract_type = ' + convert(varchar, @contract_type) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @contracted_entity IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_loc.ctx_id = ctx_basic_info.ctx_id ) AND~r~n" + &
"    ( ctx_loc.loc_id = 0 ) AND~r~n" + &
"    ( group_multi_loc.rec_id = ctx_loc.parent_comp_id )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN (@product_type IS NULL) AND (ltrim(rtrim(isNull(@product_name, ''))) = '') THEN '' ELSE ' AND~r~n" + &
"    ( ctx_products.ctx_id = ctx_basic_info.ctx_id )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @product_type IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_products.product_type = ' + convert(varchar, @product_type) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@product_name, ''))) = '' THEN '' ELSE ' AND~r~n" + &
"    ( ctx_products.product_id = ''' + @product_name + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @group_id IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.group_id = ' + convert(varchar, @group_id) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @effective_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.effective_date >= ''' + convert(varchar, @effective_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @effective_date2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.effective_date < ''' + convert(varchar, @effective_date2) + ''' )'~r~n" + &
"  END~r~n" + &
"  + CASE WHEN @expriation_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.expriation_date >= ''' + convert(varchar, @expriation_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @expriation_date2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.expriation_date < ''' + convert(varchar, @expriation_date2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @last_revis_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.last_revis_date >= ''' + convert(varchar, @last_revis_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @last_revis_date_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.last_revis_date < ''' + convert(varchar, @last_revis_date_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @review_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.review_date >= ''' + convert(varchar, @review_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @review_date_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.review_date < ''' + convert(varchar, @review_date_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @term_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.term_date >= ''' + convert(varchar, @term_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @term_date_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.term_date < ''' + convert(varchar, @term_date_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @version_date IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.version_date >= ''' + convert(varchar, @version_date) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @version_date_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.version_date < ''' + convert(varchar, @version_date_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_date1 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.custom_date1 >= ''' + convert(varchar, @custom_date1) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_date1_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.custom_date1 < ''' + convert(varchar, @custom_date1_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_date2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.custom_date2 >= ''' + convert(varchar, @custom_date2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_date2_2 IS NULL THEN '' ELSE ' AND ~r~n" + &
"    ( ctx_basic_info.custom_date2 < ''' + convert(varchar, @custom_date2_2) + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@custom_1, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_1_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_basic_info.custom_1 = ''' + @custom_1 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_1 LIKE ''%' + @custom_1 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@custom_2, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_2_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_basic_info.custom_2 = ''' + @custom_2 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_2 LIKE ''%' + @custom_2 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@custom_3, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_3_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_basic_info.custom_3 = ''' + @custom_3 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_3 LIKE ''%' + @custom_3 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@custom_4, ''))) = '' THEN '' ELSE~r~n" + &
"    CASE WHEN ltrim(rtrim(isNull(@custom_4_style, ''))) = 'dddw' THEN ' AND~r~n" + &
"    ( ctx_basic_info.custom_4 = ''' + @custom_4 + ''' )'~r~n" + &
"      ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_4 LIKE ''%' + @custom_4 + '%'' )'~r~n" + &
"    END~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n1 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n1 = ' + convert(varchar, @custom_n1) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n2 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n2 = ' + convert(varchar, @custom_n2) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n3 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n3 = ' + convert(varchar, @custom_n3) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n4 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n4 = ' + convert(varchar, @custom_n4) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n5 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n5 = ' + convert(varchar, @custom_n5) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @custom_n6 IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.custom_n6 = ' + convert(varchar, @custom_n6) + ' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @dvision IS NULL THEN '' ELSE ' AND~r~n" + &
"    ( ctx_basic_info.dvision = ' + convert(varchar, @dvision) + ' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"  +  @other_where_text~r~n" + &
"~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_from = ''  +~r~n" + &
"  CASE WHEN @contracted_entity IS NULL THEN '' ELSE ',  ctx_loc,    group_multi_loc'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN (@product_type IS NULL) AND (ltrim(rtrim(isNull(@product_name, ''))) = '') THEN '' ELSE ',  ctx_products'~r~n" + &
"  END  +  @other_from_text~r~n" 

ls_sp_contract_search_2c = + &
"/*-----------------------------------------------------------------------------------------------------------*/~r~n" + &
"/* Owner */~r~n" + &
"  /* Filter by owner */~r~n" + &
"  SELECT~r~n" + &
"    @sql_text = '  INSERT #tmp_owner  SELECT~r~n" + &
"    ctx_basic_info.ctx_id,~r~n" + &
"    min(ctx_contacts.user_d)~r~n" + &
"  FROM~r~n" + &
"    ctx_basic_info,~r~n" + &
"    ctx_contacts,~r~n" + &
"    ctx_contract_contacts'~r~n" + &
"  +   @sql_dynamic_from  +~r~n" + &
"'  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) AND~r~n" + &
"    ( ctx_contract_contacts.owner = ''Y'' ) AND~r~n" + &
"    ( ctx_contract_contacts.ic_area = ''I'' ) AND~r~n" + &
"    ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) '~r~n" + &
"  +  CASE WHEN ltrim(rtrim(isNull(@owner, ''))) = '' THEN '' ELSE ' AND~r~n" + &
"    ( ctx_contacts.user_d = ''' + @owner + ''' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"  +  @sql_dynamic_where  +~r~n" + &
"'  GROUP BY~r~n" + &
"    ctx_basic_info.ctx_id'~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text)~r~n" + &
"~r~n" + &
"  /* #tmp_owner is now populated */~r~n" + &
"~r~n" + &
"IF ltrim(rtrim(isNull(@owner, ''))) <> ''~r~n" + &
"BEGIN~r~n" + &
"  /* Append to @sql_dynamic_from */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_from = @sql_dynamic_from + ',   #tmp_owner'~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_where */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_where = @sql_dynamic_where + ' AND    ( #tmp_owner.ctx_id = ctx_basic_info.ctx_id )'~r~n" + &
"END~r~n" + &
"/* Owner */~r~n" + &
"/*-------------------------------------------------------------------------------------------------------------------------*/~r~n" + &
"/* Filter by contact */~r~n" + &
"/* ic_area = 'E' */~r~n" + &
"  SELECT~r~n" + &
"    @ccci_name = ltrim(rtrim(isNull(@ccci_name, ''))),~r~n" + &
"    @ccci_association = ltrim(rtrim(isNull(@ccci_association,''))),~r~n" + &
"    @ccci_contact_email = ltrim(rtrim(isNull(@ccci_contact_email,''))),~r~n" + &
"    @ccci_custom_1 = ltrim(rtrim(isNull(@ccci_custom_1,''))),~r~n" + &
"/* ic_area = 'I' */~r~n" + &
"    @occi_name = ltrim(rtrim(isNull(@occi_name,''))),~r~n" + &
"    @occi_association = ltrim(rtrim(isNull(@occi_association,''))),~r~n" + &
"    @occi_contact_email = ltrim(rtrim(isNull(@occi_contact_email,''))),~r~n" + &
"    @occi_custom_1 = ltrim(rtrim(isNull(@occi_custom_1,'')))~r~n" + &
"  /* Base query for contacts */~r~n" + &
"/*~r~n" + &
"  RP 8.12.2016 - refer to Bug2016080309: original query limits to those contacts which have an email address defined.~r~n" + &
"  Comment out the joins to tables code_lookup and ctx_contacts_numbers~r~n" + &
"*/~r~n" + &
"  SELECT @sql_text = '  INSERT #tmp_contact~r~n" + &
"  SELECT~r~n" + &
"    ctx_contract_contacts.ctx_id,~r~n" + &
"    ctx_contract_contacts.contact_id,~r~n" + &
"    ctx_contract_contacts.ic_area,~r~n" + &
"    ctx_contacts.last_name + '',''  + ctx_contacts.first_name + ''''+ isnull(ctx_contacts.middle_name,'''') +'' '' + ctx_contacts.first_name + '' ''  + ctx_contacts.last_name + '' ''+ isnull(ctx_contacts.middle_name,'''') ~r~n" + &
"  FROM~r~n" + &
"    ctx_basic_info, ~r~n" + &
"    ctx_contract_contacts,~r~n" + &
"    ctx_contacts'~r~n" + &
"  +  @sql_dynamic_from  +~r~n" + &
"'  WHERE~r~n" + &
"    ( ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) and ~r~n" + &
"    ( ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) and~r~n" + &
"    ( ctx_contacts.facility_id > 0 )'~r~n" + &
"  +  @sql_dynamic_where~r~n" + &
"~r~n" + &
"/* ic_area = 'E' */~r~n" + &
"IF (@ccci_name = '') AND (@ccci_association = '') AND (@ccci_contact_email = '') AND (@ccci_custom_n1 IS NULL) AND (@ccci_custom_1 = '')~r~n" + &
"BEGIN~r~n" + &
"  /* Do nothing */~r~n" + &
"  SELECT @filter_by_contact = 0~r~n" + &
"END ELSE BEGIN~r~n" + &
"  SELECT @filter_by_contact = 1~r~n" + &
"~r~n" + &
"  SELECT @sql_text2 = @sql_text + ' and    ( ctx_contract_contacts.ic_area = ''E'' )'~r~n" + &
"  +  CASE WHEN @ccci_association = '' THEN '' ELSE ' and~r~n" + &
"    ( ctx_contract_contacts.association = ''' + @ccci_association + ''' )'~r~n" + &
"  END~r~n" + &
"  +  CASE WHEN @ccci_contact_email = '' THEN '' ELSE ' and   ( ctx_contacts.contact_id = ( SELECT distinct ctx_contacts_numbers.contact_id FROM  ~r~n" + &
"       ctx_contacts_numbers ~r~n" + &
"	 WHERE ctx_contacts.contact_id = ctx_contacts_numbers.contact_id 	 ~r~n" + &
"	and ctx_contacts_numbers.contact_email LIKE ''%'+ @ccci_contact_email +'%'' and ~r~n" + &
"	ctx_contacts_numbers.via = (select top 1 lookup_code from code_lookup where ~r~n" + &
"	lookup_name = ''Contract Contact Via'' and lower(code) = ''email'' ))) '~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @ccci_custom_1 = '' THEN '' ELSE ' and    ( ctx_contract_contacts.custom_1 = ''' + @ccci_custom_1 + ''' )'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @ccci_custom_n1 IS NULL THEN '' ELSE ' and    ( ctx_contract_contacts.custom_n1 = ' + convert(varchar, @ccci_custom_n1) + ' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text2)~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_from */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_from = @sql_dynamic_from + ',    #tmp_contact contact_e'~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_where */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_where = @sql_dynamic_where + ' and  ( contact_e.ctx_id = ctx_basic_info.ctx_id ) and    ( contact_e.ic_area = ''E'' )'~r~n" + &
"  +  CASE WHEN @ccci_name = '' THEN '' ELSE ' and   ( contact_e.name LIKE ''%' + @ccci_name + '%'' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"END~r~n" + &
"~r~n" + &
"/* ic_area = 'I' */~r~n" + &
"IF (@occi_name = '') AND (@occi_association = '') AND (@occi_contact_email = '') AND (@occi_custom_n1 IS NULL) AND (@occi_custom_1 = '')~r~n" + &
"BEGIN~r~n" + &
"  /* Do nothing */~r~n" + &
"  SELECT @filter_by_contact = @filter_by_contact~r~n" + &
"END ELSE BEGIN~r~n" + &
"  SELECT @filter_by_contact = 1~r~n" + &
"~r~n" + &
"  SELECT @sql_text2 = @sql_text + ' and    ( ctx_contract_contacts.ic_area = ''I'' )'~r~n" + &
"  +~r~n" + &
"  CASE WHEN @occi_association = '' THEN '' ELSE ' and    ( ctx_contract_contacts.association = ''' + @occi_association + ''' )'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @occi_contact_email = '' THEN '' ELSE ' and   ( ctx_contacts.contact_id = ( SELECT distinct ctx_contacts_numbers.contact_id FROM  ~r~n" + &
"       ctx_contacts_numbers ~r~n" + &
"	 WHERE ctx_contacts.contact_id = ctx_contacts_numbers.contact_id 	 ~r~n" + &
"	and ctx_contacts_numbers.contact_email LIKE ''%'+ @occi_contact_email +'%'' and ~r~n" + &
"	ctx_contacts_numbers.via = (select top 1 lookup_code from code_lookup where ~r~n" + &
"	lookup_name = ''Contract Contact Via'' and lower(code) = ''email'' ))) '~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @occi_custom_1 = '' THEN '' ELSE ' and    ( ctx_contract_contacts.custom_1 = ''' + @occi_custom_1 + ''' )'~r~n" + &
"  END  +~r~n" + &
"  CASE WHEN @occi_custom_n1 IS NULL THEN '' ELSE ' and    ( ctx_contract_contacts.custom_n1 = ' + convert(varchar, @occi_custom_n1) + ' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text2)~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_from */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_from = @sql_dynamic_from + ',    #tmp_contact contact_i'~r~n" + &
"~r~n" + &
"  /* Append to @sql_dynamic_where */~r~n" + &
"  SELECT~r~n" + &
"    @sql_dynamic_where = @sql_dynamic_where + ' and    ( contact_i.ctx_id = ctx_basic_info.ctx_id ) and    ( contact_i.ic_area = ''I'' )'~r~n" + &
"  +  CASE WHEN @occi_name = '' THEN '' ELSE ' and    ( contact_i.name LIKE ''%' + @occi_name + '%'' )'~r~n" + &
"  END~r~n" + &
"~r~n" + &
"END~r~n" + &
"~r~n" + &
"/* End filter by contact */~r~n" + &
"/*-------------------------------------------------------------------------------------------------------------------------*/~r~n" + &
"~r~n" + &
"/* Main query */~r~n" + &
"  SELECT~r~n" + &
"    @sql_text = '  INSERT~r~n" + &
"    #tmp_ctx~r~n" + &
"  SELECT DISTINCT~r~n" + &
"    ctx_basic_info.ctx_id,~r~n" + &
"    ctx_basic_info.is_template~r~n" + &
"  FROM~r~n" + &
"    ctx_basic_info left join ctx_contract_contacts on ctx_contract_contacts.ctx_id =ctx_basic_info.ctx_id~r~n" + &
"~tleft join ctx_contacts on ctx_contract_contacts.contact_id = ctx_contacts.contact_id'~r~n" + &
"  +  @sql_dynamic_from  + '  WHERE~r~n" + &
"    ( ctx_basic_info.ctx_id > 0 )'~r~n" + &
"  +  @sql_dynamic_where~r~n" + &
"~r~n" + &
"  EXECUTE (@sql_text)~r~n" + &
"~r~n" + &
"  /* #tmp_ctx is now populated */~r~n" + &
"~r~n" + &
"  /* Determine master count per selected ctx_id */~r~n" + &
"  INSERT #tmp_master_count~r~n" + &
"  SELECT~r~n" + &
"    #tmp_ctx.ctx_id, ~r~n" + &
"    count(ctx_basic_info.ctx_id)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx,~r~n" + &
"    ctx_basic_info~r~n" + &
"  WHERE~r~n" + &
"    ( #tmp_ctx.is_template = 0 ) AND~r~n" + &
"    ( ctx_basic_info.master_contract_id = #tmp_ctx.ctx_id )~r~n" + &
"  GROUP BY~r~n" + &
"    #tmp_ctx.ctx_id ~r~n" + &
"~r~n" + &
"  /* Determine contracted entity per selected ctx_id */~r~n" + &
"  INSERT #tmp_contracted_entity~r~n" + &
"  SELECT~r~n" + &
"    #tmp_ctx.ctx_id,~r~n" + &
"    min(group_multi_loc.rec_id)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx,~r~n" + &
"    ctx_loc,~r~n" + &
"    group_multi_loc~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_loc.ctx_id = #tmp_ctx.ctx_id ) and~r~n" + &
"    ( ctx_loc.loc_id = 0 ) and ~r~n" + &
"    ( group_multi_loc.rec_id = ctx_loc.parent_comp_id )~r~n" + &
"  GROUP BY~r~n" + &
"    #tmp_ctx.ctx_id~r~n" + &
"~r~n" + &
"/* Determine document count */~r~n" + &
"  INSERT #tmp_doc_count~r~n" + &
"  SELECT~r~n" + &
"    ctx_am_document.ctx_id,~r~n" + &
"    count(DISTINCT ctx_am_document.doc_id)~r~n" + &
"  FROM~r~n" + &
"    #tmp_ctx,~r~n" + &
"    ctx_am_document~r~n" + &
"  WHERE~r~n" + &
"    ( ctx_am_document.ctx_id = #tmp_ctx.ctx_id )~r~n" + &
"  GROUP BY~r~n" + &
"    ctx_am_document.ctx_id~r~n" + &
"~r~n" + &
"/*--------------------------------------------------------------------------------------------------------------------------------------------*/~r~n" + &
"/*~r~n" + &
"  <RP> note: Preserve logic from original sp_contract_search, but limit each query to the filtered list of ctx_id values~r~n" + &
"  in table #tmp_ctx~r~n" + &
"*/~r~n" + &
"create table #temp_ctx_user ( user_d varchar(10) collate SQL_Latin1_General_CP1_CI_AS, ctx_id int )~r~n" + &
"create table #temp_right ( ctx_id int, user_d varchar(10) collate SQL_Latin1_General_CP1_CI_AS, access char(1) )~r~n" + &
"~r~n" + &
"/*****************************************************************************/~r~n" + &
"/* Build concatenated contact and product lists */~r~n" + &
"/* ccci name */~r~n" + &
"create table #tmp_ctx_ccci ( ctx_id int, name varchar(100) )~r~n" + &
"create table #tmp_ctx_ccci2 ( ctx_id int, ccci_name varchar(100) )~r~n" + &
"create unique index xak1tmp_ctx_ccci2 on #tmp_ctx_ccci2 ( ctx_id )~r~n" + &
"~r~n" + &
"/* occi name */~r~n" + &
"create table #tmp_ctx_occi ( ctx_id int, name varchar(100) )~r~n" + &
"create table #tmp_ctx_occi2 ( ctx_id int, occi_name varchar(100) )~r~n" + &
"create unique index xak1tmp_ctx_occi2 on #tmp_ctx_occi2 ( ctx_id )~r~n" + &
"~r~n" + &
"/* product name */~r~n" + &
"create table #tmp_ctx_products ( ctx_id int, product_id numeric(6, 0), product_type numeric(6, 0), product_name varchar(1000), product_type_name varchar(1000) )~r~n" + &
"create table #tmp_ctx_products2 ( ctx_id int, product_id numeric(6, 0), product_name varchar(1000), product_type_name varchar(1000) )~r~n" + &
"create unique index xak1tmp_ctx_products2 on #tmp_ctx_products2 ( ctx_id )~r~n" + &
"~r~n" + &
"/* RP 8.5.2016: Move statements to procedure usp_contract_search_2, to overcome Appeon limitation of 1000 lines in source file. */~r~n" + &
"~r~n" + &
"  EXEC sp_contract_search_2_result @user_d, @product_type, @product_name, @display_multi_products, @check_rowcount_flag~r~n" + &
"~r~n" + &
"/* Result set */~r~n" + &
"  SELECT~r~n" + &
"    app_facility,     product_code,     product_name,     effective_date,     expriation_date,     status, ~r~n" + &
"    group_multi_loc_id,     ctx_id,     master_contract_id,     master_cnt,     category,     facility_id, ~r~n" + &
"    contract_type,     product_type,     reimbursment_menth,     file_location,     review_date,     review_by, ~r~n" + &
"    term_date,     term_reason,     last_revis_date,     other_date_1,     other_date_2,     oc_signed_by, ~r~n" + &
"    oc_title,     oc_department,     oc_legal_rep,     cc_signed_by,     cc_title,     cc_department,     cc_legal_rep, ~r~n" + &
"    notes,     keyword,     dvision,     custom_1,     custom_2,     custom_3,     custom_4,     custom_5, ~r~n" + &
"    custom_6,     custom_7,     custom_8,     custom_9,     custom_10,     group_id,     revision_reason,     record_id, ~r~n" + &
"    owner,     contracted_entity,     facility_name,     custom_date1,     custom_date2,     custom_date3,     custom_date4, ~r~n" + &
"    custom_date5,     inserted_by_user,     inserted_at_date_time,     updated_by_user,     updated_at_date_time, ~r~n" + &
"    custom_11,     custom_12,     custom_13,     custom_14,     custom_15,     custom_16,     custom_17,     custom_18, ~r~n" + &
"    custom_19,     custom_20,     custom_date6,     custom_date7,     custom_date8,     custom_date9,     custom_date10, ~r~n" + &
"    custom_date11,     custom_date12,     custom_date13,     custom_date14,     custom_date15,     custom_n1,     custom_n2, ~r~n" + &
"    custom_n3,     custom_n4,     custom_n5,     custom_n6,     custom_n7,     custom_n8,     custom_n9,     custom_n10, ~r~n" + &
"    custom_n11,     custom_n12,     custom_n13,     custom_n14,     custom_n15,     custom_n16,     custom_n17,     custom_n18, ~r~n" + &
"    custom_n19,     custom_n20,     custom_n21,     custom_n22,     custom_n23,     custom_n24,     custom_n25,     version_number, ~r~n" + &
"    version_date,     master_contract_name,     fee_sched_calc_field_1,     fee_sched_calc_field_2,     fee_sched_calc_field_3, ~r~n" + &
"    access,     status_name,     category_name,     contract_type_name,     dvision_name,     unread_email_cnt, ~r~n" + &
"    custom_percent_1,     custom_percent_2,     custom_percent_3,     custom_percent_4,     custom_percent_5, ~r~n" + &
"    custom_percent_6,     custom_percent_7,     custom_percent_8,     custom_percent_9,     custom_percent_10, ~r~n" + &
"    work_flow_n1,     work_flow_n2,     work_flow_n3,     work_flow_n4,     work_flow_n5,     custom_status1,     custom_status2, ~r~n" + &
"    custom_21,     custom_22,     custom_n26,     custom_n27,     custom_date16,     custom_date17,     city,     state, ~r~n" + &
"    country,     zip,     street,     custom2_custom_1,     custom2_custom_2,     custom2_custom_3,     custom2_custom_4, ~r~n" + &
"    custom2_custom_5,     custom2_custom_6,     custom2_custom_7,     custom2_custom_8,     custom2_custom_9,     custom2_custom_10, ~r~n" + &
"    custom2_custom_11,     custom2_custom_12,     custom2_custom_13,     custom2_custom_14,     custom2_custom_15, ~r~n" + &
"    custom2_custom_16,     custom2_custom_17,     custom2_custom_18,     custom2_custom_19,     custom2_custom_20, ~r~n" + &
"    custom2_custom_date1,     custom2_custom_date2,     custom2_custom_date3,     custom2_custom_date4,     custom2_custom_date5, ~r~n" + &
"    custom2_custom_date6,     custom2_custom_date7,     custom2_custom_date8,     custom2_custom_date9,     custom2_custom_date10, ~r~n" + &
"    custom2_custom_date11,     custom2_custom_date12,     custom2_custom_date13,     custom2_custom_date14,     custom2_custom_date15, ~r~n" + &
"    custom2_custom_n1,     custom2_custom_n2,     custom2_custom_n3,     custom2_custom_n4,     custom2_custom_n5,     custom2_custom_n6, ~r~n" + &
"    custom2_custom_n7,     custom2_custom_n8,     custom2_custom_n9,     custom2_custom_n10,     custom2_custom_n11,     custom2_custom_n12, ~r~n" + &
"    custom2_custom_n13,     custom2_custom_n14,     custom2_custom_n15,     custom2_custom_n16,     custom2_custom_n17,     custom2_custom_n18, ~r~n" + &
"    custom2_custom_n19,     custom2_custom_n20,     custom2_custom_n21,     custom2_custom_n22,     custom2_custom_n23,     custom2_custom_n24, ~r~n" + &
"    custom2_custom_n25,     custom2_custom_21,     custom2_custom_22,     custom2_custom_notes_1,     custom2_custom_notes_2, ~r~n" + &
"    custom2_custom_notes_3,     custom2_custom_notes_4,     custom2_custom_notes_5,     custom2_custom_money_1,     custom2_custom_money_2, ~r~n" + &
"    custom2_custom_money_3,     custom2_custom_percent_1,     custom2_custom_percent_2,     custom2_custom_percent_3,     custom2_custom_percent_4, ~r~n" + &
"    custom2_custom_percent_5,     custom2_custom_percent_6,     custom2_custom_percent_7,     custom2_custom_percent_8,     custom2_custom_percent_9, ~r~n" + &
"    custom2_custom_percent_10,     has_docs,     contract_department,     occi_name,     ccci_name~r~n" + &
"  FROM~r~n" + &
"    #tmp_result~r~n" + &
"  ORDER BY~r~n" + &
"    master_contract_id Asc,~r~n" + &
"    ctx_id  Asc~r~n"


Return ls_sp_contract_search_2a + ls_sp_contract_search_2b + ls_sp_contract_search_2c

end function

public function integer of_ver150_release_table2 ();//Added By Ken.Guo 2017-06-20
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='esign_website' and t.name='personal_license_setting'~tand t.type = 'U')~r~n" + &
"	Alter table personal_license_setting add esign_website varchar(255) null~r~n"

//Added By Harry 2017-07-13
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='comments' and t.name='ctx_am_document'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_am_document add  comments VARCHAR(8000) null~r~n"

//Added By Harry 2017-07-14
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='comments_temp' and t.name='ctx_am_document'~tand t.type = 'U')~r~n" + &
"	Alter table ctx_am_document add  comments_temp VARCHAR(8000) null~r~n"

//Added By Ken.Guo 2017-07-17 
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='sync_category' and t.name='import_hdr'~tand t.type = 'U')~r~n" + &
"	Alter table import_hdr add  sync_category VARCHAR(8000) null~r~n"

//Added By Ken.Guo 2017-08-10
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='esign_restapi' and t.name='personal_license_setting'~tand t.type = 'U')~r~n" + &
"	Alter table personal_license_setting add esign_restapi varchar(255) null~r~n"

//Added By Ken.Guo 2017-08-18
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='encrypt_esign_pwd' and t.name='icred_settings'~tand t.type = 'U')~r~n" + &
"	Alter table icred_settings add encrypt_esign_pwd integer null~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from syscolumns c, sysobjects t ~r~n" + &
"	where c.id=t.id  and c.name='encrypt_esign_pwd' and t.name='personal_license_setting'~tand t.type = 'U')~r~n" + &
"	Alter table personal_license_setting add encrypt_esign_pwd integer null~r~n"



of_execute_sqls("of_ver150_release_table2")

Return 1
end function

on n_cst_update_sql.create
call super::create
end on

on n_cst_update_sql.destroy
call super::destroy
end on

event constructor;call super::constructor;//by Alfee 01.30.2008
if not isvalid(inv_sql140) then inv_sql140 = Create n_cst_update_sql_v140				//Added By Mark Lee 12/22/2015
end event

event destructor;call super::destructor;if isvalid(inv_sql140) then 	Destroy inv_sql140			//Added By Mark Lee 12/22/2015
end event

