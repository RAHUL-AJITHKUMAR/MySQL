create database Sales;

use sales;

create table Orders(
Order_Id int auto_increment primary key,
Customer_name varchar(50) not null,
Product_Category varchar(25) default 'Other',
Ordered_Item varchar(50) default 'Unknown',
Contact_No varchar(20) unique);

desc Orders;

# 1) Adding New Column
alter table Orders Add Order_quantity int ;

# 2) Renaming Table
rename table Orders to Sales_Orders;

# 3) Inserting Values into Sales_Order table
insert into Sales_Orders
values
('152156' ,'Claire' ,'Furniture' ,'Bookcases' ,3366655489 ,3),
('138688' ,'Darrin' ,'Office_Supplies' ,'Labels' ,3355566678 ,2),
('108966' , 'Sean' , 'Furniture' ,	'Tables' , 5465456545 ,5),
('143336' ,	'Zuschuss' , 'Office_Supplies' , 'Art' ,12345678,2),
('143536' ,	'Zuschuss' , 'Technology' ,	'Phones' , 1478526 ,3),
('137330' ,	'Ken' , 'Office_Supplies' ,	'Appliances' , 159753 ,7),
('156909' ,	'Sandra' , 'Furniture' , 'Chairs' ,777777 ,2),
('150630' ,	'Tracy' , 'Office_Supplies' ,'Envelopes' ,88888894 ,2),
('117590' , 'Gene' , 'Technology' ,	'Phones' ,7848752 ,7),
('120999' ,	'Linda' , 'Technology' , 'Phones' ,	8465664 ,4);

select * from Sales_Orders;

# 4) Retrieve Customer_name and Ordered_Item from Sales_Orders table
Select Customer_name,Ordered_Item from Sales_Orders;

# 5) Update Product Name for customer Ken
update Sales_Orders set Ordered_Item = 'Binders' where Order_Id = '137330';

# 6) Deleting Sales_Orders table from database
drop table Sales_Orders;
















