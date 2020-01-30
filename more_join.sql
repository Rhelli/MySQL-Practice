-- 1. List the films where the year is 1962
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2. When was Citizen Kane released?
SELECT yr
FROM movie
WHERE title LIKE '%Kane';

-- 3. List all the Star Trek movies including the id, title and year
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Trek%';

-- 4. What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE name LIKE '%Close';

-- 5. Select the movie id for 'Casablanca'
SELECT id
FROM movie
WHERE title LIKE 'Casa%';

-- 6. Obtain the cast list for the film 'Casablanca'
SELECT name 
FROM actor
JOIN casting
ON actor.id = casting.actorid
WHERE movieid = 27;