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
SELECT first_name, last_name FROM customers ORDER BY points DESC LIMIT 1;

-- Execute a query for the following scenario.
-- If customers have points less than 1000, they are bronze members.
-- If customers have points of more than 1000 and less than 2000, they are silver members.
-- If customers have points of more than 2000 and less than 3000, they are gold members.
-- If customers have points of more than 3000, they are platinum members.

SELECT first_name, last_name,
  CASE WHEN points < 1000 THEN 'Bronze'
       WHEN points BETWEEN 1000 AND 2000 THEN 'Silver'
       WHEN points BETWEEN 2000 AND 3000 THEN 'Gold'
       ELSE 'Platinum'
  END AS membership_status
FROM customers;