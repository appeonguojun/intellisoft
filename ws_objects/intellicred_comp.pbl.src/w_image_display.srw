$PBExportHeader$w_image_display.srw
forward
global type w_image_display from window
end type
type uo_2 from uo_dm_image_view_cp within w_image_display
end type
end forward

global type w_image_display from window
integer width = 3781
integer height = 1860
boolean titlebar = true
string title = "Image Preview"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
uo_2 uo_2
end type
global w_image_display w_image_display

on w_image_display.create
this.uo_2=create uo_2
this.Control[]={this.uo_2}
end on

on w_image_display.destroy
destroy(this.uo_2)
end on

event open;String	ls_PicName

ls_PicName = Message.StringParm

IF gi_imageocx = 1 THEN //imaging 360
//	uo_1.visible = true
	uo_2.visible = false	
	
//	uo_1.event ue_load_image(ls_PicName)
ELSE  						//New Image OCX
//	uo_1.visible = false
	uo_2.visible = true
	
	uo_2.event ue_load_image(ls_PicName)
END IF
gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type uo_2 from uo_dm_image_view_cp within w_image_display
integer x = 14
integer y = 12
integer taborder = 70
end type

on uo_2.destroy
call uo_dm_image_view_cp::destroy
end on

