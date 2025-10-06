--funktsionid


select * from DimEmployee;


--Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF) koodinäide:

create function fn_ILVF_GetEmployees()

returns table
as
return(select EmployeeKey, FirstName, cast(BirthDate as Date)as DOB
from DimEmployee);

--kaivita funktrsiooni 
select * from fn_ILVF_GetEmployees()





--Mitme avaldisega tabeliväärtusega funktsioonid e multi-statement table valued function (MSTVF):
create function fn_ILVF_GetEmployees()
returns @table table(employeekey int, firstname nvarchar(20), dob date)
as
begin
insert into @table
select 
      employeekey, 
        firstname, 
        cast(birthdate as date)
from dimemployee;

return;
end;
go


--kaivita funktrsiooni 
select * from fn_ILVF_GetEmployees()


--FUNK #33



--Skaleeritav funktsioon ilma krüpteerimata:
create function fn_getemployeenamebyId1(@employeekey int)
returns nvarchar(20)
as
begin
    return (
        select firstname 
        from dimemployee 
        where employeekey = @employeekey
    )
end;
go

--kaivita funktrsiooni 
select dbo.fn_getemployeenamebyid1(3);



--Nüüd muudame funktsiooni ja krüpteerime selle ära:

alter function fn_getemployeenamebyid1(@employeekey int)
returns nvarchar(20)
with encryption
as
begin
    return (
        select firstname 
        from dimemployee 
        where employeekey = @employeekey
    );
end;
go


--kaivita funktrsiooni 
select dbo.fn_getemployeenamebyid1(10);




--Loome funktsiooni WITH SCHEMABINDING valikuga

create function dbo.fn_getemployeenamebyid_sb(@employeekey int)
returns nvarchar(20)
with schemabinding
as
begin
    declare @name nvarchar(20);

    select @name = firstname
    from dbo.DimEmployee
    where employeekey = @employeekey;

    return @name;
end;
go


--kaivita funktrsiooni 
select dbo.fn_getemployeenamebyid_sb(10);


--Proovi tabelit kustutada
drop table dbo.DimEmployee;
--SQL Server kuvab vea:
--Cannot drop table 'dbo.DimEmployee' because it is being referenced by object 'fn_getemployeenamebyid_sb'.
