$PBExportHeader$pfc_cst_u_group_data.sru
forward
global type pfc_cst_u_group_data from userobject
end type
type tab_1 from tab within pfc_cst_u_group_data
end type
type tabpage_browse from userobject within tab_1
end type
type dw_browse from u_dw within tabpage_browse
end type
type tabpage_browse from userobject within tab_1
dw_browse dw_browse
end type
type tabpage_detail from userobject within tab_1
end type
type dw_detail from u_dw within tabpage_detail
end type
type tabpage_detail from userobject within tab_1
dw_detail dw_detail
end type
type tab_1 from tab within pfc_cst_u_group_data
tabpage_browse tabpage_browse
tabpage_detail tabpage_detail
end type
type dw_select_section from u_dw within pfc_cst_u_group_data
end type
end forward

global type pfc_cst_u_group_data from userobject
integer width = 3465
integer height = 1688
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
tab_1 tab_1
dw_select_section dw_select_section
end type
global pfc_cst_u_group_data pfc_cst_u_group_data

type variables
long il_gpid = 0
long il_table

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-01
//$<add> 03.13.2006 By: LeiWei
//$<modification> Define variables to be used in subsequent script.
Long ii_screen
//---------------------------- APPEON END ----------------------------

end variables

forward prototypes
public function integer of_setup_dw (integer ai_table)
public function integer of_retrieve_data (integer ai_screen)
public function integer of_add ()
public function integer additem (string i)
public function integer of_delete ()
public function integer of_save ()
public function integer of_set_calendar (u_dw as_dw, string as_field)
public function integer of_retrieve_child (string as_field, string as_lookup)
end prototypes

public function integer of_setup_dw (integer ai_table);datawindowchild dwchild1,dwchild2,dwchild3,dwchild4,dwchild5
datawindowchild dwchild81
//Start Code Change ---- 01.10.2006 # maha
//Start Code Change ---- 06.13.2006 #536 maha  //changed to function calls
choose case ai_table
	case 80 //lan
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-03
		//$<add> 01.17.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

		gnv_appeondb.of_startqueue( )
		//---------------------------- APPEON END ----------------------------

		of_retrieve_child("foreign_language","Foreign Languages")
		of_retrieve_child("speak","Yes/No")
		of_retrieve_child("reads","Yes/No")
		of_retrieve_child("writes","Yes/No")
		of_retrieve_child("sign","Yes/No")
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-04
		//$<add> 01.17.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

		gnv_appeondb.of_commitqueue( )
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Modify> 2007-08-18 By: Scofield
		//$<Reason> because in of_retrieve_child function,it has insert black row,so comment these code
		
//		tab_1.tabpage_detail.dw_detail.GetChild( "foreign_language", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "speak", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "reads", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "writes", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "sign", dwchild )
//		dwchild.InsertRow( 1 )
		//---------------------------- APPEON END ----------------------------
		
		//---------------------------- APPEON END ----------------------------
		
	case 81//question
		tab_1.tabpage_detail.dw_detail.GetChild( "answer_code", dwchild81 )
		dwchild81.SetTransObject( SQLCA )
		dwchild81.Retrieve("Question Answers")
		dwchild81.InsertRow( 1 )
	case 82//cover/partner
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-05
		//$<add> 01.17.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

		gnv_appeondb.of_startqueue( )
		//---------------------------- APPEON END ----------------------------

		of_retrieve_child("title_code","Title")
		of_retrieve_child("partner","Partner Covering")
		of_retrieve_child("specialty","Practitioner Specialties")
		of_retrieve_child("provider_type","Professional Suffix")
		//Start Code Change ---- 06.02.2006 #495 maha
		of_retrieve_child("license_state","State")
		//End Code Change---06.02.2006

		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-06
		//$<add> 01.17.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

		gnv_appeondb.of_commitqueue( )
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Modify> 2007-08-18 By: Scofield
		//$<Reason> Because in of_retrieve_child function,it has insert black row,so comment these code

//		tab_1.tabpage_detail.dw_detail.GetChild( "title_code", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "partner", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "specialty", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "provider_type", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "license_state", dwchild )
//		dwchild.InsertRow( 1 )
		//---------------------------- APPEON END ----------------------------

		//---------------------------- APPEON END ----------------------------
	case 83//ids
		of_retrieve_child("id_type","Other Document Type")
	case 84//ins
		of_retrieve_child("carrier_code","Insurance Companies")
		//--------------------------- APPEON BEGIN ---------------------------
		//$<add> 08.04.2006 By: LeiWei
		//$<reason> Fix a defect.
		of_retrieve_child("claims_made_occurrence","Coverage type")
		//---------------------------- APPEON END ----------------------------
	case 85 //practice data
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-07
		//$<add> 01.17.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

		gnv_appeondb.of_startqueue( )
		//---------------------------- APPEON END ----------------------------
		
		of_retrieve_child("after_hours_coverage","Yes/No")
		of_retrieve_child("after_hours_type","After Hours Type")
		of_retrieve_child("prefered_contact_method","Preferred Contact Method")
		of_retrieve_child("gender_limitations","Gender")
		of_retrieve_child("primary_tax_id","Tax Id Preferred")
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-08
		//$<add> 01.17.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.

		gnv_appeondb.of_commitqueue( )
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Modify> 2007-08-18 By: Scofield
		//$<Reason> Because in of_retrieve_child function,it has insert black row,so comment these code
		
//		tab_1.tabpage_detail.dw_detail.GetChild( "after_hours_coverage", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "after_hours_type", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "prefered_contact_method", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "gender_limitations", dwchild )
//		dwchild.InsertRow( 1 )
//		tab_1.tabpage_detail.dw_detail.GetChild( "primary_tax_id", dwchild )
//		dwchild.InsertRow( 1 )
		//---------------------------- APPEON END ----------------------------

		//---------------------------- APPEON END ----------------------------
		
		//--------------------------- APPEON BEGIN ---------------------------
		//$<Modify> 2007-08-10 By: Scofield
		//$<Reason> Display tab_1.tabpage_browse.dw_browse's dddw column
		tab_1.tabpage_browse.dw_browse.GetChild("after_hours_coverage", dwchild1 )
		dwchild1.SetTransObject( SQLCA )
		
		tab_1.tabpage_browse.dw_browse.GetChild("after_hours_type", dwchild2 )
		dwchild2.SetTransObject( SQLCA )
		
		tab_1.tabpage_browse.dw_browse.GetChild("prefered_contact_method", dwchild3 )
		dwchild3.SetTransObject( SQLCA )
		
		tab_1.tabpage_browse.dw_browse.GetChild("gender_limitations", dwchild4 )
		dwchild4.SetTransObject( SQLCA )
		
		tab_1.tabpage_browse.dw_browse.GetChild("primary_tax_id", dwchild5 )
		dwchild5.SetTransObject( SQLCA )
		
		gnv_appeondb.of_startqueue( )
			dwchild1.Retrieve("Yes/No")		
			dwchild2.Retrieve("After Hours Type")
			dwchild3.Retrieve("Preferred Contact Method")
			dwchild4.Retrieve("Gender")
			dwchild5.Retrieve("Tax Id Preferred")
		gnv_appeondb.of_commitqueue( )		
		
		//---------------------------- APPEON END ----------------------------
end choose
//End Code Change---06.13.2006

of_set_calendar( tab_1.tabpage_detail.dw_detail,"")
//End Code Change---01.10.2005 
return 1
end function

public function integer of_retrieve_data (integer ai_screen);//called from rfc of dw_select_section

integer r
long li_recid
datawindowchild dwchild
//Start Code Change ---- 06.14.2006 #542 maha
tab_1.tabpage_browse.enabled = true

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-07
//$<add> 03.13.2006 By: LeiWei
//$<reason> Performance tuning
//$<modification> Have the application change the objects only when ai_screen is changed.
//$<modification> Refer to PT-08 for more information.
If ai_screen <> ii_screen Then
//---------------------------- APPEON END ----------------------------

Choose case ai_screen
	case 80 //language
		tab_1.tabpage_browse.dw_browse.dataobject = "d_gp_language_browse"
		tab_1.tabpage_detail.dw_detail.dataobject = "d_gp_language_detail"
	case 81//questions
		tab_1.tabpage_browse.dw_browse.dataobject = "d_gp_quest_browse"
		tab_1.tabpage_detail.dw_detail.dataobject = "d_gp_quest_detail"
	case 82//partners covering
		tab_1.tabpage_browse.dw_browse.dataobject = "d_gp_owner_covering_browse"
		tab_1.tabpage_detail.dw_detail.dataobject = "d_gp_owner_covering_detail"
	case 83//ids
		tab_1.tabpage_browse.dw_browse.dataobject = "d_gp_other_ids_browse"
		tab_1.tabpage_detail.dw_detail.dataobject = "d_gp_other_ids_detail"
	case 84//insurance
		tab_1.tabpage_browse.dw_browse.dataobject = "d_gp_insurance_browse"
		tab_1.tabpage_detail.dw_detail.dataobject = "d_gp_insurance_detail"
	case 85//practice info
		tab_1.tabpage_browse.dw_browse.dataobject = "d_gp_practice_info_browse"
		tab_1.tabpage_detail.dw_detail.dataobject = "d_gp_practice_info_detail"
		//tab_1.tabpage_browse.enabled = false		//Comment by Scofield
end choose
//End Code Change---06.14.2006

tab_1.tabpage_browse.dw_browse.settransobject( sqlca)
tab_1.tabpage_detail.dw_detail.settransobject( sqlca)

of_setup_dw(ai_screen)

//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-08
//$<add> 03.13.2006 By: LeiWei
//$<reason> Performance tuning.
//$<modification> Set the value of ai_screen to ii_screen. Refer to PT-07 for more information.

ii_screen = ai_screen
End If
//---------------------------- APPEON END ----------------------------

//tab_1.tabpage_browse.dw_browse.settransobject( sqlca)
//tab_1.tabpage_detail.dw_detail.settransobject( sqlca)

r = tab_1.tabpage_browse.dw_browse.retrieve(il_gpid)
tab_1.tabpage_browse.dw_browse.sharedata(tab_1.tabpage_detail.dw_detail)

if r < 0 then
	messagebox("Error","Retrieval error")
	return -1
elseif r = 0 then
	tab_1.post selecttab( 2) 
	tab_1.tabpage_detail.dw_detail.insertrow(1)
	//of_setup_dw(ai_screen)
elseif r = 1 then
	tab_1.post selecttab( 2) 
else
	tab_1.post selecttab(1) 
end if






return 1
end function

public function integer of_add ();integer i
integer r
gs_variable_array ls_array
long il_id[]
integer q
//--------------------------- APPEON BEGIN ---------------------------
//$<add> 06.19.2006 By: LeiWei
Long ll_record_id
//---------------------------- APPEON END ----------------------------

tab_1.selecttab(2)

if il_table = 81 then //question
	open (w_question_select)
	if message.stringparm = "Cancel" then
		return 1
	else
		ls_array = message.powerobjectparm
		il_id = ls_array.as_number
		for i = 1 to upperbound(il_id)
			r = tab_1.tabpage_detail.dw_detail.insertrow(0)
			tab_1.tabpage_detail.dw_detail.setitem(r,"gp_id",il_gpid)
			tab_1.tabpage_detail.dw_detail.setitem(r,"prac_id",il_gpid)
			tab_1.tabpage_detail.dw_detail.setitem(r,"question_id",il_id[i])
			//Start Code Change ---- 05.09.2006 #448 maha
			//--------------------------- APPEON BEGIN ---------------------------
			//$<modify> 06.19.2006 By: LeiWei
			//$<reason> Performance tuning
			//tab_1.tabpage_detail.dw_detail.setitem(r,"rec_id", gnv_app.of_Get_Id("RECORD_ID"))

			IF ll_record_id = 0 THEN ll_record_id = gnv_app.of_Get_Id("RECORD_ID", upperbound(il_id))
			ll_record_id ++
			tab_1.tabpage_detail.dw_detail.setitem(r,"rec_id", ll_record_id)

			//---------------------------- APPEON END ----------------------------
			//End Code Change---05.09.2006

		next
		
		tab_1.tabpage_detail.dw_detail.triggerevent("pfc_preupdate")

		//--------------------------- APPEON BEGIN ---------------------------
		//$<ID> PT-09
		//$<add> 01.17.2006 By: LeiWei
		//$<reason> Performance tuning
		//$<modification> Add Appeon Queue labels to reduce client-server interactions to improve runtime performance.
		/*
		q = tab_1.tabpage_detail.dw_detail.update()
		if q < 0 then messagebox("","update failed")
		tab_1.tabpage_detail.dw_detail.retrieve(il_gpid)
		*/
		gnv_appeondb.of_startqueue( )

		tab_1.tabpage_detail.dw_detail.update()
		tab_1.tabpage_detail.dw_detail.retrieve(il_gpid)

		gnv_appeondb.of_commitqueue( )
		
		//---------------------------- APPEON END ----------------------------
	end if
//Start Code Change ---- 06.14.2006 #543 maha
elseif il_table = 81 then //practice data single record
	//nothing
//End Code Change---06.14.2006
else
	r = tab_1.tabpage_detail.dw_detail.insertrow(0)
	tab_1.tabpage_detail.dw_detail.setrow(r)
	tab_1.tabpage_detail.dw_detail.scrolltorow( r)	
	tab_1.tabpage_detail.dw_detail.setitem(r,"gp_id",il_gpid)
	tab_1.tabpage_detail.dw_detail.setitem(r,"prac_id",il_gpid)
	
	tab_1.tabpage_detail.dw_detail.SetItemStatus(r,0,Primary!,NotModified!)		//Added by Scofield on 2008-12-30
end if

return 1





end function

public function integer additem (string i);//dfkjghfdkjgh

return 1
end function

public function integer of_delete ();integer r
integer res

r = tab_1.tabpage_detail.dw_detail.getrow()

res = messagebox("Delete","Are you sure you want to delete this record?",question!,yesno!,2)

if res = 1 then
	tab_1.tabpage_detail.dw_detail.deleterow(r)
end if

tab_1.tabpage_detail.dw_detail.update()

//----Begin Added by Alfee 12.12.2008 ---------------
//<$Reason>Synchronizing in browse datawindow
r = tab_1.tabpage_detail.dw_detail.getrow()
IF r > 0 AND tab_1.tabpage_browse.dw_browse.RowCount() >= r THEN
	tab_1.tabpage_browse.dw_browse.SetRow(r)
	tab_1.tabpage_browse.dw_browse.SelectRow(0, FALSE)
	tab_1.tabpage_browse.dw_browse.SelectRow(r, TRUE)
END IF
//----End Added --------------------------------------

return 1
end function

public function integer of_save ();integer i
long rec
//debugbreak()
//--------------------------- APPEON BEGIN ---------------------------
//$<ID> PT-10
//$<add> 03.31.2006 By: Cao YongWang
//$<reason> Performance tuning
//$<modification> Define a variable to 1)get the first ID; 2)Update the final ID
//$<modification> value into database.

rec = gnv_app.of_Get_Id("RECORD_ID") - 1
//---------------------------- APPEON END ----------------------------

tab_1.tabpage_detail.dw_detail.accepttext()//Start Code Change ---- 09.18.2007 #V7 maha
for i = 1 to tab_1.tabpage_detail.dw_detail.rowcount()
	if tab_1.tabpage_detail.dw_detail.getitemstatus( i, 0, primary!) = newmodified! or tab_1.tabpage_detail.dw_detail.getitemstatus( i, 0, primary!) = datamodified! then
		if isnull(tab_1.tabpage_detail.dw_detail.getitemnumber(i,"rec_id")) then
			//--------------------------- APPEON BEGIN ---------------------------
			//$<ID> PT-11 
			//$<modify> 03.31.2006 By: Cao YongWang
			//$<reason> Performance tuning.
			//$<modification> Comment out the following script to reduce client-server interaction.
			//$<modification> refer to PT-10 and of_get_id for more information.
			/*
			rec = gnv_app.of_Get_Id("RECORD_ID")
			*/
			rec++
			//---------------------------- APPEON END ----------------------------
			tab_1.tabpage_detail.dw_detail.setitem(i,"rec_id",rec)
		end if
	//Start Code Change ---- 03.09.2006 #333 maha moved out of if 
		tab_1.tabpage_detail.dw_detail.setitem(i,"gp_id",il_gpid)
		tab_1.tabpage_detail.dw_detail.setitem(i,"prac_id",il_gpid)
	elseif tab_1.tabpage_detail.dw_detail.getitemstatus( i, 0, primary!) = new! then
		tab_1.tabpage_detail.dw_detail.deleterow(i)
	end if
	
next

tab_1.tabpage_detail.dw_detail.update()

return 1
end function

public function integer of_set_calendar (u_dw as_dw, string as_field);//Start Code Change ---- 01.09.2006 #180 maha
//maha created 010906 for adding drop down calendars

as_dw.of_SetDropDownCalendar( TRUE )
as_dw.iuo_calendar.of_unRegister()
as_dw.iuo_calendar.of_Register(as_dw.iuo_calendar.DDLB)
//as_dw.iuo_calendar.of_Register(as_field,as_dw.iuo_calendar.DDLB)

return 1
//End Code Change---01.09.2005 
end function

public function integer of_retrieve_child (string as_field, string as_lookup);//Start Code Change ---- 06.13.2006 #535 maha
//created 061306 maha called from of_setup_dw
datawindowchild dwchild

tab_1.tabpage_detail.dw_detail.GetChild( as_field, dwchild )
dwchild.SetTransObject( SQLCA )
dwchild.Retrieve(as_lookup)
dwchild.Post InsertRow( 1 )   //Modified By Ken.Guo 09-25-2008. Use POST to jump out Appeon queue. 

return 1
end function

on pfc_cst_u_group_data.create
this.tab_1=create tab_1
this.dw_select_section=create dw_select_section
this.Control[]={this.tab_1,&
this.dw_select_section}
end on

on pfc_cst_u_group_data.destroy
destroy(this.tab_1)
destroy(this.dw_select_section)
end on

type tab_1 from tab within pfc_cst_u_group_data
integer x = 827
integer y = 20
integer width = 2587
integer height = 1644
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
tabposition tabposition = tabsonbottom!
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

type tabpage_browse from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2551
integer height = 1528
long backcolor = 67108864
string text = "Browse"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_browse dw_browse
end type

on tabpage_browse.create
this.dw_browse=create dw_browse
this.Control[]={this.dw_browse}
end on

on tabpage_browse.destroy
destroy(this.dw_browse)
end on

type dw_browse from u_dw within tabpage_browse
integer x = 18
integer y = 8
integer width = 2514
integer height = 1496
integer taborder = 30
boolean hscrollbar = true
end type

event constructor;call super::constructor;This.of_Setupdateable(False)
end event

event clicked;call super::clicked;integer r

r = this.getclickedrow()
if r <  0 then return 1
this.setrow(r)
this.scrolltorow(r)
tab_1.tabpage_detail.dw_detail.scrolltorow(r)
//this.selectrow(0,false)
//this.selectrow(r,true)
end event

event rowfocuschanged;call super::rowfocuschanged;integer r 

r = this.getrow()

this.selectrow(0,false)
this.selectrow(r,true)
end event

event doubleclicked;call super::doubleclicked;tab_1.selecttab( 2)
end event

type tabpage_detail from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2551
integer height = 1528
long backcolor = 67108864
string text = "Detail"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_detail dw_detail
end type

on tabpage_detail.create
this.dw_detail=create dw_detail
this.Control[]={this.dw_detail}
end on

on tabpage_detail.destroy
destroy(this.dw_detail)
end on

type dw_detail from u_dw within tabpage_detail
integer x = 18
integer y = 8
integer width = 2514
integer height = 1496
integer taborder = 11
boolean hscrollbar = true
end type

event pfc_preupdate;call super::pfc_preupdate;integer i
long rec


//tab_1.tabpage_browse.dw_browse.setupdateable = false
//for i = 1 to tab_1.tabpage_browse.dw_browse.rowcount()
//	if isnull(tab_1.tabpage_browse.dw_browse.getitemnumber(i,"rec_id")) then
//		rec = gnv_app.of_Get_Id("RECORD_ID")
//		tab_1.tabpage_browse.dw_browse.setitem(i,"rec_id",rec)
//	end if
//	
//next

//for i = 1 to tab_1.tabpage_detail.dw_detail.rowcount()
//	if isnull(tab_1.tabpage_detail.dw_detail.getitemnumber(i,"rec_id")) then
//		rec = gnv_app.of_Get_Id("RECORD_ID")
//		tab_1.tabpage_detail.dw_detail.setitem(i,"rec_id",rec)
//	end if
//	//Start Code Change ---- 03.09.2006 # maha movered out of if 
//	tab_1.tabpage_detail.dw_detail.setitem(i,"gp_id",il_gpid)
//	tab_1.tabpage_detail.dw_detail.setitem(i,"prac_id",il_gpid)
//	
//next

return 1
end event

type dw_select_section from u_dw within pfc_cst_u_group_data
integer x = 23
integer y = 16
integer width = 786
integer height = 1648
integer taborder = 10
boolean titlebar = true
string title = "Select Data"
string dataobject = "d_select_group_data"
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;this.settransobject(sqlca)
end event

event clicked;call super::clicked;integer r

r = this.getclickedrow( )
this.setrow(r)
this.selectrow( 0, false)
this.selectrow( r, true)
end event

event rowfocuschanged;call super::rowfocuschanged;integer r


//Start Code Change ---- 03.09.2006 #334 maha
of_save()
r = this.getrow()

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 03.13.2006 By: LeiWei
//$<reason> Fix a defect.
if r < 1 then return 
//---------------------------- APPEON END ----------------------------

this.selectrow( 0, false)
this.selectrow( r, true)

il_table = this.getitemnumber(r, "table_id")

of_retrieve_data(il_table)


end event

event retrieveend;call super::retrieveend;integer r

r = this.getrow()


// mskinner 01 march 2006 -- begin
if r < 1 then return 
// mskinner 01 march 2006 -- end 

this.selectrow( 0, false)
this.selectrow( r, true)



il_table = this.getitemnumber(r, "table_id")

of_retrieve_data(il_table)
end event

