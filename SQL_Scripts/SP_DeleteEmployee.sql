-- Use Database
USE EmployeeDB;
GO

CREATE PROCEDURE SoftDeleteEmployee
    @EmployeeID INT
AS
BEGIN
    UPDATE Employee
    SET IsActive = 0, ModifiedDate = GETDATE()
    WHERE EmployeeID = @EmployeeID;
END;