create table employee(
 EmpID int primary key,
 FirstName varchar(50),
 LastName varchar(50),
 Salary int,
 ManagerID int,
 DepartmentID int
)

create table employee_audit
(
EmpID int,
Operation varchar(10),
UpdatedDate Datetime
)

Insert into employee(EmpID,FirstName,LastName,Salary,ManagerID,DepartmentID) values 
(1,'Lex','Infy',24000,100,100),
(2,'Dev','Nova',25000,101,90),
(3,'Qa','Tata',26000,102,80),
(4,'Prod','Med',27000,103,70),
(5,'Stage','Cardinal',28000,104,60);

Insert into employee(EmpID,FirstName,LastName,Salary,ManagerID,DepartmentID) values (6,'AWS','Cloud',29000,100,100);

Delete from employee where EmpID = 6;

Create procedure GetEmployee
As
Begin
Select * from employee;
End
Go

Create procedure GetEmployeeAudit
As
Begin
Select * from employee_audit;
End
Go

Alter trigger TrgEmpAudit
On Employee After Insert,Delete
As
Begin
Insert into employee_audit
Select EmpID,'Insert',GETDATE() from inserted
Union All
Select EmpID,'Delete',GETDATE() from deleted
End

Alter procedure GetEmployeeByDept
@deptId int=100, 
@EmpCount int Out
As
Begin
Select @EmpCount= Count(*) from employee where DepartmentID = @deptId;
End
Go

exec GetEmployee

Declare @count Int
exec GetEmployeeByDept 80, @count Out
Select @count

exec GetEmployeeAudit;

select EmpId, FirstName, Salary from employee order by FirstName;

select Sum(Salary) as TotalSalary from employee;

Select DepartmentID, count(*) as DeptCount from employee group by DepartmentID having count(*) > 1;
