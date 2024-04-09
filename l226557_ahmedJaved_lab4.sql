create database Lab4

create table userTablee(

UserID int Primary Key,
name varchar(25),
phoneNum varchar(25),
city varchar(25)
);

Insert into userTablee
VALUES(1,'Ali','03036067000','Narowal'),
(2,'Ahmed','03036047000','Lahore'),
(3,'Aqeel','03036063000','Karachi'),
(4,'Usman','03036062000','Sialkot'),
(5,'Hafeez','03036061000','Lahore');

create Table UserCardd(
Userid int,
CardNum int,
Foreign Key (Userid) references userTablee(UserID),
Foreign Key (CardNum) references Carddd(cardNum)
);

Insert into UserCardd
Values(1,1234),
(1,1235),
(2,1236),
(3,1238);




Create Table Carddd(
cardNum int primary key,
CardType int ,
PIN int,
ExpireDate Date,
balance decimal(8,3)



);





INSERT INTO Carddd
Values(1234,1,1770,'2022-07-01',43025.31),
(1235,1,9234,'2020-03-02',14425.62),
(1236,1,1234,'2019-02-06',34325.52),
(1237,2,1200,'2021-02-05',24325.30),
(1238,2,9004,'2020-09-02',34025.12);

Create table CardTypee
(
cardTypeID int,
name varchar(25),
description Varchar(30)

);

insert into CardTypee
Values(1,'Debit','Spend Now, Pay Now'),
(2,'Credit', 'Spend Now, Pay Later')


Create Table Transactions 
(
transID int,
transDate date,
cardNum int,
Amount int
Foreign Key (cardNum) references Carddd(cardNum)

);

INSERT INTO Transactions
VALUES
(1,'2017-02-02',1234,500),
(2,'2018-02-03',1234,3000),
(3,'2017-05-06',1234,2500),
(4,'2016-09-09',1234,2000),
(5,'2015-02-10',1234,6000);

--q1
--select carddd.CardType, COUNT(userid) AS NumberOfUsers FROM carddd
--LEFT JOIN UserCardd ON UserCardd.CardNum = carddd.cardNum
--GROUP BY CardType;

--q2
--select cd.cardNum,ut.name 
--from Carddd cd
--join UserCardd uc on cd.cardNum= uc.CardNum

--join userTablee ut on uc.userid=ut.UserID
--where cd.balance between 20000 and 40000;

--q3 a
--SELECT name 
--FROM userTablee

--EXCEPT

--SELECT u.name 
--FROM userTablee u
--JOIN UserCardd uc ON u.UserID = uc.UserID;

---b)
SELECT u.name 
FROM userTablee u
LEFT JOIN UserCardd uc ON u.UserID = uc.UserID
WHERE uc.UserID IS NULL;


--q4 set
SELECT c.cardNum, ct.name AS CardTypeName, u.name AS OwnerName
FROM Carddd c
JOIN CardTypee ct ON c.CardType = ct.cardTypeID
JOIN UserCardd uc ON c.cardNum = uc.CardNum
JOIN userTablee u ON uc.UserID = u.UserID

EXCEPT

SELECT c.cardNum, ct.name AS CardTypeName, u.name AS OwnerName
FROM Carddd c
JOIN CardTypee ct ON c.CardType = ct.cardTypeID
JOIN UserCardd uc ON c.cardNum = uc.CardNum
JOIN userTablee u ON uc.UserID = u.UserID
JOIN Transactions t ON c.cardNum = t.cardNum
WHERE YEAR(t.transDate) = YEAR(GETDATE()) - 1


--q4 join
SELECT c.cardNum, ct.name AS CardTypeName, u.name AS OwnerName
FROM Carddd c
JOIN CardTypee ct ON c.CardType = ct.cardTypeID
JOIN UserCardd uc ON c.cardNum = uc.CardNum
JOIN userTablee u ON uc.UserID = u.UserID
LEFT JOIN Transactions t ON c.cardNum = t.cardNum
WHERE t.transID IS NULL OR YEAR(t.transDate) < YEAR(GETDATE()) - 1;



--q5
SELECT ct.name AS CardTypeName, COUNT(*) AS TotalCards
FROM Carddd c
JOIN Transactions t ON c.cardNum = t.cardNum
JOIN CardTypee ct ON c.CardType = ct.cardTypeID
WHERE t.transDate BETWEEN '2015-01-01' AND '2017-12-31'
GROUP BY ct.name
HAVING SUM(t.Amount) > 6000;



--q6
SELECT u.UserID, u.name, u.phoneNum, u.city, c.cardNum, ct.name AS CardTypeName
FROM userTablee u
JOIN UserCardd uc ON u.UserID = uc.UserID
JOIN Carddd c ON uc.CardNum = c.cardNum
JOIN CardTypee ct ON c.CardType = ct.cardTypeID
WHERE DATEDIFF(month, GETDATE(), c.ExpireDate) <= 3;


--q7
SELECT u.UserID, u.name
FROM userTablee u
JOIN UserCardd uc ON u.UserID = uc.UserID
JOIN Carddd c ON uc.CardNum = c.cardNum
GROUP BY u.UserID, u.name
HAVING SUM(c.balance) >= 5000;


--q8
SELECT c1.cardNum AS Card1, c2.cardNum AS Card2
FROM Carddd c1
JOIN Carddd c2 ON c1.cardNum < c2.cardNum
WHERE YEAR(c1.ExpireDate) = YEAR(c2.ExpireDate);

-- 9- 
SELECT u1.UserID AS UserID1, u1.name AS Name1, u2.UserID AS UserID2, u2.name AS Name2
FROM userTablee u1
JOIN userTablee u2 ON u1.UserID < u2.UserID
WHERE LEFT(u1.name, 1) = LEFT(u2.name, 1);

-- 10-
SELECT u.UserID, u.name
FROM userTablee u
JOIN UserCardd uc1 ON u.UserID = uc1.UserID
JOIN Carddd c1 ON uc1.CardNum = c1.cardNum AND c1.CardType = 1 -- Debit card
JOIN UserCardd uc2 ON u.UserID = uc2.UserID
JOIN Carddd c2 ON uc2.CardNum = c2.cardNum AND c2.CardType = 2 -- Credit card

-- 11
SELECT u.city AS CityName, COUNT(DISTINCT u.UserID) AS NumberOfUsers, SUM(t.Amount) AS TotalAmount
FROM userTablee u
JOIN UserCardd uc ON u.UserID = uc.UserID
JOIN Carddd c ON uc.CardNum = c.cardNum
JOIN Transactions t ON c.cardNum = t.cardNum
GROUP BY u.city;