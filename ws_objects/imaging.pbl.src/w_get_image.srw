$PBExportHeader$w_get_image.srw
forward
global type w_get_image from window
end type
type st_1 from statictext within w_get_image
end type
type st_filename from statictext within w_get_image
end type
type cb_2 from commandbutton within w_get_image
end type
type cb_1 from commandbutton within w_get_image
end type
type ole_thumb from olecustomcontrol within w_get_image
end type
end forward

global type w_get_image from window
integer x = 27
integer y = 64
integer width = 3602
integer height = 1268
boolean titlebar = true
string title = "Select Image File"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79680469
st_1 st_1
st_filename st_filename
cb_2 cb_2
cb_1 cb_1
ole_thumb ole_thumb
end type
global w_get_image w_get_image

type variables
pfc_cst_u_imaging uo_image_object
String is_image_file_name
end variables

event open;String docname, named
String ls_file_name
integer value
n_getfilename ln_getfilename //Added By Jay Chen 08-15-2014

gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//value = GetFileOpenName("Select File", &
//+ docname, named, "TIF", &
//	+ "Tif Files (*.Tif),*.Tif," &
//	+ "Bmp Files (*.Bmp),*.Bmp," &
//	+ "jpg Files (*.jpg),*.jpg")  //maha app080905 additional image type
value = ln_getfilename.of_getopenfilename("Select File", &
+ docname, named, "TIF", &
	+ "Tif Files (*.Tif),*.Tif," &
	+ "Bmp Files (*.Bmp),*.Bmp," &
	+ "jpg Files (*.jpg),*.jpg") 
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value < 1 THEN
	CloseWithReturn( This, "Cancel" )
	Return -1
END IF

st_filename.Text = Docname

ole_thumb.object.Image( docname )	


//is_image_file_name = ole_thumb.object.Image(


ole_thumb.Object.ThumbSelected(1, True)
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17



end event

on w_get_image.create
this.st_1=create st_1
this.st_filename=create st_filename
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ole_thumb=create ole_thumb
this.Control[]={this.st_1,&
this.st_filename,&
this.cb_2,&
this.cb_1,&
this.ole_thumb}
end on

on w_get_image.destroy
destroy(this.st_1)
destroy(this.st_filename)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ole_thumb)
end on

type st_1 from statictext within w_get_image
integer x = 23
integer y = 16
integer width = 2885
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Note: Multiple pages may be selected, but they must be in sequential order from the first selected.  Use Control/Click to select multiple."
boolean focusrectangle = false
end type

type st_filename from statictext within w_get_image
integer x = 23
integer y = 1024
integer width = 2313
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_get_image
integer x = 2994
integer y = 1020
integer width = 265
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
boolean default = true
end type

event clicked;Integer li_start_page
Integer li_cr
Integer li_thumb_count
Integer i
Integer li_page_cnt
Integer li_page[]
Long ll_rec_id
Long ll_prac_id
Integer li_facility_id
Integer li_screen_id
Long ll_seq_no
Integer li_num_pages
String ls_image_file_name,ls_Rtn
Blob lb_the_image

li_thumb_count = ole_thumb.Object.ThumbCount()

FOR i = 1 TO li_thumb_count
	IF ole_thumb.Object.ThumbSelected( i ) = True THEN
		li_page_cnt++
		li_page[ li_page_cnt ] = i
	END IF
END FOR

IF li_page_cnt = 0 THEN
	MessageBox("Nothing Selected", "You must select at least one page from the image file.  To select a page click on the thumbnail image, To select multiple pages hold down the Control key and click on each thumbnail image you want to select." )
	Return
END IF

//messagebox("",uo_image_object.is_image_file_name)
IF IsValid( w_prac_data_intelliapp ) THEN
	uo_image_object = w_prac_data_intelliapp.tab_1.tabpage_image.uo_image
ELSE
	uo_image_object = w_prac_data_1.tab_1.tabpage_image.uo_image
END IF
	
//if storage is at the database level then do this
IF uo_image_object.ii_image_storage_type = 1 THEN
	FileDelete( gs_dir_path + gs_DefDirName + "\temp.tif" )
	uo_image_object.tab_view.tabpage_image.ole_scan_edit.Object.ClearDisplay(  ) 
	//set the image file name to temp.tif
	ls_image_file_name = gs_dir_path + gs_DefDirName + "\temp.tif"
	uo_image_object.is_image_file_name = ls_image_file_name
ELSE	
	ls_image_file_name = uo_image_object.is_image_file_name
END IF

//messagebox("", ls_image_file_name )
uo_image_object.tab_view.tabpage_setup.ole_admin1.object.Image( ls_image_file_name )

//Start Code Change ---- 06.13.2007 #V7 maha
IF uo_image_object.ii_image_storage_type = 1 THEN //in db
	li_start_page = 1
else // as files
	li_start_page = uo_image_object.tab_view.tabpage_setup.ole_admin1.object.PageCount( )
	li_start_page++
end if
//End Code Change---06.13.2007
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 07/09/2007 By: Ken.Guo
//$<reason> When Image Admin Merge(Append) file, The first image file must be in TIF format, Otherwise PB will runerror.
If uo_image_object.tab_view.tabpage_setup.ole_admin1.object.pagecount() > 0 and uo_image_object.tab_view.tabpage_setup.ole_admin1.object.FileType <> 1 Then
	Messagebox('Image','The first image file must be in "TIF" format.')
	Return -1			
End If
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$< Add  > 2008-07-15 By: Scofield
//$<Reason> Verify if the directory has write right for the current user.

ls_Rtn = f_ExaWriteRight(st_filename.Text)
if Len(ls_Rtn) > 0 then
	MessageBox(gnv_app.iapp_object.DisplayName,ls_Rtn,Exclamation!)
	Return -1
end if
//---------------------------- APPEON END ----------------------------

uo_image_object.tab_view.tabpage_setup.ole_admin1.object.Append( st_filename.Text, li_page[1] , li_page_cnt )			

li_cr = uo_image_object.tab_view.tabpage_setup.dw_image_data.GetRow( )

uo_image_object.tab_view.tabpage_setup.dw_image_data.SetItem( li_cr, "tif_start_page", li_start_page )
uo_image_object.tab_view.tabpage_setup.dw_image_data.SetItem( li_cr, "num_pages", li_page_cnt )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
uo_image_object.tab_view.tabpage_setup.dw_image_data.SetItem( li_cr, "de_queue", 1 )

//---------------------------- APPEON END ----------------------------

//uo_image_object.iw_parent_window.Event pfc_Save()//Start Code Change ---- 04.11.2007 #V7 maha removed because it caused an error



IF uo_image_object.ii_image_storage_type = 1 THEN
		uo_image_object.tab_view.tabpage_setup.dw_image_data.Update( )
		ll_rec_id = uo_image_object.tab_view.tabpage_setup.dw_image_data.GetItemNumber( li_cr , "rec_id" )
		ll_prac_id = uo_image_object.tab_view.tabpage_setup.dw_image_data.GetItemNumber( li_cr , "prac_id" )	
		li_facility_id = uo_image_object.tab_view.tabpage_setup.dw_image_data.GetItemNumber( li_cr , "facility_id" )	
		li_screen_id = uo_image_object.tab_view.tabpage_setup.dw_image_data.GetItemNumber( li_cr , "screen_id" )		
		ll_seq_no = uo_image_object.tab_view.tabpage_setup.dw_image_data.GetItemNumber( li_cr , "seq_no" )	
	
		//FileDelete( gs_dir_path + gs_DefDirName + "\split.tif" )
	
		//tab_view.tabpage_browse.ole_admin.object.Image( gs_dir_path + gs_DefDirName + "\split.tif" )

		//li_start_page = dw_image_data.GetItemNumber( i, "tif_start_page" ) 
		//li_num_pages =  dw_image_data.GetItemNumber( i, "num_pages" ) 
	
		//tab_view.tabpage_browse.ole_admin.object.Append( gs_dir_path + gs_DefDirName + "\temp.tif", li_start_page, li_num_pages  )
	
		lb_the_image = uo_image_object.inv_image_functions.of_read_image_file( gs_dir_path + gs_DefDirName + "\temp.tif" )
	//Start Code Change ---- 02.08.2007 #V7 maha added de queue update to statement
		UPDATEBLOB pd_images
		SET image_data = :lb_the_image
		WHERE rec_id = :ll_rec_id and
	   	   prac_id = :ll_prac_id and
				facility_id = :li_facility_id and
				seq_no = :ll_seq_no and
				screen_id = :li_screen_id			
		USING SQLCA;
	
		IF SQLCA.SQLNRows > 0 THEN
			COMMIT USING SQLCA ;
		ELSEIF SQLCA.SQLCODE = -1 THEN
			MessageBox( "SQL ERROR", SQLCA.SQLERRTEXT )
		ELSEIF SQLCA.SQLNRows = 0 THEN	
			MessageBox( "SQL Error", "No rows effected." )
		END IF
ELSE ///store as files //Start Code Change ---- 05.17.2007 #V7 maha   fix bug
	uo_image_object.tab_view.tabpage_setup.dw_image_data.Update( )
END IF


uo_image_object.tab_view.tabpage_browse.dw_browse.Retrieve( uo_image_object.il_prac_id ) //Start Code Change ---- 02.08.2007 #V7 maha  moved from before blob update 
uo_image_object.tab_view.tabpage_setup.dw_image_data.Reset()
uo_image_object.tab_view.tabpage_setup.dw_image_list.SetFocus()

Close( Parent )
end event

type cb_1 from commandbutton within w_get_image
integer x = 3291
integer y = 1020
integer width = 265
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;//CloseWithReturn( Parent, "Cancel" )
Close( Parent )//maha 052504
end event

type ole_thumb from olecustomcontrol within w_get_image
event click ( long thumbnumber )
event dblclick ( long thumbnumber )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y,  long thumbnumber )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y,  long thumbnumber )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y,  long thumbnumber )
event thumbdrop ( long insertbefore,  long dropcount,  integer shift )
event thumbdrag ( long dragcount,  integer shift )
event ocx_error ( integer number,  ref string description,  long scode,  string source,  string helpfile,  long helpcontext,  ref boolean canceldisplay )
event keydown ( ref integer keycode,  integer shift )
event keyup ( ref integer keycode,  integer shift )
event readystatechange ( long readystate )
integer x = 18
integer y = 96
integer width = 1317
integer height = 768
integer taborder = 10
borderstyle borderstyle = stylelowered!
string binarykey = "w_get_image.win"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

event doubleclicked;cb_2.event clicked()
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Fw_get_image.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Fw_get_image.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
