-- USE movielens;

-- show tables

-- 1 List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
/*
select title, release_date 
from movies 
where release_date < '1994-01-01' and release_date > '1983-01-01'
*/
-- 2 Without using LIMIT, list the titles of the movies with the lowest average rating.
/*
select avg(ratings.rating) as avg_rating, movies.title
from ratings 
join movies on movies.id = ratings.movie_id
group by ratings.movie_id
order by avg_rating
*/

-- 3 List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings

/*
select distinct movies.title 
from movies
join genres_movies on movies.id = genres_movies.movie_id
join ratings on movies.id = ratings.movie_id
join users on ratings.user_id = users.id
join genres on genres_movies.genre_id = genres.id
join occupations on occupations.id = users.occupation_id
where users.age = 24 and genres.name = 'Sci-Fi' and ratings.rating = 5 and occupations.name = 'Student';
*/



-- 4 List the unique titles of each of the movies released on the most popular release day.
/*

select release_date, count(release_date) as count_release_date, GROUP_CONCAT(title SEPARATOR ', ') AS titles 
from movies
group by release_date
order by count_release_date DESC LIMIT 1
*/

-- 5 Find the total number of movies in each genre; list the results in ascending numeric order.
/*
select count(movie_id), genres.name 
from genres_movies
join genres on genres_movies.genre_id = genres.id
group by genre_id 
order by count(movie_id) 
*/

