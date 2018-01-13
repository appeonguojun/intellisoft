﻿$PBExportHeader$w_agreement_template_merge_data.srw
forward
global type w_agreement_template_merge_data from w_popup
end type
type ole_1 from u_email_edit within w_agreement_template_merge_data
end type
type cb_close from commandbutton within w_agreement_template_merge_data
end type
end forward

global type w_agreement_template_merge_data from w_popup
integer width = 4078
integer height = 2184
string title = "Preview - Merge Data"
boolean center = true
boolean ib_isupdateable = false
event ue_inidw ( )
ole_1 ole_1
cb_close cb_close
end type
global w_agreement_template_merge_data w_agreement_template_merge_data

type variables
string is_msg  //action message
boolean ib_need_update //

datawindow idw_browse

end variables

forward prototypes
public function integer of_resize ()
end prototypes

public function integer of_resize ();//this.move(1,1)
//this.width  = w_mdi.workspacewidth()
//this.height  = w_mdi.workspaceheight()
//ole_1.width = this.width - 64
//ole_1.height = this.height -148
//cb_close.y = ole_1.y + ole_1.height + 24
return 1
end function

on w_agreement_template_merge_data.create
int iCurrent
call super::create
this.ole_1=create ole_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_1
this.Control[iCurrent+2]=this.cb_close
end on

on w_agreement_template_merge_data.destroy
call super::destroy
destroy(this.ole_1)
destroy(this.cb_close)
end on

event open;call super::open;string ls_filename 

gnv_reg_ocx.of_check_ocx( 1,'', True) //1: office //Added by Ken.Guo on 2008-11-06

ls_filename = message.stringparm
setpointer(Hourglass!)

if not isnull(ls_filename) and len(ls_filename) > 0 then
	//ole_1.object.open(ls_filename)
	this.setredraw(false)
	app_filler.of_set_word_safemode(false, 1) //Added By Ken.Guo 2015-07-30
	If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
	ole_1.object.openlocalfile(ls_filename , false)
	app_filler.of_set_word_safemode(false, 0) //Added By Ken.Guo 2015-07-30
	gnv_word_utility.of_modify_word_property( ole_1.object.ActiveDocument)	//Added By Mark Lee 06/20/2013 change for office 2013.
	this.setredraw(true)	
end if	

//-----Begin Added by Alfee 05.28.2007 -----------------------
If isValid(w_agreement_template_painter) THEN
	w_agreement_template_painter.enabled = false
	w_agreement_template_painter.of_menu_security("others")
END If
//-----End Added ---------------------------------------------


////Auto numbering for Document
//n_cst_word_utility lnv_word
//oleobject lole_word
//lole_word = create oleobject
//if ole_1.object.DocType < 1 then return -1
//
//lole_word = ole_1.object.ActiveDocument
//
//lnv_word = create n_cst_word_utility
//this.setredraw(false)
//lnv_word.of_preview(lole_word)
//this.setredraw(true)	
//destroy lnv_word
//

end event

event close;call super::close;If ole_1.object.doctype > 0 Then ole_1.object.ActiveDocument.Saved = True //Added By Ken.Guo 2016-05-23. workaround Task 524
ole_1.object.close()

//-------Begin Added by Alfee 05.28.2007---------------------
if isvalid(w_agreement_template_painter) then
	w_agreement_template_painter.enabled = true
	w_agreement_template_painter.of_menu_security("detail")
	w_agreement_template_painter.setfocus()
end if
//-------End Added ------------------------------------------
end event

event pfc_preopen;call super::pfc_preopen;long ll_i
string ls_scale

This.of_SetResize(True)

This.inv_resize.of_SetOrigSize (This.workspacewidth(),This.workspaceheight())
ls_scale = this.inv_resize.scale

For ll_i =  1 To upperbound(This.CONTrol)
   This.inv_resize.of_Register (This.CONTrol[ll_i],ls_scale)
Next

end event

event activate;call super::activate;//Added By Ken.Guo 2011-11-30. Workaround Office OCX's bug
If isvalid(ole_1 ) Then
	ole_1.object.activate(true)
End If
end event

type ole_1 from u_email_edit within w_agreement_template_merge_data
integer x = 18
integer y = 20
integer width = 3991
integer height = 2040
integer taborder = 20
string binarykey = "w_agreement_template_merge_data.win"
end type

type cb_close from commandbutton within w_agreement_template_merge_data
boolean visible = false
integer x = 3579
integer y = 1860
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
08w_agreement_template_merge_data.bin 
2600000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffe00000004fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000dfd832e001d1b4c500000003000002800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000011800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff00000003d267e82f41ee8649010521915f71b13000000000dfd832e001d1b4c5dfd832e001d1b4c50000000000000000000000000054004e004f004b0066004f0069006600650063007400430053006c006d0074000000000000000000000000000000000000000000000000000000000000000001020022ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000005000001180000000000000001000000020000000300000004fffffffe00000006000000070000000800000009fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1234abcd00005a3a000034b68000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a800000001000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000000000000010000000000000000000f31cc003125c000300cfa002a1544001830900024132e00330ea60048257e006629e8001110b01234abcd00005a3a000034b68000001080000005800000088000001080000014010100010000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000010000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff000000000000000100c8d0d4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f6e6d300e3ba9200000000000000000000000000000001000000000000000100000000000003a8000000010000000100000001000000010000000100000001000000010000000100000001000000010000000100000001000000000000000100000000000000000032002f0031003000200035003300310034003a003a00300031003500000020007700770070005f006900720074006e0072005f007000650072006f002e0074006900770020006e0078002800200029003800280032003600290030003700200032002f002f0038003000320035003100310020003a0033003000340035003a0020003100770000005f0077006500730075006300690072007900740067005f007400650072005f006c006f005f00650061006e0065006d0077002e006e0069002800200029007800280020003800390034003800200029002f0037003800320032002f0031003000200035003300310034003a003a00300031003500000020007700770073005f006300650072007500740069005f00790064006c007000610075005f00650073002e0072006900770020006e007800280020002900310028003700380034003700200029002f0037003800320032002f0031003000200035003300310034003a003a00300032003500000020007700770073005f006d0061005f006c006f00630066006e006700690073005f00740065006900740067006e0077002e006e006900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18w_agreement_template_merge_data.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point