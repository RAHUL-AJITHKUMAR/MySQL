CREATE DATABASE library;
USE library;

# create table "Branch"
CREATE TABLE Branch
(
Branch_no VARCHAR(15) PRIMARY KEY,
Manager_id VARCHAR(15),
Branch_address VARCHAR(30),
Contact_no VARCHAR(15)
);
DESC branch;

# Create table "Employee"
CREATE TABLE Employee
(
Emp_id VARCHAR(10) PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(10,2),
Branch_no VARCHAR(15),
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no) 
);
DESC employee;

# Create table "Books"
CREATE TABLE Books
(
ISBN bigint PRIMARY KEY,
Book_title VARCHAR(50),
Category VARCHAR(30),
Rental_Price DECIMAL(10,2),
Status char(5) check(Status in('YES','NO')),
Author VARCHAR(30),
Publisher VARCHAR(30)
);
DESC Books;


# Create table "Customer"
CREATE TABLE Customer
(
Customer_Id VARCHAR(10) PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(30),
Reg_date DATE
);
DESC customer;


# Create table "IssueStatus"
CREATE TABLE IssueStatus
(
Issue_Id VARCHAR(10) PRIMARY KEY,
Issued_cust VARCHAR(30),
Issued_book_name VARCHAR(50),
Issue_date DATE,
Isbn_book bigint,
FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_id),
FOREIGN KEY (Isbn_book) REFERENCES books(ISBN)
);
DESC issuestatus;


# Create table "ReturnStatus"
CREATE TABLE ReturnStatus
(
Return_id VARCHAR(10) PRIMARY KEY,
Return_cust VARCHAR(30),
Return_book_name VARCHAR(50),
Return_date DATE,
isbn_book2 bigint,
FOREIGN KEY (isbn_book2) REFERENCES books(ISBN) on DELETE CASCADE
);
DESC returnstatus;

SHOW TABLES;


INSERT INTO Branch VALUES
('BR100', 'GM001', 'Agincourt', '+1416-396-8943'),
('BR101', 'GM002', 'Albert Campbell', '+1416-396-8890'),
('BR102', 'GM003', 'Albion', '+1416-394-5170'),
('BR103', 'GM004', 'Alderwood', '+1416-394-5310'),
('BR104', 'GM005', 'Amesbury Park', '+1416-395-5420'),
('BR105', 'GM006', 'Annette Street', '+1416-393-7692'),
('BR106', 'GM007', 'Armour Heights', '+1416-395-5430'),
('BR107', 'GM008', 'Barbara Frum', '+1416-395-5440'),
('BR108', 'GM009', 'Beaches', '+1416-393-7703'),
('BR109', 'GM010', 'Bendale', '+1416-396-8910');

SELECT * FROM Branch;

INSERT INTO Employee VALUES
('EMP01', 'Michelle Alleyne', 'Senior Manager', 65000.00,'BR100'),
('EMP02', 'Nancy Duncan', 'District Service Manager', 45000.00,'BR108'),
('EMP03', 'Elizabeth Malak', 'Senior Manager', 75000.00,'BR108'),
('EMP04', 'Luidmila Cibic', 'District Manager', 50000.00,'BR105'),
('EMP05', 'Aly Velji', 'Senior Manager', 42000.00,'BR102'),
('EMP06', 'Kelli MacKinnon', 'District Service Manager', 43000.00,'BR102'),
('EMP07', 'Sara Tavakolian', 'District Service Manager', 44000.00,'BR101'),
('EMP08', 'Lisa Heggum', 'District Service Manager', 46000.00,'BR105'),
('EMP09', 'Jennifer Sloane', 'District Service Manager', 47000.00,'BR105'),
('EMP10', 'Leesa Tossios', 'Senior Manager', 63000.00,'BR105'),
('EMP11', 'Ashley Sealy', 'District Manager', 55000.00,'BR100'),
('EMP12', 'Eda Conte-Pitcher', 'Senior Manager', 66000.00,'BR101'),
('EMP13', 'Colin Olford', 'District Service Manager', 42000.00,'BR102'),
('EMP14', 'Alim Remtulla', 'Senior Manager', 70000.00,'BR104'),
('EMP15', 'Erin Anderson', 'District Manager', 61000.00,'BR106'),
('EMP16', 'Kim Huntley', 'Senior Manager', 65000.00,'BR106'),
('EMP17', 'Thomas Krzyzanowski', 'District Manager', 57000.00,'BR105'),
('EMP18', 'Jonathan Hoss ', 'District Manager', 51000.00,'BR104'),
('EMP19', 'Gary Sherman', 'Senior Manager', 67000.00,'BR109'),
('EMP20', 'Harman Malhi', 'District Manager', 56000.00,'BR103'),
('EMP21', 'Seth Mortezavi', 'District Manager ', 57000.00,'BR103'),
('EMP22', 'Elton Costa', 'Senior Manager', 69000.00,'BR103');

SELECT * FROM Employee;

INSERT INTO books VALUES
(9780385292870, 'So the Wind Wont Blow It All Away', 'Fiction', 11.38, 'yes', 'Richard Brautigan', 'Little, Doubleday'),
(9780345803924, 'Anna Karenina', 'Romance', 8.38, 'yes', 'Leo Tolstoy', 'Vintage'),
(9788869183157, 'Harry Potter and the Sorcerer’s Stone', 'Fantasy', 6.25, 'yes', 'J.K. Rowling', 'Pottermore Publishing'),
(9780099448761, 'Dance Dance Dance', 'Fiction', 12.99, 'yes', 'Haruki Murakami', 'Vintage'),
(9780765322845, 'Up Jim River', 'Fiction', 10.99, 'yes', 'Michael Flynn', 'Hardcover'),
(9780142437148, 'The Tale of Genji', 'Classic', 12.99, 'yes', 'Murasaki Shikibu', 'Penguin'),
(9780982081310, 'Light Boxes', 'Fiction', 5.99, 'yes', 'Shane Jones', 'Penguin'),
(9780771064869, 'Dear Life', 'Fiction', 12.99, 'yes', 'Alice Munro', 'Douglas Gibson Books'),
(9780060816223, 'Missing Mom', 'Fiction', 6.99, 'yes', 'Joyce Carol Oates', 'Ecco'),
(9780439655484, 'Harry Potter and the Prisoner of Azkaban', 'Fantasy', 6.99, 'yes', 'J.K. Rowling', 'Mass Market Paperback'),
(9780345487131, 'Earth Abides', 'Science Fiction', 0.99, 'yes', 'George R. Stewart', 'Del Rey'),
(9780976072645, 'Siddhartha', 'Philosophy', 6.99, 'yes', 'Hermann Hesse', 'Mass Market Paperback'),
(9781451627282, '11/22/63', 'Historical Fiction', 11.99, 'yes', 'Stephen King', 'Scribner'),
(9788893819930, 'Harry Potter and the Goblet of Fire', 'Fantasy', 0.99, 'yes', 'J.K. Rowling', 'Scholastic Inc'),
(0747551006, 'Harry Potter and the Order of the Phoenix', 'Fantasy', 0.00, 'yes', 'J.K. Rowling', 'Scholastic Inc'),
(9780192811943, 'Moll Flanders', 'Classic', 0.99, 'yes', 'Daniel Defoe', 'Wordsworth Editions'),
(9780007121106, 'Third Girl', 'Mystery', 3.99, 'yes', 'Agatha Christie','HarperCollins'),
(9780026203104, 'The Guns of August', 'History', 7.69, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
(9780140449082,'The Histories', 'History', 5.69, 'yes', 'Herodotus', 'Penguin Classics'),
(9780062316097, 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'yes', 'Yuval Noah Harari', 'Harper Perennial'),
(9780007120840, 'The Moving Finger', 'Mystery', 7.99, 'yes', 'Agatha Christie', 'Harper Collins'),
(9789510457610, 'A Caribbean Mystery', 'Mystery', 7.99, 'yes', 'Agatha Christie', 'Signet'),
(9780451199867, 'A Pocket Full of Rye', 'Mystery', 6.99, 'yes', 'Agatha Christie', 'Mass Market Paperback'),
(9780451199928, 'A Caribbean Mystery', 'Mystery', 6.99, 'yes', 'Agatha Christie', 'Mass Market Paperback'),
(9781841494005, 'Grave Peril', 'Fantasy', 6.99, 'yes', 'Jim Butcher', 'ROC'),
(9780002317856, 'Sleeping Murder', 'Mystery', 12.99, 'yes', 'Agatha Christie', 'Dodd Mead'),
(9788437608341, 'As I Lay Dying', 'Classic', 1.99, 'yes', 'William Faulkner', 'Vintage'),
(9781439576649, 'The Catcher in the Rye', 'Classic', 9.99, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
(9783257691955, 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
(9780333791035, 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(9780194241762, 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
(9780694524440, 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
(9780739339787, 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
(9780375706707, 'Nova', 'Science Fiction', 0.00, 'yes', 'Samuel R. Delany', 'Vintage'),
(9782820513571, 'A Fall of Moondust', 'Science Fiction', 0.00, 'yes', 'Arthur C. Clarke', 'Gollancz'),
(9780755100637, 'Greybeard', 'Science Fiction', 7.99, 'yes', 'Brian W. Aldiss', 'House of Stratus Ltd'),
(9780007237500, 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
(9780008307738, 'Fire & Blood', 'Fantasy', 11.50, 'yes', 'George R.R. Martin', 'Bantam'),
(9780375707148 , 'The Mystic Masseur', 'Fiction', 12.99, 'yes', 'Naipaul', 'Knopf Doubleday'),
(9782253025191, 'Abc du yoga', 'Fiction', 0.99, 'yes', 'Philippe de Méric', 'Mass Market Paperback');

SELECT * FROM books;
SELECT * FROM books where status='No';

UPDATE books SET status = 'No' WHERE isbn in (9780765322845,9780439655484,0747551006,9782253025191,9780755100637,9780194241762,9780002317856,9780007120840);

INSERT INTO Customer VALUES
('C-3301', 'Lilliana Cowan', 'Alexandra Park', '2022-03-15'),
('C-3302', 'Tatum Terrell', 'The Annex', '2022-04-20'),
('C-3303', 'Maddison Dixon', 'Baldwin Village', '2022-04-25'),
('C-3304', 'Shyann Hurst', 'Cabbagetown', '2022-05-15'),
('C-3305', 'Bronson Houston', 'Beaches', '2022-05-22'),
('C-3306', 'Amy Pace', 'CityPlace', '2022-05-28'),
('C-3307', 'German Hobbs', 'Yorkville', '2022-06-11'),
('C-3308', 'Saniya Mosley', 'West Don Lands', '2022-06-30'),
('C-3309', 'William Avila', 'Harbourfront', '2022-07-15'),
('C-3310', 'George Fritz', 'Toronto Islands', '2022-08-25'),
('C-3311', 'Lillie Potter', 'St. Lawrence', '2022-08-29'),
('C-3312', 'Quincy Cardenas', 'Regent Park', '2022-09-20'),
('C-3313', 'Justice Guerra', 'Old Town', '2022-10-10'),
('C-3314', 'Jace Galloway', 'Kensington Market', '2022-10-15'),
('C-3315', 'Destiney Kirby', 'Harbourfront', '2022-11-25'),
('C-3316', 'Maya Mccoy', 'Toronto Islands', '2022-12-19'),
('C-3317', 'Amiah Sweeney', 'The Annex', '2023-01-10'),
('C-3318', 'Rosemary Becker', 'Regent Park', '2023-01-16'),
('C-3319', 'Devyn Pace', 'Yorkville', '2023-02-18'),
('C-3320', 'Tatum Petty', 'Harbourfront', '2023-03-25');

SELECT * FROM Customer;

INSERT INTO IssueStatus VALUES
('ISU-01','C-3301','Up Jim River','2023-06-11',9780765322845),
('ISU-02','C-3302','Harry Potter and the Prisoner of Azkaban','2023-05-22',9780439655484),
('ISU-03','C-3303','Harry Potter and the Order of the Phoenix','2023-06-03',0747551006),
('ISU-04','C-3304','Abc du yoga','2023-07-14',9782253025191),
('ISU-05','C-3305','Greybeard','2023-06-05',9780755100637),
('ISU-06','C-3306','Jane Eyre','2023-07-15',9780194241762),
('ISU-07','C-3304','Sleeping Murder','2023-08-25',9780002317856),
('ISU-08','C-3308','The Moving Finger','2023-04-13',9780007120840),
('ISU-09','C-3309','The Mystic Masseur','2023-07-20',9780375707148),
('ISU-10','C-3310','So the Wind Wont Blow It All Away','2023-06-22',9780385292870),
('ISU-11','C-3311','Dance Dance Dance','2023-08-08',9780099448761),
('ISU-12','C-3312','Dear Life','2023-08-18',9780771064869),
('ISU-13','C-3313','A Caribbean Mystery','2023-09-15',9789510457610);

SELECT * FROM issuestatus;

INSERT INTO ReturnStatus VALUES
('RN-01','C-3301','The Mystic Masseur','2023-08-13','9780375707148'),
('RN-02','C-3302','So the Wind Wont Blow It All Away','2023-07-18','9780385292870'),
('RN-03','C-3310','Dance Dance Dance','2023-08-28','9780099448761'),
('RN-04','C-3319','Dear Life','2023-09-15','9780771064869'),
('RN-05','C-3307','A Caribbean Mystery','2023-10-05','9780451199928');
SELECT * FROM returnstatus;

# 1) Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM books WHERE Status = 'Yes';

# 2) List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

# 3) Retrieve the book titles and the corresponding customers who have issued those books.
SELECT i.Issued_book_name, c.Customer_name FROM Issuestatus i INNER JOIN
Customer c on i.Issued_cust = c.Customer_Id;

# 4) Display the total count of books in each category.
SELECT Category, COUNT(Book_title) FROM Books GROUP BY Category;

# 5) Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name AS NAME, Position AS ROLE FROM employee WHERE Salary > 50000;

# 6) List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT customer_name FROM customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN
(SELECT issued_cust FROM issuestatus);

# 7) Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(Emp_id) FROM employee GROUP BY Branch_no;

# 8) Display the names of customers who have issued books in the month of June 2023.
SELECT c.Customer_name FROM customer c INNER JOIN issuestatus i ON 
c.Customer_Id = i.Issued_cust WHERE i.Issue_date >= '2023-06-01' AND 
i.Issue_date <= '2023-06-30';

# 9) Retrieve book_title from book table containing 'history'.
SELECT Book_title AS 'History Genre'  FROM Books WHERE Category = 'History';

# 10) Retrieve the branch numbers along with the count of employees for branches having more than or equal to 3 employees.
SELECT Branch_no, COUNT(emp_id) FROM Employee GROUP BY branch_no HAVING COUNT(Emp_id) >= 3;

# 11) Retrieve the names of employees who manage branches and their respective branch addresses.
Select Emp_name, Branch_no FROM Employee WHERE Position='Senior Manager';

#12) Display the names of customers who have issued books with a rental price higher than $10.00. 
select c.Customer_name,b.Rental_Price FROM Customer c INNER JOIN issuestatus i ON c.Customer_Id = i.Issued_cust JOIN Books b ON  b.ISBN = i.Isbn_book WHERE Rental_Price> 10.00;