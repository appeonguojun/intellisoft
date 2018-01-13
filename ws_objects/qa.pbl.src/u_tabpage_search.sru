﻿$PBExportHeader$u_tabpage_search.sru
forward
global type u_tabpage_search from u_tabpg
end type
type uo_search from pfc_cst_u_extended_search within u_tabpage_search
end type
end forward

global type u_tabpage_search from u_tabpg
integer width = 3675
integer height = 1712
string text = "Search"
string picturename = "Find!"
uo_search uo_search
end type
global u_tabpage_search u_tabpage_search

type variables
window idw_parent_window

string is_window_title
end variables

on u_tabpage_search.create
int iCurrent
call super::create
this.uo_search=create uo_search
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_search
end on

on u_tabpage_search.destroy
call super::destroy
destroy(this.uo_search)
end on

event constructor;call super::constructor;this.uo_search.of_set_transaction( sqlca)

this.uo_search.cb_new.visible = false
this.uo_search.cb_iverify.visible = false
this.uo_search.cb_close.visible = false
end event

type uo_search from pfc_cst_u_extended_search within u_tabpage_search
integer width = 3653
integer height = 1668
integer taborder = 40
boolean border = false
end type

on uo_search.destroy
call pfc_cst_u_extended_search::destroy
end on

event constructor;call super::constructor;


parent.of_getparentwindow( idw_parent_window)



end event

event ue_cb_select;call super::ue_cb_select;
long ll_i
if len(is_window_title) < 1 then
	is_window_title = idw_parent_window.title
end if

////////////////////////////////////////////////////////////////////////
// make sure all is updated
////////////////////////////////////////////////////////////////////////
idw_parent_window.dynamic of_accepttext( true)
if idw_parent_window.function dynamic of_updatespending( ) > 0  then
	if messagebox('Updates Pending', 'Do you want to save changes?',question!,YesNo!) = 1 then
      if idw_parent_window.dynamic of_save()  < 0 then
			of_MessageBox ( '', 'Update Error', 'Update has failed', Exclamation!, ok!, 1)
			return 
		else
		end if
	end if
end if



if this.dw_search.rowcount( ) > 0 then
	ll_i = this.dw_search.getrow( )
	idw_parent_window.title = is_window_title + '   Practitioner : '  + this.dw_search.object.last_name[ll_i] + ' , ' + this.dw_search.object.first_name[ll_i]
	setpointer(hourglass!)
	idw_parent_window.dynamic of_retrieve_measuremts()
	idw_parent_window.dynamic of_retrieve_site_survey()
	idw_parent_window.dynamic of_retrieve_case_review()
	idw_parent_window.dynamic of_selecttab()
	setpointer(arrow!)
end if


/*
\\

this.of_getparentwindow( lw_parent_window)
lw_parent_window.dynamic of_accepttext( true)

if this.tabpage_detail.of_updatespending( ) > 0 OR this.tabpage_action_items.of_updatespending( ) > 0  then
	if messagebox('Updates Pending', 'Do you want to save changes?',question!,YesNo!) = 1 then
      if lw_parent_window.dynamic of_save()  < 0 then
			this.of_MessageBox ( '', 'Update Error', 'Update has failed', Exclamation!, ok!, 1)
			return 1
		else
			
		end if
		
	end if
	
end if
*/
end event

