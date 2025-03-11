-- Use Database
USE EmployeeDB;
GO

CREATE PROCEDURE GetEmployeeByID
    @EmployeeID INT
AS
BEGIN
    SELECT
		e.EmployeeId,
        e.FirstName,
        e.LastName,
        e.Email,
        d.DepartmentName AS Department,
        e.HireDate,
        e.Salary
    FROM 
        Employee e
    INNER JOIN 
        Department d ON e.DepartmentID = d.DepartmentID
    WHERE 
        e.EmployeeID = @EmployeeID and e.IsActive = 1;
END;