$PBExportHeader$w_message_console.srw
forward
global type w_message_console from window
end type
type mle_1 from multilineedit within w_message_console
end type
end forward

global type w_message_console from window
integer width = 3525
integer height = 1812
boolean titlebar = true
string title = "Message Console"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
mle_1 mle_1
end type
global w_message_console w_message_console

type variables
boolean ib_initialActivate = TRUE

end variables

forward prototypes
public function integer of_message (string as_msg)
end prototypes

public function integer of_message (string as_msg);// Append message to mle_1
IF lower(left(as_msg, 10)) = "<truncate>" THEN
	mle_1.text = right(as_msg, len(as_msg) - 10)
ELSEIF len(mle_1.text) > 0 THEN
	mle_1.text = mle_1.text + char(13) + char(10) + as_msg
ELSE
	mle_1.text = as_msg
END IF

mle_1.scroll(mle_1.lineCount())

return 1

end function

on w_message_console.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on w_message_console.destroy
destroy(this.mle_1)
end on

event open;string ls_parm

ls_parm = message.StringParm

of_message(ls_parm)

end event

type mle_1 from multilineedit within w_message_console
integer width = 3488
integer height = 1708
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean border = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

