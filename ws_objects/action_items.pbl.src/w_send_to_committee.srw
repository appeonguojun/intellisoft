$PBExportHeader$w_send_to_committee.srw
forward
global type w_send_to_committee from w_response
end type
type dw_profile_view from u_dw within w_send_to_committee
end type
type st_1 from statictext within w_send_to_committee
end type
type dw_meet_date from u_dw within w_send_to_committee
end type
type st_2 from statictext within w_send_to_committee
end type
type cbx_print_summary from checkbox within w_send_to_committee
end type
type cb_cancel from u_cb within w_send_to_committee
end type
type cb_send from u_cb within w_send_to_committee
end type
type dw_profile from u_dw within w_send_to_committee
end type
type dw_ver_info from u_dw within w_send_to_committee
end type
type r_print_stat_border from rectangle within w_send_to_committee
end type
type st_4 from statictext within w_send_to_committee
end type
type st_5 from statictext within w_send_to_committee
end type
type st_6 from statictext within w_send_to_committee
end type
type gb_1 from groupbox within w_send_to_committee
end type
type r_bar from rectangle within w_send_to_committee
end type
type cb_1 from commandbutton within w_send_to_committee
end type
end forward

global type w_send_to_committee from w_response
integer x = 1097
integer y = 524
integer width = 1170
integer height = 1168
string title = "Send To Committee"
boolean controlmenu = false
dw_profile_view dw_profile_view
st_1 st_1
dw_meet_date dw_meet_date
st_2 st_2
cbx_print_summary cbx_print_summary
cb_cancel cb_cancel
cb_send cb_send
dw_profile dw_profile
dw_ver_info dw_ver_info
r_print_stat_border r_print_stat_border
st_4 st_4
st_5 st_5
st_6 st_6
gb_1 gb_1
r_bar r_bar
cb_1 cb_1
end type
global w_send_to_committee w_send_to_committee

type variables
gs_pass_ids ist_ids
end variables

on w_send_to_committee.create
int iCurrent
call super::create
this.dw_profile_view=create dw_profile_view
this.st_1=create st_1
this.dw_meet_date=create dw_meet_date
this.st_2=create st_2
this.cbx_print_summary=create cbx_print_summary
this.cb_cancel=create cb_cancel
this.cb_send=create cb_send
this.dw_profile=create dw_profile
this.dw_ver_info=create dw_ver_info
this.r_print_stat_border=create r_print_stat_border
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.gb_1=create gb_1
this.r_bar=create r_bar
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_profile_view
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_meet_date
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.cbx_print_summary
this.Control[iCurrent+6]=this.cb_cancel
this.Control[iCurrent+7]=this.cb_send
this.Control[iCurrent+8]=this.dw_profile
this.Control[iCurrent+9]=this.dw_ver_info
this.Control[iCurrent+10]=this.r_print_stat_border
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.gb_1
this.Control[iCurrent+15]=this.r_bar
this.Control[iCurrent+16]=this.cb_1
end on

on w_send_to_committee.destroy
call super::destroy
destroy(this.dw_profile_view)
destroy(this.st_1)
destroy(this.dw_meet_date)
destroy(this.st_2)
destroy(this.cbx_print_summary)
destroy(this.cb_cancel)
destroy(this.cb_send)
destroy(this.dw_profile)
destroy(this.dw_ver_info)
destroy(this.r_print_stat_border)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.gb_1)
destroy(this.r_bar)
destroy(this.cb_1)
end on

event open;call super::open;ist_ids = Message.PowerObjectParm

DatawindowChild dwchild

dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("committee")

dw_meet_date.of_SetTransObject( SQLCA)
dw_meet_date.InsertRow( 0 )

dw_profile_view.of_SetTransObject( SQLCA)
dw_profile_view.InsertRow( 0 )

//Start Code Change ---- 12.13.2006 #V7 maha removed because duplicated none
//dwchild.InsertRow( 1 )
//dwchild.SetItem( 1, "profile_view_id", 0 )
//dwchild.SetItem( 1, "profile_view_name", "None" )
//End Code Change---12.13.2006
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 05.04.2006 By: Liu Hongxin
//$<reason> Appeon deal with NULL differently from that in PowerBuilder.
//$<modification> Set -999 as the initial value of dw_profile_view.
dw_profile_view.setitem(1 , 'profile_view_id',-999)
//---------------------------- APPEON END ----------------------------
r_bar.Width = 1

dw_meet_date.GetChild( "meeting_date", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( ist_ids.i_ids[2] ,Today() )

dw_profile_view.SetFocus()


end event

type dw_profile_view from u_dw within w_send_to_committee
integer x = 110
integer y = 164
integer width = 928
integer height = 104
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_pfl_select_views_dddw_list_no_hdr"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetReqColumn(True)
end event

type st_1 from statictext within w_send_to_committee
integer x = 114
integer y = 96
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
string text = "Profile View"
boolean focusrectangle = false
end type

type dw_meet_date from u_dw within w_send_to_committee
integer x = 110
integer y = 368
integer width = 814
integer height = 104
integer taborder = 70
boolean bringtotop = true
string dataobject = "d_cred_meeting_date"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateAble( False )
This.of_SetReqColumn(True)
end event

type st_2 from statictext within w_send_to_committee
integer x = 110
integer y = 304
integer width = 809
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
string text = "Committee Meeting Date"
boolean focusrectangle = false
end type

type cbx_print_summary from checkbox within w_send_to_committee
integer x = 119
integer y = 532
integer width = 763
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Print Verification Summary"
end type

type cb_cancel from u_cb within w_send_to_committee
integer x = 599
integer y = 948
integer width = 471
integer height = 84
integer taborder = 60
boolean bringtotop = true
string text = "Close"
boolean cancel = true
end type

event clicked;Integer li_ans

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.24.2006 By: LeiWei
//$<reason> Fix a defect.
//IF r_bar.Width = 1 THEN
IF r_bar.Width <= 1 OR Isnull(r_bar.Width) THEN
//---------------------------- APPEON END ----------------------------
	li_ans = MessageBox("Send To Committee", "Close without sending to committee?", Question!, YesNo!, 2)
	IF li_ans = 2 THEN
		Return 
	ELSE
		CloseWithReturn( Parent, "Cancel" )
	END IF
ELSE
	CloseWithReturn( Parent, "Sent" )	
END IF


end event

type cb_send from u_cb within w_send_to_committee
integer x = 82
integer y = 948
integer width = 471
integer height = 84
integer taborder = 50
boolean bringtotop = true
string text = "Send To Committee"
boolean default = true
end type

event clicked;pfc_cst_u_reports inv_reports
Integer li_prac_cnt
Integer i
Integer li_profile_view
Integer li_bar_ticks
Integer li_facility_id
Integer li_ans
Long ll_prac_id
Long ll_prac[]
Long li_facility_ids[]
Date ld_meet_date
Date ld_today = Today()
DateTime ldt_todaysDate
string ls_facility_name //maha110602

ldt_todaysDate = DateTime( Today() )

IF r_bar.Width > 1 THEN
	li_ans = MessageBox("Print", "Are you sure you want to Reprint?", Question!, YesNo!, 2)
	IF li_ans = 2 THEN
		Return
	END IF
END IF

r_bar.Width = 1

li_profile_view = dw_profile_view.GetItemNumber(1, "profile_view_id")


//Start Code Change ---- 12.13.2006 #V7 maha removed
///--------------------------- APPEON BEGIN ---------------------------
////$<modify> 05.08.2006 By: Liang QingShi
////$<reason> Fix a defect.
///*
//IF IsNull( li_profile_view ) THEN
//*/
//IF IsNull( li_profile_view ) or li_profile_view = -999 THEN
//
////---------------------------- APPEON END ----------------------------
//	MessageBox("Profile View", "A Profile View must be selected!", Question!)
//	dw_profile_view.SetFocus()
//	Return
//END IF
//End Code Change---12.13.2006
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 07.13.2006 By: LeiWei
//$<reason> Fix a defect.
//ld_meet_date = dw_meet_date.GetItemDate( 1, "meeting_date" )

string ls_datatype
ls_datatype = dw_meet_date.Describe( "meeting_date.ColType" )
IF ls_datatype = "date" THEN
	ld_meet_date = dw_meet_date.GetItemDate( 1, "meeting_date" )
ELSEIF ls_datatype = "datetime" THEN
	ld_meet_date = Date(dw_meet_date.GetItemDateTime( 1, "meeting_date" ))
END IF
//---------------------------- APPEON END ----------------------------

IF IsNull( ld_meet_date ) THEN
	MessageBox("Meeting Date", "A Meeting Date must be selected!", Question!)
	dw_meet_date.SetFocus()
	Return
END IF

SetPointer( HourGlass! )

inv_reports = CREATE	pfc_cst_u_reports


li_facility_id = ist_ids.i_ids[1]
li_facility_ids[1] = li_facility_id
li_prac_cnt = UpperBound( ist_ids.l_ids )

dw_ver_info.of_SetTransObject( SQLCA )

li_bar_ticks = 1000 / li_prac_cnt

FOR i = 1 TO li_prac_cnt
	ll_prac_id = ist_ids.l_ids[ i ]
	ll_prac[1] = ll_prac_id
	//IF li_profile_view <> 0 THEN
	IF li_profile_view > 0 THEN //Start Code Change ---- 03.13.2007 #V7 maha was printing a blank
		inv_reports.of_profile_report( dw_profile, li_facility_id, ll_prac_id, li_profile_view,false )
		dw_profile.Print()
	END IF
	IF cbx_print_summary.Checked THEN
		dw_ver_info.Retrieve(li_facility_ids, ll_prac) //maha modified to array 041305
		//\/maha added 11-06-02 to add facility name to report
		SELECT facility.facility_name  
		INTO :ls_facility_name  
		FROM facility  
		WHERE facility.facility_id = :li_facility_id   ;
		dw_ver_info.Modify( "selected_facility_t.text = '" + ls_facility_name + "'" )
		//\maha
		dw_ver_info.Print()
	END IF
	UPDATE pd_comm_review  
   SET date_sent_for_review = :ldt_TodaysDate 
   WHERE ( pd_comm_review.facility_id = :li_facility_id ) AND  
         ( pd_comm_review.prac_id = :ll_prac_id ) AND  
			( pd_comm_review.committee_id = :ist_ids.i_ids[2]) AND
         ( pd_comm_review.active_status in (1,4) )   ;
	IF SQLCA.SQLCODE < 0 THEN
		MessageBox("SQL Error", "Error updating pd_comm_review table." )
		ROLLBACK USING SQLCA;
		Return -1
	END IF
	r_bar.Width = r_bar.Width + li_bar_ticks
END FOR

COMMIT USING SQLCA;


Close( Parent )



end event

type dw_profile from u_dw within w_send_to_committee
boolean visible = false
integer x = 878
integer y = 20
integer width = 137
integer height = 96
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_prf_master"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

type dw_ver_info from u_dw within w_send_to_committee
boolean visible = false
integer x = 1029
integer y = 24
integer width = 137
integer height = 96
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_prf_ver_results"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

type r_print_stat_border from rectangle within w_send_to_committee
integer linethickness = 4
long fillcolor = 12632256
integer x = 69
integer y = 772
integer width = 1001
integer height = 56
end type

type st_4 from statictext within w_send_to_committee
integer x = 69
integer y = 840
integer width = 96
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
string text = "0%"
boolean focusrectangle = false
end type

type st_5 from statictext within w_send_to_committee
integer x = 951
integer y = 828
integer width = 133
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
string text = "100%"
boolean focusrectangle = false
end type

type st_6 from statictext within w_send_to_committee
integer x = 69
integer y = 708
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
string text = "Print Status"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_send_to_committee
integer x = 64
integer y = 44
integer width = 1006
integer height = 628
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type r_bar from rectangle within w_send_to_committee
long linecolor = 8388608
integer linethickness = 4
long fillcolor = 8388608
integer x = 73
integer y = 776
integer width = 992
integer height = 48
end type

type cb_1 from commandbutton within w_send_to_committee
integer x = 640
integer y = 364
integer width = 375
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Create Meeting"
end type

event clicked;close(parent)
open(w_meetings)
end event

