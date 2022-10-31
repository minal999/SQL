--Search pattern with like clause

select * from employee

select * from employee where emp_name like 'd%'

select * from employee where dept_name like '%g'

select * from employee where emp_name like 'p____'

select * from employee where emp_name like '____l'

select * from employee where emp_name like '%e%'

select * from employee where emp_name like '%[a-k]%'

select * from employee where dept_name not like '%r'
 
 --in clause

select * from employee where Id in (2,4,5)

select * from employee where Id not in (1,5)

--and  or  not

select * from employee where dept_name='HR' and emp_name='Dev'

select * from employee where dept_name='HR' or dept_name='aws'

select * from employee where not dept_name='HR'

select * from employee order by emp_name

select * from employee order by salary

select * from employee order by salary desc

select * from employee where dept_name ='HR' order by emp_name

select * from employee

alter table employee add city varchar(20)

update employee set city='Pune' where Id=1
update employee set city='Mumbai' where Id=2
update employee set city='Mumbai' where Id=3
update employee set city='Pune' where Id=4
update employee set city='Gujrat' where Id=5
update employee set city='Mumbai' where Id=7

select * from employee where dept_name='developer' and salary>=25000
select * from employee where dept_name='hr' and city='mumbai'

insert into employee values('Akash','akash@gmail.com',45000,'Developer','Kerala')

select * from employee where dept_name='Developer' and emp_name like 'a%'

select * from employee order by emp_name

select * from employee where dept_name='developer'  order by emp_name desc

select count(distinct dept_name) from employee 

select sum(salary) from employee

select avg(salary) from employee

select max(salary) as maxsalary from employee

select min(salary) as minsalary from employee
