SELECT * 

FROM books;

-- 

SELECT title, isbn 

FROM books; 

--

INSERT INTO books (title, author_id, publication_year) 

VALUES ('How to SQL book', 1, 2015); 

--

UPDATE books 

SET publication_year = 2016 

WHERE id = 11; 

--
SET SQL_SAFE_UPDATES = 0; 

UPDATE books 

SET publication_year = 2017 

WHERE title = 'How to SQL book'; 

--

DELETE FROM books 

WHERE title = 'How to SQL book'; 

--

SELECT title, author 

FROM books 

WHERE publication_year > 2010; 

-- please don't 

SeLeCT tITle, autHor_ID 

From BOOKS 

WheRE publiCatION_yeaR > 2010; 

-- thank you

INSERT INTO books (title, author) 

VALUES ('The Art of Data Analysis', 'Jane Doe'); 

--

SELECT * FROM books; 

UPDATE books SET price = price * 1.04; 

--

-- This is a single-line comment in SQL  

SELECT column1, column2 FROM table1; -- Comment at the end of a line  

--

/* This is a  

multiline comment  

in SQL */  

SELECT column1, column2 FROM table1;  

--

SELECT * 

FROM books 

WHERE publication_year < 2019; 

--

SELECT * 

FROM books 

WHERE publication_year < 2019 

ORDER BY publication_year DESC; 

--

SELECT * 

FROM books 

WHERE publication_year < 2019 

ORDER BY publication_year, publisher ASC; 

--

SELECT DISTINCT publisher 

FROM books; 

--

SELECT * 

FROM books 

ORDER BY publication_year ASC 

LIMIT 5; 

--

SELECT * 

FROM books 

WHERE publication_year >= 2020; 

--

SELECT * 

FROM books 

WHERE publication_year >= 1990 AND publication_year <= 2018 

  AND publisher = 'DataBooks'; 

--

SELECT * 

FROM books 

WHERE title LIKE 'The%'; 

--

SELECT * 

FROM Books 

WHERE title LIKE '%Data%'; 

--

SELECT *  

FROM books  

WHERE publication_year IN (2017,2022,2023); 

--

SELECT * FROM members m 

WHERE EXISTS ( 

SELECT 1  

  FROM borrowed_books b  

  WHERE b.member_id = m.id 

); 

--

SELECT title, price, price * 0.9 AS discounted_price 

FROM books; 

--

SELECT title, price, price + price AS total_cost_for_two_books 

FROM books; 

--

SELECT title, price, price - (price * 0.85) AS price_difference 

FROM books; 

--

SELECT title, price, page_count, price / page_count AS price_per_page 

FROM books; 

--

SELECT title, price, price % 7 AS remainder 

FROM books; 

--

SELECT COUNT(*) 

FROM books; 

--

SELECT AVG(page_count) 

FROM books; 

--

SELECT SUM(page_count) 

FROM books; 

--

SELECT MIN(publication_year) 

FROM books; 

--

SELECT UPPER(title) 

FROM books; 

And to get them in lowercase we would type: 

SELECT LOWER(title) 

FROM books;

--

SELECT LENGTH(title) 

FROM books; 

--

SELECT CONCAT(first_name, ' ', last_name) AS full_name 

FROM authors; 

--

SELECT *  

FROM BorrowedBooks 

WHERE due_date < CURRENT_DATE;  

--

SELECT book_id, DATEDIFF(due_date, borrow_date) AS allowed_borrow_duration  

FROM BorrowedBooks 

WHERE due_date < CURRENT_DATE; 

--

ALTER TABLE books 

ADD CONSTRAINT UNIQUE(email);

--

ALTER TABLE authors 

ADD CONSTRAINT CHECK(birth_year <= YEAR(CURRENT_DATE)); 

--

