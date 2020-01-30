-- Link: https://sqlzoo.net/wiki/SUM_and_COUNT

-- 1. Show the total population of the world
SELECT SUM(population)
FROM world;

-- 2. List all the continents, one each.
SELECT DISTINCT continent
FROM world;

-- 3. Give the total GDP of Africa
SELECT SUM(GDP) AS Total_GDP
FROM world
WHERE continent LIKE '%FRIC%';

-- 4. How many countries have an area of at least 1000000
SELECT COUNT(name)
FROM world
WHERE area > 1000000;

-- 5. What is the total population of Estonia, Lativa and Lithuania
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. For each continent show the continent and number of countries
SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- 7. For each continent show the continent and number of countries with populations of at least 10M
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- 8. List the countries that have a total population of at least 100 million
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;

