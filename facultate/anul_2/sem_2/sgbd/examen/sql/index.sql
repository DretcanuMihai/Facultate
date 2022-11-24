use S1
go

insert into Vizitatori(Nume,Varsta) values
('Gabriel',33),
('Ionut',13),
('Vasile',93),
('Gabriela',44),
('Daniela',13),
('Alta Daniela',23);

select Varsta from Vizitatori order by Varsta
drop index idx_vizitatori on Vizitatori
create index idx_vizitatori on Vizitatori(Varsta)