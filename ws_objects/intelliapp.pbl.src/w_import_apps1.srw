$PBExportHeader$w_import_apps1.srw
forward
global type w_import_apps1 from window
end type
type st_9 from statictext within w_import_apps1
end type
type st_8 from statictext within w_import_apps1
end type
type st_status1 from statictext within w_import_apps1
end type
type ole_edit from olecustomcontrol within w_import_apps1
end type
type st_7 from statictext within w_import_apps1
end type
type cb_4 from commandbutton within w_import_apps1
end type
type cb_1 from commandbutton within w_import_apps1
end type
type st_5 from statictext within w_import_apps1
end type
type st_4 from statictext within w_import_apps1
end type
type st_2 from statictext within w_import_apps1
end type
type cb_3 from commandbutton within w_import_apps1
end type
type st_3 from statictext within w_import_apps1
end type
type st_1 from statictext within w_import_apps1
end type
type dw_facility from datawindow within w_import_apps1
end type
type st_63 from statictext within w_import_apps1
end type
type st_status from statictext within w_import_apps1
end type
type dw_1 from datawindow within w_import_apps1
end type
type dw_2 from datawindow within w_import_apps1
end type
type cb_2 from commandbutton within w_import_apps1
end type
type st_6 from statictext within w_import_apps1
end type
type gb_3 from groupbox within w_import_apps1
end type
end forward

global type w_import_apps1 from window
integer x = 1056
integer y = 484
integer width = 2569
integer height = 1360
boolean titlebar = true
string title = "Import Applications"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
st_9 st_9
st_8 st_8
st_status1 st_status1
ole_edit ole_edit
st_7 st_7
cb_4 cb_4
cb_1 cb_1
st_5 st_5
st_4 st_4
st_2 st_2
cb_3 cb_3
st_3 st_3
st_1 st_1
dw_facility dw_facility
st_63 st_63
st_status st_status
dw_1 dw_1
dw_2 dw_2
cb_2 cb_2
st_6 st_6
gb_3 gb_3
end type
global w_import_apps1 w_import_apps1

type variables
String is_app_path
String is_app_path_only

end variables

forward prototypes
public function integer of_clear_annos (long ii_app_id)
end prototypes

public function integer of_clear_annos (long ii_app_id);String ls_group,ls_Rtn
String ls_label_data
String ls_field_description
String ls_object_type
String ls_field_type
String ls_lookup_link_type
String ls_group_nm
String ls_fld_desc
String ls_lookup_link_field
String ls_fld_display
String ls_font_type
Long ll_field_id
Long ll_table_id
Long li_field_len
long li_app_field_id //modified 071802 maha
String ls_fld_nm
String ls_tbl_nm
//n_ds ds_field_properties
long li_fld_cnt
Long li_x_pos
Long li_y_pos
Long li_fld_loop
Long li_prev_scrollY
Long li_prev_scrollX
Long li_cnt
Integer p
INTEGER LI_PAGE_CNT

li_page_cnt = ole_edit.Object.PageCount()

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-17 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(ole_edit.Object.Image)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return 0
end if
//---------------------------- APPEON END ----------------------------

FOR p = 1 TO li_page_cnt

	st_status.Text = "Clearing annotations from application " + String( ii_app_id ) + ".tif page " + String( p ) + " of " + String( li_page_cnt )

	IF p > ole_edit.Object.PageCount( ) THEN
		Continue
	END IF


	ole_edit.Object.Page( p )
	ole_edit.Object.Display()
	
	IF ole_edit.Object.PageType <> 1 THEN
		ole_edit.Object.ConvertPageType( 1 )
	END IF

	li_prev_scrollY = ole_edit.object.ScrollPositionY( )
	li_prev_scrollX = ole_edit.object.ScrollPositionX( )

	ole_edit.object.ScrollPositionX( 0 )		
	ole_edit.object.ScrollPositionY( 0 )			

	dw_2.SetFilter( "app_id = " + String( ii_app_id ) + " AND page = " + String(p) )
	dw_2.Filter( )

	li_fld_cnt = dw_2.RowCount( )

	FOR li_fld_loop = 1 TO li_fld_cnt
		ole_edit.object.Annotationtype(11)	
		ls_object_type = dw_2.GetItemString( li_fld_loop, "object_type" )
		li_app_field_id = dw_2.GetItemNumber( li_fld_loop, "app_field_id" )
		li_field_len = dw_2.GetItemNumber( li_fld_loop, "width" )
		li_x_pos = dw_2.GetItemNumber( li_fld_loop, "x_pos" )
		li_y_pos = dw_2.GetItemNumber( li_fld_loop, "y_pos" )
		ll_field_id = dw_2.GetItemNumber( li_fld_loop, "field_id" )	
		ll_table_id = dw_2.GetItemNumber( li_fld_loop, "table_id" )	
		ls_field_description = dw_2.GetItemString( li_fld_loop, "field_description" )	
		
		IF ll_table_id = 99 THEN
			CHOOSE CASE Upper( ls_field_description )
				CASE "TODAYS DATE"
					ole_edit.Object.DeleteAnnotationGroup( "SP-TODAYSDATE," + String( li_app_field_id ) )		
				CASE "CURRENT TIME"
					ole_edit.Object.DeleteAnnotationGroup( "SP-CURRENTTIME," + String( li_app_field_id ))				
				CASE "USER ID"
					ole_edit.Object.DeleteAnnotationGroup( "SP-USERID," + String( li_app_field_id ))		
			END CHOOSE
			ole_edit.object.Annotationtype(11)	
			IF Mid( Upper ( ls_field_description ), 1, 5 ) = "LABEL" THEN
				ls_label_data =  Mid( ls_field_description, 7, 100 ) 
				ls_group = "LABEL-" + Mid(ls_label_data, 1, 20 ) + ";" + String( li_app_field_id )
				ole_edit.Object.DeleteAnnotationGroup( ls_group )				 
			END IF
			ole_edit.object.Annotationtype(11)	
			ole_edit.object.AnnotationFontColor(255)
			ole_edit.object.Annotationtype(8)		
			CHOOSE CASE dw_2.GetItemNumber( li_fld_loop, "font_size" )
				CASE 1
					ole_edit.object.AnnotationFont.Name = "MS Serif"
					ole_edit.object.AnnotationFont.Size = 7
				CASE 2
					ole_edit.object.AnnotationFont.Name = "Times New Roman"
					ole_edit.object.AnnotationFont.Size = 8				
				CASE 3
					ole_edit.object.AnnotationFont.Name = "Times New Roman"
					ole_edit.object.AnnotationFont.Size = 12			
			END CHOOSE
			IF dw_2.GetItemNumber( li_fld_loop, "font_bold" ) = 1 THEN
				ole_edit.object.AnnotationFont.Bold = True
			ELSE
				ole_edit.object.AnnotationFont.Bold = False
			END IF
			CONTINUE
		END IF
	
	//w_train_app.st_field.Text = ls_tbl_nm + "->" + ls_fld_nm
	CHOOSE CASE ls_object_type
		CASE "T"
			//ls_field_type = dw_2.GetItemString( li_fld_loop, "sys_fields_field_type" )
			ls_lookup_link_type = dw_2.GetItemString( li_fld_loop, "lookup_link_type" )
			ls_lookup_link_field = dw_2.GetItemString( li_fld_loop, "lookup_link_field" )
			IF ls_lookup_link_type = "A" OR ls_lookup_link_type = "C" THEN
				ls_field_type = "C"			
			END IF
		CHOOSE CASE Upper( ls_field_type )
			CASE "C"
				ls_fld_display = Fill( "x", li_field_len )
			CASE "I"
				ls_fld_display = Fill( "#", li_field_len )				
			CASE "D"
				ls_fld_display = "mm/dd/yyyy"
			CASE "N"
				ls_fld_display = Fill( "#", li_field_len )								
		END CHOOSE
					
		ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) )
		ole_edit.object.Annotationtype(11)	
	CASE "B"
		ole_edit.Object.DeleteAnnotationGroup( dw_2.GetItemNumber( dw_2.GetRow(), "field_id" ) )
		ole_edit.object.Annotationtype(3)
		//ole_edit.object.Draw(li_x_pos, li_y_pos, 20,20)
		ole_edit.object.Annotationtype(11)			
	CASE "Y1"
		//yes box
		ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "YesBox")
		ole_edit.object.Annotationtype(3)
		ole_edit.object.AnnotationLineColor( 255 )		
		//ole_edit.object.Draw(li_x_pos, li_y_pos, 20,20)
		
		//no
		ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "NoBox")
		ole_edit.object.AnnotationLineColor( 0 )
		//ole_edit.object.Draw(li_x_pos + 30, li_y_pos, 20,20)		
		ole_edit.object.Annotationtype(11)					
	CASE "Y2"
		//yes box
		ole_edit.Object.DeleteAnnotationGroup( String(li_app_field_id) + "YesCheck")
		ole_edit.object.AnnotationStampText( "X" )
		ole_edit.object.Annotationtype(8)
		//ole_edit.object.Draw(li_x_pos, li_y_pos, 10,10)		
		ole_edit.object.Annotationtype(11)							
	CASE "C"		
		ole_edit.Object.DeleteAnnotationGroup( String( li_app_field_id ) + "Check" )
		ole_edit.object.AnnotationStampText( "X" )
		ole_edit.object.Annotationtype(8)
		CHOOSE CASE dw_2.GetItemNumber( li_fld_loop, "font_size" )
			CASE 1
				ole_edit.object.AnnotationFont.Name = "MS Serif"
				ole_edit.object.AnnotationFont.Size = 7
			CASE 2
				ole_edit.object.AnnotationFont.Name = "Times New Roman"
				ole_edit.object.AnnotationFont.Size = 8				
			CASE 3
				ole_edit.object.AnnotationFont.Name = "Times New Roman"
				ole_edit.object.AnnotationFont.Size = 12
		END CHOOSE
	END CHOOSE
END FOR
	ole_edit.Object.Save()
END FOR




ole_edit.object.ScrollPositionX( li_prev_scrollX )		
ole_edit.object.ScrollPositionY( li_prev_scrollY )			
ole_edit.object.Annotationtype(11)		

dw_2.SetFilter( "" )
dw_2.Filter( )

Return 0
end function

event open;
SQLCA.DBMS="ODBC"
SQLCA.DBParm = "ConnectString='DSN=IntelliCred Client;UID=DBA;PWD=SQL',DelimitIdentifier='Yes'"

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2007-09-14 By: Scofield
//$<Reason> Set the connection cache dynamically on Web
if AppeonGetClientType() = 'WEB' then
	SQLCA.DBMS = gs_CacheType
	SQLCA.DBParm = gs_CacheSet
end if
//---------------------------- APPEON END ----------------------------

CONNECT USING SQLCA;

IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Login", "Inital Login Failed!  Check your ODBC configuration")
	Return -1
END IF


dw_1.SetTransObject( sqlca )
dw_2.SetTransObject( sqlca )

dw_facility.SetTransObject( sqlca )
dw_facility.InsertRow( 1 )

SELECT ids.intelliapp_app_path
INTO :is_app_path  
FROM ids  ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Login", "Inital Login Failed!  Check your ODBC configuration")
	Return -1
END IF

IF Len( is_app_path ) = 0 THEN
	MessageBox("Application Path", "You must first set your application image path before using the Import utility.  Select File->Set Image Path in Application Mapping Utility to set you path." )
END IF

IF Right( is_app_path, 1 ) <> "\" THEN
	is_app_path = is_app_path + "\"
END IF

is_app_path_only = is_app_path

//is_app_path = is_app_path + "intelliapps.exe"

//ClipBoard( is_app_path )

//st_path.Text = is_app_path
//st_path1.Text = is_app_path
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

on w_import_apps1.create
this.st_9=create st_9
this.st_8=create st_8
this.st_status1=create st_status1
this.ole_edit=create ole_edit
this.st_7=create st_7
this.cb_4=create cb_4
this.cb_1=create cb_1
this.st_5=create st_5
this.st_4=create st_4
this.st_2=create st_2
this.cb_3=create cb_3
this.st_3=create st_3
this.st_1=create st_1
this.dw_facility=create dw_facility
this.st_63=create st_63
this.st_status=create st_status
this.dw_1=create dw_1
this.dw_2=create dw_2
this.cb_2=create cb_2
this.st_6=create st_6
this.gb_3=create gb_3
this.Control[]={this.st_9,&
this.st_8,&
this.st_status1,&
this.ole_edit,&
this.st_7,&
this.cb_4,&
this.cb_1,&
this.st_5,&
this.st_4,&
this.st_2,&
this.cb_3,&
this.st_3,&
this.st_1,&
this.dw_facility,&
this.st_63,&
this.st_status,&
this.dw_1,&
this.dw_2,&
this.cb_2,&
this.st_6,&
this.gb_3}
end on

on w_import_apps1.destroy
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_status1)
destroy(this.ole_edit)
destroy(this.st_7)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.cb_3)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.dw_facility)
destroy(this.st_63)
destroy(this.st_status)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.cb_2)
destroy(this.st_6)
destroy(this.gb_3)
end on

type st_9 from statictext within w_import_apps1
integer x = 782
integer y = 1128
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type st_8 from statictext within w_import_apps1
integer x = 142
integer y = 1084
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Not "
boolean focusrectangle = false
end type

type st_status1 from statictext within w_import_apps1
integer x = 41
integer y = 1072
integer width = 2327
integer height = 68
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

type ole_edit from olecustomcontrol within w_import_apps1
event keydown ( ref integer keycode,  integer shift )
event keyup ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event click ( )
event dblclick ( )
event ocx_error ( integer number,  ref string description,  long scode,  string source,  string helpfile,  long helpcontext,  ref boolean canceldisplay )
event ocx_close ( )
event markend ( long left,  long top,  long ocx_width,  long ocx_height,  integer marktype,  string groupname )
event toolselected ( integer toolid )
event selectionrectdrawn ( long left,  long top,  long ocx_width,  long ocx_height )
event tooltip ( integer index )
event toolpalettehidden ( long left,  long top )
event scroll ( )
event markselect ( integer button,  integer shift,  long left,  long top,  long ocx_width,  long ocx_height,  integer marktype,  string groupname )
event pastecompleted ( )
event load ( double zoom )
event markmove ( integer marktype,  string groupname )
event pagepropertiesclose ( )
event checkcontinueprinting ( long pagesprinted,  long currentpage,  integer status )
event hyperlinkgotopage ( long page )
event errorsavingundoinformation ( long ocx_error )
event straightenpage ( )
event hyperlinkgotodoc ( string link,  long page,  ref boolean handled )
event editingtextannotation ( boolean editing )
event magnifierstatus ( integer hwnd,  long status,  long magnifierzoom,  long left,  long top,  long ocx_width,  long ocx_height )
event pasteclip ( ref long mode )
event baddocumentfiletype ( long page,  ref boolean errorout,  ref boolean skippage,  ref boolean overwritepage )
event nextpage ( )
event prevpage ( )
event overlayfilenotfound ( ref string overlayfilename,  ref boolean btryagain )
event imagedraganddrop ( )
event zoomchanged ( real zoom )
event beforemarkmove ( ref boolean bcancelmove )
event readystatechange ( long readystate )
integer x = 224
integer y = 1320
integer width = 987
integer height = 640
integer taborder = 50
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
string binarykey = "w_import_apps1.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_7 from statictext within w_import_apps1
integer x = 69
integer y = 532
integer width = 2240
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "3) Follow the directions on the web page to download the applications."
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_import_apps1
integer x = 992
integer y = 908
integer width = 475
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Go to web site"
end type

event clicked;
//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06.23.2006 By: Liang QingShi
//$<reason>  GetContextService is currently unsupported. 
//$<modification> Replace GetContextService with ShellExecuteA to provide the
//$<modification> same functionality.
/*
Inet  iinet_base

GetContextService("Internet", iinet_base)

//messagebox("", "http://intellisoftgroup.com/intelliapp/apps.cfm?path=" + is_app_path )

iinet_base.HyperlinkToURL("http://intellisoftgroup.com/intelliapp/apps.cfm?path=" + is_app_path)
*/
String ls_url,ls_null
setnull(ls_null)
ls_url = "http://intellisoftgroup.com/intelliapp/apps.cfm?path=" + is_app_path
ShellExecuteA ( Handle( This ), "open", 'IEXPLORE', ls_url , ls_Null, 4)

//---------------------------- APPEON END ----------------------------

//iinet_base.HyperlinkToURL("http://10.10.10.2/intelliapp/apps.cfm?path=" + is_app_path_only)
end event

type cb_1 from commandbutton within w_import_apps1
integer x = 1477
integer y = 908
integer width = 475
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Import Applications"
end type

event clicked;debugbreak()

IF IsNull( dw_facility.GetItemNumber( 1, "facility_id" )) THEN
	MessageBox("Select Error", "You must select an organization to import under." )
	Return -1
END IF


st_status.Text = "Starting import."

Long ll_field_id
String ls_from
String ls_to
string ls_hdr_file, named
String ls_orig_dir
string ls_drive, ls_field_prop_file
String ls_app_path
Long value, i, li_rc, li_app_id, li_cnt, li_rows, li_num_apps
Long li_next_app_id
Long li_fld_rc
Long f
Long li_find
Long ll_next_field_id
Integer li_facility_id


dw_facility.AcceptText( )
li_facility_id = Integer( dw_facility.GetText() )

SELECT ids.intelliapp_app_path  
INTO :ls_app_path  
FROM ids  ;

ls_orig_dir = ls_app_path




IF Right( ls_app_path, 1 ) <> "\" THEN
	ls_app_path = ls_app_path + "\"
END IF

String ls_temp_path
String ls_dir[]
Integer li_start
Integer li_dir_cnt

ls_temp_path = ls_app_path
li_start = 1
DO WHILE Len( ls_temp_path ) > 0 
	li_dir_cnt++
	li_start = POS( ls_temp_path, "\" )
	IF li_start > 0 THEN
		ls_dir[ li_dir_cnt ] = Mid( ls_temp_path, 1, li_start )
		IF li_start > 8 THEN
			ls_dir[ li_dir_cnt ] = Mid( ls_dir[li_dir_cnt], 1, 6 ) + "~~1" + "\"
		END IF
	ELSE
		ls_dir[ li_dir_cnt ] = ls_temp_path
	END IF
	ls_temp_path = Mid( ls_temp_path, li_start + 1,  1000 )
LOOP

ls_app_path = ""
FOR i = 1 TO upperbound( ls_dir)
	ls_app_path = ls_app_path + ls_dir[ i ]
END FOR

IF NOT FileExists( ls_orig_dir + "app_hdr.txt" ) THEN
	MessageBox("", "Can't find file app_hdr.txt.  Did you go to web site and download applications?" )
	Return -1	
END IF

li_cnt = 0
li_rows = dw_1.ImportFile( ls_orig_dir + "app_hdr.txt" )
li_num_apps = li_rows
IF li_rows < 0 THEN
	MessageBox("Import failed", "Can't find file app_hdr.txt!" )
	Return -1
END IF

IF NOT FileExists( ls_orig_dir + "app_fld_prop.txt" ) THEN
	MessageBox("", "Error copying app_fld_prop.txt file" )
	Return -1
END IF

st_status.Text = "Importing Field Data"

li_rows = dw_2.ImportFile( ls_orig_dir + "app_fld_prop.txt" )
IF li_rows < 0 THEN
	MessageBox("Import failed", "ImportFile app_fld_prop.txt failed!" )
	Return -1
END IF


li_rc = dw_1.RowCount( )
li_fld_rc = dw_2.RowCount( )

SELECT Max( app_id ) 
INTO :li_next_app_id
FROM app_hdr;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Error 2", SQLCA.SQLERRTEXT )
END IF
IF IsNull( li_next_app_id ) THEN
	li_next_app_id = 1
END IF

SELECT Max( app_field_id ) 
INTO :ll_next_field_id
FROM app_field_prop;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Error 2", SQLCA.SQLERRTEXT )
END IF
IF IsNull( ll_next_field_id ) THEN
	ll_next_field_id = 1
END IF





FOR i = 1 TO li_rc
	
	li_next_app_id++
	
	st_status1.Text = "Importing Data For Application " + String( i ) + " of " + String( li_rc )
	
	li_app_id = dw_1.GetItemNumber( i, "app_id" )
	
	ole_edit.Object.Image( is_app_path + String( li_app_id ) + ".tif" )
	of_clear_annos( li_app_id )
	
	DO WHILE TRUE
		li_find = dw_1.Find( "app_id = " + String( li_next_app_id ), 1, 9999 )
		IF li_find > 0 THEN
			li_next_app_id++
		ELSE
			EXIT
		END IF
	LOOP

	ls_from = ls_app_path + String( li_app_id ) + ".tif"
	ls_to =   ls_app_path + String( li_next_app_id) + ".tif"
	CopyFileA( ls_from , ls_to , true )

	//FileWrite( i_FileNum, "Rename " + String( li_app_id ) + ".tif " + String( li_next_app_id ) + ".tif" )

	dw_1.SetItem( i, "app_id", li_next_app_id )
	dw_1.SetItem( i, "facility_id", li_facility_id )

	dw_2.SetFilter( "app_id = " + String( li_app_id ) )
	dw_2.Filter( )
	li_fld_rc = dw_2.RowCount()
	FOR f = 1 TO li_fld_rc
		dw_2.SetItem( f, "app_id", li_next_app_id )		
	END FOR
	
END FOR

dw_2.SetFilter( "" )
dw_2.Filter( )
li_fld_rc = dw_2.RowCount()


	
	
//update app fields
SELECT Max( app_field_id ) 
INTO :ll_next_field_id
FROM app_field_prop;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox("Error 2", SQLCA.SQLERRTEXT )
END IF
IF IsNull( ll_next_field_id ) THEN
	ll_next_field_id = 1
END IF

FOR i = 1 TO li_fld_rc
	ll_next_field_id++
	dw_2.SetItem( i, "app_field_id", ll_next_field_id )	
END FOR

IF dw_1.Update() = -1 THEN
	MessageBox("Failed" , "Update Failed dw_1" )
	Return -1
END IF

IF dw_2.Update() = -1 THEN
	MessageBox("Failed" , "Update Failed dw_2" )
	Return -1
END IF

commit using sqlca;

st_status.Text = String ( li_num_apps ) + " credentialing applications imported."

FileDelete( ls_app_path + "app_hdr.txt" )
FileDelete( ls_app_path + "app_fld_prop.txt" )

//RUN( "rt.bat", Maximized! )
end event

type st_5 from statictext within w_import_apps1
integer x = 69
integer y = 440
integer width = 2240
integer height = 72
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "2) Click on the Go To Web Site button to search for the application to download."
boolean focusrectangle = false
end type

type st_4 from statictext within w_import_apps1
integer x = 133
integer y = 676
integer width = 2290
integer height = 92
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Your application are now imported into the IntelliApp for Windows System."
boolean focusrectangle = false
end type

type st_2 from statictext within w_import_apps1
integer x = 69
integer y = 608
integer width = 2290
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "4) Click on the Import Applications Button below."
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_import_apps1
boolean visible = false
integer x = 997
integer y = 1724
integer width = 521
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Extract Zip File"
end type

event clicked;String ls_app_path
String k

SELECT ids.intelliapp_app_path  
INTO :ls_app_path  
FROM ids  ;

IF Right( ls_app_path, 1 ) <> "\" THEN
	ls_app_path = ls_app_path + "\"
END IF

RUN( ls_app_path + "intelliapps.exe" )
end event

type st_3 from statictext within w_import_apps1
integer x = 41
integer y = 860
integer width = 914
integer height = 52
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Select Organization To Import Under"
boolean focusrectangle = false
end type

type st_1 from statictext within w_import_apps1
integer x = 69
integer y = 352
integer width = 2240
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "1) Select the Organization that you want the imported applications to reside under."
boolean focusrectangle = false
end type

type dw_facility from datawindow within w_import_apps1
integer x = 27
integer y = 908
integer width = 951
integer height = 100
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_select_app_facility"
boolean border = false
boolean livescroll = true
end type

type st_63 from statictext within w_import_apps1
integer x = 50
integer y = 100
integer width = 2437
integer height = 84
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Click on the Go To Web Site button below."
boolean focusrectangle = false
end type

type st_status from statictext within w_import_apps1
integer x = 41
integer y = 1136
integer width = 2327
integer height = 68
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

type dw_1 from datawindow within w_import_apps1
integer x = 73
integer y = 1724
integer width = 2226
integer height = 340
integer taborder = 80
string dataobject = "d_imp_app_hdr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_import_apps1
integer x = 73
integer y = 2080
integer width = 2217
integer height = 360
integer taborder = 90
string dataobject = "d_imp_field_prop"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_import_apps1
integer x = 1961
integer y = 908
integer width = 475
integer height = 100
integer taborder = 40
boolean bringtotop = true
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

type st_6 from statictext within w_import_apps1
integer x = 50
integer y = 36
integer width = 2373
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "To view a complete list of applications that are currently available from ContractLogix Group Inc."
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_import_apps1
integer x = 37
integer y = 276
integer width = 2414
integer height = 500
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 67108864
string text = "Import Mapped Credentailing Applications"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cw_import_apps1.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cw_import_apps1.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
