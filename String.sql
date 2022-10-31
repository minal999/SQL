select * from employee

select * from department

--50% records of employees
select top 50 percent * from employee 
--last 50% records of employees
select top 50 percent * from employee order by Id desc


create view emp_dept as
select * from employee where dept_id=2 and emp_name like 'a%'

select * from emp_dept

create view emp_sal as 
select * from employee where salary=(select max(salary) from employee)

select * from emp_sal

create view dept_sal as 
select * from employee where dept_id=
(
select dept_id from department where dept_name='Development'
)

select * from dept_sal

update employee set salary=20000.45 where Id in (1,5)
--String functions in sql

-- substring
select SUBSTRING(email,1,5) as tempname from employee where id=1

-- concat
select CONCAT(emp_name,' ',email) from employee

--length
select email,len(email) from employee

--Upperand lower case
select UPPER(emp_name) from employee
select LOWER(emp_name) from employee

--trim,ltrim,rtrim
select LTRIM(emp_name)as  LeftTrim from employee
select RTRIM(emp_name)as RightTrim from employee
select TRIM(emp_name)as BothTrim from employee

--round 
select ROUND(salary,2)as RoundSalary from employee where id in(1,5)

--reverse
select REVERSE(emp_name)as ReversedName from employee

--replace
select REPLACE(emp_name,'Akash','Ajay')as ReplaceName from employee

