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

go
create procedure usp_insereazaPetrecere(
@NumePetrecere varchar(50),
@Buget int,
@DataPetrecerii date,
@Spatiu varchar(50),
@NumeTip varchar(50)
)
as
BEGIN
	declare @TipId as int;
	set @TipId=0;
	select top 1 @TipId=t.TipID from TipPetrecere t where t.Nume=@NumeTip;
	if @TipId>0
		insert into Petrecere (Nume,Buget,Data,SpatiuOrganizare,TipID) values
		(@NumePetrecere,@Buget,@DataPetrecerii,@Spatiu,@TipId);
	else
	begin
		print @TipId;
		raiserror('Nume tip invalid',12,1);
	end
END;

exec usp_insereazaPetrecere 'Nume1',100,'2021-03-26','Spatiu1','Petrecere de Craciun'
exec usp_insereazaPetrecere 'Nume2',400,'2021-03-26','Spatiu1','non'
exec usp_insereazaPetrecere 'Party3',200,'2021-03-26','Spatiu1','Petrecere de Craciun'
exec usp_insereazaPetrecere 'Party3',200,'2021-04-26','Spatiu1','Petrecere de Craciun'

select * from Petrecere

go
create procedure usp_calculBuget(
@Tip varchar(50),
@Suma int OUTPUT
)
as
BEGIN
	declare @ID as int
	set @id=0
	select top 1 @ID=TipID from TipPetrecere where Nume = @Tip

	Select @Suma=Sum(Buget) from Petrecere where TipID=@ID
END;
declare @Rezultat as int
set @Rezultat=0
exec usp_calculBuget 'Petrecere de Craciun',@Suma=@Rezultat output
print @Rezultat

go
create procedure usp_getDupaData(
@Data date
)
as
BEGIN
	select  p.Nume,p.Buget,p.SpatiuOrganizare into getDupaDataResult from Petrecere p where p.Data=@Data 
	declare @TheCount as int
	select @TheCount=count(*) from getDupaDataResult
	if @TheCount=0
	BEGIN
		drop table getDupaDataResult
		raiserror('Nu exista petreceri la aceasta data',12,1);
	END
END;


exec usp_getDupaData '2021-05-26'
select * from getDupaDataResult
drop table getDupaDataResult

