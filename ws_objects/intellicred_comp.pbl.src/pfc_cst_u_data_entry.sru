$PBExportHeader$pfc_cst_u_data_entry.sru
forward
global type pfc_cst_u_data_entry from userobject
end type
type dw_addresses from u_dw within pfc_cst_u_data_entry
end type
type st_recs from statictext within pfc_cst_u_data_entry
end type
type dw_select_section from u_dw within pfc_cst_u_data_entry
end type
type dw_ver_data from u_dw within pfc_cst_u_data_entry
end type
type dw_link_list from u_dw within pfc_cst_u_data_entry
end type
type dw_browse from u_dw within pfc_cst_u_data_entry
end type
type tab_view from tab within pfc_cst_u_data_entry
end type
type tabpage_browse from userobject within tab_view
end type
type tabpage_browse from userobject within tab_view
end type
type tabpage_details from userobject within tab_view
end type
type tabpage_details from userobject within tab_view
end type
type tabpage_image from userobject within tab_view
end type
type dw_detail_2 from u_dw within tabpage_image
end type
type tabpage_image from userobject within tab_view
dw_detail_2 dw_detail_2
end type
type tab_view from tab within pfc_cst_u_data_entry
tabpage_browse tabpage_browse
tabpage_details tabpage_details
tabpage_image tabpage_image
end type
type r_1 from rectangle within pfc_cst_u_data_entry
end type
type dw_detail from u_dw within pfc_cst_u_data_entry
end type
end forward

global type pfc_cst_u_data_entry from userobject
integer width = 3543
integer height = 1712
boolean border = true
long backcolor = 79741120
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event pfc_cst_preupdate ( )
event pfc_cst_field_defaults ( )
event pfc_cst_update_dddw ( )
event type integer ue_after_itemchanged ( )
event pfc_cst_nextrecord ( )
event pfc_cst_import_photo ( )
dw_addresses dw_addresses
st_recs st_recs
dw_select_section dw_select_section
dw_ver_data dw_ver_data
dw_link_list dw_link_list
dw_browse dw_browse
tab_view tab_view
r_1 r_1
dw_detail dw_detail
end type
global pfc_cst_u_data_entry pfc_cst_u_data_entry

type variables

pfc_cst_nv_data_entry_functions inv_data_entry
pfc_cst_u_verification_info inv_verification_info
w_prac_data_1 parent_window
w_prac_data_design parent_window_design

w_prac_profile_design parent_window_profile_design

Integer ii_screen_id
Integer ii_column_cnt
Integer ii_address_lnk_cnt
Integer il_last_de_row

Long il_prac_id 
Long il_rec_id
Long il_data_view = 1
Integer ii_org_id = 1
Integer ii_parent_facility_id 
Integer ii_verifying_facility_id
Long il_addr_id
long il_hosp_id

Boolean ib_screen_painter = False
Boolean ib_new_prac = False
Boolean ib_setup_dddw = True
Boolean ib_refresh_screen_list = False
Boolean ib_app_audit_complete = False
Boolean ib_win_just_opened = True
Boolean ib_deleting = False
Boolean ib_ezflow = False
Boolean is_rec_status
Boolean ib_addaddress = false 
n_ds ids_parent_facilities

String is_first_column_detail_1
String is_first_column_detail_2
String is_sql_syntax
String is_rec_id_col_nm
String is_column_names[]
String is_view_type = "D"
String is_lookup_search_column= "None"
String is_lookup_search_column_table = ""
String is_designer_type = "S"


Integer il_last_row = 1
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 03.03.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<modification> Define a variable and set it to TRUE. It will be used by subsequent script.
boolean ib_just_open = true
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
datastore ids_image_data
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 25/08/2008 By: Alan
//$<reason> 
Boolean	ib_report = False
w_prac_report_design parent_window_design_report
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_get_record_verif (integer rownum)
public function integer of_set_parent_window (w_prac_data_1 awin)
public function integer of_setup (boolean ab_new_prac)
public function integer of_set_prac_id (long al_prac_id)
public function integer of_set_verification_info (pfc_cst_u_verification_info aobject)
public function integer of_set_verifying_facility (integer ai_verifying_facility)
public function integer of_get_row ()
public function integer of_setfocus_detail ()
public function integer of_setfocus_browse ()
public function integer of_get_selected_view_tab ()
public function integer of_detail_btt ()
public function integer of_btt_browse ()
public function integer of_btt_detail ()
public function integer of_get_row_selector ()
public function boolean of_is_prac_id_null ()
public function integer of_get_row_count_detail ()
public function integer of_set_ib_screen_painter (boolean ab_val)
public function boolean of_get_ib_screen_painter ()
public function integer of_set_data_view_id (long al_data_view_id)
public function integer of_set_parent_facility_id (integer ai_parent_facility_id)
public function integer of_set_data_entry_complete ()
public function integer of_get_parent_facility_id ()
public function integer of_btt_address_link_button ()
public function integer of_delete_record (u_dw adw)
public function integer of_select_de_screen (string as_direction)
public function integer of_npdb_query ()
public function integer of_add_ver_entry ()
public function integer of_add_address_link (long al_address_id)
public function integer of_add_delete_enable ()
public function integer of_set_de_complete_date_null ()
public function integer of_add_hosp_link (readonly long ai_hosp_id)
public function integer of_add_spec_link (long ai_rec_id)
public function integer of_address_link_check ()
public function integer of_designer_type (string as_type)
public function integer of_oig_query ()
public function integer of_validate (integer ai_table, integer ai_row)
public function integer of_lookup_search_dddw (string as_type)
public function integer of_screen_color ()
public function integer of_dwchild_retrieve (string as_lu_table, string as_type, u_dw adw_dw, string as_from, long al_value, string as_column_nm)
public function integer of_lookup_search (string as_type)
public function integer of_add_questions (string as_from)
public function integer of_add_npdb (long al_prac_id, long al_rec_id, long al_screen_id, string as_reference, datetime adt_exp_date, string as_screen_name, long al_address_lookup_code, string as_add_type, integer ai_parent_facility_id)
public function integer of_add_oig (long al_prac_id, long al_rec_id, integer ai_parent_facility)
public function integer of_error_message (string as_field, integer ai_row, string as_title, string as_mess)
public function integer of_detail_scrollbar (integer ai_screen_id)
public function integer of_validate_image ()
public subroutine of_refresh_page_menu ()
public function long of_download_photo (long al_pracid, string as_downdir)
end prototypes

event pfc_cst_preupdate;dw_detail.TriggerEvent( "pfc_cst_preupdate" )

end event

event pfc_cst_field_defaults;inv_data_entry.of_set_defaults( dw_detail, dw_detail.GetRow() )
end event

event pfc_cst_update_dddw;inv_data_entry.of_update_dddw( dw_detail, dw_browse )
IF IsValid( m_pfe_cst_data_entry ) THEN
	gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_lookupsearch,'Enabled', True)
END IF	

end event

event type integer ue_after_itemchanged();string s
//debugbreak()

s = String(Message.LongParm, "address")
//messagebox("s",s)
of_lookup_search(s)

return 1
end event

event pfc_cst_nextrecord();integer i
i = dw_browse.getrow()
if i < dw_browse.rowcount() then
	dw_browse.setrow(i+1)
	dw_browse.selectrow(0,false)
	dw_browse.selectrow(i+1,true)
	dw_browse.scrolltorow(i+1)
end if
end event

event pfc_cst_import_photo();//------------------------------------------------------------------------------
// Event: pfc_cst_import_photo()
//------------------------------------------------------------------------------
// Description: Import Photo
// Arguments:
//		None
// Return Value: 
//		None
//------------------------------------------------------------------------------
// Author:	Scofield		Date: 2008-07-10
//------------------------------------------------------------------------------
// Revision History: 
//				1.0   Initial version
//==============================================================================

String	ls_PicPath,ls_FullName,ls_PicName,ls_Postfix,ls_CurDirectory
long		ll_Rtn,ll_FileNo,ll_ReadCnts,ll_Cnts
Blob		lblb_ImageData,lblb_Buffer

ls_CurDirectory = GetCurrentDirectory()
gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//ll_Rtn = GetFileOpenName("Open",ls_FullName,ls_PicName,"bmp","Bitmap Files (*.bmp),*.bmp,JPG Files (*.jpg),*.jpg,GIF Files (*.GIF),*.gif")		//Added By Mark Lee 08/15/2014
n_getfilename     ln_getfilename
ll_Rtn = ln_getfilename.of_getopenfilename("Open",ls_FullName,ls_PicName,"bmp","Bitmap Files (*.bmp),*.bmp,JPG Files (*.jpg),*.jpg,GIF Files (*.GIF),*.gif")	
gf_save_dir_path(ls_FullName) //Added by Ken.Guo on 2009-03-10
if ll_Rtn <> 1 then Return

//ChangeDirectory(ls_CurDirectory)

ls_Postfix = Mid(ls_PicName,LastPos(ls_PicName,".") + 1)

ll_FileNo = FileOpen(ls_FullName,StreamMode!,Read!,LockReadWrite!)
if ll_FileNo <= 0 then Return

ll_ReadCnts = FileRead(ll_FileNo,lblb_Buffer)
do while ll_ReadCnts > 0
	lblb_ImageData += lblb_Buffer
	ll_ReadCnts = FileRead(ll_FileNo,lblb_Buffer)
loop

FileClose(ll_FileNo)

if Len(lblb_ImageData) <= 0 then Return

SELECT COUNT(*) INTO :ll_Cnts FROM pd_photo WHERE pd_photo.prac_id = :il_prac_id ;
if ll_Cnts <= 0 then
	INSERT INTO pd_photo(prac_id) VALUES(:il_prac_id) ;
end if

UPDATE pd_photo SET image_type = :ls_Postfix WHERE pd_photo.prac_id = :il_prac_id ;
UPDATEBLOB pd_photo SET image_data = :lblb_ImageData WHERE pd_photo.prac_id = :il_prac_id ;

ls_PicPath = TRIM(gnv_data.of_getitem("ids","picture_path",false))
if Right(ls_PicPath,1) <> "\" then ls_PicPath += "\"

ll_Rtn = of_Download_Photo(il_prac_id,ls_PicPath)

if ll_Rtn = 1 then
	Parent_Window.tab_1.tabpage_detail.p_face.PictureName = ""
	Parent_Window.tab_1.tabpage_detail.p_face.PictureName = ls_PicPath + String(il_prac_id) + "." + ls_Postfix
end if

if ii_screen_id = 1 then
	Parent_Window.tab_1.tabpage_detail.p_face.Visible = true
	Parent_Window.tab_1.tabpage_detail.p_face.BringToTop = true
else
	Parent_Window.tab_1.tabpage_detail.p_face.Visible = false
end if

end event

public function integer of_get_record_verif (integer rownum);//Long li_rec_id
//Integer li_cr
//
//
//IF rownum < 1 THEN
//	Return -1
//END IF
//	
//li_rec_id = dw_detail.GetItemNumber( rownum, "rec_id" )
//
//IF Not IsNull( li_rec_id ) THEN
//	dw_ver_data.SetFilter( "rec_id = " + String( li_rec_id ) + " AND facility_id = " + String( ii_verifying_facility_id ) )
//	dw_ver_data.Filter( )
//	//messagebox("", ii_verifying_facility_id )
//END IF
	



Return 0
end function

public function integer of_set_parent_window (w_prac_data_1 awin);parent_window = awin

Return 0
end function

public function integer of_setup (boolean ab_new_prac);dw_detail.of_SetDropDownCalendar( TRUE )
tab_view.tabpage_image.dw_detail_2.of_SetDropDownCalendar( TRUE )
//dw_ver_data.of_SetDropDownCalendar( TRUE )
ib_just_open = true
dw_select_section.Reset()
dw_select_section.of_SetTransObject(SQLCA)

if ib_report=false then
	dw_select_section.Retrieve( il_data_view )
	
	dw_select_section.SelectRow( 1, True )
	
	IF ab_new_prac THEN
		st_recs.Text = "Record 1 of 1"
	ELSE
		if dw_detail.rowcount() > 0 then
			il_rec_id = dw_detail.GetItemNumber( 1, "rec_id" )
		end if
	END IF
else
	dw_select_section.Retrieve( il_data_view,999 ) //default 999
	dw_select_section.SelectRow( 1, True )
end if


Return 1
end function

public function integer of_set_prac_id (long al_prac_id);il_prac_id = al_prac_id



Return 1
end function

public function integer of_set_verification_info (pfc_cst_u_verification_info aobject);
Return 0
end function

public function integer of_set_verifying_facility (integer ai_verifying_facility);ii_verifying_facility_id = ai_verifying_facility


Return 1
end function

public function integer of_get_row ();Return dw_detail.GetRow()
end function

public function integer of_setfocus_detail ();dw_detail.SetFocus()

Return 1
end function

public function integer of_setfocus_browse ();dw_browse.SetFocus()

Return 1
end function

public function integer of_get_selected_view_tab ();Return tab_view.SelectedTab

end function

public function integer of_detail_btt ();dw_detail.BringToTop = True

//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" or is_screen_name = "Board/Specialty"then
//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" then
if ii_screen_id = 10 or ii_screen_id = 2 or ii_screen_id = 19 then
	dw_link_list.bringtotop = True
end if

Return 1
end function

public function integer of_btt_browse ();dw_browse.BringToTop = True

//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" or is_screen_name = "Board/Specialty"then
//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" then
if ii_screen_id = 10 OR ii_screen_id = 2 OR ii_screen_id = 19 THEN
	dw_link_list.bringtotop = True
end if

Return 1
end function

public function integer of_btt_detail ();dw_detail.BringToTop = True

//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" or is_screen_name = "Board/Specialty"then
//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" then
if ii_screen_id = 10 OR ii_screen_id = 2 OR ii_screen_id = 19 THEN
	dw_link_list.bringtotop = True
end if

Return 1
end function

public function integer of_get_row_selector ();Return dw_select_section.GetRow()
end function

public function boolean of_is_prac_id_null ();IF IsNull( dw_detail.GetItemNumber(1, "prac_id" ) ) THEN
	Return True
ELSE
	Return False
END IF
end function

public function integer of_get_row_count_detail ();Return dw_detail.RowCount()
end function

public function integer of_set_ib_screen_painter (boolean ab_val);ib_screen_painter = ab_val

Return 1
end function

public function boolean of_get_ib_screen_painter ();Return ib_screen_painter 
end function

public function integer of_set_data_view_id (long al_data_view_id);il_data_view = al_data_view_id

Return 0
end function

public function integer of_set_parent_facility_id (integer ai_parent_facility_id);ii_parent_facility_id = ai_parent_facility_id

Return 0
end function

public function integer of_set_data_entry_complete ();Integer li_org_id,li_flag
DateTime todaysdate 
boolean lb_de_comp_flag   //12.13.2006 By Jervis

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-02
//$<modify> 02.24.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
 
/*
Integer li_address_cnt  

//check for required data
SELECT Count(*)  
INTO :li_address_cnt  
FROM pd_address,   
     pd_address_link  
WHERE ( pd_address.rec_id = pd_address_link.address_id ) and  
      ( pd_address.prac_id = pd_address_link.prac_id ) and  
      ( ( pd_address.prac_id = :il_prac_id ) AND  
      ( pd_address_link.exp_letters = 1 ) )   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Select Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF
IF li_address_cnt = 0 THEN
	MessageBox("Incomplete", "You must have at least one address setup as an address for expiring credential letters.  Check the Address screen Address Links for this.", Information! )
	RETURN -1
END IF


//check for mailing data
SELECT Count(*)  
INTO :li_address_cnt  
FROM pd_address,   
     pd_address_link  
WHERE ( pd_address.rec_id = pd_address_link.address_id ) and  
      ( pd_address.prac_id = pd_address_link.prac_id ) and  
      ( ( pd_address.prac_id = :il_prac_id ) AND  
      ( pd_address_link.mailing = 1 ) )   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Select Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF
IF li_address_cnt = 0 THEN
	MessageBox("Incomplete", "You must have at least one address setup as a mailing address.  Check the Address screen Address Links for this.", Information! )
	RETURN -1
END IF

todaysdate =  DateTime( Today(), Now() )

//check for specialty
SELECT Count(*)  
INTO :li_address_cnt  
FROM pd_board_specialty,   
     code_lookup  
WHERE ( pd_board_specialty.specialty_order = code_lookup.lookup_code ) and  
      ( pd_board_specialty.prac_id = :il_prac_id ) AND  
      ( code_lookup.code = 'Primary' )  ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Select Error", SQLCA.SQLERRTEXT )
	RETURN -1
END IF
IF li_address_cnt = 0 THEN
	MessageBox("Important data", "IntelliCred/App expects each practitoner to have a Primary Specialty.~rWithout this, certain letters and reports will not run for that practitioner.~r~rGo to the Board Specialty screen to enter this data.", Information! )
	//RETURN -1
END IF


COMMIT USING SQLCA;


UPDATE pd_affil_stat  
SET date_data_entry_completed = :todaysdate  
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND 
			( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) and 
         ( pd_affil_stat.active_status in (1,4) ) and //maha  changed to include pending 072402
			//( pd_affil_stat.verifying_facility_id = ii_verifying_facility_id ) and // maha added 020501 to update only for the current verifying facility
			 ( pd_affil_stat.date_data_entry_completed is null ); // maha added 111300 to stop reset of previously set dates
IF SQLCA.SQLCODE <> 0 THEN
	MessageBox("Update Error", "Error updating pb_affil_stat / date_data_entry_completed." )
	Return -1
END IF

gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_dataentrycomplete,'toolbaritemname', "Custom026!")

IF of_npdb_query() = -1 THEN
	ROLLBACK USING SQLCA;
	RETURN -1
END IF

IF of_oig_query() = -1 THEN
	ROLLBACK USING SQLCA;
	RETURN -1
END IF

Commit Using SQLCA;
*/
//debugbreak()
//$<reason> Add the Appeon Queue Labels. 
gnv_appeondb.of_startqueue( )

Integer li_address_cnt1, li_address_cnt2, li_address_cnt3 

//check for required data
SELECT Count(*)  
INTO :li_address_cnt1  
FROM pd_address,   
     pd_address_link  
WHERE ( pd_address.rec_id = pd_address_link.address_id ) and  
      ( pd_address.prac_id = pd_address_link.prac_id ) and  
      ( ( pd_address.prac_id = :il_prac_id ) AND  
      ( pd_address_link.exp_letters = 1 ) )   ;

//check for mailing data
SELECT Count(*)  
INTO :li_address_cnt2  
FROM pd_address,   
     pd_address_link  
WHERE ( pd_address.rec_id = pd_address_link.address_id ) and  
      ( pd_address.prac_id = pd_address_link.prac_id ) and  
      ( ( pd_address.prac_id = :il_prac_id ) AND  
      ( pd_address_link.mailing = 1 ) )   ;


//check for specialty
SELECT Count(*)  
INTO :li_address_cnt3 
FROM pd_board_specialty,   
     code_lookup  
WHERE ( pd_board_specialty.specialty_order = code_lookup.lookup_code ) and  
      ( pd_board_specialty.prac_id = :il_prac_id ) AND  
      ( code_lookup.code = 'Primary' )  ;

COMMIT USING SQLCA;

//$<reason> Add the Appeon Queue Labels. 
gnv_appeondb.of_commitqueue( )

IF li_address_cnt1 = 0 THEN
	MessageBox("Incomplete", "You must have at least one address setup as an address for expiring credential letters.  Check the Address screen Address Links for this.", Information! )
	RETURN -1
END IF

IF li_address_cnt2 = 0 THEN
	MessageBox("Incomplete", "You must have at least one address setup as a mailing address.  Check the Address screen Address Links for this.", Information! )
	RETURN -1
END IF

IF li_address_cnt3 = 0 THEN
	MessageBox("Important data", "IntelliCred/App expects each practitoner to have a Primary Specialty.~rWithout this, certain letters and reports will not run for that practitioner.~r~rGo to the Board Specialty screen to enter this data.", Information! )
END IF

Date ld_today
Time lt_today
ld_today = Date(today())
lt_today = Time(now())
todaysdate = Datetime(ld_today,lt_today)

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 12.13.2006 By: Jervis
//$<reason> 
/*
//$<reason> Add the Appeon Queue Labels. 
gnv_appeondb.of_autocommit( )

UPDATE pd_affil_stat  
SET date_data_entry_completed = :todaysdate  
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND 
			( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) and 
         ( pd_affil_stat.active_status in (1,4) ) and //maha  changed to include pending 072402
			//( pd_affil_stat.verifying_facility_id = ii_verifying_facility_id ) and // maha added 020501 to update only for the current verifying facility
			 ( pd_affil_stat.date_data_entry_completed is null ); // maha added 111300 to stop reset of previously set dates

*/
lb_de_comp_flag = true

select 1 into :li_flag from pd_affil_stat 
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND 
			( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) and 
         ( pd_affil_stat.active_status in (1,4) ) and //maha  changed to include pending 072402
			//( pd_affil_stat.verifying_facility_id = ii_verifying_facility_id ) and // maha added 020501 to update only for the current verifying facility
			 ( pd_affil_stat.date_data_entry_completed is null ); // maha added 111300 to stop reset of previously set dates
if sqlca.sqlcode = 100 then
	lb_de_comp_flag = false
else
	gnv_appeondb.of_autocommit( )
	UPDATE pd_affil_stat  
	SET date_data_entry_completed = :todaysdate  
	WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND 
				( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) and 
				( pd_affil_stat.active_status in (1,4) ) and //maha  changed to include pending 072402
				//( pd_affil_stat.verifying_facility_id = ii_verifying_facility_id ) and // maha added 020501 to update only for the current verifying facility
				 ( pd_affil_stat.date_data_entry_completed is null ); // maha added 111300 to stop reset of previously set dates
	
	Commit Using SQLCA;
end if
//---------------------------- APPEON END ----------------------------


gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_dataentrycomplete,'toolbaritemname', "Custom026!")

IF of_npdb_query() = -1 THEN
	ROLLBACK USING SQLCA;
	RETURN -1
END IF

IF of_oig_query() = -1 THEN
	ROLLBACK USING SQLCA;
	RETURN -1
END IF

//---------------------------- APPEON END ----------------------------

//Added for Work Flow. Trigger off the related work flow. 1/11/2006 Henry
long	ll_wf_id
long	ll_screens[]
string ls_module
//If gb_workflow Then
if gb_workflow and lb_de_comp_flag then		//12.13.2006 By Jervis
	n_cst_workflow_triggers lnv_trigger
	lnv_trigger = create n_cst_workflow_triggers
	
	//Trigger all data value comparision work flow
	If of_Get_app_setting("set_9" , "I") = 1 Then
		ls_module = '02'
	Else
		ls_module = '01'
	End if
	ll_screens = dw_select_section.object.screen_id[1,dw_select_section.Rowcount()]
	//lnv_trigger.of_compare( ll_screens, il_prac_id, ii_parent_facility_id, ls_module, 'C')
	lnv_trigger.of_data_value_comparision(gl_data_view_id, ll_screens, il_prac_id, ii_parent_facility_id, ls_module, 'C')
	
	ll_wf_id = long(gnv_data.of_getitem("facility","facility_wf_data_entry_complete","facility_id="+string(ii_parent_facility_id)))
	If isnull(ll_wf_id) or not ll_wf_id > 0 Then return 0
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 11.17.2006 By: Jervis
	//$<reason> 
	//lnv_trigger.of_workflow_create_action_items( il_prac_id, il_rec_id, 1, ii_parent_facility_id, ll_wf_id)
	str_action_item lstr_action
	lstr_action.prac_id = il_prac_id
	lstr_action.rec_id = il_rec_id
	lstr_action.facility_id = ii_parent_facility_id
	lstr_action.screen_id = -10
	lstr_action.wf_id = ll_wf_id
	lnv_trigger.of_workflow_create_action_items(lstr_action)
	//---------------------------- APPEON END ----------------------------
	destroy lnv_trigger
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 12.20.2006 By: Jervis
	//$<reason> refresh data for IntelliApp
	parent_window.of_retrieve_net()
	//---------------------------- APPEON END ----------------------------

	
	//---------------------------- APPEON END ----------------------------

End If
//End added for Work Flow. 1/11/2006 Henry

Return 0
end function

public function integer of_get_parent_facility_id ();Return ii_parent_facility_id

end function

public function integer of_btt_address_link_button ();

IF dw_select_section.GetRow() > 0 THEN
	IF UPPER(dw_select_section.GetItemString( dw_select_section.GetRow(), "screen_name" )) = "ADDRESS" AND tab_view.SelectedTab = 2 THEN
		ii_address_lnk_cnt++
		IF ii_address_lnk_cnt > 1 THEN
			dw_detail.vscrollbar = True
		END IF	
	END IF
END IF

Return 1
end function

public function integer of_delete_record (u_dw adw);Long ll_rec_id
Integer li_cnt
Integer li_cnt1

Integer li_ans

IF adw.GetItemStatus( adw.GetRow(), 0 , Primary! ) = New! OR +&
	adw.GetItemStatus( adw.GetRow(), 0 , Primary! ) = NewModified! THEN
	adw.DeleteRow( 0 )
	//IF adw.RowCount() = 0 THEN
	//	adw.InsertRow( 0 )	
	//	tab_view.SelectTab( 1 )
	//	dw_detail.BringToTop = True	
	//END IF	
//	adw.SetRow( 1 )
//	adw.ScrollToRow( 1 )
//	dw_browse.SelectRow( 0, False )
//	dw_browse.SelectRow( 1, True )
//
//	adw.SetColumn( inv_data_entry.of_get_first_column() )
//	adw.SetFocus()
ELSE
	if ii_screen_id = 1 then //maha trap added 091304
		MessageBox( "Delete Error", "You cannot delete the practitioner basic information record.")
		return -1
	end if
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 2005-11-16 By: Liang QingShi
	//$<reason> Fix a defect.

	  if dw_detail.GetRow() <= 0 then return -1
	//---------------------------- APPEON END ----------------------------

   ll_rec_id = dw_detail.GetItemNumber( dw_detail.GetRow(), "rec_id" )

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-03
	//$<modify> 03.23.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	/*
	//Start Code Change ---- 01.12.2006 #193 maha
	select count(rec_id) into :li_cnt from pd_images where rec_id = :ll_rec_id;
	if li_cnt > 0 then
		li_ans = MessageBox("Delete", "There is an image record associated with this data record.  It must be deleted from the image tab before deleting the data record or the tif file will be out of sync with the imade data." )
		return -1
	end if
	//End Code Change---01.12.2005 
	
 	SELECT Count( rec_id )  
	INTO :li_cnt  
     FROM verif_info  
     WHERE verif_info.rec_id = :ll_rec_id   ;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "Database Error", "Error in record count.")
		Return -1
	END IF
	*/

	gnv_appeondb.of_startqueue( )

	select count(rec_id) into :li_cnt1 from pd_images where rec_id = :ll_rec_id;
	
 	SELECT Count( rec_id )  
	INTO :li_cnt  
     FROM verif_info  
     WHERE verif_info.rec_id = :ll_rec_id   ;
	
	gnv_appeondb.of_commitqueue( )

	if li_cnt1 > 0 then
		li_ans = MessageBox("Delete", "There is an image record associated with this data record.  It must be deleted from the image tab before deleting the data record or the tif file will be out of sync with the imade data." )
		return -1
	end if

	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "Database Error", "Error in record count.")
		Return -1
	END IF
	//---------------------------- APPEON END ----------------------------

	IF li_cnt > 0 THEN
		li_ans = MessageBox("Delete", "There are verification records associated with this record.  Are you sure you want to delete?", Question!, YesNo!, 2 )
		IF li_ans = 1 THEN
			DELETE FROM verif_info
			WHERE rec_id = :ll_rec_id;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox( "Database Error", SQLCA.SQLERRTEXT )
				Return -1
			END IF			
		ELSE
			Return -1
		END IF
	else //maha added 083104
		li_ans = MessageBox("Delete", "Are you sure you want to delete this record?", Question!, YesNo!, 2 )
		IF li_ans = 2 THEN
			return -1
		end if
	END IF
	inv_data_entry.of_field_audit_delete_last( dw_detail, dw_detail.GetRow())
	delete pd_app_audit where de_rec_id = :ll_rec_id; //Start Code Change ---- 10.25.2006 #1 maha
	dw_detail.DeleteRow( dw_detail.GetRow() )

	//delete any data in dw_detail_2
	IF tab_view.tabpage_image.Visible THEN
		tab_view.tabpage_image.dw_detail_2.SetFilter( "rec_id = " + String( ll_rec_id ) )
		tab_view.tabpage_image.dw_detail_2.Filter( )
		IF tab_view.tabpage_image.dw_detail_2.RowCount( ) > 0 THEN
			tab_view.tabpage_image.dw_detail_2.DeleteRow( 0 )
		END IF
	END IF
	
	ib_deleting = True
	parent_window.Event pfc_Save()
	ib_deleting = False	
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.17.2006 By: Jack (Inova)
//$<reason> Required Documents Check Box on Data Entry Screen.
gnv_appeondb.of_startqueue( )
delete from pd_app_audit_temp where de_rec_id = :ll_rec_id;
delete from pd_app_audit where de_rec_id = :ll_rec_id;
gnv_appeondb.of_commitqueue( )
if isvalid(w_prac_data_1) then
	w_prac_data_1.ib_app_audit_retrieved = False
end if
//---------------------------- APPEON END ----------------------------

//\/maha 012201
//if is_screen_name = "Hospital Affiliation" then
if ii_screen_id = 10 then
	delete from pd_hosp_facility_link
	where hosp_affil_id = :ll_rec_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "Database Error", "Error deleting hospital links.")
		Return -1
	end if
END IF				

//if is_screen_name = "Address" then
if ii_screen_id = 2 then
	delete from pd_address_link
	where address_id = :ll_rec_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "Database Error", SQLCA.SQLERRTEXT )
		Return -1
	end if
END IF

//maha 082001
//if is_screen_name = "Board/Specialty" then
if ii_screen_id = 19 then
	delete from pd_spec_facility_link
	where specialty_id = :ll_rec_id;
	IF SQLCA.SQLCODE = -1 THEN
		MessageBox( "Database Error", "Error deleting specialty links.")
		Return -1
	end if
END IF
//\maha

IF dw_browse.RowCount() = 0 THEN
	dw_browse.Event pfc_AddRow()
END IF

of_refresh_page_menu() //Added By Ken.Guo 06.10.2008

RETURN 1	

end function

public function integer of_select_de_screen (string as_direction);Integer li_cr
Integer li_row_cnt

li_cr =	dw_select_section.GetRow()
li_row_cnt = dw_select_section.RowCount()

IF as_direction = "N" THEN
	IF li_cr = li_row_cnt THEN
		Beep(2)
		Return -1
	ELSE
		li_cr++
		dw_select_section.SetRow( li_cr )
		dw_select_section.ScrollToRow( li_cr )
	END IF
ELSE
	IF li_cr = 1 THEN
		Beep(2)
		Return -1
	ELSE
		li_cr --
		dw_select_section.SetRow( li_cr )
		dw_select_section.ScrollToRow( li_cr )
	END IF		
END IF

RETURN 0
end function

public function integer of_npdb_query ();Integer li_cnt,li_cnt2,li_cnt3
Long ll_rec_id
Long ll_npdb_query
String ls_val
String ls_npdb_verify_data
String ls_appt_type
String ls_work_gap_check
String ls_npdb_query_type
DateTime ldt_exp_date
integer li_one_facil //maha 020901

//select npdb_multi//maha 020901
//into :li_one_facil
//from ids;

if isnull(li_one_facil) then li_one_facil = 0

SetNull( ldt_exp_date )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 02.24.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
/*
// find out if prac is in initial or reappointment
SELECT pd_affil_stat.apptmnt_type  
INTO :ls_appt_type  
FROM pd_affil_stat  
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND  
      ( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) and 
		(pd_affil_stat.active_status in (1,4)); //maha added 080901  //maha  changed to include pending 072402


	//check the rules in the facility painter for the parent facility to see if the
	//npdb and or hipdb queryies verification entries should be generated.
	SELECT facility.npdb_query_type,
		  facility.npdb_verify_data
	INTO :ls_npdb_query_type,
		:ls_npdb_verify_data
	FROM facility  
	WHERE facility.facility_id = :ii_parent_facility_id   ;
	//if o then do not query npdb or hipdb
	IF ls_npdb_query_type <> "O" THEN
		//also check at the prac level to see if the individual prac will need npdb query.
		SELECT pd_basic.npdb_query  
		INTO :ll_npdb_query
		FROM pd_basic  
		WHERE pd_basic.prac_id = :il_prac_id   ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "Select Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF

		IF ( ls_appt_type = "I" AND ( ls_npdb_verify_data = "B" OR ls_npdb_verify_data = "I" ) )  OR  +&
		   ( ls_appt_type = "R" AND ls_npdb_verify_data = "B" )  THEN
	   
			SELECT code_lookup.code  
			INTO :ls_val
			FROM code_lookup  
			WHERE code_lookup.lookup_code = :ll_npdb_query;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox( "Select Error", SQLCA.SQLERRTEXT )
				Return -1
			END IF
	
			IF Upper( ls_val ) = 'YES' THEN
				//if its a npdb or both that needs to be performed then add a NPDB query
				IF ls_npdb_query_type = "N" OR ls_npdb_query_type = "B" THEN
					SELECT Count(*)  
					INTO :li_cnt  
					FROM verif_info  
					WHERE ( verif_info.facility_id = :ii_parent_facility_id ) AND  
					      ( verif_info.prac_id = :il_prac_id ) AND  
					      ( verif_info.active_status = 1 ) AND  
					      ( verif_info.reference_value = 'NPDB QUERY' )   ;
					IF SQLCA.SQLCODE = -1 THEN
						MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
						RETURN -1
					END IF
					IF li_cnt = 0 THEN			
						ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )	
						//if li_one_facil = 1 then// create for this facility only
							IF parent_window.tab_1.tabpage_verif.uo_verif_summary.of_add_npdb( il_prac_id, ll_rec_id, 1, "NPDB QUERY",  ldt_exp_date, "NPDB Results", 0, "A", ii_parent_facility_id) = -1 THEN
								Return -1	
							end if				
					END IF
				END IF
				//if its a hipdb or both that needs to be performed then add a hipdb query
				IF ls_npdb_query_type = "H" OR ls_npdb_query_type = "B" THEN
					SELECT Count(*)  
					INTO :li_cnt  
					FROM verif_info  
					WHERE ( verif_info.facility_id = :ii_parent_facility_id ) AND  
					      ( verif_info.prac_id = :il_prac_id ) AND  
					      ( verif_info.active_status = 1 ) AND  
					      ( verif_info.reference_value = 'HIPDB QUERY' )   ;
					IF SQLCA.SQLCODE = -1 THEN
						MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
						RETURN -1
					END IF
					IF li_cnt = 0 THEN								
						ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )
						IF parent_window.tab_1.tabpage_verif.uo_verif_summary.of_add_npdb( il_prac_id, ll_rec_id, 1, "HIPDB QUERY",  ldt_exp_date, "HIPDB Results", 0, "A", ii_parent_facility_id) = -1 THEN
							Return -1														//of_add_record
						END IF				
					END IF
				END IF		
			END IF
		END IF
	END IF




SELECT Count(*)  
INTO :li_cnt  
FROM verif_info  
WHERE ( verif_info.facility_id = :ii_parent_facility_id) AND  
      ( verif_info.prac_id = :il_prac_id ) AND  
      ( verif_info.active_status = 1 ) AND  
      ( verif_info.reference_value = 'Work History Gap Check' )   ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
	RETURN -1
END IF

IF li_cnt = 0 THEN
	//CHECK TO SEE IF A WORK GAP HISTORY CHECK NEEDS TO BE PERFORMED
	//Go to the verifying facility to see if this query is to be performed
	SELECT facility.work_gap_check
	INTO :ls_work_gap_check
	FROM facility  
	WHERE facility.facility_id = :ii_parent_facility_id;
	//Create a work history gap check verification entry
	IF ( ls_work_gap_check = "B" AND ls_appt_type = "R" ) OR +&
	   ( ( ls_work_gap_check = "I" or ls_work_gap_check = "B" ) AND ls_appt_type = "I" ) THEN
		ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )
		IF parent_window.tab_1.tabpage_verif.uo_verif_summary.of_add_npdb( il_prac_id, ll_rec_id, 1, "Work History Gap Check",  ldt_exp_date, "Work Gap", 0, "A", ii_parent_facility_id ) = -1 THEN
			Return -1														//of_add_record
		END IF				
	END IF
END IF
*/

gnv_appeondb.of_startqueue( )

// find out if prac is in initial or reappointment
SELECT pd_affil_stat.apptmnt_type  
INTO :ls_appt_type  
FROM pd_affil_stat  
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND  
      ( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) and 
		(pd_affil_stat.active_status in (1,4)); //maha added 080901  //maha  changed to include pending 072402

//check the rules in the facility painter for the parent facility to see if the
//npdb and or hipdb queryies verification entries should be generated.
SELECT facility.npdb_query_type,
	  facility.npdb_verify_data
INTO :ls_npdb_query_type,
	:ls_npdb_verify_data
FROM facility  
WHERE facility.facility_id = :ii_parent_facility_id   ;

SELECT pd_basic.npdb_query  
INTO :ll_npdb_query
FROM pd_basic  
WHERE pd_basic.prac_id = :il_prac_id   ;

SELECT Count(*)  
INTO :li_cnt  
FROM verif_info  
WHERE ( verif_info.facility_id = :ii_parent_facility_id ) AND  
		( verif_info.prac_id = :il_prac_id ) AND  
		( verif_info.active_status = 1 ) AND  
		( verif_info.reference_value = 'NPDB QUERY' )   ;

SELECT Count(*)  
INTO :li_cnt2
FROM verif_info  
WHERE ( verif_info.facility_id = :ii_parent_facility_id ) AND  
		( verif_info.prac_id = :il_prac_id ) AND  
		( verif_info.active_status = 1 ) AND  
		( verif_info.reference_value = 'HIPDB QUERY' )   ;

SELECT Count(*)  
INTO :li_cnt3  
FROM verif_info  
WHERE ( verif_info.facility_id = :ii_parent_facility_id) AND  
      ( verif_info.prac_id = :il_prac_id ) AND  
      ( verif_info.active_status = 1 ) AND  
      ( verif_info.reference_value = 'Work History Gap Check' )   ;

SELECT facility.work_gap_check
INTO :ls_work_gap_check
FROM facility  
WHERE facility.facility_id = :ii_parent_facility_id;

gnv_appeondb.of_commitqueue( )

	//if o then do not query npdb or hipdb
	IF ls_npdb_query_type <> "O" THEN
		//also check at the prac level to see if the individual prac will need npdb query.
		IF ( ls_appt_type = "I" AND ( ls_npdb_verify_data = "B" OR ls_npdb_verify_data = "I" ) )  OR  +&
		   ( ls_appt_type = "R" AND ls_npdb_verify_data = "B" )  THEN
	   
			ls_val = gnv_data.of_getitem( "code_lookup", "code", "lookup_code = " + String(ll_npdb_query) )

			IF Upper( ls_val ) = 'YES' THEN
				//if its a npdb or both that needs to be performed then add a NPDB query
				IF ls_npdb_query_type = "N" OR ls_npdb_query_type = "B" THEN
					IF li_cnt = 0 THEN			
						ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )	
						//if li_one_facil = 1 then// create for this facility only
							//IF parent_window.tab_1.tabpage_verif.uo_verif_summary.of_add_npdb( il_prac_id, ll_rec_id, 1, "NPDB QUERY",  ldt_exp_date, "NPDB Results", 0, "A", ii_parent_facility_id) = -1 THEN
							IF of_add_npdb( il_prac_id, ll_rec_id, 1, "NPDB QUERY",  ldt_exp_date, "NPDB Results", 0, "A", ii_parent_facility_id) = -1 THEN
								Return -1	
							end if				
					END IF
				END IF
				//if its a hipdb or both that needs to be performed then add a hipdb query
				IF ls_npdb_query_type = "H" OR ls_npdb_query_type = "B" THEN
					IF li_cnt2 = 0 THEN								
						ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )
						//IF parent_window.tab_1.tabpage_verif.uo_verif_summary.of_add_npdb( il_prac_id, ll_rec_id, 1, "HIPDB QUERY",  ldt_exp_date, "HIPDB Results", 0, "A", ii_parent_facility_id) = -1 THEN
						IF of_add_npdb( il_prac_id, ll_rec_id, 1, "HIPDB QUERY",  ldt_exp_date, "HIPDB Results", 0, "A", ii_parent_facility_id) = -1 THEN
							Return -1														//of_add_record
						END IF				
					END IF
				END IF		
			END IF
		END IF
	END IF


IF li_cnt3 = 0 THEN
	//CHECK TO SEE IF A WORK GAP HISTORY CHECK NEEDS TO BE PERFORMED
	//Go to the verifying facility to see if this query is to be performed
	//Create a work history gap check verification entry
	IF ( ls_work_gap_check = "B" AND ls_appt_type = "R" ) OR +&
	   ( ( ls_work_gap_check = "I" or ls_work_gap_check = "B" ) AND ls_appt_type = "I" ) THEN
		ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )
		//IF parent_window.tab_1.tabpage_verif.uo_verif_summary.of_add_npdb( il_prac_id, ll_rec_id, 1, "Work History Gap Check",  ldt_exp_date, "Work Gap", 0, "A", ii_parent_facility_id ) = -1 THEN
		IF of_add_npdb( il_prac_id, ll_rec_id, 1, "Work History Gap Check",  ldt_exp_date, "Work Gap", 0, "A", ii_parent_facility_id ) = -1 THEN
			Return -1														//of_add_record
		END IF				
	END IF
END IF

//---------------------------- APPEON END ----------------------------

RETURN 1
end function

public function integer of_add_ver_entry ();//this function for adding a single verification for 1 facility

//debugbreak()

String ls_ref_1
String ls_val
String ls_ref_2
String ls_ref_3
String ls_exp_field
String ls_reference
String ls_rec_status
String ls_screen_name
DateTime ldt_exp_date
DateTime ldt_null_date
Long ll_rec_id
Long ll_address_code
Integer li_screen_id
Integer li_current_row
Integer li_cnt
Integer li_rec_count
Integer li_found
Integer li_data_cr
Integer li_verif_rc
Integer li_retval
integer li_exist //maha 032901
integer li_vfac //maha 032901
integer res //maha 032901
integer li_status = 1 //maha 080108 initialized to active
string ls_refdata2 //maha 061801
DataWindowChild dwchild

SetNull( ldt_null_date )


dw_detail.AcceptText()

li_data_cr = dw_detail.GetRow()
//get reference cols
ls_ref_1 = dw_select_section.GetItemString( il_last_row, "ref_field_1")
ls_ref_2 = dw_select_section.GetItemString( il_last_row, "ref_field_2")
ls_ref_3 = dw_select_section.GetItemString( il_last_row, "ref_field_3")
//get exp date
ls_exp_field = dw_select_section.GetItemString( il_last_row, "exp_field")
//get screen id & name
li_screen_id = dw_select_section.GetItemNumber( il_last_row, "screen_id")
ls_screen_name = dw_select_section.GetItemString( il_last_row, "screen_name")

li_rec_count = dw_detail.RowCount()

IF li_rec_count < 1 THEN
	RETURN -1
END IF

SetNull( ll_address_code )


IF IsNull( dw_detail.GetItemNumber(li_data_cr, "rec_id")) OR +&
	dw_detail.GetItemNumber(li_data_cr, "rec_id") = 0 THEN
	return 1 //maha 052104 removed of_get_id code as could cause potential unmatched verifications
//	ls_rec_status = "New"
//	il_rec_id = gnv_app.of_Get_Id("RECORD_ID")
//	dw_detail.SetItem( li_data_cr, "rec_id", il_rec_id )
//	dw_detail.SetItem( li_data_cr, "prac_id", il_prac_id)
END IF
	
ll_rec_id = dw_detail.GetItemNumber( li_data_cr, "rec_id" )
//test if verif exists for this facility

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-05
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

//gnv_appeondb.of_startqueue( )  //Start Code Change ---- 04.04.2007 #V7 maha removed as was effecting the messagebox
//---------------------------- APPEON END ----------------------------

select verifying_facility
into :li_vfac
from pd_affil_stat
where prac_id = :il_prac_id and active_status in (1,4) and parent_facility_id = :gi_parent_facility;

select count(rec_id)
into :li_exist
from verif_info
where rec_id = :ll_rec_id and prac_id = :il_prac_id  and facility_id = :li_vfac and active_status = 1;

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-06
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance. 
//gnv_appeondb.of_commitqueue( )  //Start Code Change ---- 04.04.2007 #V7 maha removed as was effecting the messagebox
//---------------------------- APPEON END ----------------------------

if li_exist > 0 then
	res = messagebox("Are you sure?","An active verification item already exists for this data entry record. Do you wish to create another?",question!,yesno!,2)
	if res = 2 then return -1
end if
//board test
IF li_screen_id = 19 THEN
	IF IsNull( dw_detail.GetItemNumber( li_data_cr, "board_code" ) ) THEN
		MessageBox("Error", "No board entered." )
		Return -1
	END IF
END IF

IF NOT IsNull( ls_ref_1 ) AND ls_ref_1 <> "" THEN

	//move expiration date to verif info table if there is one
	IF Len(ls_exp_field) > 0 THEN
		IF ls_exp_field = "certification_expires" THEN				
			ldt_exp_date = DateTime(Date( "1-1-" + String( dw_detail.GetItemNumber( li_data_cr, ls_exp_field ) ) ),Now())
		ELSE
			ldt_exp_date = dw_detail.GetItemDateTime( li_data_cr, ls_exp_field )
		END IF
	ELSE
		ldt_exp_date = ldt_null_date
	END IF
	//\/maha 072005 ******************************
	//get reference 1 data
	
	//Start Code Change ----04.16.2008 #V8 maha - added trap for setcolumn failure.
	res = dw_detail.SetColumn( ls_ref_1 )
	if res = -1 then 
		SetRedraw( True )
		messagebox("of_add_ver_entry function","Unable to set column " + ls_ref_1+ ".  Check that the field is visible on the view. "  )
		Return -1
	end if
	//End Code Change---04.16.2008
	
	IF IsNull( dw_detail.GetText() ) OR dw_detail.GetText() = "" THEN
		SetRedraw( True )
		Return -1
	END IF
	li_retval = dw_detail.GetChild(ls_ref_1, dwchild)
	IF li_retval = -1 THEN
		ls_reference =  dw_detail.GetText()				
	ELSE
		//dw_detail.SetColumn( ls_ref_1 )  //Start Code Change ----04.16.2008 #V8 maha - removed,  redundant from above
		
		li_found = dwchild.Find( "lookup_code = " + dw_detail.GetText(), 1, 10000 )
//Start Code Change ---- 10.29.2007 #V7 maha	correction for boards
		IF ii_screen_id = 4 THEN					
			if dw_detail.Describe("verifying_agency.ColType") = "!" then //trap for invisible field maha 040403 
				of_error_message("VERIFYING_AGENCY",li_data_cr,"Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter.")
				//messagebox("Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter")
				return -1
			else
				ll_address_code = dw_detail.GetItemNumber( li_data_cr, "verifying_agency" )
			end if
		ELSEIF li_screen_id = 19 THEN  //Start Code Change ---- 10.26.2007 #V7 maha
			IF IsNull( dw_detail.GetItemNumber( li_data_cr, "board_code" ) ) THEN
				messagebox("Verification Creation","There is no Board Name selected.  Without the Board Name the verification can not be created")
				return -1
		  
			ELSE
				ll_address_code = dw_detail.GetItemNumber( li_data_cr, "board_code" ) 
			end if
		ELSE
//End Code Change---10.29.2007
		END IF
		IF dw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "code" and li_found > 0 THEN
			ls_reference = dwchild.GetItemString( li_found, "code" )
		ELSEIF dw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "description" and li_found > 0 THEN
			ls_reference = dwchild.GetItemString( li_found, "description" )
		ELSEIF dw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name_original" and li_found > 0 THEN
			ls_reference = dwchild.GetItemString( li_found, "entity_name_original" )
		ELSEIF dw_detail.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name" and li_found > 0 THEN //Start Code Change ---- 04.04.2007 #V7 maha
			ls_reference = dwchild.GetItemString( li_found, "entity_name" )
		ELSE
			ls_reference = dw_detail.GetText()				
		END IF
	END IF
	
	//get reference 2 data
	dw_detail.SetColumn( ls_ref_2 )
	IF IsNull( dw_detail.GetText() ) OR dw_detail.GetText() = "" THEN
			ls_reference = ls_reference + " - "
	else
		ls_refdata2 = dw_detail.GetText()

		li_retval = dw_detail.GetChild(ls_ref_2, dwchild)
		IF li_retval = -1 THEN
			ls_reference = ls_reference + " - " + ls_refdata2//dw_detail.GetText()				
		ELSE
			dw_detail.SetColumn( ls_ref_2 )
			li_found = dwchild.Find( "lookup_code = " + dw_detail.GetText(), 1, 10000 )

			IF dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "code" and li_found > 0 THEN
				ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "code" )
			ELSEIF dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "description" and li_found > 0 THEN
				ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "description" )
			ELSEIF (dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name" or dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name_original") and li_found > 0 THEN //Start Code Change ---- 04.04.2007 #V7 maha
				if dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name_original" then
					ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "entity_name_original" )
				else
					ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "entity_name" )
				end if
				choose case upper(mid(dw_detail.Describe( ls_ref_1 + ".coltype"),1,1)) //maha 072005  will overwrite the address_id _code if the correct reference field is 2
					case "D", "I", "N"
						ll_address_code = dw_detail.GetItemNumber( li_data_cr, ls_ref_1 )
					case "C", "V"
						ll_address_code = long(dw_detail.GetItemstring( li_data_cr, ls_ref_1 ))
				end choose					
			ELSE
				ls_reference = ls_reference + " - " + ls_refdata2//dw_detail.GetText()
			END IF 
		END IF
		ls_reference = mid(ls_reference,1,100) //maha 022704
	end if
	//\maha 072005 ******************************
	//Start Code Change ----08.01.2008 #V85 maha - get active status to pass to function
	if dw_detail.Describe("active_status.ColType") <> "!" then
		li_status = dw_detail.getitemnumber(li_data_cr,"active_status")
	end if
	//End Code Change---08.01.2008
	IF parent_window.Tab_1.tabpage_verif.uo_verif_summary.of_add_single_verif( il_prac_id, ll_rec_id, li_screen_id, ls_reference,  ldt_exp_date, ls_screen_name, ll_address_code,"M",li_status) = -1 THEN
		Return -1
	END IF
else
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> UM-01
	//$<add> 01.13.2006 By: LeiWei
	//$<reason> Appeon deals with NULL value differently from that in PowerBuilder.
	//$<modification> Convert variable 'ls_ref_1' to ' ' when it is null
	If Isnull(ls_ref_1) Then ls_ref_1 = ' '
	//---------------------------- APPEON END ----------------------------
	messagebox("Data Error", "There is no data for the required field" + ls_ref_1)
	return -1
END IF

dw_detail.SetFocus()

RETURN 1


end function

public function integer of_add_address_link (long al_address_id);n_ds lds_address_link

Integer li_row_cnt
Integer i
Integer li_nr

//dw_link_list = CREATE n_ds
//dw_link_list.DataObject = "d_address_link"
dw_link_list.SetTransObject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<comment> 2006-04-11 By: owen chen
//$<reason> Performance tuning modification
//$<reason> Reduce the frequency of client-server interactions to improve runtime performance 
/*
n_ds lds_parent_facilities
lds_parent_facilities = CREATE n_ds
lds_parent_facilities.DataObject = "d_address_link_parent_facility_id"
lds_parent_facilities.of_SetTransObject( SQLCA )
li_row_cnt = lds_parent_facilities.Retrieve( il_prac_id )
*/

li_row_cnt = ids_parent_facilities.rowcount( )

//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_row_cnt
	li_nr = dw_link_list.InsertRow( 0 )
	dw_link_list.SetItem( li_nr, "prac_id", il_prac_id )
	dw_link_list.SetItem( li_nr, "address_id", al_address_id )
	dw_link_list.SetItem( li_nr, "facility_id", ids_parent_facilities.GetItemNumber( i, "parent_facility_id" ) )
	dw_link_list.SetItem( li_nr, "mailing", 0 )
	dw_link_list.SetItem( li_nr, "billing", 0 )
	dw_link_list.SetItem( li_nr, "home_address", 0 )
	dw_link_list.SetItem( li_nr, "primary_office", 0 )
	dw_link_list.SetItem( li_nr, "additional_office", 0 )
	dw_link_list.SetItem( li_nr, "include_in_directory", 0 )
	dw_link_list.SetItem( li_nr, "exp_letters", 0 )
END FOR


//dw_detail.Update() //maha removed 020805

//OpenWithParm( w_address_link, String( il_prac_id ) + "-" + String( al_address_id) )

//DESTROY dw_link_list
//DESTROY lds_parent_facilities

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 2007.07.10 By: Scofield
//$<Reason> Update dw_link_list
dw_link_list.Update()
//---------------------------- APPEON END ----------------------------

Return 1
end function

public function integer of_add_delete_enable ();Long ll_screen_id
integer i


IF dw_select_section.GetRow() = 0 THEN
	Return -1
END IF

ll_screen_id = dw_select_section.GetItemNumber(dw_select_section.GetRow(), "screen_id" )

IF IsValid( m_pfe_cst_data_entry ) THEN
	If w_mdi.of_security_access( 40 ) < 2 then //maha 082503
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'enabled', false) 
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_delete1,'enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_insert,'enabled', False)
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_save,'enabled', False)
	else
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'enabled', true)
		IF ll_screen_id = 1 THEN
			gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_delete1,'enabled', False)
			gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_insert,'enabled', False)
		ELSE	
			gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_delete1,'enabled', True)
			gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_insert,'enabled', True)
		END IF
	end if
	//--------------------------- APPEON BEGIN ---------------------------
	//$< Add  > 2008-09-23 By: Scofield
	//$<Reason> Enabled or disabled the import photo button.

	if ii_screen_id = 1 then
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_importphoto,'Enabled', true)
	else
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_file.m_importphoto,'Enabled', false)
	end if
	//---------------------------- APPEON END ----------------------------
END IF

Return 0

end function

public function integer of_set_de_complete_date_null ();//maha 111300
update pd_affli_stat
set date_data_entry_completed = null
where (prac_id = :gl_prac_id) and 
      (parent_facility_id = :ii_parent_facility_id) and
		(active_status = 1) ;
		
return 1
		
end function

public function integer of_add_hosp_link (readonly long ai_hosp_id);n_ds lds_hosp_link
n_ds lds_parent_facilities
Integer li_row_cnt
Integer i
Integer li_nr

lds_hosp_link = CREATE n_ds
lds_hosp_link.DataObject = "d_hf_link"
lds_hosp_link.of_SetTransObject( SQLCA )
//dw_link_list.SetTransObject( SQLCA )

lds_parent_facilities = CREATE n_ds
lds_parent_facilities.DataObject = "d_address_link_parent_facility_id"
lds_parent_facilities.of_SetTransObject( SQLCA )
li_row_cnt = lds_parent_facilities.Retrieve( il_prac_id )
//messagebox("facilities",li_row_cnt)
FOR i = 1 TO li_row_cnt
	li_nr = lds_hosp_link.InsertRow( 0 )	
	lds_hosp_link.SetItem( li_nr, "prac_id", il_prac_id )
	lds_hosp_link.SetItem( li_nr, "hosp_affil_id", ai_hosp_id )
	lds_hosp_link.SetItem( li_nr, "primary_hosp", 582)	
	lds_hosp_link.SetItem( li_nr, "facility_id", lds_parent_facilities.GetItemNumber( i, "parent_facility_id" ) )
END FOR

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
lds_hosp_link.Update()
dw_link_list.retrieve(ai_hosp_id)
*/

IF li_row_cnt > 0 THEN
	gnv_appeondb.of_startqueue( )
	
	lds_hosp_link.Update()
	dw_link_list.retrieve(ai_hosp_id)
	
	gnv_appeondb.of_commitqueue( )
END IF

//---------------------------- APPEON END ----------------------------

//dw_detail.Update() //maha removed 020905
//openwithparm(w_hosp_links,ai_hosp_id)

dw_link_list.bringtotop = true

DESTROY lds_hosp_link
DESTROY lds_parent_facilities


Return 1

end function

public function integer of_add_spec_link (long ai_rec_id);n_ds lds_spec_link
n_ds lds_parent_facilities
Integer li_row_cnt
Integer i
Integer li_nr

lds_spec_link = CREATE n_ds
lds_spec_link.DataObject = "d_sf_link"
lds_spec_link.of_SetTransObject( SQLCA )
//dw_link_list.SetTransObject( SQLCA ) //changed 121702 maha

lds_parent_facilities = CREATE n_ds
lds_parent_facilities.DataObject = "d_address_link_parent_facility_id"
lds_parent_facilities.of_SetTransObject( SQLCA )
li_row_cnt = lds_parent_facilities.Retrieve( il_prac_id )
//messagebox("facilities",li_row_cnt)
//messagebox("spec id",ai_rec_id)
FOR i = 1 TO li_row_cnt
	li_nr = lds_spec_link.InsertRow( 0 )	
	lds_spec_link.SetItem( li_nr, "prac_id", il_prac_id )
	lds_spec_link.SetItem( li_nr, "specialty_id", ai_rec_id )
	lds_spec_link.SetItem( li_nr, "practicing", 582)	
	lds_spec_link.SetItem( li_nr, "facility_id", lds_parent_facilities.GetItemNumber( i, "parent_facility_id" ) )
END FOR
//messagebox("speccs",lds_spec_link.rowcount())

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-09
//$<modify> 03.01.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Add Appeon Commit label to reduce client-server interactions to improve runtime performance.
/*
lds_spec_link.Update()
commit using sqlca;
*/
IF li_row_cnt > 0 THEN
	gnv_appeondb.of_autocommit( )
	lds_spec_link.Update()
	commit using sqlca;
END IF
//---------------------------- APPEON END ----------------------------

//dw_detail.Update()//maha removed 020905
//openwithparm(w_spec_links,ai_rec_id)

dw_link_list.bringtotop = true

DESTROY lds_spec_link
DESTROY lds_parent_facilities

dw_link_list.retrieve(ai_rec_id)

Return 1
end function

public function integer of_address_link_check ();Integer li_facility_id
Integer li_row_cnt
Integer li_primary
Integer li_additional
Integer i
Integer li_mailing
Integer li_billing
Integer li_exp_mail
Long ll_prac_id
Long ll_address_id
String ls_facility_nm
n_ds lds_dup_mail_search
n_ds lds_dup_exp_mail_search
n_ds lds_dup_primary_search

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<modify> 03.02.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Move the following SQL statements to PT-11, and integrate
//$<modification> them with other SQL statements into Appeon Queue labels to
//$<modification> reduce client-server interactions.
/*
lds_dup_mail_search = CREATE n_ds
lds_dup_mail_search.DataObject = "d_address_link_duplicate_mail_check"
lds_dup_mail_search.of_SetTransObject( SQLCA )

lds_dup_exp_mail_search = CREATE n_ds
lds_dup_exp_mail_search.DataObject = "d_address_link_duplicate_exp_mail_check"
lds_dup_exp_mail_search.of_SetTransObject( SQLCA )

lds_dup_primary_search = CREATE n_ds
lds_dup_primary_search.DataObject = "d_address_link_duplicate_primary_check"
lds_dup_primary_search.of_SetTransObject( SQLCA )
*/
//---------------------------- APPEON END ----------------------------

dw_link_list.AcceptText()

li_row_cnt = dw_link_list.RowCount()

IF li_row_cnt = 0 THEN
	Return 1
END IF

ll_prac_id = dw_link_list.GetItemNumber( 1, "prac_id" )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-11
//$<add> 03.02.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> 1)Add the SQLs from PT-10.
//$<modification> 2)Add Appeon Queue labels to reduce client-server interaction.
//$<modification> 3)Use datastores to retrieve data from database instead of using
//$<modification> SQL in PT-12/13/14.
Long li_facility_id_arr[]

FOR i = 1 TO li_row_cnt
	li_facility_id = dw_link_list.GetItemNumber( i, "facility_id" )
	li_primary = dw_link_list.GetItemNumber( i, "primary_office" )
	li_additional = dw_link_list.GetItemNumber( i, "additional_office" )

	li_facility_id_arr[i] = li_facility_id
	
	IF li_primary = 1 AND li_additional = 1 THEN
		MessageBox("Invalid Selection", "An address can be setup as either a Primary office or Additional office, not both. Please correct.")
		dw_link_list.SetItem( i, "primary_office", 0  )
		dw_link_list.SetItem( i, "additional_office", 0  )
		dw_link_list.SetFocus()		
		Return -1
	END IF
END FOR

lds_dup_mail_search = CREATE n_ds
lds_dup_mail_search.DataObject = "d_address_link_duplicate_mail_check_pt"
lds_dup_mail_search.of_SetTransObject( SQLCA )

lds_dup_exp_mail_search = CREATE n_ds
lds_dup_exp_mail_search.DataObject = "d_address_link_duplicate_exp_mail_che_pt"
lds_dup_exp_mail_search.of_SetTransObject( SQLCA )

lds_dup_primary_search = CREATE n_ds
lds_dup_primary_search.DataObject = "d_address_link_duplicate_primary_che_pt"
lds_dup_primary_search.of_SetTransObject( SQLCA )

gnv_appeondb.of_startqueue( )

lds_dup_primary_search.Retrieve( li_facility_id_arr[], ll_prac_id  )
lds_dup_exp_mail_search.Retrieve( li_facility_id_arr[], ll_prac_id )
lds_dup_mail_search.Retrieve( li_facility_id_arr[], ll_prac_id ) 

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

FOR i = 1 TO li_row_cnt
	//setup variables for retrieving data
	li_facility_id = dw_link_list.GetItemNumber( i, "facility_id" )
	ls_facility_nm = dw_link_list.GetItemString( i, "facility_facility_name" )
	ll_address_id = dw_link_list.GetItemNumber( i, "address_id" )
	li_mailing = dw_link_list.GetItemNumber( i, "mailing" )
	li_exp_mail	= dw_link_list.GetItemNumber( i, "exp_letters" )
	li_billing = dw_link_list.GetItemNumber( i, "billing" )
	li_primary = dw_link_list.GetItemNumber( i, "primary_office" )
	li_additional = dw_link_list.GetItemNumber( i, "additional_office" )

	IF li_primary = 1 AND li_additional = 1 THEN
		MessageBox("Invalid Selection", "An address can be setup as either a Primary office or Additional office, not both. Please correct.")
		dw_link_list.SetItem( i, "primary_office", 0  )
		dw_link_list.SetItem( i, "additional_office", 0  )
		DESTROY lds_dup_exp_mail_search
		DESTROY lds_dup_mail_search
		DESTROY lds_dup_primary_search				
		dw_link_list.SetFocus()		
		Return -1
	END IF
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-12
	//$<modify> 03.02.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache in PT-11 instead of from the database.
	/*
	//check if there is any other prmary addresses setup
	lds_dup_primary_search.Retrieve( li_facility_id, ll_address_id, ll_prac_id  )
	*/
	lds_dup_primary_search.SetFilter( "facility_id_pt = " + String(li_facility_id) + " and address_id_pt <> " + String(ll_address_id))
	lds_dup_primary_search.Filter( )
	//--------------------------- APPEON END -----------------------------

	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.14.2006 By: Liang QingShi
	//$<reason> Fix a defect.
	
	/*
	IF lds_dup_primary_search.GetItemNumber( 1, "dup_count" ) > 0 AND li_primary > 0 THEN
	*/
	integer li_rowcount
	li_rowcount = lds_dup_primary_search.rowcount()
	if li_rowcount > 0 then
		IF lds_dup_primary_search.GetItemNumber( 1, "dup_count" ) > 0 AND li_primary > 0 THEN
	//---------------------------- APPEON END ----------------------------
			MessageBox("Primary Address", "You already have a primary address setup for " + ls_facility_nm)
			dw_link_list.SetColumn( "primary_office" )
			dw_link_list.SetItem( i, "primary_office", 0  )
			dw_link_list.SetRow( i )
			dw_link_list.ScrollToRow( i )
			dw_link_list.SetFocus()		
			DESTROY lds_dup_exp_mail_search
			DESTROY lds_dup_mail_search
			DESTROY lds_dup_primary_search
			RETURN -1
		END IF
	END IF	
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-13
	//$<modify> 03.02.2006 By: LeiWei
	//$<modification> Write script to retrieve data from a cache in PT-11 instead of from the database.
	/*
	//check if there is any other exp_mail setup
	lds_dup_exp_mail_search.Retrieve( li_facility_id, ll_prac_id )
	*/
	lds_dup_exp_mail_search.SetFilter( "facility_id_pt = " + String(li_facility_id))
	lds_dup_exp_mail_search.Filter( )
	//--------------------------- APPEON END -----------------------------

	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.14.2006 By: Liang QingShi
	//$<reason> Fix a defect.
	/*
	IF lds_dup_exp_mail_search.GetItemNumber( 1, "dup_count" ) > 1 AND li_exp_mail > 0 THEN
	*/
	li_rowcount = lds_dup_exp_mail_search.rowcount()
	if li_rowcount > 0 then
		IF lds_dup_exp_mail_search.GetItemNumber( 1, "dup_count" ) > 1 AND li_exp_mail > 0 THEN
	//---------------------------- APPEON END ----------------------------
			MessageBox("Expiring Credentials Mail Address", "You already have an expiring credentials mailing address setup for this practitioner.")
			dw_link_list.SetColumn( "exp_letters" )
			dw_link_list.SetItem( i, "exp_letters", 0  )		
			dw_link_list.SetRow( i )
			dw_link_list.ScrollToRow( i )
			dw_link_list.SetFocus()		
			DESTROY lds_dup_exp_mail_search
			DESTROY lds_dup_mail_search
			DESTROY lds_dup_primary_search		
			RETURN -1
		END IF
	END IF

	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-14
	//$<modify> 03.02.2006 By: LeiWei
	//$<modification> Write script to retrieve data from a cache in PT-11 instead of from the database.
	/*
	//check if there is already a mailing address for dw_link_list facility
	lds_dup_mail_search.Retrieve( li_facility_id, ll_address_id, ll_prac_id ) 
	*/
	lds_dup_mail_search.SetFilter( "facility_id_pt = " + String(li_facility_id) + " and address_id_pt <> " + String(ll_address_id))
	lds_dup_mail_search.Filter( )
	//--------------------------- APPEON END -----------------------------

	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 03.14.2006 By: Liang QingShi
	//$<reason> Fix a defect.
	/*
	IF lds_dup_mail_search.GetItemNumber( 1, "dup_count" ) > 0 AND li_mailing > 0 THEN
	*/
	li_rowcount = lds_dup_mail_search.rowcount()
	if li_rowcount > 0 then
		IF lds_dup_mail_search.GetItemNumber( 1, "dup_count" ) > 0 AND li_mailing > 0 THEN
	//--------------------------- APPEON END -----------------------------
			MessageBox("Mailing Address", "You already have a mailing address setup for " + ls_facility_nm)
			dw_link_list.SetColumn( "mailing" )
			dw_link_list.SetItem( i, "mailing", 0  )		
			dw_link_list.SetRow( i )
			dw_link_list.ScrollToRow( i )
			dw_link_list.SetFocus()
			DESTROY lds_dup_exp_mail_search
			DESTROY lds_dup_mail_search
			RETURN -1
		END IF
	END IF
	//\/maha app100305	
	if isnull(dw_link_list.GetItemNumber( i, "mailing" )) then dw_link_list.setItem( i, "mailing",0 )
	if isnull(dw_link_list.GetItemNumber( i, "billing" )) then dw_link_list.setItem( i, "billing",0 )
	if isnull(dw_link_list.GetItemNumber( i, "primary_office" )) then dw_link_list.setItem( i, "primary_office",0 )
	if isnull(dw_link_list.GetItemNumber( i, "additional_office" )) then dw_link_list.setItem( i, "additional_office",0 )
	if isnull(dw_link_list.GetItemNumber( i, "exp_letters" )) then dw_link_list.setItem( i, "exp_letters",0 )

END FOR

DESTROY lds_dup_exp_mail_search
DESTROY lds_dup_mail_search
DESTROY lds_dup_primary_search
		
RETURN 1
end function

public function integer of_designer_type (string as_type);
is_designer_type = as_type

Return 1
end function

public function integer of_oig_query ();Integer li_cnt
integer res
Long ll_rec_id
Long ll_oig_query
String ls_val
String ls_oig_verify_data
String ls_appt_type
String ls_work_gap_check
String ls_npdb_query_type
DateTime ldt_exp_date
integer li_one_facil //maha 020901


if isnull(li_one_facil) then li_one_facil = 0

SetNull( ldt_exp_date )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-15
//$<modify> 02.24.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
// find out if prac is in initial or reappointment
SELECT pd_affil_stat.apptmnt_type  
INTO :ls_appt_type  
FROM pd_affil_stat  
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND  
      ( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) and 
		(pd_affil_stat.active_status in (1,4)); //maha added 080901  //maha  changed to include pending 072402


	//check the rules in the facility painter for the parent facility to see if the
	//npdb and or hipdb queryies verification entries should be generated.
	SELECT facility.oig_verify_data
	INTO :ls_oig_verify_data
	FROM facility  
	WHERE facility.facility_id = :ii_parent_facility_id   ;
	//if o then do not query npdb or hipdb
	IF ls_oig_verify_data <> "O" THEN
		//also check at the prac level to see if the individual prac will need npdb query.
		SELECT pd_basic.oig_query  
		INTO :ll_oig_query
		FROM pd_basic  
		WHERE pd_basic.prac_id = :il_prac_id   ;
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox( "Select Error", SQLCA.SQLERRTEXT )
			Return -1
		END IF

		IF ( ls_appt_type = "I" AND ( ls_oig_verify_data = "B" OR ls_oig_verify_data = "I" ) )  OR  +&
		   ( ls_appt_type = "R" AND ls_oig_verify_data = "B" OR ls_oig_verify_data = "R" )  THEN
	   
			SELECT code_lookup.code  
			INTO :ls_val
			FROM code_lookup  
			WHERE code_lookup.lookup_code = :ll_oig_query;
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox( "Select Error", SQLCA.SQLERRTEXT )
				Return -1
			END IF
			//MessageBox("ls_val",ls_val)
			IF Upper( ls_val ) = 'YES' THEN
			
					SELECT Count(*)  
					INTO :li_cnt  
					FROM verif_info  
					WHERE ( verif_info.facility_id = :ii_parent_facility_id ) AND  
					      ( verif_info.prac_id = :il_prac_id ) AND  
					      ( verif_info.active_status = 1) AND  
					      ( verif_info.reference_value = 'OIG QUERY' );
							
					IF SQLCA.SQLCODE = -1 THEN
						MessageBox("SQL ERROR", SQLCA.SQLERRTEXT)
						RETURN -1
					END IF
					IF li_cnt = 0 THEN			
						ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )	
						//if li_one_facil = 1 then// create for this facility only
							res = parent_window.tab_1.tabpage_verif.uo_verif_summary.of_add_oig( il_prac_id, ll_rec_id, ii_parent_facility_id) 
							//MessageBox("oig",res)
							if res = -1 THEN
								Return -1	
							end if				
					END IF
		
			END IF
		END IF
	END IF

*/
gnv_appeondb.of_startqueue( )

// find out if prac is in initial or reappointment
SELECT pd_affil_stat.apptmnt_type  
INTO :ls_appt_type  
FROM pd_affil_stat  
WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND  
      ( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) and 
		(pd_affil_stat.active_status in (1,4)); //maha added 080901  //maha  changed to include pending 072402


//check the rules in the facility painter for the parent facility to see if the
//npdb and or hipdb queryies verification entries should be generated.
SELECT facility.oig_verify_data
INTO :ls_oig_verify_data
FROM facility  
WHERE facility.facility_id = :ii_parent_facility_id   ;

SELECT pd_basic.oig_query  
INTO :ll_oig_query
FROM pd_basic  
WHERE pd_basic.prac_id = :il_prac_id   ;

SELECT Count(*)  
INTO :li_cnt  
FROM verif_info  
WHERE ( verif_info.facility_id = :ii_parent_facility_id ) AND  
		( verif_info.prac_id = :il_prac_id ) AND  
		( verif_info.active_status = 1) AND  
		( verif_info.reference_value = 'OIG QUERY' );

gnv_appeondb.of_commitqueue( )

	//if o then do not query npdb or hipdb
	IF ls_oig_verify_data <> "O" THEN
		//also check at the prac level to see if the individual prac will need npdb query.
		IF ( ls_appt_type = "I" AND ( ls_oig_verify_data = "B" OR ls_oig_verify_data = "I" ) )  OR  +&
		   ( ls_appt_type = "R" AND ls_oig_verify_data = "B" OR ls_oig_verify_data = "R" )  THEN
	   
			ls_val = gnv_data.of_getitem( "code_lookup", "code", "lookup_code = " + String(ll_oig_query) )
			//MessageBox("ls_val",ls_val)
			IF Upper( ls_val ) = 'YES' THEN
					IF li_cnt = 0 THEN			
						ll_rec_id = gnv_app.of_get_id( "RECORD_ID" )	
						//if li_one_facil = 1 then// create for this facility only
							//res = parent_window.tab_1.tabpage_verif.uo_verif_summary.of_add_oig( il_prac_id, ll_rec_id, ii_parent_facility_id) 
							res = of_add_oig( il_prac_id, ll_rec_id, ii_parent_facility_id) //
							//MessageBox("oig",res)
							if res = -1 THEN
								Return -1	
							end if				
					END IF
		
			END IF
		END IF
	END IF

//---------------------------- APPEON END ----------------------------

RETURN 1
end function

public function integer of_validate (integer ai_table, integer ai_row);//new function maha 080803  called from dw_detail pfc_preupdate
//function redesigned 072304 to allow validation on any credentialing data field - maha
long ll_data
string ls_data
integer i
integer ic
integer chk = 0
integer res
integer fc
integer f
integer v
integer c
integer ck
integer cc
long ll_recid
string ls_des
string ls_fname
string ls_tname
string ls_type
string ls_value
string ls_sql
string ls_presentation_str
string ls_dwsyntax_str
string ERRORS
//Start Code Change ---- 10.02.2006 #635 maha  redesigned as well as corrected bug for more than 1 existing matching record
string ls_mess
string ls_npi //maha6.15.07
n_ds lds_fields
n_ds lds_count

lds_fields = CREATE n_ds
lds_count = CREATE n_ds

lds_fields.dataobject = "d_validation_fields"
lds_fields.settransobject(sqlca)
fc = lds_fields.retrieve(ai_table)
ll_recid = dw_detail.getitemnumber(ai_row,"rec_id")

if fc = 0 then return 1

for f = 1 to fc
	
	ck = 0
	ls_fname = lds_fields.getitemstring(f,"field_name")
	ls_tname = lds_fields.getitemstring(f,"table_name")
	v = lds_fields.getitemnumber(f,"use_validation")
	ls_type = upper(lds_fields.getitemstring(f,"field_type"))
	if ai_table = 25 then  //basic info/personal data field trap maha 120604
		ck = 0
		cc = integer(dw_detail.Object.DataWindow.column.count)
		for c = 1 to cc  //if the column exists in the datawindow continue, else drop out of function
			ls_des = dw_detail.describe("#" + string(c) + ".name" )
			if ls_des = ls_fname then
				ck = 1
				exit
			end if
		next
		if ck = 0 then return 1		
	end if

	if dw_detail.Describe( ls_fname + ".ColType") = "!" then return 1 //Start Code Change ---- 08.17.2007 #V7 maha  trap for none existant field on screen
	
	choose case ls_type
		case "N", "I","L"
			ls_value = string(dw_detail.getitemnumber(ai_row,ls_fname))
		case "C"
			ls_value = "'" + dw_detail.getitemstring(ai_row,ls_fname) + "'"
		case "D", "T" //not really going to work for the timestamps
			ls_value = "'" + string(dw_detail.getitemdatetime(ai_row,ls_fname)) + "'"
		case else 
			messagebox("of_validation function error","Data type " + ls_type + " not coded for.  Data not validated.")
			return 1
	end choose
	
//Start Code Change ----06.16.2008 #V81 maha
	if v <> 5 then
		if isnull(ls_value) then continue
	end if
//End Code Change---.2008

	choose case v
		case 1 //unique warning
			ls_sql = "select * from " + ls_tname + " where " + ls_fname + " = " + ls_value + ";"
			ls_mess = "Field " + upper(ls_fname) + " is not unique in the database on row " + string(ai_row) + ".  Do you wish to add/update the record with the duplicated value?"

		case 2 //unique
			ls_sql = "select * from " + ls_tname + " where " + ls_fname + " = " + ls_value + ";"
			ls_mess = "Field " + upper(ls_fname) + " is not unique in the database on row " + string(ai_row) + ".  You must correct to save the record."

		case 3 //dupe warning
			ls_sql = "select * from " + ls_tname + " where " + ls_fname + " = " + ls_value + " and prac_id = " + string(il_prac_id) + ";"
			ls_mess = "Field " + upper(ls_fname) + " is duplicated on row " + string(ai_row) + ".  Do you wish to add/update the record with the duplicated value?"

		case 4 // no dupes 
			ls_sql = "select * from " + ls_tname + " where " + ls_fname + " = " + ls_value + " and prac_id = " + string(il_prac_id) + ";"
			ls_mess = "Field " + upper(ls_fname) + " is duplicated on row " + string(ai_row) + ".  You must correct to save the record."
						
		case 5 // special
			choose case ls_fname
				case "special coded field"
					//specify the field name as the case and create code specific for that case. Test for table_id in the code.
				case "npi_number"  //Start Code Change ---- 06.15.2007 #V7 maha --will check for valid NPI format as well as unique value in the system.
					ls_npi = dw_detail.getitemstring(ai_row,ls_fname)
					// if len(ls_npi) = 0 then return 1 //Commented by Ken.Guo 2008-07-22
					If ls_npi = '' or isnull(ls_npi) Then Return 1 //Added by Ken.Guo 2008-07-22
					res = of_npi_validation(ls_npi ,"DE")  //Start Code Change ----04.23.2008 #V8 maha - this is an application function 
					if res < 0 then
						choose case res
							case -1
								ls_mess = "Invalid.  NPI number must be 10 Characters."
							case -2
								ls_mess = "Invalid.  NPI number can contain Numerals only."
							case -3
								ls_mess = "Invalid.  Not a valid NPI number"
						end choose
						messagebox("NPI Validation",ls_mess)
						return -1
						continue
					else //now set to check to see if it is unique
						ls_sql = "select * from " + ls_tname + " where npi_number = " + ls_value + ";"
						ls_mess = "Field NPI NUMBER is not unique in the database on row " + string(ai_row) + ".  You must correct to save the record."
						v = 2 //reset so the message will run
					end if
				
				case "end_date"
					res = inv_data_entry.of_record_validation( dw_detail)
					if res = -1 then return -1
				case "year_thru"
					res = inv_data_entry.of_record_validation( dw_detail)
					if res = -1 then return -1
				case else
					return 1
			end choose
		case else
			return 1
	end choose

	ls_presentation_str = "style(type=grid)" 
	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_sql, ls_presentation_str, ERRORS)
	lds_count.Create( ls_dwsyntax_str, ERRORS)
	lds_count.settransobject(sqlca)
	ck = lds_count.retrieve()
	if ck > 0 then
		if ck = 1 and ll_recid = lds_count.getitemnumber(1,"rec_id") then
			//it is ok
		else
			choose case v //warning only
				case 1,3
					res = messagebox("Data Entry Validation Warning", ls_mess,question!,yesno!,2)
					if res = 2 then 
						return -1
					end if
				case 2,4
					res = messagebox("Data Entry Validation Warning", ls_mess) 
					return -1
			end choose
		end if
	end if
	
next
//End Code Change---10.02.2006
destroy lds_count			
destroy lds_fields
return 1
end function

public function integer of_lookup_search_dddw (string as_type);/******************************************************************************************************************
**  [PUBLIC]   : of_lookup_search_dddw( /*string as_type */)
**==================================================================================================================
**  Purpose   	: Set the vales from the search window or back to the original value
**==================================================================================================================
**  Arguments 	: [string] as_type - not used
**==================================================================================================================
**  Returns   	: [none]   
**==================================================================================================================
**  Notes     	: 	   
**==================================================================================================================
**  Created By	: ??
**==================================================================================================================
**  Modification Log
**   Changed By             Change Date                                               Reason
** ------------------------------------------------------------------------------------------------------------------
**  MSkinner 						 19 December 2005                           I was getin a GPF on line 24 of the original code
**  mskinner 						 23 March    2006                           Modoified code so that -777 or -888 will not be saved
********************************************************************************************************************/


DataWindowChild dwchild
any l_any
long li_row_cnt
long ll_val
long ll_find
String ls_column_nm
String ls_retval
String ls_search_type
String ls_value
any ll_null
setnull(ll_null)

n_cst_dwsrv lnv_dwsrv
lnv_dwsrv = create n_cst_dwsrv
lnv_dwsrv.of_setrequestor( dw_detail)

ls_column_nm = dw_detail.GetColumnName()

ls_retval = dw_detail.Describe( ls_column_nm + ".DDDW.DisplayColumn" )

dw_detail.getchild( ls_column_nm, dwchild)
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04.14.2006 By: Liang QingShi
//$<reason> Fix a defect.

If appeongetclienttype() <> 'PB' Then
   dw_detail.triggerevent('itemfocuschanged')
end if
//---------------------------- APPEON END ----------------------------
OpenWithParm( w_lookup_search_dddw,as_type + "@" + is_lookup_search_column_table )

IF Message.StringParm = "Cancel" THEN
	
	ls_value = lnv_dwsrv.of_getitem( dw_detail.GetRow(), ls_column_nm , primary!,true)
	if string(ls_value) = "-777" OR string(ls_value) = "-888" or not f_validstr(ls_value) then
		setnull(ls_value)
	end if

	lnv_dwsrv.of_setitem( dw_detail.GetRow(), ls_column_nm, ls_value)
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Add> 08.23.2007 By: Evan
	//$<Reason> Need to destroy object.
	if IsValid(lnv_dwsrv) then Destroy lnv_dwsrv
	//---------------------------- APPEON END ----------------------------	
	RETURN -1
else
	l_any = Message.DoubleParm
	
	lnv_dwsrv.of_setitem( dw_detail.GetRow(), ls_column_nm, string(l_any))
	
	dw_detail.accepttext()
	inv_data_entry.of_dwchild_retrieve(is_lookup_search_column_table,as_type,dw_detail,"RET",l_any,ls_column_nm)
end if

IF IsValid( m_pfe_cst_data_entry ) THEN
	gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_lookupsearch,'Enabled', True)
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(lnv_dwsrv) then Destroy lnv_dwsrv
//---------------------------- APPEON END ----------------------------

Return 0


end function

public function integer of_screen_color ();//for setting screen names green includes of_rec_count and code in the dw_detail pfc_postupdate event
//called from retrieveend of dw_select_section  the select section dw object has a modification field (selected) that changes the color

integer i
integer ic
integer sid
integer cnt
string tname
//messagebox("of_screen","")

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-16
//$<modify> 03.06.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Use cursor to retrieve data instead of using SQL statements.
//$<modification> this modification reduces client-server interactions.

/*
for i = 1 to dw_select_section.rowcount()
	sid = dw_select_section.getitemnumber(i,"table_id")
	if sid <> 0 then
		//cnt = inv_data_entry.of_rec_count(sid,ii_parent_facility_id)
		cnt = inv_data_entry.of_rec_count(sid,0)
		//if i < 0 then 
		//messagebox("cnt",cnt)
		dw_select_section.setitem(i,"selected",cnt)
	end if
next
*/

String ls_sql
for i = 1 to dw_select_section.rowcount()
	sid = dw_select_section.getitemnumber(i,"table_id")
	if sid <> 0 then
		tname = gnv_data.of_getitem("sys_tables","table_name","table_id = " + string(sid))

		If Len(ls_sql) > 0 Then 	ls_sql += "~r~n union ~r~n"
		//ls_sql += "select " + String(sid) + ", count(rec_id) cnt from " + tname + " where prac_id = " + string(gl_prac_id) 
		ls_sql += "select " + String(sid) + ", cnt=1 where exists( select 1 from " + tname + " where prac_id = " + string(gl_prac_id) + ")" 
	end if
next

DECLARE rec_cursor DYNAMIC CURSOR FOR SQLSA ;

PREPARE SQLSA FROM :ls_sql ;

OPEN DYNAMIC rec_cursor;

FETCH rec_cursor INTO :sid, :cnt ;

DO WHILE sqlca.sqlcode = 0
	
	If cnt = 1 Then
		for i = 1 to dw_select_section.rowcount()
			If sid = dw_select_section.getitemnumber(i, "table_id") Then
				dw_select_section.setitem(i, "selected", 1)
			end if
		next
	End If
	
	FETCH rec_cursor INTO :sid, :cnt ;
LOOP

CLOSE rec_cursor ;
//---------------------------- APPEON END ----------------------------

return 1
end function

public function integer of_dwchild_retrieve (string as_lu_table, string as_type, u_dw adw_dw, string as_from, long al_value, string as_column_nm);//created maha 060805 to add search item in each lookup.  Called from of_create_dynamic_dw and the date entry user object of_lookup_function

long ll_val
datawindowchild dwchild
long ll_find
	
adw_dw.GetChild( as_column_nm, dwchild )
dwchild.retrieve(as_lu_table)
	
IF as_type = "C" THEN
	choose case as_lu_table
		case "Address Type"
			//exceptions
		case "Yes/No"
			//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 15")
			//adw_detail.Modify( ls_dw_field_names[i] + ".dddw.Lines= 20")
		case else
			dwchild.InsertRow(1)
			dwchild.setitem(1,"code",'-SEARCH/Add-')
			dwchild.setitem(1,"lookup_code",-777)
			dwchild.setitem(1,"description","-Search/Add for " + as_lu_table +" -")
	end choose
end if

IF as_type = "A" THEN
	dwchild.InsertRow(1)
	if dwchild.Describe("entity_name_original.ColType") <> "!" then
		//messagebox("","en")
		//long ert			
		dwchild.setitem(1,"code",'-SEARCH/ADD-')
		dwchild.setitem(1,"lookup_code",-888)
		dwchild.setitem(1,"entity_name_original","-Search/Add for " + as_lu_table +" -")
		//ert = dwchild.getitemnumber(1,"lookup_code")
		//messagebox("",ert)
	end if
end if
		
dwchild.InsertRow(1) //blank row

if as_from = "RET" then
	ll_val = al_value
	adw_dw.SetItem( adw_dw.GetRow(), as_column_nm, ll_val )
	adw_dw.accepttext()
	ll_find = dwchild.find("lookup_code = " + string(ll_val),1,dwchild.rowcount())
	if ll_find > 0 then
		dwchild.scrolltorow(ll_find)
	end if
end if


return 1
end function

public function integer of_lookup_search (string as_type);String ls_column_nm
String ls_retval
String ls_search_type
String ls_value
DataWindowChild dwchild
Integer li_row_cnt

ls_column_nm = dw_detail.GetColumnName()

ls_retval = dw_detail.Describe( ls_column_nm + ".DDDW.DisplayColumn" )
IF ls_retval <> "entity_name" THEN
	MessageBox("Lookup Search", "This is not an address lookup table" )
	RETURN -1
END IF

OpenWithParm( w_lookup_search, is_lookup_search_column_table )
IF Message.StringParm = "Cancel" THEN
	IF IsValid( m_pfe_cst_data_entry ) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_lookupsearch,'Enabled', True)
	END IF	
	RETURN -1
END IF


dw_detail.SetItem( dw_detail.GetRow(), ls_column_nm, Message.DoubleParm )

IF IsValid( m_pfe_cst_data_entry ) THEN
	gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_lookupsearch,'Enabled', True)
END IF	



Return 0


//debugbreak()
//ls_value = Upper( Mid( Message.StringParm, 1, POS( Message.StringParm, "-" ) -1 ) )
//ls_search_type = Mid( Message.StringParm, POS( Message.StringParm, "-" )+1, 1000 )
//dw_detail.GetChild( ls_column_nm, dwchild )
//IF ls_search_type = "city" THEN
//	dwchild.SetFilter( "Upper(city) = '" + ls_value + "'" )
//ELSEIF ls_search_type = "state" THEN
//	dwchild.SetFilter( "Upper(state) = '" + ls_value + "'" )
//ELSEIF ls_search_type = "country" THEN
//	dwchild.SetFilter( "Upper(country) = '" + ls_value + "'" )
//ELSE
//	//dw_detail.Modify( ls_column_nm + ".DDDW.Name = 'd_dddw_address_lookup'" )
//	//dw_detail.Modify( ls_column_nm + ".DDDW.DisplayColumn = 'entity_name'" )
//	//dw_detail.Modify( ls_column_nm + ".DDDW.DataColumn = 'lookup_code'" )
//	//dw_detail.Modify( ls_column_nm + ".DDDW.VScrollbar" )
//	//dw_detail.Modify( ls_column_nm + ".dddw.Lines= 15")	
//	//dw_detail.GetChild( ls_column_nm, dwchild )	
//	//dwchild.SetTransObject( SQLCA )
//	//li_row_cnt =dwchild.Retrieve( is_lookup_search_column_table )
//	dwchild.SetFilter("")
//	dw_select_section.SetFocus()
//	dw_detail.SetFocus()
//	is_lookup_search_column = "None"
//END IF
//
//dw_detail.Modify( ls_column_nm + ".dddw.Lines= 15")	
//dwchild.Filter()
//dw_select_section.SetFocus()
//dw_detail.SetFocus()
//	
//IF IsValid( m_pfe_cst_data_entry ) THEN
//	m_pfe_cst_data_entry.m_edit.m_lookupsearch.Enabled = True
//END IF
//
//is_lookup_search_column = ls_column_nm
//
//RETURN 1
end function

public function integer of_add_questions (string as_from);//function created maha app081705 for adding attest questions in a batch.  Called from dw_detail pfc_addrow
//Argument currently not used; for possible future development
//moved the de functions object can be deleted after all tested ok

//integer i
//integer r
//integer c
//integer cr
//integer ck = 0
//long ls_exist_id
//long ls_new_id
//long ll_as_id
//gs_variable_array ls_array
//long il_id[]
//integer cnt
//
//cr = dw_detail.rowcount()
//
//select count(rec_id) into :cnt from pd_affil_stat where prac_id = :gl_prac_id and parent_facility_id = :ii_parent_facility_id and active_status > 0;
//if cnt < 1 then
//	messagebox("Appointment record error","There are multiple non-history records (Active,Inactive,Pending,Purge) for this practitioner and facility.  This should be corrected on the Appointment Status tab before adding Attestation Questions.")
//	return - 1 
//else
//	select rec_id into :ll_as_id from pd_affil_stat where prac_id = :gl_prac_id and parent_facility_id = :ii_parent_facility_id and active_status > 0;
//end if	
//
//open (w_question_select)
//if message.stringparm = "Cancel" then
//	return 0
//else
//	ls_array = message.powerobjectparm
//	il_id = ls_array.as_number
//	for i = 1 to upperbound(il_id)
//		ls_new_id = il_id[i]
//		ck = 0
//		for c = 1 to cr  //check existing records to avoid duplicates
//			ls_exist_id = dw_detail.getitemnumber(c,"question_id")
//			if ls_new_id = ls_exist_id then ck = 1
//		next
//		if ck = 1 then  //if exists skip
//			continue
//		else
//			r = dw_detail.insertrow(0)
//			//dw_detail.setitem(r,"facility_id",ii_parent_facility_id)
//			//dw_detail.setitem(r,"prac_id",il_id[i])
//			dw_detail.setitem(r,"active_status",1)
//			dw_detail.setitem(r,"question_id",il_id[i])
//			dw_detail.setitem(r,"appt_stat_id",ll_as_id)
//		end if
//	next
	return 1
//end if


end function

public function integer of_add_npdb (long al_prac_id, long al_rec_id, long al_screen_id, string as_reference, datetime adt_exp_date, string as_screen_name, long al_address_lookup_code, string as_add_type, integer ai_parent_facility_id);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_u_verification_info.of_add_npdb()
// $<arguments>
//		long    	al_prac_id            		
//		long    	al_rec_id             		
//		long    	al_screen_id          		
//		string  	as_reference          		
//		datetime	adt_exp_date          		
//		string  	as_screen_name        		
//		long    	al_address_lookup_code		
//		string  	as_add_type           		
//		integer 	ai_parent_facility_id 		
// $<returns> integer
// $<description> This function is copied from pfc_cst_u_verification_info object. The tab control used
// $<description> the CreateOnDemand property in the parent window. So, The data can not be added if the verif
// $<description> tabpage has not been selected when setting data entry complete.
//////////////////////////////////////////////////////////////////////
// $<add> 02.20.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////

//created 020901 to allow only one npdb to be created when clicking data entry complete
Integer li_nr
Integer li_row_cnt
Integer li_rc
Integer i
Integer ll_hc_code
Long ll_seq_no
Integer li_rsp_rc
//Integer li_facility_id
Long ll_default_verif_method
String ls_identifying_number
String ls_doc_id
String ls_priority_user
Integer li_priority
datastore lds_ver_orgs_facilities
datastore lds_last_verif_seq_no
datastore lds_dfl_rsp_code

datastore ds_detail

IF al_address_lookup_code = 0 THEN
	SetNull( al_address_lookup_code )
END IF

ls_identifying_number = Mid( as_reference, POS( as_reference, "-") + 2, 100 )

lds_dfl_rsp_code = CREATE datastore
lds_dfl_rsp_code.DataObject = "d_app_audit_get_hc_dflt_ver_resp_code"
lds_dfl_rsp_code.SetTransObject( SQLCA )

ds_detail = CREATE datastore
ds_detail.dataobject = 'd_ver_summary_record_view'
ds_detail.settransobject(SQLCA)

gnv_appeondb.of_startqueue()

li_rsp_rc = lds_dfl_rsp_code.Retrieve( al_prac_id, al_screen_id, ls_identifying_number )

lds_ver_orgs_facilities = CREATE datastore
lds_ver_orgs_facilities.DataObject = "d_verifying_orgs_facilities_p"
lds_ver_orgs_facilities.SetTransObject( SQLCA )
li_rc = lds_ver_orgs_facilities.Retrieve( ai_parent_facility_id, al_prac_id, al_screen_id ) //maha changed to ai_parent_facility_id from ii_facility_id 021004

gnv_appeondb.of_commitqueue()
li_rsp_rc = lds_dfl_rsp_code.rowcount()
li_rc = lds_ver_orgs_facilities.Rowcount()

IF li_rc = 0 THEN
	MessageBox("Error in of_add_npdb of pfc_cst_u_verification", "No affiliation status records found." )//+ "  facility =" + string(ii_facility_id) + "  prac =" + string(al_prac_id) + "  Screen =" + string(al_screen_id))
	//MessageBox("Error", "This practitioner is not in the verification process, therefore no verification records can be added." )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 08.23.2007 By: Evan
	//$<Reason> Need to destroy object.
	if IsValid(lds_ver_orgs_facilities) then Destroy lds_ver_orgs_facilities
	if IsValid(lds_last_verif_seq_no) then Destroy lds_last_verif_seq_no
	if IsValid(lds_dfl_rsp_code) then Destroy lds_dfl_rsp_code
	if IsValid(ds_detail) then Destroy ds_detail
	//---------------------------- APPEON END ----------------------------	
	Return -1
END IF

lds_last_verif_seq_no = CREATE datastore
lds_last_verif_seq_no.DataObject = "d_last_verif_seq_no"
lds_last_verif_seq_no.SetTransObject( SQLCA )

FOR i = 1 TO li_rc
	CHOOSE CASE as_screen_name
			CASE "NPDB Results"
				//npdb query
				ll_default_verif_method = 17				
			CASE "HIPDB Results"
				//hipdb query
				ll_default_verif_method = 14
			CASE "Work Gap"
				//hard copy
				ll_default_verif_method = 644
		END CHOOSE

	li_nr = ds_detail.InsertRow( 0 ) //maha changes made 112101
	//li_facility_id = lds_ver_orgs_facilities.GetItemNumber( i, "verifying_facility" )	
	ls_priority_user = lds_ver_orgs_facilities.GetItemString( i, "priority_user" )	
	li_priority = lds_ver_orgs_facilities.GetItemNumber( i, "priority" )	
	ds_detail.SetItem( li_nr, "prac_id", al_prac_id )
	//ds_detail.SetItem( li_nr, "direct_parent_facility_link", ai_parent_facility_id )	
	ds_detail.SetItem( li_nr, "rec_id", al_rec_id )
	//ds_detail.SetItem( li_nr, "facility_id", ai_parent_facility_id) //li_facility_id )
	ds_detail.SetItem( li_nr, "verif_info_facility_id", ai_parent_facility_id) //li_facility_id )
	ds_detail.SetItem( li_nr, "priority_user", ls_priority_user )
	ds_detail.SetItem( li_nr, "priority", li_priority )
	ds_detail.SetItem( li_nr, "number_sent", 0 )
	ds_detail.SetItem( li_nr, "exp_credential_flag", 0)
	ds_detail.SetItem( li_nr, "print_flag", 1)
	IF li_rsp_rc = 1 THEN
		ds_detail.SetItem( li_nr, "response_code", lds_dfl_rsp_code.GetItemNumber( 1, "default_ver_response" ))
		ds_detail.SetItem( li_nr, "user_name", ls_priority_user )
		ds_detail.SetItem( li_nr, "date_recieved", Today() )
		
		/*
		SELECT code_lookup.lookup_code  
      INTO :ll_hc_code  
      FROM code_lookup  
      WHERE code_lookup.code = 'Hard Copy'   ;
		*/
		ll_hc_code = long(gnv_data.of_getitem("code_lookup","lookup_code","upper(code)='" + upper('Hard Copy') + "'"))
		
  	   ds_detail.SetItem( li_nr, "verification_method", ll_hc_code )				
	ELSE
		ds_detail.SetItem( li_nr, "verification_method", ll_default_verif_method )		
	END IF

	//<add> 06/28/2007 by: Andy 
	//Reason:It will generate the same ll_seq_no,when li_rc more than 1.
	if i = 1 then
	//end of add
		//find out the last seq no used
		li_row_cnt = lds_last_verif_seq_no.Retrieve( al_rec_id, al_prac_id, ai_parent_facility_id )	//maha modified parent variable 031004
		IF li_row_cnt < 1 THEN
			ll_seq_no = 1 
		ELSE
			ll_seq_no = lds_last_verif_seq_no.GetItemNumber( 1, "last_seq_no" ) + 1
		END IF
		if isnull(ll_seq_no) then 	ll_seq_no = 1	//maha 091900
	//<add> 06/28/2007 by: Andy	
	else
		ll_seq_no ++
	end if
	//end of add		
	ds_detail.SetItem( li_nr, "seq_no", ll_seq_no )
	ds_detail.SetItem( li_nr, "screen_id", al_screen_id )
	ds_detail.SetItem( li_nr, "reference_value", as_reference )
	ds_detail.SetItem( li_nr, "expiration_date", adt_exp_date )
	ds_detail.SetItem( li_nr, "screen_name", as_screen_name )
	ds_detail.SetItem( li_nr, "address_lookup_code", al_address_lookup_code )
	ls_doc_id = String( al_rec_id ) + "-" + String( al_prac_id ) + "-" + String(ai_parent_facility_id ) +  "-" + String( ll_seq_no ) //maha modified parent variable 031004
	ds_detail.SetItem( li_nr, "doc_id", ls_doc_id )
END FOR

//ds_detail.SetFocus()
//ds_detail.ScrollToRow( li_nr )
//ds_detail.SetRow( li_nr )

DESTROY lds_ver_orgs_facilities
DESTROY lds_last_verif_seq_no
DESTROY lds_dfl_rsp_code

ds_detail.Update()

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(ds_detail) then Destroy ds_detail
//---------------------------- APPEON END ----------------------------

RETURN 1


end function

public function integer of_add_oig (long al_prac_id, long al_rec_id, integer ai_parent_facility);//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_u_verification_infoof_add_oig()
// $<arguments>
//		long   	al_prac_id        		
//		long   	al_rec_id         		
//		integer	ai_parent_facility		
// $<returns> integer
// $<description> This function is copied from pfc_cst_u_verification_info object. The tab control used
// $<description> the CreateOnDemand property in the parent window. So, The data can not be added if the verif
// $<description> tabpage has not been selected when setting data entry complete.
//////////////////////////////////////////////////////////////////////
// $<add> 02.20.2006 by Cao YongWang
//////////////////////////////////////////////////////////////////////
//created 032703 for oig vers
Integer li_nr
Integer li_row_cnt
Integer li_rc
Integer i
Integer ll_hc_code
Long ll_seq_no
integer res
Integer li_facility_id
Long ll_default_verif_method
String ls_identifying_number
String ls_doc_id
String ls_priority_user
Integer li_priority
datastore lds_ver_orgs_facilities
datastore lds_last_verif_seq_no
datastore lds_dfl_rsp_code
datastore ds_detail

//MessageBox("oig","of_add in veri iinfo")
//IF al_address_lookup_code = 0 THEN
//	SetNull( al_address_lookup_code )
//END IF

//ls_identifying_number = Mid( as_reference, POS( as_reference, "-") + 2, 100 )
//
//lds_dfl_rsp_code = CREATE n_ds
//lds_dfl_rsp_code.DataObject = "d_app_audit_get_hc_dflt_ver_resp_code"
//lds_dfl_rsp_code.of_SetTransObject( SQLCA )
//li_rsp_rc = lds_dfl_rsp_code.Retrieve( al_prac_id, al_screen_id, ls_identifying_number )

ds_detail = CREATE datastore
ds_detail.dataobject = 'd_ver_summary_record_view'
ds_detail.settransobject(SQLCA)

lds_ver_orgs_facilities = CREATE datastore
lds_ver_orgs_facilities.DataObject = "d_verifying_orgs_facilities_p"
lds_ver_orgs_facilities.SetTransObject( SQLCA )
li_rc = lds_ver_orgs_facilities.Retrieve( ii_parent_facility_id, al_prac_id, 1 )
IF li_rc = 0 THEN
	MessageBox("Error in of_add_npdb of pfc_cst_u_verification", "No affiliation status records found." )//+ "  facility =" + string(ii_facility_id) + "  prac =" + string(al_prac_id) + "  Screen =" + string(al_screen_id))
	//MessageBox("Error", "This practitioner is not in the verification process, therefore no verification records can be added." )
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 08.23.2007 By: Evan
	//$<Reason> Need to destroy object.
	if IsValid(lds_ver_orgs_facilities) then Destroy lds_ver_orgs_facilities
	if IsValid(lds_last_verif_seq_no) then Destroy lds_last_verif_seq_no
	if IsValid(lds_dfl_rsp_code) then Destroy lds_dfl_rsp_code
	if IsValid(ds_detail) then Destroy ds_detail
	//---------------------------- APPEON END ----------------------------	
	Return -1
END IF

lds_last_verif_seq_no = CREATE datastore
lds_last_verif_seq_no.DataObject = "d_last_verif_seq_no"
lds_last_verif_seq_no.SetTransObject( SQLCA )



//ll_default_verif_method = 20
//\/changed maha 062804
/*
select lookup_code into :ll_default_verif_method from code_lookup where code = 'OIG QUERY';
*/
ll_default_verif_method=long(gnv_data.of_getitem("code_lookup","lookup_code","upper(code)='OIG QUERY'"))

if ll_default_verif_method < 1 or isnull(ll_default_verif_method) then
	MessageBox("Error in of_add_oig of pfc_cst_u_verification", "There is no lookup with the code of 'OIG QUERY' in the Verification Method lookup table.  Unable to create OIG verification" )
	return 1
end if
//\maha

li_nr = ds_detail.InsertRow( 0 ) 

ls_priority_user = lds_ver_orgs_facilities.GetItemString( li_rc, "priority_user" )	
li_priority = lds_ver_orgs_facilities.GetItemNumber( li_rc, "priority" )	
ds_detail.SetItem( li_nr, "prac_id", al_prac_id )
ds_detail.SetItem( li_nr, "rec_id", al_rec_id )
ds_detail.SetItem( li_nr, "verif_info_facility_id", ai_parent_facility) //li_facility_id )
ds_detail.SetItem( li_nr, "verification_method", ll_default_verif_method )
ds_detail.SetItem( li_nr, "priority_user", ls_priority_user )
ds_detail.SetItem( li_nr, "priority", li_priority )
ds_detail.SetItem( li_nr, "number_sent", 0 )
ds_detail.SetItem( li_nr, "exp_credential_flag", 0)
ds_detail.SetItem( li_nr, "print_flag", 1)
ds_detail.SetItem( li_nr, "seq_no",1 )
ds_detail.SetItem( li_nr, "screen_id", 1 )
ds_detail.SetItem( li_nr, "reference_value", "OIG QUERY" )
//ds_detail.SetItem( li_nr, "expiration_date", adt_exp_date )
ds_detail.SetItem( li_nr, "screen_name", "Basic Information" )
//ds_detail.SetItem( li_nr, "address_lookup_code", al_address_lookup_code )
ls_doc_id = String( al_rec_id ) + "-" + String( al_prac_id ) + "-" + String( ai_parent_facility ) +  "-" + "1"
ds_detail.SetItem( li_nr, "doc_id", ls_doc_id )


//dw_detail.SetFocus()
//dw_detail.ScrollToRow( li_nr )
//dw_detail.SetRow( li_nr )

DESTROY lds_ver_orgs_facilities
DESTROY lds_last_verif_seq_no
DESTROY lds_dfl_rsp_code

res = ds_detail.Update()

//--------------------------- APPEON BEGIN ---------------------------
//$<Add> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
if IsValid(ds_detail) then Destroy ds_detail
//---------------------------- APPEON END ----------------------------

if res < 1 then
	messagebox("OIG Verification Creation","Update failed.  Record not enetered")
end if


RETURN 1

end function

public function integer of_error_message (string as_field, integer ai_row, string as_title, string as_mess);//Start Code Change ---- 03.24.2006 #340 maha

integer res
string ls_plus

ls_plus = "~r~rData will not be saved for row " + string(ai_row) + "."

res = messagebox(as_title,as_mess + ls_plus,question!,ok!)
//if res = 1 then 
dw_detail.setitemstatus( ai_row, 0, primary!,notmodified!)
				
return 1

//End Code Change---03.24.2006
end function

public function integer of_detail_scrollbar (integer ai_screen_id);//Start Code Change ---- 06.15.2006 #544 maha -- created to slimpify mods
//maha added 06.15.06; called from dw_selection.rfc and pfc_after_select as well as tab_view.selection changed
//Start Code Change ----12.13.2007 #V8 maha -- added detail 2 modifications
choose case ai_screen_id
	case 10,2,19   //address, hospital, specialty
		dw_browse.vscrollbar = True
		dw_detail.vscrollbar = True
		//dw_detail.height = 1140
		//dw_browse.height = 1140
		dw_link_list.visible = True
		dw_link_list.bringtotop = True
		//if tab_view.selectedtab = 3 then
			dw_link_list.visible = True
		//end if
		//tab_view.tabpage_image.dw_detail_2.height = 1140
		//Add By Jervis 04.02.2008
		tab_view.tabpage_image.dw_detail_2.height = r_1.height - dw_link_list.height - 15
		dw_detail.height = tab_view.tabpage_image.dw_detail_2.height
		dw_browse.height = tab_view.tabpage_image.dw_detail_2.height
		//End By Jervis 04.02.2008
	case 16,65 //claims, attest quest
		dw_detail.vscrollbar = True
		//Start Change By Jervis 04.02.2008
		//dw_detail.height = 1484	
		//tab_view.tabpage_image.dw_detail_2.height = 1484
		dw_detail.height = r_1.height
		tab_view.tabpage_image.dw_detail_2.height = r_1.height
		//End Change By Jervis 04.02.2008
	case ELSE
		dw_detail.vscrollbar = False
		//Start Change By Jervis 04.02.2008
		//dw_detail.height = 1484
		//dw_browse.height = 1484
		//tab_view.tabpage_image.dw_detail_2.height = 1484
		dw_detail.height = r_1.height
		dw_browse.height = r_1.height
		tab_view.tabpage_image.dw_detail_2.height = r_1.height
		//End Change By Jervis 04.02.2008
END choose
//End Code Change---12.13.2007
IF ii_screen_id > 100 THEN //custom screen
	dw_detail.vscrollbar = True
END IF

return 1
end function

public function integer of_validate_image ();//////////////////////////////////////////////////////////////////////
// $<function>pfc_cst_u_data_entryof_validate_image()
// $<arguments>
//		value	integer		
// $<returns> integer
// $<description>Queue Images for Scanning from Data Entry.
// $<description>
//////////////////////////////////////////////////////////////////////
// $<add> 10.12.2006 by Jack (Inova)
//////////////////////////////////////////////////////////////////////
if isvalid(ids_image_data) then
	ids_image_data.reset()
	
	if ids_image_data.retrieve(il_prac_id) > 0 then
		return -1
	else
		return 1
	end if
end if
return 1


end function

public subroutine of_refresh_page_menu ();//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06/10/2008 By: Ken.Guo
//$<reason> synchronization menu
if isvalid(m_pfe_cst_data_entry) then 
	if dw_detail.rowcount() > 1 then 
	 gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_priorpage,'enabled', true)
	 gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_nextpage,'enabled', true)
	else 
	 gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_priorpage,'enabled', false)
	 gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_nextpage,'enabled', false)
	end if 
end if
//---------------------------- APPEON END ----------------------------

end subroutine

public function long of_download_photo (long al_pracid, string as_downdir);//------------------------------------------------------------------------------
// Function: of_Download_Photo()
//------------------------------------------------------------------------------
// Description: Download Photo from database
// Arguments:
//		1 -- Prac_id
//		2 -- Down Directory
// Return Value: 
//	  -1 -- Failed
//		1 -- Sucess
//------------------------------------------------------------------------------
// Author:	Scofield		Date: 2008-07-10
//------------------------------------------------------------------------------
// Revision History: 
//				1.0   Initial version
//==============================================================================

String	ls_PicName,ls_Postfix
long		ll_FileNo,ll_Cycle,ll_DataLen,ll_Count,ll_Start,ll_FileLen
Blob		lblb_Buffer
String	ls_Rtn

long 		READ_ONE_COUNT = 8000

SELECT image_type INTO :ls_Postfix from pd_photo WHERE pd_photo.prac_id = :al_PracID ;
if IsNull(ls_Postfix) or Trim(ls_Postfix) = "" then Return -1

ls_Rtn = f_ExaWriteRight(as_DownDir)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if

ls_PicName = as_DownDir + String(al_PracID) + "." + ls_Postfix
if FileExists(ls_PicName) then ll_FileLen = FileLength(ls_PicName)

SELECT Datalength(pd_photo.image_data)
  INTO :ll_DataLen
  FROM pd_photo
 WHERE pd_photo.prac_id = :al_PracID ;

if IsNull(ll_DataLen) or ll_DataLen <= 0 then Return -1
if ll_DataLen = ll_FileLen then Return 1

ll_FileNo = FileOpen(ls_PicName,StreamMode!,Write!,LockReadWrite!,Replace!)
if ll_FileNo <= 0 then Return -1

ll_Count = Ceiling(ll_DataLen/READ_ONE_COUNT)

if AppeonGetClientType() = 'PB' and gs_dbtype = 'SQL' and ll_DataLen > READ_ONE_COUNT then
	for ll_Cycle = 1 To ll_Count
		ll_Start = (ll_Cycle - 1) * READ_ONE_COUNT + 1
		SELECTBLOB SubString(image_data,:ll_Start,:READ_ONE_COUNT)
		      INTO :lblb_Buffer
		      FROM pd_photo
		     WHERE pd_photo.prac_id = :al_PracID ;
		
		FileWrite(ll_FileNo,lblb_Buffer)
	next
else
	SELECTBLOB image_data
	      INTO :lblb_Buffer
	      FROM pd_photo
 		  WHERE pd_photo.prac_id = :al_PracID ;
			
	for ll_Cycle = 1 To ll_Count
		FileWrite(ll_FileNo,BlobMid(lblb_Buffer,(ll_Cycle - 1) * READ_ONE_COUNT + 1,READ_ONE_COUNT))
	next
end if

FileClose(ll_FileNo)

Return 1

end function

on pfc_cst_u_data_entry.create
this.dw_addresses=create dw_addresses
this.st_recs=create st_recs
this.dw_select_section=create dw_select_section
this.dw_ver_data=create dw_ver_data
this.dw_link_list=create dw_link_list
this.dw_browse=create dw_browse
this.tab_view=create tab_view
this.r_1=create r_1
this.dw_detail=create dw_detail
this.Control[]={this.dw_addresses,&
this.st_recs,&
this.dw_select_section,&
this.dw_ver_data,&
this.dw_link_list,&
this.dw_browse,&
this.tab_view,&
this.r_1,&
this.dw_detail}
end on

on pfc_cst_u_data_entry.destroy
destroy(this.dw_addresses)
destroy(this.st_recs)
destroy(this.dw_select_section)
destroy(this.dw_ver_data)
destroy(this.dw_link_list)
destroy(this.dw_browse)
destroy(this.tab_view)
destroy(this.r_1)
destroy(this.dw_detail)
end on

event constructor;
if parent.classname() = "w_prac_report_design" then ib_report = True

inv_data_entry = CREATE pfc_cst_nv_data_entry_functions
inv_data_entry.ib_report = ib_report
inv_data_entry.of_setup_cache()

inv_data_entry.of_refresh_cache()

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
ids_image_data = create datastore
ids_image_data.dataobject = 'd_image_scan_detail_inova'
ids_image_data.settransobject(sqlca)
//---------------------------- APPEON END ----------------------------



end event

event destructor;//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 08.23.2007 By: Evan
//$<Reason> Need to destroy object.
//DESTROY pfc_cst_nv_data_entry_functions
if IsValid(inv_data_entry) then Destroy inv_data_entry
if IsValid(ids_image_data) then Destroy ids_image_data
//---------------------------- APPEON END ----------------------------
end event

type dw_addresses from u_dw within pfc_cst_u_data_entry
boolean visible = false
integer x = 1742
integer y = 1424
integer width = 279
integer height = 100
integer taborder = 70
string dataobject = "d_group_data_entry"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event buttonclicked;call super::buttonclicked;//--------------------------- APPEON BEGIN ---------------------------
//$<  Add > 2008-08-01 By: Scofield
//$<Reason> Popup a dialog to input the phone

String	ls_Phone,ls_fax,ls_RetParm

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	if dwo.name = 'b_phone' then
		ls_Phone = This.GetItemString(row,'phone')
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'phone',ls_RetParm)
		end if
		This.SetColumn('phone')
	elseif dwo.name = 'b_fax' then
		ls_fax = This.GetItemString(row,'fax')
		if IsNull(ls_fax) then ls_fax = ""
		OpenWithParm(w_phonedetail,"Fax:" + ls_fax)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,'fax',ls_RetParm)
		end if
		This.SetColumn('fax')
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

type st_recs from statictext within pfc_cst_u_data_entry
integer x = 3154
integer y = 1636
integer width = 357
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Record 1 of 1"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_select_section from u_dw within pfc_cst_u_data_entry
event pfc_after_select ( )
event ue_goto_status ( )
event pfc_cst_after_error ( )
integer x = 14
integer y = 16
integer width = 736
integer height = 1680
integer taborder = 10
boolean titlebar = true
string title = "Select Data Screen"
string dataobject = "d_data_view_screens_list"
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event pfc_after_select();String	ls_PicPath,ls_PicName,ls_Postfix

IF dw_browse.RowCount() > 1 THEN
	dw_browse.SelectRow( 1, True )
	dw_browse.ScrollToRow( 1 )
	dw_browse.SetRow( 1 )
	tab_view.tabpage_details.Enabled = True
	tab_view.tabpage_browse.Enabled = True
	dw_browse.SetFocus()	
ELSE
	dw_browse.Visible = False
	dw_detail.Visible = True
	dw_detail.SetFocus( )
	dw_detail.ScrollToRow( 1 )
	dw_detail.SetRow( 1 )
	dw_detail.PostEvent("pfc_after_select")	
END IF

// maha 080200
//if is_screen_name = "Address" then
if ii_screen_id = 2 then
	il_addr_id = dw_browse.getitemnumber(1,"rec_id")
	dw_link_list.dataobject = "d_addr_link_check_boxes"//
	dw_link_list.settransobject(sqlca)	//
	dw_link_list.retrieve(il_addr_id)
end if
//\ maha

//\/ maha 011501
//if is_screen_name = "Hospital Affiliation" then
if ii_screen_id = 10 then
	il_hosp_id = dw_browse.getitemnumber(1,"rec_id")
	dw_link_list.dataobject = "d_hosp_facil_link_de"//
	dw_link_list.settransobject(sqlca)//
	dw_link_list.retrieve(il_hosp_id)//
end if
//\ maha

//\/ maha 082001
//if is_screen_name = "Board/Specialty" then
if ii_screen_id = 19 then
	il_hosp_id = dw_browse.getitemnumber(1,"rec_id")
	dw_link_list.dataobject = "d_spec_facil_link_de"//
	dw_link_list.settransobject(sqlca)//
	dw_link_list.retrieve(il_hosp_id)//
end if
//\ maha
//\/maha 072301 prac picture
//if is_screen_name = "Basic Information" then
if ii_screen_id = 1 then
	//--------------------------- APPEON BEGIN ---------------------------
	//$<Modify> 2008-07-10 By: Scofield
	//$<Reason> Display Picture if the file is exist.
	
	//	string path
	//	
	//	path = gnv_data.of_getitem("ids" , "picture_path" , False)
	//
	//	path =  path + "\" + string(gl_prac_id) + ".bmp"
	//
	//	if FileExists(path) then 
	//		parent_window.tab_1.tabpage_detail.p_face.visible = true
	//		parent_window.tab_1.tabpage_detail.p_face.bringtotop = true
	//		parent_window.tab_1.tabpage_detail.p_face.picturename = path
	//	else 
	//		parent_window.tab_1.tabpage_detail.p_face.visible = false
	//	end if
	
	if IsValid(m_pfe_cst_data_entry) then m_pfe_cst_data_entry.m_file.m_importphoto.Enabled = true
	
	SELECT image_type INTO :ls_Postfix from pd_photo WHERE pd_photo.prac_id = :gl_prac_id ;
	
	if IsNull(ls_Postfix) or Trim(ls_Postfix) = "" then
		Parent_Window.tab_1.tabpage_detail.p_face.Visible = false
	else
		ls_PicPath = TRIM(gnv_data.of_getitem("ids","picture_path",false))
		if Right(ls_PicPath,1) <> "\" then ls_PicPath += "\"
		
		ls_PicName = ls_PicPath + String(gl_prac_id) + "." + ls_Postfix
		
		of_Download_Photo(gl_prac_id,ls_PicPath)
		
		if FileExists(ls_PicName) then
			Parent_Window.tab_1.tabpage_detail.p_face.Visible = true
			Parent_Window.tab_1.tabpage_detail.p_face.BringToTop = true
			Parent_Window.tab_1.tabpage_detail.p_face.PictureName = ""
			Parent_Window.tab_1.tabpage_detail.p_face.PictureName = ls_PicPath + String(gl_prac_id) + "." + ls_Postfix
		else
			Parent_Window.tab_1.tabpage_detail.p_face.Visible = false
		end if
	end if
//---------------------------- APPEON END ----------------------------
	
	
//Start Code Change ----04.23.2008 #V8 maha	- modification to set ssn /npi from search
	if mid(gs_ssnnpi,1,1 ) = "S" then
		if dw_detail.Describe("ssn.ColType") <> "!" then
			dw_detail.setitem(1,"ssn", mid(gs_ssnnpi,3))
		end if
		gs_ssnnpi = ""
	elseif mid(gs_ssnnpi,1,1 ) = "N" then
		if dw_detail.Describe("npi_number.ColType") <> "!" then
			dw_detail.setitem(1,"npi_number", mid(gs_ssnnpi,3))
		end if
		gs_ssnnpi = ""
	end if
//End Code Change---04.23.2008
else
	if IsValid(m_pfe_cst_data_entry) then m_pfe_cst_data_entry.m_file.m_importphoto.Enabled = false		//Added by Scofield on 2008-09-23
	parent_window.tab_1.tabpage_detail.p_face.visible = false
end if
//End Code Change---04.23.2008

//Start Code Change ---- 06.15.2006 #545 maha removed existing code
of_detail_scrollbar(ii_screen_id)
//End Code Change---06.15.2006

//if this is a custom screen then put a scroll bar on it
IF ii_screen_id > 100 THEN
	dw_detail.vscrollbar = True
END IF

SetRedraw(True)


end event

event ue_goto_status;				Parent_window.tab_1.SelectTab( 3 )
				Parent_window.tab_1.tabpage_apptmnt_status.uo_affill_status.of_new_record( il_prac_id )
				Parent_window.tab_1.tabpage_apptmnt_status.uo_affill_status.of_set_new_prac( True )

end event

event pfc_cst_after_error;dw_detail.SetFocus()
end event

event constructor;This.of_Setupdateable(False)

end event

event rowfocuschanged;call super::rowfocuschanged;
IF currentrow = 0 THEN
	Return
END IF

if ib_report = true then return

Long ll_height
Long ll_data_view_id
Long ll_detail_2_screen_id
String ls_screen_name
Integer li_retval
Integer li_last_fld_y

ii_address_lnk_cnt=0

IF ib_refresh_screen_list = True THEN
	This.SelectRow( 0, False )
	This.SelectRow( il_last_row, True )
	This.SetRow( il_last_row )
	Return -1
END IF
//	
//IF ib_screen_painter THEN
//	IF Parent_window_design.Event pfc_Save() < 0 THEN
//		This.SelectRow( 0, False )
//		This.SelectRow( il_last_row, True )
//		This.SetRow( il_last_row )
//		Return -1
//	END IF
//ELSE//	li_retval = Parent_window.Event pfc_Save()
//	IF li_retval < 0 THEN
//		This.SelectRow( 0, False )
//		This.SelectRow( il_last_row, True )
//		This.SetRow( il_last_row )
//		Return -1
//	END IF	
//END IF
//
IF ib_refresh_screen_list = True THEN
	Return
END IF

ls_screen_name = This.GetItemString( currentrow, "screen_name" )
//messagebox('',ls_screen_name)


//SetRedraw(False)
//Start Code Change ---08.19.2008 #V85 maha - moved the detail 2 screen creation before the detail screen so that setting defaults will work
ll_data_view_id = This.GetItemNumber( currentrow, "data_view_id" )
ii_screen_id = This.GetItemNumber( currentrow, "screen_id" )
IF This.GetItemNumber( currentrow, "table_id_2" ) > 0 THEN
	ll_detail_2_screen_id = This.GetItemNumber( currentrow, "table_id_2" ) 
	is_sql_syntax = inv_data_entry.of_create_dynamic_dw( il_prac_id, ll_data_view_id, ll_detail_2_screen_id, tab_view.tabpage_image.dw_detail_2, tab_view.tabpage_image.dw_detail_2, ib_screen_painter, ii_parent_facility_id )	
	is_first_column_detail_2 = inv_data_entry.of_get_first_column()	
	tab_view.tabpage_image.Visible = True
else
	tab_view.tabpage_image.Visible = False
END IF

is_sql_syntax = inv_data_entry.of_create_dynamic_dw( il_prac_id, ll_data_view_id, ii_screen_id, dw_detail, dw_browse, ib_screen_painter, ii_parent_facility_id )
is_first_column_detail_1 = inv_data_entry.of_get_first_column()


//ll_data_view_id = This.GetItemNumber( currentrow, "data_view_id" )
//ii_screen_id = This.GetItemNumber( currentrow, "screen_id" )
//is_sql_syntax = inv_data_entry.of_create_dynamic_dw( il_prac_id, ll_data_view_id, ii_screen_id, dw_detail, dw_browse, ib_screen_painter, ii_parent_facility_id )
//is_first_column_detail_1 = inv_data_entry.of_get_first_column()
//tab_view.tabpage_image.Visible = False
//IF This.GetItemNumber( currentrow, "table_id_2" ) > 0 THEN
//	ll_detail_2_screen_id = This.GetItemNumber( currentrow, "table_id_2" ) 
//	is_sql_syntax = inv_data_entry.of_create_dynamic_dw( il_prac_id, ll_data_view_id, ll_detail_2_screen_id, tab_view.tabpage_image.dw_detail_2, tab_view.tabpage_image.dw_detail_2, ib_screen_painter, ii_parent_facility_id )	
//	is_first_column_detail_2 = inv_data_entry.of_get_first_column()	
//	tab_view.tabpage_image.Visible = True
//END IF
//End Code Change---08.19.2008

This.SelectRow(0, False)
This.SelectRow( currentrow, True)

IF This.GetItemString( currentrow, "multi_record" ) = "Y" THEN
	tab_view.tabpage_browse.Enabled = True
ELSE
	tab_view.tabpage_browse.Enabled = False
END IF

ll_height = Long( dw_detail.Describe("DataWindow.Detail.Height") )


//Start Code Change ---- 06.15.2006 #546 maha
of_detail_scrollbar(ii_screen_id)
//End Code Change---06.15.2006



IF This.GetItemString( currentrow, "multi_record" ) = "Y" AND NOT ib_screen_painter AND dw_browse.RowCount() > 1 THEN
	tab_view.SelectTab( 1 )	
	dw_detail.Visible = False		
	dw_browse.Visible = True	
	dw_browse.SetFocus()	
ELSE
	tab_view.SelectTab( 2 )
	dw_detail.SetFocus()
	dw_detail.BringToTop = True	

	dw_detail.PostEvent("pfc_after_select")	
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-18
//$<comment> 02.08.2006 By: Cao YongWang
//$<reason> Performance tuning.
//$<reason> Comment out the following script, since li_last_fld_y is not used.
/*
SELECT Max( field_y )  
INTO :li_last_fld_y  
FROM data_view_fields  
WHERE data_view_fields.screen_id = :ii_screen_id AND
		data_view_fields.visible = 'Y';
*/
//---------------------------- APPEON END ----------------------------

//li_last_fld_y = li_last_fld_y + 110 //removed maha 051305 set in create dynamic dw (end)
//
//IF li_last_fld_y * 2 < dw_detail.Height THEN
//	dw_detail.Object.DataWindow.Detail.Height= String( li_last_fld_y )
//	dw_detail.vscrollbar = True
//END IF


dw_link_list.visible = false

of_add_delete_enable()

dw_browse.SelectRow( 0, False)



This.PostEvent("pfc_after_select")

il_last_row = currentrow
end event

event pfc_deleterow;Return 1
end event

event pfc_addrow;Return 1
end event

event pfc_firstpage;RETURN 0
end event

event pfc_lastpage;RETURN 0
end event

event pfc_nextpage;RETURN 0
end event

event pfc_previouspage;RETURN 0
end event

event rowfocuschanging;call super::rowfocuschanging;Integer li_retval
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-19
//$<add> 03.03.2006 By: Cao YongWang
//$<reason> Performance tuning. 
//$<modification> Write script to make sure that when pfc_cst_u_data_entry
//$<modification> is just opened, RowFocusChanging is not executed immediately.
If ib_just_open Then
	ib_just_open = False
	return
End If
If currentrow < 1 Then return
//---------------------------- APPEON END ----------------------------

IF ib_screen_painter THEN
	IF is_designer_type = "S" THEN
		IF ib_report = False then
			IF Parent_window_design.Event pfc_Save() < 0 THEN
				This.PostEvent( "pfc_cst_after_error" )
				Return 1
			END IF
		ELSE
			IF Parent_window_design_report.Event pfc_Save() < 0 THEN
				This.PostEvent( "pfc_cst_after_error" )
				Return 1
			END IF
		END IF
	ELSE
		IF Parent_window_profile_design.Event pfc_Save() < 0 THEN
			This.PostEvent( "pfc_cst_after_error" )
			Return 1
		END IF		
	END IF
ELSE
	li_retval = Parent_window.Event pfc_Save()

	IF li_retval < 0 THEN
		This.PostEvent( "pfc_cst_after_error" )
		Return 1
	END IF	
END IF

end event

event clicked;call super::clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.03.2006 By: LeiWei
//$<reason> Fix a defect.

IF row > 0 THEN
	This.Setrow( row )
END IF

//---------------------------- APPEON END ----------------------------

Integer li_row

li_row = This.GetClickedRow()

IF li_row = 0 THEN
	dw_detail.SetFocus()
END IF
end event

event retrieveend;call super::retrieveend;//used to change the icon for screens where the practitioner has data. 
if  not ib_screen_painter then
	of_screen_color()
end if
end event

type dw_ver_data from u_dw within pfc_cst_u_data_entry
boolean visible = false
integer x = 837
integer y = 1228
integer width = 2601
integer height = 36
integer taborder = 60
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-20
//$<comment> 02.08.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Comment the following script since dw_ver_data is not used at all.
/*

This.of_SetUpdateAble(False)

DataWindowChild dwchild

This.GetChild("response_code", dwchild)

dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("Credentials Verification Response")


This.GetChild("verification_method", dwchild)

dwchild.SetTransObject( SQLCA )
dwchild.Retrieve("verification method")
*/
//---------------------------- APPEON END ----------------------------


end event

event itemchanged;call super::itemchanged;IF This.GetColumnName() = "response_code" THEN
	IF IsNull(This.GetItemString( row, "user_name" ) ) THEN
		This.SetItem( row, "user_name", gnv_app.of_getuserid() )
		This.SetItem( row, "source", "P" )
		This.SetItem( row, "date_recieved", Today() )
	END IF
END IF
end event

type dw_link_list from u_dw within pfc_cst_u_data_entry
integer x = 827
integer y = 1172
integer width = 2642
integer height = 400
integer taborder = 50
end type

event pfc_preupdate;call super::pfc_preupdate;//jad 8/21/01
Integer li_rc
Integer i

li_rc = This.RowCount()

//if is_screen_name = "Address"  then //maha 082301
if ii_screen_id = 2 then

	FOR i = 1 TO li_rc
		IF This.GetItemStatus( i, 0, Primary!)  = DataModified! THEN
			IF of_address_link_check() = -1 THEN
				//debugbreak()
				Return Failure
			END IF
		END IF
	END FOR
end if

Return Success
end event

event constructor;call super::constructor;This.of_SetTransObject( sqlca )
end event

event pfc_addrow;Return 1
end event

event itemchanged;call super::itemchanged;dw_detail.SetFocus()

IF This.GetColumnName() = "primary_office" AND data = "1" THEN
	This.SetItem( row, "additional_office", 0 )
ELSEIF This.GetColumnName() = "additional_office" AND data = "1" THEN
	This.SetItem( row, "primary_office", 0 )
END IF
end event

event buttonclicked;call super::buttonclicked;String ls_field
Integer li_rc
Integer i
String ls_type



CHOOSE CASE dwo.Name
	CASE "p"
		ls_field = "primary_office"
		ls_type = "1"
	CASE "a"		
		ls_field = "additional_office"		
		ls_type = "1"		
	CASE "b"
		ls_field = "billing"				
		ls_type = "1"		
	CASE "h"
		ls_field = "home_address"				
		ls_type = "1"		
	CASE "m"
		ls_field = "mailing"				
		ls_type = "1"		
	CASE "e"
		ls_field = "exp_letters"		
		ls_type = "1"		
	CASE "d"
		ls_field = "include_in_directory"				
		ls_type = "1"		
	CASE "hospital"
		ls_field = "pd_hosp_facility_link_primary_hosp"
		ls_type = "2"		
	CASE "specialty"
		ls_field = "pd_spec_facility_link_practicing"
		ls_type = "2"		
END CHOOSE


li_rc = This.RowCount()
FOR i = 1 TO li_rc
	IF ls_type = "1" THEN	
		IF This.GetItemNumber( 1, ls_field ) = 1 THEN
			This.SetItem( i, ls_field, 1 )
		ELSE
			This.SetItem( i, ls_field, 0 )			
		END IF
	ELSE
		IF This.GetItemNumber( 1, ls_field ) = 581 THEN
			This.SetItem( i, ls_field, 581 )
		ELSE
			This.SetItem( i, ls_field, 582 )			
		END IF
	END IF
END FOR

end event

type dw_browse from u_dw within pfc_cst_u_data_entry
event pfc_after_select ( )
integer x = 837
integer y = 52
integer width = 2638
integer height = 1520
integer taborder = 40
boolean hscrollbar = true
borderstyle borderstyle = stylebox!
end type

event constructor;This.of_SetUpdateable(False)



end event

event doubleclicked;IF dw_detail.RowCount() > 0 THEN
	dw_detail.Visible = True
	dw_browse.Visible = False
	tab_view.SelectTab( 2 )
	dw_detail.PostEvent( "pfc_after_select" )
END IF



end event

event rowfocuschanged;call super::rowfocuschanged;This.SelectRow( 0, False )
This.SelectRow( This.GetRow(), True )

st_recs.Text = "Record " + String(This.GetRow()) + " of " + String(This.RowCount())

IF dw_detail.GetRow() <> currentrow THEN
	dw_detail.ScrollToRow( currentrow )
	dw_detail.SetRow( currentrow )
END IF

IF currentrow > 0 THEN
	of_get_record_verif( currentrow )
END IF

IF currentrow > 0 THEN //maha 092701
	il_addr_id = dw_browse.getitemnumber(currentrow,"rec_id")
end if
//\/maha 080200
//if is_screen_name = "Address" then

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-29
//$<modify> 2006-04-10 By: owen chen
//$<reason> Performance tuning modification
//$<modification> Add one more condition to reduces client-server interactions. 
/*
if ii_screen_id = 2 then
	dw_link_list.retrieve(il_addr_id)
end if
*/
if (ii_screen_id = 2) and (ib_addaddress = false) then
	dw_link_list.retrieve(il_addr_id)
end if
//---------------------------- APPEON END ----------------------------


//\maha
//\/maha 011601
//if is_screen_name = "Hospital Affiliation" then
if ii_screen_id = 10 then
	dw_link_list.retrieve(il_addr_id)
end if
//\maha
//\/maha 082001
//if is_screen_name = "Board/Specialty" then
if ii_screen_id = 19 then
	dw_link_list.retrieve(il_addr_id)
end if
//\maha
end event

event pfc_addrow;dw_detail.ScrolltoRow(dw_detail.RowCount())
dw_detail.SetRow(dw_detail.RowCount())
dw_browse.Visible = False
dw_detail.Visible = True
tab_view.SelectTab( 2 )
dw_detail.Event pfc_addrow()
dw_detail.BringToTop = True

//IF is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" or is_screen_name = "Board/Specialty" then //\/maha 082101 
IF ii_screen_id = 10 or ii_screen_id = 2 or ii_screen_id = 19 THEN
//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" then
	dw_link_list.bringtotop = True
end if

Return 0
end event

event pfc_deleterow;Return of_delete_record( This )
end event

event pfc_nextpage;return this.ScrollNextRow() //Added By Ken.Guo 06.06.2008
end event

event pfc_previouspage;return this.ScrollPriorRow() //Added By Ken.Guo 06.06.2008
end event

type tab_view from tab within pfc_cst_u_data_entry
event pfc_cst_after_select ( )
integer x = 805
integer y = 4
integer width = 2715
integer height = 1688
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean raggedright = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 2
tabpage_browse tabpage_browse
tabpage_details tabpage_details
tabpage_image tabpage_image
end type

event pfc_cst_after_select;of_btt_address_link_button()

end event

event selectionchanging;IF newindex = 3 THEN
	IF dw_detail.GetItemStatus( dw_detail.GetRow(), 0, Primary!) = NewModified! OR +&
		dw_detail.GetItemStatus( dw_detail.GetRow(), 0, Primary!) = DataModified! THEN
		IF is_designer_type = "S" THEN
			IF parent_window.Event pfc_Save() < 0 THEN
				Return 1
			END IF
		ELSE
			IF parent_window_profile_design.Event pfc_Save() < 0 THEN
				Return 1
			END IF			
		END IF
	END IF
END IF

IF dw_detail.AcceptText() = -1 THEN
	Return 1
END IF
end event

event selectionchanged;Integer li_nr

IF newindex = 1 THEN
	dw_detail.Visible = False
	dw_browse.Visible = True
	is_view_type = "B"
ELSEIF newindex = 2 THEN
	dw_browse.Visible = False
	dw_detail.Visible = True
	dw_detail.setfocus() //maha 102300
	is_view_type = "D"	
	This.PostEvent( "pfc_cst_after_select" )
	//dw_link_list.visible = false//maha 080200
ELSEIF newindex = 3 THEN
	dw_detail.Visible = False
	dw_browse.Visible = False
	dw_link_list.visible = False
	
	il_rec_id = dw_detail.GetItemNumber( dw_detail.GetRow(), "rec_id" )
	IF NOT IsNull( il_rec_id ) THEN
		tab_view.tabpage_image.dw_detail_2.SetFilter( "rec_id = " + String( il_rec_id ) )
		tab_view.tabpage_image.dw_detail_2.Filter( )	
	ELSE
		li_nr = tab_view.tabpage_image.dw_detail_2.InsertRow( 0 )
		tab_view.tabpage_image.dw_detail_2.SetRow( li_nr )
		tab_view.tabpage_image.dw_detail_2.ScrollToRow( li_nr )
	END IF
	IF tab_view.tabpage_image.dw_detail_2.RowCount( ) = 0 THEN
		tab_view.tabpage_image.dw_detail_2.InsertRow( 0 )
		tab_view.tabpage_image.dw_detail_2.SetItem( 1, "rec_id", il_rec_id )
		tab_view.tabpage_image.dw_detail_2.SetItem( 1, "prac_id", il_prac_id )
	END IF
	is_view_type = "D"	
	
END IF

//Start Code Change ---- 06.15.2006 #547 maha removed existing code
of_detail_scrollbar(ii_screen_id)
//End Code Change---06.15.2006
	

end event

on tab_view.create
this.tabpage_browse=create tabpage_browse
this.tabpage_details=create tabpage_details
this.tabpage_image=create tabpage_image
this.Control[]={this.tabpage_browse,&
this.tabpage_details,&
this.tabpage_image}
end on

on tab_view.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_details)
destroy(this.tabpage_image)
end on

type tabpage_browse from userobject within tab_view
integer x = 18
integer y = 16
integer width = 2679
integer height = 1560
long backcolor = 79741120
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Justify!"
long picturemaskcolor = 553648127
end type

type tabpage_details from userobject within tab_view
integer x = 18
integer y = 16
integer width = 2679
integer height = 1560
long backcolor = 79741120
string text = "Detail"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DataWindow5!"
long picturemaskcolor = 553648127
end type

type tabpage_image from userobject within tab_view
integer x = 18
integer y = 16
integer width = 2679
integer height = 1560
long backcolor = 79741120
string text = "Detail 2"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "DataWindow2!"
long picturemaskcolor = 553648127
dw_detail_2 dw_detail_2
end type

on tabpage_image.create
this.dw_detail_2=create dw_detail_2
this.Control[]={this.dw_detail_2}
end on

on tabpage_image.destroy
destroy(this.dw_detail_2)
end on

type dw_detail_2 from u_dw within tabpage_image
integer x = 18
integer y = 20
integer width = 2624
integer height = 1492
integer taborder = 30
end type

event constructor;call super::constructor;This.of_SetRowManager( TRUE )
This.of_SetReqColumn(TRUE)



end event

event pfc_preupdate;call super::pfc_preupdate;IF This.RowCount() > 0 THEN
	IF IsNull( This.GetItemNumber( 1, "rec_id" ) ) THEN
		This.SetItem( 1, "rec_id", il_rec_id )
		This.SetItem( 1, "prac_id", il_prac_id )	
	END IF
END IF

Return Success
end event

type r_1 from rectangle within pfc_cst_u_data_entry
integer linethickness = 4
long fillcolor = 12639424
integer x = 827
integer y = 48
integer width = 2629
integer height = 1484
end type

type dw_detail from u_dw within pfc_cst_u_data_entry
event ue_showlist pbm_custom01
event pfc_cst_preupdate pbm_custom02
event pfc_after_select ( )
event type integer ue_after_itemchanged ( string as_type )
boolean visible = false
integer x = 827
integer y = 48
integer width = 2629
integer height = 1484
integer taborder = 30
boolean bringtotop = true
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event pfc_after_select;This.SetFocus()
This.SetColumn( is_first_column_detail_1 )





end event

event type integer ue_after_itemchanged(string as_type);//maha 8-2005

string s

s = String(Message.LongParm, "address")
//messagebox("s",s)
of_lookup_search_dddw(s)

return 1
end event

event constructor;This.of_SetRowManager( TRUE )
//This.inv_rowmanager.of_SetRestoreRow( TRUE )
//This.inv_rowmanager.of_SetConfirmOnDelete ( TRUE )
This.of_SetReqColumn(TRUE)



end event

event rowfocuschanged;call super::rowfocuschanged;st_recs.Text = "Record " + String(This.GetRow()) + " of " + String(This.RowCount())

IF currentrow > 0 THEN
	of_get_record_verif( currentrow )
	dw_browse.SelectRow( 0, False )
	dw_browse.SelectRow( currentrow, True )
	dw_browse.SetRow( currentrow )
	dw_browse.ScrollToRow( currentrow )
	if ib_report=false then
		if this.rowcount() > 0 then
			il_rec_id = This.GetItemNumber( currentrow, "rec_id" )
		end if
	end if
END IF
end event

event pfc_addrow;call super::pfc_addrow;Integer li_retval
integer cnt
long ll_appt_id

tab_view.tabpage_image.Enabled = False
if ii_screen_id = 65 or ii_screen_id = 54 then //maha app081705 questions//Start Code Change ---- 06.08.2006 #529 maha
	this.deleterow( this.rowcount()) //delete the just added row
	select count(rec_id) into :cnt from pd_affil_stat where prac_id = :gl_prac_id and parent_facility_id = :ii_parent_facility_id and active_status > 0;
	if cnt < 1 then
		messagebox("Appointment record error","There are multiple non-history records (Active,Inactive,Pending,Purge) for this practitioner and facility.  This should be corrected on the Appointment Status tab before adding Attestation Questions.")
		return - 1 
	else
		select rec_id into :ll_appt_id from pd_affil_stat where prac_id = :gl_prac_id and parent_facility_id = :ii_parent_facility_id and active_status > 0;
	end if	
	//Start Code Change ---- 06.08.2006 #529 maha
	if ii_screen_id = 65 then
		inv_data_entry.of_add_questions("PRAC",dw_detail,ii_parent_facility_id,gl_prac_id,ll_appt_id)
	elseif  ii_screen_id = 54  then //practice questions
		inv_data_entry.of_add_questions("PQ",dw_detail,ii_parent_facility_id,gl_prac_id,ll_appt_id)
	end if
	//End Code Change---06.08.2006
else
	inv_data_entry.of_set_defaults( This, This.RowCount() )
	This.SetItemStatus( This.RowCount(), 0, Primary!, NotModified! )
end if

this.scrolltorow(This.RowCount()) //maha app100305
This.SetColumn( is_first_column_detail_1 )
This.SetFocus()

gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_addverificationentry,'Enabled', False)
of_refresh_page_menu() //Added By Ken.Guo 06.10.2008

RETURN 0
end event

event pfc_retrieve;call super::pfc_retrieve;

Return This.Retrieve( )
end event

event buttonclicked;DataWindowChild dwchild
string s
string ls_phone

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.03.2006 By: LeiWei
//$<reason> Fix a defect.
IF ib_screen_painter THEN RETURN
//---------------------------- APPEON END ----------------------------

IF dwo.Name = "linkbutton" THEN
	IF This.GetItemStatus( row, 0, Primary! ) = New! or This.GetItemStatus( row, 0, Primary! ) = NewModified! THEN
		MessageBox("Save", "You need to first save the address record before applying address links." )
		Return
	ELSE
		OpenWithParm( w_address_link, String( il_prac_id ) + "-" + String( dw_detail.GetItemNumber( dw_detail.GetRow(), "rec_id")) )	
		//\/maha 080300
		dw_link_list.retrieve( dw_detail.GetItemNumber( dw_detail.GetRow(), "rec_id")) 
		//\maha
	END IF
ELSEIF dwo.Name = "findbutton" THEN
	integer set1
//	select set_1
//	into :set1
//	from icred_settings;
	set1 = of_get_app_setting("set_1","I")
	
	long ll_addr[ ]
	Integer li_cr
	Integer a
	Integer li_address_cnt
	gs_pass_ids ids
	
	if set1 <> 1 then 
		
		IF dw_detail.GetItemStatus( dw_detail.GetRow(), 0, Primary! ) = DataModifIed! THEN
			IF parent_window.Event pfc_Save() <> 1 THEN
				Return
			END IF
	   END IF		
		
		
		Open(w_practice_to_addr_find_new) 
			
		ids = Message.PowerObjectParm
			
		IF ids.l_ids[1] = 0 THEN
			Return
		END IF
			
		ll_addr[] = ids.l_ids[]
			
		li_address_cnt = UpperBound( ids.l_ids[] )
			
			
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-21
		//$<modify> 2006-04-10 By: owen chen
		//$<reason> Performance tuning modification
		//$<modification> Use datawindow to retrieve data from the database instead 
		//$<modification> of using SQLs in PT-22.
 		/*
		dw_addresses.dataobject = "d_group_data_entry"
		dw_addresses.SetTransObject( SQLCA )
		*/
		dw_addresses.dataobject = "d_group_data_entry_for_pt"
		dw_addresses.SetTransObject( SQLCA )
		
		if upperbound(ll_addr)>0 then
			dw_addresses.Retrieve( ll_addr )
		end if
		
		ib_addaddress = true
		//---------------------------- APPEON END ----------------------------
			
		FOR a = 1 TO li_address_cnt
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-22
			//$<modify> 2006-04-10 By: owen chen
			//$<reason> Performance tuning modification
			//$<modification> Write script to retrieve data from a cache in PT-21 instead of from the database. 
			/*
			dw_addresses.retrieve(  ll_addr[a] )
			*/
			dw_addresses.setfilter('rec_id = '+ string ( ll_addr[a] ))
			dw_addresses.filter( )
			//---------------------------- APPEON END ----------------------------
			if gi_temp_switch = 0 then //maha 083004 for adds
				IF a = 1 AND dw_detail.GetItemStatus( dw_detail.GetRow(), 0, Primary! ) = NewModifIed! OR dw_detail.GetItemStatus( dw_detail.GetRow(), 0, Primary! ) = New! THEN
					dw_detail.DeleteRow( dw_detail.GetRow( ) )
				END IF
				this.triggerevent("pfc_addrow") //maha 090104 replaced insertrow()
				li_cr = dw_detail.rowcount()
				//li_cr = dw_detail.InsertRow( 0 )
				//debugbreak()
				//inv_data_entry.of_set_defaults( dw_detail, dw_detail.RowCount() )
			else //maha 083004 to allow updating a record again
				li_cr = dw_detail.getRow()
			end if

			if This.Describe("gp_id.ColType") <> "!" then
				dw_detail.setitem( li_cr,"gp_id", ll_addr[a] )
			end if
			if This.Describe("street.ColType") <> "!" then
				dw_detail.setitem( li_cr,"street",dw_addresses.getitemstring( 1,"street"))
			end if

			if This.Describe("street_2.ColType") <> "!" then			
				dw_detail.setitem( li_cr,"street_2",dw_addresses.getitemstring( 1,"street_2"))
			end if
			if This.Describe("city.ColType") <> "!" then
				dw_detail.setitem( li_cr,"city",dw_addresses.getitemstring( 1,"city"))
			end if
			if This.Describe("state.ColType") <> "!" then
				dw_detail.setitem( li_cr,"state",dw_addresses.getitemnumber( 1,"state") )
			end if
			if This.Describe("zip.ColType") <> "!" then
				dw_detail.setitem( li_cr,"zip",dw_addresses.getitemstring( 1,"zip"))
			end if
			if This.Describe("county.ColType") <> "!" then
				dw_detail.setitem( li_cr,"county",dw_addresses.getitemnumber( 1,"county"))
			end if
			if This.Describe("country.ColType") <> "!" then
				dw_detail.setitem( li_cr,"country",dw_addresses.getitemnumber( 1,"country"))
			end if
			if This.Describe("phone.ColType") <> "!" then
				//Start Code Change ----06.10.2008 #V81 maha - strip format characters
				ls_phone =  of_strip_char("",dw_addresses.getitemstring( 1,"phone") ,"@NUM@")
				dw_detail.setitem( li_cr,"phone",ls_phone)
				//End Code Change---06.10.2008
			end if
			if This.Describe("fax.ColType") <> "!" then
				dw_detail.setitem( li_cr,"fax",dw_addresses.getitemstring( 1,"fax"))
			end if
			if This.Describe("e_mail_address.ColType") <> "!" then
				dw_detail.setitem( li_cr,"e_mail_address",dw_addresses.getitemstring( 1,"e_mail_address"))
			end if
			if This.Describe("web_address.ColType") <> "!" then
				dw_detail.setitem( li_cr,"web_address",dw_addresses.getitemstring( 1,"web_address"))
			end if
			if This.Describe("contact_person.ColType") <> "!" then
				dw_detail.setitem( li_cr,"contact_person",dw_addresses.getitemstring( 1,"contact_person"))
			end if
			if This.Describe("business_mgr.ColType") <> "!" then
				dw_detail.setitem( li_cr,"business_mgr",dw_addresses.getitemstring( 1,"business_mgr"))
			end if
			if This.Describe("office_mgr.ColType") <> "!" then
				dw_detail.setitem( li_cr,"office_mgr",dw_addresses.getitemstring( 1,"office_mgr"))
			end if
			if This.Describe("tax_id.ColType") <> "!" then
				dw_detail.setitem( li_cr,"tax_id",dw_addresses.getitemstring( 1,"tax_id"))
			end if
			if This.Describe("tax_id_other_1.ColType") <> "!" then
				dw_detail.setitem( li_cr,"tax_id_other_1",dw_addresses.getitemstring( 1,"tax_id_other_1"))
			end if
			if This.Describe("tax_id_other_2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"tax_id_other_2",dw_addresses.getitemstring( 1,"tax_id_other_2"))
			end if
			if This.Describe("routine_visit_appt.ColType") <> "!" then
				dw_detail.setitem( li_cr,"routine_visit_appt",dw_addresses.getitemstring( 1,"routine_visit_appt"))
			end if
			if This.Describe("urgent_visit_appt.ColType") <> "!" then
				dw_detail.setitem( li_cr,"urgent_visit_appt",dw_addresses.getitemstring( 1,"urgent_visit_appt"))
			end if
			if This.Describe("emergency_visit_appt.ColType") <> "!" then
				dw_detail.setitem( li_cr,"emergency_visit_appt",dw_addresses.getitemstring( 1,"emergency_visit_appt"))
			end if
	
			if This.Describe("handicapped_access.ColType") <> "!" then
				dw_detail.setitem( li_cr,"handicapped_access",dw_addresses.getitemnumber( 1,"handicapped_access"))
			end if
				if This.Describe("public_transportation.ColType") <> "!" then
				dw_detail.setitem( li_cr,"public_transportation",dw_addresses.getitemnumber( 1,"public_transportation"))
			end if
			if This.Describe("non_emergency_appt.ColType") <> "!" then
				dw_detail.setitem( li_cr,"non_emergency_appt",dw_addresses.getitemstring( 1,"non_emergency_appt"))
			end if
		
			if This.Describe("mon_from.ColType") <> "!" then
				dw_detail.setitem( li_cr,"mon_from",dw_addresses.getitemstring( 1,"mon_from"))
			end if
			if This.Describe("mon_to.ColType") <> "!" then
			dw_detail.setitem( li_cr,"mon_to",dw_addresses.getitemstring( 1,"mon_to"))
			end if
			if This.Describe("tue_from.ColType") <> "!" then
				dw_detail.setitem( li_cr,"tue_from",dw_addresses.getitemstring( 1,"tue_from"))
			end if
			if This.Describe("tue_to.ColType") <> "!" then
				dw_detail.setitem( li_cr,"tue_to",dw_addresses.getitemstring( 1,"tue_to"))
			end if
			if This.Describe("wed_from.ColType") <> "!" then
				dw_detail.setitem( li_cr,"wed_from",dw_addresses.getitemstring( 1,"wed_from"))
			end if
			if This.Describe("wed_to.ColType") <> "!" then
				dw_detail.setitem( li_cr,"wed_to",dw_addresses.getitemstring( 1,"wed_to"))
			end if
			if This.Describe("thu_from.ColType") <> "!" then
				dw_detail.setitem( li_cr,"thu_from",dw_addresses.getitemstring( 1,"thu_from"))
			end if
			if This.Describe("thu_to.ColType") <> "!" then
				dw_detail.setitem( li_cr,"thu_to",dw_addresses.getitemstring( 1,"thu_to"))
			end if
			if This.Describe("fri_from.ColType") <> "!" then
				dw_detail.setitem( li_cr,"fri_from",dw_addresses.getitemstring( 1,"fri_from"))
			end if
			if This.Describe("fri_to.ColType") <> "!" then
				dw_detail.setitem( li_cr,"fri_to",dw_addresses.getitemstring( 1,"fri_to"))
			end if
			if This.Describe("sat_from.ColType") <> "!" then
				dw_detail.setitem( li_cr,"sat_from",dw_addresses.getitemstring( 1,"sat_from"))
			end if
			if This.Describe("sat_to.ColType") <> "!" then
				dw_detail.setitem( li_cr,"sat_to",dw_addresses.getitemstring( 1,"sat_to"))
			end if
			if This.Describe("sun_from.ColType") <> "!" then
				dw_detail.setitem( li_cr,"sun_from",dw_addresses.getitemstring( 1,"sun_from"))
			end if
			if This.Describe("sun_to.ColType") <> "!" then
				dw_detail.setitem( li_cr,"sun_to",dw_addresses.getitemstring( 1,"sun_to"))
			end if
			if This.Describe("mon_from2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"mon_from2",dw_addresses.getitemstring( 1,"mon_from2"))
			end if
			if This.Describe("mon_to2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"mon_to2",dw_addresses.getitemstring( 1,"mon_to2"))
			end if
			if This.Describe("tue_from2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"tue_from2",dw_addresses.getitemstring( 1,"tue_from2"))
			end if
			if This.Describe("tue_to2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"tue_to2",dw_addresses.getitemstring( 1,"tue_to2"))
			end if
			if This.Describe("wed_from2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"wed_from2",dw_addresses.getitemstring( 1,"wed_from2"))
			end if
			if This.Describe("wed_to2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"wed_to2",dw_addresses.getitemstring( 1,"wed_to2"))
			end if
			if This.Describe("thu_from2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"thu_from2",dw_addresses.getitemstring( 1,"thu_from2"))
			end if
			if This.Describe("thu_to2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"thu_to2",dw_addresses.getitemstring( 1,"thu_to2"))
			end if
			if This.Describe("fri_from2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"fri_from2",dw_addresses.getitemstring( 1,"fri_from2"))
			end if
			if This.Describe("fri_to2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"fri_to2",dw_addresses.getitemstring( 1,"fri_to2"))
			end if
			if This.Describe("sat_from2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"sat_from2",dw_addresses.getitemstring( 1,"sat_from2"))
			end if
			if This.Describe("sat_to2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"sat_to2",dw_addresses.getitemstring( 1,"sat_to2"))
			end if
			if This.Describe("sun_from2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"sun_from2",dw_addresses.getitemstring( 1,"sun_from2"))
			end if
			if This.Describe("sun_to2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"sun_to2",dw_addresses.getitemstring( 1,"sun_to2"))
			end if
			if This.Describe("cust_1.ColType") <> "!" then
				dw_detail.setitem( li_cr,"cust_1",dw_addresses.getitemstring( 1,"cust_1"))
			end if
			if This.Describe("cust_2.ColType") <> "!" then
				dw_detail.setitem( li_cr,"cust_2",dw_addresses.getitemstring( 1,"cust_2"))
			end if
			if This.Describe("cust_3.ColType") <> "!" then
				dw_detail.setitem( li_cr,"cust_3",dw_addresses.getitemstring( 1,"cust_3"))
			end if
			if This.Describe("cust_4.ColType") <> "!" then
				dw_detail.setitem( li_cr,"cust_4",dw_addresses.getitemstring( 1,"cust_4"))
			end if
			if This.Describe("cust_5.ColType") <> "!" then
				dw_detail.setitem( li_cr,"cust_5",dw_addresses.getitemstring( 1,"cust_5"))
			end if
			if This.Describe("cust_6.ColType") <> "!" then
				dw_detail.setitem( li_cr,"cust_6",dw_addresses.getitemstring( 1,"cust_6"))
			end if
			//Start Code Change ---- 12.21.2006 #V7 maha
			if This.Describe("suite_apart.ColType") <> "!" then
				dw_detail.setitem( li_cr,"suite_apart",dw_addresses.getitemstring( 1,"suite_apart"))
			end if
			//End Code Change---12.21.2006
			inv_data_entry.of_set_defaults( This, This.RowCount() )
		END FOR	

		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 2005-04-10 By: owen chen
		//$<reason> Performance tuning modification
		//$<reason> Reduce the frequency of client-server interactions to improve runtime performance 
 
 		ib_addaddress = false
		
		dw_link_list.retrieve(il_addr_id)
		
		int li_retval
		li_retval = parent_window.Event Pfc_Save( )
		IF li_retval < 0 THEN
			This.PostEvent( "pfc_cst_after_error" )
		END IF
		
		//---------------------------- APPEON END ----------------------------
		
		if gi_temp_switch = 0 then //maha 083004 when adding	
			IF li_address_cnt > 0 THEN
				dw_browse.scrolltorow(dw_browse.rowcount()) //maha 012704
				dw_browse.setrow(dw_browse.rowcount())
				dw_browse.selectrow(0,false)
				dw_browse.selectrow(dw_browse.rowcount(),true)
				if li_address_cnt > 1 THEN
					MessageBox("Reminder", "Go to each Address record and set up the Address Link data." )
				end if
			END IF
						
			dw_link_list.Retrieve( dw_detail.GetItemNumber( dw_detail.GetRow( ), "rec_id")  )
		else //when updating
			gi_temp_switch = 0
			
		end if

	else //old find function based on addresses
		This.GetChild( "street", dwchild )
		dwchild.SetTransObject( SQLCA )
		dwchild.Retrieve( "%" + This.GetText() + "%" )
		//This.SetText( "" )
	end if


	
ELSEIF dwo.Name = "populatebutton" THEN //used with old find function

	Integer li_row_cnt
	String ls_rec_id	
	String ls_grey
	String ls_presentation_str
	String ls_dwsyntax_str
	String ERRORS
	String ls_syntax
	
	ls_syntax = is_sql_syntax
	

	This.AcceptText()
	ls_rec_id = This.GetItemString( row, "street" ) 
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 06.30.2006 By: Liang QingShi
	//$<reason> Fix a bug
	if long(ls_rec_id) <= 0 then return -1
	//---------------------------- APPEON END ----------------------------

	ls_syntax = ls_syntax + " WHERE pd_address.rec_id = " + ls_rec_id
	
	ls_grey = String(rgb(192,192,192))
	ls_presentation_str = "style(type=form)" + " Column(Border=5 ) Datawindow(Color=" + ls_grey + " )" + "Text(Background.Color=" + ls_grey + ")"  

	ls_dwsyntax_str = SQLCA.SyntaxFromSQL(ls_syntax, &
		ls_presentation_str, ERRORS)

	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"SyntaxFromSQL caused these errors: " + ERRORS)
		RETURN -1
	END IF

	dw_addresses.Create( ls_dwsyntax_str, ERRORS)

	IF Len(ERRORS) > 0 THEN
		MessageBox("Caution", &
		"Create cause these errors: " + ERRORS)
		RETURN -1
	END IF
	
	dw_addresses.of_SetTransObject( SQLCA )
	li_row_cnt = dw_addresses.Retrieve(  )
	IF li_row_cnt = 0 THEN
		MessageBox("Error", "Nothing to select.")
		Return -1
	END IF

	This.DeleteRow( row )
	
	dw_addresses.RowsCopy ( 1, 1, Primary!, This, 1000, Primary! )

	This.ScrollToRow( This.RowCount() )
	This.SetRow( This.RowCount() )	
	
	This.AcceptText()

	This.GetChild( "street", dwchild )
	dwchild.Reset()
//\/maha 062801  peer lookup select
elseif dwo.Name = "peerbutton" THEN
	long ll_peer_id
	integer p
	open(w_select_peer)
	ll_peer_id = message.doubleparm
	IF ll_peer_id < 1 THEN  //Start Code Change ----02.28.2008 #V8 maha  - IF ll_peer_id = 0 THEN
		Return
	END IF
	//messagebox("ll_peer_id",ll_peer_id)
	
	dw_addresses.dataobject = "d_peer_lu_select"
	dw_addresses.SetTransObject( SQLCA )
	p = dw_addresses.Retrieve( ll_peer_id )
	
	//Start Code Change ----02.28.2008 #V8 maha  - trap for bad retrieval
	if p < 1 then
		messagebox("Peer Populate","Unable to get the selected peer data.")
		return
	end if
	//End Code Change---02.28.2008
	
	li_cr = dw_detail.GetRow()

	if This.Describe("title.ColType") <> "!" then
		dw_detail.setitem( li_cr,"title", long(dw_addresses.getitemstring( 1,"contact_salutation")))
	end if
	if This.Describe("last_name.ColType") <> "!" then
		dw_detail.setitem( li_cr,"last_name",dw_addresses.getitemstring( 1,"entity_name"))
	end if
	if This.Describe("first_middle_name.ColType") <> "!" then
		dw_detail.setitem( li_cr,"first_middle_name",dw_addresses.getitemstring( 1,"street2"))
	end if
	if This.Describe("name_suffix.ColType") <> "!" then
		dw_detail.setitem( li_cr,"name_suffix",long(dw_addresses.getitemstring( 1,"web_address")))
	end if
	if This.Describe("prof_suffix.ColType") <> "!" then
		dw_detail.setitem( li_cr,"prof_suffix",long(dw_addresses.getitemstring( 1,"contact_name")))
	end if
	if This.Describe("street.ColType") <> "!" then
		dw_detail.setitem( li_cr,"street",dw_addresses.getitemstring( 1,"street1"))
	end if
	if This.Describe("city.ColType") <> "!" then
		dw_detail.setitem( li_cr,"city",dw_addresses.getitemstring( 1,"city"))
	end if
	if This.Describe("state.ColType") <> "!" then
		dw_detail.setitem( li_cr,"state",long(dw_addresses.getitemstring( 1,"state") ))
	end if
	if This.Describe("zip.ColType") <> "!" then
		dw_detail.setitem( li_cr,"zip",dw_addresses.getitemstring( 1,"zip"))
	end if
	if This.Describe("country.ColType") <> "!" then
		dw_detail.setitem( li_cr,"country",long(dw_addresses.getitemstring( 1,"country")))
	end if
	if This.Describe("cust_5.ColType") <> "!" then
		dw_detail.setitem( li_cr,"cust_5",dw_addresses.getitemstring( 1,"phone"))
	end if
	if This.Describe("cust_1.ColType") <> "!" then
		dw_detail.setitem( li_cr,"cust_1",dw_addresses.getitemstring( 1,"custom_3"))
	end if
	if This.Describe("cust_2.ColType") <> "!"  then
		dw_detail.setitem( li_cr,"cust_2",dw_addresses.getitemstring( 1,"custom_4"))
	end if
//	s = This.Describe("cust_3") 
//	messagebox("s",s)
	if This.Describe("cust_3.ColType") <> "!" then
		dw_detail.setitem( li_cr,"cust_3",dw_addresses.getitemstring( 1,"custom_5"))
	end if
	//Start Code Change ---- 04.11.2007 #V7 maha
	if This.Describe("fax.ColType") <> "!" then
		dw_detail.setitem( li_cr,"fax",dw_addresses.getitemstring( 1,"fax"))
	end if
	if This.Describe("e_mail_address.ColType") <> "!" then
		dw_detail.setitem( li_cr,"e_mail_address",dw_addresses.getitemstring( 1,"email_address"))
	end if
	//End Code Change---04.11.2007
//\maha	
	
END IF


end event

event itemchanged;call super::itemchanged;string ls_type
integer li_screen
Integer li_ans
integer li_stat
Long ll_rec_id
 

IF inv_data_entry.of_itemchanged( This, data ) = 1 THEN //this function buts a dot on the basic info middle name if only 1 character
	Return 2
END IF

//Start Code Change ----08.01.2008 #V85 maha - modified active status to use function call rewrote to test only on existing records
If This.GetColumnName() = "active_status" and this.getitemstatus( row, 0, primary!) = Datamodified! then  //Start Code Change ----.2008 #V85 maha - change to run only if not  a new record
	li_stat = integer(data)
	IF li_stat = 0 THEN //if inactive display message
		li_ans = MessageBox( "Active Status", "If you change this active status to INACTIVE, all verification entries for this record will be Permanently changed to inactive.  Continue?", StopSign!, YesNo!, 1 )
		IF li_ans = 1 THEN
			li_ans = MessageBox("Active Status", "Are you sure?", StopSign!, YesNo!, 1	)
			IF li_ans = 2 THEN //if no set active
				this.setitem(row,this.getcolumn( ),1 )
				return
			end if
		end if
	End if				
	ll_rec_id = This.GetItemNumber( row, "rec_id" )
	inv_verification_info.of_update_inactive_verifs( ll_rec_id, ii_screen_id , li_stat )
//	IF data = "0" THEN
//		Integer li_ans
//		Long ll_rec_id
//		li_ans = MessageBox( "Active Status", "If you change this active status to INACTIVE, all verification entries for this record will be Permanently changed to inactive.  Continue?", StopSign!, YesNo!, 1 )
//		IF li_ans = 1 THEN
//			li_ans = MessageBox("Active Status", "Are you sure?", StopSign!, YesNo!, 1 )
//			IF li_ans = 1 THEN
//				ll_rec_id = This.GetItemNumber( row, "rec_id" )
//				UPDATE verif_info  
//			     SET active_status = 0 
//				WHERE rec_id = :ll_rec_id;
//				IF SQLCA.SQLCODE = -1 THEN
//					MessageBox("Database Error", SQLCA.SQLERRTEXT )
//				END IF
//			END IF
//		END IF
//	END IF
END IF
//End Code Change---08.01.2008

tab_view.tabpage_image.Enabled = True

//maha 061605 for lookup search

if long(data) = -777 then
	ls_type = "C"
  	accepttext( )
	This.PostEvent( "ue_after_itemchanged",0,ls_type)
elseif long(data) = -888 then
	ls_type = "A"
  	accepttext( )
	This.PostEvent( "ue_after_itemchanged",0,ls_type )
	inv_data_entry.of_refresh_cache( )  //maha 122205
end if
end event

event pfc_deleterow;Return of_delete_record( This )


end event

event pfc_validation;call super::pfc_validation;Integer li_retval
integer li_table_id

//Start Code Change ----06.18.2008 #V81 maha - removed. now called from of_validate in dw_detail
if this.rowcount() < 1 then return 1
li_table_id = dw_select_section.GetItemNumber( dw_select_section.GetRow(), "table_id" )
li_retval = of_validate( li_table_id, this.getrow())
//li_retval = inv_data_entry.of_record_validation( This )
IF li_retval = -1 THEN
	Return -1
END IF
//End Code Change---06.16.2008

Return AncestorReturnValue

end event

event itemfocuschanged;call super::itemfocuschanged;

//IF This.Describe(This.GetColumnName() + ".DDDW.DisplayColumn") = "entity_name"  THEN
DataWindowChild dwchild
String ls_column_name
integer res	
	
	ls_column_name =This.GetColumnName()
	res = This.GetChild( ls_column_name, dwchild )
	if res > 0 then
		if dw_select_section.getitemnumber(dw_select_section.getrow(),"screen_id") = 65 or dw_select_section.getitemnumber(dw_select_section.getrow(),"screen_id") = 54 or ls_column_name = "billing_address_id" then //maha app081705 trap for question dddw
		   //nothing
		else
			IF dwchild.RowCount() > 2 THEN //maha changed from 1 for lookup search 061605
				//--------------------------- APPEON BEGIN ---------------------------
				//$<add> 04.19.2006 By: LeiWei
				//$<reason> Fix a defect.
				/*
				is_lookup_search_column_table = dwchild.GetItemString( 3, "lookup_name" )//maha changed from 2 for lookup search 061605 //Start Code Change ---- 06.08.2006 #528 maha
				*/
//				IF ls_column_name <> "street" THEN
				IF ls_column_name <> "street" and ls_column_name <> "active_status" THEN  //Start Code Change ----07.23.2008 #V85 maha - added active_status exception
					is_lookup_search_column_table = dwchild.GetItemString( 3, "lookup_name" )//maha changed from 2 for lookup search 061605
				END IF
				//---------------------------- APPEON END ----------------------------
			END IF
		end if
	end if
	IF IsValid( m_pfe_cst_data_entry ) THEN
		gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_edit.m_lookupsearch,'Enabled', True)
	END IF
//ELSE
//	IF IsValid( m_pfe_cst_data_entry ) THEN
//		m_pfe_cst_data_entry.m_edit.m_lookupsearch.enabled = False
//	END IF
//END IF

IF This.GetColumnName() = "billing_address_id" THEN
	This.GetChild( "billing_address_id", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( il_prac_id )
	
	dwchild.InsertRow( 1 )
	dwchild.SetItem( 1, "pd_address_street", "N/A" )	
	dwchild.SetItem( 1, "pd_address_city", "" )
	dwchild.SetItem( 1, "code_lookup_code", "" )
	dwchild.SetItem( 1, "pd_address_rec_id", -1 )	
	dwchild.InsertRow( 1 )
	dwchild.SetItem( 1, "pd_address_street", "Same" )	
	dwchild.SetItem( 1, "pd_address_city", "" )
	dwchild.SetItem( 1, "code_lookup_code", "" )
	dwchild.SetItem( 1, "pd_address_rec_id", 0 )
	dwchild.InsertRow( 1 )
	dwchild.SetItem( 1, "pd_address_street", "" )	
	dwchild.SetItem( 1, "pd_address_city", "" )
	dwchild.SetItem( 1, "code_lookup_code", "" )	
END IF


end event

event pfc_preupdate;call super::pfc_preupdate;//this is the preupdate being used

String ls_screen_name
String ls_ref_1
String ls_val
String ls_ref_2
String ls_ref_3
String ls_exp_field
String ls_reference
String ls_rec_status
DateTime ldt_exp_date
DateTime ldt_null_date
Long ll_rec_id
Long ll_address_code
long ll_appt_stat_recid  //#1 maha 101606
long ll_templ_id[ ]  //#1 maha 101606
long ll_verif_response  //#1 maha 101606  completion response code for verif; if 0 will not be completed.
long li_seq_no
Integer li_table_id
Integer li_facility_specific
Integer li_screen_id
Integer li_current_row
Integer i
Integer li_cnt
Integer li_rec_count
long li_found
Integer li_data_cr
Integer li_verif_rc
Integer li_retval
integer li_year //maha031601
integer li_month//maha031601
integer li_validate//maha080803
integer li_res //maha 032406
integer li_complete[ ] //#1 maha 101606
integer li_auto_gen[ ] //#1 maha 101606
integer li_app_audit_facil //#1 maha 101606
integer li_appt_stat //#1 maha 101606
integer li_temp_cnt //#1 maha 101606
integer li_status = 1 //maha 080108
string ls_use_as_ver //#1 maha 101606
integer t  //#1 maha 101606
string ls_app_type //#1 maha 101606
string ls_mess //#1 maha 101706
string ls_type1//maha102501
string ls_type2//maha102501
string ls_type3//maha102501
DataWindowChild dwchild
n_ds lds_aa_template //#1 maha 101606
Long ll_new_cnt //Added By Ken.Guo 03.31.2008
Long ll_rec_id_new //Added By Ken.Guo 05.29.2008. Replace il_rec_id

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-11 By: Rodger Wu (Inova)
//$<reason> Define several variable for checking if value in exp_field changed.

DateTime ldt_exp_date_original
Long ll_rec_id_changed[]

//---------------------------- APPEON END ----------------------------

SetNull( ldt_null_date )

This.AcceptText()

li_rec_count = This.RowCount()

IF li_rec_count < 1 THEN
	IF ib_deleting THEN
		RETURN 1
	ELSE
		RETURN -1
	END IF
END IF

SetRedraw( False )


il_last_de_row = This.GetRow()

li_data_cr = This.GetRow()

ls_ref_1 = dw_select_section.GetItemString( il_last_row, "ref_field_1")
ls_ref_2 = dw_select_section.GetItemString( il_last_row, "ref_field_2")
ls_ref_3 = dw_select_section.GetItemString( il_last_row, "ref_field_3")

ls_type1 = dw_select_section.GetItemString( il_last_row, "ref_1_type")//maha102501
ls_type2 = dw_select_section.GetItemString( il_last_row, "ref_2_type")//maha102501
ls_type3 = dw_select_section.GetItemString( il_last_row, "ref_3_type")//maha102501

ls_exp_field = dw_select_section.GetItemString( il_last_row, "exp_field")

li_screen_id = dw_select_section.GetItemNumber( il_last_row, "screen_id")
ls_screen_name = dw_select_section.GetItemString( il_last_row, "screen_name")

li_table_id = dw_select_section.GetItemNumber( dw_select_section.GetRow(), "table_id" )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-23
//$<modify> 03.01.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Write script to retrieve data from a cache instead of from the database.
/*
select count(field_id) into :li_validate from sys_fields where table_id = :li_table_id and use_validation > 0; //maha 072304 see if ay fields need validation 
*/
li_validate  = Long(gnv_data.of_getitem( "sys_fields", "field_id", "table_id = "+String(li_table_id)+" and use_validation > 0"))
//---------------------------- APPEON END ----------------------------

//li_validate = dw_select_section.GetItemnumber( il_last_row, "sys_fields_use_validation")


//select set_31 into :li_validate from icred_settings; maha changed use of variable in v4.5 072304



//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-30
//$<add> 03.16.2006 By: Liang QingShi
//$<reason> Performance tuning
//$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
//$<modification> value into database.
ll_new_cnt = 0
FOR i = 1 TO li_rec_count
	IF This.GetItemStatus( i, 0, Primary!)  = NewModified! THEN
		ll_new_cnt++
	End IF
END FOR
If ll_new_cnt > 0 Then
	ll_rec_id_new = gnv_app.of_Get_Id("RECORD_ID" , ll_new_cnt) - 1
	If ll_rec_id_new < 0 Then //Added By Ken.Guo 04.24.2008.
		Messagebox('Error','Failed to get Record_ID value, Please call support.')
		SetRedraw( True ) 
		Return -1
	End If
End If
//---------------------------- APPEON END ----------------------------
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-25
//$<add> 2006-04-11 By: owen chen
//$<reason> Performance tuning modification
//$<modification> Use ids_parent_facilities to retrive all data
//$<modification> to be used by pfc_cst_u_data_entry. 
 
ids_parent_facilities = CREATE n_ds
ids_parent_facilities.DataObject = "d_address_link_parent_facility_id"
ids_parent_facilities.of_SetTransObject( SQLCA )
ids_parent_facilities.Retrieve( il_prac_id )

//---------------------------- APPEON END ----------------------------
//@@@@@@@@
//Start Code Change ---- 10.25.2006 #1 maha  getting values for app audit creation
ids_parent_facilities.setfilter("parent_facility_id = " + string(ii_parent_facility_id) + " and active_status in (1,4)")
ids_parent_facilities.filter()
li_app_audit_facil =  ids_parent_facilities.rowcount()
//select count(rec_id) into :li_app_audit_facil from pd_affil_stat where prac_id = :il_prac_id and parent_facility_id = :ii_parent_facility_id and active_status in (1,4);
if li_app_audit_facil > 1 then
	li_app_audit_facil = -1 //trap if there is improper data
elseif li_app_audit_facil = 1 then //normally should be one
	//get the template items for the screen
	lds_aa_template = CREATE n_ds
	lds_aa_template.DataObject = "d_app_audit_by_facility_screen"
	lds_aa_template.of_SetTransObject( SQLCA )
	ls_app_type = ids_parent_facilities.getitemstring(1,"apptmnt_type")
	li_app_audit_facil = ids_parent_facilities.getitemnumber(1,"application_audit_facility")
	ll_appt_stat_recid = ids_parent_facilities.getitemnumber(1,"rec_id")
	li_temp_cnt = lds_aa_template.Retrieve(li_app_audit_facil ,ii_screen_id,ls_app_type)
	if li_temp_cnt < 1 then
		li_auto_gen[i] = 0
		li_complete[i] = 0
		ls_use_as_ver = "N"
		ll_verif_response = 0
	else //WHAT ABOUT MULTIPLES?
		for i = 1 to li_temp_cnt  //get each auto gen item
			ll_templ_id[i] = lds_aa_template.getitemnumber(i,"app_audit_id")
			li_auto_gen[i] = lds_aa_template.getitemnumber(i,"auto_generate")
			if isnull(li_auto_gen[i]) then li_auto_gen[i] = 0
			li_complete[i] = lds_aa_template.getitemnumber(i,"receive_from_de")
			if isnull(li_complete[i]) then li_complete[i] = 0
			if ls_use_as_ver <> "Y" then //if not already set to use as verification
				ls_use_as_ver = lds_aa_template.getitemstring(i,"use_as_verification")
				if isnull(ls_use_as_ver) then ls_use_as_ver = "N"
			end if
			if ll_verif_response = 0 or isnull(ll_verif_response) then //get response code if not set
				ll_verif_response = lds_aa_template.getitemnumber(i,"default_ver_response_code")
				if isnull(ll_verif_response) then ll_verif_response = 0
			end if
		next
		if ls_use_as_ver = "Y" then
			ls_mess = "Y"
		else
			ls_mess = "N"
		end if
		ls_mess = ls_mess +  "*" +string(ll_verif_response )
	end if
end if
//w_app_audit_complete_mes
ids_parent_facilities.setfilter("") //reset the filter
ids_parent_facilities.filter()
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//End Code Change---10.25.2006

FOR i = 1 TO li_rec_count
	//debugbreak()			
	SetNull( ll_address_code )
	IF This.GetItemStatus( i, 0, Primary!) <> NewModified! AND +&
		This.GetItemStatus( i, 0, Primary!) <> DataModified! THEN
		CONTINUE
	ELSEIF This.GetItemStatus( i, 0, Primary!)  = NewModified! THEN
		ls_rec_status = "New"
		//messagebox("", "dw_detail1")
		//if li_validate > 0 then //if one or more fields uses validation  //Start Code Change ---- 10.02.2006 #634 maha  removed
//			if of_validate(li_table_id,i) < 0 then  //Start Code Change ----06.16.2008 #V81 maha - moved to pfc_validation
//				SetRedraw( True )
//				RETURN -1
//			end if
		//end if
		ll_rec_id_new ++

		This.SetItem( i, "prac_id", il_prac_id)
		IF li_screen_id = 61 or li_screen_id = 32 or li_screen_id = 33 THEN		
			SELECT pd_affil_stat.rec_id  
    		INTO :ll_rec_id_new  
    		FROM pd_affil_stat  
   		WHERE ( pd_affil_stat.prac_id = :il_prac_id ) AND  
         		( pd_affil_stat.parent_facility_id = :ii_parent_facility_id ) AND  
         		( pd_affil_stat.active_status in (1,4) )   ;  //maha  changed to include pending 072402
			IF SQLCA.SQLCODE = -1 THEN
				MessageBox("SQL Error 1", SQLCA.SQLERRTEXT )
				Return -1
			END IF
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 05/05/2008 By: Ken.Guo
			//$<reason> Fix BugK050504.Duplicate PK when save staff category data.
			//li_seq_no = inv_data_entry.of_get_next_seq_no( "department", il_rec_id )
			Choose Case li_screen_id
				Case	32 //Depart/Div/Section
					li_seq_no = inv_data_entry.of_get_next_seq_no( "department", ll_rec_id_new )
				Case	33 //Staff Category
					li_seq_no = inv_data_entry.of_get_next_seq_no( "staff cat", ll_rec_id_new )
				Case	61 //No this screen id in DB???
					li_seq_no = inv_data_entry.of_get_next_seq_no( "department", ll_rec_id_new )
			End Choose
			//---------------------------- APPEON END ----------------------------

			li_seq_no++
			This.SetItem( i, "seq_no", li_seq_no )				
			This.SetItem( i, "rec_id", ll_rec_id_new )			
		ELSE
			This.SetItem( i, "rec_id", ll_rec_id_new )			
		END IF
		IF li_screen_id = 2 then //Upper(ls_screen_name) = "ADDRESS" THEN
			of_add_address_link( ll_rec_id_new )
		elseIF ii_screen_id = 10 THEN		// "HOSPITAL AFFILIATION"
			of_add_hosp_link( ll_rec_id_new )
		elseIF ii_screen_id = 19 THEN			//"BOARD/SPECIALTY"
			of_add_spec_link( ll_rec_id_new )
		END IF
		
	ELSE
		ls_rec_status = "Modified"
		//if li_validate > 0 then //maha 080803 for LIJ
//			if of_validate(li_table_id,i) < 0 then //Start Code Change ---- 10.02.2006 #633 maha  removed
//				SetRedraw( True )
//				RETURN -1
//			end if
		//end if
	END IF
	
	ll_rec_id = This.GetItemNumber( i, "rec_id" )
	
//	IF Upper(ls_screen_name) = "LICENSURE" OR +&
//		Upper(ls_screen_name) = "INSURANCE" OR +&
//		Upper(ls_screen_name) = "DEA REGISTRATION" THEN
	IF ii_screen_id = 4 OR ii_screen_id = 15 OR ii_screen_id = 5 THEN
		IF This.Describe( "active_status.dddw.name" ) = 'd_code_lookup_active_inactive' THEN
			IF This.GetItemNumber( i, "active_status" ) = 0 THEN
				if ls_rec_status = "New" then
					CONTINUE
				else				//\/maha 031601
					update verif_info
					set active_status = 0
					where rec_id = :ll_rec_id and active_status = 1;
					continue		 //\maha
				end if
			END IF
		END IF
	END IF	
	
	//\/maha 031601 get month and year end for check back date passed in verification add
	IF li_screen_id  = 7 or li_screen_id = 10 THEN  // training & hosp affil
		if This.Describe("year_thru.ColType") <> "!" then
			li_year = this.getitemnumber(i,"year_thru")
			if This.Describe("month_thru.ColType") <> "!" then
				li_month = this.getitemnumber(i,"month_thru")
			end if
			//maha added to using full end date field
		elseif This.Describe("end _date.ColType") <> "!" then
			li_year = year(date(this.getitemdatetime(i,"end_date")))
				li_month = month(date(this.getitemdatetime(i,"end_date")))
		end if
	end if
	//\maha
	
	
	//jad 05/30/01 added to make any screen facility specific


	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-27
	//$<modify> 03.01.2006 By: LeiWei
	//$<reason> Performance tuning
	//$<modification> Write script to retrieve data from a cache instead of from the database.

	/*	
	
		SELECT sys_tables.facility_specific  
		INTO :li_facility_specific  
		FROM sys_tables  
		WHERE sys_tables.table_id = :li_table_id   ;
				
		IF SQLCA.SQLCODE = -1 THEN
			MessageBox("Error", SQLCA.SQLERRTEXT )
		END IF
	*/
	li_facility_specific = Long(gnv_data.of_getitem( "sys_tables", "facility_specific", "table_id = "+String(li_table_id) ))
	//---------------------------- APPEON END ----------------------------

	IF li_screen_id = 19 THEN //specialty
		IF IsNull( This.GetItemNumber( i, "board_code" ) ) THEN
			CONTINUE
		  //Start Code Change ---- 10.26.2007 #V7 maha	
		ELSE
			ll_address_code = This.GetItemNumber( i, "board_code" ) 
			IF ls_rec_status = "Modified" THEN
		//ELSEIF ls_rec_status = "Modified" THEN
				SELECT count(*)  
				INTO :li_cnt  
						FROM verif_info  
						WHERE ( verif_info.rec_id = :ll_rec_id ) AND  
							( verif_info.active_status = 1 )   ;
				IF IsNull( li_cnt ) OR li_cnt = 0 THEN
					ls_rec_status = "New"
				END IF
			end if //modified
			//End Code Change---10.26.2007
		END IF
	//jad 05/30/01 added to make any screen facility specific
	ELSEIF li_facility_specific = 1 THEN //attest quest or group cov	
	//ELSEIF li_screen_id = 21 OR li_screen_id = 26 THEN //attest quest or group cov
	//ELSEIF li_screen_id = 21 OR li_screen_id = 26 THEN //attest quest or group cov
//		IF li_screen_id = 61 THEN //had been removed in version 3.75 but didn't make it to 4 removed again 061604 for v4.187 maha
//			This.SetItem( i, "facility_id", 1 )		
//		ELSE
			if This.Describe("facility_id.ColType") <> "!" then  //Start Code Change ---- 01.25.07.2007 #V7 maha
				This.SetItem( i, "facility_id", ii_parent_facility_id )	
			end if	
//		END IF
	END IF
	IF NOT IsNull( ls_ref_1 ) AND ls_ref_1 <> "" THEN
		This.ScrollToRow( i )
		This.SetRow( i )

		//move expiration date to verif info table if there is one
		IF Len(ls_exp_field) > 0 THEN
			IF ls_exp_field = "certification_expires" THEN	
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 05.25.2007 By: Jack
				//$<reason> Fix a defect.
				/*
				ldt_exp_date = DateTime(Date( "12-30-" + String( This.GetItemNumber( i, ls_exp_field ) ) ),Now())//maha changed 080101
				//--------------------------- APPEON BEGIN ---------------------------
				//$<add> 2006-10-11 By: Rodger Wu (Inova)
				//$<reason> Get Original value of exp_field.
				ldt_exp_date_original = DateTime(Date( "12-30-" + String( This.GetItemNumber( i, ls_exp_field, Primary!, True ) ) ),Now())
				//---------------------------- APPEON END ----------------------------
				*/				
				ldt_exp_date = DateTime(Date( String( This.GetItemNumber( i, ls_exp_field ) ) + "-12-30"),Now())
				ldt_exp_date_original = DateTime(Date( String( This.GetItemNumber( i, ls_exp_field, Primary!, True ) ) + "-12-30"),Now())				
				//---------------------------- APPEON END ----------------------------
				//ldt_exp_date = DateTime(Date( "1-1-" + String( This.GetItemNumber( i, ls_exp_field ) ) ),Now())
			ELSEIF ls_exp_field = "cert_expiration_year" THEN
				li_month = this.GetItemNumber( i, "cert_expiration_month" )
				if isnull(li_month) then
					//--------------------------- APPEON BEGIN ---------------------------
					//$<modify> 05.25.2007 By: Jack
					//$<reason> Fix a defect.
					/*
					ldt_exp_date = DateTime(Date( "12-30-" + String( This.GetItemNumber( i, ls_exp_field ) ) ),Now())//maha 061402 fo spec. certs
					//--------------------------- APPEON BEGIN ---------------------------
					//$<add> 2006-10-11 By: Rodger Wu (Inova)
					//$<reason> Get Original value of exp_field.
					ldt_exp_date_original = DateTime(Date( "12-30-" + String( This.GetItemNumber( i, ls_exp_field, Primary!, True ) ) ),Now())
					//---------------------------- APPEON END ----------------------------
					*/
					ldt_exp_date = DateTime(Date( String( This.GetItemNumber( i, ls_exp_field ) ) + "-12-30"),Now())
					ldt_exp_date_original = DateTime(Date( String( This.GetItemNumber( i, ls_exp_field, Primary!, True ) ) + "-12-30"),Now())				
					//---------------------------- APPEON END ----------------------------
				else
					//--------------------------- APPEON BEGIN ---------------------------
					//$<modify> 05.25.2007 By: Jack
					//$<reason> Fix a defect.
					/*
					ldt_exp_date = DateTime(Date(String(li_month) + "-28-" + String( This.GetItemNumber( i, ls_exp_field ) ) ),Now())

					//--------------------------- APPEON BEGIN ---------------------------
					//$<add> 2006-10-11 By: Rodger Wu (Inova)
					//$<reason> Get Original value of exp_field.
					ldt_exp_date_original = DateTime(Date(String(li_month) + "-28-" + String( This.GetItemNumber( i, ls_exp_field, Primary!, True ) ) ),Now())
					//---------------------------- APPEON END ----------------------------
					*/
					ldt_exp_date = DateTime(Date(String( This.GetItemNumber( i, ls_exp_field ) ) + "-" + String(li_month) + "-28"),Now())
					ldt_exp_date_original = DateTime(Date(String( This.GetItemNumber( i, ls_exp_field, Primary!, True ) ) + "-" + String(li_month) + "-28"),Now())
					//---------------------------- APPEON END ----------------------------
				end if
			ELSE
				//Start Code Change ---- 03.24.2006 #341 maha  trap for invisible field
				if This.Describe(ls_exp_field + ".ColType") <> "!" then
					ldt_exp_date = This.GetItemDateTime( i, ls_exp_field )

					//--------------------------- APPEON BEGIN ---------------------------
					//$<add> 2006-10-11 By: Rodger Wu (Inova)
					//$<reason> Get Original value of exp_field.
					ldt_exp_date_original = This.GetItemDateTime( i, ls_exp_field, Primary!, True )
					//---------------------------- APPEON END ----------------------------
				else
					of_error_message( ls_exp_field, i,"Unable to update data","The " + upper(ls_exp_field) + " field is required by your system settings.~r~rYou will not be able to save data on this screen~runtil the field is made visible in the Screen Painter for the view you are using.")
					return -1
				end if
			END IF
		ELSE
			ldt_exp_date = ldt_null_date

			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 2006-10-11 By: Rodger Wu (Inova)
			//$<reason> Get Original value of exp_field.
			SetNull( ldt_exp_date_original )
			//---------------------------- APPEON END ----------------------------
			
		END IF
	
		//get reference 1 data 
		
		if This.Describe(ls_ref_1 + ".ColType") = "!"  or ls_ref_1 = "" then //trap for invisible field maha 012104 
			messagebox("Problem getting reference 1 value for verification","Required Field " + ls_ref_1 + " is invisible.  The verification will not be created/updated.  Contact Customer support for assistance.")
			return 1
		end if
		li_retval = This.SetColumn( ls_ref_1 )
		IF li_retval = 1 THEN
			IF IsNull( GetText() ) OR GetText() = "" THEN
				SetRedraw( True )
				//MessageBox( "Required", "The reference field " + ls_ref_1 + " is required." )
				of_error_message(ls_ref_1,i,"Required", "The data field " + ls_ref_1 + " is required.")
				Return -1
			END IF
			li_retval = This.GetChild(ls_ref_1, dwchild)
			IF li_retval = -1 THEN
				ls_reference =  This.GetText()				
			ELSE
				This.SetColumn( ls_ref_1 )
				li_found = dwchild.Find( "lookup_code = " + This.GetText(), 1, 100000 )	
				//messagebox("li_found",li_found)
				IF This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "code" THEN
					ls_reference = dwchild.GetItemString( li_found, "code" )

					//IF ls_screen_name = "Licensure" THEN
					IF ii_screen_id = 4 THEN					
						if This.Describe("verifying_agency.ColType") = "!" then //trap for invisible field maha 040403 
							of_error_message("VERIFYING_AGENCY",i,"Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter.")
							//messagebox("Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter")
							return -1
						else
							ll_address_code = This.GetItemNumber( i, "verifying_agency" )
						end if
					ELSEIF li_screen_id = 19 THEN  //Start Code Change ---- 10.26.2007 #V7 maha
						//do nothing, got the address code further up
					ELSE
						if ls_type1 = "C" then //maha 050802 
							ll_address_code = long(This.GetItemstring( i, ls_ref_1 ))//maha 072501
						elseif ls_type1 = "N" then //maha 050802
							ll_address_code = This.GetItemNumber( i, ls_ref_1 )
						end if
					END IF
				//--------------------------- APPEON BEGIN ---------------------------
				//$<modify> 03/16/2007 By: Jervis
				//$<reason> PB:entity_name,APB WEB:entity_name_original ,
				//				pfc_cst_nv_data_entry_functions.of_create_dynamic_dw line 840 modified by Liang QingShi,i don't know why.
				/*
				ELSEIF This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name" THEN
				*/
				//---------------------------- APPEON END ----------------------------
				ELSEIF This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name" or This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name_original" THEN
					if This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "entity_name_original" THEN
						ls_reference = dwchild.GetItemString( li_found, "entity_name_original" )
					else
						ls_reference = dwchild.GetItemString( li_found, "entity_name" )
					end if
					if ls_type1 = "C" then //maha 102501 took out specific exceptions and tested field type
						ll_address_code = long(This.GetItemstring( i, ls_ref_1 ))//maha 072501
					elseif ls_type1 = "N" then //maha 102501
						ll_address_code = This.GetItemNumber( i, ls_ref_1 )
					end if
				ELSEIF This.Describe( ls_ref_1 + ".dddw.displaycolumn") = "description" THEN //maha 110801
					ls_reference = dwchild.GetItemString( li_found, "description" )
					//Start Code Change ---- 10.10.2007 #V7 maha added same exception for verif ying agency as above
					IF ii_screen_id = 4 THEN					
						if This.Describe("verifying_agency.ColType") = "!" then //trap for invisible field maha 040403 
							of_error_message("VERIFYING_AGENCY",i,"Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter.")
							//messagebox("Screen Setup Error"," The verifying_agency field is a required field, and must be visible to enter Licence data.  Please set up in the screen painter")
							return -1
						else
							ll_address_code = This.GetItemNumber( i, "verifying_agency" )
						end if
					ELSEIF li_screen_id = 19 THEN  //Start Code Change ---- 10.26.2007 #V7 maha
						//do nothing, got the address code further up
					ELSE
						if ls_type1 = "C" then //maha 050802 
							ll_address_code = long(This.GetItemstring( i, ls_ref_1 ))//maha 072501
						elseif ls_type1 = "N" then //maha 050802
							ll_address_code = This.GetItemNumber( i, ls_ref_1 )
						end if
					END IF
					//End Code Change---10.10.2007
				ELSE
					ls_reference = This.GetText()			
				END IF
			END IF
		ELSE
			ls_reference = ""
		END IF

		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03.01.2006 By: LeiWei
		//$<reason> Fix a defect.
		If NOT Isnull(ls_ref_2) THEN
		//---------------------------- APPEON END ----------------------------

		//get reference 2 data
		if This.Describe(ls_ref_2 + ".ColType") = "!" or ls_ref_2 = "" then //trap for invisible field maha 012104 
			messagebox("Problem getting reference 2 value for verification","Required Field " + ls_ref_2 + " is invisible.  The verification will not be created/updated.  Contact Customer support for assistance.")
			return 1
		end if
		li_retval = This.SetColumn( ls_ref_2 )
		IF li_retval = 1 THEN
			IF IsNull( GetText() ) OR GetText() = "" THEN
				SetRedraw( True )
				//MessageBox( "Required", "The reference field " + ls_ref_2 + " is required." )				
				of_error_message(ls_ref_2,i,"Required", "The data field " + ls_ref_2 + " is required.")
				Return -1
				//End Code Change---03.24.2006
			END IF		
			li_retval = This.GetChild(ls_ref_2, dwchild)
			IF li_retval = -1 THEN
				ls_reference = ls_reference + " - " + This.GetText()				
			ELSE
				This.SetColumn( ls_ref_2 )
				li_found = dwchild.Find( "lookup_code = " + This.GetText(), 1, 100000 )
				if li_found > 0 then //trap added maha 021704
					IF This.Describe( ls_ref_2 + ".dddw.displaycolumn") = "code" THEN
						ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "code" )
					ELSEIF dw_detail.Describe( ls_ref_2 + ".dddw.displaycolumn") = "description" THEN
						ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "description" )					
					//--------------------------- APPEON BEGIN ---------------------------
					//$<modify> 03/16/2007 By: Jervis
					//$<reason> PB:entity_name,APB WEB:entity_name_original ,
					//				pfc_cst_nv_data_entry_functions.of_create_dynamic_dw line 840 modified by Liang QingShi,i don't know why.
					/*
					ELSEIF This.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name" THEN
					*/
					//---------------------------- APPEON END ----------------------------
					ELSEIF This.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name" or This.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name_original" THEN
						if This.Describe( ls_ref_2 + ".dddw.displaycolumn") = "entity_name_original" THEN
							ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "entity_name_original" )
						else
							ls_reference = ls_reference + " - " + dwchild.GetItemString( li_found, "entity_name" )
						end if
					ELSE
						ls_reference = ls_reference + " - " + This.GetText()
					END IF
				else
					ls_reference = ls_reference + " - " + ""
				end if
			END IF
		ELSE
			ls_reference = ls_reference + " - " + ""
		END IF
		
		ls_reference = mid(ls_reference,1,100) //maha 022704 4.1.1

		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 03.01.2006 By: LeiWei
		//$<reason> Fix a defect.
		END IF
		//---------------------------- APPEON END ----------------------------
//@@@@@

		//Start Code Change ----08.01.2008 #V85 maha - get active status to pass to function
		if this.Describe("active_status.ColType") <> "!" then
			li_status = this.getitemnumber(li_data_cr,"active_status")
		end if
		//End Code Change---08.01.2008
		//Start Code Change ---- 10.26.2006 #1 maha
		IF ls_rec_status = "Modified" THEN
			parent_window.Tab_1.tabpage_verif.uo_verif_summary.of_update_reference( ls_reference,  ll_rec_id, ll_address_code,  ldt_exp_date , li_screen_id,li_status)  //Start Code Change ----04.22.2008 #V8 maha - added screen id argument ; 08.01.2008 added li_status argument
			inv_data_entry.of_app_audit_update_ref( il_prac_id , ll_rec_id , mid(ls_screen_name,1,5) + "-" + ls_reference )

			//--------------------------- APPEON BEGIN ---------------------------
			//$<add> 2006-10-11 By: Rodger Wu (Inova)
			//$<reason> 
			IF ( Isnull( ldt_exp_date_original ) and Not Isnull( ldt_exp_date ) ) or &
				( Isnull( ldt_exp_date ) and Not Isnull( ldt_exp_date_original ) ) or &
				( DaysAfter( date( ldt_exp_date_original ), date( ldt_exp_date ))) <> 0 THEN
				ll_rec_id_changed[ Upperbound( ll_rec_id_changed ) + 1 ] = ll_rec_id
			END IF
			//---------------------------- APPEON END ----------------------------
		ELSE  //new
			for t = 1 to li_temp_cnt //check to see if completion is desired
				if li_complete[t] = 1 then 
					openwithparm(w_app_audit_complete_mes,  ls_mess) //asks user to complete and gets response code 
					ls_mess = message.stringparm
					if mid(ls_mess,1,1) = "N" then 
						li_complete[t] = 0
						ll_verif_response = 0
					else //yes
						ll_verif_response = long(mid(ls_mess,3))
					end if	
				else //Start Code Change ---- 05.09.2007 #V7 maha trap so verif does not get completed
					li_complete[t] = 0
					ll_verif_response = 0
				end if
				if li_auto_gen[t] = 1 then  //Start Code Change ---- 05.09.2007 #V7 maha only create if set to auto gen
					inv_data_entry.of_app_audit_item_create( li_app_audit_facil ,il_prac_id ,ll_templ_id[t] ,ll_appt_stat_recid , ll_rec_id , "DE" , li_complete[t] , mid(ls_screen_name,1,5) + "-" + ls_reference )
				end if
			next
			IF Upper( gs_cust_type ) = 'I' THEN ll_verif_response = 326 //if intelliapp, always set to complete the verification
			IF parent_window.Tab_1.tabpage_verif.uo_verif_summary.of_add_record( il_prac_id, ll_rec_id, li_screen_id, ls_reference,  ldt_exp_date, ls_screen_name, ll_address_code, "A",li_month,li_year,ll_verif_response, li_status) = -1 THEN  //Start Code Change ----.2008 #V85 maha - added li_status argument
					Return -1
					messagebox("Error","Error adding verification")
				end if
			END IF
			parent_window.ib_app_audit_retrieved = false //Start Code Change ---- 10.30.2006 #1 maha
		//End Code Change---10.26.2006
//@@@@@

	END IF
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.12.2006 By: Jack (Inova)
	//$<reason> Queue Images for Scanning from Data Entry.
	long ll_row,ll_seq_no,ll_image_type_id,ll_default_pages,ll_de_queue
	if ls_rec_status = "New" then
		ll_de_queue = long(gnv_data.of_getitem('image_type','de_queue','link_to_screen = ' + string(li_screen_id)))
	//ll_de_queue = 0 //maha changed because it was not working properly
		if ll_de_queue = 1 then
			ll_image_type_id = long(gnv_data.of_getitem('image_type','image_type_id','link_to_screen = ' + string(li_screen_id)))
			ll_default_pages = long(gnv_data.of_getitem('image_type','default_pages','link_to_screen = ' + string(li_screen_id)))

			ll_row = ids_image_data.insertrow(0)
			
			SELECT Max( seq_no )  
			INTO :ll_seq_no  
			FROM pd_images  
			WHERE pd_images.rec_id = :ll_rec_id ;
			
			IF IsNull( ll_seq_no ) THEN
				ll_seq_no = 0
			END IF
			ll_seq_no++
			ids_image_data.SetItem( ll_row, "image_type_id", ll_image_type_id )
			ids_image_data.SetItem( ll_row, "prac_id", il_prac_id )
			ids_image_data.SetItem( ll_row, "seq_no", ll_seq_no )
			ids_image_data.SetItem( ll_row, "rec_id", ll_rec_id  )
			ids_image_data.SetItem( ll_row, "facility_id", ii_parent_facility_id  )	
			ids_image_data.SetItem( ll_row, "screen_id", li_screen_id )	
			ids_image_data.SetItem( ll_row, "reference_name", ls_reference )
			ids_image_data.SetItem( ll_row, "active_status", 1 )	
			ids_image_data.SetItem( ll_row, "num_pages", ll_default_pages )
			ids_image_data.SetItem( ll_row, "tif_start_page", 1 )
			ids_image_data.SetItem( ll_row, "de_queue", 0 )
		end if
	end if
	//---------------------------- APPEON END ----------------------------
	
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 10.17.2006 By: Jack (Inova)
//Start Code Change ---- 10.26.2006 #1 maha  removed .  not using
	//$<reason> Required Documents Check Box on Data Entry Screen.
//	long ll_prac_id[]
//	long li_rec_id[]
//	ll_prac_id[1] = il_prac_id
//	li_rec_id[1] = ll_rec_id
////	inv_data_entry.of_create_application_audit_record(ls_rec_status,ll_prac_id,li_screen_id,li_rec_id,ls_reference)
//End Code Change---10.26.2006
	//---------------------------- APPEON END ----------------------------
END FOR

This.ScrollToRow( li_data_cr )
This.SetRow( li_data_cr )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06/03/2008 By: Ken.Guo
//$<reason> Fix issue. After save address data, address link data disappear.
if li_data_cr > 0 then
	il_rec_id = This.GetItemNumber( li_data_cr, "rec_id" )
end if
//---------------------------- APPEON END ----------------------------

dw_detail.BringToTop = True
of_get_record_verif( li_data_cr )

//IF is_screen_name = "Hospital Affiliation" or is_screen_name = "Address"  then //\/maha 082101 
//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" or is_screen_name = "Board/Specialty"then
IF ii_screen_id = 10 or ii_screen_id = 2 or ii_screen_id = 19  then
	dw_link_list.bringtotop = True
end if

This.SetRedraw( True )

dw_detail.SetColumn( is_first_column_detail_1 )

dw_detail.SetFocus()

//debugbreak()
inv_data_entry.of_field_audit( This )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-26
//$<modify> 2006-04-11 By: owen chen
//$<reason> Performance tuning modification
//$<modification> 1)Modify the script in the pfc_Save from PT-28.
//$<modification> 2)Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

gnv_appeondb.of_startqueue( )

IF ids_parent_facilities.rowcount( ) > 0 THEN
	dw_link_list.Update()
	dw_link_list.Retrieve( il_rec_id )
END IF
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
ids_image_data.update()
//---------------------------- APPEON END ----------------------------

gnv_appeondb.of_commitqueue( )

DESTROY ids_parent_facilities

//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-10-11 By: Rodger Wu (Inova)
//$<reason> Automatically poping up Verification Update window once
//$<reason> value in exp_field changed.

String ls_sql_where, ls_rec_id_str, ls_sql_original
n_ds lds_verify
gs_verif_update lstr_verif

li_cnt = UpperBound( w_mdi.ii_security_action_id )
FOR i = 1 TO li_cnt
	IF w_mdi.ii_security_action_id[ i ] = 160 THEN
		IF w_mdi.ii_security_action_value[ i ] = 0 THEN
			Return 1; //No rights	
		END IF
	END IF		
NEXT

li_cnt = UpperBound( ll_rec_id_changed )
IF li_cnt > 0 THEN
//	ls_sql_where = " AND security_user_facilities.user_id = '" + gs_user_id + "' " + &
//						" AND pd_affil_stat.prac_id = " + string( il_prac_id ) + &
//						" AND verif_info.screen_id = " + string( li_screen_id )
//												
	FOR i = 1 TO li_cnt
		ls_rec_id_str += string( ll_rec_id_changed[i] ) + ", "
	NEXt
//	ls_rec_id_str = Left( ls_rec_id_str, Len( ls_rec_id_str ) - 2 )
//	ls_sql_where += " AND verif_info.rec_id in ( " + ls_rec_id_str + " ) "
//
	lds_verify = Create n_ds
	lds_verify.DataObject = "d_verification_facility_de_update_maha"
	lds_verify.SetTransObject( SQLCA )
	
//	ls_sql_original = lds_verify.Describe( "Datawindow.Table.Select" )
//	ls_sql_original += ls_sql_where
	
//	lds_verify.Modify( 'Datawindow.Table.Select = "' + ls_sql_original + '"' )

	//IF lds_verify.Retrieve() > 0 THEN
	//	IF MessageBox( "IntelliSoft", "Do you want to update the verification(s)?", Question!, YesNo!, 1 ) = 2 THEN Return 1;
		
		lstr_verif.sql_syntax = ""//ls_sql_original
		lstr_verif.al_prac_id = il_prac_id
		lstr_verif.al_screen_id = li_screen_id
		lstr_verif.al_rec_id = ll_rec_id_changed
		
		OpenwithParm( w_verification_de_update, lstr_verif )
	///END IF
END IF

//---------------------------- APPEON END ----------------------------

RETURN 1

end event

event pfc_preinsertrow;//\/maha 050701 to trap save errors when entering multiple records

Integer li_retval

// mskinner 17 dec 2005 -- begin
// do not allow for the addition os rows in the PERSIONL DATA screen

STRING LS_SCREEN_NAME
LS_SCREEN_NAME = UPPER(dw_select_section.object.screen_name[dw_select_section.getRow()])
if upper(TRIM(LS_SCREEN_NAME)) = 'PERSONAL DATA' THEN 
	RETURN Failure
END IF 

// mskinner 17 dec 2005 -- end


//if is_screen_name = "Hospital Affiliation" or is_screen_name = "Address" then
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-28
//$<comment> 2006-04-10 By: owen chen
//$<reason> Performance tuning modification
//$<modification> Move the script to PT-26. It is integrated into Appeon Queue labels
//$<modification> to reduce client-server interactions.
/*
li_retval = Parent_window.Event pfc_Save()
	//debugbreak()
	IF li_retval < 0 THEN
		This.PostEvent( "pfc_cst_after_error" )
		Return 1
	END IF
*/

//---------------------------- APPEON END ----------------------------

		
//end if
	
return continue_action

//\maha
end event

event rowfocuschanging;call super::rowfocuschanging;//IF is_screen_name = "Address" AND dw_link_list.GetItemStatus( dw_link_list.GetRow(), 0, Primary!)  = DataModified! THEN 
IF ii_screen_id = 2 AND dw_link_list.GetItemStatus( dw_link_list.GetRow(), 0, Primary!)  = DataModified! THEN 
	IF of_address_link_check() = -1 THEN
		Return 1
	ELSE
		dw_link_list.Update()
	END IF
END IF
end event

event pfc_postupdate;call super::pfc_postupdate;//m_pfe_cst_data_entry.m_edit.m_addverificationentry.Enabled = True maha removed 082503

This.ScrollToRow( il_last_de_row )
This.SetRow( il_last_de_row )

//\/maha 061705 used for setting screen icon
integer r
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 03.31.2006 By: LiuHongXin
//$<reason> Fix a defect.
/*
r = this.rowcount()
if r > 1 then
	dw_select_section.setitem(dw_select_section.getrow(),"selected",r)
elseif this.getitemstatus(1,0,primary!) <> newmodified! then
	dw_select_section.setitem(dw_select_section.getrow(),"selected",1)
else
	dw_select_section.setitem(dw_select_section.getrow(),"selected",0)
end if
*/
dwItemStatus l_Status
l_Status = this.getitemstatus(1,0,primary!)

r = this.rowcount()
if r > 1 then
	dw_select_section.setitem(dw_select_section.getrow(),"selected",r)
elseif l_Status <> newmodified! AND Not IsNull(l_Status) then
	dw_select_section.setitem(dw_select_section.getrow(),"selected",1)
else
	dw_select_section.setitem(dw_select_section.getrow(),"selected",0)
end if
//---------------------------- APPEON END ----------------------------

//Added for Work Flow trigger. 11.21.2006 Henry
string ls_module
long ll_screen_id[]  //12.13.2006 By Jervis

If of_Get_app_setting("set_9" , "I") = 1 Then
	ls_module = '02'
Else
	ls_module = '01'
End if
If gb_workflow Then
	n_cst_workflow_triggers lnv_workflow
	lnv_workflow = create n_cst_workflow_triggers
	
	If parent_window.ib_new_prac Then ii_parent_facility_id = 1
	//12.13.2006 By Jervis
	ll_screen_id[1] = ii_screen_id
	//lnv_workflow.of_data_value_comparision( ii_screen_id, il_prac_id, ii_parent_facility_id, ls_module, 'I')
	lnv_workflow.of_data_value_comparision(gl_data_view_id, ll_screen_id, il_prac_id, ii_parent_facility_id, ls_module, 'I')
	//12.13.2006 End

	Destroy lnv_workflow
	
	//Refresh Action Item Data
	if ls_module = "02" then
		parent_window.of_retrieve_net( )
	end if
End If
//End added 11.21.2006
Return 1

end event

event rbuttondown;call super::rbuttondown;integer col
integer ret
datetime dtn
string colname
STRING DT

setnull(dtn)

col = this.getclickedcolumn()
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 04.21.2006 By: Leiwei
//$<reason> Fix a defect.

/* colname = this.getcolumnname() */
colname = dwo.name
//---------------------------- APPEON END ----------------------------

if this.Describe( colname + ".ColType") = "datetime" THEN
	//messagebox("dt","dt")
	ret = messagebox("Set Null?","Would you like to set this Date to null?",question!,yesno!,2 )
	if ret = 1 then
		this.setitem(row,col,dtn)
	end if
END IF
end event

event retrieveend;call super::retrieveend;if This.Describe("prac_id.ColType") <> "!" then //maha 051503 for lehigh
	this.Modify("prac_id.background.color = '12632256'")
	//this.Modify( "prac_id.TabSequence = 0" )
	//this.Modify( "prac_id.protect = 1" )
	//this.Modify( "prac_id.x = '2100'" )
	//this.Modify( "prac_id.y = '100'" )
end if

if This.Describe("rec_id.ColType") <> "!" then //maha 051503 
	this.Modify("rec_id.background.color = '12632256'")
	//this.Modify( "rec_id.TabSequence = 0" )
	//this.Modify( "rec_id.protect = 1" )
	//this.Modify( "prac_id.x = '2100'" )
	//this.Modify( "prac_id.y = '100'" )
end if

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06/10/2008 By: Ken.Guo
//$<reason> Move script to function of_set_page_menu()
/*
// mskinner 13 Dec 2005 -- begin
if isvalid(m_pfe_cst_data_entry) then 
if this.rowcount() > 1 then 
 gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_priorpage,'enabled', true)
 gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_nextpage,'enabled', true)
else 
 gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_priorpage,'enabled', false)
 gnv_app.of_modify_menu_attr( m_pfe_cst_data_entry.m_view.m_nextpage,'enabled', false)
end if 
end if
// mskinner 13 Dec 2005 -- end
*/
of_refresh_page_menu() //Added By Ken.Guo 06.10.2008
//---------------------------- APPEON END ----------------------------

end event

event pfc_nextpage;return this.ScrollNextRow() //Added By Ken.Guo 06.06.2008
end event

event pfc_previouspage;return this.ScrollPriorRow() //Added By Ken.Guo 06.06.2008
end event

event doubleclicked;call super::doubleclicked;//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-08-12 By: Scofield
//$<Reason> Popup a dialog to input the phone.

String	ls_Name,ls_Mask,ls_Phone,ls_RetParm
long		ll_FieldID

This.AcceptText()
if row > 0 and row <= This.RowCount() then
	ls_Name = dwo.name
	ll_FieldID = long(This.Describe(ls_Name + ".Tag"))
	
	SELECT field_mask INTO :ls_Mask FROM sys_fields WHERE field_id = :ll_FieldID and field_name = :ls_Name ;
	
	if Trim(ls_Mask) = "(###)###-####" then
		ls_Phone = This.GetItemString(row,ls_Name)
		OpenWithParm(w_phonedetail,ls_Phone)
		
		ls_RetParm = Message.StringParm
		
		if ls_RetParm <> 'Cancel' then
			This.SetItem(row,ls_Name,ls_RetParm)
		end if
		This.SetColumn(ls_Name)
	end if
end if
//---------------------------- APPEON END ----------------------------

end event

event scrollvertical;call super::scrollvertical;Long ll_numrow
String ls_firstrow, ls_lastrow

ls_lastrow = This.Object.Datawindow.LastRowOnPage
ll_numrow = dw_browse.GetItemNumber(Long(ls_lastrow),"rec_id")
dw_link_list.Retrieve(ll_numrow) //
RETURN 0

end event

