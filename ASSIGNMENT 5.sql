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
select * from persons;
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
(12,'Angela','Martin',2060915,3.2,214,NULL);

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

# 1) query to print the first three characters of Country_name from the Country table.
select Country_name,substring(Country_name,1,3) as First_Three_Char from Country;

# 2) query to concatenate first name and last name from Persons table
select Fname,Lname, concat(Fname,' ',Lname) As Fullname from Persons;

# 3)  query to count the number of unique country names from Persons table
select count(distinct(Country_name)) as count_Distinct from Persons;

# 4) query to print the maximum population from the Country table
select max(Population) as MaxPopulation from Country;

# 5) query to print the minimum population from Persons table
select min(Population) as MinPopulation from Persons;

# 6)  Insert 2 new rows to the Persons table making the Lname NULL
 Insert into Persons values
(13,'Robert','NULL',1424906,3.9,73,'Gabon'),
(14,'Karen','NULL',1095351995,3.8,95,'India');

# 7)  query to find the number of rows in the Persons table
select count(*) as TotalRows from Persons;

# 8) query to show the population of the Country table for the first 3 rows
select Country_name,Population from Country limit 3;

# 9) query to print 3 random rows of countries
select Country_name from persons order by RAND() limit 3;

# 10) List all persons ordered by their rating in descending order
select Personal_Id, concat(Fname,' ',Lname) As Fullname ,Rating from persons order by Rating DESC;

# 11) Find the total population for each country in the Persons table
Select Country_name, sum(Population) as TotalPopulation from Persons group by Country_name;

# 12) Find countries in the Persons table with a total population greater than 50,000
Select * from country where population > 50000; 

# 13)  List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
select Country_name,count(Fname) as TotalPersons, avg(Rating) as AvgRating from persons
group by Country_name having count(Country_name)>=2 order by AvgRating;
