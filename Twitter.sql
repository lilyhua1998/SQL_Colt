SELECT NOW();
SELECT CURTIME();
SELECT CURDATE();
#print out the current day of week as number
SELECT DAYOFWEEK(CURDATE());
#print out the day of name of that week#
SELECT DAYNAME(CURDATE());
#print out the current date and time using mm/dd/yy#
SELECT DATE_FORMAT(NOW(), '%m/%d/%y');
#Print out date like January 2nd at 3:15
SELECT DATE_FORMAT(NOW(), '%M %D at %H:%i');



#每個table要在database底下
CREATE DATABASE mydb;
USE mydb;
DROP TABLE tweet;
CREATE TABLE tweet(
content VARCHAR(180),
username VARCHAR(20) PRIMARY KEY,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME ON UPDATE NOW()
);
DESC tweet;
INSERT INTO tweet(content,username) VALUE ('really cool content', 'cool');

SELECT * FROM tweet;

ALTER TABLE tweet
ADD username VARCHAR(20);
ALTER TABLE tweet
ADD updated_at DATETIME ON UPDATE NOW();


UPDATE tweet SET content='jesus' WHERE username ='cool';



