---Am inserat prea multe chestii, nu trebuie de fapt atat de multe. 5-6 per tabela e ok, scuze...---

use RoundTheGlobe
go

delete from Play
delete from Song
delete from Artist
delete from Ticket
delete from Attendee
delete from Concert
delete from Address
delete from Venue
delete from Tour
delete from Funder

---Insert Artists---

insert into Artist (Name) values 
('Ghost'),
('Black Moth'),
('David Bowie'),
('Gorillaz'),
('Fara Zahar'),
('Avenged Sevenfold');


---Insert Songs---

---Ghost---
insert into Song (Name,ArtistID,Minutes,Genre) values
('Genesis',1,4,'prog rock'),
('Secular Haze',1,5,'doom rock'),
('Spirit',1,4,'rock'),
('From The Pinacle To The Pit',1,4,'doom rock'),
('Cirice',1,6,'heavy metal'),
('He Is',1,4,'gospel'),
('Square Hammer',1,4,'pop rock'),
('Missionary Man',1,4,'rock'),
('Rats',1,5,'rock'),
('Faith',1,5,'heavy metal'),
('Miasma',1,6,'prog rock'),
('Dance Macabre',1,4,'dance rock'),
('Witch Image',1,4,'rock'),
('Hunter''s Moon',1,4,'pop rock')
---Black Moth---
insert into Song (Name,ArtistID,Minutes,Genre) values
('The Articulate Dead',2,3,'doom rock'),
('Blackbirds Fall',2,4,'doom rock'),
('Plastic Blaze',2,4,'doom rock'),
('Land of the Sky',2,3,'doom rock'),
('Tumbleweave',2,4,'doom rock'),
('Set Yourself Alight',2,3,'doom rock'),
('Looner',2,4,'doom rock'),
('Red Ink',2,4,'doom rock'),
('Slumber with the Worm',2,3,'doom rock')
---David Bowie---
insert into Song (Name,ArtistID,Minutes,Genre) values
('After All',3,4,'rock'),
('The Man Who Sold the World',3,4,'rock'),
('Life on Mars?',3,4,'pop'),
('Starman',3,4,'glam rock'),
('Lady Stardust',3,3,'glam rock'),
('Beauty and the Beast',3,4,'rock'),
('Let''s Dance',3,8,'dance rock')
---Gorillaz---
insert into Song (Name,ArtistID,Minutes,Genre) values
('Sound Check (Gravity)',4,5,'trip hop'),
('Starshine',4,5,'trip hop'),
('Dirty Harry',4,4,'funk'),
('Feel Good Inc.',4,4,'trip hop'),
('El Manana',4,4,'trip hop'),
('Rhinestone Eyes',4,4,'trip hop'),
('On Melancholy Hill',4,4,'trip hop'),
('Strobelite',4,5,'disco'),
('Saturn Barz',4,3,'trip hop')
---Fara Zahar---
insert into Song (Name,ArtistID,Minutes,Genre) values
('Hai, Iubito! - Euroversion',5,3,'pop'),
('Lav Stori',5,4,'pop'),
('Neamul lui Penes Curcanul',5,5,'folk pop'),
('Joi',5,3,'pop'),
('D''la munte',5,3,'pop'),
('Nu ma mai iubesti',5,3,'pop'),
('Te iubesc',5,3,'pop'),
('Nascut liber',5,3,'pop'),
('Beiu',5,3,'pop'),
('Comedie Amaruie',5,3,'pop')
---Avenged Sevenfold---
insert into Song (Name,ArtistID,Minutes,Genre) values
('Bat Country',6,5,'heavy metal'),
('Almost Easy',6,4,'heavy metal'),
('Welcome to the Family',6,4,'heavy metal'),
('Buried Alive',6,7,'heavy metal'),
('Hail to the King',6,6,'heavy metal'),
('Shepherd of Fire',6,5,'heavy metal'),
('The Stage',6,9,'heavy metal'),
('Sunny Disposition',6,7,'heavy metal'),
('Roman Sky',6,6,'rock');

---Insert Funder---
insert into Funder (Name,Type,PhoneNumber,EMail) values
('David Bowie','Individual','0533724335','davie_sings@yahoo.com'),
('Ghost Band','Organisation','0287666142','ghost_the_band@yahoo.com'),
('Tobias Forge','Individual','0231445914','tobias.forge23@gmail.com'),
('Anonymous Funder','Individual','0484890258','ifundgreatness@outlook.com'),
('Don''t Stop Singing','Organisation','0114901901','wontstop@cantstop.com');

---Insert Tour---
insert into Tour (Name,Budget,FunderID) values
('David Bowie 2010 Tour',500000,1),
('Popestar Tour',300000,2),
('Rats! On The Road',370000,2),
('At The World''s Throat',600000,4),
('ALive Gorillaz',450000,4);

---Insert Venue---
insert into Venue (Name,Capacity) values
('Whiskey a Go Go',300),
('Arena Nationala',4000),
('Naesba Ski Resort',500),
('Penn''s Landing',3000),
('Jockey Club de Sao Paulo',400),
('Royal Albert Hall',5272),
('Halle Tony Garnier',17000),
('AFAS Live',6000),
('Lotto Arena',8050),
('Parramatta Park',10000),
('Flemington Racecourse',4000),
('Swiss Life Hall',5000),
('Alsterdorfer Sporthalle',7000),
('Irish Pub',50)

---Insert Address---
insert into Address (AddressID,Continent,Country,Region,Town,Street,Number) values
(1,'North America','USA','California','West Hollywood','Sunset Blvd',8901),
(2,'Europe','Romania','Ilfov','Bucharest','Basarabia Blvd',37),
(3,'Asia','Japan','Niigata','Yuzawa',NULL,NULL),
(4,'North America','USA','Pennsylvania','Philadelphia',NULL,NULL),
(5,'South America','Brazil','Southeast Region','Sao Paulo','Av. Lineu de Paula Machado',1263),
(6,'Europe','England',NULL,'London','Kensington Gore',NULL),
(7,'Europe','France','Rhone','Lyon','Place docteurs Charles et Christophe Mérieux',20),
(8,'Europe','Netherlands',NULL,'Amsterdam','Arena Boulevard', 590),
(9,'Europe','Belgium','Flemish Region','Antwerp',NULL,NULL),
(10,'Australia','Australia','New South Wales','Sydney','Pitt & Macquarie Streets',NULL),
(11,'Australia','Australia','Victoria','Melbourne',NULL,NULL),
(12,'Europe','Germany','Lower Saxony','Hannover',NULL,NULL),
(13,'Europe','Germany','Hamburg','Hamburg','Krochmannstraße',55),
(14,'Europe','Romania','Botosani','Botosani','Marchian',5)

---Insert Concert---
insert into Concert (TourID,VenueID,Date) values
(1,1,'20100210'),
(1,4,'20100213'),
(1,6,'20100217'),
(1,7,'20100218'),
(1,8,'20100219'),
(1,3,'20100220'),
(2,6,'20160520'),
(2,7,'20160522'),
(2,8,'20160523'),
(3,5,'20180929'),
(3,4,'20181003'),
(3,1,'20181004'),
(4,2,'20190120'),
(4,7,'20190122'),
(4,4,'20190125'),
(4,3,'20190202'),
(4,10,'20190204'),
(5,3,'20220330'),
(5,2,'20220401'),
(5,1,'20220402')

---Insert Plays---

---David Bowie 2010 Tour---
insert into Play (SongID,ConcertID) values
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(26,2),
(27,2),
(28,2),
(29,2),
(30,2),
(26,3),
(27,3),
(28,3),
(29,3),
(30,3),
(26,4),
(27,4),
(28,4),
(29,4),
(30,4),
(26,5),
(27,5),
(28,5),
(29,5),
(30,5),
(26,6),
(27,6),
(28,6),
(29,6),
(30,6)
---Popestar Tour---
insert into Play (SongID,ConcertID) values
(3,7),
(4,7),
(5,7),
(6,7),
(7,7),
(1,8),
(2,8),
(5,8),
(7,8),
(1,9),
(3,9),
(2,9),
(5,9),
(6,9),
(8,9),
(4,9),
(7,9)
---Rats! On The Road---
insert into Play (SongID,ConcertID) values
(9,10),
(10,10),
(11,10),
(2,10),
(4,10),
(12,10),
(13,10),
(9,11),
(10,11),
(11,11),
(2,11),
(4,11),
(12,11),
(13,11),
(9,12),
(10,12),
(11,12),
(5,12),
(8,12),
(12,12),
(13,12),
(7,12)
---At The World's Throat---
insert into Play (SongID,ConcertID) values
--- 13 ---
(18,13),
(19,13),
(22,13),
(16,13),
(17,13),
(55,13),
(53,13),
(52,13),
(56,13),
(5,13),
(11,13),
(12,13),
(7,13),
--- 14 ---
(50,14),
(55,14),
(53,14),
(52,14),
(56,14),
(54,14),
--- 15 ---
(52,15),
(53,15),
(51,15),
(57,15),
(58,15),
(54,15),
--- 16 ---
(15,16),
(20,16),
(21,16),
(16,16),
(17,16),
(23,16),
--- 17 ---
(18,17),
(19,17),
(22,17),
(16,17),
(17,17),
(55,17),
(53,17),
(52,17),
(56,17),
(5,17),
(11,17),
(12,17),
(7,17)
---ALive Gorillaz---
insert into Play (SongID,ConcertID) values
(31,18),
(33,18),
(36,18),
(34,18),
(39,18),
(37,18),
(38,18),
(40,19),
(41,19),
(42,19),
(47,19),
(31,19),
(32,19),
(33,19),
(34,19),
(35,19),
(37,19),
(38,19),
(31,20),
(32,20),
(33,20),
(34,20),
(35,20),
(37,20),
(38,20)


---Insert Attendees---
insert into Attendee (Name) values
---Australia---1---
('Lawrance MacLaughin'),
('Henriette Devito'),
('Bridgette Verra'),
('John Kean'),
('Patrick Cavil'),
('Justin Morales'),
---Belgium---7---
('Jean Garnier'),
('Pierre Blanchet'),
('Joan Laurent'),
('Joan Dupont'),
('Elise Monet'),
---Brazil---12---
('Sofia Augusto'),
('Maria Augusto'),
('Monique Wesley'),
('Alessandra Wilson'),
('Alphonse Bruno'),
---England---17---
('Charles Brown'),
('Norman Maxwell'),
('Sophie Houle'),
('Evan Smith'),
('Daniel Wilson'),
('Mary-Anne Williams'),
('Richard Smith'),
---France---24---
('Joan Laurent'),
('Diana Toussaint'),
('Elliot Gros'),
('Mathieu Bonheur'),
('Albert Manaudou'),
('Robert Adnot'),
---Germany---30---
('Siegried Haas'),
('Selma Friedrich'),
('Elisabeth Feldt'),
('Liese Stroman'),
('Elfriede Becker'),
('Magdalene Winter'),
---Japan---36---
('Yogi Masashi'),
('Kuroda Shuichi'),
('Takei Suzume'),
('Fukunaga Madoka'),
('Namba Masashi'),
('Kato Isao'),
---Netherlands---42---
('Wilhelmina Knopf'),
('Warin Kaiser'),
('Beringar Busch'),
('Sommer Krüger'),
---Romania---46---
('George Gheorghescu'),
('Dan Sandu'),
('Andrei Rebreanu'),
('Ioana Zamfirescu'),
('Diana Lazar'),
---USA---51---
('John Weathers'),
('Daniel Towers'),
('Horace Lloyd'),
('Ann Harrison'),
('Diane Weathers')

---Insert Tickets---
insert into Ticket (ConcertID,AttendeeID,Type,Price) values
(1,51,'Deluxe',150),
(1,52,'Basic',100),
(2,52,'Basic',100),
(2,55,'Basic',100),
(3,17,'Deluxe',150),
(4,24,'Basic',100),
(4,25,'Basic',100),
(4,27,'Deluxe',150),
(4,28,'Deluxe',150),
(5,42,'Delux',250),
(6,36,'Deluxe',200),
(6,37,'Basic',120),
(6,38,'Basic',120),
(6,39,'Basic',120),
(6,40,'Deluxe',200),
(6,41,'Basic',120),
(7,18,'A',50),
(7,20,'A',50),
(7,21,'B',75),
(8,25,'A',45),
(8,27,'A',45),
(8,28,'C',125),
(9,44,'C',140),
(9,45,'C',140),
(9,49,'A',50),
(9,30,'A',50),
(10,12,'A',140),
(10,13,'C',55),
(11,52,'C',40),
(12,54,'C',60),
(12,51,'C',60),
(12,55,'C',60),
(13,46,'basic',100),
(13,47,'basic',100),
(13,49,'basic',100),
(14,25,'basic',100),
(14,26,'basic',100),
(14,27,'basic',100),
(15,51,'basic',120),
(15,52,'ultra deluxe',500),
(15,54,'deluxe',300),
(16,38,'ultra deluxe',450),
(16,39,'deluxe',280),
(16,41,'deluxe',280),
(17,4,'basic',110),
(17,5,'basic',110),
(17,6,'basic',110),
(18,36,'S',250),
(18,37,'S',250),
(18,38,'A',200),
(18,39,'B',150),
(18,40,'A',200),
(18,41,'A',200),
(19,46,'S',200),
(19,47,'A',170),
(19,48,'A',170),
(19,49,'S',200),
(19,50,'C',100),
(20,51,'B',120),
(20,52,'B',120),
(20,53,'B',120),
(20,54,'S',250),
(20,55,'S',250)

