--funktsionid


select * from DimEmployee;


--Tabelisisev‰‰rtusega funktsioon e Inline Table Valued function (ILTVF) koodin‰ide:

create function fn_ILVF_GetEmployees()

returns table
as
return(select EmployeeKey, FirstName, cast(BirthDate as Date)as DOB
from DimEmployee);

--kaivita funktrsiooni 
select * from fn_ILVF_GetEmployees()



