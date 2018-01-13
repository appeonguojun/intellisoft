$PBExportHeader$n_cst_other_audit.sru
forward
global type n_cst_other_audit from nonvisualobject
end type
end forward

global type n_cst_other_audit from nonvisualobject autoinstantiate
end type

type variables
n_ds ids_audit
end variables

forward prototypes
public function integer of_audit (u_dw adw, long al_table_id, string as_id_col, string as_name_col)
public subroutine of_reset ()
public function integer of_update ()
end prototypes

public function integer of_audit (u_dw adw, long al_table_id, string as_id_col, string as_name_col);//====================================================================
// Function: of_audit
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//                adw
//                al_record_id
//                al_table_id
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:         Ken.Guo 2015-06-01
//--------------------------------------------------------------------
//Copyright (c) 2008-2015 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================


Long ll_seq_no, ll_col_cnt,i,j,ll_row_cnt, ll_row, ll_record_id
String ls_table_name, ls_old_value, ls_new_value  , ls_name, ls_field_name, ls_field_label
Datetime ldt_now

n_cst_ctx_audit lnv_audits

lnv_audits.inv_dwsrv.OF_SETrequestor( ADW)

Select isnull(max(seq_no),0), getdate()  Into :ll_seq_no, :ldt_now From sys_audit Where  table_id = :al_table_id;

ll_row_cnt=  adw.rowcount()
ll_col_cnt = long(adw.Describe("DataWindow.Column.Count"))

If ll_row_cnt = 0 Then Return 0

For j = 1 To ll_row_cnt
	For i = 1 To ll_col_cnt
		lnv_audits.of_get_values( adw, j, i, ls_new_value, ls_old_value)
		If isnull(ls_new_value) then ls_new_value = ''
		If isnull(ls_old_value) then ls_old_value = ''
		If ls_new_value<> ls_old_value Then
			ll_seq_no++
			ll_row = ids_audit.InsertRow(0)
			
			ls_field_name = adw.Describe('#' + String(i) + '.name')
			ls_field_label = adw.Describe(ls_field_name + '_t.text')
			if ls_field_label <> '' and ls_field_label <> '?' and ls_field_label  <> '!' Then
				ls_field_label = ' - ' + ls_field_label
			Else
				ls_field_label = ''
			End If
			
			ll_record_id = adw.GetItemNumber(j, as_id_col)
			ls_name = adw.GetItemString(j, as_name_col) +  ' (' + String(ll_record_id)  + ')'
			
			ids_audit.SetItem(ll_row, 'rec_id', ll_record_id)
			ids_audit.SetItem(ll_row, 'field_id', -9999)
			ids_audit.SetItem(ll_row, 'seq_no', ll_seq_no)
			ids_audit.SetItem(ll_row, 'table_id', al_table_id)
			ids_audit.SetItem(ll_row, 'prac_id', 0)
			ids_audit.SetItem(ll_row, 'old_value', ls_old_value)
			ids_audit.SetItem(ll_row, 'new_value', ls_new_value)
			ids_audit.SetItem(ll_row, 'user_id', gs_user_id)
			ids_audit.SetItem(ll_row, 'date_time_modified', ldt_now)
			ids_audit.SetItem(ll_row, 'audit_type', 'E')
			ids_audit.SetItem(ll_row, 'exported', 0)
			//ids_audit.SetItem(ll_row, 'facility_id', ll_seq_no)
			ids_audit.SetItem(ll_row, 'tfield_name', ls_name + ls_field_label)
			ids_audit.SetItem(ll_row, 'tfield_name_allias', ls_name + ls_field_label)
			
		End If
	Next
Next



return 1
end function

public subroutine of_reset ();ids_audit.reset()
end subroutine

public function integer of_update ();If ids_audit.modifiedcount( ) > 0 then
	If ids_audit.update() = 1 Then
		Return 1
	Else
		Return -1
	End If
End If

Return 1
end function

on n_cst_other_audit.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_other_audit.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_audit = Create n_ds
ids_audit.dataobject = 'd_other_audit'
ids_audit.Settransobject(SQLCA)
end event

event destructor;if isvalid(ids_audit) Then Destroy ids_audit
end event

