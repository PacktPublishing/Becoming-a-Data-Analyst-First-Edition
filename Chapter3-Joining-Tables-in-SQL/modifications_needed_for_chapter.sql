-- Droppnig all previous tables from the schema; follow the order of drop statements to prevent errors due to referential integrity (because of foreign key relationships)

DROP TABLE borrowed_books;
DROP TABLE members;
DROP TABLE books;
DROP TABLE authors;


-- Creating the authors table
CREATE TABLE authors (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR (255) NOT NULL,
country VARCHAR (100),
birth_year INT,
email VARCHAR (100) UNIQUE
);

-- Creating the books table
CREATE TABLE books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  author_id INT NOT NULL,
  isbn CHAR(13),
  publication_year INT,
  publisher VARCHAR(50),
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

 -- Creating the members table
CREATE TABLE members (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  join_date DATE,
  email VARCHAR(100) UNIQUE
);

 

-- Creating the borrowed_books table
CREATE TABLE borrowed_books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  member_id INT NOT NULL,
  borrow_date DATE,
  due_date DATE,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (member_id) REFERENCES members(id)
);

-- Populaating the tables

INSERT INTO authors (name, country, birth_year, email) VALUES
('Emeka Okafor', 'Nigeria', 1982, 'emeka.okafor@example.com'),
('Mei Lin', 'China', 1978, 'mei.lin@example.com'),
('Sophia Martin', 'USA', 1985, 'sophia.martin@example.com'),
('Juan Rodriguez', 'Spain', 1970, 'juan.rodriguez@example.com'),
('Aya Morimoto', 'Japan', 1990, 'aya.morimoto@example.com'),
('Maria Low', 'Germany', 1981, 'maria.low@example.com');

  
INSERT INTO books (title, author_id, isbn, publication_year, publisher) VALUES 
('Data Analytics for Beginners', 1, '9781111111111', 2020, 'DataPress Publishing'),
('The Art of Data Analysis', 2, '9782222222222', 2019, 'Analytical Press'),
('Mastering Python', 3, '9783333333333', 2021, 'Python Publishers'),
('SQL for Data Science', 4, '9784444444444', 2022, 'Science Publishing House'),
('The Basics of Blockchain', 5, '9786666666666', 2022, 'Blockchain Press'),
('SQL for Data Analysis', 3, '9787777777777', 2023, 'Data Analysis Press'),
('Introduction to Machine Learning', 6, '9788888888888', 2019, NULL),
('The Basics of Quantum Computing', 5, NULL, NULL, 'Quantum Press');


INSERT INTO members (first_name, last_name, email, join_date) VALUES
  ('Alice', 'Johnson', 'alice.johnson@gmail.com', '2021-01-01'),
  ('Bob', 'Smith', 'bob.smith@gmail.com', '2021-02-15'),
  ('Chiara', 'Rossi', NULL, '2021-05-10'),
  ('David', 'Gonzalez', 'david.gonzalez@gmail.com', '2021-07-20'),
  ('Eve', 'Garcia', 'eve.garcia@gmail.com', '2021-10-13'),
  ('Femi', 'Adeyemi', NULL, '2022-04-10'),
  ('Grace', 'Kim', 'grace.kim@gmail.com', '2022-08-15'),
  ('Henrik', 'Jensen', 'henrik.jensen@gmail.com', '2022-03-05'),
  ('Ingrid', 'Pettersson', 'ingrid.pettersson@gmail.com', '2023-02-20'),
  ('Jia', 'Wang', 'jia.wang@gmail.com', '2023-03-01');
  

INSERT INTO borrowed_books (book_id, member_id, borrow_date, due_date, return_date) VALUES
(3, 1, '2021-02-01', '2021-03-01', '2021-02-28'),
(1, 2, '2021-03-10', '2021-04-10', '2021-04-05'),
(4, 3, '2021-06-05', '2021-07-05', NULL),
(2, 4, '2021-09-15', '2021-10-15', '2021-10-10'),
(5, 5, '2021-11-01', '2021-12-01', '2021-11-25'),
(6, 8, '2022-03-10', '2022-04-10', '2022-04-08'),
(3, 6, '2022-05-01', '2022-06-01', NULL),
(6, 7, '2022-09-01', '2022-10-01', '2022-09-20');

-- Display all the data in each table of library schema

SELECT * FROM authors;
SELECT * FROM members;
SELECT * FROM borrowed_books;
SELECT * FROM books;