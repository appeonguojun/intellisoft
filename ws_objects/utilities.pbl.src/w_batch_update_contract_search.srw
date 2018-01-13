$PBExportHeader$w_batch_update_contract_search.srw
forward
global type w_batch_update_contract_search from w_response
end type
type uo_search from u_batch_update_contract_search within w_batch_update_contract_search
end type
end forward

global type w_batch_update_contract_search from w_response
integer width = 3968
integer height = 2148
boolean minbox = true
boolean resizable = true
windowtype windowtype = main!
uo_search uo_search
end type
global w_batch_update_contract_search w_batch_update_contract_search

type variables
n_cst_contract inv_contract_codes 
str_batch_update_field istr_batch_update_field
end variables

on w_batch_update_contract_search.create
int iCurrent
call super::create
this.uo_search=create uo_search
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_search
end on

on w_batch_update_contract_search.destroy
call super::destroy
destroy(this.uo_search)
end on

event pfc_postopen;call super::pfc_postopen;/******************************************************************************************************************
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
**  Created By	: Michael B. Skinner xx August 2005  ?Intellisoftgroup, Inc
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
********************************************************************************************************************/
ib_disableclosequery = True

inv_contract_codes = CREATE n_cst_contract
This.uo_search.of_set_contract_details(inv_contract_codes)

This.uo_search.CB_1.Event clicked()
//if IsValid(w_custom_report) then
//	if w_custom_report.ib_AutoRetrieve then
//		This.uo_search.CB_1.Event clicked()
//	end if
//else
//	//This.uo_search.CB_1.Event clicked()//Commented By Ken.Guo 06/10/2014. Bug14061004
//end if

end event

event close;call super::close;//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
//if IsValid(inv_contract_codes) then Destroy inv_contract_codes 
//---------------------------- APPEON END ----------------------------
end event

event open;call super::open;//If isvalid(message.powerobjectparm) Then
If isvalid(w_choose_batch_update_column) Then
	istr_batch_update_field = w_choose_batch_update_column.istr_batch_update_field
	uo_search.istr_batch_update_field = istr_batch_update_field
//	uo_search.event ue_create_dw( )
	uo_search.event ue_create_objects( )
Else
	Messagebox('Error','Failed to pass the field object.')
End If




end event

type uo_search from u_batch_update_contract_search within w_batch_update_contract_search
integer x = 32
integer y = 16
integer taborder = 20
end type

on uo_search.destroy
call u_batch_update_contract_search::destroy
end on

