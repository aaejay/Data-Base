use master
go 
Create database ATM
go 
use ATM
go


create table [UserType](
[userTypeId] int primary key,
[name] varchar(20) not null
)
go
create table [User](
[userId] int primary key,
[name] varchar(20) not null,
[userType] int foreign key references UserType([userTypeId]),
[phoneNum] varchar(15) not null,
[city] varchar(20) not null
)
go
create table CardType(
[cardTypeID] int primary key,
[name] varchar(15),
[description] varchar(40) null
)
go
create Table [Card](
cardNum Varchar(20) primary key,
cardTypeID int foreign key references  CardType([cardTypeID]),
PIN varchar(4) not null,
[expireDate] date not null,
balance float not null
)
go

Create table UserCard(
userID int foreign key references [User]([userId]),
cardNum varchar(20) foreign key references [Card](cardNum),
primary key(cardNum)
)
go

create table TransactionType(
[transTypeID] int primary key,
[typeName] varchar(15),
[description] varchar(40) null
)

go
create table [Transaction](
transId int primary key,
transDate date not null,
cardNum varchar(20) foreign key references [Card](cardNum),
amount int not null,
transType int foreign key references TransactionType(transTypeID)
)




go
INSERT [dbo].[UserType] ([userTypeId], [name]) VALUES (1, N'Silver')
GO
INSERT [dbo].[UserType] ([userTypeId], [name]) VALUES (2, N'Gold')
GO
INSERT [dbo].[UserType] ([userTypeId], [name]) VALUES (3, N'Bronze')
GO
INSERT [dbo].[UserType] ([userTypeId], [name]) VALUES (4, N'Common')
GO






INSERT [dbo].[User] ([userId], [name], [userType],[phoneNum], [city]) VALUES (1, N'Ali',2, N'03036067000', N'Narowal')
GO
INSERT [dbo].[User] ([userId], [name],  [userType],[phoneNum], [city]) VALUES (2, N'Ahmed',1, N'03036047000', N'Lahore')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (3, N'Aqeel',3, N'03036063000', N'Karachi')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (4, N'Usman',4,  N'03036062000', N'Sialkot')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (5, N'Hafeez',2, N'03036061000', N'Lahore')
GO







INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (3, N'Gift', N'Enjoy')
GO





INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'6569', 3, N'1770', CAST(N'2022-07-01' AS Date), 43025.31)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'3336', 3, N'0234', CAST(N'2020-03-02' AS Date), 14425.62)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'6566', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'6456', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'3436', 2, N'0034', CAST(N'2020-09-02' AS Date), 34025.12)
GO




INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'6569')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'3336')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (3, N'6566')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'3436')
GO





INSERT [dbo].[TransactionType] ([transTypeID], [typeName]) VALUES (1, N'Withdraw')
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName]) VALUES (2, N'Deposit')
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName]) VALUES (3, N'Scheduled')
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName]) VALUES (4, N'Failed')
GO





INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (1, CAST(N'2017-02-02' AS Date), N'6569', 500,1)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (2, CAST(N'2018-02-03' AS Date), N'3436', 3000,3)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (3, CAST(N'2017-05-06' AS Date), N'6566', 2500,2)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (4, CAST(N'2016-09-09' AS Date), N'6566', 2000,1)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (5, CAST(N'2015-02-10' AS Date), N'3336', 6000,4)
GO


Select * from UserType
Select * from [User]
Select * from UserCard
Select * from [Card]
Select * from CardType
Select * from [Transaction]
Select * from TransactionType



select cardNum from Card
where cardNum not in (select cardNum from [Transaction])
--q2
select u.name from [User] u join UserCard 
on u.userid=UserCard.userID join [Card] on 
UserCard.cardNum=Card.cardNum 
WHERE Card.balance = (select max(balance) from [Card])

--q3
select u.name,
(select ut.name from UserType ut where ut.userTypeId=u.userType) as UserType from [User] u

--q4
select u.name from [User] u join UserCard 
on u.userid=UserCard.userID join [Card] on 
UserCard.cardNum=Card.cardNum join [Transaction] T on
Card.cardNum=T.cardNum join TransactionType TT on T.transType=TT.transTypeID
where typeName='Failed'


--q5
with UTcount as(
select u.name,count(transId) maximum FROM [User] u join UserCard 
on u.userid=UserCard.userID join [Card] on 
UserCard.cardNum=Card.cardNum join [Transaction] T on
Card.cardNum=T.cardNum 
group by u.name)
select name from UTcount
where maximum = (select max(maximum) from UTcount)


--q6


with CreditCount as(
select ut.name,count(uc.userID) MaxCards from UserType ut
join [User] u  on ut.userTypeId=u.userType
JOIN UserCard uc on u.userId=uc.userID 
join Card c on uc.cardNum=c.cardNum join CardType ct on c.cardTypeID=ct.cardTypeID
group by ut.name)
select [name] from CreditCount
where maxCards = (select max(maxCards) from CreditCount)

--q7
select ct.name, count(uc.UserID) Number_of_cards from CardType ct
join Card c on ct.cardTypeID=c.cardTypeID
join UserCard uc on c.cardNum=uc.cardNum
group by ct.name
order by count(uc.UserID) desc

--q8

--select u.name from [User] u join UserCard 
--on u.userid=UserCard.userID join [Card] on 
--UserCard.cardNum=Card.cardNum 
--WHERE Card.balance = (select max(balance) from [Card] where Card.balance<>(select max(balance) from [Card]))


--Q9


--select  ut.name from UserType ut left join
--[User] u on ut.userTypeId=u.userType
--left join UserCard 
--on u.userid=UserCard.userID left join [Card] on 
--UserCard.cardNum=Card.cardNum left join [Transaction] T on
--Card.cardNum=T.cardNum left join TransactionType TT on T.transType=TT.transTypeID
--where TT.typeName is null or TT.typeName<> 'Withdraw' and u.UserId
--not in (select  ut.name from UserType ut left join
--[User] u on ut.userTypeId=u.userType
--left join UserCard 
--on u.userid=UserCard.userID left join [Card] on 
--UserCard.cardNum=Card.cardNum left join [Transaction] T on
--Card.cardNum=T.cardNum left join TransactionType TT on T.transType=TT.transTypeID
--where TT.typeName= 'Withdraw')




SELECT UserType.name FROM UserType
LEFT JOIN [User] ON UserType.userTypeId = [User].UserType
LEFT JOIN UserCard ON [User].userId = UserCard.userID
LEFT JOIN Card ON Card.cardNum = UserCard.cardNum
LEFT JOIN [Transaction] ON [Transaction].cardNum = Card.cardNum 
LEFT JOIN TransactionType ON TransactionType.transTypeID = [Transaction].transType
WHERE (TransactionType.typeName IS NULL OR TransactionType.typeName <> 'Withdraw') AND [User].userId NOT IN
(	
SELECT [User].userId FROM UserType
LEFT JOIN [User] ON UserType.userTypeId = [User].UserType
LEFT JOIN UserCard ON [User].userId = UserCard.userID
LEFT JOIN Card ON Card.cardNum = UserCard.cardNum
LEFT JOIN [Transaction] ON [Transaction].cardNum = Card.cardNum 
LEFT JOIN TransactionType ON TransactionType.transTypeID = [Transaction].transType
WHERE TransactionType.typeName = 'Withdraw'
)