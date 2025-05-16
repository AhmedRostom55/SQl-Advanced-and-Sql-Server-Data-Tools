
---------------------------1
create function get_name_month(@date date)
returns varchar(20)
begin
	declare @name varchar(20)
	select @name= (format(@date,'MMMM') )
	return @name
end

select dbo.get_name_month('1/11/2001')


Create function get_month_name(@date date)
returns varchar(20)
begin 
	declare @month_name varchar(20)
	if month(@date) = 1
		select @month_name = 'January'
	else if  month(@date) = 2 
		select @month_name = 'February'
	if month(@date) = 3
		select @month_name = 'March'
	else if  month(@date) = 4
		select @month_name = 'April'
	if month(@date) = 5
		select @month_name = 'May'
	else if  month(@date) = 6
		select @month_name = 'June'
	if month(@date) = 7
		select @month_name = 'July'
	else if  month(@date) = 8
		select @month_name = 'August'
	if month(@date) = 9
		select @month_name = 'September'
	else if  month(@date) = 10 
		select @month_name = 'October'
	if month(@date) = 11
		select @month_name = 'November'
	else if  month(@date) = 12
		select @month_name = 'DecemberDecember'

	return @month_name
end 

select dbo.get_month_name('10/5/2001')

---------------------------2
create function get_values(@x int , @y int )
returns @t table (valuess int )
as 
	begin 
		Declare @val int = @x+1
		while  @val < @y
			begin
				insert into @t(valuess) values(@val)
				set @val = @val +1
			end 
		return
	end 

SELECT * FROM get_values(2, 10)

---------------------------3
create function get_deptname_StudName (@StudNo int)
Returns table 
as 
return
(
	select S.St_Fname+' '+S.St_Lname as Full_Name ,D.Dept_Name,s.St_Id  from Student S,Department D
	where S.Dept_Id=D.Dept_Id and S.St_Id=@StudNo

)

select * from get_deptname_StudName(10)


-------------------4

create function get_messages(@St_Id int)
returns varchar(30)
begin 
	declare @message varchar(50)
	declare @first_name varchar(50)
	declare @Last_name varchar(50)
	select @first_name=st_fname from Student where St_Id=@St_Id
	select @Last_name=St_Lname from Student where St_Id=@St_Id
	if @first_name is null  and @Last_name is null
		select @message = 'First name & last name are null'
	else if @first_name is null 
		select @message = 'first name is null'
	else if @Last_name is null
		select @message = 'last name is null'
	else
		select @message = 'First name & last name are not null'
	return @message 
end

select dbo.get_messages(14)

--------------------5
create function gets_info(@MRGID int)
returns table 
as 
return
(
select Dept_Name,Ins_Name as MangerName ,Manager_hiredate from Department D , Instructor INS
where INS.Ins_Id = D.Dept_Manager and  D.Dept_Manager = @MRGID
)

select *  from gets_info(3)

-----------------------------6

create function gets_Name(@string varchar(20))
returns @t table (name varchar(50)) 
as 
begin 
	if @string = 'first name' 
		insert into @t
		select  isnull(St_Fname,' ') from student
	else if @string = 'last name' 
		insert into @t 
		select isnull(St_lname,' ') from Student
	else if @string = 'full name' 
		insert into @t 
		select isnull(St_Fname,' ')+''+ isnull(St_lname,' ') as fullname from Student
	Return
End

SELECT * FROM gets_Name('full name')


-------------------------------7
select St_Id,substring(St_Fname,1,len(st_fname)-1) from Student


select  St_Id ,left( St_Fname,len(st_Fname)-1) from Student
