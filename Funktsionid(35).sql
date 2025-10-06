
select * from DimCustomer;

--Soovime leida k�ik t��lised, kelle palk on vahemikus 20000 kuni 70000. 
Select * from DimCustomer where YearlyIncome > 20000 and YearlyIncome < 70000

--N��d loome indeksi, mis aitab p�ringut
create index IX_tbDimCustomer_Salary
on DimCustomer ( YearlyIncome asc)

--vaadata indeksit
execute sp_helptext DimCustomer

--kustutada indeksit
drop index DimCustomer.IX_tblDimCustomer_Salary