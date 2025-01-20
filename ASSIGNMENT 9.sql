create database WorkerdB;

use WorkerdB;

create table WORKER(
Worker_ID int primary key auto_increment,
FirstName varchar(25),
LastName varchar(25),
Salary INT(15),
JoiningDate datetime,
Department varchar(25));

desc WORKER;

insert into WORKER values
(10080, 'Emmanuel'   ,  'Franklin'  ,   99351  ,    '2021-07-26 ',  'Software Engineering' ),
(10026,	'Uriah'      ,	'Bridges'   ,	62506  ,	'2019-09-20' ,	'Production'           ),
(10084,	'Paula'      ,	'Small'     ,	104437 ,	'2023-02-11' ,	'IT'                   ),
(10196,	'Edward'     ,	'Buck'      , 	64955  ,	'2018-12-10' ,	'Production'           ),       
(10088,	'Michael'    ,	'Riordan'   ,	64991  ,	'2021-06-21' ,	'Production'           ),       
(10069,	'Jasmine'    ,	'Onque'     , 	50825  ,	'2019-06-29' ,	'Production'           ),
(10194,	'Latia'	     ,  'Costa'     ,	95660  ,	'2022-04-06' ,	'Software Engineering' ),      
(10250,	'Joseph'     ,	'Martins'   ,	50178  ,	'2022-01-21' ,	'IT'				   ),
(10012,	'Bartholemew',	'Khemmich'  ,	92328  ,	'2022-05-25' ,	'IT'                   ),
(10245,	'Reid'	     ,  'Park'      ,	110000 ,	'2021-01-16' ,	'IT'                   ),
(10199,	'Jaydon'	 ,  'Blackburn' ,	103613 ,	'2022-11-08' ,	'IT'                   ),
(10081,	'Bridger'	 ,  'Carter'    ,	106367 ,	'2022-10-13' ,	'AdminOffices'         ),
(10238,	'Axel'	     ,  'Howe'	    ,   63000  ,	'2023-03-06' ,	'AdminOffices'         ), 
(10188,	'Saniya'	 ,  'Yu'	    ,   74326  ,	'2021-04-18' ,	'Sales'                ),
(10150,	'Aliana'	 ,  'Nolan'     ,	77692  ,    '2018-09-13' ,	'Software Engineering' ),
(10085,	'James'	     ,  'Duke'	    ,   93396  ,	'2018-12-03' ,	'Software Engineering' ),
(10040,	'Celia'	     ,  'Curtis'	,   71860  ,	'2020-05-06' ,	'Sales'                ),
(10080,	'Emmanuel'	 ,  'Franklin'	,   99351  ,	'2021-07-26' ,	'AdminOffices'         ),
(10142,	'Ronnie'	 ,  'Mayer'	    ,   59370  ,	'2023-06-17' ,	'Sales'
);       


select * from WORKER order by Worker_ID;

# 1) Stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.
delimiter //
create procedure NEWColumn(IN ID int, Fname varchar(25), Lname varchar(25), Salary int(15), StartDate date, Dept varchar(25))
begin
insert into WORKER values(ID,Fname,Lname,Salary,StartDate,Dept);
end//
delimiter ;

call NEWColumn(10134,'Abdullah','Ellison', 93046, '2021-11-23',	'AdminOffices');

select * from WORKER where Worker_ID=10134;


# 2) Stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY.

delimiter //
create procedure Salary(IN EMPID int, OUT p_salary int (15))
begin
select Salary into p_salary from WORKER
where Worker_ID=EMPID;
end//
delimiter ;

set @p_salary = 0;
call Salary(10012,@p_salary);

select @p_salary AS Salary_of_Bartholemew;

# 3) Stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT & update the department of the worker with the given ID.
delimiter //
create procedure IDUpdate(IN EMPID int, DEPT varchar (25))
begin
update WORKER
set Department=DEPT
where Worker_ID=EMPID;
end//
delimiter ;

call IDUpdate(10080,'Software Engineering');

select * from WORKER where Worker_ID=10080;

# 4) Stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount & retrieve the number of workers in the given department.

delimiter //
create procedure DeptCount(IN DEPT varchar(25), OUT p_workerCount int(15))
begin
select  count(DEPT)into p_workerCount from WORKER where Department=DEPT ;
end//
delimiter ;

set @p_workerCount = 0;
call DeptCount('Production',@p_workerCount);

select @p_workerCount AS NO_of_Workers_IN_Production;

# 5) Stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary & retrieve the average salary of all workers.

 delimiter //
create procedure AVGSALARY(IN DEPT varchar(25), OUT p_avgSalary int(15))
begin
select  avg(Salary) into p_avgSalary from WORKER where Department=DEPT;
end//
delimiter ;

set @p_avgSalary = 0;
call AVGSALARY('Software Engineering',@p_avgSalary);

select @p_avgSalary AS AVG_SALARY_OF_SoftwareEngineerings;
