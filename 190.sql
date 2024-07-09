-- 創建資料庫
CREATE DATABASE book_database;

-- 使用資料庫
USE book_database;

DROP TABLE books;
-- 創建表格
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(100),
    author_lname VARCHAR(50),
    author_fname VARCHAR(50),
    published_date DATE,
    pages INT
);

-- 插入示例資料
INSERT INTO books (book_name, author_lname, author_fname, published_date, pages)
VALUES 
    ('Harry Potter and the Philosopher\'s Stone', 'Rowling', 'J.K.', '1997-06-26', 223),
    ('The Hobbit', 'Tolkien', 'J.R.R.', '1937-09-21', 310),
    ('A Game of Thrones', 'Martin', 'George R.R.', '1996-08-06', 694),
    ('1984', 'Orwell', 'George', '1949-06-08', 328),
    ('Pride and Prejudice', 'Austen', 'Jane', '1813-01-28', 279),
    ('The Fellowship of the Ring', 'Tolkien', 'J.R.R.', '1954-07-29', 423),
    ('The Two Towers', 'Tolkien', 'J.R.R.', '1954-11-11', 352),
    ('The Return of the King', 'Tolkien', 'J.R.R.', '1955-10-20', 416),
    ('The Great Gatsby', 'Fitzgerald', 'F. Scott', '1925-04-10', 180),
    ('Moby Dick', 'Melville', 'Herman', '1851-10-18', 635),
    ('War and Peace', 'Tolstoy', 'Leo', '1869-01-01', 1225),
    ('The Divine Comedy', 'Alighieri', 'Dante', '1320-01-01', 798),
    ('Crime and Punishment', 'Dostoevsky', 'Fyodor', '1866-01-01', 671),
    ('The Brothers Karamazov', 'Dostoevsky', 'Fyodor', '1880-01-01', 824),
    ('Brave New World', 'Huxley', 'Aldous', '1932-08-01', 311),
    ('Ulysses', 'Joyce', 'James', '1922-02-02', 730),
    ('Madame Bovary', 'Flaubert', 'Gustave', '1857-01-01', 328),
    ('The Trial', 'Kafka', 'Franz', '1925-01-01', 255),
    ('Don Quixote', 'Cervantes', 'Miguel de', '1605-01-16', 1072);


-- 查詢資料
SELECT * FROM books;

-- 開始做題--------------------------------------

-- SELEC ALL BOOKS written before 1980 (non inclusive)
SELECT * FROM books WHERE YEAR(published_date)  < 1980;
SELECT * FROM books WHERE author_lname = 'Martin' OR author_lname = 'Kafka';
SELECT * FROM books WHERE author_lname = 'Lee' AND YEAR(published_date) <=1960;
SELECT * FROM books WHERE pages BETWEEN '100' AND '400';
SELECT * FROM books WHERE author_lname LIKE 'R%' OR author_lname LIKE 'T%';
SELECT *,
  CASE
      WHEN book_name LIKE 'The%' THEN 'Short Stories'
      WHEN book_name LIKE '%and%' THEN 'What and'
      ELSE 'Novel'
  END AS type
  FROM books;
  
  
  
  
  
SELECT author_lname,author_fname,
 CASE
   WHEN COUNT(*)=1 THEN '1 book'
   ELSE CONCAT(COUNT(*),' books')
END AS count
FROM books
GROUP BY author_lname,author_fname;
