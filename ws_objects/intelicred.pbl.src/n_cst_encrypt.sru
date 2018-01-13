$PBExportHeader$n_cst_encrypt.sru
forward
global type n_cst_encrypt from nonvisualobject
end type
end forward

global type n_cst_encrypt from nonvisualobject autoinstantiate
end type

type variables
CONSTANT string CRYPT_KEY = "$#@%&#%@&*"
end variables

forward prototypes
public function string of_encrypt (string as_str)
public function string of_decrypt (string as_str)
public function string of_encrypt_ascii (string as_str)
public function string of_decrypt_new (string as_str, integer ai_val)
end prototypes

public function string of_encrypt (string as_str);integer i, j, li_val
string ls_enctext = ""
string ls_str
//debugbreak()
//Start Code Change ---- 06.25.2007 #V7 maha  made changes to allow encryption for db conn setting
ls_str = as_str
if mid(as_str,1,8) = "isoft@@@" then
	li_val = 153
	ls_str = mid(as_str,9)
else
	select set_45 into :li_val from icred_settings;
end if

j = len(ls_str)

//li_val = of_get_app_setting("set_45","I")
if isnull(li_val) then li_val = 0
if li_val = 0 then li_val = 255

FOR i = 1 TO j
    ls_enctext += mid(CRYPT_KEY , mod(i,10) + 1, 1)
    ls_enctext += String(Char(li_val - Asc(Mid(ls_str, i, 1))))
NEXT
//End Code Change---06.26.2007
RETURN ls_enctext

end function

public function string of_decrypt (string as_str);integer i, j,li_val
string ls_encchar, ls_temp, ls_unasstr = "** Encryption Error", ls_str
boolean lb_ok = true

//Added By Jay Chen 02-24-2014
setnull(li_val)
return of_decrypt_new(as_str,li_val)

/******************************
//Start Code Change ---- 06.26.2007 #V7 maha  modified for nonconnected function.  Web version not coded(not needed)
ls_str = as_str
j = len(ls_str)

//If appeongetclienttype() = 'PB' Then
	if mid(as_str,1,8) = "isoft@@@" then
		li_val = 153
		ls_str = mid(as_str,9)
		j = len(ls_str)
	else
		select set_45 into :li_val from icred_settings;
	end if

	//li_val = of_get_app_setting("set_45","I")
	if isnull(li_val) then li_val = 0
	if li_val = 0 then li_val = 255
	
	IF NOT Mod(j, 2) = 1 THEN
		ls_temp = ""
		FOR i = 2 TO (j + 1) STEP 2
			ls_encchar = Mid(ls_str, i - 1, 1)
			IF mid(CRYPT_KEY, Mod(i / 2, 10) + 1, 1) <> ls_encchar THEN
			  lb_ok = FALSE
			  EXIT
			END IF     
			ls_encchar = Mid(ls_str, i, 1)
			ls_temp += string(char(li_val - asc(ls_encchar)))
		NEXT
	END IF
//End Code Change---06.26.2007	
	IF lb_ok THEN ls_unasstr = ls_temp
	
	RETURN ls_unasstr
/*Else
	li_val = integer(gnv_data.of_getitem("icred_settings" , "set_45" , False))

	//li_val = of_get_app_setting("set_45","I")
	if isnull(li_val) then li_val = 0
	if li_val = 0 then li_val = 255
	
	ls_unasstr = space(255)
	gnv_appeondll.of_decrypt(as_str,CRYPT_KEY,li_val , ls_unasstr)
	
	RETURN ls_unasstr
End If*/
//---------------------------- APPEON END ----------------------------
**********************/
end function

public function string of_encrypt_ascii (string as_str);Long j
Char lc_char[]
Char lc_null[]
String ls_encrption
Long ll_asc



lc_char = lc_null
lc_char = as_str


For j = 1 To UpperBound(lc_char)
	
	//get asc code
	ll_asc = Asc(lc_char[j])
	//if chinese characters then continue
	If ll_asc >= 129 or ll_asc <= 32 Then
		j ++
		Continue
	End If
	//unecryption
	If ll_asc >= 33 And ll_asc <= 128 Then
		lc_char[j] = Char(161 - ll_asc)
	End If
Next

ls_encrption = lc_char
Return ls_encrption


end function

public function string of_decrypt_new (string as_str, integer ai_val);integer i, j,li_val
string ls_encchar, ls_temp, ls_unasstr = "** Encryption Error", ls_str
boolean lb_ok = true
//Start Code Change ---- 06.26.2007 #V7 maha  modified for nonconnected function.  Web version not coded(not needed)
ls_str = as_str
j = len(ls_str)

//If appeongetclienttype() = 'PB' Then
	if mid(as_str,1,8) = "isoft@@@" then
		li_val = 153
		ls_str = mid(as_str,9)
		j = len(ls_str)
	else
		//Added By Jay Chen 02-24-2014
		if isnull(ai_val) then
			select set_45 into :li_val from icred_settings;
		else
			li_val = ai_val
		end if
	end if

	//li_val = of_get_app_setting("set_45","I")
	if isnull(li_val) then li_val = 0
	if li_val = 0 then li_val = 255
	
	IF NOT Mod(j, 2) = 1 THEN
		ls_temp = ""
		FOR i = 2 TO (j + 1) STEP 2
			ls_encchar = Mid(ls_str, i - 1, 1)
			IF mid(CRYPT_KEY, Mod(i / 2, 10) + 1, 1) <> ls_encchar THEN
			  lb_ok = FALSE
			  EXIT
			END IF     
			ls_encchar = Mid(ls_str, i, 1)
			ls_temp += string(char(li_val - asc(ls_encchar)))
		NEXT
	END IF
//End Code Change---06.26.2007	
	IF lb_ok THEN ls_unasstr = ls_temp
	
	RETURN ls_unasstr
/*Else
	li_val = integer(gnv_data.of_getitem("icred_settings" , "set_45" , False))

	//li_val = of_get_app_setting("set_45","I")
	if isnull(li_val) then li_val = 0
	if li_val = 0 then li_val = 255
	
	ls_unasstr = space(255)
	gnv_appeondll.of_decrypt(as_str,CRYPT_KEY,li_val , ls_unasstr)
	
	RETURN ls_unasstr
End If*/
//---------------------------- APPEON END ----------------------------
end function

on n_cst_encrypt.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_encrypt.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

