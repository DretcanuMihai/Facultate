use RoundTheGlobe
go

---dirty read---

exec update_rollback

---dirty read solved---

exec update_rollback

---unrepeatable read---

update Artist set Name='davie bowie' where ArtistID=3
set transaction isolation level read committed
exec delay_read

---unrepeatable read solved---

update Artist set Name='davie bowie' where ArtistID=3
set transaction isolation level repeatable read
exec delay_read

---phantom read---

set transaction isolation level repeatable read
exec delay_read
delete from Artist where Name='Unknown'

---phantom read solved---

set transaction isolation level serializable
exec delay_read
delete from Artist where Name='Unknown'

---deadlock 1---

exec deadlock_t1

---deadlock 2---

exec deadlock_t1

