--

SELECT members.first_name, members.last_name, borrowed_books.book_id  

FROM borrowed_books 

INNER JOIN members ON borrowed_books.member_id = members.id; 

--

SELECT books.title, members.first_name, members.last_name  

FROM borrowed_books AS bb   

INNER JOIN books ON bb.book_id = books.id   

INNER JOIN members ON bb.member_id = members.id; 

--

SELECT books.title AS BookTitle,

borrowed_books.borrow_date AS BorrowDate

FROM books

LEFT JOIN borrowed_books ON books.id = borrowed_books.book_id;

--

SELECT members.first_name AS MemberFirstName, members.last_name AS MemberLastName,

borrowed_books.borrow_date as BorrowDate

FROM members

RIGHT JOIN borrowed_books

ON members.id = borrowed_books.member_id;

--

SELECT members.first_name, members.last_name, books.title 

FROM members 

RIGHT JOIN borrowed_books ON members.id = borrowed_books.member_id 

JOIN books ON borrowed_books.book_id = books.id; 

--

SELECT members.first_name as MemberFirstName, 

members.last_name AS MemberLastName, 

books.title AS BorrowedBookTitle, 

borrowed_books.borrow_date AS BorrowDate

FROM books

RIGHT JOIN borrowed_books ON books.id = borrowed_books.book_id

RIGHT JOIN members ON borrowed_books.member_id = members.id;

-- this query will give error in MySQL because FULL JOIN keyword is not suported natively

SELECT members.first_name, members.last_name, books.title, borrowed_books.borrow_date

FROM members

FULL JOIN borrowed_books ON members.id = borrowed_books.member_id

JOIN books ON borrowed_books.book_id = books.id;

--

SELECT m.first_name AS MemberFirstName, 

m.last_name AS MemberLastName, 

b.title AS BorrowedBookTitle

FROM members m

LEFT JOIN borrowed_books bb ON m.id = bb.member_id

LEFT JOIN books b ON bb.book_id = b.id

UNION

SELECT m.first_name AS MemberFirstName, 

m.last_name AS MemberLastName, 

b.title AS BorrowedBookTitle

FROM members m

RIGHT JOIN borrowed_books bb ON m.id = bb.member_id

RIGHT JOIN books b ON bb.book_id = b.id;


--

SELECT members.first_name AS MemberFirstName, 

members.last_name AS MemberLastName, 

books.title as BookTitle

FROM members 

CROSS JOIN books;

--

SELECT A.first_name AS Member1FirstName, A.last_name AS Member1LastName, 

B.first_name AS Member2FirstName, B.last_name AS Member2LastName

FROM members A, members B

WHERE A.id <> B.id AND

A.join_date = B.join_date;

-- Implicit JOIN Syntax 

SELECT members.first_name, books.title

FROM members, borrowed_books, books

WHERE members.id = borrowed_books.member_id AND 
books.id = borrowed_books.book_id;

-- Explicit JOIN Syntax 

SELECT members.first_name, books.title

FROM members 

JOIN borrowed_books ON members.id = borrowed_books.member_id 

JOIN books ON books.id = borrowed_books.book_id;

-- Incorrect JOIN condition, resulting in a Cartesian product 

SELECT books.title, authors.name 

FROM books 

JOIN authors ON books.id = authors.id; 

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

