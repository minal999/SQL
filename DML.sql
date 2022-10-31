use practice_DB


alter table person add age int

alter table person add country varchar(20)

alter table person add constraint chk_age check(age>18)

alter table person add constraint df_country default 'India' for country

create unique index index_person on person(id)

drop index index_person

sp_help person
drop table orders

drop table person

create table Person (
Id int identity(1,1) primary key,
name varchar(20) not null,
city varchar(20)
)

alter table person add age int

create table employee(
Id int identity(1,1) primary key,
emp_name varchar(30) not null,
email varchar(30) not null,
salary int,
dept_name varchar(20)
)


insert into employee values('Deepa','deepa@gamil.com',44000,'Testing')
insert into employee values('Raj','raj@gamil.com',58000,'Developer')
insert into employee values('Kajal','kajal@gamil.com',40000,'Testing')
insert into employee values('Payal','payal@gamil.com',72000,'Aws')
insert into employee values('Dev','dev@gamil.com',47500,'HR')
insert into employee values('Shiva','shiva@gamil.com',62000,'Accounts')
insert into employee values('Manmeet','manmeet@gamil.com',35000,'Networking')


update employee set salary=51000, dept_name='HR' where Id=3

delete from employee where Id=6

select * from employee
select emp_name,email,salary from Employee

select emp_name,email,salary from Employee where id=3

select * from Employee where id=5

select distinct dept_name from Employee

select * from Employee where salary >=40000

select * from Employee where salary <>72000

select * from Employee where salary between 40000 and 65000



insert into Person values('Geeta','Mumbai',25)
insert into Person values('Ram','Pune',42)
insert into Person values('Tanishk','Kolkata',19)
insert into Person values('Ginny','Delhi',24)
insert into Person values('Saroj','Rajastan',62)
insert into Person values('Dhanush','Chennai',50)
insert into Person values('Vijay','Kerala',23)
insert into Person values('Mohan','Kerala',33)

select * from Person

update Person set city='Gujrat' where Id=5

select name,city from Person
select distinct city from Person
select * from person where age > 40
select * from person where age <>62
select * from person where age between 30 and 50