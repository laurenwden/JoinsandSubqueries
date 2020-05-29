--#1 List all customers who live in Texas (join)
SELECT first_name, last_name, district
FROM address --TABLE A
INNER JOIN customer--TABLE B
ON address.address_id = customer.address_id
WHERE district = 'Texas';
--Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still


--#2 Get all payments above $6.99 with the customer's full name
SELECT first_name,last_name,amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;
--1431 total


--#3 Show all customers' names who have made payments over $175(subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY payment.customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);
--Patricia Johnson, Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Tommy Collazo, Karl Seal


--#4 List all customers that live in Nepal using the city table (join)
SELECT first_name,last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
--0

--#5 Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(payment_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(payment_id) DESC;
--Jon Stephens


--#6 How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating);
--G,178
--PG,194
--R,195
--NC-17,210
--PG-13,223


--#7 Show all customers who have a made a single payment above $6.99 (subquery, group by and having)
SELECT first_name,last_name, customer_id
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY payment.customer_id
	HAVING COUNT(amount) = 1
	ORDER BY customer_id DESC
);
--129 total


--#8 How many free rentals did our stores give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;
--24

