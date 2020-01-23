-- SELECT from WORLD SQLZoo Link: https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial

-- 1. Show the name for the countries that have at least 200M
SELECT name FROM world
WHERE population >= (200*1000000)

-- 2. Give the name & per capita GDP for countries with a population of at least 200M
SELECT name, (gdp/population) AS Per_Capita_GDP
FROM world
WHERE population >= (200*1000000);

-- 3. Show the name and population in millions for the countries in 'South America'
SELECT name, (population/1000000) AS Population_Mil
FROM world
Where continent LIKE 'South A%';

-- 4. Show the population and name for France, Germany and Italy
SELECT name, population
FROM world
Where name IN('France', 'Germany', 'Italy');

-- 5. Show the countries which include 'United' in their name
SELECT name
FROM world
Where name LIKE 'Uni%';

-- 6. Show the countries that are big by area OR big by population. Show name, population (> 250M) and area (> 3M sq Km).
SELECT name, population, area
From world
Where population > 250000000 OR area > 3000000;

-- 7. XOR countries that are big by area (>3M) OR big by population (>250M). Show name, population and area
SELECT name, population, area
FROM world
Where population > 250000000 XOR area > 3000000;

-- 8. Use ROUND to show the name and population in millions & the GDP in billions for countries from 'South America'.
SELECT name, ROUND(population/1000000, 2) AS Population_M, ROUND(gdp/1000000000, 2) AS GDP_B
FROM world
WHERE continent LIKE 'SOUTH A%';

-- 9. Show per-capita GDP for trillion dollar countries to nearest $1000
SELECT name, ROUND(gdp/population, -3) AS Per_Capita_GDP
FROM world
WHERE gdp >= Power(10, 12);

-- 10. Show the name and capital when they both have the same number of characters
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);