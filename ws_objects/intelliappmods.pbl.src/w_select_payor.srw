$PBExportHeader$w_select_payor.srw
forward
global type w_select_payor from w_popup
end type
type uo_1 from pfc_cst_u_multi_app_select within w_select_payor
end type
end forward

global type w_select_payor from w_popup
int X=14
int Y=240
int Width=3621
int Height=2104
WindowType WindowType=response!
boolean TitleBar=true
string Title="Select Applications"
long BackColor=80269524
boolean ControlMenu=false
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
uo_1 uo_1
end type
global w_select_payor w_select_payor

type variables


end variables

on w_select_payor.create
int iCurrent
call super::create
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
end on

on w_select_payor.destroy
call super::destroy
destroy(this.uo_1)
end on

event open;call super::open;uo_1.iw_win2 = This

//CHOOSE CASE gi_intelliapp_type
//		//SINGLE GROUP
//	CASE 0
//		uo_1.dw_app_data.Modify( "parent_facility_t.text = 'Payor/Hospital'" )		
//		//MULTI SITE GROUP
//	CASE 1
//		uo_1.dw_app_data.Modify( "parent_facility_t.text = 'Group'" )		
//		//BILLING COMPANY
//	CASE 2
//		uo_1.dw_app_data.Modify( "parent_facility_t.text = 'Client'" )		
//END CHOOSE
//
//
end event

type uo_1 from pfc_cst_u_multi_app_select within w_select_payor
int X=0
int Y=0
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

on uo_1.destroy
call pfc_cst_u_multi_app_select::destroy
end on

