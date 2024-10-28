----1
select D.Dependent_name,D.sex from Employee E
inner join Dependent D 
on E.SSN=D.ESSN and D.sex='f' and e.Sex='f'
union
select D.Dependent_name,D.sex from Employee E
inner join Dependent D 
on E.SSN=D.ESSN and D.sex='m' and e.Sex='m'


----2
Select P.pname , sum(hours) as total_hours_per_week   from Project P 
inner join Works_on W
on P.Pnumber=W.Pno
group by p.Pname

----3
Select D.* from Departments D,Employee E
where D.Dnum=E.Dno and SSN=(select min(ssn) from Employee )

-----4
Select D.Dname,Min(Salary) as Min_salary,max(Salary) as Max_salary,AVG(salary) as AVG_salary from Departments D,Employee E
where D.Dnum=E.Dno
group by D.Dname

-----5
select E.Lname from Employee E
inner join Departments D
on  E.SSN=D.MGRSSN
Left  join Dependent Dp
on E.SSN=Dp.ESSN
where DP.ESSN is null

-----6
Select Dnum,Dname,count(ssn)as employee_Number from Departments D,Employee E
where D.Dnum=E.Dno
group by Dnum,Dname
having avg (Salary)<(select avg(Salary) from Employee)

----7
select fname+' '+lname as Fullname ,Pname from Employee E, Departments D ,Project P
where D.Dnum=E.Dno and E.Dno=P.Dnum
order by E.Dno,e.Lname
,E.Fname
----8
select top(2) salary from Employee
order by Salary desc

select MAX(salary) from Employee
union all
select max(salary) from Employee
where Salary not in (select MAX(salary) from Employee)

---------9
select Fname+' '+Lname as Fullname from Employee
where fname in (select Dependent_name from Dependent)

-----10
update Employee 
set Salary+=(.3*Salary)
from Employee,Works_on,Project
where ssn=ESSn and Pnumber=pno and Pname='al rabwah'

------11

select fname,lname,SSN from Employee
where ssn in (select ESSN from Dependent)




----12
insert into Departments
values ('DEPT IT' ,100,112233,'1-11-2006' )

----13

update Departments set  MGRSSN=968574 where Dnum=100
update Departments set  MGRSSN=112233 where Dnum=20
update Employee set Superssn =102672 where SSN=102660

-----14
Select * from Dependent
where ESSN = 2233444

Select * from Departments
where MGRSSN = 2233444

select * from Employee
Where Superssn =  2233344

select * from Works_on
Where ESSn =  2233344

delete from Employee
where ssn = 223344