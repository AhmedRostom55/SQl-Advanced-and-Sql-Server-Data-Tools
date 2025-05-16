-----1
select count(St_id) as number_of_students_who_have_age_value  from Student
where St_Age is not null
-----2
select Distinct Ins_Name from Instructor
-----3
select ISNULL(St_Id,'no ID') as Student_ID,ISNULL(St_Fname+' '+St_Lname ,'no name') as Student_Full_Name,ISNULL(Dept_Name,'No Department') as Department_Name
from Student S,Department D
where D.Dept_Id=S.Dept_Id
-----4
select Ins_Name ,Dept_Name from Instructor INS
left outer join Department D
on D.Dept_Id=INS.Dept_Id
------5
select St_Fname+' '+St_Lname as fullName , C.Crs_Name   from Student S ,Stud_Course SC,Course C
where S.St_Id=SC.St_Id and C.Crs_Id=SC.Crs_Id and Grade is not Null 
-----6
select T.Top_Name, count(Crs_Id) courses_Number from Course c,Topic T
where T.Top_Id=c.Top_Id 
group by Top_Name
------7
Select MAX(salary) as Max_Salary ,Min(salary) as Min_Salary From Instructor
-----8
Select Ins_Name From Instructor
where Salary <(select avg(salary) from Instructor)


-----9
Select Dept_Name,Ins_Name From Instructor  INS, Department D
where D.Dept_Id=INS.Dept_Id and Salary =(select Min(salary) from Instructor)
----10
Select Top(2) salary as MAX_Salary from  Instructor
order by Salary desc
------11
Select Ins_Name, coalesce(salary,'Bounce') from  Instructor
------12
select avg(Salary)from Instructor
------13
Select S.St_Fname ,SP.*
from Student S ,Student SP
where Sp.St_Id=S.St_super
-----14
select *  From (select *,ROW_NUMBER() over(partition by dept_id order by salary Desc)  as RN from Instructor ) as Newtable
where RN <=2
-----15
select *  From (select *,ROW_NUMBER() over(partition by dept_id order by NewID())  as Random from Instructor ) as Newtable
where Random =1
