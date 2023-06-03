-- Populating the Authors table
INSERT INTO Authors (id, first_name, last_name, nationality) VALUES
  (1, 'Akira', 'Suzuki', 'Japanese'),
  (2, 'Amara', 'Diop', 'Senegalese'),
  (3, 'Johannes', 'Müller', 'German'),
  (4, 'Ying', 'Li', 'Chinese'),
  (5, 'Aisling', 'O''Brien', 'Irish'),
  (6, 'Carlos', 'Fernandez', 'Spanish'),
  (7, 'Adeola', 'Adeyemi', 'Nigerian'),
  (8, 'Anastasia', 'Ivanova', 'Russian'),
  (9, 'Sofia', 'Silva', 'Portuguese'),
  (10, 'Vivek', 'Patel', 'Indian');

-- Populating the Books table
INSERT INTO Books (id, title, author_id, isbn, publication_year, publisher) VALUES
  (1, 'Data Analysis with SQL', 1, '1234567890123', 2022, 'TechPress'),
  (2, 'SQL for Data Analysts', 2, '2345678901234', 2021, 'DataBooks'),
  (3, 'Mastering SQL for Data Analysis', 3, '3456789012345', 2020, 'Analytics Publishing'),
  (4, 'Efficient Data Analytics with SQL', 4, '4567890123456', 2019, 'TechPress'),
  (5, 'Advanced SQL Techniques for Data Analysts', 5, '5678901234567', 2018, 'DataBooks'),
  (6, 'SQL for Business Intelligence', 6, '6789012345678', 2021, 'Analytics Publishing'),
  (7, 'Data Wrangling with SQL', 7, '7890123456789', 2020, 'TechPress'),
  (8, 'SQL for Big Data', 8, '8901234567890', 2019, 'DataBooks'),
  (9, 'Data Visualization Using SQL', 9, '9012345678901', 2018, 'Analytics Publishing'),
  (10, 'SQL for Data Science', 10, '0123456789012', 2021, 'TechPress');

-- Populating the Members table
INSERT INTO Members (id, first_name, last_name, email, join_date) VALUES
  (1, 'Alice', 'Johnson', 'alice.johnson@example.com', '2021-01-01'),
  (2, 'Bob', 'Smith', 'bob.smith@example.com', '2021-02-15'),
  (3, 'Chiara', 'Rossi', 'chiara.rossi@example.com', '2021-05-10'),
  (4, 'David', 'Gonzalez', 'david.gonzalez@example.com', '2021-07-20'),
  (5, 'Eve', 'Garcia', 'eve.garcia@example.com', '2021-09-30'),
  (6, 'Femi', 'Adeyemi', 'femi.adeyemi@example.com', '2021-11-10'),
  (7, 'Grace', 'Kim', 'grace.kim@example.com', '2021-12-15'),
  (8, 'Henrik', 'Jensen', 'henrik.jensen@example.com', '2022-03-05'),
  (9, 'Ingrid', 'Pettersson', 'ingrid.pettersson@example.com', '2022-04-20'),
  (10, 'Jia', 'Wang', 'jia.wang@example.com', '2022-06-01');

-- Populating the Borrowed_Books table
INSERT INTO BorrowedBooks (id, book_id, member_id, borrow_date, due_date) VALUES
  (1, 1, 1, '2022-04-01', '2022-05-01'),
  (2, 2, 2, '2022-04-05', '2022-05-05'),
  (3, 3, 3, '2022-04-10', '2022-05-10'),
  (4, 4, 4, '2022-04-15', '2022-05-15'),
  (5, 5, 5, '2022-04-20', '2022-05-20'),
  (6, 6, 6, '2022-04-25', '2022-05-25'),
  (7, 7, 7, '2022-04-30', '2022-05-30'),
  (8, 8, 8, '2022-05-02', '2022-06-02'),
  (9, 9, 9, '2022-05-05', '2022-06-05'),
  (10, 10, 10, '2022-05-08', '2022-06-08'); 
