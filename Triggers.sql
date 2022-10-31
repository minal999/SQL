create table EmployeeAudit(
auditid int primary key identity(1,1),
empid int,
dt varchar(20),
info varchar(40)
)
create trigger tr_emp_audit
on Employee for insert
as begin
declare @empid int
select @empid=Id from inserted
insert into EmployeeAudit values(@empid,cast(getdate() as varchar(20)),'inserted')
end

create trigger tr_emp_audit_delete
on Employee for delete
as begin
declare @empid int
select @empid=Id from deleted
insert into EmployeeAudit values(@empid,cast(getdate() as varchar(20)),'deleted')
end

insert into employee values('Girija','girija@gmail.com',71000,'Mumbai',2,1)
delete from employee where Id=12
select * from EmployeeAudit