create database Country_Population;

use Country_Population;

create table Country(
Country_Id int primary key,
Country_name varchar(50),
Population int,
Area int);

desc country;

create table Persons(
Personal_Id int,
Fname char(20) not null,
Lname char(20) not null,
Population int,
Rating decimal(5,2),
Country_Id int,
Country_name varchar(50));

desc Persons;

Insert into Country values
(1,'Afghanistan',31056997,647500),
(5,'Andorra',71201,468),
(9,'Argentina',39921833,2766890),
(11,'Aruba',71891,193),
(16,'Bahrain',698585,665),
(37,'Canada',33098932,9984670),
(59,'East Timor',1062777,15007),
(215,'United States',298444215,9631420),
(214,'United Kingdom',60609153,244820),
(95,'India',1095351995,3287590),
(74,'Gambia',1641564,11300),
(73,'Gabon',1424906,267667);

select * from country;

Insert into Persons values
(1,'Michael','Scott',298444215,4.8,215,'United States'),
(2,'Dwight','Schrute',298444215,4.6,215,'United States'),
(3,'Jim','Halpert',60609153,4.0,214,'United Kingdom'),
(4,'Pam','Beesly',33098932,4.7,37,'Canada'),
(5,'Ryan','Howard',1424906,3.9,73,'Gabon'),
(6,'Stanley','Hudson',1424906,4.8,73,'NULL'),
(7,'Kevin','Malone',1062777,4.6,59,'East Timor'),
(8,'Kelly','Kapoor',1095351995,3.8,95,'India'),
(9,'Creed','Bratton',33098932,3.6,37,'Canada'),
(10,'Toby','Flenderson',60609153,4.2,214,'United Kingdom'),
(11,'Oscar','Martinez',25609153,4.3,200,'NULL'),
(12,'Angela','Martin',2060915,3.2,214,'NULL');

select * from persons;
# 1) distinct country names from the Persons table 
select distinct(Country_name) from persons;

# 2) first names and last names from the Persons table with aliases
select Fname,Lname,concat(Fname,' ',Lname) As FullName from persons;

# 3) all persons with a rating greater than 4.0
select concat(Fname,' ',Lname) as FullName,Rating from persons where Rating > 4.5;

# 4) countries with a population greater than 10 lakhs
Select * from Country where Population > 1000000;

# 5) persons who are from 'USA' or have a rating greater than 4.5
Select concat(Fname,' ',Lname) as FullName, Country_name,Rating from Persons where Country_name='United States' or Rating > 4.5;

# 6) all persons where the country name is NULL
Select * from Persons where Country_name = 'NULL';

# 7) all persons from the countries 'USA', 'Canada', and 'UK'
Select * from Persons where Country_name in('United States','Canada','United Kingdom');

# 8) all persons not from the countries 'India' and 'Australia'
Select * from Persons where Country_name not in('India','Australia');

# 9) all countries with a population between 5 lakhs and 20 lakhs
Select * from Country where Population between 500000 and 2000000;

# 10) all countries whose names do not start with 'C'
select * from country where Country_name not like 'C%';