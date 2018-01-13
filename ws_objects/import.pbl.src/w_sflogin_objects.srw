$PBExportHeader$w_sflogin_objects.srw
forward
global type w_sflogin_objects from window
end type
type cb_2 from commandbutton within w_sflogin_objects
end type
type cb_1 from commandbutton within w_sflogin_objects
end type
type dw_1 from u_dw within w_sflogin_objects
end type
end forward

global type w_sflogin_objects from window
integer width = 1358
integer height = 2116
boolean titlebar = true
string title = "Salesforce Objects"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type
global w_sflogin_objects w_sflogin_objects

type variables
str_sflogin_response   istr_SFResponse

end variables

on w_sflogin_objects.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on w_sflogin_objects.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event open;istr_SFResponse = Message.PowerObjectParm

string			ls_Result

If isvalid( istr_SFResponse ) Then
	ls_Result = istr_SFResponse.s_Result
	dw_1.ImportString( ls_Result )
	//Modified by Harry 2017-03-15 for Task 749
	/*
	//Added By Jay Chen 12-17-2014 only support export to the salesforce object of Opportunity,FeedItem,Product tables
	if istr_SFResponse.s_sync_salesforce = 1 then
		  dw_1.setfilter(" lower(objectlable) in ('opportunity','feed item','product') ")  
		  dw_1.filter()
	end if
	//end
	*/
End If

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

end event

event closequery;
closewithreturn( this , istr_SFResponse )
end event

type cb_2 from commandbutton within w_sflogin_objects
integer x = 512
integer y = 1912
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Refresh"
end type

event clicked;string				ls_Result, ls_sfuser, ls_sfpwd
Integer			li_Pos
n_cst_webapi    ln_api
n_cst_string		ln_string
					


If  Len( istr_SFResponse.s_user ) > 0 Then
	//modified by gavins 20161223						
	ls_Result = ln_api.of_get_salesforce_objects( istr_SFResponse.s_user, istr_SFResponse.s_pwd, "",istr_SFResponse.s_sfurl )
	
	If Len( ls_Result  ) > 0 Then
		li_Pos = pos( lower( ls_Result ), '"metadata":')
		If li_Pos > 0 then
			ls_Result = mid( ls_Result, li_pos + 11 )
			ls_Result = mid( ls_Result, 2, len( ls_Result ) - 3 )
			ls_Result = ln_string.of_globalreplace( ls_Result, "\t", "~t")
			ls_Result = ln_string.of_globalreplace( ls_Result, "\r", "~r")	
			dw_1.Reset( )
			dw_1.ImportString( ls_Result )
			//Modified by Harry 2017-03-15 for Task 749
			/*
			//Added By Jay Chen 12-17-2014 only support export to the salesforce object of Opportunity,FeedItem,Product tables
			if istr_SFResponse.s_sync_salesforce = 1 then
		  		dw_1.setfilter(" lower(objectlable) in ('opportunity','feed item','product') ")
		  		dw_1.filter()
			end if
			//end
			*/
			istr_SFResponse.s_result = ls_Result
		End If
	End If
	
End If
end event

type cb_1 from commandbutton within w_sflogin_objects
integer x = 992
integer y = 1912
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&OK"
end type

event clicked;Integer			li_Row, li_Pos, li_Count
string				ls_Fields, ls_OName
n_cst_webapi    ln_api
n_cst_string		ln_String
long ll_sync_type //Modified By Jay Chen 10-14-2014

//Added By Jay Chen 10-14-2014
ll_sync_type = istr_SFResponse.s_sync_salesforce
if isnull(ll_sync_type) then ll_sync_type = 0
//end

li_Row = dw_1.Find( "selected = 1 ", 1, dw_1.RowCount( ) )

If li_Row > 0 Then
		
	If  Len( istr_SFResponse.s_user ) > 0 Then
		ls_OName = dw_1.GetItemString( li_Row, 'objectname' )
		
		select top 1  import_id into:li_Count from import_hdr where import_sfobject = :ls_OName and import_type = 2 and import_id <> :istr_SFResponse.s_import_id and sync_salesforce = :ll_sync_type; //Modified By Jay Chen 10-14-2014 add sync_salesforce condition.
		If not isnull( li_Count ) and li_Count > 0 Then 
			MessageBox( 'tips',"The table (" + ls_OName + ") has already been used when synchronizing ID(" + string(li_Count ) + "). Please configure a new sync table. " )
			return
		End If
		//Modified by gavins 20131223
		ls_Fields = ln_api.of_get_salesforce_objects( istr_SFResponse.s_user, istr_SFResponse.s_pwd,ls_OName,istr_SFResponse.s_sfurl )
		
		If Len( ls_Fields  ) > 0 Then
			li_Pos = pos( lower( ls_Fields ), '"metadata":')
			If li_Pos > 0 then
				ls_Fields = mid( ls_Fields, li_pos + 11 )
				ls_Fields = mid( ls_Fields, 2, len( ls_Fields ) - 3 )
				ls_Fields = ln_string.of_globalreplace( ls_Fields, "\t", "~t")
				ls_Fields = ln_string.of_globalreplace( ls_Fields, "\r", "~r")	
				istr_SFResponse.s_fields = ls_Fields
				istr_SFResponse.s_oname = ls_OName
				closewithreturn( parent, istr_SFResponse  )
			End If

		End If
		
	End If	
End If


end event

type dw_1 from u_dw within w_sflogin_objects
integer x = 14
integer width = 1321
integer height = 1884
integer taborder = 10
string dataobject = "d_import_sfobjects"
boolean hscrollbar = true
end type

event clicked;call super::clicked;Integer li_i

If row > 0 and dwo.Name = 'selected' Then
	For li_i = 1 To RowCount( )
		If this.object.selected[li_i] = 1 and li_i <> row Then this.object.selected[li_i] = 0 
	Next	
End If
end event

