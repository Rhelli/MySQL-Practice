-- 1. List each country name where the population is larger than that of 'Russia'
SELECT name FROM world
  WHERE population >
    (SELECT population FROM world
     WHERE name='Russia');

-- 2. Show the countries in Europe with a per Capita GDP greater than the 'United Kingdom'
SELECT name
  FROM world
    WHERE continent = 'Europe' AND gdp/population >
      (SELECT gdp/population FROM world WHERE name LIKE '%Kingdom')

-- 3. List the name and continent of countries in the continents containing either Arg or Aus. Order by name.
SELECT name, continent 
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

-- 4. Which country has a population that is more than Canada but less than Poland. List names and populations
SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland');

-- 5. Show the name and the population of each country in Europe. Show the pop. as a percentage of the pop. of Germany
SELECT 
  name, 
  CONCAT(ROUND(((population/(SELECT population FROM world WHERE name LIKE 'Ger%'))*100), 0), '%') AS Population
FROM world
WHERE continent = 'Europe';

-- 6. Which countries have a GDP greater than every country in Europe? Name only, somne countries may have NULL values
SELECT name FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE continent = 'Europe' AND gdp > 0);

-- 7. Find the largest country (area) in each continent, show the continent, name and area
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent=x.continent
AND area>0);

-- 8. List each continent and the name of the country that comes first alphabetically
SELECT continent, name
FROM world x
WHERE name <= ALL
(SELECT name FROM world y
WHERE y.continent=x.continent
AND area>0);