$PBExportHeader$w_export_prompt.srw
forward
global type w_export_prompt from window
end type
type st_4 from statictext within w_export_prompt
end type
type st_3 from statictext within w_export_prompt
end type
type st_2 from statictext within w_export_prompt
end type
type st_1 from statictext within w_export_prompt
end type
type sle_3 from singlelineedit within w_export_prompt
end type
type sle_2 from singlelineedit within w_export_prompt
end type
type sle_1 from singlelineedit within w_export_prompt
end type
type cb_2 from commandbutton within w_export_prompt
end type
type cb_1 from commandbutton within w_export_prompt
end type
end forward

global type w_export_prompt from window
integer x = 1056
integer y = 484
integer width = 1536
integer height = 804
boolean titlebar = true
string title = "Enter Values"
windowtype windowtype = response!
long backcolor = 79741120
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
cb_2 cb_2
cb_1 cb_1
end type
global w_export_prompt w_export_prompt

type variables
string is_return
string is_type1
string is_type2
string is_type3
end variables

forward prototypes
public function integer of_parse_arg (string as_pass)
public function integer of_validate ()
public function integer of_check_date (string as_date)
public function string of_date_format (string as_sql)
end prototypes

public function integer of_parse_arg (string as_pass);//determine the number of parameters and datatype
string ls_arg
integer p1
integer p2
integer p3

ls_arg = as_pass

is_type1 = ""
is_type2 = ""
is_type3 = ""

sle_1.visible = false
sle_2.visible = false
sle_3.visible = false

is_type1 = mid(ls_arg,1,1)
p1 = pos(ls_arg,"*",1)
if p1 > 0 then 
	is_type2 = mid(ls_arg,p1 + 1,1)
	p2 = pos(ls_arg,"*",p1+1)
	if p2 > 0 then
		is_type3 = mid(ls_arg,p2 + 1,1)
	end if
end if

if len(is_type1) > 0 then
	sle_1.visible = true
	choose case is_type1
		case "D"
			st_1.text = "Enter Start Date"
		case "C"
			st_1.text = "Enter String Value"
		case "N"
			st_1.text = "Enter Number"
	end choose
else
	st_1.visible = false
end if
if len(is_type2) > 0 then
	sle_2.visible = true
	choose case is_type2
		case "D"
			st_2.text = "Enter End Date"
		case "C"
			st_2.text = "Enter String Value"
		case "N"
			st_2.text = "Enter Number"
	end choose
else
	st_2.visible = false
end if
if len(is_type3) > 0 then
	sle_3.visible = true
	choose case is_type3
		case "D"
			st_3.text = "Enter Date"
		case "C"
			st_3.text = "Enter String Value"
		case "N"
			st_3.text = "Enter Number"
	end choose
else
	st_3.visible = false
end if
	


return 1
end function

public function integer of_validate ();string ls_parm1 
string ls_parm2
string ls_parm3
integer chk

ls_parm1 = sle_1.text
ls_parm2 = sle_2.text
ls_parm3 = sle_3.text

if sle_1.visible and len(ls_parm1) < 1 then
	messagebox("Missing Parameter","Please enter a value for the first parameter")
	return -1
end if
if sle_2.visible and len(ls_parm2) < 1 then
	messagebox("Missing Parameter","Please enter a value for the second parameter")
	return -1
end if	
if sle_3.visible and len(ls_parm3) < 1 then
	messagebox("Missing Parameter","Please enter a value for the third parameter")
	return -1
end if

if sle_1.visible then
	if len(ls_parm1) > 0 then
		choose case  is_type1
			case "D"
				if of_check_date(ls_parm1) = -1 then return -1
				//Start Code Change ---- 11.30.2006 #V7 maha
				ls_parm1 = of_date_format(ls_parm1)
				//End Code Change---11.30.2006
				
			case "C"
				ls_parm1 = "'" + ls_parm1 + "'"
			case "I", "N"
				//do nothing
		end choose
	else	
		messagebox("Missing Parameter","Please enter a value for the first parameter")
		return -1
	end if
end if

if sle_2.visible then
	if len(ls_parm2) > 0 then
		choose case  is_type2
			case "D"
				if of_check_date(ls_parm2) = -1 then return -1
				//ls_parm2 = "date('" + ls_parm2 + "')"
				ls_parm2 = of_date_format(ls_parm2)
			case "C"
				ls_parm2 = "'" + ls_parm2 + "'"
			case "I", "N"
				//do nothing
		end choose
	else	
		messagebox("Missing Parameter","Please enter a value for the second parameter")
		return -1
	end if
end if
	//validate based on datatype
if sle_3.visible then
	if len(ls_parm3) > 0 then
		choose case  is_type3
			case "D"
				if of_check_date(ls_parm3) = -1 then return -1
				//ls_parm3 = "date('" + ls_parm3 + "')"
				ls_parm3 = of_date_format(ls_parm3)
			case "C"
				ls_parm3 = "'" + ls_parm3 + "'"
			case "I", "N"
				//do nothing
		end choose
	else	
		messagebox("Missing Parameter","Please enter a value for the third parameter")
		return -1
	end if
end if	
	
is_return = ls_parm1 + "*" + ls_parm2 + "*" + ls_parm3

return 1
end function

public function integer of_check_date (string as_date);string s
string ls_char
integer i
integer ic
integer ck = 1

s = as_date

ic = len(s)
for i = 1 to ic
	ls_char = mid(s,i,1)
	choose case i
		case 1,2,3,4,6,7,9,10
			if not isnumber(ls_char) then
				ck = -1
				end if
		case 5,8
			if ls_char <> "/" and ls_char <> "-" then// Code Change ---- 12.01.2006 #V7 maha
				ck = -1
			end if
	end choose

next

if ck = -1 then
	messagebox("Parameter error","Invalid date format.  Date parameters must be entered as YYYY/MM/DD.")
return -1
else
	return 1
end if
end function

public function string of_date_format (string as_sql);string ls_ret

ls_ret = as_sql

if gs_dbtype = "ASA" then
	ls_ret = "date('" + ls_ret + "')"
else  //MSSQL
	//ls_ret = "cast('" + ls_ret + "' as date)"		//comment by Scofield on 2007-06-26
	
	ls_ret = "cast('" + ls_ret + "' as datetime)"	//Added by Scofield on 2007-06-26
end if

return ls_ret
end function

on w_export_prompt.create
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.cb_2,&
this.cb_1}
end on

on w_export_prompt.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;string s

s = message.stringparm

of_parse_arg(s)

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_4 from statictext within w_export_prompt
integer x = 571
integer y = 44
integer width = 846
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Enter Dates as YYYY/MM/DD"
boolean focusrectangle = false
end type

type st_3 from statictext within w_export_prompt
integer x = 41
integer y = 464
integer width = 480
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prompt 3"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_export_prompt
integer x = 41
integer y = 308
integer width = 480
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prompt 2"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_export_prompt
integer x = 41
integer y = 160
integer width = 480
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prompt 1"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_export_prompt
integer x = 530
integer y = 440
integer width = 923
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_export_prompt
integer x = 530
integer y = 284
integer width = 923
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_export_prompt
integer x = 530
integer y = 140
integer width = 923
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_2 from commandbutton within w_export_prompt
integer x = 1207
integer y = 592
integer width = 247
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

event clicked;closewithreturn(parent,"Cancel")
end event

type cb_1 from commandbutton within w_export_prompt
integer x = 946
integer y = 592
integer width = 247
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
end type

event clicked;integer i

i = of_validate()



if i = 1 then closewithreturn(parent,is_return)
end event

