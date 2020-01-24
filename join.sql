-- 1. Modify the table to show the matchid and player name for all goals scored by ze Germans.
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012;

-- 3. Modify the table to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER';

-- 4. Modify the table to show team1, team2 and the player for every goal scored by a player called Mario
SELECT team1, team2, player
FROM game
JOIN goal
ON goal.matchid = game.id
WHERE player LIKE 'Mario%';

-- 5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam
ON teamid = eteam.id
 WHERE gtime<=10;

-- 6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team 1 coach
SELECT mdate, teamname
FROM eteam
JOIN game
ON eteam.id = game.team1
WHERE coach LIKE '%Santos';

-- 7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal
JOIN game
ON game.id = goal.matchid
WHERE stadium LIKE '%Wars%';

-- 8. Show the name of all the players that scored a goal against ze Germans
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER') AND goal.teamid != 'GER';

-- 9. Show teamname and the total number of goals scored
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname;

-- 10. Show the stadium and the number of goals scored in each stadium
SELECT stadium, COUNT(player)
FROM game
JOIN goal
ON game.id = goal.matchid
GROUP BY stadium;

-- 11. For every match involving 'POL', show the matchid, date and the number of goals involved
SELECT DISTINCT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON goal.matchid = game.id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid;

-- 12. For every match where 'Ger' scored, show matchid, mdate and the number of goals scored by ze Germans
SELECT matchid, mdate, COUNT(teamid)
FROM goal
JOIN game
ON goal.matchid = game.id
WHERE teamid = 'GER'
GROUP BY matchid;

-- 13. List every match with the foals scored by each team as shown. This will use 'CASE WHEN'.

