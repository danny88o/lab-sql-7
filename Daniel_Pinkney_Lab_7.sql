-- Lab 7
use sakila;

-- Which last names are not repeated?
select last_name, count(*) from actor
group by last_name
having count(*) = 1;

-- Which last names appear more than once?
select last_name, count(*) from actor
group by last_name
having count(*) > 1;

-- Rentals by employee.
select staff_id, count(staff_id) as "Rentals" from rental
group by staff_id;

-- Films by year.
select release_year, count(*) from film
group by release_year;

-- Films by rating.
select rating, count(*) from film
group by rating;

-- Mean length by rating.
select rating, avg(length) from film
group by rating;

-- Which kind of movies (rating) have a mean duration of more than two hours?
select rating from film
group by rating	
having avg(length) > 120;


-- List movies and add information of average duration for their rating and original language.
select title, rating, length,
avg(length) over (partition by rating) as "Rating average length"
from film;

-- Which rentals are longer than expected?
select inventory_id, datediff(return_date,rental_date) as "Time length",
avg(datediff(return_date,rental_date)) over (partition by inventory_id) Average_Length
from rental
where datediff(return_date,rental_date) > Average_Length;

