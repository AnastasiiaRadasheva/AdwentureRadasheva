

--loome Local tabeli PersonDetails 

create table #PersonDetails1(Id int, Name nvarchar(20))
insert into #PersonDetails1 values(1, 'Mike')
insert into #PersonDetails1 values (2, 'John')
insert into #PersonDetails1 values (3, 'Todd')
select * from #PersonDetails1



--c
Select name from tempdb..sysobjects
where name like '#PersonDetails1%'


--tabeli kustutamine
drop table #PersonDetails1



--protseduuri loomine kohaliku tabeli loomiseks
Create procedure spCreateLocalTempTable
as
begin
Create table #PersonDetails1(Id int, Name nvarchar(20))
insert into #PersonDetails1 values(1, 'Mike')
insert into #PersonDetails1 values (2, 'John')
insert into #PersonDetails1 values (3, 'Todd')
select * from #PersonDetails1
end

--käivitamine
exec spCreateLocalTempTable;



--globaalse ajutise tabeli loomine
create table ##EmployeeDetails (Id int, Name nvarchar(20))
