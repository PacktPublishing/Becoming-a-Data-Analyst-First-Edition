SELECT first_name, last_name

FROM members

WHERE join_date = CURDATE();

--

SELECT book_id, member_id, borrow_date, DATEDIFF(CURDATE(), borrow_date) AS 'Days Borrowed'

FROM borrowed_books

WHERE return_date IS NULL;

--

SELECT COUNT(*) AS 'Currently Borrowed'

FROM borrowed_books 

WHERE return_date IS NULL; 

--

SELECT COUNT(*) AS 'Number of Members'

FROM members; 

--

ALTER TABLE borrowed_books ADD COLUMN fine_amount INT;

--

UPDATE borrowed_books 

SET fine_amount = DATEDIFF(CURDATE(), due_date) * 5, return_date= CURDATE()

WHERE return_date IS NULL AND CURDATE() > due_date;

--

SELECT * FROM borrowed_books;

--

SELECT SUM(fine_amount) AS 'Sum of Fines'

FROM borrowed_books 

WHERE return_date > due_date;

--

SELECT AVG(birth_year) 

FROM authors 

WHERE birth_year IS NOT NULL; 

--

SELECT MIN(join_date) AS 'Min Join Date', 

MAX(join_date) AS 'Max Join Date' 

FROM members;

--

SELECT member_id, COUNT(book_id) 

FROM borrowed_books 

GROUP BY member_id; 

--

SELECT member_id, SUM(fine_amount) 

FROM borrowed_books 

GROUP BY member_id; 

--

SELECT b.member_id, m.first_name, m.last_name,

SUM(b.fine_amount) AS 'Total Fine For Member'

FROM borrowed_books b

JOIN members m ON b.member_id = m.id

GROUP BY b.member_id, m.first_name, m.last_name;

--

SELECT member_id, SUM(fine_amount) AS 'Total Fine For Member'

FROM borrowed_books

WHERE borrow_date > '2022-01-01'

GROUP BY member_id

HAVING SUM(fine_amount) > 1000;

--

SELECT member_id, AVG(fine_amount) as 'Average Fine'

FROM borrowed_books

GROUP BY member_id;

--

SELECT member_id, COUNT(book_id) as 'Borrowed Books' 

FROM borrowed_books 

GROUP BY member_id; 

--

SELECT member_id, SUM(fine_amount) as 'Total Fine' 

FROM borrowed_books 

WHERE is_active = 1

GROUP BY member_id; 

--

SELECT member_id, 

COUNT(book_id) as 'Books Borrowed'

FROM borrowed_books

GROUP BY member_id;

--
