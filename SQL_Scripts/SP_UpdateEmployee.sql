-- Use Database
USE EmployeeDB;
GO

CREATE PROCEDURE UpdateEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @DepartmentID INT,
    @Salary DECIMAL(10,2)
AS
BEGIN
    BEGIN TRY
        UPDATE Employee
        SET FirstName = @FirstName,
            LastName = @LastName,
            Email = @Email,
            DepartmentID = @DepartmentID,
            Salary = @Salary,
            ModifiedDate = GETDATE()
        WHERE EmployeeID = @EmployeeID;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;