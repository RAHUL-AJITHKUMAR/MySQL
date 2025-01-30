create database PRODUCT;

use PRODUCT;

create table Customers(
 Customer_ID varchar(30) primary key,
 First_name varchar(30) not null,
 Last_name varchar(30),
 Email varchar(40) not null,
 Phone_no varchar(35) not null,
 Address varchar(50),
 City varchar(30),
 State varchar(30),
 Zip_code int,
 Country varchar(25));
 
 insert into Customers
 values
(1001,	'Scott'      ,	'Sheppard'   ,	 'perezjanet@example.org'	  ,  '421-429-7655-39421'	 ,    '597 Smith Loint'	                  ,    'Hollandfort'	     ,   'NV'  ,    '57588'	, 'Micronesia'),
(1002,	'Stanley'    ,	'Lewis'	     ,   'grossmark@example.com'	  ,  '+1-451-574-5308-1681'	 ,    '8116 Stuart Toop'	              ,    'Port_Margaretfurt'	 ,   'TN'  ,    '14726'	, 'Greenland'),
(1003,	'Javier'     ,	'Li'         ,   'katiemaldonado@example.com' ,	 '(858)901-5499'	     ,    '5940 Barr Villages Suite 075'	  ,    'Dianaland'	         ,   'TX'  ,    '4699'	, 'China'),
(1004,	'Christopher',	'Johnston'   ,	 'sheila73@example.com'	      ,  '(853)681-1839-2010'	 ,    '442 Lewis Mount'	                  ,    'Youngfurt'	         ,   'GA'  ,    '34455'	, 'Ghana'),
(1005,	'Melissa'    ,	'Hicks'	     ,   'emilypatterson@example.org' ,	 '364-575-8478-67812'	 ,    '95961 Taylor Circles Apt. 169'	  ,    'East Ashleyborough'	 ,   'CAL' ,    '21014'	, 'United States'),
(1006,	'Christian'  ,	'Maddox'     ,   'pvelasquez@example.net'	  ,  '(894)940-2919'	     ,    '3030 Bell Islands'				  ,    'Boonefort'	         ,   'NC'  ,    '34763'	, 'Liberia'),
(1007,	'Paul'       ,	'Hammond'    ,   'aclayton@example.net'	      ,  '(592)449-4498'	     ,    '58473 Jenna Trail'	              ,    'Fort Barry'	         ,   'GA'  ,    '57472'	, 'Congo'),
(1008,	'Madison'    ,	'Williamson' ,   'jeffreyellis@example.com'	  ,  '001-902-992-9557-692'	 ,    '24740 Gregory Stravenue Suite 212' ,	   'News Luisfort'	     ,   'CAL' ,	'71682'	, 'United States'),
(1009,	'Rachael'    ,	'Duran'	     ,   'hamptontimothy@example.net' ,	 '+1-738-583-6354-63335' ,	  '375 Flowers Well'                  ,    'Amandashire'	     ,   'PW'  ,	'25218'	, 'Spain'),
(1010,	'Sherri'	 ,  'Taylor'	 ,   'cshaw@example.net'	      ,  '915-372-0499'	         ,    '037 Quinn Route'	                  ,    'Garrisonmouth'	     ,   'CA'  ,	'82074'	, 'Gabon'),
(1011,	'Jennifer'	 ,  'Weaver'	 ,   'sloankrista@example.org'	  ,  '852-435-8495'	         ,    '700 Quinn Green Suite 066'	      ,    'Haileyville'	     ,   'MS'  ,	'37729'	, 'Switzerland'),
(1012,	'Kyle'	     ,  'Blake'	     ,   'shelia63@example.net'	      ,  '001-527-907-9332-4819' ,	  '611 Thomas Dam Suite 296'          ,    'East Melinda'	     ,   'OH'  ,	'62970'	, 'China'),
(1013,	'James'	     ,  'Bailey'	 ,   'fraziermichelle@example.net',	 '(606)926-6770'	     ,    '4469 Holt Divide Suite 740'	      ,    'Hahnberg'	         ,   'CAL' ,	'61409'	, 'United States'),
(1014,	'Heidi'	     ,  'Wood'       ,   'brentswanson@example.org'	  ,  '(209)368-2818-1932'	 ,    '527 Jamie Viaduct'	              ,    'Christopherberg'	 ,   'CT'  ,	'34112'	, 'Central African Republic'),
(1015,	'Johnny'	 ,  'Nguyen'	 ,   'clarkdawn@example.net'	  ,  '001-970-594-9559-42440',	  '621 Mitchell Glen Apt. 704'	      ,    'Leehaven'	         ,   'WV'  ,	'82030'	, 'Kenya'),
(1016,	'Olivia'	 ,  'Watson'	 ,   'rachel98@example.com'	      ,  '+1-336-343-6187-705'	 ,    '3578 Warren Prairie Suite 287'	  ,    'North Ariel'	     ,   'NV'  ,	'37858'	, 'Belize'),
(1017,	'Anita'	     ,  'Jenkins'	 ,   'charles11@example.net'	  ,  '409-660-9413'	         ,    '6505 Dawn Burg'	                  ,    'Tonyville'	         ,   'DE'  ,	'54454'	, 'Morocco'),
(1018,	'John'	     ,  'Coleman'	 ,   'smithashley@example.org'	  ,  '332-925-0075-0800'	 ,    '5227 William Groves Apt. 165'	  ,    'South Andrewport'	 ,   'US'  ,	'22242'	, 'United States'),
(1019,	'Adam'	     ,  'Best'       ,   'joe34@example.net'	      ,  '001-466-805-0058-769'	 ,    '599 Mccoy Estate Apt. 522'	      ,    'Lake Christianshire' ,	 'CAL' ,	'84388'	, 'United States'),
(1020,	'Cheryl'	 ,  'Peterson'   ,	 'corey49@example.net'	      ,  '001-466-805-0058-769'	 ,    '331 James Springs'	              ,    'Gibbsburgh'	         ,   'MH'  ,	'70864'	, 'Costa Rica');
TRUNCATE table Customers;
SELECT * FROM Customers;

# 1) Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.

CREATE VIEW customer_info AS
SELECT concat(First_name,' ',Last_name) AS Full_Name, Email FROM Customers;

SELECT * FROM customer_info;

# 2) Create a view named US_Customers that displays customers located in the US.

create view US_Customers as
select concat(First_name,' ',Last_name) AS US_Citizens from Customers where Country = 'United States';

SELECT * FROM US_Customers;

# 3) Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 

create view Customer_details as
select concat(First_name,' ',Last_name) AS Full_Name, Email ,Phone_no, State from Customers;

SELECT * FROM Customer_details;

# 4) Update phone numbers of customers who live in California for Customer_details view
update Customer_details
set Phone_no=364-575-8478-67812 where State='CAL';

# 5) Count the number of customers in each state and show only states with more than 5 customers.
create view Count as
select State, count(State) AS Count from Customers group by State having count(State)>2;

SELECT * FROM Count;

# 6) query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 

Select State, count(State) AS number_of_customers from Customer_details group by State;

# 7) query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

SELECT * From Customer_details order by State ASC;