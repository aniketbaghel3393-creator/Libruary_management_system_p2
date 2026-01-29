# 📚 Library Management System (SQL Project)

## 🔹 Project Overview

The **Library Management System** is a SQL-based project designed to manage library operations such as book records, members, book issuing, and returns. This project is mainly created for **beginner data analyst / SQL learners** to practice real-world database concepts.

The system helps librarians track available books, issued books, members, and return status efficiently using SQL queries.

---

## 🎯 Objectives of the Project

The main objectives of this project are:

* To understand **relational database design**
* To practice **SQL CRUD operations**
* To learn how **tables are connected using primary and foreign keys**
* To write **real-life SQL queries** similar to industry use cases
* To improve confidence in SQL for **interviews and projects**

---

## 🛠️ Tools & Technologies Used

* Database: PostgreSQL / MySQL
* Tool: pgAdmin / MySQL Workbench
* Language: SQL

---

## 🗂️ Database Schema / Tables

### 1️⃣ Branch Table

Divide branch for different type of book information.

* `branch_id` (Primary Key)
* `manager_id`
* `branch_address`
* `Contact_no`

### 2️⃣ Members Table

Stores employees information about libruary.

* `emp_id` (Primary Key)
* `emp_name`
* `position`
* `salary`
* `branch_id` (Foreign Key)


### 3️⃣ Members Table

Stores library member details.

* `member_id` (Primary Key)
* `member_name`
* `member_address`
* `reg_date`


### 4️⃣ Books Table

Stores information about books available in the library.

* `isbn`  (Primary Key),
* `book_title` 
* `category` 
* `rental_price` 
* `status` 
* `author`
* `publisher`

### 5️⃣ Issued_Status Table

Tracks which books are issued to members.

* `issue_id` (Primary Key)
* `issued_member_id` (Foreign Key)
* `issued_book_name`
* `issued_date`
* `issued_book_isbn` (Foreign Key)
* `issued_emp_id` (Foreign Key)
  
### 6️⃣ Return_Status Table

Tracks book return information.

* `return_id` (Primary Key)
* `issue_id` (Foreign Key)
* `return_book_name` 
* `return_date`
* `return_book_isbn` (Foreign Key)


---

• Database Creation: Created a database named Libraury_management_project_p2.
• Table Creation: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.

CREATE DATABASE Libruary_management_project_p2;

DROP TABLE IF EXISTS branch;
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(30),
            contact_no VARCHAR(15)
);


-- Create table "Employee"
DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
            emp_id VARCHAR(10) PRIMARY KEY,
            emp_name VARCHAR(30),
            position VARCHAR(30),
            salary DECIMAL(10,2),
            branch_id VARCHAR(10),
            FOREIGN KEY (branch_id) REFERENCES  branch(branch_id)
);


-- Create table "Members"
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
            member_id VARCHAR(10) PRIMARY KEY,
            member_name VARCHAR(30),
            member_address VARCHAR(30),
            reg_date DATE
);



-- Create table "Books"
DROP TABLE IF EXISTS books;
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price DECIMAL(10,2),
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);



-- Create table "IssueStatus"
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(30),
            issued_book_name VARCHAR(80),
            issued_date DATE,
            issued_book_isbn VARCHAR(50),
            issued_emp_id VARCHAR(10),
            FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
            FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
            FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn) 
);



-- Create table "ReturnStatus"
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);





## 🔄 CRUD Operations Explained

### ➕ CREATE (Insert Data)

Used to add new records into tables.

* Add new books
* Register new members
* Issue books

### 📄 READ (Retrieve Data)

Used to fetch data from database.

* View all available books
* Check issued books
* Find overdue books
* Member-wise book history

### ✏️ UPDATE (Modify Data)

Used to update existing records.

* Update available book copies
* Modify member details
* Update return status

### ❌ DELETE (Remove Data)

Used to delete records when required.

* Remove inactive members
* Delete damaged or lost book records

---

## 📌 Sample SQL Queries

* List all available books
* Find books issued by a specific member
* Count total books by category
* Calculate fine for late returns

---

## 📊 Key Learnings

* Understanding database relationships
* Practical use of JOINs
* Handling real-world scenarios using SQL
* Writing optimized queries

---

## 🚀 Future Improvements

* Add book reservation feature
* Add admin and user roles
* Integrate with frontend application
* Create reports using SQL views

---

## 👤 Author

**Aniket Baghel**
Aspiring Data Analyst | SQL | Python | Data Analysis

---

## 📎 Conclusion

This project helped me strengthen my SQL fundamentals and understand how databases are used in real-world applications like library systems. It is a beginner-friendly project and a strong addition to a data analyst portfolio.
