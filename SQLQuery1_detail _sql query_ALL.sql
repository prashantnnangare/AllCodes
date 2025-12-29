/*DML Commands create,Alter,Drop,Truncate,Rename*/
create table Employee(id int primary key ,Name varchar(200),city varchar(200),salary int);
INSERT INTO Employee (id, Emp_Name, Emp_city, Emp_sal) VALUES
(1, 'Rahul', 'Pune', 35000),
(2, 'Sagar', 'Mumbai', 42000),
(3, 'Pooja', 'Nashik', 30000),
(4, 'Mahesh', 'Delhi', 55000),
(5, 'Sneha', 'Hyderabad', 45000),
(6, 'Amit', 'Chennai', 38000),
(7, 'Komal', 'Bangalore', 60000),
(8, 'Rohit', 'Nagpur', 32000),
(9, 'Anjali', 'Kolkata', 41000),
(10, 'Prasad', 'Pune', 47000),
(11, 'Tejas', 'Mumbai', 36000),
(12, 'Nidhi', 'Surat', 34000),
(13, 'Vikas', 'Indore', 52000),
(14, 'Karishma', 'Jaipur', 39000),
(15, 'Manish', 'Lucknow', 45000),
(16, 'Divya', 'Ahmedabad', 50000),
(17, 'Shubham', 'Goa', 28000),
(18, 'Priya', 'Patna', 30000),
(19, 'Vinay', 'Bhopal', 43000),
(20, 'Meera', 'Chandigarh', 37000);

select * from Employee
INSERT INTO Employee (id, Emp_Name, Emp_city, Emp_sal) VALUES
(21, 'Kiran', 'Pune', 39000),
(22, 'Manoj', 'Delhi', 48000),
(23, 'Meera', 'Mumbai', 52000),
(24, 'Vinay', 'Bhopal', 43000),
(35, 'Sameer', 'Chennai', 45000);
/*Change the columne name special Query*/
EXEC sp_rename 'Employee.Name','Emp_Name','column'
EXEC sp_rename 'Employee.city','Emp_city','column'
EXEC sp_rename 'Employee.salary','Emp_sal','column'
select * from Employee
/*Describe Employee Table detail alternate of describe query*/
EXEC sp_help 'Employee'
/*Delete table data structure remain same*/
truncate table Employee
/*Drop table delete whole  table with structure*/
Drop table Employee
/* Drop colum Emp_sal*/
Alter table Employee Drop column Emp_sal 
/*Add column Emp _sal*/
Alter table Employee  add  Emp_sal int
--************************************************-
--DML Commands
--Insert 
--update
--Delete
--Select
   --Update city using update
Update Employee set Emp_city='Mumbai' where id=1
--Update Multiple Record change city
Update Employee set Emp_city='Mumbai' where id in (2,3,4)

--Delete
--Delete Partiular Record
Delete Employee where id=1
  --For deleting Multiple Record
Delete from Employee where id in (1,3,5)

--*****************************************
--DCL Commands
 --Grant
  --Revoke

  --TCL
  --Commit
  --Rollback
  --Savepoint
  ----************
  --*****************WHERE clause
  select * from Employee where Emp_sal>50000
  select * from Employee where Emp_city <> 'Pune'   --Not in Pune Record
  select * from Employee where Emp_Name<='Sagar' --Give S record and before s char also
  --IN 
  select * from Employee where Emp_city in ('Mumbai','Pune')
  --ISNULL
  select *  from Employee where Emp_city IS NULL  -- Give Null city name Record
--Logical Operator
select* from Employee where Emp_city='Pune' and Emp_sal>30000 -- Both condition True
select* from Employee where Emp_city='Pune' or Emp_sal>30000  --Single Condition True
--Between
select * from Employee where Emp_sal Between 20000 and 30000
--LIKE OPerator
select * from Employee where Emp_Name like 'r%'  -- Start with R or r 
select * from Employee where Emp_Name like '%l'  -- Ends with l
select * from Employee where Emp_Name like '%h%'  -- h between
select * from Employee where Emp_Name like '__u%'  -- Start Third letter should be u
select * from Employee where Emp_Name like '%h__'  -- Last 3rd letter should be h
select * from Employee where Emp_Name like '[R,S]%'  --Fetch Name start with R and S
select * from Employee where Emp_Name like '[p-S]%'  --Fetch Namesatrt P and S include P And s

--NOT LIKE
select * from Employee where Emp_Name like '[^ M-R]%'  -- fetch record Exclude Range betn M and R
--*************Aggreagate Function**************************
--MIN
--MAX
--Count
--DISTINCT
--Top
--
Select Max (Emp_sal)as Emp_Max  from Employee
Select Min (Emp_sal) as Emp_min from Employee
Select Avg (Emp_sal) as Emp_Avg from Employee
Select count (Emp_sal) as Emp_count from Employee
Select Distinct (Emp_Name) from Employee   -- Give Distict record from Name
Select Top 3 (Emp_Sal)  from Employee
---*************GROUP BY*****************
select Emp_city,count(*)as Count_EMP from Employee Group by Emp_city
--**************Having*************
select Emp_city,count(*) as Total_count from Employee group by Emp_city having count(*)>1

select Emp_city,count(*) as Total_count
from Employee 
group by Emp_city
having Total_count>1

--Aggregate+group by +having**********************************************
select Emp_city,avg(Emp_sal) as Avg_sal
from Employee 
group by Emp_city
having avg(Emp_sal)>1000
---ORDER BY**********
select Emp_sal ,Emp_city,avg(Emp_sal) as Avg_sal
From Employee
group by Emp_sal,Emp_city 
having avg(Emp_sal)>5000
order by Avg_sal desc
----**************CONSTRANTS*****************************
--set of rule And regulation
--Primary key
--check
--Default
--Auto increment
--Foregin key
--Not Null
--identity
drop table student
select *from student
CREATE TABLE student (
    Stud_id INT IDENTITY(1,1) PRIMARY KEY,
    Stud_name VARCHAR(200),
    Stud_city VARCHAR(200) NOT NULL DEFAULT 'Pune',
    Gender VARCHAR(10),
    Dept_id INT,
    CHECK (Gender IN ('M','F')),
    CONSTRAINT fk_student_department FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

INSERT INTO student (stud_name, stud_city, gender, dept_id)
VALUES ('John Doe', 'Delhi', 'M', 1);

INSERT INTO student (stud_name, stud_city, gender, dept_id)
VALUES ('Alice Smith', 'Mumbai', 'F', 2);

INSERT INTO student (stud_name, stud_city, gender, dept_id)
VALUES ('Rahul Kumar', 'Pune', 'M', 3);

select *from student

INSERT INTO student (stud_name, gender)
VALUES ('Rohit Kumar', 'M');
INSERT INTO student (Stud_name, stud_city, gender) VALUES ('John Doe', 'Delhi', 'M');
INSERT INTO student (Stud_name, stud_city, gender) VALUES ('Alice Smith', 'Mumbai', 'F');
INSERT INTO student (Stud_name, stud_city,	Gender) VALUES ('Rahul Kumar', 'Pune', 'M');
INSERT INTO student (Stud_name, stud_city, Gender) VALUES ('Priya Sharma', null, 'F');
INSERT INTO student (Stud_name, stud_city, Gender) VALUES ('Amit Verma', 'Kolkata', 'o');
EXEC sp_help 'student'

select * from student

CREATE TABLE stu1 (
    Stud_id INT IDENTITY(1,1) PRIMARY KEY,
    Stud_name VARCHAR(200) NOT NULL DEFAULT 'Unknown',
    Stud_city VARCHAR(200) NOT NULL DEFAULT 'Pune',
    Gender VARCHAR(10) NOT NULL DEFAULT 'M',
    Admission_Date DATE NOT NULL DEFAULT GETDATE(),
    Marks INT NOT NULL DEFAULT 0,
    CHECK (Gender IN ('M','F'))
);
INSERT INTO stu1 (Stud_name, Stud_city, Gender, Admission_Date, Marks)
VALUES ('Rahul', 'Mumbai', 'M', '2025-01-10', 85);
INSERT INTO stu1(Stud_name, Gender, Admission_Date, Marks)
VALUES ('Sneha', 'F', '2025-01-12', 90);
INSERT INTO stu1 (Stud_name, Stud_city, Gender, Admission_Date)
VALUES ('Amit', 'Nagpur', 'M', '2025-01-15');
INSERT INTO stu1 (Stud_name, Gender)
VALUES ('Pooja', 'F');
INSERT INTO stu1 (Stud_name)
VALUES ('Sachin');

select * from stu1


CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

INSERT INTO Department (dept_id, dept_name) VALUES (1, 'Computer Science');
INSERT INTO Department (dept_id, dept_name) VALUES (2, 'Mechanical');
INSERT INTO Department (dept_id, dept_name) VALUES (3, 'Civil');
INSERT INTO Department (dept_id, dept_name) VALUES (4, 'Electronics');
INSERT INTO Department (dept_id, dept_name) VALUES (5, 'IT')
******************************************************************************************
               SQL JOINS
******************************************************************************************
CREATE TABLE Worker (
    Worker_id INT PRIMARY KEY,
    Worker_Name VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE Worker_Details (
    Detail_id INT PRIMARY KEY,
    Worker_id INT,
    Department VARCHAR(100),
    Salary INT,
    FOREIGN KEY (Worker_id) REFERENCES Worker(Worker_id)
);

INSERT INTO Worker VALUES
(1, 'Amit', 'Pune'),
(2, 'Raj', 'Mumbai'),
(3, 'Neha', 'Delhi'),
(4, 'John', 'Pune');

INSERT INTO Worker_Details VALUES
(101, 1, 'HR', 30000),
(102, 2, 'Sales', 40000),
(103, 3, 'IT', 50000);
-- Note: Worker_id = 4 has no details
select * from Worker_Details
select * from Worker
********Inner join
SELECT w.Worker_id, w.Worker_Name, wd.Department, wd.Salary
FROM Worker w
INNER JOIN Worker_Details wd
ON w.Worker_id = wd.Worker_id;

----LEFT JOIN"
SELECT w.Worker_id, w.Worker_Name, wd.Department, wd.Salary
FROM Worker w
LEFT JOIN Worker_Details wd
ON w.Worker_id = wd.Worker_id;

----RIGHT JOIN
SELECT w.Worker_id, w.Worker_Name, wd.Department, wd.Salary
FROM Worker w
RIGHT JOIN Worker_Details wd
ON w.Worker_id = wd.Worker_id;
------FULL OUTER
SELECT w.Worker_id, w.Worker_Name, wd.Department, wd.Salary
FROM Worker w
FULL OUTER JOIN Worker_Details wd
ON w.Worker_id = wd.Worker_id;

___--------SELF JOIN"
SELECT A.Worker_Name AS Worker1, B.Worker_Name AS Worker2, A.City
FROM Worker A
JOIN Worker B
ON A.City = B.City
AND A.Worker_id <> B.Worker_id;
-------CROSS JOIN
SELECT w.Worker_Name, wd.Department
FROM Worker w
CROSS JOIN Worker_Details wd;

