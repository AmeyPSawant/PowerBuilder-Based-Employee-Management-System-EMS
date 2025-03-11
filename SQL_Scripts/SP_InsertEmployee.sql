-- Use Database
USE EmployeeDB;
GO

CREATE PROCEDURE InsertEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @DepartmentID INT,
    @HireDate DATE,
    @Salary DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Employee (FirstName, LastName, Email, DepartmentID, HireDate, Salary)
    VALUES (@FirstName, @LastName, @Email, @DepartmentID, @HireDate, @Salary);
END;