#creating a instagram user
CREATE DATABASE instagram;
USE instagram;

#user scheme
CREATE TABLE users(
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(50) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()

);

INSERT INTO users(username) VALUES ('pretty_cool');

#photo scheme
CREATE TABLE photos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id)

);

INSERT INTO photos(image_url, user_id) VALUES(
);


#Comments!

CREATE TABLE comments(
id INT AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(255) NOT NULL,
user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (photo_id) REFERENCES photos(id),
FOREIGN KEY (user_id) REFERENCES users(id)

);



#create likes! this is special that it can be happened only one time.

CREATE TABLE likes(
  user_id INT NOT NULL,
  photo_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows(
  follower_id INT NOT NULL,
  followee_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (followee_id) REFERENCES users(id),
  PRIMARY KEY (follower_id,followee_id)
);


CREATE TABLE tags(
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()

);

CREATE TABLE photo_tags(
  photo_id INT NOT NULL,
  tag_id INT NOT NULL,
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id),
  PRIMARY KEY (photo_id,tag_id)

);