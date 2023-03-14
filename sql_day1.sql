-- Hello world!
-- This is a comment!

SELECT * FROM actor;

-- set version of hello world
SELECT * FROM actor;

-- grab first anf last name

SELECT first_name, last_name
FROM actor;

-- where clause
-- this is how we filter out the results of our conditionals


SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick'

-- single quotes for strings and literals vs double quotes for database identifiers

-- we can use LIKE instead of just = for strings
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick'

-- wildcards for use with like: _ and %
-- % is a true wildcard - any character and number of characters
-- _ is one character wildcard

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J___';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J__%hy';

-- comparison operators:
--  = and like examples above
-- Greater?less >   <   <=   >=  all valid as usual
--  NOT equal   <>

SELECT *
FROM address
WHERE district like 'Texas';

SELECT * FROM payment;

-- lets find customers who paid more than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2;

-- query customers who paid less than 7.99 dollars

SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- we can use "or and" with the where clause

SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99 AND amount >0;

-- we can also use BETWEEN works the same as <= >=

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99;

-- ORDER BY 

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99
ORDER BY amount DESC -- default (DESCENDIND)

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99
ORDER BY amount ASC -- ASCENDING

-- SQL Aggreagtions -> sum avg count min max

-- sum
SELECT SUM(amount)
FROM payment
WHERE amount > 5.0;

-- same but averages
SELECT AVG(amount)
FROM payment
WHERE amount > 5.00;

-- count
SELECT COUNT(amount)
FROM payment;

-- what about individual amounts? unique.. DISTINCT

SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.00;

-- min

SELECT MIN(amount)
FROM payment
WHERE amount > 6.00

-- max

SELECT MAX(amount)
FROM payment
WHERE amount > 6.00

--  AS renames the category

SELECT MAX(amount) AS biggest_over_7
FROM payment
WHERE amount > 6.00

-- GROUP BY 
-- any column not in aggregate must be in group by used in conjunction
--  with aggregates to notify behavior or aggregate groups row

SELECT amount, count(amount), sum(amount)
FROM payment
GROUP BY amount
ORDER BY sum(amount) DESC;

-- BRING IT BACJ TO MOR STRAIGHT FORWAR EX

SELECT amount
FROM payment
WHERE amount = 6.99

SELECT amount, count(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

--  lets look at customer ids with summed amounts for those ids
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

SELECT customer_id, sum(amount)
FROM payment
order by customer_id
GROUP BY customer_id

-- query display customr_ids that show up more than 1 time

SELECT count(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) >0;

-- general rules ..

SELECT customer_id, sum(amount) --what you want to see
FROM payment  -- form where
               -- these are our basic building blocks
WHERE customer_id BETWEEN 70 AND 80  -- how or filter
GROUP BY customer_id    --using aggregates
HAVING sum(amount)>150  -- this is the how for aggreagates or filter
ORDER BY customer_id
LIMIT 3    --always at/towards
OFFSET 1;

SELECT *
FROM payment
WHERE amount < -427.01 
LIMIT 25
OFFSET 5;

-- clauses we've talked about so far
--select <columns> <aggregates>
-- form <tables>
-- where <conditional>
--group by <columns>
-- having <conditional>
-- order by <column>
