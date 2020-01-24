-- SELECT_from_Nobel questions link: https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial

-- 1. Chnage the query so that it displays Nobel Prizes for 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

 -- 2. Show who won the 1962 prize for Literature
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature';

-- 3. Show the year and subject that won 'Albert Einstein' his prize
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4. Give the name of the 'Peace' winners since (& including) the year 2000
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

-- 5. Show all details of the Lit. prize winners between 1980 and 1989
SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 And 1989 AND subject = 'Literature';

-- 6. Show all the details of the presidential winners
SELECT * FROM nobel
 WHERE subject = 'Peace'
  AND winner IN ('Barack Obama',
                 'Woodrow Wilson',
                 'Theodore Roosevelt',
                 'Jimmy Carter'
);

-- 7. Show the winners with the first name 'John'
SELECT winner
FROM nobel
WHERE LEFT(winner, 4) = 'John';

-- 5. Show the year, subject and name of Physics winner for 1980 together with the Chemistry winners for 1984
