$PBExportHeader$uo_tooltips.sru
$PBExportComments$ÊäÈëÀ¸ÌáÊ¾Ð¡´°
forward
global type uo_tooltips from nonvisualobject
end type
type point from structure within uo_tooltips
end type
type msg from structure within uo_tooltips
end type
type rect from structure within uo_tooltips
end type
type toolinfo from structure within uo_tooltips
end type
end forward

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

global type uo_tooltips from nonvisualobject autoinstantiate
end type

type prototypes
// ToolTipsº¯Êý
SubRoutine InitCommonControls() library "comctl32.dll"
Function long CreateWindowExA(ulong dwExStyle, string ClassName, &
     long WindowName, ulong dwStyle, ulong X, ulong Y, ulong nWidth, &
     ulong nHeight, ulong hWndParent, ulong hMenu, ulong hInstance, &
     ulong lpParam) library "user32.dll" alias for "CreateWindowExA;Ansi"
Function integer DestroyWindow(long hWnd) library "user32.dll"
Function integer ToolTipMsg(long hWnd, long uMsg, long wParam, &
     REF TOOLINFO ToolInfo) library "user32.dll" Alias For "SendMessageA;Ansi"
Function integer RelayMsg(long hWnd, long uMsg, long wParam, &
     REF MSG Msg) library "user32.dll" Alias For "SendMessageA;Ansi"

//ÄÚ´æ¹ÜÀíº¯Êý
Function long LocalAlloc(long Flags, long Bytes) library "kernel32.dll"
Function long LocalFree(long MemHandle) library "kernel32.dll"
Function long lstrcpy(long Destination, string Source) library "kernel32.dll" alias for "lstrcpy;Ansi"

end prototypes

type variables
//Ë½ÓÐ³£Á¿
Private:

//ÔÓÏî³£Á¿
CONSTANT string	TOOLTIPS_CLASS = 'tooltips_class32'
CONSTANT ulong	CW_USEDEFAULT = 2147483648
CONSTANT long	WM_USER = 1024
CONSTANT long	WS_EX_TOPMOST = 8
CONSTANT long	WM_SETFONT = 48

// ToolTipsÏûÏ¢
CONSTANT long TTM_ADDTOOL = WM_USER + 4
CONSTANT long TTM_NEWTOOLRECT = WM_USER + 6
CONSTANT long TTM_RELAYEVENT = WM_USER + 7
CONSTANT long TTM_UPDATETIPTEXT	= WM_USER + 12
CONSTANT long TTM_TRACKACTIVATE = WM_USER + 17
CONSTANT long TTM_TRACKPOSITION	= WM_USER + 18

//¹«¹²±äÁ¿ºÍ³£Á¿
Public:
long hWndTT	// Tooltip control window handle
long ToolID = 1	// Tooltip internal ID

//Tooltips±ê¼Ç
CONSTANT integer TTF_CENTERTIP = 2
CONSTANT integer TTF_RTLREADING = 4
CONSTANT integer TTF_SUBCLASS	= 16
CONSTANT integer TTF_TRACK = 32
CONSTANT integer TTF_ABSOLUTE	= 128
CONSTANT integer TTF_TRANSPARENT	= 256
CONSTANT integer TTF_DI_SETITEM = 32768

end variables

forward prototypes
public subroutine relaymsg (dragobject object)
public subroutine setfont (long hfont)
public subroutine settipposition (integer x, integer y)
public subroutine settiptext (dragobject object, long uid, long tiptext)
public subroutine settiptext (dragobject object, long uid, string tiptext)
public subroutine settrack (dragobject object, integer uid, boolean status)
public subroutine updatetiprect (dragobject object, long uid, long left, long top, long right, long bottom)
public function integer addtool (dragobject object, string tiptext, integer flags)
end prototypes

public subroutine relaymsg (dragobject object);//´Ëº¯ÊýÓÃÓÚÏòÏÔÊ¾ToolTips´°¿Ú·¢ËÍ¿ØÖÆÏûÏ¢£¬±àºÅÈçÏÂ£º
MSG Msg

Msg.hWnd = Handle(Object)
Msg.Message	= 512	// WM_MOUSEMOVE
Msg.WParam 	= Message.WordParm
Msg.LParam 	= Message.LongParm
RelayMsg(hWndTT,TTM_RELAYEVENT,0,Msg)

end subroutine

public subroutine setfont (long hfont);//´Ëº¯ÊýÓÃÓÚÒ³ÃæÉèÖÃToolTips´°¿ÚµÄ×ÖÌå£¬±àºÅÈçÏÂ£º

Send(hWndTT,WM_SETFONT,hFont,1)

end subroutine

public subroutine settipposition (integer x, integer y);//´Ëº¯ÊýÓÃÓÚÒ³ÃæÉèÖÃToolTipsµÄÎ»ÖÃ£¬±àºÅÈçÏÂ£º

Send(hWndTT,TTM_TRACKPOSITION,0,Long(X,Y))

end subroutine

public subroutine settiptext (dragobject object, long uid, long tiptext);//´Ëº¯ÊýÓÃÓÚÎªToolTips´°¿ÚÒ³ÃæÉèÖÃÐÂÎÄ±¾£¬±àºÅÈçÏÂ£º

TOOLINFO ToolInfo

ToolInfo.hWnd = Handle(Object)
ToolInfo.uID = uID
ToolInfo.lpszText = TipText

ToolTipMsg(hWndTT,TTM_UPDATETIPTEXT,0,ToolInfo)

end subroutine

public subroutine settiptext (dragobject object, long uid, string tiptext);//´Ëº¯ÊýÓÃÓÚÎªToolTips´°¿ÚÒ³ÃæÉèÖÃÐÂÎÄ±¾£¬±àºÅÈçÏÂ£º

long lpszText

lpszText = LocalAlloc(0,255)
lStrCpy(lpszText,Left(TipText,255))
SetTipText(Object,uId,lpszText)

LocalFree(lpszText)

end subroutine

public subroutine settrack (dragobject object, integer uid, boolean status);//´Ëº¯ÊýÓÃÓÚ¼¤»î»òÈ¡ÏûToolTips´°¿ÚÒ³ÃæÉèÖÃÐÂÎÄ±¾£¬±àºÅÈçÏÂ£º
//²ÎÊýStatusÎªTrueÊ±¼¤»î£¬ÎªFalseÊ±È¡Ïû

TOOLINFO ToolInfo

ToolInfo.cbSize = 40
ToolInfo.hWnd = Handle(Object)
ToolInfo.uID = uID

If Status Then 
	ToolTipMsg(hWndTT,TTM_TRACKACTIVATE,1,ToolInfo)
Else
	ToolTipMsg(hWndTT,TTM_TRACKACTIVATE,0,ToolInfo)
End If

end subroutine

public subroutine updatetiprect (dragobject object, long uid, long left, long top, long right, long bottom);//´Ëº¯ÊýÓÃÓÚ¸üÐÂToolTipsµÄ¾ØÐÎ¿ò£¬±àºÅÈçÏÂ£º

TOOLINFO ToolInfo

ToolInfo.hWnd	= Handle(Object)
ToolInfo.uID	= uID

ToolInfo.Rect.Left	= Left
ToolInfo.Rect.Top		= Top
ToolInfo.Rect.Right	= Right
ToolInfo.Rect.Bottom	= Bottom

ToolTipMsg(hWndTT,TTM_NEWTOOLRECT,0,ToolInfo)

end subroutine

public function integer addtool (dragobject object, string tiptext, integer flags);//´Ëº¯ÊýÓÃÓÚ×¢²áÒªÏÔÊ¾ToolTipsµÄ¿ØÖÆ£¬±àºÅÈçÏÂ£º

TOOLINFO ToolInfo

ToolInfo.cbSize = 40
ToolInfo.uFlags = Flags 
ToolInfo.hWnd = Handle(Object)
ToolInfo.hInstance = 0 
ToolInfo.uID = ToolID
ToolID++
ToolInfo.lpszText = LocalAlloc(0,80)
LStrCpy(ToolInfo.lpszText,Left(tiptext,80))
//POST LocalFree(ToolInfo.lpszText) //ÊÍ·Å·ÖÅäµÄÄÚ´æ
ToolInfo.Rect.Left	= 0
ToolInfo.Rect.Top 	= 0
ToolInfo.Rect.Right	= UnitsToPixels(Object.Width,XUnitsToPixels!)
ToolInfo.Rect.Bottom = UnitsToPixels(Object.Height,YUnitsToPixels!)

If ToolTipMsg(hWndTT,TTM_ADDTOOL, 0, ToolInfo) = 0 Then
	LocalFree(ToolInfo.lpszText) //ÊÍ·Å·ÖÅäµÄÄÚ´æ	
//	MessageBox("Error","Cannot register object in the toolwindow control!",StopSign!,Ok!)		//Added By Mark Lee 10/22/2013 The Apb cannot support CreateWindowExA funcation in win8.1 & 64-bit environment.
	Return(-1)
End If
LocalFree(ToolInfo.lpszText) //ÊÍ·Å·ÖÅäµÄÄÚ´æ
Return(ToolID - 1)

end function

on uo_tooltips.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_tooltips.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;InitCommonControls()

hWndTT = CreateWindowExA(WS_EX_TOPMOST,TOOLTIPS_CLASS,0, &
      TTF_CENTERTIP, CW_USEDEFAULT, CW_USEDEFAULT, &
      CW_USEDEFAULT, CW_USEDEFAULT, 0, 0, Handle(GetApplication()),0)

end event

event destructor;DestroyWindow(hWndTT)
end event

