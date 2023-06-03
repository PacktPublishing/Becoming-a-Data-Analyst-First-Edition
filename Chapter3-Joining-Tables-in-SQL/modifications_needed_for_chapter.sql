-- delete the entire tables
DROP TABLE authors; 
DROP TABLE BorrowedBooks; 

-- delete all the elements from these tables, but not the tables theirselves
DELETE FROM books; 
DELETE FROM members; 

-- Creating the Authors table 

CREATE TABLE authors ( 

id INT PRIMARY KEY, 

name VARCHAR (255) NOT NULL, 

country VARCHAR (255), 

birth_year INT, 

email VARCHAR (255) 

); 

-- Creating the Borrowed Books table 

CREATE TABLE borrowed_books ( 
  id INT AUTO_INCREMENT PRIMARY KEY, 
  book_id INT, 
  member_id INT, 
  borrow_date DATE, 
  due_date DATE, 
  return_date DATE, 
  FOREIGN KEY (book_id) REFERENCES Books(id), 
  FOREIGN KEY (member_id) REFERENCES Members(id);

-- Populating the Authors table 

INSERT INTO authors VALUES (1, 'Emeka Okafor', 'Nigeria', 1982, 'emeka.okafor@example.com'), 

(2, 'Mei Lin', 'China', 1978, 'mei.lin@example.com'), 

(3, 'Sophia Martin', 'USA', 1985, 'sophia.martin@example.com'), 

(4, 'Juan Rodriguez', 'Spain', 1970, 'juan.rodriguez@example.com'), 

(5, 'Aya Morimoto', 'Japan', 1990, 'aya.morimoto@example.com'), 

(6, "Maria Low", "Germany", 1981, "maria.low@example.com"); 


-- Re-Populating the Books table 

INSERT INTO books VALUES (1, 'Data Analytics for Beginners', 1, '978-111111111', 2020, 'DataPress Publishing'), 

(2, 'The Art of Data Analysis', 2, '978-222222222', 2019, 'Analytical Press'), 

(3, 'Mastering Python', 1, '978-333333333', 2021, 'Python Publishers'), 

(4, 'SQL for Data Science', 3, '978-444444444', 2022, 'Science Publishing House'), 

(5, 'The Basics of Quantum Computing', NULL, '978-555555555', 2023, 'Quantum Press'), 

(6, 'The Basics of Blockchain', 5, '978-666666666', 2022, 'Blockchain Press'), 

(7, 'SQL for Data Analysis', NULL, '978-777777777', 2023, 'Data Analysis Press'), 

(8, NULL, 4, '978-888888888', 2019, 'AI Publishing'); 



-- Populating the Members table 

INSERT INTO members (first_name, last_name, email, join_date) VALUES 

  ('Alice', 'Johnson', 'alice.johnson@example.com', '2021-01-01'), 

  ('Bob', 'Smith', 'bob.smith@example.com', '2021-02-15'), 

  ('Chiara', 'Rossi', 'chiara.rossi@example.com', '2021-05-10'), 

  ('David', 'Gonzalez', 'david.gonzalez@example.com', '2021-07-20'), 

  ('Eve', 'Garcia', 'eve.garcia@example.com', '2021-09-30'), 

  ('Femi', 'Adeyemi', 'femi.adeyemi@example.com', '2021-11-10'), 

  ('Grace', 'Kim', 'grace.kim@example.com', '2021-12-15'), 

  ('Henrik', 'Jensen', 'henrik.jensen@example.com', '2022-03-05'), 

  ('Ingrid', 'Pettersson', 'ingrid.pettersson@example.com', '2022-04-20'), 

  ('Jia', 'Wang', 'jia.wang@example.com', '2022-06-01'); 

 

-- Populating the Borrowed_Books table 

INSERT INTO borrowed_books (id, book_id, member_id, borrow_date, due_date) VALUES 

 (1, 1, 1, '2022-04-01', '2022-05-01'), 

 (2, 2, 2, '2022-04-05', '2022-05-05'), 

 (3, 3, 3, '2022-04-10', '2022-05-10'), 

 (4, 4, 4, '2022-04-15', '2022-05-15'), 

 (5, 5, 5, '2022-04-20', '2022-05-20'), 

 (6, 6, NULL, '2022-04-25', '2022-05-25'), 

 (7, NULL, 7, '2022-04-30', '2022-05-30'), 

 (8, 4, 8, '2022-05-02', '2022-06-02'), 

 (9, NULL, NULL, '2022-05-05', '2022-06-05'), 

 (10, 7, 10, '2022-05-08', '2022-06-08'), 

 (11, 3, 6, NULL, NULL, NULL, NULL);  
