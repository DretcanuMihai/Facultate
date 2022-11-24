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