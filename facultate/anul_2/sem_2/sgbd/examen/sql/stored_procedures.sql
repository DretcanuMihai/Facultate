use S1
go

---update rollback




go
create or alter procedure update_rollback
as
begin
	begin transaction
	update Vizitatori set Nume='Dan Balan' where Vid=1
	waitfor delay '00:00:05'
	rollback transaction
end

---delay read

go
create or alter procedure delay_read
as
begin
	begin transaction
	select * from Vizitatori
	waitfor delay '00:00:05'
	select * from Vizitatori
	commit transaction
end