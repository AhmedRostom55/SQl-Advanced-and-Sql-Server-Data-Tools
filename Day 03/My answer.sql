----1
Select Dnum,Dname,superssn,Fname from Departments D
inner join Employee E 
on E.ssn=D.MGRSSN

----2
select Dname ,pname from Departments D , Project P
where D.Dnum= P.Dnum

----3
Select Fname+' '+lname as fullname , DP.* from Employee E , Dependent DP
where E.SSN=DP.ESSN

----4
Select Pnumber,Pname,Plocation from Project
where City='cairo' or City='ALex'
----5
select * from Project
where Pname like'a%'
----6
Select * from Employee
where Dno=30 and Salary between 1000 and 2000
---7
Select E.* from Employee E inner join Works_for W 
on e.SSN=w.ESSn
inner join Project p
on p.Pnumber=W.Pno
where  p.Dnum =10 and W.Hours>=10 and p.Pname='AL Rabwah'

----8
Select x.Fname as EMPName, y.Fname+' '+y.Lname as Supername
from Employee x ,Employee y 
where y.SSN= x.Superssn and y.fname='Kamel' 

----9
Select E.fname,P.Pname from Employee E ,Project P
where  E.Dno=P.Dnum
order by  p.Pname

----10

Select P.pnumber,D.DName,E.Lname,e.address,e.Bdate from Project P inner join Departments D
on D.Dnum=P.Dnum
inner join Employee E 
on E.SSN=D.MGRSSN
where p.City='Cairo'

----11
Select E.* from Employee E,Departments D
where e.SSN=D.MGRSSN

----12
Select E.* from Employee E Left outer join Dependent D
on e.SSN=D.ESSN

----13
insert into Employee(Dno,SSN,Superssn,Salary)
values(30,102672,112233,3000)

----14
insert into Employee(Fname,Lname,SSN,Bdate,Address,Sex,Dno)
values('Mahmoud','Hamdy',102660,8/20/1995,'Qalamsha','m',30)

-----15

update Employee
	set Salary=Salary*1.20
where Fname='Mahmoud' and Lname='Hamdy'