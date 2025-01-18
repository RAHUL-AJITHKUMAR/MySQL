create database Country_Population;

use Country_Population;

create table Country(
Country_Id int primary key,
Country_name varchar(50),
Population int,
Area int);

desc country;

create table Persons(
Personal_Id int primary key auto_increment,
Fname varchar(20) not null,
Lname varchar(20) not null,
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
(6,'Stanley','Hudson',1424906,4.8,73, NULL),
(7,'Kevin','Malone',1062777,4.6,59,'East Timor'),
(8,'Kelly','Kapoor',1095351995,3.8,95,'India'),
(9,'Creed','Bratton',33098932,3.6,37,'Canada'),
(10,'Toby','Flenderson',60609153,4.2,214,'United Kingdom'),
(11,'Oscar','Martinez',25609153,4.3,200,NULL),
(12,'Angela','Martin',2060915,3.2,214, NULL);

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

select * from Persons;

#1. INNER JOIN
# Matching value from both tables
select c.Country_Id, c.Country_name, p.Fname, p.Rating
from  country c
inner join persons p on c.Country_Id=p.Country_Id order by Country_name;


#1. LEFT JOIN
select c.Country_Id, c.Country_name, p.Fname, p.Rating
from  country c
left join persons p on c.Country_Id=p.Country_Id order by Rating desc;


#1. RIGHT JOIN
select c.Country_Id, c.Country_name, p.Fname, p.Rating
from  country c
right join persons p on c.Country_Id=p.Country_Id order by Fname desc;

#2. UNION
select Country_name as Country from country
union
select Country_name as Nativity from persons;

#3. UNION ALL
select Country_name as Country from country
union all
select Country_name as Nativity from persons;

#4. ROUND function
Select Personal_Id, concat(Fname,' ',Lname) As FullName, Country_name, round(Rating) as Rounded_Ratings from persons;
