--------------------------------1

Create view VCourseName(full_name,course_name)
as 
select St_Fname+' '+St_Lname as fullName ,Crs_Name from Student S ,Course C,Stud_Course SC
where S.St_Id=Sc.St_Id  and C.Crs_Id = Sc.Crs_Id and SC.Grade>50


select * from VCourseName

---------------------------------2
create view V_2 
with encryption
as
select INS.Ins_Name as ManagerName  ,T.Top_Name from Topic T ,Course C ,Ins_Course INC , Instructor INS ,Department D
where T.Top_Id = C.Top_Id and C.Crs_Id = INC.Crs_Id and  INS.Ins_Id = INC.Ins_Id and D.Dept_Id=INS.Dept_Id


select * from V_2


--------------------------------3
create view dbo.v3
with schemabinding
as
select Ins_Name ,Dept_Name from  dbo.Instructor INS ,dbo.Department D
where D.Dept_Id=INS.Dept_Id and Dept_Name in ('SD','Java')

select * from dbo.v3

-------------------------------4
create view V1 
as
select * from Student
where St_Address in ('ALex','Cairo')
with check option

select * from V1

------------------------------5
create nonclustered index HD
on department(Manager_hiredate)

-------------------------------6

create unique index age_index 
on student(St_Age)

--------------------------------7
Create table #emp
(ename varchar(20),
etask varchar(20) )

-------------------------------8
create view vv5(Pname,countEmp)
as
	select P.Pname , Count(E.SSN) from Employee E, Works_on W , Project P
	where E.SSN = W.ESSn and W.Pno=P.Pnumber
	group by P.Pname

select * from vv5

---------------------------------9
Create table DailyTransaction(
	userid int,
	TransactionAmount int
)

insert into DailyTransaction
values(1,1000),(2,2000),(3,1000)

Create table LastTransaction(
	userid int,
	TransactionAmount int
)

insert into LastTransaction
values(1,4000),(4,2000),(2,10000)

merge into LastTransaction as T
using DailyTransaction as s
on T.userid = s.userid
when matched  and s.TransactionAmount > T.TransactionAmount then
update 
	set T.TransactionAmount =S.TransactionAmount 
when not Matched by target then
insert 
	values(S.userid,S.TransactionAmount)
when not matched by source then 
delete ;

select * from LastTransaction

-----------------------part 2------------------------------
-----------------------------1
create view v_clerk(EmpName,PName,HireDate)
as
	select E.Fname+''+E.lname ,P.Pname ,D.[MGRStart Date] from Employee E, Departments D , Project P ,Works_on W
	where D.Dnum=E.Dno and E.SSN = W.ESSn and W.Pno=P.Pnumber 

select * from v_clerk

----------------------------------2
create view v_without_budget
as
	select * from Project P left join Works_on W
	on P.Pnumber=W.Pno
