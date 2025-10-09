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


--käivitama vieww
select * from vWEmployeesCountBySalesTerritory





--40. View uuendused


--päring uuendab Name veerus olevat nime Mike Mikey peale
update vWEmployeesNonConfidentialData
set FirstName = 'Mikey' Where EmployeeKey = 2
select * from vWEmployeesNonConfidentialData



--Samas on võimalik kustutada ridu baastabelis ning kasutada view-d.
delete from vWEmployeesNonConfidentialData where EmployeeKey = 2
select * from vWEmployeesNonConfidentialData



-- Loome view, mis ühendab kaks eelpool käsitletud tabelit ja annab sellise tulemuse
create view vwEmployeesDetailsByCountry
as 
Select EmployeeKey, FirstName, Gender,SalesTerritoryRegion
from DimEmployee t
join DimSalesTerritory tk
on t.SalesTerritoryKey= tk.SalesTerritoryKey 

select * from vwEmployeesDetailsByCountry
--uuendamine
update vwEmployeesDetailsByCountry
set SalesTerritoryRegion = 'Canada' where FirstName = 'John'
select * from vwEmployeesDetailsByCountry