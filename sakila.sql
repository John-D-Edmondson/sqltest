-- use sakila;

-- show tables;
-- 1 List all actors.
-- select * from actor;
-- 2 ind the surname of the actor with the forename 'John'.
-- select last_name from actor where first_name = 'John';

-- 3 Find all actors with surname 'Neeson'.
-- select * from actor where last_name = 'Neeson';

-- 4 Find all actors with ID numbers divisible by 10.
 -- select * from actor where MOD(actor_id, 10) = 0;
 
 -- 5 What is the description of the movie with an ID of 100?
 -- select title, description from film where film_id = 100; 
 
 -- 6 Find every R-rated movie.
 -- select * from film  where rating = 'R';
 
 -- 7 Find every non-R-rated movie.
 -- select * from film where rating != 'R';
 
 -- 8 Find the ten shortest movies.
 /*
 select * from film 
 order by length
 limit 10;
 */
 
 -- 9 Find the movies with the longest runtime, without using LIMIT.
-- select * from film order by length DESC 

-- 10Find all movies that have deleted scenes.
-- select * from film where special_features LIKE '%Deleted Scenes%';

-- 11 Using HAVING, reverse-alphabetically list the last names that are not repeated.

-- select distinct last_name from actor having last_name is not null;

-- 12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
-- select last_name, count(last_name) from actor group by last_name having count(last_name) > 1 order by count(last_name);

-- 13 Which actor has appeared in the most films?
/*
select actor.last_name, count(actor.actor_id) from actor 
join film_actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id
order by COUNT(actor.actor_id) DESC LIMIT 1;
*/

-- 14 When is 'Academy Dinosaur' due?
/*
select rental.return_date 
from rental
join inventory on rental.inventory_id = rental.rental_id
join film on inventory.film_id = film.film_id
where film.title = 'Academy Dinosaur'
order by rental.return_date DESC
limit 1;
 */
 
 -- 15 What is the average runtime of all films?
 
 -- select avg(length) from film
 
 -- 16 List the average runtime for every film category.
 /*
 select  AVG(film.length), film_category.category_id, count(film_category.category_id) from film_category
 join film on film.film_id = film_category.film_id
 group by category_id
 order by count(category_id);
 */
 -- 17 List all movies featuring a robot.
 /*
 select * from film
 where description like lower('%robot%')
 */
 
 -- 18 How many movies were released in 2010?
 /*
 select * from film 
where release_year = 2010
 */
 -- 19 Find the titles of all the horror movies.
 /*
 select film.title from film
 join film_category on film.film_id = film_category.film_id
 where film_category.category_id = 11
 */
 
 -- 20 List the full name of the staff member with the ID of 2.
 
 -- select CONCAT(first_name,' ',last_name) as staff_name from staff where staff_id = 2
 
 -- 21 List all the movies that Fred Costner has appeared in.
 /*
 select distinct film.title from film 
 join film_actor on film.film_id = film_actor.film_id
 join actor on film_actor.actor_id = actor.actor_id
 where actor.first_name = 'Fred' and actor.last_name = 'Costner'
 */
 
 -- 22 How many distinct countries are there?
 -- select count(country) from country 
 
 -- 23 List the name of every language in reverse-alphabetical order.
-- select * from language order by name desc
 
 -- 24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
/*
select concat(first_name, ' ', last_name) as actor_name
from actor 
where last_name like '%son'
order by actor_name;
 */
 
 -- 25 Which category contains the most films?
/*
 select name, count(film_category.film_id) as freq
 from category
 join film_category on category.category_id = film_category.category_id
 group by film_category.category_id
 order by freq desc limit 1
 */
 
 
 
