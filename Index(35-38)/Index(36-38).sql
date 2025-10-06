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