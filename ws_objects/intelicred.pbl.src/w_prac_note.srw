$PBExportHeader$w_prac_note.srw
forward
global type w_prac_note from window
end type
type st_1 from statictext within w_prac_note
end type
type cb_print from commandbutton within w_prac_note
end type
type cb_add from commandbutton within w_prac_note
end type
type tab_1 from tab within w_prac_note
end type
type tabpage_browse from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_browse
end type
type cb_2 from commandbutton within tabpage_browse
end type
type dw_prac_notes from datawindow within tabpage_browse
end type
type tabpage_browse from userobject within tab_1
cb_3 cb_3
cb_2 cb_2
dw_prac_notes dw_prac_notes
end type
type tabpage_detail from userobject within tab_1
end type
type dw_facil from datawindow within tabpage_detail
end type
type dw_detail from datawindow within tabpage_detail
end type
type gb_1 from groupbox within tabpage_detail
end type
type tabpage_detail from userobject within tab_1
dw_facil dw_facil
dw_detail dw_detail
gb_1 gb_1
end type
type tab_1 from tab within w_prac_note
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type
type cb_close from commandbutton within w_prac_note
end type
type cb_save from commandbutton within w_prac_note
end type
end forward

global type w_prac_note from window
integer x = 73
integer y = 376
integer width = 3465
integer height = 1772
boolean titlebar = true
string title = "Notes"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
st_1 st_1
cb_print cb_print
cb_add cb_add
tab_1 tab_1
cb_close cb_close
cb_save cb_save
end type
global w_prac_note w_prac_note

type variables
integer ii_facid

boolean ib_change = False
end variables

on w_prac_note.create
this.st_1=create st_1
this.cb_print=create cb_print
this.cb_add=create cb_add
this.tab_1=create tab_1
this.cb_close=create cb_close
this.cb_save=create cb_save
this.Control[]={this.st_1,&
this.cb_print,&
this.cb_add,&
this.tab_1,&
this.cb_close,&
this.cb_save}
end on

on w_prac_note.destroy
destroy(this.st_1)
destroy(this.cb_print)
destroy(this.cb_add)
destroy(this.tab_1)
destroy(this.cb_close)
destroy(this.cb_save)
end on

event open;long ll_prac_id
integer i
string ls_name

//ll_prac_id = gl_prac_id
ll_prac_id = message.doubleparm//maha changed 031904

tab_1.tabpage_browse.dw_prac_notes.SetTransObject( SQLCA )

i = tab_1.tabpage_browse.dw_prac_notes.retrieve(ll_prac_id,gs_user_id)
st_1.text = "Provider Id: " + string(ll_prac_id) //Start Code Change ----10.14.2008 #V85 maha

select full_name
into :ls_name
from v_full_name
where prac_id = :gl_prac_id;

w_prac_note.title = "Notes for " + ls_name

if w_mdi.of_security_access( 40 ) < 2 then
	tab_1.tabpage_detail.dw_detail.enabled = false
	tab_1.tabpage_detail.dw_facil.enabled = false
	cb_add.enabled = false
	cb_save.enabled = false
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

//
//String ls_text
//tab_1.tabpage_browse.dw_prac_notes.accepttext()
//ls_text = tab_1.tabpage_browse.dw_prac_notes.GetItemString( 1, "note" )
//
//IF IsNull( ls_text ) THEN
//	ls_text = ""
//END IF
//
//ls_text = ls_text + "~r~n    " +String(Today()) + " - "  + String(Now()) + " " + gs_user_id
//
//tab_1.tabpage_browse.dw_prac_notes.SetText(ls_text)
//
//tab_1.tabpage_browse.dw_prac_notes.SetFocus()
////dw_prac_notes.scroll ( 10000 )
//tab_1.tabpage_browse.dw_prac_notes.scrollnextpage()
end event

event close;//Start Code Change ----10.14.2008 #V85 maha
integer res
string ls_status

tab_1.tabpage_detail.dw_detail.accepttext( )
ls_status = of_check_row_status(tab_1.tabpage_detail.dw_detail,1)
//messagebox("Status",ls_status)
if ls_status  = "newmod" or ls_status  = "mod" or ls_status  = "new" then
	res = messagebox("Save Data","Do you wish to save the data before closing?",question!,yesno!,1)
	if res = 1 then
		cb_save.triggerevent("clicked")
	end if
end if
end event

type st_1 from statictext within w_prac_note
integer x = 1431
integer y = 1608
integer width = 635
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

type cb_print from commandbutton within w_prac_note
integer x = 2610
integer y = 80
integer width = 247
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Print"
end type

event clicked;

cb_save.triggerevent(clicked!)

if tab_1.selectedtab = 1 then
	tab_1.tabpage_browse.dw_prac_notes.print()
else
	tab_1.tabpage_detail.dw_detail.print()
end if


end event

type cb_add from commandbutton within w_prac_note
integer x = 2354
integer y = 80
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;

tab_1.selecttab(2)

cb_save.triggerevent(clicked!)
tab_1.tabpage_detail.dw_detail.reset()

tab_1.tabpage_detail.dw_detail.insertrow(1)


//tab_1.tabpage_detail.dw_detail.setitem(1,"record_id",)
tab_1.tabpage_detail.dw_detail.setitem(1,"pd_notes_prac_id",gl_prac_id)
tab_1.tabpage_detail.dw_detail.setitem(1,"pd_notes_ent_date",today())
tab_1.tabpage_detail.dw_detail.setitem(1,"pd_notes_user_id",gs_user_id)
tab_1.tabpage_detail.dw_detail.setitem(1,"pd_notes_facility_id",ii_facid)
tab_1.tabpage_detail.dw_detail.setfocus() //Start Code Change ----10.14.2008 #V85 maha

end event

type tab_1 from tab within w_prac_note
event create ( )
event destroy ( )
integer x = 37
integer y = 20
integer width = 3378
integer height = 1600
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80269524
boolean fixedwidth = true
boolean raggedright = true
tabposition tabposition = tabsonbottom!
alignment alignment = center!
integer selectedtab = 1
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type

on tab_1.create
this.tabpage_browse=create tabpage_browse
this.tabpage_detail=create tabpage_detail
this.Control[]={this.tabpage_browse,&
this.tabpage_detail}
end on

on tab_1.destroy
destroy(this.tabpage_browse)
destroy(this.tabpage_detail)
end on

event selectionchanged;datawindowchild dwchild

if this.selectedtab = 2 then
	tab_1.tabpage_detail.dw_facil.settransobject(sqlca)
	tab_1.tabpage_detail.dw_facil.insertrow(1)
	tab_1.tabpage_detail.dw_facil.GetChild( "facility_facility_id", dwchild )
	dwchild.SetTransObject( SQLCA )
	dwchild.Retrieve( gs_user_id)
	//tab_1.tabpage_detail.dw_facil.retrieve()
	dwchild.insertrow(1)
	dwchild.setitem(1,"facility_facility_id",0)
	dwchild.setitem(1,"facility_facility_name","Global")
end if

end event

type tabpage_browse from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 3342
integer height = 1472
long backcolor = 80269524
string text = "Browse"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "Justify!"
long picturemaskcolor = 553648127
cb_3 cb_3
cb_2 cb_2
dw_prac_notes dw_prac_notes
end type

on tabpage_browse.create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.dw_prac_notes=create dw_prac_notes
this.Control[]={this.cb_3,&
this.cb_2,&
this.dw_prac_notes}
end on

on tabpage_browse.destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.dw_prac_notes)
end on

type cb_3 from commandbutton within tabpage_browse
integer x = 1787
integer y = 44
integer width = 247
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Sort"
end type

event clicked;string null_str

SetNull(null_str)

tab_1.tabpage_browse.dw_prac_notes.Setsort(null_str)

tab_1.tabpage_browse.dw_prac_notes.sort()
end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-01
//$<add> 01.12.2006 By: LeiWei
//$<reason> Due to one slight defect in Appeon product, the position of this button is incorrect to some degree after migration.
//$<modification> Adjust the position for this button to make sure the presentation of this button looks the same as in PowerBuilder.
If appeongetclienttype() <> 'PB' Then
	this.y += 12
End If
//---------------------------- APPEON END ----------------------------

end event

type cb_2 from commandbutton within tabpage_browse
integer x = 2043
integer y = 44
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Filter"
end type

event clicked;string null_str

SetNull(null_str)

tab_1.tabpage_browse.dw_prac_notes.SetFilter(null_str)

tab_1.tabpage_browse.dw_prac_notes.Filter()
end event

event constructor;//--------------------------- APPEON BEGIN ---------------------------
//$<ID> UM-02
//$<add> 01.12.2006 By: LeiWei
//$<reason> Due to one slight defect in Appeon product, the position of this button is incorrect to some degree after migration.
//$<modification> Adjust the position for this button to make sure the presentation of this button looks the same as in PowerBuilder.
If appeongetclienttype() <> 'PB' Then
	this.y += 12
End If
//---------------------------- APPEON END ----------------------------

end event

type dw_prac_notes from datawindow within tabpage_browse
integer x = 14
integer y = 196
integer width = 3296
integer height = 1256
integer taborder = 20
string dataobject = "d_pd_notes_browse"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;long ll_recid
datawindowchild dwchild

//if this.getclickedrow() < 1 then return
//
//ll_recid = this.getitemnumber(row,"pd_notes_record_id")
//ib_change = false
//tab_1.tabpage_detail.dw_detail.settransobject(sqlca)
//tab_1.tabpage_detail.dw_detail.retrieve(ll_recid)
//tab_1.tabpage_detail.dw_detail.GetChild( "pd_notes_facility_id", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( gs_user_id)
//tab_1.tabpage_detail.dw_facil.settransobject(sqlca)
//tab_1.tabpage_detail.dw_facil.insertrow(1)
//tab_1.tabpage_detail.dw_facil.GetChild( "facility_facility_id", dwchild )
//dwchild.SetTransObject( SQLCA )
//dwchild.Retrieve( gs_user_id)
////tab_1.tabpage_detail.dw_facil.retrieve()
//dwchild.insertrow(1)
//dwchild.setitem(1,"facility_facility_id",0)
//dwchild.setitem(1,"facility_facility_name","Global")

tab_1.selecttab(2)
end event

event constructor;this.SetRowFocusIndicator ( hand!)
end event

event clicked;integer r
long ll_recid

r = this.setrow(this.getclickedrow())

if r < 1 then return

ll_recid = this.getitemnumber(row,"pd_notes_record_id")
ib_change = false
tab_1.tabpage_detail.dw_detail.settransobject(sqlca)
tab_1.tabpage_detail.dw_detail.retrieve(ll_recid)
end event

type tabpage_detail from userobject within tab_1
integer x = 18
integer y = 16
integer width = 3342
integer height = 1472
long backcolor = 80269524
string text = "Detail"
long tabtextcolor = 33554432
long tabbackcolor = 80269524
string picturename = "DataWindow5!"
long picturemaskcolor = 553648127
dw_facil dw_facil
dw_detail dw_detail
gb_1 gb_1
end type

on tabpage_detail.create
this.dw_facil=create dw_facil
this.dw_detail=create dw_detail
this.gb_1=create gb_1
this.Control[]={this.dw_facil,&
this.dw_detail,&
this.gb_1}
end on

on tabpage_detail.destroy
destroy(this.dw_facil)
destroy(this.dw_detail)
destroy(this.gb_1)
end on

type dw_facil from datawindow within tabpage_detail
integer x = 46
integer y = 60
integer width = 1115
integer height = 76
integer taborder = 20
string dataobject = "d_facility_users_notes"
boolean border = false
boolean livescroll = true
end type

event itemchanged;ii_facid = integer(data)

ib_change = True
end event

type dw_detail from datawindow within tabpage_detail
integer x = 9
integer y = 196
integer width = 3301
integer height = 1256
integer taborder = 10
string dataobject = "d_pd_notes_detail"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within tabpage_detail
integer x = 9
integer width = 1193
integer height = 164
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
string text = "Set Facility to:"
end type

type cb_close from commandbutton within w_prac_note
integer x = 3122
integer y = 80
integer width = 247
integer height = 84
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

event clicked;Close (Parent)
end event

type cb_save from commandbutton within w_prac_note
integer x = 2866
integer y = 80
integer width = 247
integer height = 84
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
end type

event clicked;long recid

if tab_1.tabpage_detail.dw_detail.rowcount() < 1 then return

if isnull(tab_1.tabpage_detail.dw_detail.getitemnumber(1,"pd_notes_record_id")) then
	select max(record_id)
	into :recid
	from pd_notes;
	
	if recid < 1 or isnull(recid) then recid = 0
	//messagebox("",recid)
	recid++

	tab_1.tabpage_detail.dw_detail.setitem(1,"pd_notes_record_id",recid)
else
	recid = tab_1.tabpage_detail.dw_detail.getitemnumber(1,"pd_notes_record_id")
end if

if ib_change = true then
	tab_1.tabpage_detail.dw_detail.setitem(1,"pd_notes_facility_id",ii_facid)
end if

tab_1.tabpage_detail.dw_detail.settransobject(sqlca)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 01.17.2006 By: LeiWei
//$<reason> Performance tuning
//$<reason> Add Appeon Commit label to reduce client-server interactions to improve runtime performance.
//$<modification> Add the Appeon Commit/Rollback label. 
//$<modification> Add the Appeon Queue labels. 
/*
if tab_1.tabpage_detail.dw_detail.Update() = 1 then
	commit using sqlca;
	
	//if sqlca.SQLCode < 0 then
	//	messagebox("Commit","Unable to commit changes",Exclamation!)
	//end if
else
	Rollback;
	if sqlca.SQLCode < 0 then
		messagebox("Rollback","Unable to Rollback changes",Exclamation!)
	end if
end if	
tab_1.tabpage_detail.dw_detail.retrieve(recid)
tab_1.tabpage_browse.dw_prac_notes.retrieve(gl_prac_id,gs_user_id)
*/

gnv_appeondb.of_autocommitrollback( )

if tab_1.tabpage_detail.dw_detail.Update() = 1 then
	commit using sqlca;
else
	Rollback;
	if sqlca.SQLCode < 0 then
		messagebox("Rollback","Unable to Rollback changes",Exclamation!)
	end if
end if

gnv_appeondb.of_startqueue( )

tab_1.tabpage_detail.dw_detail.retrieve(recid)
tab_1.tabpage_browse.dw_prac_notes.retrieve(gl_prac_id,gs_user_id)

gnv_appeondb.of_commitqueue( )
//---------------------------- APPEON END ----------------------------

end event

