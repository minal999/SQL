create procedure SP_Employee_Select
as begin
select * from employee
end

exec SP_Employee_Select

create proc SP_Employee_Insert
(
@emp_name varchar(30),
@email varchar(30),
@salary decimal,
@city varchar(20),
@dept_id int,
@mangerId int
)
as begin 
insert into employee values(@emp_name,@email,@salary,@city,@dept_id,@mangerId)
end

exec SP_Employee_Insert
@emp_name ='test5',
@email ='test5@gmail.com',
@salary=34000,
@city='Noida',
@dept_id=3,
@mangerId =2

--Create SP to update emp
create proc SP_Employee_Update
as begin
update  employee set    
emp_name = 'Sanju',
email = 'sanju@gmail.com',
salary = 50000,
city = 'Mumbai',
dept_id=2
where  id = 8
end

exec SP_Employee_Update

--Create SP to delete single emp using empid
create proc SP_Employee_Delete
as begin
delete from employee where  id = 10
end

exec SP_Employee_Delete

--Create SP to fetch single emp using empid
create proc SP_Employee_Fetch
as begin
select * from employee where id=9
end

exec SP_Employee_Fetch

drop proc SP_Employee_Fetch
select * from employee


create function GetNameFromEmp(@id int)
returns varchar(30)
as
begin
return (select emp_name from employee where id=@id)
end

select  dbo.GetNameFromEmp(2) as Name


create function getEmpByDept(@dept_id int)
returns table
as 
return(select emp_name from employee where dept_id=@dept_id)


select * from getEmpByDept(2)
