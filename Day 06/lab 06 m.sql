create Rule loc_rule as @loc1 in ('NY','DS','KW');
Create default loc_default as 'NY' ;
Exec sp_addtype loc ,'nchar(2)'
Exec sp_bindrule loc_rule ,loc
Exec sp_bindefault loc_default , loc 

Create Table Department (
	DeptNO nchar(3) primary key,
	DeptName varchar(20) ,
	Location loc
)

insert into Department
values ('d1','Research','NY'),
	   ('d2','Accounting','DS'),
	   ('d3','Marketing','KW')


create table Employee(
	EmpNo int,
	Fname varchar(50) not null,
	Lname varchar(50) not null,
	DeptNo nchar(3),
	Salary dec(5) ,
	Constraint C1 primary key(EmpNo),
	Constraint C2 foreign key(DeptNo) References Department(DeptNo) ,
	Constraint C3 unique(Salary),
	Constraint C4 check(Salary < 6000),

)
INSERT INTO Employee
VALUES
    (25348, 'Matthew', 'Smith', 'd3', 2500),
    (10102, 'Ann', 'Jones', 'd3', 3000),
    (18316, 'John', 'Barrimore', 'd1', 2400),
    (29346, 'James', 'James', 'd2', 2800),
    (9031, 'Lisa', 'Bertoni', 'd2', 4000),
    (2581, 'Elisa', 'Hansel', 'd2', 3600),
    (28559, 'Sybl', 'Moser', 'd1', 2900)


Select * from Project

select * from Works_on

--------------------------------------------
insert into works_on(EmpNo,ProjectNo)
values(11111,'p3')

update Works_on
	set EmpNo = 11111
where EmpNo = 10102

update Employee
	set EmpNo = 22222
where EmpNo = 10102

delete from Employee
where EmpNo =10102
---------------------------------------------------------------
alter table Employee add TelephoneNumber varchar(20)

alter table Employee drop column TelephoneNumber	
---------------------------------------------------------------2
Create Schema Company
go
alter schema company transfer Department

Create Schema HumanResource
go
alter schema HumanResource transfer Employee
-------------------------------------------------------------3
SELECT 
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE 
    TABLE_NAME = 'Employee';

select * from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
where TABLE_NAME='Employee'
 

 -------------------------------------------4
Create Synonym Emp
for HumanResource.Employee

Select * from Employee
Select * from [HumanResource].Employee
Select * from Emp
Select * from [HumanResource].Emp

--------------------------------------------5
update Company.project
	set Budget *= 1.1
from works_on W,Company.project P
where P.ProjectNo = W.ProjectNo and EmpNo=10102 and Job='Manager'

--------------------------------------------6
update Company.Department
	set DeptName='Sales'
from Emp E,Company.Department D
where D.DeptNo =E.DeptNo and Fname='James'

------------------------------------------------7
update Works_on
	set Enter_Date ='2007-12-12'
from Emp E,works_on W,Company.project P
where E.EmpNo = W.EmpNo and P.ProjectNo = W.ProjectNo and deptNo ='d2' and P.ProjectNo = 'p1'

------------------------------------------------8
delete Works_on
from Emp E,works_on W,Company.Department D
where   D.DeptNo =E.DeptNo and  E.EmpNo = W.EmpNo  and location = 'KW'

