$PBExportHeader$w_export_progress.srw
forward
global type w_export_progress from window
end type
type r_1 from rectangle within w_export_progress
end type
type hpb_1 from hprogressbar within w_export_progress
end type
type st_merge from statictext within w_export_progress
end type
type st_6 from statictext within w_export_progress
end type
type st_export1 from statictext within w_export_progress
end type
type cb_send from u_cb within w_export_progress
end type
type st_export from statictext within w_export_progress
end type
type st_progress from statictext within w_export_progress
end type
type r_bar from rectangle within w_export_progress
end type
type hpb_bar from hprogressbar within w_export_progress
end type
end forward

global type w_export_progress from window
boolean visible = false
integer x = 1056
integer y = 484
integer width = 1646
integer height = 952
boolean enabled = false
boolean titlebar = true
string title = "Export Progress"
windowtype windowtype = popup!
long backcolor = 80269524
r_1 r_1
hpb_1 hpb_1
st_merge st_merge
st_6 st_6
st_export1 st_export1
cb_send cb_send
st_export st_export
st_progress st_progress
r_bar r_bar
hpb_bar hpb_bar
end type
global w_export_progress w_export_progress

type variables
String is_org_info
end variables

on w_export_progress.create
this.r_1=create r_1
this.hpb_1=create hpb_1
this.st_merge=create st_merge
this.st_6=create st_6
this.st_export1=create st_export1
this.cb_send=create cb_send
this.st_export=create st_export
this.st_progress=create st_progress
this.r_bar=create r_bar
this.hpb_bar=create hpb_bar
this.Control[]={this.r_1,&
this.hpb_1,&
this.st_merge,&
this.st_6,&
this.st_export1,&
this.cb_send,&
this.st_export,&
this.st_progress,&
this.r_bar,&
this.hpb_bar}
end on

on w_export_progress.destroy
destroy(this.r_1)
destroy(this.hpb_1)
destroy(this.st_merge)
destroy(this.st_6)
destroy(this.st_export1)
destroy(this.cb_send)
destroy(this.st_export)
destroy(this.st_progress)
destroy(this.r_bar)
destroy(this.hpb_bar)
end on

event open;//
cpu()

is_org_info = gnv_Status_Info.of_get_info( )

//Added By Jay Chen 11-27-2014
string ls_use_web_merge
ls_use_web_merge = gnv_user_option.of_Get_option_value( gs_user_id, "use_web_merge" ) 
if isnull(ls_use_web_merge) or ls_use_web_merge = '' then ls_use_web_merge = '0'
if ls_use_web_merge = '1' then
	gnv_Status_Info.of_display("Merging Document with webservice...")
else
	gnv_Status_Info.of_display("Exporting Data for Merging Document or Email...")
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event close;//gnv_Status_Info.of_display(is_org_info)
gnv_Status_Info.of_display("")//modified by gavins 20130410     restore original information in "gnv_status_info" 's function
end event

type r_1 from rectangle within w_export_progress
integer linethickness = 4
long fillcolor = 67108864
integer x = 73
integer y = 644
integer width = 1417
integer height = 64
end type

type hpb_1 from hprogressbar within w_export_progress
boolean visible = false
integer x = 78
integer y = 780
integer width = 1413
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

type st_merge from statictext within w_export_progress
boolean visible = false
integer x = 69
integer y = 716
integer width = 722
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Progress of merging data"
boolean focusrectangle = false
end type

type st_6 from statictext within w_export_progress
integer x = 82
integer y = 576
integer width = 722
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Progress of building data"
boolean focusrectangle = false
end type

type st_export1 from statictext within w_export_progress
integer x = 105
integer y = 360
integer width = 1317
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_send from u_cb within w_export_progress
integer x = 398
integer y = 1076
integer width = 471
integer taborder = 10
boolean bringtotop = true
boolean enabled = false
string text = "Send To Committee"
boolean default = true
end type

event clicked;//
//Integer li_bar_ticks
//
//
//ldt_todaysDate = DateTime( Today() )
//
//
//
//r_bar.Width = 1
//
//li_bar_ticks = 1000 / li_prac_cnt
//
//
//r_bar.Width = r_bar.Width + li_bar_ticks
//







end event

type st_export from statictext within w_export_progress
integer x = 110
integer y = 236
integer width = 1353
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_progress from statictext within w_export_progress
integer x = 69
integer y = 84
integer width = 1376
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type r_bar from rectangle within w_export_progress
integer linethickness = 4
long fillcolor = 16711680
integer x = 82
integer y = 652
integer width = 59
integer height = 48
end type

type hpb_bar from hprogressbar within w_export_progress
integer x = 73
integer y = 644
integer width = 1417
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

