
------------------------------------1

use [SD32-Company]
declare C cursor 
for select salary from Human_Resource.Employee
for update 
declare @sal int 
open C
fetch C into @sal
while @@FETCH_STATUS= 0
begin
	if @sal <3000
		update Human_Resource.Employee
			set Salary =@sal* 1.1
		where current of C
	else if @sal >=3000
		update Human_Resource.Employee
			set salary = @sal * 1.2
		where current of C
	fetch C into @sal
end
Select @sal
close C
deallocate C

--------------------------------------2

use ITI
declare c2 cursor 
for select D.Dept_Name,D.Dept_Manager from Department D 
for read only
declare @deptName varchar(50),@ManagerID int,@ManagerName varchar(50)
open c2
fetch c2 into @deptName ,@ManagerID
    PRINT 'Dept|MGRName';
    PRINT '----|-------';
while @@FETCH_STATUS=0
	begin
		select @ManagerName=ins.Ins_Name from Instructor ins
		where Ins.Ins_Id=@ManagerID
		PRINT @DeptName + ' | ' + ISNULL(@ManagerName, 'No Manager');
		fetch c2 into @deptName ,@ManagerID
	end
close c2
Deallocate c2

-----------------------3

Use ITI
declare C3  Cursor 
for Select St_Fname from Student where St_Fname is not null
for read only
declare @allnames varchar(max) ,@name varchar(50)
open C3
fetch C3 into @name
while @@FETCH_STATUS=0
	begin
		set @allnames=CONCAT(@allnames,',',@name)
		fetch C3 into @name
	end
select @allnames
close C3
Deallocate C3


------------------4

backup Database Company_SD
To Disk ='D:\Data analysis\Resources\ITI SQL\ms sql\iti\day10.BaK'

backup Database Company_SD
To Disk ='D:\Data analysis\Resources\ITI SQL\ms sql\iti\day10.BaK'
with Differential 

-----------------------7

create Database CompanySD_Snapshot
on 
(
	name ='Company_SD',
	filename='d:\Company_SDsnap.ss'
)
as Snapshot of Company_SD
------------------------------9
CREATE SEQUENCE Seq_1_to_10
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 10
    NO CYCLE;

CREATE TABLE TestSeqTable (
    ID INT PRIMARY KEY,
    ValueFromSeq INT
);

INSERT INTO TestSeqTable (ID, ValueFromSeq)
VALUES (1, NEXT VALUE FOR Seq_1_to_10),
       (2, NEXT VALUE FOR Seq_1_to_10),
       (3, NEXT VALUE FOR Seq_1_to_10);

SELECT current_value  
FROM sys.sequences  
WHERE name = 'Seq_1_to_10';

