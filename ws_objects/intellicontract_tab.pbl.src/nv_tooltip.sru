$PBExportHeader$nv_tooltip.sru
$PBExportComments$Non-Visual tooltip control object
forward
global type nv_tooltip from nonvisualobject
end type
type rect from structure within nv_tooltip
end type
type toolinfo from structure within nv_tooltip
end type
type point from structure within nv_tooltip
end type
type msg from structure within nv_tooltip
end type
type size from structure within nv_tooltip
end type
type logfont from structure within nv_tooltip
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

type toolinfo from structure
	long		cbsize
	long		uflags
	long		hwnd
	long		uid
	rect		rect
	long		hinstance
	long		lpsztext
end type

type point from structure
	long		x
	long		y
end type

type msg from structure
	long		hwnd
	long		message
	long		wparam
	long		lparam
	long		time
	point		pt
end type

type size from structure
	long		l_x
	long		l_y
end type

type logfont from structure
	long		lfheight
	long		lfwidth
	long		lfescapement
	long		lforientation
	long		lfweight
	character		lfitalic
	character		lfunderline
	character		lfstrikeout
	character		lfcharset
	character		lfoutprecision
	character		lfclipprecision
	character		lfquality
	character		lfpitchandfamily
	character		lffacename[32]
end type

global type nv_tooltip from nonvisualobject
event documentation_ue pbm_custom01
end type
global nv_tooltip nv_tooltip

type prototypes
// ToolTip Functions
SubRoutine InitCommonControls() library "comctl32.dll"
Function long CreateWindowExA(ulong dwExStyle, string ClassName, long WindowName, ulong dwStyle, ulong X, ulong Y, ulong nWidth, ulong nHeight, ulong hWndParent, ulong hMenu, ulong hInstance, ulong lpParam) library "user32.dll" alias for "CreateWindowExA;Ansi"
Function integer DestroyWindow(long hWnd) library "user32.dll"
Function integer ToolTipMsg(long hWnd, long uMsg, long wParam, REF TOOLINFO ToolInfo) library "user32.dll" Alias For "SendMessageA;Ansi"
Function integer RelayMsg(long hWnd, long uMsg, long wParam, REF MSG Msg) library "user32.dll" Alias For "SendMessageA;Ansi"
FUNCTION ulong CreateFontIndirect(ref LOGFONT lpLogFont) LIBRARY "gdi32.dll" ALIAS FOR "CreateFontIndirectA;Ansi"

// Memory handling functions
Function long LocalAlloc(long Flags, long Bytes) library "kernel32.dll"
Function long LocalFree(long MemHandle) library "kernel32.dll"
Function long lstrcpy(long Destination, string Source) library "kernel32.dll" alias for "lstrcpy;Ansi"

Function uLong SendMessageString( uLong hwnd, uLong Msg, uLong wParam, Ref String lpzString ) Library "user32.dll" Alias For "SendMessageA;Ansi"

Function ulong GetDC(ulong hWnd) Library "USER32.DLL"
Function long ReleaseDC(ulong hWnd, ulong hdcr) Library "USER32.DLL"
Function boolean GetTextExtentPoint32A(ulong hdcr, string lpString, long nCount, ref size size) Library "GDI32.DLL" alias for "GetTextExtentPoint32A;Ansi"
Function ulong SelectObject(ulong hdc, ulong hWnd) Library "GDI32.DLL"
end prototypes

type variables
boolean ib_option_tooltip = true

//	Title Constants
Constant integer TTI_NONE = 0
Constant integer TTI_INFO = 1
Constant integer TTI_WARNING = 2
Constant integer TTI_ERROR = 3

// Tooltip flags
Constant integer TTF_IDISHWND		= 1
Constant integer TTF_CENTERTIP 	= 2
Constant integer TTF_RTLREADING	= 4
Constant integer TTF_SUBCLASS		= 16
Constant integer TTF_TRACK			= 32
Constant integer TTF_ABSOLUTE		= 128
Constant integer TTF_TRANSPARENT	= 256
Constant integer TTF_DI_SETITEM	= 32768

Private:

// overridden via included functions
integer			ii_MaxWidth = 1200
integer			ii_TipTimer = 8

// internal tracking
dragobject		ido_Tip
integer			ii_TipID
window			iw_Requestor


// Misc Constants
Constant string	TOOLTIPS_CLASS		= 'tooltips_class32'
Constant ulong		CW_USEDEFAULT		= 2147483648
Constant long		WM_USER 		= 1024
Constant long		WS_EX_TOPMOST		= 8
Constant long		WM_SETFONT          	= 48
Constant long		WM_GETFONT          	= 49

// ToolTip Messages
Constant long TTM_SETDELAYTIME = WM_USER + 3
Constant long TTM_ADDTOOL 		= WM_USER + 4
Constant long TTM_DELTOOL = WM_USER + 5
Constant long TTM_NEWTOOLRECT	= WM_USER + 6
Constant long TTM_RELAYEVENT 		= WM_USER + 7
Constant long TTM_UPDATETIPTEXT	= WM_USER + 12
Constant long TTM_TRACKACTIVATE	= WM_USER + 17
Constant long TTM_TRACKPOSITION	= WM_USER + 18
Constant long TTM_SETTIPBKCOLOR	= WM_USER + 19
Constant long TTM_SETTIPTEXTCOLOR	= WM_USER + 20
Constant long TTM_GETDELAYTIME = WM_USER + 21
Constant long TTM_SETMAXTIPWIDTH	= WM_USER + 24
Constant long TTM_GETMAXTIPWIDTH	= WM_USER + 25
Constant long TTM_SETTITLEA = WM_USER + 32

long hWndTT				// Tooltip control window handle (Current Balloon or normal)
long hWndTTNormal		// Tooltip control window handle
long hWndTTBalloon	// Tooltip control window handle

long ToolID = 1	// Tooltip internal ID

// Tooltip flags
Constant integer TTS_BALLOON 		= 64

//	Delaytime constants
Constant integer TTDT_AUTOMATIC = 0
Constant integer TTDT_RESHOW = 1
Constant integer TTDT_AUTOPOP = 2
Constant integer TTDT_INITIAL = 3

uLong		iul_Handle[]

// dw
Long		il_tooltip_row, il_tooltip_oldid
String		istr_tooltip_column
end variables

forward prototypes
public subroutine f_uo_setfont (long hfont)
public subroutine f_uo_settipbkcolor (unsignedlong aul_color)
public subroutine f_uo_settiptextcolor (unsignedlong aul_color)
public subroutine f_uo_setdelaytime (integer ai_duration, integer ai_milliseconds)
public subroutine f_uo_hidetip ()
public subroutine f_uo_settimer (integer ai_tiptimer)
public subroutine f_uo_setwidth (integer ai_width)
private function long f_uo_getfont ()
private function integer f_uo_getdelaytime (integer ai_duration)
private function integer f_uo_gettotalx (datawindow adw_dw, dwobject adw_dwo)
private function integer f_uo_gettotalx (dragobject ado_object)
private function integer f_uo_gettotaly (datawindow adw_dw, dwobject adw_dwo, long al_row)
private function integer f_uo_gettotaly (dragobject ado_object)
private subroutine f_uo_relaymsg (dragobject ado_object)
private subroutine f_uo_settiptext (dragobject ado_object, long al_uid, long al_tiptext)
private subroutine f_uo_settrack (dragobject ado_object, integer ai_uid, boolean ab_status)
private subroutine f_uo_updatetiprect (dragobject ado_object, long al_uid, long al_left, long al_top, long al_right, long al_bottom)
public subroutine f_uo_showtip (dragobject ado_object, string astr_title, integer ai_icon, string astr_tip, integer ai_maxwidth)
public subroutine f_uo_showtip (datawindow adw_dw, dwobject adw_dwo, long al_row, string astr_title, integer ai_icon, string astr_tip, integer ai_maxwidth)
public subroutine f_uo_showtip (datawindow adw_dw, dwobject adw_dwo, long al_row, string astr_title, integer ai_icon, string astr_tip)
public subroutine f_uo_showtip (dragobject ado_object, string astr_title, integer ai_icon, string astr_tip)
public subroutine f_uo_settipposition (integer ai_x, integer ai_y)
public subroutine f_uo_showtip (dragobject ado_object, string astr_tip, integer ai_maxwidth)
public function integer f_uo_addtool (dragobject ado_object, string astr_tiptext, integer ai_flags)
public subroutine f_uo_settiptitle (integer ai_icon, string astr_title)
public function integer f_uo_removetool (dragobject ado_object, integer ai_toolid)
public subroutine f_uo_showtip (dragobject ado_object, string astr_tip)
public subroutine f_uo_useballoontip (boolean ab_balloon)
public subroutine f_uo_setmaxwidth (long al_maxwidth)
public subroutine f_uo_settiptext (dragobject ado_object, long al_uid, string astr_tiptext)
public subroutine f_uo_setfont (string astr_fontname)
public function integer f_uo_gettextsize (datawindow adw, long al_row, string astr_col, string astr_text)
public subroutine f_uo_setrequestor (window aw_requestor)
public function integer f_uo_refreshtool (dragobject ado_object, string astr_tiptext, integer ai_flags, long al_id)
public function window f_uo_getparent (powerobject ado_object)
public subroutine f_uo_doubleclicked (datawindow adw_source, dwobject ado_dwo, long al_row, boolean ab_option, string astr_action, string astr_title, string astr_displayonly, string astr_required, any aa_param)
public subroutine f_uo_dwndropdown (datawindow adw_source, boolean ab_option, double ad_scale)
public function long f_uo_add_tooltip (dragobject ado_object)
public function integer f_uo_refresh_tooltip (dragobject ado_object, long al_id)
public function integer f_uo_gettextsize (singlelineedit asl_object, string astr_text)
public function string f_uo_parse_string (string astr_parameter, string astr_separator)
public function integer f_uo_parse_string_into_array (string astr_parameter, string astr_separator, string astr_array[])
public subroutine f_uo_dwnmousemove (datawindow adw_source, dwobject ado_dwo, long al_row, long al_tooltip_id, boolean ab_text, string astr_value, string astr_displayonly, any aa_parm, long al_view, long al_screen)
end prototypes

event documentation_ue;/* 
/// Tooltips

BL	09/25/12		Initial setup
 
To use this nvo - it must be declared and instantiated (it does not auto-instantiate)
ex:
nv_tooltip		in_tooltip
in_tooltip = CREATE nv_tooltip

Don't forget to also destroy the nvo, ex:
DESTROY nv_tooltip

*/

end event

public subroutine f_uo_setfont (long hfont);//.............................................................................
//. nv_tooltip
//. Function: f_uo_setfont()
//.
//. Descr: Sets the font used in the tooltip window.
//.
//. Passed: Long hfont	 
//. 				 
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Send( hWndTT, WM_SETFONT, hFont, 1)

end subroutine

public subroutine f_uo_settipbkcolor (unsignedlong aul_color);//.............................................................................
//. nv_tooltip
//. Function: f_uo_settipbkcolor()
//.
//. Descr: Sets the backgroundcolor of the tooltip-window.
//.
//. Passed: Unsignedlong aul_color	
//. 				
//. Returns: None

//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Send(hWndTT, TTM_SETTIPBKCOLOR, aul_Color, 0)
end subroutine

public subroutine f_uo_settiptextcolor (unsignedlong aul_color);//.............................................................................
//. nv_tooltip
//. Function: f_uo_settiptextcolor()
//.
//. Descr: Sets the textcolor.
//.
//. Passed: Unsignedlong aul_color 
//. 				
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Send(hWndTT, TTM_SETTIPTEXTCOLOR, aul_Color, 0)

end subroutine

public subroutine f_uo_setdelaytime (integer ai_duration, integer ai_milliseconds);//.............................................................................
//. nv_tooltip
//. Function: f_uo_setdelaytime()
//.
//. Descr: Sets the initial, pop-up, and reshow durations for a ToolTip control.
//.		  IMPORTANT: call before adding tools by using of_AddTool!
//.
//. Passed: Integer ai_Duration
//. 	Possible values:
//. 		TTDT_AUTOPOP: Set the length of time a ToolTip window remains visible if the 
//. 			pointer is stationary within a tool's bounding rectangle. To return the autopop delay 
//.			time to its default value, set iTime to -1.
//.
//. 		TTDT_INITIAL: Set the length of time a pointer must remain stationary within a tool's 
//.			bounding rectangle before the ToolTip window appears. To return the initial delay time 
//.			to its default value, set iTime to -1.
//.
//. 		TTDT_RESHOW: Set the length of time it takes for subsequent ToolTip windows to appear as 
//.			the pointer moves from one tool to another. To return the reshow delay time to its 
//.			default value, set iTime to -1.
//.
//.		TTDT_AUTOMATIC: Set all three delay times to default proportions. The autopop time will 
//.			be ten times the initial time and the reshow time will be one fifth the initial time. 
//.			If this flag is set, use a positive value of iTime to specify the initial time, in 
//.			milliseconds. Set iTime to a negative value to return all three delay times to their 
//. 			default values.
//.
//. 		Integer ai_Milliseconds
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Send(hWndTT, TTM_SETDELAYTIME, ai_Duration, Long(ai_Milliseconds, 0))

end subroutine

public subroutine f_uo_hidetip ();//.............................................................................
//. nv_tooltip
//. Function: f_uo_hidetip()
//.
//. Descr: Remove the tool.
//.
//. Passed: None		
//. 				
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

If IsValid(ido_Tip) Then
	f_uo_SetTrack(ido_Tip, ii_TipID, False)
	f_uo_RemoveTool(ido_Tip, ii_TipID)
	
	// Clean it up since we don't need it anymore
	SetNull(ido_Tip)
End If

end subroutine

public subroutine f_uo_settimer (integer ai_tiptimer);//.............................................................................
//. nv_tooltip
//. Function: f_uo_settimer()
//.
//. Descr: Set the length of the timer.
//.
//. Passed: Integer ai_tiptimer	
//. 				
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

ii_TipTimer = ai_TipTimer

end subroutine

public subroutine f_uo_setwidth (integer ai_width);//.............................................................................
//. nv_tooltip
//. Function: f_uo_setwidth()
//.
//. Descr: Set the maximum width of the tips.
//.
//. Passed: Integer ai_width	 
//. 				
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

ii_MaxWidth = ai_Width

end subroutine

private function long f_uo_getfont ();//.............................................................................
//. nv_tooltip
//. Function: f_uo_getfont()
//.
//. Descr: Gets the font used in the tooltip window.
//.
//. Passed: None
//.
//. Returns: Long
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

ULong	lul_Font

lul_Font = Send(hWndTT, WM_GETFONT, 0, 0)

Return lul_Font

end function

private function integer f_uo_getdelaytime (integer ai_duration);//...................................................................................
//. nv_tooltip
//. Function: f_uo_getdelaytime()
//.
//. Descr: Sets the initial, pop-up, and reshow durations for a ToolTip control.
//.
//. Passed: Integer ai_Duration
//.	Possible values:
//. 		TTDT_AUTOPOP: Set the length of time a ToolTip window remains visible if the 
//. 			pointer is stationary within a tool's bounding rectangle. To return the 
//.			autopop delay time to its default value, set iTime to -1.
//.
//. 		TTDT_INITIAL: Set the length of time a pointer must remain stationary within
//. 			a tool's bounding rectangle before the ToolTip window appears. To return 
//.			the initial delay time to its default value, set iTime to -1.
//.	
//. 		TTDT_RESHOW: Set the length of time it takes for subsequent ToolTip windows 
//. 			to appear as the pointer moves from one tool to another. To return the 
//.			reshow delay time to its default value, set iTime to -1.
//.
//. Returns: Integer
//.
//...................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//===================================================================================

Return Send(hWndTT, TTM_GETDELAYTIME, ai_Duration, 0)

end function

private function integer f_uo_gettotalx (datawindow adw_dw, dwobject adw_dwo);//.............................................................................
//. nv_tooltip
//. Function: f_uo_gettotalx()
//.
//. Descr: Get the total X values from the object to the window.
//.
//. Passed: Datawindow adw_dw	
//. 			Dwobject adw_dwo
//.
//. Returns: Integer
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Dragobject	ldo
Integer	li_X, li_ScrollPosX

li_ScrollPosX = Integer(adw_dw.Object.DataWindow.HorizontalScrollPosition)

If adw_dw.Width < Integer(adw_dwo.x) + Integer(adw_dwo.width) - li_ScrollPosX Then
	// The column isn't on the screen, we need to scroll to show it
	adw_dw.Object.DataWindow.HorizontalScrollPosition = Integer(adw_dwo.x) + Integer(adw_dwo.width) - adw_dw.Width
End If

li_ScrollPosX = Integer(adw_dw.Object.DataWindow.HorizontalScrollPosition)

li_X = Integer(adw_dwo.x)
li_X -= li_ScrollPosX
li_X += (Integer( adw_dwo.width ) * 3 / 4)

ldo = adw_dw

// Add the x's to the window
Do While TypeOf(ldo) <> Window!
	li_X += ldo.X
	
	If TypeOf(ldo.GetParent()) = Window! Then
		Exit
	End If
	
	ldo = ldo.GetParent()
Loop

// Add the window's X
//li_X += iw_Requestor.X
li_X += iw_Requestor.WorkSpaceX()

Return li_X

end function

private function integer f_uo_gettotalx (dragobject ado_object);//.............................................................................
//. nv_tooltip
//. Function: f_uo_gettotalx()
//.
//. Descr: Get the total X values from the object to the window.
//.
//. Passed: Dragobject ado_object
//.
//. Returns: Integer
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Integer	li_X, li_ScrollPosX
Dragobject	ldo
Window		w_Wnd

li_X = (ado_object.Width * 3 / 4)

ldo = ado_object

// Add the x's to the window
Do While TypeOf(ldo) <> Window!
	li_X += ldo.X
	
	If TypeOf(ldo.GetParent()) = Window! Then
		Exit
	End If
	
	ldo = ldo.GetParent()
Loop

// Add the window's X
//li_X += iw_Requestor.X
li_X += iw_Requestor.WorkSpaceX()

Return li_X


end function

private function integer f_uo_gettotaly (datawindow adw_dw, dwobject adw_dwo, long al_row);//.............................................................................
//. nv_tooltip
//. Function: f_uo_gettotaly()
//.
//. Descr: Get the total Y values from the object to the window.
//.
//. Passed: Datawindow	adw_dw	
//. 			Dwobject		adw_dwo	
//. 			Long			al_row
//.
//. Returns: Integer
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Integer	li_Y, li_ScrollPosY
Dragobject	ldo

li_ScrollPosY = Integer(adw_dw.Object.DataWindow.VerticalScrollPosition)

li_Y = Integer(adw_dw.object.datawindow.header.height)

// If it's a grid, we need to get the row height
If adw_dw.object.datawindow.processing = "1" Then
	li_Y += Integer(adw_dwo.y)
	li_Y += Integer(adw_dw.object.datawindow.detail.height) * al_Row
	li_Y -= Integer(adw_dw.object.datawindow.detail.height) / 2
Else
	li_Y += Integer(adw_dwo.y)
	li_Y += Integer(adw_dwo.height)
	li_Y += Integer(adw_dw.object.datawindow.detail.height) * (al_Row - 1)
End If

li_Y -= li_ScrollPosY

ldo = adw_dw

// Add the x's to the window
Do While TypeOf(ldo) <> Window!
	li_Y += ldo.Y
	
	If TypeOf(ldo.GetParent()) = Window! Then
		Exit
	End If
	
	ldo = ldo.GetParent()
Loop

// Add the window's y
//li_Y += iw_Requestor.Y
li_Y += iw_Requestor.WorkSpaceY()

Return li_Y

end function

private function integer f_uo_gettotaly (dragobject ado_object);//.............................................................................
//. nv_tooltip
//. Function: f_uo_gettotaly()
//.
//. Descr: Get the total Y values from the object to the window.
//.
//. Passed: Dragobject ado_object
//.
//. Returns: Integer
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Integer	li_Y, li_ScrollPosY
Window		w_Wnd
Dragobject	ldo

li_Y = ado_object.height / 2

ldo = ado_object

// Add the x's to the window
Do While TypeOf(ldo) <> Window!
	li_Y += ldo.Y
	
	If TypeOf(ldo.GetParent()) = Window! Then
		Exit
	End If
	
	ldo = ldo.GetParent()
Loop

// Add the window's y
//li_Y += iw_Requestor.Y
li_Y += iw_Requestor.WorkSpaceY()

Return li_Y

end function

private subroutine f_uo_relaymsg (dragobject ado_object);//...............................................................................
//. nv_tooltip
//. Function: f_uo_relaymsg()
//.
//. Descr: Send the control message to the toolwindow control.
//.	Call from mousemove-event for control.
//.
//. Passed: DragObject ado_object - Object to register within the tooltip control
//. 
//. Returns: None
//.
//...............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ------------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//===============================================================================

MSG Msg

Msg.hWnd = Handle(ado_Object)

// WM_MOUSEMOVE
Msg.Message	= 512	
Msg.WParam = Message.WordParm
Msg.LParam = Message.LongParm

RelayMsg(hWndTT, TTM_RELAYEVENT, 0, Msg)

end subroutine

private subroutine f_uo_settiptext (dragobject ado_object, long al_uid, long al_tiptext);//.............................................................................
//. nv_tooltip
//. Function: f_uo_settiptext()
//.
//. Descr: Sets the new text for a tool window.
//.
//. Passed: DragObject ado_Object	Object registered on the toolwindow control
//. 			Long astr_TipText - Object ID
//. 			Long ai_Flags - Tooltip text
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

TOOLINFO ToolInfo

ToolInfo.hWnd = Handle(f_uo_getparent(ado_Object))
ToolInfo.uID = Handle(ado_Object)
ToolInfo.lpszText	= al_TipText
ToolTipMsg(hWndTT, TTM_UPDATETIPTEXT, 0, ToolInfo)

end subroutine

private subroutine f_uo_settrack (dragobject ado_object, integer ai_uid, boolean ab_status);//....................................................................................
//. nv_tooltip
//. Function: f_uo_settrack()
//.
//. Descr: Registers a control within the tooltip control.
//.
//. Passed: DragObject ado_Object - Object registered on the toolwindow control
//. 			Integer astr_TipText - Internal ID of the object
//. 			Boolean ai_Flags - True to activate tracking, False to deactivate tracking
//. 
//....................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  -----------------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//====================================================================================

TOOLINFO ToolInfo

ToolInfo.cbSize = 40
ToolInfo.hWnd = Handle(f_uo_getparent(ado_Object))
ToolInfo.uID = Handle(ado_Object)

If ab_Status Then 
	ToolTipMsg(hWndTT, TTM_TRACKACTIVATE, 1, ToolInfo)
Else
	ToolTipMsg(hWndTT, TTM_TRACKACTIVATE, 0, ToolInfo)
End If

end subroutine

private subroutine f_uo_updatetiprect (dragobject ado_object, long al_uid, long al_left, long al_top, long al_right, long al_bottom);//.............................................................................
//. nv_tooltip
//. Function: f_uo_updatetiprect()
//.
//. Descr: Updates the tip rectangle.
//.
//. Passed: DragObject ado_Object - Object registered on the toolwindow control
//. 			Long al_uID - Internal ID of the object
//. 			Long al_Left - Left coordinate of rectangle
//. 			Long al_top - Top coordinate of rectangle
//. 			Long al_right - Right coordinate of rectangle
//. 			Long al_bottom - Bottom coordinate of rectangle
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

TOOLINFO ToolInfo

ToolInfo.hWnd = Handle(ado_Object)
ToolInfo.uID = al_uID

ToolInfo.Rect.Left = al_Left
ToolInfo.Rect.Top = al_Top
ToolInfo.Rect.Right = al_Right
ToolInfo.Rect.Bottom	= al_Bottom

ToolTipMsg(hWndTT, TTM_NEWTOOLRECT, 0, ToolInfo)

end subroutine

public subroutine f_uo_showtip (dragobject ado_object, string astr_title, integer ai_icon, string astr_tip, integer ai_maxwidth);//.............................................................................
//. nv_tooltip
//. Function: f_uo_showtip()
//.
//. Descr: Show a tip.
//.
//. Passed: Dragobject ado_object	 
//. 			String 	astr_title	
//. 			Integer	ai_icon
//. 			String	astr_tip	
//. 			Integer	ai_maxwidth
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Integer	li_X, li_Y
String 	lstr_text, lstr_type
Window	w_Wnd

f_uo_SetMaxWidth(ai_MaxWidth)

If ai_Icon < 0 Or ai_Icon > 3 Then
	ai_Icon = 0
End If

f_uo_SetTipTitle(ai_Icon, astr_Title)

f_uo_AddTool(ado_Object, "", TTF_SUBCLASS + TTF_TRACK) 

li_X = f_uo_GetTotalX(ado_object)
li_Y = f_uo_GetTotalY(ado_object)

li_X = UnitsToPixels(li_X, XUnitsToPixels!)
li_Y = UnitsToPixels(li_Y, YUnitsToPixels!)

f_uo_SetTipPosition(li_X, li_Y)
										 
f_uo_SetTipText(ado_object, ii_TipID, astr_Tip)
f_uo_SetTrack(ado_object, ii_TipID, True)

ido_Tip = ado_object

// Hide the tip after 4 seconds
Timer(ii_TipTimer, iw_Requestor)

end subroutine

public subroutine f_uo_showtip (datawindow adw_dw, dwobject adw_dwo, long al_row, string astr_title, integer ai_icon, string astr_tip, integer ai_maxwidth);//.............................................................................
//. nv_tooltip
//. Function: f_uo_showtip()
//.
//. Descr: Show a tip.
//.
//. Passed: Datawindow	adw_dw	 
//. 			Dwobject		adw_dwo	 
//. 			Long			al_row		 
//. 			String		astr_title	 
//. 			Integer		ai_icon	
//. 			String		astr_tip
//. 			Integer		ai_maxwidth
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Integer	li_X, li_Y, li_Id
String 	lstr_text, lstr_type
//window	w_Wnd
//powerobject	lpo_parent

f_uo_SetMaxWidth(ai_MaxWidth)

If ai_Icon < 0 Or ai_Icon > 3 Then
	ai_Icon = 0
End If

f_uo_SetTipTitle(ai_Icon, astr_Title)

li_Id = Integer(adw_dw.Describe(String(adw_dwo.Name) + ".id"))

adw_dw.SetFocus()

//adw_dw.f_uo_GetParentWindow( w_Wnd )
//lpo_parent = adw_dw.GetParent()
//do while IsValid (lpo_parent) 
//	if lpo_parent.TypeOf() <> window! then
//		lpo_parent = lpo_parent.GetParent()
//	else
//		exit
//	end if
//loop
//if IsNull(lpo_parent) Or not IsValid (lpo_parent) then
//	setnull(w_Wnd)	
//else
//	w_Wnd= lpo_parent
//end If

f_uo_AddTool(adw_dw, "", TTF_SUBCLASS + TTF_TRACK) 

li_X = f_uo_GetTotalX(adw_dw, adw_dwo)
li_Y = f_uo_GetTotalY(adw_dw, adw_dwo, al_Row)

li_X = UnitsToPixels(li_X, XUnitsToPixels!)
li_Y = UnitsToPixels(li_Y, YUnitsToPixels!)

f_uo_SetTipPosition(li_X, li_Y)
										 
f_uo_SetTipText(adw_dw, ii_TipID, astr_Tip)
f_uo_SetTrack(adw_dw, ii_TipID, True)

ido_Tip = adw_dw

// Hide the tip after 4 seconds
Timer(ii_TipTimer, iw_Requestor)

end subroutine

public subroutine f_uo_showtip (datawindow adw_dw, dwobject adw_dwo, long al_row, string astr_title, integer ai_icon, string astr_tip);//.............................................................................
//. nv_tooltip
//. Function: f_uo_showtip()
//.
//. Descr: Show a tip.
//.
//. Passed: Datawindow	adw_dw	 
//. 			Dwobject		adw_dwo	 
//. 			Long			al_row		 
//. 			String		astr_title	 
//. 			Integer		ai_icon	
//. 			String		astr_tip
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

f_uo_ShowTip(adw_dw, adw_dwo, al_Row, astr_Title, ai_Icon, astr_Tip, ii_MaxWidth)

end subroutine

public subroutine f_uo_showtip (dragobject ado_object, string astr_title, integer ai_icon, string astr_tip);//.............................................................................
//. nv_tooltip
//. Function: f_uo_showtip()
//.
//. Descr: Show a tip.
//.
//. Passed: Dragobject	ado_object	 
//. 			String		astr_title	
//. 			Integer		ai_icon
//. 			Integer		ai_maxwidth
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

f_uo_ShowTip(ado_Object, astr_Title, ai_Icon, astr_Tip, ii_MaxWidth)

end subroutine

public subroutine f_uo_settipposition (integer ai_x, integer ai_y);//...................................................................................
//. nv_tooltip
//. Function: f_uo_settipposition()
//.
//. Descr: This function sets the position of a tracking tooltip.
//.
//. Passed: Integer	ai_x - X position of the tooltip
//. 			Integer	ai_y - Y position of the tooltip
//. 				 
//. Returns: None
//.
//. Notes: The tooltip control chooses where the tooltip will be displayed (typically 
//.	near the tool) unless the TTF_ABSOLUTE flags is specified when adding the tool
//.
//...................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//===================================================================================

Send(hWndTT, TTM_TRACKPOSITION, 0, Long( ai_X, ai_Y))

end subroutine

public subroutine f_uo_showtip (dragobject ado_object, string astr_tip, integer ai_maxwidth);//.............................................................................
//. nv_tooltip
//. Function: f_uo_showtip()
//.
//. Descr: Show a tip.
//.
//. Passed: Dragobject	ado_object	 
//. 			String		astr_title	
//. 			Integer		ai_maxwidth
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Integer	li_X, li_Y
String 	lstr_text, lstr_type
window	w_Wnd

f_uo_SetMaxWidth(ai_MaxWidth)

// No title
f_uo_SetTipTitle(TTI_NONE, "")

f_uo_AddTool(ado_Object, "", TTF_SUBCLASS + TTF_TRACK) 

li_X = f_uo_GetTotalX(ado_object)
li_Y = f_uo_GetTotalY(ado_object)

li_X = UnitsToPixels(li_X, XUnitsToPixels!)
li_Y = UnitsToPixels(li_Y, YUnitsToPixels!)

f_uo_SetTipPosition(li_X, li_Y)
										 
f_uo_SetTipText(ado_object, ii_TipID, astr_Tip)
f_uo_SetTrack(ado_object, ii_TipID, True)

ido_Tip = ado_object

// Hide the tip after 4 seconds
Timer(ii_TipTimer, iw_Requestor)

end subroutine

public function integer f_uo_addtool (dragobject ado_object, string astr_tiptext, integer ai_flags);//................................................................................
//. nv_tooltip
//. Function: f_uo_addtool()
//.
//. Descr: Registers a control within the tooltip control.
//.
//. Passed: DragObject	ado_Object - Object to register within the tooltip control
//. 			String		astr_TipText - Tooltip Text
//. 			Integer		ai_Flags - Tool creation flags
//.
//. Returns: Integer
//.
//................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  --------------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=================================================================================

Integer	li_Width, li_Height
TOOLINFO ToolInfo

ToolInfo.cbSize = 40
// TTF_SUBCLASS	Flags
ToolInfo.uFlags = ai_Flags + TTF_IDISHWND	 
ToolInfo.hWnd = Handle(f_uo_getparent(ado_Object))
// Not used
ToolInfo.hInstance = 0  
ToolInfo.uID = Handle(ado_Object)
iul_Handle[ToolID] = ToolInfo.hWnd
ToolID++
ToolInfo.lpszText	= LocalAlloc(0, Lena(astr_TipText) + 1)
lStrCpy(ToolInfo.lpszText, astr_tiptext)

//	Define the object as a rectangle
ToolInfo.Rect.Left = 0
ToolInfo.Rect.Top = 0
ToolInfo.Rect.Right = UnitsToPixels(ado_Object.Width, XUnitsToPixels!)
ToolInfo.Rect.Bottom	= UnitsToPixels(ado_Object.Height, YUnitsToPixels!)

If ToolTipMsg(hWndTT, TTM_ADDTOOL, 0, ToolInfo) = 0 Then
//	MessageBox("Error", "Cannot register object in the toolwindow control!", StopSign!, Ok!)
	Return(-1)
End If

// Free Allocated Memory
LocalFree(ToolInfo.lpszText) 

Return (ToolID - 1)

end function

public subroutine f_uo_settiptitle (integer ai_icon, string astr_title);//.............................................................................
//. nv_tooltip
//. Function: f_uo_settiptitle()
//.
//. Descr: Sets the title and icon of the tooltip.
//.
//. Passed: Integer ai_icon	
//.				Values:  
//.					TTI_NONE = 0
//.					TTI_INFO = 1
//.					TTI_WARNING = 2
//.					TTI_ERROR = 3
//.
//. 			String astr_title
//. 				 
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

SendMessageString(hWndTT, TTM_SETTITLEA, ai_Icon, astr_Title)

end subroutine

public function integer f_uo_removetool (dragobject ado_object, integer ai_toolid);//..................................................................................
//. nv_tooltip
//. Function: f_uo_removetool()
//.
//. Descr: Unregisters a control within the tooltip control.
//.
//. Passed: DragObject	ado_Object - Object to unregister within the tooltip control
//. 			Integer		ai_toolid - Tool Id (returned by of_AddTool)
//.
//. Returns: Integer
//.
//..................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//==================================================================================

Integer	li_Width, li_Height
TOOLINFO ToolInfo

ToolInfo.cbSize = 40
//Flags 
ToolInfo.uFlags = 16	
ToolInfo.hWnd = Handle(f_uo_getparent(ado_Object))
// Not used
ToolInfo.hInstance = 0  
ToolInfo.uID = Handle(ado_Object)
iul_Handle[ToolID] = ToolInfo.hWnd

ToolTipMsg(hWndTT, TTM_DELTOOL, 0, ToolInfo)

Return 1

end function

public subroutine f_uo_showtip (dragobject ado_object, string astr_tip);//.............................................................................
//. nv_tooltip
//. Function: f_uo_showtip()
//.
//. Descr: Show a tip.
//.
//. Passed: Dragobject	ado_object	 
//. 			String		astr_title
//.
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

f_uo_ShowTip(ado_Object, astr_Tip, ii_MaxWidth)

end subroutine

public subroutine f_uo_useballoontip (boolean ab_balloon);//.............................................................................
//. nv_tooltip
//. Function: f_uo_useballontip()
//.
//. Descr: Use the balloon tip type?
//.
//. Passed: Boolean	ab_balloon	
//. 				
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

If ab_Balloon Then
	hWndTT = hWndTTBalloon
Else
	hWndTT = hWndTTNormal
End If

end subroutine

public subroutine f_uo_setmaxwidth (long al_maxwidth);//.............................................................................
//. nv_tooltip
//. Function: f_uo_setmaxwidth()
//.
//. Descr: Sets the maximum tooltip width. If the text is longer it will split
//.	over more than one line.
//.
//. Passed: Long	al_MaxWidth
//. 				
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Send(hWndTT, TTM_SETMAXTIPWIDTH, 0, UnitsToPixels(al_MaxWidth, xUnitsToPixels!))

Return

end subroutine

public subroutine f_uo_settiptext (dragobject ado_object, long al_uid, string astr_tiptext);//..............................................................................
//. nv_tooltip
//. Function: f_uo_settiptext()
//.
//. Descr: Sets the new text for a tool window.
//.
//. Passed: DragObject	ado_Object - Object registered on the toolwindow control
//. 			Long			astr_TipText - Object ID
//. 			String		astr_tiptext - Tooltip text
//.
//. Returns: None
//.
//..............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  -----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//==============================================================================

Long	ll_lpszText

//il_lpszText = LocalAlloc(0, Lena(astr_TipText))

If IsNull(astr_TipText) Then astr_Tiptext = ""
// One extra for an 0x00
ll_lpszText = LocalAlloc(0, Lena(astr_TipText) + 1) 
lStrCpy(ll_lpszText, astr_TipText)
f_uo_SetTipText(ado_Object, al_uId, ll_lpszText)

LocalFree(ll_lpszText)

end subroutine

public subroutine f_uo_setfont (string astr_fontname);//.............................................................................
//. nv_tooltip
//. Function: f_uo_setfont()
//.
//. Descr: Sets the font used in the tooltip window.
//.
//. Passed: String	astr_fontname	 
//. 				
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Long	ll_hfont
LogFont ls_Lf

ls_Lf.lffacename = astr_fontname
ls_Lf.lfweight = 400
ls_Lf.lfheight = -22
ls_Lf.lfPitchAndFamily =Char(2)
ls_Lf.lfClipPrecision = Char(2)
ls_Lf.lfOutPrecision = Char(1)
ls_Lf.lfQuality = Char(1)
ls_Lf.lfCharset = Char(1)
ll_hfont = CreateFontIndirect(ls_Lf)

f_uo_setfont(ll_hfont)

end subroutine

public function integer f_uo_gettextsize (datawindow adw, long al_row, string astr_col, string astr_text);//.............................................................................
//. nv_tooltip
//. Function: f_uo_gettextsize()
//.
//. Descr: Get the text size.
//.
//. Passed: Value	datawindow - adw          
//.			Value long - al_row      
//.			Value string - astr_col   
//.			Value string - astr_text 
//.
//. Returns: Integer
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Integer	li_height, li_width, li_Len, li_Return
Integer  li_WM_GETFONT = 49 
String 	lstr_text, lstr_fontface, lstr_fontsize, lstr_weight, lstr_italic, lstr_underline
Boolean	lb_italic, lb_underline
ULong    lul_Hdc, lul_Handle, lul_hFont
StaticText	lst_temp
size        ls_Size

lstr_text = astr_text
If IsNull(lstr_text) Or Lena(lstr_text) = 0 Then Return -1
lstr_fontface = adw.Describe(astr_col + '.font.face')
lstr_fontsize = adw.Describe(astr_col + '.font.height')

lstr_weight = adw.Describe(astr_col + '.font.weight')
lstr_italic = adw.Describe(astr_col + '.font.italic')
lstr_underline = adw.Describe(astr_col + '.font.underline')

If lstr_italic = '1' Then
    lb_italic = True
Else
    lb_italic = False
End If

If lstr_underline = '1' Then
    lb_underline = True
Else
    lb_underline = False
End If

If IsNull(iw_Requestor) Or Not IsValid (iw_Requestor) Then Return -1

li_Return = iw_Requestor.OpenUserObject(lst_temp)
If li_Return = 1 Then
    lst_temp.FaceName = lstr_fontface
    lst_temp.TextSize = Integer(lstr_fontsize)
    lst_temp.Weight = Integer(lstr_weight)
    lst_temp.Italic = lb_italic
    lst_temp.Underline = lb_underline
    lst_temp.width = 700
    
    li_Len = Lena(lstr_text)
    
    lul_Handle = Handle(lst_temp)
    lul_Hdc = GetDC(lul_Handle)
    
    lul_hFont = Send(lul_Handle, li_WM_GETFONT, 0, 0)
    
    SelectObject(lul_Hdc, lul_hFont)
    
    If Not GetTextExtentpoint32A(lul_Hdc, lstr_text, li_Len, ls_Size) Then
        iw_Requestor.CloseUserObject(lst_temp)
	 End If
    
    li_Width = PixelsToUnits(ls_Size.l_x, XPixelsToUnits!)
    li_Height = PixelsToUnits(ls_Size.l_y, YPixelsToUnits!)
    
    ReleaseDC(lul_Handle, lul_Hdc)
    li_Return = iw_Requestor.CloseUserObject(lst_temp) 
End If

Return li_Width

end function

public subroutine f_uo_setrequestor (window aw_requestor);//.............................................................................
//. nv_tooltip
//. Function: f_uo_setrequestor()
//.
//. Descr: Who needs this service.
//.
//. Passed: window	aw_requestor	
//. 				
//. Returns: None
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

iw_Requestor = aw_Requestor

end subroutine

public function integer f_uo_refreshtool (dragobject ado_object, string astr_tiptext, integer ai_flags, long al_id);//................................................................................
//. nv_tooltip
//. Function: f_uo_refreshtool()
//.
//. Descr: Refresh the tooltip control that has Registered.
//.
//. Passed: DragObject	ado_Object - Object to register within the tooltip control
//. 			String		astr_TipText - Tooltip Text
//. 			Integer		ai_Flags - Tool creation flags
//. 			long			al_id - Tool id
//.
//. Returns: Integer
//.
//................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  -------------------------------------------------
//= AG  02/22/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//= AG  06/18/13 00013173-CT-03	Fixed an issue.
//================================================================================

Integer	li_Width, li_Height
TOOLINFO ToolInfo

ToolInfo.cbSize = 40
// TTF_SUBCLASS Flags
ToolInfo.uFlags = ai_Flags + TTF_IDISHWND	 
ToolInfo.hWnd = Handle(f_uo_getparent(ado_Object))
// Not used
ToolInfo.hInstance = 0  
ToolInfo.uID = Handle(ado_Object)
iul_Handle[al_id] = ToolInfo.hWnd
ToolInfo.lpszText	= LocalAlloc(0, Lena(astr_TipText) + 1)
lStrCpy(ToolInfo.lpszText, astr_tiptext)

//	Define the object as a rectangle
ToolInfo.Rect.Left = 0
ToolInfo.Rect.Top = 0
ToolInfo.Rect.Right = UnitsToPixels(ado_Object.Width, XUnitsToPixels!)
ToolInfo.Rect.Bottom	= UnitsToPixels(ado_Object.Height, YUnitsToPixels!)

// 00013173-CT-03
f_uo_removetool(ado_object, al_id)

If ToolTipMsg(hWndTT, TTM_ADDTOOL, 0, ToolInfo) = 0 Then
	Return -1
End If

// Free Allocated Memory
LocalFree(ToolInfo.lpszText)

Return 1

end function

public function window f_uo_getparent (powerobject ado_object);//.............................................................................
//. nv_tooltip
//. Function: f_uo_getparent()
//.
//. Descr: Get ado_object's parent.
//.
//. Passed: powerobject	ado_Object
//.
//. Returns: window
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/28/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//=============================================================================

Powerobject	lpo_parent

lpo_parent = ado_object

Do While IsValid(lpo_parent)
	If lpo_parent.TypeOf() = window! Then Exit
	lpo_parent = lpo_parent.GetParent()
Loop

Return lpo_parent

end function

public subroutine f_uo_doubleclicked (datawindow adw_source, dwobject ado_dwo, long al_row, boolean ab_option, string astr_action, string astr_title, string astr_displayonly, string astr_required, any aa_param);////...........................................................................................
////. nv_tooltip
////. Function: f_uo_doubleclicked()
////.
////. Desc: Open w_text_edit to change the column's value
////.
////. Passed: Datawindow	adw_source			Doubleclicked object
////. 			Dwobject		ado_dwo				From doubleclicked event parameter ado_dwo
////. 			Long			al_row				From doubleclicked event parameter row
////. 			Boolean		ab_option			Open w_text_edit dependent on the tooltip option
////. 															or not ?  True-->yes,False-->no
////. 			String		astr_action			The opener window  istr_action
////. 			String		astr_title			w_text_edit title
////. 			String		astr_displayonly	dwo object displayonly  properties
////. 			String		astr_required		dwo object required  properties
////. 			any			aa_param				other parameter
////.
////. Returns: None
////.
////. Example: f_uo_doubleclicked(This, dwo, row, True, istr_action, '', '', '', '')
////...........................................................................................
////= CHANGE LOG
////=
////= Who   Date   Work Order      Description
////= --- -------- --------------  ------------------------------------------------------------
////= AG  02/28/13 00013173-CT-03	Initial coding.
////= AG  03/13/13 00013173-CT-03	Fixed an issue.
////= JMF 03/27/13 00013173-CT-38	Code Review.
////= AG  03/13/13 00013173-CT-03	Fixed an issue.
////= AG  04/15/13 00013173-CT-03	Fixed an issue(The value of protect get incorret in PB ).
////= AG  04/24/13 00013173-CT-03	Fixed an issue.
////= AG  06/19/13 00013173-CT-03	Fixed an issue(The w_text_edit can't open when the field in header area,
////=																The compute field doubleclick  can't open w_text_edit.)
////===========================================================================================
//
//String	lstr_object, lstr_text, lstr_style, lstr_coltpye, lstr_displayonly, lstr_allowedit, lstr_scroll, lstr_bitmap
//String	lstr_comments, lstr_title, lstr_size, lstr_null, lstr_type, lstr_autoscroll, lstr_required, lstr_express
//String	lstr_password, lstr_band
//Boolean	lb_open_edit = False
//Integer	li_pos, li_text_width, li_column_width, li_tab
//s_text_edit 	ls_text_edit
//
//If ab_option Then
//	If Not ib_option_tooltip Then Return
//End If
//
//SetNull(lstr_null)
//lstr_object = ado_dwo.name
//lstr_bitmap = Lower(adw_source.Describe(lstr_object + ".bitmapname"))
//lstr_style = Lower(adw_source.Describe(lstr_object + ".edit.style"))
//lstr_type = Lower(adw_source.Describe(lstr_object + ".type"))
//lstr_coltpye = Lower(adw_source.Describe(lstr_object + ".coltype"))
//li_column_width = Integer(adw_source.Describe(lstr_object + ".Width"))
//lstr_autoscroll = Lower(adw_source.Describe(lstr_object + ".edit.autovscroll"))
//lstr_password = Lower(adw_source.Describe(lstr_object + ".edit.password"))
//If lstr_bitmap = '1' Then lstr_bitmap = 'yes'
//If lstr_password = '1' Then lstr_password = 'yes'
//
//If lstr_autoscroll = '1' Or lstr_autoscroll = 'yes' Then 
//	lstr_autoscroll = 'yes'	
//Else
//	lstr_autoscroll = 'no'
//End If
//
//lstr_band = adw_source.GetBandAtPointer()
//If Pos(lstr_band, 'detail') = 0  And (lstr_type = 'column'  Or lstr_type = 'compute') Then
//	gn_sys.f_uo_parse_string(lstr_band, "~t")
//	al_row = Long(lstr_band)
//End If
//
//If al_row < 1 Then Return
//
////If lstr_type <> 'column' Or (lstr_displayonly = 'yes' And lstr_autoscroll = 'no') Or Left(lstr_coltpye, 5) <> 'char(' Or al_row <= 0 Then 
//If (lstr_type <> 'column' And lstr_type <> 'compute') Or (Left(lstr_coltpye, 5) <> 'char(' And lstr_coltpye <> 'char') &
//	Or lstr_bitmap = 'yes' Or lstr_password = 'yes' Then 
//	Return
//End If
//
//// Open w_text edit when the columns can edit
//IF astr_displayonly = 'yes' Or astr_displayonly = 'no' Then
//	lstr_displayonly = astr_displayonly
//Else
//	lstr_displayonly = Lower(adw_source.Describe(lstr_object + ".protect"))
//	
//	li_tab = Pos(lstr_displayonly,"~t")
//	If li_tab > 0 Then
//		lstr_express = Mid(lstr_displayonly, li_tab + 1, Len(lstr_displayonly) - li_tab - 1)
//		lstr_displayonly =adw_source.Describe('Evaluate("' + lstr_express + '",' + String(al_row) +')')
//	End If
//	
//	If lstr_displayonly = '1' Or  lstr_displayonly = 'yes' Then
//		lstr_displayonly = 'yes'		
//	Else
//		lstr_displayonly = adw_source.Describe(lstr_object + '.tabsequence')
//		If lstr_displayonly = '0' Then 
//			lstr_displayonly = 'yes'
//		Else			
//			If lstr_style = 'edit' Then 
//				lstr_displayonly = lower(adw_source.Describe(lstr_object + ".edit.displayonly"))
//				If lstr_displayonly = '1' Or lstr_displayonly = 'yes' Then
//					lstr_displayonly = 'yes'
//				Else
//					lstr_displayonly = 'no'
//				End If
//			Else
//				lstr_displayonly = 'no'
//			End If			
//		End If	
//	End If
//End If
//
//Choose Case lstr_style
//	Case 'dddw'
//		lstr_allowedit = Lower(adw_source.Describe(lstr_object + ".dddw.allowedit"))
//		If lstr_allowedit = 'yes' Or lstr_allowedit = '1' Then lb_open_edit = True
//	Case 'ddlb'
//		lstr_allowedit = Lower(adw_source.Describe(lstr_object + ".ddlb.allowedit"))
//		If lstr_allowedit = 'yes' Or lstr_allowedit = '1' Then lb_open_edit = True
//	Case 'edit'	
//		lb_open_edit = True
//		lstr_autoscroll = Lower(adw_source.Describe(lstr_object + ".edit.autovscroll"))
//		If lstr_autoscroll = '1' Then lstr_autoscroll = 'yes'
//	Case Else
//		IF  lstr_type = 'compute' Then
//			 lstr_displayonly = 'yes'
//		Else
//			Return
//		End If
//End Choose
//
//If lb_open_edit Or lstr_displayonly = 'yes' Then 
//	If lstr_displayonly = 'no' Or lstr_displayonly = '0' Then
//		lstr_comments = adw_source.GetText()
//	Else
//		If lstr_style = 'dddw' Or lstr_style = 'ddlb' Then
//			lstr_comments = adw_source.Describe("evaluate('LookUpDisplay(" + lstr_object+")'," + String(al_row) + ")")
//		Else
//			lstr_comments = adw_source.GetItemString(al_row, lstr_object)
//		End If
////		li_text_width = inv_tooltip.f_uo_gettextsize(adw_source, al_row, lstr_object, lstr_comments)
////		// dddw and ddlb has a arrow ,so the column width decrease 64
////		If lstr_style = 'dddw' Or lstr_style = 'ddlb' Then 
////			li_column_width = li_column_width - 64
////		End If
////		If li_text_width < li_column_width Then 
////			Return
////		End If
//	End If
//	
//	If Len(astr_title) > 0 Then
//		lstr_title = astr_title
//	Else
//		If adw_source.Describe(lstr_object + "_t.name") = lstr_object + "_t" Then
//			lstr_title = adw_source.Describe(lstr_object + "_t.text")
//		Else
//			lstr_title = ""
//		End If
//	End If
//	
//	lstr_size = adw_source.Describe(lstr_object + '.' + lstr_style + '.limit')
//	If lstr_size = '0' Then
//		li_pos = Pos(lstr_coltpye, 'char(') + 5
//		lstr_size = Mid(lstr_coltpye, li_pos, Pos(lstr_coltpye, ')') - li_pos)
//	End If
//	
//	If astr_required = 'yes' Or astr_required = 'no' Then
//		lstr_required = astr_required
//	Else
//		lstr_required = Lower(adw_source.Describe(lstr_object + '.' + lstr_style + ".required"))
//		If lstr_required = 'yes' or lstr_required = '1' Then
//			lstr_required = 'yes'
//		Else
//			lstr_required = 'no'
//		End If
//	End If
//	
//	If lstr_displayonly = 'yes' Then 
//		gn_sys.f_uo_open("w_text_edit", astr_action, False, "yes|no",lstr_required, lstr_size, lstr_comments, lstr_title)
//	Else	
//		gn_sys.f_uo_open("w_text_edit", astr_action, False, "no|no",lstr_required, lstr_size, lstr_comments, lstr_title)
//	End If
//	
//	//	Get the data passed back from the window in the Message object
//	ls_text_edit = Message.PowerObjectParm
//	lstr_comments = Trim(ls_text_edit.str_text)  
//	If lstr_displayonly <> 'yes' Then
//		// see which button the user pressed
//		Choose Case Lower(ls_text_edit.str_button_clicked)
//			Case "ok"
//				// set text
//				If lstr_comments = "" Then
//					adw_source.SetItem(al_row, lstr_object, lstr_null)
//				Else
//					If lstr_autoscroll <> 'yes' Then
//						lstr_comments = gn_sys.f_uo_replace_string( lstr_comments, "~r~n", "")
//					End If
//					// adw_source.SetItem(al_row, lstr_object, lstr_comments)
//					adw_source.SetText(lstr_comments)
//				End If
//			Case "delete"
//				adw_source.SetItem(al_row, lstr_object, lstr_null)
//			Case "cancel"			
//				// do not make any changes							
//		End Choose	
//	End If
//	
//	SetPointer(Arrow!)
//	
//	// Make sure the text is not highlighted after w_text_edit_expanded is opened
//	If lb_open_edit And lstr_displayonly <> 'yes' Then
//		adw_source.SelectText(1, 0)
//		lstr_scroll = Lower(adw_source.Describe(lstr_object + '.' + lstr_style + '.vscrollbar'))
//		If lstr_scroll = 'yes' Then
//			adw_source.Modify(lstr_object + '.' + lstr_style + '.vscrollbar=no')
//			adw_source.Modify(lstr_object + '.' + lstr_style + '.vscrollbar=yes')
//		Else
//			adw_source.Modify(lstr_object + '.' + lstr_style + '.vscrollbar=yes')
//			adw_source.Modify(lstr_object + '.' + lstr_style + '.vscrollbar=no')
//		End If
//	End If
//End If
//	
end subroutine

public subroutine f_uo_dwndropdown (datawindow adw_source, boolean ab_option, double ad_scale);////...........................................................................................
////. nv_tooltip
////. Function: f_uo_dwndropdown()
////.
////. Desc: Expand objects's width 
////.
////. Passed: Datawindow	adw_source - Doubleclicked object
////. 			Boolean		ab_option  - Expand objects's width depend on the tooltip option
////. 												or not ?  True-->yes,False-->no
////. 			Double		ad_scale	  - Enlarge scale
////.
////. Returns: None
////.
////. Example: f_uo_dwndropdown(This, True, 2)
////...........................................................................................
////= CHANGE LOG
////=
////= Who   Date   Work Order      Description
////= --- -------- --------------  ------------------------------------------------------------
////= AG  02/28/13 00013173-CT-03	Initial coding.
////= JMF 03/27/13 00013173-CT-38	Code Review.
////= AG  11/22/13 00016263-CT-01	Workaround dropdown list too Short for last value.
////= AG  03/05/14 00016263-CT-01	Rollback Work around.
////===========================================================================================
//
//String	lstr_return, lstr_dwo, lstr_modify, lstr_objects, lstr_obj, lstr_type, lstr_height, lstr_text_x
//String	lstr_visible, lstr_tag, lstr_array_obj[], lstr_array[], lstr_band, lstr_line
//Integer	li_width, li_pos, li_x, li_x_all, li_array_x[], i, j, k, li_width_add
//DataWindowChild dwc_child
//
//If ab_option Then
//	//
//	// EFx and ToolTip is turned off. Return without executing code.
//	// 00016263-CT-01	Add a workaround method on Xi
//	//
////	If Not ib_option_tooltip And Not gb_is_appeon Then 
////		Return
////	End If
//	If Not ib_option_tooltip Then 
//		Return
//	End If
//End If
//
//lstr_return = adw_source.GetObjectAtPointer( )
//lstr_dwo = Left(lstr_return, Pos(lstr_return,"~t" ) - 1)
//adw_source.GetChild(lstr_dwo, dwc_child)
//
//// 00016263-CT-01 apb6.8 has fixed this issue,rollback workaround.
////// 00016263-CT-01 Add a line object to summary band and set summary height.
////If gb_is_appeon Then
////	lstr_line  = dwc_child.Describe("l_workaround.Visible")
////	If lstr_line  =  "!" Then
////		lstr_height = dwc_child.Describe("DataWindow.Detail.Height.AutoSize")
////		If lstr_height = 'yes' Then
////			// dwc_child.Describe('Evaluate("rowheight()",' + String(dwc_child.Rowcount()) + ')') 
////			lstr_height = '40' 
////		Else
////			lstr_height ='4'
////		End If
////		
////		lstr_line = 'Create line(band=summary x1="0" y1="0" x2="1" y2="0"  name=l_workaround visible="1" )~t' + &
////						'DataWindow.summary.Height=' + lstr_height
////		dwc_child.Modify(lstr_line)
////	End If
////End If
//
//// 00016263-CT-01 Add a line object to summary band and set summary height to 50.
////	JMF - I discovered that setting DataWindow.summary.Height=50 fixed the issues I found. 
////	However, Appeon made the above code change the same day that I put the code change in below.
//// I tested Andys's code change above and it is working as well. It will actually be better if in some cases we
//// have less space at the bottom of the DDDW.
////
////If gb_is_appeon Then
////	lstr_line  = dwc_child.Describe("l_workaround.Visible")
////	If lstr_line  =  "!" Then
////		lstr_line = 'Create line(band=summary x1="0" y1="0" x2="1" y2="0"  name=l_workaround visible="1" )~r~n DataWindow.summary.Height=50'
////		dwc_child.Modify(lstr_line)
////	End If
////End If
//
////// 00016263-CT-01 If ToolTip is turned off, bypass the remaining code
////If ab_option Then
////	If Not ib_option_tooltip Then 
////		Return
////	End If
////End If
//
//lstr_objects = Trim(dwc_child.describe("DataWindow.objects"))
//lstr_modify = ""
//li_x_all = 0
//i = 0
//
//f_uo_parse_string_into_array(lstr_objects, '~t', lstr_array)
//
//For k =  1 To UpperBound(lstr_array) 	
//	lstr_visible = Lower(dwc_child.Describe(lstr_array[k] + ".Visible"))
//	lstr_type = Lower(dwc_child.Describe(lstr_array[k] + ".type"))
//	
//	If (lstr_visible = "yes" Or lstr_visible = "1") And lstr_type <> 'text' Then
//		i = i + 1
//		lstr_array_obj[i] = lstr_array[k]
//		li_array_x[i] = Integer(dwc_child.Describe(lstr_array[k] + ".X"))		
//		
//		// Make a marker to first object's tag when first dropdown
//		If i = 1 Then
//			lstr_tag =  Lower(dwc_child.Describe(lstr_array[k] + ".tag"))
//			If pos(lstr_tag, "/width_changed/") > 0 Then
//				Return 
//			Else
//				lstr_modify += lstr_array[k] + ".Tag='" + lstr_tag + "/width_changed/'" + "~t"
//			End If		
//		End If
//		
//	End If
//Next	
//
//// Sort by object's x
//For j = 1 To i - 1
//	For k =j + 1 To i
//		If li_array_x[j] > li_array_x[k] Then
//			li_x = li_array_x[j]
//			li_array_x[j] = li_array_x[k]
//			li_array_x[k] = li_x
//			lstr_obj = lstr_array_obj[j]
//			lstr_array_obj[j] = lstr_array_obj[k]
//			lstr_array_obj[k] = lstr_obj
//		End If
//	Next
//Next
//
//For j = 1 To i
//	li_width = Integer(dwc_child.Describe(lstr_array_obj[j] + ".Width"))
//	lstr_band = dwc_child.Describe(lstr_array_obj[j] + ".Band")
//	
//	If lstr_band = "detail" Then 
//		li_width_add = li_width * (ad_scale - 1) 
//		lstr_modify = lstr_modify + lstr_array_obj[j] + ".X=" + String(li_array_x[j] + li_x_all) + "~t"
//		lstr_modify = lstr_modify + lstr_array_obj[j] + ".Width=" + String(Integer(li_width * ad_scale)) + "~t"			
//		
//		// Set the object's x on header band. This bug	is that some of dddw(eg.d_iv_freight_codes) have a header band,
//		// The header band objects's X must move. 
//		lstr_text_x = dwc_child.Describe(lstr_array_obj[j] + "_t.X")
//		If lstr_text_x <> '!' Then 
//			lstr_modify = lstr_modify + lstr_array_obj[j] + "_t.X=" + String(li_array_x[j] + li_x_all) + "~t"
//		End If	
//		
//		li_x_all += li_width_add
//	End If
//Next
//
//dwc_child.Modify(lstr_modify)
//
end subroutine

public function long f_uo_add_tooltip (dragobject ado_object);//................................................................................
//. nv_tooltip
//. Function: f_uo_add_tooltip()
//.
//. Descr: Registers a control within the tooltip control.
//.
//. Passed: DragObject	ado_Object - Object to register within the tooltip control
//. Returns: Long
//.
//. Example:	f_uo_add_tooltip(dw_main)
//................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  -------------------------------------------------
//= AG  02/20/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//================================================================================

Long	ll_id

If ib_option_tooltip	Then
	ll_id = f_uo_AddTool(ado_Object, "" , TTF_SUBCLASS)
	Return ll_id
Else
	Return 0
End If

end function

public function integer f_uo_refresh_tooltip (dragobject ado_object, long al_id);//................................................................................
//. nv_tooltip
//. Function: f_uo_refresh_tooltip()
//.
//. Descr: Refresh the tooltip control that has Registered.
//.
//. Passed: DragObject	ado_Object - Object to register within the tooltip control
//.			Long			al_id - Tool id
//. Returns:   Integer
//.
//. Example:	f_uo_refresh_tooltip(dw_main, ll_id)
//................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  -------------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//================================================================================

Long	ll_id

If ib_option_tooltip	Then
	ll_id = f_uo_refreshtool(ado_Object, "" , TTF_SUBCLASS, al_id)
	Return ll_id
//	If Not gb_is_appeon Then
//		ll_id = f_uo_refreshtool(ado_Object, "" , TTF_SUBCLASS, al_id)
//		Return ll_id
//	Else
//		Return 1
//	End If	
Else
	Return 1
End If

end function

public function integer f_uo_gettextsize (singlelineedit asl_object, string astr_text);//.............................................................................
//. nv_tooltip
//. Function: f_uo_gettextsize()
//.
//. Descr: Get the text size.
//.
//. Passed:  Value	singlelineedit - asl_object           
//.		     	Value string - astr_text 
//.
//. Returns: Integer
//.
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ----------------------------------------------
//= AG  06/18/13 00013173-CT-03	Initial coding.
//=============================================================================

Integer	li_height, li_width, li_Len, li_Return, li_fontsize, li_weight
Integer  li_WM_GETFONT = 49 
String 	lstr_text, lstr_fontface
Boolean	lb_italic, lb_underline, lb_weight
ULong    lul_Hdc, lul_Handle, lul_hFont
StaticText	lst_temp
size        ls_Size

lstr_text = astr_text
If IsNull(lstr_text) Or Lena(lstr_text) = 0 Then Return -1
lstr_fontface = asl_object.FaceName
li_fontsize = asl_object.TextSize
li_weight = asl_object.weight
lb_italic = asl_object.Italic
lb_underline = asl_object.Underline


If IsNull(iw_Requestor) Or Not IsValid (iw_Requestor) Then Return -1

li_Return = iw_Requestor.OpenUserObject(lst_temp)
If li_Return = 1 Then
    lst_temp.FaceName = lstr_fontface
    lst_temp.TextSize = Integer(li_fontsize)
    lst_temp.Weight = Integer(li_weight)
    lst_temp.Italic = lb_italic
    lst_temp.Underline = lb_underline
    lst_temp.width = 700
    
    li_Len = Lena(lstr_text)
    
    lul_Handle = Handle(lst_temp)
    lul_Hdc = GetDC(lul_Handle)
    
    lul_hFont = Send(lul_Handle, li_WM_GETFONT, 0, 0)
    
    SelectObject(lul_Hdc, lul_hFont)
    
    If Not GetTextExtentpoint32A(lul_Hdc, lstr_text, li_Len, ls_Size) Then
        iw_Requestor.CloseUserObject(lst_temp)
	 End If
    
    li_Width = PixelsToUnits(ls_Size.l_x, XPixelsToUnits!)
    li_Height = PixelsToUnits(ls_Size.l_y, YPixelsToUnits!)
    
    ReleaseDC(lul_Handle, lul_Hdc)
    li_Return = iw_Requestor.CloseUserObject(lst_temp) 
End If

Return li_Width
end function

public function string f_uo_parse_string (string astr_parameter, string astr_separator);//.............................................................................................
//. nv_tooltip
//. Function f_uo_parse_string()
//.
//. Desc: Returns first part of string up to (passed) seperator. Remainder of string is 
//.	returned via reference.
//.
//. Passed:	String	astr_parameter (ref) - String to be parsed. Will return what's left of 
//.													  string
//.			String 	astr_separator - Separator - where to stop parsing ...
//.
//. Returns: String - Original string up to (not including) seperator
//.
//. Example: lstr_empnum = gn_sys.f_uo_parse_string_all(lstr_allemps, '\')
//.
//.............................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  --------------------------------------------------------------
//= ??? ?		  ?  					Initial coding.
//=============================================================================================

String	lstr_value
Integer	li_pos
Integer	li_length

li_pos	= Pos(astr_parameter, astr_separator)

If li_pos = 0 Then
	lstr_value = astr_parameter
	astr_parameter = ""
Else

	li_length = Len(astr_separator)

	lstr_value 		= Left(astr_parameter, li_pos - 1)
	astr_parameter	= Mid	(astr_parameter, li_pos + li_length)
End If

Return lstr_value

end function

public function integer f_uo_parse_string_into_array (string astr_parameter, string astr_separator, string astr_array[]);//.............................................................................................
//. nv_tooltip
//. Function f_uo_parse_string_into_array()
//.
//. Desc: Parses a delimited string and places it in an array.
//.
//. Passed:	String	astr_parameter - String to be parsed.
//.			String 	astr_separator - Separator.
//.			String	astr_array[] (ref) - String array
//.
//. Returns: Integer  1 Succesful
//.						-1 Failed
//.
//. Example: li_rc = gn_sys.f_uo_parse_string_into_array(astr_parameter, ',', astr_array)
//.
//.............................................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  --------------------------------------------------------------
//= JMF 06/15/10 00009669-CT-27  Initial coding.
//=============================================================================================

String	lstr_parameter, lstr_rc
String	lstr_array[]
Integer	li_index

lstr_parameter = astr_parameter

Do Until lstr_parameter = ""
	lstr_rc = f_uo_parse_string(lstr_parameter, astr_separator)
	If Isnull(lstr_rc) Or Trim(lstr_rc) = "" Then Exit
	
	li_index++
	lstr_array[li_index] = lstr_rc
Loop

astr_array = lstr_array

Return 1

end function

public subroutine f_uo_dwnmousemove (datawindow adw_source, dwobject ado_dwo, long al_row, long al_tooltip_id, boolean ab_text, string astr_value, string astr_displayonly, any aa_parm, long al_view, long al_screen);//====================================================================
// Function: f_uo_dwnmousemove
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    datawindow    adw_source
// 	value    dwobject      ado_dwo
// 	value    long          al_row
// 	value    long          al_tooltip_id
// 	value    boolean       ab_text
// 	value    string        astr_value
// 	value    string        astr_displayonly
// 	value    any           aa_parm
// 	value    long          al_view
// 	value    long          al_screen
//--------------------------------------------------------------------
// Returns:  (None)
//--------------------------------------------------------------------
// Author:	Jay Chen		Date: 07-20-2015
//--------------------------------------------------------------------
//	Copyright (c) 2008-2014 ContractLogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String	lstr_object, lstr_text, lstr_bitmap, lstr_coltpye, lstr_displayonly, lstr_style
String	lstr_type, lstr_band, lstr_autoscroll, lstr_express, lstr_password
Integer	li_text_width, li_column_width, li_tab
long ll_find

lstr_object = ado_dwo.name
lstr_bitmap = Lower(adw_source.Describe(lstr_object + ".bitmapname"))
lstr_style = Lower(adw_source.Describe(lstr_object + ".edit.style"))
lstr_type = Lower(adw_source.Describe(lstr_object + ".type"))
li_column_width = Integer(adw_source.Describe(lstr_object + ".Width"))	
lstr_coltpye  = Lower(adw_source.Describe(lstr_object + ".coltype")) 
lstr_band = adw_source.GetBandAtPointer()
lstr_password = Lower(adw_source.Describe(lstr_object + ".edit.password"))
If lstr_bitmap = '1' Then lstr_bitmap = 'yes'
If lstr_password = '1' Then lstr_password = 'yes'

// text fields show tooltip 
If ab_text And lstr_type = 'text' Then
	IF Len(astr_value) > 0 Then 
		lstr_text = astr_value
	Else
		lstr_text = adw_source.Describe(lstr_object + ".text")
	End If
Else  // Column fields show tooltip 
	// When a column in the header group band
	// 00014156-CT-03
	//If Pos(lstr_band, 'header.') > 0  And lstr_type = 'column' Then
	If Pos(lstr_band, 'detail') = 0  And (lstr_type = 'column'  Or lstr_type = 'compute') Then
		f_uo_parse_string(lstr_band, "~t")
		al_row = Long(lstr_band)
	End If
	
	// 00014156-CT-03
	//If Not (lstr_type = 'column' ) Or lstr_bitmap = 'yes'  Or al_row <= 0 Then
	If Not (lstr_type = 'column' Or lstr_type = 'compute' ) Or lstr_bitmap = 'yes'  Or al_row <= 0 Or lstr_password = 'yes'  Then
		f_uo_SetTipText(adw_source, al_tooltip_id, "" )
		il_tooltip_row = 0
		Return
	End If
	
	// Show tooltip when the columns is singleline
//	lstr_autoscroll = Lower(adw_source.Describe (lstr_object + '.edit.autovscroll'))
//	If lstr_autoscroll = 'yes' Or  lstr_autoscroll = '1' Then Return	
//	lstr_autoscroll = Lower(adw_source.Describe (lstr_object + '.edit.vscrollbar'))
//	If lstr_autoscroll = 'yes' Or  lstr_autoscroll = '1' Then Return
	
//	// show tooltip when the columns can't edit
//	IF astr_displayonly = 'yes' Or astr_displayonly = 'no' Then
//		lstr_displayonly = astr_displayonly
//	Else
//		lstr_displayonly = Lower(adw_source.Describe (lstr_object + '.protect'))
//		li_tab = Pos(lstr_displayonly,"~t")
//		If li_tab > 0 Then
//			lstr_express = Mid(lstr_displayonly, li_tab + 1, Len(lstr_displayonly) - li_tab - 1)
//			lstr_displayonly =adw_source.Describe('Evaluate("' + lstr_express + '",' + String(al_row) +')')
//		End If
//		If lstr_displayonly = '0' Or lstr_displayonly = 'no' Then
//			lstr_displayonly = adw_source.Describe(lstr_object + '.tabsequence')
//			If lstr_displayonly = '0' Then 
//				lstr_displayonly = 'yes'
//			Else
//				If lstr_style = 'edit' Then 
//					lstr_displayonly = lower(adw_source.Describe(lstr_object + ".edit.displayonly"))
//					If lstr_displayonly = '1' Or lstr_displayonly = 'yes' Then
//						lstr_displayonly = 'yes'
//					Else
//						lstr_displayonly = 'no'
//					End If
//				Else
//					lstr_displayonly = 'no'
//				End If
//			End If	
//		Else
//			lstr_displayonly = 'yes'
//		End If
//	End If
//	If lstr_displayonly <> 'yes' Then Return	
	
	// dddw and ddlb has a arrow ,so the column width decrease 64
	If lstr_style = 'dddw' Or lstr_style = 'ddlb' Then 
		li_column_width = li_column_width - 64
	End If
	
//	IF Len(astr_value) > 0 Then 
//		lstr_text = astr_value
//	Else
//		If lstr_style = 'dddw' Or lstr_style = 'ddlb' Then 
//			lstr_text = adw_source.Describe("evaluate('LookUpDisplay(" + lstr_object+")'," + String(al_row) + ")")
//		Else
//			// 00014156-CT-03
//			//If Left(lstr_coltpye, 5) = 'char('  Then
//			If Left(lstr_coltpye, 5) = 'char(' Or lstr_coltpye = 'char' Then
//				lstr_text = adw_source.GetItemString(al_row, lstr_object)
//			Else
//				Return
//			End If
//		End If
//	End If

End If

If il_tooltip_row <> al_row Or istr_tooltip_column <> lstr_object Or il_tooltip_oldid <>  al_tooltip_id Then
	il_tooltip_row = al_row
	istr_tooltip_column = lstr_object	
	il_tooltip_oldid =  al_tooltip_id
//	select field_tip into :lstr_text from ctx_screen_field_tips where view_id = :al_view and screen_id = :al_screen and field_name = :lstr_object;
	//Modified By Jay Chen 10-09-2015
	// <RP> 1.10.2017 --------------------------------------------
	gnv_data.of_retrieveIfNecessary("ctx_screen_field_tips", FALSE)
	// <RP>
	ll_find = gnv_data.ids_screen_field_tips.find("view_id = " + string(al_view) + " and screen_id = " + string(al_screen) + " and field_name = '"+lstr_object+"' " , 1, gnv_data.ids_screen_field_tips.rowcount())
	if isnull(ll_find) then ll_find = 0
	if ll_find > 0 then
		lstr_text = gnv_data.ids_screen_field_tips.getitemstring(ll_find, "field_tip")
	end if
	if isnull(lstr_text) then lstr_text = ''
	if lower(lstr_text) = lower(lstr_object) then
		If lstr_style = 'dddw' Or lstr_style = 'ddlb' Then 
			lstr_text = adw_source.Describe("evaluate('LookUpDisplay(" + lstr_object+")'," + String(al_row) + ")")
		else
			choose case lower(left(lstr_coltpye,3))
				case 'int','lon','dec','num','dou'
					lstr_text = string(adw_source.getitemnumber(al_row, lstr_object))
				case 'dat'
					lstr_text = string(adw_source.getitemdatetime(al_row, lstr_object))
				case 'var','cha'	
					lstr_text = adw_source.getitemstring(al_row, lstr_object)
			end choose
		end if
	end if
//	li_text_width = f_uo_gettextsize(adw_source, al_row, lstr_object, lstr_text)
//	If li_text_width > li_column_width Then 
	if AppeonGetClientType() = 'PB' and len(lstr_text) > 0 then	
		adw_source.modify(lstr_object + ".tooltip.enabled = true" )
		adw_source.modify(lstr_object + ".tooltip.tip = '" + lstr_text + "'" )
	else
		f_uo_SetTipText( adw_source, al_tooltip_id, lstr_text )
	end if
//	End If
End If

end subroutine

on nv_tooltip.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nv_tooltip.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//.............................................................................
//. nv_tooltip
//. Event: constructor() 
//.
//. Desc: Non visual is being constructed
//.
//. Passed: None
//.
//. Returns: Long
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//===============================================================================

InitCommonControls()

hWndTTBalloon = CreateWindowExA(WS_EX_TOPMOST,TOOLTIPS_CLASS,0, TTF_CENTERTIP + TTS_BALLOON + 1, &
         CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,  &
         0, 0, Handle(GetApplication()),0)

hWndTTNormal = CreateWindowExA(WS_EX_TOPMOST,TOOLTIPS_CLASS,0, TTF_CENTERTIP + 1, &
         CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT,  &
         0, 0, Handle(GetApplication()),0)

end event

event destructor;//.............................................................................
//. nv_tooltip
//. Event: destructor()
//.
//. Desc: Non visual is being destroyed.
//.
//. Passed: None
//.
//. Returns: Long
//.............................................................................
//= CHANGE LOG
//=
//= Who   Date   Work Order      Description
//= --- -------- --------------  ---------------------------------------------
//= AG  02/18/13 00013173-CT-03	Initial coding.
//= JMF 03/27/13 00013173-CT-38	Code Review.
//===============================================================================

DestroyWindow(hWndTTNormal)
DestroyWindow(hWndTTBalloon)

end event

