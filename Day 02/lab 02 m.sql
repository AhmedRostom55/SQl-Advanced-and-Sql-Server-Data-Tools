---1
select * from Employee
---2
select Fname,Lname,Salary,Dno from Employee
---3
select Pname,Plocation,Dnum from Project 
---4
select Fname+' '+Lname as fullname , salary *12 * 0.10  as ANNUAL_SALARY FROM Employee
---5
SELECT SSN ,Fname+' '+Lname as fullname FROM Employee
WHERE Salary>1000
---6
SELECT SSN ,Fname+' '+Lname as fullname FROM Employee
WHERE Salary*12>10000
---7
SELECT Fname+' '+Lname as fullname ,SALARY FROM Employee
WHERE SEX='F'
---8
SELECT DNUM,DNAME FROM Departments
WHERE MGRSSN=968574
---9
SELECT PNUMBER ,PNAME,PLOCATION FROM Project
WHERE DNUM = 10