$PBExportHeader$w_fax_win.srw
forward
global type w_fax_win from w_response
end type
type sle_cover from singlelineedit within w_fax_win
end type
type st_cover from statictext within w_fax_win
end type
type sle_subject from singlelineedit within w_fax_win
end type
type mle_cover_text from multilineedit within w_fax_win
end type
type st_text from statictext within w_fax_win
end type
type cb_fax from commandbutton within w_fax_win
end type
type cb_cancel from commandbutton within w_fax_win
end type
type cb_browse from commandbutton within w_fax_win
end type
type gb_1 from groupbox within w_fax_win
end type
type dw_select_template from u_dw within w_fax_win
end type
type dw_user_facility_list from datawindow within w_fax_win
end type
type sle_company from singlelineedit within w_fax_win
end type
type sle_recipient from singlelineedit within w_fax_win
end type
type st_company from statictext within w_fax_win
end type
type st_recipient from statictext within w_fax_win
end type
type st_fax from statictext within w_fax_win
end type
type em_fax from editmask within w_fax_win
end type
type dw_template from u_dw within w_fax_win
end type
type st_sub from statictext within w_fax_win
end type
type st_cc from statictext within w_fax_win
end type
end forward

global type w_fax_win from w_response
integer x = 850
integer y = 416
integer width = 1833
integer height = 1708
string title = "Fax"
boolean controlmenu = false
long backcolor = 79680469
sle_cover sle_cover
st_cover st_cover
sle_subject sle_subject
mle_cover_text mle_cover_text
st_text st_text
cb_fax cb_fax
cb_cancel cb_cancel
cb_browse cb_browse
gb_1 gb_1
dw_select_template dw_select_template
dw_user_facility_list dw_user_facility_list
sle_company sle_company
sle_recipient sle_recipient
st_company st_company
st_recipient st_recipient
st_fax st_fax
em_fax em_fax
dw_template dw_template
st_sub st_sub
st_cc st_cc
end type
global w_fax_win w_fax_win

type variables
Integer ii_fax_type //1:WinFax,2:MSFax
String is_output_type //Added By Ken.Guo 04.28.2008
end variables

on w_fax_win.create
int iCurrent
call super::create
this.sle_cover=create sle_cover
this.st_cover=create st_cover
this.sle_subject=create sle_subject
this.mle_cover_text=create mle_cover_text
this.st_text=create st_text
this.cb_fax=create cb_fax
this.cb_cancel=create cb_cancel
this.cb_browse=create cb_browse
this.gb_1=create gb_1
this.dw_select_template=create dw_select_template
this.dw_user_facility_list=create dw_user_facility_list
this.sle_company=create sle_company
this.sle_recipient=create sle_recipient
this.st_company=create st_company
this.st_recipient=create st_recipient
this.st_fax=create st_fax
this.em_fax=create em_fax
this.dw_template=create dw_template
this.st_sub=create st_sub
this.st_cc=create st_cc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_cover
this.Control[iCurrent+2]=this.st_cover
this.Control[iCurrent+3]=this.sle_subject
this.Control[iCurrent+4]=this.mle_cover_text
this.Control[iCurrent+5]=this.st_text
this.Control[iCurrent+6]=this.cb_fax
this.Control[iCurrent+7]=this.cb_cancel
this.Control[iCurrent+8]=this.cb_browse
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.dw_select_template
this.Control[iCurrent+11]=this.dw_user_facility_list
this.Control[iCurrent+12]=this.sle_company
this.Control[iCurrent+13]=this.sle_recipient
this.Control[iCurrent+14]=this.st_company
this.Control[iCurrent+15]=this.st_recipient
this.Control[iCurrent+16]=this.st_fax
this.Control[iCurrent+17]=this.em_fax
this.Control[iCurrent+18]=this.dw_template
this.Control[iCurrent+19]=this.st_sub
this.Control[iCurrent+20]=this.st_cc
end on

on w_fax_win.destroy
call super::destroy
destroy(this.sle_cover)
destroy(this.st_cover)
destroy(this.sle_subject)
destroy(this.mle_cover_text)
destroy(this.st_text)
destroy(this.cb_fax)
destroy(this.cb_cancel)
destroy(this.cb_browse)
destroy(this.gb_1)
destroy(this.dw_select_template)
destroy(this.dw_user_facility_list)
destroy(this.sle_company)
destroy(this.sle_recipient)
destroy(this.st_company)
destroy(this.st_recipient)
destroy(this.st_fax)
destroy(this.em_fax)
destroy(this.dw_template)
destroy(this.st_sub)
destroy(this.st_cc)
end on

event open;call super::open;DataWindowChild dwchild
String ls_open_from
//String ls_output_type
Integer li_found
Integer i
Integer li_rc
Integer li_template_id
Integer li_facility_access[]

//sle_cc.Visible = False
//st_cc.Visible = False

ls_open_from = Message.StringParm


IF POS( ls_open_from, "-" ) > 0 THEN
	is_output_type = "Email"
	ls_open_from = Mid( ls_open_from, 1, POS( ls_open_from, "-")-1 )
	This.Title = "Email"
	cb_fax.Text = "Email"
	st_text.Text = "Email Text (Ctrl Enter for new line)"
	cb_browse.Visible = False

	sle_cover.Visible = False
	st_cover.Visible = False

	//sle_cover.Text = False
	//st_cover.Text = "Email Address" 

	cb_cancel.y = cb_cancel.y - 192
	cb_fax.y = cb_fax.y - 192
	cb_browse.y = cb_browse.y - 192		
		
	st_sub.y = st_sub.y - 192
	sle_subject.y = sle_subject.y - 192
	
	st_text.y = st_text.y - 192
	mle_cover_text.y = mle_cover_text.y - 192	
	
	This.Height = This.Height - 192
ELSE
	is_output_type = "Fax"
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 05/29/2007 By: Ken.Guo
	//$<reason> 
	ii_fax_type = gds_settings.GetItemNumber(1,'set_52')
	If ii_fax_type = 1 Then
		this.title = 'WinFax'
	Else 
		this.title = 'MSFax'
	End If
	//---------------------------- APPEON END ----------------------------
		
END IF

dw_template.SetTransObject( SQLCA )
dw_user_facility_list.SetTransObject( SQLCA )
dw_user_facility_list.Retrieve( gs_user_id )

li_rc = dw_user_facility_list.RowCount( )
FOR i = 1 TO li_rc
	li_facility_access[ i ] = dw_user_facility_list.GetItemNumber( i, "user_facility_id" )
END FOR

dw_select_template.of_SetTransObject( SQLCA )
dw_select_template.InsertRow( 0 )
dw_select_template.GetChild( "template_id", dwchild )
//retrieve templates associated with facility that user has rights to.
dwchild.SetTransObject( SQlCA )
dwchild.Retrieve( li_facility_access )
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 04/28/2008 By: Ken.Guo
//$<reason> Filter template data with different fax type.
If is_output_type = 'Fax'	Then
	dwchild.SetFilter('fax_type = ' + String(ii_fax_type))
	dwchild.Filter()
End If
//---------------------------- APPEON END ----------------------------


CHOOSE CASE ls_open_from
	CASE 'Corro'
		li_found = dwchild.Find( "default_for_corro = 1", 1, 1000 )	
	CASE 'Verif'
		li_found = dwchild.Find( "default_for_verif = 1", 1, 1000 )			
	CASE 'Apps'
		li_found = dwchild.Find( "default_for_apps = 1", 1, 1000 )					
	CASE 'Image'
		li_found = dwchild.Find( "default_for_imaging = 1", 1, 1000 )							

		This.Height = 2184
		
		cb_cancel.y = cb_cancel.y + 540
		cb_fax.y = cb_fax.y + 540		
		cb_browse.y = cb_browse.y + 540		

		st_cover.y = st_cover.y + 540
		sle_cover.y = sle_cover.y + 540
		
		st_sub.y = st_sub.y + 540
		sle_subject.y = sle_subject.y + 540
		
		st_text.y = st_text.y + 540
		mle_cover_text.y = mle_cover_text.y + 540
		
		sle_company.Visible = True
		st_company.Visible = True
		
		sle_recipient.Visible = True
		st_recipient.Visible = True
		
		em_fax.Visible = True
		st_fax.Visible = True
		
				
	CASE 'MissInfo'
		li_found = dwchild.Find( "default_for_miss_ltr = 1", 1, 1000 )							
	CASE 'ExpAppt'
		li_found = dwchild.Find( "default_for_exp_appt = 1", 1, 1000 )							
	CASE 'ExpLtr'
		li_found = dwchild.Find( "default_for_exp_ltrs = 1", 1, 1000 )									
	CASE 'None'		
END CHOOSE

IF ls_open_from <> "None" AND li_found > 0 THEN
	li_template_id = dwchild.GetItemNumber( li_found, "fax_temp_id" )
	dw_select_template.SetText( String( li_template_id ) )
	dw_select_template.AcceptText()
END IF


end event

type sle_cover from singlelineedit within w_fax_win
integer x = 64
integer y = 312
integer width = 1403
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_cover from statictext within w_fax_win
integer x = 64
integer y = 244
integer width = 480
integer height = 60
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
string text = "Cover Page Template"
boolean focusrectangle = false
end type

type sle_subject from singlelineedit within w_fax_win
integer x = 64
integer y = 500
integer width = 1673
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type mle_cover_text from multilineedit within w_fax_win
integer x = 64
integer y = 684
integer width = 1673
integer height = 688
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_text from statictext within w_fax_win
integer x = 64
integer y = 620
integer width = 873
integer height = 60
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
string text = "Cover Page Text (Ctrl Enter for new line)"
boolean focusrectangle = false
end type

type cb_fax from commandbutton within w_fax_win
integer x = 1189
integer y = 1396
integer width = 251
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Send Fax"
end type

event clicked;gs_pass_ids  lg_pass_ids

IF (sle_cover.Text = "" OR IsNull( sle_cover.Text )) AND This.Text <> 'Email' THEN
	MessageBox("Required Data Missing", "You must fill in the name of the cover page you want to use." )
	sle_cover.setfocus()
	Return -1
END IF

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 10/15/2007 By: Ken.Guo
//$<reason> Check cover page file for Fax.
If Not FileExists (sle_cover.Text ) and This.Text <> 'Email'  Then
	Messagebox('Required Data Missing','Cover page file does not exist. Please select another cover page file.')
	Return -1
End If
//---------------------------- APPEON END ----------------------------


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 10/15/2007 By: Ken.Guo
//$<reason> Email and Fax need show difference message.
/*
IF mle_cover_text.Text = "" OR IsNull( mle_cover_text.Text ) THEN
	MessageBox("Required Data Missing", "You must fill in the cover page message." )
	mle_cover_text.setfocus()
	Return -1
END IF
*/
IF mle_cover_text.Text = "" OR IsNull( mle_cover_text.Text ) THEN
	If This.Text = 'Email' Then
		MessageBox("Required Data Missing", "You must fill in the Email message." )
	Else
		MessageBox("Required Data Missing", "You must fill in the cover page message." )
	End If
	mle_cover_text.setfocus()
	Return -1
END IF
//---------------------------- APPEON END ----------------------------



IF sle_subject.Text = "" OR IsNull( sle_subject.Text ) THEN
	MessageBox("Required Data Missing", "You must fill in the subject text." )
	sle_subject.setfocus()
	Return -1
END IF

IF em_fax.Visible THEN
	IF sle_recipient.Text = "" OR IsNull( sle_recipient.Text ) THEN
		MessageBox("Required Data Missing", "You must fill in the Recipient text." )
		sle_recipient.setfocus()
		Return -1
	END IF

	IF em_fax.Text = "" OR IsNull( em_fax.Text ) THEN
		MessageBox("Required Data Missing", "You must have a fax number." )
		em_fax.setfocus()
		Return -1
	END IF
END IF


lg_pass_ids.s_fax_cover = sle_cover.Text
lg_pass_ids.s_fax_message = mle_cover_text.Text
lg_pass_ids.s_fax_subject = sle_subject.Text
lg_pass_ids.s_fax_fax_number = em_fax.Text
lg_pass_ids.s_fax_recipient = sle_recipient.Text
lg_pass_ids.s_fax_company = sle_company.Text

CloseWithReturn( Parent, lg_pass_ids )
end event

type cb_cancel from commandbutton within w_fax_win
integer x = 1477
integer y = 1396
integer width = 251
integer height = 84
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn( Parent, "Cancel" )
end event

type cb_browse from commandbutton within w_fax_win
integer x = 1495
integer y = 316
integer width = 242
integer height = 84
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse.."
boolean cancel = true
end type

event clicked;string is_path
string docname, named
integer value
n_getfilename ln_getfilename

gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
If ii_fax_type = 1 Then
	//WinFax
	//value = GetFileOpenName("Select File", docname, named, "CVP", "Cover Page Files (*.CVP),*.CVP")//modified by gavins 20140814
	value = ln_getfilename.of_getopenfilename("Select File", docname, named, "CVP", "Cover Page Files (*.CVP),*.CVP")
Else
	//MSFax //Added By Ken.Guo 04.28.2008
	//value = GetFileOpenName("Select File", docname, named, "COV", "Cover Page Files (*.COV),*.COV")//modified by gavins 20140814
	value = ln_getfilename.of_getopenfilename("Select File", docname, named, "COV", "Cover Page Files (*.COV),*.COV")
End If
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008
IF value > 0 THEN
	sle_cover.Text = docname 
END IF


end event

type gb_1 from groupbox within w_fax_win
integer x = 32
integer y = 20
integer width = 1449
integer height = 184
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Select Template"
end type

type dw_select_template from u_dw within w_fax_win
integer x = 50
integer y = 72
integer width = 1413
integer height = 108
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_select_fax_template"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;This.of_SetUpdateable( False )
end event

event itemchanged;call super::itemchanged;dw_template.Retrieve( Long( data ) )


sle_subject.Text = dw_template.GetItemString( 1, "subject_text" )
//sle_cover.Text = dw_template.GetItemString( 1, "cover_sheet" )
mle_cover_text.Text = dw_template.GetItemString( 1, "cover_message" )


//--------------------------- APPEON BEGIN ---------------------------
//$<add> 05/29/2007 By: Ken.Guo
//$<reason> Auto generate the cover page from DB to local
long ll_temp_id
String ls_image_path,ls_pathname,ls_filename
Blob lblob_coverfile
Integer li_ret,li_pos

//Email painter, need not cover page file.
If cb_fax.Text = "Email" Then Return 

n_cst_filesrvwin32 nvo_file
nvo_file = Create n_cst_filesrvwin32

ll_temp_id = dw_template.getitemnumber(1,'fax_temp_id')

ls_image_path = gnv_data.of_getitem("ids" , "imaging_path" , False)
If ls_image_path = '' or isnull(ls_image_path) Then ls_image_path = 'C:'
If Not DirectoryExists ( ls_image_path ) Then
	CreateDirectory ( ls_image_path )
End If
//Begin get file name ,For old data, That data have full path name.
ls_filename = dw_template.GetItemString( 1, "cover_sheet" )
li_pos = pos(ls_filename,'\',1) 
Do while li_pos > 0 
	ls_filename = Right(ls_filename,len(ls_filename) - li_pos)
	li_pos = pos(ls_filename,'\',1) 
Loop

If Right(ls_image_path,1) = '\' Then
	ls_pathname = ls_image_path + ls_filename
Else
	ls_pathname = ls_image_path + '\' + ls_filename
End If

	
selectblob cover_file into :lblob_coverfile from sys_fax_template where fax_temp_id = :ll_temp_id;
If len(lblob_coverfile) = 0 or isnull(lblob_coverfile) Then
	//Messagebox('Fax','This template have no cover page,Please add it in Fax Template Painter.')
	Messagebox('Fax','This template has no cover page. Please add it in Fax Template Painter.')
	sle_cover.Text = ''
	return
End If
li_ret = nvo_file.of_filewrite( ls_pathname, lblob_coverfile, False)
If li_ret <> 1 Then 
	Messagebox('Cover Page','Failed to generate cover page.',Exclamation!)
	sle_cover.Text = ''
	Return
End If
sle_cover.Text = ls_pathname

Destroy nvo_file
//---------------------------- APPEON END ----------------------------




end event

type dw_user_facility_list from datawindow within w_fax_win
boolean visible = false
integer x = 1216
integer y = 228
integer width = 494
integer height = 360
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_user_facility_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_company from singlelineedit within w_fax_win
boolean visible = false
integer x = 64
integer y = 288
integer width = 1413
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_recipient from singlelineedit within w_fax_win
boolean visible = false
integer x = 64
integer y = 476
integer width = 1413
integer height = 96
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_company from statictext within w_fax_win
boolean visible = false
integer x = 64
integer y = 224
integer width = 480
integer height = 60
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
string text = "Company"
boolean focusrectangle = false
end type

type st_recipient from statictext within w_fax_win
boolean visible = false
integer x = 64
integer y = 420
integer width = 480
integer height = 56
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
string text = "Recipient"
boolean focusrectangle = false
end type

type st_fax from statictext within w_fax_win
boolean visible = false
integer x = 64
integer y = 604
integer width = 480
integer height = 56
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
string text = "Fax Number"
boolean focusrectangle = false
end type

type em_fax from editmask within w_fax_win
boolean visible = false
integer x = 64
integer y = 668
integer width = 581
integer height = 96
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxxxxxxx"
end type

type dw_template from u_dw within w_fax_win
boolean visible = false
integer x = 55
integer y = 432
integer width = 1403
integer height = 912
integer taborder = 20
string dataobject = "d_fax_template"
boolean vscrollbar = false
end type

event buttonclicked;call super::buttonclicked;string is_path
string docname, named
integer value
n_getfilename ln_getfilename

gf_load_dir_path() //Added by Ken.Guo on 2009-03-10
//value = GetFileOpenName("Select File", docname, named, "CVO", "Cover Page Files (*.CVP),*.CVP")//modified by gavins 20140814
value = ln_getfilename.of_getopenfilename("Select File", docname, named, "CVO", "Cover Page Files (*.CVP),*.CVP")
gf_save_dir_path(docname) //Added by Ken.Guo on 2009-03-10
//ChangeDirectory(gs_current_path) //Add by Evan 12/11/2008

IF value > 0 THEN
	dw_template.SetItem( dw_template.GetRow( ), "cover_sheet", docname  )
END IF


end event

type st_sub from statictext within w_fax_win
integer x = 64
integer y = 436
integer width = 247
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Subject"
boolean focusrectangle = false
end type

type st_cc from statictext within w_fax_win
integer x = 64
integer y = 436
integer width = 480
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "CC"
boolean focusrectangle = false
end type

