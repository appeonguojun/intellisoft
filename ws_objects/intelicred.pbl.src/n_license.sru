$PBExportHeader$n_license.sru
forward
global type n_license from nonvisualobject
end type
end forward

global type n_license from nonvisualobject
end type
global n_license n_license

type variables
Constant string is_company = "CLX"
Constant int ii_version = 15
end variables

forward prototypes
public function string of_convert_letter (integer ai_num)
public function string of_generate_key (datawindow adw, string as_fullaccess, string as_readonly)
public function integer of_convert_ascii (string as_string, boolean abn_upper_character)
public function string of_checksum (string as_header, string as_frist, string as_second, string as_usersnum)
public function integer of_check_valid_key (string as_key)
public function integer of_change_num (string as_num)
public function string of_addend_num (integer ai_num)
public function integer of_genrate_data (string as_license, datastore ads, ref string as_sql)
public function string of_check_errornum (integer ai_check_ret)
public function integer of_generate_data (string as_license, ref string as_sql)
public function integer of_genrate_data (string as_license, ref string as_sql)
end prototypes

public function string of_convert_letter (integer ai_num);string 	ls_convert
if isnull(ai_num)  then 
	return ""
end if 

if ai_num >=  0  and ai_num < 16  then
		if ai_num = 10 then
			ls_convert = "A"
		elseif ai_num = 11 then
			ls_convert = "B"			
		elseif ai_num = 12 then
			ls_convert = "C"			
		elseif ai_num = 13 then
			ls_convert = "D"			
		elseif ai_num = 14 then				
			ls_convert = "E"			
		elseif ai_num = 15 then			
			ls_convert = "F"		
		else
			ls_convert = string(ai_num)		
		end if 
else
	//choose the 26 letter words but except the other six words
	ai_num = rand(20)
	choose case ai_num
		case 1
			ls_convert = "X"
		case 2
			ls_convert = "Y"
		case 3
			ls_convert = "G"
		case 4
			ls_convert = "H"
		case 5
			ls_convert = "J"
		case 6
			ls_convert = "I"
		case 7
			ls_convert = "Z"
		case 8
			ls_convert = "W"
		case 9
			ls_convert = "T"
		case 10
			ls_convert = "K"
		case 11
			ls_convert = "Q"
		case 12
			ls_convert = "U"
		case 13
			ls_convert = "N"
		case 14
			ls_convert = "P"
		case 15
			ls_convert = "M"
		case 16
			ls_convert = "R"
		case 17
			ls_convert = "V"
		case 18
			ls_convert = "S"
		case 19
			ls_convert = "L"
		case 20
			ls_convert = "O"		
	end choose 
end if 

return ls_convert 
end function

public function string of_generate_key (datawindow adw, string as_fullaccess, string as_readonly);//Constant string is_company = "CLX"
//Constant int ii_version = 15
integer	li_module_value[], i , li_value, li_check, li_count, li_compute, li_rowcount
string 	ls_values, ls_key, ls_module,ls_second, ls_frist, ls_header, ls_checksum, ls_col

li_module_value[1]  = 1
li_module_value[2]  = 2
li_module_value[3]  = 4
li_module_value[4]  = 8
li_count = 0 
li_compute = 0 
ls_values = ""
if Isvalid(adw) then
	li_rowcount =adw.rowcount() 		 
	for i = 1 to li_rowcount  
		li_check = adw.getItemNumber(i, "checked")
		ls_module = adw.getItemString(i, "module")
		ls_col = adw.getItemString(i, "data_col")
		if li_check = 1 then 
			if mod(i, 4 ) = 0 then 
				li_value = li_module_value[4]
			else
				li_value = li_module_value[mod(i, 4 )]
			end if 
		else
			li_value = 0
		end if 
		li_compute = li_compute + li_value
		if (mod(i, 4 ) = 0) or (  i = li_rowcount and mod(i, 4 ) <> 0 )  then 
			li_count++
			ls_values = ls_values + of_convert_letter(li_compute)
			li_compute = 0 
		end if 
	next 
		
	//12 number
	ls_frist = ""
	ls_second = ""
	li_count = len(ls_values)
	if li_count < 12 then 
		for i = li_count + 1  to 12
			ls_values = ls_values + of_convert_letter(100)	
		Next 
	end if 
	
	ls_frist = left(ls_values,6)
	ls_second = mid(ls_values,7,6)		
	ls_checksum = of_checksum(is_company+string(ii_version), ls_frist,ls_second,as_fullaccess+as_readonly)
	
	ls_values = is_company+ " "+string(ii_version) +ls_checksum+" "+ ls_frist + " "+ls_second+" "+as_fullaccess+as_readonly
	return ls_values
end if 

return ""
end function

public function integer of_convert_ascii (string as_string, boolean abn_upper_character);integer 		li_return = 0 
long			i,  ll_len, ll_count
string 		ls_character

if isnull(as_string)  or trim(as_string) = '' then 
	return li_return
end if

ll_len = len(as_string)
ll_count  = 0 
for i = 1 to ll_len
	ls_character = mid(as_string, i, 1)
	if isnumber(ls_character) then
		ll_count  = ll_count + Asc(ls_character)
	else
		if(abn_upper_character = true) then
			ll_count  = ll_count + Asc(Upper(ls_character))	
		else
			ll_count  = ll_count + Asc(ls_character)
		end if 
	end if 
Next

if ll_count > 0 then li_return =ll_count 
	
return  li_return

end function

public function string of_checksum (string as_header, string as_frist, string as_second, string as_usersnum);string ls_frist, ls_second, ls_thrid
long	ll_ascii, ll_tmp1,  ll_tmp2


ll_ascii = of_convert_ascii(as_header , true)
ll_ascii = ll_ascii + of_convert_ascii( as_frist + as_second + as_usersnum, true)
ls_frist = string(integer(mod(  (ll_ascii) * 7, 9 )) )

ll_ascii = of_convert_ascii(as_frist , true)
ll_tmp1 = of_convert_ascii(as_second , true)
ls_second = string(integer(mod(  ll_ascii * ll_tmp1 + (ll_ascii + ll_tmp1) , 9 )) )

ll_ascii = of_convert_ascii(as_frist+as_second , true)
ll_tmp1 = of_convert_ascii(as_usersnum , true)
ls_thrid = string(integer(mod(  ll_ascii * ll_tmp1  , 9 )) )

return ls_frist+ls_second+ls_thrid
end function

public function integer of_check_valid_key (string as_key);string 		ls_key, ls_checksum, ls_temp
integer		i, li_len, value

if isnull(as_key) or trim(as_key)  = "" then 
	return 0
end if 

ls_key = of_strip_char(" ", as_key,"")

//Check length
if len(ls_key) <> 26 then
	return -1
end if

//Check First Char  
if mid(ls_key,1,3) <> is_company then 
	return -3
end if

//Check first number
if mid(ls_key,4,2) <> string(ii_version) then 
	return -2
end if

//Check 16 bit num
//0-9 : 48-57;	A-F	:	65-70;	G-Z : 71-90
ls_temp  = mid(ls_key,9,12)
li_len = len(ls_temp)
for i = 1 to li_len
	value = Asc(mid(ls_temp,i,1))
	if (value >= 48 and value <= 57 ) or (value >= 65 and value <= 90) then
		//
	else
		return -10
	end if
next 

ls_temp  = mid(ls_key,21,6)
if Not isnumber(ls_temp)  then return -10

ls_temp = mid(ls_key,6,3)
ls_checksum = of_checksum(mid(ls_key,1,5),mid(ls_key,9,6), mid(ls_key,15,6) ,mid(ls_key,21,6))
if ls_checksum <> ls_temp then 
	return -11
end if 
return 1 
end function

public function integer of_change_num (string as_num);if isnull(as_num) or trim(as_num) = '' then
	return 0	
end if 

if isnumber(as_num) then 
	return integer(as_num)
else
	choose case as_num
		case "A"
			return 10			
		case "B"
			return 11
		case "C"
			return 12
		case "D"
			return 13
		case "E"
			return 14			
		case "F"
			return 15			
		case else
			return integer(as_num)
	end choose 			
end if 
end function

public function string of_addend_num (integer ai_num);string 	ls_num

//16
choose case ai_num
	case 15
		ls_num = "1248"
	case 14
		ls_num = "0248"
	case 13
		ls_num = "1048"		
	case 12
		ls_num = "0048"
	case 11
		ls_num = "1208"
	case 10
		ls_num = "0208"		
	case 9
		ls_num = "1008"
	case 8
		ls_num = "0008"
	case 7
		ls_num = "1240"		
	case 6
		ls_num = "0240"
	case 5
		ls_num = "1040"
	case 4
		ls_num = "0040"		
	case 3
		ls_num = "1200"
	case 2
		ls_num = "0200"
	case 1
		ls_num = "1000"		
	case 0
		ls_num = "0000"
	case else
		
end choose 

return ls_num
end function

public function integer of_genrate_data (string as_license, datastore ads, ref string as_sql);string 		ls_key
integer		li_num, i ,li_check, li_count
string 		ls_module, ls_value, ls_col, ls_sql_value, ls_set_51, ls_use_saml, ls_sql, ls_esign_type

li_num = of_check_valid_key(as_license) 
if li_num  <= 0 then 
	return li_num 
end if 

ls_key = of_strip_char(" ", as_license,"")
if not isvalid(ads) then
	ads = create datastore
	ads.dataobject = "dw_license_key"
	ads.settransobject(sqlca)
end if 
//if ads.rowcount() = 0 then ads.insertrow(0)

li_count = 0
ls_value = ""
as_sql = ""
ls_sql  = ""
ls_set_51 = "0"
ls_use_saml = "'0'"
ls_esign_type ="'sertifi'"
For i =1 to ads.rowcount()
	ls_module = ads.getItemString(i, "module")
	ls_col = ads.getItemString(i, "data_col")
	if mod(i, 4 ) = 1  then 		
		li_count ++
		ls_value = mid(ls_key, 8+li_count,1) 
		li_num  = of_change_num(ls_value)
		ls_value = of_addend_num(li_num)
	end if 
	
	li_num = mod(i, 4 )
	if li_num = 0 then li_num = 4		
	li_check = integer(mid(ls_value,li_num,1))
	if li_check > 0 then 
		li_check = 1 			
		if lower(ls_col) = 'set_51_3' then
			ls_sql_value  = "3"
			ls_set_51 = "3"
		elseif lower(ls_col) = 'set_51' then
			ls_sql_value  = string(li_check)
			ls_set_51 = string(li_check)
		elseif lower(ls_col) = 'esign_type_sertifi' then	
			ls_sql_value = "sertifi"
			ls_esign_type ="'sertifi'"
		elseif lower(ls_col) = 'esign_type_echosign' then	
			ls_sql_value = "echosign"
			ls_esign_type ="'echosign'"
		elseif lower(ls_col) = 'esign_type_docusign' then	
			ls_sql_value = "docusign"
			ls_esign_type ="'docusign'"
		elseif lower(ls_col) = 'use_saml' then	
			ls_sql_value =string(li_check)
			ls_use_saml = "'1'"			
		else
			ls_sql_value = string(li_check)
		end if				
		ads.setItem(i, "colvalue",ls_sql_value)
	else
		ads.setItem(i, "colvalue",string(li_check))		
	end if 
	ads.setItem(i, "checked",li_check)
	
	if lower(ls_col) = 'set_51_3' or lower(ls_col) = 'set_51' or lower(ls_col) = 'esign_type_sertifi' &
		or lower(ls_col) = 'esign_type_echosign' or lower(ls_col) = 'esign_type_docusign'  &
		or lower(ls_col) = 'use_saml'   then
		//
	else 
		ls_sql = ls_sql +  ls_col+"="+string(li_check)+ " , "		
	end if

Next 
as_sql =" Update icred_settings Set " + ls_sql + "  set_51="+ls_set_51+" , esign_type="+ls_esign_type+" , use_saml="+ls_use_saml
//Set intellicred module to OFF for ContractLogix Application.
as_sql = as_sql + " , set_iapps=0,set_img=0,set_priv=0,set_web=0,set_qa=0,set_peer=0,set_site=0,set_product=0,license_info='"+ls_key+"' ; "
return 1
end function

public function string of_check_errornum (integer ai_check_ret);string ls_return = ""

Choose Case ai_check_ret
	Case -1
		ls_return = "Please check License Number and re-enter.  Should be 26 characters."
	Case -2
		ls_return =  "Please check License Number.  If it does not start CLX15 it is invalid.  Contact customer support for a current license number."
	Case -3
		ls_return = "Please check License Number.  If it does not start CLX15 it is invalid.  Contact customer support for a current license number."		
	Case -10
		ls_return ="Invalid serial number.  Please check that it is entered correctly with no spaces or dashes."
	Case -11
		ls_return = "License Number checksum error. ~r~rPlease check that the license number was entered correctly.  ~r~r If so, contact customer support for a current license number."
	Case Else
		ls_return = 'Invalid License number.'
End Choose

return ls_return
end function

public function integer of_generate_data (string as_license, ref string as_sql);string 		ls_key
integer		li_num, i ,li_check, li_count
string 		ls_module, ls_value, ls_col, ls_sql_value, ls_set_51, ls_use_saml, ls_sql, ls_esign_type
datastore	ds

li_num = of_check_valid_key(as_license) 
if li_num  <= 0 then 
	return li_num 
end if 

ls_key = of_strip_char(" ", as_license,"")

ds = create datastore
ds.dataobject = "dw_license_key"
ds.settransobject(sqlca)

//if ads.rowcount() = 0 then ads.insertrow(0)

li_count = 0
ls_value = ""
as_sql = ""
ls_sql  = ""
ls_set_51 = "0"
ls_use_saml = "'0'"
ls_esign_type ="'sertifi'"
For i =1 to ds.rowcount()
	ls_module = ds.getItemString(i, "module")
	ls_col = ds.getItemString(i, "data_col")
	if mod(i, 4 ) = 1  then 		
		li_count ++
		ls_value = mid(ls_key, 8+li_count,1) 
		li_num  = of_change_num(ls_value)
		ls_value = of_addend_num(li_num)
	end if 
	
	li_num = mod(i, 4 )
	if li_num = 0 then li_num = 4		
	li_check = integer(mid(ls_value,li_num,1))
	if li_check > 0 then 
		li_check = 1 			
		if lower(ls_col) = 'set_51_3' then
			ls_sql_value  = "3"
			ls_set_51 = "3"
		elseif lower(ls_col) = 'set_51' then
			ls_sql_value  = string(li_check)
			ls_set_51 = string(li_check)
		elseif lower(ls_col) = 'esign_type_sertifi' then	
			ls_sql_value = "sertifi"
			ls_esign_type ="'sertifi'"
		elseif lower(ls_col) = 'esign_type_echosign' then	
			ls_sql_value = "echosign"
			ls_esign_type ="'echosign'"
		elseif lower(ls_col) = 'esign_type_docusign' then	
			ls_sql_value = "docusign"
			ls_esign_type ="'docusign'"
		elseif lower(ls_col) = 'use_saml' then	
			ls_sql_value =string(li_check)
			ls_use_saml = "'1'"			
		else
			ls_sql_value = string(li_check)
		end if				
		ds.setItem(i, "colvalue",ls_sql_value)
	else
		ds.setItem(i, "colvalue",string(li_check))		
	end if 
	ds.setItem(i, "checked",li_check)
	
	if lower(ls_col) = 'set_51_3' or lower(ls_col) = 'set_51' or lower(ls_col) = 'esign_type_sertifi' &
		or lower(ls_col) = 'esign_type_echosign' or lower(ls_col) = 'esign_type_docusign'  &
		or lower(ls_col) = 'use_saml'   then
		//
	else 
		ls_sql = ls_sql +  ls_col+"="+string(li_check)+ " , "		
	end if

Next 
as_sql =" Update icred_settings Set " + ls_sql + "  set_51="+ls_set_51+" , esign_type="+ls_esign_type+" , use_saml="+ls_use_saml

destroy ds

return 1
end function

public function integer of_genrate_data (string as_license, ref string as_sql);integer 			li_return 
datastore 		ads


ads = Create Datastore

ads.dataobject = "dw_license_key"
ads.settransobject( sqlca)
li_return = of_genrate_data(as_license, ads, as_sql)

Destroy ads

return li_return

end function

on n_license.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_license.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

