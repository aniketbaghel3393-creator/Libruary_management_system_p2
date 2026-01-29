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

### 1️⃣ Books Table

Stores information about books available in the library.

* `book_id` (Primary Key)
* `title`
* `author`
* `category`
* `published_year`
* `available_copies`

### 2️⃣ Members Table

Stores library member details.

* `member_id` (Primary Key)
* `member_name`
* `email`
* `phone`
* `membership_date`

### 3️⃣ Issued_Books Table

Tracks which books are issued to members.

* `issue_id` (Primary Key)
* `book_id` (Foreign Key)
* `member_id` (Foreign Key)
* `issue_date`
* `due_date`

### 4️⃣ Return_Status Table

Tracks book return information.

* `return_id` (Primary Key)
* `issue_id` (Foreign Key)
* `return_date`
* `fine_amount`

---

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
