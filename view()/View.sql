Select * from DimEmployee
Select * from DimSalesTerritory


--lisa view, vWITDepartment_Employees mis näed EmployeeKey, firstname, gender, sales territory Region

create View vWITDepartment_Employees
as
select EmployeeKey, FirstName, Gender, SalesTerritoryRegion
from DimEmployee t
join DimSalesTerritory tk
on t.SalesTerritoryKey= tk.SalesTerritoryKey 
where tk.SalesTerritoryRegion = 'IT' 


select * from vWITDepartment_Employees