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
select E.* from Employee E,Works_on W,Project P
where E.SSN=W.ESSn and W.Pno=P.Pnumber
order by E.Dno,E.Lname,E.Fname

----8
select MAX(salary) from Employee
union all
select max(salary) from Employee
where Salary not in (select MAX(salary) from Employee)

---------9
select Fname+' '+Lname as Fullname from Employee
where fname in (select Dependent_name from Dependent)

-----10
update Employee
	set Salary *= 1.3
from Employee E,Works_on W,Project P
where E.SSN=W.ESSn and W.Pno=P.Pnumber and P.Pname='Al Rabwah'

------11

select fname,lname,SSN from Employee
where ssn in (select ESSN from Dependent)

select fname,lname,SSN from Employee E
where Exists(
	select 1 from Dependent D
	where E.SSN=D.ESSN
)


----12
insert into Departments
values ('DEPT IT' ,100,112233,'1-11-2006' )

----13

update Departments set  MGRSSN=968574 where Dnum=100
update Departments set  MGRSSN=112233 where Dnum=20
update Employee set Superssn =102672 where SSN=102660

-----14
delete from Dependent
where ESSN=223344

update Departments 
	set MGRSSN=102672
where MGRSSN=223344

update Employee
	set Superssn=102672
where Superssn = 223344

delete from Works_on
where ESSn=223344

delete from Employee
where ssn=223344
