$PBExportHeader$u_tabpage_case_review.sru
forward
global type u_tabpage_case_review from u_tabpg
end type
type uo_1 from uo_peer_reviewb within u_tabpage_case_review
end type
end forward

global type u_tabpage_case_review from u_tabpg
integer width = 3319
integer height = 1888
string text = "Case Review"
string picturename = "RunReport5!"
uo_1 uo_1
end type
global u_tabpage_case_review u_tabpage_case_review

on u_tabpage_case_review.create
int iCurrent
call super::create
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
end on

on u_tabpage_case_review.destroy
call super::destroy
destroy(this.uo_1)
end on

type uo_1 from uo_peer_reviewb within u_tabpage_case_review
integer taborder = 30
boolean border = false
end type

on uo_1.destroy
call uo_peer_reviewb::destroy
end on

