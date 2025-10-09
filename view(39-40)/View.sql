Select * from DimEmployee
Select * from DimSalesTerritory

--39. View SQL serveris

--lisa view, vWITDepartment_Employees mis näed EmployeeKey, firstname, gender, sales territory Region

create View vWITDepartment_Employees
as
select EmployeeKey, FirstName, Gender, SalesTerritoryRegion
from DimEmployee t
join DimSalesTerritory tk
on t.SalesTerritoryKey= tk.SalesTerritoryKey 
where tk.SalesTerritoryRegion = 'Europe' 


select * from vWITDepartment_Employees




--lisa view, vWEmployeesNonConfidentialData mis näed EmployeeKey, firstname, gender, sales territory Region 
create view vWEmployeesNonConfidentialData
as
Select EmployeeKey, FirstName,
Gender,SalesTerritoryRegion
from DimEmployee t
join DimSalesTerritory tk
on t.SalesTerritoryKey= tk.SalesTerritoryKey 
--käivitama view
select * from vWEmployeesNonConfidentialData



--lisa view,vWEmployeesCountBySalesTerritory  mis näed sales territory Region, arv empoyees
create view vWEmployeesCountBySalesTerritory
as
Select SalesTerritoryRegion, count(EmployeeKey) as TotalEmployees
from DimEmployee t
join DimSalesTerritory tk
on t.SalesTerritoryKey= tk.SalesTerritoryKey 
group By SalesTerritoryRegion


--käivitama view
select * from vWEmployeesCountBySalesTerritory