$PBExportHeader$n_inet.sru
forward
global type n_inet from inet
end type
end forward

global type n_inet from inet
end type
global n_inet n_inet

on n_inet.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_inet.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

