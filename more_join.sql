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

-- 7. Obtain the actor list for the movie 'Alien'
SELECT name
FROM casting
LEFT JOIN actor
ON casting.actorid = actor.id
JOIN movie
ON casting.movieid = movie.id
WHERE title = 'Alien';

-- 8. List all the films in which 'Harrison Ford' has acted
SELECT title
FROM movie
JOIN casting
ON  movie.id = casting.movieid
LEFT JOIN actor
ON casting.actorid = actor.id
WHERE name LIKE 'Harrison%';

-- 9. List all the films where 'Harrison Ford' plays a supporting role
SELECT title
FROM movie
JOIN casting
ON  movie.id = casting.movieid
LEFT JOIN actor
ON casting.actorid = actor.id
WHERE name LIKE 'Harrison%' AND ord > 1;

-- 10. List the films together with the leading actor for alll 1962 films
SELECT title, name
FROM movie
JOIN casting
ON movie.id = casting.movieid
LEFT JOIN actor
ON casting.actorid = actor.id
WHERE yr = 1962 AND ord = 1;

-- 11. Which where the busiest years for 'Rock Hudson'? Show the year and number of movies he made each year for any year
--     he made more than 2 movies
SELECT yr,COUNT(title) 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid
JOIN actor
ON actorid = actor.id
WHERE name ='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1;

-- 12. List the film titles and the leading actors for all the films 'Julie Andrews' played in
SELECT title, name
FROM movie
JOIN casting
ON (movie.id = casting.movieid AND ord = 1)
JOIN actor
ON actor.id = casting.actorid
WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id from actor WHERE name = 'Julie Andrews'));

-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles
SELECT name
FROM casting
JOIN actor
ON actor.id= casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE ord = 1
GROUP BY name
HAVING COUNT(ord) >= 15;

-- 14. List the films released in the year 1978 ordered by the nymber of actors in the cast, then by the title
SELECT title, COUNT(actorid)
FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON actor.id = casting.actorid
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(name) DESC, title;