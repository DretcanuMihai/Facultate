use S1
go

---dirty read---

set transaction isolation level read uncommitted
exec delay_read

---dirty read solved---

set transaction isolation level read committed
exec delay_read