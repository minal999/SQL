

select top 8 * from Employee -- sql server

--select * from Employee limit 8 -- mysql

--cross join example
create table breakfast(
id int primary key,
name varchar(20)
)
create table drinks(
id int primary key,
name varchar(20)
)

insert into breakfast values('Poha')
insert into breakfast values('Upama')
insert into breakfast values('Idli')

insert into breakfast values('Tea')
insert into breakfast values('Coffee')
insert into breakfast values('Lemon Tea')

select * from breakfast cross join drinks


select * from employee

select dept_id,count(Id) as IdCount from employee group by dept_id

select dept_id,count(emp_name) as NameCount from employee group by dept_id

select d.dept_name,count(e.Id) as IdCount from employee e
inner join department d on d.dept_id=e.dept_id
group by d.dept_name

select count(Id) as empcount,dept_id from employee
group by dept_id
having count(id) > 1

select count(Id) as empcount,dept_id from employee
group by dept_id
having dept_id in(1,3,4)
order by count(Id)

--subqueries

--highest salary
select max(salary) from employee

--emp name who have highest salary
select emp_name from employee where salary=(select max(salary) from employee)

--second highest salary
select max(salary) from employee where salary<>(select max(salary) from employee)

--emp name who have second highest salary
select emp_name from employee where salary=(select max(salary) from employee where salary<>(select max(salary) from employee))

--third highest salary
select max(salary) from employee where salary<(select max(salary) from employee where salary<>(select max(salary) from employee))

select emp_name from employee where salary=(select max(salary) from employee where salary<(select max(salary) from employee where salary<>(select max(salary) from employee)))


select * from employee


--find emp whose salary is greater than avg of all emp salaries

select Avg(salary) as average from employee
select emp_name,salary from employee where salary>(select Avg(salary) as average from employee)

--find emp whose salary> avg of its dept

select avg(salary) as average from employee group by dept_id
select * from employee where salary>all(select avg(salary) as average from employee group by dept_id)

-- sum the salary department wise
select dept_id,sum(salary) as sum from employee group by dept_id

-- display emp who get the more salary than avg salary of Networking dept
select * from department
select avg(salary) as average from employee where dept_id=3
select emp_name,salary from employee where salary>(select avg(salary) as average from employee where dept_id=3)
