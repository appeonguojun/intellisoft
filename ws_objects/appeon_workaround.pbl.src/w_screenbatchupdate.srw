$PBExportHeader$w_screenbatchupdate.srw
forward
global type w_screenbatchupdate from w_popup
end type
type st_1 from statictext within w_screenbatchupdate
end type
type dw_1 from u_dw within w_screenbatchupdate
end type
type cb_restore from commandbutton within w_screenbatchupdate
end type
type cb_selectview from commandbutton within w_screenbatchupdate
end type
type dw_screen_list from datawindow within w_screenbatchupdate
end type
type dw_view_list from datawindow within w_screenbatchupdate
end type
type cb_cb_selectscreen from commandbutton within w_screenbatchupdate
end type
type cb_close from commandbutton within w_screenbatchupdate
end type
type gb_1 from groupbox within w_screenbatchupdate
end type
end forward

global type w_screenbatchupdate from w_popup
integer x = 214
integer y = 221
integer width = 3333
integer height = 2124
string title = "Screen Batch Restore"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_1 dw_1
cb_restore cb_restore
cb_selectview cb_selectview
dw_screen_list dw_screen_list
dw_view_list dw_view_list
cb_cb_selectscreen cb_cb_selectscreen
cb_close cb_close
gb_1 gb_1
end type
global w_screenbatchupdate w_screenbatchupdate

type variables
CONSTANT STRING EXPORTHEADERFLAG = "$PBExportHeader$"
CONSTANT STRING ENTERCHAR = "~r~n"

DataStore	ids_Screen,ids_pic,ids_backup_pic
String		is_CurDir,is_pic_path
long il_dw_style
n_cst_update_data        ino_backup
n_cst_filesrv inv_filesrv
end variables

forward prototypes
public function long of_writestrtofile (string as_filename, string as_context, boolean ab_replace)
public function string of_getscreensyntax (long al_data_view_id, long al_screen_id)
public function long of_readstrfromfile (string as_filename, ref string as_context)
public subroutine of_getcheckedlist (ref long al_vclist[], ref long al_sclist[], ref string as_dolist[], ref string as_fixfield[])
public function string wf_getsyntax (string as_style, long al_data_view_id, long al_screen_id, datetime adt_backup, long al_seq)
public function integer of_get_opsyntax (string as_orgsyntax, string as_opeclist, ref string as_opsyntax, ref string as_lookuplist)
public function string of_align_object (datastore ads_grid)
public function integer of_save (long al_view, long al_screen, string as_syntax, string as_style, long al_seq)
public subroutine of_backup_pic (integer al_view, integer al_screen, integer al_seq)
end prototypes

public function long of_writestrtofile (string as_filename, string as_context, boolean ab_replace);long		ll_FileNo,ll_Cycle,ll_WriteCnts, ll_BlobLen
Blob		lb_syntax
//CONSTANT LONG ONCE_COUNT = 32760
//
//WriteMode	lwm_Mode
//
//if ab_Replace then lwm_Mode = Replace! else lwm_Mode = Append!
//
//ll_FileNo = FileOpen(as_FileName,StreamMode!,Write!,LockReadWrite!,lwm_Mode)
//if ll_FileNo < 0 then Return -1
//
//ll_WriteCnts = Ceiling(Len(as_Context) * 1.0 / ONCE_COUNT)
//
//for ll_Cycle = 1 to ll_WriteCnts
//	FileWrite(ll_FileNo,Mid(as_Context,(ll_Cycle - 1) * ONCE_COUNT + 1,ONCE_COUNT))
//next
//
//FileClose(ll_FileNo)
//modified by gavins 20120313 grid
If len( as_Context ) = 0 Or IsNull( as_Context ) Then Return -1


lb_syntax = blob(as_Context)
ll_BlobLen = Len(lb_syntax)
filedelete(as_FileName)  //jervis 10.25.2011
AppeonWriteFile(as_FileName, lb_syntax,ll_BlobLen)


Return 1

end function

public function string of_getscreensyntax (long al_data_view_id, long al_screen_id);long		ll_data_length,ll_loops,ll_Cnts,ll_start
Long		ll_GridDataLength
String		ls_SQL,ls_all_SQL, ls_ScreenStyle

//modified by gavins 20120312 grid
SELECT (Case when screen_style = 'G' Then Datalength(grid_SQL) else  Datalength(dw_SQL) end ), Screen_style 
  INTO :ll_data_length, :ls_ScreenStyle
  FROM ctx_screen
 WHERE data_view_id = :al_data_view_id AND screen_id = :al_screen_id;

if ll_data_length = 0 or IsNull(ll_data_length) then Return ""

if ll_data_length > 8000 then
  	 if Mod(ll_data_length,8000) = 0 then
        ll_loops = ll_data_length/8000
    else
  	     ll_loops = (ll_data_length/8000) + 1
    end if
else
  	 ll_loops = 1
end if

for ll_Cnts = 1 to ll_loops
	ll_start = (ll_Cnts - 1) * 8000 + 1
	If ls_ScreenStyle = 'G' Then
		SELECT  SubString(grid_SQL,:ll_start,8000)
		  INTO :ls_SQL
		  FROM ctx_screen
		 WHERE data_view_id = :al_data_view_id AND screen_id = :al_screen_id;
	Else
		SELECT  SubString(dw_SQL,:ll_start,8000)
		  INTO :ls_SQL
		  FROM ctx_screen
		 WHERE data_view_id = :al_data_view_id AND screen_id = :al_screen_id;
	End If
	ls_all_SQL += ls_SQL
next

Return ls_all_SQL

end function

public function long of_readstrfromfile (string as_filename, ref string as_context);String		ls_Buffer
long		ll_FileNo,ll_ReadCnts
blob		lb_Buffer

as_Context = ""

ll_FileNo = FileOpen(as_FileName,StreamMode!,Read!,LockReadWrite!)
if ll_FileNo < 0 then Return -1

ll_ReadCnts = FileReadex(ll_FileNo,lb_Buffer)
do while ll_ReadCnts > 0
	as_Context += String( lb_Buffer )
	ll_ReadCnts = FileReadex(ll_FileNo,lb_Buffer)
loop

FileClose(ll_FileNo)

Return 1

end function

public subroutine of_getcheckedlist (ref long al_vclist[], ref long al_sclist[], ref string as_dolist[], ref string as_fixfield[]);long	ll_VCRow,ll_SCRow
String	ls_Screen_Style, ls_fixfield


ll_VCRow = dw_view_list.Find("selected = 1",1,dw_view_list.RowCount())
do while ll_VCRow > 0
	al_VCList[UpperBound(al_VCList) + 1] = dw_view_list.GetItemNumber(ll_VCRow,"data_view_id")
	if ll_VCRow >= dw_view_list.RowCount() then Exit
	ll_VCRow = dw_view_list.Find("selected = 1",ll_VCRow + 1,dw_view_list.RowCount())
loop

ll_SCRow = dw_screen_list.Find("selected = 1",1,dw_screen_list.RowCount())
do while ll_SCRow > 0
	//modified by gavins 20120312 grid
	ls_Screen_Style = dw_screen_list.GetItemString( ll_Scrow, 'screen_style' )
	ls_fixfield = dw_screen_list.getItemString( ll_Scrow, 'fix_field' )
	
	as_fixfield[ upperbound( as_fixfield) + 1 ] = ls_fixfield
	
	al_SCList[UpperBound(al_SCList) + 1] = dw_screen_list.GetItemNumber(ll_SCRow,"screen_id")
	If ls_Screen_Style = 'G' Then
		as_DOList[UpperBound(as_DOList) + 1] = dw_screen_list.GetItemString(ll_SCRow,"grid_dataobject")
	Else
		as_DOList[UpperBound(as_DOList) + 1] = dw_screen_list.GetItemString(ll_SCRow,"screen_dataobject")
	End If
	if ll_SCRow >= dw_screen_list.RowCount() then Exit
	ll_SCRow = dw_screen_list.Find("selected = 1",ll_SCRow + 1,dw_screen_list.RowCount())
loop

end subroutine

public function string wf_getsyntax (string as_style, long al_data_view_id, long al_screen_id, datetime adt_backup, long al_seq);Long ll_data_length
Integer li_counter
Integer li_loops
String ls_sql
String ls_all_sql
Long ll_start

// Get file data from database
if as_style <> 'G'  then
	SELECT Datalength(dw_sql)
	INTO :ll_data_length
	FROM ctx_screen_bak
	WHERE data_view_id = :al_data_view_id
	AND screen_id = :al_screen_id and backupdate = :adt_backup and seq_no =:al_seq ;
else
	SELECT Datalength(grid_sql)
	INTO :ll_data_length
	FROM ctx_screen_bak
	WHERE data_view_id = :al_data_view_id
	AND screen_id = :al_screen_id and backupdate = :adt_backup and seq_no =:al_seq ;
end if

IF ll_data_length = 0 OR Isnull(ll_data_length) THEN
	Messagebox("Get sql error","Failed to get datawindow syntax from DB, Please report this to support.")
	RETURN ''
END IF

IF ll_data_length > 8000 THEN 
  	 IF Mod(ll_data_length,8000) = 0 THEN 
        li_loops = ll_data_length/8000 
    ELSE 
  	     li_loops = (ll_data_length/8000) + 1 
    END IF 
ELSE 
  	 li_loops = 1 
END IF 

FOR li_counter = 1 to li_loops
	ll_start = (li_counter - 1) * 8000 + 1
	if as_style <> 'G'  then
		SELECT substring(dw_sql,:ll_start,8000)
		INTO :ls_sql
		FROM ctx_screen_bak 
		WHERE data_view_id = :al_data_view_id 
		AND screen_id = :al_screen_id and backupdate = :adt_backup and seq_no =:al_seq ;
	else
		SELECT substring(grid_sql,:ll_start,8000)
		INTO :ls_sql
		FROM ctx_screen_bak 
		WHERE data_view_id = :al_data_view_id 
		AND screen_id = :al_screen_id and backupdate = :adt_backup and seq_no =:al_seq ;
	end if

	ls_all_sql += ls_sql
NEXT 

If not len(ls_all_sql) > 0 Then
	Messagebox("Get sql error 1","Failed to get datawindow syntax from DB, Please report this to support.")
End If
Return ls_all_sql
end function

public function integer of_get_opsyntax (string as_orgsyntax, string as_opeclist, ref string as_opsyntax, ref string as_lookuplist);return gf_get_opsyntax(as_orgsyntax,as_opeclist,as_opsyntax,as_lookuplist)
end function

public function string of_align_object (datastore ads_grid);//
//====================================================================
// Function: of_align_object
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	ads_grid
//--------------------------------------------------------------------
// Returns:  string
//--------------------------------------------------------------------
// Author:	gavin		Date: 2012-06-05
//--------------------------------------------------------------------
//Copyright (c) 2008-2012 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
n_cst_update_screen       ln_screen



ln_screen = create n_cst_update_screen

//ln_screen.of_align_object(  uo_band.dw_header, uo_band.dw_detail, "In grid screen the x value, width value and visible property of a column and its title are forced to be the same." )

ln_screen.of_align_object(  ads_grid, "" )

Destroy( ln_screen )

Return ads_grid.Describe( "datawindow.syntax" )
end function

public function integer of_save (long al_view, long al_screen, string as_syntax, string as_style, long al_seq);STRING ls_obj_name
STRING ls_dw_syntax
STRING ls_field_nm 
Integer i,li_col_cnt
Long ll_cr
Long li_pos
DateTime ldt_today
Long ll_max_height, ll_DataViewID
Long ll_col_y, ll_col_height
string ls_visible
string ls_dw_opsyntax
string ls_spcelist
string ls_lookuplist, ls_Err
DataStore lds_Test,lds_temp

ids_screen.SetFilter("")
ids_screen.Filter()
ll_cr = ids_screen.Find("screen_id=" + String(al_screen), 1, ids_screen.RowCount())
IF ll_cr <= 0 THEN RETURN -1
ll_DataViewID = ids_screen.GetItemNumber( ll_cr, 'data_view_id' )

////$<modify> 01.12.2008 by Andy
////--------------------------- APPEON BEGIN ---------------------------
////$<add> 28/04/2007 By: Jervis
////$<reason> temporary process property of border for compute
//of_restore_properties(uo_band.dw_syntax)
////---------------------------- APPEON END ----------------------------

lds_temp = Create DataStore
lds_temp.Create(as_syntax , ls_Err )
If Len( ls_Err ) > 0 Then
	gnv_debug.of_output( true, 'dataviewid='+string( al_view) + ',screenid=' + string( al_screen ) + ',error=' +  ls_Err + '~r~n syntax=' + as_syntax ) 
	MessageBox( 'Save', 'Failed to save ! ' + ls_Err )
	Return -1
End If

//$<add> 03.18.2008 by Andy
//Set the same position to b_due_date_g and b_due_date_r
if al_screen = 33 or al_screen = 47 then
	String ls_x,ls_y,ls_width,ls_height,ls_modify
	ls_x = lds_temp.Describe("b_due_date.x")
	ls_y = lds_temp.Describe("b_due_date.y")
	ls_width  = lds_temp.Describe("b_due_date.Width")
	ls_height = lds_temp.Describe("b_due_date.Height")
	ls_modify = "b_due_date_g.x='" + ls_x + "' b_due_date_r.x='" + ls_x + "' b_due_date_g.y='" + ls_y + "' b_due_date_r.y='" + ls_y + "' b_due_date_g.Width='" + ls_width + "' b_due_date_r.Width='" + ls_width + "' b_due_date_g.Height='" + ls_height + "' b_due_date_r.Height='" + ls_height + "' "
	lds_temp.modify( ls_modify )
end if

//Get syntax
ls_dw_syntax = lds_temp.Describe("DataWindow.Syntax")

//$<Modify> 2007-11-20 By: Andy
//$<Reason> Fix a defect.

If al_screen <> 2 Then
	IF il_dw_style = 1 THEN
		li_pos = Pos(ls_dw_syntax,"processing=0")
		IF li_pos > 0 THEN
			ls_dw_syntax = Left(ls_dw_syntax,li_pos - 1) + "processing=1" + Mid(ls_dw_syntax, li_pos + 12)
		END IF
	END IF		
Else
	/******************************************///added by gavins 20120309 grid
	If il_dw_style = 1 Then
		li_pos = Pos(ls_dw_syntax,"processing=0")
		IF li_pos > 0 THEN
			ls_dw_syntax = Left(ls_dw_syntax,li_pos - 1) + "processing=1" + Mid(ls_dw_syntax, li_pos + 12)
		END IF
	End if
	/******************************************/
	li_pos = Pos(ls_dw_syntax,'master_contract_id visible="1"')		//Modified by Scofield on 2010-05-05
	IF li_pos > 0 THEN
		ls_dw_syntax = Left(ls_dw_syntax,li_pos + 27) + "1	if( master_contract_id > 0,1,0)" + Mid(ls_dw_syntax, li_pos + 29)
	End If
	
	li_pos = Pos(ls_dw_syntax,'master_cnt visible="1"')				//Modified by Scofield on 2010-05-05
	IF li_pos > 0 THEN
		ls_dw_syntax = Left(ls_dw_syntax,li_pos + 19) + "1	if( master_cnt > 0 ,1,0)" + Mid(ls_dw_syntax, li_pos + 21)
	End If	
End If	

// Save syntax of dw to the database
//ls_dw_syntax = uo_band.dw_syntax.Describe("DataWindow.Syntax")
//end of modify 01.12.2008 by andy

//BEGIN---Modify by Evan 07/14/2008
/*
dw_select_section.setitem(ll_cr,'dw_sql',ls_dw_syntax)

// Update modify date
ldt_today = Datetime( Today(), Now() )
dw_select_section.Setitem (ll_cr, "modify_date", ldt_today)

//$<add> 09.06.2006 By: Liang QingShi
dw_select_section.Setitem (ll_cr, "updated", 1)

//gnv_appeondb.of_autocommit( )
gnv_appeondb.of_startqueue( )
dw_select_section.update( )
if (al_screen = 1 or al_screen = 2) and il_data_view = 1001 then
	update ctx_screen set dw_sql = :ls_dw_syntax,modify_date = :ldt_today where data_view_id <> 1001 and screen_id = :al_screen;
end if
//$<add> 03.26.2008 by Andy
dw_fields_alias.Update( )
commit;
gnv_appeondb.of_commitqueue( )
*/

lds_Test = Create DataStore

lds_Test.Create( ls_dw_syntax , ls_Err )
If Len( ls_Err ) > 0 Then
	gnv_debug.of_output( true, 'dataviewid='+string( al_view ) + ',screenid=' + string( al_screen ) + ',error=' +  ls_Err + '~r~n syntax=' + ls_dw_syntax ) //added by gavin 20120919
	MessageBox( 'Save', 'Failed to save ! ' + ls_Err )
	Return -1
End If

IF il_dw_style = 1 THEN //added by gavins 20120605
//	of_UnselectAllObject()
    ls_dw_syntax = of_align_object( lds_Test )
//  u.of_AddorDelSingleSelect(of_GetLastSelectedObject( ),true)
End If

//Add op syntax - jervis 10.11.2011
ls_spcelist = ids_screen.GetItemString( ll_cr,"fix_field")
if of_get_opsyntax(ls_dw_syntax,ls_spcelist,ls_dw_opsyntax,ls_lookuplist) < 0 then ls_dw_opsyntax = ls_dw_syntax

If Len( ls_dw_syntax ) < 10 Then
	gnv_debug.of_output( true, 'dataviewid='+string( al_view ) + ',screenid=' + string( al_screen ) + ',error=' +  ls_Err + '~r~n syntax=' + ls_dw_syntax ) //added by gavin 20120919
	Return -1
End If
If Len( ls_dw_opsyntax ) < 10 Then
	gnv_debug.of_output( true, 'dataviewid='+string( al_view ) + ',screenid=' + string( al_screen ) + ',error=' +  ls_Err + '~r~n syntax=' + ls_dw_opsyntax ) //added by gavin 20120919
	Return -1
End If
lds_Test.Create( ls_dw_opsyntax , ls_Err )
If Len( ls_Err ) > 0 Then
	gnv_debug.of_output( true, 'dataviewid='+string( al_view ) + ',screenid=' + string( al_screen ) + ',error=' +  ls_Err + '~r~n syntax=' + ls_dw_opsyntax ) //added by gavin 20120919
	MessageBox( 'Save', 'Failed to save ! ' + ls_Err )
	Return -1
End If
/*******************************///added by gavins 20120309 grid
If as_style = 'G' Then
	ids_screen.SetItem(ll_cr,'grid_opsql',ls_dw_opsyntax)
	ids_screen.setitem(ll_cr,'grid_sql',ls_dw_syntax)	
	Update ctx_screen  set grid_opsql = :ls_dw_opsyntax, grid_sql = :ls_dw_syntax where data_view_id = :al_view and screen_id = :al_screen;  //added by gavins 20120919
Else
	ids_screen.SetItem(ll_cr,'dw_opsql',ls_dw_opsyntax)
	ids_screen.setitem(ll_cr,'dw_sql',ls_dw_syntax)
	Update ctx_screen  set dw_opsql = :ls_dw_opsyntax, dw_sql = :ls_dw_syntax where data_view_id = :al_view and screen_id = :al_screen;  //added by gavins 20120919
End If

/*******************************/
ids_screen.SetItem(ll_cr,'lookup_list',ls_lookuplist) 
ldt_today = Datetime( Today(), Now() )
ids_screen.Setitem (ll_cr, "modify_date", ldt_today)
ids_screen.Setitem (ll_cr, "updated", 1)

gnv_appeondb.of_startqueue( )
If ids_screen.update( ) <> 1 Then
	MessageBox( 'Tips', 'Failed to save screen!' )//added by gavins 20120919
	rollback;
	return -1
End If

commit;
gnv_appeondb.of_commitqueue( )
//END---Modify by Evan 07/14/2008

//Begin - Added By Mark Lee 12/19/2013
SetPointer(HourGlass!)
pfc_n_cst_ai_export_apb  n_export
n_export = CREATE pfc_n_cst_ai_export_apb
n_export.of_update_export_dddw(al_view,al_screen,ls_dw_syntax)
Destroy n_export
SetPointer(Arrow!)
//End - Added By Mark Lee 12/19/2013


//synchronization fee schedule calc fields to custom data screen - jervis 07.21.2010
if al_screen = 31 then
	n_cst_update_screen lnv_update_screen
	datastore	lds_fee
	string ls_calcs[]
	lnv_update_screen = create n_cst_update_screen
	lds_fee = create datastore
	ls_calcs[Upperbound(ls_calcs) + 1]  = "calc_field_1"
	ls_calcs[Upperbound(ls_calcs) + 1]  = "calc_field_2"
	ls_calcs[Upperbound(ls_calcs) + 1]  = "calc_field_3"
	lds_fee.Create( ls_dw_syntax)
	lds_fee.SetTransObject( sqlca)
	If Not isvalid(w_infodisp) Then Open(w_infodisp) //Added By Ken.Guo 06/13/2012
	lnv_update_screen.of_update_fee_calc(al_view,0,lds_fee,ls_calcs)
//	If isvalid(w_infodisp) Then Close(w_infodisp) //Added By Ken.Guo 06/13/2012
	if isvalid(lnv_update_screen) then destroy lnv_update_screen
	if isvalid(lds_fee) then destroy lds_fee
end if

//begin backup screen   that is  current screen  added by gavins 20120314 grid
ino_backup.of_backup_screen(  al_view , al_screen )

//Added By Jay Chen 01-02-2014
of_backup_pic( al_view , al_screen, al_seq)

RETURN 1

end function

public subroutine of_backup_pic (integer al_view, integer al_screen, integer al_seq);//====================================================================
// Function: of_backup_pic
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 01-02-2014
//--------------------------------------------------------------------
//	Copyright (c) 2008-2013 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

string ls_path,ls_name,ls_filename,ls_nametemp
blob	lb_file
long ll_i,ll_count,ll_seq,ll_x,ll_painterid,ll_find
boolean lb_pic_from_backup = false

//Parse path
if isvalid(w_contract_data_design) then
	is_pic_path = w_contract_data_design.uo_design.is_pic_path
else
	is_pic_path = 'Bitmap'
end if

ls_path = gs_dir_path + gs_DefDirName +"\" + is_pic_path + "\"
gnv_appeondll.of_parsepath(ls_path)

ids_backup_pic.retrieve(al_view,al_screen,al_seq)
ids_pic.retrieve(al_view,al_screen)
if ids_backup_pic.rowcount() > 0 then
	lb_pic_from_backup = true
	ll_count = ids_backup_pic.rowcount()
else
	lb_pic_from_backup = false
	ll_count = ids_pic.rowcount()
end if

for ll_i = 1 to ll_count
	if lb_pic_from_backup then
		ls_name = 	ids_backup_pic.GetItemString( ll_i,"pic_name")		
		ll_painterid = ids_backup_pic.getitemnumber(ll_i,"pic_painter_id")
		ll_find = ids_pic.find("pic_name = '"+ls_name+"'",1,ids_pic.rowcount()) 
		if ll_find > 0 then
			ls_nametemp = ids_pic.GetItemString( ll_find,"pic_filename")
		else
			ls_nametemp = ids_backup_pic.GetItemString( ll_i,"pic_filename")
		end if
	else
		ls_nametemp = ids_pic.GetItemString( ll_i,"pic_filename")
		ls_name = 	ids_pic.GetItemString( ll_i,"pic_name")		
		ll_painterid = ids_pic.getitemnumber(ll_i,"pic_painter_id")
	end if
    ls_filename = ls_path + ls_nametemp
	
	if FileExists(ls_path) and ls_nametemp <> '!' then  
		if len( lb_file ) <= 2 or isnull( lb_file ) then inv_filesrv.of_fileread( ls_filename, ref lb_file)
		//Added By Jay Chen 01-03-2014 
		if len( lb_file ) <= 2 or isnull( lb_file ) then
			if lb_pic_from_backup then
				selectblob pic_bitmap into :lb_file from ctx_screen_bak_picture where data_view_id=:al_view and screen_id=:al_screen and seq_no=:al_seq and pic_name=:ls_name; 
				if len( lb_file ) <= 2 or isnull( lb_file ) then
					if ll_painterid > 0 then
						selectblob file_image into :lb_file from ctx_pictures where  id = :ll_painterid;
					else
						selectblob pic_bitmap into :lb_file from conv_view_pic where view_id=:al_view and screen_id=:al_screen  and pic_name=:ls_name; 
					end if
				end if
			else
				if ll_painterid > 0 then
					selectblob file_image into :lb_file from ctx_pictures where  id = :ll_painterid;
				else
					selectblob pic_bitmap into :lb_file from conv_view_pic where view_id=:al_view and screen_id=:al_screen  and pic_name=:ls_name; 
				end if
			end if
		end if
		select  isnull(max(seq_no),0)  into :ll_seq from  ctx_screen_bak where data_view_id = :al_view and screen_id = :al_screen;
		insert into ctx_screen_bak_picture(data_view_id,screen_id,seq_no,pic_name,pic_filename,backupdate,pic_painter_id)
		values(:al_view,:al_screen,:ll_seq,:ls_name,:ls_nametemp,getdate(),:ll_painterid) ;
		if len( lb_file )  > 2 then
			Updateblob ctx_screen_bak_picture 
			set pic_bitmap = :lb_file 
			where data_view_id = :al_view
			and screen_id = :al_screen 
			and seq_no = :ll_seq 
			and pic_name = :ls_name;
		End if
	end if
	setnull( lb_file )	
next

commit;



end subroutine

on w_screenbatchupdate.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_1=create dw_1
this.cb_restore=create cb_restore
this.cb_selectview=create cb_selectview
this.dw_screen_list=create dw_screen_list
this.dw_view_list=create dw_view_list
this.cb_cb_selectscreen=create cb_cb_selectscreen
this.cb_close=create cb_close
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_restore
this.Control[iCurrent+4]=this.cb_selectview
this.Control[iCurrent+5]=this.dw_screen_list
this.Control[iCurrent+6]=this.dw_view_list
this.Control[iCurrent+7]=this.cb_cb_selectscreen
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.gb_1
end on

on w_screenbatchupdate.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.cb_restore)
destroy(this.cb_selectview)
destroy(this.dw_screen_list)
destroy(this.dw_view_list)
destroy(this.cb_cb_selectscreen)
destroy(this.cb_close)
destroy(this.gb_1)
end on

event open;if Not IsValid(ids_Screen) then ids_Screen = Create DataStore
ids_pic = create datastore
ids_pic.Dataobject = "d_conv_view_pic"
ids_pic.SetTransobject( sqlca)
ids_backup_pic = create datastore
ids_backup_pic.Dataobject = "d_view_backup_pic"
ids_backup_pic.SetTransobject( sqlca)
inv_filesrv = create n_cst_filesrv

is_CurDir = GetCurrentDirectory()

if AppeonGetClientType() = "WEB" then This.Resize(This.Width + 18,This.Height + 22)

end event

event close;ChangeDirectory(is_CurDir)

if IsValid(ids_Screen) then Destroy ids_Screen

end event

event closequery;//
end event

type st_1 from statictext within w_screenbatchupdate
integer x = 1408
integer y = 120
integer width = 1870
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Warm tips: the restore syntax will base on less than or equal to the enter date and time."
boolean focusrectangle = false
end type

type dw_1 from u_dw within w_screenbatchupdate
integer x = 55
integer y = 88
integer width = 1225
integer height = 104
integer taborder = 20
string dataobject = "d_screen_list_batch_datetime"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
end type

event constructor;call super::constructor;This.of_SetUpdateAble( False )
This.of_SetDropDownCalendar( TRUE )
This.iuo_calendar.of_Register(this.iuo_calendar.DDLB)

This.SetTransObject( sqlca)
This.InsertRow(0)
This.setitem(1,"restore_date",today())
This.setitem(1,"restore_time",now())
end event

type cb_restore from commandbutton within w_screenbatchupdate
integer x = 2560
integer y = 1916
integer width = 393
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Batch Restore"
end type

event clicked;long		ll_VCList[],ll_SCList[],ll_RtnVal,ll_ErrCnts
long		ll_VCCycle,ll_VCCnts,ll_SCCycle,ll_SCCnts
String		ls_DOList[],ls_Syntax, ls_dw_opsyntax, ls_lookuplist, ls_spcelist, ls_fixField[], ls_err_text=''
DateTime	ldt_time,ldt_BackUp
string ls_dw_syntax, ls_DataObject,ls_ScreenStyle,ls_err
long ll_find,ll_viewid,ll_screenid,ll_seq,li_pos,ll_findrow,ll_select_screen_seq
int currentrow
n_cst_update_screen	lno_screen	
datastore lds_screen_all,lds_screen_latest

lno_screen = Create n_cst_update_screen
lds_screen_all = create datastore
lds_screen_all.dataobject = 'd_screen_list_all'
lds_screen_all.settransobject(sqlca)
lds_screen_all.retrieve()
lds_screen_latest = create datastore 
lds_screen_latest.dataobject = 'd_screen_list_batch_lastedsyntax'
lds_screen_latest.settransobject(sqlca)

dw_1.accepttext()
of_GetCheckedList(ll_VCList,ll_SCList,ls_DOList, ls_fixField )
ll_VCCnts = UpperBound(ll_VCList)
ll_SCCnts = UpperBound(ll_SCList)
if ll_VCCnts <= 0 or ll_SCCnts <= 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,"Please check at least one view and one screen.")
	Return
end if
if not isdate(string(dw_1.getitemdate(1,"restore_date"))) then
	MessageBox(gnv_app.iapp_object.DisplayName,"Please input restore date.")
	Return
end if
if not istime(string(dw_1.getitemtime(1,"restore_time"))) then
	MessageBox(gnv_app.iapp_object.DisplayName,"Please input restore time.")
	Return
end if

ll_RtnVal = MessageBox("Confirm Batch Restore","Are you sure you want to restore the screen syntax?",Question!,YesNo!,2)
if ll_RtnVal <> 1 then Return

ldt_time = DateTime(dw_1.getitemdate(1,"restore_date"),dw_1.getitemtime(1,"restore_time"))
ids_Screen.dataobject = 'ds_contract_data_view_screens_list' 
ids_Screen.settransobject(sqlca)

IF Not IsValid( w_infodisp ) THEN Open(w_infodisp)
IF IsValid(w_infodisp) THEN w_infodisp.Title = 'Restore screen of view'
IF IsValid(w_infodisp) THEN w_infodisp.Center = True
IF IsValid(w_infodisp) THEN w_infodisp.st_complete.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_3.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_information.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_1.Text = 'Restore screen of view, Please stand by!'
IF IsValid(w_infodisp) THEN w_infodisp.wf_set_min_max(1,ll_VCCnts * ll_SCCnts)
ino_backup = create n_cst_update_data

for ll_VCCycle = 1 to ll_VCCnts
	ll_viewid = ll_VCList[ll_VCCycle]
	ids_Screen.retrieve( ll_viewid)
	
	for ll_SCCycle = 1 to ll_SCCnts
		ll_screenid = ll_SCList[ll_SCCycle]
		IF IsValid(w_infodisp) THEN w_infodisp.wf_step_pbar(1)
		//1.check the screen if exist in database
		ll_find = lds_screen_all.find("data_view_id="+string(ll_viewid)+" and screen_id="+string(ll_screenid)+"",1,lds_screen_all.rowcount())
		if isnull(ll_find) then ll_find = 0
		if ll_find <=0 then continue
		
		IF IsValid(w_infodisp) THEN w_infodisp.st_1.Text = 'Restore dataviewid = ' + String(ll_viewid) + ' ,screenid = ' + String(ll_screenid)+', Please stand by!'
		
		//2.get the latest syntax from database 
		lds_screen_latest.retrieve(ll_viewid,ll_screenid,ldt_time)
		if lds_screen_latest.rowcount() > 0 then
			ls_ScreenStyle = lds_screen_latest.getitemstring(1,"screen_style")
			ldt_BackUp = lds_screen_latest.getitemdatetime(1,"backupdate")
			ll_seq = lds_screen_latest.getitemnumber(1,"seq_no")
			//Added By Jay Chen 01-03-2014
			If IsValid( w_contract_data_design ) Then
				if ll_viewid = w_contract_data_design.uo_design.il_select_view and ll_screenid = w_contract_data_design.uo_design.ii_screen_id then
					ll_select_screen_seq = ll_seq
				end if
			End if
			
			IF appeongetclienttype() <> 'PB' Then
				If ls_ScreenStyle = 'G' Then
					ls_dw_syntax = lds_screen_latest.getitemstring(1,"grid_sql")
				Else
					ls_dw_syntax = lds_screen_latest.getitemstring(1,"dw_sql")
				End If
			Else
				ls_dw_syntax = wf_GetSyntax( ls_ScreenStyle,ll_viewid,ll_screenid, ldt_BackUp, ll_Seq )
			End If
		else
			continue
//			MessageBox(gnv_app.iapp_object.DisplayName,"System can not find corresponding backup record, please reenter restore datetime.")
//			dw_1.setfocus()
//			Return
		end if
		
		ll_findrow = ids_Screen.find("screen_id=" + String(ll_screenid), 1, ids_Screen.RowCount())
		If ll_findrow > 0 Then
			If ls_ScreenStyle = 'G' Then
				ls_DataObject = ids_Screen.GetItemString( ll_findrow, 'grid_dataobject' )
			Else
				ls_DataObject = ids_Screen.GetItemString( ll_findrow, 'dataobject' )
			End If
			ids_Screen.SetItem(ll_findrow, 'screen_style', ls_ScreenStyle )
		End If

		//3.upgrade the screen syntax
		If lno_screen.of_appeon2_changes(ll_viewid,ll_screenid,ls_dw_syntax, ls_DataObject, ids_Screen ) < 0 Then	
			ll_ErrCnts++
			gnv_debug.of_output( true, 'dataviewid='+string( ll_viewid ) + ',screenid=' + string( ll_screenid ) + ',syntax=' + ls_dw_syntax ) 
			return -1
		end if
		il_dw_style = 0
	 	// Convert grid style to tabular
		li_pos = Pos(ls_dw_syntax,"processing=1")
		IF li_pos > 0 THEN
			ls_dw_syntax = Left(ls_dw_syntax,li_pos - 1) + "processing=0" + Mid(ls_dw_syntax, li_pos + 12)
			il_dw_style = 1
		END IF
		If ll_screenid = 2 Then
			li_pos = Pos(ls_dw_syntax,"1	if( master_contract_id > 0,1,0)")
			IF li_pos > 0 THEN
				ls_dw_syntax = Left(ls_dw_syntax,li_pos - 1) + "1" + Mid(ls_dw_syntax, li_pos + 33)
			End If
			li_pos = Pos(ls_dw_syntax,"1	if( master_cnt > 0 ,1,0)")
			IF li_pos > 0 THEN
				ls_dw_syntax = Left(ls_dw_syntax,li_pos - 1) + "1" + Mid(ls_dw_syntax, li_pos + 26)
			End If	
		End If
			
	   //4.save the screen syntax
		if of_save(ll_viewid,ll_screenid,ls_dw_syntax,ls_ScreenStyle,ll_seq) < 0 then
			ll_ErrCnts++
			gnv_debug.of_output( true, 'dataviewid='+string( ll_viewid ) + ',screenid=' + string( ll_screenid ) + ',syntax=' + ls_dw_syntax ) 
			return -1
		end if
		
	next
	
next

If IsValid( lds_screen_all ) Then Destroy ( lds_screen_all )
If IsValid( lds_screen_latest ) Then Destroy ( lds_screen_latest )
If IsValid( ino_backup ) Then Destroy ( ino_backup )
If IsValid( lno_screen ) Then Destroy ( lno_screen )

If IsValid( w_contract_data_design ) Then
	ll_screenid = w_contract_data_design.uo_design.ii_screen_id
	currentrow = w_contract_data_design.uo_design.dw_select_section.getrow()
	w_contract_data_design.uo_design.il_seqno = ll_select_screen_seq //Added By Jay Chen 01-03-2014
	w_contract_data_design.uo_design.ib_restore = true //Added By Jay Chen 01-02-2014
   	w_contract_data_design.uo_design.of_select_screen(currentrow, ll_screenid )
end if

if ll_ErrCnts <= 0 then
	MessageBox("Information","Batch restore screen syntax successfully!")
end if


end event

type cb_selectview from commandbutton within w_screenbatchupdate
integer x = 23
integer y = 1916
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All"
end type

event clicked;long		ll_Row,ll_Cycle,ll_Cnts,ll_data[]

ll_Row = dw_view_list.GetRow()

ll_Cnts = dw_view_list.RowCount()

if This.Text = "Select All" then
	for ll_Cycle = 1 to ll_Cnts
		ll_data[ll_Cycle] = 1
	next
	dw_view_list.Object.Selected.Primary = ll_data
	This.Text = "Deselect All"
else
	for ll_Cycle = 1 to ll_Cnts
		ll_data[ll_Cycle] = 0
	next
	dw_view_list.Object.Selected.Primary = ll_data
	This.Text = "Select All"
end if

dw_view_list.SetRow(ll_Row)

end event

type dw_screen_list from datawindow within w_screenbatchupdate
integer x = 1184
integer y = 248
integer width = 2117
integer height = 1640
integer taborder = 20
string dataobject = "d_screen_list_batch_restore"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;This.SetTransObject(SQLCA)
dw_screen_list.Retrieve()

end event

event clicked;This.SetRow(Row)

end event

type dw_view_list from datawindow within w_screenbatchupdate
integer x = 23
integer y = 248
integer width = 1138
integer height = 1640
integer taborder = 10
string dataobject = "d_all_view_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event constructor;This.SetTransObject(SQLCA)
This.Retrieve()

end event

event clicked;This.SetRow(Row)

end event

type cb_cb_selectscreen from commandbutton within w_screenbatchupdate
integer x = 1184
integer y = 1916
integer width = 343
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select All"
end type

event clicked;long		ll_Row,ll_Cycle,ll_Cnts,ll_data[]

ll_Row = dw_screen_list.GetRow()

ll_Cnts = dw_screen_list.RowCount()

if This.Text = "Select All" then
	for ll_Cycle = 1 to ll_Cnts
		ll_data[ll_Cycle] = 1
	next
	dw_screen_list.Object.Selected.Primary = ll_data
	This.Text = "Deselect All"
else
	for ll_Cycle = 1 to ll_Cnts
		ll_data[ll_Cycle] = 0
	next
	dw_screen_list.Object.Selected.Primary = ll_data
	This.Text = "Select All"
end if

dw_screen_list.SetRow(ll_Row)

end event

type cb_close from commandbutton within w_screenbatchupdate
integer x = 2962
integer y = 1916
integer width = 343
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;Close(Parent)

end event

type gb_1 from groupbox within w_screenbatchupdate
integer x = 23
integer y = 24
integer width = 3269
integer height = 200
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Batch Restore Datetime"
end type

