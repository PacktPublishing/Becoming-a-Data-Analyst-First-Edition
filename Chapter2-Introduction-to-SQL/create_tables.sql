-- Creating schema for the library

CREATE SCHEMA Library;

-- Creating tables within the Library schema

USE Library;

-- Creating the Authors table
CREATE TABLE Authors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  nationality VARCHAR(50)
);

-- Creating the Books table
CREATE TABLE Books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  author_id INT,
  isbn VARCHAR(20),
  publication_year INT,
  publisher VARCHAR(50),
  FOREIGN KEY (author_id) REFERENCES Authors(id)
);

-- Creating the Members table
CREATE TABLE Members (
  id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  join_date DATE,
  email VARCHAR(100) UNIQUE
);

-- Creating the BorrowedBooks table
CREATE TABLE BorrowedBooks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT,
  member_id INT,
  borrow_date DATE,
  due_date DATE,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES Books(id),
  FOREIGN KEY (member_id) REFERENCES Members(id)
);
