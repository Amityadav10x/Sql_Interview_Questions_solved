CREATE DATABASE EmployeeDB;
USE EmployeeDB;


CREATE TABLE Employee (
    EmpID int NOT NULL,
    EmpName Varchar(50),
    Gender Char(1),
    Salary int,
    City Char(20)
);

INSERT INTO Employee
VALUES 
    (1, 'Arjun', 'M', 75000, 'Pune'),
    (2, 'Ekadanta', 'M', 125000, 'Bangalore'),
    (3, 'Lalita', 'F', 150000, 'Mathura'),
    (4, 'Madhav', 'M', 250000, 'Delhi'),
    (5, 'Visakha', 'F', 120000, 'Mathura');
    
    CREATE TABLE EmployeeDetail (
    EmpID int NOT NULL,
    Project Varchar(50),
    EmpPosition Char(20),
    DOJ date
);

INSERT INTO EmployeeDetail
VALUES 
    (1, 'P1', 'Executive', '2019-01-26'),
    (2, 'P2', 'Executive', '2020-05-04'),
    (3, 'P1', 'Lead', '2021-10-21'),
    (4, 'P3', 'Manager', '2019-11-29'),
    (5, 'P2', 'Manager', '2020-08-01');

-- or 
    
CREATE DATABASE EmployeeDetail;
USE EmployeeDetail;

    CREATE TABLE EmployeeDetail (
    EmpID int NOT NULL,
    Project Varchar(50),
    EmpPosition Char(20),
    DOJ date
);


INSERT INTO EmployeeDetail
VALUES 
    (1, 'P1', 'Executive', '2019-01-26'),
    (2, 'P2', 'Executive', '2020-05-04'),
    (3, 'P1', 'Lead', '2021-10-21'),
    (4, 'P3', 'Manager', '2019-11-29'),
    (5, 'P2', 'Manager', '2020-08-01');


--                                         SQL INTERVIEW QUESTIONS PRACTICE

-- Retrieve all columns from the `Employee` table.

SELECT * FROM employee;

-- Select the names of all employees from the `Employee` table.

select EmpName from employee;

-- Find the employees who earn a salary greater than `100,000`.

select EmpName from employee
where Salary > 100000;

--  List the employees who work in the city of `Mathura`.

SELECT EmpName from employee
where city = "Mathura";

-- Count the number of employees in the `Employee` table.

select COUNT(EmpID) AS TOTAL_employees
from employee;

-- Retrieve the details of employees whose names start with the letter `A`.

select EmpName
from employee
where EmpName like "A%";

--  Find all employees who are `M` (male).

select EmpName from employee
where gender = "M";

-- Fetch the names of employees sorted in alphabetical order.
select EmpName 
from employee
order by EmpName asc;

-- Select the maximum salary from the `Employee` table.

select salary,max(salary) as maximum_salary
from employee
order by maximum_salary;

--        or 

select salary, 
max(salary) 
over(order by salary desc) as maximum_salary
from employee;

-- Retrieve the employees who joined before `01-01-2020`.

select * from employeedetail 
where DOJ <  "2020-01-01";

-- Display employee names, their projects, and positions using a join between the `Employee` and `EmployeeDetail` tables.

select e.EmpName,ed.Project,ed.EmpPosition
from employee e
join employeedetail ed
on e.EmpID = ed.EmpID;

-- Find the employees who are P1 project using a `LEFT JOIN`.

select e.EmpName
from employee e
join employeedetail ed
on e.EmpID = ed.EmpID
where ed.Project = "P1";

-- Calculate the average salary of employees by gender.

select sum(e.Salary) as salary, e.Gender
from employee e 
join employeedetail ed 
on e.EmpID = ed.EmpID
group by gender
order by Salary desc;

-- Retrieve the names of employees who earn more than the average salary.

select e.EmpName
from employee e
join employeedetail ed
on e.EmpID = ed.EmpID
where e.salary > (select avg(Salary) from employee);

-- Find the second-highest salary from the `Employee` table.

select e.EmpName,e.Salary
from employee e 
join employeedetail ed 
on e.EmpID = ed.EmpID
limit 1 offset 1;

--  List the employees who joined in the year `2020`.

select e.EmpName,year(ed.DOJ) 
from employee e 
join employeedetail ed 
on e.EmpID = ed.EmpID
where year(ed.DOJ)  = "2020";

-- Fetch employees working on project `P1` with a salary greater than `75,000`.  

select e.EmpName, e.Salary,ed.Project
from employee e 
join employeedetail ed
on e.EmpID = ed.EmpID
where e.Salary > "75000" and ed.Project = "P1";

-- Retrieve the total salary paid to employees in each city.

select e.City,sum(e.Salary) as total_salary
from employee e 
join employeedetail ed
on e.EmpID = ed.EmpID
group by e.city
order by total_salary desc;

-- Rank employees by their salary in descending order using `RANK()`.

select e.salary
from employee e 
join employeedetail ed
on e.EmpID = ed.EmpID;

-- Rank employees by their salary in descending order using `RANK()`.

select EmpName, salary,
RANK() over(order by salary desc) as rank_ 
from employee;
-- Update the salaries of employees by 5% who earn less than `100,000`.

UPDATE employee
set salary = salary * 1.05
where salary < 100000;

-- Retrieve all employees along with their project details, if any, and include employees without projects (`FULL OUTER JOIN` or equivalent).

select e.EmpName, ed.Project
from employee e 
join employeedetail ed 
on e.EmpID = ed.EmpID;

-- Find employees who have completed more than 3 years in the company.

SELECT e.EmpName,ed.DOJ
FROM Employee e
join employeedetail ed
on e.EmpID = ed.EmpID
WHERE DATEDIFF(YEAR, DOJ, GETDATE()) > 3;

-- Write a query to display `High Earner` for employees earning more than `150,000` and `Average Earner` otherwise.

select 
EmpID,
EmpName,
case 
when salary > 150000 then 'Higher earner '
else 'Average earner'
end as earning_category
from employee ;

-- Add a new employee into the `Employee` table and ensure they are also added to the `EmployeeDetail` table.

Insert into employee (EmpID, EmpName, Gender,Salary,City)
value(103,"Amit","M",213000,"basti");

select * from employee;

Insert into employeedetail (EmpID, Project, EmpPosition,DOJ)
value(103,"P9","Manager","2020-10-10");

select * from employeedetail;

-- Delete employees from the `EmployeeDetail` table whose `DOJ` is before `2019-01-01`.

delete from employeedetail
where DOJ < "2019-01-01";

select * from employeedetail;







