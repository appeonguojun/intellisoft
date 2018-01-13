$PBExportHeader$w_update_education.srw
forward
global type w_update_education from window
end type
type cb_1 from commandbutton within w_update_education
end type
end forward

global type w_update_education from window
integer x = 1056
integer y = 484
integer width = 2569
integer height = 1516
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_1 cb_1
end type
global w_update_education w_update_education

on w_update_education.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_update_education.destroy
destroy(this.cb_1)
end on

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type cb_1 from commandbutton within w_update_education
integer x = 457
integer y = 260
integer width = 1376
integer height = 728
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Run"
end type

event clicked;LONG ll_Rec_id, ll_prac_id, ll_ed_type, ll_lookup_code, ll_degree, ll_next_id
String ls_code

DECLARE c_ed CURSOR FOR  
SELECT pd_education.rec_id,   
         pd_education.prac_id,   
         pd_education.education_type,
	    pd_education.degree
FROM pd_education
WHERE education_type = 573;
 
OPEN c_ed;

FETCH c_ed INTO :ll_Rec_id, :ll_prac_id, :ll_ed_type, :ll_degree;
 
DO WHILE SQLCA.SQLCODE = 0
	
     SELECT code_lookup.code  
     INTO :ls_code
     FROM code_lookup,   
          pd_basic  
   	WHERE ( pd_basic.prof_suffix = code_lookup.lookup_code ) and  
          ( ( pd_basic.prac_id = :ll_prac_id ) )   ;

	Select code_lookup.lookup_code
	INTO :ll_lookup_code
	FROM code_lookup
	WHERE lookup_name = 'Education Degrees' AND
		 lookup_code = :ls_code;
		 
	IF SQLCA.SQLCODE = 100 THEN
		
		SELECT ids.lookup_code_id  
		INTO :ll_lookup_code  
		FROM ids  ;
		
		ll_lookup_code++
		
		INSERT INTO code_lookup  
        	    ( lookup_code,   
          	 lookup_name,   
	           code,   
     	      description )  
	     VALUES ( :ll_lookup_code,   
        	  	 'Education Degrees',   
	           :ls_code,   
     	      :ls_code )  ;
	
		UPDATE ids
		SET lookup_code_id = :ll_lookup_code;
	ELSEIF SQLCA.SQLCODE = -1 THEN
		ll_lookup_code = ll_degree
	END IF
	
	UPDATE pd_education
	SET degree = :ll_lookup_code
	WHERE rec_id = :ll_rec_id;

	FETCH c_ed INTO :ll_Rec_id, :ll_prac_id, :ll_ed_type, :ll_degree;	
LOOP

CLOSE c_ed;
end event

