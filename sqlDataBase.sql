/* Student name: Mohammed Abdul-Mutahhar               
Student username: adcm059            
*/

/* SECTION 1 CREATE TABLE STATEMENTS */

create table adcm059_Staff(
    staffID integer(10) primary key,
    first_name varchar(255), 
    second_name varchar(255),
    salary decimal(5,2) not null,
    contact_no char(11) not null

    
);

create table adcm059_Game(
    gameName varchar(255) primary key,
    ageRating integer(2),
    popularityRating integer(2)
);

create table adcm059_Designer(
    staffID integer(10) primary key references adcm059_Staff(staffID)
    on delete cascade,
    type varchar(255)
);

create table adcm059_Programmer(
    staffID integer(10) primary key references adcm059_Staff(staffID),
    gameName varchar(255)
);

create table adcm059_Consumer(
    username varchar(255) primary key,
    age integer(3),
    email varchar(255)
);


create table adcm059_Designing(
    staffID integer(10),
    gameName varchar(255),
    StartDate integer(6),
    endDate integer(6) null,
    primary key (staffID,gameName,StartDate),
    foreign key (staffID) references adcm059_Staff(staffID)
    on delete cascade,
    foreign key (gameName) references adcm059_Game(gameName)
    on delete cascade
);

create table adcm059_Downloaded(
    gameName varchar(255),
    ConsumerName varchar(255),
    primary key (gameName, consumerName),
    foreign key (gameName) references adcm059_Game(gameName)
    on delete cascade,
    foreign key (ConsumerName) references adcm059_Consumer(username)
    on delete cascade
);

create table adcm059_Items(
    itemName varchar(255) primary key,
    price decimal(4,2)
);

create table adcm059_Transactions(
    consumerName varchar(255),
    itemName varchar(255),
    gameName varchar(255),
    Tdate   integer(6),
    Ttime time(6),
    quantity integer(10),
    primary key (consumerName,itemName,gameName,Tdate,Ttime),
    foreign key (consumerName) references adcm059_Consumer(username)
    on delete cascade,
    foreign key (itemName) references adcm059_Items(itemName)
    on delete cascade,
    foreign key (gameName) references adcm059_Game(gameName)
    on delete cascade
);

/* SECTION 2 INSERT STATEMENTS */

insert into adcm059_Staff values
(0001,'Steve', 'Brown', 540.00, '07950833219'),
(0002,'Stephanie', 'Brown', 538.62, '07950833328'),
(0003,'Micheal', 'Smith', 562.00, '07950845232'),
(0004,'Samantha', 'Cruise', 543.20, '07940335724'),
(0005,'Ali', 'Rahman', 540.00, '07940754313'),
(0006,'Tanjiro', 'Kamado', 540.00, '07950743259'),
(0007,'Kaz', 'Brekker', 565.55, '07970734382'),
(0008,'Annabeth', 'Chase', 570.00, '07940951249'),
(0009,'Inej', 'Ghafa', 550.00, '07970203853'),
(0010,'Eren', 'Yeager', 549.00, '07950834279'),
(0011,'Edward', 'Elric', 562.00, '07970293439'),
(0012,'Yusuf', 'Uddin', 562.00, '07970293439'),
(0013,'Tom', 'Jerry', 562.00, '07970293439'),
(0014,'Miles', 'Morales', 562.00, '07970293439'),
(0015,'Ash', 'Ketchum', 562.00, '07970293439'),
(0016,'Tori', 'Vagos', 562.00, '07970293439'),
(0017,'Sam', 'Sung', 562.00, '07970293439'),
(0018,'Eli', 'Shane', 562.00, '07970293439'),
(0019,'Gwen', 'Stacy', 562.00, '07970293439'),
(0020,'Elizabeth', 'Smith', 562.00, '07970293439');

insert into adcm059_Game values
('Titans Clash', 7, 7),
('Royal Match', 3, 8),
('King of Avalon', 7, 7),
('Raid of Dragons', 7, 8),
('Rise of Legends', 18, 9),
('Lemmings', 3, 6),
('Hidden Rage', 3, 6),
('Seven Knights', 12, 4),
('Forsaken World', 12, 5),
('Gray Raven', 12, 8);

insert into adcm059_Designer values
(0004, 'Content'),(0006,'level'),(0005,'level'),(0012,'Interface'),(0011,'Content'),
(0015,'Content'),(0009,'Lead'),(0008,'level'),(0019,'level'),(0020,'Interface');

insert into adcm059_Programmer values
(0001, 'Gray Raven'),
(0002, 'Lemmings'),
(0003, 'Hidden Rage'),
(0007, 'Titans Clash'),
(0014, 'Raid of Dragons'),
(0013, 'Gray Raven'),
(0018, 'Royal Match'),
(0017, 'King of Avalon'),
(0016, 'Rise of Legends'),
(0010, 'Rise of Legends');

insert into adcm059_Designing values
(0004, 'Gray Raven', 211231,null),
(0006, 'Gray Raven', 211225,220110),
(0005, 'Gray Raven', 211229,null),
(0012, 'Rise of Legends', 211016,211130),
(0011, 'Rise of Legends', 210912,211013),
(0015, 'Rise of Legends', 210922,210929),
(0009, 'Titans Clash', 211215,null),
(0006, 'Seven Knights', 220110,null),
(0019, 'Forsaken World', 210819,220101),
(0020, 'Lemmings', 210527,210713);

insert into adcm059_Consumer values
('noobmaster69', 13, 'noobmaster@gmail.com'),
('mynamebob', 18, 'mohammedabdul@gmail.com' ),
('dragonMaster188', 15, 'aliRahman@outlook.com'),
('PokeMeow19', 9, 'aNormalEmail@gmail.com'),
('StevenTries', 10, 't.steven@gmail.com'),
('PercyJackson', 4, 'jacksonP@gmail.com'),
('SonicHedgehog1', 13, 'williamdevoe@yahoo.com'),
('BarryAllen13', 19, 'oliverqueen@gmail.com'),
('Killua10', 17, 'timmyturner@gmail.com'),
('Uchiha_MAAADARA', 33, 'namikazeMinato@yahoo.com'),
('allmight', 20, 'izukumidoriya@gmail.com');

insert into adcm059_Downloaded values
('Rise of Legends', 'BarryAllen13'),
('Rise of Legends', 'mynamebob'),
('Rise of Legends', 'Uchiha_MAAADARA'),
('Titans Clash', 'StevenTries'),
('Lemmings', 'SonicHedgehog1'),
('Gray Raven', 'noobmaster69'),
('Gray Raven', 'Killua10'),
('Hidden Rage', 'PercyJackson'),
('Forsaken World', 'killua10'),
('Forsaken world', 'mynamebob'),
('Royal Match', 'allmight'),
('Seven Knights', 'PokeMeow19');


insert into adcm059_Items values
('7 day shield', 2.50),
('50 Gems', 0.55),
('Speed Potion', 0.88),
('50 gold', 0.20),
('Strength Potion', 0.98),
('Anaklusmos', 0.88),
('defensive Potion', 1.12),
('One For All', 5.50),
('Words of Reinforcements', 3.15),
('Susanoo', 3.00);

insert into adcm059_Transactions values
('mynamebob', '50 Gems', 'Rise of Legends', 210219, "16:34:19", 3),
('mynamebob', '50 gold', 'Rise of Legends', 210219, "16:34:32", 4),
('allmight', 'One For All', 'Forsaken World', 210220, "17:26:27", 1),
('PercyJackson', 'Anaklusmos', 'Hidden Rage', 200531, "08:12:05", 1),
('SonicHedgehog1', '7 day Shield', 'Lemmings', 210808, "14:22:22", 1),
('SonicHedgehog1', '7 day Shield', 'Lemmings', 210815, "14:22:22", 1),
('StevenTries', 'Strength Potion', 'Titans Clash', 210920, "18:53:41", 5),
('BarryAllen13', 'Words of Reinforcements', 'Rise of Legends', 211214, "11:40:36", 2),
('Uchiha_MAAADARA', 'Susanoo', 'Rise of Legends', 201228, "12:50:46", 100),
('Killua10', '50 Gems', 'Gray Raven', 211112,"10:08:11", 2);




                     
/* SECTION 3 UPDATE STATEMENTS */

update adcm059_Consumer set age = 16 where username = 'dragonMaster188';
update adcm059_Staff set salary = 570 where staffID = 0014;


/* SECTION 4 SINGLE TABLE QUERIES */


/* 
1) list name of games that have a popularity rating above 7

*/

SELECT gameName 
FROM adcm059_Game 
WHERE popularityRating >7;

/* 
2)  list number of programmers working on each game that have an 'R' in the name in descending order

*/

SELECT COUNT(staffID), gameName 
FROM adcm059_Programmer 
GROUP BY gameName 
HAVING gameName like '%R%'
ORDER BY COUNT(staffID) DESC;




/* 
3)  lists average price for all potion items

*/

SELECT AVG(price) 
FROM `adcm059_Items` 
WHERE itemName like '% potion';

/* 
4)  lists all games (at most once) that  still have a designer working on them (end date is null if designing is not finished yet)

*/

SELECT DISTINCT(gameName) 
FROM adcm059_Designing 
where endDate IS NULL;


/* 
5)  list of transactions that took place between  1st september 2020 and 20th february 2021

*/
SELECT * 
FROM adcm059_Transactions 
WHERE (Tdate >200901 AND Tdate <210220);


/* 
6)  lists the full names of all staff members whose first name begins with 'E'

*/

SELECT CONCAT(first_name, " ", second_name) as 'Full Name'
FROM `adcm059_Staff` 
WHERE first_name LIKE 'E%';


/* SECTION 5 MULTIPLE TABLE QUERIES*/


/* 
1)  lists name and contact numbers of all programmers and content designers working on the game 'Rise of Legends'(programmers will have a null type)

*/

SELECT first_name, second_name, contact_no, COALESCE(adcm059_Designing.gameName, adcm059_Programmer.gameName) as 'workingOnGame', type
from adcm059_Staff
LEFT JOIN adcm059_Programmer on adcm059_Staff.staffID = adcm059_Programmer.staffID
LEFT JOIN adcm059_Designing on adcm059_Staff.staffID = adcm059_Designing.staffID
LEFT JOIN adcm059_Designer on adcm059_Staff.staffID = adcm059_Designer.staffID

WHERE (COALESCE(adcm059_Designing.gameName, adcm059_Programmer.gameName) = 'Rise of Legends') and ((type = 'Content') or (type IS NULL));

/* 
2)  lists the usernames of Consumers who downloaded a game that is not appropriate for their age

*/

SELECT ConsumerName FROM adcm059_Downloaded 
INNER JOIN adcm059_Consumer on adcm059_Downloaded.ConsumerName = adcm059_Consumer.username
INNER JOIN adcm059_Game on adcm059_Downloaded.gameName = adcm059_Game.gameName
WHERE age < ageRating;


/* 
3)  lists email addresses of Consumers that spent over £5 on trasactions in order of most spent

*/

SELECT email, price, quantity ,(price*quantity) as amount_spent FROM adcm059_Transactions 
INNER JOIN adcm059_Consumer on adcm059_Transactions.consumerName = adcm059_Consumer.username
INNER JOIN adcm059_Items on adcm059_Transactions.itemName = adcm059_Items.itemName
WHERE (price * quantity )>5
ORDER BY (price * quantity ) DESC;

 

/* 
4)  lists salary to be paid to the programmers working on Gray Raven

*/
SELECT first_name, second_name, salary 
from adcm059_Staff 
where staffID in (select staffID 
                  from adcm059_Programmer 
                  where gameName = 'Gray Raven');


/* 
5)  lists emails of consumers that downloaded Forsaken World

*/

SELECT email 
from adcm059_Consumer 
WHERE username in (SELECT Consumername 
                   from adcm059_Downloaded 
                   where gameName = 'Forsaken World');




/* 
6)  lists name of designer's working on games with less that 6 popularity ratings (change to department numbers )

*/

SELECT first_name, second_name 
FROM adcm059_Staff 
WHERE staffID in (SELECT staffID 
                  from adcm059_Designing 
                  WHERE gameName in (SELECT gameName 
                                     FROM adcm059_Game 
                                     WHERE popularityRating < 6));


/* SECTION 6 DELETE ROWS (make sure the SQL is commented out in this section)

delete from  adcm059_Consumer where username = 'mynamebob' ;
delete from adcm059_Game where popularityRating < 6;

*/

/* SECTION 7 DROP TABLES (make sure the SQL is commented out in this section)


drop table adcm059_Transactions;
drop table adcm059_Items;
drop table adcm059_Downloaded;
drop table adcm059_Consumer;
drop table adcm059_Designing;
drop table adcm059_Programmer;
drop table adcm059_Game;
drop table adcm059_Designer;
drop table adcm059_Staff;
*/