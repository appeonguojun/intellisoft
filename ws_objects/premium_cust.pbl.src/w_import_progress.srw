$PBExportHeader$w_import_progress.srw
$PBExportComments$Window allows for the user to modify the user entered codes.
forward
global type w_import_progress from window
end type
type st_update_time from statictext within w_import_progress
end type
type st_replace_code_time from statictext within w_import_progress
end type
type st_import_time from statictext within w_import_progress
end type
type dw_1 from datawindow within w_import_progress
end type
type st_header from statictext within w_import_progress
end type
end forward

global type w_import_progress from window
integer width = 2281
integer height = 1552
boolean titlebar = true
string title = "Import Progress"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 80269524
event ue_start_timer ( )
st_update_time st_update_time
st_replace_code_time st_replace_code_time
st_import_time st_import_time
dw_1 dw_1
st_header st_header
end type
global w_import_progress w_import_progress

forward prototypes
public function integer wf_set_header ()
public subroutine wf_add_table (string as_table_name)
public subroutine wf_update_prac_import (integer al_procees, integer al_datastore_index)
public subroutine wf_set_code_modification (integer as_result, integer al_index)
public subroutine of_set_update (integer al_result, integer al_index)
public function integer wf_set_vis (integer al_row)
public subroutine of_set_import_time (long al_time)
public subroutine of_set_update_time (long al_update_time)
public subroutine of_set_replace_code_time (long al_time)
end prototypes

event ue_start_timer;

timer(3)
end event

public function integer wf_set_header ();//wf_importing_prac

st_header.text = 'Importing practitioners. Please stand by'

return 1
end function

public subroutine wf_add_table (string as_table_name);
long ll_row
ll_row = dw_1.insertrow(0)
st_header.text =  'Importing Tables'
dw_1.object.table[ll_row] = as_table_name

wf_set_vis(ll_row)


end subroutine

public subroutine wf_update_prac_import (integer al_procees, integer al_datastore_index);

//wf_update_prac_import
st_header.text =  'Updating Practitioner ID'

dw_1.object.change_prac_id[al_datastore_index] = al_procees

wf_set_vis(al_datastore_index)
end subroutine

public subroutine wf_set_code_modification (integer as_result, integer al_index);
st_header.text =  'Updating Lookup Codes'

dw_1.object.lookup_code_modification[al_index] = as_result

wf_set_vis(al_index)
end subroutine

public subroutine of_set_update (integer al_result, integer al_index);

st_header.text = 'Updating Credentialing Tables'

DW_1.OBJECT.update_to_database[AL_INDEX] = AL_RESULT
end subroutine

public function integer wf_set_vis (integer al_row);
yield()
dw_1.ScrollToRow ( al_row )
dw_1.SelectRow(0, FALSE)
dw_1.SelectRow(al_row, TRUE)

return 1
end function

public subroutine of_set_import_time (long al_time);


st_import_time.text = 'Import time: ' + string(al_time/1000)
end subroutine

public subroutine of_set_update_time (long al_update_time);//



st_update_time.text = 'Update Time: ' + string(al_update_time/1000)
end subroutine

public subroutine of_set_replace_code_time (long al_time);

st_replace_code_time.text = 'Replace Code Time: ' + string(al_time/1000)
end subroutine

on w_import_progress.create
this.st_update_time=create st_update_time
this.st_replace_code_time=create st_replace_code_time
this.st_import_time=create st_import_time
this.dw_1=create dw_1
this.st_header=create st_header
this.Control[]={this.st_update_time,&
this.st_replace_code_time,&
this.st_import_time,&
this.dw_1,&
this.st_header}
end on

on w_import_progress.destroy
destroy(this.st_update_time)
destroy(this.st_replace_code_time)
destroy(this.st_import_time)
destroy(this.dw_1)
destroy(this.st_header)
end on

event timer;

//messagebox('','timer')

GarbageCollect ( )
close(this)
end event

event open;gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

type st_update_time from statictext within w_import_progress
integer x = 18
integer y = 1376
integer width = 2130
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_replace_code_time from statictext within w_import_progress
integer x = 18
integer y = 1312
integer width = 2130
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_import_time from statictext within w_import_progress
integer x = 18
integer y = 1244
integer width = 2130
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_import_progress
integer y = 124
integer width = 2254
integer height = 1104
integer taborder = 10
string dataobject = "d_ext_progress"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_header from statictext within w_import_progress
integer x = 14
integer y = 32
integer width = 2254
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Importing practitioners. Please stand by"
alignment alignment = center!
boolean focusrectangle = false
end type

