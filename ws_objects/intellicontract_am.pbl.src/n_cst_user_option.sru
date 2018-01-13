﻿$PBExportHeader$n_cst_user_option.sru
forward
global type n_cst_user_option from nonvisualobject
end type
end forward

global type n_cst_user_option from nonvisualobject
end type
global n_cst_user_option n_cst_user_option

type variables
Private:

n_ds			ids_Options,ids_system_options
String			is_User_ID
n_ds 			ids_view_options, ids_view_options_copy				//Added By Mark Lee 01/15/2013
Long	 		il_view_id
end variables

forward prototypes
public function long of_retrieve (string as_userid)
public function string of_get_option_value (string as_userid, string as_optionname)
public function integer of_set_option_value (string as_userid, string as_optionname, string as_optionvalue)
public function integer of_save ()
public function integer of_delete_option (string as_userid, string as_optionname)
public function integer of_register (string as_userid, string as_optionname, string as_optionvalue)
public function string of_get_viewid_option_value (long al_view_id, string as_optionname)
public function integer of_viewid_filter (long al_view_id)
public function integer of_viewid_retrieve ()
public function integer of_viewid_save ()
public function integer of_viewid_copy_retrieve ()
public function string of_get_viewid_option_value_copy (long al_view_id, string as_optionname)
public function long of_system_retrieve ()
public subroutine of_system_save ()
public function string of_get_option_value (string as_optionname)
public function integer of_set_option_value (string as_optionname, string as_optionvalue)
public function integer of_system_register (string as_optionname, string as_optionvalue)
public function string of_get_viewid_option_value (long al_view_id, string as_optionname, boolean ab_insert)
public function datastore of_system_filter (string as_filter)
public function integer of_system_delete (string as_filter)
public function integer of_set_viewid_option_value (long al_view_id, string as_optionname, string as_optionvalue)
public function integer of_set_viewid_option_value (long al_view_id, long al_screen_id, string as_optionname, string as_optionvalue, string as_userid)
public function integer of_viewid_register (long al_view_id, long al_screen_id, string as_optionname, string as_optionvalue, string as_userid)
public function integer of_viewid_register (long al_view_id, string as_optionname, string as_optionvalue)
end prototypes

public function long of_retrieve (string as_userid);//retrieve ids_Options
ids_Options.SetTransObject( SQLCA )
If IsNull( as_userid ) Or Trim( as_userid ) = '' Then Return 0

If ids_Options.ModifiedCount( ) + ids_Options.DeletedCount( ) > 0 Then
	ids_Options.Update( )
End If

is_User_ID = as_userid
Return ids_Options.Retrieve( as_userid )

end function

public function string of_get_option_value (string as_userid, string as_optionname);//get  option name value
Long			ll_FRow
String			ls_Values = ''

If IsNull( as_userid ) Or Trim( as_userid ) = '' Then Return ''
If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return ''

//ll_FRow = ids_Options.Find( "user_id = '" + as_userid + "' and option_name = '" + as_optionname + "'", 1, ids_Options.RowCount( ) )
ll_FRow = ids_Options.Find( "lower(user_id) = '" + lower(as_userid) + "' and option_name = '" + as_optionname + "'", 1, ids_Options.RowCount( ) )

If ll_FRow > 0 Then
	ls_Values = ids_Options.GetItemString( ll_Frow, 'option_value' )
Else
	of_Register( as_userid, as_optionname, ls_Values  )
End If

Return ls_Values
end function

public function integer of_set_option_value (string as_userid, string as_optionname, string as_optionvalue);//set option value   1 success
Long			ll_FRow
String			ls_Values
long ll_find_user 

If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0
//If IsNull( as_optionvalue ) Or Trim( as_optionvalue ) = '' Then Return 0
If IsNull( as_userid ) Or Trim( as_userid ) = '' Then Return 0


//ll_FRow = ids_Options.Find( "user_id = '" + as_userid + "' and option_name = '" + as_optionname + "'", 1, ids_Options.RowCount( ) )
ll_FRow = ids_Options.Find( "lower(user_id) = '" + lower(as_userid) + "' and lower(option_name) = '" + lower(as_optionname) + "'", 1, ids_Options.RowCount( ) )

//Added By Jay Chen 07-10-2014 Remark:refresh data when as_userid is public parameter
if ll_FRow < 1 then
//	ll_find_user = gnv_data.ids_security_users.find("user_id = '"+as_userid+"' ", 1, gnv_data.ids_security_users.rowcount())
	// <RP> 1.10.2017 --------------------------------------------
	gnv_data.of_retrieveIfNecessary("security_users", FALSE)
	// <RP>
	ll_find_user = gnv_data.ids_security_users.find("lower(user_id) = '"+lower(as_userid)+"' ", 1, gnv_data.ids_security_users.rowcount())
	if isnull(ll_find_user) then ll_find_user = 0
	if ll_find_user < 1 then
		//Added By Jay Chen 07-17-2014
		if ids_Options.modifiedcount( ) + ids_Options.deletedcount( ) > 0 then
			ids_Options.Update( )
		end if
		//end
		select count(*) into :ll_FRow from security_user_options where user_id = :as_userid and option_name = :as_optionname;
		if isnull(ll_FRow) then ll_FRow = 0
//		ids_Options.Retrieve( gs_user_id)
//		ll_FRow = ids_Options.Find( "lower(user_id) = '" + lower(as_userid) + "' and lower(option_name) = '" + lower(as_optionname) + "'", 1, ids_Options.RowCount( ) )
	end if
end if
//end add

If ll_FRow > 0 Then
	ids_Options.SetItem( ll_Frow, 'option_value', as_optionvalue )
	ids_Options.SetItem( ll_Frow, 'last_update', today() )
Else
	of_Register( as_userid, as_optionname, as_optionvalue  )
End If



Return 1
end function

public function integer of_save ();//save data
If ids_Options.ModifiedCount( ) + ids_Options.DeletedCount( ) > 0 Then
	
	If  ids_Options.Update( ) <> 1 Then
		If IsNull( is_User_ID  ) Or Trim( is_User_ID ) = '' Then is_User_ID = gs_User_id
		this.of_Retrieve( is_User_ID )
	End If
End If


Return 1
end function

public function integer of_delete_option (string as_userid, string as_optionname);//delete option
Long			ll_FRow

If IsNull( as_userid ) Or Trim( as_userid ) = '' Then Return 0
If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0


ll_FRow = ids_Options.Find( "user_id = '" + as_userid + "' and option_name = '" + as_optionname + "'", 1, ids_Options.RowCount( ) )

If ll_FRow > 0 Then
	ids_Options.DeleteRow( ll_Frow )
End If

Return 1
end function

public function integer of_register (string as_userid, string as_optionname, string as_optionvalue);//regist option name
Long		ll_FRow

If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0

//ll_FRow = ids_Options.Find( "user_id = '" + as_userid + "' and option_name = '" + as_optionname + "'", 1, ids_Options.RowCount( ) ) 
ll_FRow = ids_Options.Find( "lower(user_id) = '" + lower(as_userid) + "' and lower(option_name) = '" + lower(as_optionname) + "'", 1, ids_Options.RowCount( ) ) //Modified By Jay 2016-05-24
If ll_FRow = 0 Then
	ids_Options.InsertRow( 0 )
	ids_Options.SetItem( ids_Options.RowCount( ), 'user_id', as_userid )
	ids_Options.SetItem( ids_Options.RowCount( ), 'option_name', as_optionname )
	ids_Options.SetItem( ids_Options.RowCount( ), 'option_value', as_optionvalue )
	ids_Options.SetItem( ids_Options.RowCount( ), 'last_update', today( ) )
End If
Return 1
end function

public function string of_get_viewid_option_value (long al_view_id, string as_optionname);//get  option name value
Return of_get_viewid_option_value( al_view_id, as_optionname, true )//modified by gavins 20130311



//Long			ll_FRow
//String			ls_Values = ''
//
//If IsNull( al_view_id ) Or al_view_id = 0 Then Return ''
//If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return ''
//
//ll_FRow = ids_view_options.Find( "view_id =" + string(al_view_id) + " and option_name = '" + as_optionname + "'", 1, ids_view_options.RowCount( ) )
//
//If ll_FRow > 0 Then
//	ls_Values = ids_view_options.GetItemString( ll_Frow, 'option_value' )
//Else
//	of_viewid_Register( al_view_id, as_optionname, ls_Values  )
//End If
//
//Return ls_Values
end function

public function integer of_viewid_filter (long al_view_id);//ids_view_options filter

If isnull(al_view_id) or al_view_id = 0 then 
	Return 0
Else
	il_view_id = al_view_id 
End If

ids_view_options.setfilter('')
ids_view_options.filter( )

If ids_view_options.rowcount( ) > 0 then 
	ids_view_options.setfilter( " viewid ="+string(il_view_id) )
	ids_view_options.filter( )
End IF 

Return 1 
end function

public function integer of_viewid_retrieve ();//retrieve ids_view_options
ids_view_options.SetTransObject( SQLCA )
If ids_view_options.ModifiedCount( ) + ids_view_options.DeletedCount( ) > 0 Then
	ids_view_options.Update( )
End If

ids_view_options.reset( )
Return ids_view_options.Retrieve(  )

end function

public function integer of_viewid_save ();//save data
If ids_view_options.ModifiedCount( ) + ids_view_options.DeletedCount( ) > 0 Then	
	If  ids_view_options.Update( ) <> 1 Then
		this.of_viewid_retrieve( )
	End If
End If

Return 1
end function

public function integer of_viewid_copy_retrieve ();Integer 			li_rtn = 0 

//copy ids_view_options_copy
ids_view_options_copy.SetTransObject( SQLCA )

of_viewid_retrieve()
ids_view_options_copy.reset( )
If ids_view_options.rowcount( ) > 0 then 
	li_rtn = ids_view_options.rowscopy( 1, ids_view_options.rowcount() , Primary!	, ids_view_options_copy, 1, Primary!	)
End If

return li_rtn
end function

public function string of_get_viewid_option_value_copy (long al_view_id, string as_optionname);//get  option name value
Long			ll_FRow
String			ls_Values = ''

If IsNull( al_view_id ) Or al_view_id = 0 Then Return ''
If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return ''

ll_FRow = ids_view_options_copy.Find( "view_id =" + string(al_view_id) + " and option_name = '" + as_optionname + "'", 1, ids_view_options_copy.RowCount( ) )

If ll_FRow > 0 Then
	ls_Values = ids_view_options_copy.GetItemString( ll_Frow, 'option_value' )
End If

Return ls_Values
end function

public function long of_system_retrieve ();ids_system_options.SetTransObject( SQLCA )
Return ids_system_options.Retrieve()


end function

public subroutine of_system_save ();//save data
If ids_system_options.ModifiedCount( ) + ids_system_options.DeletedCount( ) > 0 Then
	If  ids_system_options.Update( ) <> 1 Then
		this.of_system_Retrieve( )
	End If
End If


end subroutine

public function string of_get_option_value (string as_optionname);//get  option name value
Long			ll_FRow
String			ls_Values = ''

If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return ''

ll_FRow = ids_system_options.Find( "option_name = '" + as_optionname + "'", 1, ids_system_options.RowCount( ) )

If ll_FRow > 0 Then
	ls_Values = ids_system_options.GetItemString( ll_Frow, 'option_value' )
End If

Return ls_Values
end function

public function integer of_set_option_value (string as_optionname, string as_optionvalue);//set option value   1 success
Long			ll_FRow
String			ls_Values

If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0

ll_FRow = ids_system_options.Find( "lower(option_name) = '" + lower(as_optionname) + "'", 1, ids_system_options.RowCount( ) )

If ll_FRow > 0 Then
	ids_system_options.SetItem( ll_Frow, 'option_value', as_optionvalue )
	ids_system_options.SetItem( ll_Frow, 'last_update', today() )
	ids_system_options.SetItem( ll_Frow, 'last_author', gs_user_id )
Else
	of_system_Register( as_optionname, as_optionvalue  )
End If

Return 1
end function

public function integer of_system_register (string as_optionname, string as_optionvalue);//regist option name
Long		ll_FRow

If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0

ll_FRow = ids_system_options.Find( "option_name = '" + as_optionname + "'", 1, ids_system_options.RowCount( ) )
If ll_FRow = 0 Then
	ids_system_options.InsertRow( 0 )
	ids_system_options.SetItem( ids_system_options.RowCount( ), 'option_name', as_optionname )
	ids_system_options.SetItem( ids_system_options.RowCount( ), 'option_value', as_optionvalue )
	ids_system_options.SetItem( ids_system_options.RowCount( ), 'last_update', today( ) )
	ids_system_options.SetItem( ids_system_options.RowCount( ), 'last_author', gs_user_id )	
End If
Return 1
end function

public function string of_get_viewid_option_value (long al_view_id, string as_optionname, boolean ab_insert);//get  option name value
Long			ll_FRow
String			ls_Values = ''

If IsNull( al_view_id ) Or al_view_id = 0 Then Return ''
If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return ''

ll_FRow = ids_view_options.Find( "view_id =" + string(al_view_id) + " and option_name = '" + as_optionname + "'", 1, ids_view_options.RowCount( ) )

If ll_FRow > 0 Then
	ls_Values = ids_view_options.GetItemString( ll_Frow, 'option_value' )
Else
	If ab_Insert Then
		of_viewid_Register( al_view_id, as_optionname, ls_Values  )
	End If		
End If

Return ls_Values
end function

public function datastore of_system_filter (string as_filter);DataStore		lds_Temp

ids_Options.SetFilter( as_Filter )
ids_Options.Filter( )

lds_Temp = Create DataStore
lds_Temp.DataObject = ids_Options.DataObject


ids_Options.RowsCopy( 1, ids_Options.RowCount( ), primary!, lds_temp, 1, primary! )

ids_Options.SetFilter( "" )
ids_Options.Filter( )

Return lds_Temp
end function

public function integer of_system_delete (string as_filter);
If ids_Options.SetFilter( as_Filter ) < 0 Then Return -1
ids_Options.Filter( )

If ids_Options.RowCount( ) > 0 Then ids_Options.RowsMove( 1, ids_Options.RowCount( ), primary!, ids_Options,1, delete! )
 

ids_Options.SetFilter( "" )
ids_Options.Filter( )

Return 0
end function

public function integer of_set_viewid_option_value (long al_view_id, string as_optionname, string as_optionvalue);//set option value   1 success
Long			ll_FRow
String			ls_Values

If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0
If IsNull( al_view_id ) Or al_view_id =  0 Then Return 0

ll_FRow = ids_view_options.Find( "view_id = " + string(al_view_id) + " and option_name = '" + as_optionname + "'", 1, ids_view_options.RowCount( ) )

If ll_FRow > 0 Then
	ids_view_options.SetItem( ll_Frow, 'option_value', as_optionvalue )
	ids_view_options.SetItem( ll_Frow, 'last_update', today() )
	ids_view_options.SetItem( ll_Frow, 'user_id', gs_user_id)
Else
	of_viewid_register( al_view_id, as_optionname, as_optionvalue  )
End If

Return 1
end function

public function integer of_set_viewid_option_value (long al_view_id, long al_screen_id, string as_optionname, string as_optionvalue, string as_userid);//====================================================================
// Function: of_set_viewid_option_value
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_view_id
// 	value    long      al_screen_id
// 	value    string    as_optionname
// 	value    string    as_optionvalue
// 	value    string    as_userid
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay		Date: 2017-01-18
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
//set option value   1 success

Long			ll_FRow
String			ls_Values, ls_optionName

If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0
If IsNull( as_userid ) Or Trim( as_userid ) = '' Then Return 0
If IsNull( al_view_id ) Or al_view_id =  0 Then Return 0
If IsNull( al_screen_id ) Or al_screen_id =  0 Then Return 0

ll_FRow = ids_view_options.Find( "view_id = " + string(al_view_id) + " and option_name = '" + as_optionname + "'", 1, ids_view_options.RowCount( ) )

If ll_FRow > 0 Then
	ids_view_options.SetItem( ll_Frow, 'option_value', as_optionvalue )
	ids_view_options.SetItem( ll_Frow, 'last_update', today() )
	ids_view_options.SetItem( ll_Frow, 'user_id', as_userid)
	ids_view_options.SetItem( ll_Frow, 'dec_num', al_screen_id)
Else
	of_viewid_register( al_view_id,al_screen_id, as_optionname, as_optionvalue,as_userid  ) //Modified By Jay 2017-01-18
End If

Return 1
end function

public function integer of_viewid_register (long al_view_id, long al_screen_id, string as_optionname, string as_optionvalue, string as_userid);//====================================================================
// Function: of_viewid_register
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value    long      al_view_id
// 	value    long      al_screen_id
// 	value    string    as_optionname
// 	value    string    as_optionvalue
// 	value    string    as_userid
//--------------------------------------------------------------------
// Returns:  integer
//--------------------------------------------------------------------
// Author:	Jay		Date: 2017-01-18
//--------------------------------------------------------------------
//	Copyright (c) 2008-2016 Contractlogix, All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================
//regist option name

Long		ll_FRow

If IsNull( al_view_id ) Or al_view_id = 0 Then Return 0
If IsNull( al_screen_id ) Or al_screen_id = 0 Then Return 0
If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0
If IsNull( as_userid ) Or Trim( as_userid ) = '' Then Return 0

ll_FRow = ids_view_options.Find( "view_id = " + string(al_view_id) + " and option_name = '" + as_optionname + "'", 1, ids_view_options.RowCount( ) )
If ll_FRow = 0 Then
	ids_view_options.InsertRow( 0 )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'view_id', al_view_id )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'option_name', as_optionname )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'option_value', as_optionvalue )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'last_update', today( ) )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'user_id', as_userid )	
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'dec_num', al_screen_id )
End If
Return 1
end function

public function integer of_viewid_register (long al_view_id, string as_optionname, string as_optionvalue);//regist option name
Long		ll_FRow

If IsNull( al_view_id ) Or al_view_id = 0 Then Return 0
If IsNull( as_optionname ) Or Trim( as_optionname ) = '' Then Return 0

ll_FRow = ids_view_options.Find( "view_id = " + string(al_view_id) + " and option_name = '" + as_optionname + "'", 1, ids_view_options.RowCount( ) )
If ll_FRow = 0 Then
	ids_view_options.InsertRow( 0 )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'view_id', al_view_id )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'option_name', as_optionname )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'option_value', as_optionvalue )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'last_update', today( ) )
	ids_view_options.SetItem( ids_view_options.RowCount( ), 'user_id', gs_user_id )	
End If
Return 1
end function

event constructor;//option server
ids_Options = Create n_ds
ids_Options.DataObject = 'ds_user_options'
//ids_Options.SetTransObject( SQLCA )

ids_view_options = Create n_ds
ids_view_options.DataObject = 'ds_security_viewid_options'
//ids_view_options.SetTransObject( SQLCA )

ids_view_options_copy = Create n_ds
ids_view_options_copy.DataObject = 'ds_security_viewid_options'
//ids_view_options_copy.SetTransObject( SQLCA )

//Added By Ken.Guo 01/23/2013
ids_system_options = Create n_ds
ids_system_options.DataObject = 'd_system_options'
//ids_system_options.SetTransObject( SQLCA )
end event

on n_cst_user_option.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_user_option.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;//Added By Mark Lee 01/15/2013
Destroy ids_Options
Destroy ids_view_options	
Destroy ids_view_options_copy
Destroy ids_system_options //Added By Ken.Guo 01/23/2013
end event

