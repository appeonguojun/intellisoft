$PBExportHeader$w_clean_up_lookup_data.srw
forward
global type w_clean_up_lookup_data from window
end type
end forward

global type w_clean_up_lookup_data from window
integer x = 5
integer y = 4
integer width = 3698
integer height = 2364
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
end type
global w_clean_up_lookup_data w_clean_up_lookup_data

on w_clean_up_lookup_data.create
end on

on w_clean_up_lookup_data.destroy
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

