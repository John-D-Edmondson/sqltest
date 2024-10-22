-- USE `world`;

-- 1 Using COUNT, get the number of cities in the USA.

-- select COUNT(ID) from city

-- 2 Find out the population and life expectancy for people in Argentina.

-- select Population, LifeExpectancy  from country where Name = 'Argentina'

-- 3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

-- select Name, LifeExpectancy from country where LifeExpectancy is not null order by LifeExpectancy desc limit 1

-- 4 Using JOIN ... ON, find the capital city of Spain.
/*
select city.Name
from city
join country on country.Capital = city.ID
where country.Name = 'Spain'
*/

-- 5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region
/*
select Language 
from countryLanguage
join country on countryLanguage.CountryCode = country.code
where country.Region = 'Southeast Asia'
*/

-- 6 Using a single query, list 25 cities around the world that start with the letter F.
/*
select Name from city 
where Name like 'F%' 
limit 25
*/

-- 7 Using COUNT and JOIN ... ON, get the number of cities in China.
/*
select COUNT(city.Name) 
from country
join city on country.Code = city.CountryCode
where country.Name = 'China'
group by country.Code
*/

-- 8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
/*
select Name 
from country
order by Population and Population IS NOT NULL
limit 1
*/

-- 9 Using aggregate functions, return the number of countries the database contains.

-- select count(*) from country

-- 10 What are the top ten largest countries by area?
/*
select Name, SurfaceArea from country
order by SurfaceArea desc limit 10
*/

-- 11 List the five largest cities by population in Japan.
/*
select city.Name, city.Population
from city 
join country on city.CountryCode = country.Code
where country.Name = 'Japan'
*/

-- 12 list the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
-- select Name, Code from country where HeadOfState = 'Elisabeth II'

-- 13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
select Name, (SurfaceArea/Population) from country where (SurfaceArea/Population) is not null order by 
