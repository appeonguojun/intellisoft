$PBExportHeader$n_cst_update_asa.sru
forward
global type n_cst_update_asa from n_cst_update
end type
end forward

global type n_cst_update_asa from n_cst_update
end type
global n_cst_update_asa n_cst_update_asa

forward prototypes
public function integer of_ver80_release_table1 ()
public function integer of_ver80_release_table2 ()
public function integer of_ver80_release_view1 ()
public function integer of_ver80_patch_table1 ()
public function integer of_ver70_release_table1 ()
public function integer of_ver70_release_table2 ()
public function integer of_ver70_release_table3 ()
public function integer of_ver70_release_table4 ()
public function integer of_ver70_patch_table1 ()
public function integer of_ver70_release_view1 ()
public function integer of_ver70_release_view2 ()
public function integer of_ver70_release_view3 ()
public function integer of_ver70_release_view4 ()
public function integer of_ver60_release_table1 ()
public function integer of_ver60_patch_table1 ()
public function integer of_ver60_updates ()
public function integer of_ver70_updates ()
public function integer of_ver80_updates ()
public function integer of_ver80_patch_view1 ()
public function integer of_ver85_release_table1 ()
public function integer of_ver85_release_view1 ()
public function integer of_ver85_updates ()
public function integer of_ver90_release_table1 ()
public function integer of_ver90_release_view1 ()
public function integer of_ver90_updates ()
end prototypes

public function integer of_ver80_release_table1 ();
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  and " + &
	"   c.column_name='set_patch_ver' and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_patch_ver varchar(250) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='multi_screen_filter' " + &
	"     and t.table_name='export_header') " + &
	"alter table export_header add multi_screen_filter varchar(250) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='ic_ldap_user' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add ic_ldap_user varchar(20) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  primary_office default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  exp_letters default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  include_in_directory default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  prac_correspondence default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  home_address default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  additional_office default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  mailing default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  billing  default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE ctx_contacts_numbers MODIFY phone varchar(25) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE ctx_org_contact MODIFY phone varchar(25) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='wf_id' " + &
	"     and t.table_name='ctx_notification') " + &
	"alter table ctx_notification add wf_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='isdisabled' " + &
	"     and t.table_name='wv_esign_log') " + &
	"alter table wv_esign_log add isdisabled int null default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='force_update' " + &
	"     and t.table_name='ctx_screen') " + &
	"alter table ctx_screen add force_update text null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_screen_datafill' " + &
	"            and   type = 'U') " + &
	"create table ctx_screen_datafill (data_view_id integer not null, screen_id integer not null, field_name varchar(50) not null, field_name_fill varchar(50) not null, field_name_map varchar(50) null, modify_by varchar(20) null, modify_date datetime null, " + &
	"constraint PK_ctx_screen_datafill PRIMARY KEY (data_view_id, screen_id, field_name, field_name_fill), " + &
	"constraint FK_ctx_screen_datafill_ctx_screen foreign key (data_view_id, screen_id) references ctx_screen (data_view_id, screen_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sysobjects where name = 'ic_client_data' ) " + &
	"	Create Table ic_client_data " + &
	"	( " + &
	"		id  numeric(10,0) identity  not null, " + &
	"		client_id varchar(20) not null, " + &
	"		data_int numeric(10,0) null, " + &
	"		data_vchar varchar(30) null, " + &
	"		Primary Key(id) " + &
	"	) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"IF NOT EXISTS (select TOP 1 1 FROM sysindex  WHERE index_name = 'idx_ic_client_data_client_id') " + &
	"	CREATE INDEX idx_ic_client_data_client_id  ON ic_client_data (client_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sysobjects where name = 'v_ic_client_data_int' ) " + &
	"	Create view v_ic_client_data_int As (Select distinct client_id,data_int from  ic_client_data where data_int is not null) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sysobjects where name = 'v_ic_client_data_vchar' ) " + &
	"	Create view v_ic_client_data_vchar As Select distinct client_id,data_vchar from  ic_client_data where (data_vchar is not null) and (data_vchar <> '') "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE app_facility MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE app_facility MODIFY fax varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE group_practice MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE group_practice MODIFY fax varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE group_multi_loc MODIFY phone varchar(25)	 null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"IF not exists( select TOP 1 1 from sysobjects where name = 'ic_array_to_db') " + &
	"Create table ic_array_to_db " + &
	"( " + &
	"id numeric(9,0) identity  not null, " + &
	"client_id varchar(20) not null, " + &
	"seq_no integer not null, " + &
	"data varchar(8000) null, " + &
	"Primary Key(id) " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"IF EXISTS (SELECT name FROM   sysobjects WHERE  name = 'up_array_to_row'  AND  type = 'P') " + &
	"    DROP PROCEDURE up_array_to_row "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE PROCEDURE up_array_to_row " + &
	"( " + &
	"@as_client_id varchar(20),		 " + &
	"@ai_col_type integer,		 " + &
	"@ai_seq_count integer		 " + &
	") " + &
	"AS " + &
	"Begin " + &
	"	Declare @i integer " + &
	"	Declare @li_pos integer " + &
	"	Declare @ls_text varchar(8000) " + &
	"	Declare @ls_col varchar(20) " + &
	"	Select @ls_col = '' " + &
	"	Select @ls_text = '' " + &
	"	Select @i = 1 " + &
	"	Select @li_pos = 0 " + &
	"	While (@i <= @ai_seq_count) " + &
	"	Begin " + &
	"		Select @ls_text = data from ic_array_to_db where client_id = @as_client_id and seq_no = @i  " + &
	"			While (@ls_text <> '') " + &
	"			Begin " + &
	"				Select @li_pos = CharIndex(',',@ls_text) " + &
	"				If @li_pos > 0  " + &
	"				Begin " + &
	"					Select @ls_col =  SubString(@ls_text,1,(@li_pos - 1)) " + &
	"					Select @ls_text = SubString(@ls_text,@li_pos + 1, (Len(@ls_text) - @li_pos) ) " + &
	"				End	 " + &
	"				Else " + &
	"				Begin " + &
	"					Select @ls_col =  @ls_text " + &
	"					Select @ls_text = ''  " + &
	"				End " + &
	"				If @ai_col_type = 1  " + &
	"					Insert into ic_client_data(client_id,data_int) values(@as_client_id,Convert(numeric(9),@ls_col)) " + &
	"				Else  " + &
	"					If @ai_col_type = 2  " + &
	"						Insert into ic_client_data(client_id,data_vchar) values(@as_client_id,@ls_col) " + &
	"			End " + &
	"		Select @i = @i + 1 " + &
	"	End   " + &
	"End "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='DefaultTo' " + &
	"     and t.table_name='ctx_contacts') " + &
	"alter table ctx_contacts add DefaultTo VarChar(1) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='em_smtp_accounts' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE em_smtp_accounts " + &
	"( " + &
	"  user_id varchar(10) not null, " + &
	"  is_default char(1) not null, " + &
	"  server varchar(50) null, " + &
	"  port integer null, " + &
	"  authmode integer null, " + &
	"  account varchar(50) null, " + &
	"  password varchar(30) null, " + &
	"  email varchar(50) not null, " + &
	"  constraint pk_email primary key (email) " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table em_smtp_accounts delete primary key "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='id' " + &
	"     and t.table_name='em_smtp_accounts') " + &
	"alter table em_smtp_accounts add id integer identity not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table em_smtp_accounts add constraint pk_email primary key(id) "

//<added by nova 2008-05-04>
//reason:mail from wuzhijun urgent fix
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"alter table em_smtp_accounts modify account varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='PntDownLoadPath' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add PntDownLoadPath VarChar(255) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_53' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_53 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_54' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_54 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_55' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_55 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_56' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_56 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_57' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_57 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_58' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_58 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_59' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_59 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_60' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_60 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_import' " + &
	"     and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_import integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='npdb_user_id' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add npdb_user_id varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='user_name' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add user_name varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_tdl' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add set_tdl integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_task' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add set_task integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_go_on_open' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add set_go_on_open integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='open_tdl' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add open_tdl integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_1' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add set_1 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_2' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add set_2 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_3' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add set_3 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_4' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add set_4 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='npdb_password' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add npdb_password varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='dw_syntax' " + &
	"     and t.table_name='profile_view_reports') " + &
	"alter table profile_view_reports add dw_syntax text null "

//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//	"IF EXISTS (select TOP 1 1 FROM SYSOBJECTS WHERE name='sp_contract_search' AND TYPE = 'P') " + &
//	" DROP PROCEDURE sp_contract_search "
//
////This procedure was modified for no access control to contract by Alfee on 03.14.2008
//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//	"CREATE  PROCEDURE sp_contract_search " + &
//	"   @user_d VARCHAR(10)  " + &
//	"  as  " + &
//	"  BEGIN  " + &
//	"    SELECT DISTINCT ctx_basic_info.app_facility,    " + &
//	" 	 ctx_products.product_id product_code,    " + &
//	"   code_lookup.code product_name,    " + &
//	"   ctx_basic_info.effective_date,    " + &
//	"   ctx_basic_info.expriation_date,    " + &
//	"   ctx_basic_info.status,    " + &
//	"   ctx_basic_info.group_multi_loc_id,    " + &
//	"   ctx_basic_info.ctx_id,    " + &
//	"   ctx_basic_info.master_contract_id,                           " + &
//	"   master_cnt = (select count(ctx_basic_info1.ctx_id) from ctx_basic_info ctx_basic_info1 where ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id),                         " + &
//	"   ctx_basic_info.category,     " + &
//	"   ctx_basic_info.facility_id,    " + &
//	"   ctx_basic_info.contract_type,    " + &
//	"   code_lookup1.code product_type,    " + &
//	"   ctx_basic_info.reimbursment_menth,    " + &
//	"   ctx_basic_info.file_location,    " + &
//	"   ctx_basic_info.review_date,    " + &
//	"   ctx_basic_info.review_by,    " + &
//	"   ctx_basic_info.term_date,    " + &
//	"   ctx_basic_info.term_reason,    " + &
//	"   ctx_basic_info.last_revis_date,    " + &
//	"   ctx_basic_info.other_date_1,    " + &
//	"   ctx_basic_info.other_date_2,    " + &
//	"   ctx_basic_info.oc_signed_by,    " + &
//	"   ctx_basic_info.oc_title,    " + &
//	"   ctx_basic_info.oc_department,    " + &
//	"   ctx_basic_info.oc_legal_rep,    " + &
//	"   ctx_basic_info.cc_signed_by,    " + &
//	"   ctx_basic_info.cc_title,    " + &
//	"   ctx_basic_info.cc_department,    " + &
//	"   ctx_basic_info.cc_legal_rep,    " + &
//	"   ctx_basic_info.notes,    " + &
//	"   ctx_basic_info.keyword,    " + &
//	"   ctx_basic_info.dvision,    " + &
//	"   ctx_basic_info.custom_1,    " + &
//	"   ctx_basic_info.custom_2,    " + &
//	"   ctx_basic_info.custom_3,    " + &
//	"   ctx_basic_info.custom_4,    " + &
//	"   ctx_basic_info.custom_5,    " + &
//	"   ctx_basic_info.custom_6,    " + &
//	"   ctx_basic_info.custom_7,    " + &
//	"   ctx_basic_info.custom_8,    " + &
//	"   ctx_basic_info.custom_9,    " + &
//	"   ctx_basic_info.custom_10,    " + &
//	"   ctx_basic_info.group_id,    " + &
//	"   ctx_basic_info.revision_reason,    " + &
//	"   ctx_basic_info.record_id , " + &
//	"   owner = upper((SELECT top 1 ctx_contacts.user_d  " + &
//	"       FROM ctx_contacts,ctx_contract_contacts " + &
//	"       WHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) and   " + &
//	"         (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) AND   " + &
//	"         ( ctx_contract_contacts.owner = 'Y' ) )), " + &
//	"   contracted_entity = (SELECT top 1 group_multi_loc.rec_id   " + &
//	"             FROM ctx_loc,    " + &
//	"              group_multi_loc   " + &
//	"           WHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id) and   " + &
//	"             ( ctx_loc.ctx_id = ctx_basic_info.ctx_id) AND   " + &
//	"               ctx_loc.loc_id = 0), " + &
//	"   app_facility.facility_name facility_name, " + &
//	"   ctx_basic_info.custom_date1,   " + &
//	"   ctx_basic_info.custom_date2,   " + &
//	"   ctx_basic_info.custom_date3,   " + &
//	"   ctx_basic_info.custom_date4,   " + &
//	"   ctx_basic_info.custom_date5,   " + &
//	"   ctx_basic_info.inserted_by_user,   " + &
//	"   ctx_basic_info.inserted_at_date_time,   " + &
//	"   ctx_basic_info.updated_by_user,   " + &
//	"   ctx_basic_info.updated_at_date_time,   " + &
//	"   ctx_basic_info.custom_11,   " + &
//	"   ctx_basic_info.custom_12,   " + &
//	"   ctx_basic_info.custom_13,   " + &
//	"   ctx_basic_info.custom_14,   " + &
//	"   ctx_basic_info.custom_15,   " + &
//	"   ctx_basic_info.custom_16,   " + &
//	"   ctx_basic_info.custom_17,   " + &
//	"   ctx_basic_info.custom_18,   " + &
//	"   ctx_basic_info.custom_19,   " + &
//	"   ctx_basic_info.custom_20,   " + &
//	"   ctx_basic_info.custom_date6,   " + &
//	"   ctx_basic_info.custom_date7,   " + &
//	"   ctx_basic_info.custom_date8,   " + &
//	"   ctx_basic_info.custom_date9,   " + &
//	"   ctx_basic_info.custom_date10,   " + &
//	"   ctx_basic_info.custom_date11,   " + &
//	"   ctx_basic_info.custom_date12,   " + &
//	"   ctx_basic_info.custom_date13,   " + &
//	"   ctx_basic_info.custom_date14,   " + &
//	"   ctx_basic_info.custom_date15,   " + &
//	"   ctx_basic_info.custom_n1,   " + &
//	"   ctx_basic_info.custom_n2,   " + &
//	"   ctx_basic_info.custom_n3,   " + &
//	"   ctx_basic_info.custom_n4,   " + &
//	"   ctx_basic_info.custom_n5,   " + &
//	"   ctx_basic_info.custom_n6,   " + &
//	"   ctx_basic_info.custom_n7,   " + &
//	"   ctx_basic_info.custom_n8,   " + &
//	"   ctx_basic_info.custom_n9,   " + &
//	"   ctx_basic_info.custom_n10,   " + &
//	"   ctx_basic_info.version_number,   " + &
//	"   ctx_basic_info.version_date,   " + &
//	"   ctx_basic_info.master_contract_name    " + &
//	"    FROM  ctx_basic_info   " + &
//	"LEFT OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id   " + &
//	"LEFT OUTER JOIN code_lookup ON ctx_products.product_id = code_lookup.lookup_code  " + &
//	"LEFT OUTER JOIN code_lookup code_lookup1 ON ctx_products.product_type = code_lookup1.lookup_code,  " + &
//	"ctx_basic_info ctx_basic_info1 LEFT OUTER JOIN app_facility ON ctx_basic_info1.app_facility = app_facility.facility_id, " + &
//	"( " + &
//	" SELECT Distinct ctx_contract_contacts.ctx_id " + &
//	"   FROM ctx_contract_contacts,    " + &
//	"         ctx_contacts   " + &
//	"  WHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) and   " + &
//	"        ( ( ctx_contract_contacts.access in ('F','R') ) OR   " + &
//	"        ( ctx_contract_contacts.owner = 'Y' ) ) AND   " + &
//	"        ( ctx_contacts.user_d = @user_d ) and ctx_contract_contacts.ic_area = 'I' " + &
//	" UNION " + &
//	"   SELECT DISTINCT ctx_basic_info.ctx_id " + &
//	"     FROM ctx_acp_contract_management_right,security_users,ctx_basic_info " + &
//	"    WHERE ( ctx_acp_contract_management_right.types = 1 )  " + &
//	" AND ctx_acp_contract_management_right.role_id = security_users.role_id " + &
//	" AND ctx_acp_contract_management_right.category = ctx_basic_info.category " + &
//	" AND ctx_acp_contract_management_right.rights In ('11','12') " + &
//	" AND security_users.user_id = @user_d " + &
//	" AND ctx_basic_info.ctx_id NOT IN " + &
//	"    (SELECT Distinct ctx_contract_contacts.ctx_id " + &
//	"		  FROM ctx_contract_contacts, ctx_contacts  " + &  
//	"		 WHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) AND " + &
//	"			    ( ( ctx_contract_contacts.access ='N') AND " + &
//	"	     	    ( ctx_contract_contacts.owner <> 'Y' ) ) AND " + &   
//	"			    ( ctx_contacts.user_d = @user_d ) AND " + &
//	"				 ( ctx_contract_contacts.ic_area = 'I' ) ) " + &
//	") AA " + &
//	"WHERE ctx_basic_info.ctx_id = ctx_basic_info1.ctx_id and ctx_basic_info.ctx_id = AA.ctx_id " + &
//	"ORDER BY ctx_basic_info.ctx_id   " + &
//	"END "
//
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select top 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  and " + &
	"   c.column_name='domain_name' and t.table_name='security_users') " + &
	"	Alter table security_users add domain_name varchar(30) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='signature' " + &
	"     and t.table_name='security_user_mailsetting') " + &
	"ALTER table security_user_mailsetting add signature Image null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"  " + &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='EMail_Message' " + &
	"     and t.table_name='wf_email') " + &
	"ALTER table wf_email add EMail_Message image null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_acp_template_clause_rules' " + &
	"            and   type = 'U') " + &
	"create table ctx_acp_template_clause_rules( " + &
	"       ctx_acp_template_id numeric(6,0) not null, " + &
	"       ctx_acp_clause_id numeric(6,0) not null,      " + &
	"       rule_row_id integer not null, " + &
	"       rule_name varchar(255) null,  " + &
	"       screen_id integer null, " + &
	"       left_bracket varchar(5) null, " + &
	"       field_name varchar(50) null, " + &
	"       field_label varchar(255) null,  " + &
	"       operator varchar(20) null,             " + &
	"       value varchar(255) null,               " + &
	"       right_bracket varchar(5) null, " + &
	"       logical varchar(5) null,          " + &
	"       field_type varchar(2) null,     " + &
	"       table_name varchar(150) null, " + &
	"       value_display varchar(75) null,             " + &
	"       lookup_code varchar(40) null,             " + &
	"       lookup_flag varchar(1) null, " + &
	"       constraint PK_ctx_acp_template_clause_rules PRIMARY KEY (ctx_acp_template_id, ctx_acp_clause_id, rule_row_id )) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete From sys_fields where table_id = 54 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete From sys_fields where table_id = 56 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete from sys_tables where table_id = 54 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete from sys_tables where table_id = 56 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='import_table_name' and t.table_name='sys_tables'  ) " + &
	"    Alter table sys_tables add import_table_name varchar(30) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='sql_query_list' " + &
	"            and   type = 'U') " + &
	"CREATE table sql_query_list (list_id numeric(8,0) null, query_name varchar(50) null,user_id varchar(30) null,create_date datetime null, query_sql text null, primary key(list_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_tables' and   type = 'U') " + &
	"create table import_tables " + &
	"( " + &
	"table_id integer not null, " + &
	"table_name varchar(50) null, " + &
	"table_name_allias varchar(100) null, " + &
	"isoft_module integer null, " + &
	"constraint pk_import_table_id primary key (table_id) " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_fields' and type = 'U') " + &
	"             " + &
	"create table import_fields " + &
	"( " + &
	"field_id integer not null, " + &
	"table_id integer not null, " + &
	"field_name varchar(50) null, " + &
	"field_type varchar(2) null, " + &
	"field_len integer null, " + &
	"field_name_allias varchar(100) null, " + &
	"allow_null char(1) null, " + &
	"constraint pk_import_field_id primary key (field_id) " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table import_lu_map_fields modify import_value varchar(200) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Alter table import_project modify def_affil_stat varchar(30) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctx_status' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctx_status numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctx_category' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctx_category numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctx_app_facility' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctx_app_facility numeric(6) null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctx_contract_type' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctx_contract_type numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctx_dvision' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctx_dvision numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='cta_contact_type' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add cta_contact_type numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='cta_first_name' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add cta_first_name varchar(30) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='cta_last_name' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add cta_last_name varchar(30) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='cta_facility_id' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add cta_facility_id numeric(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='cta_user_id' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add cta_user_id varchar(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctxcta_ctx_id' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctxcta_ctx_id numeric(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctxcta_contact_id' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctxcta_contact_id numeric(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctxcta_ic_area' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctxcta_ic_area char(1) null default 'E' "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctxcta_default_email' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctxcta_default_email char(1) null default 'N' "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctxprd_ctx_id' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctxprd_ctx_id numeric(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctxprd_product_id' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctxprd_product_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='ctxprd_product_type' and t.table_name='import_project'  ) " + &
	"	Alter table import_project add ctxprd_product_type numeric(6) null "


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if  exists(	select TOP 1 1 from sys.syscolumn c, sys.systable t    " + &
	"		where c.table_id=t.table_id  and c.column_name='comp_def' and t.table_name='import_file_fields'  ) " + &
	"	alter table import_file_fields modify comp_def varchar(500) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  and " + &
	"   c.column_name='attested_date' and t.table_name='pd_affil_stat') " + &
	"ALTER table pd_affil_stat add attested_date datetime null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Money_1' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Money_1 Decimal(10,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Money_2' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Money_2 Decimal(10,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_1' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Integer_1 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_2' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Integer_2 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_3' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Integer_3 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_4' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Integer_4 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_5' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Integer_5 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_6' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Integer_6 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_7' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Integer_7 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_8' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add Integer_8 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='datetime_1' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add datetime_1 DateTime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='datetime_2' " + &
	"     and t.table_name='code_lookup') " + &
	"ALTER table code_lookup add datetime_2 DateTime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"     from  sysobjects " + &
	"    where  name='Lookup_ColTitle' and type = 'U') " + &
	"create table Lookup_ColTitle(Lookup_Type varchar(1) not null,Lookup_Name varchar(35) not null,ColTitleName varchar(30) not null,ColTitleText varchar(50) null,primary key (Lookup_Type,Lookup_Name,ColTitleName)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Money_1' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Money_1 Decimal(10,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Money_2' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Money_2 Decimal(10,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_1' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Integer_1 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_2' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Integer_2 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_3' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Integer_3 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_4' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Integer_4 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_5' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Integer_5 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_6' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Integer_6 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_7' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Integer_7 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='Integer_8' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add Integer_8 Integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='datetime_1' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add datetime_1 DateTime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id " + &
	"     and c.column_name='datetime_2' " + &
	"     and t.table_name='address_lookup') " + &
	"ALTER table address_lookup add datetime_2 DateTime null "

// appeon added by nova 2008.03.04 
//reason:The JDBC or Open Client interfaces do not support scrollable cursors
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"IF EXISTS (SELECT name FROM   sysobjects WHERE  name = 'up_ini_facility_ver_rules'  AND  type = 'P') " + &
"    DROP PROCEDURE up_ini_facility_ver_rules " 


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
   "    CREATE PROCEDURE up_ini_facility_ver_rules " + &
   " AS " + &
	"begin "+ &
	"Declare @@li_facility_id Integer " + &
	"Declare @@li_Screen_id Integer " + &
	"Declare facility_cursor Cursor For Select Distinct facility_id From facility_ver_rules " + &
	"Declare screen_cursor Cursor For Select screen_id From data_view_screen where data_view_id = 1 and screen_id > 0 and multi_record <> 'H' and (detail_2 = 0 or detail_2 is null) " + &
	"Open facility_cursor " + &
	"Fetch  facility_cursor Into @@li_facility_id " + &
	"While @@SQLStatus = 0  " + &
	"Begin     " + &
	"    Open screen_cursor " + &
	"    Fetch screen_cursor Into @@li_Screen_id " + &
	"    While @@SQLStatus = 0  " + &
	"    Begin " + &
	"        If Not Exists(select TOP 1 1 From facility_ver_rules Where screen_id = @@li_Screen_id and facility_id = @@li_facility_id )  " + &
	"            Insert Into facility_ver_rules(facility_id,screen_id,verify_data,required,exp_reminder_doc,ver_ltr_doc,reverify_after_exp, " + &
	"                    verif_letter_style,exp_cred_que_letters_days,ver_letter_resend_days,ver_letter_max_sends,check_back_years) " + &
	"            Values(           @@li_facility_id,@@li_Screen_id,'N',      'N',    'N',        'N',    0,           " + &
	"                    'I',        0,              30,         3,      0) " + &
	"        Fetch screen_cursor Into @@li_Screen_id " + &
	"    End " + &
	"    Close screen_cursor " + &
	"    Fetch  facility_cursor Into @@li_facility_id " + &
	"End " + &
	"Close facility_cursor "+ &
"End "

//Start Code change By Jervis 03.07.2008
//APB Unsupport,Move to bellow
//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//"IF EXISTS (SELECT name FROM   sysobjects WHERE  name = 'up_ini_facility_ver_rules'  AND  type = 'P') " + &
//"    exec up_ini_facility_ver_rules " 
//End Code change By Jervis 03.07.2008

// appeon added by nova 2008.03.04 


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  and " + &
	"   c.column_name='field_1' and t.table_name='import_table_gen') " + &
	"alter table import_table_gen modify field_1 varchar(1000) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 from  sysobjects  where  name='import_auto' and   type = 'U')" + &
	"CREATE TABLE import_auto ( " + &
	"	ia_id integer null, " + &
	"	project_id integer null," + &
	"	import_id decimal(16, 0) null," + &
	"	interval decimal(16, 0) null," + &
	"	frequency float null," + &
	"	run_time datetime null," + &
	"	last_run datetime null," + &
	"	active_status integer null," + &
	"	error_code integer null," + &
	"	import_name char(25) null" + &
	"	                  )" 

of_execute_sqls("of_ver80_release_table1")

//Start Code change By Jervis 03.07.2008
DECLARE up_facility_ver_rules procedure for up_ini_facility_ver_rules;
execute up_facility_ver_rules;
if sqlca.sqlcode < 0 then 
	IF IsValid(gnv_logservice)THEN gnv_logservice.of_log("execute up_facility_ver_rules", Sqlca.SQLErrText,"of_ver80_release_table1")
	gb_upgrade_failed = TRUE
end if
close up_facility_ver_rules;
commit;
//End Code change By Jervis 03.07.2008
RETURN 1


end function

public function integer of_ver80_release_table2 ();is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'view_alias' and type = 'U') " + &
"	create table view_alias  " + &
"	( " + &
"		v_name     VARCHAR(100) NOT NULL, " + &
"		v_alias    VARCHAR(255) NULL, " + &
"	 	module     int NULL, " + &
"		screen     VARCHAR(255) null, " + &
"		sflag      CHAR(1) NULL, " + &
"		p_name     VARCHAR(100) NULL, " + &
"		v_image    image NULL,   " + &
"		constraint PK_view_alias PRIMARY KEY (v_name) " + &
"	) "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'view_fields_alias' and type = 'U') " + &
"	create table view_fields_alias  " + &
"	( " + &
"		v_name     VARCHAR(100) NOT NULL, " + &
"		data_view_id  int NOT NULL, " + &
"		c_name        VARCHAR(50) NOT NULL, " + &
"		c_alias       VARCHAR(50) NULL, " + &
"		constraint PK_view_fields_alias PRIMARY KEY (v_name,data_view_id,c_name) " + &
"	) "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='data_view_id' " + &
"     and t.table_name='conv_view') " + &
"alter table conv_view add data_view_id int null "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='module' " + &
"     and t.table_name='conv_view') " + &
"alter table conv_view add module int null "

//-------Begin Added by Alfee on 02.20.2008 -----------------------
//for clause rules base on a specified view
is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='data_view_id' " + &
"     and t.table_name='ctx_acp_template_clause_rules') " + &
"  ALTER TABLE ctx_acp_template_clause_rules ADD data_view_id int not null DEFAULT 1001 "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists(select TOP 1 1 from sys.sysforeignkey where role='FK_ctx_acp_template_clause_rules_ctx_screen') " + &
"  ALTER TABLE ctx_acp_template_clause_rules MODIFY screen_id int not null "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists(select TOP 1 1 from sys.sysforeignkey where role='FK_ctx_acp_template_clause_rules_ctx_screen') " + &
"  ALTER TABLE ctx_acp_template_clause_rules ADD CONSTRAINT FK_ctx_acp_template_clause_rules_ctx_screen FOREIGN KEY (data_view_id, screen_id) REFERENCES ctx_screen(data_view_id, screen_id) "
//--------End Added -----------------------------------------------

//Add auto snooze unit for contract alarm - Alfee 02.22.2008
is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='alm_auto_increment_unit' " + &
"     and t.table_name='ctx_notification') " + &
"  ALTER table ctx_notification ADD alm_auto_increment_unit char(1) null "

// added by nova 2.21.2008
is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id " + &
"     and c.column_name='lu_field_name' " + &
"     and t.table_name='conv_view_fields') " + &
"alter table conv_view_fields add lu_field_name VARCHAR(50) null" 

// added by nova 2.22.2008
is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id " + &
"     and c.column_name='set_addresser'  " + &
"     and t.table_name='icred_settings')  " + &
" ALTER table icred_settings add set_addresser varchar(20) null " 

//-------Begin Added by Alfee on 02.26.2008 -----------------------
//for date alarm to contract action item
is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from sysobjects where name='ctx_ai_notification' and type = 'U') " + &
"create table ctx_ai_notification (ctx_id int not null, ctx_action_item_id int not null, alm_table varchar(40) not null, alm_column varchar(40) not null, " + &
"	alm_message varchar(255) null, alm_enabled char(1) null, alm_notification_days int null, alm_last_notification_sent datetime null, " + &
" 	alm_post_notification_days int null, alm_total_tries int null, alm_action_item_posted int null, alm_total_tries_counter int null, " + &
" 	alm_frequency int null, create_action_item char(1) null, record_id numeric(10, 0) not null, alm_auto_increment_years int null , " + &
" 	alm_action_title varchar(40) null, wf_id int null, alm_auto_increment_unit char(1) null, " + &
" 	primary key(ctx_id, ctx_action_item_id, alm_table, alm_column )) "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists(select TOP 1 1 from sys.sysforeignkey where role='FK_ctx_ai_notification_to_ctx_action_items') " + &
"alter table ctx_ai_notification add constraint FK_ctx_ai_notification_to_ctx_action_items foreign key (ctx_action_item_id,ctx_id) references ctx_action_items (ctx_action_item_id,ctx_id) " 

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from sysobjects where name='ctx_ai_notification_users' and type = 'U') " + &
"create table ctx_ai_notification_users (ctx_id int not null, ctx_action_item_id int not null, alm_table varchar (40) not null, " + &
"	alm_column varchar (40) not null, user_id varchar (10) not null, " + &
"	primary key(ctx_id, ctx_action_item_id, alm_table, alm_column, user_id )) "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists(select TOP 1 1 from sys.sysforeignkey where role='FK_ctx_ai_noti_users_to_ctx_ai_noti' ) " + &
"alter table ctx_ai_notification_users add constraint FK_ctx_ai_noti_users_to_ctx_ai_noti foreign key (ctx_id, ctx_action_item_id, alm_table, alm_column ) references ctx_ai_notification (ctx_id, ctx_action_item_id, alm_table, alm_column ) "

//for date alarm to document manager action item
is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from sysobjects where name='ctx_am_ai_notification' and type = 'U') " + &
"create table ctx_am_ai_notification(doc_id int not null, seq_id int not null, alm_table varchar(40) not null, alm_column varchar(40) not null, " + &
"	alm_message varchar(255) null, alm_enabled char(1) null, alm_notification_days int null, alm_last_notification_sent datetime null, " + &
"	alm_post_notification_days int null, alm_total_tries int null, alm_action_item_posted int null,	alm_total_tries_counter int null, " + &
"	alm_frequency int null, create_action_item char(1) null, record_id numeric(10, 0) not null, alm_auto_increment_years int null, " + &
"	alm_action_title varchar(40) null, wf_id int null, alm_auto_increment_unit char(1) null, " + &
"	primary key(doc_id, seq_id, alm_table, alm_column )) "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists( select TOP 1 1 from sys.sysforeignkey where role='FK_ctx_am_ai_noti_to_ctx_am_ai' ) " + &
"alter table ctx_am_ai_notification add constraint FK_ctx_am_ai_noti_to_ctx_am_ai foreign key (doc_id, seq_id) references ctx_am_action_item (doc_id, seq_id) "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from sysobjects where name='ctx_am_ai_notification_users' and type = 'U') " + &
"create table ctx_am_ai_notification_users (doc_id int not null, seq_id int not null, alm_table varchar (40) not null, " + &
"	alm_column varchar (40) not null, user_id varchar (10) not null, " + &
"	primary key(doc_id, seq_id, alm_table, alm_column, user_id )) "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"if not exists( select TOP 1 1 from sys.sysforeignkey where role='FK_ctx_amai_notiusers_to_ctx_amai_noti' ) " + &
"alter table ctx_am_ai_notification_users add constraint FK_ctx_amai_notiusers_to_ctx_amai_noti foreign key (doc_id, seq_id, alm_table, alm_column ) references ctx_am_ai_notification (doc_id, seq_id, alm_table, alm_column )	"
//--------End Added by Alfee on 02.26.2008 -----------------------------------------------

//-------Begin Added by Evan on 03.03.2008 -----------------------
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='sort_no' " + &
"     and t.table_name='import_table_records') " + &
"alter table import_table_records add sort_no integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='sort_no' " + &
"     and t.table_name='import_mapping_fields') " + &
"alter table import_mapping_fields add sort_no integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='process_tables_id' " + &
"     and t.table_name='import_process_errors') " + &
"alter table import_process_errors add process_tables_id numeric(16,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='err_value' " + &
"     and t.table_name='import_process') " + &
"alter table import_process add err_value varchar(300) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 " + &
"            from  sysobjects " + &
"           where  name='import_process_tables' " + &
"            and   type = 'U') " + &
"create table import_process_tables " + &
"( " + &
"process_tables_id numeric(16,0) identity, " + &
"process_id numeric(16,0) null, " + &
"table_records_id integer null, " + &
"error_count integer null, " + &
"mod_count integer null, " + &
"add_count integer null, " + &
"primary key (process_tables_id) " + &
") "
//--------End Added by Evan on 03.03.2008 ------------------------
//-------Begin Added by nova on 03.03.2008 -----------------------
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
"   where c.table_id=t.table_id  " + &
"     and c.column_name='lookup_type' " + &
"     and t.table_name='conv_view_fields') " + &
"alter table conv_view_fields add lookup_type CHAR(1) null " 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"alter table view_fields_alias modify c_alias VARCHAR(255) null"
//--------End Added by nova on 03.03.2008 ------------------------

//-------Begin Added by nova on 03.17.2008 -----------------------
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"IF  EXISTS (SELECT 1 FROM sysindex  WHERE index_name = 'idx_pd_images_rec_id') " + &
"    DROP INDEX pd_images.idx_pd_images_rec_id " 
//-------End Added by nova on 03.17.2008 -----------------------

//-------Begin Added by nova on 03.24.2008 -----------------------
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from sysobjects where name='em_sent_items' and type = 'U') " + &
" create table em_sent_items  " + &
" (  " + &
" id integer identity not null,  " + &
" user_id varchar(10) null,  " + &
" subject varchar(200) null,  " + &
" mail_from varchar(50) null,  " + &
" mail_to varchar(50) null,  " + &
" mail_cc varchar(50) null,  " + &
" mail_bcc varchar(50) null,  " + &
" sent_time datetime null,  " + &
" mail_content image null,  " + &
" attach_name varchar(500) null,  " + &
" constraint pk_em_sent_items_id primary key (id)  " + &
" )  " 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(  " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t  " + &
"   where c.table_id=t.table_id   " + &
"     and c.column_name='advanced_linking'  " + &
"     and t.table_name='conv_view')  " + &
" alter table conv_view add advanced_linking int null  " 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(  " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t  " + &
"   where c.table_id=t.table_id   " + &
"     and c.column_name='visible'  " + &
"     and t.table_name='view_fields_alias')  " + &
" alter table view_fields_alias add visible int null  " 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(  " + &
"   select TOP 1 1 from sys.syscolumn c, sys.systable t  " + &
"   where c.table_id=t.table_id   " + &
"     and c.column_name='Filter_by_field'  " + &
"     and t.table_name='conv_view_fields')  " + &
"alter table conv_view_fields add Filter_by_field int null  "
//-------End Added by nova on 03.24.2008 -----------------------

//-------Begin Added by nova on 04.01.2008 -----------------------
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(  select 1 from sys.syscolumn c, sys.systable t   " + &  
"    where c.table_id=t.table_id and c.column_name='field_font_italic' and t.table_name='data_view_fields')  " + &
" Alter table data_view_fields add field_font_italic integer null  " 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(  select 1 from sys.syscolumn c, sys.systable t    " + & 
"    where c.table_id=t.table_id and c.column_name='label_font_italic' and t.table_name='data_view_fields')  " + &
" Alter table data_view_fields add label_font_italic integer null  " 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(  select 1 from sys.syscolumn c, sys.systable t    " + & 
"    where c.table_id=t.table_id and c.column_name='label_font_weight' and t.table_name='data_view_fields')  " + &
" Alter table data_view_fields add label_font_weight integer null  " 
//-------End Added by nova on 04.01.2008 -----------------------

//-------Begin Added by Alfee on 05.06.2008 --------------------
//Keep consentience with SQL Server
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(  select 1 from sys.syscolumn c, sys.systable t    " + & 
"    where c.table_id=t.table_id and c.column_name='doctype' and t.table_name='ctx_acp_clause') " + &
"Alter table ctx_acp_clause add doctype varchar(10) null default 'doc' "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(  select 1 from sys.syscolumn c, sys.systable t    " + & 
"    where c.table_id=t.table_id and c.column_name='doctype' and t.table_name='ctx_acp_template') " + &
"Alter table ctx_acp_template add doctype varchar(10) null default 'doc' "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Update ctx_acp_clause set doctype = 'doc' where doctype is null "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"Update ctx_acp_template set doctype = 'doc' where doctype is null	 "
//--------End Added -----------------------------------------------

of_execute_sqls("of_ver80_release_table2") //02.20.2008

RETURN 1
end function

public function integer of_ver80_release_view1 ();is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_address_lookup' and type = 'V')  " + &
	"  drop view v_address_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_address_lookup " + &
	"  as select distinct   " + &
	" address_lookup.lookup_code, " + &
	"    address_lookup.lookup_name, " + &
	"    address_lookup.code, " + &
	"    address_lookup.entity_name, " + &
	"    address_lookup.street1, " + &
	"    address_lookup.street2, " + &
	"    address_lookup.city, " + &
	"    address_lookup.state, " + &
	"    address_lookup.zip, " + &
	"    address_lookup.country, " + &
	"    address_lookup.phone, " + &
	"    address_lookup.fax, " + &
	"    address_lookup.email_address, " + &
	"    address_lookup.web_address, " + &
	"    address_lookup.custom_1, " + &
	"    address_lookup.custom_2, " + &
	"    address_lookup.custom_3, " + &
	"    address_lookup.custom_4, " + &
	"    address_lookup.custom_5, " + &
	"    address_lookup.custom_6, " + &
	"    address_lookup.contact_name, " + &
	"    address_lookup.contact_salutation, " + &
	"    address_lookup.fee, " + &
	" address_lookup.web_title, " + &
	" address_lookup.audit_flag, " + &
	" address_lookup.CAQH_CODE, " + &
	" address_lookup.ic_n, " + &
	" address_lookup.ic_c, " + &
	" address_lookup.Large_Description_1, " + &
	" address_lookup.Large_Description_2, " + &
	" address_lookup.Money_1, " + &
	" address_lookup.Money_2, " + &
	" address_lookup.Integer_1, " + &
	" address_lookup.Integer_2, " + &
	" address_lookup.Integer_3, " + &
	" address_lookup.Integer_4, " + &
	" address_lookup.Integer_5, " + &
	" address_lookup.Integer_6, " + &
	" address_lookup.Integer_7, " + &
	" address_lookup.Integer_8, " + &
	" address_lookup.datetime_1, " + &
	" address_lookup.datetime_2 " + &
	"from address_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_code_lookup' and type = 'V')  " + &
	"  drop view v_code_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_code_lookup " + &
	"  as select   " + &
	" lookup_code, " + &
	"    lookup_name as table_name, " + &
	"    code, " + &
	"    description, " + &
	" type, " + &
	"    custom_1, " + &
	"    custom_2, " + &
	"    custom_3, " + &
	"    custom_4, " + &
	"    custom_5, " + &
	"    custom_6, " + &
	" caqh_code, " + &
	" ic_n, " + &
	" ic_c, " + &
	" modify_date, " + &
	" Large_Description_1, " + &
	" Large_Description_2, " + &
	" Money_1, " + &
	" Money_2, " + &
	" Integer_1, " + &
	" Integer_2, " + &
	" Integer_3, " + &
	" Integer_4, " + &
	" Integer_5, " + &
	" Integer_6, " + &
	" Integer_7, " + &
	" Integer_8, " + &
	" datetime_1, " + &
	" datetime_2 " + &
	"from code_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='view_group_practice' and type = 'V')  " + &
	"  drop view view_group_practice "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  view_group_practice " + &
	"  as select    locat_id=group_practice.rec_id, " + &
	"    group_practice.prac_id, " + &
	"    prac_type_code=code_lookup_d.code, " + &
	"    prac_type=code_lookup_d.description, " + &
	"    group_practice.street, " + &
	"    group_practice.city, " + &
	"    state_code=code_lookup_e.code, " + &
	"    state_name=code_lookup_e.description, " + &
	"    country_code=code_lookup_f.code, " + &
	"    country_name=code_lookup_f.description, " + &
	"    group_practice.pager_number, " + &
	"    group_practice.phone, " + &
	"    group_practice.ext, " + &
	"    group_practice.fax, " + &
	"    group_practice.zip, " + &
	"    county_code=code_lookup_g.code, " + &
	"    county_name=code_lookup_g.description, " + &
	"    group_practice.contact_person, " + &
	"    group_practice.tax_id, " + &
	"    group_practice.tax_id_other_1, " + &
	"    group_practice.tax_id_other_2, " + &
	"    group_practice.business_mgr, " + &
	"    group_practice.office_mgr, " + &
	"    group_practice.e_mail_address, " + &
	"    group_practice.web_address, " + &
	"    group_practice.mon_from, " + &
	"    group_practice.mon_to, " + &
	"    group_practice.tue_from, " + &
	"    group_practice.tue_to, " + &
	"    group_practice.wed_from, " + &
	"    group_practice.thu_from, " + &
	"    group_practice.thu_to, " + &
	"    group_practice.fri_from, " + &
	"    group_practice.fri_to, " + &
	"    group_practice.sat_from, " + &
	"    group_practice.sat_to, " + &
	"    group_practice.sun_from, " + &
	"    group_practice.sun_to, " + &
	"    group_practice.mon_from2, " + &
	"    group_practice.mon_to2, " + &
	"    group_practice.tue_from2, " + &
	"    group_practice.tue_to2, " + &
	"    group_practice.wed_from2, " + &
	"    group_practice.wed_to2, " + &
	"    group_practice.thu_from2, " + &
	"    group_practice.thu_to2, " + &
	"    group_practice.fri_from2, " + &
	"    group_practice.fri_to2, " + &
	"    group_practice.sat_from2, " + &
	"    group_practice.sat_to2, " + &
	"    group_practice.sun_from2, " + &
	"    group_practice.sun_to2, " + &
	"    group_practice.wed_to, " + &
	"    group_practice.routine_visit_appt, " + &
	"    group_practice.urgent_visit_appt, " + &
	"    group_practice.emergency_visit_appt, " + &
	"    group_practice.non_emergency_appt, " + &
	"    young_child_code=code_lookup_h.code, " + &
	"    child_code=code_lookup_i.code, " + &
	"    adolescent_code=code_lookup_j.code, " + &
	"    adult_code=code_lookup_k.code, " + &
	"    senior_code=code_lookup_l.code, " + &
	"    handicap_acc=code_lookup_m.description, " + &
	"    on_public_trans=code_lookup_n.description, " + &
	"    group_practice.cust_1, " + &
	"    group_practice.cust_2, " + &
	"    group_practice.cust_3, " + &
	"    group_practice.cust_4, " + &
	"    group_practice.cust_5, " + &
	"    group_practice.cust_6, " + &
	"    group_practice.street_2, " + &
	"    group_practice.gp_id, " + &
	"    accepting_new_patient=code_lookup_p.description " + &
	"from(((((((((((( " + &
	"    group_practice left outer join code_lookup as code_lookup_d on group_practice.practice_type = code_lookup_d.lookup_code) left outer join code_lookup as code_lookup_e on group_practice.state = code_lookup_e.lookup_code) left outer join code_lookup as code_lookup_f on group_practice.country = code_lookup_f.lookup_code) left outer join code_lookup as code_lookup_g on group_practice.county = code_lookup_g.lookup_code) left outer join code_lookup as code_lookup_h on group_practice.young_child = code_lookup_h.lookup_code) left outer join code_lookup as code_lookup_i on group_practice.child = code_lookup_i.lookup_code) left outer join code_lookup as code_lookup_j on group_practice.adolescent = code_lookup_j.lookup_code) left outer join code_lookup as code_lookup_k on group_practice.adult = code_lookup_k.lookup_code) left outer join code_lookup as code_lookup_l on group_practice.senior_adult = code_lookup_l.lookup_code) left outer join code_lookup as code_lookup_m on group_practice.handicapped_access = code_lookup_m.lookup_code) left outer join code_lookup as code_lookup_n on group_practice.public_transportation = code_lookup_n.lookup_code) left outer join code_lookup as code_lookup_p on group_practice.accepting_new_patients = code_lookup_p.lookup_code) "


of_execute_sqls("of_ver80_release_view1")

RETURN 1

end function

public function integer of_ver80_patch_table1 ();is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE conv_view MODIFY view_name varchar(100)  " 
	
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(  "+&
   "select TOP 1 1 from sys.syscolumn c, sys.systable t    "+&
   "where c.table_id=t.table_id     "+&
   "  and c.column_name='value_display'  "+&  
   "  and t.table_name='conv_view_where')     "+&
"ALTER table conv_view_where add value_display varchar(255) null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(    "+&
 "  select TOP 1 1 from sys.syscolumn c, sys.systable t    "+&
 "  where c.table_id=t.table_id     "+&
 "    and c.column_name='lu_field_name'  "+&  
 "    and t.table_name='conv_view_where')    "+&
"ALTER table conv_view_where add lu_field_name varchar(50) null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(    "+&
 "  select TOP 1 1 from sys.syscolumn c, sys.systable t    "+&
 "  where c.table_id=t.table_id     "+&
 "    and c.column_name='lookup_type'    "+&
 "    and t.table_name='conv_view_where')    "+&
"ALTER table conv_view_where add lookup_type char(1) null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(    "+&
 "  select TOP 1 1 from sys.syscolumn c, sys.systable t    "+&
 "  where c.table_id=t.table_id     "+&
 "    and c.column_name='field_type'    "+&
 "    and t.table_name='conv_view_where')    "+& 
"ALTER table conv_view_where add field_type varchar(2) null	  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(     "+& 
   "select TOP 1 1 from sys.syscolumn c, sys.systable t      "+&
   "where c.table_id=t.table_id       "+&
   "  and c.column_name='lookup_name'      "+&
   "  and t.table_name='conv_view_where')       "+&
"ALTER table conv_view_where add lookup_name varchar(50) null     "
//moved to n_cst_update_date by nova 2008-08-20 
//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//	"UPDATE conv_view_where SET    "+&
//	"field_type = CASE b.coltype    "+&
//	"				WHEN 'integer'   THEN 'N'    "+&
//	"				WHEN 'float'     THEN 'N'    "+&
//	"				WHEN 'smallint'  THEN 'N'    "+&
//	"				WHEN 'money'     THEN 'N'    "+&
//	"				WHEN 'real'      THEN 'N'    "+&
//	"				WHEN 'decimal'   THEN 'N'    "+&
//	"				WHEN 'tinyint'   THEN 'N'    "+&
//	"				WHEN 'numeric'   THEN 'N'    "+&
//	"				WHEN 'bit'       THEN 'N'    "+&
//	"				WHEN 'char'      THEN 'C'    "+&
//	"				WHEN 'nvarchar'  THEN 'C'    "+&
//	"				WHEN 'varchar'   THEN 'C'    "+&
//	"				WHEN 'long varchar' THEN 'C'    "+&
//	"				WHEN 'timestamp' THEN 'D'    "+&
//	"				WHEN 'date'      THEN 'D'    "+&
//	"				WHEN 'time'      THEN 'D'    "+&
//	"				ELSE a.field_type    "+&
//	"			 END     "+&
//"FROM conv_view_where a    "+&
//"INNER JOIN sys.syscolumns b ON (a.table_field_name = b.tname + '.' + b.cname)    "+&
//"WHERE a.field_type IS NULL    "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 from  sysobjects where  name='sys_StatusAudit' and type = 'U')    "+&
"CREATE TABLE sys_StatusAudit    "+&
"( ctx_id int not null,    "+&
" seq_no int not null,    "+&
" status numeric(6,0) null,    "+&
" start_time datetime null,    "+&
" delay_days int null,    "+&
" user_id varchar(10) null,    "+&
" CONSTRAINT PK_SYS_STATUSAUDIT PRIMARY KEY (ctx_id,seq_no),    "+&
" CONSTRAINT FK_STATUSAUDIT_BASICINFO FOREIGN KEY (ctx_id) REFERENCES ctx_basic_info(ctx_id)    "+&
")    "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Alter table group_practice modify cust_1 varchar(150) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Alter table group_practice modify cust_2 varchar(150) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Alter table group_practice modify cust_3 varchar(150) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Alter table group_practice modify cust_4 varchar(150) "	

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Alter table group_practice modify cust_5 varchar(150) "	

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Alter table group_practice modify cust_6 varchar(150) "		
	
//for contract date alarm	- Alfee 06.06.2008
Long ll_cnt = 1
Select count(*) into :ll_cnt from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and c.column_name='alm_last_wf_trigger' and t.table_name='ctx_notification';
IF ll_cnt < 1 THEN 
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
		"Alter table ctx_notification add alm_last_wf_trigger datetime null "
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
		"Update ctx_notification set alm_last_wf_trigger = alm_last_notification_sent where alm_last_notification_sent is not null and wf_id is not null "
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
		"Alter table ctx_ai_notification add alm_last_wf_trigger datetime null "
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
		"Update ctx_ai_notification set alm_last_wf_trigger = alm_last_notification_sent where alm_last_notification_sent is not null and wf_id is not null "
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
		"Alter table ctx_am_ai_notification add alm_last_wf_trigger datetime null "
	is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
		"Update ctx_am_ai_notification set alm_last_wf_trigger = alm_last_notification_sent where alm_last_notification_sent is not null and wf_id is not null "		
END IF	

//---------Begin Added by Alfee on 06.11.2008 ---------------------------
//for email template in Contract Date Alarm 
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_email_template_id' and t.table_name='ctx_notification' ) " + &
"alter table ctx_notification add alm_email_template_id int NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_message_blob' and t.table_name='ctx_notification' ) " + &
"alter table ctx_notification add alm_message_blob image NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_attachment_name' and t.table_name='ctx_notification' ) " + &
"alter table ctx_notification add alm_attachment_name varchar(100) NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_attachment' and t.table_name='ctx_notification' ) " + &
"alter table ctx_notification add alm_attachment image NULL "

//for email template in Date Alarm of Action Item
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_email_template_id' and t.table_name='ctx_ai_notification' ) " + & 
"alter table ctx_ai_notification add alm_email_template_id int NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_message_blob' and t.table_name='ctx_ai_notification' ) " + & 
"alter table ctx_ai_notification add alm_message_blob image NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_attachment_name' and t.table_name='ctx_ai_notification' ) " + & 
"alter table ctx_ai_notification add alm_attachment_name varchar(100) NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_attachment' and t.table_name='ctx_ai_notification' ) " + & 
"alter table ctx_ai_notification add alm_attachment image NULL "

//for email template in Date Alarm of document manager Action Item
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_email_template_id' and t.table_name='ctx_am_ai_notification' ) " + & 
"alter table ctx_am_ai_notification add alm_email_template_id int NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_message_blob' and t.table_name='ctx_am_ai_notification' ) " + & 
"alter table ctx_am_ai_notification add alm_message_blob image NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_attachment_name' and t.table_name='ctx_am_ai_notification' ) " + & 
"alter table ctx_am_ai_notification add alm_attachment_name varchar(100) NULL "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( select TOP 1 1  from sys.syscolumn c, sys.systable t where c.table_id=t.table_id and " + &
"   c.column_name='alm_attachment' and t.table_name='ctx_am_ai_notification' ) " + & 
"alter table ctx_am_ai_notification add alm_attachment image NULL "
//----------End Added ---------------------------------------------------

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	" if not exists(    "+&
   " select TOP 1 1  from sys.syscolumn c, sys.systable t    "+&
   " where c.table_id=t.table_id    "+&
   "  and c.column_name='ColName'    "+&
   "  and t.table_name='lookup_coltitle')    "+&
" ALTER table lookup_coltitle add ColName varchar(30) null    "
 
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(     "+&
  " select TOP 1 1  from sys.syscolumn c, sys.systable t    "+&
  " where c.table_id=t.table_id     "+&
  "   and c.column_name='ColCoorX'    "+&
  "   and t.table_name='lookup_coltitle')    "+&
" ALTER table lookup_coltitle add ColCoorX int null    "
 
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(     "+&
  " select TOP 1 1  from sys.syscolumn c, sys.systable t    "+&
  " where c.table_id=t.table_id    "+&
  "   and c.column_name='ColWidth'    "+&
  "   and t.table_name='lookup_coltitle')    "+&
" ALTER table lookup_coltitle add ColWidth int null    "	

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 "if not exists(     "+&
  " select TOP 1 1  from sys.syscolumn c, sys.systable t    "+&
  " where c.table_id=t.table_id    "+&
  "   and c.column_name='preprocess_path'    "+&
  "   and t.table_name='import_hdr')    "+&
"   Alter table import_hdr add preprocess_path varchar(250) null   "
	
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 "	if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='app_stat_facility_label'       "+&
 "     and t.table_name='icred_settings')        "+&
"  ALTER table icred_settings add app_stat_facility_label varchar(50) null     "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='app_stat_app_label'       "+&
 "     and t.table_name='icred_settings')        "+&
"  ALTER table icred_settings add app_stat_app_label varchar(50) null     "


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 "if not exists(       "+&
 "  select 1 from sys.syscolumn c, sys.systable t       "+&
 "  where c.table_id=t.table_id       "+&
 "    and c.column_name='set_StAppImgInDB'       "+&
 "    and t.table_name='icred_settings')       "+&
"ALTER table icred_settings add set_StAppImgInDB int null default 0  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 from  sysobjects where  name='net_dev_action_images' and type = 'U')    "+&
"CREATE TABLE net_dev_action_images       "+&
"(      rec_id  numeric(10,0) not null,       "+&
"       prac_id numeric(10,0) not null,       "+&
"       app_id numeric(6,0) null,       "+&
"       image_type int null,       "+&
"       save_date datetime null,       "+&
"       image_data image ,       "+&
"       CONSTRAINT PK_NET_DEV_ACTION_IMAGES PRIMARY KEY (rec_id,prac_id)       "+&
")       "

//Add a field to indicate if the prompt of Imaging 360 to the user done - Alfee 07.10.2008
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='image_prompt_flag'       "+&
 "     and t.table_name='security_users')        "+&
"  ALTER table security_users add image_prompt_flag char(1) null     "

of_execute_sqls("of_ver80_patch_table1")
RETURN 1

end function

public function integer of_ver70_release_table1 ();
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='DB_CONTROL' " + &
	"            and   type = 'U') " + &
	"create table DB_CONTROL (    db_control_db        int                            not null,    contract_code_version int,    contract_database_version int,    module2_code_version int,    module2_database_version int,    module3_code_version int,    module3_database_version int,    module4_code_version int,    module4_database_version int,    module5_code_version int,    module5_database_version int,    primary key (db_control_db))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_ACTION_ITEMS' " + &
	"            and   type = 'U') " + &
	"create table CTX_ACTION_ITEMS (    ctx_action_item_id   int                            not null default autoincrement,    ctx_id               int                            not null,    action_type          numeric(6) null,    action_date          datetime null,    due_date             datetime null,    action_user          varchar(20) null,    action_status        numeric(6) null,    notes                varchar(255) null,    ALARMED              char(1)                     null   default 'N',    first_attempt        datetime null,    last_attempt         datetime null,    no_attempts          int null,    assigned_to          numeric(6,0) null,    print_flag           int         null                   default 0,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    default NULL,    Letter_flag          char(1)      null                  default 'N'          check (Letter_flag is null or ( Letter_flag in ('Y','N') )),    letter_to            int null,    letter_from          int null,    primary key (ctx_action_item_id, ctx_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_BASIC_INFO' " + &
	"            and   type = 'U') " + &
	"create table CTX_BASIC_INFO (    ctx_id               int                            not null,    category             numeric(6) null,    status               numeric(6) null,    app_facility         numeric(7,0) null,    facility_id          int null,    contract_type        numeric(6) null,    product_type         numeric(6) null,    product_name         varchar(150) null,    reimbursment_menth   numeric(6) null,    file_location        varchar(150) null,    effective_date       datetime null,    expriation_date      datetime null,    review_date          datetime null,    review_by            varchar(10) null,    term_date            datetime null,    term_reason          numeric(6) null,    last_revis_date      datetime null,    other_date_1         datetime null,    other_date_2         datetime null,    oc_signed_by         varchar(75) null,    oc_title             numeric(6) null,    oc_department        numeric(6) null,    oc_legal_rep         varchar(75) null,    cc_signed_by         varchar(75) null,    cc_title             varchar(75) null,    cc_department        varchar(75) null,    cc_legal_rep         varchar(75) null,    notes                varchar(2000) null,    keyword              varchar(30) null,    dvision              numeric(6) null,    custom_1             varchar(255) null,    custom_2             varchar(255) null,    custom_3             varchar(255) null,    custom_4             varchar(255) null,    custom_5             varchar(255) null,    custom_6             varchar(255) null,    custom_7             varchar(255) null,    custom_8             varchar(255) null,    custom_9             varchar(255) null,    custom_10            varchar(255) null,    group_multi_loc_id   numeric(6) null,    revision_reason      varchar(255) null,    group_id             numeric(6) null,    custom_date1         datetime null,    custom_date2         datetime null,    custom_date3         datetime null,    custom_date4         datetime null,    custom_date5         datetime null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_CONTACTS' " + &
	"            and   type = 'U') " + &
	"create table CTX_CONTACTS (    contact_id           int                            not null,    contact_type         numeric(6) null,    first_name           varchar(30)                    not null,    last_name            varchar(30)                    not null,    middle_name          varchar(30)      null               default 'NONE',    contact_title        varchar(50) null,    contact_department   numeric(6) null,    street_1             varchar(150)                   not null,    street_2             varchar(150) null,    street_3             Varchar(150) null,    city                 varchar(35)                    not null,    state                numeric(6)                     not null,    zip                  varchar(12)                    not null,    Contact_local        char(1) null,    custom_1             varchar(75) null,    custom_2             varchar(75) null,    custom_3             varchar(75) null,    custom_4             varchar(75) null,    custom_5             varchar(75) null,    custom_6             varchar(75) null,    custom_7             varchar(75) null,    custom_8             varchar(75) null,    custom_9             varchar(75) null,    custom_10            varchar(75) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    default NULL,    primary key (contact_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_CONTACTS_NUMBERS' " + &
	"            and   type = 'U') " + &
	"create table CTX_CONTACTS_NUMBERS (    contact_id           int                            not null,    contact_num_id       int                            not null default autoincrement,    via                  numeric(6) null,    phone                varchar(11) null,    ext                  varchar(10) null,    contact_email        varchar(50) null,    type                 int null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (contact_num_id, contact_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_CONTRACT_CONTACTS' " + &
	"            and   type = 'U') " + &
	"create table CTX_CONTRACT_CONTACTS (    ctx_id               int                            not null,    contact_id           int                            not null,    ic_area              char(1)                        not null,    association          varchar(100) null,    notes                varchar(255) null,    default_email        char(1)                        not null default 'N',    record_id            numeric(10)                    default NULL,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128),    updated_at_date_time datetime null,    primary key (ctx_id, contact_id, ic_area))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_CPT_CODES' " + &
	"            and   type = 'U') " + &
	"create table CTX_CPT_CODES (    cpt_code_id          int                            not null,    cpt_code             varchar(10)                    not null,    cpt_code_description varchar(2000)                  not null,    base_price           decimal null,    primary key (cpt_code_id, cpt_code))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_CPT_CODE_ITEM' " + &
	"            and   type = 'U') " + &
	"create table CTX_CPT_CODE_ITEM (    ITEM_ID              int                            not null,    CPT_CODE_ID          INT                            not null,    location_price       decimal null,    primary key (ITEM_ID, CPT_CODE_ID))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_ELEMENTS' " + &
	"            and   type = 'U') " + &
	"create table CTX_ELEMENTS (    ctx_elements_id      int                            not null,    CTX_REQ_PROFILE_HDR_id int                            not null,    ctx_req_tmplt_element_id int                            not null,    char_value           char(1) null,    integer_value        numeric(8,2) null,    date_value           datetime null,    field_value          varchar(50) null,    clause               long varchar null,    ctx_page             int null,    ct_x                 int null,    ct_y                 int null,    ctx_hilgt_x          int null,    ctx_hilgt_y          int null,    ctx_hilgt_h          int null,    ctc_hilgt_w          int null,    show_in_imaging      int null,    notes                varchar(1) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_elements_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_FEE_SCHED_DATA' " + &
	"            and   type = 'U') " + &
	"create table CTX_FEE_SCHED_DATA (    fee_sched_data_id    integer                        not null,    fee_sched_location_id int                            not null,    code                 varchar(10)                    not null,    office_fee           money null,    facility_fee         money null,    custom_fee           money null,    fee                  numeric(6) null,    precert              int null,    preauth              int null,    phys_fee             numeric(6) null,    custom_1             varchar(75) null,    custom_2             varchar(75) null,    custom_3             varchar(75) null,    custom_4             varchar(75) null,    custom_5             varchar(75) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (fee_sched_data_id, fee_sched_location_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_FEE_SCHED_HDR' " + &
	"            and   type = 'U') " + &
	"create table CTX_FEE_SCHED_HDR (    fee_sched_id         int                            not null,    ctx_id               int                            not null,    sched_type           numeric(6) null,    carve_out_type       numeric(6) null,    rate                 numeric(8,2) null,    fee_bonus            numeric(8,2) null,    custom_1             varchar(75) null,    custom_2             varchar(75) null,    custom_3             varchar(75) null,    custom_4             varchar(75) null,    custom_5             varchar(75) null,    notes                varchar(1) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (fee_sched_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_FEE_SCHED_LOCATIONS' " + &
	"            and   type = 'U') " + &
	"create table CTX_FEE_SCHED_LOCATIONS (    fee_sched_location_id int                            not null,    fee_sched_id         int                            not null,    location             numeric(6)                     not null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (fee_sched_location_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_FEE_SCHED_PRACS' " + &
	"            and   type = 'U') " + &
	"create table CTX_FEE_SCHED_PRACS (    fee_sched_id         int                            not null,    practitioner_id      numeric(6)                     not null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (fee_sched_id, practitioner_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_FILE_LOCATION' " + &
	"            and   type = 'U') " + &
	"create table CTX_FILE_LOCATION (    ctx_file_location_id int                            not null default autoincrement,    ctx_id               int                            not null,    ctx_file_location_path varchar(255) null,    ctx_file_location_comment varchar(255) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_file_location_id, ctx_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_HIERCHY_ACCESS' " + &
	"            and   type = 'U') " + &
	"create table CTX_HIERCHY_ACCESS (    item_id              int                            not null,    item_level           int                            not null,    parent_id            int null,    parent_level         int null,    primary key (item_id, item_level))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_IMAGE' " + &
	"            and   type = 'U') " + &
	"create table CTX_IMAGE (    image_id             int                            not null,    ctx_id               int                            not null,    image_version        int                            not null,    Locked_by            varchar(50) null,    lock_status          char(1) null,    image_file           image null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (image_id, ctx_id, image_version))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_IMAGES' " + &
	"            and   type = 'U') " + &
	"create table CTX_IMAGES (    image_id             int                            not null,    ctx_id               int                            not null,    media_type           numeric(6,0)                   not null,    file_name            varchar(100) null,    page_end             int null,    page_start           int null,    page_description     varchar(255) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (image_id, ctx_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_ITEM' " + &
	"            and   type = 'U') " + &
	"create table CTX_ITEM (    item_id              INT                            not null,    item_name            varchar(255)                   not null,    primary key (item_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_ITEM_HIERARCHY' " + &
	"            and   type = 'U') " + &
	"create table CTX_ITEM_HIERARCHY (    item_id              int null,    parent_id            int null,    item_level           int null)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_ITEM_LEVEL' " + &
	"            and   type = 'U') " + &
	"create table CTX_ITEM_LEVEL (    level_num            int                            not null,    level_name           varchar(255) null)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_LOC' " + &
	"            and   type = 'U') " + &
	"create table CTX_LOC (    ctx_id               int                            not null,    parent_comp_id       numeric(6)                     not null,    loc_id               numeric(6)                     not null,    group_number         varchar(15) null,    local                numeric(6) null,    end_date             datetime null,    term_reason          numeric(6) null,    start_date           datetime null,    custom_1             varchar(15) null,    custom_2             varchar(75) null,    custom_3             varchar(75) null,    custom_4             varchar(75) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_id, parent_comp_id, loc_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_LOCATION_CONTACTS' " + &
	"            and   type = 'U') " + &
	"create table CTX_LOCATION_CONTACTS (    loc_id               numeric(6)                     not null,    contact_id           int                            not null,    ctx_id              int not null,    parent_comp_id       numeric(6) not null,    CTX_loc_id           numeric(6)        null              default 0,    record_id            numeric(10)                    not null default NULL,    primary key (loc_id, contact_id, ctx_id, parent_comp_id))  "

is_sql_statements[upperbound(is_sql_statements) + 1] =  &
	"if exists(select 1 " + & 
	"from sys.sysforeignkey " + &
	"where role='FK_CTX_LOCA_FK_CTX_LO_CTX_CONT') then " + &
	"alter table CTX_LOCATION_CONTACTS       delete foreign key FK_CTX_LOCA_FK_CTX_LO_CTX_CONT end if  " 
is_sql_statements[upperbound(is_sql_statements) + 1] = &
	"if exists(select 1 from sys.sysforeignkey " + &
	"where role='FK_CTX_LOCA_FK_CTX_LO_CTX_LOC') then " + &
   "alter table CTX_LOCATION_CONTACTS       delete foreign key FK_CTX_LOCA_FK_CTX_LO_CTX_LOC end if  " 
is_sql_statements[upperbound(is_sql_statements) + 1] = &
	"if exists(select 1 from sys.sysforeignkey " + &
	"where role='FK_CTX_LOCA_REFERENCE_CTX_LOC1') then    " + &
	"alter table CTX_LOCATION_CONTACTS       delete foreign key FK_CTX_LOCA_REFERENCE_CTX_LOC1 end if  " 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.pkey='Y' " + &
	"     and c.column_name ='ctx_id' " + &
	"     and t.table_name='CTX_LOCATION_CONTACTS') " + &
	"alter table CTX_LOCATION_CONTACTS delete primary key  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_LOCATION_CONTACTS modify ctx_id int not null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_LOCATION_CONTACTS modify parent_comp_id numeric(6) not null"
	
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_LOCATION_CONTACTS add primary key (loc_id, contact_id, ctx_id, parent_comp_id) "


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_LOCATION_SPECIALTY' " + &
	"            and   type = 'U') " + &
	"create table CTX_LOCATION_SPECIALTY (    ctx_id               int                            not null,    parent_comp_id       numeric(6)                     not null,    loc_id               numeric(6)                     not null default 0,    Prac_specialty       numeric(6)                     not null,    record_id            numeric(10)                    not null default NULL,    primary key (loc_id, Prac_specialty, parent_comp_id, ctx_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_NOTIFICATION' " + &
	"            and   type = 'U') " + &
	"create table CTX_NOTIFICATION (    ctx_id               int                            not null,    alm_message          varchar(255) null,    alm_enabled          char(1) null,    alm_table            varchar(40)                    not null,    alm_column           varchar(40)                    not null,    alm_notification_days int null,    alm_last_notification_sent datetime null,    alm_post_notification_days int null,    alm_total_tries      int null,    alm_action_item_posted int null,    alm_total_tries_counter int null,    alm_frequency        int null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_id, alm_table, alm_column))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_NOTIFICATION_USERS' " + &
	"            and   type = 'U') " + &
	"create table CTX_NOTIFICATION_USERS (    ctx_id               int                            not null,    user_id              char(10)                       not null,    alm_table            varchar(40)                    not null,    alm_column           varchar(40)                    not null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_id, user_id, alm_table, alm_column))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_ORGS' " + &
	"            and   type = 'U') " + &
	"create table CTX_ORGS (    org_id               int                            not null,    org_name             varchar(255)                   not null,    org_type             numeric(6)                     not null,    status               numeric(6) null,    street_1             varchar(150) null,    street_2             varchar(150) null,    street_3             varchar(150) null,    city                 varchar(35) null,    state                numeric(6) null,    zip                  varchar(12) null,    drections            varchar(1) null,    notes                varchar(1) null,    custom_1             varchar(75) null,    custom_2             varchar(75) null,    custom_3             varchar(75) null,    custom_4             varchar(75) null,    custom_5             varchar(75) null,    custom_6             varchar(75) null,    custom_7             varchar(75) null,    custom_8             varchar(75) null,    custom_9             varchar(75) null,    custom_10            varchar(75) null,    inserted_at_date_time datetime null,    inserted_by_user     varchar(128) null,    updated_at_date_time datetime null,    updated_by_user      varchar(128) null,    record_id            numeric(10)                    not null default NULL,    primary key (org_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_ORGS_CONTACT' " + &
	"            and   type = 'U') " + &
	"create table CTX_ORGS_CONTACT (    ctx_id               int                            not null,    org_id               int                            not null,    area                 char(1)                        not null,    notes                varchar(1) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_id, org_id, area))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_ORG_CONTACT' " + &
	"            and   type = 'U') " + &
	"create table CTX_ORG_CONTACT (    org_contact_id       int                            not null default autoincrement,    org_id               int                            not null,    contact_name         varchar(75) null,    department           varchar(75) null,    via                  numeric(6) null,    phone                varchar(12) null,    org_cnt_email        varchar(255) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (org_id, org_contact_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_REPORT_PROFILE_DET' " + &
	"            and   type = 'U') " + &
	"create table CTX_REPORT_PROFILE_DET (    ctx_rpt_prfl_det_id  int                            not null default autoincrement,    ctx_rpt_prfl_id      int                            not null,    lookup_code          numeric(6,0) null,    field_id             int null,    primary key (ctx_rpt_prfl_id, ctx_rpt_prfl_det_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_REQ_PROFILE' " + &
	"            and   type = 'U') " + &
	"create table CTX_REQ_PROFILE (    ctx_req_profile_id   int                            not null,    rqmnt_name           varchar(100) null,    rqmnt_description    varchar(255) null,    rqmnt_type           numeric(8,0) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_req_profile_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_REQ_PROFILE_HDR' " + &
	"            and   type = 'U') " + &
	"create table CTX_REQ_PROFILE_HDR (    CTX_REQ_PROFILE_HDR_id int                            not null,    ctx_req_profile_id   int                            not null,    ctx_id               int                            not null,    moduser              varchar(30) null,    modification_date    datetime       null                 default getdate(),    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (CTX_REQ_PROFILE_HDR_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_REQ_TMPLT_ELEMENT' " + &
	"            and   type = 'U') " + &
	"create table CTX_REQ_TMPLT_ELEMENT (    ctx_req_tmplt_element_id int                            not null,    ctx_req_profile_id   int                            not null,    ctx_rqmnt_category_id int                            not null,    element_name         varchar(150) null,    element_sort         int null,    value_type           int null,    dddw_name            varchar(40) null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime,    updated_at_date_time datetime null,    updated_by_user      varchar(128) null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_req_tmplt_element_id, ctx_req_profile_id, ctx_rqmnt_category_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_RQMNT_CATEGORY' " + &
	"            and   type = 'U') " + &
	"create table CTX_RQMNT_CATEGORY (    ctx_rqmnt_category_id int                            not null,    ctx_req_profile_id   int                            not null,    category_name        varchar(100) null,    sort_id              int null,    moduser              varchar(30) null,    modification_date    datetime null,    inserted_by_user     varchar(128) null,    inserted_at_date_time datetime null,    updated_by_user      varchar(128) null,    updated_at_date_time datetime null,    record_id            numeric(10)                    not null default NULL,    primary key (ctx_rqmnt_category_id, ctx_req_profile_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='DB_CONTROL' " + &
	"            and   type = 'U') " + &
	"create table DB_CONTROL (    db_control_db        int                            not null,    contract_code_version int null,    contract_database_version int null,    module2_code_version int null,    module2_database_version int null,    module3_code_version int null,    module3_database_version int null,    module4_code_version int null,    module4_database_version int null,    module5_code_version int,    module5_database_version int null,    primary key (db_control_db))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_report_profile_hdr' " + &
	"            and   type = 'U') " + &
	"create table ctx_report_profile_hdr (    ctx_rpt_prfl_id      int                            not null,    ctx_rpt_prfl_comment varchar(255) null,    primary key (ctx_rpt_prfl_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_FEE_SCHED_NM' " + &
	"            and   type = 'U') " + &
	"create table CTX_FEE_SCHED_NM (ctx_id int not null,fee_sched_nm_id int not null,category numeric(6,0) null,service_item         numeric(6,0) null, description          varchar(256) null, fee                  money null,item_status          numeric(6,0) null,start_date           datetime null, end_date             datetime null, service_name         numeric(6,0) null,custom_int1          int null,custom_int2          int null,custom_fee1          money null,custom_fee2          money null,custom_fee3          money null, custom_text1         varchar(255) null, custom_text2         varchar(255) null, custom_text3         varchar(255) null,notes                varchar(2000) null,record_id            numeric(10) null,primary key (ctx_id, fee_sched_nm_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_products' " + &
	"            and   type = 'U') " + &
	"create table ctx_products ( product_id            numeric(6,0) not null, " + &
	"ctx_id int not null, " + &
	" product_type          numeric(6,0) not null, " + &
	" custom_1              varchar(255) null, " + &
	" custom_2              varchar(255) null, " + &
	" custom_date1          datetime null, " + &
	" custom_date2          datetime null, " + &
	" custom_date3          datetime null, " + &
	" record_id             numeric(10)  null default NULL, " + &
	" inserted_by_user      varchar(128) null, " + &
	" inserted_at_date_time datetime null, " + &
	" updated_by_user       varchar(128) null, " + &
	" updated_at_date_time  datetime null, " + &
	" primary key (product_id, ctx_id, product_type))     "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='CTX_LOCATION_PRACS' " + &
	"            and   type = 'U') " + &
	"create table CTX_LOCATION_PRACS (ctx_id  int not null, parent_comp_id       numeric(6)                     not null,loc_id               numeric(6)                     not null,gp_rec_id            numeric(10)                    not null, status               numeric(6) null, record_id            numeric(6) null, primary key (ctx_id, parent_comp_id, loc_id, gp_rec_id) ) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='appt_stat_id' " + &
	"     and t.table_name='pd_priv_list') " + &
	"ALTER table pd_priv_list add appt_stat_id numeric(10,0) null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='rate' " + &
	"     and t.table_name='CTX_FEE_SCHED_HDR') " + &
	"alter table CTX_FEE_SCHED_HDR   delete rate   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='fee_bonus' " + &
	"     and t.table_name='CTX_FEE_SCHED_HDR') " + &
	"alter table CTX_FEE_SCHED_HDR   delete fee_bonus   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='effective_date' " + &
	"     and t.table_name='CTX_FEE_SCHED_DATA') " + &
	"ALTER table CTX_FEE_SCHED_DATA add effective_date datetime null default today()   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='expiration_date' " + &
	"     and t.table_name='CTX_FEE_SCHED_DATA') " + &
	"ALTER table CTX_FEE_SCHED_DATA add expiration_date      datetime null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='status' " + &
	"     and t.table_name='CTX_FEE_SCHED_DATA') " + &
	"ALTER table CTX_FEE_SCHED_DATA add    status 		     numeric(6) null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='base_price' " + &
	"     and t.table_name='CTX_FEE_SCHED_DATA') " + &
	"ALTER table CTX_FEE_SCHED_DATA add base_price   money null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='fee_basis' " + &
	"     and t.table_name='CTX_FEE_SCHED_DATA') " + &
	"ALTER table CTX_FEE_SCHED_DATA add fee_basis   money null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE CTX_FEE_SCHED_DATA modify fee     money null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if  exists( " + &
	"	select top 1 1  from  " + &
	"	SYSCOLUMN,SYSTABLE " + &
	"	where SYSCOLUMN.table_id=SYSTABLE.table_id  " + &
	"	and SYSTABLE.table_name='CTX_FEE_SCHED_DATA'  " + &
	"	and pkey='Y') " + &
	"alter table CTX_FEE_SCHED_DATA   delete primary key   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_FEE_SCHED_DATA   add primary key(fee_sched_data_id, fee_sched_location_id, record_id)   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE sys_tables  MODIFY table_name_allias  CHAR( 100) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE ctx_action_items modify notes  varchar(2000) NULL "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='rate' " + &
	"     and t.table_name='CTX_FEE_SCHED_LOCATIONS') " + &
	"ALTER table CTX_FEE_SCHED_LOCATIONS add rate                 numeric(8,2) null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='fee_bonus' " + &
	"     and t.table_name='CTX_FEE_SCHED_LOCATIONS') " + &
	"ALTER table CTX_FEE_SCHED_LOCATIONS add fee_bonus            int null   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE CTX_ITEM_HIERARCHY modify item_id not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE CTX_ITEM_HIERARCHY modify parent_id not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE CTX_ITEM_HIERARCHY modify item_level not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.pkey='Y' " + &
	"     and t.table_name='CTX_ITEM_HIERARCHY') " + &
	"alter table CTX_ITEM_HIERARCHY   add primary key(item_id, parent_id, item_level) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE CTX_ITEM_LEVEL modify level_name not null " + &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.pkey='Y' " + &
	"     and t.table_name='CTX_ITEM_LEVEL') " + &
	"alter table CTX_ITEM_LEVEL   add primary key(level_num, level_name) "


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='create_action_item' " + &
	"     and t.table_name='CTX_NOTIFICATION') " + &
	"ALTER table CTX_NOTIFICATION add create_action_item   char(1)                        default 'N'   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_orgs_contact modify notes varchar(2000) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_FEE_SCHED_HDR modify notes varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='user_d' " + &
	"     and t.table_name='ctx_contacts') " + &
	"alter table ctx_contacts add  user_d char(10) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='owner' " + &
	"     and t.table_name='ctx_contract_contacts') " + &
	"alter table ctx_contract_contacts add  owner char(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='access' " + &
	"     and t.table_name='ctx_contract_contacts') " + &
	"alter table ctx_contract_contacts add access char(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='image_type' " + &
	"     and t.table_name='ctx_images') " + &
	"alter table ctx_images add  image_type numeric(6,0) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='billing_cycle' " + &
	"     and t.table_name='CTX_FEE_SCHED_NM') " + &
	"alter table CTX_FEE_SCHED_NM add  billing_cycle        numeric(6,0) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='contact_type2' " + &
	"     and t.table_name='ctx_contacts') " + &
	"alter table ctx_contacts add contact_type2 char(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='prac_id' " + &
	"     and t.table_name='CTX_LOCATION_PRACS') " + &
	"alter table CTX_LOCATION_PRACS add prac_id   numeric(6)  not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='start_date' " + &
	"     and t.table_name='CTX_LOCATION_PRACS') " + &
	"alter table CTX_LOCATION_PRACS add start_date datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='end_date' " + &
	"     and t.table_name='CTX_LOCATION_PRACS') " + &
	"alter table CTX_LOCATION_PRACS add end_date datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_LOCATION_PRACS delete primary key "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_LOCATION_PRACS add primary key (ctx_id, parent_comp_id, loc_id, gp_rec_id, prac_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_CONTACTS modify middle_name default '' "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_contacts modify  zip null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_contacts modify  state null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_contacts modify street_1 null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_contacts modify city null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_orgs modify notes varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_orgs modify drections varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACTI_FK_CTX_AC_CTX_CONT_') alter table Ctx_Action_Items   add foreign key FK_CTX_ACTI_FK_CTX_AC_CTX_CONT_ (letter_from)      references CTX_CONTACTS (contact_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACTI_REFERENCE_CODE_LOO_ACTION_TYPE') alter table CTX_ACTION_ITEMS   add foreign key FK_CTX_ACTI_REFERENCE_CODE_LOO_ACTION_TYPE (action_type)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACTI_REFERENCE_CODE_LOO_action_status') alter table CTX_ACTION_ITEMS   add foreign key FK_CTX_ACTI_REFERENCE_CODE_LOO_action_status (action_status)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACTI_FK_CTX_AC_CTX_BASI') alter table CTX_ACTION_ITEMS   add foreign key FK_CTX_ACTI_FK_CTX_AC_CTX_BASI (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACTI_FK_CTX_AC_CTX_CONT') alter table CTX_ACTION_ITEMS   add foreign key FK_CTX_ACTI_FK_CTX_AC_CTX_CONT (letter_to)      references CTX_CONTACTS (contact_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_BASI_FK_CTX_BA_CODE_LOO') alter table CTX_BASIC_INFO   add foreign key FK_CTX_BASI_FK_CTX_BA_CODE_LOO (category)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_BASI_REFERENCE_CODE_LOO_DIVISION') alter table CTX_BASIC_INFO   add foreign key FK_CTX_BASI_REFERENCE_CODE_LOO_DIVISION (dvision)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_BASI_REFERENCE_CODE_LOO_OC_DEPARTMENT') alter table CTX_BASIC_INFO   add foreign key FK_CTX_BASI_REFERENCE_CODE_LOO_OC_DEPARTMENT (oc_department)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_BASI_REFERENCE_CODE_LOO_OC_TITLE') alter table CTX_BASIC_INFO   add foreign key FK_CTX_BASI_REFERENCE_CODE_LOO_OC_TITLE (oc_title)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_BASI_REFERENCE_CODE_LOO_TERM_REASON') alter table CTX_BASIC_INFO   add foreign key FK_CTX_BASI_REFERENCE_CODE_LOO_TERM_REASON (term_reason)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_BASI_REFERENCE_CODE_LOO_contract_type') alter table CTX_BASIC_INFO   add foreign key FK_CTX_BASI_REFERENCE_CODE_LOO_contract_type (contract_type)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_BASI_REFERENCE_CODE_LOO_status') alter table CTX_BASIC_INFO   add foreign key FK_CTX_BASI_REFERENCE_CODE_LOO_status (status)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_BASI_info_product_type') alter table CTX_BASIC_INFO   add foreign key FK_CTX_BASI_info_product_type (product_type)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_CONT_FK_CTX_CO_CTX_CONT2') alter table CTX_CONTACTS_NUMBERS   add foreign key FK_CTX_CONT_FK_CTX_CO_CTX_CONT2 (contact_id)      references CTX_CONTACTS (contact_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_CONT_REFERENCE_CODE_LOO_CTX_TYPE') alter table CTX_CONTACTS   add foreign key FK_CTX_CONT_REFERENCE_CODE_LOO_CTX_TYPE (contact_type)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_CONT_REFERENCE_CODE_LOO_STATE') alter table CTX_CONTACTS   add foreign key FK_CTX_CONT_REFERENCE_CODE_LOO_STATE (state)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_CONT_REFERENCE_CODE_LOO_VIA') alter table CTX_CONTACTS_NUMBERS   add foreign key FK_CTX_CONT_REFERENCE_CODE_LOO_VIA (via)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_CONT_FK_CTX_CO_CTX_BASI') alter table CTX_CONTRACT_CONTACTS   add foreign key FK_CTX_CONT_FK_CTX_CO_CTX_BASI (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_CONT_FK_CTX_CO_CTX_CONT') alter table CTX_CONTRACT_CONTACTS   add foreign key FK_CTX_CONT_FK_CTX_CO_CTX_CONT (contact_id)      references CTX_CONTACTS (contact_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_CPT__FK_CTX_CP_CTX_ITEM') alter table CTX_CPT_CODE_ITEM   add foreign key FK_CTX_CPT__FK_CTX_CP_CTX_ITEM (ITEM_ID)      references CTX_ITEM (item_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ELEM_FK_CTX_EL_CTX_REQ_') alter table CTX_ELEMENTS   add foreign key FK_CTX_ELEM_FK_CTX_EL_CTX_REQ_ (CTX_REQ_PROFILE_HDR_id)      references CTX_REQ_PROFILE_HDR (CTX_REQ_PROFILE_HDR_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__FK_CTX_FE_CTX_FEE_2') alter table CTX_FEE_SCHED_DATA   add foreign key FK_CTX_FEE__FK_CTX_FE_CTX_FEE_2 (fee_sched_location_id)      references CTX_FEE_SCHED_LOCATIONS (fee_sched_location_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__FK_CTX_FE_CTX_FEE_LOCATIONS') alter table CTX_FEE_SCHED_LOCATIONS   add foreign key FK_CTX_FEE__FK_CTX_FE_CTX_FEE_LOCATIONS (fee_sched_id)      references CTX_FEE_SCHED_HDR (fee_sched_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__REFERENCE_CODE_LOO_cave_out') alter table CTX_FEE_SCHED_HDR   add foreign key FK_CTX_FEE__REFERENCE_CODE_LOO_cave_out (carve_out_type)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__REFERENCE_CODE_LOO_location') alter table CTX_FEE_SCHED_LOCATIONS   add foreign key FK_CTX_FEE__REFERENCE_CODE_LOO_location (location)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__REFERENCE_CODE_LOO_physl_fee') alter table CTX_FEE_SCHED_DATA   add foreign key FK_CTX_FEE__REFERENCE_CODE_LOO_physl_fee (phys_fee)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__REFERENCE_CODE_LOO_sched_type') alter table CTX_FEE_SCHED_HDR   add foreign key FK_CTX_FEE__REFERENCE_CODE_LOO_sched_type (sched_type)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__FK_CTX_FE_CTX_BASI') alter table CTX_FEE_SCHED_HDR   add foreign key FK_CTX_FEE__FK_CTX_FE_CTX_BASI (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__FK_CTX_FE_CTX_FEE_') alter table CTX_FEE_SCHED_PRACS   add foreign key FK_CTX_FEE__FK_CTX_FE_CTX_FEE_ (fee_sched_id)      references CTX_FEE_SCHED_HDR (fee_sched_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__REFERENCE_PD_BASIC_prac_id') alter table CTX_FEE_SCHED_PRACS   add foreign key FK_CTX_FEE__REFERENCE_PD_BASIC_prac_id (practitioner_id)      references pd_basic (prac_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FILE_FK_CTX_FI_CTX_BASI') alter table CTX_FILE_LOCATION   add foreign key FK_CTX_FILE_FK_CTX_FI_CTX_BASI (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_HIER_FK_CTX_HI_CTX_ITEM') alter table CTX_HIERCHY_ACCESS   add foreign key FK_CTX_HIER_FK_CTX_HI_CTX_ITEM (item_id)      references CTX_ITEM (item_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_HIER_REFERENCE_CTX_ITEM_itm_lvl') alter table CTX_HIERCHY_ACCESS   add foreign key FK_CTX_HIER_REFERENCE_CTX_ITEM_itm_lvl (item_level)      references CTX_ITEM (item_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_IMAG_FK_CTX_IM_CTX_IMAG') alter table CTX_IMAGES   add foreign key FK_CTX_IMAG_FK_CTX_IM_CTX_BASI (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_IMAG_FK_CTX_IM_CTX_IMAG') alter table CTX_IMAGE   add foreign key FK_CTX_IMAG_FK_CTX_IM_CTX_IMAG (ctx_id, image_id)      references CTX_IMAGES (ctx_id, image_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ITEM_REFERENCE_CTX_ITEM_itm_itm') alter table CTX_ITEM_HIERARCHY   add foreign key FK_CTX_ITEM_REFERENCE_CTX_ITEM_itm_itm (item_id)      references CTX_ITEM (item_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ITEM_REFERENCE_CTX_ITEM_parent_itm') alter table CTX_ITEM_HIERARCHY   add foreign key FK_CTX_ITEM_REFERENCE_CTX_ITEM_parent_itm (parent_id)      references CTX_ITEM (item_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_LOCA_REFERENCE_CODE_LOOKUP_LOOLUP_CODE') alter table CTX_LOCATION_SPECIALTY   add foreign key FK_CTX_LOCA_REFERENCE_CODE_LOOKUP_LOOLUP_CODE (Prac_specialty)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_LOCA_FK_CTX_LO_CTX_CONT') alter table CTX_LOCATION_CONTACTS   add foreign key FK_CTX_LOCA_FK_CTX_LO_CTX_CONT (contact_id)      references CTX_CONTACTS (contact_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_LOCA_FK_CTX_LO_CTX_LOC') alter table CTX_LOCATION_CONTACTS   add foreign key FK_CTX_LOCA_FK_CTX_LO_CTX_LOC (ctx_id, parent_comp_id, loc_id)      references CTX_LOC (ctx_id, parent_comp_id, loc_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_LOCA_REFERENCE_CTX_LOC1') alter table CTX_LOCATION_CONTACTS   add foreign key FK_CTX_LOCA_REFERENCE_CTX_LOC1 (loc_id, parent_comp_id, ctx_id)      references CTX_LOC (loc_id, parent_comp_id, ctx_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_LOCA_REFERENCE_CTX_LOCCATION_SPEC_LOC_ID') alter table CTX_LOCATION_SPECIALTY   add foreign key FK_CTX_LOCA_REFERENCE_CTX_LOCCATION_SPEC_LOC_ID (loc_id, ctx_id, parent_comp_id)      references CTX_LOC (loc_id, ctx_id, parent_comp_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_LOC_FK_CTX_LO_CTX_BASI') alter table CTX_LOC   add foreign key FK_CTX_LOC_FK_CTX_LO_CTX_BASI (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_NOTI_FK_CTX_NO_CTX_BASI') alter table CTX_NOTIFICATION_USERS   add foreign key FK_CTX_NOTI_FK_CTX_NO_CTX_BASI (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_NOTI_FK_CTX_NO_CTX_NOTI') alter table CTX_NOTIFICATION_USERS   add foreign key FK_CTX_NOTI_FK_CTX_NO_CTX_NOTI (ctx_id, alm_column, alm_table)      references CTX_NOTIFICATION (ctx_id, alm_column, alm_table)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ORGS_REFERENCE_CODE_LOO_org_type') alter table CTX_ORGS   add foreign key FK_CTX_ORGS_REFERENCE_CODE_LOO_org_type (org_type)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ORGS_REFERENCE_CODE_LOO_state') alter table CTX_ORGS   add foreign key FK_CTX_ORGS_REFERENCE_CODE_LOO_state (state)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ORGS_REFERENCE_CODE_LOO_status') alter table CTX_ORGS   add foreign key FK_CTX_ORGS_REFERENCE_CODE_LOO_status (status)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ORGS_FK_CTX_OR_CTX_BASI') alter table CTX_ORGS_CONTACT   add foreign key FK_CTX_ORGS_FK_CTX_OR_CTX_BASI (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ORGS_FK_CTX_OR_CTX_ORGS') alter table CTX_ORGS_CONTACT   add foreign key FK_CTX_ORGS_FK_CTX_OR_CTX_ORGS (org_id)      references CTX_ORGS (org_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ORG__REFERENCE_CODE_LOO_via') alter table CTX_ORG_CONTACT   add foreign key FK_CTX_ORG__REFERENCE_CODE_LOO_via (via)      references code_lookup (lookup_code)      on update restrict      on delete restrict   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ORG__FK_CTX_OR_CTX_ORGS') alter table CTX_ORG_CONTACT   add foreign key FK_CTX_ORG__FK_CTX_OR_CTX_ORGS (org_id)      references CTX_ORGS (org_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_REPO_FK_CTX_RE_CTX_REPO') alter table CTX_REPORT_PROFILE_DET   add foreign key FK_CTX_REPO_FK_CTX_RE_CTX_REPO (ctx_rpt_prfl_id)      references ctx_report_profile_hdr (ctx_rpt_prfl_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_REQ__REFERENCE_CTX_REQ') alter table CTX_REQ_TMPLT_ELEMENT   add foreign key FK_CTX_REQ__REFERENCE_CTX_REQ (ctx_req_profile_id)      references CTX_REQ_PROFILE (ctx_req_profile_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_REQ__FK_CTX_RE_CTX_REQ_') alter table CTX_REQ_PROFILE_HDR  add foreign key FK_CTX_REQ__FK_CTX_RE_CTX_REQ_ (ctx_req_profile_id)      references CTX_REQ_PROFILE (ctx_req_profile_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_RQMN_FK_CTX_RQ_CTX_REQ_') alter table CTX_RQMNT_CATEGORY   add foreign key FK_CTX_RQMN_FK_CTX_RQ_CTX_REQ_ (ctx_req_profile_id)      references CTX_REQ_PROFILE (ctx_req_profile_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_ctx_notification_to_ctx_basic_info') alter table CTX_NOTIFICATION     add foreign key FK_ctx_notification_to_ctx_basic_info (ctx_id)      references CTX_BASIC_INFO (ctx_id)      on update restrict      on delete cascade   "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_LOCA_REFERENCE_CTX_LOC') alter table CTX_LOCATION_PRACS   add foreign key FK_CTX_LOCA_REFERENCE_CTX_LOC (ctx_id, parent_comp_id, loc_id)      references CTX_LOC (ctx_id, parent_comp_id, loc_id)      on update restrict      on delete cascade  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_contacts_user') alter table ctx_contacts         add foreign key FK_contacts_user (user_d) references security_users (user_id) on update restrict  on delete restrict  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_FEE__REFERENCE_CTX_BASI') alter table CTX_FEE_SCHED_NM     add foreign key FK_CTX_FEE__REFERENCE_CTX_BASI (ctx_id) references CTX_BASIC_INFO (ctx_id) on update restrict on delete cascade  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_LOCA_REFERENCE_GROUP_PR') alter table CTX_LOCATION_PRACS   add foreign key FK_CTX_LOCA_REFERENCE_GROUP_PR (gp_rec_id) references group_practice (rec_id) on update restrict on delete restrict  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='Fk_Ctx_Prod_Reference_Ctx_Basi') alter table ctx_products         add foreign key Fk_Ctx_Prod_Reference_Ctx_Basi (ctx_id) references CTX_BASIC_INFO (ctx_id)  on update restrict  on delete cascade  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACTI_FK_CTX_AC_CTX_CONT') alter table CTX_ACTION_ITEMS       delete foreign key FK_CTX_ACTI_FK_CTX_AC_CTX_CONT "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.pkey='Y' " + &
	"     and t.table_name='CTX_NOTIFICATION_USERS') " + &
	"ALTER TABLE CTX_NOTIFICATION_USERS DELETE  PRIMARY KEY "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE CTX_NOTIFICATION_USERS modify user_id varchar(10) not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE CTX_NOTIFICATION_USERS ADD PRIMARY KEY (ctx_id,user_id,alm_table,alm_column) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete From sys_fields where table_id = 54 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete From sys_fields where table_id = 56 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete from sys_tables where table_id = 54 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete from sys_tables where table_id = 56 "


of_execute_sqls("of_ver70_release_table1")
RETURN 1

end function

public function integer of_ver70_release_table2 ();
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_screen' " + &
	"            and   type = 'U') " + &
	"Create table ctx_screen (data_view_id integer  not null,screen_id integer not null,tab_name varchar(200) null,screen_name varchar(255) null,dw_name	varchar(200) null,dataobject varchar(200) null,description varchar(255) null,dw_sql text null,create_date datetime null,modify_date datetime null,PRIMARY KEY (data_view_id,screen_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_version' " + &
	"            and   type = 'U') " + &
	"Create table ctx_version(ctx_id int not null,version_id int not null,version_number varchar(15) not null,version_date datetime null,user_id varchar(20) null,old_value varchar(100) null,new_value varchar(100) null,PRIMARY KEY ( ctx_id,version_id )) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='sys_lookup' " + &
	"            and   type = 'U') " + &
	"Create Table sys_lookup (lookup_name varchar(35) NOT NULL ,PRIMARY KEY (lookup_name)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='type_c' " + &
	"     and t.table_name='data_view') " + &
	"alter table data_view add  type_c varchar(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='contract_default_view' " + &
	"     and t.table_name='security_users') " + &
	"alter table security_users add  contract_default_view integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_11' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_11 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_12' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_12 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_13' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_13 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_14' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_14 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_15' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_15 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_16' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_16 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_17' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_17 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_18' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_18 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_19' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_19 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_20' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_20 varchar(255) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date6' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date6 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date7' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date7 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date8' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date8 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date9' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date9 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date10' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date10 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date11' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date11 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date12' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date12 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date13' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date13 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date14' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date14 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_date15' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_date15 datetime  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n1' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n1 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n2' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n2 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n3' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n3 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n4' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n4 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n5' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n5 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n6' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n6 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n7' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n7 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n8' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n8 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n9' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n9 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n10' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  custom_n10 numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='version_number' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  version_number varchar(15) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='version_date' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add  version_date 	datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='master_contract_id' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add master_contract_id numeric(6,0) null default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='master_contract_name' " + &
	"     and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info add master_contract_name varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_text4' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_text4 varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_text5' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_text5 varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_text6' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_text6 varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_text7' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_text7 varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_text8' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_text8 varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n1' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_n1 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n2' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_n2 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n3' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_n3 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n4' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_n4 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='custom_n5' " + &
	"     and t.table_name='ctx_fee_sched_nm') " + &
	"alter table ctx_fee_sched_nm add  custom_n5 numeric(10,3) null "


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='drg_code' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD drg_code VARCHAR(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='rev_code' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD rev_code VARCHAR(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='claim_type' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD claim_type NUMERIC(8,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='flat_fee' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD flat_fee NUMERIC(10,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='cpt_code_set' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD cpt_code_set NUMERIC(8,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='reimburse_type' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD reimburse_type NUMERIC(8,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='disc_start_perc' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD disc_start_perc NUMERIC(3,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='end_day' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD end_day INTEGER null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='carve_out_day' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD carve_out_day INTEGER null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='sl_threshold' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD sl_threshold NUMERIC(10,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='sl_reimburse_type' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD sl_reimburse_type NUMERIC(8,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='sl_rate' " + &
	"     and t.table_name='ctx_fee_sched_data') " + &
	"ALTER TABLE ctx_fee_sched_data ADD sl_rate NUMERIC(10,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='alm_auto_increment_years' " + &
	"     and t.table_name='ctx_notification') " + &
	"ALTER TABLE ctx_notification ADD alm_auto_increment_years INTEGER NULL "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='alm_table' " + &
	"     and t.table_name='ctx_action_items') " + &
	"ALTER TABLE ctx_action_items ADD alm_table VARCHAR(40) NULL "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='alm_column' " + &
	"     and t.table_name='ctx_action_items') " + &
	"ALTER TABLE ctx_action_items ADD alm_column VARCHAR(40) NULL "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='set_autoresize' " + &
	"     and t.table_name='icred_settings') " + &
	"Alter table icred_settings add set_autoresize int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='ctx_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add ctx_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='ctx_acp_folder_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add ctx_acp_folder_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='ctx_acp_clause_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add ctx_acp_clause_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='ctx_acp_template_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add ctx_acp_template_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='ctx_acp_document_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add ctx_acp_document_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='facility_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add facility_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='contact_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add contact_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='email_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add email_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='user_facility_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add user_facility_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='user_view_id' " + &
	"     and t.table_name='ids') " + &
	"Alter table ids add user_view_id numeric(6) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='Large_Description_1' " + &
	"     and t.table_name='address_lookup') " + &
	"alter table address_lookup add  Large_Description_1 varchar(2000) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='Large_Description_2' " + &
	"     and t.table_name='address_lookup') " + &
	"alter table address_lookup add  Large_Description_2 varchar(2000) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='Large_Description_1' " + &
	"     and t.table_name='code_lookup') " + &
	"alter table code_lookup add  Large_Description_1 varchar(2000) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='Large_Description_2' " + &
	"     and t.table_name='code_lookup') " + &
	"alter table code_lookup add  Large_Description_2 varchar(2000) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='contact_type2' " + &
	"     and t.table_name='app_facility') " + &
	"alter table app_facility add contact_type2 varchar(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='corp_office_flag' " + &
	"     and t.table_name='app_facility') " + &
	"alter table app_facility add corp_office_flag int null default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='corp_office_link' " + &
	"     and t.table_name='app_facility') " + &
	"alter table app_facility add corp_office_link int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='street_3' " + &
	"     and t.table_name='app_facility') " + &
	"alter table app_facility add street_3 varchar(150) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='street_0' " + &
	"     and t.table_name='app_facility') " + &
	"begin " + &
	"  Update app_facility Set street_3 = street_0  where street_3 is null " + &
	"  alter table app_facility drop street_0 " + &
	"end "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='facility_id' " + &
	"     and t.table_name='ctx_contacts') " + &
	"alter table ctx_contacts add facility_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n1 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n2 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n3 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n4 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n5 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n6 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n7 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n8 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n9 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_basic_info modify custom_n10 numeric(12,2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table app_facility modify facility_name varchar(150) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table app_facility modify street varchar(150) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table app_facility modify street_2 varchar(150) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table app_facility modify street_3 varchar(150) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table export_header modify strip_char varchar(8) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table conv_view modify view_name varchar(30) not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table conv_view modify post_import_sql varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.sysindex i, sys.systable t " + &
	"   where i.table_id=t.table_id  " + &
	"     and i.index_name='indx_master_contract_id' " + &
	"     and t.table_name='ctx_basic_info') " + &
	" create index indx_master_contract_id on ctx_basic_info (master_contract_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.sysforeignkey  " + &
	"   where role='FK_ctx_contacts_facility_id')  " + &
	"alter table ctx_contacts add constraint FK_ctx_contacts_facility_id foreign key (facility_id) references app_facility (facility_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.sysforeignkey  " + &
	"   where role='FK_ctx_products_product_type')  " + &
	"alter table ctx_products add constraint FK_ctx_products_product_type foreign key (product_type) references  code_lookup (lookup_code) "

//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//	"if exists( " + &
//	"   select TOP 1 1 from sys.sysprocedure  " + &
//	"   where creator=1 and proc_name = 'sp_contract_search') " + &
//	"drop PROCEDURE sp_contract_search  "
//
//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//	"CREATE PROCEDURE sp_contract_search " + &
//	"	 as  " + &
//	"	 BEGIN  " + &
//	"	   SELECT DISTINCT ctx_basic_info.app_facility,    " + &
//	" 	      ctx_products.product_id product_code,    " + &
//	"			code_lookup.code product_name,    " + &
//	"			ctx_basic_info.effective_date,    " + &
//	"			ctx_basic_info.expriation_date,    " + &
//	"			ctx_basic_info.status,    " + &
//	"			ctx_basic_info.group_multi_loc_id,    " + &
//	"			ctx_basic_info.ctx_id,    " + &
//	"			ctx_basic_info.master_contract_id,   																						  " + &
//	"			master_cnt = (select count(ctx_basic_info1.ctx_id) from ctx_basic_info ctx_basic_info1 where ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id), 																						  " + &
//	"			ctx_basic_info.category,     " + &
//	"			ctx_basic_info.facility_id,    " + &
//	"			ctx_basic_info.contract_type,    " + &
//	"			code_lookup1.code product_type,    " + &
//	"			ctx_basic_info.reimbursment_menth,    " + &
//	"			ctx_basic_info.file_location,    " + &
//	"			ctx_basic_info.review_date,    " + &
//	"			ctx_basic_info.review_by,    " + &
//	"			ctx_basic_info.term_date,    " + &
//	"			ctx_basic_info.term_reason,    " + &
//	"			ctx_basic_info.last_revis_date,    " + &
//	"			ctx_basic_info.other_date_1,    " + &
//	"			ctx_basic_info.other_date_2,    " + &
//	"			ctx_basic_info.oc_signed_by,    " + &
//	"			ctx_basic_info.oc_title,    " + &
//	"			ctx_basic_info.oc_department,    " + &
//	"			ctx_basic_info.oc_legal_rep,    " + &
//	"			ctx_basic_info.cc_signed_by,    " + &
//	"			ctx_basic_info.cc_title,    " + &
//	"			ctx_basic_info.cc_department,    " + &
//	"			ctx_basic_info.cc_legal_rep,    " + &
//	"			ctx_basic_info.notes,    " + &
//	"			ctx_basic_info.keyword,    " + &
//	"			ctx_basic_info.dvision,    " + &
//	"			ctx_basic_info.custom_1,    " + &
//	"			ctx_basic_info.custom_2,    " + &
//	"			ctx_basic_info.custom_3,    " + &
//	"			ctx_basic_info.custom_4,    " + &
//	"			ctx_basic_info.custom_5,    " + &
//	"			ctx_basic_info.custom_6,    " + &
//	"			ctx_basic_info.custom_7,    " + &
//	"			ctx_basic_info.custom_8,    " + &
//	"			ctx_basic_info.custom_9,    " + &
//	"			ctx_basic_info.custom_10,    " + &
//	"			ctx_basic_info.group_id,    " + &
//	"			ctx_basic_info.revision_reason,    " + &
//	"			ctx_basic_info.record_id , " + &
//	"			owner = upper((SELECT top 1 ctx_contacts.user_d  " + &
//	"							FROM ctx_contacts,ctx_contract_contacts " + &
//	"							WHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) and   " + &
//	"									(ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) AND   " + &
//	"									( ctx_contract_contacts.owner = 'Y' ) )), " + &
//	"			contracted_entity = (SELECT top 1 group_multi_loc.rec_id   " + &
//	"										   FROM ctx_loc,    " + &
//	"												  group_multi_loc   " + &
//	"											WHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id) and   " + &
//	"													( ctx_loc.ctx_id = ctx_basic_info.ctx_id) AND   " + &
//	"													  ctx_loc.loc_id = 0), " + &
//	"			app_facility.facility_name facility_name    " + &
//	"    FROM   " + &
//	"       	ctx_basic_info  LEFT OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id  LEFT OUTER JOIN code_lookup ON ctx_products.product_id = code_lookup.lookup_code LEFT OUTER JOIN code_lookup code_lookup1 ON ctx_products.product_type = code_lookup1.lookup_code,  " + &
//	"		   ctx_basic_info ctx_basic_info1 LEFT OUTER JOIN app_facility ON ctx_basic_info1.app_facility = app_facility.facility_id  " + &
//	"	 WHERE ctx_basic_info.ctx_id = ctx_basic_info1.ctx_id    " + &
//	"	 ORDER BY ctx_basic_info.ctx_id   " + &
//	" END  "
of_execute_sqls("of_ver70_release_table2")

RETURN 1

end function

public function integer of_ver70_release_table3 ();

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_acp_contract_management_right' " + &
	"            and   type = 'U') " + &
	"create table ctx_acp_contract_management_right (role_id integer not null,category numeric(6,0) not null,types  int not null,rights varchar(2) not null,primary key (role_id, category, types)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_acp_folder' " + &
	"            and   type = 'U') " + &
	"create table ctx_acp_folder (ctx_acp_folder_id  integer not null,folder_name varchar(50) not null,parent_folder_id integer null,grade integer null,category numeric(6,0) not null,primary key  (ctx_acp_folder_id))	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_acp_clause' " + &
	"            and   type = 'U') " + &
	"create table ctx_acp_clause (ctx_acp_clause_id numeric(6,0) not null,ctx_acp_folder_id integer not null,category numeric(6,0) not null,clause_name varchar(255) null,description varchar(255) null,information_message  varchar(255) null,approved_by varchar(20) null,date_approved datetime null,approval_status numeric(6,0) not null,image_file long binary null,create_date datetime null,modify_date datetime null,primary key  (ctx_acp_clause_id))		 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_acp_clause_rely' " + &
	"            and   type = 'U') " + &
	"create table ctx_acp_clause_rely (ctx_acp_clause_id numeric(6,0) not null,ctx_acp_clause_rely_id numeric(6,0) not null,primary key  (ctx_acp_clause_id, ctx_acp_clause_rely_id))			 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_acp_template' " + &
	"            and   type = 'U') " + &
	"create table ctx_acp_template (ctx_acp_template_id  numeric(6,0) not null,Category numeric(6,0) not null,Template_Name varchar(255) not null,export_id integer not null,wf_id integer null,Description varchar(255) null,Reviewed_By varchar(20) null,Date_Reviewed datetime null,Reviewed_Status numeric(6,0) not null,image_file long binary null,create_date datetime null,modify_date datetime null,primary key (ctx_acp_template_id))	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_acp_template_clause' " + &
	"            and   type = 'U') " + &
	"create table ctx_acp_template_clause (ctx_acp_template_id  numeric(6,0) not null,ctx_acp_clause_id  numeric(6,0) not null,orders integer not null,primary key (ctx_acp_template_id, ctx_acp_clause_id))	  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_acp_document' " + &
	"            and   type = 'U') " + &
	"create table ctx_acp_document (ctx_acp_document_id  numeric(6,0) not null,Category numeric(6,0) not null,Document_Name varchar(255) not null,Document_Type varchar(5) null,wf_id integer null,Files varchar(255) null,Description varchar(255) null,Reviewed_By varchar(20) null,Date_Reviewed datetime null,Reviewed_Status numeric(6,0) not null,image_file long binary null,create_date datetime null,modify_date datetime null,primary key (ctx_acp_document_id))	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wf_workflow' " + &
	"            and   type = 'U') " + &
	"Create Table wf_workflow  " + &
	"(  " + &
	"wf_id   Integer  Not Null,  " + &
	"wf_name   varchar(255)  Not Null,    " + &
	"wf_status  varchar(1)  Not Null  Default 'A',  " + &
	"wf_module  varchar(2)  Not Null,    " + &
	"wf_prompt_falg   varchar(1)  Not Null  Default 'N',  " + &
	"wf_prompt_message  varchar(255) null,      " + &
	"wf_triggered_by  varchar(3) Not Null,    " + &
	"wf_description  varchar(255) null,  " + &
	"agreement_flag   varchar(1)  Not Null  Default 'N',  " + &
	"practitioner_falg  varchar(1)  Not Null  Default 'Y',    " + &
	"comparison_type  varchar(1)  Not Null  Default 'Y',  " + &
	"wf_create_date  DateTime Not Null,  " + &
	"wf_update_date  DateTime Not Null,  " + &
	"CONSTRAINT pk_wf_workflow PRIMARY Key (wf_id)  " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wf_trigger_param_action_status' " + &
	"            and   type = 'U') " + &
	"Create Table wf_trigger_param_action_status  " + &
	"(  " + &
	"wf_id    Integer   Not Null,  " + &
	"action_type_id   numeric(6,0)   Not Null,  " + &
	"action_status_id   numeric(6,0)   Not Null,  " + &
	"CONSTRAINT pk_wf_parm_action_items PRIMARY Key (wf_id,action_type_id)  " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wf_trigger_param_agreement_creation' " + &
	"            and   type = 'U') " + &
	"Create Table wf_trigger_param_agreement_creation  " + &
	"(  " + &
	"wf_id     Integer   Not Null,  " + &
	"doc_id     numeric(6,0)   Not Null,  " + &
	"doc_categorie     numeric(6,0)   Not Null,  " + &
	"CONSTRAINT pk_agreement_creation PRIMARY Key (wf_id,doc_id)  " + &
	")  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wf_trigger_param_data_comparison' " + &
	"            and   type = 'U') " + &
	"Create Table wf_trigger_param_data_comparison  " + &
	"(  " + &
	"wf_id   Integer  Not Null,  " + &
	"key_id   Integer  Not Null,  " + &
	"Type    varchar(1)  Not Null Default 'P',    " + &
	"screen_id  Int   Not Null,  " + &
	"field_name  varchar(50) null,  " + &
	"field_label  varchar(255) null,  " + &
	"operator   varchar(20)  null Default '=',     " + &
	"Value    varchar(255) null,  " + &
	"logical   varchar(5) null Default 'and',  " + &
	"sql_statement  Text null,  " + &
	"module  varchar(2) null,  " + &
	"CONSTRAINT pk_practitioner_data PRIMARY Key (wf_id,key_id)  " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wf_action_types' " + &
	"            and   type = 'U') " + &
	"Create Table wf_action_types  " + &
	"(  " + &
	"wf_id     Integer  Not Null,  " + &
	"step_id    Integer  Not Null,  " + &
	"step_name   varchar(30) null,  " + &
	"action_type_id   numeric(6)  Not Null,  " + &
	"action_desc   varchar(255) null,  " + &
	"step_order   Integer  Not Null  Default 0,   " + &
	"create_flag   varchar(1)  Not Null  Default 'N',  " + &
	"due_days   Integer   Not Null Default 0,  " + &
	"weekend_flag   varchar(1)  null Default 'Y',   " + &
	"to_user    varchar(50) null,   " + &
	"dept_chair_flag   varchar(1)  Not Null  Default 'N',   " + &
	"by_user    varchar(50) null,  " + &
	"create_user_flag   varchar(1)  Not Null  Default 'Y',  " + &
	"mail_notify   Integer null,  " + &
	"send_to_user	varchar(50) null,  " + &
	"cc_user    varchar(50) null,  " + &
	"CONSTRAINT pk_action_type PRIMARY Key (wf_id,step_id)  " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wf_action_status' " + &
	"            and   type = 'U') " + &
	"Create Table wf_action_status  " + &
	"(  " + &
	"wf_id     Integer   Not Null,  " + &
	"step_id    Integer   Not Null,  " + &
	"status_id   Integer   Not Null,  " + &
	"status_name   varchar(30) null,  " + &
	"action_status_id  numeric(6,0)   Null,  " + &
	"action_status_desc  varchar(255) null,  " + &
	"initial_flag   varchar(1)   Not Null  Default 'N',  " + &
	"complete_flag   varchar(1)   Not Null  Default 'N',  " + &
	"update_header_flag  varchar(1)   Not Null  Default 'N',  " + &
	"update_status_id  numeric(6,0) null,  " + &
	"to_step    Integer null,  " + &
	"trigger_flow   Integer null,  " + &
	"create_step   Integer null,  " + &
	"mail_notify   Integer null,  " + &
	"to_notify_user	varchar(50) null,  " + &
	"cc_notify_user    varchar(50) null,  " + &
	"mail_reminder    Integer null,  " + &
	"to_reminder_user	varchar(50) null,  " + &
	"cc_reminder_user  varchar(50) null,  " + &
	"days_reminder   Integer null,  " + &
	"days_every   Integer null,  " + &
	"send_count    Integer  null,  " + &
	"mail_message    Integer null,  " + &
	"to_message_user   varchar(10) null,  " + &
	"cc_message_user   varchar(10) null,  " + &
	"letter_id   integer null,  " + &
	"return_days   Integer null,  " + &
	"resend_times   Integer null,  " + &
	"day_interval   Integer null,  " + &
	"popup_flag   varchar(1)   Not Null  Default 'N',  " + &
	"include_note_flag  varchar(1)   Not Null  Default 'N',  " + &
	"process_flag  integer  Not Null  Default 0,  " + &
	"CONSTRAINT pk_action_status PRIMARY Key (wf_id,step_id,status_id)  " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wf_email' " + &
	"            and   type = 'U') " + &
	"Create Table wf_email (  " + &
	"email_id  Integer  Not Null ,  " + &
	"email_name  varchar(100)  Not Null,  " + &
	"module   varchar(50)  Not Null,  " + &
	"Subject  varchar(255)  null,  " + &
	"attach_name varchar(100)  null,  " + &
	"attachment  image  null,  " + &
	"email_msg  Text  null,  " + &
	"PRIMARY Key (email_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wv_esign_log' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE wv_esign_log (  " + &
	"	rec_id int NOT NULL,   " + &
	"	facility_id int NOT NULL,   " + &
	"	tab_type varchar(30) NOT NULL,   " + &
	"	user_id char(15) NOT NULL,   " + &
	"	prac_id int NULL,   " + &
	"	user_date datetime NULL,   " + &
	"	notes varchar(255)   " + &
	"	NULL ,   " + &
	"	CONSTRAINT PK__wv_esign_log PRIMARY KEY NONCLUSTERED (rec_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='TDL_Basic_info' " + &
	"            and   type = 'U') " + &
	"Create Table TDL_Basic_info(  " + &
	"TDL_ID 		Integer Not Null,  " + &
	"TDL_Name 	Varchar(100) Not Null,  " + &
	"Module 		VarChar(2) Not Null,	 " + &
	"Notes 		Varchar(250) Null,	 " + &
	"CONSTRAINT pk_TDL_Basic_info PRIMARY KEY (TDL_ID)  " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='TDL_Detail' " + &
	"            and   type = 'U') " + &
	"Create Table TDL_Detail(  " + &
	"TDL_ID 			Integer	Not Null,  " + &
	"TDLI_ID 		Integer	Not Null,  " + &
	"TDLI_Name 		Varchar(100)	Null,  " + &
	"TDL_Sort		Integer	Not Null,	  " + &
	"Verbiage 		Varchar(255)	Not Null,  " + &
	"Notes 			Text	Null,  " + &
	"Allow_Drill_Down 	VarChar(1)	Default '1',  " + &
	"Include_In_Graph 	VarChar(1)	Default '0',  " + &
	"Action_Type 		Numeric(6,0) Null,	  " + &
	"Action_Status 		Numeric(6,0) Null,	  " + &
	"Print_Flag		Integer	Null,		  " + &
	"Due_Date		Integer	Null,		  " + &
	"Max_Sends_Flag		VarChar(1)	Default '0',  " + &
	"Display01		VarChar(50)	Null,  " + &
	"Updateable01		VarChar(1)	Null,	  " + &
	"Display02		VarChar(50)	Null,  " + &
	"Updateable02		VarChar(1)	Null,  " + &
	"Display03		VarChar(50)	Null,  " + &
	"Updateable03		VarChar(1)	Null,  " + &
	"Display04		VarChar(50)	Null,  " + &
	"Updateable04		VarChar(1)	Null,  " + &
	"Display05		VarChar(50)	Null,  " + &
	"Updateable05		VarChar(1)	Null,  " + &
	"Display06		VarChar(50)	Null,  " + &
	"Updateable06		VarChar(1)	Null,  " + &
	"Display07		VarChar(50)	Null,  " + &
	"Updateable07		VarChar(1)	Null,  " + &
	"Display08		VarChar(50)	Null,  " + &
	"Updateable08		VarChar(1)	Null,  " + &
	"Display09		VarChar(50)	Null,  " + &
	"Updateable09		VarChar(1)	Null,  " + &
	"Display10		VarChar(50)	Null,  " + &
	"Updateable10		VarChar(1)	Null,  " + &
	"Display11		VarChar(50)	Null,  " + &
	"Updateable11		VarChar(1)	Null,  " + &
	"Display12		VarChar(50)	Null,  " + &
	"Updateable12		VarChar(1)	Null,  " + &
	"MoveTo			VarChar(2)	Null,	  " + &
	"Perform			VarChar(2)	Null,	  " + &
	"CONSTRAINT pk_TDL_Detail PRIMARY KEY(TDL_ID, TDLI_ID)  " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='TDL_Security_Roles_Rights' " + &
	"            and   type = 'U') " + &
	"Create Table TDL_Security_Roles_Rights( " + &
	"ROLE_ID   	Integer Not Null, " + &
	"TDL_ID	 	Integer Not Null, " + &
	"Access_Rights  	Integer Not Null Default 0, " + &
	"CONSTRAINT pk_TDL_Security_Roles_Rights PRIMARY KEY(ROLE_ID, TDL_ID) " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wv_question_documents' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE	wv_question_documents  " + &
	"(	rec_id				integer not null  " + &
	",prac_id            integer not null  " + &
	",file_type					varchar(10) not null default 'pdf'  " + &
	",file_data					long binary  null  " + &
	",description                varchar(255) null  " + &
	",create_by 					varchar(10) null  " + &
	",create_date				datetime  null  " + &
	",last_updated_by 			varchar(10) null  " + &
	",last_updated_date			datetime  null  " + &
	", primary key (rec_id)  " + &
	")			  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wv_required_template' " + &
	"            and   type = 'U') " + &
	"create table wv_required_template( " + &
	"	template_id  int identity not null, " + &
	"	template_name varchar(50) not null, " + &
	"	CONSTRAINT PK_wv_required_template PRIMARY KEY (template_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='wv_required_template_image' " + &
	"            and   type = 'U') " + &
	"create table wv_required_template_image( " + &
	"	template_id  int not null, " + &
	"	image_type_id int not null, " + &
	"	is_image_linked  int not null default 1, " + &
	"	CONSTRAINT PK_wv_required_template_image PRIMARY KEY (template_id,image_type_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='security_user_mailsetting' " + &
	"            and   type = 'U') " + &
	"Create table security_user_mailsetting (user_id varchar (10) NOT NULL, mail_signature text NULL, flag bit NULL, constraint PK_security_user_mailsetting primary key (user_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='Ctx_am_document' " + &
	"            and   type = 'U') " + &
	"create table Ctx_am_document (	 " + &
	"Doc_id               int         not null,	 " + &
	"ctx_id               int         not null,	 " + &
	"doc_name             Varchar(200)         not null,	 " + &
	"Revision             Numeric(5,1)         not null default 0,	 " + &
	"doc_type             char(1)           not null,	 " + &
	"doc_ext              varchar(10)           not null default 'doc',	 " + &
	"category             numeric(6,0)         not null,	 " + &
	"Base_type            char(1)           null,	 " + &
	"From_templete_id        numeric(6,0)         null,	 " + &
	"export_id 				int 					null,  " + &
	"Wf_id                int         null,	 " + &
	"Create_by            char(10)          null,	 " + &
	"Create_date          datetime             null default getdate(),	 " + &
	"Status               numeric(6,0)         null,	 " + &
	"Status_by            char(10)          null,	 " + &
	"Status_date          datetime             null,	 " + &
	"filename     	     Varchar(250)         null,	 " + &
	"Doc_from_type        char(1)           null,	 " + &
	"Doc_from_name        Varchar(20)          null,	 " + &
	"Notes                Varchar(255)         null,	 " + &
	"checkout_by	     varchar(10)          null,	 " + &
	"checkout_date	     datetime             null,	 " + &
	"checkout_status	     char(1)           not null default '0',	 " + &
	"Revision_control     char(1)           not null default '0',	 " + &
	"constraint PK_CTX_AM_DOCUMENT primary key  (Doc_id)  " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='Ctx_am_doc_audit' " + &
	"            and   type = 'U') " + &
	"create table Ctx_am_doc_audit (	 " + &
	"Doc_id               int         not null,	 " + &
	"audit_id             int         not null,	 " + &
	"Revision             Numeric(5,1)         not null,	 " + &
	"doc_ext              varchar(10)           not null default 'doc',	 " + &
	"action               varchar(200)         not null,	 " + &
	"action_by            varchar(10)          null,	 " + &
	"action_date          datetime             null default getdate(),	 " + &
	"filename     	     Varchar(250)         null,	 " + &
	"Doc_from_type        char(1)           null,	 " + &
	"Doc_from_name        Varchar(20)          null,	 " + &
	"Notes                Varchar(255)         null,	 " + &
	"id_forcatalog        int identity,	 " + &
	"constraint PK_CTX_AM_DOC_AUDIT primary key  (Doc_id,audit_id)	 " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='Ctx_am_doc_image' " + &
	"            and   type = 'U')  " + &
	"create table Ctx_am_doc_image (	 " + &
	"Doc_id               int         not null,	 " + &
	"Revision             Numeric(5,1)         not null,	 " + &
	"image_file           Image                null,	 " + &
	"pdftext           	text                 null,	 " + &
	"modify_date          datetime             null default getdate(),	 " + &
	"id_forcatalog        int identity ,	 " + &
	"doc_ext             varchar(10)           null default 'doc',	 " + &
	"constraint PK_CTX_AM_DOC_IMAGE primary key  (Doc_id,Revision)	 " + &
	")  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='ctx_am_action_item' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE ctx_am_action_item(	 " + &
	"Doc_ID integer NOT NULL, 	 " + &
	"Seq_ID integer identity NOT NULL,	 " + &
	"action_order integer not null default 0,  " + &
	"Action_Type decimal(6,0) NOT NULL, 	 " + &
	"Action_User varchar(50) null,  " + &
	"Action_Status decimal(6,0) null, 	 " + &
	"Status_Date datetime null,  " + &
	"Due_Date datetime null,  " + &
	"Attempt_Times integer null,  " + &
	"First_Attempt datetime null,  " + &
	"Last_Attempt datetime null,  " + &
	"Print_flag integer null,  " + &
	"Create_date datetime null DEFAULT getdate(),  " + &
	"Letter_id integer null,  " + &
	"Wf_step integer null,  " + &
	"Wf_id integer null,  " + &
	"Wf_action_type_id integer null,  " + &
	"wf_assigned_by varchar(50) null,  " + &
	"active_status integer null,  " + &
	"wf_complete_flag char(1) null DEFAULT ('N'),  " + &
	"Notes varchar(255)  null,  " + &
	"CONSTRAINT PK_CTX_AM_ACTION_ITEMS PRIMARY KEY (doc_id,seq_id) " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='Ctx_am_document_clause' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE Ctx_am_document_clause (	 " + &
	"Doc_id int NOT NULL ,	 " + &
	"Revision numeric(5, 1) NOT NULL ,	 " + &
	"Ctx_acp_clause_id numeric(6, 0) NOT NULL , " + &
	"Orders int NULL,	 " + &
	"CONSTRAINT PK_Ctx_am_document_clause PRIMARY KEY (Doc_id,Revision,Ctx_acp_clause_id	)  " + &
	")  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_hdr' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_hdr   " + &
	"(  " + &
	"import_id integer identity null,  " + &
	"import_name varchar(50) null,  " + &
	"imp_file varchar(100) null,  " + &
	"imp_format char(1) null,  " + &
	"record_delimiter varchar(5) null,  " + &
	"field_delimiter varchar(5) null,  " + &
	"odbc_name varchar (50) null,  " + &
	"odbc_login varchar(25) null,  " + &
	"odbc_password varchar(25) null,  " + &
	"ignore_header_row integer null,  " + &
	"flat_multi integer null,  " + &
	"lock_file integer null,  " + &
	"project_id integer null,  " + &
	"isoft_module integer null,  " + &
	"create_date datetime null,  " + &
	"mod_date datetime null,  " + &
	"mod_user varchar(25) null,  " + &
	"audit_type char(1) null,  " + &
	"add_protocol integer null,   " + &
	"err_notify integer null,  " + &
	"err_process integer null,  " + &
	"err_file integer null,  " + &
	"notify_addr1 varchar(100) null,  " + &
	"notify_addr2 varchar(100) null,  " + &
	"update_verifications integer null,  " + &
	"import_notes varchar(255) null,  " + &
	"import_sql varchar(1000) null,  " + &
	"doc_updated datetime null,  " + &
	"doc_name varchar(50) null,  " + &
	"import_doc image null,  " + &
	"primary key (import_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_project' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_project   " + &
	"(  " + &
	"project_id integer identity,  " + &
	"project_name varchar(30),  " + &
	"def_parent_id integer null,  " + &
	"def_audit_id integer null,  " + &
	"def_verif_id integer null,  " + &
	"def_affil_stat char(1) null,  " + &
	"def_appt_type char(1) null,  " + &
	"def_status integer null,  " + &
	"def_user char(10) null,  " + &
	"primary key (project_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_table_records' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_table_records  " + &
	"(  " + &
	"table_records_id integer identity,  " + &
	"import_id integer not null,  " + &
	"isoft_table_id integer null,  " + &
	"primary key (table_records_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_mapping_fields' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_mapping_fields  " + &
	"(  " + &
	"rec_id decimal(10, 0) identity,  " + &
	"table_records_id integer not null,  " + &
	"case_type char(1) null,  " + &
	"strip_type char(1) null,  " + &
	"field_format varchar(40) null,  " + &
	"isoft_field_id integer null,  " + &
	"key_field integer null,  " + &
	"id_field integer null,  " + &
	"null_type integer null,    " + &
	"null_value varchar(50) null,  " + &
	"link_value decimal(10, 0) null,  " + &
	"facility_id integer null,  " + &
	"no_match_procd decimal(10, 0),  " + &
	"lu_template decimal(10,0),  " + &
	"lu_type char(1) null,  " + &
	"lu_table varchar(50) null,  " + &
	"lu_field_name varchar(50) null,  " + &
	"import_field_id decimal(10,0),  " + &
	"primary key (rec_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_file_fields' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_file_fields  " + &
	"(  " + &
	"rec_id decimal(10, 0) identity,  " + &
	"import_id integer not null,  " + &
	"field_order integer not null,  " + &
	"imp_field_name varchar(40) not null,  " + &
	"field_length integer not null,  " + &
	"field_format varchar(40) null,  " + &
	"case_type char(1) null,  " + &
	"strip_type char(1) null,  " + &
	"comp_def varchar(50) null,  " + &
	"default_value varchar(100) null,  " + &
	"primary key (rec_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_process' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_process  " + &
	"(  " + &
	"process_id numeric(16,0) identity,  " + &
	"import_id integer null,  " + &
	"pro_date datetime null,  " + &
	"rec_count numeric(10,0) null,  " + &
	"error_count numeric(10,0) null,  " + &
	"mod_count numeric(10,0) null,  " + &
	"add_count numeric(10,0) null,  " + &
	"process_file  image null,  " + &
	"primary key (process_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_process_errors' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_process_errors  " + &
	"(  " + &
	"error_id numeric(16,0) identity,  " + &
	"process_id numeric(16,0) null,  " + &
	"error_record numeric(10,0) null,  " + &
	"error_field varchar(40) null,  " + &
	"err_type integer null,  " + &
	"err_value varchar(300) null,  " + &
	"err_isoft_table varchar(50) null,  " + &
	"primary key (error_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_lookup_mapping' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_lookup_mapping  " + &
	"(  " + &
	"ilm_id decimal(10,0) identity,  " + &
	"map_type char(1) null,  " + &
	"lookup_table varchar(50) null,  " + &
	"template_name varchar(40) null,  " + &
	"primary key (ilm_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_lu_map_fields' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_lu_map_fields  " + &
	"(  " + &
	"map_id decimal(10,0) identity,  " + &
	"ilm_id  decimal(10,0) null,  " + &
	"is_lu_code decimal(10,0) null,  " + &
	"import_value varchar(50) null,  " + &
	"primary key (map_id))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='import_table_gen' " + &
	"            and   type = 'U') " + &
	"CREATE TABLE import_table_gen  " + &
	"(   " + &
	"field_1 varchar(100) null,  " + &
	"field_2 varchar(100) null,  " + &
	"field_3 varchar(100) null,  " + &
	"field_4 varchar(100) null,  " + &
	"field_5 varchar(100) null,  " + &
	"field_6 varchar(100) null,  " + &
	"field_7 varchar(100) null,  " + &
	"field_8 varchar(100) null,  " + &
	"field_9 varchar(100) null,  " + &
	"field_10 varchar(100) null,  " + &
	"field_11 varchar(100) null,  " + &
	"field_12 varchar(100) null,  " + &
	"field_13 varchar(100) null,  " + &
	"field_14 varchar(100) null,  " + &
	"field_15 varchar(100) null,  " + &
	"field_16 varchar(100) null,  " + &
	"field_17 varchar(100) null,  " + &
	"field_18 varchar(100) null,  " + &
	"field_19 varchar(100) null,  " + &
	"field_20 varchar(100) null,  " + &
	"field_21 varchar(100) null,  " + &
	"field_22 varchar(100) null,  " + &
	"field_23 varchar(100) null,  " + &
	"field_24 varchar(100) null,  " + &
	"field_25 varchar(100) null,  " + &
	"field_26 varchar(100) null,  " + &
	"field_27 varchar(100) null,  " + &
	"field_28 varchar(100) null,  " + &
	"field_29 varchar(100) null,  " + &
	"field_30 varchar(100) null,  " + &
	"field_31 varchar(100) null,  " + &
	"field_32 varchar(100) null,  " + &
	"field_33 varchar(100) null,  " + &
	"field_34 varchar(100) null,  " + &
	"field_35 varchar(100) null,  " + &
	"field_36 varchar(100) null,  " + &
	"field_37 varchar(100) null,  " + &
	"field_38 varchar(100) null,  " + &
	"field_39 varchar(100) null,  " + &
	"field_40 varchar(100) null,  " + &
	"field_41 varchar(100) null,  " + &
	"field_42 varchar(100) null,  " + &
	"field_43 varchar(100) null,  " + &
	"field_44 varchar(100) null,  " + &
	"field_45 varchar(100) null,  " + &
	"field_46 varchar(100) null,  " + &
	"field_47 varchar(100) null,  " + &
	"field_48 varchar(100) null,  " + &
	"field_49 varchar(100) null,  " + &
	"field_50 varchar(100) null,  " + &
	"field_51 varchar(100) null,  " + &
	"field_52 varchar(100) null,  " + &
	"field_53 varchar(100) null,  " + &
	"field_54 varchar(100) null,  " + &
	"field_55 varchar(100) null,  " + &
	"field_56 varchar(100) null,  " + &
	"field_57 varchar(100) null,  " + &
	"field_58 varchar(100) null,  " + &
	"field_59 varchar(100) null,  " + &
	"field_60 varchar(100) null,  " + &
	"field_61 varchar(100) null,  " + &
	"field_62 varchar(100) null,  " + &
	"field_63 varchar(100) null,  " + &
	"field_64 varchar(100) null,  " + &
	"field_65 varchar(100) null,  " + &
	"field_66 varchar(100) null,  " + &
	"field_67 varchar(100) null,  " + &
	"field_68 varchar(100) null,  " + &
	"field_69 varchar(100) null,  " + &
	"field_70 varchar(100) null,  " + &
	"field_71 varchar(100) null,  " + &
	"field_72 varchar(100) null,  " + &
	"field_73 varchar(100) null,  " + &
	"field_74 varchar(100) null,  " + &
	"field_75 varchar(100) null,  " + &
	"field_76 varchar(100) null,  " + &
	"field_77 varchar(100) null,  " + &
	"field_78 varchar(100) null,  " + &
	"field_79 varchar(100) null,  " + &
	"field_80 varchar(100) null,  " + &
	"field_81 varchar(100) null,  " + &
	"field_82 varchar(100) null,  " + &
	"field_83 varchar(100) null,  " + &
	"field_84 varchar(100) null,  " + &
	"field_85 varchar(100) null,  " + &
	"field_86 varchar(100) null,  " + &
	"field_87 varchar(100) null,  " + &
	"field_88 varchar(100) null,  " + &
	"field_89 varchar(100) null,  " + &
	"field_90 varchar(100) null,  " + &
	"field_91 varchar(100) null,  " + &
	"field_92 varchar(100) null,  " + &
	"field_93 varchar(100) null,  " + &
	"field_94 varchar(100) null,  " + &
	"field_95 varchar(100) null,  " + &
	"field_96 varchar(100) null,  " + &
	"field_97 varchar(100) null,  " + &
	"field_98 varchar(100) null,  " + &
	"field_99 varchar(100) null,  " + &
	"field_100 varchar(100) null,  " + &
	"field_101 varchar(100) null,  " + &
	"field_102 varchar(100) null,  " + &
	"field_103 varchar(100) null,  " + &
	"field_104 varchar(100) null,  " + &
	"field_105 varchar(100) null,  " + &
	"field_106 varchar(100) null,  " + &
	"field_107 varchar(100) null,  " + &
	"field_108 varchar(100) null,  " + &
	"field_109 varchar(100) null,  " + &
	"field_110 varchar(100) null,  " + &
	"field_111 varchar(100) null,  " + &
	"field_112 varchar(100) null,  " + &
	"field_113 varchar(100) null,  " + &
	"field_114 varchar(100) null,  " + &
	"field_115 varchar(100) null,  " + &
	"field_116 varchar(100) null,  " + &
	"field_117 varchar(100) null,  " + &
	"field_118 varchar(100) null,  " + &
	"field_119 varchar(100) null,  " + &
	"field_120 varchar(100) null,  " + &
	"field_121 varchar(100) null,  " + &
	"field_122 varchar(100) null,  " + &
	"field_123 varchar(100) null,  " + &
	"field_124 varchar(100) null,  " + &
	"field_125 varchar(100) null,  " + &
	"field_126 varchar(100) null,  " + &
	"field_127 varchar(100) null,  " + &
	"field_128 varchar(100) null,  " + &
	"field_129 varchar(100) null,  " + &
	"field_130 varchar(100) null,  " + &
	"field_131 varchar(100) null,  " + &
	"field_132 varchar(100) null,  " + &
	"field_133 varchar(100) null,  " + &
	"field_134 varchar(100) null,  " + &
	"field_135 varchar(100) null,  " + &
	"field_136 varchar(100) null,  " + &
	"field_137 varchar(100) null,  " + &
	"field_138 varchar(100) null,  " + &
	"field_139 varchar(100) null,  " + &
	"field_140 varchar(100) null,  " + &
	"field_141 varchar(100) null,  " + &
	"field_142 varchar(100) null,  " + &
	"field_143 varchar(100) null,  " + &
	"field_144 varchar(100) null,  " + &
	"field_145 varchar(100) null,  " + &
	"field_146 varchar(100) null,  " + &
	"field_147 varchar(100) null,  " + &
	"field_148 varchar(100) null,  " + &
	"field_149 varchar(100) null,  " + &
	"field_150 varchar(100) null,  " + &
	"field_151 varchar(100) null,  " + &
	"field_152 varchar(100) null,  " + &
	"field_153 varchar(100) null,  " + &
	"field_154 varchar(100) null,  " + &
	"field_155 varchar(100) null,  " + &
	"field_156 varchar(100) null,  " + &
	"field_157 varchar(100) null,  " + &
	"field_158 varchar(100) null,  " + &
	"field_159 varchar(100) null,  " + &
	"field_160 varchar(100) null,  " + &
	"field_161 varchar(100) null,  " + &
	"field_162 varchar(100) null,  " + &
	"field_163 varchar(100) null,  " + &
	"field_164 varchar(100) null,  " + &
	"field_165 varchar(100) null,  " + &
	"field_166 varchar(100) null,  " + &
	"field_167 varchar(100) null,  " + &
	"field_168 varchar(100) null,  " + &
	"field_169 varchar(100) null,  " + &
	"field_170 varchar(100) null,  " + &
	"field_171 varchar(100) null,  " + &
	"field_172 varchar(100) null,  " + &
	"field_173 varchar(100) null,  " + &
	"field_174 varchar(100) null,  " + &
	"field_175 varchar(100) null,  " + &
	"field_176 varchar(100) null,  " + &
	"field_177 varchar(100) null,  " + &
	"field_178 varchar(100) null,  " + &
	"field_179 varchar(100) null,  " + &
	"field_180 varchar(100) null,  " + &
	"field_181 varchar(100) null,  " + &
	"field_182 varchar(100) null,  " + &
	"field_183 varchar(100) null,  " + &
	"field_184 varchar(100) null,  " + &
	"field_185 varchar(100) null,  " + &
	"field_186 varchar(100) null,  " + &
	"field_187 varchar(100) null,  " + &
	"field_188 varchar(100) null,  " + &
	"field_189 varchar(100) null,  " + &
	"field_190 varchar(100) null,  " + &
	"field_191 varchar(100) null,  " + &
	"field_192 varchar(100) null,  " + &
	"field_193 varchar(100) null,  " + &
	"field_194 varchar(100) null,  " + &
	"field_195 varchar(100) null,  " + &
	"field_196 varchar(100) null,  " + &
	"field_197 varchar(100) null,  " + &
	"field_198 varchar(100) null,  " + &
	"field_199 varchar(100) null,  " + &
	"field_200 varchar(100) null)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='default_value' and t.table_name='import_file_fields') " + &
	"alter table import_file_fields add default_value varchar(100) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='information_disp' and t.table_name='ctx_acp_clause') " + &
	"alter table ctx_acp_clause add information_disp bit null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='export_id' and t.table_name='ctx_acp_clause') " + &
	"alter table ctx_acp_clause add export_id int Null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='page_break' and t.table_name='ctx_acp_clause') " + &
	"alter table ctx_acp_clause add page_break bit null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_id' and t.table_name='ids') " + &
	"alter table ids add wf_id numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='doc_id' and t.table_name='ids') " + &
	"alter table ids add doc_id int  null default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='modify_date' and t.table_name='code_lookup') " + &
	"alter table code_lookup add modify_date datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='set_51' and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_51 int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wv_db_version' and t.table_name='icred_settings') " + &
	"alter table icred_settings add wv_db_version varchar(20) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='set_52' and t.table_name='icred_settings') " + &
	"alter table icred_settings add set_52 int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='last_db_update_wv' and t.table_name='icred_settings') " + &
	"alter table icred_settings add last_db_update_wv datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='user_id' and t.table_name='dept_chair') " + &
	"alter table dept_chair add user_id char(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='billing_address_flag' and t.table_name='group_practice') " + &
	"alter table group_practice ADD billing_address_flag integer NULL  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='TDL_Rights' and t.table_name='Security_users') " + &
	"alter table Security_users Add TDL_Rights Integer null Default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='TDL_Other_user' and t.table_name='Security_users') " + &
	"alter table Security_users Add TDL_Other_user Varchar(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wv_ldap_user' and t.table_name='security_users') " + &
	"alter table security_users add wv_ldap_user varchar(30) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='create_action_item' and t.table_name='ctx_notification') " + &
	"alter table ctx_notification add create_action_item char(1) null default 'N'  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='rate' and t.table_name='ctx_fee_sched_locations') " + &
	"alter table ctx_fee_sched_locations add rate numeric(8,2) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wv_begin_cred' and t.table_name='pd_affil_stat') " + &
	"alter table pd_affil_stat	add wv_begin_cred numeric(1,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='app_status_id' and t.table_name='wv_esign_log') " + &
	"alter table wv_esign_log add app_status_id numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='fax_type' and t.table_name='sys_fax_template') " + &
	"alter table sys_fax_template add fax_type int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='cover_file' and t.table_name='sys_fax_template') " + &
	"alter table sys_fax_template add cover_file Image null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='active_status' and t.table_name='wc_hdr') " + &
	"alter table wc_hdr add active_status integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='pw_rqd' and t.table_name='wc_hdr') " + &
	"alter table wc_hdr add pw_rqd integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wait_val' and t.table_name='wc_steps') " + &
	"alter table wc_steps add wait_val integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='input_type' and t.table_name='wc_steps') " + &
	"alter table wc_steps add input_type varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='form_type' and t.table_name='wc_steps') " + &
	"alter table wc_steps add form_type varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='test_break' and t.table_name='wc_steps') " + &
	"alter table wc_steps add test_break integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='format_type' and t.table_name='wc_steps') " + &
	"alter table wc_steps add format_type integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='attr_type' and t.table_name='wc_steps') " + &
	"alter table wc_steps add attr_type varchar(25) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='fax' and t.table_name='pd_references') " + &
	"alter table pd_references add fax varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='e_mail_address' and t.table_name='pd_references') " + &
	"alter table pd_references add e_mail_address varchar(150) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='suite_apart' and t.table_name='pd_references') " + &
	"alter table pd_references add suite_apart varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='fax' and t.table_name='pd_prof_experience') " + &
	"alter table pd_prof_experience add fax varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='e_mail_address' and t.table_name='pd_prof_experience') " + &
	"alter table pd_prof_experience add e_mail_address varchar(150) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='suite_apart' and t.table_name='pd_prof_experience') " + &
	"alter table pd_prof_experience add suite_apart varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_scrn_id' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_scrn_id int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_scrn_dataobject' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_scrn_dataobject varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_column_name' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_column_name varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_lookup_type' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_lookup_type varchar(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='module_type' and t.table_name='export_fields') " + &
	"alter table export_fields ADD module_type int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_uselink' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_uselink int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_linkfromcolumn' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_linkfromcolumn varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_linktoscrnid' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_linktoscrnid int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_linktocolumn' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_linktocolumn varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_linktoscrndw' and t.table_name='export_fields') " + &
	"alter table export_fields ADD ctx_linktoscrndw varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='ctx_column_datatype' and t.table_name='export_fields') " + &
	"alter table export_fields add ctx_column_datatype CHAR(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='export_fields_expression' and t.table_name='export_fields') " + &
	"alter table export_fields add export_fields_expression VARCHAR(2000) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_expiring_appointment' and t.table_name='facility') " + &
	"alter table facility add wf_expiring_appointment integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_reappointment_initiated' and t.table_name='facility') " + &
	"alter table facility add wf_reappointment_initiated integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_data_entry_complete' and t.table_name='facility') " + &
	"alter table facility add wf_data_entry_complete integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_practitioner_status_change' and t.table_name='facility') " + &
	"alter table facility add wf_practitioner_status_change integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_new_practitioner' and t.table_name='facility') " + &
	"alter table facility add wf_new_practitioner integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_data_value_comparison' and t.table_name='facility') " + &
	"alter table facility add wf_data_value_comparison integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_webview_application_complete' and t.table_name='facility') " + &
	"alter table facility add wf_webview_application_complete integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_exp_appt' and t.table_name='facility') " + &
	"alter table facility add wf_exp_appt varchar(1) null default 'N' "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_webview_application_initiated' and t.table_name='facility') " + &
	"alter table facility add wf_webview_application_initiated integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='default_question_init' and t.table_name='facility') " + &
	"alter table facility add default_question_init numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='default_question_reapp' and t.table_name='facility') " + &
	"alter table facility add default_question_reapp numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='default_wv_init_template' and t.table_name='facility') " + &
	"alter table facility add default_wv_init_template   int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='default_wv_reapp_template' and t.table_name='facility') " + &
	"alter table facility add default_wv_reapp_template  int null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_step' and t.table_name='verif_info') " + &
	"alter table verif_info add wf_step integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='due_date' and t.table_name='verif_info') " + &
	"alter table verif_info add due_date datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='letter_id' and t.table_name='verif_info') " + &
	"alter table verif_info add letter_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_id' and t.table_name='verif_info') " + &
	"alter table verif_info add wf_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='Wf_action_type_id' and t.table_name='verif_info') " + &
	"alter table verif_info add Wf_action_type_id numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='Wf_complete_flag' and t.table_name='verif_info') " + &
	"alter table verif_info add Wf_complete_flag varchar(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_step' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add wf_step integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='letter_id' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add letter_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_id' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add wf_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='Wf_action_type_id' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add Wf_action_type_id numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_assigned_by' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add wf_assigned_by varchar(20) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_complete_flag' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add wf_complete_flag varchar(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='print_flag' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add print_flag int null default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='first_sent' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add first_sent datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='last_sent' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add last_sent datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='number_sent' and t.table_name='net_dev_action_items') " + &
	"alter table net_dev_action_items add number_sent int null default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_step' and t.table_name='ctx_action_items') " + &
	"alter table ctx_action_items add wf_step integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='letter_id' and t.table_name='ctx_action_items') " + &
	"alter table ctx_action_items add letter_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_id' and t.table_name='ctx_action_items') " + &
	"alter table ctx_action_items add wf_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='Wf_action_type_id' and t.table_name='ctx_action_items') " + &
	"alter table ctx_action_items add Wf_action_type_id numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_assigned_by' and t.table_name='ctx_action_items') " + &
	"alter table ctx_action_items add wf_assigned_by varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='active_status' and t.table_name='ctx_action_items') " + &
	"alter table ctx_action_items add active_status integer null default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='wf_complete_flag' and t.table_name='ctx_action_items') " + &
	"alter table ctx_action_items add wf_complete_flag varchar(1) null default 'N' "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='module' and t.table_name='wf_trigger_param_data_comparison') " + &
	"alter table wf_trigger_param_data_comparison add module varchar(2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='field_type' and t.table_name='wf_trigger_param_data_comparison') " + &
	"alter table wf_trigger_param_data_comparison add field_type varchar(2) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='table_name' and t.table_name='wf_trigger_param_data_comparison') " + &
	"alter table wf_trigger_param_data_comparison add table_name varchar(150) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='set_step' and t.table_name='wf_action_status') " + &
	"alter table wf_action_status add set_step integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='set_status' and t.table_name='wf_action_status') " + &
	"alter table wf_action_status add set_status numeric(6,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='set_wf_id' and t.table_name='wf_action_status') " + &
	"alter table wf_action_status add set_wf_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='value_display' and t.table_name='wf_trigger_param_data_comparison') " + &
	"alter table wf_trigger_param_data_comparison add value_display varchar(75) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='lookup_code' and t.table_name='wf_trigger_param_data_comparison') " + &
	"alter table wf_trigger_param_data_comparison add lookup_code varchar(40) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='lookup_flag' and t.table_name='wf_trigger_param_data_comparison') " + &
	"alter table wf_trigger_param_data_comparison add lookup_flag char(1) null default 'N' "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='export_id' and t.table_name='wf_email') " + &
	"alter table wf_email add export_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='alm_action_title' and t.table_name='ctx_notification') " + &
	"ALTER TABLE ctx_notification ADD alm_action_title VARCHAR(40) NULL "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table import_hdr modify record_delimiter varchar(5) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table import_hdr modify field_delimiter varchar(5) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_acp_clause modify information_message varchar(2000) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table code_lookup modify code varchar(30) not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table CTX_ACTION_ITEMS	MODIFY inserted_at_date_time DEFAULT getdate() "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wf_action_types modify to_user varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wf_action_types modify by_user varchar(50) null	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wf_action_status modify to_message_user varchar(50) null	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wf_action_status modify cc_message_user varchar(50) null	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table security_modules modify module_name varchar(100) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wc_steps modify form_handler varchar(250) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wc_steps modify object_name varchar(250) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wc_steps modify content_or_value varchar(250) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wf_action_types modify cc_user varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wf_action_status modify cc_notify_user varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wf_action_status modify cc_reminder_user varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table wf_action_status modify cc_message_user varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_fee_sched_nm modify custom_n1 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_fee_sched_nm modify custom_n2 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_fee_sched_nm modify custom_n3 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_fee_sched_nm modify custom_n4 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table ctx_fee_sched_nm modify custom_n5 numeric(10,3) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.pkey='Y' " + &
	"     and t.table_name='pd_peer_review') " + &
	"ALTER TABLE pd_peer_review DELETE  PRIMARY KEY "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_peer_review modify case_number numeric(14,0) not null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_peer_review ADD PRIMARY KEY (case_number) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.pkey='Y' " + &
	"     and t.table_name='pd_peer_review_pracs') " + &
	"ALTER TABLE pd_peer_review_pracs DELETE PRIMARY KEY "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_peer_review_pracs MODIFY case_number numeric(14,0) Not Null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_peer_review_pracs ADD PRIMARY KEY (rec_id,prac_id,case_number) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.pkey='Y' " + &
	"     and t.table_name='pd_peer_review_action_items') " + &
	"ALTER TABLE pd_peer_review_action_items DELETE PRIMARY KEY "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_peer_review_action_items MODIFY case_number numeric(14,0) Not Null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_peer_review_action_items ADD PRIMARY KEY (rec_id,case_number) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.pkey='Y' " + &
	"     and t.table_name='pd_peer_committee_review') " + &
	"ALTER TABLE pd_peer_committee_review DELETE PRIMARY KEY "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_peer_committee_review MODIFY case_number numeric(14,0) Not Null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_peer_committee_review ADD PRIMARY KEY (rec_id,case_number,committee_name) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='index_ctx_am_doc_audit_id_forcatalog' and t.table_name='Ctx_am_doc_audit') " + &
	"  CREATE UNIQUE INDEX index_ctx_am_doc_audit_id_forcatalog ON Ctx_am_doc_audit (id_forcatalog) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='index_ctx_am_doc_image_id_forcatalog' and t.table_name='Ctx_am_doc_image') " + &
	"  CREATE UNIQUE INDEX index_ctx_am_doc_image_id_forcatalog ON Ctx_am_doc_image (id_forcatalog) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='idx_step_order' and t.table_name='wf_action_types') " + &
	"  CREATE UNIQUE INDEX idx_step_order ON wf_action_types (wf_id , step_order )  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='idx_step_id' and t.table_name='wf_action_types') " + &
	"  CREATE INDEX idx_step_id ON wf_action_types (wf_id , step_id ) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='idx_status_id' and t.table_name='wf_action_status') " + &
	"  CREATE INDEX idx_status_id ON wf_action_status (wf_id , step_id , status_id )  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='wf_email_id_x' and t.table_name='wf_email') " + &
	"  CREATE UNIQUE INDEX wf_email_id_x ON wf_email (email_id )  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='idx_export_field_name' and t.table_name='export_fields') " + &
	"  CREATE unique index idx_export_field_name on export_fields (export_id,export_field_name) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='todolist_id_x' and t.table_name='TDL_Basic_info') " + &
	"  CREATE Unique Index todolist_id_x on TDL_Basic_info(TDL_ID) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='TDL_Detail_x' and t.table_name='TDL_Detail') " + &
	"  CREATE UNIQUE INDEX TDL_Detail_x on TDL_Detail(TDL_ID, TDLI_ID) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='TDL_Security_Roles_Rights_x' and t.table_name='TDL_Security_Roles_Rights') " + &
	"  CREATE UNIQUE INDEX TDL_Security_Roles_Rights_x on TDL_Security_Roles_Rights(ROLE_ID, TDL_ID) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.sysindex i, sys.systable t where i.table_id=t.table_id " + &
	"     and i.index_name='idx_unique_ldapuser') " + &
	"  DROP INDEX idx_unique_ldapuser "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_REFERENCE_SECURITY') " + &
	"  ALTER TABLE ctx_acp_contract_management_right  add foreign key FK_CTX_ACP_REFERENCE_SECURITY (role_id) references security_roles (role_id)  on update restrict on delete cascade "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_REFERENCE_CODE_LOOUP') " + &
	"  ALTER TABLE ctx_acp_contract_management_right  add foreign key FK_CTX_ACP_REFERENCE_CODE_LOOUP (category) references code_lookup (lookup_code) on update restrict   on delete cascade "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_Folder_CODE_LOOKUP') " + &
	"  ALTER TABLE ctx_acp_folder add foreign key FK_CTX_ACP_Folder_CODE_LOOKUP (category) references code_lookup (lookup_code) on update restrict   on delete cascade "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP__REFERENCE_CTX_ACP_') " + &
	"  ALTER TABLE ctx_acp_clause  add foreign key FK_CTX_ACP__REFERENCE_CTX_ACP_  (ctx_acp_folder_id) references ctx_acp_folder (ctx_acp_folder_id) on update restrict on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP__REFERENCE_CODE_LO1') " + &
	"  ALTER TABLE ctx_acp_clause  add foreign key FK_CTX_ACP__REFERENCE_CODE_LO1  (category) references code_lookup (lookup_code) on update restrict  on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP__REFERENCE_CODE_LO2') " + &
	"  ALTER TABLE ctx_acp_clause  add foreign key FK_CTX_ACP__REFERENCE_CODE_LO2  (approval_status) references code_lookup (lookup_code) on update restrict   on delete cascade "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_CLAUSE_REFERENCE_EXPORT_H') " + &
	"  ALTER TABLE ctx_acp_clause add constraint FK_CTX_ACP_CLAUSE_REFERENCE_EXPORT_H foreign key (export_id) references export_header (export_id) on update restrict on delete cascade  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP__REFERENCE_CTX_ACP1') " + &
	"  ALTER TABLE ctx_acp_clause_rely add foreign key FK_CTX_ACP__REFERENCE_CTX_ACP1 (ctx_acp_clause_id)	references ctx_acp_clause (ctx_acp_clause_id) on update restrict on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP__REFERENCE_CTX_ACP2') " + &
	"  ALTER TABLE ctx_acp_clause_rely add foreign key FK_CTX_ACP__REFERENCE_CTX_ACP2 (ctx_acp_clause_rely_id) references ctx_acp_clause (ctx_acp_clause_id) on update restrict   on delete cascade "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_TEMPLATE_CODE_LO1') " + &
	"  ALTER TABLE ctx_acp_template add foreign key FK_CTX_ACP_TEMPLATE_CODE_LO1 (Category) references code_lookup (lookup_code) on update restrict  on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP__REFERENCE_EXPORT_H') " + &
	"  ALTER TABLE ctx_acp_template add foreign key FK_CTX_ACP__REFERENCE_EXPORT_H (export_id) references export_header (export_id) on update restrict on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_TEMPLATE_CODE_LO2') " + &
	"  ALTER TABLE ctx_acp_template add foreign key FK_CTX_ACP_TEMPLATE_CODE_LO2 (Reviewed_Status) references code_lookup (lookup_code) on update restrict on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_TEMPLATE_CLASUE_1') " + &
	"  ALTER TABLE ctx_acp_template_clause add foreign key FK_CTX_ACP_TEMPLATE_CLASUE_1 (ctx_acp_template_id) references ctx_acp_template (ctx_acp_template_id) on update restrict on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_TEMPLATE_CLASUE_2') " + &
	"  ALTER TABLE ctx_acp_template_clause add foreign key FK_CTX_ACP_TEMPLATE_CLASUE_2 (ctx_acp_clause_id) references ctx_acp_clause (ctx_acp_clause_id) on update restrict on delete cascade "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_DOCUMENT_CODE_LOO1') " + &
	"  ALTER TABLE ctx_acp_document add foreign key FK_CTX_ACP_DOCUMENT_CODE_LOO1 (Category) references code_lookup (lookup_code) on update restrict on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_DOCUMENT_CODE_LOO2') " + &
	"  ALTER TABLE ctx_acp_document add foreign key FK_CTX_ACP_DOCUMENT_CODE_LOO2 (Reviewed_Status) references code_lookup (lookup_code) on update restrict on delete cascade	 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_AM_DOCUMENT_CTX_BASI') " + &
	"  ALTER TABLE Ctx_am_document add constraint FK_CTX_AM_DOCUMENT_CTX_BASI foreign key (ctx_id) references CTX_BASIC_INFO (ctx_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_AM_DOCUMENT_CODE_LOO1') " + &
	"  ALTER TABLE Ctx_am_document  add constraint FK_CTX_AM_DOCUMENT_CODE_LOO1 foreign key (category)  references code_lookup (lookup_code) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_AM_DOCUMENT_CODE_LOO2') " + &
	"  ALTER TABLE Ctx_am_document  add constraint FK_CTX_AM_DOCUMENT_CODE_LOO2 foreign key (Status) references code_lookup (lookup_code) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_AM_DOC_AUDIT_Doc_id') " + &
	"  ALTER TABLE Ctx_am_doc_audit add constraint FK_CTX_AM_DOC_AUDIT_Doc_id foreign key (Doc_id) references Ctx_am_document (Doc_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_AM_DOC_IMAGE_Doc_id') " + &
	"  ALTER TABLE Ctx_am_doc_image add constraint FK_CTX_AM_DOC_IMAGE_Doc_id foreign key (Doc_id) references Ctx_am_document (Doc_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_AM_ACTION_ITEM_Doc_id') " + &
	"  ALTER TABLE ctx_am_action_item add constraint FK_CTX_AM_ACTION_ITEM_Doc_id foreign key (Doc_id) references Ctx_am_document (Doc_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_AM_ACTION_ITEM_wf_id') " + &
	"  ALTER TABLE ctx_am_action_item add constraint FK_CTX_AM_ACTION_ITEM_wf_id foreign key (wf_id) references wf_workflow (wf_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_AM_ACTION_ITEM_letter_id') " + &
	"  ALTER TABLE ctx_am_action_item add constraint FK_CTX_AM_ACTION_ITEM_letter_id foreign key (letter_id) references sys_letters (letter_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_Ctx_am_document_clause_ctx_acp_clause') " + &
	"  ALTER TABLE Ctx_am_document_clause ADD CONSTRAINT FK_Ctx_am_document_clause_ctx_acp_clause FOREIGN KEY (Ctx_acp_clause_id) REFERENCES ctx_acp_clause (	ctx_acp_clause_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_Ctx_am_document_clause_Ctx_am_document') " + &
	"  ALTER TABLE Ctx_am_document_clause ADD CONSTRAINT FK_Ctx_am_document_clause_Ctx_am_document FOREIGN KEY (Doc_id) REFERENCES Ctx_am_document (Doc_id	) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_TEMPLATE_WF_WORKFLOW') " + &
	"  ALTER TABLE CTX_ACP_TEMPLATE ADD CONSTRAINT FK_CTX_ACP_TEMPLATE_WF_WORKFLOW FOREIGN KEY (wf_id) REFERENCES wf_workflow "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_CTX_ACP_document_WF_WORKFLOW') " + &
	"  ALTER TABLE ctx_acp_document ADD CONSTRAINT FK_CTX_ACP_document_WF_WORKFLOW FOREIGN KEY (wf_id) REFERENCES wf_workflow "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_ACTION_TYPE_ID_CODE_LOOKUP_WF_ACTION_TYPES') " + &
	"  ALTER TABLE wf_action_types ADD CONSTRAINT FK_ACTION_TYPE_ID_CODE_LOOKUP_WF_ACTION_TYPES FOREIGN KEY (action_type_id) REFERENCES code_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_MAIL_NOTIFY_WF_EMAIL_WF_ACTION_TYPES') " + &
	"  ALTER TABLE wf_action_types ADD CONSTRAINT FK_MAIL_NOTIFY_WF_EMAIL_WF_ACTION_TYPES FOREIGN KEY (mail_notify) REFERENCES wf_email "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_ACTION_STATUS_ID_CODE_LOOKUP_WF_ACTION_STATUS') " + &
	"  ALTER TABLE wf_action_status ADD CONSTRAINT FK_ACTION_STATUS_ID_CODE_LOOKUP_WF_ACTION_STATUS FOREIGN KEY (action_status_id) REFERENCES code_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_MAIL_NOTIFY_WF_EMAIL_WF_ACTION_STATUS') " + &
	"  ALTER TABLE wf_action_status ADD CONSTRAINT FK_MAIL_NOTIFY_WF_EMAIL_WF_ACTION_STATUS FOREIGN KEY (mail_notify) REFERENCES wf_email "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_MAIL_REMINDER_WF_EMAIL_WF_ACTION_STATUS') " + &
	"  ALTER TABLE wf_action_status ADD CONSTRAINT FK_MAIL_REMINDER_WF_EMAIL_WF_ACTION_STATUS FOREIGN KEY (mail_reminder) REFERENCES wf_email "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_MAIL_MESSAGE_WF_EMAIL_WF_ACTION_STATUS') " + &
	"  ALTER TABLE wf_action_status ADD CONSTRAINT FK_MAIL_MESSAGE_WF_EMAIL_WF_ACTION_STATUS FOREIGN KEY (mail_message) REFERENCES wf_email "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_LETTER_ID_SYS_LETTERS_WF_ACTION_STATUS') " + &
	"  ALTER TABLE wf_action_status ADD CONSTRAINT FK_LETTER_ID_SYS_LETTERS_WF_ACTION_STATUS FOREIGN KEY (letter_id) REFERENCES sys_letters "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_Tdl_detail_tdl_id') " + &
	"  ALTER TABLE TDL_detail ADD CONSTRAINT FK_Tdl_detail_tdl_id FOREIGN KEY (tdl_id) REFERENCES tdl_basic_info "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_TDL_Security_Roles_Rights_tdl_id') " + &
	"  ALTER TABLE TDL_Security_Roles_Rights ADD CONSTRAINT FK_TDL_Security_Roles_Rights_tdl_id FOREIGN KEY (tdl_id) REFERENCES tdl_basic_info "
//added by nova 2008-04-01
//reason:fixed bug.

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
" ALTER TABLE image_type  DELETE PRIMARY KEY "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"ALTER TABLE image_type modify image_type_id int  not null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"ALTER TABLE image_type  ADD PRIMARY KEY ( image_type_id)"

//added by nova 2008-04-01

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_WV_REQ_IMAGE_ID') " + &
	"  ALTER TABLE wv_required_template_image add constraint FK_WV_REQ_IMAGE_ID foreign key (image_type_id) references image_type (image_type_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_WV_REQ_TEMP_ID') " + &
	"  ALTER TABLE wv_required_template_image add constraint FK_WV_REQ_TEMP_ID foreign key (template_id) references wv_required_template (template_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_FAC_WV_REQ_INIT_ID') " + &
	"  ALTER TABLE facility add constraint FK_FAC_WV_REQ_INIT_ID foreign key (default_wv_init_template) references wv_required_template (template_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_FAC_REQ_REAPP_ID') " + &
	"  ALTER TABLE facility add constraint FK_FAC_REQ_REAPP_ID foreign key (default_wv_reapp_template) references wv_required_template (template_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_Ctx_am_document_clause_Ctx_am_document') " + &
	"  ALTER TABLE ctx_am_document_clause drop foreign key FK_Ctx_am_document_clause_Ctx_am_document "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(select TOP 1 1 from sys.sysforeignkey  where role='FK_Ctx_am_document_clause_Ctx_am_doc_image') " + &
	"  ALTER TABLE ctx_am_document_clause add foreign key FK_Ctx_am_document_clause_Ctx_am_doc_image (Doc_id, Revision) references Ctx_am_doc_image (Doc_id, Revision) on update restrict on delete cascade "


of_execute_sqls("of_ver70_release_table3")

RETURN 1

end function

public function integer of_ver70_release_table4 ();RETURN 1
end function

public function integer of_ver70_patch_table1 ();is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='lock_until' and t.table_name='security_users') " + &
	"alter table security_users add lock_until datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( select TOP 1 1 from sys.syscolumn c, sys.systable t where c.table_id=t.table_id  " + &
	"and c.column_name='npdb_user_id' and t.table_name='facility') " + &
	"alter table facility add npdb_user_id varchar(35) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  primary_office default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  exp_letters default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  include_in_directory default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  prac_correspondence default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  home_address default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  additional_office default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  mailing default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  billing  default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE ctx_contacts_numbers MODIFY phone varchar(25) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE ctx_org_contact MODIFY phone varchar(25) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='isdisabled' " + &
	"     and t.table_name='wv_esign_log') " + &
	"alter table wv_esign_log add isdisabled int null default 0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='force_update' " + &
	"     and t.table_name='ctx_screen') " + &
	"alter table ctx_screen add force_update text null "

of_execute_sqls("of_ver70_patch_table1")
RETURN 1

end function

public function integer of_ver70_release_view1 ();//<add> 03/10/2008 by: nova
//reason:fixed bug: IntelliReports Are Broken.
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"UPDATE conv_view_table SET table_name = (Select distinct dbo.sysobjects.name from dbo.sysobjects where dbo.sysobjects.id = conv_view_table.cust_table_name) where isnull(table_name,'') = '' "
//end of add

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_acedemic_appointments' and type = 'V')  " + &
	"  drop view v_acedemic_appointments "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_acedemic_appointments " + &
	"as select     " + &
	"pd_acedemic_appointments.rec_id, " + &
	"pd_acedemic_appointments.prac_id, " + &
	"school_code=address_lookup.code, " + &
	"school_name=address_lookup.entity_name, " + &
	"pd_acedemic_appointments.month_from, " + &
	"pd_acedemic_appointments.year_from, " + &
	"pd_acedemic_appointments.month_thru, " + &
	"pd_acedemic_appointments.year_thru, " + &
	"pd_acedemic_appointments.cust_6, " + &
	"pd_acedemic_appointments.cust_7, " + &
	"pd_acedemic_appointments.cust_8, " + &
	"pd_acedemic_appointments.cust_9, " + &
	"pd_acedemic_appointments.cust_10, " + &
	"pd_acedemic_appointments.cust_d1, " + &
	"pd_acedemic_appointments.cust_d2, " + &
	"pd_acedemic_appointments.start_date, " + &
	"pd_acedemic_appointments.end_date, " + &
	"achdmc_dept_code=code_lookup_a.code, " + &
	"a_dept_description=code_lookup_a.description, " + &
	"faculty_rank=code_lookup_b.code,faculty_rank_code=code_lookup_b.description  " + &
	"from(((pd_acedemic_appointments left outer join address_lookup on pd_acedemic_appointments.school_code = address_lookup.lookup_code)  " + &
	"left outer join code_lookup as code_lookup_a on pd_acedemic_appointments.department_code = code_lookup_a.lookup_code)  " + &
	"left outer join code_lookup as code_lookup_b on pd_acedemic_appointments.faculty_rank_code = code_lookup_b.lookup_code) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_action_items' and type = 'V')  " + &
	"  drop view v_action_items "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_action_items " + &
	"as select distinct    " + &
	"verif_info.prac_id, " + &
	"verif_info.facility_id, " + &
	"facility.facility_name, " + &
	"data_view_screen.screen_name, " + &
	"verif_info.reference_value, " + &
	"verification_method=code_lookup_b.code, " + &
	"verif_info.first_sent, " + &
	"verif_info.last_sent, " + &
	"verif_info.number_sent, " + &
	"verif_info.date_recieved, " + &
	"verif_info.user_name, " + &
	"response_code=code_lookup_a.code, " + &
	"verif_info.active_status, " + &
	"verif_info.print_flag, " + &
	"verif_info.doc_id, " + &
	"verif_info.notes  " + &
	"from((verif_info left outer join code_lookup as code_lookup_a on verif_info.response_code = code_lookup_a.lookup_code)  " + &
	"left outer join code_lookup as code_lookup_b on verif_info.verification_method = code_lookup_b.lookup_code),facility,data_view_screen  " + &
	"where(verif_info.screen_id = data_view_screen.screen_id)  " + &
	"and(verif_info.facility_id = facility.facility_id)  " + &
	"and((data_view_screen.data_view_id = 1)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_address' and type = 'V')  " + &
	"  drop view v_address "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_address " + &
	"  as select    pd_address.rec_id, " + &
	"    pd_address.prac_id, " + &
	"    practitioner=pd_basic.first_name+pd_basic.last_name, " + &
	"    office_in_home=code_lookup_b.code, " + &
	"    prac_type_code=code_lookup_d.code, " + &
	"    prac_type=code_lookup_d.description, " + &
	"    pd_address.street, " + &
	"    pd_address.city, " + &
	"    state_code=code_lookup_e.code, " + &
	"    state_name=code_lookup_e.description, " + &
	"    country_code=code_lookup_f.code, " + &
	"    country_name=code_lookup_f.description, " + &
	"    pd_address.pager_number, " + &
	"    pd_address.phone, " + &
	"    pd_address.ext, " + &
	"    pd_address.fax, " + &
	"    pd_address.zip, " + &
	"    county_code=code_lookup_g.code, " + &
	"    county_name=code_lookup_g.description, " + &
	"    pd_address.contact_person, " + &
	"    pd_address.tax_id, " + &
	"    pd_address.tax_id_other_1, " + &
	"    pd_address.tax_id_other_2, " + &
	"    pd_address.business_mgr, " + &
	"    pd_address.office_mgr, " + &
	"    pd_address.e_mail_address, " + &
	"    pd_address.web_address, " + &
	"    pd_address.mon_from, " + &
	"    pd_address.mon_to, " + &
	"    pd_address.tue_from, " + &
	"    pd_address.tue_to, " + &
	"    pd_address.wed_from, " + &
	"    pd_address.thu_from, " + &
	"    pd_address.thu_to, " + &
	"    pd_address.fri_from, " + &
	"    pd_address.fri_to, " + &
	"    pd_address.sat_from, " + &
	"    pd_address.sat_to, " + &
	"    pd_address.sun_from, " + &
	"    pd_address.sun_to, " + &
	"    pd_address.mon_from2, " + &
	"    pd_address.mon_to2, " + &
	"    pd_address.tue_from2, " + &
	"    pd_address.tue_to2, " + &
	"    pd_address.wed_from2, " + &
	"    pd_address.wed_to2, " + &
	"    pd_address.thu_from2, " + &
	"    pd_address.thu_to2, " + &
	"    pd_address.fri_from2, " + &
	"    pd_address.fri_to2, " + &
	"    pd_address.sat_from2, " + &
	"    pd_address.sat_to2, " + &
	"    pd_address.sun_from2, " + &
	"    pd_address.sun_to2, " + &
	"    pd_address.wed_to, " + &
	"    pd_address.routine_visit_appt, " + &
	"    pd_address.urgent_visit_appt, " + &
	"    pd_address.emergency_visit_appt, " + &
	"    pd_address.non_emergency_appt, " + &
	"    young_child_code=code_lookup_h.code, " + &
	"    child_code=code_lookup_i.code, " + &
	"    adolescent_code=code_lookup_j.code, " + &
	"    adult_code=code_lookup_k.code, " + &
	"    senior_code=code_lookup_l.code, " + &
	"    handicap_acc=code_lookup_m.description, " + &
	"    on_public_trans=code_lookup_n.description, " + &
	"    pd_address.cust_1, " + &
	"    pd_address.cust_2, " + &
	"    pd_address.cust_3, " + &
	"    pd_address.cust_4, " + &
	"    pd_address.cust_5, " + &
	"    pd_address.cust_6, " + &
	" 	  pd_address.cust_7, " + &
	" 	  pd_address.cust_8, " + &
	" 	  pd_address.cust_9, " + &
	" 	  pd_address.cust_10, " + &
	" 	  pd_address.cust_d1, " + &
	" 	  pd_address.cust_d2, " + &
	" 	  pd_address.suite_apart, " + &
	"    pd_address.street_2, " + &
	"    pd_address.active_status, " + &
	"    pd_address.accepting_new_patients, " + &
	"    pd_address.gp_id,   "+ &
	"    accepting_new_patient=code_lookup_p.description from " + &
	"    pd_address left outer join code_lookup as code_lookup_b on pd_address.office_in_home = code_lookup_b.lookup_code left outer join code_lookup as code_lookup_d on pd_address.practice_type = code_lookup_d.lookup_code left outer join code_lookup as code_lookup_e on pd_address.state = code_lookup_e.lookup_code left outer join code_lookup as code_lookup_f on pd_address.country = code_lookup_f.lookup_code left outer join code_lookup as code_lookup_g on pd_address.county = code_lookup_g.lookup_code left outer join code_lookup as code_lookup_h on pd_address.young_child = code_lookup_h.lookup_code left outer join code_lookup as code_lookup_i on pd_address.child = code_lookup_i.lookup_code left outer join code_lookup as code_lookup_j on pd_address.adolescent = code_lookup_j.lookup_code left outer join code_lookup as code_lookup_k on pd_address.adult = code_lookup_k.lookup_code left outer join code_lookup as code_lookup_l on pd_address.senior_adult = code_lookup_l.lookup_code left outer join code_lookup as code_lookup_m on pd_address.handicapped_access = code_lookup_m.lookup_code left outer join code_lookup as code_lookup_n on pd_address.public_transportation = code_lookup_n.lookup_code left outer join code_lookup as code_lookup_p on pd_address.accepting_new_patients = code_lookup_p.lookup_code, " + &
	"    pd_basic where " + &
	"    (pd_address.prac_id = pd_basic.prac_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_address_link' and type = 'V')  " + &
	"  drop view v_address_link "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_address_link " + &
	"  as select    pd_address_link.address_id, " + &
	"    pd_address_link.prac_id, " + &
	"    pd_address_link.facility_id, " + &
	"    pd_address_link.mailing, " + &
	"    pd_address_link.billing, " + &
	"    pd_address_link.contact_person, " + &
	"    pd_address_link.include_in_directory, " + &
	"    pd_address_link.exp_letters, " + &
	"    pd_address_link.home_address, " + &
	"    pd_address_link.additional_office, " + &
	"    pd_address_link.primary_office from " + &
	"    pd_address_link "



is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_affil_staff_cat' and type = 'V')  " + &
	"  drop view v_affil_staff_cat "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_affil_staff_cat " + &
	"  as select    pd_affil_staff_cat.rec_id, " + &
	"    pd_affil_staff_cat.prac_id, " + &
	"    pd_affil_staff_cat.facility_id, " + &
	"    facility.facility_name, " + &
	"    pd_affil_staff_cat.seq_no, " + &
	"    code_lookup.code, " + &
	"    code_lookup.description, " + &
	"    pd_affil_staff_cat.from_date, " + &
	"    pd_affil_staff_cat.to_date, " + &
	"    pd_affil_staff_cat.active_status, " + &
	"    pd_affil_staff_cat.requested from( " + &
	"    pd_affil_staff_cat left outer join code_lookup on pd_affil_staff_cat.staff_category = code_lookup.lookup_code), " + &
	"    facility where " + &
	"    (pd_affil_staff_cat.facility_id = facility.facility_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_affil_staff_cat_active' and type = 'V')  " + &
	"  drop view v_affil_staff_cat_active "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_affil_staff_cat_active " + &
	"as select    pd_affil_staff_cat.rec_id, " + &
	"pd_affil_staff_cat.prac_id, " + &
	"pd_affil_staff_cat.facility_id, " + &
	"facility.facility_name, " + &
	"pd_affil_staff_cat.seq_no, " + &
	"code_lookup.code as staff_cat_code, " + &
	"code_lookup.description as staff_cat, " + &
	"pd_affil_staff_cat.from_date, " + &
	"pd_affil_staff_cat.to_date, " + &
	"pd_affil_staff_cat.active_status, " + &
	"pd_affil_staff_cat.requested  " + &
	"from pd_affil_staff_cat, " + &
	"code_lookup,facility  " + &
	"where(pd_affil_staff_cat.facility_id = facility.facility_id) and(pd_affil_staff_cat.staff_category = code_lookup.lookup_code)  " + &
	"and(pd_affil_staff_cat.requested = 1) and(pd_affil_staff_cat.active_status in(1,4)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_affil_stat' and type = 'V')  " + &
	"  drop view v_affil_stat "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_affil_stat " + &
	"  as select    pd_affil_stat.rec_id, " + &
	"    pd_affil_stat.prac_id, " + &
	"    pd_affil_stat.parent_facility_id, " + &
	"    pd_affil_stat.verifying_facility as verifying_facility_id, " + &
	"    facility_a.facility_name as parent_facility_name, " + &
	"    facility_b.facility_name as verifying_facility_name, " + &
	"    facility_c.facility_name as app_audit_facility_name, " + &
	"    pd_affil_stat.apptmnt_type, " + &
	"    pd_affil_stat.affiliation_status, " + &
	"    pd_affil_stat.apptmnt_start_date, " + &
	"    pd_affil_stat.apptmnt_end_date, " + &
	"    pd_affil_stat.date_rqst_rcvd, " + &
	"    pd_affil_stat.date_app_sent, " + &
	"    pd_affil_stat.date_app_signed, " + &
	"    pd_affil_stat.date_app_rcvd, " + &
	"    pd_affil_stat.date_rls_form_exp, " + &
	"    pd_affil_stat.date_app_audit_completed, " + &
	"    pd_affil_stat.date_data_entry_completed, " + &
	"    pd_affil_stat.date_verif_completed, " + &
	"    pd_affil_stat.date_comm_review_completed as date_completed, " + &
	"    pd_affil_stat.affil_ended, " + &
	"    code_lookup.code as affil_ended_code, " + &
	"    code_lookup.description as affil_ended_desc, " + &
	"    pd_affil_stat.init_prov_period_from, " + &
	"    pd_affil_stat.init_prov_period_to,pd_affil_stat.staff_category, " + &
	"    pd_affil_stat.active_status,pd_affil_stat.fee, " + &
	"    pd_affil_stat.date_invoiced,pd_affil_stat.date_paid, " + &
	"    pd_affil_stat.priority,pd_affil_stat.priority_user, " + &
	"    pd_affil_stat.custom_1, " + &
	"    pd_affil_stat.custom_2, " + &
	"    pd_affil_stat.custom_3, " + &
	"    pd_affil_stat.custom_4, " + &
	"    pd_affil_stat.custom_5, " + &
	"    pd_affil_stat.prov_status, " + &
	"    pd_affil_stat.prior_appt_start, " + &
	"    pd_affil_stat.prior_appt_end, " + &
	"    pd_affil_stat.appt_note, " + &
	"    code_lookup_a.description as affiliation_status_desc, " + &
	"    pd_affil_stat.inital_appmnt_date from " + &
	"    pd_affil_stat left outer join code_lookup on pd_affil_stat.affil_ended_reason = code_lookup.lookup_code " + &
	"                  left outer join code_lookup as code_lookup_a ON pd_affil_stat.affiliation_status = code_lookup_a.code,"+ &
	"    facility as facility_a, " + &
	"    facility as facility_b, " + &
	"    facility as facility_c " + &
	"where " + &
	"    (facility_a.facility_id = pd_affil_stat.parent_facility_id) and " + &
	"    (facility_b.facility_id = pd_affil_stat.verifying_facility) and " + &
	"    (facility_c.facility_id = pd_affil_stat.application_audit_facility) "+&
   " and (code_lookup_a.lookup_name ='affiliation status')  " 
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_app_audit' and type = 'V')  " + &
	"  drop view v_app_audit "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_app_audit " + &
	"AS " + &
	"SELECT    pd_app_audit.record_id, pd_app_audit.prac_id, pd_app_audit.facility_id, pd_app_audit.seq_no, pd_app_audit.app_audit_id,  " + &
	"                      pd_app_audit.completed, pd_app_audit.date_completed, pd_app_audit.active_status, pd_app_audit.data_status,  " + &
	"                      pd_app_audit.identifying_number, pd_app_audit.appt_stat_id, code_lookup.description AS status, " + &
	"							  pd_app_audit.fax_message AS item_description, pd_app_audit.notes " + &
	"FROM         pd_app_audit LEFT OUTER JOIN " + &
	"                      code_lookup ON pd_app_audit.data_status = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_app_audit_attempts' and type = 'V')  " + &
	"  drop view v_app_audit_attempts "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_app_audit_attempts " + &
	"AS " + &
	"SELECT    record_id, prac_id, facility_id, seq_no, date_attempted, user_name, method, notes, active_status " + &
	"FROM         pd_app_audit_attempts "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_attest_questions' and type = 'V')  " + &
	"  drop view v_attest_questions "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_attest_questions " + &
	"AS " + &
	"SELECT        pd_attest_questions.rec_id, pd_attest_questions.prac_id, pd_attest_questions.question_id, cl_quest_type.code AS question_type_code,  " + &
	"                      cl_quest_type.description AS question_type_description, question_lookup.short_quest, question_lookup.full_quest,  " + &
	"                      pd_attest_questions.answer_code AS answer_lookup_code, cl_answer.code AS answer_code, cl_answer.description AS answer_description,  " + &
	"                      pd_attest_questions.active_status, CASE WHEN pd_attest_questions.active_status = 1 THEN 'Yes' ELSE 'No' END AS active_status_description,  " + &
	"                      pd_attest_questions.facility_id, facility.facility_name, pd_attest_questions.explain_yes " + &
	"FROM  pd_attest_questions INNER JOIN question_lookup ON pd_attest_questions.question_id = question_lookup.quest_id  " + &
	"INNER JOIN   facility ON facility.facility_id = pd_attest_questions.facility_id  " + &
	"INNER JOIN code_lookup cl_answer ON cl_answer.lookup_code = pd_attest_questions.answer_code  " + &
	"inner join code_lookup cl_quest_type ON  cl_quest_type.lookup_code = question_lookup.quest_type "

//move to befor v_audit_trail 2008-03-27
//reason :  BugN032702(WEB&PB  P2)

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_full_name' and type = 'V')  " + &
	"  drop view v_full_name "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_full_name " + &
	"AS " + &
	"SELECT     title = code_lookup_1.code, " + &
	"title_description = code_lookup_1.description, " + &
	"first_name, middle_name, last_name, " + &
	"prof_suffix = code_lookup_2.code, " + &
	"prof_suffix_descp = code_lookup_2.description, " + &
	"gemder = code_lookup_3.description, " + &
	"SUBSTRING(ISNULL(ssn, ''), 1, 3)  " + &
	"                      + '-' + SUBSTRING(ISNULL(ssn, ''), 4, 2) + '-' + SUBSTRING(ISNULL(ssn, ''), 6, 4) AS ssn, LTRIM(RTRIM(ISNULL(last_name, '')))  " + &
	"                      + ', ' + ISNULL(first_name, '') + ' ' + SUBSTRING(ISNULL(middle_name, ''), 1, 1) + CASE WHEN isnull(pd_basic.middle_name, '')  " + &
	"                      = '' THEN '' ELSE '.,' END + LTRIM(RTRIM(ISNULL(code_lookup_4.code,''))) + CASE WHEN isnull " + &
	"                          (code_lookup_4.code,'') = '' THEN '' ELSE ', ' END + LTRIM(RTRIM(ISNULL " + &
	"                          (code_lookup_2.code,''))) AS full_name, " + &
	"prac_id, " + &
	"date_of_birth, " + &
	"rec_id, " + &
	"cust_1, " + &
	"cust_2, " + &
	"cust_3, " + &
	"cust_4, " + &
	"cust_5, " + &
	"cust_11, " + &
	"cust_12, " + &
	"cust_13, " + &
	"cust_14, " + &
	"cust_15, " + &
	"cust_d1, " + &
	"cust_d2, " + &
	"provider_id, " + &
	"npi_number " + &
	"FROM    pd_basic  " + &
	"                   left outer join code_lookup code_lookup_1 on (pd_basic.title = code_lookup_1.lookup_code) " + &
	"                   left outer join code_lookup code_lookup_2 on (pd_basic.prof_suffix = code_lookup_2.lookup_code) " + &
	"                   left outer join code_lookup code_lookup_3 on (pd_basic.sex = code_lookup_3.lookup_code) " + &
	"                   left outer join code_lookup code_lookup_4 on (pd_basic.name_suffix = code_lookup_4.lookup_code) "




is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_audit_trail' and type = 'V')  " + &
	"  drop view v_audit_trail "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_audit_trail " + &
	"  as(select    sys_audit.rec_id, " + &
	"    sys_audit.field_id, " + &
	"    sys_audit.seq_no, " + &
	"    sys_audit.table_id, " + &
	"    sys_audit.prac_id, " + &
	"    sys_audit.old_value, " + &
	"    sys_audit.new_value, " + &
	"    sys_audit.user_id, " + &
	"    sys_audit.date_time_modified, " + &
	"    sys_fields.field_name, " + &
	"    sys_fields.field_name_allias, " + &
	"    sys_tables.table_name_allias, " + &
	"    v_full_name.full_name, " + &
	"    sys_audit.exported, " + &
	"    sys_audit.export_date, " + &
	"    sys_audit.facility_id, " + &
	"    sys_audit.audit_type from " + &
	"    sys_audit left outer join sys_fields on sys_audit.field_id = sys_fields.field_id, " + &
	"    sys_tables, " + &
	"    v_full_name  " + &
	"where (sys_audit.prac_id = v_full_name.prac_id) and " + &
	"    (sys_audit.table_id = sys_tables.table_id) " + &
	") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_basic' and type = 'V')  " + &
	"  drop view v_basic "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_basic " + &
	"  as select    pd_basic.rec_id, " + &
	"    pd_basic.prac_id, " + &
	"    pd_basic.first_name, " + &
	"    pd_basic.last_name, " + &
	"    pd_basic.middle_name, " + &
	"    pd_basic.title, " + &
	"    code_lookup_a.code as title_code, " + &
	"    code_lookup_a.description as title_description, " + &
	"    pd_basic.name_suffix, " + &
	"    code_lookup_b.code as name_suffix_code, " + &
	"    code_lookup_b.description as name_suffix_description, " + &
	"    pd_basic.prof_suffix, " + &
	"    code_lookup_c.code as prof_suffix_code, " + &
	"    code_lookup_c.description as prof_suffix_description, " + &
	"    pd_basic.date_of_birth, " + &
	"    pd_basic.ssn, " + &
	"    pd_basic.sex, " + &
	"    code_lookup_d.code as sex_code, " + &
	"    code_lookup_d.description as sex_description, " + &
	"    pd_basic.prac_category, " + &
	"    code_lookup_e.code as prac_category_code, " + &
	"    code_lookup_e.description as prac_category_description, " + &
	"    pd_basic.maiden_other_name, " + &
	"    pd_basic.pob_city, " + &
	"    pd_basic.pob_state, " + &
	"    code_lookup_f.code as state_code, " + &
	"    code_lookup_f.description as state_description, " + &
	"    pd_basic.pob_country, " + &
	"    code_lookup_g.code as pob_country_code, " + &
	"    code_lookup_g.description as pob_country_description, " + &
	"    pd_basic.citizenship, " + &
	"    code_lookup_h.code as citizenship_code, " + &
	"    pd_basic.married, " + &
	"    code_lookup_i.code as married_code, " + &
	"    pd_basic.spouse_name, " + &
	"    pd_basic.phone, " + &
	"    pd_basic.answering_service, " + &
	"    pd_basic.beeper_1, " + &
	"    pd_basic.beeper_2, " + &
	"    pd_basic.personal_pager, " + &
	"    pd_basic.hospital_pager, " + &
	"    pd_basic.car_phone_1, " + &
	"    pd_basic.car_phone_2, " + &
	"    pd_basic.civilian_fed_employee, " + &
	"    code_lookup_j.code as civilian_fed_employee_code, " + &
	"    pd_basic.active_military, " + &
	"    code_lookup_k.code as active_military_code, " + &
	"    pd_basic.reservist, " + &
	"    code_lookup_l.code as reservist_code, " + &
	"    pd_basic.branch, " + &
	"    pd_basic.rank, " + &
	"    pd_basic.service_number, " + &
	"    pd_basic.service_date_from, " + &
	"    pd_basic.service_date_to, " + &
	"    pd_basic.cust_1, " + &
	"    pd_basic.cust_2, " + &
	"    pd_basic.cust_3, " + &
	"    pd_basic.cust_5, " + &
	"    pd_basic.cust_6, " + &
	"    pd_basic.cust_7, " + &
	"    pd_basic.cust_8, " + &
	"    pd_basic.cust_9, " + &
	"    pd_basic.cust_10, " + &
	"    pd_basic.full_name, " + &
	"    pd_basic.npdb_query, " + &
	"    pd_basic.provider_id, " + &
	"    pd_basic.provider_type, " + &
	"    code_lookup_m.code as provider_type_code, " + &
	"    code_lookup_m.description as provider_type_description, " + &
	"    pd_basic.cust_4, " + &
	"    pd_basic.oig_query, " + &
	"    pd_basic.npi_number, " + &
	"    pd_basic.cust_11, " + &
	"    pd_basic.cust_12, " + &
	"    pd_basic.cust_13, " + &
	"    pd_basic.cust_14, " + &
	"    pd_basic.cust_15, " + &
	"    pd_basic.cust_d1, " + &
	"    pd_basic.cust_d2 " + &
	"from " + &
	"    pd_basic LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_a ON pd_basic.title = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_b ON pd_basic.name_suffix = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_c ON pd_basic.prof_suffix = code_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_d ON pd_basic.sex = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_e ON pd_basic.prac_category = code_lookup_e.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_f ON pd_basic.pob_state = code_lookup_f.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_g ON pd_basic.pob_country = code_lookup_g.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_h ON pd_basic.citizenship = code_lookup_h.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_i ON pd_basic.married = code_lookup_i.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_j ON pd_basic.civilian_fed_employee = code_lookup_j.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_k ON pd_basic.active_military = code_lookup_k.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_l ON pd_basic.reservist = code_lookup_l.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_m ON pd_basic.provider_type = code_lookup_m.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_basic_info' and type = 'V')  " + &
	"  drop view v_basic_info "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_basic_info " + &
	"  as select    pd_basic.rec_id, " + &
	"    pd_basic.prac_id, " + &
	"    pd_basic.first_name, " + &
	"    pd_basic.middle_name, " + &
	"    pd_basic.last_name, " + &
	"    code_lookup_a.code as title_code, " + &
	"    code_lookup_a.description as title_description, " + &
	"    code_lookup_b.code as name_suffix_code, " + &
	"    code_lookup_b.description as name_suffix_description, " + &
	"    code_lookup_c.code as prof_suffix_code, " + &
	"    code_lookup_c.description as prof_suffix_description, " + &
	"    pd_basic.date_of_birth, " + &
	"    pd_basic.ssn, " + &
	"    code_lookup_d.code as gender_code, " + &
	"    code_lookup_d.description as gender_description, " + &
	"    code_lookup_e.code as prac_category_code, " + &
	"    code_lookup_e.description as prac_category_description, " + &
	"    pd_basic.provider_id, " + &
	"    code_lookup_f.code as provider_type_code, " + &
	"    code_lookup_f.description as provider_type_description, " + &
	"    pd_basic.maiden_other_name, " + &
	"    pd_basic.cust_1, " + &
	"    pd_basic.cust_2, " + &
	"    pd_basic.cust_3, " + &
	"    pd_basic.cust_4, " + &
	"    pd_basic.cust_5, " + &
	"    pd_basic.cust_6, " + &
	"    pd_basic.cust_7, " + &
	"    pd_basic.cust_8, " + &
	"    pd_basic.cust_9, " + &
	"    pd_basic.cust_10, " + &
	"    pd_basic.npi_number, " + &
	"    pd_basic.cust_11, " + &
	"    pd_basic.cust_12, " + &
	"    pd_basic.cust_13, " + &
	"    pd_basic.cust_14, " + &
	"    pd_basic.cust_15, " + &
	"    pd_basic.cust_d1, " + &
	"    pd_basic.cust_d2 " + &
	"from " + &
	"    pd_basic LEFT OUTER JOIN  " + &
	"    code_lookup as code_lookup_a ON pd_basic.title = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_b ON pd_basic.name_suffix = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_c ON pd_basic.prof_suffix = code_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_d ON pd_basic.sex = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_e ON pd_basic.prac_category = code_lookup_e.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_f ON pd_basic.provider_type = code_lookup_f.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_billing_address' and type = 'V')  " + &
	"  drop view v_billing_address "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_billing_address " + &
	"AS " + &
	"SELECT        pa.rec_id AS practice_address_id, ba.rec_id AS billing_address_id, ba.prac_id, pd_basic.first_name + ' ' + pd_basic.last_name AS practitioner,  " + &
	"                      code_lookup_b.code AS office_in_home, code_lookup_d.code AS prac_type_code, code_lookup_d.description AS prac_type, ba.street, ba.street_2,  " + &
	"                      ba.city, code_lookup_e.code AS state_code, code_lookup_e.description AS state_name, code_lookup_f.code AS country_code,  " + &
	"                      code_lookup_f.description AS country_name, ba.pager_number, ba.phone, ba.ext, ba.fax, ba.zip, code_lookup_g.code AS county_code,  " + &
	"                      code_lookup_g.description AS county_name, ba.contact_person, ba.tax_id, ba.tax_id_other_1, ba.tax_id_other_2, ba.business_mgr, ba.office_mgr,  " + &
	"                      ba.e_mail_address, ba.web_address, ba.mon_from, ba.mon_to, ba.tue_from, ba.tue_to, ba.wed_from, ba.thu_from, ba.thu_to, ba.fri_from, ba.fri_to,  " + &
	"                      ba.sat_from, ba.sat_to, ba.sun_from, ba.sun_to, ba.mon_from2, ba.mon_to2, ba.tue_from2, ba.tue_to2, ba.wed_from2, ba.wed_to2, ba.thu_from2,  " + &
	"                      ba.thu_to2, ba.fri_from2, ba.fri_to2, ba.sat_from2, ba.sat_to2, ba.sun_from2, ba.sun_to2, ba.wed_to, ba.routine_visit_appt, ba.urgent_visit_appt,  " + &
	"                      ba.emergency_visit_appt, ba.non_emergency_appt, code_lookup_h.code AS young_child_code, code_lookup_i.code AS child_code,  " + &
	"                      code_lookup_j.code AS adolescent_code, code_lookup_k.code AS adult_code, code_lookup_l.code AS senior_code,  " + &
	"                      code_lookup_m.description AS handicap_acc, code_lookup_n.description AS on_public_trans, ba.cust_1, ba.cust_2, ba.cust_3, ba.cust_4, ba.cust_5,  " + &
	"                      ba.cust_6, ba.cust_7, ba.cust_8, ba.cust_9, ba.cust_10, ba.cust_d1, ba.cust_d2, ba.active_status, ba.accepting_new_patients,  " + &
	"                      code_lookup_p.description AS accepting_new_patient, ba.gp_id, code_lookup_q.description AS send_corresp_here, ba.suite_apart " + &
	"FROM         pd_address pa LEFT OUTER JOIN " + &
	"                      pd_basic ON pa.prac_id = pd_basic.prac_id LEFT OUTER JOIN " + &
	"                      pd_address ba ON CASE WHEN pa.billing_address_id = 0 THEN pa.rec_id ELSE pa.billing_address_id END = ba.rec_id LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_b ON ba.office_in_home = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_d ON ba.practice_type = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_e ON ba.state = code_lookup_e.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_f ON ba.country = code_lookup_f.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_g ON ba.county = code_lookup_g.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_h ON ba.young_child = code_lookup_h.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_i ON ba.child = code_lookup_i.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_j ON ba.adolescent = code_lookup_j.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_k ON ba.adult = code_lookup_k.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_l ON ba.senior_adult = code_lookup_l.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_m ON ba.handicapped_access = code_lookup_m.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_n ON ba.public_transportation = code_lookup_n.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_p ON ba.accepting_new_patients = code_lookup_p.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_q ON ba.send_corresp_here = code_lookup_q.lookup_code " + &
	"WHERE     (pa.billing_address_id <> - 1) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_board_specialty' and type = 'V')  " + &
	"  drop view v_board_specialty "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_board_specialty " + &
	"as select    pd_board_specialty.rec_id, " + &
	"    pd_board_specialty.prac_id, " + &
	"    pd_board_specialty.specialty, " + &
	"    code_lookup_a.code as specialty_code, " + &
	"    code_lookup_a.description as specialty_description, " + &
	"    address_lookup.code as board_code, " + &
	"    address_lookup.entity_name as board_name, " + &
	"    pd_board_specialty.eligible_until, " + &
	"    pd_board_specialty.initial_certification, " + &
	"    pd_board_specialty.last_recertification, " + &
	"    pd_board_specialty.certification_expires, " + &
	"    pd_board_specialty.certification_number, " + &
	"    pd_board_specialty.required_year_completion, " + &
	"    pd_board_specialty.cust_1, " + &
	"    pd_board_specialty.cust_2, " + &
	"    pd_board_specialty.cust_3, " + &
	"    pd_board_specialty.cust_4, " + &
	"    pd_board_specialty.cust_5, " + &
	"    pd_board_specialty.cust_6, " + &
	"    pd_board_specialty.cust_7, " + &
	"    pd_board_specialty.cust_8, " + &
	"    pd_board_specialty.cust_9, " + &
	"    pd_board_specialty.cust_10, " + &
	"    pd_board_specialty.cust_d1, " + &
	"    pd_board_specialty.cust_d2, " + &
	"    pd_board_specialty.initial_cert_date, " + &
	"    pd_board_specialty.last_cert_date, " + &
	"    pd_board_specialty.expiration_date, " + &
	"    pd_board_specialty.eligible_until_date, " + &
	"    pd_board_specialty.compl_req_date, " + &
	"    code_lookup_b.description as exam_taken, " + &
	"    code_lookup_c.description as active_process, " + &
	"    code_lookup_f.description as board_certified, " + &
	"    code_lookup_d.description as ever_failed, " + &
	"    code_lookup_e.description as specialty_order from " + &
	"    pd_board_specialty left outer join address_lookup on pd_board_specialty.board_code = address_lookup.lookup_code left outer join code_lookup as code_lookup_b on pd_board_specialty.exam_taken = code_lookup_b.lookup_code left outer join code_lookup as code_lookup_c on pd_board_specialty.active_cert_process = code_lookup_c.lookup_code left outer join code_lookup as code_lookup_d on pd_board_specialty.ever_failed_cert = code_lookup_d.lookup_code   left outer join code_lookup AS code_lookup_f ON pd_board_specialty.board_certified = code_lookup_f.lookup_code   left outer join code_lookup as code_lookup_e on pd_board_specialty.specialty_order = code_lookup_e.lookup_code, " + &
	"    code_lookup as code_lookup_a where " + &
	"    (pd_board_specialty.specialty = code_lookup_a.lookup_code) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_claims' and type = 'V')  " + &
	"  drop view v_claims "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_claims " + &
	"as select    pd_claims.rec_id,pd_claims.prac_id,pd_claims.case_number,pd_claims.claimant,status_code=code_lookup.code,status_descripton=code_lookup.description,pd_claims.nature_of_claim,pd_claims.date_closed,pd_claims.date_of_incident,pd_claims.case_role,pd_claims.other_role,pd_claims.amt_attrib_you,pd_claims.adj_set_dis,pd_claims.amount_paid,pd_claims.date_last_contact,pd_claims.date_initiated,pd_claims.practice_role,pd_claims.practice_other,pd_claims.alleged_malpractice,pd_claims.alleged_harm,pd_claims.patient_illness,pd_claims.other_details,pd_claims.date_claimed_filed,pd_claims.carrier,pd_claims.cust_1,pd_claims.cust_2,pd_claims.cust_3,pd_claims.cust_4,pd_claims.cust_5,pd_claims.cust_6,pd_claims.cust_7,pd_claims.cust_8,pd_claims.cust_9,pd_claims.cust_10,pd_claims.cust_d1,pd_claims.cust_d2  from(pd_claims left outer join code_lookup on pd_claims.status_code = code_lookup.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_clinical_specialties' and type = 'V')  " + &
	"  drop view v_clinical_specialties "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_clinical_specialties " + &
	"as select    pd_clinical_specialties.rec_id,pd_clinical_specialties.prac_id,rank_code=code_lookup.code,rank_description=code_lookup.description,pd_clinical_specialties.specialty_expertise,pd_clinical_specialties.cust_1,pd_clinical_specialties.cust_2,pd_clinical_specialties.cust_3,pd_clinical_specialties.cust_4,pd_clinical_specialties.cust_5 from(pd_clinical_specialties left outer join code_lookup on pd_clinical_specialties.rank = code_lookup.lookup_code)  "


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_code_lookup_1' and type = 'V')  " + &
	"  drop view v_code_lookup_1 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_code_lookup_1 " + &
	"AS " + &
	"SELECT        lookup_code, lookup_name AS table_name, code, description, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, caqh_code, ic_n,  " + &
	"                      ic_c " + &
	"FROM         code_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_code_lookup_2' and type = 'V')  " + &
	"  drop view v_code_lookup_2 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_code_lookup_2 " + &
	"AS " + &
	"SELECT        lookup_code, lookup_name AS table_name, code, description, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6, caqh_code, ic_n,  " + &
	"                      ic_c " + &
	"FROM         code_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_committee_lookup' and type = 'V')  " + &
	"  drop view v_committee_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_committee_lookup " + &
	"AS " + &
	"SELECT        committee_id, facility_id, committee_name " + &
	"FROM         committee_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_committee_review' and type = 'V')  " + &
	"  drop view v_committee_review "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_committee_review " + &
	"as select    pd_comm_review.rec_id,pd_comm_review.prac_id,pd_comm_review.facility_id,facility_name=facility.facility_name,committee_name=committee_lookup.committee_name,pd_comm_review.date_sent_for_review,pd_comm_review.date_back_from_review,review_result_code=code_lookup_a.code,review_result_name=code_lookup_a.description,pd_comm_review.active_status from(pd_comm_review left outer join code_lookup as code_lookup_a on pd_comm_review.review_results = code_lookup_a.lookup_code),committee_lookup,facility where(pd_comm_review.facility_id = facility.facility_id) and(pd_comm_review.committee_id = committee_lookup.committee_id)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_continue_education' and type = 'V')  " + &
	"  drop view v_continue_education "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_continue_education " + &
	"AS " + &
	"SELECT        pd_postgrad_train.prac_id, pd_postgrad_train.subject, pd_postgrad_train.date_from, pd_postgrad_train.date_thru,  " + &
	"                      pd_postgrad_train.loc_city, code_lookup_a.code AS loc_state_code, code_lookup_a.description AS loc_state_description,  " + &
	"                      pd_postgrad_train.loc_zip, pd_postgrad_train.loc_country, pd_postgrad_train.hours, code_lookup_b.code AS category_code,  " + &
	"                      code_lookup_b.description AS category_description, pd_postgrad_train.sponsor, pd_postgrad_train.street, pd_postgrad_train.city,  " + &
	"                      code_lookup_c.code AS state_code, code_lookup_c.description AS state_description, pd_postgrad_train.zip, code_lookup_d.code AS country_code, " + &
	"                       code_lookup_d.description AS country_description, pd_postgrad_train.program_director, pd_postgrad_train.cust_1,  " + &
	"                      pd_postgrad_train.cust_2, pd_postgrad_train.cust_3, pd_postgrad_train.cust_4, pd_postgrad_train.cust_5,  " + &
	"                      pd_postgrad_train.cust_6, pd_postgrad_train.cust_7, pd_postgrad_train.cust_8, pd_postgrad_train.cust_9,  " + &
	"                      pd_postgrad_train.cust_10, pd_postgrad_train.cust_d1, pd_postgrad_train.cust_d2 " + &
	"FROM         pd_postgrad_train LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_d ON pd_postgrad_train.country = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_b ON pd_postgrad_train.category = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_c ON pd_postgrad_train.state = code_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_a ON pd_postgrad_train.loc_state = code_lookup_a.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_contract' and type = 'V')  " + &
	"  drop view v_contract "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_contract " + &
	"as select    pd_contract.rec_id,pd_contract.prac_id,group_plan_code=address_lookup.code,group_plan_description=address_lookup.entity_name,sub_group_code=code_lookup_a.code,sub_group_description=code_lookup_a.description,catagory_code=code_lookup_b.code,catagory_description=code_lookup_b.description,pd_contract.start_date,pd_contract.end_date,reason_code=code_lookup_c.code,reason_description=code_lookup_c.description,pd_contract.mco_provider_id,pd_contract.cust_1,pd_contract.cust_2,pd_contract.cust_3,pd_contract.cust_4,pd_contract.cust_5 from((((pd_contract left outer join address_lookup on pd_contract.group_plan = address_lookup.lookup_code) left outer join code_lookup as code_lookup_a on pd_contract.sub_group_plan = code_lookup_a.lookup_code) left outer join code_lookup as code_lookup_b on pd_contract.category = code_lookup_b.lookup_code) left outer join code_lookup as code_lookup_c on pd_contract.reason = code_lookup_c.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_cpr_certification' and type = 'V')  " + &
	"  drop view v_cpr_certification "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_cpr_certification " + &
	"AS " + &
	"SELECT        pd_cpr_certifiation.rec_id, pd_cpr_certifiation.prac_id, pd_cpr_certifiation.bls_expires, pd_cpr_certifiation.acls_expires,  " + &
	"                      pd_cpr_certifiation.atls_expires, pd_cpr_certifiation.cust_1, pd_cpr_certifiation.cust_2, pd_cpr_certifiation.cust_3,  " + &
	"                      pd_cpr_certifiation.cust_4, pd_cpr_certifiation.cust_5, pd_cpr_certifiation.cust_6, pd_cpr_certifiation.cust_7,  " + &
	"                      pd_cpr_certifiation.cust_8, pd_cpr_certifiation.cust_9, pd_cpr_certifiation.cust_10, pd_cpr_certifiation.cust_d1,  " + &
	"                      pd_cpr_certifiation.cust_d2, pd_cpr_certifiation.cert_type AS cert_type_lookup_code, code_lookup.code AS cert_type_code,  " + &
	"                      code_lookup.description AS cert_type_description, code_lookup_1.description AS certified " + &
	"FROM         pd_cpr_certifiation INNER JOIN " + &
	"                      code_lookup ON pd_cpr_certifiation.cert_type = code_lookup.lookup_code INNER JOIN " + &
	"                      code_lookup code_lookup_1 ON pd_cpr_certifiation.certified = code_lookup_1.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_basic_info' and type = 'V')  " + &
	"  drop view v_ctx_basic_info "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_basic_info " + &
	"as SELECT     " + &
	"	app_facility.facility_name AS Company_Name,  " + &
	"	app_facility.street AS Company_street_1, " + &
	"	app_facility.street_2 AS Company_street_2, " + &
	"	app_facility.city AS Company_city, " + &
	"	app_facility.state AS Company_state, " + &
	"	app_facility.zip AS Company_zip, " + &
	"	app_facility.country AS Company_country, " + &
	"	app_facility.phone AS Company_phone, " + &
	"	app_facility.fax AS Company_fax, " + &
	"	app_facility.web_address AS Company_web_address, " + &
	"	app_facility.contact_type2 AS Company_contact_type2, " + &
	"	app_facility.corp_office_flag AS Company_corp_office_flag, " + &
	"	app_facility.corp_office_link AS Company_corp_office_link, " + &
	"	code_lookup.code AS Contract_Category_code,  " + &
	"	code_lookup.description AS Contract_Category_description,  " + &
	"	code_lookup_1.code AS Contract_Status_code,  " + &
	"	code_lookup_2.code AS contract_type_code,  " + &
	"	code_lookup_2.description AS contract_type_Description,  " + &
	"	code_lookup_3.code AS term_reason_code,  " + &
	"	code_lookup_3.description AS term_Reason_Desciption,  " + &
	"	code_lookup_4.description AS product_type_desc,  " + &
	"	code_lookup_4.code AS product_type_code,  " + &
	"	code_lookup_5.code AS product_code,  " + &
	"	code_lookup_5.description AS product_description,  " + &
	"	ctx_basic_info.ctx_id,    " + &
	"	ctx_basic_info.category,    " + &
	"	ctx_basic_info.status,    " + &
	"	ctx_basic_info.facility_id,    " + &
	"	ctx_basic_info.contract_type,    " + &
	"	ctx_basic_info.product_type,    " + &
	"	ctx_basic_info.product_name,    " + &
	"	ctx_basic_info.reimbursment_menth,    " + &
	"	ctx_basic_info.file_location,    " + &
	"	ctx_basic_info.effective_date,    " + &
	"	ctx_basic_info.expriation_date,    " + &
	"	ctx_basic_info.review_date,    " + &
	"	ctx_basic_info.review_by,    " + &
	"	ctx_basic_info.term_date,    " + &
	"	ctx_basic_info.term_reason,    " + &
	"	ctx_basic_info.last_revis_date,    " + &
	"	ctx_basic_info.other_date_1,    " + &
	"	ctx_basic_info.other_date_2,    " + &
	"	ctx_basic_info.oc_signed_by,    " + &
	"	ctx_basic_info.oc_title,    " + &
	"	ctx_basic_info.oc_department,    " + &
	"	ctx_basic_info.oc_legal_rep,    " + &
	"	ctx_basic_info.cc_signed_by,    " + &
	"	ctx_basic_info.cc_title,    " + &
	"	ctx_basic_info.cc_department,    " + &
	"	ctx_basic_info.cc_legal_rep,    " + &
	"	ctx_basic_info.keyword,    " + &
	"	ctx_basic_info.dvision,    " + &
	"	ctx_basic_info.custom_1,    " + &
	"	ctx_basic_info.custom_2,    " + &
	"	ctx_basic_info.custom_3,    " + &
	"	ctx_basic_info.custom_4,    " + &
	"	ctx_basic_info.custom_5,    " + &
	"	ctx_basic_info.custom_6,    " + &
	"	ctx_basic_info.custom_7,    " + &
	"	ctx_basic_info.custom_8,    " + &
	"	ctx_basic_info.custom_9,    " + &
	"	ctx_basic_info.custom_10,    " + &
	"	ctx_basic_info.group_multi_loc_id,    " + &
	"	ctx_basic_info.revision_reason,    " + &
	"	ctx_basic_info.group_id,    " + &
	"	ctx_basic_info.record_id,    " + &
	"	ctx_basic_info.custom_11,    " + &
	"	ctx_basic_info.custom_12,    " + &
	"	ctx_basic_info.custom_13,    " + &
	"	ctx_basic_info.custom_14,    " + &
	"	ctx_basic_info.custom_15,    " + &
	"	ctx_basic_info.custom_16,    " + &
	"	ctx_basic_info.custom_17,    " + &
	"	ctx_basic_info.custom_18,    " + &
	"	ctx_basic_info.custom_19,    " + &
	"	ctx_basic_info.custom_20,    " + &
	"	ctx_basic_info.custom_date1,    " + &
	"	ctx_basic_info.custom_date2,    " + &
	"	ctx_basic_info.custom_date3,    " + &
	"	ctx_basic_info.custom_date4,    " + &
	"	ctx_basic_info.custom_date5,    " + &
	"	ctx_basic_info.custom_date6,    " + &
	"	ctx_basic_info.custom_date7,    " + &
	"	ctx_basic_info.custom_date8,    " + &
	"	ctx_basic_info.custom_date9,    " + &
	"	ctx_basic_info.custom_date10,    " + &
	"	ctx_basic_info.custom_n1,    " + &
	"	ctx_basic_info.custom_n2,    " + &
	"	ctx_basic_info.custom_n3,    " + &
	"	ctx_basic_info.custom_n4,    " + &
	"	ctx_basic_info.custom_n5,    " + &
	"	ctx_basic_info.custom_n6,    " + &
	"	ctx_basic_info.custom_n7,    " + &
	"	ctx_basic_info.custom_n8,    " + &
	"	ctx_basic_info.custom_n9,    " + &
	"	ctx_basic_info.custom_n10,    " + &
	"	ctx_basic_info.version_number,    " + &
	"	ctx_basic_info.version_date,    " + &
	"	ctx_basic_info.notes,    " + &
	"	ctx_basic_info.app_facility,   " + &
	"	ctx_basic_info.master_contract_id AS master_ctx_id,  " + &
	"	ctx_basic_info.master_contract_name, " + &
	"	code_lookup_6.code as dvision_code,  " + &
	"	code_lookup_6.description as dvision_description " + &
	"FROM (((((((ctx_basic_info  " + &
	"LEFT OUTER JOIN code_lookup ON ctx_basic_info.category = code_lookup.lookup_code)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_1 ON ctx_basic_info.status = code_lookup_1.lookup_code)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_2 ON ctx_basic_info.contract_type = code_lookup_2.lookup_code)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_3 ON ctx_basic_info.term_reason = code_lookup_3.lookup_code)  " + &
	"INNER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id)  " + &
	"INNER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_4 ON ctx_products.product_type = code_lookup_4.lookup_code)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_5 ON ctx_products.product_id = code_lookup_5.lookup_code " + &
	"left outer join code_lookup as code_lookup_6 on ctx_basic_info.dvision = code_lookup_6.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_basic_info_alarms' and type = 'V')  " + &
	"  drop view v_ctx_basic_info_alarms "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_basic_info_alarms " + &
	"as SELECT     " + &
	"	ctx_basic_info.ctx_id,  " + &
	"	app_facility.facility_name,  " + &
	"	ctx_notification_users.user_id,  " + &
	"	ctx_notification.alm_message,  " + &
	"	ctx_notification.alm_enabled,  " + &
	"	ctx_notification.alm_notification_days,  " + &
	"	ctx_notification.alm_last_notification_sent,  " + &
	"	ctx_notification.alm_post_notification_days,  " + &
	"	ctx_notification.alm_total_tries,  " + &
	"	ctx_notification.alm_action_item_posted,  " + &
	"	ctx_notification.alm_total_tries_counter,  " + &
	"	ctx_notification.alm_frequency,  " + &
	"	ctx_notification.create_action_item  " + &
	"FROM ((ctx_basic_info  " + &
	"LEFT OUTER JOIN ctx_notification ON ctx_basic_info.ctx_id = ctx_notification.ctx_id)  " + &
	"INNER JOIN ctx_notification_users ON ctx_basic_info.ctx_id = ctx_notification_users.ctx_id)  " + &
	"INNER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id  " + &
	"GROUP BY ctx_basic_info.ctx_id,  " + &
	"	app_facility.facility_name,  " + &
	"	ctx_notification_users.user_id,  " + &
	"	ctx_notification.alm_message,  " + &
	"	ctx_notification.alm_enabled,  " + &
	"	ctx_notification.alm_notification_days,  " + &
	"	ctx_notification.alm_last_notification_sent,  " + &
	"	ctx_notification.alm_post_notification_days,  " + &
	"	ctx_notification.alm_total_tries,  " + &
	"	ctx_notification.alm_action_item_posted,  " + &
	"	ctx_notification.alm_total_tries_counter,  " + &
	"	ctx_notification.alm_frequency,  " + &
	"	ctx_notification.create_action_item  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_basic_products' and type = 'V')  " + &
	"  drop view v_ctx_basic_products "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_basic_products " + &
	"as SELECT    ctx_products.ctx_id,        code_lookup_4.description AS product_type_desc,        code_lookup_4.code AS product_type_code,        code_lookup_5.code AS product_code,        code_lookup_5.description AS product_description FROM (ctx_products LEFT OUTER JOIN code_lookup AS code_lookup_4 ON ctx_products.product_type = code_lookup_4.lookup_code)                    LEFT OUTER JOIN code_lookup AS code_lookup_5 ON ctx_products.product_id = code_lookup_5.lookup_code  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_basic_without_products' and type = 'V')  " + &
	"  drop view v_ctx_basic_without_products "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_basic_without_products " + &
	"as SELECT    CTX_BASIC_INFO.ctx_id,        app_facility.facility_name,         code_lookup.code AS Contract_Category_code,        code_lookup.description AS Contract_Category_description,        code_lookup_1.code AS Contract_Status_code,        code_lookup_2.code AS contract_type_code,        code_lookup_2.description AS contract_type_Description,        CTX_BASIC_INFO.effective_date,        CTX_BASIC_INFO.expriation_date,        CTX_BASIC_INFO.review_date,        CTX_BASIC_INFO.review_by,        CTX_BASIC_INFO.term_date,        code_lookup_3.code AS term_reason_code,        code_lookup_3.description AS term_Reason_Desciption,        CTX_BASIC_INFO.other_date_1,        CTX_BASIC_INFO.other_date_2,        CTX_BASIC_INFO.notes,        CTX_BASIC_INFO.custom_1,        CTX_BASIC_INFO.custom_2,        CTX_BASIC_INFO.custom_3,        CTX_BASIC_INFO.custom_4,        CTX_BASIC_INFO.custom_5,        CTX_BASIC_INFO.custom_6,        CTX_BASIC_INFO.custom_7,        CTX_BASIC_INFO.custom_8,        CTX_BASIC_INFO.custom_9,        CTX_BASIC_INFO.custom_10,        CTX_BASIC_INFO.last_revis_date        FROM ((((CTX_BASIC_INFO                         LEFT OUTER JOIN code_lookup ON CTX_BASIC_INFO.category = code_lookup.lookup_code)                         LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_BASIC_INFO.status = code_lookup_1.lookup_code)                         LEFT OUTER JOIN code_lookup AS code_lookup_2 ON CTX_BASIC_INFO.contract_type = code_lookup_2.lookup_code)                         LEFT OUTER JOIN code_lookup AS code_lookup_3 ON CTX_BASIC_INFO.term_reason = code_lookup_3.lookup_code)                         INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id  "


//$<Modify> 2008-04-25 By: Nova  begin
//$<Reason> fixed Issues 4 from IntelliReport Issues 4-22-08.doc

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from  sysobjects where  name='V_ctx_contract_contacts' and type = 'V')  " + &
"  drop view V_ctx_contract_contacts "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"CREATE VIEW  V_ctx_contract_contacts " + &
"AS SELECT     contact_id,  " + &
"          (SELECT     TOP 1 phone  " + &
"            FROM          CTX_CONTACTS_NUMBERS AS A  " + &
"            WHERE      (contact_id = CTX_CONTRACT_CONTACTS.contact_id) AND (via =  " + &
"                                       (SELECT     TOP 1 lookup_code  " + &
"                                         FROM          code_lookup  " + &
"                                         WHERE      (lookup_name = 'Contract Contact Via') AND (code = 'Phone') ))) AS contact_phone,  " + &
"          (SELECT     TOP 1 contact_email  " + &
"            FROM          CTX_CONTACTS_NUMBERS AS A  " + &
"            WHERE      (contact_id = CTX_CONTRACT_CONTACTS.contact_id) AND (via =  " + &
"                                       (SELECT     TOP 1 lookup_code   " + &
"                                         FROM          code_lookup AS code_lookup_2  " + &
"                                        WHERE      (lookup_name = 'Contract Contact Via') AND (code = 'Email')  )) ) AS contact_email,  " + &
"          (SELECT     TOP 1 phone  " + &
"            FROM          CTX_CONTACTS_NUMBERS AS A  " + &
"            WHERE      (contact_id = CTX_CONTRACT_CONTACTS.contact_id) AND (via =  " + &
"                                       (SELECT     TOP 1 lookup_code  " + &
"                                         FROM          code_lookup AS code_lookup_1  " + &
"                                         WHERE      (lookup_name = 'Contract Contact Via') AND (code = 'Fax') )) ) AS contact_Fax,   " + &
"          (SELECT     TOP 1 ext  " + &
"            FROM          CTX_CONTACTS_NUMBERS AS A  " + &
"           WHERE      (contact_id = CTX_CONTRACT_CONTACTS.contact_id)  AND (via =  " + &
"                                       (SELECT     TOP 1 lookup_code  " + &
"                                         FROM          code_lookup  " + &
"                                         WHERE      (lookup_name = 'Contract Contact Via') AND (code = 'Phone') )) ) AS ext,   " + &
"            association, notes, owner, access, ctx_id, ic_area  " + &
"FROM         CTX_CONTRACT_CONTACTS  "
//

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_contacts_contacts' and type = 'V')  " + &
"  drop view v_ctx_contacts_contacts "

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-04-24 By: Scofield
//$<Reason> Change ctx_contacts's address to app_facility's address.

/*
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"CREATE VIEW  v_ctx_contacts_contacts " + &
"as SELECT  top 100 percent  CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code aS contract_type_code, code_lookup.description AS contract_type_description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, code_lookup_4.description as contact_title, code_lookup_1.code AS contract_department_code, code_lookup_1.description AS contract_department_description, CTX_CONTACTS.street_1, CTX_CONTACTS.street_2, CTX_CONTACTS.street_3, CTX_CONTACTS.city, CTX_CONTACTS.zip, code_lookup_2.code AS state, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code AS Phone_Type_code, code_lookup_3.description AS Phone_type_Description, '(' + LEFT( CTX_CONTACTS_NUMBERS.phone,3 ) + ')' + substring( CTX_CONTACTS_NUMBERS.phone, 4, 3) + '-' + RIGHT( CTX_CONTACTS_NUMBERS.phone, 4 ) AS phone, CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email, CTX_CONTRACT_CONTACTS.notes FROM ((((((((CTX_BASIC_INFO INNER JOIN CTX_CONTRACT_CONTACTS ON CTX_BASIC_INFO.ctx_id = CTX_CONTRACT_CONTACTS.ctx_id) LEFT OUTER JOIN CTX_CONTACTS ON CTX_CONTRACT_CONTACTS.contact_id = CTX_CONTACTS.contact_id) LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_2 ON CTX_CONTACTS.state = code_lookup_2.lookup_code) LEFT OUTER JOIN CTX_CONTACTS_NUMBERS ON CTX_CONTACTS.contact_id = CTX_CONTACTS_NUMBERS.contact_id) LEFT OUTER JOIN code_lookup AS code_lookup_3 ON CTX_CONTACTS_NUMBERS.via = code_lookup_3.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code) INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id GROUP BY CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code, code_lookup.description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, CTX_CONTACTS.contact_title, code_lookup_1.code, code_lookup_1.description, CTX_CONTACTS.street_1, CTX_CONTACTS.street_2, CTX_CONTACTS.street_3, CTX_CONTACTS.city, CTX_CONTACTS.zip, code_lookup_2.code, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code, code_lookup_3.description, code_lookup_4.description, CTX_CONTACTS_NUMBERS.phone, CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email, CTX_CONTRACT_CONTACTS.notes, CTX_CONTRACT_CONTACTS.ic_area HAVING (((CTX_CONTRACT_CONTACTS.ic_area)='c')) ORDER BY CTX_BASIC_INFO.ctx_id "
*/

//is_sql_statements[upperbound(is_sql_statements) + 1] = &
//"CREATE VIEW  v_ctx_contacts_contacts " + &
//"as SELECT  top 100 percent  CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code aS contract_type_code, code_lookup.description AS contract_type_description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, code_lookup_4.description as contact_title, code_lookup_1.code AS contract_department_code, code_lookup_1.description AS contract_department_description, app_facility.street, app_facility.street_2, app_facility.street_3, app_facility.city, app_facility.zip, app_facility.state AS state, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code AS Phone_Type_code, code_lookup_3.description AS Phone_type_Description, CTX_CONTACTS_NUMBERS.phone AS phone, CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email, CTX_CONTRACT_CONTACTS.notes FROM (((((((CTX_BASIC_INFO INNER JOIN CTX_CONTRACT_CONTACTS ON CTX_BASIC_INFO.ctx_id = CTX_CONTRACT_CONTACTS.ctx_id and CTX_CONTRACT_CONTACTS.ic_area = 'c') LEFT OUTER JOIN CTX_CONTACTS ON CTX_CONTRACT_CONTACTS.contact_id = CTX_CONTACTS.contact_id) LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code)  LEFT OUTER JOIN CTX_CONTACTS_NUMBERS ON CTX_CONTACTS.contact_id = CTX_CONTACTS_NUMBERS.contact_id) LEFT OUTER JOIN code_lookup AS code_lookup_3 ON CTX_CONTACTS_NUMBERS.via = code_lookup_3.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code) INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id  ORDER BY CTX_BASIC_INFO.ctx_id "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"CREATE VIEW  v_ctx_contacts_contacts " + &
"as SELECT     CTX_BASIC_INFO.ctx_id, app_facility.facility_name, V_ctx_contract_contacts.contact_id,   " + &
"                      V_ctx_contract_contacts.association, code_lookup.code AS contract_type_code, code_lookup.description AS contract_type_description,   " + &
"                      CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, code_lookup_4.description AS contact_title,   " + &
"                      code_lookup_1.code AS contract_department_code, code_lookup_1.description AS contract_department_des, app_facility.street,   " + &
"                      app_facility.street_2, app_facility.street_3, app_facility.city, app_facility.zip, app_facility.state, CTX_CONTACTS.custom_1,   " + &
"                      CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5,   " + &
"                      CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9,   " + &
"                      CTX_CONTACTS.custom_10, V_ctx_contract_contacts.owner, V_ctx_contract_contacts.access, NULL AS Phone_Type_code, NULL   " + &
"                      AS Phone_type_Description, V_ctx_contract_contacts.contact_phone AS phone, V_ctx_contract_contacts.ext,   " + &
"                      V_ctx_contract_contacts.contact_email, V_ctx_contract_contacts.contact_Fax, V_ctx_contract_contacts.notes  " + &
"FROM         CTX_CONTACTS   " + &
"INNER JOIN V_ctx_contract_contacts ON CTX_CONTACTS.contact_id = V_ctx_contract_contacts.contact_id   " + &
"INNER JOIN CTX_BASIC_INFO ON V_ctx_contract_contacts.ctx_id = CTX_BASIC_INFO.ctx_id  " + &
"INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id   " + &
"LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code   " + &
"LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code   " + &
"LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code  " + &
"where V_ctx_contract_contacts.ic_area='c'  " 


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_contacts_external' and type = 'V')  " + &
"  drop view v_ctx_contacts_external "

/*
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"CREATE VIEW  v_ctx_contacts_external " + &
"as SELECT  top 100 percent  CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code aS contract_type_code, code_lookup.description AS contract_type_description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, code_lookup_4.description as contact_title, code_lookup_1.code AS contract_department_code, code_lookup_1.description AS contract_department_description, CTX_CONTACTS.street_1, CTX_CONTACTS.street_2, CTX_CONTACTS.street_3, CTX_CONTACTS.city, CTX_CONTACTS.zip, code_lookup_2.code AS state, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code AS Phone_Type_code, code_lookup_3.description AS Phone_type_Description, '(' + LEFT( CTX_CONTACTS_NUMBERS.phone,3 ) + ')' + substring( CTX_CONTACTS_NUMBERS.phone, 4, 3) + '-' + RIGHT( CTX_CONTACTS_NUMBERS.phone, 4 ) AS phone , CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email FROM ((((((((CTX_BASIC_INFO INNER JOIN CTX_CONTRACT_CONTACTS ON CTX_BASIC_INFO.ctx_id = CTX_CONTRACT_CONTACTS.ctx_id) LEFT OUTER JOIN CTX_CONTACTS ON CTX_CONTRACT_CONTACTS.contact_id = CTX_CONTACTS.contact_id) LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_2 ON CTX_CONTACTS.state = code_lookup_2.lookup_code) LEFT OUTER JOIN CTX_CONTACTS_NUMBERS ON CTX_CONTACTS.contact_id = CTX_CONTACTS_NUMBERS.contact_id) LEFT OUTER JOIN code_lookup AS code_lookup_3 ON CTX_CONTACTS_NUMBERS.via = code_lookup_3.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code) INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id GROUP BY CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code, code_lookup.description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, CTX_CONTACTS.contact_title, code_lookup_1.code, code_lookup_1.description, CTX_CONTACTS.street_1, CTX_CONTACTS.street_2, CTX_CONTACTS.street_3, CTX_CONTACTS.city, CTX_CONTACTS.zip, code_lookup_2.code, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code, code_lookup_3.description, code_lookup_4.description, CTX_CONTACTS_NUMBERS.phone, CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email, CTX_CONTRACT_CONTACTS.ic_area HAVING (((CTX_CONTRACT_CONTACTS.ic_area)='e')) ORDER BY CTX_BASIC_INFO.ctx_id "
*/

//is_sql_statements[upperbound(is_sql_statements) + 1] = &
//"CREATE VIEW  v_ctx_contacts_external " + &
//"as SELECT  top 100 percent  CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code aS contract_type_code, code_lookup.description AS contract_type_description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, code_lookup_4.description as contact_title, code_lookup_1.code AS contract_department_code, code_lookup_1.description AS contract_department_description, app_facility.street, app_facility.street_2, app_facility.street_3, app_facility.city, app_facility.zip, app_facility.state AS state, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code AS Phone_Type_code, code_lookup_3.description AS Phone_type_Description, CTX_CONTACTS_NUMBERS.phone AS phone , CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email FROM (((((((CTX_BASIC_INFO INNER JOIN CTX_CONTRACT_CONTACTS ON CTX_BASIC_INFO.ctx_id = CTX_CONTRACT_CONTACTS.ctx_id and CTX_CONTRACT_CONTACTS.ic_area='e') LEFT OUTER JOIN CTX_CONTACTS ON CTX_CONTRACT_CONTACTS.contact_id = CTX_CONTACTS.contact_id) LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code) LEFT OUTER JOIN CTX_CONTACTS_NUMBERS ON CTX_CONTACTS.contact_id = CTX_CONTACTS_NUMBERS.contact_id) LEFT OUTER JOIN code_lookup AS code_lookup_3 ON CTX_CONTACTS_NUMBERS.via = code_lookup_3.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code) INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id  ORDER BY CTX_BASIC_INFO.ctx_id "


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"CREATE VIEW  v_ctx_contacts_external " + &
"as SELECT       CTX_BASIC_INFO.ctx_id, app_facility.facility_name, code_lookup.code AS contract_type_code,   " + &
"                      code_lookup.description AS contract_type_description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name,   " + &
"                      CTX_CONTACTS.middle_name, code_lookup_4.description AS contact_title, code_lookup_1.code AS contract_department_code,   " + &
"                      code_lookup_1.description AS contract_department_des, app_facility.street, app_facility.street_2, app_facility.street_3,   " + &
"                      app_facility.city, app_facility.zip, app_facility.state, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2,   " + &
"                      CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6,   " + &
"                      CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10,   " + &
"                      V_ctx_contract_contacts.access, V_ctx_contract_contacts.owner, V_ctx_contract_contacts.notes, V_ctx_contract_contacts.association,   " + &
"                      V_ctx_contract_contacts.ext, V_ctx_contract_contacts.contact_Fax, V_ctx_contract_contacts.contact_email,   " + &
"                      V_ctx_contract_contacts.contact_phone AS phone, NULL AS Phone_Type_code, NULL AS Phone_type_Description,   " + &
"                      V_ctx_contract_contacts.contact_id  " + &
"FROM         CTX_CONTACTS   " + &
"INNER JOIN V_ctx_contract_contacts ON CTX_CONTACTS.contact_id = V_ctx_contract_contacts.contact_id   " + &
"INNER JOIN CTX_BASIC_INFO ON V_ctx_contract_contacts.ctx_id = CTX_BASIC_INFO.ctx_id  " + &
"INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id   " + &
"LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code   " + &
"LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code   " + &
"LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code  " + &
"where V_ctx_contract_contacts.ic_area='e'  " 


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_contacts_internal' and type = 'V')  " + &
"  drop view v_ctx_contacts_internal "

/*
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"CREATE VIEW  v_ctx_contacts_internal " + &
"as SELECT  top 100 percent  CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code aS contract_type_code, code_lookup.description AS contract_type_description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, code_lookup_4.description as contact_title, code_lookup_1.code AS contract_department_code, code_lookup_1.description AS contract_department_description, CTX_CONTACTS.street_1, CTX_CONTACTS.street_2, CTX_CONTACTS.street_3, CTX_CONTACTS.city, CTX_CONTACTS.zip, code_lookup_2.code AS state, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code AS Phone_Type_code, code_lookup_3.description AS Phone_type_Description, '(' + LEFT( CTX_CONTACTS_NUMBERS.phone,3 ) + ')' + substring( CTX_CONTACTS_NUMBERS.phone, 4, 3) + '-' + RIGHT( CTX_CONTACTS_NUMBERS.phone, 4 ) AS phone , CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email FROM ((((((((CTX_BASIC_INFO INNER JOIN CTX_CONTRACT_CONTACTS ON CTX_BASIC_INFO.ctx_id = CTX_CONTRACT_CONTACTS.ctx_id) LEFT OUTER JOIN CTX_CONTACTS ON CTX_CONTRACT_CONTACTS.contact_id = CTX_CONTACTS.contact_id) LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_2 ON CTX_CONTACTS.state = code_lookup_2.lookup_code) LEFT OUTER JOIN CTX_CONTACTS_NUMBERS ON CTX_CONTACTS.contact_id = CTX_CONTACTS_NUMBERS.contact_id) LEFT OUTER JOIN code_lookup AS code_lookup_3 ON CTX_CONTACTS_NUMBERS.via = code_lookup_3.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code) INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id GROUP BY CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code, code_lookup.description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, CTX_CONTACTS.contact_title, code_lookup_1.code, code_lookup_1.description, CTX_CONTACTS.street_1, CTX_CONTACTS.street_2, CTX_CONTACTS.street_3, CTX_CONTACTS.city, CTX_CONTACTS.zip, code_lookup_2.code, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code, code_lookup_3.description, code_lookup_4.description, CTX_CONTACTS_NUMBERS.phone, CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email, CTX_CONTRACT_CONTACTS.ic_area HAVING (((CTX_CONTRACT_CONTACTS.ic_area)='i')) ORDER BY CTX_BASIC_INFO.ctx_id "
*/

//is_sql_statements[upperbound(is_sql_statements) + 1] = &
//"CREATE VIEW  v_ctx_contacts_internal " + &
//"as SELECT  top 100 percent  CTX_BASIC_INFO.ctx_id, app_facility.facility_name, CTX_CONTRACT_CONTACTS.contact_id, CTX_CONTRACT_CONTACTS.association, code_lookup.code aS contract_type_code, code_lookup.description AS contract_type_description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name, CTX_CONTACTS.middle_name, code_lookup_4.description as contact_title, code_lookup_1.code AS contract_department_code, code_lookup_1.description AS contract_department_description, app_facility.street, app_facility.street_2, app_facility.street_3, app_facility.city, app_facility.zip, app_facility.state AS state, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2, CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6, CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10, CTX_CONTRACT_CONTACTS.owner, CTX_CONTRACT_CONTACTS.access, code_lookup_3.code AS Phone_Type_code, code_lookup_3.description AS Phone_type_Description, CTX_CONTACTS_NUMBERS.phone AS phone , CTX_CONTACTS_NUMBERS.ext, CTX_CONTACTS_NUMBERS.contact_email FROM (((((((CTX_BASIC_INFO INNER JOIN CTX_CONTRACT_CONTACTS ON CTX_BASIC_INFO.ctx_id = CTX_CONTRACT_CONTACTS.ctx_id and CTX_CONTRACT_CONTACTS.ic_area='i') LEFT OUTER JOIN CTX_CONTACTS ON CTX_CONTRACT_CONTACTS.contact_id = CTX_CONTACTS.contact_id) LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code) LEFT OUTER JOIN CTX_CONTACTS_NUMBERS ON CTX_CONTACTS.contact_id = CTX_CONTACTS_NUMBERS.contact_id) LEFT OUTER JOIN code_lookup AS code_lookup_3 ON CTX_CONTACTS_NUMBERS.via = code_lookup_3.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code) INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id ORDER BY CTX_BASIC_INFO.ctx_id "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"CREATE VIEW  v_ctx_contacts_internal " + &
"as SELECT      CTX_BASIC_INFO.ctx_id, app_facility.facility_name, code_lookup.code AS contract_type_code,  " + &
"                      code_lookup.description AS contract_type_description, CTX_CONTACTS.first_name, CTX_CONTACTS.last_name,  " + &
"                      CTX_CONTACTS.middle_name, code_lookup_4.description AS contact_title, code_lookup_1.code AS contract_department_code,  " + &
"                      code_lookup_1.description AS contract_department_des, app_facility.street, app_facility.street_2, app_facility.street_3,  " + &
"                      app_facility.city, app_facility.zip, app_facility.state, CTX_CONTACTS.custom_1, CTX_CONTACTS.custom_2,  " + &
"                      CTX_CONTACTS.custom_3, CTX_CONTACTS.custom_4, CTX_CONTACTS.custom_5, CTX_CONTACTS.custom_6,  " + &
"                      CTX_CONTACTS.custom_7, CTX_CONTACTS.custom_8, CTX_CONTACTS.custom_9, CTX_CONTACTS.custom_10,  " + &
"                      V_ctx_contract_contacts.access, V_ctx_contract_contacts.owner, V_ctx_contract_contacts.notes, V_ctx_contract_contacts.association,  " + &
"                      V_ctx_contract_contacts.ext, V_ctx_contract_contacts.contact_Fax, V_ctx_contract_contacts.contact_email,  " + &
"                      V_ctx_contract_contacts.contact_phone AS phone, NULL AS Phone_Type_code, NULL AS Phone_type_Description,  " + &
"                      V_ctx_contract_contacts.contact_id " + &
"FROM         CTX_CONTACTS   " + &
"INNER JOIN V_ctx_contract_contacts ON CTX_CONTACTS.contact_id = V_ctx_contract_contacts.contact_id   " + &
"INNER JOIN CTX_BASIC_INFO ON V_ctx_contract_contacts.ctx_id = CTX_BASIC_INFO.ctx_id  " + &
"INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id   " + &
"LEFT OUTER JOIN code_lookup ON CTX_CONTACTS.contact_type = code_lookup.lookup_code   " + &
"LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_CONTACTS.contact_department = code_lookup_1.lookup_code   " + &
"LEFT OUTER JOIN code_lookup AS code_lookup_4 ON CTX_CONTACTS.contact_title = code_lookup_4.lookup_code  " + &
"where V_ctx_contract_contacts.ic_area='i'  " 


//$<Modify> 2008-04-25 By: Nova end

//---------------------------- APPEON END ----------------------------

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_custom' and type = 'V')  " + &
	"  drop view v_ctx_custom "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_custom " + &
	"AS SELECT    ctx_id, custom_1, custom_2, custom_3, custom_4, custom_5, custom_6,        custom_7, custom_8, custom_9, custom_10, custom_11, custom_12, custom_13,        custom_14, custom_15, custom_16, custom_17, custom_18, custom_19, custom_20,        custom_date1, custom_date2, custom_date3, custom_date4, custom_date5,        custom_date6, custom_date7, custom_date8, custom_date9, custom_date10,        custom_date11, custom_date12, custom_date13, custom_date14, custom_date15,        custom_n1, custom_n2, custom_n3, custom_n4, custom_n5, custom_n6, custom_n7,        custom_n8, custom_n9, custom_n10 FROM CTX_BASIC_INFO  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_fee_schedule' and type = 'V')  " + &
	"  drop view v_ctx_fee_schedule "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_fee_schedule " + &
	"as select     " + &
	"	code_lookup.description as carve_out_type,  " + &
	"	code_lookup_1.description as sched_type,  " + &
	"	ctx_fee_sched_hdr.fee_sched_id,  " + &
	"	ctx_fee_sched_hdr.ctx_id,  " + &
	"	ctx_fee_sched_hdr.custom_1,  " + &
	"	ctx_fee_sched_hdr.custom_2,  " + &
	"	ctx_fee_sched_hdr.custom_3,  " + &
	"	ctx_fee_sched_hdr.custom_4,  " + &
	"	ctx_fee_sched_hdr.custom_5,  " + &
	"	ctx_fee_sched_hdr.notes, " + &
	"	ctx_fee_sched_hdr.inserted_by_user, " + &
	"	ctx_fee_sched_hdr.inserted_at_date_time, " + &
	"	ctx_fee_sched_hdr.updated_by_user, " + &
	"	ctx_fee_sched_hdr.updated_at_date_time,  " + &
	"	ctx_fee_sched_hdr.record_id " + &
	"from(ctx_fee_sched_hdr  " + &
	"left outer join code_lookup on ctx_fee_sched_hdr.carve_out_type = code_lookup.lookup_code)  " + &
	"left outer join code_lookup as code_lookup_1 on ctx_fee_sched_hdr.sched_type = code_lookup_1.lookup_code  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_fee_schedule_nm' and type = 'V')  " + &
	"  drop view v_ctx_fee_schedule_nm "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_fee_schedule_nm " + &
	"as " + &
	"SELECT     " + &
	"	ctx_fee_sched_nm.ctx_id,  " + &
	"	ctx_fee_sched_nm.fee_sched_nm_id,  " + &
	"	code_lookup.code AS category_code,  " + &
	"	code_lookup.description AS category_description, " + &
	" 	code_lookup_1.code AS system_item_code,  " + &
	"	code_lookup_1.description AS system_item_Description, " + &
	" 	ctx_fee_sched_nm.description,  " + &
	"	ctx_fee_sched_nm.fee, " + &
	"	code_lookup_2.code AS item_status_code,  " + &
	"	ctx_fee_sched_nm.start_date, " + &
	" 	ctx_fee_sched_nm.end_date,  " + &
	"	ctx_fee_sched_nm.service_name,  " + &
	"	ctx_fee_sched_nm.custom_int1, " + &
	" 	ctx_fee_sched_nm.custom_int2,  " + &
	"	ctx_fee_sched_nm.custom_fee1,  " + &
	"	ctx_fee_sched_nm.custom_fee2, " + &
	" 	ctx_fee_sched_nm.custom_fee3,  " + &
	"	ctx_fee_sched_nm.custom_text1,  " + &
	"	ctx_fee_sched_nm.custom_text2, " + &
	" 	ctx_fee_sched_nm.custom_text3,  " + &
	"	ctx_fee_sched_nm.notes,  " + &
	"	ctx_fee_sched_nm.record_id, " + &
	"	ctx_fee_sched_nm.custom_text4, " + &
	"	ctx_fee_sched_nm.custom_text5, " + &
	"	ctx_fee_sched_nm.custom_text6, " + &
	"	ctx_fee_sched_nm.custom_text7, " + &
	"	ctx_fee_sched_nm.custom_text8, " + &
	"	ctx_fee_sched_nm.custom_n1, " + &
	"	ctx_fee_sched_nm.custom_n2, " + &
	"	ctx_fee_sched_nm.custom_n3, " + &
	"	ctx_fee_sched_nm.custom_n4, " + &
	"	ctx_fee_sched_nm.custom_n5, " + &
	"	code_lookup_3.code AS billing_Cycle,  " + &
	"	code_lookup_3.description AS billing_cycle_description " + &
	"FROM " + &
	"(((ctx_fee_sched_nm LEFT OUTER JOIN " + &
	"code_lookup ON ctx_fee_sched_nm.category = code_lookup.lookup_code) LEFT OUTER JOIN " + &
	"code_lookup AS code_lookup_1 ON ctx_fee_sched_nm.service_item = code_lookup_1.lookup_code) LEFT OUTER JOIN " + &
	"code_lookup AS code_lookup_2 ON ctx_fee_sched_nm.item_status = code_lookup_2.lookup_code) LEFT OUTER JOIN " + &
	"code_lookup AS code_lookup_3 ON ctx_fee_sched_nm.billing_cycle = code_lookup_3.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_feee_schedule_codes' and type = 'V')  " + &
	"  drop view v_ctx_feee_schedule_codes "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_feee_schedule_codes " + &
	"as SELECT     " + &
	"	ctx_fee_sched_hdr.ctx_id,  " + &
	"	ctx_fee_sched_data.code,  " + &
	"	code_lookup.description AS carve_out_type_description,  " + &
	"	code_lookup_1.description AS sched_type_description,  " + &
	"	code_lookup_2.description AS location_description,  " + &
	"	code_lookup_2.code AS location_code,  " + &
	"	code_lookup_3.description AS status,  " + &
	"	ctx_fee_sched_data.fee,  " + &
	"	ctx_fee_sched_data.effective_date,  " + &
	"	ctx_fee_sched_data.expiration_date,  " + &
	"	ctx_fee_sched_data.office_fee,  " + &
	"	ctx_fee_sched_data.facility_fee,  " + &
	"	ctx_fee_sched_data.custom_fee,  " + &
	"	ctx_fee_sched_data.precert,  " + &
	"	ctx_fee_sched_data.preauth,  " + &
	"	ctx_fee_sched_data.base_price,  " + &
	"	ctx_fee_sched_data.phys_fee,  " + &
	"	ctx_fee_sched_data.custom_1,  " + &
	"	ctx_fee_sched_data.custom_2,  " + &
	"	ctx_fee_sched_data.custom_3,  " + &
	"	ctx_fee_sched_data.custom_4,  " + &
	"	ctx_fee_sched_data.custom_5,  " + &
	"	ctx_fee_sched_data.fee_basis,  " + &
	"	ctx_fee_sched_data.inserted_by_user,  " + &
	"	ctx_fee_sched_data.inserted_at_date_time,  " + &
	"	ctx_fee_sched_data.updated_by_user,  " + &
	"	ctx_fee_sched_data.updated_at_date_time  " + &
	"FROM (ctx_fee_sched_data  " + &
	"INNER JOIN ((((ctx_fee_sched_hdr  " + &
	"LEFT OUTER JOIN code_lookup ON ctx_fee_sched_hdr.carve_out_type = code_lookup.lookup_code)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_1 ON ctx_fee_sched_hdr.sched_type = code_lookup_1.lookup_code)  " + &
	"INNER JOIN ctx_fee_sched_locations ON ctx_fee_sched_hdr.fee_sched_id = ctx_fee_sched_locations.fee_sched_id)  " + &
	"INNER JOIN code_lookup AS code_lookup_2 ON ctx_fee_sched_locations.location = code_lookup_2.lookup_code) ON ctx_fee_sched_data.fee_sched_location_id = ctx_fee_sched_locations.fee_sched_location_id)  " + &
	"INNER JOIN code_lookup AS code_lookup_3 ON ctx_fee_sched_data.status = code_lookup_3.lookup_code  " + &
	"GROUP BY ctx_fee_sched_hdr.ctx_id,  " + &
	"	ctx_fee_sched_data.code,  " + &
	"	code_lookup.description,  " + &
	"	code_lookup_1.description, code_lookup_2.description,  " + &
	"	code_lookup_2.code,  " + &
	"	code_lookup_3.description,  " + &
	"	ctx_fee_sched_data.fee,  " + &
	"	ctx_fee_sched_data.effective_date,  " + &
	"	ctx_fee_sched_data.expiration_date,  " + &
	"	ctx_fee_sched_data.office_fee,  " + &
	"	ctx_fee_sched_data.facility_fee,  " + &
	"	ctx_fee_sched_data.custom_fee,  " + &
	"	ctx_fee_sched_data.precert,  " + &
	"	ctx_fee_sched_data.preauth,  " + &
	"	ctx_fee_sched_data.base_price,  " + &
	"	ctx_fee_sched_data.phys_fee,  " + &
	"	ctx_fee_sched_data.custom_1,  " + &
	"	ctx_fee_sched_data.custom_2,  " + &
	"	ctx_fee_sched_data.custom_3,  " + &
	"	ctx_fee_sched_data.custom_4,  " + &
	"	ctx_fee_sched_data.custom_5,  " + &
	"	ctx_fee_sched_data.fee_basis,  " + &
	"	ctx_fee_sched_data.inserted_by_user,  " + &
	"	ctx_fee_sched_data.inserted_at_date_time,  " + &
	"	ctx_fee_sched_data.updated_by_user,  " + &
	"	ctx_fee_sched_data.updated_at_date_time  " + &
	"HAVING (((ctx_fee_sched_data.fee)<>0))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_feee_schedule_locations' and type = 'V')  " + &
	"  drop view v_ctx_feee_schedule_locations "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_feee_schedule_locations " + &
	"as SELECT     " + &
	"	ctx_fee_sched_hdr.fee_sched_id, " + &
	"	ctx_fee_sched_hdr.ctx_id,  " + &
	"	code_lookup.description AS carve_out_type,  " + &
	"	code_lookup_1.description AS sched_type,  " + &
	"	code_lookup_2.description AS location_description,  " + &
	"	code_lookup_2.code AS location_code,  " + &
	"	ctx_fee_sched_hdr.custom_1, " + &
	"	ctx_fee_sched_hdr.custom_2, " + &
	"	ctx_fee_sched_hdr.custom_3, " + &
	"	ctx_fee_sched_hdr.custom_4, " + &
	"	ctx_fee_sched_hdr.custom_5, " + &
	"	ctx_fee_sched_hdr.notes, " + &
	"	ctx_fee_sched_hdr.inserted_by_user, " + &
	"	ctx_fee_sched_hdr.inserted_at_date_time, " + &
	"	ctx_fee_sched_hdr.updated_by_user, " + &
	"	ctx_fee_sched_hdr.updated_at_date_time, " + &
	"	ctx_fee_sched_hdr.record_id, " + &
	"	ctx_fee_sched_locations.rate,  " + &
	"	ctx_fee_sched_locations.fee_bonus,  " + &
	"	ctx_item.item_name AS fee_basis  " + &
	"FROM ((((ctx_fee_sched_hdr  " + &
	"LEFT OUTER JOIN code_lookup ON ctx_fee_sched_hdr.carve_out_type = code_lookup.lookup_code)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_1 ON ctx_fee_sched_hdr.sched_type = code_lookup_1.lookup_code)  " + &
	"INNER JOIN ctx_fee_sched_locations ON ctx_fee_sched_hdr.fee_sched_id = ctx_fee_sched_locations.fee_sched_id)  " + &
	"INNER JOIN code_lookup AS code_lookup_2 ON ctx_fee_sched_locations.location = code_lookup_2.lookup_code)  " + &
	"LEFT OUTER JOIN ctx_item ON ctx_fee_sched_locations.fee_bonus = ctx_item.item_id  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_feee_schedule_practitioners' and type = 'V')  " + &
	"  drop view v_ctx_feee_schedule_practitioners "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_feee_schedule_practitioners " + &
	"as SELECT     " + &
	"	ctx_fee_sched_hdr.ctx_id,  " + &
	"	code_lookup.description AS carve_out_type,  " + &
	"	code_lookup_1.description AS sched_type,  " + &
	"	pd_basic.last_name,  " + &
	"	pd_basic.first_name,  " + &
	"	pd_basic.prac_id  " + &
	"FROM (((ctx_fee_sched_hdr  " + &
	"LEFT OUTER JOIN code_lookup ON ctx_fee_sched_hdr.carve_out_type = code_lookup.lookup_code)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_1 ON ctx_fee_sched_hdr.sched_type = code_lookup_1.lookup_code)  " + &
	"INNER JOIN ctx_fee_sched_pracs ON ctx_fee_sched_hdr.fee_sched_id = ctx_fee_sched_pracs.fee_sched_id)  " + &
	"INNER JOIN pd_basic ON ctx_fee_sched_pracs.practitioner_id = pd_basic.prac_id  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_groups' and type = 'V')  " + &
	"  drop view v_ctx_groups "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_groups " + &
	"as select     " + &
	"	ctx_loc.ctx_id,  " + &
	"	ctx_loc.parent_comp_id,  " + &
	"	app_facility.facility_name,  " + &
	"	group_multi_loc.rec_id,  " + &
	"	group_multi_loc.gp_name,  " + &
	"	group_multi_loc.street1,  " + &
	"	group_multi_loc.city,  " + &
	"	group_multi_loc.state,  " + &
	"	group_multi_loc.phone,  " + &
	"	group_multi_loc.zip,  " + &
	"	group_multi_loc.contact_name " + &
	"from((group_multi_loc join ctx_loc on group_multi_loc.rec_id = ctx_loc.parent_comp_id)  " + &
	"join CTX_BASIC_INFO on ctx_loc.ctx_id = CTX_BASIC_INFO.ctx_id)  " + &
	"join app_facility on CTX_BASIC_INFO.app_facility = app_facility.facility_id  " + &
	"group by ctx_loc.ctx_id, " + &
	"	ctx_loc.parent_comp_id, " + &
	"	app_facility.facility_name, " + &
	"	group_multi_loc.rec_id, " + &
	"	group_multi_loc.gp_name, " + &
	"	group_multi_loc.street1, " + &
	"	group_multi_loc.city, " + &
	"	group_multi_loc.state, " + &
	"	group_multi_loc.phone, " + &
	"	group_multi_loc.zip, " + &
	"	group_multi_loc.contact_name  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_groups_locations' and type = 'V')  " + &
	"  drop view v_ctx_groups_locations "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_groups_locations " + &
	"as SELECT     " + &
	"	ctx_loc.ctx_id,  " + &
	"	app_facility.facility_name,  " + &
	"	group_multi_loc.gp_name,  " + &
	"	ctx_loc.parent_comp_id AS grp_id,  " + &
	"	ctx_loc.loc_id,  " + &
	"	group_practice.practice_type,  " + &
	"	group_practice.active_status,  " + &
	"	group_practice.street AS location_name,  " + &
	"	group_practice.street_2,  " + &
	"	group_practice.city,  " + &
	"	code_lookup_1.code AS state,  " + &
	"	code_lookup.description AS country,  " + &
	"	group_practice.pager_number,  " + &
	"	group_practice.phone,  " + &
	"	group_practice.ext,  " + &
	"	group_practice.fax,  " + &
	"	group_practice.zip,  " + &
	"	group_practice.contact_person,  " + &
	"	group_practice.e_mail_address,  " + &
	"	group_practice.web_address  " + &
	"FROM (((((group_multi_loc  " + &
	"INNER JOIN ctx_loc ON group_multi_loc.rec_id = ctx_loc.parent_comp_id)  " + &
	"INNER JOIN ctx_basic_info ON ctx_loc.ctx_id = ctx_basic_info.ctx_id)  " + &
	"INNER JOIN app_facility ON ctx_basic_info.app_facility = app_facility.facility_id)  " + &
	"INNER JOIN group_practice ON ctx_loc.loc_id = group_practice.rec_id)  " + &
	"LEFT OUTER JOIN code_lookup ON group_practice.country = code_lookup.lookup_code)  " + &
	"LEFT OUTER JOIN code_lookup AS code_lookup_1 ON group_practice.state = code_lookup_1.lookup_code  " + &
	"GROUP BY ctx_loc.ctx_id,  " + &
	"	app_facility.facility_name,  " + &
	"	group_multi_loc.gp_name,  " + &
	"	ctx_loc.parent_comp_id,  " + &
	"	ctx_loc.loc_id,  " + &
	"	group_practice.practice_type,  " + &
	"	group_practice.active_status,  " + &
	"	group_practice.street,  " + &
	"	group_practice.street_2,  " + &
	"	group_practice.city,  " + &
	"	code_lookup_1.code,  " + &
	"	code_lookup.description,  " + &
	"	group_practice.pager_number,  " + &
	"	group_practice.phone,  " + &
	"	group_practice.ext,  " + &
	"	group_practice.fax,  " + &
	"	group_practice.zip,  " + &
	"	group_practice.contact_person,  " + &
	"	group_practice.e_mail_address,  " + &
	"	group_practice.web_address  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_image' and type = 'V')  " + &
	"  drop view v_ctx_image "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_image " + &
	"AS SELECT     " + &
	"	ctx_images.ctx_id,  " + &
	"	ctx_images.file_name,  " + &
	"	code_lookup.description AS Image_Type,  " + &
	"	code_lookup_1.description AS media_type,  " + &
	"	ctx_images.page_description,  " + &
	"	ctx_image.image_version,  " + &
	"	ctx_image.inserted_by_user,  " + &
	"	ctx_image.updated_by_user,  " + &
	"	ctx_image.inserted_at_date_time,  " + &
	"	ctx_image.updated_at_date_time " + &
	"FROM ctx_image  " + &
	"INNER JOIN ctx_images ON ctx_image.ctx_id = ctx_images.ctx_id AND ctx_image.image_id = ctx_images.image_id  " + &
	"LEFT OUTER JOIN code_lookup ON ctx_images.image_type = code_lookup.lookup_code  " + &
	"LEFT OUTER JOIN code_lookup code_lookup_1 ON ctx_images.media_type = code_lookup_1.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_locations_pracs' and type = 'V')  " + &
	"  drop view v_ctx_locations_pracs "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_locations_pracs " + &
	"as SELECT    CTX_LOC.ctx_id, CTX_LOC.parent_comp_id AS grp_id, group_practice.street AS locatioin_name, CTX_LOC.loc_id, pd_basic.last_name, pd_basic.first_name, pd_basic.prac_id FROM ((CTX_LOC INNER JOIN CTX_LOCATION_PRACS ON (CTX_LOC.ctx_id = CTX_LOCATION_PRACS.ctx_id) AND (CTX_LOC.parent_comp_id = CTX_LOCATION_PRACS.parent_comp_id) AND (CTX_LOC.loc_id = CTX_LOCATION_PRACS.loc_id)) INNER JOIN pd_basic ON CTX_LOCATION_PRACS.prac_id = pd_basic.prac_id) INNER JOIN group_practice ON CTX_LOCATION_PRACS.loc_id = group_practice.rec_id GROUP BY CTX_LOC.ctx_id, CTX_LOC.parent_comp_id, group_practice.street, CTX_LOC.loc_id, pd_basic.last_name, pd_basic.first_name, pd_basic.prac_id HAVING (((CTX_LOC.loc_id)<>0))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_locations_speciality' and type = 'V')  " + &
	"  drop view v_ctx_locations_speciality "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_locations_speciality " + &
	"as SELECT    CTX_LOC.ctx_id, CTX_LOC.parent_comp_id AS grp_id, group_practice.street AS location_name, CTX_LOC.loc_id, code_lookup.description AS specialty_description, code_lookup.code AS speciality_code FROM ((CTX_LOC INNER JOIN CTX_LOCATION_SPECIALTY ON (CTX_LOC.loc_id = CTX_LOCATION_SPECIALTY.loc_id) AND (CTX_LOC.parent_comp_id = CTX_LOCATION_SPECIALTY.parent_comp_id) AND (CTX_LOC.ctx_id = CTX_LOCATION_SPECIALTY.ctx_id)) INNER JOIN code_lookup ON CTX_LOCATION_SPECIALTY.Prac_specialty = code_lookup.lookup_code) INNER JOIN group_practice ON CTX_LOCATION_SPECIALTY.loc_id = group_practice.rec_id GROUP BY CTX_LOC.ctx_id, CTX_LOC.parent_comp_id, group_practice.street, CTX_LOC.loc_id, code_lookup.description, code_lookup.code HAVING (((CTX_LOC.loc_id)<>0))  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_organizations' and type = 'V')  " + &
	"  drop view v_ctx_organizations "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_organizations " + &
	"as SELECT    CTX_ORGS_CONTACT.ctx_id, CTX_ORGS.org_name, code_lookup.code AS org_type_code, code_lookup.description AS org_type_description, CTX_ORGS.status, CTX_ORGS.street_1, CTX_ORGS.street_2, CTX_ORGS.street_3, CTX_ORGS.city, code_lookup_1.code AS state, CTX_ORGS.zip, CTX_ORGS_CONTACT.notes, CTX_ORGS.drections, CTX_ORGS.record_id, CTX_ORG_CONTACT.contact_name, CTX_ORG_CONTACT.department, code_lookup_2.code AS phone_type_code, CTX_ORG_CONTACT.phone FROM ((((CTX_ORGS LEFT OUTER JOIN code_lookup ON CTX_ORGS.org_type = code_lookup.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_ORGS.state = code_lookup_1.lookup_code) INNER JOIN CTX_ORGS_CONTACT ON CTX_ORGS.org_id = CTX_ORGS_CONTACT.org_id) LEFT OUTER JOIN CTX_ORG_CONTACT ON CTX_ORGS.org_id = CTX_ORG_CONTACT.org_id) LEFT OUTER JOIN code_lookup AS code_lookup_2 ON CTX_ORG_CONTACT.via = code_lookup_2.lookup_code GROUP BY CTX_ORGS_CONTACT.ctx_id, CTX_ORGS.org_name, code_lookup.code, code_lookup.description, CTX_ORGS.status, CTX_ORGS.street_1, CTX_ORGS.street_2, CTX_ORGS.street_3, CTX_ORGS.city, code_lookup_1.code, CTX_ORGS.zip, CTX_ORGS_CONTACT.notes, CTX_ORGS.drections, CTX_ORGS.record_id, CTX_ORG_CONTACT.contact_name, CTX_ORG_CONTACT.department, code_lookup_2.code, CTX_ORG_CONTACT.phone  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_requirement' and type = 'V')  " + &
	"  drop view v_ctx_requirement "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_requirement " + &
	"AS SELECT    CTX_REQ_PROFILE_HDR_1.ctx_id,	 " + &
	"CTX_RQMNT_CATEGORY.category_name,	 " + &
	"CTX_REQ_PROFILE.rqmnt_name,	 " + &
	"CTX_REQ_PROFILE.rqmnt_description,	 " + &
	"CTX_REQ_TMPLT_ELEMENT.element_name,	 " + &
	"DataValue = (case ctx_req_tmplt_element.value_type when 1 then convert(varchar,CTX_ELEMENTS.date_value) when 2 then CTX_ELEMENTS.field_value when 3 then CTX_ELEMENTS.char_value when 4 then convert(varchar,CTX_ELEMENTS.integer_value) when 5 then CTX_ELEMENTS.field_value end), " + &
	"CTX_ELEMENTS.clause  " + &
	"FROM (CTX_RQMNT_CATEGORY  " + &
	"INNER JOIN ((CTX_REQ_PROFILE INNER JOIN CTX_REQ_PROFILE_HDR AS CTX_REQ_PROFILE_HDR_1 ON CTX_REQ_PROFILE.ctx_req_profile_id = CTX_REQ_PROFILE_HDR_1.ctx_req_profile_id)  " + &
	"INNER JOIN CTX_REQ_TMPLT_ELEMENT ON  CTX_REQ_PROFILE.ctx_req_profile_id = CTX_REQ_TMPLT_ELEMENT.ctx_req_profile_id)  " + &
	"ON (CTX_RQMNT_CATEGORY.ctx_req_profile_id = CTX_REQ_TMPLT_ELEMENT.ctx_req_profile_id) AND (CTX_RQMNT_CATEGORY.ctx_rqmnt_category_id = CTX_REQ_TMPLT_ELEMENT.ctx_rqmnt_category_id))  " + &
	"INNER JOIN CTX_ELEMENTS ON (CTX_ELEMENTS.ctx_req_tmplt_element_id = CTX_REQ_TMPLT_ELEMENT.ctx_req_tmplt_element_id) AND (CTX_REQ_PROFILE_HDR_1.ctx_id = CTX_ELEMENTS.CTX_REQ_PROFILE_HDR_id)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_dea' and type = 'V')  " + &
	"  drop view v_dea "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_dea " + &
	"  as select    pd_dea_state_csr.rec_id, " + &
	"    pd_dea_state_csr.prac_id, " + &
	"    pd_dea_state_csr.cat_1, " + &
	"    pd_dea_state_csr.cat_2, " + &
	"    pd_dea_state_csr.cat_3, " + &
	"    pd_dea_state_csr.cat_4, " + &
	"    pd_dea_state_csr.cat_5, " + &
	"    pd_dea_state_csr.cat_6, " + &
	"    pd_dea_state_csr.cat_7, " + &
	"    pd_dea_state_csr.cat_8, " + &
	"    pd_dea_state_csr.cat_9, " + &
	"    pd_dea_state_csr.cat_10, " + &
	"    code_lookup.code as state_code, " + &
	"    code_lookup.description as state_desc, " + &
	"    pd_dea_state_csr.prev_exp_date, " + &
	"    pd_dea_state_csr.expiration_date, " + &
	"    pd_dea_state_csr.cust_1, " + &
	"    pd_dea_state_csr.cust_2, " + &
	"    pd_dea_state_csr.cust_3, " + &
	"    pd_dea_state_csr.cust_4, " + &
	"    pd_dea_state_csr.cust_5, " + &
	"    pd_dea_state_csr.cust_6, " + &
	"    pd_dea_state_csr.cust_7, " + &
	"    pd_dea_state_csr.cust_8, " + &
	"    pd_dea_state_csr.cust_9, " + &
	"    pd_dea_state_csr.cust_10, " + &
	"    pd_dea_state_csr.cust_d1, " + &
	"    pd_dea_state_csr.cust_d2, " + &
	"    pd_dea_state_csr.license_number, " + &
	"    pd_dea_state_csr.active_status from " + &
	"    pd_dea_state_csr left outer join " + &
	"    code_lookup on " + &
	"    pd_dea_state_csr.state = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_dea_state_csr' and type = 'V')  " + &
	"  drop view v_dea_state_csr "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_dea_state_csr " + &
	"AS " + &
	"SELECT        pd_dea_state_csr.rec_id, pd_dea_state_csr.prac_id, pd_dea_state_csr.cat_1, pd_dea_state_csr.cat_2, pd_dea_state_csr.cat_3,  " + &
	"                      pd_dea_state_csr.cat_4, pd_dea_state_csr.cat_5, pd_dea_state_csr.cat_6, pd_dea_state_csr.cat_7, pd_dea_state_csr.cat_8,  " + &
	"                      pd_dea_state_csr.cat_9, pd_dea_state_csr.cat_10, code_lookup.code, code_lookup.description,  " + &
	"                      pd_dea_state_csr.prev_exp_date, pd_dea_state_csr.expiration_date, pd_dea_state_csr.cust_1, pd_dea_state_csr.cust_2,  " + &
	"                      pd_dea_state_csr.cust_3, pd_dea_state_csr.cust_4, pd_dea_state_csr.cust_5, pd_dea_state_csr.license_number,  " + &
	"                      pd_dea_state_csr.active_status, pd_dea_state_csr.cust_6, pd_dea_state_csr.cust_7, pd_dea_state_csr.cust_8,  " + &
	"                      pd_dea_state_csr.cust_9, pd_dea_state_csr.cust_10, pd_dea_state_csr.cust_d1, pd_dea_state_csr.cust_d2,  " + &
	"                      pd_dea_state_csr.issue_date, code_lookup.code AS state_code, code_lookup.description AS state_description " + &
	"FROM         pd_dea_state_csr LEFT OUTER JOIN " + &
	"                      code_lookup ON pd_dea_state_csr.state = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_dept' and type = 'V')  " + &
	"  drop view v_dept "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_dept " + &
	"  as select distinct    pd_affil_dept.rec_id, " + &
	"    pd_affil_dept.prac_id, " + &
	"    pd_affil_dept.facility_id, " + &
	"    facility.facility_name as facility_name, " + &
	"    code_lookup_a.code as dept_code, " + &
	"    code_lookup_a.description as dept_name, " + &
	"    code_lookup_b.code as section_code, " + &
	"    code_lookup_b.description as section_name, " + &
	"    code_lookup_d.code as division_code, " + &
	"    code_lookup_d.description as division_name, " + &
	"    pd_affil_dept.primary_dept, " + &
	"    pd_affil_dept.from_date, " + &
	"    pd_affil_dept.to_date, " + &
	"    pd_affil_dept.record_status, " + &
	"    pd_affil_dept.active_status  " + &
	"from pd_affil_dept left outer join code_lookup as code_lookup_b on (pd_affil_dept.section = code_lookup_b.lookup_code) left outer join code_lookup as code_lookup_c on (pd_affil_dept.memberships = code_lookup_c.lookup_code) left outer join code_lookup as code_lookup_d on (pd_affil_dept.rank = code_lookup_d.lookup_code) left outer join facility on (pd_affil_dept.facility_id = facility.facility_id) left outer join code_lookup as code_lookup_a on (pd_affil_dept.department = code_lookup_a.lookup_code) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ecfmg' and type = 'V')  " + &
	"  drop view v_ecfmg "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ecfmg " + &
	"AS " + &
	"SELECT        prac_id, date_issued, date_expires, ecfmg_number, cust_1, cust_2, cust_4, cust_3, cust_5, cust_6, cust_7, cust_8, cust_9, cust_10, cust_d1,  " + &
	"                      cust_d2 " + &
	"FROM         pd_ecfmg "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_education' and type = 'V')  " + &
	"  drop view v_education "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_education " + &
	"as select    pd_education.rec_id,pd_education.prac_id,ed_type_code=code_lookup_a.code,ed_type_description=code_lookup_a.description,degree_code=code_lookup_b.code,degree_description=code_lookup_b.description,pd_education.major,pd_education.month_from,pd_education.year_from,pd_education.month_thru,pd_education.year_thru,school_code=address_lookup.code,school_name=address_lookup.entity_name,pd_education.cust_1,pd_education.cust_2,pd_education.cust_3,pd_education.cust_4,pd_education.cust_5,pd_education.cust_7,pd_education.cust_8,pd_education.cust_9,pd_education.cust_10,pd_education.cust_d1, pd_education.cust_d2, pd_education.start_date,pd_education.end_date, pd_education.caqh_grad_type  from(((pd_education left outer join code_lookup as code_lookup_a on pd_education.education_type = code_lookup_a.lookup_code) left outer join code_lookup as code_lookup_b on pd_education.degree = code_lookup_b.lookup_code) left outer join address_lookup on pd_education.school_code = address_lookup.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_fullbasic' and type = 'V')  " + &
	"  drop view v_fullbasic "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_fullbasic " + &
	"AS " + &
	"SELECT DISTINCT    " + &
	"                      pd_basic.prac_id, pd_basic.first_name, pd_basic.last_name, pd_basic.middle_name, pd_basic.date_of_birth, pd_basic.ssn,  " + &
	"                      pd_basic.maiden_other_name, pd_basic.pob_city, pd_basic.spouse_name, pd_basic.phone, pd_basic.answering_service,  " + &
	"                      pd_basic.beeper_1, pd_basic.beeper_2, pd_basic.personal_pager, pd_basic.hospital_pager, pd_basic.car_phone_1,  " + &
	"                      pd_basic.car_phone_2, pd_basic.branch, pd_basic.rank, pd_basic.service_number, pd_basic.service_date_from,  " + &
	"                      pd_basic.service_date_to, pd_basic.cust_1, pd_basic.cust_2, pd_basic.cust_3, pd_basic.cust_5, pd_basic.cust_6,  " + &
	"                      pd_basic.cust_7, pd_basic.cust_8, pd_basic.cust_9, pd_basic.cust_10, pd_basic.full_name, pd_basic.provider_id,  " + &
	"                      pd_basic.cust_4, code_lookup_a.code AS title_a_code, code_lookup_a.description AS title_a_description,  " + &
	"                      code_lookup_b.code AS name_suffic_b_code, code_lookup_b.description AS name_suffic_b_description, code_lookup_e.code AS prac_cat_e_code,  " + &
	"                      code_lookup_e.description AS prac_Cat_e_description, code_lookup_g.code AS county_g_code, code_lookup_g.description AS county_g_description,  " + &
	"                      code_lookup_c.code AS prof_suffix_c_code, code_lookup_c.description AS prof_suffix_c_description, code_lookup_f.code AS state_f_code,  " + &
	"                      code_lookup_f.description AS state_f_description, code_lookup_i.code AS married_i_code, code_lookup_h.code AS citizens_h_code,  " + &
	"                      code_lookup_d.code AS sex_d_code, code_lookup_d.description AS sex_d_description, code_lookup_k.code AS military_k_code,  " + &
	"                      code_lookup_l.code AS reserve_l_code, code_lookup_j.code AS fed_emp_j_code, code_lookup_m.code AS npdb_m_code,  " + &
	"                      code_lookup_n.code AS prov_type_n_code, code_lookup_n.description AS prov_type_n_description, code_lookup_o.code AS oig_o_code,  " + &
	"                      pd_basic.cust_11, pd_basic.cust_12, pd_basic.cust_13, pd_basic.cust_14, pd_basic.cust_15, pd_basic.cust_d1,  " + &
	"                      pd_basic.cust_d2, pd_basic.npi_number, pd_basic.used_another_name, pd_basic.start_another_name,  " + &
	"                      pd_basic.end_another_name " + &
	"FROM         pd_basic LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_a ON pd_basic.title = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_b ON pd_basic.name_suffix = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_c ON pd_basic.prof_suffix = code_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_d ON pd_basic.sex = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_e ON pd_basic.prac_category = code_lookup_e.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_f ON pd_basic.pob_state = code_lookup_f.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_g ON pd_basic.pob_country = code_lookup_g.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_h ON pd_basic.citizenship = code_lookup_h.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_i ON pd_basic.married = code_lookup_i.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_j ON pd_basic.civilian_fed_employee = code_lookup_j.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_k ON pd_basic.active_military = code_lookup_k.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_l ON pd_basic.reservist = code_lookup_l.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_m ON pd_basic.npdb_query = code_lookup_m.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_n ON pd_basic.provider_type = code_lookup_n.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_o ON pd_basic.oig_query = code_lookup_o.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_gp_covering_partners' and type = 'V')  " + &
	"  drop view v_gp_covering_partners "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_gp_covering_partners " + &
	"AS " + &
	"SELECT        gp_partner_covering.rec_id, gp_partner_covering.gp_id, gp_partner_covering.prac_id, cl_title.code AS title_code,  " + &
	"                      cl_title.description AS title_description, gp_partner_covering.last_name, gp_partner_covering.first_name,  " + &
	"                      cl_provider_type.code AS provider_type_code, cl_provider_type.description AS provider_type_description, cl_specialty.code AS specialty_code,  " + &
	"                      cl_specialty.description AS specialty_description, cl_covering.code AS covering_code, cl_covering.description AS covering_description,  " + &
	"                      cl_partner.code AS partner_code, cl_partner.description AS partner_description, gp_partner_covering.license_no AS license_number,  " + &
	"                      cl_license_state.code AS license_state_code, cl_license_state.description AS license_state_description, gp_partner_covering.cust_1,  " + &
	"                      gp_partner_covering.cust_2, gp_partner_covering.cust_3, gp_partner_covering.cust_d4, gp_partner_covering.cust_d5,  " + &
	"                      gp_partner_covering.specialty, gp_partner_covering.provider_type, gp_partner_covering.covering, gp_partner_covering.partner,  " + &
	"                      gp_partner_covering.title_code AS Expr1, gp_partner_covering.middle_name " + &
	"FROM    gp_partner_covering left outer join  code_lookup cl_covering on (cl_covering.lookup_code = gp_partner_covering.covering ) " + &
	"left outer join  code_lookup cl_title ON cl_title.lookup_code = gp_partner_covering.title_code  " + &
	"LEFT OUTER JOIN code_lookup cl_license_state ON gp_partner_covering.license_state = cl_license_state.lookup_code " + &
	"LEFT OUTER JOIN code_lookup cl_partner ON gp_partner_covering.partner = cl_partner.lookup_code  " + &
	"LEFT OUTER JOIN code_lookup cl_provider_type ON gp_partner_covering.provider_type = cl_provider_type.lookup_code  " + &
	"left outer join code_lookup cl_specialty ON cl_specialty.lookup_code = gp_partner_covering.specialty "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_gp_insurance' and type = 'V')  " + &
	"  drop view v_gp_insurance "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_gp_insurance " + &
	"AS " + &
	"SELECT        gp_insurance.rec_id, gp_insurance.gp_id, gp_insurance.carrier_code, address_lookup.entity_name AS carrier,  " + &
	"                      gp_insurance.policy_number, gp_insurance.coverage_from, gp_insurance.coverage_to, gp_insurance.previous_expiration_date,  " + &
	"                      gp_insurance.tail_coverage, cl_tail_coverage.code AS tail_coverage_code, cl_tail_coverage.description AS tail_coverage_description,  " + &
	"                      gp_insurance.coverage_limit_from, gp_insurance.coverage_limit_to, gp_insurance.state_funded_pool,  " + &
	"                      cl_state_funded.code AS state_funded_pool_code, cl_state_funded.description AS state_funded_pool_description, gp_insurance.state_coverage,  " + &
	"                      cl_state_coverage.code AS state_coverage_code, cl_state_coverage.description AS state_coverage_description, gp_insurance.exclusions,  " + &
	"                      gp_insurance.cust_1, gp_insurance.cust_2, gp_insurance.cust_3, gp_insurance.cust_d4, gp_insurance.cust_d5,  " + &
	"                      gp_insurance.claims_made_occurrence, gp_insurance.denied_explain, gp_insurance.active_status, gp_insurance.prac_id " + &
	"FROM         gp_insurance LEFT OUTER JOIN " + &
	"                      code_lookup cl_state_coverage ON gp_insurance.state_coverage = cl_state_coverage.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_state_funded ON gp_insurance.state_funded_pool = cl_state_funded.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_tail_coverage ON gp_insurance.tail_coverage = cl_tail_coverage.lookup_code LEFT OUTER JOIN " + &
	"                      address_lookup ON gp_insurance.carrier_code = address_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_gp_languages' and type = 'V')  " + &
	"  drop view v_gp_languages "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_gp_languages " + &
	"AS " + &
	"SELECT        gp_language.rec_id, gp_language.gp_id, gp_language.prac_id, cl_language.code AS language_code,  " + &
	"                      cl_language.description AS language_description, cl_speak.code AS speak_code, cl_speak.description AS speak_description,  " + &
	"                      cl_reads.code AS reads_code, cl_reads.description AS reads_description, cl_writes.code AS writes_code, cl_writes.description AS writes_description,  " + &
	"                      cl_sign.code AS sign_code, cl_sign.description AS sign_description, gp_language.cust_1, gp_language.cust_2, gp_language.cust_3,  " + &
	"                      gp_language.cust_d4, gp_language.cust_d5, gp_language.foreign_language AS language, gp_language.speak,  " + &
	"                      gp_language.reads, gp_language.writes, gp_language.sign " + &
	"FROM code_lookup cl_sign INNER JOIN gp_language ON cl_sign.lookup_code = gp_language.sign " + &
	"INNER JOIN code_lookup cl_speak ON cl_speak.lookup_code = gp_language.speak  " + &
	"INNER JOIN code_lookup cl_language ON gp_language.foreign_language = cl_language.lookup_code  " + &
	"INNER JOIN code_lookup cl_reads ON gp_language.reads = cl_reads.lookup_code  " + &
	"INNER JOIN code_lookup cl_writes ON gp_language.writes = cl_writes.lookup_code  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_gp_other_ids' and type = 'V')  " + &
	"  drop view v_gp_other_ids "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_gp_other_ids " + &
	"AS " + &
	"SELECT        gp_other_ids.rec_id, gp_other_ids.gp_id, gp_other_ids.prac_id, code_lookup.code AS id_type_code,  " + &
	"                      code_lookup.description AS id_type_description, gp_other_ids.id_number, gp_other_ids.exp_date, gp_other_ids.cust_1,  " + &
	"                      gp_other_ids.cust_2, gp_other_ids.cust_3, gp_other_ids.cust_d4, gp_other_ids.cust_d5, gp_other_ids.id_type " + &
	"FROM         gp_other_ids INNER JOIN " + &
	"                      code_lookup ON gp_other_ids.id_type = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_gp_plans' and type = 'V')  " + &
	"  drop view v_gp_plans "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_gp_plans " + &
	"AS " + &
	"SELECT        rec_id, gp_id, plan_id, active_status, start_date, end_date, prac_id " + &
	"FROM         gp_plans "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_gp_practice_info' and type = 'V')  " + &
	"  drop view v_gp_practice_info "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_gp_practice_info " + &
	"AS " + &
	"SELECT        gp_practice_info.rec_id, gp_practice_info.gp_id, gp_practice_info.prac_id, gp_practice_info.corporate_name,  " + &
	"                      gp_practice_info.start_date, gp_practice_info.check_payable, gp_practice_info.billing_dept,  " + &
	"                      cl_after_hours_coverage.description AS after_hours_coverage, cl_after_hours_type.description AS after_hours_type,  " + &
	"                      gp_practice_info.after_hours_number, cl_pref_contact_method.description AS preferred_contact_method,  " + &
	"                      cl_primary_tax_id.description AS primary_tax_id, cl_gender_limitations.description AS gender_limitations, gp_practice_info.min_age,  " + &
	"                      gp_practice_info.max_age, gp_practice_info.other_limitations, gp_practice_info.other_handi_access,  " + &
	"                      gp_practice_info.other_disability_service, gp_practice_info.other_trans_access, gp_practice_info.cust_1, gp_practice_info.cust_2,  " + &
	"                      gp_practice_info.cust_3, gp_practice_info.cust_4, gp_practice_info.cust_5, gp_practice_info.cust_d1,  " + &
	"                      gp_practice_info.cust_d2 " + &
	"FROM    gp_practice_info LEFT OUTER JOIN code_lookup cl_after_hours_coverage ON cl_after_hours_coverage.lookup_code = gp_practice_info.after_hours_coverage " + &
	"LEFT OUTER JOIN code_lookup cl_pref_contact_method  ON cl_pref_contact_method.lookup_code = gp_practice_info.prefered_contact_method  " + &
	"LEFT OUTER JOIN code_lookup cl_gender_limitations ON gp_practice_info.gender_limitations = cl_gender_limitations.lookup_code  " + &
	"LEFT OUTER JOIN code_lookup cl_primary_tax_id ON gp_practice_info.primary_tax_id = cl_primary_tax_id.lookup_code  " + &
	"LEFT OUTER JOIN code_lookup cl_after_hours_type ON gp_practice_info.after_hours_type = cl_after_hours_type.lookup_code  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_gp_questions' and type = 'V')  " + &
	"  drop view v_gp_questions "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_gp_questions " + &
	"AS " + &
	"SELECT        gp_questions.rec_id, gp_questions.gp_id, gp_questions.question_id, cl_question_type.description AS quest_type,  " + &
	"                      question_lookup.short_quest, question_lookup.full_quest, cl_answer.description AS answer, gp_questions.follow_up,  " + &
	"                      gp_questions.followup_2 " + &
	"FROM         gp_questions INNER JOIN " + &
	"                      question_lookup ON gp_questions.question_id = question_lookup.quest_id LEFT OUTER JOIN " + &
	"                      code_lookup cl_question_type ON question_lookup.quest_type = cl_question_type.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_answer ON gp_questions.answer_code = cl_answer.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_group_covering' and type = 'V')  " + &
	"  drop view v_group_covering "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_group_covering " + &
	"AS " + &
	"SELECT DISTINCT     " + &
	"                      pd_group_providers.facility_id, pd_group_providers.provider_name, code_lookup_b.description AS specialty,  " + &
	"                      code_lookup_b.description AS specialty_code, code_lookup_a.code AS covering, pd_group_providers.covering_days,  " + &
	"                      pd_group_providers.custom_1, pd_group_providers.custom_2, pd_group_providers.custom_3, pd_group_providers.custom_4,  " + &
	"                      pd_group_providers.custom_5, facility.facility_name, pd_group_providers.prac_id, pd_group_providers.rec_id,  " + &
	"                      pd_group_providers.custom_6, pd_group_providers.custom_7, pd_group_providers.custom_8, pd_group_providers.custom_9,  " + &
	"                      pd_group_providers.custom_10, pd_group_providers.custom_d1, pd_group_providers.custom_d2 " + &
	"FROM         pd_group_providers INNER JOIN " + &
	"                      facility ON pd_group_providers.facility_id = facility.facility_id LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_a ON pd_group_providers.covering = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_b ON pd_group_providers.specialty = code_lookup_b.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_group_practice' and type = 'V')  " + &
	"  drop view v_group_practice "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_group_practice " + &
	"AS " + &
	"SELECT        gp.rec_id AS gp_id, cl_address_type.code AS address_type_code, cl_address_type.description AS address_type_description, gp.street, gp.street_2,  " + &
	"                      gp.city, cl_state.code AS state, gp.zip, cl_county.description AS county, cl_country.description AS country, gp.phone, gp.ext, gp.fax, gp.pager_number,  " + &
	"                      gp.web_address, gp.e_mail_address, gp.contact_person, gp.business_mgr, gp.office_mgr, gp.tax_id, gp.tax_id_other_1, gp.tax_id_other_2,  " + &
	"                      cl_accepting_new_patients.description AS accepting_new_patients, gp.cust_1, gp.cust_2, gp.cust_3, gp.cust_4, gp.cust_5, gp.cust_6, gp.active_status,  " + &
	"                      cl_practice_type.description AS practice_type, gp.routine_visit_appt, gp.urgent_visit_appt, gp.emergency_visit_appt, gp.non_emergency_appt,  " + &
	"                      cl_young_child.description AS young_child, cl_child.description AS child, cl_adolescent.description AS adolescent, cl_adult.description AS adult,  " + &
	"                      cl_senior_adult.description AS senior_adult, cl_handicapped_access.description AS handicapped_access,  " + &
	"                      cl_public_transportation.description AS public_transportation, cl_office_in_home.description AS office_in_home, gp.mon_from, gp.mon_to,  " + &
	"                      gp.mon_from2, gp.mon_to2, gp.tue_from, gp.tue_to, gp.tue_from2, gp.tue_to2, gp.wed_from, gp.wed_to2, gp.wed_from2, gp.wed_to, gp.thu_from,  " + &
	"                      gp.thu_to, gp.thu_from2, gp.thu_to2, gp.fri_from, gp.fri_to, gp.fri_from2, gp.fri_to2, gp.sat_from, gp.sat_to, gp.sat_from2, gp.sat_to2, gp.sun_from,  " + &
	"                      gp.sun_from2, gp.sun_to, gp.sun_to2, gp.prac_id, gp.suite_apart " + &
	"FROM         group_practice gp LEFT OUTER JOIN " + &
	"                      code_lookup cl_address_type ON gp.mailing_address = cl_address_type.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_accepting_new_patients ON gp.accepting_new_patients = cl_accepting_new_patients.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_adult ON gp.adult = cl_adult.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_adolescent ON gp.adolescent = cl_adolescent.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_child ON gp.child = cl_child.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_country ON gp.country = cl_country.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_county ON gp.county = cl_county.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_handicapped_access ON gp.handicapped_access = cl_handicapped_access.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_office_in_home ON gp.office_in_home = cl_office_in_home.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_practice_type ON gp.practice_type = cl_practice_type.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_public_transportation ON gp.public_transportation = cl_public_transportation.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_senior_adult ON gp.senior_adult = cl_senior_adult.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_state ON gp.state = cl_state.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_young_child ON gp.young_child = cl_young_child.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_group_practice_parent_org_link' and type = 'V')  " + &
	"  drop view v_group_practice_parent_org_link "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_group_practice_parent_org_link " + &
	"AS " + &
	"SELECT        group_loc_link.rec_id, group_loc_link.group_id AS parent_org_id, group_multi_loc.gp_name AS parent_org_name,  " + &
	"                      group_loc_link.loc_id AS gp_id, group_practice.street AS gp_loc_name " + &
	"FROM         group_loc_link INNER JOIN " + &
	"                      group_multi_loc ON group_loc_link.group_id = group_multi_loc.rec_id INNER JOIN " + &
	"                      group_practice ON group_loc_link.loc_id = group_practice.rec_id "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_hosp_affil' and type = 'V')  " + &
	"  drop view v_hosp_affil "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_hosp_affil " + &
	"as select    pd_hosp_affil.rec_id,pd_hosp_affil.prac_id,hospital_code=address_lookup.code,hospital_name=address_lookup.entity_name,pd_hosp_affil.month_from,pd_hosp_affil.year_from,pd_hosp_affil.month_thru,pd_hosp_affil.year_thru,pd_hosp_affil.primary_hosp,primary_hospital=code_lookup_g.code,staff_cat_code=code_lookup_h.code,staff_cat_description=code_lookup_h.description,admitting_priviliges=code_lookup_i.code,pd_hosp_affil.cust_1,pd_hosp_affil.cust_2,pd_hosp_affil.cust_3,pd_hosp_affil.cust_4,pd_hosp_affil.cust_5,pd_hosp_affil.department_a,pd_hosp_affil.section_a,pd_hosp_affil.department_b,pd_hosp_affil.section_b,pd_hosp_affil.department_c,pd_hosp_affil.section_c,pd_hosp_affil.cust_6,pd_hosp_affil.cust_7,pd_hosp_affil.cust_8,pd_hosp_affil.cust_9,pd_hosp_affil.cust_10,pd_hosp_affil.cust_d1,pd_hosp_affil.cust_d2,pd_hosp_affil.start_date,pd_hosp_affil.end_date,pd_hosp_affil.unrestricted_privs,pd_hosp_affil.pctg_admissions,pd_hosp_affil.dept_director from((((pd_hosp_affil left outer join address_lookup on pd_hosp_affil.hospital_code = address_lookup.lookup_code) left outer join code_lookup as code_lookup_g on pd_hosp_affil.primary_hosp = code_lookup_g.lookup_code) left outer join code_lookup as code_lookup_h on pd_hosp_affil.staff_category = code_lookup_h.lookup_code) left outer join code_lookup as code_lookup_i on pd_hosp_affil.admitting_priv = code_lookup_i.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_hospital_facility_link' and type = 'V')  " + &
	"  drop view v_hospital_facility_link "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_hospital_facility_link " + &
	"AS " + &
	"SELECT        pd_hosp_facility_link.hosp_affil_id AS rec_id, pd_hosp_facility_link.prac_id, pd_hosp_facility_link.facility_id,  " + &
	"                      pd_hosp_facility_link.primary_hosp, code_lookup.code AS primary_hosp_code,  " + &
	"                      code_lookup.description AS primary_hosp_description " + &
	"FROM         pd_hosp_facility_link INNER JOIN " + &
	"                      code_lookup ON pd_hosp_facility_link.primary_hosp = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_image_list' and type = 'V')  " + &
	"  drop view v_image_list "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_image_list " + &
	"AS " + &
	"SELECT        rec_id, prac_id, screen_id, date_scanned, user_name, date_recieved, active_status, doc_id, notes, num_pages, reference_name, tif_start_page,  " + &
	"                      image_type_id, file_name, modify_date " + &
	"FROM         pd_images "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_Insurance' and type = 'V')  " + &
	"  drop view v_Insurance "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_Insurance " + &
	"  as select    pd_insurance.rec_id, " + &
	"    pd_insurance.prac_id, " + &
	"    address_lookup.code as carrier_code, " + &
	"    address_lookup.entity_name as carrier_name, " + &
	"    pd_insurance.policy_number, " + &
	"    pd_insurance.coverage_from, " + &
	"    pd_insurance.coverage_to, " + &
	"    pd_insurance.previous_expiration_date, " + &
	"    code_lookup_b.code as tail_coverage_code, " + &
	"    pd_insurance.coverage_limit_from, " + &
	"    pd_insurance.coverage_limit_to, " + &
	"    code_lookup_d.code as state_funded_code, " + &
	"    code_lookup_c.code as state_coverage, " + &
	"    pd_insurance.exclusions, " + &
	"    pd_insurance.cust_1, " + &
	"    pd_insurance.cust_2, " + &
	"    pd_insurance.cust_3, " + &
	"    pd_insurance.cust_4, " + &
	"    pd_insurance.cust_5, " + &
	"    pd_insurance.cust_6, " + &
	"    pd_insurance.cust_7, " + &
	"    pd_insurance.cust_8, " + &
	"    pd_insurance.cust_9, " + &
	"    pd_insurance.cust_10, " + &
	"    pd_insurance.cust_d1, " + &
	"    pd_insurance.cust_d2, " + &
	"    code_lookup_a.code as claims_made_code, " + &
	"    code_lookup_a.description as claims_made_description, " + &
	"    pd_insurance.denied_explain, " + &
	"    pd_insurance.active_status " + &
	"from " + &
	"    pd_insurance LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_a ON pd_insurance.claims_made_occurrence = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_b ON pd_insurance.tail_coverage = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_c ON pd_insurance.state_coverage = code_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_d ON pd_insurance.state_funded_pool = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"    address_lookup ON pd_insurance.carrier_code = address_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_invoice' and type = 'V')  " + &
	"  drop view v_invoice "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_invoice " + &
	"AS " + &
	"SELECT        pd_invoice.rec_id AS invoice_id, pd_invoice.prac_id, LTRIM(RTRIM(ISNULL(pd_basic.last_name, '')))  " + &
	"                      + ', ' + ISNULL(pd_basic.first_name, '') + ' ' + SUBSTRING(ISNULL(pd_basic.middle_name, ''), 1, 1)  " + &
	"                      + CASE WHEN isnull(pd_basic.middle_name, '') = '' THEN '' ELSE '.,' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), ''))) + CASE WHEN isnull " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), '') = '' THEN '' ELSE ', ' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.prof_suffix = code_lookup.lookup_code), ''))) AS prac_name, pd_invoice.facility_id, facility.facility_name,  " + &
	"                      pd_invoice.inv_date AS invoice_date, pd_invoice.due_date, pd_invoice.tax_a, pd_invoice.amt_billed, pd_invoice.invc_amt,  " + &
	"                      pd_invoice.amt_paid, CASE pd_invoice.paid WHEN 0 THEN 'Open' ELSE 'Paid' END AS paid, pd_invoice.note, pd_inv_rows.item_id,  " + &
	"                      pd_inv_rows.invt_id AS item_inventory_id, pd_inv_rows.billing_item AS item_billing_item, pd_inv_rows.quantity AS item_quantity,  " + &
	"                      pd_inv_rows.cost AS item_cost, pd_inv_rows.price AS item_price, pd_inv_rows.extended AS item_extended " + &
	"FROM         pd_invoice INNER JOIN " + &
	"                      pd_inv_rows ON pd_invoice.rec_id = pd_inv_rows.rec_id INNER JOIN " + &
	"                      pd_basic ON pd_invoice.prac_id = pd_basic.prac_id INNER JOIN " + &
	"                      facility ON pd_invoice.facility_id = facility.facility_id "
of_execute_sqls("of_ver70_release_view1")
RETURN 1

end function

public function integer of_ver70_release_view2 ();
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_languages' and type = 'V')  " + &
	"  drop view v_languages "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_languages " + &
	"as " + &
	"select    " + &
	"	pd_languages.rec_id, " + &
	"	pd_languages.prac_id, " + &
	"	lang_code=code_lookup_a.code, " + &
	"	lang_description=code_lookup_a.description, " + &
	"	speak=code_lookup_b.code, " + &
	"	read=code_lookup_c.code, " + &
	"	write=code_lookup_d.code, " + &
	"	sign=code_lookup_e.code, " + &
	"	pd_languages.cust_1, " + &
	"	pd_languages.cust_2, " + &
	"	pd_languages.cust_3, " + &
	"	pd_languages.cust_4, " + &
	"	pd_languages.cust_5, " + &
	"	pd_languages.cust_6, " + &
	"	pd_languages.cust_7, " + &
	"	pd_languages.cust_8, " + &
	"	pd_languages.cust_9, " + &
	"	pd_languages.cust_10, " + &
	"	pd_languages.cust_d1, " + &
	"	pd_languages.cust_d2 " + &
	"from " + &
	"	(((((pd_languages left outer join " + &
	"	code_lookup as code_lookup_a on pd_languages.foreign_language = code_lookup_a.lookup_code) left outer join " + &
	"	code_lookup as code_lookup_b on pd_languages.speak = code_lookup_b.lookup_code) left outer join " + &
	"	code_lookup as code_lookup_c on pd_languages.reads = code_lookup_c.lookup_code) left outer join " + &
	"	code_lookup as code_lookup_d on pd_languages.writes = code_lookup_d.lookup_code) left outer join " + &
	"	code_lookup as code_lookup_e on pd_languages.sign = code_lookup_e.lookup_code) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_license' and type = 'V')  " + &
	"  drop view v_license "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_license " + &
	"as SELECT    pd_license.rec_id,pd_license.prac_id,state_code=code_lookup_a.code,state_description=code_lookup_a.description,lic_type_code=code_lookup_b.code,lic_type_description=code_lookup_b.description,pd_license.license_number,pd_license.expiration_date,pd_license.year_issued,pd_license.previous_expiration_date,verif_agcy_code=address_lookup.code,verif_agcy_name=address_lookup.entity_name,pd_license.restrictions,pd_license.cust_1,pd_license.cust_2,pd_license.cust_3,pd_license.cust_4,pd_license.cust_5,pd_license.cust_6,pd_license.cust_7,pd_license.cust_8,pd_license.cust_9,pd_license.cust_10,pd_license.cust_d1,pd_license.cust_d2,pd_license.issue_date,pd_license.active_status from address_lookup,code_lookup as code_lookup_a,code_lookup as code_lookup_b,pd_license where(pd_license.state = code_lookup_a.lookup_code) and(pd_license.license_type_code = code_lookup_b.lookup_code) and(pd_license.verifying_agency = address_lookup.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_mailing_address' and type = 'V')  " + &
	"  drop view v_mailing_address "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_mailing_address " + &
	"AS " + &
	"SELECT        code_lookup_c.code AS state, pd_address.rec_id, pd_address.prac_id, pd_address.street, pd_address.street_2, pd_address.city,  " + &
	"                      code_lookup_b.code AS practice_type, pd_address.zip, code_lookup_d.code AS country, pd_address.phone, pd_address.fax,  " + &
	"                      pd_address.contact_person, pd_address.e_mail_address, pd_address.web_address, pd_address_link.facility_id,  " + &
	"                      pd_address_link.mailing, pd_address.ext, code_lookup_a.description AS county, code_lookup_d.description AS country_description,  " + &
	"                      code_lookup_c.description AS state_description, code_lookup_b.description AS practice_type_description, pd_address.tax_id,  " + &
	"                      pd_address.tax_id_other_1, pd_address.tax_id_other_2, pd_address.business_mgr, pd_address.office_mgr, pd_address.cust_1,  " + &
	"                      pd_address.cust_2, pd_address.cust_3, pd_address.cust_4, pd_address.cust_5, pd_address.cust_6, pd_address.cust_7,  " + &
	"                      pd_address.cust_8, pd_address.cust_9, pd_address.cust_10, pd_address.cust_d1, pd_address.cust_d2, pd_address.gp_id,  " + &
	"                      pd_address.suite_apart, code_lookup_e.description AS send_corresp_here " + &
	"FROM         pd_address INNER JOIN " + &
	"                      pd_address_link ON pd_address.rec_id = pd_address_link.address_id LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_b ON pd_address.practice_type = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_c ON pd_address.state = code_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_d ON pd_address.country = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_a ON pd_address.county = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_e ON pd_address.send_corresp_here = code_lookup_e.lookup_code " + &
	"WHERE     (pd_address_link.mailing = 1) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_meeting_list' and type = 'V')  " + &
	"  drop view v_meeting_list "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_meeting_list " + &
	"  as select    meetings.meeting_id, " + &
	"    facility_name, " + &
	"    meeting_type_code=code_lookup_a.code, " + &
	"    meetings.start_date, " + &
	"    start_time=code_lookup_c.code, " + &
	"    meetings.end_date, " + &
	"    end_time=code_lookup_d.code, " + &
	"    meetings.subject, " + &
	"    location=code_lookup_b.code, " + &
	"    department=code_lookup_e.description, " + &
	"    section=code_lookup_g.description, " + &
	"    committee_lookup.committee_name, " + &
	"    meetings.comments, " + &
	"    meetings.cme_credits, " + &
	"    cme_category=code_lookup_h.code, " + &
	"    meetings.cme_presenter, " + &
	"    meetings.cme_affiliation " + &
	"from " + &
	"    meetings INNER JOIN " + &
	"    code_lookup as code_lookup_a ON meetings.meeting_type = code_lookup_a.lookup_code INNER JOIN " + &
	"    code_lookup as code_lookup_b ON meetings.location = code_lookup_b.lookup_code INNER JOIN " + &
	"    code_lookup as code_lookup_c ON meetings.start_time = code_lookup_c.lookup_code INNER JOIN " + &
	"    code_lookup as code_lookup_d ON meetings.end_time = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_e ON meetings.department = code_lookup_e.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_g ON meetings.section = code_lookup_g.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_h ON meetings.cme_category = code_lookup_h.lookup_code LEFT OUTER JOIN " + &
	"    committee_lookup ON meetings.committee = committee_lookup.committee_id LEFT OUTER JOIN " + &
	"    facility ON meetings.facility = facility.facility_id "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_meetings' and type = 'V')  " + &
	"  drop view v_meetings "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_meetings " + &
	"  as select    meeting_type=code_lookup_a.code, " + &
	"    meetings.start_date, " + &
	"    meetings.start_time, " + &
	"    meetings.end_date, " + &
	"    meetings.end_time, " + &
	"    meetings.subject, " + &
	"    location=code_lookup_b.code, " + &
	"    meetings.committee, " + &
	"    meetings.comments, " + &
	"    meetings.cme_credits, " + &
	"    meetings.cme_category, " + &
	"    meetings.cme_presenter, " + &
	"    meetings.cme_affiliation, " + &
	"    meetings.facility, " + &
	"    attendence.attendence_status, " + &
	"    meetings.meeting_id, " + &
	"    attendence.prac_id, " + &
	"    meetings.department, " + &
	"    meetings.section, " + &
	"    attendence.active_status from( " + &
	"    meetings left outer join attendence on meetings.meeting_id = attendence.meeting_id), " + &
	"    code_lookup as code_lookup_a, " + &
	"    code_lookup as code_lookup_b where " + &
	"    (meetings.meeting_type = code_lookup_a.lookup_code) and " + &
	"    (meetings.location = code_lookup_b.lookup_code) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_net_dev_actions' and type = 'V')  " + &
	"  drop view v_net_dev_actions "
//Modified by Nova on 2008-07-31 add field due_date
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_net_dev_actions " + &
	"as select    net_dev_action_items.app_id,prac_id,net_dev_action_items.facility_id,facility.facility_name,action_type_code=code_lookup_a.code,action_type_description=code_lookup_a.description,department_code=code_lookup_b.code,department_description=code_lookup_b.description,action_status_code=code_lookup_c.code,action_status_description=code_lookup_c.description,net_dev_action_items.action_date,net_dev_action_items.action_user,net_dev_action_items.next_action_date,net_dev_action_items.notes,net_dev_action_items.action_contact,app_hdr.application_type,app_hdr.application_name,net_dev_action_items.due_date,net_dev_action_items.app_type  from((((net_dev_action_items left outer join code_lookup as code_lookup_a on net_dev_action_items.action_type = code_lookup_a.lookup_code) left outer join code_lookup as code_lookup_b on net_dev_action_items.action_dept = code_lookup_b.lookup_code) left outer join code_lookup as code_lookup_c on net_dev_action_items.action_status = code_lookup_c.lookup_code) left outer join app_hdr on net_dev_action_items.app_id = app_hdr.app_id),facility where(net_dev_action_items.facility_id = facility.facility_id)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_net_dev_ids' and type = 'V')  " + &
	"  drop view v_net_dev_ids "

//$<Modify> 05.14.2008 by Andy
//$<Reason> add columns:application_name,rec_id,tax_id,tier
//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//	"CREATE VIEW  v_net_dev_ids " + &
//	"as select    net_dev_ids.app_id,net_dev_ids.prac_id,net_dev_ids.facility_id,facility.facility_name,plan_type_code=code_lookup.code,plan_type_description=code_lookup.description,net_dev_ids.plan_assigned_id,net_dev_ids.start_date,net_dev_ids.end_date from code_lookup,net_dev_ids,facility where(net_dev_ids.plan_type = code_lookup.lookup_code) and(net_dev_ids.facility_id = facility.facility_id)  "
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"CREATE VIEW v_net_dev_ids " + &  
" AS " + & 
" SELECT net_dev_ids.prac_id, net_dev_ids.rec_id, net_dev_ids.facility_id, facility.facility_name, net_dev_ids.plan_assigned_id,    " + &
"                      code_lookup.code AS plan_type_code, code_lookup.description AS plan_type_description, net_dev_ids.start_date, net_dev_ids.end_date,    " + &
"                      net_dev_ids.tax_id, net_dev_ids.app_id, app_hdr.application_name, net_dev_ids.tier   " + &
" FROM         net_dev_ids INNER JOIN   " + &
"                      facility ON net_dev_ids.facility_id = facility.facility_id  " + &
" LEFT OUTER JOIN  code_lookup ON net_dev_ids.plan_type = code_lookup.lookup_code  " + &
" LEFT OUTER JOIN  app_hdr ON net_dev_ids.app_id = app_hdr.app_id  "
//end 05.14.2008

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_net_dev_notes' and type = 'V')  " + &
	"  drop view v_net_dev_notes "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_net_dev_notes " + &
	"as select    net_dev_notes.prac_id,net_dev_notes.notes from net_dev_notes  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_other_affil' and type = 'V')  " + &
	"  drop view v_other_affil "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_other_affil " + &
	"as select    pd_other_affill.rec_id,pd_other_affill.prac_id,institution_code=address_lookup.code,institution_name=address_lookup.entity_name,function_code=code_lookup.code,function_description=code_lookup.description,pd_other_affill.month_from,pd_other_affill.year_from,pd_other_affill.month_thru,pd_other_affill.year_thru,pd_other_affill.cust_1,pd_other_affill.cust_2,pd_other_affill.cust_3,pd_other_affill.cust_4,pd_other_affill.cust_5,pd_other_affill.cust_6,pd_other_affill.cust_7,pd_other_affill.cust_8,pd_other_affill.cust_9,pd_other_affill.cust_10,pd_other_affill.cust_d1,pd_other_affill.cust_d2,pd_other_affill.start_date,pd_other_affill.end_date from(pd_other_affill left outer join code_lookup on pd_other_affill.function_code = code_lookup.lookup_code),address_lookup where(pd_other_affill.institution_code = address_lookup.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_other_data_fs' and type = 'V')  " + &
	"  drop view v_other_data_fs "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_other_data_fs " + &
	"AS " + &
	"SELECT DISTINCT     " + &
	"                      pd_other_data.facility_id, facility.facility_name, pd_other_data.prac_id, pd_other_data.corp_comply, pd_other_data.bylaws_read,  " + &
	"                      pd_other_data.orientation, pd_other_data.conscience_sedation, pd_other_data.ppd_date, pd_other_data.npdb,  " + &
	"                      pd_other_data.physical, pd_other_data.lij_beeper, pd_other_data.active_status, code_lookup.description AS positive_ppd,  " + &
	"                      pd_other_data.custom_1, pd_other_data.custom_2, pd_other_data.custom_3, pd_other_data.custom_4,  " + &
	"                      pd_other_data.custom_5 " + &
	"FROM         pd_other_data INNER JOIN " + &
	"                      facility ON pd_other_data.facility_id = facility.facility_id LEFT OUTER JOIN " + &
	"                      code_lookup ON pd_other_data.positive_ppd = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_other_ids' and type = 'V')  " + &
	"  drop view v_other_ids "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_other_ids " + &
	"as select    pd_other_ids.rec_id,pd_other_ids.prac_id,id_type_code=code_lookup.code,id_type_description=code_lookup.description,pd_other_ids.id_number,pd_other_ids.exp_date,pd_other_ids.cust_1,pd_other_ids.cust_2,pd_other_ids.cust_3,pd_other_ids.cust_4,pd_other_ids.cust_5,pd_other_ids.cust_6,pd_other_ids.cust_7,pd_other_ids.cust_8,pd_other_ids.cust_9,pd_other_ids.cust_10,pd_other_ids.cust_d1,pd_other_ids.cust_d2,pd_other_ids.issue_date from(pd_other_ids left outer join code_lookup on pd_other_ids.id_type = code_lookup.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_peer_review' and type = 'V')  " + &
	"  drop view v_peer_review "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_peer_review " + &
	"AS " + &
	"SELECT        pd_peer_review.case_number, pd_peer_review.facility_id, facility.facility_name, pd_peer_review.date_of_review,  " + &
	"                      cl_review_status.code AS review_status_code, cl_review_status.description AS review_status_description, pd_peer_review.reviewer,  " + &
	"                      cl_review_reason.code AS review_reason_code, cl_review_reason.description AS review_reason_description,  " + &
	"                      pd_peer_review.date_of_occurrence, pd_peer_review.medical_record_number, pd_peer_review.patient_name,  " + &
	"                      pd_peer_review.admission_date, pd_peer_review.admitting_diagnoses, cl_sex.code AS gender_code,  " + &
	"                      cl_sex.description AS gender_description, pd_peer_review.age, pd_peer_review.notes, pd_peer_review.finding,  " + &
	"                      pd_peer_review.conclusion, pd_peer_review.date_completed, pd_peer_review.time_of_occurrence, pd_peer_review.cust_1,  " + &
	"                      pd_peer_review.cust_2, pd_peer_review.cust_3, pd_peer_review.cust_4, pd_peer_review.cust_5, pd_peer_review.cust_6,  " + &
	"                      pd_peer_review.cust_7, pd_peer_review.cust_8, pd_peer_review.cust_9, pd_peer_review.cust_10 " + &
	"FROM         pd_peer_review LEFT OUTER JOIN " + &
	"                      facility ON pd_peer_review.facility_id = facility.facility_id LEFT OUTER JOIN " + &
	"                      code_lookup cl_review_reason ON pd_peer_review.review_reason = cl_review_reason.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_sex ON pd_peer_review.sex = cl_sex.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_review_status ON pd_peer_review.review_status = cl_review_status.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_peer_review_action_items' and type = 'V')  " + &
	"  drop view v_peer_review_action_items "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_peer_review_action_items " + &
	"AS " + &
	"SELECT        pd_peer_review_action_items.rec_id, pd_peer_review_action_items.case_number, cl_action_type.code AS action_type_code,  " + &
	"                      cl_action_type.description AS action_type_description, pd_peer_review_action_items.action_date, cl_action_to.code AS action_to_code,  " + &
	"                      cl_action_to.description AS action_to_description, pd_peer_review_action_items.action_user, pd_peer_review_action_items.notes,  " + &
	"                      pd_peer_review_action_items.action_to_name, cl_action_status.code AS action_status_code,  " + &
	"                      cl_action_status.description AS action_status_description, pd_peer_review_action_items.date_completed " + &
	"FROM         pd_peer_review_action_items LEFT OUTER JOIN " + &
	"                      code_lookup cl_action_status ON pd_peer_review_action_items.action_status = cl_action_status.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_action_type ON pd_peer_review_action_items.action_type = cl_action_type.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_action_to ON pd_peer_review_action_items.action_to = cl_action_to.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_peer_review_pracs' and type = 'V')  " + &
	"  drop view v_peer_review_pracs "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_peer_review_pracs " + &
	"AS " + &
	"SELECT        pd_peer_review_pracs.case_number, pd_peer_review_pracs.prac_id, LTRIM(RTRIM(ISNULL(pd_basic.last_name, '')))  " + &
	"                      + ', ' + ISNULL(pd_basic.first_name, '') + ' ' + SUBSTRING(ISNULL(pd_basic.middle_name, ''), 1, 1)  " + &
	"                      + CASE WHEN isnull(pd_basic.middle_name, '') = '' THEN '' ELSE '.,' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), ''))) + CASE WHEN isnull " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), '') = '' THEN '' ELSE ', ' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.prof_suffix = code_lookup.lookup_code), ''))) AS full_name, code_lookup.code AS severity_code,  " + &
	"                      code_lookup.description AS severity_code_description, pd_peer_review_pracs.notes, pd_peer_review_pracs.active_status " + &
	"FROM         pd_peer_review_pracs INNER JOIN " + &
	"                      pd_basic ON pd_peer_review_pracs.prac_id = pd_basic.prac_id LEFT OUTER JOIN " + &
	"                      code_lookup ON pd_peer_review_pracs.severity_grade = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_postgrad_train' and type = 'V')  " + &
	"  drop view v_postgrad_train "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_postgrad_train " + &
	"as select    pd_postgrad_train.rec_id,pd_postgrad_train.prac_id,pd_postgrad_train.subject,pd_postgrad_train.date_from,pd_postgrad_train.date_thru,pd_postgrad_train.loc_city,loc_state_code=code_lookup_a.code,loc_state_description=code_lookup_a.description,pd_postgrad_train.loc_zip,loc_country_code=code_lookup_b.code,loc_country_description=code_lookup_b.description,pd_postgrad_train.hours,hours_code=code_lookup_f.code,hours_name=code_lookup_f.description,category_code=code_lookup_c.code,categ_description=code_lookup_c.description,pd_postgrad_train.sponsor,pd_postgrad_train.street,pd_postgrad_train.city,state_code=code_lookup_d.code,state_description=code_lookup_d.description,pd_postgrad_train.zip,country_code=code_lookup_e.code,country_description=code_lookup_e.description,pd_postgrad_train.program_director,pd_postgrad_train.cust_1,pd_postgrad_train.cust_2,pd_postgrad_train.cust_3,pd_postgrad_train.cust_4,pd_postgrad_train.cust_5 from((((((pd_postgrad_train left outer join code_lookup as code_lookup_a on pd_postgrad_train.loc_state = code_lookup_a.lookup_code) left outer join code_lookup as code_lookup_b on pd_postgrad_train.loc_country = code_lookup_b.lookup_code) left outer join code_lookup as code_lookup_c on pd_postgrad_train.category = code_lookup_c.lookup_code) left outer join code_lookup as code_lookup_d on pd_postgrad_train.state = code_lookup_d.lookup_code) left outer join code_lookup as code_lookup_e on pd_postgrad_train.country = code_lookup_e.lookup_code) left outer join code_lookup as code_lookup_f on pd_postgrad_train.hours = code_lookup_f.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_prac_privs' and type = 'V')  " + &
	"  drop view v_prac_privs "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_prac_privs " + &
	"AS " + &
	"SELECT        facility.facility_name, pd_priv_list.rec_id, pd_priv_list.facility_id, pd_priv_list.prac_id, pd_priv_list.start_date,  " + &
	"                      pd_priv_list.end_date, pd_priv_list.notes, pd_priv_list.active_status, pd_priv_list.ir_code,  " + &
	"                      priv_clinical_area.clinical_area_description, priv_core_procd.core_procd_description, priv_core.priv_core_description,  " + &
	"                      code_lookup.code, priv_core_procd.sort_order, priv_core_procd.procd_name, priv_clinical_area.clinical_area_code,  " + &
	"                      code_lookup.description AS priv_status_description, code_lookup.code AS priv_status_code " + &
	"FROM         facility INNER JOIN " + &
	"                      pd_priv_list ON facility.facility_id = pd_priv_list.facility_id INNER JOIN " + &
	"                      priv_clinical_area ON pd_priv_list.clinical_area_id = priv_clinical_area.clinical_area_id INNER JOIN " + &
	"                      priv_core ON pd_priv_list.priv_core_id = priv_core.priv_core_id INNER JOIN " + &
	"                      priv_core_procd ON pd_priv_list.procd_id = priv_core_procd.procd_id INNER JOIN " + &
	"                      code_lookup ON pd_priv_list.status_code = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_pracitioner_notes' and type = 'V')  " + &
	"  drop view v_pracitioner_notes "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_pracitioner_notes " + &
	"AS " + &
	"SELECT        pd_notes.record_id, pd_notes.prac_id, LTRIM(RTRIM(ISNULL(pd_basic.last_name, ''))) + ', ' + ISNULL(pd_basic.first_name, '')  " + &
	"                      + ' ' + SUBSTRING(ISNULL(pd_basic.middle_name, ''), 1, 1) + CASE WHEN isnull(pd_basic.middle_name, '')  " + &
	"                      = '' THEN '' ELSE '.,' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), ''))) + CASE WHEN isnull " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), '') = '' THEN '' ELSE ', ' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.prof_suffix = code_lookup.lookup_code), ''))) AS full_name, pd_notes.facility_id,  " + &
	"                      CASE pd_notes.facility_id WHEN 0 THEN 'Global' ELSE facility.facility_name END AS facility_name, pd_notes.ent_date, pd_notes.user_id,  " + &
	"                      pd_notes.note " + &
	"FROM         pd_notes INNER JOIN " + &
	"                      pd_basic ON pd_notes.prac_id = pd_basic.prac_id LEFT OUTER JOIN " + &
	"                      facility ON pd_notes.facility_id = facility.facility_id "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_primary_specialty' and type = 'V')  " + &
	"  drop view v_primary_specialty "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_primary_specialty " + &
	"as " + &
	"select    " + &
	"pd_board_specialty.rec_id,pd_board_specialty.prac_id,pd_board_specialty.specialty as specialty_id,code_lookup_a.code as specialty_code, " + &
	"code_lookup_a.description as specialty_name,address_lookup.code as board_code,pd_board_specialty.board_code as board_code_id, " + &
	"address_lookup.entity_name as board_name,pd_board_specialty.eligible_until,pd_board_specialty.initial_certification, " + &
	"pd_board_specialty.last_recertification,pd_board_specialty.certification_expires,pd_board_specialty.certification_number, " + &
	"pd_board_specialty.required_year_completion,pd_board_specialty.cust_1,pd_board_specialty.cust_2,pd_board_specialty.cust_3, " + &
	"pd_board_specialty.cust_4,pd_board_specialty.cust_5,code_lookup_b.description as exam_taken,code_lookup_c.description as active_process, " + &
	"code_lookup_d.description as ever_failed,code_lookup_e.description as specialty_order  " + &
	"from  " + &
	"pd_board_specialty LEFT OUTER JOIN " + &
	"address_lookup ON pd_board_specialty.board_code = address_lookup.lookup_code INNER JOIN " + &
	"code_lookup as code_lookup_a ON pd_board_specialty.specialty = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"code_lookup as code_lookup_b ON pd_board_specialty.exam_taken = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"code_lookup as code_lookup_c ON pd_board_specialty.active_cert_process = code_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"code_lookup as code_lookup_d ON pd_board_specialty.ever_failed_cert = code_lookup_d.lookup_code INNER JOIN " + &
	"code_lookup as code_lookup_e ON pd_board_specialty.specialty_order = code_lookup_e.lookup_code " + &
	"where " + &
	"(code_lookup_e.code = 'Primary') "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_priv_list' and type = 'V')  " + &
	"  drop view v_priv_list "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_priv_list " + &
	"  as select    priv_clinical_area.clinical_area_code, " + &
	"    priv_clinical_area.clinical_area_id, " + &
	"    priv_clinical_area.clinical_area_description, " + &
	"    priv_core.priv_core_description, " + &
	"    priv_core.priv_core_id, " + &
	"    priv_core_procd.core_procd_description, " + &
	"    priv_core_procd.procd_id, " + &
	"    priv_core_procd.sort_order, " + &
	"    priv_core_procd.procd_name from(( " + &
	"    priv_clinical_area left outer join priv_core on priv_clinical_area.clinical_area_id = priv_core.clinical_area_id) left outer join priv_core_procd on priv_core.priv_core_id = priv_core_procd.priv_core_id) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_prof_assoc' and type = 'V')  " + &
	"  drop view v_prof_assoc "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_prof_assoc " + &
	"as select    pd_prof_assoc.rec_id,pd_prof_assoc.prac_id,pd_prof_assoc.prof_assoc,prof_assoc_code=address_lookup.code,prof_assoc_name=address_lookup.entity_name,pd_prof_assoc.date_assoc,pd_prof_assoc.cust_1,pd_prof_assoc.cust_2,pd_prof_assoc.cust_3,pd_prof_assoc.cust_4,pd_prof_assoc.cust_5,pd_prof_assoc.cust_6,pd_prof_assoc.cust_7,pd_prof_assoc.cust_8,pd_prof_assoc.cust_9,pd_prof_assoc.cust_10,pd_prof_assoc.cust_d1,pd_prof_assoc.cust_d2 from pd_prof_assoc,address_lookup where(pd_prof_assoc.prof_assoc = address_lookup.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_prof_experience' and type = 'V')  " + &
	"  drop view v_prof_experience "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_prof_experience " + &
	"as select    pd_prof_experience.rec_id,pd_prof_experience.prac_id,pd_prof_experience.date_from_month,pd_prof_experience.date_to_month,pd_prof_experience.organization,pd_prof_experience.city,state_code=code_lookup_a.code,state_description=code_lookup_a.description,pd_prof_experience.zip,country_code=code_lookup_b.code,country_description=code_lookup_b.description,pd_prof_experience.title_duties,pd_prof_experience.date_from_year,pd_prof_experience.date_to_year,pd_prof_experience.cust_1,pd_prof_experience.cust_2,pd_prof_experience.cust_3,pd_prof_experience.cust_4,pd_prof_experience.cust_5,pd_prof_experience.cust_6,pd_prof_experience.cust_7,pd_prof_experience.cust_8,pd_prof_experience.cust_9,pd_prof_experience.cust_10,pd_prof_experience.cust_d1,pd_prof_experience.cust_d2,pd_prof_experience.start_date,pd_prof_experience.end_date,pd_prof_experience.street_1,pd_prof_experience.street_2 from((pd_prof_experience left outer join code_lookup as code_lookup_a on pd_prof_experience.state = code_lookup_a.lookup_code) left outer join code_lookup as code_lookup_b on pd_prof_experience.country = code_lookup_b.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_qa_hdr' and type = 'V')  " + &
	"  drop view v_qa_hdr "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_qa_hdr " + &
	"AS " + &
	"SELECT        PD_QA_HDR.PD_QA_HDR_ID AS pd_qa_hdr_id, PD_QA_HDR.PRAC_ID AS prac_id, LTRIM(RTRIM(ISNULL(pd_basic.last_name, '')))  " + &
	"                      + ', ' + ISNULL(pd_basic.first_name, '') + ' ' + SUBSTRING(ISNULL(pd_basic.middle_name, ''), 1, 1)  " + &
	"                      + CASE WHEN isnull(pd_basic.middle_name, '') = '' THEN '' ELSE '.,' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), ''))) + CASE WHEN isnull " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), '') = '' THEN '' ELSE ', ' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.prof_suffix = code_lookup.lookup_code), ''))) AS practitioner_name, PD_QA_HDR.QA_PROFILE_ID AS qa_profile_id,  " + &
	"                      QA_PROFILE.PROFILE_NAME AS profile_name, QA_PROFILE.SPECIALTY_ID AS profile_specialty_lookup_code,  " + &
	"                      CASE QA_PROFILE.SPECIALTY_ID WHEN 999999 THEN '(All)' ELSE cl_specialty.code END AS profile_specialty_code,  " + &
	"                      CASE QA_PROFILE.SPECIALTY_ID WHEN 999999 THEN '(All Specialties)' ELSE cl_specialty.description END AS profile_specialty_description,  " + &
	"                      PD_QA_HDR.FROM_DATE AS from_date, PD_QA_HDR.TO_DATE AS to_date, PD_QA_HDR.ACTIVE_STATUS AS active_status,  " + &
	"                      CASE PD_QA_HDR.ACTIVE_STATUS WHEN 0 THEN 'History' WHEN 1 THEN 'Active' WHEN 4 THEN 'Pending' ELSE 'Unknown' END AS active_status_description, " + &
	"                       PD_QA_HDR.HDR_COMMENT AS hdr_comment, cl_reason.code AS reason_code, cl_reason.description AS reason_description,  " + &
	"                      QA_PROFILE.FACILITY_ID AS facility_id, facility.facility_name " + &
	"FROM         PD_QA_HDR INNER JOIN " + &
	"                      pd_basic ON PD_QA_HDR.PRAC_ID = pd_basic.prac_id INNER JOIN " + &
	"                      QA_PROFILE ON PD_QA_HDR.QA_PROFILE_ID = QA_PROFILE.QA_PROFILE_ID INNER JOIN " + &
	"                      facility ON QA_PROFILE.FACILITY_ID = facility.facility_id LEFT OUTER JOIN " + &
	"                      code_lookup cl_reason ON PD_QA_HDR.REASON = cl_reason.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup cl_specialty ON QA_PROFILE.SPECIALTY_ID = cl_specialty.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_qa_measurements' and type = 'V')  " + &
	"  drop view v_qa_measurements "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_qa_measurements " + &
	"AS " + &
	"SELECT        PD_QA_MEASUREMENTS.PD_QA_MEASUREMENTS_ID AS pd_qa_measurements_id,  " + &
	"                      PD_QA_MEASUREMENTS.PD_QA_HDR_ID AS pd_qa_hdr_id, QA_MEASUREMENT.QA_PROFILE_GROUP_ID AS qa_profile_group_id,  " + &
	"                      QA_PROFILE_GROUP.QA_PROFILE_GROUP_NAME AS qa_profile_group_name, QA_MEASUREMENT.THRESHOLD AS threshold,  " + &
	"                      QA_MEASUREMENT.INCLUDE_IN_PROFILE AS include_in_profile,  " + &
	"                      CASE QA_MEASUREMENT.INCLUDE_IN_PROFILE WHEN 1 THEN 'Yes' ELSE 'No' END AS include_in_profile_description,  " + &
	"                      QA_MEASUREMENT.DATA_FORMAT AS data_format, QA_MEASUREMENT.QA_MEASUREMENT_NAME AS qa_measurement_name,  " + &
	"                      PD_QA_MEASUREMENTS.MEASUREMENT_VALUE AS measurement_value " + &
	"FROM         PD_QA_MEASUREMENTS INNER JOIN " + &
	"                      QA_MEASUREMENT ON  " + &
	"                      PD_QA_MEASUREMENTS.PROFILE_GROUP_MEASUREMENT_ID = QA_MEASUREMENT.PROFILE_GROUP_MEASUREMENT_ID INNER JOIN " + &
	"                      QA_PROFILE_GROUP ON QA_MEASUREMENT.QA_PROFILE_GROUP_ID = QA_PROFILE_GROUP.QA_PROFILE_GROUP_ID "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_question_lookup' and type = 'V')  " + &
	"  drop view v_question_lookup "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_question_lookup " + &
	"AS " + &
	"SELECT        question_lookup.quest_id, question_lookup.quest_type AS quest_type_lookup_code, code_lookup.code AS quest_type_code,  " + &
	"                      code_lookup.description AS quest_type_description, question_lookup.short_quest, question_lookup.full_quest " + &
	"FROM         question_lookup INNER JOIN " + &
	"                      code_lookup ON question_lookup.quest_type = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_references' and type = 'V')  " + &
	"  drop view v_references "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_references " + &
	"as select    pd_references.rec_id,pd_references.prac_id,pd_references.last_name,pd_references.first_middle_name,title_code=code_lookup_a.code,title_description=code_lookup_a.description,name_suffix_code=code_lookup_b.code,name_suffix_description=code_lookup_b.description,prof_suf_code=code_lookup_c.code,prof_suf_description=code_lookup_c.description,pd_references.street,pd_references.city,pd_references.state,state_code=code_lookup_d.code,state_description=code_lookup_d.description,pd_references.zip,pd_references.country,country_code=code_lookup_e.code,country_description=code_lookup_e.description,pd_references.cust_1,pd_references.cust_2,pd_references.cust_3,pd_references.cust_4,pd_references.cust_5,pd_references.cust_6,pd_references.cust_7,pd_references.cust_8,pd_references.cust_9,pd_references.cust_10,pd_references.cust_d1,pd_references.cust_d2 from(((((pd_references left outer join code_lookup as code_lookup_a on pd_references.title = code_lookup_a.lookup_code) left outer join code_lookup as code_lookup_b on pd_references.name_suffix = code_lookup_b.lookup_code) left outer join code_lookup as code_lookup_c on pd_references.prof_suffix = code_lookup_c.lookup_code) left outer join code_lookup as code_lookup_d on pd_references.state = code_lookup_d.lookup_code) left outer join code_lookup as code_lookup_e on pd_references.country = code_lookup_e.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_sanctions' and type = 'V')  " + &
	"  drop view v_sanctions "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_sanctions " + &
	"AS " + &
	"select    pd_sanctions.rec_id, " + &
	"    pd_sanctions.prac_id, " + &
	"    code_lookup_a.description as status_activity, " + &
	"    code_lookup_b.description as action_sanct_name, " + &
	"    pd_sanctions.taken, " + &
	"    pd_sanctions.date_from, " + &
	"    pd_sanctions.date_thru, " + &
	"    pd_sanctions.reason_1, " + &
	"    pd_sanctions.reason_2, " + &
	"    pd_sanctions.reason_3, " + &
	"    pd_sanctions.cust_1, " + &
	"    pd_sanctions.cust_2, " + &
	"    pd_sanctions.cust_3, " + &
	"    pd_sanctions.cust_4, " + &
	"    pd_sanctions.cust_5, " + &
	"    pd_sanctions.cust_6, " + &
	"    pd_sanctions.cust_7, " + &
	"    pd_sanctions.cust_8, " + &
	"    pd_sanctions.cust_9, " + &
	"    pd_sanctions.cust_10, " + &
	"    pd_sanctions.cust_d1, " + &
	"    pd_sanctions.cust_d2, " + &
	"    pd_sanctions.organization_name, " + &
	"    address_lookup.code as org_code, " + &
	"    address_lookup.entity_name as org_name " + &
	"from(( " + &
	"    pd_sanctions left outer join " + &
	"	code_lookup as code_lookup_a on pd_sanctions.status_activity_code = code_lookup_a.lookup_code) left outer join " + &
	"	code_lookup as code_lookup_b on pd_sanctions.action_sanction_code = code_lookup_b.lookup_code) INNER JOIN " + &
	"	address_lookup ON pd_sanctions.organization_name = address_lookup.lookup_code INNER JOIN " + &
	"	pd_basic ON pd_sanctions.prac_id = pd_basic.prac_id "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_santions' and type = 'V')  " + &
	"  drop view v_santions "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_santions " + &
	"AS " + &
	"SELECT        pd_sanctions.prac_id, pd_sanctions.rec_id, code_lookup_a.code AS status_Activity_code,  " + &
	"                      code_lookup_a.description AS status_activity_description, code_lookup_b.code AS action_Santion_Code,  " + &
	"                      code_lookup_b.description AS action_santion_description, code_lookup_c.code AS santions_code, code_lookup_c.description AS santions_description,  " + &
	"                      address_lookup_a.entity_name AS insurance_company, address_lookup_b.entity_name AS hospital, address_lookup_c.code AS org_name_code,  " + &
	"                      address_lookup_c.entity_name AS org_name_description, pd_sanctions.taken, pd_sanctions.date_from, pd_sanctions.date_thru,  " + &
	"                      pd_sanctions.reason_1, pd_sanctions.reason_2, pd_sanctions.reason_3, pd_sanctions.cust_4, pd_sanctions.cust_5 " + &
	"FROM         pd_sanctions INNER JOIN " + &
	"                      pd_basic ON pd_sanctions.prac_id = pd_basic.prac_id LEFT OUTER JOIN " + &
	"                      address_lookup address_lookup_a ON pd_sanctions.cust_2 = address_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"                      address_lookup address_lookup_b ON pd_sanctions.cust_3 = address_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"                      address_lookup address_lookup_c ON pd_sanctions.organization_name = address_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_a ON pd_sanctions.status_activity_code = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_b ON pd_sanctions.action_sanction_code = code_lookup_b.lookup_code CROSS JOIN " + &
	"                      code_lookup code_lookup_c LEFT OUTER JOIN " + &
	"                      pd_sanctions pd_sanctions1 ON code_lookup_c.lookup_code = pd_sanctions1.cust_1 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_site_survey' and type = 'V')  " + &
	"  drop view v_site_survey "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_site_survey " + &
	"AS " + &
	"SELECT        group_practice.rec_id AS gp_id, group_practice.street, review_hdr.review_description, review_hdr.maximum_score,  " + &
	"                      review_hdr.minimum_passing_score, review_hdr.total_points AS review_total_score, pd_review_hdr.review_date,  " + &
	"                      code_lookup.description AS review_start_time, code_lookup_1.description AS review_end_time, pd_review_hdr.contact_person,  " + &
	"                      pd_review_hdr.notes_1, pd_review_hdr.notes_2, pd_review_hdr.notes_3, pd_review_hdr.total_score AS grp_total_score,  " + &
	"                      code_lookup_2.description AS review_results, pd_review_hdr.active_status, pd_review_hdr.next_review_date,  " + &
	"                      pd_review_hdr.lock_for_edit " + &
	"FROM         pd_review_hdr INNER JOIN " + &
	"                      group_practice ON pd_review_hdr.address_id = group_practice.rec_id INNER JOIN " + &
	"                      review_hdr ON pd_review_hdr.review_id = review_hdr.review_id LEFT OUTER JOIN " + &
	"                      code_lookup ON pd_review_hdr.review_start_time = code_lookup.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_1 ON pd_review_hdr.review_end_time = code_lookup_1.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_2 ON pd_review_hdr.review_result_code = code_lookup_2.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_site_survey_results' and type = 'V')  " + &
	"  drop view v_site_survey_results "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_site_survey_results " + &
	"AS " + &
	"SELECT        pd_review_hdr.rec_id, pd_review_hdr.address_id AS gp_id, group_practice.street, group_practice.street_2, group_practice.city,  " + &
	"                      cl_state.code AS state, group_practice.zip, group_practice.phone, group_practice.ext,  " + &
	"                      group_practice.contact_person AS location_contact_person, review_hdr.review_description, pd_review_hdr.review_date,  " + &
	"                      cl_start_time.code AS start_time_code, cl_start_time.description AS start_time_description, cl_end_time.code AS end_time_code,  " + &
	"                      cl_end_time.description AS end_time_description, review_question_groups.group_name, review_question_groups.group_order,  " + &
	"                      review_question_groups_1.group_name AS subgroup_name, review_question_groups_1.group_order AS subgroup_order,  " + &
	"                      pd_review_hdr.contact_person AS survey_contact_person, pd_review_hdr.reviewer_id, pd_review_hdr.notes_1 AS survey_notes_1,  " + &
	"                      pd_review_hdr.notes_2 AS survey_notes_2, pd_review_hdr.notes_3 AS survey_notes_3, pd_review_hdr.total_score,  " + &
	"                      pd_review_hdr.review_result_code, pd_review_hdr.active_status, pd_review_hdr.next_review_date, pd_review_hdr.lock_for_edit,  " + &
	"                      CASE WHEN pd_review_hdr.lock_for_edit = 1 THEN 'Yes' ELSE 'No' END AS lock_for_edit_desc, review_question_answer.question_id,  " + &
	"                      review_question.question, review_question.key_quest,  " + &
	"                      CASE WHEN review_question.key_quest = 1 THEN 'Yes' ELSE 'No' END AS key_quest_desc, review_question.key_value AS key_passing_value,  " + &
	"                      review_question.question_order, review_question_answer.answer_id, review_question_answer.question_answer AS answer,  " + &
	"                      review_question_answer.answer_score, review_question_answer.answer_order, pd_review_answers.answer_on_off AS answer_selected,  " + &
	"                      CASE WHEN pd_review_answers.answer_on_off = 1 THEN 'Yes' ELSE 'No' END AS answer_selected_desc,  " + &
	"                      pd_review_answers.notes AS answer_notes " + &
	"FROM group_practice  " + &
	"INNER JOIN pd_review_hdr ON group_practice.rec_id = pd_review_hdr.address_id  " + &
	"INNER JOIN review_hdr ON  review_hdr.review_id = pd_review_hdr.review_id  " + &
	"INNER JOIN pd_review_answers ON pd_review_hdr.rec_id = pd_review_answers.rec_id  " + &
	"INNER JOIN review_question_answer ON pd_review_answers.question_answer_id = review_question_answer.question_answer_id  " + &
	"INNER JOIN review_question ON review_question_answer.question_id = review_question.question_id  " + &
	"INNER JOIN review_question_groups review_question_groups_1 ON review_question_groups_1.review_id = review_question.review_id AND  review_question_groups_1.group_id = review_question.sub_group_id  " + &
	"LEFT OUTER JOIN review_question_groups ON review_question.review_id = review_question_groups.review_id AND review_question.group_id = review_question_groups.group_id  " + &
	"LEFT OUTER JOIN code_lookup cl_state ON group_practice.state = cl_state.lookup_code  " + &
	"LEFT OUTER JOIN code_lookup cl_end_time ON pd_review_hdr.review_end_time = cl_end_time.lookup_code  " + &
	"LEFT OUTER JOIN code_lookup cl_start_time ON pd_review_hdr.review_start_time = cl_start_time.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_sp_certs' and type = 'V')  " + &
	"  drop view v_sp_certs "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_sp_certs " + &
	"  as select    pd_special_certs.rec_id, " + &
	"    pd_special_certs.prac_id, " + &
	"    pd_special_certs.certified_in, " + &
	"    pd_special_certs.initial_cert_month, " + &
	"    pd_special_certs.initial_cert_year, " + &
	"    pd_special_certs.cert_expiration_month, " + &
	"    pd_special_certs.cert_expiration_year, " + &
	"    pd_special_certs.certification_number, " + &
	"    exam_taken_code=code_lookup.code, " + &
	"    pd_special_certs.certified_by, " + &
	"    pd_special_certs.cust_1, " + &
	"    pd_special_certs.cust_2, " + &
	"    pd_special_certs.cust_3, " + &
	"    pd_special_certs.cust_4, " + &
	"    pd_special_certs.cust_5 " + &
	"from( " + &
	"    pd_special_certs left outer join code_lookup on pd_special_certs.exam_taken = code_lookup.lookup_code) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_special_certs' and type = 'V')  " + &
	"  drop view v_special_certs "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_special_certs " + &
	"  as select distinct    pd_special_certs.rec_id, " + &
	"    pd_special_certs.prac_id, " + &
	"    pd_special_certs.initial_cert_month, " + &
	"    pd_special_certs.initial_cert_year, " + &
	"    pd_special_certs.cert_expiration_month, " + &
	"    pd_special_certs.cert_expiration_year, " + &
	"    pd_special_certs.certification_number, " + &
	"    pd_special_certs.certified_in, " + &
	"    pd_special_certs.cust_1, " + &
	"    pd_special_certs.cust_2, " + &
	"    pd_special_certs.cust_3, " + &
	"    pd_special_certs.cust_4, " + &
	"    pd_special_certs.cust_5, " + &
	"    pd_special_certs.cust_6, " + &
	"    pd_special_certs.cust_7, " + &
	"    pd_special_certs.cust_8, " + &
	"    pd_special_certs.cust_9, " + &
	"    pd_special_certs.cust_10, " + &
	"    pd_special_certs.cust_d1, " + &
	"    pd_special_certs.cust_d2, " + &
	"    pd_special_certs.start_date, " + &
	"    pd_special_certs.end_date, " + &
	"    address_lookup.code as certified_by_code, " + &
	"    address_lookup.entity_name as certified_by_name, " + &
	"    code_lookup_a.code as certified_in_code, " + &
	"    code_lookup_a.description as certified_in_description, " + &
	"    code_lookup_b.description as exam_taken from " + &
	"    pd_special_certs left outer join code_lookup as code_lookup_a on pd_special_certs.certified_in = code_lookup_a.lookup_code left outer join " + &
	"    address_lookup on pd_special_certs.certified_by = address_lookup.lookup_code left outer join " + &
	"    code_lookup as code_lookup_b on pd_special_certs.exam_taken = code_lookup_b.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_specialty_facility_link' and type = 'V')  " + &
	"  drop view v_specialty_facility_link "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_specialty_facility_link " + &
	"AS " + &
	"SELECT        pd_spec_facility_link.specialty_id, pd_spec_facility_link.prac_id, pd_spec_facility_link.facility_id,  " + &
	"                      code_lookup.description AS practicing " + &
	"FROM         pd_spec_facility_link INNER JOIN " + &
	"                      code_lookup ON pd_spec_facility_link.practicing = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_staff_cat' and type = 'V')  " + &
	"  drop view v_staff_cat "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_staff_cat " + &
	"as select distinct    pd_affil_staff_cat.rec_id,pd_affil_staff_cat.prac_id,facility_name=facility.facility_name,staff_cat_code=code_lookup_a.code,staff_cat_description=code_lookup_a.description,pd_affil_staff_cat.from_date,pd_affil_staff_cat.to_date,pd_affil_staff_cat.active_status from pd_affil_staff_cat,code_lookup as code_lookup_a,facility where(pd_affil_staff_cat.facility_id = facility.facility_id) and(pd_affil_staff_cat.staff_category = code_lookup_a.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_staff_leave' and type = 'V')  " + &
	"  drop view v_staff_leave "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_staff_leave " + &
	"as select distinct    pd_affil_staff_leave.rec_id,pd_affil_staff_leave.prac_id,facility_name=facility.facility_name,leave_code=code_lookup_a.code,leave_description=code_lookup_a.description,pd_affil_staff_leave.from_date,pd_affil_staff_leave.to_date,pd_affil_staff_leave.active_status from pd_affil_staff_leave,code_lookup as code_lookup_b,code_lookup as code_lookup_a,facility where(pd_affil_staff_leave.facility_id = facility.facility_id) and(pd_affil_staff_leave.leave_of_absence_reason = code_lookup_b.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_training' and type = 'V')  " + &
	"  drop view v_training "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_training " + &
	"  as select    pd_training.rec_id, " + &
	"    pd_training.prac_id, " + &
	"    training_type=code_lookup_a.description, " + &
	"    pd_training.month_from, " + &
	"    pd_training.year_from, " + &
	"    pd_training.month_thru, " + &
	"    pd_training.year_thru, " + &
	"    pd_training.program_director, " + &
	"    accred_code=code_lookup_e.code, " + &
	"    specialty_name=code_lookup_b.description, " + &
	"    internship_type=code_lookup_c.description, " + &
	"    fellowhsip_type=code_lookup_d.description, " + &
	"    pd_training.chief_res_month_from, " + &
	"    pd_training.chief_res_year_from, " + &
	"    pd_training.chief_res_month_thru, " + &
	"    pd_training.chief_res_year_thru, " + &
	"    institution_name=address_lookup.entity_name, " + &
	"    pd_training.cust_1, " + &
	"    pd_training.cust_2, " + &
	"    pd_training.cust_3, " + &
	"    pd_training.cust_4, " + &
	"    pd_training.cust_5, " + &
	"    pd_training.cust_6, " + &
	"    pd_training.cust_7, " + &
	"    pd_training.cust_8, " + &
	"    pd_training.cust_9, " + &
	"    pd_training.cust_10, " + &
	"    pd_training.cust_d1, " + &
	"    pd_training.cust_d2, " + &
	"    pd_training.start_date, " + &
	"    pd_training.end_date " + &
	"from " + &
	"    pd_training LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_a ON pd_training.train_type = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_b ON pd_training.specialty = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_c ON pd_training.internship_type_code = code_lookup_c.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_d ON pd_training.fellowship_type_code = code_lookup_d.lookup_code LEFT OUTER JOIN " + &
	"    code_lookup as code_lookup_e ON pd_training.accredited = code_lookup_e.lookup_code LEFT OUTER JOIN " + &
	"    address_lookup ON pd_training.institution_code = address_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_verif_info' and type = 'V')  " + &
	"  drop view v_verif_info "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_verif_info " + &
	"AS " + &
	"SELECT DISTINCT     " + &
	"                      verif_info.rec_id, verif_info.prac_id, verif_info.facility_id, facility.facility_name, verif_info.seq_no, verif_info.first_sent,  " + &
	"                      verif_info.last_sent, verif_info.number_sent, verif_info.date_recieved, verif_info.user_name, code_lookup_a.code AS response_code,  " + &
	"                      code_lookup_a.description AS response_descrip, code_lookup_b.code AS method_code, code_lookup_b.description AS method_descrip,  " + &
	"                      data_view_screen.screen_name, data_view_screen.screen_id, verif_info.active_status, verif_info.expiration_date,  " + &
	"                      verif_info.reference_value, verif_info.priority_user, verif_info.priority, verif_info.exp_credential_flag, verif_info.doc_id,  " + &
	"                      verif_info.print_flag, verif_info.notes, verif_info.source,  " + &
	"                      CASE verif_info.priority WHEN 1 THEN 'Low' WHEN 2 THEN 'Medium' WHEN 3 THEN 'High' ELSE 'Unknown' END AS priority_description " + &
	"FROM         verif_info INNER JOIN " + &
	"                      data_view_screen ON verif_info.screen_id = data_view_screen.screen_id INNER JOIN " + &
	"                      code_lookup code_lookup_b ON verif_info.verification_method = code_lookup_b.lookup_code INNER JOIN " + &
	"                      facility ON verif_info.facility_id = facility.facility_id LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_a ON verif_info.response_code = code_lookup_a.lookup_code " + &
	"WHERE     (data_view_screen.data_view_id = 1) "


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='view_pd_basic' and type = 'V')  " + &
	"  drop view view_pd_basic "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  view_pd_basic " + &
	"as select    pd_basic.rec_id,pd_basic.prac_id,pd_basic.first_name,pd_basic.last_name,pd_basic.middle_name,pd_basic.title,title_code=code_lookup_a.code,title_description=code_lookup_a.description,pd_basic.name_suffix,name_suffix_code=code_lookup_b.code,name_suffix_description=code_lookup_b.description,pd_basic.prof_suffix,prof_suffix_code=code_lookup_c.code,prof_suffix_description=code_lookup_c.description,pd_basic.date_of_birth,pd_basic.ssn,pd_basic.sex,gender_code=code_lookup_d.code,gender_description=code_lookup_d.description,pd_basic.prac_category,prac_category_code=code_lookup_e.code,prac_category_description=code_lookup_e.description,pd_basic.maiden_other_name,pd_basic.pob_city,pd_basic.pob_state,pd_basic.pob_country,pd_basic.citizenship,pd_basic.married,pd_basic.spouse_name,pd_basic.phone,pd_basic.answering_service,pd_basic.beeper_1,pd_basic.beeper_2,pd_basic.personal_pager,pd_basic.hospital_pager,pd_basic.car_phone_1,pd_basic.car_phone_2,pd_basic.civilian_fed_employee,pd_basic.active_military,pd_basic.reservist,pd_basic.branch,pd_basic.rank,pd_basic.service_number,pd_basic.service_date_from,pd_basic.service_date_to,pd_basic.cust_1,pd_basic.cust_2,pd_basic.cust_3,pd_basic.cust_4,pd_basic.cust_5,pd_basic.cust_6,pd_basic.cust_7,pd_basic.cust_8,pd_basic.cust_9,pd_basic.cust_10,pd_basic.full_name,pd_basic.npdb_query,pd_basic.provider_id,pd_basic.provider_type from((pd_basic left outer join code_lookup as code_lookup_b on pd_basic.name_suffix = code_lookup_b.lookup_code) left outer join code_lookup as code_lookup_d on pd_basic.sex = code_lookup_d.lookup_code),code_lookup as code_lookup_a,code_lookup as code_lookup_c,code_lookup as code_lookup_e where(pd_basic.title = code_lookup_a.lookup_code) and(pd_basic.prof_suffix = code_lookup_c.lookup_code) and(pd_basic.prac_category = code_lookup_e.lookup_code)  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_contract_group_linked_locations' and type = 'V')  " + &
	"  drop view v_contract_group_linked_locations "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_contract_group_linked_locations " + &
	"as~r~n" + &
	"SELECT group_practice.rec_id,~r~n" + &
	"       group_practice.practice_type,~r~n" + &
	"       group_practice.street,~r~n" + &
	"       group_practice.street_2,~r~n" + &
	"       group_practice.city,~r~n" + &
	"       group_practice.state,~r~n" + &
	"       group_practice.zip,~r~n" + &
	"       group_practice.tax_id,~r~n" + &
	"       group_practice.mailing_address,~r~n" + &
	"       group_practice.contact_person,~r~n" + &
	"       group_practice.business_mgr,~r~n" + &
	"       group_practice.suite_apart,~r~n" + &
	"       group_practice.office_mgr,~r~n" + &
	"       group_practice.county,~r~n" + &
	"       group_practice.phone,~r~n" + &
	"       group_practice.fax,~r~n" + &
	"       group_practice.country,~r~n" + &
	"       group_practice.web_address,~r~n" + &
	"       group_practice.tax_id_other_1,~r~n" + &
	"       group_practice.e_mail_address,~r~n" + &
	"       group_practice.tax_id_other_2,~r~n" + &
	"       group_practice.cust_1,~r~n" + &
	"       group_practice.cust_2,~r~n" + &
	"       group_practice.cust_3,~r~n" + &
	"       group_practice.cust_4,~r~n" + &
	"       group_practice.cust_5,~r~n" + &
	"       ctx_loc.ctx_id,~r~n" + &
	"       ctx_loc.parent_comp_id,~r~n" + &
	"       ctx_loc.loc_id,~r~n" + &
	"       ctx_loc.group_number,~r~n" + &
	"       ctx_loc.local,~r~n" + &
	"       ctx_loc.end_date,~r~n" + &
	"       ctx_loc.term_reason,~r~n" + &
	"       ctx_loc.start_date,~r~n" + &
	"       ctx_loc.custom_1,~r~n" + &
	"       ctx_loc.custom_2,~r~n" + &
	"       ctx_loc.custom_3,~r~n" + &
	"       ctx_loc.custom_4,~r~n" + &
	"       ctx_loc.inserted_by_user,~r~n" + &
	"       ctx_loc.inserted_at_date_time,~r~n" + &
	"       ctx_loc.updated_by_user,~r~n" + &
	"       ctx_loc.updated_at_date_time,~r~n" + &
	"       ctx_loc.record_id~r~n" + &
	"  FROM group_practice,ctx_loc~r~n" + &
	" WHERE ctx_loc.loc_id = group_practice.rec_id~r~n"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_action_items' and type = 'V')  " + &
	"  drop view v_ctx_action_items "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_action_items " + &
	"as SELECT    " + &
	"	ctx_action_items.ctx_action_item_id, " + &
	"	ctx_action_items.ctx_id, " + &
	"	ctx_action_items.action_type, " + &
	"	ctx_action_items.action_date, " + &
	"	ctx_action_items.due_date, " + &
	"	ctx_action_items.action_user, " + &
	"	ctx_action_items.action_status, " + &
	"	ctx_action_items.notes, " + &
	"	ctx_action_items.ALARMED, " + &
	"	ctx_action_items.first_attempt, " + &
	"	ctx_action_items.last_attempt, " + &
	"	ctx_action_items.no_attempts, " + &
	"	ctx_action_items.assigned_to, " + &
	"	ctx_action_items.print_flag, " + &
	"	ctx_action_items.inserted_by_user, " + &
	"	ctx_action_items.inserted_at_date_time, " + &
	"	ctx_action_items.updated_by_user, " + &
	"	ctx_action_items.updated_at_date_time, " + &
	"	ctx_action_items.record_id, " + &
	"	ctx_action_items.Letter_flag, " + &
	"	ctx_action_items.letter_to, " + &
	"	ctx_action_items.letter_from, " + &
	"	ctx_action_items.wf_step, " + &
	"	ctx_action_items.letter_id, " + &
	"	ctx_action_items.wf_id, " + &
	"	ctx_action_items.Wf_action_type_id, " + &
	"	ctx_action_items.wf_assigned_by, " + &
	"	ctx_action_items.active_status, " + &
	"	ctx_action_items.wf_complete_flag, " + &
	"	ctx_action_items.alm_table, " + &
	"	ctx_action_items.alm_column " + &
	"FROM 	ctx_action_items "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_basic_info_master_link' and type = 'V')  " + &
	"  drop view v_ctx_basic_info_master_link "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_basic_info_master_link " + &
	"as SELECT    CTX_BASIC_INFO.ctx_id, app_facility.facility_name AS Company_Name, app_facility.street AS Company_street_1,app_facility.street_2 AS Company_street_2,app_facility.city AS Company_city,app_facility.state AS Company_state,app_facility.zip AS Company_zip,app_facility.country AS Company_country,app_facility.phone AS Company_phone,app_facility.fax AS Company_fax,app_facility.web_address AS Company_web_address,app_facility.contact_type2 AS Company_contact_type2,app_facility.corp_office_flag AS Company_corp_office_flag,app_facility.corp_office_link AS Company_corp_office_link,code_lookup.code AS Contract_Category_code, code_lookup.description AS Contract_Category_description, code_lookup_1.code AS Contract_Status_code, code_lookup_2.code AS contract_type_code, code_lookup_2.description AS contract_type_Description, CTX_BASIC_INFO.effective_date, CTX_BASIC_INFO.expriation_date, CTX_BASIC_INFO.review_date, CTX_BASIC_INFO.review_by, CTX_BASIC_INFO.term_date, code_lookup_3.code AS term_reason_code, code_lookup_3.description AS term_Reason_Desciption, CTX_BASIC_INFO.other_date_1, CTX_BASIC_INFO.other_date_2, CTX_BASIC_INFO.notes, CTX_BASIC_INFO.custom_1, CTX_BASIC_INFO.custom_2, CTX_BASIC_INFO.custom_3, CTX_BASIC_INFO.custom_4, CTX_BASIC_INFO.custom_5, CTX_BASIC_INFO.custom_6, CTX_BASIC_INFO.custom_7, CTX_BASIC_INFO.custom_8, CTX_BASIC_INFO.custom_9, CTX_BASIC_INFO.custom_10, CTX_BASIC_INFO.last_revis_date, code_lookup_4.description AS product_type_desc, code_lookup_4.code AS product_type_code, code_lookup_5.code AS product_code, code_lookup_5.description AS product_description FROM (((((((CTX_BASIC_INFO LEFT OUTER JOIN code_lookup ON CTX_BASIC_INFO.category = code_lookup.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_1 ON CTX_BASIC_INFO.status = code_lookup_1.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_2 ON CTX_BASIC_INFO.contract_type = code_lookup_2.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_3 ON CTX_BASIC_INFO.term_reason = code_lookup_3.lookup_code) INNER JOIN app_facility ON CTX_BASIC_INFO.app_facility = app_facility.facility_id) INNER JOIN ctx_products ON CTX_BASIC_INFO.ctx_id = ctx_products.ctx_id) LEFT OUTER JOIN code_lookup AS code_lookup_4 ON ctx_products.product_type = code_lookup_4.lookup_code) LEFT OUTER JOIN code_lookup AS code_lookup_5 ON ctx_products.product_id = code_lookup_5.lookup_code  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_non_medical_fee_schedule' and type = 'V')  " + &
	"  drop view v_ctx_non_medical_fee_schedule "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_non_medical_fee_schedule " + &
	"as SELECT     ctx_fee_sched_nm.ctx_id,  ctx_fee_sched_nm.fee_sched_nm_id, code_lookup1.code as category, code_lookup2.code as service_item, ctx_fee_sched_nm.description, ctx_fee_sched_nm.fee, code_lookup3.code as item_status, ctx_fee_sched_nm.start_date, ctx_fee_sched_nm.end_date, ctx_fee_sched_nm.service_name, ctx_fee_sched_nm.custom_int1, ctx_fee_sched_nm.custom_int2, ctx_fee_sched_nm.custom_fee1, ctx_fee_sched_nm.custom_fee2, ctx_fee_sched_nm.custom_fee3, ctx_fee_sched_nm.custom_text1, ctx_fee_sched_nm.custom_text2, ctx_fee_sched_nm.custom_text3, ctx_fee_sched_nm.notes, ctx_fee_sched_nm.record_id, code_lookup4.code as billing_cycle, ctx_fee_sched_nm.custom_text4, ctx_fee_sched_nm.custom_text5, ctx_fee_sched_nm.custom_text6, ctx_fee_sched_nm.custom_text7, ctx_fee_sched_nm.custom_text8, ctx_fee_sched_nm.custom_n1, ctx_fee_sched_nm.custom_n2,  ctx_fee_sched_nm.custom_n3,  ctx_fee_sched_nm.custom_n4,  ctx_fee_sched_nm.custom_n5  FROM ((((ctx_fee_sched_nm LEFT OUTER JOIN code_lookup AS code_lookup1 ON ctx_fee_sched_nm.category = code_lookup1.lookup_code and code_lookup1.lookup_name = 'Contract Fee Schd Cat. (NM)' ) LEFT OUTER JOIN code_lookup AS code_lookup2 ON ctx_fee_sched_nm.service_item = code_lookup2.lookup_code and code_lookup2.lookup_name = 'Contract Service (NM)') LEFT OUTER JOIN code_lookup AS code_lookup3 ON ctx_fee_sched_nm.item_status = code_lookup3.lookup_code and code_lookup3.lookup_name = 'Contract Fee Sched Stat. (NM)') LEFT OUTER JOIN code_lookup AS code_lookup4 ON ctx_fee_sched_nm.billing_cycle = code_lookup4.lookup_code and code_lookup4.lookup_name = 'Contract Billing Cycle')  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_group_location_parent_org' and type = 'V')  " + &
	"  drop view v_group_location_parent_org "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_group_location_parent_org " + &
	"AS " + &
	"SELECT        rec_id AS parent_org_id, gp_name AS parent_org_name, street1, street2, city, state, phone, zip, contact_name, info1 AS tax_id, info2 AS custom_1,  " + &
	"                      info3 AS custom_2, info4 AS custom_3, info5 AS custom_4, info6 AS custom_5 " + &
	"FROM         group_multi_loc "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_invoice_inventory' and type = 'V')  " + &
	"  drop view v_invoice_inventory "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_invoice_inventory " + &
	"AS " + &
	"SELECT        invt_id AS inventory_id, description, code, cost, price " + &
	"FROM         invt_items "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_meeting_attendence_v6' and type = 'V')  " + &
	"  drop view v_meeting_attendence_v6 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_meeting_attendence_v6 " + &
	"AS " + &
	"SELECT        attendence.meeting_id, attendence.prac_id, LTRIM(RTRIM(ISNULL(pd_basic.last_name, ''))) + ', ' + ISNULL(pd_basic.first_name, '')  " + &
	"                      + ' ' + SUBSTRING(ISNULL(pd_basic.middle_name, ''), 1, 1) + CASE WHEN isnull(pd_basic.middle_name, '')  " + &
	"                      = '' THEN '' ELSE '.,' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), ''))) + CASE WHEN isnull " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.name_suffix = code_lookup.lookup_code), '') = '' THEN '' ELSE ', ' END + LTRIM(RTRIM(ISNULL " + &
	"                          ((SELECT     code " + &
	"                              FROM         code_lookup " + &
	"                              WHERE     pd_basic.prof_suffix = code_lookup.lookup_code), ''))) AS practitioner_name, attendence.active_status,  " + &
	"                      CASE WHEN attendence.active_status = 1 THEN 'Active' ELSE 'Inactive' END AS active_status_description,  " + &
	"                      cl_attendence_status.code AS attendence_status_code, cl_attendence_status.description AS attendence_status_description " + &
	"FROM         attendence INNER JOIN " + &
	"                      code_lookup cl_attendence_status ON attendence.attendence_status = cl_attendence_status.lookup_code INNER JOIN " + &
	"                      pd_basic ON attendence.prac_id = pd_basic.prac_id "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_affil_dept' and type = 'V')  " + &
	"  drop view v_affil_dept "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_affil_dept " + &
	"AS " + &
	"SELECT DISTINCT    " + &
	"                      pd_affil_dept.rec_id, pd_affil_dept.prac_id, pd_affil_dept.facility_id, facility.facility_name, code_lookup_a.lookup_code AS dept_id,  " + &
	"                      code_lookup_a.code AS dept_code, code_lookup_a.description AS dept_name, code_lookup_b.code AS section_code,  " + &
	"                      code_lookup_b.description AS section_name, code_lookup_d.code AS division_code, code_lookup_d.description AS division_name,  " + &
	"                      pd_affil_dept.primary_dept, pd_affil_dept.from_date, pd_affil_dept.to_date, pd_affil_dept.active_status,  " + &
	"                      CASE WHEN pd_affil_dept.primary_dept = 1 THEN 'Yes' ELSE 'No' END AS primary_dept_description,  " + &
	"                      CASE WHEN pd_affil_dept.primary_dept = 1 THEN 'Y' ELSE 'N' END AS primary_dept_code " + &
	"FROM         pd_affil_dept INNER JOIN " + &
	"                      facility ON pd_affil_dept.facility_id = facility.facility_id INNER JOIN " + &
	"                      code_lookup code_lookup_a ON pd_affil_dept.department = code_lookup_a.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_b ON pd_affil_dept.section = code_lookup_b.lookup_code LEFT OUTER JOIN " + &
	"                      code_lookup code_lookup_d ON pd_affil_dept.rank = code_lookup_d.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_loc_covering_partners' and type = 'V')  " + &
	"  drop view v_ctx_loc_covering_partners "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_loc_covering_partners " + &
	"AS SELECT    " + &
	"      gp_partner_covering.rec_id, gp_partner_covering.gp_id, gp_partner_covering.prac_id, cl_title.code AS title_code,  " + &
	"      cl_title.description AS title_description, gp_partner_covering.last_name, gp_partner_covering.first_name,  " + &
	"      cl_provider_type.code AS provider_type_code, cl_provider_type.description AS provider_type_description, cl_specialty.code AS specialty_code,  " + &
	"      cl_specialty.description AS specialty_description, cl_covering.code AS covering_code, cl_covering.description AS covering_description,  " + &
	"      cl_partner.code AS partner_code, cl_partner.description AS partner_description, gp_partner_covering.license_no AS license_number,  " + &
	"      cl_license_state.code AS license_state_code, cl_license_state.description AS license_state_description, gp_partner_covering.cust_1,  " + &
	"      gp_partner_covering.cust_2, gp_partner_covering.cust_3, gp_partner_covering.cust_d4, gp_partner_covering.cust_d5,  " + &
	"      gp_partner_covering.specialty, gp_partner_covering.provider_type, gp_partner_covering.covering, gp_partner_covering.partner,  " + &
	"      gp_partner_covering.title_code AS Expr1, gp_partner_covering.middle_name " + &
	"FROM  gp_partner_covering LEFT OUTER JOIN " + &
	"      code_lookup cl_covering ON cl_covering.lookup_code = gp_partner_covering.covering LEFT OUTER JOIN " + &
	"      code_lookup cl_title ON cl_title.lookup_code = gp_partner_covering.title_code LEFT OUTER JOIN " + &
	"      code_lookup cl_license_state ON gp_partner_covering.license_state = cl_license_state.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_partner ON gp_partner_covering.partner = cl_partner.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_provider_type ON gp_partner_covering.provider_type = cl_provider_type.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_specialty ON cl_specialty.lookup_code = gp_partner_covering.specialty "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_loc_insurance' and type = 'V')  " + &
	"  drop view v_ctx_loc_insurance "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_loc_insurance " + &
	"AS SELECT      " + &
	"      gp_insurance.rec_id, gp_insurance.gp_id, gp_insurance.carrier_code, address_lookup.entity_name AS carrier,  " + &
	"      gp_insurance.policy_number, gp_insurance.coverage_from, gp_insurance.coverage_to, gp_insurance.previous_expiration_date,  " + &
	"      gp_insurance.tail_coverage, cl_tail_coverage.code AS tail_coverage_code, cl_tail_coverage.description AS tail_coverage_description,  " + &
	"      gp_insurance.coverage_limit_from, gp_insurance.coverage_limit_to, gp_insurance.state_funded_pool,  " + &
	"      cl_state_funded.code AS state_funded_pool_code, cl_state_funded.description AS state_funded_pool_description, gp_insurance.state_coverage,  " + &
	"      cl_state_coverage.code AS state_coverage_code, cl_state_coverage.description AS state_coverage_description, gp_insurance.exclusions,  " + &
	"      gp_insurance.cust_1, gp_insurance.cust_2, gp_insurance.cust_3, gp_insurance.cust_d4, gp_insurance.cust_d5,  " + &
	"      gp_insurance.claims_made_occurrence, gp_insurance.denied_explain, gp_insurance.active_status, gp_insurance.prac_id " + &
	"FROM  gp_insurance LEFT OUTER JOIN " + &
	"      code_lookup cl_state_coverage ON gp_insurance.state_coverage = cl_state_coverage.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_state_funded ON gp_insurance.state_funded_pool = cl_state_funded.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_tail_coverage ON gp_insurance.tail_coverage = cl_tail_coverage.lookup_code LEFT OUTER JOIN " + &
	"      address_lookup ON gp_insurance.carrier_code = address_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_loc_language' and type = 'V')  " + &
	"  drop view v_ctx_loc_language "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_loc_language " + &
	"AS SELECT      " + &
	"      gp_language.rec_id, gp_language.gp_id, gp_language.prac_id, cl_language.code AS language_code,  " + &
	"      cl_language.description AS language_description, cl_speak.code AS speak_code, cl_speak.description AS speak_description,  " + &
	"      cl_reads.code AS reads_code, cl_reads.description AS reads_description, cl_writes.code AS writes_code, cl_writes.description AS writes_description,  " + &
	"      cl_sign.code AS sign_code, cl_sign.description AS sign_description, gp_language.cust_1, gp_language.cust_2, gp_language.cust_3,  " + &
	"      gp_language.cust_d4, gp_language.cust_d5 " + &
	"FROM  gp_language left OUTER JOIN code_lookup cl_sign on (cl_sign.lookup_code = gp_language.sign)  " + &
	"            left  OUTER JOIN code_lookup cl_reads on (cl_reads.lookup_code = gp_language.reads ) " + &
	"            left  OUTER JOIN code_lookup cl_language ON gp_language.foreign_language = cl_language.lookup_code   " + &
	"            LEFT OUTER JOIN  code_lookup cl_speak ON gp_language.speak = cl_speak.lookup_code  " + &
	"            LEFT OUTER JOIN  code_lookup cl_writes ON gp_language.writes = cl_writes.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_loc_other_ids' and type = 'V')  " + &
	"  drop view v_ctx_loc_other_ids "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_loc_other_ids " + &
	"AS SELECT      " + &
	"      gp_other_ids.rec_id, gp_other_ids.gp_id, gp_other_ids.prac_id, code_lookup.code AS id_type_code,  " + &
	"      code_lookup.description AS id_type_description, gp_other_ids.id_number, gp_other_ids.exp_date, gp_other_ids.cust_1,  " + &
	"      gp_other_ids.cust_2, gp_other_ids.cust_3, gp_other_ids.cust_d4, gp_other_ids.cust_d5 " + &
	"FROM  gp_other_ids INNER JOIN " + &
	"      code_lookup ON gp_other_ids.id_type = code_lookup.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_loc_practice_info' and type = 'V')  " + &
	"  drop view v_ctx_loc_practice_info "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_loc_practice_info " + &
	"AS SELECT      " + &
	"      gp_practice_info.rec_id, gp_practice_info.gp_id, gp_practice_info.prac_id, gp_practice_info.corporate_name,  " + &
	"      gp_practice_info.start_date, gp_practice_info.check_payable, gp_practice_info.billing_dept,  " + &
	"      cl_after_hours_coverage.description AS after_hours_coverage, cl_after_hours_type.description AS after_hours_type,  " + &
	"      gp_practice_info.after_hours_number, cl_pref_contact_method.description AS preferred_contact_method,  " + &
	"      cl_primary_tax_id.description AS primary_tax_id, cl_gender_limitations.description AS gender_limitations, gp_practice_info.min_age,  " + &
	"      gp_practice_info.max_age, gp_practice_info.other_limitations, gp_practice_info.other_handi_access,  " + &
	"      gp_practice_info.other_disability_service, gp_practice_info.other_trans_access, gp_practice_info.cust_1, gp_practice_info.cust_2,  " + &
	"      gp_practice_info.cust_3, gp_practice_info.cust_4, gp_practice_info.cust_5, gp_practice_info.cust_d1,  " + &
	"      gp_practice_info.cust_d2 " + &
	"FROM gp_practice_info LEFT OUTER JOIN code_lookup cl_after_hours_coverage ON cl_after_hours_coverage.lookup_code = gp_practice_info.after_hours_coverage " + &
	"                      LEFT OUTER JOIN code_lookup cl_pref_contact_method ON cl_pref_contact_method.lookup_code = gp_practice_info.prefered_contact_method " + &
	"                      LEFT OUTER JOIN code_lookup cl_gender_limitations ON gp_practice_info.gender_limitations = cl_gender_limitations.lookup_code  " + &
	"                      LEFT OUTER JOIN code_lookup cl_primary_tax_id ON gp_practice_info.primary_tax_id = cl_primary_tax_id.lookup_code  " + &
	"                      LEFT OUTER JOIN code_lookup cl_after_hours_type ON gp_practice_info.after_hours_type = cl_after_hours_type.lookup_code  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_loc_questions' and type = 'V')  " + &
	"  drop view v_ctx_loc_questions "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_loc_questions " + &
	"AS SELECT      " + &
	"      gp_questions.rec_id, gp_questions.gp_id, gp_questions.prac_id, gp_questions.question_id,  " + &
	"      cl_question_type.description AS quest_type, question_lookup.short_quest, question_lookup.full_quest, cl_answer.description AS answer,  " + &
	"      gp_questions.follow_up, gp_questions.followup_2 " + &
	"FROM  gp_questions INNER JOIN " + &
	"      question_lookup ON gp_questions.question_id = question_lookup.quest_id LEFT OUTER JOIN " + &
	"      code_lookup cl_question_type ON question_lookup.quest_type = cl_question_type.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_answer ON gp_questions.answer_code = cl_answer.lookup_code "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_locations' and type = 'V')  " + &
	"  drop view v_ctx_locations "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_locations " + &
	"AS SELECT    " + &
	"      gp.rec_id AS gp_id, cl_address_type.code AS address_type_code, cl_address_type.description AS address_type_description,  " + &
	"      gp.street, gp.street_2, gp.city, cl_state.code AS state, gp.zip, cl_county.description AS county, cl_country.description AS country, gp.phone, gp.ext,  " + &
	"      gp.fax, gp.pager_number, gp.web_address, gp.e_mail_address, gp.contact_person, gp.business_mgr, gp.office_mgr, gp.tax_id, gp.tax_id_other_1,  " + &
	"      gp.tax_id_other_2, cl_accepting_new_patients.description AS accepting_new_patients, gp.cust_1, gp.cust_2, gp.cust_3, gp.cust_4, gp.cust_5,  " + &
	"      gp.cust_6, gp.active_status, cl_practice_type.description AS practice_type, gp.routine_visit_appt, gp.urgent_visit_appt, gp.emergency_visit_appt,  " + &
	"      gp.non_emergency_appt, cl_young_child.description AS young_child, cl_child.description AS child, cl_adolescent.description AS adolescent,  " + &
	"      cl_adult.description AS adult, cl_senior_adult.description AS senior_adult, cl_handicapped_access.description AS handicapped_access,  " + &
	"      cl_public_transportation.description AS public_transportation, cl_office_in_home.description AS office_in_home, gp.mon_from, gp.mon_to,  " + &
	"      gp.mon_from2, gp.mon_to2, gp.tue_from, gp.tue_to, gp.tue_from2, gp.tue_to2, gp.wed_from, gp.wed_to2, gp.wed_from2, gp.wed_to, gp.thu_from,  " + &
	"      gp.thu_to, gp.thu_from2, gp.thu_to2, gp.fri_from, gp.fri_to, gp.fri_from2, gp.fri_to2, gp.sat_from, gp.sat_to, gp.sat_from2, gp.sat_to2, gp.sun_from,  " + &
	"      gp.sun_from2, gp.sun_to, gp.sun_to2, gp.prac_id, gp.suite_apart " + &
	"FROM  group_practice gp LEFT OUTER JOIN " + &
	"      code_lookup cl_address_type ON gp.mailing_address = cl_address_type.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_accepting_new_patients ON gp.accepting_new_patients = cl_accepting_new_patients.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_adult ON gp.adult = cl_adult.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_adolescent ON gp.adolescent = cl_adolescent.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_child ON gp.child = cl_child.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_country ON gp.country = cl_country.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_county ON gp.county = cl_county.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_handicapped_access ON gp.handicapped_access = cl_handicapped_access.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_office_in_home ON gp.office_in_home = cl_office_in_home.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_practice_type ON gp.practice_type = cl_practice_type.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_public_transportation ON gp.public_transportation = cl_public_transportation.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_senior_adult ON gp.senior_adult = cl_senior_adult.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_state ON gp.state = cl_state.lookup_code LEFT OUTER JOIN " + &
	"      code_lookup cl_young_child ON gp.young_child = cl_young_child.lookup_code "
of_execute_sqls("of_ver70_release_view2")

RETURN 1

end function

public function integer of_ver70_release_view3 ();RETURN 1
end function

public function integer of_ver70_release_view4 ();RETURN 1
end function

public function integer of_ver60_release_table1 ();is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='pd_work_gap' " + &
	"            and   type = 'U') " + &
	"Create TABLE pd_work_gap ( rec_id numeric(10,0) not null, prac_id numeric(10,0) not null, start_date timestamp null, end_date timestamp null, reason_code numeric(10,0) null, gap_type numeric(10,0) null, gap_reason varchar(255)  null,     primary key (rec_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='gp_practice_info' " + &
	"            and   type = 'U') " + &
	"Create table gp_practice_info ( rec_id numeric(10,0) not null, prac_id numeric(10,0) not null, start_date timestamp null, check_payable varchar(40) null, gender_limitations numeric(10,0) null, min_age integer null, max_age integer null, billing_dept varchar(40) null , other_limitations varchar(255) null, cust_1 varchar(150) null,cust_2 varchar(150) null, cust_3 varchar(150) null, cust_4 varchar(150) null, cust_5 varchar(150) null,cust_d1 timestamp null, cust_d2 timestamp null, primary key (rec_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='sys_storage_area' " + &
	"            and   type = 'U') " + &
	"create table sys_storage_area ( area_id		integer		not null, area_name	varchar(30)	null, area_doc_path	varchar(150)	null, area_desc	varchar(150)	null, primary key(Area_id) ) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='sys_storage_docs' " + &
	"            and   type = 'U') " + &
	"create table sys_storage_docs ( area_id		integer		not null, doc_name	varchar(75)	not null, doc_type	varchar(1)		null,	doc_data	image		null, last_edit_date	datetime	null, user_id		varchar(10)	null, primary key(area_id, doc_name) ) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='app_blob' " + &
	"            and   type = 'U') " + &
	"create table app_blob ( app_id		numeric (10,0)	not null, app_image	image		null, primary key(app_id) ) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='pd_app_audit_temp' " + &
	"            and   type = 'U') " + &
	"create table  pd_app_audit_temp ( " + &
	"record_id            numeric(10)          not null, " + &
	"prac_id              numeric(6)           not null, " + &
	"facility_id          integer              not null, " + &
	"seq_no               integer              not null, " + &
	"app_audit_id         integer              not null, " + &
	"completed            varchar(1)              null, " + &
	"fax_message          varchar(255)         null, " + &
	"active_status        integer              null, " + &
	"date_completed       datetime             null, " + &
	"data_status          numeric(6)           null, " + &
	"notes                varchar(255)         null, " + &
	"identifying_number    varchar(50)          null, " + &
	"appt_stat_id         numeric(12)          null, " + &
	"conv_prac_id          varchar(20)          null, " + &
	"de_rec_id             numeric (10,0) null, " + &
	"primary key  (record_id)) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"    from  sysobjects " + &
	"   where  name='pd_review_export' " + &
	"    and   type = 'U') " + &
	"CREATE TABLE pd_review_export (	export_id decimal(16, 2) null,	prac_id decimal(16, 2) null,	review_id decimal(16, 2) null,	pd_review_id decimal(16, 2) null,	gp_id decimal(16, 2) null,	exported datetime null,	imported datetime null,	prac_name char(100) null,	review_name char(100) null,	street_1 char(150) null,	street_2 char(150) null,	city char(50) null,	state char(2) null,	zip char(12) null,	phone char(20) null,	contact_person char(50) null,	sent_to char(20) null,	sent_to_email char(100) null,	sent_by char(20) null,	doc_id char(25) null,	notes char(32767) null) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"    from  sysobjects " + &
	"   where  name='pd_review_isite' " + &
	"    and   type = 'U') " + &
	"CREATE TABLE pd_review_isite (	unique_id decimal(16, 1) null,	question_id float null,	review_id_hdr float null,	question char(255) null,	question_order float null,	group_id float null,	sub_group_id float null,	group_name char(150) null,	sub_group_name char(150) null,	review_id_quest float null,	answer_id float null,	question_answer char(100) null,	answer_score decimal(16, 1) null,	answer_order float null,	survey_rec_id decimal(16, 0) null,	review_type decimal(16, 0) null,	review_id_pd float null,	review_description char(100) null,	maximum_score float null,	minimum_passing_score float null,	site_rec_id decimal(16, 0) null,	question_answer_id decimal(16, 0) null,	answer_on_off float null,	score float null,	notes char(255) null,	street char(150) null,	city char(25) null,	state char(15) null,	zip char(11) null,	street_2 char(150) null) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='security_settings' " + &
	"            and   type = 'U') " + &
	"create table security_settings (exp_days integer not null, new_change_pw integer null, min_len integer null, must_have_num integer null, cant_use_last integer null, login_lockout integer null, lockout_min integer null, opt_1 integer null,opt_2 integer null, opt_3 integer null,opt_4 integer null, opt_5 integer null ) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists (select TOP 1 1 " + &
	"            from  sysobjects " + &
	"           where  name='priv_ccp_facility' " + &
	"            and   type = 'U') " + &
	"Create table priv_ccp_facility (ccp_id numeric(10,0) not null, clin_id numeric(10,0) not null, facility_id integer not null, primary key(ccp_id) ) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='description' " + &
	"     and t.table_name='pd_app_audit') " + &
	"alter table pd_app_audit add description varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='description' " + &
	"     and t.table_name='pd_app_audit_temp') " + &
	"alter table pd_app_audit_temp add description varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='app_type' " + &
	"     and t.table_name='pd_app_audit') " + &
	"alter table pd_app_audit add app_type varchar(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='app_type' " + &
	"     and t.table_name='pd_app_audit_temp') " + &
	"alter table pd_app_audit_temp add app_type varchar(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='caqh_lic_status' " + &
	"     and t.table_name='pd_license') " + &
	"ALTER TABLE pd_license add caqh_lic_status numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='caqh_grad_type' " + &
	"     and t.table_name='pd_education') " + &
	"ALTER TABLE pd_education add caqh_grad_type numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='cert_type' " + &
	"     and t.table_name='pd_cpr_certifiation') " + &
	"ALTER TABLE pd_cpr_certifiation add cert_type numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='expiration_date' " + &
	"     and t.table_name='pd_cpr_certifiation') " + &
	"ALTER TABLE pd_cpr_certifiation add expiration_date timestamp null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='certified' " + &
	"     and t.table_name='pd_cpr_certifiation') " + &
	"ALTER TABLE pd_cpr_certifiation add certified numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='issue_date' " + &
	"     and t.table_name='pd_dea_state_csr') " + &
	"ALTER TABLE pd_dea_state_csr add issue_date timestamp null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='used_another_name' " + &
	"     and t.table_name='pd_basic') " + &
	"Alter table pd_basic add used_another_name numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='start_another_name' " + &
	"     and t.table_name='pd_basic') " + &
	"Alter table pd_basic add start_another_name timestamp null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='end_another_name' " + &
	"     and t.table_name='pd_basic') " + &
	"Alter table pd_basic add end_another_name timestamp null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='not_certified_reason' " + &
	"     and t.table_name='pd_board_specialty') " + &
	"Alter table pd_board_specialty add not_certified_reason numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='exam_date' " + &
	"     and t.table_name='pd_board_specialty') " + &
	"Alter table pd_board_specialty add exam_date timestamp null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='send_corresp_here' " + &
	"     and t.table_name='pd_address') " + &
	"ALTER TABLE pd_address add send_corresp_here numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='unrestricted_privs' " + &
	"     and t.table_name='pd_hosp_affil') " + &
	"ALTER TABLE pd_hosp_affil add unrestricted_privs numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='pctg_admissions' " + &
	"     and t.table_name='pd_hosp_affil') " + &
	"ALTER TABLE pd_hosp_affil add pctg_admissions integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='dept_director' " + &
	"     and t.table_name='pd_hosp_affil') " + &
	"ALTER TABLE pd_hosp_affil add dept_director varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='org_issue_date' " + &
	"     and t.table_name='pd_insurance') " + &
	"Alter table pd_insurance add org_issue_date timestamp null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='self_insured' " + &
	"     and t.table_name='pd_insurance') " + &
	"Alter table pd_insurance add self_insured numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='shared_individ' " + &
	"     and t.table_name='pd_insurance') " + &
	"Alter table pd_insurance add shared_individ numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='coverage_unlimited' " + &
	"     and t.table_name='pd_insurance') " + &
	"Alter table pd_insurance add coverage_unlimited numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='suite_apart' " + &
	"     and t.table_name='pd_address') " + &
	"ALTER TABLE pd_address add suite_apart varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='license_no' " + &
	"     and t.table_name='gp_partner_covering') " + &
	"ALTER TABLE gp_partner_covering add license_no varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='license_state' " + &
	"     and t.table_name='gp_partner_covering') " + &
	"ALTER TABLE gp_partner_covering add license_state numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='prefered_contact_method' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add prefered_contact_method numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='primary_tax_id' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add primary_tax_id numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='corporate_name' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add corporate_name varchar(100) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='after_hours_number' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add after_hours_number varchar(15) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='after_hours_type' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add after_hours_type numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='after_hours_coverage' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add after_hours_coverage numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='gp_id' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add gp_id numeric(10,0)  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='follow_up' " + &
	"     and t.table_name='gp_questions') " + &
	"ALTER TABLE gp_questions add follow_up varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='followup_2' " + &
	"     and t.table_name='gp_questions') " + &
	"ALTER TABLE gp_questions add followup_2 varchar(50) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='carrier_lookup' " + &
	"     and t.table_name='pd_claims') " + &
	"Alter table pd_claims add carrier_lookup numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='result_in_death' " + &
	"     and t.table_name='pd_claims') " + &
	"Alter table pd_claims add result_in_death numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='case_included_npdb' " + &
	"     and t.table_name='pd_claims') " + &
	"Alter table pd_claims add case_included_npdb numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='primary_defendant' " + &
	"     and t.table_name='pd_claims') " + &
	"Alter table pd_claims add primary_defendant numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='judgement_for' " + &
	"     and t.table_name='pd_claims') " + &
	"Alter table pd_claims add judgement_for numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='resolution_method' " + &
	"     and t.table_name='pd_claims') " + &
	"Alter table pd_claims add resolution_method numeric(10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='num_defendant' " + &
	"     and t.table_name='pd_claims') " + &
	"ALTER TABLE pd_claims add num_defendant integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='policy_num' " + &
	"     and t.table_name='pd_claims') " + &
	"ALTER TABLE pd_claims add policy_num varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='other_handi_access' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add other_handi_access varchar(25)  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='other_disability_service' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add other_disability_service varchar(25)  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='other_trans_access' " + &
	"     and t.table_name='gp_practice_info') " + &
	"ALTER TABLE gp_practice_info add other_trans_access varchar(25)  null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='email_address' " + &
	"     and t.table_name='inv_company') " + &
	"alter table inv_company add email_address varchar(75) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='general_notes' " + &
	"     and t.table_name='inv_company') " + &
	"alter table inv_company add general_notes long varchar null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='downloadurl' " + &
	"     and t.table_name='icred_settings') " + &
	"Alter table icred_settings add downloadurl varchar(255) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='modify_date' " + &
	"     and t.table_name='app_blob') " + &
	"alter table app_blob add modify_date datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='modify_date' " + &
	"     and t.table_name='pd_images') " + &
	"ALTER TABLE pd_images ADD modify_date datetime null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.sysforeignkey  " + &
	"   where role='fk_ctx_fee__reference_code_loo_location')  " + &
	"alter table CTX_FEE_SCHED_LOCATIONS  delete foreign key fk_ctx_fee__reference_code_loo_location  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='image_flag' " + &
	"     and t.table_name='security_users') " + &
	"Alter table security_users add image_flag char(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='de_queue' " + &
	"     and t.table_name='pd_images') " + &
	"Alter table pd_images add de_queue integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='auto_generate' " + &
	"     and t.table_name='data_view_app_audit') " + &
	"Alter table data_view_app_audit add auto_generate integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='receive_from_de' " + &
	"     and t.table_name='data_view_app_audit') " + &
	"Alter table data_view_app_audit add receive_from_de integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='compl_other_facil' " + &
	"     and t.table_name='data_view_app_audit') " + &
	"Alter table data_view_app_audit add compl_other_facil integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='de_rec_id' " + &
	"     and t.table_name='pd_app_audit') " + &
	"Alter table pd_app_audit add de_rec_id numeric (10,0) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='notes' " + &
	"     and t.table_name='pd_app_audit') " + &
	"Alter table pd_app_audit modify notes text "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='miss_letter_90' " + &
	"     and t.table_name='facility') " + &
	"Alter table facility add miss_letter_90 integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='reap_user' " + &
	"     and t.table_name='facility') " + &
	"Alter table facility add reap_user integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='common_core' " + &
	"     and t.table_name='priv_clinical_area') " + &
	"Alter table priv_clinical_area add common_core integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='de_queue' " + &
	"     and t.table_name='image_type') " + &
	"Alter table image_type add de_queue integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='suite_apart' " + &
	"     and t.table_name='group_practice') " + &
	"Alter table group_practice add suite_apart varchar(50) null  "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify mon_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify mon_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify tue_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify tue_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify wed_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify wed_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify thu_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify thu_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify fri_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify fri_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify sat_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify sat_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify sun_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify sun_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify mon_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify mon_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify tue_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify tue_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify wed_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify wed_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify thu_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify thu_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify fri_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify fri_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify sat_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify sat_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify sun_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table pd_address modify sun_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify mon_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify mon_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify tue_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify tue_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify wed_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify wed_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify thu_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify thu_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify fri_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify fri_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify sat_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify sat_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify sun_from char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify sun_to char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify mon_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify mon_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify tue_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify tue_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify wed_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify wed_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify thu_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify thu_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify fri_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify fri_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify sat_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify sat_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify sun_from2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"alter table group_practice modify sun_to2 char(10) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE conv_view_where MODIFY table_field_name varchar(255) NOT NULL "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE conv_view_fields MODIFY field_x numeric( 5, 0) "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete From sys_fields where table_id = 54 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete From sys_fields where table_id = 56 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete from sys_tables where table_id = 54 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"Delete from sys_tables where table_id = 56 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='prod_id' " + &
	"     and t.table_name='security_modules') " + &
	"Alter table security_modules add prod_id integer null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists( " + &
	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  " + &
	"     and c.column_name='prod_id' " + &
	"     and t.table_name='security_sub_module') " + &
	"Alter table security_sub_module add prod_id integer null "


of_execute_sqls("of_ver60_release_table1")
RETURN 1

end function

public function integer of_ver60_patch_table1 ();
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  primary_office default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  exp_letters default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  include_in_directory default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  prac_correspondence default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  home_address default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  additional_office default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  mailing default  0 "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"ALTER TABLE pd_address_link MODIFY  billing  default  0 "
//==============================APPEON BEGIN==========================
// $<Deleted>:   Date: Feb 19,2008       Author:Nova
//--------------------------------------------------------------------
// $<reason>   Fix a defect.
//is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
//	"if not exists( " + &
//	"   select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
//	"   where c.table_id=t.table_id  " + &
//	"     and c.column_name='force_update' " + &
//	"     and t.table_name='ctx_screen') " + &
//	"alter table ctx_screen add force_update text null "
//==============================APPEON END============================
of_execute_sqls("of_ver60_patch_table1")
RETURN 1


end function

public function integer of_ver60_updates ();//Update SQL for ver 6.0

of_ver60_release_table1()
of_ver60_patch_table1()

RETURN 1
end function

public function integer of_ver70_updates ();//Update SQL for ver 7.0

of_ver70_release_table1()
of_ver70_release_table2()
of_ver70_release_table3()
of_ver70_release_table4()
of_ver70_patch_table1()
	


RETURN 1

end function

public function integer of_ver80_updates ();//Update SQL for ver 8.0

String ls_dev_type, ls_from_version

ls_dev_type = of_get_development()
ls_from_version = of_get_from_version()
//==============================APPEON BEGIN==========================
// $<Modified>:   Date: Feb 27,2008       Author:Nova
//--------------------------------------------------------------------
// $<reason>   Fix a defect.
//important: shield temporarily,when issue,must recover//Execute patch only if upgraded from current verison under non-develop mode
//IF ls_dev_type = '0' and gs_current_version = ls_from_version THEN
//	of_ver80_patch_table1()
//ELSE	
	of_ver80_release_table1()
	of_ver80_release_table2()
	of_ver80_patch_table1()
	
	
	//moved from  of_v70_updates by nova 2008-03-28
	//reason: BugN032701(WEB&PB  P2)
	of_ver70_release_view1()
	of_ver70_release_view2()
	of_ver70_release_view3()
	of_ver70_release_view4()
	of_ver80_release_view1()
	//added by Nova      2008-06-19
	//reason:  mail from Robert Goemans,subject:changes needed
	of_ver80_patch_view1()
	
	
//END IF
//==============================APPEON END==========================
RETURN 1
end function

public function integer of_ver80_patch_view1 ();is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_stausaudit' and type = 'V')  " + &
	"  drop view v_ctx_stausaudit "


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"CREATE VIEW v_ctx_stausaudit  " + &
"AS  " + &
"SELECT     a.ctx_id, a.seq_no, a.status, c.code AS status_code, c.description AS status_description, a.start_time, a.delay_days, a.user_id " + &
"FROM         sys_StatusAudit AS a LEFT OUTER JOIN  " + &
"             code_lookup AS c ON a.status = c.lookup_code " 

of_execute_sqls("of_ver80_patch_view1")

return 1
end function

public function integer of_ver85_release_table1 ();//Added by Alfee on 07.11.2008

//added by nova mail from andy 2008.07.11
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'app_image_defaults' and type = 'U')   " + &
"         Create table app_image_defaults    " + &
"         (   " + &
"                   app_image_id numeric (10,0) not null,   " + &
"                   app_id integer not null,    " + &
"                   image_type integer not null,     " + &
"                 constraint PK_app_image_defaults primary key (app_image_id)    " + &
"         )   " 


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'pd_photo' and type = 'U')   " + &
"CREATE TABLE pd_photo    " + &
"(      prac_id numeric(10,0) not null,    " + &
"       image_type varchar(10) null,    " + &
"       image_data image null ,   " + &
"        PRIMARY KEY (prac_id)    " + &
")    " 
//End Code Change---08.14.2008


//For License Agreement - Alfee 07.11.2008
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='lic_agr_img'  "+&
 "     and t.table_name='security_users')        "+&
"  ALTER table security_users add lic_agr_img integer null     "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='lic_agr_asa'  "+&
 "     and t.table_name='security_users')        "+&
"  ALTER table security_users add lic_agr_asa integer null     "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='data_status'  "+&
 "     and t.table_name='verif_info')        "+&
"Alter table verif_info add data_status integer null "

//For Screen - Evan 07.26.2008
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 " + &
"            from  sysobjects " + &
"           where  name='ctx_tabpage_properties' " + &
"            and   type = 'U') " + &
"create table ctx_tabpage_properties " + &
"( " + &
"data_view_id integer not null, " + &
"tabpage_name varchar(200) not null, " + &
"text varchar(100) null, " + &
"text_color integer null, " + &
"icon_visible char(1) null, " + &
"icon_update_date datetime, " + &
"icon image null, " + &
"constraint pk_ctx_tabpage_properties_id primary key (data_view_id, tabpage_name) " + &
") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='titlebar_visible'  "+&
 "     and t.table_name='ctx_screen')        "+&
"alter table ctx_screen add titlebar_visible char(1) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='titlebar_text'  "+&
 "     and t.table_name='ctx_screen')        "+&
"alter table ctx_screen add titlebar_text varchar(200) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='boarder_style'  "+&
 "     and t.table_name='ctx_screen')        "+&
"alter table ctx_screen add boarder_style varchar(20) null "
//Added by Nova on 2008-08-01 begin
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='phone'  "+&
 "     and t.table_name='dept_chair')        "+&
"ALTER TABLE dept_chair MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='fax'  "+&
 "     and t.table_name='dept_chair')        "+&
"ALTER TABLE dept_chair MODIFY fax varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='phone'  "+&
 "     and t.table_name='facility')        "+&
"ALTER TABLE facility MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='fax'  "+&
 "     and t.table_name='facility')        "+&
"ALTER TABLE facility MODIFY fax varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='phone'  "+&
 "     and t.table_name='organization')        "+&
"ALTER TABLE organization MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='fax'  "+&
 "     and t.table_name='organization')        "+&
"ALTER TABLE organization MODIFY fax varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='phone'  "+&
 "     and t.table_name='pd_review_export')        "+&
"ALTER TABLE pd_review_export MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='phone'  "+&
 "     and t.table_name='npdb_rpoc')        "+&
"ALTER TABLE npdb_rpoc MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='phone'  "+&
 "     and t.table_name='pd_address')        "+&
"ALTER TABLE pd_address MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='fax'  "+&
 "     and t.table_name='pd_address')        "+&
"ALTER TABLE pd_address MODIFY fax varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='phone'  "+&
 "     and t.table_name='pd_basic')        "+&
"ALTER TABLE pd_basic MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='phone'  "+&
 "     and t.table_name='address_lookup')        "+&
"ALTER TABLE address_lookup MODIFY phone varchar(25) null"

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if  exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='fax'  "+&
 "     and t.table_name='address_lookup')        "+&
"ALTER TABLE address_lookup MODIFY fax varchar(25) null"

//For contract notes - Evan 08.11.2008
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='notes' and t.table_name='ctx_basic_info') " + &
	"alter table ctx_basic_info modify notes varchar(8000) null "
//Added by Nova on 2008-08-13
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='return_phone' and t.table_name='facility') " + &
	"ALTER TABLE facility MODIFY return_phone varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='return_fax' and t.table_name='facility') " + &
	"ALTER TABLE facility MODIFY return_fax varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='npdb_cert_phone' and t.table_name='facility') " + &
	"ALTER TABLE facility MODIFY npdb_cert_phone varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='agent_phone' and t.table_name='npdb_agnt') " + &
	"ALTER TABLE npdb_agnt MODIFY agent_phone varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='cert_phone' and t.table_name='npdb_cert') " + &
	"ALTER TABLE npdb_cert MODIFY cert_phone varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='contact_phone' and t.table_name='app_hdr') " + &
	"ALTER TABLE app_hdr MODIFY contact_phone varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='pager_number' and t.table_name='pd_address') " + &
	"ALTER TABLE pd_address MODIFY pager_number varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='answering_service' and t.table_name='pd_basic') " + &
	"ALTER TABLE pd_basic MODIFY answering_service varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='beeper_1' and t.table_name='pd_basic') " + &
	"ALTER TABLE pd_basic MODIFY beeper_1 varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='beeper_2' and t.table_name='pd_basic') " + &
	"ALTER TABLE pd_basic MODIFY beeper_2 varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='car_phone_1' and t.table_name='pd_basic') " + &
	"ALTER TABLE pd_basic MODIFY car_phone_1 varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='car_phone_2' and t.table_name='pd_basic') " + &
	"ALTER TABLE pd_basic MODIFY car_phone_2 varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='personal_pager' and t.table_name='pd_basic') " + &
	"ALTER TABLE pd_basic MODIFY personal_pager varchar(25) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if exists(select TOP 1 1 from sys.syscolumn c, sys.systable t " + &
	"   where c.table_id=t.table_id  and c.column_name='hospital_pager' and t.table_name='pd_basic') " + &
	"ALTER TABLE pd_basic MODIFY hospital_pager varchar(25) null "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(  select 1 from sys.syscolumn c, sys.systable t    " + & 
"    where c.table_id=t.table_id and c.column_name='set_ver_tip' and t.table_name='icred_settings') " + &
"alter table icred_settings add  set_ver_tip integer null "

//-------Begin Add by Evan on 08.19.2008 -----------------------
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 " + &
"            from  sysobjects " + &
"           where  name='ctx_bidq' " + &
"            and   type = 'U') " + &
"create table ctx_bidq " + &
"( " + &
"bidq_id       integer identity not null, " + &
"bidq_name     varchar(100) null, " + &
"constraint    pk_ctx_bidq_id primary key (bidq_id) " + &
") "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 " + &
"            from  sysobjects " + &
"           where  name='ctx_bidq_doc' " + &
"            and   type = 'U') " + &
"create table ctx_bidq_doc " + &
"( " + &
"bidq_doc_id   integer identity not null, " + &
"bidq_id       integer not null, " + &
"doc_name      varchar(200) null, " + &
"doc_type      char(1) null, " + &
"category      integer null, " + &
"doc_from_name varchar(20) null, " + &
"filename      varchar(250) null, " + &
"proc_type     char(1) null, " + &
"notes         varchar(250) null, " + &
"image_file    image null, " + &
"image_text    text null, " + &
"constraint    pk_ctx_bidq_doc_id primary key (bidq_doc_id) " + &
") "
//--------End Add by Evan on 08.19.2008 ------------------------


//Added by Nova on 2008-08-19
//reason:dashborad table
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"If not exists( select 1 from sysobjects where name = 'dashboard_settings' ) " + &
   "      Create Table dashboard_settings " + &
   "      ( " + &
   "                id integer  not null, " + &
   "                title_bg_color numeric(10,0) null, " + &
   "                title_height numeric(10,0) null, " + &
   "                logo image null, " + &
   "                logo_org_height numeric(10,0) null, " + &
   "                logo_org_width numeric(10,0) null, " + &
   "                logo_extname varchar(3) null,   " + &
   "                logo_size numeric(10,0) null, " + &
   "                logo_verif_data varchar(20) null, " + &
   "                Primary Key(id) " + &
   "      ) " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'dashboard_gadgets_notes' and   type = 'U' and   type = 'U' ) " + &
"	Create Table dashboard_gadgets_notes " + &
"	( " + &
"	id numeric(10) identity not null, " + &
"	user_id varchar(50) not null, " + &
"	tab_id numeric(10) not null, " + &
"	notes varchar(200) null, " + &
"	back_color numeric(10) null, " + &
"	create_date datetime null, " + &
"	notes_x numeric(6) null,	 " + &
"	notes_y numeric(6) null, " + &
"	notes_width numeric(6) null, " + &
"	notes_height numeric(6) null, " + &
"	notes_order integer null,	 " + &
"	is_hide	 integer null, " + &
"	is_alwaysontop integer null, " + &
"	is_alarm integer null, " + &
"	alarm_date datetime null, " + &
"	is_alarmed integer null, " + &
"	Primary Key(id) " + &
"	) " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'dashboard_gadgets_favorite' and   type = 'U' ) " + &
"	Create Table dashboard_gadgets_favorite " + &
"	( " + &
"	id numeric(10) identity not null, " + &
"	user_id varchar(50) not null, " + &
"	data_id numeric(10) not null, " + &
"	favorite_type varchar(10) not null, " + &
"	Primary Key(id) " + &
"	) " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'dashboard_gadgets_recent' and   type = 'U' ) " + &
"	Create Table dashboard_gadgets_recent " + &
"	( " + &
"	id numeric(10) identity not null, " + &
"	user_id varchar(50) not null, " + &
"	data_id numeric(10) not null, " + &
"	data_ext_id numeric(10) null, " + &
"	access_date datetime not null,	 " + &
"	recent_type varchar(10) not null, " + &
"	Primary Key(id) " + &
"	) " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'dashboard_gadgets' and   type = 'U' ) " + &
	"Create Table dashboard_gadgets " + &
	"( " + &
	"	gadget_id  numeric(10,0) not null, " + &
	"	gadget_classname varchar(50) not null, " + &
	"	gadget_title varchar(50) not null, " + &
	"	gadget_auto_height integer not null,  " + &
	"	Primary Key(gadget_id) " + &
	") " 
	
	is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'dashboard_tabs' and   type = 'U') " + &
"	Create Table dashboard_tabs " + &
"	( " + &
"		tab_id  numeric(10,0) not null, " + &
"		user_id varchar(50) not null, " + &
"		tab_style varchar(2) not null, " + &
"		tab_style_type varchar(1) not null, " + &
"		tab_title varchar(50) not null, " + &
"		tab_bg_color numeric(10,0) null,	 " + &
"		gadget_title_color numeric(10,0) null, " + &
"		gadget_bg_color numeric(10,0) null, " + &
"		single_double_clk integer null default 1, " + &		
"		tab_locked integer null default 0,	 " + &
"		tab_order integer null, " + &
"		Primary Key(tab_id) " + &
"	) " 


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'dashboard_tab_gadgets' and   type = 'U' ) " + &
"	Create Table dashboard_tab_gadgets " + &
"	( " + &
"		tab_id  numeric(10,0) not null, " + &
"		area_number integer not null, " + &
"		gadget_id numeric(10,0) not null, " + &
"		gadget_maximize integer null default 1, " + &
"		gadget_title varchar(50) null,	 " + &
"		gadget_rows_number integer null, " + &
"		gadget_order integer null,		 " + &
"		Primary Key(tab_id,gadget_id) " + &
"	) " 


is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'dashboard_template_setting'and   type = 'U' ) " + &
"	Create Table dashboard_template_setting " + &
"	( " + &
"		id numeric(10,0) identity not null, " + &
"		template_name varchar(50) not null, " + &
"		tab_style varchar(2) not null, " + &
"		tab_style_type varchar(1) not null, " + &
"		tab_title varchar(50) null, " + &
"		area_number integer not null, " + &
"		gadget_id numeric(10,0) not null, " + &
"		gadget_order integer null,	 " + &
"		Primary Key(id) " + &
") " 
//Added by Nova on 2008-08-01 end

//For Date alarm enhancement on notification users - Alfee 08.20.2008
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       " + &
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       " + &
 "   where c.table_id=t.table_id        " + &
 "     and c.column_name='alm_mailto'  " + &
 "     and t.table_name='ctx_notification')        " + &
 " Alter table ctx_notification add alm_mailto varchar(2000) null "
 
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       " + &
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       " + &
 "   where c.table_id=t.table_id        " + &
 "     and c.column_name='alm_mailto'  " + &
 "     and t.table_name='ctx_ai_notification')        " + &
 " Alter table ctx_ai_notification add alm_mailto varchar(2000) null "
 
 is_sql_statements[UpperBound(is_sql_statements) + 1] =  &		
 " if not exists(       " + &
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       " + &
 "   where c.table_id=t.table_id        " + &
 "     and c.column_name='alm_mailto'  " + &
 "     and t.table_name='ctx_am_ai_notification')        " + &
 " Alter table ctx_am_ai_notification add alm_mailto varchar(2000) null "
 
 //

//Added by Nova on 2008-08-22
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'sys_recred_log'and   type = 'U' ) " + &
"Create table sys_recred_log    " + &
"(rec_id decimal(10,0) not null,   " + &
"prac_id decimal(10,0) null,   " + &
"facility_id decimal(10,0) null,   " + &
"seq_no decimal(10,0) null,    " + &
"date_run timestamp null,    " + &
"run_by varchar(25) null,    " + &
"run_type char(3) null,   " + &
"primary key (rec_id)   " + &
")   " 

//Added by Nova on 2008-08-26 profile report table
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'data_view_report_fields' and type = 'U')   " + &
"    create table data_view_report_fields    " + &
"(   " + &
"    data_view_field_id   numeric(10)                    not null,   " + &
"    data_view_id         int                            not null,   " + &
"    screen_id            int                            not null,   " + &
"    field_id             int                            not null,   " + &
"    field_label          varchar(255) null,   " + &
"    field_order          int null,   " + &
"    display_only         varchar(1) null,   " + &
"    required             varchar(1) null,   " + &
"    data_seperator       varchar(1) null,   " + &
"    seperator_hdr        varchar(25) null,   " + &
"    include_in_browse    varchar(1) null,   " + &
"    browse_tab_order     int null,   " + &
"    browse_tab_width     int null,   " + &
"    field_x              int null,   " + &
"    field_y              int null,   " + &
"    field_width          int null,   " + &
"    field_height         int null,   " + &
"    justification        varchar(1) null,   " + &
"    sys_table_id         int null,   " + &
"    sys_field_id         int null,   " + &
"    edit_field_type      varchar(2) null,   " + &
"    field_label_justification int  null , " + &
"    field_label_x        int null,   " + &
"    field_label_y        int null,   " + &
"    field_label_width    int null,   " + &
"    visible              varchar(1) null,   " + &
"    font_wieght          int null,   " + &
"    tab_address          int null,   " + &
"    back_address         int null,   " + &
"    label_underline      varchar(1) null,   " + &
"    field_underline      varchar(1) null,   " + &
"    field_font_italic    int null,   " + &
"    label_font_italic    int null,   " + &
"    label_font_weight    int null,   " + &
"    ismodify             char(1) null                        default '0',   " + &
"    report_from          char(1)  null                       default 'P',   " + &
"    profile_view_id      int  not null,   " + &
"    primary key (data_view_field_id, data_view_id,profile_view_id)   " + &
")"


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'data_view_report_objects' and type = 'U')   " + &
"    create table data_view_report_objects    " + &
"(   " + &
"    data_view_object_id  int                            not null,   " + &
"    data_view_id         int                            not null,   " + &
"    screen_id            int                            not null,   " + &
"    object_text          text null,   " + &
"    object_width         int null,   " + &
"    object_height        int null,   " + &
"    object_x             int null,   " + &
"    object_y             int null,   " + &
"    object_alignment     int null,   " + &
"    object_italic        int null,   " + &
"    object_bold          int null,   " + &
"    object_underline     int null,   " + &
"    object_color         numeric(6) null,   " + &
"    object_type          varchar(1) null,   " + &
"    object_justification int null,   " + &
"    report_from          char(1) null                        default 'P',   " + &
"    profile_view_id      int                            not null,   " + &
"    primary key (data_view_object_id)   " + &
")"


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'profile_report_dw' and type = 'U')   " + &
"    create table profile_report_dw    " + &
"(   " + &
"    id                   numeric(18)                    not null default autoincrement,   " + &
"    data_view_id         int null,   " + &
"    cur_dw               varchar(50) null,   " + &
"    prf_dw               varchar(50) null,   " + &
"    scr_dw               varchar(50) null,   " + &
"    prf_id               int null,   " + &
"    scr_id               int null,   " + &
"    table_id             int null,   " + &
"    report_id            int null,   " + &
"    dw_name              varchar(50) null,   " + &
"    retrieval_aruments   char(2) null,   " + &
"    profile_view_id      int                            not null,   " + &
"    primary key (id)   " + &
")"


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'screen_report_objects' and type = 'U')   " + &
"    create table screen_report_objects    " + &
"(   " + &
 "   data_view_object_id  int                            not null,   " + &
 "   data_view_id         int                            not null,   " + &
 "   screen_id            int                            not null,   " + &
 "   object_name          varchar(50) null,   " + &
 "   object_text          text null,   " + &
 "   object_width         int null,   " + &
 "   object_height        int null,   " + &
 "   object_x             int null,   " + &
 "   object_y             int null,   " + &
 "   object_alignment     int null,   " + &
 "   object_italic        int null,   " + &
 "   object_bold          int null,   " + &
 "   object_underline     int null,   " + &
 "   object_color         numeric(6) null,   " + &
 "   object_type          varchar(1) null,   " + &
 "   object_justification int null,   " + &
 "   report_from          char(1) null                        default 'P',   " + &
 "   visible              char(1) null,   " + &
 "   ismodify             char(1) null                        default '0',   " + &
 "   profile_view_id      int                            not null,   " + &
 "   primary key (data_view_object_id)   " + &
 ")"


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists (select TOP 1 1 from  sysobjects where  name = 'sys_report_fields' and type = 'U')   " + &
"    create table sys_report_fields    " + &
"(   " + &
"    table_id             int                            not null,   " + &
"    field_id             int                            not null,   " + &
"    field_order          int                            not null,   " + &
"    field_name           varchar(50)                    not null,   " + &
"    field_type           varchar(2)                     not null,   " + &
"    field_len            int                            not null,   " + &
"    field_name_allias    varchar(50) null,   " + &
"    field_case           varchar(1) null,   " + &
"    lookup_type          varchar(1) null,   " + &
"    lookup_field         varchar(1) null,   " + &
"    lookup_code          varchar(40) null,   " + &
"    lookup_field_name    varchar(50) null,   " + &
"    validate_against_lookup varchar(1) null,   " + &
"    field_mask           varchar(100) null,   " + &
"    valid_values         varchar(250) null,   " + &
"    range_from           int null,   " + &
"    range_to             int null,   " + &
"    audit_fld            varchar(1) null,   " + &
"    default_value        varchar(100) null,   " + &
"    micro_help           varchar(100) null,   " + &
"    key_field            varchar(1) null,   " + &
"    drop_down_width      int null,   " + &
"    app_fill_field_len   int null,   " + &
"    sort_field           int null,   " + &
"    sort_order           varchar(1) null,   " + &
"    use_validation       int null,   " + &
"    primary key (table_id, field_id)   " + &
")"
//Added by Nova on 2008-08-26 profile report table

//Added by Nova on 2008-08-26 dashboard
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"If not exists(      select 1 from sys.syscolumn c, sys.systable t   " + &
"	where c.table_id=t.table_id and c.column_name='readonly' and t.table_name='security_users')   " + &
"   ALTER table security_users add readonly integer null  "
//Added by Nova on 2008-08-26 dashboard


//Added by Nova on 2008-08-26 session
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"If not exists(      select 1 from sys.syscolumn c, sys.systable t    " + &  
"where c.table_id=t.table_id and c.column_name='license_info' and t.table_name='icred_settings')   " + &
"         ALTER table icred_settings add license_info varchar(30) null     " 

 
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"If not exists(      select 1 from sys.syscolumn c, sys.systable t      " + &
"where c.table_id=t.table_id and c.column_name='session_refresh_frequency' and t.table_name='icred_settings')   " + &
"         ALTER table icred_settings add session_refresh_frequency integer null    " 

 
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists( select 1 from sysobjects where name = 'session_info' )   " + &
"         Create Table session_info    " + &
"         (   " + &
"                   session_id  varchar(20) not null,   " + &
"                   user_id varchar(20) not null,   " + &
"                   client_ip varchar(20) null,    " + & 
"                   create_datetime datetime null,   " + &
"                   last_update_datetime datetime null,   " + &
"                   Primary Key(session_id)   " + &
"         )   "

is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"IF EXISTS (SELECT name FROM   sysobjects WHERE  name = 'up_update_session'  AND  type = 'P')     " + &  
    "DROP PROCEDURE up_update_session     " 


is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"CREATE PROCEDURE up_update_session     " + &  
"(     " + &  
"@as_session_id varchar(20),                " + &  
"@as_login_user       varchar(50),                    " + &  
"@as_client_ip varchar(20),                    " + &  
"@as_exec_type varchar(10)                   " + &  
")     " + &  
"AS     " + &  
"Begin     " + &  
"         Declare @ll_timeout numeric(5)     " + &  
"         Declare @ll_session_exist numeric(5)     " + &  
"         Declare @ld_current_datetime datetime     " + &  
"         Select @as_exec_type = Upper(@as_exec_type)     " + &  
"         Select Top 1 @ld_current_datetime =  getdate() From sysobjects     " + &  
"         Select @ll_timeout = session_refresh_frequency from icred_settings     " + &  
"        Delete From Session_Info Where Datediff(Second,last_update_datetime,@ld_current_datetime) > (@ll_timeout + 1) * 60     " + &  
"         If @as_exec_type = 'CREATE' or @as_exec_type = 'UPDATE'     " + &  
"                   Begin     " + &  
"                            Select @ll_session_exist = Count(*) From Session_Info Where session_id = @as_session_id     " + &  
"                            If @ll_session_exist = 0      " + &  
"                                     Begin     " + &  
"                                               Insert Into Session_Info Values(@as_session_id,@as_login_user,@as_client_ip,@ld_current_datetime,@ld_current_datetime)     " + &  
"                                     End     " + &  
"                            Else     " + &  
"                                     Begin     " + &  
"     " + &  
"                                               Update Session_Info Set last_update_datetime = @ld_current_datetime Where session_id = @as_session_id     " + &  
"                                     End     " + &  
"                   End     " + &  
"         Else IF @as_exec_type = 'DELETE'      " + &  
"                   Begin     " + &  
"                            If @as_session_id <> ''      " + &  
"                                     Delete From Session_Info Where session_id = @as_session_id     " + &  
"                   End     " + &  
"End     " 

//Added by Nova on 2008-08-26 session

//Added by Nova on 2008-08-29 message
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"If not exists( select 1 from sysobjects where name = 'dashboard_gadgets_message' and   type = 'U' )      " + &  
   "      Create Table dashboard_gadgets_message      " + &  
   "      (      " + &  
   "      id numeric(10) identity not null,      " + &  
   "      user_id varchar(50) not null,      " + &  
   "      message_body varchar(5000) null,      " + &  
   "      is_read integer null,      " + &  
   "      sender varchar(50) null,      " + &  
   "      send_to_roles varchar(2000) null,          " + &  
   "      send_to_users varchar(2000) null,        " + &  
   "      send_date datetime null default getdate(),      " + &  
   "      parent_message_id numeric(10) null,      " + &  
   "      root_message_id numeric(10) null,      " + &  
   "      Primary Key(id)      " + &  
   "      )      " 
//Added by Nova on 2008-08-29 message

//Added by Nova on 2008-09-10 dashboard
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"If not exists( select 1 from sysobjects where name = 'dashboard_gadgets_report_list' and   type = 'U'  )      " + &  
   "      Create Table dashboard_gadgets_report_list      " + &  
   "      (      " + &  
   "                id integer  not null,      " + &  
   "                report_name varchar(80) null,      " + &  
   "                Primary Key(id)      " + &  
   "      )      " 

is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"If not exists( select 1 from sysobjects where name = 'dashboard_gadgets_summary' and   type = 'U'  )      " + &  
   "      Create Table dashboard_gadgets_summary      " + &  
   "      (      " + &  
   "                id numeric(10) identity not null,      " + &  
   "                user_id varchar(50) not null,      " + &  
   "                tab_id       integer not null,      " + &  
   "                summary_id integer null,      " + &  
   "                report_id integer null,      " + &  
   "                is_graph integer null,      " + &  
   "                graph_type integer null,          " + &  
   "                Primary Key(id)      " + &  
   "      )      "
	
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"if not exists(      select 1 from sys.syscolumn c, sys.systable t      " + &  
   "      where c.table_id=t.table_id and c.column_name='set_dashboard' and t.table_name='security_users')   " + &  
"ALTER table security_users add set_dashboard integer null     "
	
//Added by Nova on 2008-09-10 dashboard

//Added by Nova on 2008-09-12 mail from maha subject new table
is_sql_statements[UpperBound(is_sql_statements) + 1] = &
	"If not exists( select 1 from sysobjects where name = 'sys_report_log' and   type = 'U'  )      " + &  
   "create table sys_report_log       " + &  
   "(      " + &  
   "log_id numeric(10,0) not null,      " + &  
   "report_id integer null,      " + &  
   "date_run datetime null,       " + &  
   "user_id varchar(30) null,       " + &  
   "primary key(log_id)      " + &  
   ")      "
//Added by Nova on 2008-09-12 mail from maha subject new table

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &                 
 " if not exists(       "+&
 "   select TOP 1 1 from sys.syscolumn c, sys.systable t       "+&
 "   where c.table_id=t.table_id        "+&
 "     and c.column_name='image_text'  "+&
 "     and t.table_name='ctx_acp_document')        "+&
"alter table ctx_acp_document add image_text text null "
	
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"IF EXISTS (select TOP 1 1 FROM SYSOBJECTS WHERE name='sp_contract_search' AND TYPE = 'P') " + &
	" DROP PROCEDURE sp_contract_search "

//This procedure was modified for no access control to contract by Alfee on 03.14.2008
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE  PROCEDURE sp_contract_search " + &
	"   @user_d VARCHAR(10)  " + &
	"  as  " + &
	"  BEGIN  " + &
	"    SELECT DISTINCT ctx_basic_info.app_facility,    " + &
	" 	 ctx_products.product_id product_code,    " + &
	"   code_lookup.code product_name,    " + &
	"   ctx_basic_info.effective_date,    " + &
	"   ctx_basic_info.expriation_date,    " + &
	"   ctx_basic_info.status,    " + &
	"   ctx_basic_info.group_multi_loc_id,    " + &
	"   ctx_basic_info.ctx_id,    " + &
	"   ctx_basic_info.master_contract_id,                           " + &
	"   master_cnt = (select count(ctx_basic_info1.ctx_id) from ctx_basic_info ctx_basic_info1 where ctx_basic_info.ctx_id = ctx_basic_info1.master_contract_id),                         " + &
	"   ctx_basic_info.category,     " + &
	"   ctx_basic_info.facility_id,    " + &
	"   ctx_basic_info.contract_type,    " + &
	"   code_lookup1.code product_type,    " + &
	"   ctx_basic_info.reimbursment_menth,    " + &
	"   ctx_basic_info.file_location,    " + &
	"   ctx_basic_info.review_date,    " + &
	"   ctx_basic_info.review_by,    " + &
	"   ctx_basic_info.term_date,    " + &
	"   ctx_basic_info.term_reason,    " + &
	"   ctx_basic_info.last_revis_date,    " + &
	"   ctx_basic_info.other_date_1,    " + &
	"   ctx_basic_info.other_date_2,    " + &
	"   ctx_basic_info.oc_signed_by,    " + &
	"   ctx_basic_info.oc_title,    " + &
	"   ctx_basic_info.oc_department,    " + &
	"   ctx_basic_info.oc_legal_rep,    " + &
	"   ctx_basic_info.cc_signed_by,    " + &
	"   ctx_basic_info.cc_title,    " + &
	"   ctx_basic_info.cc_department,    " + &
	"   ctx_basic_info.cc_legal_rep,    " + &
	"   ctx_basic_info.notes,    " + &
	"   ctx_basic_info.keyword,    " + &
	"   ctx_basic_info.dvision,    " + &
	"   ctx_basic_info.custom_1,    " + &
	"   ctx_basic_info.custom_2,    " + &
	"   ctx_basic_info.custom_3,    " + &
	"   ctx_basic_info.custom_4,    " + &
	"   ctx_basic_info.custom_5,    " + &
	"   ctx_basic_info.custom_6,    " + &
	"   ctx_basic_info.custom_7,    " + &
	"   ctx_basic_info.custom_8,    " + &
	"   ctx_basic_info.custom_9,    " + &
	"   ctx_basic_info.custom_10,    " + &
	"   ctx_basic_info.group_id,    " + &
	"   ctx_basic_info.revision_reason,    " + &
	"   ctx_basic_info.record_id , " + &
	"   owner = upper((SELECT top 1 ctx_contacts.user_d  " + &
	"       FROM ctx_contacts,ctx_contract_contacts " + &
	"       WHERE (ctx_contract_contacts.contact_id = ctx_contacts.contact_id ) and   " + &
	"         (ctx_contract_contacts.ctx_id = ctx_basic_info.ctx_id ) AND   " + &
	"         ( ctx_contract_contacts.owner = 'Y' ) )), " + &
	"   contracted_entity = (SELECT top 1 group_multi_loc.rec_id   " + &
	"             FROM ctx_loc,    " + &
	"              group_multi_loc   " + &
	"           WHERE ( ctx_loc.parent_comp_id = group_multi_loc.rec_id) and   " + &
	"             ( ctx_loc.ctx_id = ctx_basic_info.ctx_id) AND   " + &
	"               ctx_loc.loc_id = 0), " + &
	"   app_facility.facility_name facility_name, " + &
	"   ctx_basic_info.custom_date1,   " + &
	"   ctx_basic_info.custom_date2,   " + &
	"   ctx_basic_info.custom_date3,   " + &
	"   ctx_basic_info.custom_date4,   " + &
	"   ctx_basic_info.custom_date5,   " + &
	"   ctx_basic_info.inserted_by_user,   " + &
	"   ctx_basic_info.inserted_at_date_time,   " + &
	"   ctx_basic_info.updated_by_user,   " + &
	"   ctx_basic_info.updated_at_date_time,   " + &
	"   ctx_basic_info.custom_11,   " + &
	"   ctx_basic_info.custom_12,   " + &
	"   ctx_basic_info.custom_13,   " + &
	"   ctx_basic_info.custom_14,   " + &
	"   ctx_basic_info.custom_15,   " + &
	"   ctx_basic_info.custom_16,   " + &
	"   ctx_basic_info.custom_17,   " + &
	"   ctx_basic_info.custom_18,   " + &
	"   ctx_basic_info.custom_19,   " + &
	"   ctx_basic_info.custom_20,   " + &
	"   ctx_basic_info.custom_date6,   " + &
	"   ctx_basic_info.custom_date7,   " + &
	"   ctx_basic_info.custom_date8,   " + &
	"   ctx_basic_info.custom_date9,   " + &
	"   ctx_basic_info.custom_date10,   " + &
	"   ctx_basic_info.custom_date11,   " + &
	"   ctx_basic_info.custom_date12,   " + &
	"   ctx_basic_info.custom_date13,   " + &
	"   ctx_basic_info.custom_date14,   " + &
	"   ctx_basic_info.custom_date15,   " + &
	"   ctx_basic_info.custom_n1,   " + &
	"   ctx_basic_info.custom_n2,   " + &
	"   ctx_basic_info.custom_n3,   " + &
	"   ctx_basic_info.custom_n4,   " + &
	"   ctx_basic_info.custom_n5,   " + &
	"   ctx_basic_info.custom_n6,   " + &
	"   ctx_basic_info.custom_n7,   " + &
	"   ctx_basic_info.custom_n8,   " + &
	"   ctx_basic_info.custom_n9,   " + &
	"   ctx_basic_info.custom_n10,   " + &
	"   ctx_basic_info.version_number,   " + &
	"   ctx_basic_info.version_date,   " + &
	"   ctx_basic_info.master_contract_name    " + &
	"    FROM  ctx_basic_info   " + &
	"LEFT OUTER JOIN ctx_products ON ctx_basic_info.ctx_id = ctx_products.ctx_id   " + &
	"LEFT OUTER JOIN code_lookup ON ctx_products.product_id = code_lookup.lookup_code  " + &
	"LEFT OUTER JOIN code_lookup code_lookup1 ON ctx_products.product_type = code_lookup1.lookup_code,  " + &
	"ctx_basic_info ctx_basic_info1 LEFT OUTER JOIN app_facility ON ctx_basic_info1.app_facility = app_facility.facility_id, " + &
	"( " + &
	" SELECT Distinct ctx_contract_contacts.ctx_id " + &
	"   FROM ctx_contract_contacts,    " + &
	"         ctx_contacts   " + &
	"  WHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) and   " + &
	"        ( ( ctx_contract_contacts.access in ('F','R') ) OR   " + &
	"        ( ctx_contract_contacts.owner = 'Y' ) ) AND   " + &
	"        ( ctx_contacts.user_d = @user_d ) and ctx_contract_contacts.ic_area = 'I' " + &
	" UNION " + &
	"   SELECT DISTINCT ctx_basic_info.ctx_id " + &
	"     FROM ctx_acp_contract_management_right,security_users,ctx_basic_info " + &
	"    WHERE ( ctx_acp_contract_management_right.types = 1 )  " + &
	" AND ctx_acp_contract_management_right.role_id = security_users.role_id " + &
	" AND ctx_acp_contract_management_right.category = ctx_basic_info.category " + &
	" AND ctx_acp_contract_management_right.rights In ('11','12') " + &
	" AND security_users.user_id = @user_d " + &
	" AND ctx_basic_info.ctx_id NOT IN " + &
	"    (SELECT Distinct ctx_contract_contacts.ctx_id " + &
	"		  FROM ctx_contract_contacts, ctx_contacts  " + &  
	"		 WHERE ( ctx_contacts.contact_id = ctx_contract_contacts.contact_id ) AND " + &
	"			    ( ( ctx_contract_contacts.access ='N') AND " + &
	"	     	    ( ctx_contract_contacts.owner <> 'Y' ) ) AND " + &   
	"			    ( ctx_contacts.user_d = @user_d ) AND " + &
	"				 ( ctx_contract_contacts.ic_area = 'I' ) ) " + &
	") AA " + &
	"WHERE ctx_basic_info.ctx_id = ctx_basic_info1.ctx_id and ctx_basic_info.ctx_id = AA.ctx_id " + &
	"ORDER BY ctx_basic_info.ctx_id   " + &
	"END "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(      select 1 from sys.syscolumn c, sys.systable t      " + &
   "      where c.table_id=t.table_id and c.column_name='gadget_title_font_face' and t.table_name='dashboard_tabs')   " + &
"ALTER table dashboard_tabs add gadget_title_font_face varchar(50) null     " 

 

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"if not exists(      select 1 from sys.syscolumn c, sys.systable t      " + &
   "      where c.table_id=t.table_id and c.column_name='gadget_title_font_size' and t.table_name='dashboard_tabs')   " + &
"ALTER table dashboard_tabs add gadget_title_font_size integer null     " 


is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"If not exists( select 1 from sysobjects where name = 'dashboard_tabs_settings' )   " + &
 "        Create Table dashboard_tabs_settings   " + &
 "        (   " + &
 "                  id  numeric(10,0) identity not null,   " + &
 "                  user_id varchar(50) not null,   " + &
 "                  tab_header_font_face varchar(52) null,   " + &
 "                  tab_header_font_size integer null,   " + &
 "                  Primary Key(id)   " + &
 "        )   " 

//For Import - Evan 10.06.2008
is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"ALTER TABLE import_hdr MODIFY imp_file varchar(255) null "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"ALTER TABLE Conv_view_links MODIFY link_to_table_nm varchar(100) null"

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"ALTER TABLE Conv_view_links MODIFY link_from_table_nm varchar(100) null"

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"ALTER TABLE pd_insurance MODIFY policy_number varchar(50) null "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"ALTER TABLE pd_address MODIFY ext varchar(10) null "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
"if not exists(select 1 from sys.syscolumn c, sys.systable t " + &
"where c.table_id=t.table_id and c.column_name='backcolor' and t.table_name='ctx_tabpage_properties') " + &
"ALTER TABLE ctx_tabpage_properties ADD backcolor integer null "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(select 1 from sys.syscolumn c, sys.systable t " + &
"where c.table_id=t.table_id and c.column_name='tab_backcolor' and t.table_name='ctx_tabpage_properties') " + &
"ALTER TABLE ctx_tabpage_properties ADD tab_backcolor integer null "

//Added by Nova.zhang on 2008-10-23
is_sql_statements[upperbound(is_sql_statements) + 1] =  &
"ALTER table pd_board_specialty MODIFY board_certified  numeric(10,0) null"

//Added by Nova.zhang on 2008-11-12
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(select 1 from sys.syscolumn c, sys.systable t " + &
"where c.table_id=t.table_id and c.column_name='set_prelod_ctx' and t.table_name='security_users') " + &
"ALTER TABLE security_users ADD set_prelod_ctx integer null "

//Added by Nova.zhang on 2008-11-19
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"If not exists( select 1 from sysobjects where name = 'dashboard_template' ) " + &
"	Create Table dashboard_template " + &
"	( " + &
"		id numeric(10,0) identity not null, " + &
"		template_name varchar(50) not null, " + &
"		create_user varchar(50) null, " + &
"		create_date datetime null, " + &
"		comments varchar(1000) null, " + &
"		Primary Key(id) " + &
"	) " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(	select 1 from sys.syscolumn c, sys.systable t    " + &
"	where c.table_id=t.table_id and c.column_name='template_id' and t.table_name='dashboard_tabs') " + &
"ALTER table dashboard_tabs add template_id numeric(10,0) null   " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(	select 1 from sys.syscolumn c, sys.systable t    " + &
"	where c.table_id=t.table_id and c.column_name='template_id' and t.table_name='dashboard_tabs_settings') " + &
"ALTER table dashboard_tabs_settings add template_id numeric(10,0) null   "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(	select 1 from sys.syscolumn c, sys.systable t    " + &
"	where c.table_id=t.table_id and c.column_name='default_dashboard_id' and t.table_name='security_users') " + &
"ALTER table security_users add default_dashboard_id numeric(10,0) null   " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(	select 1 from sys.syscolumn c, sys.systable t    " + &
"	where c.table_id=t.table_id and c.column_name='set_dashb' and t.table_name='icred_settings') " + &
"ALTER table icred_settings add set_dashb integer null   " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(	select 1 from sys.syscolumn c, sys.systable t     " + &  
"	where c.table_id=t.table_id and c.column_name='ie_maxscript' and t.table_name='icred_settings')    " + &
"ALTER table icred_settings add ie_maxscript integer null      " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(select 1 from sys.syscolumn c, sys.systable t " + &  
"	where c.table_id=t.table_id and c.column_name='win_backcolor' and t.table_name='data_view') " + &
"alter table data_view add win_backcolor integer null "

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists( " + &  
"   select 1 from sys.syscolumn c, sys.systable t " + &  
"   where c.table_id=t.table_id " + &  
"     and c.column_name='splash_picture' " + &  
"     and t.table_name='ids') " + &  
"ALTER table ids add splash_picture image null "   
//Added by Nova.zhang on 2008-11-26
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"ALTER TABLE conv_view_fields MODIFY field_name Varchar(1000)"
//Added by Nova.zhang on 2008-11-27
is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(	select 1 from sys.syscolumn c, sys.systable t   " + &   
"	where c.table_id=t.table_id and c.column_name='clock_face_id' and t.table_name='dashboard_tabs') " + &  
"ALTER table dashboard_tabs add clock_face_id integer null   " 

is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if not exists(	select 1 from sys.syscolumn c, sys.systable t    " + &     
"	where c.table_id=t.table_id and c.column_name='height_ier' and t.table_name='dashboard_tab_gadgets')   " + &   
"ALTER table dashboard_tab_gadgets add height_ier decimal(2,1) null     "

of_execute_sqls("of_ver85_release_table1")

RETURN 1
end function

public function integer of_ver85_release_view1 ();is_sql_statements[upperbound(is_sql_statements) + 1] = &
"if exists (select TOP 1 1 from  sysobjects where  name='v_ctx_Document' and type = 'V')  " + &
"  drop view v_ctx_Document "

is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	"CREATE VIEW  v_ctx_Document " + &
	"  as  select " + &
"     Ctx_am_document.Doc_id,   " + &
"           Ctx_am_document.ctx_id,   " + &
"           Ctx_am_document.doc_name,   " + &
"           Ctx_am_document.Revision,   " + &
"           case when doc_type='S' then 'Sell' when doc_type='B' then 'Buy' else 'Other' end as doc_type,  " + &
"           Ctx_am_document.doc_ext,  " + &
"           code_lookup_1.code AS category,  " + &
"           Ctx_am_document.Create_by,   " + &
"           Ctx_am_document.Create_date,   " + &
"           code_lookup.code as Status,   " + &
"		     Ctx_am_document.Status_by,   " + &
"           Ctx_am_document.Status_date,   " + &
"           Ctx_am_document.Doc_from_name,    " + &
"           Ctx_am_document.checkout_by,   " + &
"           Ctx_am_document.checkout_date,   " + &
"           case when checkout_status=1 then 'Check out' else  'Normal' end as checkout_status,  " + &
"           (SELECT     COUNT(*) AS Expr1  " + &
"             FROM          Ctx_am_doc_audit  " + &
"             WHERE      (Doc_id = Ctx_am_document.Doc_id)) AS audit_count  " + &
"FROM         Ctx_am_document INNER JOIN  " + &
"             code_lookup ON Ctx_am_document.Status = code_lookup.lookup_code INNER JOIN  " + &
"             code_lookup AS code_lookup_1 ON Ctx_am_document.category = code_lookup_1.lookup_code  " 



of_execute_sqls("of_ver85_release_view1")
RETURN 1
end function

public function integer of_ver85_updates ();//Update SQL for ver 8.5 - Alfee 07.11.2008

//String ls_dev_type, ls_from_version

//ls_dev_type = of_get_development()
//ls_from_version = of_get_from_version()

//IF ls_dev_type = '0' and gs_current_version = ls_from_version THEN
//	of_ver85_patch_table1()
//ELSE
	of_ver85_release_table1()
	//update view 
	of_ver70_release_view1()
	of_ver70_release_view2()	
	of_ver70_release_view3()
	of_ver70_release_view4()		
	of_ver80_release_view1()
	of_ver80_patch_view1()
	of_ver85_release_view1()
//END IF

RETURN 1

end function

public function integer of_ver90_release_table1 ();is_sql_statements[UpperBound(is_sql_statements) + 1] =  &
	" if not exists(	select 1 from sys.syscolumn c, sys.systable t   " + &
	" 	 where c.table_id=t.table_id and c.column_name='tab_position' and t.table_name='dashboard_tabs_settings') " + &
	" ALTER table dashboard_tabs_settings add tab_position integer null  " 



of_execute_sqls("of_ver90_release_table1")
Return 1
end function

public function integer of_ver90_release_view1 ();

Return 1
end function

public function integer of_ver90_updates ();
of_ver90_release_table1()
of_ver90_release_view1()

Return 1
end function

on n_cst_update_asa.create
call super::create
end on

on n_cst_update_asa.destroy
call super::destroy
end on

event constructor;call super::constructor;//by Alfee 01.30.2008
end event

