$PBExportHeader$w_storage_docs_edit.srw
forward
global type w_storage_docs_edit from w_response
end type
type cb_getfile from commandbutton within w_storage_docs_edit
end type
type dw_1 from u_dw within w_storage_docs_edit
end type
type cb_3 from commandbutton within w_storage_docs_edit
end type
type cb_1 from commandbutton within w_storage_docs_edit
end type
end forward

global type w_storage_docs_edit from w_response
integer width = 2286
integer height = 996
string title = "Edit Document"
long backcolor = 67108864
string icon = "AppIcon!"
cb_getfile cb_getfile
dw_1 dw_1
cb_3 cb_3
cb_1 cb_1
end type
global w_storage_docs_edit w_storage_docs_edit

type variables
Boolean ib_new
Boolean ib_save
boolean ib_update_doc
string is_doc_fullname


end variables

on w_storage_docs_edit.create
int iCurrent
call super::create
this.cb_getfile=create cb_getfile
this.dw_1=create dw_1
this.cb_3=create cb_3
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_getfile
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_1
end on

on w_storage_docs_edit.destroy
call super::destroy
destroy(this.cb_getfile)
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.cb_1)
end on

event open;call super::open;String ls_str
Long ll_area_id
Integer li_pos
String ls_doc_name
long ll_len

dw_1.Modify("b_browse.visible = 0")

ls_str = Message.Stringparm

li_pos = Pos(ls_str, "~t")
ll_area_id = Long(Left(ls_str, li_pos - 1))
ls_doc_name = Mid(ls_str,li_pos + 1)

dw_1.Settransobject(SQLCA)
dw_1.Retrieve( ll_area_id, ls_doc_name)

//select DATALENGTH(doc_data) into :ll_len FROM sys_storage_docs WHERE area_id = :ll_area_id	AND doc_name = :ls_doc_name;
//
//if ll_len > 0 then 
//	cb_getfile.visible
end event

type cb_getfile from commandbutton within w_storage_docs_edit
integer x = 1765
integer y = 188
integer width = 421
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Select Document"
end type

event clicked;//Start Code Change ---- 11.29.2006 #V7 maha button added
String ls_doc_name,ls_CurDir
String ls_doc_type
string docname, named
integer value

//ls_CurDir = GetCurrentDirectory( )		//Added by Scofield on 2008-03-18
gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
value = GetFileOpenName("Select File",&
+ docname, named, "DOC", &
	+ "Doc Files (*.DOC),*.DOC")
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value = 1 THEN
	ls_doc_name = dw_1.getItemstring( 1, "doc_name" )
	if named <> ls_doc_name then //do not allow the name to be change as this could potentially cause a duplication problem.
		Messagebox("Select Error", "The file that you have selected (" + named + ") has a different name than the original (" + ls_doc_name + ").   If you wish change the document name, close this screen and  Add a new letter and delete the original.") //Start Code Change ----02.06.2008 #V8 maha - changed message.
		ib_update_doc = false
	else
		is_doc_fullname = docname
		ib_update_doc = true
	end if
END IF

//ChangeDirectory(ls_CurDir)					//Added by Scofield on 2008-03-18


end event

type dw_1 from u_dw within w_storage_docs_edit
integer x = 46
integer y = 60
integer width = 2158
integer height = 672
integer taborder = 10
string title = "none"
string dataobject = "d_sys_storage_docs"
boolean vscrollbar = false
boolean livescroll = false
end type

type cb_3 from commandbutton within w_storage_docs_edit
integer x = 1938
integer y = 764
integer width = 265
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;IF ib_save THEN
	CloseWithReturn( PARENT, dw_1.GetItemString(1, "doc_name") )
ELSE
	CLOSE( PARENT )
END IF
end event

type cb_1 from commandbutton within w_storage_docs_edit
integer x = 1623
integer y = 764
integer width = 265
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;String 	ls_doc_name
String 	ls_doc_type
long 		ll_area_id,ll_Rtn

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-07-13 By: Scofield
//$<Reason> Remove the leading and the hind space of the document name
dw_1.accepttext( )
ls_doc_name = Trim(dw_1.GetItemString(1, "doc_name"))
dw_1.SetItem(1, "doc_name",ls_doc_name)
//---------------------------- APPEON END ----------------------------

dw_1.accepttext( )
//Start Code Change ---- 11.29.2006 #V7 maha
ls_doc_name = dw_1.GetItemString(1, "doc_name")
ll_area_id = dw_1.GetItemnumber(1, "area_id")
IF Isnull(ls_doc_name) OR Trim(ls_doc_name) = "" THEN
	Messagebox("Error", "Required value information for Document Name.")
	Return
END IF

ls_doc_type = dw_1.GetItemString(1, "doc_type")
IF Isnull(ls_doc_type) OR Trim(ls_doc_type) = "" THEN
	Messagebox("Error", "Please select a document type.")
	Return
END IF

gnv_appeondb.of_autocommit( )
If dw_1.update( ) = 1 THen
	COMMIT;
	IF LEN( is_doc_fullname ) > 0 THEN
		n_appeon_storage_area lnv_storage_area
		ll_Rtn = lnv_storage_area.of_upload_file( ll_area_id, ls_doc_name, is_doc_fullname)
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-04-17 By: Scofield
		//$<Reason> Popup a tip message.

		if ll_Rtn = -1 then
			MessageBox(gnv_app.iapp_object.DisplayName,'Failed to upload ' + is_doc_fullname)
		end if
		//---------------------------- APPEON END ----------------------------
	END IF
	ib_update_doc = false
ELSE
	ROLLBACK;
	Return;
End if
//End Code Change---11.29.2006	
ib_save = TRUE

end event

