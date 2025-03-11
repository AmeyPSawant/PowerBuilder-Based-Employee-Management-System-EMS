$PBExportHeader$w_employee_form.srw
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
hire_date_dp.CustomFormat = "mm/dd/yyyy"
hire_date_dp.MaxDate = Today()
hire_date_dp.Value = DateTime(Today())
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
boolean sorted = false
string item[] = {"INSERTION","UPDATION","DELETION"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// Get the selected operation mode
gs_operation_mode = operation_mode_ddl.Text

// Enable/Disable fields and buttons based on the operation mode
CHOOSE CASE gs_operation_mode
    CASE "INSERTION"
        // Enable all fields for insertion
        employee_id_sle.Enabled = False  // Employee ID is auto-filled
        first_name_sle.Enabled = True
        last_name_sle.Enabled = True
        email_sle.Enabled = True
        department_ddl.Enabled = True
        hire_date_dp.CustomFormat = "mm/dd/yyyy"
	    hire_date_dp.Value = DateTime(Today())
        hire_date_dp.Enabled = True
        salary_sle.Enabled = True
        dw_employee.Enabled = True

        // Disable delete and update buttons
        delete_btn.Enabled = False
        update_btn.Enabled = False
        insert_btn.Enabled = True
		  
	   

        // Fetch the latest Employee ID and auto-fill
        DECLARE get_last_id_proc PROCEDURE FOR GetLastEmployeeID;
        EXECUTE get_last_id_proc;
        FETCH get_last_id_proc INTO :employee_id_sle.Text;
        CLOSE get_last_id_proc;

        // Increment Employee ID for next entry
        employee_id_sle.Text = String(Long(employee_id_sle.Text) + 1)
        first_name_sle.Text = ""
      	last_name_sle.Text = ""
      	email_sle.Text = ""
      department_ddl.Text = ""
      hire_date_dp.CustomFormat = "mm/dd/yyyy"
	  hire_date_dp.Value = DateTime(Today())
       salary_sle.Text = ""

    CASE "DELETION"
        // Enable only employee_id field for deletion
        employee_id_sle.Enabled = True
	   employee_id_sle.Text = ""
        first_name_sle.Enabled = False
        last_name_sle.Enabled = False
        email_sle.Enabled = False
        department_ddl.Enabled = False
        hire_date_dp.CustomFormat = "mm/dd/yyyy"
	    hire_date_dp.Value = DateTime(Today())
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
	   employee_id_sle.Text = ""
        first_name_sle.Enabled = True
        last_name_sle.Enabled = True
        email_sle.Enabled = True
        department_ddl.Enabled = True
        hire_date_dp.CustomFormat = "mm/dd/yyyy"
	    hire_date_dp.Value = DateTime(Today())
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

event losefocus;// Fetch employee data if Employee ID is entered
IF Trim(employee_id_sle.Text) <> "" THEN
    // Declare variables to hold employee data
    string ls_first_name, ls_last_name, ls_email, ls_department, ls_hire_date, ls_salary
    long as_employee_id, employee_id

    // Convert the employee ID to a long
    as_employee_id = Long(employee_id_sle.Text)

    // Call the stored procedure using embedded SQL
    DECLARE emp_proc PROCEDURE FOR GetEmployeeByID @EmployeeID = :as_employee_id;

    // Execute the stored procedure
    EXECUTE emp_proc;

    // Fetch the data into variables
    FETCH emp_proc INTO :employee_id,:ls_first_name, :ls_last_name, :ls_email, :ls_department, :ls_hire_date, :ls_salary;
	
	// Combine all debug messages into a single string
	string ls_debug_message
	ls_debug_message = "Employee ID: " + String(as_employee_id) + "~r~n" + &
                   "First Name: " + ls_first_name + "~r~n" + &
                   "Last Name: " + ls_last_name + "~r~n" + &
                   "Email: " + ls_email + "~r~n" + &
                   "Department: " + ls_department + "~r~n" + &
                   "Hire Date: " + ls_hire_date + "~r~n" + &
                   "Salary: " + ls_salary

	// Display the combined message in a single MessageBox
	// MessageBox("Debug", ls_debug_message)
	
    // Check if data was fetched successfully
    IF SQLCA.SQLCode = 0 THEN
        // Populate fields with fetched data
        first_name_sle.Text = String(ls_first_name)
        last_name_sle.Text = ls_last_name
        email_sle.Text = ls_email
        department_ddl.Text = ls_department
        hire_date_dp.Value = DateTime(ls_hire_date)
        salary_sle.Text = ls_salary
    ELSE
        // Show error message if no data was found
        MessageBox("Error", "Employee not found!")
    END IF

    // Close the procedure
    CLOSE emp_proc;
END IF
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
	employee_id_sle.Text = ""
	first_name_sle.Text = ""
	last_name_sle.Text = ""
	email_sle.Text = ""
	department_ddl.Text = ""
	hire_date_dp.CustomFormat = "mm/dd/yyyy"
	hire_date_dp.Value = DateTime(Today())
	

	salary_sle.Text = ""
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

event clicked;// Update Employee Data when Update Button is Clicked
IF Trim(employee_id_sle.Text) <> "" THEN
    // Declare variables to hold updated employee data
    long as_employee_id
    string ls_first_name, ls_last_name, ls_email
    decimal ld_salary


	// Declare variables
	string ls_department_name
	
	// Get the department name from the dropdown (DDL)
	ls_department_name = Trim(department_ddl.Text)
	
	// Convert department name to corresponding ID
	CHOOSE CASE ls_department_name
		 CASE "Administration"
			  li_department_id = 7
		 CASE "Financial"
			  li_department_id = 4
		 CASE "Human Resources"
			  li_department_id = 5
		 CASE "IT"
			  li_department_id = 2
		 CASE "Logistics"
			  li_department_id = 9
		 CASE "Marketing"
			  li_department_id = 3
		 CASE "Production"
			  li_department_id = 8
		 CASE "Public Relations"
			  li_department_id = 10
		 CASE "R&D"
			  li_department_id = 6
		 CASE "Sales"
			  li_department_id = 1
		 CASE ELSE
			  MessageBox("Error", "Invalid department name!")
			  RETURN
	END CHOOSE

    // Convert the employee ID to a long
    as_employee_id = Long(employee_id_sle.Text)
    
    // Assign updated values from UI fields
    ls_first_name = Trim(first_name_sle.Text)
    ls_last_name = Trim(last_name_sle.Text)
    ls_email = Trim(email_sle.Text)
	 
   	// Convert input text from Single-Line Edit (SLE) to decimal
	IF IsNumber(Trim(salary_sle.Text)) THEN
		 ld_salary = Round(Dec(Trim(salary_sle.Text)), 2)  // Convert and round to 2 decimal places
		 salary_sle.Text = String(ld_salary, "0.00")       // Format to always show 2 decimal places
	ELSE
		 MessageBox("Error", "Invalid salary input! Please enter a valid number.")
	END IF

    // Call the stored procedure using embedded SQL
    DECLARE update_proc PROCEDURE FOR UpdateEmployee 
        @EmployeeID = :as_employee_id,
        @FirstName = :ls_first_name,
        @LastName = :ls_last_name,
        @Email = :ls_email,
        @DepartmentID = :li_department_id,
        @Salary = :ld_salary;

    // Execute the stored procedure
    EXECUTE update_proc;

    // Check if the update was successful
    IF SQLCA.SQLCode = 0 THEN
        MessageBox("Success", "Employee details updated successfully!")
    ELSE
        MessageBox("Error", "Failed to update employee details. Please try again.")
    END IF

    // Close the procedure
    CLOSE update_proc;
ELSE
    MessageBox("Error", "Please enter a valid Employee ID.")
END IF

end event

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

event clicked;// Validate input fields
IF Trim(first_name_sle.Text) = "" THEN
    MessageBox("Error", "First Name is required.")
    RETURN
END IF

IF Trim(last_name_sle.Text) = "" THEN
    MessageBox("Error", "Last Name is required.")
    RETURN
END IF

IF Trim(email_sle.Text) = "" OR NOT Pos(email_sle.Text, "@") > 0 THEN
    MessageBox("Error", "Please enter a valid email address.")
    RETURN
END IF

IF li_department_id = 0 THEN
    MessageBox("Error", "Please select a valid department.")
    RETURN
END IF

// Validate and format salary
decimal ld_salary
IF IsNumber(Trim(salary_sle.Text)) THEN
    ld_salary = Round(Dec(Trim(salary_sle.Text)), 2) // Convert and round to 2 decimal places
    salary_sle.Text = String(ld_salary, "0.00") // Format to always show 2 decimal places
ELSE
    MessageBox("Error", "Invalid salary input! Please enter a valid number.")
    RETURN
END IF

// Validate hire date
date ld_hire_date
IF IsDate(hire_date_dp.Text) THEN
    ld_hire_date = Date(hire_date_dp.Text)
    
    // Ensure hire date is not in the future
    IF ld_hire_date > Today() THEN
        MessageBox("Error", "Hire Date cannot be in the future.")
        RETURN
    END IF
ELSE
    MessageBox("Error", "Please enter a valid hire date.")
    RETURN
END IF

// Declare variables for employee details
string ls_first_name, ls_last_name, ls_email
long ll_employee_id

ls_first_name = Trim(first_name_sle.Text)
ls_last_name = Trim(last_name_sle.Text)
ls_email = Trim(email_sle.Text)

// Insert new employee using stored procedure
DECLARE insert_proc PROCEDURE FOR InsertEmployee
    @FirstName = :ls_first_name,
    @LastName = :ls_last_name,
    @Email = :ls_email,
    @DepartmentID = :li_department_id,
    @HireDate = :ld_hire_date,
    @Salary = :ld_salary;

// Execute the insert procedure
EXECUTE insert_proc;

// Check for successful insertion
IF SQLCA.SQLCode = 0 THEN
    MessageBox("Success", "Employee added successfully! Employee ID: " + String(ll_employee_id))
	// Retrieve the last Employee ID using stored procedure
	DECLARE get_last_id_proc PROCEDURE FOR GetLastEmployeeID;
	EXECUTE get_last_id_proc;
	FETCH get_last_id_proc INTO :ll_employee_id;
	CLOSE get_last_id_proc;
	
	 employee_id_sle.Text = String(Long(employee_id_sle.Text) + 1)  // Increment for the new employee
	 
	 /*
      first_name_sle.Text = ""
      last_name_sle.Text = ""
      email_sle.Text = ""
      department_ddl.Text = ""
      hire_date_dp.CustomFormat = "mm/dd/yyyy"
	  hire_date_dp.Value = DateTime(Today())
       salary_sle.Text = ""
	*/
	
ELSE
    MessageBox("Error", "Failed to add employee. Please try again.")
END IF

// Close the procedure
CLOSE insert_proc;

end event

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
boolean allowedit = true
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Sales"," IT"," Marketing","Financial"," Human Resources","R&D","Administration","Production"," Logistics","Public Relations","Operations","Security"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// Event: department_ddl SelectionChanged
string ls_department_name

// Get selected department name
ls_department_name = Trim(department_ddl.Text)

// Convert department name to corresponding ID
CHOOSE CASE ls_department_name
    CASE "Administration"
        li_department_id = 7
    CASE "Financial"
        li_department_id = 4
    CASE "Human Resources"
        li_department_id = 5
    CASE "IT"
        li_department_id = 2
    CASE "Logistics"
        li_department_id = 9
    CASE "Marketing"
        li_department_id = 3
    CASE "Production"
        li_department_id = 8
    CASE "Public Relations"
        li_department_id = 10
    CASE "R&D"
        li_department_id = 6
    CASE "Sales"
        li_department_id = 1
    CASE ELSE
        MessageBox("Error", "Invalid department name!")
        RETURN
END CHOOSE
end event

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
date maxdate = Date("2025-03-11")
date mindate = Date("1990-01-01")
datetime value = DateTime(Date("2025-03-11"), Time("14:55:22.000000"))
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

