--Create Database Assignment_1

--1
--Create Table DEPARTMENTS(
--ID int,
--Name varchar(25)
--);

--2
--insert into DEPARTMENTS
--Values(1226557,'Ahmed Javed'),
--(1234567,'Ali Muhammad'),
--(1111111,'Ibrahim Dar');

--3
--Create Table Employee(
--ID_Num int,
--Last_Name varchar(25),
--First_Name varchar(25),
--Dept_ID int
--);
--select * from Employee

--4
--CREATE TABLE My_Employeee (
--    ID Int NOT NULL,
--    Last_Name VARCHAR(25),
--    First_Name VARCHAR(25),
--    UserID VARCHAR(8),
--    Salary DECIMAL(9, 2),
--    PRIMARY KEY (ID)
--);
--5
--insert into My_Employeee
--Values(1,'Patel','Ralph','rpatel',795);
--6
--Insert into My_EmployeeE(ID,Last_Name,First_Name,UserID,Salary)
--Values(2,'Dancs','Betty','bdancs',860);
--7
--Select * from My_Employeee

--8
--UPDATE My_Employeee
--SET Last_Name = 'Hammad'
--WHERE Last_Name = 'Dancs';
----9
--Update My_Employeee
--Set Salary=3000
--WHERE (First_Name LIKE '%t%' OR Last_Name LIKE '%t%')
--    AND Salary BETWEEN 500 AND 2000;
--10
--Delete from My_Employeee 
--where Salary>5000

--11
Create Table MYDEPT1_L226557(
Department_ID INT Primary Key,
Name varchar(25),
Location varchar(15)
);



Create Table MYEMP1_L226557(
ID int Primary Key,
Name varchar(25),
DEPT_ID int Foreign Key References MYDEPT1_L226557(Department_ID)

);

--SELECT* FROM MYDEPT1_L226557
--SELECT* FROM MYEMP1_L226557
--12
--ALTER TABLE MYEMP1_l226557
--ALTER COLUMN Name VARCHAR(50);

--ALTER TABLE MYDEPT1_l226557
--ALTER COLUMN Name VARCHAR(50);

----EXEC sp_columns 'MYEMP1_';

--SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'MYDEPT1_l226557';

--SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'MYEMP1_l226557';

--13
ALTER TABLE MYEMP1_L226557
ALTER COLUMN ID numeric(18,0);

-- Confirm modification
SELECT * FROM MYEMP1_L226557;


--14
--INSERT INTO MYDEPT1_L226557
--Values(111,'CS','BLOCK C'),
--(112,'EE','BLOCK D'),
--(113,'CIVL', 'BLOCK A'),
--(114,'MANAGEMENT', 'BLOCK B');

--15
--INSERT INTO MYEMP1_l226557
--VALUES(226557,'Ahmed Javed',100); 
----cant insert as dept id is foreign key and i gave foreign key 111 for CS whereas here it is 100

--16
--EXEC sp_rename 'MYEMP1_L226557', 'EMP1_L226557'
--EXEC sp_rename 'MYDEPT1_L226557', 'DEPT1_L226557'

--17
--ALTER TABLE DEPT1_L226557
--DROP COLUMN Name;


--SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'DEPT1_L226557';


--18
--DROP TABLE EMP1_L226557;
--SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME = 'EMP1_L226557';
--SELECT *FROM EMP1_L226557

