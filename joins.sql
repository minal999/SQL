select * from employee


insert into employee values('Amy','amy@gmail.com',52000,null,'Mumbai') 

select * from employee where salary>50000 and dept_name is null

select * from employee where dept_name is not null 

create table department(
dept_id int identity(1,1) primary key,
dept_name varchar(30)
)

alter table employee drop column dept_name

alter table employee add dept_id int

insert into department values('HR')
insert into department values('Development')
insert into department values('Networking')
insert into department values('AWS')
insert into department values('Admin')

select * from department

update employee set dept_id=1 where Id in (1,9)
update employee set dept_id=2 where Id in (7,10)
update employee set dept_id=3 where Id =3
update employee set dept_id=4 where Id in (4,2)
update employee set dept_id=5 where Id =5

select e.emp_name,e.salary,d.dept_name,d.dept_id from  employee e 
inner join department d on d.dept_id=e.dept_id

select e.emp_name,e.salary,d.dept_name,d.dept_id from  employee e 
left join department d on d.dept_id=e.dept_id

select e.emp_name,e.salary,d.dept_name from  employee e 
right join department d on d.dept_id=e.dept_id

select e.Id,emp_name,e.salary,d.dept_name,d.dept_id from employee e
full join department d on d.dept_id=e.dept_id

select e.emp_name,e.salary,d.dept_name,d.dept_id from  employee e 
inner join department d on d.dept_id=e.dept_id
where e.salary>45000 order by e.salary

select e.emp_name,e.salary,d.dept_name,d.dept_id from  employee e 
inner join department d on d.dept_id=e.dept_id
where dept_name='AWS' order by e.salary


--display emp who works in development dept and salary is less than amy
select e.emp_name,e.salary,d.dept_name,d.dept_id from  employee e 
inner join department d on d.dept_id=e.dept_id
where d.dept_name='Development' and e.salary<52000

----display emp whos salary is >30000 but not from hr dept
select e.emp_name,e.salary,d.dept_name,d.dept_id from  employee e 
inner join department d on d.dept_id=e.dept_id
where e.salary>30000 and not d.dept_name ='HR'

--display emp who work in development and networking dept sort record by name in asc
select e.emp_name,e.salary,d.dept_name,d.dept_id from  employee e 
inner join department d on d.dept_id=e.dept_id
where d.dept_name in('Development','Networking') order by e.emp_name

--display emp who work in hr, admin dept and salary>15000 sort record by salary i desc

select e.emp_name,e.salary,d.dept_name,d.dept_id from  employee e 
inner join department d on d.dept_id=e.dept_id
where d.dept_name in('HR','Admin') and e.salary>15000 order by e.salary desc


--self join
select * from employee
alter table employee add managerId int
update employee set managerId=1 where Id in (4,7,9)
update employee set managerId=2 where Id in (3,5,10)

select e.Id,e.emp_name as employee,m.emp_name as Manager from Employee e , Employee m
where m.Id=e.managerId
