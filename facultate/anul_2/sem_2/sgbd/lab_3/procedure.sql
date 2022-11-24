go;
use RoundTheGlobe;
go;
drop table LogTable;
CREATE TABLE LogTable(
Lid INT IDENTITY PRIMARY KEY,
TypeOperation VARCHAR(50),
TableOperation VARCHAR(50),
ExecutionDate DATETIME)

go;
--function for testing names
--a name is a varchar(50) and it must be not null
create or alter function dbo.TestVC50(@name varchar(50))
returns int
as
begin
	declare @retval int
	set @retval=0 --default, if it's good
	if @name is null 
		set @retval=1 -- if it's null

	return @retval
end
go;

--function for testing an artist ID--
--an artist ID is valid if not null and an artist with given ID exists
create or alter function dbo.TestArtistId(@artistID int)
returns int
as
begin
	declare @retval int
	set @retval=0 --default, if it's good
	if @artistID is null 
		set @retval=1 -- if it's null
	else if not exists(select * from Artist where ArtistID=@artistID)
		set @retval=2 -- it no artist with given id exists
	return @retval
end
go;

--function for testing a positive integer--
--a price is valid if not null and positive
create or alter function dbo.TestPositive(@number int)
returns int
as
begin
	declare @retval int
	set @retval=0 --default, if it's good
	if @number is null 
		set @retval=1 -- if it's null
	else if @number<=0 
		set @retval=2 -- if it's not positive

	return @retval
end
go;

--function for testing a tour ID--
--a tour ID is valid if not null and a tour with given ID exists
create or alter function dbo.TestTourId(@tourID int)
returns int
as
begin
	declare @retval int
	set @retval=0 --default, if it's good
	if @tourID is null 
		set @retval=1 -- if it's null
	else if not exists(select * from Tour where TourID=@tourID)
		set @retval=2 -- it no tour with given id exists
	return @retval
end
go;

--function for testing a venue ID--
--a venue ID is valid if not null and a venue with given ID exists
create or alter function dbo.TestVenueId(@venueID int)
returns int
as
begin
	declare @retval int
	set @retval=0 --default, if it's good
	if @venueID is null 
		set @retval=1 -- if it's null
	else if not exists(select * from Venue where VenueID=@venueID)
		set @retval=2 -- it no venue with given id exists
	return @retval
end
go;

--function for testing dates
--a date is valid if not null
create or alter function dbo.TestDate(@date date)
returns int
as
begin
	declare @retval int
	set @retval=0 --default, if it's good
	if @date is null 
		set @retval=1 -- if it's null

	return @retval
end
go;

--function for inserting Song-Play-Concert all rollback--
create or alter procedure addSongConcertPlay @songName varchar(50), @artistID int, @minutes int, @genre varchar(50),
@tourID int,@venueID int,@concertdate date AS 
BEGIN
	BEGIN TRAN
		BEGIN TRY
			IF dbo.TestVC50(@songName) != 0
				RAISERROR('Numele cantecului ar trebui sa fie nenull!;\n',15,1);
			IF dbo.TestArtistId(@artistID)!=0
				RAISERROR('ID-ul artistului ar trebui sa fie nenull si sa apartina unui artist!;\n',15,1);
			IF dbo.TestPositive(@minutes) !=0
				RAISERROR('Numarul de minute ar trebui sa fie nenull si pozitiv!;\n',15,1);
			IF dbo.TestVC50(@genre) !=0
				RAISERROR('Genul melodiei ar trebui sa fie nenull!;\n',15,1);
			Insert into Song(Name,ArtistID,Minutes,Genre) values (@songName,@artistID,@minutes,@genre);
			declare @songID INT = SCOPE_IDENTITY();
			Insert into LogTable(TypeOperation,TableOperation,ExecutionDate) values('Inserted','Song',GETDATE())



			IF dbo.TestTourId(@tourID)!=0
				RAISERROR('ID-ul tourului ar trebui sa fie nenull si sa apartina unui tour!;\n',15,1);
			IF dbo.TestVenueId(@venueID)!=0
				RAISERROR('ID-ul venue-ului ar trebui sa fie nenull si sa apartina unui venue!;\n',15,1);
			IF dbo.TestDate(@concertdate)!=0
				RAISERROR('ID-ul venue-ului ar trebui sa fie nenull si sa apartina unui venue!;\n',15,1);
			Insert into Concert(TourID,VenueID,Date) values(@tourID,@venueID,@concertdate);
			declare @concertID INT = SCOPE_IDENTITY();
			Insert into LogTable(TypeOperation,TableOperation,ExecutionDate) values('Inserted','Concert',GETDATE())



			Insert into Play(SongID,ConcertID) values(@songID,@concertID);
			Insert into LogTable(TypeOperation,TableOperation,ExecutionDate) values('Inserted','Play',GETDATE())


			COMMIT TRAN
			SELECT 'Transaction committed'
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE()
			SELECT 'Transaction rollbacked'
		END CATCH
END
go;

--function for inserting Song-Play-Concert only error rollback--
create or alter procedure addSongConcertPlay2 @songName varchar(50), @artistID int, @minutes int, @genre varchar(50),
@tourID int,@venueID int,@concertdate date AS 
BEGIN
	declare @songID INT = null;
	declare @concertID INT = null;
	BEGIN TRAN
		BEGIN TRY
			IF dbo.TestVC50(@songName) != 0
				RAISERROR('Numele cantecului ar trebui sa fie nenull!;\n',15,1);
			IF dbo.TestArtistId(@artistID)!=0
				RAISERROR('ID-ul artistului ar trebui sa fie nenull si sa apartina unui artist!;\n',15,1);
			IF dbo.TestPositive(@minutes) !=0
				RAISERROR('Numarul de minute ar trebui sa fie nenull si pozitiv!;\n',15,1);
			IF dbo.TestVC50(@genre) !=0
				RAISERROR('Genul melodiei ar trebui sa fie nenull!;\n',15,1);
			Insert into Song(Name,ArtistID,Minutes,Genre) values (@songName,@artistID,@minutes,@genre);
			select @songID = SCOPE_IDENTITY();
			Insert into LogTable(TypeOperation,TableOperation,ExecutionDate) values('Inserted','Song',GETDATE())
			COMMIT TRAN
			SELECT 'Artist Transaction committed'
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE()
			SELECT 'Artist Transaction rollbacked'
		END CATCH
	BEGIN TRAN
		BEGIN TRY
			IF dbo.TestTourId(@tourID)!=0
				RAISERROR('ID-ul tourului ar trebui sa fie nenull si sa apartina unui tour!;\n',15,1);
			IF dbo.TestVenueId(@venueID)!=0
				RAISERROR('ID-ul venue-ului ar trebui sa fie nenull si sa apartina unui venue!;\n',15,1);
			IF dbo.TestDate(@concertdate)!=0
				RAISERROR('ID-ul venue-ului ar trebui sa fie nenull si sa apartina unui venue!;\n',15,1);
			Insert into Concert(TourID,VenueID,Date) values(@tourID,@venueID,@concertdate);
			select @concertID = SCOPE_IDENTITY();
			Insert into LogTable(TypeOperation,TableOperation,ExecutionDate) values('Inserted','Concert',GETDATE())
			COMMIT TRAN
			SELECT 'Concert Transaction committed'
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE()
			SELECT 'Concert Transaction rollbacked'
		END CATCH
	BEGIN TRAN
		BEGIN TRY
			if @songID is Null or @concertID is Null
				RAISERROR('Nu s-a putut insera concertul sau cantectul, deci nici play-ul nu poate fi inserat!;\n',15,1);
			Insert into Play(SongID,ConcertID) values(@songID,@concertID)
			Insert into LogTable(TypeOperation,TableOperation,ExecutionDate) values('Inserted','Play',GETDATE())
			COMMIT TRAN
			SELECT 'Play Transaction committed'
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN
			SELECT ERROR_MESSAGE()
			SELECT 'Play Transaction rollbacked'
		END CATCH
END
go;

select * from Artist
select * from Tour
select * from Venue

select * from Song
select * from Concert
select * from Play

select * from LogTable

exec addSongConcertPlay 'El Manana',4,4,'trip hop',8,29,'20160522';
exec addSongConcertPlay null,4,4,'trip hop',8,29,'20160522';
exec addSongConcertPlay 'El Manana',4,4,'trip hop',-8,29,'20160522';

exec addSongConcertPlay2 'El Manana',4,4,'trip hop',8,29,'20160522';
exec addSongConcertPlay2 null,4,4,'trip hop',8,29,'20160522';
exec addSongConcertPlay2 'El Manana',4,4,'trip hop',-8,29,'20160522';