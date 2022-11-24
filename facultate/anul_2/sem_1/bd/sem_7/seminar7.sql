create database Seminar7223
go
use Seminar7223
create table Judete
(
cod_j int primary key identity,
resedinta_De_judet varchar(100),
populatie int,
nume_prescurtat varchar(2)
);
--valori random pentru populatie
insert into Judete(resedinta_de_judet,populatie,nume_prescurtat)values
('Cluj-Napoca',700000,'CJ'),('Bihor',12345433,'BH'),('Botosani',40000,'BT'),('Suceava',600000,'SV'),
('Judet necunoscut',200000,'JN')
select * from Judete
--resedinta de judet contine numele judetului :( vom scrie un SELECT care
--afiseaza varianta corecta
SELECT nume_prescurtat,resedinta_corecta=Case nume_prescurtat
WHEN 'CJ' THEN 'Cluj-Napoca'
WHEN 'BH' THEN 'Oradea'
WHEN 'BT' THEN 'Botosani'
WHEN 'SV' THEN 'Suceava'
ELSE 'Nu se stie'
END,
judet=CASE nume_prescurtat
WHEN 'CJ' THEN 'Cluj'
WHEN 'BH' THEN 'Bihor'
WHEN 'BT' THEN 'Botosani'
WHEN 'SV' THEN 'Suceava'
end
from Judete

select * from Judete
alter table Judete
ADD tip_in_functie_de_populatie varchar(100)

UPDATE Judete SET tip_in_functie_de_populatie=(CASE
WHEN (populatie<=40000) THEN 'mic'
WHEN (populatie>40000 AND populatie<=200000) then 'mediu'
WHEN (populatie>200000 AND populatie<=600000) then 'mare'
WHEN (populatie>600000) then 'foarte mare'
--nespecificat
END)
select * from Judete