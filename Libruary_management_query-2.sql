SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM members;
SELECT * FROM employees;
SELECT * FROM return_status;
SELECT * FROM issued_status;

--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
SELECT * FROM books;

--Task 2: Update an Existing Member's Address

UPDATE members
SET member_address = '125 Oak St'
WHERE member_id = 'C103';

--Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id = 'IS121';



--Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101'

--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT
    issued_emp_id,
    COUNT(*)
FROM issued_status
GROUP BY 1
HAVING COUNT(*) > 1

--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

CREATE TABLE book_issued_cnt AS
SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS issue_count
FROM issued_status as ist
JOIN books as b
ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;

--Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM books
WHERE category = 'Classic';

--Task 8: Find Total Rental Income by Category:

SELECT 
    b.category,
    SUM(b.rental_price),
    COUNT(*)
FROM 
issued_status as ist
JOIN
books as b
ON b.isbn = ist.issued_book_isbn
GROUP BY 1

--List Members Who Registered in the Last 180 Days:

SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days';

--List Employees with Their Branch Manager's Name and their branch details:

SELECT 
    e1.emp_id,
    e1.emp_name,
    e1.position,
    e1.salary,
    b.*,
    e2.emp_name as manager
FROM employees as e1
JOIN 
branch as b
ON e1.branch_id = b.branch_id    
JOIN
employees as e2
ON e2.emp_id = b.manager_id;


--Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:

CREATE TABLE expensive_books AS
SELECT * FROM books
WHERE rental_price > 7.00;

--Task 12: Retrieve the List of Books Not Yet Returned

SELECT * FROM issued_status as ist
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;

--Task 13: Identify Members with Overdue Books
--Write a query to identify members who have overdue books (assume a 30-day return period). 
--Display the member's_id, member's name, book title, issue date, and days overdue.

--members==issued_status==books==return_status.

SELECT * FROM issued_status;
SELECT * FROM return_status;
SELECT * FROM books;
SELECT * FROM return_status;
SELECT * FROM issued_status;

SELECT  
      ist.issued_member_id,
	  m.member_name,
	  b.book_title,
	  ist.issued_date,
	  CURRENT_DATE - ist.issued_date as overdue
	  
FROM issued_status as ist
JOIN members as m 
ON m.member_id = ist.issued_member_id 
JOIN books as b 
ON b.isbn = ist.issued_book_isbn
LEFT JOIN return_status as rs
ON rs.issued_id = ist.issued_id
WHERE 
    rs.return_date IS NULL
AND 
    (CURRENT_DATE - ist.issued_date) > 30
ORDER BY 1;



--Q14.Update Book Status on Return
--Write a query to update the status of books in the books table to "Yes" when they are returned 
--(based on entries in the return_status table).

SELECT * FROM issued_status
WHERE issued_book_isbn = '978-0-451-52994-2';

SELECT * FROM books
WHERE isbn = '978-0-451-52994-2';

UPDATE books 
SET status = 'no'
WHERE isbn = '978-0-451-52994-2';

SELECT * FROM return_status 
WHERE issued_id = 'IS130';

INSERT INTO return_status(return_id, issued_id, return_date)
VALUES 

('RS125', 'IS130', CURRENT_DATE);

SELECT * FROM books
WHERE isbn = '978-0-451-52994-2';

UPDATE books
SET status = 'yes'
WHERE isbn = '978-0-451-52994-2';

SELECT * FROM return_status 
WHERE issued_id = 'IS130';


--Q15.Branch Performance Report
--Create a query that generates a performance report for each branch,
--showing the number of books issued, the number of books returned, 
--and the total revenue generated from book rentals.

--issued_status == employee ==branch == books == return_status

SELECT * FROM issued_status;
SELECT * FROM employees;
SELECT * FROM branch;
SELECT * FROM books;
SELECT * FROM return_status;


SELECT * FROM employees;


SELECT 
      b.branch_id,
	  b.manager_id,
	  COUNT(ist.issued_id) as number_of_books,
	  COUNT(rs.return_id) as number_of_book_return,
      SUM(bs.rental_price) as total_revenue
	  
FROM
     issued_status as ist
JOIN employees as e 
     ON ist.issued_emp_id = e.emp_id
JOIN branch as b 
     ON e.branch_id = b.branch_id
LEFT JOIN return_status as rs 
     ON ist.issued_id = rs.issued_id 
JOIN books as bs 
     ON bs.isbn = ist.issued_book_isbn
GROUP BY 1,2;



--Q16.CTAS: Create a Table of Active Members
--Use the CREATE TABLE AS (CTAS) statement to create a new table active_members
--containing members who have issued at least one book in the last 2 months.

SELECT * FROM issued_status;

CREATE TABLE Active_members
AS
SELECT * FROM members
WHERE member_id IN (SELECT 
                        DISTINCT issued_member_id 
                     FROM issued_status 
					 WHERE 
					      issued_date >= CURRENT_DATE - INTERVAL '2 months'
				  
				  )
;

SELECT * FROM Active_members;


--Q17.Find Employees with the Most Book Issues Processed.
--Write a query to find the top 3 employees who have processed the most book issues. 
--Display the employee name, number of books processed, and their branch.		 


--employee==issued_status==branch
SELECT * FROM issued_status;
SELECT * FROM employees;


SELECT e.emp_name,
       b.*,
	   COUNT(ist.issued_id) as number_books
	   
FROM
     employees as e
JOIN issued_status as ist
     ON e.emp_id = ist.issued_emp_id
JOIN branch as b 
     ON e.branch_id = b.branch_id
GROUP BY 
     1,2
ORDER BY 
     e.emp_nam
	 











