﻿$PBExportHeader$w_employee_form.srw
forward
global type w_employee_form from window
end type
type operation_mode_ddl from dropdownlistbox within w_employee_form
end type
type st_8 from statictext within w_employee_form
end type
type st_7 from statictext within w_employee_form
end type
type employee_id_sle from singlelineedit within w_employee_form
end type
type view_btn from commandbutton within w_employee_form
end type
type delete_btn from commandbutton within w_employee_form
end type
type update_btn from commandbutton within w_employee_form
end type
type insert_btn from commandbutton within w_employee_form
end type
type department_ddl from dropdownlistbox within w_employee_form
end type
type hire_date_dp from datepicker within w_employee_form
end type
type st_6 from statictext within w_employee_form
end type
type salary_sle from singlelineedit within w_employee_form
end type
type st_5 from statictext within w_employee_form
end type
type st_4 from statictext within w_employee_form
end type
type email_sle from singlelineedit within w_employee_form
end type
type st_3 from statictext within w_employee_form
end type
type st_2 from statictext within w_employee_form
end type
type last_name_sle from singlelineedit within w_employee_form
end type
type first_name_sle from singlelineedit within w_employee_form
end type
type dw_employee from datawindow within w_employee_form
end type
type st_1 from statictext within w_employee_form
end type
end forward

global type w_employee_form from window
integer width = 4352
integer height = 2312
boolean titlebar = true
string title = "w_employee_form"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
operation_mode_ddl operation_mode_ddl
st_8 st_8
st_7 st_7
employee_id_sle employee_id_sle
view_btn view_btn
delete_btn delete_btn
update_btn update_btn
insert_btn insert_btn
department_ddl department_ddl
hire_date_dp hire_date_dp
st_6 st_6
salary_sle salary_sle
st_5 st_5
st_4 st_4
email_sle email_sle
st_3 st_3
st_2 st_2
last_name_sle last_name_sle
first_name_sle first_name_sle
dw_employee dw_employee
st_1 st_1
end type
global w_employee_form w_employee_form

on w_employee_form.create
this.operation_mode_ddl=create operation_mode_ddl
this.st_8=create st_8
this.st_7=create st_7
this.employee_id_sle=create employee_id_sle
this.view_btn=create view_btn
this.delete_btn=create delete_btn
this.update_btn=create update_btn
this.insert_btn=create insert_btn
this.department_ddl=create department_ddl
this.hire_date_dp=create hire_date_dp
this.st_6=create st_6
this.salary_sle=create salary_sle
this.st_5=create st_5
this.st_4=create st_4
this.email_sle=create email_sle
this.st_3=create st_3
this.st_2=create st_2
this.last_name_sle=create last_name_sle
this.first_name_sle=create first_name_sle
this.dw_employee=create dw_employee
this.st_1=create st_1
this.Control[]={this.operation_mode_ddl,&
this.st_8,&
this.st_7,&
this.employee_id_sle,&
this.view_btn,&
this.delete_btn,&
this.update_btn,&
this.insert_btn,&
this.department_ddl,&
this.hire_date_dp,&
this.st_6,&
this.salary_sle,&
this.st_5,&
this.st_4,&
this.email_sle,&
this.st_3,&
this.st_2,&
this.last_name_sle,&
this.first_name_sle,&
this.dw_employee,&
this.st_1}
end on

on w_employee_form.destroy
destroy(this.operation_mode_ddl)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.employee_id_sle)
destroy(this.view_btn)
destroy(this.delete_btn)
destroy(this.update_btn)
destroy(this.insert_btn)
destroy(this.department_ddl)
destroy(this.hire_date_dp)
destroy(this.st_6)
destroy(this.salary_sle)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.email_sle)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.last_name_sle)
destroy(this.first_name_sle)
destroy(this.dw_employee)
destroy(this.st_1)
end on

event open;// Step 1: Set connection parameters
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=AWS_RDS_EmployeeDB;UID=admin;PWD=AmeyPS$69!((6'"

// Step 2: Connect to the database
CONNECT USING SQLCA;

// Step 3: Check if the connection was successful
IF SQLCA.SQLCode <> 0 THEN
    MessageBox("Connection Error", "Unable to connect to database: " + SQLCA.SQLErrText)
    RETURN
END IF

// Disable all fields and buttons initially
employee_id_sle.Enabled = False
first_name_sle.Enabled = False
last_name_sle.Enabled = False
email_sle.Enabled = False
department_ddl.Enabled = False
hire_date_dp.Enabled = False
salary_sle.Enabled = False

insert_btn.Enabled = False
update_btn.Enabled = False
delete_btn.Enabled = False

// Enable only the operation mode dropdown
operation_mode_ddl.Enabled = True
end event

type operation_mode_ddl from dropdownlistbox within w_employee_form
integer x = 1815
integer y = 32
integer width = 1001
integer height = 400
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"INSERTION","UPDATION","DELETION"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// Get the selected operation mode
gs_operation_mode = operation_mode_ddl.Text

// Enable/Disable fields and buttons based on the operation mode
CHOOSE CASE gs_operation_mode
    CASE "INSERTION"
        // Enable all fields for insertion
        employee_id_sle.Enabled = True
        first_name_sle.Enabled = True
        last_name_sle.Enabled = True
        email_sle.Enabled = True
        department_ddl.Enabled = True
        hire_date_dp.Enabled = True
        salary_sle.Enabled = True
 	    dw_employee.Enabled = True

        // Disable delete and update buttons
        delete_btn.Enabled = False
        update_btn.Enabled = False
        insert_btn.Enabled = True

    CASE "DELETION"
        // Enable only employee_id field for deletion
        employee_id_sle.Enabled = True
        first_name_sle.Enabled = False
        last_name_sle.Enabled = False
        email_sle.Enabled = False
        department_ddl.Enabled = False
        hire_date_dp.Enabled = False
        salary_sle.Enabled = False
        dw_employee.Enabled = True

        // Disable insert and update buttons
        insert_btn.Enabled = False
        update_btn.Enabled = False
        delete_btn.Enabled = True

    CASE "UPDATION"
        // Enable all fields for updation
        employee_id_sle.Enabled = True
        first_name_sle.Enabled = True
        last_name_sle.Enabled = True
        email_sle.Enabled = True
        department_ddl.Enabled = True
        hire_date_dp.Enabled = True
        salary_sle.Enabled = True
	    dw_employee.Enabled = True

        // Disable insert and delete buttons
        insert_btn.Enabled = False
        delete_btn.Enabled = False
        update_btn.Enabled = True
END CHOOSE
end event

type st_8 from statictext within w_employee_form
integer x = 1253
integer y = 40
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
string text = "Operation Mode"
boolean focusrectangle = false
end type

type st_7 from statictext within w_employee_form
integer x = 1257
integer y = 176
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
string text = "Employee Id"
boolean focusrectangle = false
end type

type employee_id_sle from singlelineedit within w_employee_form
integer x = 1815
integer y = 156
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

event losefocus;/*// Fetch employee data if Employee ID is entered
IF Trim(employee_id_sle.Text) <> "" THEN
    // Call a function to fetch employee data
    global FetchEmployeeData(Long(employee_id_sle.Text))
END IF
*/


end event

type view_btn from commandbutton within w_employee_form
integer x = 2043
integer y = 1212
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

type delete_btn from commandbutton within w_employee_form
integer x = 1266
integer y = 1212
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

event clicked;// Validate Employee ID
IF Trim(employee_id_sle.Text) = "" THEN
    MessageBox("Error", "Employee ID is required!")
    RETURN
END IF

// Convert Employee ID to integer
long ll_employee_id
ll_employee_id = Long(employee_id_sle.Text)

// Call the stored procedure for soft deletion
DECLARE SoftDeleteEmployee PROCEDURE FOR SoftDeleteEmployee (
    :ll_employee_id
);

EXECUTE SoftDeleteEmployee;

IF SQLCA.SQLCode = 0 THEN
    MessageBox("Success", "Employee deleted successfully!")
ELSE
    MessageBox("Error", "Failed to delete employee!")
END IF
end event

type update_btn from commandbutton within w_employee_form
integer x = 2039
integer y = 1084
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

type insert_btn from commandbutton within w_employee_form
integer x = 1257
integer y = 1080
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
string text = "Insert"
end type

type department_ddl from dropdownlistbox within w_employee_form
integer x = 1815
integer y = 676
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

type hire_date_dp from datepicker within w_employee_form
integer x = 1815
integer y = 800
integer width = 1001
integer height = 100
integer taborder = 40
boolean border = true
borderstyle borderstyle = stylelowered!
boolean allowedit = true
string customformat = "mm/dd/yyy"
date maxdate = Date("2025-03-10")
date mindate = Date("1990-01-01")
datetime value = DateTime(Date("2025-03-11"), Time("00:43:34.000000"))
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
integer x = 1243
integer y = 944
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

type salary_sle from singlelineedit within w_employee_form
integer x = 1815
integer y = 924
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
integer x = 1239
integer y = 816
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
integer x = 1243
integer y = 696
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

type email_sle from singlelineedit within w_employee_form
integer x = 1815
integer y = 544
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
integer x = 1257
integer y = 564
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
integer x = 1257
integer y = 436
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

type last_name_sle from singlelineedit within w_employee_form
integer x = 1815
integer y = 416
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

type first_name_sle from singlelineedit within w_employee_form
integer x = 1815
integer y = 288
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
integer x = 27
integer y = 1372
integer width = 4261
integer height = 800
integer taborder = 10
string title = "none"
string dataobject = "d_employee_list"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_employee_form
integer x = 1257
integer y = 308
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

