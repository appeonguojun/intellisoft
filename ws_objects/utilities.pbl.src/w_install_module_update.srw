$PBExportHeader$w_install_module_update.srw
forward
global type w_install_module_update from window
end type
type st_3 from statictext within w_install_module_update
end type
type cbx_1 from checkbox within w_install_module_update
end type
type dw_set from datawindow within w_install_module_update
end type
type st_2 from statictext within w_install_module_update
end type
type st_progress from statictext within w_install_module_update
end type
type st_1 from statictext within w_install_module_update
end type
type sle_1 from singlelineedit within w_install_module_update
end type
type cb_4 from commandbutton within w_install_module_update
end type
type cb_cancel from commandbutton within w_install_module_update
end type
type cb_run from commandbutton within w_install_module_update
end type
type r_print_stat_border from rectangle within w_install_module_update
end type
type r_bar from rectangle within w_install_module_update
end type
end forward

global type w_install_module_update from window
integer x = 123
integer y = 112
integer width = 1911
integer height = 784
boolean titlebar = true
string title = "Program Module Setup"
windowtype windowtype = response!
long backcolor = 80269524
boolean center = true
event sys_close pbm_syscommand
st_3 st_3
cbx_1 cbx_1
dw_set dw_set
st_2 st_2
st_progress st_progress
st_1 st_1
sle_1 sle_1
cb_4 cb_4
cb_cancel cb_cancel
cb_run cb_run
r_print_stat_border r_print_stat_border
r_bar r_bar
end type
global w_install_module_update w_install_module_update

forward prototypes
public function integer modupdate (string ai_type)
public function integer of_failure (string as_s)
public function integer of_check (string as_val)
public function integer of_run_license ()
public subroutine of_refresh_module ()
end prototypes

event sys_close;//Trigger it if clicked close button on titlebar.
If message.wordparm = 61536 Then
	cb_cancel.Trigger Event Clicked()
End If

end event

public function integer modupdate (string ai_type);integer i


	r_bar.width = 1
//r_print_stat_border
//li_bar_ticks = 100

for i = 1 to 1000
	if mod(1,0) = 0 then
		r_bar.Width = r_bar.Width + 14
	end if
	if i =  50 then
		if ai_type = "EXP" then
			update ids set set_19 = 1;
		end if
		if ai_type = "APP" then
			update ids set set_19 = 1;
		end if
		if ai_type = "REP" then
			update ids set set_19 = 1;
		end if
	end if
next








return 1
end function

public function integer of_failure (string as_s);

messagebox("Update Failure " + as_s,"Invalid serial number.  Please check that it is entered correctly with no spaces or dashes.")
return 1
end function

public function integer of_check (string as_val);if not isnumber(as_val) then
	of_failure("")
	return -1
else
	return 1
end if

end function

public function integer of_run_license ();//Start Code Change ----05.28.2008 #V8 maha - added function for functionality change in 8.5
integer i
integer ic
integer li_bar_ticks
integer li_mod
long ll_sum
string s
string sa
string sb = 'x'
string sc = 'x'
string sd = 'x'
string se = 'x'
string srrr = 'x'
string sf = 'x'
string sg = 'x' 
string sh = 'x' 
string si = 'x'
string si2 = 'x'
Integer li_check_ret

//the key code is created in the support program logic of_keycode_8 (minicontact.pbl)
//ISG 0800 aaabcde rrrfghii

//number of full users		aaa
//app						b	7,5,4,2
//image					b	--
//install imaging			c	9,1		
//priv						d	8,6,4,0
//webview					d	--
//report					e	9,5,3,1
//export					e	--
//read only users			rrr
//contract					f	7,6,4,2
//qa						f	--
//peer						h	9,4,3,1
//site						h	--
//program					g	9,8,7
//checksum 1 and 2		 ii

//logic changed 10-29-08
//ISG 0900 aaabcde rrrfghii

//number of users		aaa
//app					b	7,5,4,2
//image				b	--
//install imaging		c	9,1		
//priv					d	9,8,7,6,5,4,3,0
//webview				d	--
//workflow				d	--
//report				e	9,8,7,6,5,4,3,0
//export				e	--
//import 				e	--
//read only users		rrr
//contract				f	9,8,7,6,5,4,3,0
//qa					f	--
//contact create		f	--
//peer					h	9,4,3,1
//site					h	--
//program				g	9,8,7
//checksum (programs)	i
//checksum2	(users)		i2

//m1 = 9,8,7,6
//m2 = 9,8,5,4
//m3 = 9,7,5,3

s = sle_1.text
s = of_strip_char(" ", s,"")

if left(s,5) = "CLX15" then 
	//Added By Mark Lee 10/17/2014
	integer 			li_return 
	string 			ls_sql, ls_message, ls_update[], ls_title
	n_license   ln_license
	
	ln_license = create n_license
	li_return = ln_license.of_genrate_data( sle_1.text,ls_sql)
	if li_return < 0 then 
		ls_message = ln_license.of_check_errornum( li_return)
		destroy ln_license
		if li_return = -10 then 
			ls_title = "Update Failure " + s
		else 
			ls_title = "Key Error"
		end if 
		Messagebox(ls_title,ls_message)
		return -1
	end if 
	destroy ln_license
	
	ls_update[1] = ls_sql
	If gnv_string.of_execute_sql( ls_update, 'license key', 'update license key ', false)  = -1 Then 		
		Messagebox('Save Error','Failed to save license key, please call support.')
		of_refresh_module() 
		Return -1
	else
		gnv_session.is_license_key = s 
		of_refresh_module()  
		Return 1
	end if 
		
	return 1 
else
	//--------------------------- APPEON BEGIN ---------------------------
	//$<modify> 2008-08-26 By: Ken.Guo
	//$<reason> Move these check script to f_license_check() function.
	//$<reason> In order to session module can call it.
	
	sa = mid(s,8,3)
	sb = mid(s,11,1)
	sc = mid(s,12,1)
	sd = mid(s,13,1)
	se = mid(s,14,1)
	srrr = mid(s,15,3)
	sf = mid(s,18,1)
	sg = mid(s,19,1)
	sh = mid(s,20,1)
	si = mid(s,21,1)
	si2 = mid(s,22,1)
	
	li_check_ret = f_license_check(s,sb,sc,sd,se,sf,sg,sh) //intellicred.pbl
	
	If li_check_ret < 0 Then
		Choose Case li_check_ret
			Case -1
				Messagebox("Key Error","Please check License Number and re-enter.  Should be 22 characters.")
				Return -1			
			Case -2
				Messagebox("Key Error","Please check License Number.  If it does not start CLX090 it is invalid.  Contact customer support for a current license number.")
				Return -1	
			Case -3
				Messagebox("Key Error","Please check License Number.  If it does not start CLX090 it is invalid.  Contact customer support for a current license number.")
				Return -1				
			Case -10
				of_failure("")
				Return -1
			Case -11
				Messagebox("Key Error","License Number checksum1 error. ~r~rPlease check that the license number was entered correctly.  ~r~r If so, contact customer support for a current license number.")
				return -1	
			Case -12
				Messagebox("Key Error","License Number checksum2 error. ~r~rPlease check that the license number was entered correctly.  ~r~r If so, contact customer support for a current license number.")
				return -1	
			Case Else
				Messagebox("Key Error",'Invalid License number.')
				Return -1
		End Choose
	End If
	//---------------------------- APPEON END ----------------------------
	
	choose case sb  //app print, imaging
		case "7" 
			dw_set.setitem(1,"set_iapps",1)
			dw_set.setitem(1,"set_img",1)
		case "5"
			dw_set.setitem(1,"set_iapps",1)
			dw_set.setitem(1,"set_img",0)
		case "4"
			dw_set.setitem(1,"set_iapps",0)
			dw_set.setitem(1,"set_img",1)
		case "2"
			dw_set.setitem(1,"set_iapps",0)
			dw_set.setitem(1,"set_img",0)
		case else
			of_failure("B")
			return - 1
	end choose
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 02.06.2009 By: Ken.Guo
	//$<reason> Set intellicred module to OFF for ContractLogix Application.
	dw_set.setitem(1,"set_iapps",0)
	dw_set.setitem(1,"set_img",0)
	//---------------------------- APPEON END ----------------------------
	
	//sc is not a program setting used by the installer for imaging
	
	choose case sd //privileges, webview, workflow
		case "9" 
			dw_set.setitem(1,"set_priv",1)
			dw_set.setitem(1,"set_web",1)
			dw_set.setitem(1,"set_47",1)		
		case "8" 
			dw_set.setitem(1,"set_priv",1)
			dw_set.setitem(1,"set_web",1)
			dw_set.setitem(1,"set_47",0)
		case "7" 
			dw_set.setitem(1,"set_priv",1)
			dw_set.setitem(1,"set_web",0)
			dw_set.setitem(1,"set_47",1)
		case "6"
			dw_set.setitem(1,"set_priv",1)
			dw_set.setitem(1,"set_web",0)
			dw_set.setitem(1,"set_47",0)
		case "5" 
			dw_set.setitem(1,"set_priv",0)
			dw_set.setitem(1,"set_web",1)
			dw_set.setitem(1,"set_47",1)
		case "4"
			dw_set.setitem(1,"set_priv",0)
			dw_set.setitem(1,"set_web",1)
			dw_set.setitem(1,"set_47",0)
		case "3" 
			dw_set.setitem(1,"set_priv",0)
			dw_set.setitem(1,"set_web",0)
			dw_set.setitem(1,"set_47",1)
		case "0"
			dw_set.setitem(1,"set_priv",0)
			dw_set.setitem(1,"set_web",0)
			dw_set.setitem(1,"set_47",0)
		case else
			of_failure("D")
			return -1
	end choose
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 02.06.2009 By: Ken.Guo
	//$<reason> Set intellicred module to OFF for ContractLogix Application.
	dw_set.setitem(1,"set_priv",0)
	dw_set.setitem(1,"set_web",0)
	//---------------------------- APPEON END ----------------------------
			
			
	choose case se //report, export,import
	
		case "9" 
			dw_set.setitem(1,"set_ireport",1)
			dw_set.setitem(1,"set_iauto",1)
			dw_set.setitem(1,"set_import",1)
		case "8" 
			dw_set.setitem(1,"set_ireport",1)
			dw_set.setitem(1,"set_iauto",1)
			dw_set.setitem(1,"set_import",0)
		case "7" 
			dw_set.setitem(1,"set_ireport",1)
			dw_set.setitem(1,"set_iauto",0)
			dw_set.setitem(1,"set_import",1)
		case "6" 
			dw_set.setitem(1,"set_ireport",1)
			dw_set.setitem(1,"set_iauto",0)
			dw_set.setitem(1,"set_import",0)
		case "5"
			dw_set.setitem(1,"set_ireport",0)
			dw_set.setitem(1,"set_iauto",1)
			dw_set.setitem(1,"set_import",1)
		case "4" 
			dw_set.setitem(1,"set_ireport",0)
			dw_set.setitem(1,"set_iauto",1)
			dw_set.setitem(1,"set_import",0)
		case "3"
			dw_set.setitem(1,"set_ireport",0)
			dw_set.setitem(1,"set_iauto",0)
			dw_set.setitem(1,"set_import",1)
		case "0"
			dw_set.setitem(1,"set_ireport",0)
			dw_set.setitem(1,"set_iauto",0)
			dw_set.setitem(1,"set_import",0)
		case else
			of_failure("E")
			return -1
	end choose
	//m1 = 9,8,7,6
	//m2 = 9,8,5,4
	//m3 = 9,7,5,3
	choose case sf //contracts, qa, contract create (only on if contract is on);  global search(always on for contract)
		case "9" 
			dw_set.setitem(1,"set_cont",1)
			dw_set.setitem(1,"set_qa",1)
			dw_set.setitem(1,"set_51",1)
			dw_set.setitem(1,"set_48",1)
		case "8" 
			dw_set.setitem(1,"set_cont",1)
			dw_set.setitem(1,"set_qa",1)
			
			//dw_set.setitem(1,"set_51",0) //Modified By Ken.Guo 2010-01-27
			dw_set.setitem(1,"set_51",3)
			
			dw_set.setitem(1,"set_48",1)
		case "7" 
			dw_set.setitem(1,"set_cont",1)
			dw_set.setitem(1,"set_qa",0)
			dw_set.setitem(1,"set_51",1)
			dw_set.setitem(1,"set_48",1)
		case "6"
			dw_set.setitem(1,"set_cont",1)
			dw_set.setitem(1,"set_qa",0)
			
			//dw_set.setitem(1,"set_51",0) //Modified By Ken.Guo 2010-01-27
			dw_set.setitem(1,"set_51",3)
			
			dw_set.setitem(1,"set_48",1)
		case "5" 
			dw_set.setitem(1,"set_cont",0)
			dw_set.setitem(1,"set_qa",1)
			dw_set.setitem(1,"set_51",3) //Modified By Ken.Guo 07/01/2013. Change 0 to 3.
			dw_set.setitem(1,"set_48",0)
		case "4"
			dw_set.setitem(1,"set_cont",0)
			dw_set.setitem(1,"set_qa",1)
			dw_set.setitem(1,"set_51",3) //Modified By Ken.Guo 07/01/2013. Change 0 to 3.
			dw_set.setitem(1,"set_48",0)
		case "3" 
			dw_set.setitem(1,"set_cont",0)
			dw_set.setitem(1,"set_qa",0)
			dw_set.setitem(1,"set_51",3) //Modified By Ken.Guo 07/01/2013. Change 0 to 3.
			dw_set.setitem(1,"set_48",0)
		case "0"
			dw_set.setitem(1,"set_cont",0)
			dw_set.setitem(1,"set_qa",0)
			dw_set.setitem(1,"set_51",3) //Modified By Ken.Guo 07/01/2013. Change 0 to 3.
			dw_set.setitem(1,"set_48",0)
		case else
			of_failure("F")
			return -1
	end choose
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 02.06.2009 By: Ken.Guo
	//$<reason> Set intellicred module to OFF for ContractLogix Application.
	dw_set.setitem(1,"set_qa",0)
	//---------------------------- APPEON END ----------------------------
	
	choose case sg //product
		case "8" 
			dw_set.setitem(1,"set_9",1)
		case "9"
			dw_set.setitem(1,"set_9",0)
		case "7"
			dw_set.setitem(1,"set_9",4)
			dw_set.setitem(1,"set_cont",1) //Added by Ken.Guo 08.27.2008 Contract product alway can access contract module. 
		case else
			of_failure("G")
			return -1
	end choose
	
	choose case sh //peer, site
		case "9" 
			dw_set.setitem(1,"set_peer",1)
			dw_set.setitem(1,"set_site",1)
		case "4"
			dw_set.setitem(1,"set_peer",1)
			dw_set.setitem(1,"set_site",0)
		case "3"
			dw_set.setitem(1,"set_peer",0)
			dw_set.setitem(1,"set_site",1)
		case "1"
			dw_set.setitem(1,"set_peer",0)
			dw_set.setitem(1,"set_site",0)
		case else
			of_failure("H")
			return -1
	end choose
	//--------------------------- APPEON BEGIN ---------------------------
	//$<add> 02.06.2009 By: Ken.Guo
	//$<reason> Set intellicred module to OFF for ContractLogix Application.
	dw_set.setitem(1,"set_peer",0)
	dw_set.setitem(1,"set_site",0)
	//---------------------------- APPEON END ----------------------------
	
	//Full access users
	//dw_set.setitem(1,"",integer(sa))
	
	//read only users
	//dw_set.setitem(1,"",integer(srrr))
	
	dw_set.setitem(1,"set_product",0)
	
	dw_set.setitem(1,"license_info",s) //Added by Ken.Guo 08.26.2008
	
	
	gnv_appeondb.of_autocommitrollback( )
	If dw_set.update() = 1 Then
		Commit using SQLCA;
		gnv_session.is_license_key = s 
		of_refresh_module()  
		Return 1
	Else
		Rollback using SQLCA;
		Messagebox('Save Error','Failed to save license key, please call support.')
		of_refresh_module() 
		Return -1
	End If

end if	
	
return 1
	
























end function

public subroutine of_refresh_module ();//////////////////////////////////////////////////////////////////////
// $<function>w_install_module_updateof_refresh()
// $<arguments>(None)
// $<returns> (none)
// $<description> 
// $<description> synchronize module and menu
//////////////////////////////////////////////////////////////////////
// $<add> 08.27.2008 by Ken.Guo
//////////////////////////////////////////////////////////////////////


//Copy below script from w_utilities_support.cb_1::Clicked()
Integer li_set_9

gds_settings.retrieve()  
gnv_data.of_retrieve( "icred_settings" )

li_set_9 = Integer(gnv_data.of_getitem( "icred_settings", "set_9", FALSE))
IF Isnull(li_set_9) THEN li_set_9 = 0
gb_contract_version = li_set_9 = 4

IF Isvalid(w_mdi) THEN
	w_mdi.of_setup_security()
END IF

//added by nova 2008-03-28
//reaseon:fixed bug BugG031801(WEB Only P2) BugG031802(WEB Only P2)
integer li_set_cont
li_set_cont = integer(gnv_data.of_getitem("icred_settings" , "set_cont" , False))
if li_set_cont = 1 then gnv_app.of_setcontraccache_register( )
if li_set_cont = 1 then //Alfee 05.12.2008
	gb_contract_module = True
else
	gb_contract_module = False
end if


end subroutine

on w_install_module_update.create
this.st_3=create st_3
this.cbx_1=create cbx_1
this.dw_set=create dw_set
this.st_2=create st_2
this.st_progress=create st_progress
this.st_1=create st_1
this.sle_1=create sle_1
this.cb_4=create cb_4
this.cb_cancel=create cb_cancel
this.cb_run=create cb_run
this.r_print_stat_border=create r_print_stat_border
this.r_bar=create r_bar
this.Control[]={this.st_3,&
this.cbx_1,&
this.dw_set,&
this.st_2,&
this.st_progress,&
this.st_1,&
this.sle_1,&
this.cb_4,&
this.cb_cancel,&
this.cb_run,&
this.r_print_stat_border,&
this.r_bar}
end on

on w_install_module_update.destroy
destroy(this.st_3)
destroy(this.cbx_1)
destroy(this.dw_set)
destroy(this.st_2)
destroy(this.st_progress)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.cb_4)
destroy(this.cb_cancel)
destroy(this.cb_run)
destroy(this.r_print_stat_border)
destroy(this.r_bar)
end on

event open;//SQLCA.DBMS="ODBC"
//SQLCA.DbParm="ConnectString='DSN=IntelliCred Client;UID=DBA;PWD=SQL;',DelimitIdentifier='No'"
//	
//CONNECT USING SQLCA;
//
//IF SQLCA.SQLCODE = -1 THEN
//	MessageBox("Not Logged In", "Login Failed!")
//ELSE
//	MESSAGEBOX("","LOGIN OK")
//END IF
//


//Timer ( 1 ,w_program_module_update )
integer i
dw_set.settransobject(sqlca)
i = dw_set.retrieve()

if i < 1 then
	MessageBox("Connection failure", "Unable to get settings")
	closewithreturn(this,"fail")
end if

gnv_app.of_window_basic_code(this) //Added By Ken.Guo 2016-03-17

	
end event

event close;//disCONNECT USING SQLCA;


end event

type st_3 from statictext within w_install_module_update
integer x = 439
integer width = 69
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;closewithreturn(parent,"OK")
end event

type cbx_1 from checkbox within w_install_module_update
boolean visible = false
integer x = 256
integer y = 488
integer width = 731
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Don~'t show this screen again"
end type

type dw_set from datawindow within w_install_module_update
boolean visible = false
integer x = 73
integer y = 488
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "d_icred_settings"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_install_module_update
boolean visible = false
integer x = 1573
integer y = 20
integer width = 325
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Not completed"
boolean focusrectangle = false
end type

type st_progress from statictext within w_install_module_update
integer x = 251
integer y = 280
integer width = 251
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Progress"
boolean focusrectangle = false
end type

type st_1 from statictext within w_install_module_update
integer x = 242
integer y = 88
integer width = 1486
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Enter Install License Key and click Run"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_install_module_update
integer x = 247
integer y = 176
integer width = 1353
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within w_install_module_update
integer x = 2199
integer y = 108
integer width = 247
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Print"
end type

event clicked;//if dw_1.rowcount() < 1 then
//	messagebox("","nothing to print")
//	return
//end if
//
//dw_1.print()
end event

type cb_cancel from commandbutton within w_install_module_update
integer x = 1321
integer y = 476
integer width = 274
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancel"
boolean cancel = true
end type

event clicked;CLOSEwithreturn(PARENT,"Cancel")
end event

type cb_run from commandbutton within w_install_module_update
integer x = 1051
integer y = 476
integer width = 247
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Run"
boolean default = true
end type

event clicked;If of_run_license() < 0 Then
	Return -1
End If
Closewithreturn(parent,"OK")


/*
//of_run_license()//Start Code Change ----05.28.2008 #V8 maha - added for v8.5 license development
//return
integer i
integer ic
integer li_bar_ticks
string s
string sb = 'x'
string sc = 'x'
string sd = 'x'
string se = 'x'
string sf = 'x'
string sg = 'x' 
string sh = 'x'

//the key code is created in the support program logic w_request_form (minicontact.pbl)
//ISG 0500 aabcde fghi

//number of users		aa
//app					b	7,5,4,2
//image				b	--
//install imaging		c	9,1		
//priv					d	8,6,4,0
//webview				d	--
//report				e	9,5,3,1
//export				e	--
//contract				f	7,6,4,2
//qa					f	--
//program				g	9,8,7
//peer					h	9,4,3,1
//site					h	--

//tutorial database 	i

s = sle_1.text

if len(s) <> 17 then
	Messagebox("Key Error","Please check Serial Number and re-enter")
	return
end if

if mid(s,4,3) <> "050" then //Start Code Change ----01.28.2008 #V8 maha - changed to allow sql database key code
	Messagebox("Key Error","Please check Serial Number.  If it does not start ISG050 it is invalid for this function.  Contact customer support.")
	return
end if

sb = mid(s,10,1)
if of_check(sb) = -1 then return
sd = mid(s,12,1)
if of_check(sd) = -1 then return
se = mid(s,13,1)
if of_check(se) = -1 then return
sf = mid(s,14,1)
if of_check(sf) = -1 then return
sg = mid(s,15,1)
if of_check(sg) = -1 then return
sh = mid(s,16,1)
if of_check(sh) = -1 then return

choose case sb  //app print, imaging
	case "7" 
		dw_set.setitem(1,"set_iapps",1)
		dw_set.setitem(1,"set_img",1)
	case "5"
		dw_set.setitem(1,"set_iapps",1)
		dw_set.setitem(1,"set_img",0)
	case "4"
		dw_set.setitem(1,"set_iapps",0)
		dw_set.setitem(1,"set_img",1)
	case "2"
		dw_set.setitem(1,"set_iapps",0)
		dw_set.setitem(1,"set_img",0)
	case else
		of_failure("B")
		return
end choose

choose case sd //privileges, webview
	case "8" 
		dw_set.setitem(1,"set_priv",1)
		dw_set.setitem(1,"set_web",1)
	case "6"
		dw_set.setitem(1,"set_priv",1)
		dw_set.setitem(1,"set_web",0)
	case "4"
		dw_set.setitem(1,"set_priv",0)
		dw_set.setitem(1,"set_web",1)
	case "0"
		dw_set.setitem(1,"set_priv",0)
		dw_set.setitem(1,"set_web",0)
	case else
		of_failure("D")
		return
end choose
		
choose case se //report, export
	case "9" 
		dw_set.setitem(1,"set_ireport",1)
		dw_set.setitem(1,"set_iauto",1)
	case "5"
		dw_set.setitem(1,"set_ireport",1)
		dw_set.setitem(1,"set_iauto",0)
	case "3"
		dw_set.setitem(1,"set_ireport",0)
		dw_set.setitem(1,"set_iauto",1)
	case "1"
		dw_set.setitem(1,"set_ireport",0)
		dw_set.setitem(1,"set_iauto",0)
	case else
		of_failure("E")
		return
end choose

choose case sf //contracts, qa
	case "7" 
		dw_set.setitem(1,"set_cont",1)
		dw_set.setitem(1,"set_qa",1)
	case "6"
		dw_set.setitem(1,"set_cont",1)
		dw_set.setitem(1,"set_qa",0)
	case "4"
		dw_set.setitem(1,"set_cont",0)
		dw_set.setitem(1,"set_qa",1)
	case "2"
		dw_set.setitem(1,"set_cont",0)
		dw_set.setitem(1,"set_qa",0)
	case else
		of_failure("F")
		return
end choose

choose case sg //product
	case "8" 
		dw_set.setitem(1,"set_9",1)
	case "9"
		dw_set.setitem(1,"set_9",0)
	case "7"
		dw_set.setitem(1,"set_9",4)
	case else
		of_failure("G")
		return
end choose

choose case sh //peer, site
	case "9" 
		dw_set.setitem(1,"set_peer",1)
		dw_set.setitem(1,"set_site",1)
	case "4"
		dw_set.setitem(1,"set_peer",1)
		dw_set.setitem(1,"set_site",0)
	case "3"
		dw_set.setitem(1,"set_peer",0)
		dw_set.setitem(1,"set_site",1)
	case "1"
		dw_set.setitem(1,"set_peer",0)
		dw_set.setitem(1,"set_site",0)
	case else
		of_failure("H")
		return
end choose

dw_set.setitem(1,"set_product",0)

dw_set.update()
commit using sqlca;
	
closewithreturn(parent,"OK")
*/	
























end event

type r_print_stat_border from rectangle within w_install_module_update
integer linethickness = 4
long fillcolor = 12632256
integer x = 251
integer y = 376
integer width = 1344
integer height = 56
end type

type r_bar from rectangle within w_install_module_update
long linecolor = 8388608
integer linethickness = 4
long fillcolor = 8388608
integer x = 251
integer y = 380
integer width = 1339
integer height = 48
end type

