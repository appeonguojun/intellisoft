$PBExportHeader$w_batch_list_edit.srw
forward
global type w_batch_list_edit from window
end type
type cb_non from commandbutton within w_batch_list_edit
end type
type cb_2 from commandbutton within w_batch_list_edit
end type
type cb_1 from commandbutton within w_batch_list_edit
end type
type dw_print from datawindow within w_batch_list_edit
end type
type dw_name from datawindow within w_batch_list_edit
end type
type cb_as from commandbutton within w_batch_list_edit
end type
type cb_close from commandbutton within w_batch_list_edit
end type
type cb_save from commandbutton within w_batch_list_edit
end type
type cb_del from commandbutton within w_batch_list_edit
end type
type cb_add from commandbutton within w_batch_list_edit
end type
type dw_list from datawindow within w_batch_list_edit
end type
type dw_copy from datawindow within w_batch_list_edit
end type
end forward

global type w_batch_list_edit from window
integer x = 914
integer y = 80
integer width = 2167
integer height = 2252
boolean titlebar = true
string title = "Edit Practitioner Batch"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 80269524
cb_non cb_non
cb_2 cb_2
cb_1 cb_1
dw_print dw_print
dw_name dw_name
cb_as cb_as
cb_close cb_close
cb_save cb_save
cb_del cb_del
cb_add cb_add
dw_list dw_list
dw_copy dw_copy
end type
global w_batch_list_edit w_batch_list_edit

type variables
long il_batch_id
end variables

forward prototypes
public function integer of_batch_add (string as_from)
end prototypes

public function integer of_batch_add (string as_from);Integer li_nr
Integer li_find
integer i
integer ic
Long ll_prac_id
String ls_full_name
gs_search lstr_search
gs_batch_search ist_search

if as_from = "P" then //practitioner
	lstr_search.stran_transaction = SQLCA
	lstr_search.ls_open_for = "REPORTS0" 
	OpenWithParm( w_extended_search_new , lstr_search )
	IF Message.DoubleParm = -1 THEN
		Return -1
	END IF
elseif as_from = "N" then //non-practitioners
	openwithparm(w_non_prac_painter,"S")
	IF Message.DoubleParm = -1 THEN
		Return -1
	end if
end if

ist_search = message.powerobjectparm

if not isvalid(message.powerobjectparm) then return 0
dw_list.setredraw( false)
ic = upperbound(ist_search.li_prac_id[])
for i = 1 to ic
//ll_prac_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1 ) )
//ls_full_name = Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 100 )
	ll_prac_id = ist_search.li_prac_id[i] //maha 091605
	li_find = dw_list.Find( "prac_id = " + String( ll_prac_id ), 1, 1000 )
	IF li_find > 0 THEN //if find existing, skip
		Return -1
	else	
		//select full_name into :ls_full_name from v_full_name where prac_id = :ll_prac_id;
		ls_full_name = ist_search.ls_name[i] //maha 091605
	END IF
	li_nr = dw_list.InsertRow( 0 )

	dw_list.SetItem( li_nr, "prac_id", ll_prac_id )
	dw_list.SetItem( li_nr, "full_name", ls_full_name )
	dw_list.SetItem( li_nr, "batch_id", il_batch_id )
next

for i = 1 to dw_list.rowcount()
	dw_list.SetItem( i, "item_id", i )
next

dw_list.update()
dw_list.retrieve(il_batch_id)

//find the last added
li_find = dw_list.Find( "prac_id = " + String( ll_prac_id ), 1, 1000 )
IF li_find > 0 THEN 
	dw_list.scrolltorow(li_find)
	dw_list.setrow(li_find)
	dw_list.selectrow(0,false)
	dw_list.selectrow(li_find,true)
end if




return 1
end function

event open;long b
string bname

b = message.doubleparm

dw_list.settransobject(sqlca)
dw_list.retrieve(b)

dw_name.settransobject(sqlca)
dw_name.retrieve(b)

il_batch_id = b

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

on w_batch_list_edit.create
this.cb_non=create cb_non
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_print=create dw_print
this.dw_name=create dw_name
this.cb_as=create cb_as
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cb_del=create cb_del
this.cb_add=create cb_add
this.dw_list=create dw_list
this.dw_copy=create dw_copy
this.Control[]={this.cb_non,&
this.cb_2,&
this.cb_1,&
this.dw_print,&
this.dw_name,&
this.cb_as,&
this.cb_close,&
this.cb_save,&
this.cb_del,&
this.cb_add,&
this.dw_list,&
this.dw_copy}
end on

on w_batch_list_edit.destroy
destroy(this.cb_non)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_print)
destroy(this.dw_name)
destroy(this.cb_as)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cb_del)
destroy(this.cb_add)
destroy(this.dw_list)
destroy(this.dw_copy)
end on

type cb_non from commandbutton within w_batch_list_edit
integer x = 41
integer y = 1988
integer width = 402
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Non-Pracs"
end type

event clicked;//Start Code Change ---- 10.04.2006 #667 maha
//cb_non added 071106
of_batch_add("N")
dw_list.setredraw(true)
end event

type cb_2 from commandbutton within w_batch_list_edit
integer x = 1303
integer y = 1892
integer width = 402
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Display Syntax"
end type

event clicked;string ls_sql

// mskinner 20 dec 2005 -- begin
if dw_name.rowcount() < 1 then return 
// mskinner 20 dec 2005 -- end 
ls_sql = dw_name.getitemstring( 1, "create_sql")

openwithparm(w_sql_msg,ls_sql)
end event

type cb_1 from commandbutton within w_batch_list_edit
integer x = 1303
integer y = 1984
integer width = 402
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Print List"
end type

event clicked;cb_save.triggerevent(clicked!)
dw_print.settransobject(sqlca)
dw_print.retrieve(il_batch_id)
dw_print.print()
end event

type dw_print from datawindow within w_batch_list_edit
boolean visible = false
integer x = 1509
integer y = 2036
integer width = 87
integer height = 72
integer taborder = 30
string dataobject = "d_batch_items_print_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_name from datawindow within w_batch_list_edit
integer x = 41
integer y = 16
integer width = 1390
integer height = 92
integer taborder = 10
string dataobject = "d_batch_rename"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_as from commandbutton within w_batch_list_edit
integer x = 878
integer y = 1984
integer width = 402
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save List As"
end type

event clicked;integer l
integer n
integer lc
integer nr
string ls_bname
long ll_batch
long r
integer res
integer res1
debugbreak()

openwithparm(w_get_filter_name,"B")

ls_bname = message.stringparm
//dw_batch_detail.settransobject(sqlca)
if ls_bname = "Cancel" then return

dw_name.insertrow(1)
dw_name.setitem(1,"batch_name",ls_bname)
dw_name.setitem(1,"last_mod",today())
dw_name.setitem(1,"mod_by",gs_user_id)
dw_name.setitem(1,"create_date",today())
dw_name.setitem(1,"create_by",gs_user_id)

select max(batch_id) into :ll_batch from sys_batch_list;
if isnull(ll_batch) or ll_batch < 1 then ll_batch = 0
ll_batch++
dw_name.setitem(1,"batch_id",ll_batch)
//res = dw_batch_detail.update()
//if res < 1 then
//	messagebox("Save Error","Unable to save batch")
//	return -1
//end if
//dw_batch_detail.reset()
//create the batch list items
dw_copy.settransobject(sqlca)
dw_copy.reset()
dw_list.RowsCopy (1, dw_list.rowcount(), primary!, dw_copy, 100000, 	primary!)
for r = 1 to dw_copy.rowcount()
	//nr = dw_list.insertrow(0)	
	dw_copy.setitem(r,"batch_id",ll_batch)
	//dw_list.setitem(r,"item_id",r)
	//dw_list.setitem(r,"prac_id",dw_list.getitemnumber(r,"prac_id"))
//	ist_search.ls_name[r] = lds_prac_list.getitemstring(r,"v_full_name_full_name")
next
//if updates ok reretrieve new batch otherwise retrieve org batch
res = dw_name.update()
if res = 1 then
	res1 = dw_copy.update()
	if res1 = 1 then
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-01
		//$<modify> 02.14.2006 By: owen chen
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

		/*
		commit using sqlca;
		dw_list.retrieve(ll_batch)
		dw_name.retrieve(ll_batch)
		il_batch_id = ll_batch
		*/
		
		gnv_appeondb.of_startqueue( )
		
		commit using sqlca;
		dw_list.retrieve(ll_batch)
		dw_name.retrieve(ll_batch)
		
		gnv_appeondb.of_commitqueue( )
		il_batch_id = ll_batch		
		
		//---------------------------- APPEON END ----------------------------


	else
		messagebox("Save Error","Unable to save new batch list")
		return -1
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-02
		//$<modify> 02.14.2006 By: owen chen
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
		/*
		rollback;
		dw_list.retrieve(il_batch_id)
		dw_name.retrieve(il_batch_id)
		*/
		
		gnv_appeondb.of_startqueue( )
		
		rollback;
		dw_list.retrieve(il_batch_id)
		dw_name.retrieve(il_batch_id)

		gnv_appeondb.of_commitqueue( )
		
		//---------------------------- APPEON END ----------------------------

	end if
else
	messagebox("Save Error","Unable to save new batch name")
	return -1
	//--------------------------- APPEON BEGIN ---------------------------
	//$<ID> PT-03
	//$<modify> 02.14.2006 By: owen chen
	//$<reason> Performance tuning
	//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
	/*
	rollback;
	dw_list.retrieve(il_batch_id)
	dw_name.retrieve(il_batch_id)
	*/
	
	gnv_appeondb.of_startqueue( )
	
	rollback;
	dw_list.retrieve(il_batch_id)
	dw_name.retrieve(il_batch_id)
	
	gnv_appeondb.of_commitqueue( )
	
	//---------------------------- APPEON END ----------------------------

end if




end event

type cb_close from commandbutton within w_batch_list_edit
integer x = 1723
integer y = 1892
integer width = 402
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

event clicked;closewithreturn(parent,il_batch_id)
end event

type cb_save from commandbutton within w_batch_list_edit
integer x = 878
integer y = 1892
integer width = 402
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Save"
end type

event clicked;
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-04
//$<modify> 02.14.2006 By: owen chen
//$<reason> Performance tuning
//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
/*
dw_list.update()
dw_name.update()
commit using sqlca;
*/

gnv_appeondb.of_startqueue( )

dw_list.update()
dw_name.update()
commit using sqlca;

gnv_appeondb.of_commitqueue( )

//---------------------------- APPEON END ----------------------------
end event

type cb_del from commandbutton within w_batch_list_edit
integer x = 457
integer y = 1892
integer width = 402
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Delete"
end type

event clicked;integer r
integer res

//res = messagebox("Delete","Are you sure you wish to delete the selected practitioner?",question!,yesno!,2)

//if res = 1 then
	dw_list.deleterow(dw_list.getrow())
	//dw_list.update()
	//commit using sqlca;
//end if

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 08/22/2007 By: Ken.Guo
//$<reason> BugG081403.Because item_id is PK, So update it alone.
/*
dw_list.selectrow(dw_list.getrow(),true)
for r = 1 to dw_list.rowcount()
	dw_list.setitem(r,"item_id",r)
next
dw_list.update()
*/
Long ll_row
ll_row = dw_list.getrow()
dw_list.setredraw(False)
dw_list.update()
dw_list.Retrieve(il_batch_id)
for r = 1 to dw_list.rowcount()
	dw_list.setitem(r,"item_id",r)
next
dw_list.update()
dw_list.scrolltorow(ll_row)
dw_list.setrow(ll_row)
dw_list.selectrow(ll_row,true)
dw_list.setredraw(True)
//---------------------------- APPEON END ----------------------------

end event

type cb_add from commandbutton within w_batch_list_edit
integer x = 41
integer y = 1892
integer width = 402
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Practitioner"
end type

event clicked;//Start Code Change ---- 10.04.2006 #668 maha
of_batch_add("P")
dw_list.setredraw(true)
//Integer li_nr
//Integer li_find
//integer i
//integer ic
//Long ll_prac_id
//String ls_full_name
//gs_search lstr_search
//gs_batch_search ist_search
//
//lstr_search.stran_transaction = SQLCA
//
//lstr_search.ls_open_for = "REPORTS0" 
//
////messagebox("", lstr_search.ls_open_for )
//OpenWithParm( w_extended_search_new , lstr_search )
//
//IF Message.DoubleParm = -1 THEN
//	Return -1
//END IF
//
////maha app101305 for multi select
//ist_search = message.powerobjectparm
////maha 091605 allowing for multi selection
//
//// mskinner 20 dec 2005 -- begin
//  if not isvalid(message.powerobjectparm) then return 0
//// mskinner 20 dec 2005 -- end
//
//
//ic = upperbound(ist_search.li_prac_id[])
//for i = 1 to ic
////ll_prac_id = Long( Mid( Message.StringParm, 1, Pos( Message.StringParm, "-" ) -1 ) )
////ls_full_name = Mid( Message.StringParm, Pos( Message.StringParm, "-" ) +1, 100 )
//	ll_prac_id = ist_search.li_prac_id[i] //maha 091605
//	select full_name into :ls_full_name from v_full_name where prac_id = :ll_prac_id;
//	//ls_full_name = ist_search.ls_name[i] //maha 091605
//
//	li_find = dw_list.Find( "prac_id = " + String( ll_prac_id ), 1, 1000 )
//	
//	IF li_find > 0 THEN
//		//MessageBox("Select Error", "You have allready selected this person to attend!, Please reselect." )
//		Return -1
//	END IF
//	
//	li_nr = dw_list.InsertRow( 0 )
//
//	dw_list.SetItem( li_nr, "prac_id", ll_prac_id )
//	dw_list.SetItem( li_nr, "full_name", ls_full_name )
//	dw_list.SetItem( li_nr, "batch_id", il_batch_id )
//next
//
//for i = 1 to dw_list.rowcount()
//	dw_list.SetItem( i, "item_id", i )
//next
//
//dw_list.scrolltorow(li_nr)
//dw_list.setrow(li_nr)
//dw_list.selectrow(0,false)
//dw_list.selectrow(li_nr,true)
//End Code Change---07.11.2006
end event

type dw_list from datawindow within w_batch_list_edit
integer x = 37
integer y = 120
integer width = 2085
integer height = 1748
integer taborder = 20
string dataobject = "d_batch_items_list_w_name"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;integer r

r = this.getclickedrow()

this.setrow(r)
end event

event rowfocuschanged;


this.selectrow(0,false)
this.selectrow(this.getrow(),true)
end event

type dw_copy from datawindow within w_batch_list_edit
boolean visible = false
integer x = 1143
integer y = 1496
integer width = 494
integer height = 360
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_batch_items_list_w_name"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

