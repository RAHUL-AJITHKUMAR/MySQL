create database TeacherdB;

use TeacherdB;
#1) Create a table named teachers with fields id, name, subject, experience and salary and insert values.
create  table teachers(
ID int primary key auto_increment,
 Name varchar(25) not null,
 Subject varchar (20),
 Experience int(10),
 Salary decimal(10,2)
 );
 
 insert into teachers
 values
 (default,'Appukuttan','Maths',5,40000),
 (default,'Dashamoolam Damu','Physics',4,35000),
 (default,'Pachalam Bhasi','Chemistry',7,48000),
 (default,'Pillechan ','Geography',6,44000),
 (default,'Daddy Girija','Chemistry',6,40000),
 (default,'Rampoche','Physics',3,32000),
 (default,'Aadu Thoma','Maths',10,68000),
 (default,'Gulan','Geography',15,75000),
 (default,'Ookken tintu','Biology',13,72000),
 (default,'Dude','Chemistry',8,50000);
 
 select * from teachers;

 create table teachersaudit(
 ID int primary key auto_increment,
 Action varchar(50),
 actiontime timestamp default current_timestamp);
 
 
  # 2) Before insert trigger that will raise an error  if the salary inserted to the table is less than zero.
 delimiter //
create trigger before_insert_teacher
before insert on teachers
for each row
begin
if new.Salary < 0 then
signal sqlstate '45000'
set message_text = 'Salary cannot be negative';
end if;
end //
delimiter ;

select * from teachers;
select * from teachersaudit;

insert into teachers values(default,'Moosa','Chemistry',6,-25000);


# 3)  After insert trigger that inserts a row  to a table called teacher_log

delimiter //
create trigger After_insert_teacher
after insert on teachers
for each row
begin
insert into teachersaudit(ID, Action,actiontime)
values
(new.ID,'Insert', default);
end;
//
delimiter ;

insert into teachers values(default,'Minnal Murali','Physics',6,44000);
select * from teachers;
select * from teachersaudit;


# 4) Before delete trigger that will raise an error when try to delete a row that has experience greater than 10 years.

delimiter //
create trigger Before_delete_teacher
before delete on teachers
for each row
begin
if old.Experience > 10 then
signal sqlstate '45000'
set message_text = 'Cannot delete Teachers with more than 10 year experience';
end if;
end;
//
delimiter ;

delete from teachers where ID=9;

# 5) 

delimiter //
create trigger After_delete_teacher
after delete on teachers
for each row
begin
insert into teachersaudit(ID, Action,actiontime)
values
(old.ID,'Delete', default);
end//
delimiter ;

delete from teachers where Subject='Chemistry';

select * from teachers;
select * from teachersaudit;