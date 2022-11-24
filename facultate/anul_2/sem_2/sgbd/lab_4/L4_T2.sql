use RoundTheGlobe
go

---dirty read---

set transaction isolation level read uncommitted
exec delay_read

---dirty read solved---

set transaction isolation level read committed
exec delay_read

---unrepeatable read---

exec update_success

---unrepeatable read solved---

exec update_success

---phantom read---

exec insert_success

---phantom read solved---

exec insert_success

---deadlock 1---

exec deadlock_t2

---deadlock 2---
set deadlock_priority high
exec deadlock_t2

