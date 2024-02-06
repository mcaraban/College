' 1.	Display all records from the Assignment table except Project Id 1100, and 1400? '

SELECT ProjectID, EmployeeNumber, HoursWorked
FROM ASSIGNMENT
WHERE NOT ProjectID = 1100 AND NOT ProjectID = 1400;

' 2.	Display Project Id with their starting and ending dates where the starting date is     after 10-Aug-05? '
SELECT ProjectID, StartDate, EndDate
FROM PROJECT
WHERE StartDate > #10-Aug-05#;

' 3.	Display last name, first names with their phone numbers whose first names are “Tom” and “Richard”? '
SELECT LastName, FirstName, Phone
FROM EMPLOYEE
WHERE FirstName = 'Tom' or FirstName = 'Richard';

' 4.	Display all the employees’ numbers with their salaries if their salaries less than 9,000? '
SELECT EmployeeNumber, Salary
FROM EMPLOYEE
WHERE Salary < 9000;

' 5.	Display Projects with maximum hours between 120 and 140 '
SELECT *
FROM PROJECT
WHERE MaxHours BETWEEN 120 AND 140;

' 6.	Find the total number of Maximum Hours on project 1200. '
SELECT SUM(MaxHours) AS TotalMaxHours
FROM PROJECT
WHERE ProjectID = 1200;

' 7.	Find the largest MaxHours for projects. '
SELECT MAX(MaxHours) AS LargestMaxHours
FROM PROJECT;

' 8.	Find the total number of hours worked for employee number 6 and display his/her income if he/she earns $12 per hour. '
SELECT SUM(HoursWorked)*12 AS Income
FROM ASSIGNMENT
WHERE EmployeeNumber = 6;

' 9.	Find how many projects Finance department has? '
SELECT *
FROM PROJECT, DEPARTMENT
WHERE PROJECT.Department = DEPARTMENT.DepID AND PROJECT.DEPARTMENT = '2';

' 10.	Find how many employees dont have a phone number yet. '
SELECT *
FROM EMPLOYEE
WHERE Phone IS NULL;






