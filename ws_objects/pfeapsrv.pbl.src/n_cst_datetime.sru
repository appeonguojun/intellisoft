$PBExportHeader$n_cst_datetime.sru
$PBExportComments$Extension Date and/or Datetime service
forward
global type n_cst_datetime from pfc_n_cst_datetime
end type
end forward

global type n_cst_datetime from pfc_n_cst_datetime
end type

forward prototypes
public function string of_daynameofweek (date ad_source, boolean ab_shortname)
end prototypes

public function string of_daynameofweek (date ad_source, boolean ab_shortname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_DayNameOfWeek
//
//	Access:  		public
//
//	Arguments:
//	ad_source		Date which contains the day to be determined.
//
//	Returns:  		integer
//						1 - If the Day is Sunday.
//						2 - If the Day is Monday
//						3 - If the Day is Tuesday.
//						4 - If the Day is Wednesday.
//						5 - If the Day is Thursday.
//						6 - If the Day is Friday.
//						7 - If the Day is Saturday.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Based on the the passed date, determines the day of the week.
//
//////////////////////////////////////////////////////////////////////////////

Long ll_DayNumber

//Check parameters
If IsNull(ad_source) Then
	long ll_null
	SetNull(ll_null)
	Return ''
End If

//Check for invalid date
If Not of_IsValid(ad_source) Then
	Return ''
End If

ll_DayNumber = DayNumber (ad_source)

Choose Case ll_DayNumber
	Case 1
		If ab_shortname Then
			Return "Sun"
		Else
			Return "Sunday"
		End If
	Case 2
		If ab_shortname Then
			Return "Mon"
		Else
			Return "Monday"
		End If		
	Case 3
		If ab_shortname Then
			Return "Tue"
		Else
			Return "Tuesday"
		End If		
	Case 4
		If ab_shortname Then
			Return "Wed"
		Else
			Return "Wednesday"
		End If		
	Case 5
		If ab_shortname Then
			Return "Thu"
		Else
			Return "Thursday"
		End If		
	Case 6
		If ab_shortname Then
			Return "Fri"
		Else
			Return "Friday"
		End If		
	Case 7
		If ab_shortname Then
			Return "Sat"
		Else
			Return "Saturday"
		End If		
	Case Else
		Return ''
End Choose
end function

on n_cst_datetime.create
call super::create
end on

on n_cst_datetime.destroy
call super::destroy
end on

