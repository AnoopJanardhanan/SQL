-- LIBRARY MANAGEMENT SYSTEM
CREATE DATABASE Library;
USE Library;

-- Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(20)
);
SELECT *FROM Branch;
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Library St, New York, NY', '123-456-7890'),
(2, 102, '456 Maple Ave, Los Angeles, CA', '234-567-8901'),
(3, 103, '789 Oak Dr, Chicago, IL', '345-678-9012'),
(4, 104, '101 Pine St, Houston, TX', '456-789-0123'),
(5, 105, '202 Birch Rd, Phoenix, AZ', '567-890-1234'),
(6, 106, '303 Cedar Blvd, Philadelphia, PA', '678-901-2345'),
(7, 107, '404 Elm Cir, San Antonio, TX', '789-012-3456'),
(8, 108, '505 Walnut St, Dallas, TX', '890-123-4567'),
(9, 109, '606 Chestnut Ln, San Diego, CA', '901-234-5678'),
(10, 110, '707 Redwood Blvd, San Francisco, CA', '012-345-6789');


-- Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
SELECT *FROM Employee;
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'John Doe', 'Manager', 65000, 1),
(102, 'Jane Smith', 'Store Keeper', 48000, 1),
(103, 'Michael Johnson', 'Clerk', 55000, 3),
(104, 'Emily Davis', 'Manager', 61000, 3),
(105, 'William Brown', 'Clerk', 51000, 5),
(106, 'Olivia Wilson', 'Manager', 62000, 6),
(107, 'James Martinez', 'Desk Assistant', 40000, 7),
(108, 'Isabella Anderson', 'Manager', 62000, 7),
(109, 'Henry Lee', 'Desk Assistant', 42000, 9),
(110, 'Sophia Thomas', 'Store Keeper', 49000, 10),
(111, 'Lucas King', 'Store Keeper', 48000, 1),
(112, 'Emma Hill', 'Store Keeper', 45000, 3),
(113, 'Liam Carter', 'Clerk', 55000, 3),
(114, 'Charlotte Perez', 'Clerk', 40000, 4),
(115, 'Benjamin Rivera', 'Manager', 66000, 1),
(116, 'Amelia Roberts', 'Manager', 69000, 6),
(117, 'Oliver Wright', 'Desk Assistant', 41000, 1),
(118, 'Mia Flores', 'Desk Assistant', 43000, 8),
(119, 'Ethan Baker', 'Library Technician', 45000, 3),
(120, 'Ava Lewis', 'Library Technician', 42000, 1),
(121, 'Sophia Clark', 'Manager', 67000, 1),
(122, 'Jackson Turner', 'Clerk', 58000, 2),
(123, 'Aiden Scott', 'Desk Assistant', 42000, 3),
(124, 'Isabella Reed', 'Store Keeper', 46000, 8),
(125, 'Elijah Morgan', 'Library Technician', 44000, 8);


-- Book Table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(50),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('Yes', 'No'),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);
SELECT *FROM Books;
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-3-16-148410-0', 'Data Science Handbook', 'Technology', 20.00, 'yes', 'John Doe', 'TechBooks'),
('978-1-40-289462-3', 'The Great Gatsby', 'Fiction', 15.00, 'yes', 'F. Scott Fitzgerald', 'Vintage'),
('978-0-12-345678-9', 'History of Algorithms', 'Technology', 30.00, 'no', 'Thomas H. Cormen', 'MIT Press'),
('978-0-13-110362-7', 'The History of C Programming Language', 'Technology', 25.00, 'yes', 'Brian W. Kernighan', 'Prentice Hall'),
('978-0-452-28423-4', '1984', 'Fiction', 10.00, 'no', 'George Orwell', 'Penguin'),
('978-1-61-729554-6', 'Python in Action', 'Technology', 22.50, 'yes', 'Michael T. Goodrich', 'Manning'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Fiction', 18.50, 'yes', 'Harper Lee', 'HarperCollins'),
('978-1-4516-7321-4', 'Steve Jobs Biography', 'Biography', 24.99, 'no', 'Walter Isaacson', 'Simon & Schuster'),
('978-0-7432-7356-5', 'Angels & Demons', 'Fiction', 16.00, 'yes', 'Dan Brown', 'Pocket Books'),
('978-1-250-30254-6', 'The Power of Habit', 'Self-Help', 17.00, 'yes', 'Charles Duhigg', 'Random House');


-- Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(100),
    Reg_date DATE
);
SELECT *FROM Customer;
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(201, 'Alice Walker', '789 Maple St, NY', '2021-11-12'),
(202, 'Bob Martin', '123 Oak St, LA', '2022-01-10'),
(203, 'Catherine Green', '456 Birch Rd, SF', '2023-05-15'),
(204, 'Daniel Harris', '789 Pine Ln, TX', '2022-12-30'),
(205, 'Eleanor Scott', '101 Cedar Blvd, IL', '2021-09-09'),
(206, 'Frank White', '202 Elm St, CA', '2023-06-01'),
(207, 'Grace Evans', '303 Walnut Dr, PA', '2022-07-14'),
(208, 'Henry Young', '404 Chestnut Cir, FL', '2022-10-20'),
(209, 'Irene Phillips', '505 Redwood Blvd, NY', '2021-08-22'),
(210, 'Jack Turner', '606 Maple Ave, TX', '2023-01-11');


-- Issue Status Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(50),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
SELECT *FROM IssueStatus;
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(301, 210, 'The Great Gatsby', '2023-06-15', '978-1-40-289462-3'),
(302, 202, 'To Kill a Mockingbird', '2023-07-10', '978-0-06-112008-4'),
(303, 203, 'Angels & Demons', '2023-06-20', '978-0-7432-7356-5'),
(304, 204, 'Python in Action', '2023-08-01', '978-1-61-729554-6'),
(305, 205, 'The Power of Habit', '2023-09-02', '978-1-250-30254-6'),
(306, 206, 'Data Science Handbook', '2023-06-10', '978-3-16-148410-0'),
(307, 207, 'History of Algorithms', '2023-06-18', '978-0-12-345678-9'),
(308, 208, 'The History of C Programming Language', '2023-07-25', '978-0-13-110362-7'),
(309, 205, '1984', '2023-06-05', '978-0-452-28423-4'),
(310, 210, 'Steve Jobs Biography', '2023-06-30', '978-1-4516-7321-4');



-- Return Status Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(50),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
SELECT *FROM ReturnStatus;
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(401, 201, 'The Great Gatsby', '2023-07-01', '978-1-40-289462-3'),
(402, 202, 'To Kill a Mockingbird', '2023-07-25', '978-0-06-112008-4'),
(403, 203, 'Angels & Demons', '2023-08-01', '978-0-7432-7356-5'),
(404, 204, 'Python in Action', '2023-08-20', '978-1-61-729554-6'),
(405, 205, 'The Power of Habit', '2023-09-15', '978-1-250-30254-6'),
(406, 206, 'Data Science Handbook', '2023-06-25', '978-3-16-148410-0'),
(407, 207, 'History of Algorithms', '2023-07-10', '978-0-12-345678-9'),
(408, 208, 'The History of C Programming Language', '2023-08-01', '978-0-13-110362-7'),
(409, 209, '1984', '2023-06-20', '978-0-452-28423-4'),
(410, 210, 'Steve Jobs Biography', '2023-07-15', '978-1-4516-7321-4');



-- QUESTION 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

-- QUESTION 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- QUESTION 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT Books.Book_title, Customer.Customer_name 
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- QUESTION 4. Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

-- QUESTION 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

-- QUESTION 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer_name 
FROM Customer 
WHERE Reg_date < '2022-01-01' 
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

-- QUESTION 7. Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no;

-- QUESTION 8. Display the names of customers who have issued books in the month of June 2023. 
SELECT Customer.Customer_name 
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- QUESTION 9. Retrieve book_title from book table containing history. 
SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';


-- QUESTION 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

-- QUETION 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
SELECT Employee.Emp_name, Branch.Branch_address 
FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;


-- QUESTION 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT Customer.Customer_name 
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Books.Rental_Price > 25;


