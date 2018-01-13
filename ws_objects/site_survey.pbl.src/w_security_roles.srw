$PBExportHeader$w_security_roles.srw
forward
global type w_security_roles from w_response
end type
type uo_1 from pfc_cst_u_security_roles_painter within w_security_roles
end type
end forward

global type w_security_roles from w_response
int Width=2683
int Height=1720
boolean TitleBar=true
string Title="Security Roles"
uo_1 uo_1
end type
global w_security_roles w_security_roles

on w_security_roles.create
int iCurrent
call super::create
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
end on

on w_security_roles.destroy
call super::destroy
destroy(this.uo_1)
end on

type uo_1 from pfc_cst_u_security_roles_painter within w_security_roles
int X=9
int Y=40
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

on uo_1.destroy
call pfc_cst_u_security_roles_painter::destroy
end on

