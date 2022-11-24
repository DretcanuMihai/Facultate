create database Seminar3;
go
use Seminar3;
go

create table TipPetrecere(
TipID int primary key identity,
Nume varchar(50),
Descriere varchar(50)
)

create table Petrecere(
PetrecereID int primary key identity,
Nume varchar(50),
Buget int,
Data date,
SpatiuOrganizare varchar(50),
TipID int foreign key references TipPetrecere(TipID)
)

create procedure usp_insereazaTip(
@Nume varchar(50),
@Descriere varchar(50)
)
as
BEGIN
	insert into TipPetrecere(Nume,Descriere) values
	(@Nume,@Descriere)
END;
go

exec usp_insereazaTip 'Petrecere de Halloween','Infricosatoare';
exec usp_insereazaTip 'Petrecere de Craciun','Petrecere la care vine Mos Craciun';
exec usp_insereazaTip 'Petrecere aniversara','Serbeaza ziua de nastere a unei persoane'

select * from TipPetrecere