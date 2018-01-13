$PBExportHeader$w_area_painter.srw
forward
global type w_area_painter from window
end type
type cb_import_missing from commandbutton within w_area_painter
end type
type cb_2 from commandbutton within w_area_painter
end type
type cb_1 from commandbutton within w_area_painter
end type
type cb_selectall from commandbutton within w_area_painter
end type
type cb_editarea from commandbutton within w_area_painter
end type
type cb_deldoc from commandbutton within w_area_painter
end type
type cb_exit from commandbutton within w_area_painter
end type
type cb_delarea from commandbutton within w_area_painter
end type
type cb_copyarea from commandbutton within w_area_painter
end type
type cb_addarea from commandbutton within w_area_painter
end type
type cb_copydoc from commandbutton within w_area_painter
end type
type cb_savedoc from commandbutton within w_area_painter
end type
type cb_viewdoc from commandbutton within w_area_painter
end type
type cb_adddoc from commandbutton within w_area_painter
end type
type dw_storage_docs from datawindow within w_area_painter
end type
type dw_storage_area from datawindow within w_area_painter
end type
end forward

global type w_area_painter from window
integer width = 3611
integer height = 2328
boolean titlebar = true
string title = "Letter Storage Area Painter"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_import_missing cb_import_missing
cb_2 cb_2
cb_1 cb_1
cb_selectall cb_selectall
cb_editarea cb_editarea
cb_deldoc cb_deldoc
cb_exit cb_exit
cb_delarea cb_delarea
cb_copyarea cb_copyarea
cb_addarea cb_addarea
cb_copydoc cb_copydoc
cb_savedoc cb_savedoc
cb_viewdoc cb_viewdoc
cb_adddoc cb_adddoc
dw_storage_docs dw_storage_docs
dw_storage_area dw_storage_area
end type
global w_area_painter w_area_painter

type variables
Long il_area_id
end variables

forward prototypes
public subroutine of_security ()
public function string of_get_import_path ()
end prototypes

public subroutine of_security ();//////////////////////////////////////////////////////////////////////
// $<function>w_area_painter.of_security()
// $<arguments> (none)
// $<returns>   (none)
// $<description> Check the rights
//////////////////////////////////////////////////////////////////////
// $<add> 06.07.2006 by Rodger Wu
//////////////////////////////////////////////////////////////////////
integer li_rightvalue
li_rightvalue = w_mdi.of_security_access(5010)

if li_rightvalue < 2  then
	cb_addarea.Enabled = False
	cb_editarea.Enabled = False
	cb_copyarea.Enabled = False
	cb_delarea.Enabled = False
	
	cb_adddoc.Enabled = False
	cb_viewdoc.Enabled = False
	cb_savedoc.Enabled = False
	cb_copydoc.Enabled = False
	cb_deldoc.Enabled = False
end if
end subroutine

public function string of_get_import_path ();//Start Code Change ---- 11.29.2006 #V7 maha function added
String ls_doc_name
String ls_doc_type
string docname, named
integer value
//Start Code Change ---- 11.29.2006 #V7 maha
//value = GetFileOpenName("Select Any File in the Search directory",&
//+ docname, named, "DOC", &
//	+ "Doc Files (*.DOC),*.DOC")
//	
//IF value = 1 THEN
//	ls_doc_name = mid(docname,1, len(docname) - len(named) )
//	//messagebox(named,ls_doc_name)
//	return ls_doc_name
//else
//	return "CANCEL"
//END IF

ls_doc_name = dw_storage_area.getitemstring( dw_storage_area.getrow()  , "area_doc_path")
value = getfolder("Select Folder where letters exist.",ls_doc_name)
IF value = 1 THEN
	ls_doc_name += "\"  //Start Code Change ----03.20.2008 #V8 maha
	return ls_doc_name //Start Code Change ----04.21.2008 #V8 maha - moved below previous line
else
	return "CANCEL"
END IF
//End Code Change ---- 12.05.2006 #V7 maha
end function

on w_area_painter.create
this.cb_import_missing=create cb_import_missing
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_selectall=create cb_selectall
this.cb_editarea=create cb_editarea
this.cb_deldoc=create cb_deldoc
this.cb_exit=create cb_exit
this.cb_delarea=create cb_delarea
this.cb_copyarea=create cb_copyarea
this.cb_addarea=create cb_addarea
this.cb_copydoc=create cb_copydoc
this.cb_savedoc=create cb_savedoc
this.cb_viewdoc=create cb_viewdoc
this.cb_adddoc=create cb_adddoc
this.dw_storage_docs=create dw_storage_docs
this.dw_storage_area=create dw_storage_area
this.Control[]={this.cb_import_missing,&
this.cb_2,&
this.cb_1,&
this.cb_selectall,&
this.cb_editarea,&
this.cb_deldoc,&
this.cb_exit,&
this.cb_delarea,&
this.cb_copyarea,&
this.cb_addarea,&
this.cb_copydoc,&
this.cb_savedoc,&
this.cb_viewdoc,&
this.cb_adddoc,&
this.dw_storage_docs,&
this.dw_storage_area}
end on

on w_area_painter.destroy
destroy(this.cb_import_missing)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_selectall)
destroy(this.cb_editarea)
destroy(this.cb_deldoc)
destroy(this.cb_exit)
destroy(this.cb_delarea)
destroy(this.cb_copyarea)
destroy(this.cb_addarea)
destroy(this.cb_copydoc)
destroy(this.cb_savedoc)
destroy(this.cb_viewdoc)
destroy(this.cb_adddoc)
destroy(this.dw_storage_docs)
destroy(this.dw_storage_area)
end on

event open;string ls_parm
integer li_areaid
Long ll_found

ls_parm = Message.StringParm

dw_storage_area.Settransobject( SQLCA )
dw_storage_docs.Settransobject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09.26.2006 By: LeiWei
//$<reason> Requirement modify for Contract Logix.
IF gb_contract_version THEN
	String ls_filter
	ls_filter = "left(lower(doc_name),5) <> 'case_' and left(lower(doc_name),4) <> 'ind_' and left(lower(doc_name),15) <> 'mailing_labels_'"
	dw_storage_docs.Setfilter( ls_filter )
	//Start Code Change ---- 11.29.2006 #V7 maha
	cb_addarea.visible = false
	cb_copyarea.visible = false
	cb_delarea.visible = false
	//End Code Change---11.29.2006
END IF
//---------------------------- APPEON END ----------------------------

dw_storage_area.Retrieve()

//Start Code Change ---- 12.07.2006 #V7 maha
if dw_storage_area.rowcount( ) = 0 then
	dw_storage_area.insertrow(1)
	dw_storage_area.setitem(1,"Area_id",1)
	dw_storage_area.setitem(1,"Area_name","Area 1")
	dw_storage_area.setitem(1,"Area_doc_path",gs_dir_path + gs_DefDirName + "\letters\standard\")
	dw_storage_area.update( )
	//
	il_area_id = dw_storage_area.GetItemNumber( dw_storage_area.getrow(), "area_id" )
end if
//End Code Change---12.07.2006

if ls_parm <> '' then
	if right( ls_parm, 5 ) = "@path" then//locate area;
		ll_found = dw_storage_area.Find( "area_id = " + left( ls_parm, Len( ls_parm) - 5 ), 1, dw_storage_area.rowcount() )
		if ll_found > 0 then
			dw_storage_area.Trigger Event rowfocuschanged( ll_found )
		end if
	else//locate document;
		select top 1 area_id into :li_areaid from sys_storage_docs where doc_name = :ls_parm;
		if SQLCA.SQLCode = 0 then
			if li_areaid > 0 then
				ll_found = dw_storage_area.Find( "area_id = " + string( li_areaid ), 1, dw_storage_area.rowcount() )
				if ll_found > 0 then
					dw_storage_area.Trigger Event rowfocuschanged( ll_found )
					ll_found = dw_storage_docs.Find( "doc_name = '" + ls_parm + "'", 1, dw_storage_docs.rowcount() )
					if ll_found > 0 then
						dw_storage_docs.Post Event rowfocuschanged( ll_found )
						dw_storage_docs.ScrolltoRow( ll_found )
					end if
				end if
			end if
		end if
	end if
end if

of_security()
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_import_missing from commandbutton within w_area_painter
integer x = 46
integer y = 508
integer width = 768
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Import Missing Documents"
end type

event clicked;Integer li_ans
integer r
integer rc
integer cnt
integer badcnt
Long ll_row
Long ll_area_id
string ls_path
string ls_file
string ls_doc_name
n_appeon_storage_area lnv_storage_area
		

ll_row = dw_storage_area.GetSelectedrow( 0 )
IF ll_row = 0 THEN RETURN
rc = dw_storage_docs.rowcount()
if rc = 0 then return

li_ans = MessageBox("Import Documents", "This function will search for documents that were not imported to the database when the letter records were created.  It will not create new records.  Do you wish to continue?.", Question!, YesNo!, 1 )
IF li_ans = 1 THEN
	ls_path = of_get_import_path( )
	ll_area_id = dw_storage_area.GetItemNumber(ll_row, "area_id")
	if ls_path  = "CANCEL" then return
	for r = 1 to rc
		if dw_storage_docs.getitemnumber(r,"dsize") > 0 then 
			continue
		else
			ls_doc_name = dw_storage_docs.getitemstring(r,"doc_name") 
			ls_file = ls_path + ls_doc_name
			if fileexists(ls_file) then
				lnv_storage_area.of_upload_file( ll_area_id, ls_doc_name, ls_file)
				cnt ++
			else
				badcnt++
			end if
		end if
	next
	messagebox("Imported","There were " + string(cnt) + " files imported and " + string(badcnt) + " files not found.")
	dw_storage_docs.retrieve(ll_area_id)
END IF

end event

type cb_2 from commandbutton within w_area_painter
integer x = 46
integer y = 628
integer width = 768
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Document Edit Help"
end type

event clicked;string ls_mess

ls_mess = " To update an existing letter in the system:~r~r"
ls_mess += "A) Select the letter you wish to modify, and click View Doc to open it.~r"
ls_mess += "B) Modify your letter as desired, and save it.  Do not change the file name.~r"
ls_mess += "C) Click the Update Doc button.~r"
ls_mess += "D) In the update screen, click the Select Document button, and select the letter.~r"
ls_mess += "E) Click Save to upload the modified document to the database."


	
//li_ans = MessageBox("Delete Row", "Are you sure you want to delete selected storage area?  All documents connected to this storage area will also be deleted.", Question!, YesNo!, 1 )
MessageBox("Update Document Help", ls_mess )



end event

type cb_1 from commandbutton within w_area_painter
integer x = 1193
integer y = 24
integer width = 325
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sor&t"
end type

event clicked;string null_str

SetNull(null_str)
dw_storage_docs.SetSort(null_str)
dw_storage_docs.Sort( )
end event

type cb_selectall from commandbutton within w_area_painter
integer x = 864
integer y = 24
integer width = 325
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Select All"
end type

event clicked;Long i

IF dw_storage_docs.rowcount() = 0 THEN RETURN

IF THIS.text = "&Select All" THEN
	dw_storage_docs.SetRedraw(False)
	FOR i = 1 to dw_storage_docs.rowcount()
		dw_storage_docs.setitem(i,"selected",1)
	END FOR
	dw_storage_docs.SetRedraw(True)
	THIS.text = "&Unselect All"
ELSE
	dw_storage_docs.SetRedraw(False)
	FOR i = 1 to dw_storage_docs.rowcount()
		dw_storage_docs.setitem(i,"selected",0)
	END FOR
	dw_storage_docs.SetRedraw(True)
	THIS.text = "&Select All"
END IF
end event

type cb_editarea from commandbutton within w_area_painter
integer x = 46
integer y = 24
integer width = 768
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Edit Storage Area"
end type

event clicked;Long ll_row
Long ll_area_id

if this.Enabled = False then return;

ll_row = dw_storage_area.GetSelectedrow( 0 )
IF ll_row = 0 THEN RETURN
	
ll_area_id = dw_storage_area.GetItemNumber(ll_row, "area_id")

OPENWITHPARM( w_storage_area, ll_area_id )

IF Message.Doubleparm = 100 THEN
	dw_storage_area.Reset( )
	dw_storage_area.Retrieve( )
END IF
end event

type cb_deldoc from commandbutton within w_area_painter
integer x = 2839
integer y = 24
integer width = 325
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Delete Doc"
end type

event clicked;Integer li_ans
Long ll_row
Long ll_area_id
String ls_doc_names[]
Integer li_doc_name
Integer li_selected
string ls_doc_name

FOR ll_row = 1 TO dw_storage_docs.Rowcount( )
	li_selected = dw_storage_docs.GetitemNumber(ll_row, "selected")
	IF li_selected = 1 THEN
		li_doc_name++
		ls_doc_name = dw_storage_docs.GetItemString(ll_row, "doc_name")
		ls_doc_names[li_doc_name] = ls_doc_name
	END IF
END FOR

IF li_doc_name = 0 THEN
	Messagebox("Delete document","Please select a document to delete.")
	RETURN
END IF

//li_ans = MessageBox("Delete document", "Are you sure you want to delete selected row?", Question!, YesNo!, 1 )
li_ans = MessageBox("Delete document", "Are you sure you want to delete the selected row?", Question!, YesNo!, 1 )
IF li_ans = 1 THEN
	
	gnv_appeondb.of_startqueue( )
	
	FOR ll_row = 1 TO li_doc_name
		ls_doc_name = ls_doc_names[ll_row]
		
		Delete From sys_storage_docs
		Where area_id = :il_area_id
		And doc_name = :ls_doc_name;
		
	END FOR
	
	COMMIT;
	
	//dw_storage_docs.Retrieve( il_area_id )		//Move it to after Queue sentence,because it will cause the compute column error on Web
	
	gnv_appeondb.of_commitqueue( )
	
	dw_storage_docs.Retrieve( il_area_id )			//Modify by scofield on 2007-08-16

	IF dw_storage_docs.Rowcount( ) > 0 THEN
		dw_storage_docs.Selectrow( 0 , FALSE)
		dw_storage_docs.Selectrow( 1 , TRUE)
		dw_storage_docs.SetRow( 1 )
		dw_storage_docs.ScrollToRow( 1 )
	End IF
END IF

end event

type cb_exit from commandbutton within w_area_painter
integer x = 3209
integer y = 24
integer width = 325
integer height = 84
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close ( Parent )
end event

type cb_delarea from commandbutton within w_area_painter
integer x = 46
integer y = 392
integer width = 768
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete Stora&ge Area"
end type

event clicked;Integer li_ans
Long ll_row
Long ll_area_id

ll_row = dw_storage_area.GetSelectedrow( 0 )
IF ll_row = 0 THEN RETURN
	
//li_ans = MessageBox("Delete Row", "Are you sure you want to delete selected storage area?  All documents connected to this storage area will also be deleted.", Question!, YesNo!, 1 )
li_ans = MessageBox("Delete Row", "Are you sure you want to delete the selected storage area?  All documents connected to this storage area will also be deleted.", Question!, YesNo!, 1 )
IF li_ans = 1 THEN
	
	ll_area_id = dw_storage_area.GetItemNumber(ll_row, "area_id")
	IF ll_area_id > 0 THEN
		gnv_appeondb.of_startqueue( )
		
		Delete From sys_storage_docs Where area_id = :ll_area_id;
		Delete From sys_storage_area Where area_id = :ll_area_id;
		COMMIT;
		
		dw_storage_docs.Reset( )
		
		dw_storage_area.Reset( )
		dw_storage_area.Retrieve( )

		gnv_appeondb.of_commitqueue( )
	END IF
END IF

end event

type cb_copyarea from commandbutton within w_area_painter
integer x = 46
integer y = 276
integer width = 768
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Copy Sto&rage Area"
end type

event clicked;long ll_area_id
Long ll_row
Long ll_select_area_id

ll_row = dw_storage_area.GetSelectedrow( 0 )
IF ll_row = 0 THEN
	Messagebox("Copy storage area","Please select a storage area to copy from.")
	RETURN
END IF

IF Messagebox("Copy storage area","This function will copy ALL documents in the selected storage area to another storage area.  Continue?",question!,yesno!,2) = 2 THEN RETURN

ll_area_id = dw_storage_area.GetItemNumber(ll_row, "area_id")

open(w_select_storage_area)

ll_select_area_id = message.doubleparm
if ll_select_area_id = 0 then return
if ll_select_area_id = ll_area_id then return

// Copy the Document to other Area
Delete From sys_storage_docs
Where area_id = :ll_select_area_id
And doc_name IN (
	Select doc_name From sys_storage_docs 
	Where area_id = :ll_area_id
);
Insert Into sys_storage_docs(area_id, doc_name, doc_type, doc_data, last_edit_date, user_id)
Select :ll_select_area_id, doc_name, doc_type, doc_data, getdate(), :gs_user_id
From sys_storage_docs
Where area_id = :ll_area_id;

IF SQLCA.SQLCODE = -1 THEN
	ROLLBACK;
	MessageBox( "SQL ERROR", SQLCA.SQLERRTEXT )
	Return -1
END IF

COMMIT;

MessageBox( "Copy document", "Completed!" )

end event

type cb_addarea from commandbutton within w_area_painter
integer x = 46
integer y = 152
integer width = 768
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add St&orage Area"
end type

event clicked;OPEN( w_storage_area )

IF Message.Doubleparm = 100 THEN
	dw_storage_area.Reset( )
	dw_storage_area.Retrieve( )
END IF
end event

type cb_copydoc from commandbutton within w_area_painter
integer x = 2510
integer y = 24
integer width = 325
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Co&py Doc"
end type

event clicked;n_appeon_storage_area lnv_storage_area
Long ll_row
Long ll_select_area_id
String ls_doc_name
String ls_doc_path
String ls_full_name
Integer li_rtn
String ls_doc_names[]
Integer li_doc_name
Integer li_selected

FOR ll_row = 1 TO dw_storage_docs.Rowcount( )
	li_selected = dw_storage_docs.GetitemNumber(ll_row, "selected")
	IF li_selected = 1 THEN
		li_doc_name++
		ls_doc_name = dw_storage_docs.GetItemString(ll_row, "doc_name")
		ls_doc_names[li_doc_name] = ls_doc_name
	END IF
END FOR

IF li_doc_name = 0 THEN
	Messagebox("Copy document","Please select a document to copy from.")
	RETURN
END IF

IF Messagebox("Copy document","Are you sure to copy the selected document(s)?",question!,yesno!,2) = 2 THEN RETURN

open(w_select_storage_area)

ll_select_area_id = message.doubleparm
if ll_select_area_id = 0 then return
if ll_select_area_id = il_area_id then return

// Copy the Document to other Area

gnv_appeondb.of_startqueue( )

FOR ll_row = 1 TO li_doc_name
	ls_doc_name = ls_doc_names[ll_row]
	
	Delete From sys_storage_docs
	Where area_id = :ll_select_area_id
	And doc_name = :ls_doc_name;
	
	Insert Into sys_storage_docs(area_id, doc_name, doc_type, doc_data, last_edit_date, user_id)
	Select :ll_select_area_id, doc_name, doc_type, doc_data, getdate(), :gs_user_id
	From sys_storage_docs
	Where area_id = :il_area_id
	And doc_name = :ls_doc_name;
END FOR

COMMIT;

gnv_appeondb.of_commitqueue( )

MessageBox( "Copy document", "Completed!" )

end event

type cb_savedoc from commandbutton within w_area_painter
integer x = 2181
integer y = 24
integer width = 325
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Update Doc"
boolean cancel = true
end type

event clicked;Long ll_row, ll_area_id, ll_found, ll_rowcount
String ls_doc_name, ls_return, ls_str

IF NOT cb_adddoc.Enabled THEN RETURN

ll_row = dw_storage_docs.GetSelectedrow( 0 )
IF ll_row = 0 THEN RETURN
	
ll_area_id = dw_storage_docs.GetItemNumber(ll_row, "area_id")
ls_doc_name = dw_storage_docs.GetItemString(ll_row, "doc_name")

ls_str = String(ll_area_id) + "~t" + ls_doc_name

OPENWITHPARM( w_storage_docs_edit, ls_str )

ls_return = Message.StringParm
if Len( Trim(ls_return) ) <> 0 then
	dw_storage_docs.SetRedraw( False )
	ll_rowcount = dw_storage_docs.retrieve( ll_area_id )
	ll_found = dw_storage_docs.Find( "doc_name = '" + ls_return + "'", &
												1, ll_rowcount )
	if ll_found > 0 then
		dw_storage_docs.SelectRow( 0, False )
		dw_storage_docs.SelectRow( ll_found, True )
		dw_storage_docs.SetRow( ll_found )
		dw_storage_docs.ScrollToRow( ll_found )
	end if
	dw_storage_docs.SetRedraw( True )
END IF

//string docpath, docname
//integer li_rtn
//n_appeon_storage_area lnv_storage_area
//Long ll_row, ll_area_row
//Long ll_area_id
//String ls_doc_name
//String ls_doc_path
//String ls_full_name
//
//ll_area_row = dw_storage_area.GetSelectedrow( 0 )
//ll_row = dw_storage_docs.GetSelectedrow( 0 )
//IF ll_row = 0 THEN RETURN
//
//ll_area_id = dw_storage_docs.GetItemNumber(ll_row, "area_id")
//ls_doc_name = dw_storage_docs.GetItemString(ll_row, "doc_name")
//ls_doc_path = dw_storage_area.GetItemString(ll_area_row, "area_doc_path")
//ls_full_name = ls_doc_path + ls_doc_name
//
//
//li_rtn = GetFileOpenName("Select File", &
//    docpath, docname, "DOC", &
//    "Doc Files (*.DOC),*.DOC", ls_doc_path	 )
//
//IF li_rtn < 1 THEN RETURN
//
//// Upload the Document
//li_rtn = lnv_storage_area.of_upload_file( ll_area_id, ls_doc_name, docpath)
//
//IF li_rtn > 0 THEN
//	gnv_appeondb.of_autocommit( )
//	UPDATE sys_storage_docs
//	SET last_edit_date = getdate()
//	WHERE area_id = :ll_area_id AND doc_name = :ls_doc_name;
//	COMMIT;
//END IF
end event

type cb_viewdoc from commandbutton within w_area_painter
integer x = 1851
integer y = 24
integer width = 325
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&View Doc"
end type

event clicked;n_appeon_storage_area lnv_storage_area
Long ll_row, ll_area_row
Long ll_area_id
String ls_doc_name
String ls_doc_path
String ls_full_name
String ls_Null
Integer li_rtn

if this.Enabled = False then return;
SetNull( ls_Null )

ll_area_row = dw_storage_area.GetSelectedrow( 0 )
ll_row = dw_storage_docs.GetSelectedrow( 0 )
IF ll_row = 0 THEN RETURN

ll_area_id = dw_storage_docs.GetItemNumber(ll_row, "area_id")
ls_doc_name = dw_storage_docs.GetItemString(ll_row, "doc_name")
ls_doc_path = dw_storage_area.GetItemString(ll_area_row, "area_doc_path")
ls_full_name = ls_doc_path + ls_doc_name

IF LEN(ls_full_name) > 0 THEN
		
	// Create directory
	n_appeon_download lnv_download
	lnv_download.of_parsepath( ls_doc_path )

	// Open process window
	OpenWithParm( w_appeon_gifofwait, "Downloading document from database...")

	li_rtn = lnv_storage_area.of_download_file( ll_area_id, ls_doc_name, ls_full_name)
	
	// Clsoe process window
	IF Isvalid(w_appeon_gifofwait) THEN Close(w_appeon_gifofwait)
	
	IF li_rtn < 0 THEN
		IF li_rtn = -2 THEN Messagebox("View document","The document does not exist in the database!")
		RETURN
	END IF

	IF FileExists(ls_full_name) THEN
		ShellExecuteA ( Handle( This ), "open", ls_full_name, ls_Null, ls_Null, 1)
	END IF
END IF
end event

type cb_adddoc from commandbutton within w_area_painter
integer x = 1522
integer y = 24
integer width = 325
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add Doc"
end type

event clicked;
String ls_return
Long ll_rowcount, ll_found, ll_selected

IF dw_storage_area.rowcount() < 1 THEN
	MessageBox( "Add Document", "Please add a Storage Area first." )
	dw_storage_area.SetFocus()
	Return;
END IF

ll_selected = dw_storage_area.GetSelectedRow( 0 )
IF ll_selected = 0 THEN
	MessageBox( "Add Document", "Please select a Storage Area before add document." )
	dw_storage_area.SetFocus()
	Return;
END IF

OpenWithParm( w_storage_docs, il_area_id )

ls_return = Message.StringParm
if Len( Trim(ls_return) ) <> 0 then
	dw_storage_docs.SetRedraw( False )
	ll_rowcount = dw_storage_docs.Retrieve( il_area_id )
	ll_found = dw_storage_docs.Find( "doc_name = '" + ls_return + "'", &
												1, ll_rowcount )
	if ll_found > 0 then
		dw_storage_docs.SelectRow( 0, False )
		dw_storage_docs.SelectRow( ll_found, True )
		dw_storage_docs.SetRow( ll_found )
		dw_storage_docs.ScrollToRow( ll_found )
	end if
	dw_storage_docs.SetRedraw( True )
end if
end event

type dw_storage_docs from datawindow within w_area_painter
integer x = 859
integer y = 152
integer width = 2683
integer height = 2044
integer taborder = 20
string title = "none"
string dataobject = "d_sys_storage_docs_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;Long ll_row

ll_row = This.Getrow( )
IF ll_row = 0 THEN RETURN

This.Selectrow( 0 , FALSE)
This.Selectrow( ll_row , TRUE)
end event

event doubleclicked;cb_savedoc.triggerevent( clicked!)

//Long ll_row, ll_area_id, ll_found, ll_rowcount
//String ls_doc_name, ls_return, ls_str
//
//IF NOT cb_adddoc.Enabled THEN RETURN
//
//ll_row = dw_storage_docs.GetSelectedrow( 0 )
//IF ll_row = 0 THEN RETURN
//	
//ll_area_id = dw_storage_docs.GetItemNumber(ll_row, "area_id")
//ls_doc_name = dw_storage_docs.GetItemString(ll_row, "doc_name")
//
//ls_str = String(ll_area_id) + "~t" + ls_doc_name
//
//OPENWITHPARM( w_storage_docs_edit, ls_str )
//
//ls_return = Message.StringParm
//if Len( Trim(ls_return) ) <> 0 then
//	dw_storage_docs.SetRedraw( False )
//	ll_rowcount = dw_storage_docs.retrieve( ll_area_id )
//	ll_found = dw_storage_docs.Find( "doc_name = '" + ls_return + "'", &
//												1, ll_rowcount )
//	if ll_found > 0 then
//		dw_storage_docs.SelectRow( 0, False )
//		dw_storage_docs.SelectRow( ll_found, True )
//		dw_storage_docs.SetRow( ll_found )
//		dw_storage_docs.ScrollToRow( ll_found )
//	end if
//	dw_storage_docs.SetRedraw( True )
//END IF
end event

event clicked;IF row > 0 THEN
	This.Setrow( row )
	this.selectrow(0,false)
	this.selectrow(row,true)
End IF
end event

event constructor;if AppeonGetClientType() = 'PB' Then //Add by Evan 01.30.2008
	this.object.p_1.filename = gs_current_path + "\sectiongreen.bmp"
end if
end event

type dw_storage_area from datawindow within w_area_painter
integer x = 37
integer y = 764
integer width = 777
integer height = 1432
integer taborder = 10
string title = "none"
string dataobject = "d_sys_storage_area_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;Long ll_area_id

if currentrow < 1 then return;

This.SetRow( currentrow )
This.Selectrow( 0, FALSE)
This.Selectrow( currentrow , TRUE)

ll_area_id = This.GetItemNumber( currentrow, "area_id" )

dw_storage_docs.Reset( )
dw_storage_docs.Retrieve( ll_area_id )

il_area_id = ll_area_id
end event

event doubleclicked;LONG ll_row
ll_row = This.Getrow( )

IF ll_row > 0 AND cb_editarea.Enabled THEN
	cb_editarea.postevent( clicked! )
END IF

end event

