use RoundTheGlobe
go

drop table LogTable;
CREATE TABLE LogTable(
Lid INT IDENTITY PRIMARY KEY,
TypeOperation VARCHAR(50),
Message VARCHAR(50),
ExecutionDate DATETIME)

select * from LogTable

select * from Artist

---update rollback

go
create or alter procedure update_rollback
as
begin
	begin transaction
	update Artist set Name='davie bowie' where ArtistID=3
	Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','Updated Artist on update_rollback',GETDATE())
	waitfor delay '00:00:05'
	rollback transaction
	Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Rollback','Rollback on update_rollback',GETDATE())
end

---delay read

go
create or alter procedure delay_read
as
begin
	begin transaction
	select * from Artist
	Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Select','(1)Selected all Artist on delay_read',GETDATE())
	waitfor delay '00:00:05'
	select * from Artist
	Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Select','(2)Selected all Artist on delay_read',GETDATE())
	commit transaction
end

---delay success

go
create or alter procedure update_success
as
begin
	begin transaction
	Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','Updated Artist on update_success',GETDATE())
	update Artist set Name='David Bowie' where ArtistID=3
	waitfor delay '00:00:05'
	commit transaction
	Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Commit','Commit on update_success',GETDATE())
end

---insert succes

go
create or alter procedure insert_success
as
begin
	begin transaction
	insert into Artist(Name) values ('Unknown')
	Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Insert','Insert Artist on insert_success',GETDATE())
	waitfor delay '00:00:05'
	commit transaction
	Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Commit','Commit on insert_success',GETDATE())
end

---deadlock_t1

go
create or alter procedure deadlock_t1
as
begin
	begin transaction
	begin try
		update Artist set Name='davie bowie' where ArtistID=3
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','(1)Updated Artist on deadlock_t1',GETDATE())
		waitfor delay '00:00:05'
		update Song set Name='elmano' where SongID=65
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','(2)Updated Artist on deadlock_t1',GETDATE())
		commit transaction
	end try
	begin catch
		rollback transaction
		print 'T1 Failed'
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Deadlock','Deadlock in T1',GETDATE())
	end catch
end

select * from Artist
select * from Song


---deadlock_t2

go
create or alter procedure deadlock_t2
as
begin
	begin transaction
	begin try
		update Song set Name='El Manana' where SongID=65
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','(1)Updated Artist on deadlock_t2',GETDATE())
		waitfor delay '00:00:05'
		update Artist set Name='David Bowie' where ArtistID=3
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','(2)Updated Artist on deadlock_t2',GETDATE())
		commit transaction
		end try
	begin catch
		rollback transaction
		print 'T2 Failed'
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Deadlock','Deadlock in T2',GETDATE())
	end catch
end

select * from Artist
select * from Song

---deadlock_t1 C#

go
create or alter procedure cdeadlock_t1
as
begin
	begin transaction
	begin try
		update Artist set Name='davie bowie' where ArtistID=3
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','(1)Updated Artist on deadlock_t1',GETDATE())
		waitfor delay '00:00:05'
		update Song set Name='elmano' where SongID=65
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','(2)Updated Artist on deadlock_t1',GETDATE())
		commit transaction
	end try
	begin catch
		rollback transaction
		RAISERROR('T1 Caught in deadlock!;\n',15,1);
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Deadlock','Deadlock in T1',GETDATE())
	end catch
end

---deadlock_t2 C#

go
create or alter procedure cdeadlock_t2
as
begin
	begin transaction
	begin try
		update Song set Name='El Manana' where SongID=65
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','(1)Updated Artist on deadlock_t2',GETDATE())
		waitfor delay '00:00:05'
		update Artist set Name='David Bowie' where ArtistID=3
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Update','(2)Updated Artist on deadlock_t2',GETDATE())
		commit transaction
		end try
	begin catch
		rollback transaction
		RAISERROR('T2 Caught in deadlock!;\n',15,1);
		Insert into LogTable(TypeOperation,Message,ExecutionDate) values('Deadlock','Deadlock in T2',GETDATE())
	end catch
end