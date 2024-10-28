-----------------------------1
select * from Human_Resource.employee
for xml raw('employee'),elements,root('employee')


--------------------------2
select dept_name ,ins_name 
from instructor,Department
where Department.dept_id = instructor.dept_id
for XML  auto

----------------------------3
declare @docs xml ='<customers>
              <customer FirstName="Bob" Zipcode="91126">
                     <order ID="12221">Laptop</order>
              </customer>
              <customer FirstName="Judy" Zipcode="23235">
                     <order ID="12221">Workstation</order>
              </customer>
              <customer FirstName="Howard" Zipcode="20009">
                     <order ID="3331122">Laptop</order>
              </customer>
              <customer FirstName="Mary" Zipcode="12345">
                     <order ID="555555">Server</order>
              </customer>
       </customers>'
	   declare @hdocs int
	   exec sp_xml_preparedocument @hdocs output , @docs
	   select * from 
	   openxml(@hdocs,'//customer')
	   with(c_name varchar(max) '@FirstName',

	   zip_code int '@Zipcode',
	   order_id int 'order/@ID',
	   orders varchar(max) 'order'
	   )
	   exec sp_xml_removedocument @hdocs

------------------------------4
create proc num_per_DB 
as 
	select dept_name ,count(St_Id) from Student S,Department D
	where D.dept_id = s.Dept_Id
	group by Dept_Name

num_per_DB 

---------------------------5
create proc num_of_employee 
as 
	declare @x int 
	Select @x=count(E.EmpNo) from Human_Resource.Employee E,Works_on W
	where E.EmpNo=W.EmpNo and  projectno='p1'
if ( @x>=3)
	Select 'The number of employees in the project p1 is 3 or more'
else
	select 'The following employees work for the project p1',' '
union 
Select E.Emp_fname,E.Emp_lname from Human_Resource.Employee E,Works_on W
where E.EmpNo=W.EmpNo and projectno='p1'

num_of_employee 


-----------------------6
create proc employee @oldEmp int  , @newEmp int ,@projectNum int 
as 
	update Works_on 
		set EmpNo=@newEmp ,ProjectNo=@projectNum
	where EmpNo=@oldEmp

employee 5,5,1


--------------------------7
create table  history 
(
projectNo varchar(20),
UserName varchar(20),
ModifiedDate Date,
Budget_Old int,
Budget_New int
)

insert into history
values('p2','Dbo','2008-01-31',95000,200000)

create trigger t1
on company.project
for update 
as 
begin
	declare @projectnum varchar(20),@newbudjet int,@oldbudjet int 
	select @projectnum = ProjectNo from inserted 
	select @newbudjet = budget from inserted 
	select @oldbudjet = Budget from deleted
	insert into history values (suser_name(),getdate(),@projectnum,@newbudjet,@oldbudjet)
end


--------------------------8
CREATE trigger t2 
on department 
instead of insert
as 
	select 'Print a message for user to tell him that he can’t insert a new record in that table'

insert into Department(Dept_Id) values(10)

--------------------------9

CREATE trigger t3 
on company.department
instead of insert
as 
 if format (GETDATE(),'mmmm') ='March' 
	select 'Not allowed'

insert into company.department(DeptNo) values('10')

------------------10
CREATE trigger t4 
on Database
for ALTER_TABLE 
as
begin
	select 'Not allowed'
	rollback
end

alter table works_on add  newc int

-----------------------------11
 create table student_auditt
 (
 server_username varchar(50),
 datee date,
 note varchar(50)
 )

 create trigger t8
 on student
 after insert 
 as
 declare @x int
 select  @x =st_id from inserted
 insert into student_auditt  values(suser_name(),getdate(),@x)

 ----------------------------12
 create trigger t9
 on student
 instead of delete  
 as
 declare @x int
 select  @x =st_id from inserted
 insert into student_audit values(suser_name(),getdate(),@x)

