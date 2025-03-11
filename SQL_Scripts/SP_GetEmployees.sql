-- Use Database
USE EmployeeDB;
GO

CREATE PROCEDURE GetEmployees
AS
BEGIN
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.Email,
        d.DepartmentName,
        e.HireDate,
        e.Salary,
        e.CreatedDate,
        e.ModifiedDate
    FROM Employee e
    INNER JOIN Department d ON e.DepartmentID = d.DepartmentID
	where e.IsActive = 1
    ORDER BY e.EmployeeID,e.HireDate DESC;
END;
GO