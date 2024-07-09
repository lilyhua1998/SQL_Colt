CREATE DATABASE professor_job;
USE professor_job;
#DROP DATABASE professsor_job;
DROP TABLE students;
DROP TABLE papers;
CREATE TABLE students
(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50)
);

CREATE TABLE papers
(
title VARCHAR(100),
grade INT,
student_id INT,
FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

SELECT first_name,title,grade FROM papers
JOIN students ON students.id=papers.student_id
ORDER BY students.first_name DESC, papers.grade DESC;



SELECT first_name, title, grade FROM papers
RIGHT JOIN students ON papers.student_id=students.id;
#ORDER BY papers.title

SELECT first_name, IFNULL(title,'MISSING'), IFNULL(grade,0) FROM papers
RIGHT JOIN students ON papers.student_id=students.id;

SELECT first_name, IFNULL(AVG(grade),0) AS average from papers
RIGHT JOIN students ON papers.student_id=students.id
GROUP BY students.first_name
ORDER BY average DESC;

SELECT first_name, IFNULL(AVG(grade),0) AS average, CASE
  WHEN IFNULL(AVG(grade),0)>=75 THEN 'PASSING'
  ELSE 'FAILING'
 END AS passing_status
FROM papers

RIGHT JOIN students ON papers.student_id=students.id
GROUP BY students.first_name
ORDER BY average DESC;



