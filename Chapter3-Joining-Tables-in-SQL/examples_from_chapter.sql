SELECT members.first_name, members.last_name, borrowed_books.book_id  

FROM borrowed_books 

INNER JOIN members ON borrowed_books.member_id = members.id; 

--

SELECT books.title, members.first_name, members.last_name  

FROM borrowed_books AS bb   

INNER JOIN books ON bb.book_id = books.id   

INNER JOIN members ON bb.member_id = members.id; 

--

SELECT authors.name, books.title 

FROM authors 

LEFT JOIN books ON authors.id = books.author_id; 

--

SELECT authors.name, books.title 

FROM authors 

RIGHT JOIN books 

ON authors.id = books.author_id; 

--

SELECT members.first_name, members.last_name, books.title 

FROM members 

RIGHT JOIN borrowed_books ON members.id = borrowed_books.member_id 

JOIN books ON borrowed_books.book_id = books.id; 

--

SELECT authors.name, books.title 

FROM authors 

FULL JOIN books  

ON authors.id = books.author_id; 

--

SELECT a.name, b.title 

FROM authors a 

LEFT JOIN books b ON a.id = b.author_id 

UNION 

SELECT a.name, b.title 

FROM authors a 

RIGHT JOIN books b ON a.id = b.author_id 

WHERE a.id IS NULL; 

--

SELECT a.name, b.title 

FROM authors AS a  

CROSS JOIN books AS b; 

--

SELECT e.employee_name, m.employee_name AS manager_name 

FROM employees e 

JOIN employees m ON e.manager_id = m.employee_id; 

--

-- Implicit JOIN Syntax 

SELECT members.name, books.title 

FROM members, borrowed_books, books 

WHERE members.id = borrowed_books.member_id AND books.id = borrowed_books.book_id; 

--

-- Explicit JOIN Syntax 

SELECT members.name, books.title 

FROM members  

JOIN borrowed_books ON members.id = borrowed_books.member_id  

JOIN books ON books.id = borrowed_books.book_id; 

--

-- Incorrect JOIN condition, resulting in a Cartesian product 

SELECT books.title, authors.name 

FROM books 

JOIN authors ON books.id = authors.id; 

And this one where we do it right: 

-- Correct JOIN condition 

SELECT books.title, authors.name 

FROM books 

JOIN authors ON books.author_id = authors.id; 

--

SELECT a.name, b.title 

FROM authors AS a 

RIGHT JOIN books AS b 

ON a.id = b.author_id; 

--

