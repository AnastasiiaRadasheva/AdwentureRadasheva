
--87. Except operaator

Create Table TableA
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)


Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Insert into TableA values (4, 'John', 'Male')
Insert into TableA values (5, 'Sara', 'Female')

Create Table TableB
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)

Insert into TableB values (4, 'John', 'Male')
Insert into TableB values (5, 'Sara', 'Female')
Insert into TableB values (6, 'Pam', 'Female')
Insert into TableB values (7, 'Rebeka', 'Female')
Insert into TableB values (8, 'Jordan', 'Male')


select Id, Name, Gender
from TableA
except
select Id, Name, Gender
from TableB


Create table tblEmployees
(
    Id int identity primary key,
    Name nvarchar(100),
    Gender nvarchar(10),
    Salary int
)


Insert into tblEmployees values ('Mark', 'Male', 52000)
Insert into tblEmployees values ('Mary', 'Female', 55000)
Insert into tblEmployees values ('Steve', 'Male', 45000)
Insert into tblEmployees values ('John', 'Male', 40000)
Insert into tblEmployees values ('Sara', 'Female', 48000)
Insert into tblEmployees values ('Pam', 'Female', 60000)
Insert into tblEmployees values ('Tom', 'Male', 58000)
Insert into tblEmployees values ('George', 'Male', 65000)
Insert into tblEmployees values ('Tina', 'Female', 67000)
Insert into tblEmployees values ('Ben', 'Male', 80000)

--Order by nõuet võib kasutada ainult kord peale paremat päringut:

select Id, Name, Gender, Salary
from tblEmployees
where Salary>=50000
except
select Id, Name, Gender, Salary
from tblEmployees
where Salary>=60000
order by name




--88. Erinevus Except ja not in operaatoril


--Järgnev päring tagastab read vasakust päringust, mis ei ole paremas tabelis
select Id, Name, Gender from TableA
except
select Id, Name, Gender from TableB

--Sama tulemuse võib saavutada NOT IN operaatoriga:

select Id, Name, Gender from TableA
where Id NOT IN (select Id from TableB)



--tagastab read vasakust päringust, mis ei ole paremas tabelis(tblEmployees)
select Id, Name, Gender from tblEmployees
except 
select Id, Name, Gender from tblEmployees

select Id, Name, Gender from tblEmployees
where Id Not In (select Id from tblEmployees)


select Id, Name, Gender from tblEmployees
except 
select Id, Name, Gender from tblEmployees

select Id, Name, Gender from tblEmployees
where Id Not In (select Id from tblEmployees)




--98. Where ja Having erinevused

--tеabeli loomine
create table Sales (
  Product nvarchar(50),
  SaleAmount int)

insert into Sales values ('Iphone', 500)
insert into Sales values ('Laptop', 800)
insert into Sales values ('Iphone', 1000)
insert into Sales values ('Speakers', 400)
insert into Sales values ('Laptop', 600)

--müügimaht kokku kahanevas järjekorras
select Product, Sum(SaleAmount) as TotalSales
from Sales
Group by Product

--kus müük kokku on suurem kui 1000€
select Product, Sum(SaleAmount) as TotalSales
from Sales
Group by Product
Having Sum(SaleAmount) > 1000

--süntaksivea
select Product, SUM (SaleAmount) as TotalSales
from Sales
Group by Product
WHERE Sum(SaleAmount) > 1000
