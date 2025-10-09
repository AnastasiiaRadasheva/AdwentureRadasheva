Select * from DimEmployee
Select * from DimSalesTerritory

--39. View SQL serveris

--lisa view, vWITDepartment_Employees mis n�ed EmployeeKey, firstname, gender, sales territory Region

create View vWITDepartment_Employees
as
select EmployeeKey, FirstName, Gender, SalesTerritoryRegion
from DimEmployee t
join DimSalesTerritory tk
on t.SalesTerritoryKey= tk.SalesTerritoryKey 
where tk.SalesTerritoryRegion = 'Europe' 


select * from vWITDepartment_Employees




--lisa view, vWEmployeesNonConfidentialData mis n�ed EmployeeKey, firstname, gender, sales territory Region 
create view vWEmployeesNonConfidentialData
as
Select EmployeeKey, FirstName,
Gender,SalesTerritoryRegion
from DimEmployee t
join DimSalesTerritory tk
on t.SalesTerritoryKey= tk.SalesTerritoryKey 
--k�ivitama view
select * from vWEmployeesNonConfidentialData



--lisa view,vWEmployeesCountBySalesTerritory  mis n�ed sales territory Region, arv empoyees
create view vWEmployeesCountBySalesTerritory
as
Select SalesTerritoryRegion, count(EmployeeKey) as TotalEmployees
from DimEmployee t
join DimSalesTerritory tk
on t.SalesTerritoryKey= tk.SalesTerritoryKey 
group By SalesTerritoryRegion


--k�ivitama view
select * from vWEmployeesCountBySalesTerritory