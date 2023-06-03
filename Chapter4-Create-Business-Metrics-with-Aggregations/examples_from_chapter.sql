SELECT COUNT(*) AS "Currently Borrowed"  

FROM borrowed_books 

WHERE return_date IS NULL; 

--

SELECT COUNT(*) AS "TOTAL NUMBRER OF MEMBERS" 

FROM members; 

--

ALTER TABLE borrowed_books ADD COLUMN fine_amount INT; 

--

PDATE borrowed_books  

SET fine_amount = 1000  

WHERE id=2; 

UPDATE borrowed_books  

SET return_date= '2022-10-11'  

WHERE id=2; 

--

SELECT SUM(fine_amount) 

FROM borrowed_books 

WHERE return_date IS NOT NULL; 

--

SELECT AVG(column_name) 

FROM table_name 

WHERE condition; 

--

SELECT AVG(birth_year) 

FROM authors 

WHERE birth_year IS NOT NULL; 

--

SELECT MIN(join_date) FROM members; 

--

SELECT MAX(join_date) FROM members; 

--

SELECT member_id, COUNT(book_id) 

FROM borrowed_books 

GROUP BY member_id; 

--

SELECT member_id, SUM(fine_amount) 

FROM borrowed_books 

GROUP BY member_id; 

--

SELECT member_id, COUNT(book_id) as “Number of Borrowed Books” 

FROM borrowed_books 

GROUP BY member_id 

HAVING COUNT(book_id) >= 1; 

--

SELECT member_id, SUM(fine_amount) as TotalFine 

FROM borrowed_books 

GROUP BY member_id 

HAVING SUM(fine_amount) > 500; 

--

SELECT member_id, AVG(fine_amount) as AverageFine 

FROM borrowed_books 

GROUP BY member_id; 

--

SELECT member_id, COUNT(book_id) as BooksBorrowed 

FROM borrowed_books 

GROUP BY member_id; 

--

SELECT member_id, SUM(fine_amount) as TotalFine 

FROM borrowed_books 

WHERE IsActive = 1 

GROUP BY member_id; 

--

SELECT  

  member_id,  

  COUNT(book_id) as BooksBorrowed 

FROM borrowed_books 

GROUP BY member_id; 

--

