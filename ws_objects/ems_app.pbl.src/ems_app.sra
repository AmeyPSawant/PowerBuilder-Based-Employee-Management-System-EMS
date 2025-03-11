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

