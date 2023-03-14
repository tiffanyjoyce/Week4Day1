-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';

-- 2

-- 2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 0

-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id, count(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- the highest inventory is 8 and there are many films with an inventory of 8

-- 4. How many customers have the last name ‘William’?

SELECT last_name
FROM customers
WHERE last_name = 'William';

-- 0

-- 5. What store employee (get the id) sold the most rentals?

SELECT staff_id, count(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY count(staff_id) DESC;

-- staff id 1 sold more rentals

-- 6. How many different district names are there?

SELECT count(DISTINCT(district))
FROM address;

-- 378

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

--film 508 has the most actors (15)

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT count(last_name)
FROM customer
WHERE last_name LIKE '%es';

-- 21

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT count(amount), customer_id
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY customer_id
HAVING count(amount) > 250;

-- 0

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT rating
FROM film
GROUP BY rating;

SELECT rating, count(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

-- there are 5 rating categories (PG-13, NC-17, R, PG, G) and PG-13 has the most movies

