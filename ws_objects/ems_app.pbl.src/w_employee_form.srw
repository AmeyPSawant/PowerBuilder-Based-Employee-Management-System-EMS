$PBExportHeader$w_employee_form.srw
forward
global type w_employee_form from window
end type
type cb_4 from commandbutton within w_employee_form
end type
type cb_3 from commandbutton within w_employee_form
end type
type cb_2 from commandbutton within w_employee_form
end type
type cb_1 from commandbutton within w_employee_form
end type
type ddlb_inp from dropdownlistbox within w_employee_form
end type
type dp_inp from datepicker within w_employee_form
end type
type st_6 from statictext within w_employee_form
end type
type salary_inp from singlelineedit within w_employee_form
end type
type st_5 from statictext within w_employee_form
end type
type st_4 from statictext within w_employee_form
end type
type email_inp from singlelineedit within w_employee_form
end type
type st_3 from statictext within w_employee_form
end type
type st_2 from statictext within w_employee_form
end type
type lname_inp from singlelineedit within w_employee_form
end type
type fname_inp from singlelineedit within w_employee_form
end type
type dw_employee from datawindow within w_employee_form
end type
type st_1 from statictext within w_employee_form
end type
end forward

global type w_employee_form from window
integer width = 3273
integer height = 1964
boolean titlebar = true
string title = "w_employee_form"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ddlb_inp ddlb_inp
dp_inp dp_inp
st_6 st_6
salary_inp salary_inp
st_5 st_5
st_4 st_4
email_inp email_inp
st_3 st_3
st_2 st_2
lname_inp lname_inp
fname_inp fname_inp
dw_employee dw_employee
st_1 st_1
end type
global w_employee_form w_employee_form

on w_employee_form.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ddlb_inp=create ddlb_inp
this.dp_inp=create dp_inp
this.st_6=create st_6
this.salary_inp=create salary_inp
this.st_5=create st_5
this.st_4=create st_4
this.email_inp=create email_inp
this.st_3=create st_3
this.st_2=create st_2
this.lname_inp=create lname_inp
this.fname_inp=create fname_inp
this.dw_employee=create dw_employee
this.st_1=create st_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.ddlb_inp,&
this.dp_inp,&
this.st_6,&
this.salary_inp,&
this.st_5,&
this.st_4,&
this.email_inp,&
this.st_3,&
this.st_2,&
this.lname_inp,&
this.fname_inp,&
this.dw_employee,&
this.st_1}
end on

on w_employee_form.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ddlb_inp)
destroy(this.dp_inp)
destroy(this.st_6)
destroy(this.salary_inp)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.email_inp)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.lname_inp)
destroy(this.fname_inp)
destroy(this.dw_employee)
destroy(this.st_1)
end on

event open;// Step 1: Set connection parameters
SQLCA.DBMS = "ODBC"
/*SQLCA.Database = "AWS_RDS_EmployeeDB"
SQLCA.LogId = "admin"
SQLCA.LogPass = "AmeyPS$69!((6"*/
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=AWS_RDS_EmployeeDB;UID=admin;PWD=AmeyPS$69!((6'"

// Step 2: Connect to the database
CONNECT USING SQLCA;

// Step 3: Check if the connection was successful
IF SQLCA.SQLCode <> 0 THEN
    MessageBox("Connection Error", "Unable to connect to database: " + SQLCA.SQLErrText)
    RETURN
END IF


/*
// Step 1: Set connection parameters (if not already set globally)
SQLCA.DBMS = "ODBC"  // Or "ODBC" or "MSOLEDBSQL"
SQLCA.LogId = "admin"  // Replace with dynamic input or external configuration
SQLCA.LogPass = "AmeyPS$69!((6"  // Replace with dynamic input or external configuration
SQLCA.ServerName = "ms-sql-server-db.cm9eyucu2mj4.us-east-1.rds.amazonaws.com"  // Replace with dynamic input or external configuration
SQLCA.Database = "EmployeeDB"
SQLCA.AutoCommit = False

// Step 2: Connect to the database
CONNECT USING SQLCA;

// Step 3: Check if the connection was successful
IF SQLCA.SQLCode <> 0 THEN
    MessageBox("Connection Error", "Unable to connect to database: " + SQLCA.SQLErrText)
    RETURN
END IF*/
end event

type cb_4 from commandbutton within w_employee_form
integer x = 1609
integer y = 932
integer width = 750
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "View"
end type

event clicked;// Step 1: Associate the DataWindow with the transaction object
dw_employee.SetTransObject(SQLCA)
IF dw_employee.Retrieve() = -1 THEN
    MessageBox("Error", "Failed to retrieve data.")
END IF
end event

type cb_3 from commandbutton within w_employee_form
integer x = 832
integer y = 932
integer width = 750
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete"
end type

type cb_2 from commandbutton within w_employee_form
integer x = 1605
integer y = 804
integer width = 750
integer height = 112
integer taborder = 40
boolean dragauto = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Update"
end type

type cb_1 from commandbutton within w_employee_form
integer x = 823
integer y = 800
integer width = 750
integer height = 112
integer taborder = 40
boolean dragauto = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add"
end type

type ddlb_inp from dropdownlistbox within w_employee_form
integer x = 1381
integer y = 396
integer width = 1001
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"Sales"," IT"," Marketing","Financial"," Human Resources","R&D","Administration","Production"," Logistics","Public Relations","Operations","Security"}
borderstyle borderstyle = stylelowered!
end type

type dp_inp from datepicker within w_employee_form
integer x = 1381
integer y = 520
integer width = 1001
integer height = 100
integer taborder = 40
boolean border = true
borderstyle borderstyle = stylelowered!
boolean allowedit = true
string customformat = "mm/dd/yyy"
date maxdate = Date("2025-03-10")
date mindate = Date("1990-01-01")
datetime value = DateTime(Date("2025-03-10"), Time("18:41:51.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type st_6 from statictext within w_employee_form
integer x = 809
integer y = 664
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salary"
boolean focusrectangle = false
end type

type salary_inp from singlelineedit within w_employee_form
integer x = 1381
integer y = 644
integer width = 1001
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string placeholder = "Last Name"
end type

type st_5 from statictext within w_employee_form
integer x = 805
integer y = 536
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "HireDate"
boolean focusrectangle = false
end type

type st_4 from statictext within w_employee_form
integer x = 809
integer y = 416
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Department"
boolean focusrectangle = false
end type

type email_inp from singlelineedit within w_employee_form
integer x = 1381
integer y = 264
integer width = 1001
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string placeholder = "Last Name"
end type

type st_3 from statictext within w_employee_form
integer x = 823
integer y = 284
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Email"
boolean focusrectangle = false
end type

type st_2 from statictext within w_employee_form
integer x = 823
integer y = 156
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Last Name"
boolean focusrectangle = false
end type

type lname_inp from singlelineedit within w_employee_form
integer x = 1381
integer y = 136
integer width = 1001
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string placeholder = "Last Name"
end type

type fname_inp from singlelineedit within w_employee_form
integer x = 1381
integer y = 8
integer width = 1001
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string placeholder = "First Name"
end type

type dw_employee from datawindow within w_employee_form
integer x = 18
integer y = 1100
integer width = 3214
integer height = 732
integer taborder = 10
boolean enabled = false
string title = "none"
string dataobject = "d_employee_list"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_employee_form
integer x = 823
integer y = 28
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "First Name"
boolean focusrectangle = false
end type

