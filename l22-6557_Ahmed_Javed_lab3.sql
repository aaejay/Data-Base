--Create Database Lab 3

--Create Table Student(
--RollNum varchar(9) ,
--Name varchar(50),
--Gender varchar(8),
--Phone_Num(20)

--);

--INSERT INTO STUDENT
--VALUES ('L164123', 'Ali Ahmad', 'Male', '0333-3333333'),
--('L164124', 'Rafia Ahmed', 'Female', '0333-3456789'),
--('L164125', 'Rafia Ahmed', 'Female', '0333-3456789');



--Create Table Attendence(
--RollNum varchar(9) Foreign Key references Student(RollNum),
--Date Date,
--Status char,
--ClassVenue int

--);

--insert into Attendence
--Values('L164123','2-22-2016','P',2),
--('L164124','2-23-2016','A',1),
--('L164125','3-4-2016','P',2);

--Create Table ClassVenue(
--ID int Primary Key,
--Building varchar(15),
--Room_num int,
--Teacher_ID int
--);

--Create Table Teacher(
--ID int Primary Key,
--Name varchar(50),
--Designation varchar(50),
--Department varchar(30)
--);

--ALTER TABLE Attendence
--ADD FOREIGN KEY (RollNum) REFERENCES Student(RollNum);


--INSERT INTO ClassVenue
--VALUES ('1', 'CS', '2', '1'),
--('2', 'Civil', '7', '2');

--INSERT INTO Teacher
--VALUES ('1', 'Sarim Baig', 'Assistant Prof.', 'Computer Science'),
--('2', 'Bismillah Jan', 'Lecturer', 'Civil Eng.'),
--('3', 'Kashif zafar', 'Professor', 'Electrical Eng.');

--ALTER TABLE ClassVenue
--ADD FOREIGN KEY (Teacher_ID) REFERENCES Teacher(ID);


--Alter Table Student
----Add WarningCount int;

--insert into Student
--Values('L162334','Fozan Shahid','Male','3.2',0) 
----it will work if we add the cols we are adding to above and the 3.2 goes into phone number but it is invalid

--insert into ClassVenue
--Values(3,'CS',5,'Ali');
--wont work because ali is an invalid id and datatype different


--Update Teacher 
--set Name='Dr Kashif Zafar'
--Where Name='Kashif zafar'

--Delete From Student
--Where RollNum='L162334'

--Delete From Student
--Where RollNum='L164123'  //wont work as it is a primary key to another foreign key in attendence table


--Delete From Attendence
--Where RollNum='L164124' AND Status='A'


--Alter Table Student
--add Cnic varchar(30)

--Alter Table Student
--drop Column Phone_Num

--Alter Table Teacher
--Add constraint Un Unique(Name)


--Alter Table Student
--add constraint Genderchoice Check(Gender='Male' or Gender='Female')

--Alter Table Attendence
--add constraint Att Check(Status='P' or Status='A')


