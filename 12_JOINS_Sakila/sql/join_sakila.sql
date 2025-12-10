-- Which actor has played which film_id? 
-- With LEFT JOIN
SELECT 
a.actor_id,
a.first_name,
a.last_name,
fa.film_id
FROM actor a 
LEFT JOIN film_actor ON fa.actor_id = a.actor_id
LEFT JOIN film f ON f.film_id = fa.film_id;

-- All films with their cat
SELECT
f.title,
c.name AS category
FROM film_category fc
INNER JOIN category c ON fc.category_id = c.category_id
INNER JOIN film f ON f.film_id ON fc.film_id;

-- cross 
SELECT COUNT(*) FROM film; --to kow how many
SELECT COUNT(*) FROM category; -- same
-- then cross total is their product
SELECT COUNT(*) FROM film f
INNER JOIN category c ON category_id;

SELECT f.title, c.name AS Category
FROM film f
INNER JOIN category c ON category_id; 

-- Want to know the staff full address? = what the colum on the final table will show us
-- In the ERD, we cannot see a "table" that contains all the info at once
-- but we see links between them, common fields that they share
-- then we need to join tables/fields to get the final table
FROM staff; -- address-id, firs_name, last_name
FROM address; -- address-id, address, city_id
FROM city; -- city_id, city, country_id
FROM country; -- country_id, country

SELECT
s.first_name,
s.last_name,
a.address,
c.city,
cty.country
FROM staff s 
LEFT JOIN address a ON s.address_id = a.address_id
LEFT JOIN city c ON a.city_id = c.city_id
LEFT JOIN country cty ON cty.country_id = c.country_id;