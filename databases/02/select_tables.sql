CREATE DATABASE mydb;

USE mydb;

CREATE TABLE table1 (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL
);

CREATE TABLE table2 (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Email VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
    Age INT NOT NULL
);

ALTER TABLE table1 ADD CONSTRAINT email_fk FOREIGN KEY (Email) REFERENCES table2(Email);

INSERT INTO table1 (Username, Password, Email) VALUES
    ('user1', 'pass1', 'user1@mail.com'),
    ('user2', 'pass2', 'user2@mail.com'),
    ('user3', 'pass3', 'user3@mail.com'),
    ('user4', 'pass4', 'user4@mail.com'),
    ('user5', 'pass5', 'user5@mail.com');

INSERT INTO table2 (Email, Name, Surname, Age) VALUES
    ('user1@mail.com', 'John', 'Doe', 25),
    ('user2@mail.com', 'Jane', 'Doe', 30),
    ('user3@mail.com', 'Bob', 'Smith', 20),
    ('user4@mail.com', 'Alice', 'Johnson', 35),
    ('user5@mail.com', 'Peter', 'Parker', 28);

# Output data from first table sorted by username:
SELECT * FROM table1 ORDER BY Username;

# Print username and age sorted by age:
SELECT table1.Username, table2.Age FROM table1 JOIN table2 ON table1.Email = table2.Email ORDER BY table2.Age;

# Print all user data from both tables in one output:
SELECT * FROM table1 JOIN table2 ON table1.Email = table2.Email;
