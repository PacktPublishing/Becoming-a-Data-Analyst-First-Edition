SELECT name 
FROM authors 
WHERE id IN 
 (
    SELECT author_id 
    FROM books 
    WHERE publication_year > 2019
  );


--

SELECT a.name 
FROM authors a 
JOIN books b ON b.author_id = a.id 
WHERE publication_year > 2019;

--

SELECT name, 
  ( 
    SELECT COUNT(*) 
    FROM books 
    WHERE author_id = authors.id 
  ) AS book_count 
FROM authors;


--

SELECT id, title
FROM books
WHERE id IN (
    SELECT book_id
    FROM borrowed_books
    WHERE return_date IS NULL
    AND book_id IS NOT NULL
)
AND id IN (
    SELECT book_id
    FROM borrowed_books
    WHERE member_id IN (
        SELECT id
        FROM members
        WHERE join_date BETWEEN '2021-05-01' AND '2022-12-31'
    )
);

--

SELECT b.title
FROM books AS b
RIGHT JOIN borrowed_books AS bb ON b.id = bb.book_id
WHERE bb.member_id = (
    SELECT id
    FROM members
    WHERE join_date = (
        SELECT MAX(join_date)
        FROM members
    )
    LIMIT 1
);

--

WITH USA_authors AS ( 
  SELECT * FROM authors 
  WHERE country = 'USA' 
) 
SELECT * 
FROM books 
WHERE author_id IN (
  SELECT id FROM USA_authors
);

--

WITH Emeka_books AS (
      SELECT id 
      FROM books 
      WHERE author_id = (
        SELECT id 
        FROM authors 
        WHERE name = 'Emeka Okafor'
      )
    ),
    Emeka_borrowers AS (
      SELECT member_id 
      FROM borrowed_books 
      WHERE book_id IN (SELECT id FROM Emeka_books)
    )
    SELECT * 
    FROM members 
    WHERE id IN (SELECT member_id FROM Emeka_borrowers);

--

WITH april_borrowings AS (
    SELECT member_id, COUNT(*) AS books_borrowed
    FROM borrowed_books
    WHERE borrow_date >= '2022-04-01' AND borrow_date < '2022-05-01'
    GROUP BY member_id
)
SELECT m.first_name, m.last_name, ab.books_borrowed
FROM members AS m
JOIN april_borrowings AS ab ON m.id = ab.member_id;

--

SELECT member_id, MIN(borrow_date) OVER (PARTITION BY member_id) AS first_borrow_date,
MAX(borrow_date) OVER (PARTITION BY member_id) AS last_borrow_date
FROM borrowed_books;

--

SELECT member_id, MIN(borrow_date) AS first_borrow_date, MAX(borrow_date) AS last_borrow_date
FROM borrowed_books
GROUP BY member_id;

--

WITH book_borrow_counts AS (
  SELECT book_id, COUNT(member_id) AS total_borrows 
  FROM borrowed_books 
  GROUP BY book_id
)
SELECT b.title, bbc.book_id, bbc.total_borrows, 
RANK() OVER (
  ORDER BY total_borrows DESC
) AS borrow_rank 
FROM book_borrow_counts bbc
JOIN books b on b.id = bbc.book_id;

--

SELECT
  m.first_name,
  m.last_name,
  bb.borrow_date,
  COUNT(*) OVER (
    PARTITION BY bb.member_id
    ORDER BY bb.borrow_date 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_books_borrowed
FROM
  members AS m
  JOIN borrowed_books AS bb ON m.id = bb.member_id
ORDER BY
  bb.member_id,
  bb.borrow_date;

--

SELECT NOW();

--

SELECT CURDATE();

--

SELECT
  b.title,
  m.first_name,
  m.last_name,
  bb.due_date,
  bb.return_date,
  DATEDIFF(bb.return_date, bb.due_date) AS days_late
FROM books AS b
  JOIN borrowed_books AS bb ON b.id = bb.book_id
  JOIN members AS m ON bb.member_id = m.id
WHERE
  bb.return_date IS NOT NULL;

--

SELECT book_id, 
  YEAR(borrow_date) AS borrow_year,
  MONTH(borrow_date) AS borrow_month,
  DAY(borrow_date) AS borrow_day
FROM borrowed_books
WHERE borrow_date IS NOT NULL;

--

SELECT
  COUNT(*) AS Books_Borrowed_Currently
FROM
  borrowed_books
WHERE
  due_date < CURDATE() AND return_date IS NULL;

--

SELECT book_id,
  DAYOFWEEK(borrow_date) AS DayOfWeek, 
  DAYOFMONTH(borrow_date) AS DayOfMonth, 
  DAYNAME(borrow_date) AS DayName, 
  MONTHNAME(borrow_date) AS MonthName,
  DAYOFYEAR(borrow_date) AS DayOfYear 
FROM borrowed_books
WHERE borrow_date IS NOT NULL;

--

SELECT
  UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM
  members;

--

SELECT title, 
REPLACE(publisher, 'Publishing', 'Analytics') AS Analytics_pub 
FROM books;

--

WITH member_names AS (
    SELECT id, CONCAT(UPPER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(first_name, 2))) AS FirstName,
    CONCAT(UPPER(SUBSTRING(last_name, 1, 1)), LOWER(SUBSTRING(last_name, 2))) AS LastName
    FROM members
)
SELECT
    CONCAT(FirstName, ' ', LastName) AS FullName,
    COALESCE(COUNT(b.member_id), 0) AS num_books
FROM member_names AS m
LEFT JOIN borrowed_books AS b ON m.id = b.member_id
GROUP BY m.id;

--

select CONCAT(m.first_name, ' ', m.last_name) as fn from members as m;

--

-- Get a list of full names for all members
SELECT 
  CONCAT(m.first_name, ' ', m.last_name) AS full_name 
FROM 
  members AS m;

--


