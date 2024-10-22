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
-- select Name, (SurfaceArea/Population) as pop_ratio from country where (SurfaceArea/Population) is not null order by pop_ratio desc limit 10

-- 14 List every unique world language.
-- select distinct Language from countryLanguage

-- 15 List the names and GNP of the world's top 10 richest countries.
-- select Name, GNP from country order by GNP DESC LIMIT 10;

-- 16 List the names of, and number of languages spoken by, the top ten most multilingual countries.
/*
select country.Name, count(countryLanguage.Language) as num_language
from countryLanguage
join country on countryLanguage.CountryCode = country.Code
group by country.Name
order by num_language DESC LIMIT 10
*/

-- 17 List every country where over 50% of its population can speak German.
/*
select country.Name, countryLanguage.Percentage 
from country
join countryLanguage on country.Code = countryLanguage.CountryCode
Where countryLanguage.Percentage > 50 and countryLanguage.Language = 'German';
*/

-- 18 Which country has the worst life expectancy? Discard zero or null values
/*
select Name, LifeExpectancy from country
where LifeExpectancy is not null and LifeExpectancy > 0
order by LifeExpectancy LIMIT 1
*/

-- 19 List the top three most common government forms.
/*
select GovernmentForm, count(GovernmentForm) as num_gov from country
group by GovernmentForm
order by num_gov DESC limit 3
*/

-- 20 How many countries have gained independence since records began?

-- Select distinct count(Name) from country where IndepYear is not null


