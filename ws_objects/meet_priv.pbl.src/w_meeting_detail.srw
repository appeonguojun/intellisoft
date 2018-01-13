$PBExportHeader$w_meeting_detail.srw
forward
global type w_meeting_detail from w_response
end type
type cb_4 from u_cb within w_meeting_detail
end type
type cb_non_prac from u_cb within w_meeting_detail
end type
type dw_list from u_dw within w_meeting_detail
end type
type dw_detail from u_dw within w_meeting_detail
end type
type dw_attendees from u_dw within w_meeting_detail
end type
type st_date from statictext within w_meeting_detail
end type
type st_1 from statictext within w_meeting_detail
end type
type cb_1 from u_cb within w_meeting_detail
end type
type cb_2 from u_cb within w_meeting_detail
end type
type cb_3 from u_cb within w_meeting_detail
end type
type cb_add_meet from u_cb within w_meeting_detail
end type
type cb_5 from u_cb within w_meeting_detail
end type
type cb_6 from u_cb within w_meeting_detail
end type
type cb_7 from u_cb within w_meeting_detail
end type
type cb_save from u_cb within w_meeting_detail
end type
type st_2 from statictext within w_meeting_detail
end type
type st_3 from statictext within w_meeting_detail
end type
type cb_8 from u_cb within w_meeting_detail
end type
type dw_roster from u_dw within w_meeting_detail
end type
type cb_batch from u_cb within w_meeting_detail
end type
type cb_copy from commandbutton within w_meeting_detail
end type
type cb_post from u_cb within w_meeting_detail
end type
end forward

global type w_meeting_detail from w_response
integer x = 37
integer y = 236
integer width = 3593
integer height = 2224
string title = "Meeting Detail"
long backcolor = 67108864
cb_4 cb_4
cb_non_prac cb_non_prac
dw_list dw_list
dw_detail dw_detail
dw_attendees dw_attendees
st_date st_date
st_1 st_1
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_add_meet cb_add_meet
cb_5 cb_5
cb_6 cb_6
cb_7 cb_7
cb_save cb_save
st_2 st_2
st_3 st_3
cb_8 cb_8
dw_roster dw_roster
cb_batch cb_batch
cb_copy cb_copy
cb_post cb_post
end type
global w_meeting_detail w_meeting_detail

type variables
Integer ii_meeting_id

DateTime idt_date

Boolean ib_new = FALSE

long	 il_facility_id		//Added by Scofield on 2008-09-22

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-08 By: Rodger Wu (Inova)
//$<reason> Default search facility id of current user.
Long il_default_facility = 0
//---------------------------- APPEON END ----------------------------
end variables

forward prototypes
public function integer of_setup_dddw ()
public function integer of_setup_taborder ()
public function integer wf_copy_detail ()
public function integer of_batch_add ()
end prototypes

public function integer of_setup_dddw ();datawindowchild dwchild

if dw_detail.getrow() < 1 then return -1  //Start Code Change ----01.03.2008 #V8 maha - trap for clicking between dates
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write script tp retrieve data from a cache instead of from database.
/*
dw_detail.GetChild("meeting_type", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("meeting type")

dw_list.GetChild("meeting_type", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("meeting type")

dw_detail.GetChild("location", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("meeting location")

dw_detail.GetChild("cme_category", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("cme category")

dw_detail.GetChild( "committee", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( dw_detail.GetItemNumber( dw_detail.getrow(), "facility")  )

//dw_detail.GetChild("facility", dwchild)
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve("facility")

dw_detail.GetChild("start_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")
dwchild.setsort( "custom_5")
dwchild.sort()

dw_detail.GetChild("end_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")
dwchild.setsort( "custom_5")
dwchild.sort()

dw_list.GetChild("start_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")

dw_list.GetChild("end_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")

dw_attendees.GetChild("attendence_status", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("attendence status")

dw_detail.GetChild("department", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("department")

dw_detail.GetChild("section", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("section")
*/
dw_detail.GetChild("meeting_type", dwchild)
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name)='" + upper("meeting type") + "'" , dwchild)

dw_list.GetChild("meeting_type", dwchild)
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name)='" + upper("meeting type") + "'" , dwchild)

dw_detail.GetChild("location", dwchild)
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name)='" + upper("meeting location") + "'" , dwchild)

dw_detail.GetChild("cme_category", dwchild)
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name)='" + upper("cme category") + "'" , dwchild)

dw_attendees.GetChild("attendence_status", dwchild)
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name)='" + upper("attendence status") + "'" , dwchild)

dw_detail.GetChild("department", dwchild)
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name)='" + upper("department") + "'" , dwchild)

dw_detail.GetChild("section", dwchild)
dwchild.SetTransObject( SQLCA )
gnv_data.of_set_dwchild_fromcache("code_lookup" , "upper(lookup_name)='" + upper("section") + "'" , dwchild)

gnv_appeondb.of_startqueue()

dw_detail.GetChild( "committee", dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve( dw_detail.GetItemNumber( dw_detail.getrow(), "facility")  )

dw_detail.GetChild("start_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")
dwchild.setsort( "custom_5")
dwchild.sort()

dw_detail.GetChild("end_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")
dwchild.setsort( "custom_5")
dwchild.sort()

dw_list.GetChild("start_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")

dw_list.GetChild("end_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")

gnv_appeondb.of_commitqueue()
//---------------------------- APPEON END ----------------------------

RETURN 0
end function

public function integer of_setup_taborder ();DataWindowChild dwchild
Integer 	li_found
Integer 	nullval
Integer 	row
String 	ls_data
String 	ls_meeting_type,ls_CmePresenter,ls_CmeAffiliation
decimal	ldc_CmeCredits,ldc_CmeCategory
long		ll_Committee

row = dw_detail.GetRow( )
IF row < 1 THEN
	RETURN -1
END IF

dw_detail.GetChild( "meeting_type", dwchild )
//from the meeting type get the lookup's code
IF dw_detail.GetColumnName( ) = "meeting_type" THEN
	ls_data = dw_detail.GetText( )
ELSE
	ls_data = String( dw_detail.GetItemNumber( row, "meeting_type" ) )
END IF

li_found = dwchild.Find( "lookup_code = " + ls_data, 1, 100 )
IF li_found < 1 THEN
	RETURN -1
END IF
ls_meeting_type = dwchild.GetItemString( li_found, "code" )
	
//dw_detail.Object.committee.dddw.required = 'No'	
//dw_detail.Object.department.dddw.required = 'No'
//dw_detail.Object.section.dddw.required = 'No'		
	
CHOOSE CASE Upper( ls_meeting_type )
   CASE "CME"
	   dw_detail.Object.cme_credits.Background.Color = RGB( 255, 255, 255 )
	   dw_detail.Object.cme_category.Background.Color = RGB( 255, 255, 255 )
	   dw_detail.Object.cme_presenter.Background.Color = RGB( 255, 255, 255 )
	   dw_detail.Object.cme_affiliation.Background.Color = RGB( 255, 255, 255 )
		dw_detail.Object.cme_credits.TabSequence = 110
		dw_detail.Object.cme_category.TabSequence = 120
		dw_detail.Object.cme_presenter.TabSequence = 130		
		dw_detail.Object.cme_affiliation.TabSequence = 140	
		dw_detail.Object.department.Visible = "0"
		dw_detail.Object.section.Visible = "0"
		dw_detail.Object.section.TabSequence = 0
		dw_detail.Object.label_t.Visible = "0" //Start Code Change ----04.21.2008 #V8 maha - made invisible
		dw_detail.Object.committee.Visible = "0"  //Start Code Change ----04.21.2008 #V8 maha - made invisible
		//dw_detail.Object.section.Background.Color = RGB( 255, 255, 255 )
		dw_detail.Object.department.TabSequence = 0
		//dw_detail.Object.department.TabSequence = 0
		of_setup_dddw( )			
	CASE "CRED COMMITTEE","COMMITTEE"
		dw_detail.Object.committee.Visible = "1"			
	   dw_detail.Object.committee.Background.Color = RGB( 255, 255, 255 )		
		dw_detail.Object.committee.TabSequence = 90
		dw_detail.Object.section.Visible = "0"
		dw_detail.Object.department.Visible = "0"
		dw_detail.Object.label_t.Text = ls_meeting_type
		dw_detail.Object.label_t.Visible = "1"
	//	dw_detail.Object.committee.dddw.required = 'Yes'			
		of_setup_dddw( )
	CASE "DEPARTMENT"
		dw_detail.Object.committee.Visible = "0"
		dw_detail.Object.section.Visible = "0"
		dw_detail.Object.department.Visible = "1"			
		dw_detail.Object.department.TabSequence = 90				
		dw_detail.Object.label_t.Text = ls_meeting_type	
		dw_detail.Object.label_t.Visible = "1"
	//	dw_detail.Object.department.dddw.required = 'Yes'		
	CASE "SECTION"
		dw_detail.Object.committee.Visible = 0
		dw_detail.Object.department.Visible = 0		
		dw_detail.Object.section.Visible = '1'
		dw_detail.Object.section.TabSequence = 90
		dw_detail.Object.label_t.Text = ls_meeting_type	
		dw_detail.Object.label_t.Visible = "1"
	//	dw_detail.Object.section.dddw.required = 'Yes'
//Start Code Change ----04.03.2008 #V8 maha - changed to else from 'Other' for any other meeting types;  removed previous else code
	CASE Else
	//CASE "OTHER"
		dw_detail.Object.committee.Visible = "0"			
	   dw_detail.Object.committee.Background.Color = RGB( 255, 255, 255 )		
		dw_detail.Object.committee.TabSequence = 90
		dw_detail.Object.section.Visible = "0"
		dw_detail.Object.department.Visible = "0"
		dw_detail.Object.label_t.Visible = "0"
	//	dw_detail.Object.committee.dddw.required = 'Yes'			
		of_setup_dddw( )
//End Code Change---04.03.2008
		
END CHOOSE

SetNull(nullval)
IF Upper( ls_meeting_type ) <> "CME" THEN
	dw_detail.Object.cme_credits.Background.Color = RGB( 192, 192, 192 )
	dw_detail.Object.cme_credits.TabSequence = 0
	ldc_CmeCredits = dw_Detail.GetItemDecimal(row,"cme_credits")									//Added by Scofield on 2008-09-22
	if Not IsNull(ldc_CmeCredits) then dw_detail.SetItem( row, "cme_credits",  nullval)
	
	dw_detail.Object.cme_category.Background.Color = RGB( 192, 192, 192 )
	dw_detail.Object.cme_category.TabSequence = 0
	ldc_CmeCategory = dw_Detail.GetItemDecimal(row,"cme_category")									//Added by Scofield on 2008-09-22
	if Not IsNull(ldc_CmeCategory) then dw_detail.SetItem( row, "cme_category", nullval)
	
	dw_detail.Object.cme_presenter.Background.Color = RGB( 192, 192, 192 )
	dw_detail.Object.cme_presenter.TabSequence = 0
	ls_CmePresenter = dw_Detail.GetItemString(row,"cme_presenter")									//Added by Scofield on 2008-09-22
	if ls_CmePresenter <> "" then dw_detail.SetItem( row, "cme_presenter", "" )
	
	dw_detail.Object.cme_affiliation.Background.Color = RGB( 192, 192, 192 )
	dw_detail.Object.cme_affiliation.TabSequence = 0
	ls_CmeAffiliation = dw_Detail.GetItemString(row,"cme_affiliation")							//Added by Scofield on 2008-09-22
	if Not IsNull(ls_CmeAffiliation) then dw_detail.SetItem( row, "cme_affiliation", nullval )
END IF

IF Upper( ls_meeting_type ) <> "CRED COMMITTEE"  and  Upper( ls_meeting_type ) <> "COMMITTEE" THEN
	dw_detail.Object.committee.Background.Color = RGB( 192, 192, 192 )
	dw_detail.Object.committee.TabSequence = 0
	ll_Committee = dw_Detail.GetItemNumber(row,"committee")											//Added by Scofield on 2008-09-22
	if Not IsNull(ll_Committee) then dw_detail.SetItem( row, "committee", nullval )
END IF

RETURN 0

end function

public function integer wf_copy_detail ();
///his function added maha 060403

Integer li_org
Integer li_nr
Integer li_meeting_id
integer res
integer ac
integer a



if dw_list.rowcount( ) < 1 then return 1

li_org = dw_detail.getrow()

//Start Code Change ----01.03.2008 #V8 maha - removed save to copy button to allow for validation trap
//cb_save.triggerevent(clicked!)

li_meeting_id = gnv_app.of_get_id("MEETING")

li_nr = dw_detail.InsertRow( 0 )
dw_detail.ScrollToRow( li_nr )
dw_detail.SetRow( li_nr )
dw_detail.SetFocus( )

dw_list.selectrow(0,false)
dw_list.selectrow(li_nr,true)


dw_detail.SetItem( li_nr, "meeting_id"  , li_meeting_id)
dw_detail.SetItem( li_nr, "facility"    , dw_detail.getitemnumber(li_org,"facility") ) //copy values
dw_detail.SetItem( li_nr, "meeting_type", dw_detail.getitemnumber(li_org,"meeting_type") )
dw_detail.SetItem( li_nr, "location"    , dw_detail.getitemnumber(li_org,"location") )
dw_detail.SetItem( li_nr, "start_time"  , dw_detail.getitemnumber(li_org,"start_time") )
dw_detail.SetItem( li_nr, "end_time"    , dw_detail.getitemnumber(li_org,"end_time") )
dw_detail.SetItem( li_nr, "subject"     , dw_detail.getitemstring(li_org,"subject") )
dw_detail.SetItem( li_nr, "cme_credits" , dw_detail.getitemnumber(li_org,"cme_credits") )
dw_detail.SetItem( li_nr, "cme_category", dw_detail.getitemnumber(li_org,"cme_category") )
dw_detail.SetItem( li_nr, "cme_presenter", dw_detail.getitemstring(li_org,"cme_presenter") )
dw_detail.SetItem( li_nr, "cme_affiliation", dw_detail.getitemstring(li_org,"cme_affiliation") )
dw_detail.SetItem( li_nr, "section"     , dw_detail.getitemdecimal(li_org,"section") )
dw_detail.SetItem( li_nr, "committee"   , dw_detail.getitemnumber(li_org,"committee") )
dw_detail.SetItem( li_nr, "department"  , dw_detail.getitemnumber(li_org,"department") )

 
dw_attendees.reset() 




return 1
end function

public function integer of_batch_add ();//Start Code Change ---- 10.03.2006 #650 maha
//function created 10.03.06 maha called from cb_batch and cb_non_prac
long i
long ic
long li_prac_id
long li_find
long li_nr
string ls_full_name
gs_batch_search ist_search

if not isvalid(message.powerobjectparm) then return 0
ist_search = message.powerobjectparm

ic = upperbound(ist_search.li_prac_id[])
for i = 1 to ic
	li_prac_id = ist_search.li_prac_id[i] 
	select full_name into :ls_full_name from v_full_name where prac_id = :li_prac_id;
	
	li_find = dw_attendees.Find( "prac_id = " + String( li_prac_id ), 1, 1000 )
	
	IF li_find > 0 THEN
		MessageBox("Select Error", "You have already selected this person to attend!, Please reselect." )
		Return -1
	END IF
	
	li_nr = dw_attendees.InsertRow( 0 )
	
	dw_attendees.SetItem( li_nr, "prac_id", li_prac_id )
	dw_attendees.SetItem( li_nr, "cfull_name", ls_full_name )
	dw_attendees.SetItem( li_nr, "meeting_id", dw_detail.GetItemNumber( dw_detail.GetRow( ), "meeting_id" ) )
next

dw_detail.SetFocus( )

return 1
end function

on w_meeting_detail.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_non_prac=create cb_non_prac
this.dw_list=create dw_list
this.dw_detail=create dw_detail
this.dw_attendees=create dw_attendees
this.st_date=create st_date
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_add_meet=create cb_add_meet
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_save=create cb_save
this.st_2=create st_2
this.st_3=create st_3
this.cb_8=create cb_8
this.dw_roster=create dw_roster
this.cb_batch=create cb_batch
this.cb_copy=create cb_copy
this.cb_post=create cb_post
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_non_prac
this.Control[iCurrent+3]=this.dw_list
this.Control[iCurrent+4]=this.dw_detail
this.Control[iCurrent+5]=this.dw_attendees
this.Control[iCurrent+6]=this.st_date
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_add_meet
this.Control[iCurrent+12]=this.cb_5
this.Control[iCurrent+13]=this.cb_6
this.Control[iCurrent+14]=this.cb_7
this.Control[iCurrent+15]=this.cb_save
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.cb_8
this.Control[iCurrent+19]=this.dw_roster
this.Control[iCurrent+20]=this.cb_batch
this.Control[iCurrent+21]=this.cb_copy
this.Control[iCurrent+22]=this.cb_post
end on

on w_meeting_detail.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_non_prac)
destroy(this.dw_list)
destroy(this.dw_detail)
destroy(this.dw_attendees)
destroy(this.st_date)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_add_meet)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_save)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cb_8)
destroy(this.dw_roster)
destroy(this.cb_batch)
destroy(this.cb_copy)
destroy(this.cb_post)
end on

event open;call super::open;String ls_date_part
Date ld_date
DataWindowChild dwchild

IF Pos(Message.StringParm, "New" ) > 0 THEN
	ib_new = True
	ls_date_part = Mid(Message.StringParm, POS(Message.StringParm, "-") +1, 100 )
	ld_date = Date( ls_date_part )
	idt_date =  DateTime( ld_date )
ELSE
	ib_new = False	
	idt_date =  DateTime( Date( Message.StringParm ) )
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-03
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
/*
dw_attendees.of_SetTransObject( SQLCA )
dw_attendees.GetChild("attendence_status", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Attendence Status")
dw_detail.of_SetTransObject( SQLCA )
dw_detail.getchild("facility",dwchild)
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)
dw_detail.GetChild("start_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")
dwchild.setsort("custom_5")
dwchild.sort()
dw_detail.GetChild("end_time", dwchild)
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("time")
dwchild.setsort("custom_5")
dwchild.sort()
*/
//gnv_appeondb.of_startqueue( )
dw_attendees.of_SetTransObject( SQLCA )

dw_detail.of_SetTransObject( SQLCA )
dw_detail.getchild("facility",dwchild)
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 2006-10-08 By: Rodger Wu (Inova)
//$<reason> Make facility filter sync with w_meetings window.
/*
IF ib_new THEN
	cb_add_meet.Event Clicked()
	//dw_detail.getchild("facility",dwchild)
	//dw_child.retrieve(gs_user_id)
ELSE
	dw_detail.Retrieve( idt_date ,gs_user_id)
END IF
*/
Boolean lb_all

IF Isvalid( w_meetings ) THEN
	il_facility_id = w_meetings.il_facility_id
	
	//IF w_meetings.dw_facility_select.GetItemNumber( 1, "facility_id" ) <> 0 THEN //0 means ALL facilities.		//Commented by Scofield on 2008-09-22
	IF il_facility_id <> 0 THEN 
		dwchild.SetFilter( "facility_id = " + string( il_facility_id ) )
		dwchild.Filter()
	ELSE
		lb_all = True
	END IF
ELSE
	SELECT security_users.default_search_facility 
	 INTO :il_facility_id  
	 FROM security_users
	WHERE security_users.user_id = :gs_user_id;
	
	if IsNull(il_facility_id) then			//Added by Scofield on 2008-09-10
		lb_all = True
	else
		dwchild.SetFilter( "facility_id = " + string( il_facility_id ) )
		dwchild.Filter()
	end if
END IF

IF ib_new THEN
	cb_add_meet.Event Clicked()
ELSE
	IF dw_detail.Retrieve( idt_date ,gs_user_id) > 1 THEN
		IF Not lb_all THEN
			dw_detail.SetFilter( "facility = " + string( il_facility_id ) )
			dw_detail.Filter()
		END IF
	END IF
END IF
//---------------------------- APPEON END ----------------------------

//COMMIT USING SQLCA;

//retrieve dddw's

of_setup_dddw( )
of_setup_taborder(  )


dw_detail.ShareData( dw_list )

dw_list.of_Setupdateable( False )

String months[12]

months[1] = "January"
months[2] = "February"
months[3] = "March"
months[4] = "April"
months[5] = "May"
months[6] = "June"
months[7] = "July"
months[8] = "August"
months[9] = "September"
months[10] = "October"
months[11] = "November"
months[12] = "December"

st_date.Text = String( DayName( Date( idt_date ) ) ) +&
				   " " + months[ Month( Date( idt_date ) ) ] +&
               " " + String( Day( Date( idt_date ) ) ) +&
					" " + String( Year( Date( idt_date ) ) )

dw_list.of_SetDropDownCalendar( TRUE )
dw_list.iuo_calendar.of_Register(dw_list.iuo_calendar.DDLB)		

dw_detail.of_SetDropDownCalendar( TRUE )
dw_detail.iuo_calendar.of_Register(dw_detail.iuo_calendar.DDLB)		

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-08 By: Rodger Wu (Inova)
//$<reason> Fix a defect.
Integer li_current

li_current = dw_detail.GetRow()
IF li_current > 0 THEN
	dw_detail.SetItemStatus( li_current, 0, Primary!, NotModified! )
END IF
//---------------------------- APPEON END ----------------------------

end event

type cb_4 from u_cb within w_meeting_detail
integer x = 2999
integer y = 1848
integer width = 562
integer height = 84
integer taborder = 120
boolean bringtotop = true
string text = "Delete All Attendees"
end type

event clicked;//Start Code Change ----04.25.2008 #V8 maha -  added this button
Integer 	li_ans
long 		ll_Cycle,ll_RowCnt

li_ans = MessageBox("Delete", "Are you sure you want to delete All of the attendees?", Question!, YesNo!, 1 )
IF li_ans = 1 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 2008-04-29 By: Scofield
	//$<Reason> Delete all rows .

	//	for ll_Cycle = 1 to dw_attendees.rowcount()
	//		dw_attendees.DeleteRow( 1 )
	//	next
	
	ll_RowCnt = dw_Attendees.RowCount()
	
	for ll_Cycle = 1 to ll_RowCnt
		dw_attendees.DeleteRow(1)
	next
	//---------------------------- APPEON END ----------------------------
END IF

dw_detail.SetFocus( )

end event

type cb_non_prac from u_cb within w_meeting_detail
integer x = 2414
integer y = 1952
integer width = 562
integer height = 84
integer taborder = 120
boolean bringtotop = true
string text = "Add Non-Practitioners"
end type

event clicked;//Start Code Change ---- 10.04.2006 #649 maha cb_non_prac button added

if dw_list.rowcount() < 1 then //see that the meeting has been entered
	return 0
end if 

if isnull(dw_detail.getitemnumber(1,"facility")) then //maha 010604
	messagebox("Reminder","Please select meeting Facility before adding attendees")
	return -1
end if

openwithparm(w_non_prac_painter,"S")

IF Message.DoubleParm = -1 THEN
	Return -1
else
	of_batch_add( )
END IF


end event

type dw_list from u_dw within w_meeting_detail
integer x = 23
integer y = 168
integer width = 2331
integer height = 764
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_meetings_list"
boolean hscrollbar = true
boolean ib_isupdateable = false
end type

event rowfocuschanged;call super::rowfocuschanged;Integer li_rc,li_ret
Integer i
Integer li_found
integer li_facil
integer li_meeting
DataWindowChild dwchild
dw_detail.setredraw(false)
IF currentrow > 0 THEN
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 01.13.2006 By: LeiWei
	//$<reason> Fix a defect.
	//li_found = dw_detail.Find( "meeting_id = " + String( +&
  	// 	        This.GetItemNumber( currentrow, "meeting_id" ) ), 1, 10000 )
	//li_meeting = This.GetItemNumber( currentrow, "meeting_id" )		  
	li_meeting = This.GetItemNumber( currentrow, "meeting_id" )
	If Isnull(li_meeting) Then li_meeting = 0
	li_found = dw_detail.Find( "meeting_id = " + String( +&
 	 	        li_meeting ), 1, 10000 )
	//---------------------------- APPEON END ----------------------------
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-07
	//$<add> 01.17.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_startqueue( )
	//---------------------------- APPEON END ----------------------------

	IF li_found > 0 THEN
		dw_detail.ScrollToRow( li_found )
		dw_detail.SetRow( li_found )
		//\/maha 082900
		li_facil = This.GetItemNumber( currentrow, "facility" )
		dw_detail.GetChild( "committee", dwchild )
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( li_facil )
		//\maha
		
	END IF
	This.SelectRow( 0, False)
	This.SelectRow( currentrow, True )
END IF
//\/moved from dw_detail RFC event maha 101100
IF currentrow > 0 THEN	
	dw_attendees.Retrieve( This.GetItemNumber( currentrow, "meeting_id" ) )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-08
	//$<add> 01.17.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	gnv_appeondb.of_commitqueue( )
	//---------------------------- APPEON END ----------------------------

	li_rc = dw_attendees.RowCount( )
//	FOR i = 1 TO li_rc
//		dw_attendees.SetItem( i, "cfull_name", dw_attendees.GetItemString( i, "full_name" ) )
//	END FOR
	of_setup_taborder(  )

end if
dw_detail.setredraw(true)
//\maha
end event

event rowfocuschanging;call super::rowfocuschanging;//Added by Nova.zhang on 2008-12-12
  
Integer li_ret  

if dw_attendees.modifiedcount( ) +dw_attendees.deletedcount( )>0 then
	li_ret=messagebox("Question","Data has been changged,do you want to save?",Question!,yesno!,2)
	if li_ret=1 then 
		Parent.Event pfc_save( )
	end if
end if	
end event

type dw_detail from u_dw within w_meeting_detail
integer x = 18
integer y = 1028
integer width = 2331
integer height = 1004
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_meeting_detail"
boolean vscrollbar = false
end type

event rowfocuschanged;call super::rowfocuschanged;//moved to dw_list rfc event 101100 maha
//Integer li_rc
//Integer i
//
IF currentrow > 0 THEN
//	dw_attendees.Retrieve( This.GetItemNumber( currentrow, "meeting_id" ) )
//	li_rc = dw_attendees.RowCount( )
//	FOR i = 1 TO li_rc
//		dw_attendees.SetItem( i, "cfull_name", dw_attendees.GetItemString( i, "full_name" ) )
//	END FOR
	of_setup_taborder(  )
END IF
end event

event itemchanged;call super::itemchanged;IF This.GetColumnName( ) = "meeting_type" THEN
	of_setup_taborder(  )
END IF

IF This.GetColumnName() = "facility" THEN
	DataWindowChild dwchild
	Integer nullint
	SetNull( nullint)
	This.GetChild( "committee", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( Integer( data ) )
	This.SetItem( row, "committee", nullint )
END IF

IF This.GetColumnName( ) = "start_date" THEN
	this.accepttext()
	this.setitem(this.getrow(),"end_date",this.getitemdatetime(this.getrow(),"start_date"))
END IF
end event

event constructor;This.of_SetReqColumn(TRUE)


end event

event retrieveend;call super::retrieveend;IF this.getrow() > 0 THEN
//messagebox("","retv_end")
	of_setup_taborder(  )
END IF

end event

type dw_attendees from u_dw within w_meeting_detail
integer x = 2405
integer y = 168
integer width = 1157
integer height = 1568
integer taborder = 80
boolean bringtotop = true
string dataobject = "d_meeting_attendence"
end type

event pfc_preupdate;call super::pfc_preupdate;//maha 010604 v4
long i
long prac
long z
string pname

for i = 1 to this.rowcount() - 1
	prac = this.getitemnumber(i,"prac_id")
	for z = 1 to this.rowcount()
		if i = z then continue
		if prac = this.getitemnumber(z,"prac_id") then
			select full_name into :pname from v_full_name where prac_id = :prac;
			Messagebox("Duplicate Attendee","Practitioner " + pname + " is duplicated.  Please remove the extra record.")
			return -1
		end if
	next
next

return 1
end event

type st_date from statictext within w_meeting_detail
integer x = 9
integer y = 8
integer width = 1019
integer height = 84
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "October 5 1998"
boolean focusrectangle = false
end type

type st_1 from statictext within w_meeting_detail
integer x = 2409
integer y = 112
integer width = 293
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 80269524
boolean enabled = false
string text = "Attendees"
boolean focusrectangle = false
end type

type cb_1 from u_cb within w_meeting_detail
integer x = 2414
integer y = 1752
integer width = 562
integer height = 84
integer taborder = 90
boolean bringtotop = true
string text = "Add Single Attendee"
end type

event clicked;Integer li_nr
Integer li_find
long li_prac_id
String ls_full_name
integer i
integer ic
gs_batch_search ist_search

// mskinner 20 Dec 2005 -- begin
if dw_list.rowcount() <1 then 
	return 0
end if 
// mskinner 20 Dec 2005 -- end

if isnull(dw_detail.getitemnumber(1,"facility")) then //maha 010604
	messagebox("Reminder","Please select meeting Facility before adding attendees")
	return -1
end if
//\/maha added 110901
gs_search lstr_search

lstr_search.stran_transaction = SQLCA
lstr_search.ls_open_for = "REPORTS" + String(dw_detail.GetItemNumber( dw_Detail.GetRow(), "facility"))//maha 052302 changed from MEETINGS

OpenWithParm( w_extended_search_new , lstr_search )
//\ maha
//OpenWithParm( w_extended_search_new, "REPORTS" + String(dw_detail.GetItemNumber( dw_Detail.GetRow(), "facility")) )

IF Message.DoubleParm = -1 THEN
	Return -1
END IF

ist_search = message.powerobjectparm
//maha 091605 allowing for multi selection

// mskinner 21 dec 2005 -- begin
if not isvalid(message.powerobjectparm) then return 0
// mskinner 21 dec 2005 -- end

ic = upperbound(ist_search.li_prac_id[])
for i = 1 to ic
	li_prac_id = ist_search.li_prac_id[i] //maha 091605
	select full_name into :ls_full_name from v_full_name where prac_id = :li_prac_id;
	//ls_full_name = ist_search.ls_name[i] //maha 091605


	li_find = dw_attendees.Find( "prac_id = " + String( li_prac_id ), 1, 1000 )
	
	IF li_find > 0 THEN
		MessageBox("Select Error", "You have already selected this person to attend!, Please reselect." )
		Return -1
	END IF
	
	li_nr = dw_attendees.InsertRow( 0 )
	
	dw_attendees.SetItem( li_nr, "prac_id", li_prac_id )
	//messagebox("", li_prac_id )
	dw_attendees.SetItem( li_nr, "cfull_name", ls_full_name )
	dw_attendees.SetItem( li_nr, "meeting_id", dw_detail.GetItemNumber( dw_detail.GetRow( ), "meeting_id" ) )
next
//li_prac_id = Integer( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1 ) )
//ls_full_name = Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 100 )
//
//li_find = dw_attendees.Find( "prac_id = " + String( li_prac_id ), 1, 1000 )
//
//IF li_find > 0 THEN
//	MessageBox("Select Error", "You have already selected this person to attend!, Please reselect." )
//	Return -1
//END IF
//


//li_nr = dw_attendees.InsertRow( 0 )

//dw_attendees.SetItem( li_nr, "meeting_id", +&
//             dw_detail.GetItemNumber( dw_detail.GetRow( ), "meeting_id" ) )

//dw_attendees.SetItem( li_nr, "prac_id", li_prac_id )
//dw_attendees.SetItem( li_nr, "cfull_name", ls_full_name )

dw_detail.SetFocus( )


end event

type cb_2 from u_cb within w_meeting_detail
integer x = 2999
integer y = 1748
integer width = 562
integer height = 84
integer taborder = 100
boolean bringtotop = true
string text = "Delete Attendee"
end type

event clicked;Integer li_ans

li_ans = MessageBox("Delete", "Are you sure you want to delete attendee?", Question!, YesNo!, 1 )
IF li_ans = 1 THEN
	dw_attendees.DeleteRow( 0 )
END IF


end event

type cb_3 from u_cb within w_meeting_detail
integer x = 1979
integer y = 12
integer width = 375
integer height = 84
integer taborder = 40
boolean bringtotop = true
string text = "&Delete Meeting"
end type

event clicked;Integer li_ans

li_ans = MessageBox("Delete Row", "Are you sure you want to delete selected row?", Question!, YesNo!, 1 )

IF li_ans = 1 THEN
	dw_detail.DeleteRow( 0 )
END IF

dw_detail.SetFocus( )
end event

type cb_add_meet from u_cb within w_meeting_detail
integer x = 1234
integer y = 12
integer width = 366
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "&Add Meeting"
end type

event clicked;Integer li_nr
Integer li_meeting_id

cb_save.triggerevent(clicked!)

li_meeting_id = gnv_app.of_get_id("MEETING")

li_nr = dw_detail.InsertRow( 0 )
dw_detail.SetItem( li_nr, "meeting_id", li_meeting_id)
dw_detail.SetItem( li_nr, "start_date", idt_date )
dw_detail.SetItem( li_nr, "end_date", idt_date )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-08 By: Rodger Wu (Inova)
//$<reason> Set default facility.

////Added by Nova on 2008-09-27 fixed BugN092701
if il_facility_id<>0 then  dw_detail.SetItem( li_nr, "facility", il_facility_id)  //Modified by Scofield on 2008-09-22

//---------------------------- APPEON END ----------------------------

dw_detail.ScrollToRow( li_nr )
dw_detail.SetRow( li_nr )
dw_detail.SetFocus( )
dw_list.selectrow(0,false)
dw_list.selectrow(li_nr,true)

dw_attendees.reset()


end event

type cb_5 from u_cb within w_meeting_detail
integer x = 3191
integer y = 12
integer width = 366
integer height = 84
integer taborder = 70
boolean bringtotop = true
string text = "&Close"
boolean cancel = true
end type

event clicked;Close( Parent )
end event

type cb_6 from u_cb within w_meeting_detail
integer x = 2999
integer y = 1952
integer width = 562
integer height = 84
integer taborder = 130
boolean bringtotop = true
string text = "Print &Roster"
end type

event clicked;integer i
integer s //Start Code Change ---- 10.03.2006 #648 maha

i = Parent.Event pfc_save( )

if i < 0 then
	//save failed
else
	//Start Code Change ---- 10.03.2006 #648 maha
	s = of_get_app_setting("set_46", "I")
	if s = 1 then
		dw_roster.dataobject = "d_rpt_meeting_roster_inova"
		dw_roster.settransobject( sqlca)
	end if
	//End Code Change---10.03.2006
	dw_roster.Retrieve( dw_detail.GetItemNumber( dw_detail.GetRow(), "meeting_id" ))
	dw_roster.Print()
	dw_detail.SetFocus( )
end if
end event

type cb_7 from u_cb within w_meeting_detail
integer x = 2363
integer y = 12
integer width = 439
integer height = 84
integer taborder = 50
boolean bringtotop = true
string text = "Print Meeting &List"
end type

event clicked;dw_list.print()

dw_detail.SetFocus( )
end event

type cb_save from u_cb within w_meeting_detail
integer x = 2816
integer y = 12
integer width = 366
integer height = 84
integer taborder = 60
boolean bringtotop = true
string text = "&Save"
end type

event clicked;Parent.Event pfc_save( )

dw_detail.SetFocus( )
end event

type st_2 from statictext within w_meeting_detail
integer x = 27
integer y = 112
integer width = 590
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 80269524
boolean enabled = false
string text = "Select Meeting"
boolean focusrectangle = false
end type

type st_3 from statictext within w_meeting_detail
integer x = 27
integer y = 964
integer width = 667
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 80269524
boolean enabled = false
string text = "Meeting Detail"
boolean focusrectangle = false
end type

type cb_8 from u_cb within w_meeting_detail
boolean visible = false
integer x = 1938
integer y = 940
integer width = 416
integer height = 76
integer taborder = 160
boolean bringtotop = true
string text = "Generate Letters"
end type

type dw_roster from u_dw within w_meeting_detail
boolean visible = false
integer x = 2363
integer y = 2044
integer width = 146
integer height = 76
integer taborder = 0
boolean bringtotop = true
string dataobject = "d_rpt_meeting_roster"
boolean vscrollbar = false
end type

event constructor;This.of_SetTransObject( SQLCA )

end event

type cb_batch from u_cb within w_meeting_detail
integer x = 2414
integer y = 1852
integer width = 562
integer height = 84
integer taborder = 110
boolean bringtotop = true
string text = "Batch Add Attendee"
end type

event clicked;//Start Code Change ---- 10.03.2006 #647 maha changed to use function
openwithparm(w_batch_prac_select_new,"R")

if message.stringparm = "Cancel" then 
	return
else
	of_batch_add( )
end if
//End Code Change---10.03.2006

end event

type cb_copy from commandbutton within w_meeting_detail
integer x = 1609
integer y = 12
integer width = 366
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "C&opy to New"
end type

event clicked;//this function added maha 060403
boolean lb_attend = false //maha010308
Integer li_org
Integer li_nr
Integer li_meeting_id
integer res
integer ac
integer a
string ls_full_name[]
LONG LL_PRAC_ID[]
STRING LS_cfull_name[]
long r
long ll_meet_id
		
if dw_list.rowcount( ) < 1 then 
	return -1
end if

PARENT.setredraw(false)
ac = dw_attendees.rowcount()
//Start Code Change ----01.03.2008 #V8 maha - modified code so that it could correctly trap for validation errors
if Parent.Event pfc_save( ) < 0 then 
	PARENT.setredraw(true) //Added By Ken.Guo 04.21.2008
	Return -1
End If

if ac > 0 then
	IF messagebox("Copy","Do you wish to copy the Attendees also?",question!,yesno!,1) = 1 THEN	
		lb_attend = true
		for a = 1 to dw_attendees.rowcount()
			LL_PRAC_ID[upperbound(LL_PRAC_ID) + 1] = dw_attendees.getitemnumber(a,"prac_id")
			LS_cfull_name[upperbound(LS_cfull_name) + 1]       = dw_attendees.getitemstring(a,"cfull_name")
			ls_full_name[upperbound(ls_full_name) + 1]                   = dw_attendees.getitemstring(a,"v_full_name_full_name")
		next
	END IF
end if

if wf_copy_detail() < 1 then 
	PARENT.setredraw(true) //Added By Ken.Guo 04.21.2008
	return -1
end if

if lb_attend =  true then
	ll_meet_id = dw_detail.GetItemNumber( dw_detail.GetRow( ), "meeting_id" ) 
			
	for r = 1 to upperbound(LL_PRAC_ID)
		dw_attendees.InsertRow( r )
		dw_attendees.SetItem( r, "meeting_id", ll_meet_id )
		dw_attendees.SetItem( r, "prac_id", LL_PRAC_ID[r] )
		dw_attendees.SetItem( r, "cfull_name", LS_cfull_name[R] )
		dw_attendees.SetItem( r, "v_full_name_full_name", ls_full_name[r] )
	next
end if

//wf_copy_detail()  //Start Code Change ---- 10.11.2007 #V7 maha moved from above
//End Code Change---01.03.2008

PARENT.setredraw(true)
		
end event

type cb_post from u_cb within w_meeting_detail
boolean visible = false
integer x = 1778
integer y = 2044
integer width = 261
integer height = 84
integer taborder = 150
string text = "Post CME Records"
end type

event clicked;call super::clicked;Integer li_rc
Integer i

//dw_attendees
end event

