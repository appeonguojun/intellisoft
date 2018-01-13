$PBExportHeader$u_cst_gadget_recent_prac.sru
forward
global type u_cst_gadget_recent_prac from u_cst_gadget
end type
end forward

global type u_cst_gadget_recent_prac from u_cst_gadget
string tag = "u_gadget_7.Recent Practitioner"
event ue_refresh_data ( )
end type
global u_cst_gadget_recent_prac u_cst_gadget_recent_prac

event ue_refresh_data();//
end event

on u_cst_gadget_recent_prac.create
call super::create
end on

on u_cst_gadget_recent_prac.destroy
call super::destroy
end on

event ue_run;call super::ue_run;Long ll_data_id
str_dashboard str_para

If al_row <= 0 Then Return 1

ll_data_id = dw_content.GetItemNumber(al_row,'dashboard_gadgets_recent_data_id')
str_para.data_id = ll_data_id
str_para.data_id = dw_content.Object.pd_basic_prac_id[al_row]
str_para.data_name = dw_content.Object.facility_facility_name[al_row]
str_para.data_ext_id = dw_content.Object.dashboard_gadgets_recent_facility_id[al_row]

IF gs_cust_type = "I" THEN
	 IF IsValid(w_prac_data_intelliapp)  THEN
		w_prac_data_intelliapp.of_dashboard(str_para.data_name,str_para.data_id,str_para.data_ext_id)
	 ELSE
		OpenSheetWithParm(w_prac_data_intelliapp,str_para,w_mdi,4,Original!)
	 END IF
ELSE
	 IF IsValid(w_prac_data_1)  THEN
		w_prac_data_1.of_dashboard(str_para.data_name,str_para.data_id,str_para.data_ext_id)
	 ELSE
		OpenSheetWithParm(w_prac_data_1,str_para,w_mdi,4,Original!)
	 END IF
END IF

Return 1
end event

type dw_content from u_cst_gadget`dw_content within u_cst_gadget_recent_prac
string dataobject = "d_dashb_gadget_recent_prac"
end type

type ln_split from u_cst_gadget`ln_split within u_cst_gadget_recent_prac
end type

type st_1 from u_cst_gadget`st_1 within u_cst_gadget_recent_prac
end type

type st_title from u_cst_gadget`st_title within u_cst_gadget_recent_prac
end type

type pb_close from u_cst_gadget`pb_close within u_cst_gadget_recent_prac
end type

type pb_max from u_cst_gadget`pb_max within u_cst_gadget_recent_prac
end type

type pb_edit from u_cst_gadget`pb_edit within u_cst_gadget_recent_prac
end type

