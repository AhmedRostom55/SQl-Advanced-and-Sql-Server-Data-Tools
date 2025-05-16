------1
select SalesOrderID ,ShipDate from sales.SalesOrderHeader
where OrderDate between '7/28/2002' and '7/29/2014'
------2
Select ProductID,Name from production.Product
where StandardCost < '110.00'
-----3
Select ProductID,Name from production.Product
where Weight is null
-----4
Select * from production.Product
where Color in ('Silver','Black', 'Red' )
------5
Select * from production.Product
where Name like 'B%'
----6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

Select * from Production.ProductDescription
where Description like '%[_]%'

------7
select OrderDate,sum(TotalDue) as TotalDue from Sales.SalesOrderHeader
where OrderDate  between  '7/1/2001' and '7/31/2014'
group by OrderDate

----8
select distinct hiredate from HumanResources.Employee
----9
Select avg(Distinct ListPrice) from production.Product
-----10
Select concat('the [',name ,'] is only!',' [',listprice,']' )from production.Product
where ListPrice between 100 and 120
order by ListPrice

------11
Select rowguid,Name, SalesPersonID, Demographics into store_Archive
from Sales.Store

select * from store_Archive

Select rowguid,Name, SalesPersonID, Demographics into store_Archive1
from Sales.Store
where 1=2

----12
select CONVERT(varchar(20),GETDATE(),102)
union
select CONVERT(varchar(20),GETDATE(),103)
union
select CONVERT(varchar(20),GETDATE(),104)
union
select CONVERT(varchar(20),GETDATE(),105)
union
select CAST(getdate()as varchar(20))
union
select format(GETDATE(),'MMMM/DDDD,YYYY')
union
select format(GETDATE(),'MM/DD,YY')
union
select format(GETDATE(),'MMM/DDD,YY')
union
select format(GETDATE(),'hh:mm:ss')
union
select format(GETDATE(),'HH')
union
select format(GETDATE(),'hh:tt')
union
select format(GETDATE(),'MMMM/DDDD,YYYY hh:mm:ss ')

----------13
select @@VERSION
select @@SERVERNAME
