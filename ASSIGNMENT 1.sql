create database School;
use school;
create table student (
Roll_No int auto_increment primary key,
Name varchar(50) not null,
Marks int,
Grade char(1) check(Grade in('A','B','C','D','E','F'))
);

desc student;

#Adding column named Contact to table student
alter table student
add Contact_Number varchar(20);

insert into student
values
(default,'Jaiswal','44','A',9995557774),
(default,'Rohit','39','B',9876543215),
(default,'Travis','50','A',1254635555),
(default,'Jadeja','28','E',1597536458);

#Displaying table student using select command
select * from student; 

# Removing Column grade from table student
alter table student drop column grade;

#Renaming Table 
rename table student to CLASSTEN;

#Removing all rows from table CLASSTEN
truncate table CLASSTEN;

#Removing table CLASSTEN from database school
drop table CLASSTEN;




