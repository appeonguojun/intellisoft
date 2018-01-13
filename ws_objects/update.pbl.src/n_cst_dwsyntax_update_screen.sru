$PBExportHeader$n_cst_dwsyntax_update_screen.sru
forward
global type n_cst_dwsyntax_update_screen from nonvisualobject
end type
end forward

global type n_cst_dwsyntax_update_screen from nonvisualobject
end type
global n_cst_dwsyntax_update_screen n_cst_dwsyntax_update_screen

forward prototypes
public function integer of_dwsyntax_update_screen ()
public function integer of_setup_painter (u_dw ldw_data)
public function integer of_screen_modify_field ()
public function integer of_execute (string as_sql, string as_title)
end prototypes

public function integer of_dwsyntax_update_screen ();//

n_cst_datastore	lds_dw,lds_data,lds_dataview,lds_properties,lds_report_objects
long			ll_i,ll_count,ll_ccount,ll_pcount,ll_ocount,ll_dataview,ll_row
long			ll_profile_viewid,ll_report_id,ll_screen_id
string		ls_syntax
long			ll_rtn
int 			j,jj,xx,yy,zz
string		ls_fieldname,ls_text
string		ls_dddwname,ls_datacolumn,ls_displaycolumn,ls_dropdownwidth
string		ls_lookupfield,ls_lookuptype
string		ls_x,ls_y,ls_width,ls_height,ls_weight,ls_itatic,ls_underline,ls_alignment
string		ls_lablex,ls_labley,ls_lablewidth,ls_lableheight,ls_lableweight,ls_lableitatic,ls_lableunderline,ls_lablealignment
string		ls_objects,ls_obj
string		ls_otext,ls_owidth,ls_oheight,ls_ox,ls_oy,ls_oalignment,ls_ounderline,ls_obold,ls_oitatic,ls_otype
long			ll_object_no
string		ls_sql


lds_dw=create n_cst_datastore
lds_dw.dataobject="d_profile_saveto_screen"
lds_dw.settransobject(sqlca)
ll_count=lds_dw.retrieve()


lds_data=create n_cst_datastore

lds_dataview=create n_cst_datastore
lds_dataview.dataobject="d_data_view_update"
lds_dataview.settransobject(sqlca)
ll_dataview=lds_dataview.retrieve()

lds_properties=create n_cst_datastore
lds_properties.dataobject="d_sys_report_field_properties_update"
lds_properties.settransobject(sqlca)

lds_report_objects=create n_cst_datastore
lds_report_objects.dataobject="d_report_objects_update"
lds_report_objects.settransobject(sqlca)
//

IF Not IsValid( w_infodisp ) THEN Open(w_infodisp)
IF IsValid(w_infodisp) THEN w_infodisp.Title = 'Update screen properties, Please stand by'
IF IsValid(w_infodisp) THEN w_infodisp.Center = True
IF IsValid(w_infodisp) THEN w_infodisp.st_complete.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_3.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_information.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_1.Text = 'Update screen properties, Please stand by!'
IF IsValid(w_infodisp) THEN w_infodisp.wf_set_min_max(1,ll_count)

for ll_i=1 to ll_count
	//
	IF IsValid(w_infodisp) THEN
		Yield()
		w_infodisp.wf_step_pbar(1)
		w_infodisp.st_1.Text = 'Update ' + String(ll_i) + ' of ' + String(ll_count)+' Please stand by!'
	END IF
	
	ll_profile_viewid=lds_dw.getitemnumber(ll_i,"profile_view_id")
	ll_report_id=lds_dw.getitemnumber(ll_i,"profile_report_id")
	ll_screen_id=lds_dw.getitemnumber(ll_i,"screen_id")
	ls_syntax = of_get_profile_screen_syntax(ll_profile_viewid,ll_report_id)
	lds_data.reset()
	ll_rtn=lds_data.create(ls_syntax)
	lds_data.insertrow(0)
	if ll_rtn<>1 then
		messagebox("error:","create datawindow faile!")
	else
		//
		ll_ccount=long(lds_data.describe("datawindow.column.count"))
		lds_properties.retrieve(ll_profile_viewid,ll_screen_id,'S')
		for j=1 to ll_ccount
			ls_fieldname=lds_data.describe("#"+string(j)+".name")
			ls_x=lds_data.Describe( ls_fieldname + ".x" )
			ls_y=lds_data.Describe( ls_fieldname + ".y" )
			ls_width=lds_data.Describe( ls_fieldname + ".width" )
			ls_height=lds_data.Describe( ls_fieldname + ".height" )
			ls_weight=lds_data.Describe( ls_fieldname + ".font.weight" )
			ls_itatic=lds_data.Describe( ls_fieldname + ".font.italic" )			
			ls_underline=lds_data.Describe( ls_fieldname + ".font.underline" )			
			ls_alignment=lds_data.Describe( ls_fieldname + ".alignment" )			
			ls_text=lds_data.Describe( ls_fieldname + "_t.text" )			
			//lable
			ls_lablex=lds_data.Describe( ls_fieldname + "_t.x" )
			ls_labley=lds_data.Describe( ls_fieldname + "_t.y" )
			ls_lablewidth=lds_data.Describe( ls_fieldname + "_t.width" )
			ls_lableweight=lds_data.Describe( ls_fieldname + "_t.font.weight" )
			ls_lableitatic=lds_data.Describe( ls_fieldname + "_t.font.italic" )			
			ls_lableunderline=lds_data.Describe( ls_fieldname + "_t.font.underline" )			
			ls_lablealignment=lds_data.Describe( ls_fieldname + "_t.alignment" )			
			
			lds_properties.setfilter("sys_report_fields_field_name='"+ls_fieldname+"'")
			lds_properties.filter()
			ll_pcount=lds_properties.rowcount()
			for xx=1 to ll_pcount
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_x",primary!,true)<>long(ls_x) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_x",long(ls_x))
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_y",primary!,true)<>long(ls_y) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_y",long(ls_y))
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_width",primary!,true)<>long(ls_width) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_width",long(ls_width))
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_height",primary!,true)<>long(ls_height) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_height",long(ls_height))
				if lds_properties.GetItemString(xx,"data_view_report_fields_justification",primary!,true)<>ls_alignment then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_justification",ls_alignment)
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_font_wieght",primary!,true)<>long(ls_weight) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_font_wieght",long(ls_weight))					
				if lds_properties.GetItemString(xx,"data_view_report_fields_field_underline",primary!,true)<>ls_underline then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_underline",ls_underline)
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_font_italic",primary!,true)<>long(ls_itatic) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_font_italic",long(ls_itatic))
				if lds_properties.GetItemString(xx,"data_view_report_fields_field_label",primary!,true)<>ls_text then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_label",ls_text)
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_label_x",primary!,true)<>long(ls_lablex) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_label_x",long(ls_lablex))
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_label_y",primary!,true)<>long(ls_labley) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_label_y",long(ls_labley))
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_label_width",primary!,true)<>long(ls_lablewidth) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_field_label_width",long(ls_lablewidth))
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_label_justification",primary!,true)<>long(ls_lablealignment) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_label_justification",long(ls_lablealignment))
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_label_font_weight",primary!,true)<>long(ls_lableweight) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_label_font_weight",long(ls_lableweight))					
				if lds_properties.GetItemString(xx,"data_view_report_fields_label_underline",primary!,true)<>ls_lableunderline then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_label_underline",ls_lableunderline)
				if lds_properties.GetItemNumber(xx,"data_view_report_fields_label_font_italic",primary!,true)<>long(ls_lableitatic) then jj++
				lds_properties.SetItem(xx, "data_view_report_fields_label_font_italic",long(ls_lableitatic))
				//
				if lds_properties.GetItemString(xx, "sys_report_fields_lookup_field" )='Y' then jj++
				
				if jj>0 then 
					lds_properties.SetItem(xx, "ismodify", '1' )	
					jj=0
				end if 
			next
		next
		//data_view_report_objects
		lds_report_objects.retrieve(ll_profile_viewid,ll_screen_id,'S')
		
		SELECT Max(data_view_report_objects.data_view_object_id)
		INTO :ll_object_no  
		FROM data_view_report_objects; 
		IF IsNull(ll_object_no) THEN ll_object_no = 0

		ls_objects=lds_data.describe("datawindow.objects")+'~t'
		ls_obj=left(ls_objects,pos(ls_objects,'~t') - 1)
		do while len(ls_obj)>0
			if left(ls_obj,6)="object" and (lds_data.describe(ls_obj+".type")="text" or lds_data.describe(ls_obj+".type")="groupbox") then
				ls_otext=lds_data.describe(ls_obj+".text")
				ls_ox=lds_data.describe(ls_obj+".x")
				ls_oy=lds_data.describe(ls_obj+".y")
				ls_owidth=lds_data.describe(ls_obj+".width")
				ls_oheight=lds_data.describe(ls_obj+".height")
				ls_oalignment=lds_data.describe(ls_obj+".alignment")
				ls_oitatic=lds_data.describe(ls_obj+".font.italic")
				ls_obold=lds_data.describe(ls_obj+".font.weight")
				ls_ounderline=lds_data.describe(ls_obj+".font.underline")
				ls_otype=lds_data.describe(ls_obj+".type")
				if ls_otype="text" then
					ls_otype='T'
				else
					ls_otype='B'
				end if
				//
				lds_report_objects.setfilter("trim(object_text) = '"+trim(ls_otext)+"'")
				lds_report_objects.filter()
				ll_ocount=lds_report_objects.rowcount()
				if ll_ocount >0 then
					for zz=1 to ll_ocount
						lds_report_objects.SetItem(zz, "object_x", long(ls_ox))
						lds_report_objects.SetItem(zz, "object_y", long(ls_oy)) 
						lds_report_objects.SetItem(zz, "object_width", long(ls_owidth))
						lds_report_objects.SetItem(zz, "object_height", long(ls_oheight))
						lds_report_objects.SetItem(zz, "object_alignment", long(ls_oalignment))
						lds_report_objects.SetItem(zz, "object_italic", long(ls_oitatic))
						lds_report_objects.SetItem(zz, "object_bold", long(ls_obold))
						lds_report_objects.SetItem(zz, "object_underline", long(ls_ounderline))
					next
				else
					for yy=1 to ll_dataview
						ll_row=lds_report_objects.insertrow(0)
						ll_object_no ++
						lds_report_objects.SetItem(ll_row, "data_view_object_id", ll_object_no)
						lds_report_objects.SetItem(ll_row, "data_view_id", yy )
						lds_report_objects.SetItem(ll_row, "screen_id", ll_screen_id)
						lds_report_objects.SetItem(ll_row, "object_type", ls_otype)
						lds_report_objects.SetItem(ll_row, "object_x", long(ls_ox))
						lds_report_objects.SetItem(ll_row, "object_y", long(ls_oy)) 
						lds_report_objects.SetItem(ll_row, "object_width", long(ls_owidth))
						lds_report_objects.SetItem(ll_row, "object_height", long(ls_oheight))
						lds_report_objects.SetItem(ll_row, "object_text", ls_otext)
						lds_report_objects.SetItem(ll_row, "object_alignment", long(ls_oalignment))
						lds_report_objects.SetItem(ll_row, "object_italic", long(ls_oitatic))
						lds_report_objects.SetItem(ll_row, "object_bold", long(ls_obold))
						lds_report_objects.SetItem(ll_row, "object_underline", long(ls_ounderline))
						lds_report_objects.SetItem(ll_row, "report_from", "S")
						lds_report_objects.SetItem(ll_row, "profile_view_id", ll_profile_viewid)					
					next
				end if
			end if
			ls_objects=mid(ls_objects,pos(ls_objects,'~t')+len('~t'))
			ls_obj=left(ls_objects,pos(ls_objects,'~t') - 1)
		loop	
		//
		if lds_properties.update()<>1 then messagebox("error:","The table data_view_report_fields update failed!")
		if lds_report_objects.update()<>1 then	messagebox("error:","The table data_view_report_objects update failed!")
		//
//		update profile_report_dw set cur_dw=scr_dw where profile_view_id=:ll_profile_viewid and scr_id=:ll_screen_id;
//		if sqlca.sqlcode<>0 then messagebox("error:","Update profile_report_dw faile!")
		//Modified by Alan on 2008-10-23
		ls_sql="update profile_report_dw set cur_dw=scr_dw where profile_view_id="+string(ll_profile_viewid)+" and scr_id="+string(ll_screen_id)
		of_execute(ls_sql,"of_dwsyntax_update_screen")	
	end if
next

// added by nova 2008-09-18
DESTROY lds_dw
DESTROY lds_data
DESTROY lds_dataview
DESTROY lds_properties
DESTROY lds_report_objects


IF IsValid(w_infodisp) THEN close(w_infodisp)

		

return 0
end function

public function integer of_setup_painter (u_dw ldw_data);
Integer i
Integer li_col_cnt
Integer li_sys_col_cnt
Integer li_dv_col_cnt
String ls_col_name
String ls_sys_cols
String ls_data_view_cols
String ls_sys_report_fields_update[]
String ls_dv_fields_update[]
String  ls_sys_key_cols[ ] = {"sys_report_fields_table_id", "sys_report_fields_field_id"}
String  ls_dv_key_cols[ ] = {"data_view_report_fields_data_view_id", "data_view_report_fields_screen_id", "data_view_report_fields_field_id","data_view_report_fields_profile_view_id"}



ldw_data.of_SetMultiTable(TRUE)

ldw_data.of_SetUpdateable(True)

li_col_cnt = Integer( ldw_data.Object.DataWindow.Column.Count )
FOR i = 1 TO li_col_cnt
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 04/01/2008 By: Ken.Guo
	//$<reason> If column is invisible or taborder is 0, It can't get column name use this way.
	/*
	ldw_data.SetColumn( i )
	ls_col_name = ldw_data.GetColumnName()
	*/
	ls_col_name = ldw_data.Describe("#"+String(i)+".name") 
	//---------------------------- APPEON END ----------------------------
	IF Upper(Mid(ls_col_name, 1, 17 )) = "SYS_REPORT_FIELDS"  THEN
		li_sys_col_cnt ++
		ls_sys_report_fields_update[li_sys_col_cnt] = ls_col_name
	ELSEIF Upper(Mid(ls_col_name, 1, 23 )) = "data_view_report_fields" THEN
		li_dv_col_cnt ++
		ls_dv_fields_update[li_dv_col_cnt] = ls_col_name
	END IF
	
END FOR

li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_label_y"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_label_x"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_label_width"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_x"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_y"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_width"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_height"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_justification"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_font_wieght"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_underline"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_font_italic"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_field_label"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_visible"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_label_justification"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_label_font_italic"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_label_underline"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "data_view_report_fields_label_font_weight"
li_dv_col_cnt ++
ls_dv_fields_update[li_dv_col_cnt] = "ismodify"

ldw_data.inv_multitable.of_Register( "sys_report_fields", ls_sys_key_cols , ls_sys_report_fields_update, TRUE, 0)
ldw_data.inv_multitable.of_Register( "data_view_report_fields", ls_dv_key_cols , ls_dv_fields_update, TRUE, 0)


Return 0



end function

public function integer of_screen_modify_field ();//

n_cst_datastore	lds_dw,lds_data,lds_dataview,lds_properties,lds_report_objects
long			ll_i,ll_count,ll_ccount,ll_pcount,ll_ocount,ll_dataview,ll_row
long			ll_profile_viewid,ll_report_id,ll_screen_id
string		ls_syntax
long			ll_rtn
int 			j,jj,xx,yy,zz
string		ls_fieldname,ls_text
string		ls_dddwname,ls_datacolumn,ls_displaycolumn,ls_dropdownwidth
string		ls_lookupfield,ls_lookuptype
string		ls_x,ls_y,ls_width,ls_height,ls_weight,ls_itatic,ls_underline,ls_alignment
string		ls_lablex,ls_labley,ls_lablewidth,ls_lableheight,ls_lableweight,ls_lableitatic,ls_lableunderline,ls_lablealignment
string		ls_objects,ls_obj
string		ls_otext,ls_owidth,ls_oheight,ls_ox,ls_oy,ls_oalignment,ls_ounderline,ls_obold,ls_oitatic,ls_otype
long			ll_object_no
string		ls_dataobject


lds_dw=create n_cst_datastore
lds_dw.dataobject="d_screen_dw_orig"
lds_dw.settransobject(sqlca)
ll_count=lds_dw.retrieve()

lds_data=create n_cst_datastore

lds_properties=create n_cst_datastore
lds_properties.dataobject="d_sys_report_field_properties_mupdate"
lds_properties.settransobject(sqlca)




//
IF Not IsValid( w_infodisp ) THEN Open(w_infodisp)
IF IsValid(w_infodisp) THEN w_infodisp.Title = 'Update screen properties, Please stand by'
IF IsValid(w_infodisp) THEN w_infodisp.Center = True
IF IsValid(w_infodisp) THEN w_infodisp.st_complete.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_3.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_information.Visible = False
IF IsValid(w_infodisp) THEN w_infodisp.st_1.Text = 'Update screen properties, Please stand by!'
IF IsValid(w_infodisp) THEN w_infodisp.wf_set_min_max(1,ll_count)

for ll_i=1 to ll_count
	//
	IF IsValid(w_infodisp) THEN
		Yield()
		w_infodisp.wf_step_pbar(1)
		w_infodisp.st_1.Text = 'Update ' + String(ll_i) + ' of ' + String(ll_count)+' Please stand by!'
	END IF
	
	ls_dataobject=lds_dw.getitemstring(ll_i,"scr_dw")
	ll_screen_id=lds_dw.getitemnumber(ll_i,'scr_id')
	lds_data.dataobject=ls_dataobject
	lds_data.insertrow(0)
	//
	ll_ccount=long(lds_data.describe("datawindow.column.count"))
	lds_properties.retrieve(ll_screen_id,'S')
	for j=1 to ll_ccount
		ls_fieldname=lds_data.describe("#"+string(j)+".name")
		ls_x=lds_data.Describe( ls_fieldname + ".x" )
		ls_y=lds_data.Describe( ls_fieldname + ".y" )
		ls_width=lds_data.Describe( ls_fieldname + ".width" )
		ls_height=lds_data.Describe( ls_fieldname + ".height" )
		ls_weight=lds_data.Describe( ls_fieldname + ".font.weight" )
		ls_itatic=lds_data.Describe( ls_fieldname + ".font.italic" )			
		ls_underline=lds_data.Describe( ls_fieldname + ".font.underline" )			
		ls_alignment=lds_data.Describe( ls_fieldname + ".alignment" )			
		ls_text=lds_data.Describe( ls_fieldname + "_t.text" )			
		//lable
		ls_lablex=lds_data.Describe( ls_fieldname + "_t.x" )
		ls_labley=lds_data.Describe( ls_fieldname + "_t.y" )
		ls_lablewidth=lds_data.Describe( ls_fieldname + "_t.width" )
		ls_lableweight=lds_data.Describe( ls_fieldname + "_t.font.weight" )
		ls_lableitatic=lds_data.Describe( ls_fieldname + "_t.font.italic" )			
		ls_lableunderline=lds_data.Describe( ls_fieldname + "_t.font.underline" )			
		ls_lablealignment=lds_data.Describe( ls_fieldname + "_t.alignment" )			
		
		lds_properties.setfilter("sys_report_fields_field_name='"+ls_fieldname+"'")
		lds_properties.filter()
		ll_pcount=lds_properties.rowcount()
		for xx=1 to ll_pcount
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_x",primary!,true)<>long(ls_x) then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_y",primary!,true)<>long(ls_y) then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_width",primary!,true)<>long(ls_width) then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_height",primary!,true)<>long(ls_height) then jj++
			if lds_properties.GetItemString(xx,"data_view_report_fields_justification",primary!,true)<>ls_alignment then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_font_wieght",primary!,true)<>long(ls_weight) then jj++
			if lds_properties.GetItemString(xx,"data_view_report_fields_field_underline",primary!,true)<>ls_underline then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_font_italic",primary!,true)<>long(ls_itatic) then jj++
			if lds_properties.GetItemString(xx,"data_view_report_fields_field_label",primary!,true)<>ls_text then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_label_x",primary!,true)<>long(ls_lablex) then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_label_y",primary!,true)<>long(ls_labley) then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_field_label_width",primary!,true)<>long(ls_lablewidth) then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_label_justification",primary!,true)<>long(ls_lablealignment) then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_label_font_weight",primary!,true)<>long(ls_lableweight) then jj++
			if lds_properties.GetItemString(xx,"data_view_report_fields_label_underline",primary!,true)<>ls_lableunderline then jj++
			if lds_properties.GetItemNumber(xx,"data_view_report_fields_label_font_italic",primary!,true)<>long(ls_lableitatic) then jj++
			//
			if lds_properties.GetItemString(xx, "sys_report_fields_lookup_field" )='Y' then jj++
			if jj>0 then 
				lds_properties.SetItem(xx, "ismodify", '1' )	
				jj=0
			end if
		next
	next
	//
	if lds_properties.update()<>1 then messagebox("error:","The table data_view_report_fields update failed!")
next

DESTROY lds_dw
DESTROY lds_data
DESTROY lds_properties


IF IsValid(w_infodisp) THEN close(w_infodisp)

return 0
end function

public function integer of_execute (string as_sql, string as_title);Yield()

EXECUTE Immediate :as_sql Using Sqlca;
IF Sqlca.SQLCode <> 0 THEN
	
	IF IsValid(gnv_logservice)THEN gnv_logservice.of_log(as_sql, Sqlca.SQLErrText,as_title)
	IF IsValid(gnv_debug) THEN gnv_debug.of_output(true,"Sql: " + as_sql + " Sql error text: " +  Sqlca.SQLErrText) //Added By Jay Chen 05-28-2014
	gb_upgrade_failed = TRUE
	RETURN -1
END IF
//IF Sqlca.AutoCommit = False THEN
	COMMIT Using Sqlca;
//END IF


RETURN 1
end function

on n_cst_dwsyntax_update_screen.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsyntax_update_screen.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

