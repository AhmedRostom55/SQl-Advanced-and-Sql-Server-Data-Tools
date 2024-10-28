--------------------------------1

Create view VCourse(full_name,course_name)
as 
select St_Fname+' '+St_Lname as fullName ,Crs_Name from Student S ,Course C,Stud_Course SC
where S.St_Id=Sc.St_Id and SC.Grade>50


select * from VCourse

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
create view v5 
as
select Pname ,count(SSN) as the_number_of_employees from Employee E ,Departments D ,Project P
where D.Dnum = P.Dnum and D.Dnum=E.Dno
group by Pname

select * from v5

---------------------------------9
create table tlast
(userid int primary key,tamount int)
insert into tlast values(1,4000),(4,2000),(2,10000)

create table tdaliy
(userid int primary key,tamount int)
insert into tdaliy values(1,1000),(2,2000),(3,1000)

Merge into tlast as TL
using  tdaliy as TD
on TL.userid =TD.userid
when Matched and TD.tamount >TL.tamount then 
	update 
		set TL.tamount = TD.tamount
when Not Matched by target then 
	insert values (userid,tamount)
when Not Matched by Source then 
	Delete ;

