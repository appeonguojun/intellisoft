$PBExportHeader$w_email_signature.srw
forward
global type w_email_signature from w_sheet
end type
type cbx_blind from checkbox within w_email_signature
end type
type cb_close from commandbutton within w_email_signature
end type
type cb_save from commandbutton within w_email_signature
end type
type cbx_enabled from checkbox within w_email_signature
end type
type st_1 from statictext within w_email_signature
end type
type ole_signature from u_email_edit within w_email_signature
end type
end forward

global type w_email_signature from w_sheet
integer width = 2126
integer height = 1460
string title = "Email Signature"
boolean minbox = false
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_syscommand pbm_syscommand
cbx_blind cbx_blind
cb_close cb_close
cb_save cb_save
cbx_enabled cbx_enabled
st_1 st_1
ole_signature ole_signature
end type
global w_email_signature w_email_signature

event ue_syscommand;//====================================================================
// Event: ue_syscommand
//--------------------------------------------------------------------
// Description: To workaround APB 6.8 bug. The popup window cannot be closed when user click the 'x' button in the window's titlebar.
//--------------------------------------------------------------------
// Arguments:
//                commandtype
//                xpos
//                ypos
//--------------------------------------------------------------------
// Returns:  long
//--------------------------------------------------------------------
// Author:         Ken.Guo 2017-08-01
//--------------------------------------------------------------------
//Copyright (c) 2008-2016 Contract Logix, Inc. All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If message.wordparm = 61536 Then
	Close(This)
End If

end event

on w_email_signature.create
int iCurrent
call super::create
this.cbx_blind=create cbx_blind
this.cb_close=create cb_close
this.cb_save=create cb_save
this.cbx_enabled=create cbx_enabled
this.st_1=create st_1
this.ole_signature=create ole_signature
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_blind
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_save
this.Control[iCurrent+4]=this.cbx_enabled
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.ole_signature
end on

on w_email_signature.destroy
call super::destroy
destroy(this.cbx_blind)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.cbx_enabled)
destroy(this.st_1)
destroy(this.ole_signature)
end on

event open;long		ll_Flag
string ls_blind
String 	ls_Scale
Long 	  	ll_Cycle

gw_popup[UpperBound(gw_popup[]) + 1] = This//added by gavins 20130515

gnv_reg_ocx.of_check_ocx( 1,'', True) //1: office //Added by Ken.Guo on 2008-11-06

//Add Blind copy myself by default check box -- jervis 01.12.2011
SELECT flag,blind_flag INTO :ll_Flag,:ls_blind FROM security_user_mailsetting WHERE user_id = :gs_user_id;

if IsNull(ll_Flag) or ll_Flag = 0 then
	cbx_enabled.Checked = false
else
	cbx_enabled.Checked = True
end if

if ls_blind = '1' then
	cbx_blind.checked = true
else
	cbx_blind.checked = false
end if

ole_signature.of_Open(gs_user_id)

//Added by Ken.Guo on 2009-04-21
ole_signature.Object.ActiveDocument.ActiveWindow.DocumentMap = False


//Added By Jay Chen 11-26-2014
This.of_SetResize(True)
This.inv_resize.of_SetOrigSize(This.WorkSpaceWidth(),This.WorkSpaceHeight())
This.inv_resize.of_Register(ole_signature,This.inv_resize.scalerightbottom )
This.inv_resize.of_Register(cb_save,This.inv_resize.fixedrightbottom )
This.inv_resize.of_Register(cb_close,This.inv_resize.fixedrightbottom )
This.inv_resize.of_Register(cbx_blind,This.inv_resize.fixedbottom )
This.inv_resize.of_Register(cbx_enabled,This.inv_resize.fixedright )




end event

event close;ole_Signature.of_Close()
end event

event activate;//Added By Ken.Guo 2011-11-30. Workaround Office OCX's bug
If isvalid(ole_signature ) Then
	ole_signature.object.activate(true)
End If


end event

type cbx_blind from checkbox within w_email_signature
integer x = 37
integer y = 1240
integer width = 690
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Blind copy myself by default"
end type

type cb_close from commandbutton within w_email_signature
integer x = 1723
integer y = 1228
integer width = 329
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;ole_signature.of_close()
Close(Parent)

end event

type cb_save from commandbutton within w_email_signature
integer x = 1312
integer y = 1228
integer width = 329
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Save"
boolean default = true
end type

event clicked;long		ll_Cnt,ll_Flag
Blob		lblb_SigData
string ls_blind

SELECT Count(*)
  INTO :ll_Cnt
  FROM security_user_mailsetting
 WHERE user_id = :gs_user_id;

if cbx_enabled.Checked then
	ll_Flag = 1
else
	ll_Flag = 0
end if

//Add blind flag check box -- jervis 01.12.2011
if cbx_blind.checked then
	ls_blind = '1'
else
	ls_blind = '0'
end if

if ll_Cnt <= 0 then
	INSERT INTO security_user_mailsetting(user_id) VALUES(:gs_user_id);
end if

UPDATE security_user_mailsetting SET flag = :ll_Flag,blind_flag = :ls_blind WHERE user_id = :gs_user_id;

ole_signature.of_getblob(lblb_SigData)
UPDATEBLOB security_user_mailsetting SET signature = :lblb_SigData WHERE user_id = :gs_user_id;

COMMIT;

end event

type cbx_enabled from checkbox within w_email_signature
integer x = 1783
integer y = 24
integer width = 270
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enabled"
end type

type st_1 from statictext within w_email_signature
integer x = 37
integer y = 24
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
string text = "Email Signature"
boolean focusrectangle = false
end type

type ole_signature from u_email_edit within w_email_signature
integer x = 37
integer y = 100
integer width = 2016
integer height = 1100
integer taborder = 10
string binarykey = "w_email_signature.win"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
06w_email_signature.bin 
2000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000067a7238001d30a7300000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b1300000000067a7238001d30a7367a7238001d30a730000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd00002d9400001c6c8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001234abcd00002d9400001c6c8000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16w_email_signature.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
