CREATE DATABASE IF NOT EXISTS testdb;

CREATE USER IF NOT EXISTS 'test_user'@'%' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON testdb.* TO 'test_user'@'%';

FLUSH PRIVILEGES;

INSERT INTO Contents (content) VALUES ('test content 1');
INSERT INTO Contents (content) VALUES ('test content 2');
INSERT INTO Contents (content) VALUES ('test content 3');
INSERT INTO Contents (content) VALUES ('test content 4');
INSERT INTO Contents (content) VALUES ('test content 5');
INSERT INTO Contents (content) VALUES ('test content 6');
INSERT INTO Contents (content) VALUES ('test content 7');
INSERT INTO Contents (content) VALUES ('test content 8');
INSERT INTO Contents (content) VALUES ('test content 9');
INSERT INTO Contents (content) VALUES ('test content 10');