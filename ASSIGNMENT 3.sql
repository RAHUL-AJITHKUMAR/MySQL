create database OfficeDb;
use OfficeDb;

create table Managers(
Manager_ID int auto_increment primary key,
First_name varchar(50) not null,
Last_name varchar(50) not null,
DOB date,
Age int check(Age > 0),
Last_Update date,
Gender char(1) check(Gender in('M','F','O')),
Department varchar(50) default('Not Given'),
Salary int not null);

desc Managers;
alter table Managers modify Salary int not null check(Salary > 0);
desc Managers;

# 1) Inserting 10 rows

insert into Managers
values
(default, 'Aaaliya','Bhatt','1983-10-07',41,'2024-01-15','F','IT','35000'),
(default, 'Ranbir','Kapoor','1975-05-05',49,'2024-02-15','M','IT','42000'),
(default, 'Amitabh','Bachchan','1952-04-01',72,'2024-04-15','M','HR','35000'),
(default, 'Basil','Joseph','1986-09-12',38,'2024-03-15','M','HR','50000'),
(default, 'Tamannah','Bhatia','1977-10-11',47,'2024-03-15','F','Sales','15000'),
(default, 'Prithvi','Raj','1970-08-10',54,'2024-09-15','M','HR','50000'),
(default, 'Praniti','Chopra','1979-10-03',45,'2024-10-15','F','IT','22000'),
(default, 'Kareena','Kapoor','1976-03-12',48,'2024-03-15','F','IT','33000'),
(default, 'Rishab','Shetty','1998-10-07',26,'2024-02-15','M','Sales','15000'),
(default, 'Anjali','Ameer','1988-07-01',36,'2024-05-15','O','IT','28000');

select * from managers;

# 2) query to retrieves the name and date of birth of the manager with Manager_Id 1
select concat(First_name," ",Last_name) AS Full_Name,DOB from Managers where Manager_ID=1;

# 3) query to display the annual income of all managers
select Manager_ID,concat(First_name," ",Last_name) AS Full_Name, Salary*12 AS Annual_Salary from Managers;

# 4) query to display records of all managers except ‘Aaliya’
select * from Managers where First_name <> "Aaaliya";

# 5) query to display details of managers whose department is IT and earns more than 25000 per month
select * from Managers where Department='IT' and Salary > 25000;

# 6) query to display details of managers whose salary is between 10000 and 35000
select * from Managers where Salary between 10000 and 35000;






