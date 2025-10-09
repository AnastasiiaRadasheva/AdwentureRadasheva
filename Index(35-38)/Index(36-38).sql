--36. Klastreeritud ja mitte-klastreeritud indeksid

--tabeli loomine(tblEmployee)
--(Primaarvõtme piirang loob automaatselt klastreeritud indeksid)
create table tblEmployee1
(
id int primary key,
name nvarchar(50),
salary int, 
gender nvarchar(10),
city nvarchar(50)
)

--Kui soovid kindel olla, siis kasuta koodi execute sp_helpindex tblEmployee, 
--mis näitab uniklaaset klastreeritud indeksi loomist Id veerus.
execute sp_helpindex tblEmployee1

insert into tblEmployee1 (id, name, salary, gender, city)
values
(1, 'Anna Tamm',     2500, 'Female', 'Tallinn'),
(2, 'Mati Kask',     3100, 'Male',   'Tartu'),
(3, 'Liis Saar',     2800, 'Female', 'Narva'),
(4, 'Karl Põld',     3600, 'Male',   'Pärnu'),
(5, 'Mari Sepp',     2900, 'Female', 'Viljandi'),
(6, 'Jaan Jõgi',     4100, 'Male',   'Tallinn')

Select * from tblEmployee1


--indeksi loomine(viga)
create clustered Index IX_tblEmployee_Name
on tblEmployee1(Name)

--indeksi kustutamine
Drop index tblEmployee.PK__tblEmplo__3213E83FDC9DFEC7

--indeksi loomine veergudele gender ja salary
CREATE NONCLUSTERED INDEX IX_tblEmployee_Gender_Salary
ON tblEmployee1(Gender DESC, Salary ASC);

--indeksi loomine nime jaoks
DROP INDEX IX_tblEmployee_Name ON tblEmployee1;


EXEC sp_helpconstraint 'tblEmployee1';


--37. Unikaalne ja mitte-unikaalne indeks
--indeksi loomine veeru Id jaoks
create clustered Index IX_tblEmployee_Id
on tblEmployee(Id)

--esmase võtme kontroll
execute sp_helpindex tblEmployee;

--veeru Id indeksi kustutamine
drop index tblEmployee.IX_tblEmployee_Id


--unikaalne indeks, mis tagab, et veerus Name ei esineks korduvaid andmeid
create unique NonClustered Index UIX_tblEmployee_Name
on tblEmployee(Name)

--unikaalse piirangu lisamine veerule City
alter table tblEmployee
add constraint UQ_tblEmployee_City
Unique NonClustered (City)


execute sp_helpconstraint tblEmployee;

--indeks, mis ei luba veerus korduvaid andmeid
Create unique Index IX_tblEmployee_City
On tblEmployee(City)
with ignore_dup_key



--38. Indeksi plussid ja miinused
--mitte-klastreeritud indeks Salary veerule

create NonClustered Index IX_tblEmployee_Salary
on tblEmployee (Salary Asc)


select * from tblEmployee where Salary > 4000 and Salary < 8000
delete from tblEmployee where Salary=2500
update tblEmployee set Salary = 9000 where Salary = 7000

--palga sortimine kasvavas järjekorras
select * from tblEmployee order by Salary

--palga sortimine kahanevas järjekorras
select * from tblEmployee order by Salary desc

--GROUP BY Salary indeksi abil
select Salary, COUNT(Salary) as Total
from tblEmployee
group by Salary

