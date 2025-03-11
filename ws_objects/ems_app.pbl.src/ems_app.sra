$PBExportHeader$ems_app.sra
$PBExportComments$Generated Application Object
forward
global type ems_app from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
// Global Variables
string gs_operation_mode
string gs_employee_id
end variables

global type ems_app from application
string appname = "ems_app"
string appruntimeversion = "22.2.0.3397"
end type
global ems_app ems_app

type prototypes
/*
FUNCTION FetchEmployeeData(long as_employee_id)
    // Declare variables
    string ls_first_name, ls_last_name, ls_email, ls_department, ls_hire_date, ls_salary

    // Fetch data from the database using a stored procedure or SQL
    SELECT FirstName, LastName, Email, Department, HireDate, Salary
    INTO :ls_first_name, :ls_last_name, :ls_email, :ls_department, :ls_hire_date, :ls_salary
    FROM Employee
    WHERE EmployeeID = :as_employee_id;

    // Populate fields if data is found
    IF SQLCA.SQLCode = 0 THEN
        first_name_sle.Text = ls_first_name
        last_name_sle.Text = ls_last_name
        email_sle.Text = ls_email
        department_ddl.Text = ls_department
        hire_date_dp.Text = ls_hire_date
        salary_sle.Text = ls_salary
    ELSE
        MessageBox("Error", "Employee not found!")
    END IF
END FUNCTION
*/
end prototypes
on ems_app.create
appname = "ems_app"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on ems_app.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

