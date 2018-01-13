$PBExportHeader$w_image_type_painter.srw
forward
global type w_image_type_painter from w_response
end type
type dw_image_defaults from u_dw within w_image_type_painter
end type
type st_1 from statictext within w_image_type_painter
end type
type dw_image_type from u_dw within w_image_type_painter
end type
type dw_path from u_dw within w_image_type_painter
end type
type cb_1 from u_cb within w_image_type_painter
end type
type cb_2 from u_cb within w_image_type_painter
end type
type cb_3 from u_cb within w_image_type_painter
end type
type cb_4 from u_cb within w_image_type_painter
end type
end forward

global type w_image_type_painter from w_response
integer x = 14
integer y = 64
integer width = 3049
integer height = 2328
string title = "Image Type Painter"
long backcolor = 79680469
dw_image_defaults dw_image_defaults
st_1 st_1
dw_image_type dw_image_type
dw_path dw_path
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
end type
global w_image_type_painter w_image_type_painter

type variables
Long   il_new_image_type = 0   // Add by Andy 07.14.2008
String is_del_image_types = '' // Add by Andy 07.15.2008
end variables

on w_image_type_painter.create
int iCurrent
call super::create
this.dw_image_defaults=create dw_image_defaults
this.st_1=create st_1
this.dw_image_type=create dw_image_type
this.dw_path=create dw_path
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_image_defaults
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_image_type
this.Control[iCurrent+4]=this.dw_path
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_4
end on

on w_image_type_painter.destroy
call super::destroy
destroy(this.dw_image_defaults)
destroy(this.st_1)
destroy(this.dw_image_type)
destroy(this.dw_path)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
end on

event open;call super::open;dw_image_type.of_SetTransObject( SQLCA )
dw_path.of_SetTransObject( SQLCA )

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<comment> 02.08.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

/*
dw_image_type.Retrieve()
dw_path.Retrieve()
*/
gnv_appeondb.of_startqueue( )

dw_image_type.Retrieve()
dw_path.Retrieve()

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------

dw_image_type.of_SetReqColumn(TRUE)
end event

event pfc_save;//$<add> 07.14.2008 by Andy
if il_new_image_type > 0 then
	if MessageBox(gnv_app.iapp_object.DisplayName,"Do you want to add it as a default image type for Applications?",Question!,YesNo!) = 1 then
		//display the list of applications with select checkboxes
		Open(w_app_select)
	end if
	il_new_image_type = 0
end if

Call super::pfc_save

//$<add> 07.15.2008 by Andy
String ls_sql
if Len(is_del_image_types) > 0 then
	ls_sql = "DELETE app_image_defaults WHERE image_type in (" + is_del_image_types + ")"
	Execute Immediate :ls_sql;
	if sqlca.sqlcode < 0 then
		Rollback;
	else
		commit;
	end if
	is_del_image_types = ''
end if

return 1
//end add 07.14.2008
end event

type dw_image_defaults from u_dw within w_image_type_painter
boolean visible = false
integer x = 2176
integer y = 2068
integer width = 658
integer height = 144
integer taborder = 60
string dataobject = "d_app_image_defaults"
boolean vscrollbar = false
boolean livescroll = false
end type

type st_1 from statictext within w_image_type_painter
integer x = 91
integer y = 164
integer width = 2775
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Add image Description and select the data screen to which to link the image.  If unsure select Basic Information."
boolean focusrectangle = false
end type

type dw_image_type from u_dw within w_image_type_painter
integer x = 73
integer y = 272
integer width = 2880
integer height = 1792
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_image_painter"
end type

event buttonclicked;call super::buttonclicked;Long ll_image_id

This.Update( )



ll_image_id = This.GetItemNumber( row, "image_type_id" )

OpenWithParm( w_ezflow_setup, ll_image_id )
end event

event pfc_preupdate;call super::pfc_preupdate;//Start Code Change ---- 03.29.2006 #355 maha
integer i

for i = 1 to this.rowcount()
	if this.getitemnumber(i,"link_to_screen") = 27 then //maha 032906 trap for personal data screen
		this.setitem(1,"link_to_screen",1 )
	end if
	//Start Code Change ----03.26.2008 #V8 maha - added trap for null values
	if isnull(this.getitemnumber(i,"link_to_app_id")  ) then this.setitem(i,"link_to_app_id",0)
	if isnull(this.getitemnumber(i,"de_queue")  ) then this.setitem(i,"de_queue",0)
	//End Code Change---03.26.2008
next

return 1
//End Code Change---03.29.2006
end event

event itemchanged;call super::itemchanged;if IsNull(this.object.de_queue[Row]) then //Add by Evan 2008-03-14
	this.SetItem(Row, "de_queue", 0)
end if
end event

type dw_path from u_dw within w_image_type_painter
integer x = 55
integer y = 2068
integer width = 2085
integer height = 148
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_image_path"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event pfc_preupdate;call super::pfc_preupdate;//Start Code Change ---- 03.01.2006 #301 maha
//	IF Right(dw_path.GetItemString( 1, "imaging_path" ), 1 ) <> "\" THEN
//		MessageBox("Validation Error", "The image path field must end with the charactor \")
//		dw_path.SetFocus()
//		dw_path.SetColumn( "imaging_path" )
//		Return -1
//	else
//		return 1
//	END IF

if this.getitemstatus( 1, 0, primary!) = datamodified! then
	this.setitem(1,"imaging_path",of_check_path(this.GetItemString( 1, "imaging_path" ),1)) 
end if

return 1
//End Code Change---03.01.2006


end event

type cb_1 from u_cb within w_image_type_painter
integer x = 2309
integer y = 24
integer width = 311
integer height = 84
integer taborder = 30
boolean bringtotop = true
string text = "&Save"
end type

event clicked;Parent.Event pfc_save()
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10.12.2006 By: Jack (Inova)
//$<reason> Queue Images for Scanning from Data Entry.
gnv_data.of_retrieve('image_type')
//---------------------------- APPEON END ----------------------------
dw_image_type.sort()  //Start Code Change ----04.02.2008 #V8 maha

end event

type cb_2 from u_cb within w_image_type_painter
integer x = 1646
integer y = 24
integer width = 311
integer height = 84
integer taborder = 10
boolean bringtotop = true
string text = "&Add"
end type

event clicked;Integer li_row, li_lst_order
Integer li_next_id
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 08.04.2006 By: LeiWei
//$<reason> Fix a defect.
If Parent.Event pfc_save() < 0 Then
	Return -1
End If
//---------------------------- APPEON END ----------------------------

li_row = dw_image_type.InsertRow(0)
dw_image_type.SetRow(li_row)
dw_image_type.ScrollToRow(li_row)
dw_image_type.SetItem(li_Row, "de_queue", 0) //Add by Evan 2008-03-14

SELECT Max( image_type_id )  
INTO :li_next_id  
FROM image_type  ;
IF SQLCA.SQLCODE = -1 THEN
	MessageBox( "Database Error", SQLCA.SQLCODE )
	Return -1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2005-11-24 By: Cao YongWang 
//$<reason> set li_next_id to 0 if li_next_id is null
If isnull(li_next_id) Then li_next_id = 0
//---------------------------- APPEON END ----------------------------


li_next_id ++

il_new_image_type = li_next_id //$<add> 07.14.2008 by Andy

dw_image_type.SetItem(li_row, "image_type_id", li_next_id)
dw_image_type.SetItem(li_row, "link_to_app_id", 0)  //maha 013003


dw_image_type.SetFocus()
dw_image_type.SetColumn(1)
	
end event

type cb_3 from u_cb within w_image_type_painter
integer x = 1975
integer y = 24
integer width = 311
integer height = 84
integer taborder = 20
boolean bringtotop = true
string text = "&Delete"
end type

event clicked;//--------------------------- APPEON BEGIN ---------------------------
//$<add> 2006-09-13 By: Liu HongXin
//$<reason> Fix defect.
Long ll_Row, ll_image_type_id, ll_Count

ll_Row = dw_image_type.GetRow()
If ll_Row < 1 Then Return

ll_image_type_id = dw_image_type.GetItemNumber(ll_Row, "image_type_id")

SELECT Count(*) 
  INTO :ll_Count
  FROM pd_images
 WHERE image_type_id = :ll_image_type_id;
If ll_Count > 0 Then
	MessageBox("Referenced records found","There are " + string( ll_count ) + " images(s) have scanned for this image type." )
	Return -1
End If
//---------------------------- APPEON END ----------------------------

//$<add> 07.15.2008 by Andy
SELECT top 1 1 INTO :ll_Count from app_image_defaults where image_type = :ll_image_type_id;
if ll_Count > 0 then
	if MessageBox(gnv_app.iapp_object.DisplayName,"All default records connected to this image type will be deleted.  Are you sure you want to continue?",Question!,YesNo!) = 1 then
		if is_del_image_types = '' then
			is_del_image_types =  String(ll_image_type_id)
		else
			is_del_image_types = is_del_image_types + ',' + String(ll_image_type_id)
		end if
	else
		return -1
	end if
end if
//End add 07.15.2008

dw_image_type.Event pfc_deleterow()

dw_image_type.SetFocus()
end event

type cb_4 from u_cb within w_image_type_painter
integer x = 2638
integer y = 24
integer width = 311
integer height = 84
integer taborder = 40
boolean bringtotop = true
string text = "&Close"
end type

event clicked;Close( Parent )
end event

