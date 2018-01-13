$PBExportHeader$w_invoice_printing.srw
forward
global type w_invoice_printing from w_master
end type
type dw_facility from datawindow within w_invoice_printing
end type
type cb_up from commandbutton within w_invoice_printing
end type
type cb_2 from commandbutton within w_invoice_printing
end type
type st_2a from statictext within w_invoice_printing
end type
type st_1a from statictext within w_invoice_printing
end type
type em_to from editmask within w_invoice_printing
end type
type em_from from editmask within w_invoice_printing
end type
type gb_3 from groupbox within w_invoice_printing
end type
type gb_f from groupbox within w_invoice_printing
end type
type dw_browse from u_dw within w_invoice_printing
end type
type cb_3 from commandbutton within w_invoice_printing
end type
type rb_ddr from radiobutton within w_invoice_printing
end type
type rb_all from radiobutton within w_invoice_printing
end type
type rb_sdree from radiobutton within w_invoice_printing
end type
type rb_ldr from radiobutton within w_invoice_printing
end type
type gb_1 from groupbox within w_invoice_printing
end type
type cb_1 from commandbutton within w_invoice_printing
end type
type cbx_1 from checkbox within w_invoice_printing
end type
type cbx_2 from checkbox within w_invoice_printing
end type
type cbx_3 from checkbox within w_invoice_printing
end type
type cbx_4 from checkbox within w_invoice_printing
end type
end forward

global type w_invoice_printing from w_master
int X=14
int Y=16
int Width=3621
int Height=2292
WindowType WindowType=popup!
boolean TitleBar=true
string Title="Print Invoices"
long BackColor=79680469
boolean MaxBox=false
boolean Resizable=false
dw_facility dw_facility
cb_up cb_up
cb_2 cb_2
st_2a st_2a
st_1a st_1a
em_to em_to
em_from em_from
gb_3 gb_3
gb_f gb_f
dw_browse dw_browse
cb_3 cb_3
rb_ddr rb_ddr
rb_all rb_all
rb_sdree rb_sdree
rb_ldr rb_ldr
gb_1 gb_1
cb_1 cb_1
cbx_1 cbx_1
cbx_2 cbx_2
cbx_3 cbx_3
cbx_4 cbx_4
end type
global w_invoice_printing w_invoice_printing

type variables
integer ii_facil
integer ii_usedates = 1
long il_status
long il_prac
long il_req
string is_type
string is_ret_type
end variables

on w_invoice_printing.create
int iCurrent
call super::create
this.dw_facility=create dw_facility
this.cb_up=create cb_up
this.cb_2=create cb_2
this.st_2a=create st_2a
this.st_1a=create st_1a
this.em_to=create em_to
this.em_from=create em_from
this.gb_3=create gb_3
this.gb_f=create gb_f
this.dw_browse=create dw_browse
this.cb_3=create cb_3
this.rb_ddr=create rb_ddr
this.rb_all=create rb_all
this.rb_sdree=create rb_sdree
this.rb_ldr=create rb_ldr
this.gb_1=create gb_1
this.cb_1=create cb_1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.cbx_3=create cbx_3
this.cbx_4=create cbx_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_facility
this.Control[iCurrent+2]=this.cb_up
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_2a
this.Control[iCurrent+5]=this.st_1a
this.Control[iCurrent+6]=this.em_to
this.Control[iCurrent+7]=this.em_from
this.Control[iCurrent+8]=this.gb_3
this.Control[iCurrent+9]=this.gb_f
this.Control[iCurrent+10]=this.dw_browse
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.rb_ddr
this.Control[iCurrent+13]=this.rb_all
this.Control[iCurrent+14]=this.rb_sdree
this.Control[iCurrent+15]=this.rb_ldr
this.Control[iCurrent+16]=this.gb_1
this.Control[iCurrent+17]=this.cb_1
this.Control[iCurrent+18]=this.cbx_1
this.Control[iCurrent+19]=this.cbx_2
this.Control[iCurrent+20]=this.cbx_3
this.Control[iCurrent+21]=this.cbx_4
end on

on w_invoice_printing.destroy
call super::destroy
destroy(this.dw_facility)
destroy(this.cb_up)
destroy(this.cb_2)
destroy(this.st_2a)
destroy(this.st_1a)
destroy(this.em_to)
destroy(this.em_from)
destroy(this.gb_3)
destroy(this.gb_f)
destroy(this.dw_browse)
destroy(this.cb_3)
destroy(this.rb_ddr)
destroy(this.rb_all)
destroy(this.rb_sdree)
destroy(this.rb_ldr)
destroy(this.gb_1)
destroy(this.cb_1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.cbx_3)
destroy(this.cbx_4)
end on

event open;call super::open;long ll_batch_id
long ll_pracs[]
integer ic
integer i
integer li_type
long p
datawindowchild dwchild
integer li_facility_id
gs_batch_search lst_sent

//lst_sent = message.powerobjectparm
//ll_pracs[] = lst_sent.li_prac_id[]
////if upperbound(ll_pracs[]) < 0 then return
//
//if upperbound(ll_pracs[]) = 0 then
//	open(w_practitioner_filter_choice)
//	
//	if message.stringparm = "C" then  //cancel
//		return -1
//	elseif isnumber(message.stringparm) then //selcted batch
//		ll_batch_id  = long(message.stringparm)
//		n_ds lds_batch
//		lds_batch = CREATE n_ds
//		lds_batch.DataObject = "d_batch_items_list"
//		lds_batch.of_SetTransObject( SQLCA )
//		ic = lds_batch.retrieve(ll_batch_id) 
//		for i = 1 to ic
//			ll_pracs[i] = long(lds_batch.getitemnumber(i,"prac_id"))
//		next
//	elseif message.stringparm = "B" then //batch window
//		gs_batch_search lst_search
//		OpenWithParm( w_batch_prac_select_new , "R" )
//		lst_search = message.powerobjectparm
//		for i = 1 to upperbound(lst_search.li_prac_id[])
//			p = lst_search.li_prac_id[i]
//			//messagebox("",p)
//			ll_pracs[i] = long(lst_search.li_prac_id[i])
//		next
//	elseif message.stringparm = "S" then //single
//		gs_search lstr_search
//		lstr_search.stran_transaction = SQLCA
//		lstr_search.ls_open_for = "ACTIONITEMS"
//		OpenWithParm( w_extended_search_new , lstr_search )
//		IF Message.DoubleParm = -1 THEN 
//			Return -1
//		else
//		ll_pracs[1] = long(Message.stringParm)
//			//messagebox("",ls_pracids)
//		end if
//	end if
//else
// 	li_type = lst_sent.ll_app[1]
//	li_facility_id = lst_sent.ll_facility[1]
////	if li_type = 1 then
////		is_type = "R"
////	elseif li_type = 2 then
////		is_type = "U"
////	else
////		is_type = "R"
////	end if
//end if
//
//if li_type = 1 then
//	is_type = "R"
//elseif li_type = 2 then
//	is_type = "U"
//else
//	is_type = "R"
//end if
////messagebox("",is_type)
//dw_browse.settransobject(sqlca)
//
dw_facility.settransobject(sqlca)

dw_facility.getchild("facility_facility_id",dwchild)
dwchild.settransobject(sqlca)
dwchild.retrieve(gs_user_id)
//dw_facility.retrieve(gs_user_id)
dw_facility.insertrow(1)
if li_facility_id < 1 or isnull(li_facility_id) then
	SELECT security_users.default_search_facility  
	INTO :li_facility_id  
	FROM security_users  
	WHERE security_users.user_id = :gs_user_id;
end if

IF Not IsNull( li_facility_id ) THEN //set user default facility
	dw_facility.SetItem( 1, "facility_facility_id", li_facility_id )
END IF
ii_facil = li_facility_id
//
//
//
//dw_pracs.settransobject(sqlca)
//p = dw_pracs.retrieve(ll_pracs[])
//
//if p > 0 then
//	il_prac = dw_pracs.getitemnumber(1,"prac_id")
//	//messagebox("il_prac",il_prac)
//	//messagebox("ii_facil",ii_facil)
//	//messagebox("",is_type)
//	//of_retrieve_data(is_type)
//	dw_pracs.selectrow(1,true)
//end if
//
//select lookup_code into :il_req from code_lookup where lookup_name = 'Privilege Status'  and code = 'REQST';
//if il_req < 19 then
//	messagebox("Lookup table error", "Unable to find the Requested Status Record.  No data will be updatable.~rCheck your Privilege Status lookup table for a record with the code of 'REQST' ")
//end if
//
//if dw_pracs.rowcount() > 1 then
//	rb_all.checked = true
//	rb_one.checked = false
//elseif dw_pracs.rowcount() = 1 then
//	rb_all.checked = false
//	rb_all.enabled = false
//	rb_one.checked = true
//else
//	rb_all.checked = false
//	rb_one.checked = false
//end if
//
//if is_type = "U" then
//	rb_update.checked = true
//	rb_update.triggerevent(clicked!)
//elseif is_type = "R" then
//	rb_recred.checked = true
//	rb_recred.triggerevent(clicked!)
//end if
//
end event

event closequery;//no message
end event

type dw_facility from datawindow within w_invoice_printing
int X=78
int Y=84
int Width=837
int Height=84
int TabOrder=60
string DataObject="d_facility_users_batch"
boolean Border=false
boolean LiveScroll=true
end type

event itemchanged;ii_facil = integer(data)



end event

type cb_up from commandbutton within w_invoice_printing
int X=2523
int Y=252
int Width=247
int Height=84
int TabOrder=90
string Text="Preview"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;date ld_from
date ld_to
integer i
integer rc
integer res
long p
long pcnt
long rcnt


//dw_browse.SetRedraw(False)

ld_from = date(em_from.text)
ld_to = date(em_to.text)
//messagebox("ld_from",em_from.text)

if  ii_facil < 1 then
	messagebox("User Select Error","You must select a facility to run this function.")
	return
end if
//
//if  il_status < 1 then
//	messagebox("Missing Value","You must have a Status.")
//	return
//end if

if em_from.text = "" then ld_from = date(01-01-1950)
if em_to.text = ""  then ld_to = date(12-31-2099)
//messagebox("ii_usedates",ii_usedates)
if ii_usedates = 1 then
	dw_browse.retrieve(ii_facil,ld_from,ld_to)
else
	dw_browse.retrieve(ii_facil)
end if

end event

type cb_2 from commandbutton within w_invoice_printing
int X=3319
int Y=252
int Width=247
int Height=84
int TabOrder=20
string Text="Close"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type st_2a from statictext within w_invoice_printing
int X=1627
int Y=96
int Width=229
int Height=64
boolean Enabled=false
string Text="End Date"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1a from statictext within w_invoice_printing
int X=1042
int Y=96
int Width=247
int Height=84
boolean Enabled=false
string Text="Start Date"
Alignment Alignment=Right!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_to from editmask within w_invoice_printing
int X=1870
int Y=84
int Width=315
int Height=84
int TabOrder=80
BorderStyle BorderStyle=StyleLowered!
string Mask="[date]"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type em_from from editmask within w_invoice_printing
int X=1303
int Y=84
int Width=311
int Height=84
int TabOrder=70
BorderStyle BorderStyle=StyleLowered!
string Mask="[date]"
MaskDataType MaskDataType=DateMask!
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_3 from groupbox within w_invoice_printing
int X=2318
int Y=8
int Width=1257
int Height=204
int TabOrder=100
string Text="InvoiceType"
BorderStyle BorderStyle=StyleLowered!
long TextColor=128
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_f from groupbox within w_invoice_printing
int X=41
int Y=4
int Width=960
int Height=212
int TabOrder=50
string Text="Select Facility"
BorderStyle BorderStyle=StyleLowered!
long TextColor=128
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_browse from u_dw within w_invoice_printing
int X=41
int Y=360
int Width=3534
int Height=1708
int TabOrder=10
string DataObject="d_frm_facility_invoice_summary"
boolean HScrollBar=true
end type

event clicked;//
//Integer li_row
//
//li_row = This.GetClickedRow( )
//
//IF li_row < 1 THEN
//	Return
//END IF
//
//
//This.ScrollToRow( li_row )
//This.SetRow( li_row )
////this.selectrow(0,false)
////this.selectrow(li_row,true)
//
end event

event doubleclicked;call super::doubleclicked;
//long ll_core
//integer li_row
//integer li_end
//
//if this.rowcount() > 0 then
//	tab_1.selecttab (2)
//	
//end if
end event

event rowfocuschanged;call super::rowfocuschanged;
//IF tab_1.tabpage_detail.dw_detail.RowCount() >= currentrow THEN
	//tab_1.tabpage_detail.dw_detail.SetRow( currentrow )
	//tab_1.tabpage_detail.dw_detail.ScrollToRow( currentrow )
//END IF
//this.selectrow(0,false)
//this.selectrow(this.getrow(),true)

//st_recs.Text = "Record " + String(This.GetRow()) + " of " + String(This.RowCount())
end event

event pfc_deleterow;
integer res

res = messagebox("Delete","Are you sure you wish to delete the selected privilege?",Question!,yesno!,2)

if res = 1 then
	this.deleterow(this.getrow())
end if

this.update()

return 0
end event

event buttonclicked;call super::buttonclicked;integer i

for i = 1 to this.rowcount()
	this.setitem(i,"selected",1)
next
end event

event constructor;call super::constructor;this.settransobject(sqlca)
end event

type cb_3 from commandbutton within w_invoice_printing
int X=2784
int Y=252
int Width=256
int Height=84
int TabOrder=30
boolean BringToTop=true
string Text="Print"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.print()
end event

type rb_ddr from radiobutton within w_invoice_printing
int X=2994
int Y=52
int Width=544
int Height=76
boolean BringToTop=true
string Text="Detail (Date Range)"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.dataobject = "d_frm_facility_invoice_detail"
dw_browse.settransobject(sqlca)
dw_browse.title = "Detail Date Range"
ii_usedates = 1
end event

type rb_all from radiobutton within w_invoice_printing
int X=2990
int Y=128
int Width=549
int Height=76
boolean BringToTop=true
string Text="All Open (No Range)"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.dataobject = "d_frm_facility_invoice_all_open"
dw_browse.settransobject(sqlca)
dw_browse.title = "All Open"

ii_usedates = 0
end event

type rb_sdree from radiobutton within w_invoice_printing
int X=2359
int Y=60
int Width=581
int Height=76
boolean BringToTop=true
string Text="Summary (Date Range)"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.dataobject = "d_frm_facility_invoice_summary"
dw_browse.settransobject(sqlca)
dw_browse.title = "Summary Date Range"
//st_mess.text = "Sets all REQUESTED Privileges to the update settings ,and sends all other active privileges to history."
ii_usedates = 1
end event

type rb_ldr from radiobutton within w_invoice_printing
int X=2359
int Y=128
int Width=571
int Height=76
boolean BringToTop=true
string Text="List (Date Range)"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.dataobject = "d_frm_facility_invoice_4_date"
dw_browse.settransobject(sqlca)
dw_browse.title = "List Date Range"
ii_usedates = 1
end event

type gb_1 from groupbox within w_invoice_printing
int X=1015
int Y=4
int Width=1285
int Height=208
int TabOrder=40
string Text="Invoice Date Range"
BorderStyle BorderStyle=StyleLowered!
long TextColor=128
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_1 from commandbutton within w_invoice_printing
int X=3054
int Y=252
int Width=247
int Height=84
int TabOrder=110
boolean BringToTop=true
string Text="Help"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;openwithparm(w_help_window,1)
end event

type cbx_1 from checkbox within w_invoice_printing
int X=78
int Y=232
int Width=599
int Height=76
boolean Visible=false
boolean BringToTop=true
string Text="Summary (Date Range)"
BorderStyle BorderStyle=StyleLowered!
boolean Checked=true
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.dataobject = "d_frm_facility_invoice_summary"
dw_browse.settransobject(sqlca)
dw_browse.title = "Summary Date Range"
//st_mess.text = "Sets all REQUESTED Privileges to the update settings ,and sends all other active privileges to history."
ii_usedates = 1
end event

type cbx_2 from checkbox within w_invoice_printing
int X=73
int Y=312
int Width=457
int Height=76
boolean Visible=false
boolean BringToTop=true
string Text="List (Date Range)"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.dataobject = "d_frm_facility_invoice_4_date"
dw_browse.settransobject(sqlca)
dw_browse.title = "List Date Range"
ii_usedates = 1
end event

type cbx_3 from checkbox within w_invoice_printing
int X=731
int Y=236
int Width=530
int Height=76
boolean Visible=false
boolean BringToTop=true
string Text="Detail (Date Range)"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.dataobject = "d_frm_facility_invoice_detail"
dw_browse.settransobject(sqlca)
dw_browse.title = "Detail Date Range"
ii_usedates = 1
end event

type cbx_4 from checkbox within w_invoice_printing
int X=704
int Y=316
int Width=530
int Height=76
boolean Visible=false
boolean BringToTop=true
string Text="All Open (No Range)"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_browse.dataobject = "d_frm_facility_invoice_all_open"
dw_browse.settransobject(sqlca)
dw_browse.title = "All Open"

ii_usedates = 0
end event

