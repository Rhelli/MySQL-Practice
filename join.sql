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

-- 5.