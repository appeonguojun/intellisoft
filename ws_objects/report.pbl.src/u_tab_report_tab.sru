$PBExportHeader$u_tab_report_tab.sru
forward
global type u_tab_report_tab from u_tab
end type
type tabpage_criteria from u_tabpage_report_criteria within u_tab_report_tab
end type
type tabpage_criteria from u_tabpage_report_criteria within u_tab_report_tab
end type
type tabpage_report from u_tabpage_report_report within u_tab_report_tab
end type
type tabpage_report from u_tabpage_report_report within u_tab_report_tab
end type
type tabpage_graph from u_tabpage_report_graph within u_tab_report_tab
end type
type tabpage_graph from u_tabpage_report_graph within u_tab_report_tab
end type
end forward

global type u_tab_report_tab from u_tab
integer width = 3506
integer height = 1816
tabposition tabposition = tabsonbottom!
tabpage_criteria tabpage_criteria
tabpage_report tabpage_report
tabpage_graph tabpage_graph
end type
global u_tab_report_tab u_tab_report_tab

on u_tab_report_tab.create
this.tabpage_criteria=create tabpage_criteria
this.tabpage_report=create tabpage_report
this.tabpage_graph=create tabpage_graph
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_criteria
this.Control[iCurrent+2]=this.tabpage_report
this.Control[iCurrent+3]=this.tabpage_graph
end on

on u_tab_report_tab.destroy
call super::destroy
destroy(this.tabpage_criteria)
destroy(this.tabpage_report)
destroy(this.tabpage_graph)
end on

type tabpage_criteria from u_tabpage_report_criteria within u_tab_report_tab
integer x = 18
integer y = 16
integer width = 3470
integer height = 1688
end type

type tabpage_report from u_tabpage_report_report within u_tab_report_tab
integer x = 18
integer y = 16
integer width = 3470
integer height = 1688
end type

type tabpage_graph from u_tabpage_report_graph within u_tab_report_tab
boolean visible = false
integer x = 18
integer y = 16
integer width = 3470
integer height = 1688
end type

