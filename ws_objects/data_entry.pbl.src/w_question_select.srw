$PBExportHeader$w_question_select.srw
forward
global type w_question_select from window
end type
type dw_quest from datawindow within w_question_select
end type
type st_2 from statictext within w_question_select
end type
type dw_select from datawindow within w_question_select
end type
type cb_cancel from commandbutton within w_question_select
end type
type cb_1 from commandbutton within w_question_select
end type
end forward

global type w_question_select from window
integer width = 3031
integer height = 2488
boolean titlebar = true
string title = "Select Questions"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_syscommand pbm_syscommand
dw_quest dw_quest
st_2 st_2
dw_select dw_select
cb_cancel cb_cancel
cb_1 cb_1
end type
global w_question_select w_question_select

type variables
long il_temp_id
long il_quest[]
end variables

forward prototypes
public function integer of_checkrows (integer ai_tab)
end prototypes

event ue_syscommand;//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 06/17/2008 By: Ken.Guo
//$<reason> Fixed BugG061105
//$Need run cb_cancel.clicked() Event When click 'Close' button on ControlMenu.  
If message.wordparm = 61536 Then
	cb_cancel.Trigger Event Clicked()
End If
//---------------------------- APPEON END ----------------------------

end event

public function integer of_checkrows (integer ai_tab);long i
long ic
integer a = 0


ic =  dw_quest.rowcount()
if ic < 1 then
	messagebox("Questions","No questions to select.  Add in Question Painter")
	return -1
else
	for i = 1 to ic
		if dw_quest.getitemnumber(i,"selected") = 1 then
			a++
			il_quest[a] = dw_quest.getitemnumber(i,"quest_id")
		end if
	next
	if upperbound(il_quest) < 1 then
		messagebox("Questions","No questions selected. Select questions you wish to add.")	
		return -1
	end if
end if


return 1
end function

on w_question_select.create
this.dw_quest=create dw_quest
this.st_2=create st_2
this.dw_select=create dw_select
this.cb_cancel=create cb_cancel
this.cb_1=create cb_1
this.Control[]={this.dw_quest,&
this.st_2,&
this.dw_select,&
this.cb_cancel,&
this.cb_1}
end on

on w_question_select.destroy
destroy(this.dw_quest)
destroy(this.st_2)
destroy(this.dw_select)
destroy(this.cb_cancel)
destroy(this.cb_1)
end on

event open;DataWindowChild dwchild
integer s
integer q

debugbreak()

dw_select.settransobject(sqlca)
dw_select.retrieve()
dw_select.GetChild( "temp_id", dwchild )
dwchild.settransobject(sqlca)
dwchild.insertrow(1)
dwchild.setitem(1,"temp_name", "All Questions")
dwchild.setitem(1,"temp_id", 0)
dwchild.setrow(1)
dwchild.scrolltorow( 1)
dwchild.selectrow(0,false)
dwchild.selectrow(1,true)
dw_select.insertrow(1)
dw_select.setitem(1,"temp_id",0)
il_temp_id = 0

dw_quest.settransobject(sqlca)
s = dw_quest.retrieve()

//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 09/18/2007 By: Ken.Guo
//$<reason> For Performance
/*
for q = 1 to s
	dw_quest.setitem(q,"selected",1)
next
*/
Long i
Int li_value[]
For i = 1 To s
	li_value[i] = 1
Next
dw_quest.object.selected[1,s] = li_value[]
//---------------------------- APPEON END ----------------------------
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17


end event

type dw_quest from datawindow within w_question_select
integer x = 59
integer y = 180
integer width = 2875
integer height = 2092
integer taborder = 50
string title = "none"
string dataobject = "d_question_select"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;integer i


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 09/18/2007 By: Ken.Guo
//$<reason> For Performance
/*
if this.object.b_1.text = "Unselect All" then 
	for i = 1 to this.rowcount()
		this.setitem(i,"selected",0)
	next
	this.object.b_1.text = "Select All"
else
	for i = 1 to this.rowcount()
		this.setitem(i,"selected",1)
	next
	this.object.b_1.text = "Unselect All"
end if
*/	
Long ll_rowcount
Integer li_value_0[],li_value_1[]
If dwo.name = 'b_1' Then
	ll_rowcount = this.rowcount( )
	For i = 1 To ll_rowcount
		li_value_0[i] = 0
		li_value_1[i] = 1	
	Next
	If This.object.b_1.text = "Unselect All" Then 
		This.object.selected[1,ll_rowcount] = li_value_0[]
		This.object.b_1.text = "Select All"
	Else
		This.object.selected[1,ll_rowcount] = li_value_1[]
		This.object.b_1.text = "Unselect All"	
	End If
End If
//---------------------------- APPEON END ----------------------------

//--------------------------- APPEON BEGIN ---------------------------
//$<add> 09/18/2007 By: Ken.Guo
//$<reason> For b_detail button
String ls_details
If dwo.name = 'b_details' and row > 0 Then
	Openwithparm(w_detail_information,This.GetItemString(row,'full_quest'))
End If
//---------------------------- APPEON END ----------------------------

	
end event

type st_2 from statictext within w_question_select
integer x = 59
integer y = 24
integer width = 832
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Select Template (or select from full list)"
boolean focusrectangle = false
end type

type dw_select from datawindow within w_question_select
integer x = 59
integer y = 80
integer width = 1015
integer height = 84
integer taborder = 30
string title = "none"
string dataobject = "d_quest_templates"
boolean border = false
boolean livescroll = true
end type

event itemchanged;integer i


il_temp_id = long(data)

if il_temp_id = 0 then
	dw_quest.dataobject = "d_question_select"
	dw_quest.settransobject(sqlca)
	dw_quest.retrieve()
else
	dw_quest.dataobject = "d_quest_temp_select"
	dw_quest.settransobject(sqlca)
	dw_quest.retrieve(il_temp_id)
end if
//tab_1.tabpage_templates.dw_items.insertrow(1)


//--------------------------- APPEON BEGIN ---------------------------
//$<modify> 09/18/2007 By: Ken.Guo
//$<reason> For Performance
/*
for i = 1 to dw_quest.rowcount()
	dw_quest.setitem(i,"selected",1)
next
*/
Long ll_rowcount
Integer ll_value[]
ll_rowcount = dw_quest.Rowcount()
For i = 1 To ll_rowcount
	ll_value[i] = 1
Next
Dw_quest.object.selected[1,ll_rowcount] = ll_value[]
//---------------------------- APPEON END ----------------------------


dw_quest.object.b_1.text = "Unselect All"
end event

type cb_cancel from commandbutton within w_question_select
integer x = 2587
integer y = 68
integer width = 343
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
end type

event clicked;closewithreturn(w_question_select,"Cancel")

end event

type cb_1 from commandbutton within w_question_select
integer x = 2002
integer y = 68
integer width = 567
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Add Selected Questions"
end type

event clicked;integer i
integer res
string ls_quest
gs_variable_array ls_struct



res = of_checkrows(1)


if res = -1 then
	return
else
	ls_struct.as_number = il_quest[]
	closewithreturn(w_question_select,ls_struct)
end if
end event

