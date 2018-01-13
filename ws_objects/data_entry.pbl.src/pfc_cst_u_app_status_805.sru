$PBExportHeader$pfc_cst_u_app_status_805.sru
forward
global type pfc_cst_u_app_status_805 from userobject
end type
type st_4 from statictext within pfc_cst_u_app_status_805
end type
type st_3 from statictext within pfc_cst_u_app_status_805
end type
type st_2 from statictext within pfc_cst_u_app_status_805
end type
type st_1 from statictext within pfc_cst_u_app_status_805
end type
type r_1 from rectangle within pfc_cst_u_app_status_805
end type
type oval_audit from oval within pfc_cst_u_app_status_805
end type
type r_2 from rectangle within pfc_cst_u_app_status_805
end type
type oval_de from oval within pfc_cst_u_app_status_805
end type
type r_3 from rectangle within pfc_cst_u_app_status_805
end type
type oval_verif from oval within pfc_cst_u_app_status_805
end type
type r_4 from rectangle within pfc_cst_u_app_status_805
end type
type oval_approval from oval within pfc_cst_u_app_status_805
end type
end forward

global type pfc_cst_u_app_status_805 from userobject
integer width = 1088
integer height = 88
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
r_1 r_1
oval_audit oval_audit
r_2 r_2
oval_de oval_de
r_3 r_3
oval_verif oval_verif
r_4 r_4
oval_approval oval_approval
end type
global pfc_cst_u_app_status_805 pfc_cst_u_app_status_805

forward prototypes
public function integer of_get_status (long al_prac_id, integer ai_facility_id)
public function integer of_reset ()
end prototypes

public function integer of_get_status (long al_prac_id, integer ai_facility_id);DateTime ldt_audit_complete
DateTime ldt_de_complete
DateTime ldt_approval_complete
DateTime ldt_verif_complete

SELECT pd_affil_stat.date_app_audit_completed,   
       pd_affil_stat.date_data_entry_completed,   
       pd_affil_stat.date_verif_completed,   
       pd_affil_stat.apptmnt_start_date  
INTO :ldt_audit_complete,   
     :ldt_de_complete,   
     :ldt_verif_complete,   
     :ldt_approval_complete  
FROM pd_affil_stat  
WHERE ( pd_affil_stat.prac_id = :al_prac_id ) AND  
      ( pd_affil_stat.parent_facility_id = :ai_facility_id ) AND
		( pd_affil_stat.active_status in ( 1,4 ) );  //maha  changed to include pending 072402
IF SQLCA.SQLCODE <> 0 THEN
	Return -1
END IF

IF IsNull( ldt_audit_complete ) THEN
	oval_audit.fillcolor = 255
ELSE
	oval_audit.fillcolor = 8453888
END IF

IF IsNull( ldt_de_complete ) THEN
	oval_de.fillcolor = 255
ELSE
	oval_de.fillcolor = 8453888
END IF

IF IsNull( ldt_verif_complete ) THEN
	oval_verif.fillcolor = 255
ELSE
	oval_verif.fillcolor = 8453888
END IF

IF IsNull( ldt_approval_complete ) THEN
	oval_approval.fillcolor = 255
ELSE
	oval_approval.fillcolor = 8453888
END IF


RETURN 0


end function

public function integer of_reset ();oval_audit.fillcolor = 255
oval_de.fillcolor = 255
oval_verif.fillcolor = 255
oval_approval.fillcolor = 255

RETURN 0


end function

on pfc_cst_u_app_status_805.create
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.r_1=create r_1
this.oval_audit=create oval_audit
this.r_2=create r_2
this.oval_de=create oval_de
this.r_3=create r_3
this.oval_verif=create oval_verif
this.r_4=create r_4
this.oval_approval=create oval_approval
this.Control[]={this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.r_1,&
this.oval_audit,&
this.r_2,&
this.oval_de,&
this.r_3,&
this.oval_verif,&
this.r_4,&
this.oval_approval}
end on

on pfc_cst_u_app_status_805.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.r_1)
destroy(this.oval_audit)
destroy(this.r_2)
destroy(this.oval_de)
destroy(this.r_3)
destroy(this.oval_verif)
destroy(this.r_4)
destroy(this.oval_approval)
end on

type st_4 from statictext within pfc_cst_u_app_status_805
integer x = 882
integer y = 16
integer width = 187
integer height = 52
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "MS Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Approval"
boolean focusrectangle = false
end type

type st_3 from statictext within pfc_cst_u_app_status_805
integer x = 562
integer y = 16
integer width = 242
integer height = 56
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "MS Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Verifications"
boolean focusrectangle = false
end type

type st_2 from statictext within pfc_cst_u_app_status_805
integer x = 279
integer y = 12
integer width = 206
integer height = 56
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "MS Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Data Entry"
boolean focusrectangle = false
end type

type st_1 from statictext within pfc_cst_u_app_status_805
integer x = 73
integer y = 12
integer width = 114
integer height = 52
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "MS Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = " Audit"
boolean focusrectangle = false
end type

type r_1 from rectangle within pfc_cst_u_app_status_805
integer linethickness = 4
long fillcolor = 80269524
integer width = 197
integer height = 76
end type

type oval_audit from oval within pfc_cst_u_app_status_805
long linecolor = 79741120
integer linethickness = 4
long fillcolor = 255
integer x = 5
integer y = 8
integer width = 73
integer height = 56
end type

type r_2 from rectangle within pfc_cst_u_app_status_805
integer linethickness = 4
long fillcolor = 80269524
integer x = 192
integer width = 302
integer height = 76
end type

type oval_de from oval within pfc_cst_u_app_status_805
long linecolor = 79741120
integer linethickness = 4
long fillcolor = 255
integer x = 201
integer y = 8
integer width = 73
integer height = 56
end type

type r_3 from rectangle within pfc_cst_u_app_status_805
integer linethickness = 4
long fillcolor = 80269524
integer x = 489
integer width = 320
integer height = 76
end type

type oval_verif from oval within pfc_cst_u_app_status_805
long linecolor = 79741120
integer linethickness = 4
long fillcolor = 255
integer x = 494
integer y = 8
integer width = 73
integer height = 56
end type

type r_4 from rectangle within pfc_cst_u_app_status_805
integer linethickness = 4
long fillcolor = 80269524
integer x = 805
integer width = 270
integer height = 76
end type

type oval_approval from oval within pfc_cst_u_app_status_805
long linecolor = 79741120
integer linethickness = 4
long fillcolor = 255
integer x = 814
integer y = 8
integer width = 73
integer height = 56
end type

