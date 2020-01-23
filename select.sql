-- SELECT Basics Tests Link: https://sqlzoo.net/wiki/SELECT_basics

-- 1. Modify the query to show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany'

-- 2. Modify the query to show the name and populations for 'Sweden', 'Norway' and 'Denmark'
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. Modify the query to show the country and area for countries with a size between 200k and 250k
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
