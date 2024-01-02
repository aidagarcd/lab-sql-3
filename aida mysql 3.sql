-- How many distinct (different) actors' last names are there?
-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
-- How many movies were released with "PG-13" rating?
-- Get 10 the longest movies from 2006.
-- How many days has been the company operating (check DATEDIFF() function)?
-- Show rental info with additional columns month and weekday. Get 20.
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
-- How many rentals were in the last month of activity?

use sakila;
select distinct last_name from actor;
select distinct language_id from film;
SELECT COUNT(*) AS count_pg13 FROM film WHERE rating = 'PG-13';
SELECT COUNT(*) AS length FROM film WHERE release_year = 2006 ORDER BY length LIMIT 10; 
SELECT DATEDIFF(NOW(), 'fecha_inicio_operaciones') AS days_operating;
SELECT rental_id, rental_date, MONTH(rental_date) AS rental_month, DAYNAME(rental_date) AS rental_weekday FROM rental LIMIT 20;
SELECT *,
       DAYNAME(rental_date) AS rental_weekday,
       case
		when DAYNAME(rental_date) in ('Saturday', 'Sunday') then 'weekend'
		else 'weekday'
	end as 'daytype'
FROM rental
LIMIT 20;

select count(*) from rental where month(return_date) = 8 and year(return_date) = 2005;


