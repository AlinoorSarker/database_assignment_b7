--- Create a database named database_assignment
CREATE DATABASE database_assignment;

-- Create a table named customers
CREATE TABLE customers (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  date_of_birth DATE NOT NULL,
  phone VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(255),
  points INT NOT NULL,
  PRIMARY KEY (id)
);

-- Insert the following customer data
INSERT INTO customers (first_name, last_name, date_of_birth, phone, address, city, state, points) VALUES
('Barbara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', 2273),
('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', 947),
('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', 2967),
('Ambur', 'Roseburgh', '1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', 'FL', 457),
('Clemmie', 'Betchley', '1973-11-07', NULL, '5 Spohn Circle', 'Arlington', 'TX', 3675);

-- Show only 2 members whose points are more than 1000
SELECT * FROM customers WHERE points > 1000 LIMIT 2;

-- Find the customers whose age is from 1980 to 1990 or points less than 1000
SELECT * FROM customers WHERE (date_of_birth BETWEEN '1980-01-01' AND '1990-12-31') OR points < 1000;

-- Order the customers by points in ascending order
SELECT * FROM customers ORDER BY points ASC;

-- Find the customer whose name contains 'burgh' using a Regular Expression
SELECT * FROM customers WHERE first_name REGEXP 'burgh';

-- Find a customer who does not have a phone number
SELECT * FROM customers WHERE phone IS NULL;

-- Change the 'Date of Birth' column name to 'dob'
ALTER TABLE customers CHANGE COLUMN date_of_birth dob DATE;

-- Find the max point holder customer name
SELECT first_name FROM customers ORDER BY points DESC LIMIT 1;

-- Execute a query for the following scenario. If customers have points less than 1000, they are bronze members. If customers have points of more than 1000 and less than 2000, they are silver members. If customers have points of more than 2000 and less than 3000, they are gold members. If customers have points of more than 3000, they are platinum members.
SELECT first_name, points,
  CASE
    WHEN points < 1000 THEN 'Bronze'
    WHEN points >= 1000 AND points < 2000 THEN 'Silver'
    WHEN points >= 2000 AND points < 3000 THEN 'Gold'
    ELSE 'Platinum'
  END AS membership_status
FROM customers;