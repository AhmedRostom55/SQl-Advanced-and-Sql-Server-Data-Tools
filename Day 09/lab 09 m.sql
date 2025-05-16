-----------------------------1
select * from HumanResources.Employee
for xml raw('employee'),elements,root('employee')

select * from HumanResources.Employee
for xml raw('employee'),root('employee')

--------------------------2
select Dept_Name,Ins_Name from Department D,Instructor ins
where D.Dept_Id=ins.Dept_Id
for xml auto

select Dept_Name,Ins_Name from Department D,Instructor ins
where D.Dept_Id=ins.Dept_Id
for xml path
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
create proc num_of_emp
as
	declare @x int
	select @x=count(E.EmpNo) from HumanResource.Employee E , Works_on W,Company.Project p
	where E.EmpNo=W.EmpNo and P.ProjectNo=W.ProjectNo  and P.ProjectNo='p1'
	if @x >3
		select 'he number of employees in the project p1 is 3 or more'
	else 
		select 'The following employees work for the project p1'+' ' 
		union all
		select e.Fname+' '+E.Lname from HumanResource.Employee E , Works_on W,Company.Project p
		where E.EmpNo=W.EmpNo and P.ProjectNo=W.ProjectNo and P.ProjectNo='p1'

num_of_emp


-----------------------6
create proc update_inf @oldemp int ,@newemp int,@pno varchar(20)
as
	update Works_on
		set EmpNo =@newemp
	where EmpNo=@oldemp and ProjectNo=@pno

update_inf 2581,29346,'p2'

--------------------------7
create table  hist
(
projectNo varchar(20),
UserName varchar(255),
ModifiedDate Date,
Budget_Old int,
Budget_New int
)

create Trigger T23
on company.Project
after update
as 
	if update(budget)
		begin
			declare @new int , @old int ,@PNo varchar(255)
			Select @PNo=ProjectNo ,@new=Budget from inserted
			select @old=Budget from deleted
			insert into hist
			values(@PNo,SUSER_NAME(),GETDATE(),@old,@new)
		end

update Company.Project
	set Budget = 50005000
where ProjectNo='p2'

select * from hist

--------------------------8
CREATE trigger t2 
on department 
instead of insert
as 
	select 'Print a message for user to tell him that he can’t insert a new record in that table'

insert into Department(Dept_Id) values(10)

--------------------------9

CREATE trigger t4 
on HumanResource.Employee
instead of insert
as 
begin
	if format (GETDATE(),'mmmm') ='March' 
		 begin
			select 'Not allowed'
			rollback transaction
		 end
	else 
		 begin
			insert into HumanResource.Employee
			select * from inserted
		 end
end

insert into HumanResource.Employee
VALUES(101, 'Ahmed', 'Sayed','d1',1000);

select * from Company.Department
select * from HumanResource.Employee
------------------10
CREATE trigger t4 
on Database
after ALTER_TABLE 
as
begin
	select 'Not allowed'
	rollback
end

alter table works_on add  newc int

-----------------------------11
create table studu
 (
 server_username varchar(50),
 datee date,
 note varchar(255)
 )

 create trigger t100
 on student
 after insert
 as
	begin
		declare @x int
		select @x=St_Id from inserted
		insert into studu values(SUSER_NAME(),GETDATE(),SUSER_NAME()+'Insert New Row with Key='+cast(@x as varchar(20))+'in table Student')
	end

INSERT INTO Student (St_Id, St_Fname, St_Age)
VALUES (101, 'Ahmed', 23);

select  * from Studu
 ----------------------------12
create trigger t20
on student 
instead of delete 
as
	begin 
		declare @x int
		select @x=st_id from deleted
		insert into studu values(SUSER_NAME(),GETDATE(),'try to delete Row with Key='+cast(@x as varchar(50)))
	end

DELETE FROM Student WHERE St_Id = 101;

SELECT * FROM studu;
