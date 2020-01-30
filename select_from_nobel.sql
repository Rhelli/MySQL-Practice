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

-- 8. Show the year, subject and name of Physics winner for 1980 together with the Chemistry winners for 1984
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Chemistry' AND yr = 1984 OR subject = 'Physics' AND yr = 1980;

-- 9. Show the year, subject and name of winners for 1980 excluding Chemistry and Medicine
SELECT * FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

-- 10. Show year, subject and name of Medicine prize winners before 1910 with Literature winners later than 2004
SELECT * FROM nobel
WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004;

-- 11. Find all the details of the prize win by PETER GRUNBERG
SELECT * FROM nobel
WHERE winner LIKE '%GRÜNBERG%';

-- 12. Find all the details of the prize won by Eugene O'Neill
SELECT * FROM nobel
WHERE winner LIKE "EUGENE O'NEILL";

-- 13. List the winners, year and subject where the winner starts with 'Sir.'. Show the most recent first, then by name order
SELECT winner, yr, subject
FROM nobel
WHERE LEFT(winner, 3) = 'Sir'
ORDER BY yr DESC;

-- 14. Using the expression 'subject IN ('Chemistry', 'Physics') as the values 0 or 1, show the 1984 winners and subject ordered
--     by subject and winner name; but list Chemistry and Physics last
SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner;