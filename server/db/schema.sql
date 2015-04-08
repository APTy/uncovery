DROP DATABASE uncovery;
CREATE DATABASE uncovery;

SET foreign_key_checks=0;

USE uncovery;

CREATE TABLE marks (
  id int(5) AUTO_INCREMENT,
  PRIMARY KEY (id),
  x float(10, 6),
  y float(10, 6),
  z float(10, 6),
  timestamp timestamp DEFAULT CURRENT_TIMESTAMP,
  messageId int(5),
  FOREIGN KEY (messageId) REFERENCES messages(id),
  userToken VARCHAR(255),
  FOREIGN KEY (userToken) REFERENCES users(token)
);

CREATE TABLE messages (
  id int(5) AUTO_INCREMENT,
  PRIMARY KEY (id),
  messageString text,
  score int(5) DEFAULT 0
);

CREATE TABLE votes (
  id int(5) AUTO_INCREMENT, 
  PRIMARY KEY(id),
  userToken VARCHAR(255),
  FOREIGN KEY (userToken) REFERENCES users(token),
  messageId int(5),
  FOREIGN KEY (messageId) REFERENCES messages(id)
);

CREATE TABLE users (
  token VARCHAR(255),
  PRIMARY KEY(token)
);