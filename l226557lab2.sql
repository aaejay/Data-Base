
create database AhmedJaved


create table Students
(
RollNum int not null primary key,
Name varchar(250),
Age int,
GPA float,
DOB datetime,
)

create table Studentss
(
batchNo int,
serialNo int,
Name varchar (250),
Age int,
GPA float,
DOB datetime,
Primary key (batchNo,serialNo)
)

create table Studentsss
(
RollNo int not null ,
Name varchar (250) ,
Age int,
GPA float,
DOB datetime,
)
alter table Studentsss add constraint Primarykey Primary key (RollNo)

create table BookIssue
(
BookID int not null primary key,
IssuedTo int FOREIGN KEY References Students(RollNum) ON DELETE NO ACTION ON UPDATE NO ACTION NOT NULL
)

INSERT INTO Students
VALUES (6557,'Ahmed',19,3.25,2003-01-14 00:00:00.000)

insert into Students
VALUES (6800,'Ali',22,2.89,2003-14-2 00:00:00.000)

delete from Students
where age = 22

Update Students
set Age = 33
where Name = 'Ahmed'


