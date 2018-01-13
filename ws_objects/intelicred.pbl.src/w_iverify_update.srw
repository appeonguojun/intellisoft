$PBExportHeader$w_iverify_update.srw
forward
global type w_iverify_update from window
end type
type cb_1 from commandbutton within w_iverify_update
end type
end forward

global type w_iverify_update from window
integer x = 823
integer y = 360
integer width = 2016
integer height = 1208
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_1 cb_1
end type
global w_iverify_update w_iverify_update

on w_iverify_update.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_iverify_update.destroy
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_1 from commandbutton within w_iverify_update
integer x = 466
integer y = 296
integer width = 873
integer height = 428
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update"
end type

event clicked;Long ll_next_id

SELECT Max( lookup_code )  
INTO :ll_next_id  
FROM code_lookup  ;


ll_next_id ++

INSERT INTO code_lookup  
         ( lookup_code,   
           lookup_name,   
           code,   
           description,   
           type,   
           custom_1,   
           custom_2,   
           custom_3,   
           custom_4,   
           custom_5,   
           custom_6 )  
VALUES ( :ll_next_id,   
           'Verification Method',   
           'iVerify',   
           'Verify using iVerify data warehouse',   
           'S',   
           null,   
           null,   
           null,   
           null,   
           null,   
           null )  ;


end event

