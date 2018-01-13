$PBExportHeader$w_ie_timeout.srw
forward
global type w_ie_timeout from w_response
end type
type shl_1 from statichyperlink within w_ie_timeout
end type
type st_5 from statictext within w_ie_timeout
end type
type st_4 from statictext within w_ie_timeout
end type
type cb_refresh from commandbutton within w_ie_timeout
end type
type st_3 from statictext within w_ie_timeout
end type
type cb_close from commandbutton within w_ie_timeout
end type
type cb_2 from commandbutton within w_ie_timeout
end type
type ddlb_2 from dropdownlistbox within w_ie_timeout
end type
type st_2 from statictext within w_ie_timeout
end type
type st_1 from statictext within w_ie_timeout
end type
type ddlb_1 from dropdownlistbox within w_ie_timeout
end type
type cb_1 from commandbutton within w_ie_timeout
end type
type gb_1 from groupbox within w_ie_timeout
end type
end forward

global type w_ie_timeout from w_response
integer x = 214
integer y = 221
integer width = 1600
integer height = 844
string title = "IE TimeOut Settings"
boolean controlmenu = false
shl_1 shl_1
st_5 st_5
st_4 st_4
cb_refresh cb_refresh
st_3 st_3
cb_close cb_close
cb_2 cb_2
ddlb_2 ddlb_2
st_2 st_2
st_1 st_1
ddlb_1 ddlb_1
cb_1 cb_1
gb_1 gb_1
end type
global w_ie_timeout w_ie_timeout

type variables
Long il_executed = 0
end variables

forward prototypes
public subroutine of_get_timeout ()
end prototypes

public subroutine of_get_timeout ();//Added By Ken.Guo 2015-10-28 Check IE TimeOut
String ls_ReceiveTimeout, ls_KeepAliveTimeout 
String ls_ie_timeout
String ls_timeout_key = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings'
If gnv_appeondll.of_registryget(ls_timeout_key,'ReceiveTimeout', REGULong!,ls_ReceiveTimeout)	< 0 Then
	ddlb_1.text = ''
Else
	ddlb_1.text = ls_ReceiveTimeout
End If
If gnv_appeondll.of_registryget(ls_timeout_key,'KeepAliveTimeout', REGULong!,ls_KeepAliveTimeout)	< 0 Then
	ddlb_2.text = ''
Else
	ddlb_2.text = ls_KeepAliveTimeout
End If

end subroutine

on w_ie_timeout.create
int iCurrent
call super::create
this.shl_1=create shl_1
this.st_5=create st_5
this.st_4=create st_4
this.cb_refresh=create cb_refresh
this.st_3=create st_3
this.cb_close=create cb_close
this.cb_2=create cb_2
this.ddlb_2=create ddlb_2
this.st_2=create st_2
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.cb_1=create cb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.shl_1
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.cb_refresh
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.ddlb_2
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.ddlb_1
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.gb_1
end on

on w_ie_timeout.destroy
call super::destroy
destroy(this.shl_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.cb_refresh)
destroy(this.st_3)
destroy(this.cb_close)
destroy(this.cb_2)
destroy(this.ddlb_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;call super::open;cb_refresh.event clicked( )
end event

type shl_1 from statichyperlink within w_ie_timeout
integer x = 55
integer y = 524
integer width = 1490
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "https://support.microsoft.com/en-us/kb/181050#/en-us/kb/181050"
boolean focusrectangle = false
string url = "https://support.microsoft.com/en-us/kb/181050#/en-us/kb/181050"
end type

type st_5 from statictext within w_ie_timeout
integer x = 50
integer y = 476
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Reference link:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_ie_timeout
integer x = 78
integer y = 88
integer width = 1399
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "clients frequently get ~"the page cannot be displayed~" error."
boolean focusrectangle = false
end type

type cb_refresh from commandbutton within w_ie_timeout
integer x = 805
integer y = 624
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
end type

event clicked;of_get_timeout()
end event

type st_3 from statictext within w_ie_timeout
integer x = 69
integer y = 28
integer width = 2642
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "The following settings are used  to solve  the issue where some"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_ie_timeout
integer x = 1161
integer y = 624
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;ClosewithReturn(Parent, il_executed)
end event

type cb_2 from commandbutton within w_ie_timeout
integer x = 1221
integer y = 328
integer width = 224
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set"
end type

event clicked;//Added By Ken.Guo 2015-10-28 Set IE TimeOut
String ls_KeepAliveTimeout 
String ls_timeout_key = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings'

ls_KeepAliveTimeout = ddlb_2.text
If Not isnumber(ls_KeepAliveTimeout) Then
	Messagebox('Error','Please enter a number.')
	Return 
End If

If  Long(ls_KeepAliveTimeout) < 0 Then
	Messagebox('Error','Please enter a number that is greater than 0.')
	Return 
End If

If gnv_appeondll.of_registryset(ls_timeout_key,'KeepAliveTimeout', REGULong!,ls_KeepAliveTimeout) < 0 Then
	 messagebox('Error','Failed to set the registry value for KeepAliveTimeout. Please make sure you have FULL permissions to modify registry.')
	 Return -1
Else
	messagebox('Timeout Settings','The setting is changed. For changes to take effect, you will need to restart Internet Explorer.')
End If

If Long(ls_KeepAliveTimeout) >= 120000 Then
	gnv_appeondll.of_registryset(ls_timeout_key,'ServerInfoTimeout', REGULong!,ls_KeepAliveTimeout)  
End If

il_executed = 1

Return 1
end event

type ddlb_2 from dropdownlistbox within w_ie_timeout
integer x = 695
integer y = 332
integer width = 457
integer height = 412
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
string item[] = {"0","60000","120000","300000","600000"}
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_ie_timeout
integer x = 91
integer y = 344
integer width = 594
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "IE KeepAliveTimeout (ms) :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_ie_timeout
integer x = 91
integer y = 212
integer width = 567
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "IE ReceiveTimeout (ms):"
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_ie_timeout
integer x = 695
integer y = 200
integer width = 457
integer height = 412
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean allowedit = true
boolean sorted = false
string item[] = {"0","60000","120000","300000","600000"}
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_ie_timeout
integer x = 1221
integer y = 196
integer width = 224
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Set"
end type

event clicked;//Added By Ken.Guo 2015-10-28 Set IE TimeOut
String ls_ReceiveTimeout 
String ls_timeout_key = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings'

ls_ReceiveTimeout = ddlb_1.text
If Not isnumber(ls_ReceiveTimeout) Then
	Messagebox('Error','Please enter a number.')
	Return 
End If

If  Long(ls_ReceiveTimeout) < 0 Then
	Messagebox('Error','Please enter a number that is greater than 0.')
	Return 
End If

If gnv_appeondll.of_registryset(ls_timeout_key,'ReceiveTimeout', REGULong!,ls_ReceiveTimeout) < 0 Then
	messagebox('Error','Failed to set the registry value for KeepAliveTimeout. Please make sure you have FULL permissions to modify registry.')
	 Return -1
Else
	messagebox('Timeout Settings','The setting is changed. For changes to take effect, you will need to restart Internet Explorer.')
End If

il_executed = 1

Return 1
end event

type gb_1 from groupbox within w_ie_timeout
integer x = 55
integer y = 144
integer width = 1481
integer height = 316
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

