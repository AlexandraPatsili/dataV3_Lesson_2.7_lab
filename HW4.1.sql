-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

USE sakila;
 SELECT * from sakila.film;
 select * from sakila.film_category;
 
 SELECT * FROM sakila.film as f
 JOIN sakila.film_category as fc
 ON f.film_id = fc.film_id;
 
 SELECT fc.category_id, COUNT(DISTINCT fc.film_id) as 'Films' FROM sakila.film_category fc
 JOIN sakila.film f
 ON f.film_id = fc.film_id
 GROUP BY fc.category_id;
 
 
 -- 2 Display the total amount rung up by each staff member in August of 2005.
 SELECT * FROM staff;
 SELECT * FROM rental;
 
 SELECT * FROM sakila.staff as st
 JOIN sakila.rental as re
 ON st.staff_id = re.staff_id;
 
SELECT re.staff_id , COUNT(distinct re.rental_id) as 'RentalAMOUNT' FROM sakila.rental re
JOIN sakila.staff st
ON st.staff_id = re.staff_id
WHERE MONTH(rental_date) = 08 AND year(rental_date)=2005
GROUP BY re.staff_id;
 
 -- 3 Which actor has appeared in the most films?
SELECT * FROM actor; 
SELECT * FROM film_actor;

SELECT * FROM film_actor as fa
JOIN actor as ac
ON fa.actor_id=ac.actor_id;

SELECT ac.actor_id, COUNT(fa.film_id) AS NumberOfFilms from film_actor fa
join actor ac
ON fa.actor_id=ac.actor_id
GROUP BY actor_id
Order by NumberOfFilms DESC
limit 1;

-- 4 Most active customer (the customer that has rented the most number of films).

SELECT * FROM customer;
SELECT * from rental;

SELECT * from customer as c
JOIN rental as r
ON c.customer_id = r.customer_id;

SELECT r.customer_id, COUNT(r.rental_id) AS Rented FROM rental r
JOIN customer c
ON c.customer_id = r.customer_id
Group by r.customer_id
order by Rented desc
Limit 1;

-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT first_name,last_name, address FROM staff
JOIN address
ON staff.address_id = address.address_id;

-- 6 List each film and the number of actors who are listed for that film.

SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT * FROM film_actor as fa
Join actor as a
ON fa.actor_id=a.actor_id;

SELECT fa.film_id, COUNT(a.actor_id) AS NOA FROM actor a
JOIN film_actor fa
ON fa.actor_id=a.actor_id
GROUP BY fa.film_id;

-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT * from payment;
SELECT * from customer;

SELECT * from payment as p
Join customer as c
ON p.customer_id=c.customer_id;

SELECT p.customer_id, last_name, SUM(p.amount) as sum FROM payment p
JOIN customer c
ON p.customer_id=c.customer_id
group by p.customer_id, last_name
ORDER BY last_name;

-- 8 List number of films per category.

SELECT * FROM film;
SELECT * from film_category;

SELECT * FROM film as f
JOIN film_category as fg
ON f.film_id=fg.film_id;

SELECT fg.category_id, COUNT(DISTINCT f.film_id) AS NPC FROM film f
JOIN film_category fg
ON f.film_id=fg.film_id
GROUP BY fg.category_id;