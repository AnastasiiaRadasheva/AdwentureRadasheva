--funktsionid


select * from DimEmployee;


--Tabelisisev��rtusega funktsioon e Inline Table Valued function (ILTVF) koodin�ide:

create function fn_ILVF_GetEmployees()

returns table
as
return(select EmployeeKey, FirstName, cast(BirthDate as Date)as DOB
from DimEmployee);

--kaivita funktrsiooni 
select * from fn_ILVF_GetEmployees()





--Mitme avaldisega tabeliv��rtusega funktsioonid e multi-statement table valued function (MSTVF):
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



--Skaleeritav funktsioon ilma kr�pteerimata:
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



--N��d muudame funktsiooni ja kr�pteerime selle �ra:

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

