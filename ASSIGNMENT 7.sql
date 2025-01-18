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
(11,'Oscar','Martinez',25609153,4.3,200, NULL),
(12,'Angela','Martin',2060915,3.2,214, NULL);

select * from persons;


# 1) Adding a new column called DOB in Persons table with data type as Date.
alter table persons add column DOB date;
desc persons;
# Inserting datas into nwe column DOB using UPDATE CASE.
update persons
set DOB = 
	case
		when Personal_Id =1 then '1969-10-07'
        when Personal_Id =2 then '1965-08-30'
		when Personal_Id =3 then '1991-10-06'
        when Personal_Id =4 then '1998-04-04'
        when Personal_Id =5 then '1969-08-29'
        when Personal_Id =6 then '1949-04-03'
        when Personal_Id =7 then '1942-07-01'
        when Personal_Id =8 then '1957-03-07'
        when Personal_Id =9 then '1974-05-15'
        when Personal_Id =10 then '1949-11-11'
        when Personal_Id =11 then '1964-01-26'
        when Personal_Id =12 then '1948-04-06'
		when Personal_Id =13 then '1994-04-08'
		when Personal_Id =14 then '1983-11-15'
end
where Personal_Id in(1,2,3,4,5,6,7,8,9,10,11,12,13,14);

select * from persons;

# 2) Creating a user-defined function AGE() to calculate age using DOB.
DELIMITER $$
create function Age(DOB date)
returns int
not deterministic
no sql 
begin
return TIMESTAMPDIFF(YEAR,DOB,CURDATE());
end $$
delimiter ;

# 3) Select query to fetch the Age of all persons using the function AGE().
Select concat(Fname,' ',Lname) AS Full_Name,Age(DOB) as AGE from persons;

# 4)  Creating a Function CountryLENGTH() to find the length of each country name in the Country table.
DELIMITER //
create function CountryLENGTH(Country_name varchar(50))
returns int
not deterministic
no sql 
begin
return length(Country_name);
end //
delimiter ;

# Select query to fetch length of each country name in the Country table using function CountryLENGTH().
select Country_name, CountryLENGTH(Country_name) AS Length from Country;


# 5) Sql query to extract the first three characters of each country's name in the Country table.
select Country_name, CountryLENGTH(Country_name) AS Length, UPPER(substr(Country_name,1,3)) as First_three_CHAR from Country;


# 6) Sql query to convert all country names to uppercase and lowercase in the Country table.
select Country_name,upper(Country_name) AS Converted_UPPER, lower(Country_name) As Converted_LOWER from country;
 





