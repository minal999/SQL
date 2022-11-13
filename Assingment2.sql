create database org;
use org;

create table Worker (
	worker_id int primary key identity(1,1),
	First_Name varchar(25),
	Last_Name varchar(25),
	Salary int,
	Joining_Date DateTime,
	Department Varchar(25)
);

insert into Worker 
	(First_Name, Last_Name, Salary, Joining_Date, Department) values
		('Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
		('Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
		('Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
		('Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
		('Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
		('Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
		('Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
		('Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');


select * from Worker

create table Bonus (
	worker_Ref_Id int,
	bonus_Amount int,
	bonus_Date DATETIME,
	foreign key (worker_Ref_Id)
		references Worker(worker_Id)
        on delete cascade
);

insert into Bonus 
	(worker_Ref_Id, bonus_Amount, bonus_Date) values
		(001, 5000, '2016-02-20'),
		(002, 3000, '2016-06-11'),
		(003, 4000, '2016-02-20'),
		(001, 4500, '2016-02-20'),
		(002, 3500, '2016-06-11');


select * from Bonus


create table Title (
	worker_Ref_Id int,
	worker_Title varchar(25),
	affected_From datetime,
	foreign key (worker_Ref_Id)
		references Worker(worker_id)
        on delete cascade
)

insert into Title 
	(worker_Ref_Id, worker_Title, affected_From) values
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

 --Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
 Select First_Name as Worker_Name from Worker;

 --Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
 select UPPER(First_Name) from Worker

 --Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
 select Distinct department from Worker

 --Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
 Select substring(First_Name,1,3) from Worker;

--Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
--Select instr(First_Name, Binary'a') from Worker where First_Name = 'Amitabh';

--Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
Select RTRIM(First_Name) from Worker;

--Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side
Select LTRIM(Department) from Worker;

--Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
Select distinct len(Department) from Worker;

--Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
Select REPLACE(First_Name,'a','A') from Worker;

--Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
Select CONCAT(First_Name, ' ', Last_Name) AS 'COMPLETE_NAME' from Worker;

--Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
Select * from Worker order by First_Name asc;

--Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
Select * from Worker order by First_Name asc,Department desc;

-- Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
Select * from Worker where First_Name in ('Vipul','Satish');

--Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table
Select * from Worker where First_Name not in ('Vipul','Satish');

--Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
Select * from Worker where Department like 'Admin%';

--Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
Select * from Worker where First_Name like '%a%';

--Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
Select * from Worker where First_Name like '%a';

--Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
Select * from Worker where First_Name like '_____h';

--Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
Select * from Worker where Salary between 100000 and 500000;

--Write an SQL query to print details of the Workers who have joined in Feb’2014
Select * from Worker where year(Joining_Date) = 2014 and month(Joining_Date) = 2;

--Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select COUNT(*) from Worker where Department = 'Admin';

--Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select CONCAT(First_Name, ' ', Last_Name) As Worker_Name, Salary
from Worker where worker_id IN 
(select worker_id from Worker where Salary BETWEEN 50000 AND 100000);

-- Write an SQL query to fetch the no. of workers for each department in the descending order.
select Department, count(worker_id) No_Of_Workers from worker 
group by Department 
order by No_Of_Workers desc;

--Write an SQL query to print details of the Workers who are also Managers.
select distinct w.First_Name, t.worker_Title from Worker w
inner join Title t
on w.worker_id = t.worker_Ref_Id
and t.worker_Title in ('Manager');

--Write an SQL query to fetch duplicate records having matching data in some fields of a table.
select worker_Title, affected_From, COUNT(*) from Title
group by worker_Title, affected_From
having COUNT(*) > 1;

--Write an SQL query to show only odd rows from a table
select * from Worker where worker_id % 2 <> 0

--Write an SQL query to show only even rows from a table.
select * from Worker where worker_id % 2 = 0

--Write an SQL query to clone a new table from another table.
select * into WorkerClone from Worker;

--Write an SQL query to fetch intersecting records of two tables
(select * from Worker) intersect (select * from WorkerClone);

--Write an SQL query to show records from one table that another table does not have.
select * from Worker Minus select * from Title;

--Write an SQL query to show the current date and time.
select getdate();

--Write an SQL query to show the top n (say 10) records of a table.
select top 10 * from Worker order by Salary desc;

----Write an SQL query to determine the nth (say n=5) highest salary from a table
--select top 1 Salary from
--(select distinct top n Salary from Worker order by Salary desc)
--order by Salary asc;

--Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select Salary from Worker w1
where 4 = (select COUNT( distinct ( w2.Salary ) )
from Worker w2 where w2.Salary >= w1.Salary);

--Write an SQL query to fetch the list of employees with the same salary.
Select distinct w.worker_id, w.First_Name, w.Salary from Worker W, Worker w1 
where w.Salary = w1.Salary and w.worker_id != w1.worker_id;

--Write an SQL query to show the second highest salary from a table
Select max(Salary) from Worker where Salary not in (Select max(Salary) from Worker);

--Write an SQL query to show one row twice in results from a table.
select First_Name,Department from worker w where w.Department='HR' 
union all 
select First_Name,Department from Worker w1 where w1.Department='HR';

--Write an SQL query to fetch intersecting records of two tables.
(select * from  Worker) intersect (select * from  WorkerClone);

--Write an SQL query to fetch the first 50% records from a table
select * from Worker where worker_id <= (select count(worker_id)/2 from Worker);

--Write an SQL query to fetch the departments that have less than five people in it.
select Department, COUNT(worker_id) as 'Number of Workers' from Worker group by Department having COUNT(worker_id) < 5;

--Write an SQL query to show all departments along with the number of people in there
select Department, COUNT(Department) as 'Number of Workers' from Worker group by Department;

--Write an SQL query to show the last record from a table
select * from Worker where worker_id = (select max(worker_id) from Worker);

--Write an SQL query to fetch the first row of a table
select * from Worker where worker_id = (select min(worker_id) from Worker);

--Write an SQL query to fetch the last five records from a table.
--select * from Worker where worker_id <=5
--union
--select * from (select * from Worker w order by w.worker_id desc) as w1 where w1.worker_id <=5;

--Write an SQL query to print the name of employees having the highest salary in each department
select t.Department,t.First_Name,t.Salary from(select max(Salary) as TotalSalary,Department from Worker group by Department) as TempNew 
inner join Worker t on TempNew.Department=t.Department 
 and TempNew.TotalSalary=t.Salary;

--Write an SQL query to fetch three max salaries from a table
select distinct Salary from worker a where 3 >= (select count(distinct Salary) from worker b where a.Salary <= b.Salary) order by a.Salary desc;

--Write an SQL query to fetch three min salaries from a table
select distinct Salary from worker a where 3 >= (select count(distinct Salary) from worker b where a.Salary >= b.Salary) order by a.Salary desc;

--Write an SQL query to fetch nth max salaries from a table


--Write an SQL query to fetch departments along with the total salaries paid for each of them.
select Department, sum(Salary) from worker group by Department;

--Write an SQL query to fetch the names of workers who earn the highest salary
select First_Name,Salary from Worker where Salary=(select max(Salary) from Worker);


