-- Use Database
USE EmployeeDB;
GO

CREATE PROCEDURE GetLastEmployeeID
AS
BEGIN
    SELECT ISNULL(MAX(EmployeeID), 0) AS LastEmployeeID FROM Employee e where e.IsActive = 1;
END;
