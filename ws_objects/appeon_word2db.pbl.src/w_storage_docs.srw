$PBExportHeader$w_storage_docs.srw
forward
global type w_storage_docs from window
end type
type dw_1 from datawindow within w_storage_docs
end type
type cb_3 from commandbutton within w_storage_docs
end type
type cb_1 from commandbutton within w_storage_docs
end type
end forward

global type w_storage_docs from window
integer width = 2286
integer height = 996
boolean titlebar = true
string title = "Add Document"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
cb_3 cb_3
cb_1 cb_1
end type
global w_storage_docs w_storage_docs

type variables
Boolean ib_new
Boolean ib_save
Long il_area_id
String is_doc_fullname
end variables

on w_storage_docs.create
this.dw_1=create dw_1
this.cb_3=create cb_3
this.cb_1=create cb_1
this.Control[]={this.dw_1,&
this.cb_3,&
this.cb_1}
end on

on w_storage_docs.destroy
destroy(this.dw_1)
destroy(this.cb_3)
destroy(this.cb_1)
end on

event open;Long ll_row
Datetime ldt_today

ldt_today = Datetime( Today(), Now() )

dw_1.settransobject( SQLCA )

il_area_id = Message.Doubleparm
IF il_area_id > 0 THEN
	ll_row = dw_1.Insertrow( 0 )

	dw_1.Setitem( ll_row, "area_id", il_area_id)
	dw_1.Setitem( ll_row, "last_edit_date", ldt_today)
	dw_1.Setitem( ll_row, "user_id", gs_user_id)

END IF
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type dw_1 from datawindow within w_storage_docs
integer x = 46
integer y = 60
integer width = 2158
integer height = 672
integer taborder = 10
string title = "none"
string dataobject = "d_sys_storage_docs"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;string docname, named

integer value
gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
value = GetFileOpenName("Select File",&
+ docname, named, "DOC", &
	+ "Doc Files (*.DOC),*.DOC")
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value = 1 THEN
	This.SetItem( row, "doc_name", named )
	is_doc_fullname = docname
END IF
end event

type cb_3 from commandbutton within w_storage_docs
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

type cb_1 from commandbutton within w_storage_docs
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
Integer 	li_cnt
long		ll_Rtn

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2007-07-13 By: Scofield
//$<Reason> Remove the leading and the hind space of the document name
dw_1.accepttext( )
ls_doc_name = Trim(dw_1.GetItemString(1, "doc_name"))
dw_1.SetItem(1, "doc_name",ls_doc_name)
//---------------------------- APPEON END ----------------------------

dw_1.accepttext( )

ls_doc_name = dw_1.GetItemString(1, "doc_name")
IF Isnull(ls_doc_name) OR Trim(ls_doc_name) = "" THEN
	Messagebox("Error", "Required value information for Document Name.")
	Return
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<Modify> 2008-04-17 By: Scofield
//$<Reason> if the document content doesn't in the database,then upload the document.

SELECT count(*) 
  INTO :li_cnt
  FROM sys_storage_docs
 WHERE area_id = :il_area_id AND LTrim(RTrim(doc_name)) = :ls_doc_name AND doc_data is Not Null;
//---------------------------- APPEON END ----------------------------

IF li_cnt > 0  THEN
	//Messagebox("Error", "The new document cannot has the same name to the one exists in database already.")
	Messagebox("Error", "A document with this name already exists in the database.")
	Return
END IF


ls_doc_type = dw_1.GetItemString(1, "doc_type")
IF Isnull(ls_doc_type) OR Trim(ls_doc_type) = "" THEN
	Messagebox("Error", "Please select a document type.")
	Return
END IF

If dw_1.update( ) = 1 THen
	COMMIT;
	
	// Upload Document
	IF LEN( is_doc_fullname ) > 0 THEN
		n_appeon_storage_area lnv_storage_area
		ll_Rtn = lnv_storage_area.of_upload_file( il_area_id, ls_doc_name, is_doc_fullname)
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$< Add  > 2008-04-17 By: Scofield
		//$<Reason> Popup a tip message.

		if ll_Rtn = -1 then
			MessageBox(gnv_app.iapp_object.DisplayName,'Failed to upload ' + is_doc_fullname)
		end if
		//---------------------------- APPEON END ----------------------------
	END IF
ELSE
	ROLLBACK;
	Return;
End if
	
ib_save = TRUE

end event

