-- Use Database
USE EmployeeDB;
GO

INSERT INTO Department (DepartmentName)
VALUES 
    ('Sales'),
    ('IT'),
    ('Marketing'),
    ('Financial'),
    ('Human Resources'),
    ('R&D'),
    ('Administration'),
    ('Production'),
    ('Logistics'),
    ('Public Relations');


INSERT INTO Employee (FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', 1, '2023-01-15', 50000.00), -- Sales
    ('Jane', 'Smith', 'jane.smith@example.com', 2, '2023-02-10', 60000.00), -- IT
    ('Alice', 'Johnson', 'alice.johnson@example.com', 3, '2023-03-05', 55000.00), -- Marketing
    ('Bob', 'Brown', 'bob.brown@example.com', 4, '2023-04-20', 70000.00), -- Financial
    ('Charlie', 'Davis', 'charlie.davis@example.com', 5, '2023-05-12', 65000.00), -- Human Resources
    ('Eva', 'Wilson', 'eva.wilson@example.com', 6, '2023-06-18', 75000.00), -- R&D
    ('Frank', 'Moore', 'frank.moore@example.com', 7, '2023-07-22', 45000.00), -- Administration
    ('Grace', 'Taylor', 'grace.taylor@example.com', 8, '2023-08-30', 80000.00), -- Production
    ('Henry', 'Anderson', 'henry.anderson@example.com', 9, '2023-09-14', 50000.00), -- Logistics
    ('Ivy', 'Thomas', 'ivy.thomas@example.com', 10, '2023-10-25', 55000.00); -- Public Relations
