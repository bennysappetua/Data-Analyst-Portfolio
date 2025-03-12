-- PART I: SCHOOL ANALYSIS
-- 1. View the schools and school details tables
SELECT	*
FROM	schools;

SELECT	*
FROM	school_details;

SELECT	*
FROM	schools s 
		LEFT JOIN school_details sd
		ON s.schoolID = sd.schoolID
        LEFT JOIN players p
		ON s.playerID = p.playerID;

-- 2. In each decade, how many schools were there that produced players?
SELECT	 FLOOR(yearID / 10) * 10 AS decade, 
		 COUNT(DISTINCT schoolID) AS number_of_schools
FROM	 schools
GROUP BY decade
ORDER BY decade;

-- 3. What are the names of the top 5 schools that produced the most players?
SELECT	*
FROM	schools;

SELECT	*
FROM	school_details;

SELECT	 name_full, COUNT(DISTINCT playerID) as count_player
FROM	 schools s LEFT JOIN school_details sd
		 ON s.schoolID = sd.schoolID
GROUP BY name_full
ORDER BY count_player DESC
LIMIT	 5;

-- 4. For each decade, what were the names of the top 3 schools that produced the most players?                                            
WITH nop AS (SELECT	 FLOOR(yearID / 10) * 10 AS decade, 
					 schoolID, 
					 COUNT(DISTINCT playerID) AS num_of_players
			 FROM	 schools
			 GROUP BY decade, schoolID
			 ORDER BY decade, num_of_players DESC),
             
	 sr  AS (SELECT 	 *,
					 ROW_NUMBER() OVER(PARTITION BY decade ORDER BY num_of_players DESC) AS school_rank
			 FROM	 nop
			 ORDER BY decade, num_of_players DESC)
SELECT	sr.decade, sd.name_full, sr.num_of_players, sr.school_rank
FROM	sr LEFT JOIN school_details sd
		ON sr.schoolID = sd.schoolID
WHERE	school_rank <= 3
ORDER BY decade DESC, school_rank;

-- PART II: SALARY ANALYSIS
SELECT	*
FROM	players; 

-- 1. View the salaries table
SELECT	*
FROM	salaries; 

-- 2. Return the top 20% of teams in terms of average annual spending
WITH sum_slr AS (SELECT	 yearID, teamID, SUM(salary) as total_salary
				 FROM	 salaries
				 GROUP BY yearID, teamID
				 ORDER BY yearID, teamID),
                 
	 team_pct AS (SELECT	teamID, AVG(total_salary) AS avg_salary,
							NTILE (5) OVER(ORDER BY AVG(total_salary)) AS salary_pct
				  FROM		sum_slr
				  GROUP BY  teamID)

SELECT	teamID, ROUND(avg_salary, 0)
FROM	team_pct
WHERE	salary_pct = 1;

-- 3. For each team, show the cumulative sum of spending over the years
WITH ts AS (SELECT	 yearID, teamID, SUM(salary) as total_salary
			FROM	 salaries
			GROUP BY yearID, teamID
			ORDER BY yearID DESC, total_salary DESC)
            
SELECT	*,
		ROUND(SUM(total_salary) OVER(PARTITION BY teamID ORDER BY yearID)/1000000, 1) AS cumulative_salary_in_million
FROM	ts;

-- 4. Return the first year that each team's cumulative spending surpassed 1 billion
WITH ts AS (SELECT	 yearID, teamID, SUM(salary) as total_salary
			FROM	 salaries
			GROUP BY yearID, teamID
			ORDER BY yearID DESC, total_salary DESC),
            
	 cs AS	(SELECT	*,
					SUM(total_salary) OVER(PARTITION BY teamID ORDER BY yearID) AS cumulative_salary
			 FROM	ts),
             
	rn AS (SELECT	*,
					ROW_NUMBER() OVER(PARTITION BY teamID ORDER BY cumulative_salary) AS row_num
			FROM	cs
			WHERE	cumulative_salary >= 1000000000)

SELECT	 yearID, teamID, cumulative_salary
FROM	 rn
WHERE	 row_num = 1;


-- PART III: PLAYER CAREER ANALYSIS
-- 1. View the players table and find the number of players in the table
SELECT	*
FROM	players
ORDER BY playerID DESC;

SELECT	COUNT(DISTINCT playerID)
FROM	players;

-- 2. For each player, calculate their age at their first game, their last game, and their career length (all in years). 
-- Sort from longest career to shortest career.

-- a. using TIMESTAMPDIFF
SELECT	nameGiven, debut, finalGame,
		CAST((CONCAT(birthYear,'-', birthMonth,'-', birthDay)) AS DATE) AS birthDate,
        TIMESTAMPDIFF(YEAR, CAST((CONCAT(birthYear,'-', birthMonth,'-', birthDay)) AS DATE), debut) AS debut_age,
        TIMESTAMPDIFF(YEAR, CAST((CONCAT(birthYear,'-', birthMonth,'-', birthDay)) AS DATE), finalGame) AS finalGame_age,
        TIMESTAMPDIFF(YEAR, debut, finalGame) AS career_lenght
FROM	players
HAVING	birthDate IS NOT NULL
		AND debut IS NOT NULL
        AND finalGame IS NOT NULL
ORDER BY career_lenght DESC;

-- b. using DATEDIFF
WITH bd AS (SELECT	*, CAST((CONCAT(birthYear,'-', birthMonth,'-', birthDay)) AS DATE) AS birthDate
			FROM	players
            HAVING	birthDate IS NOT NULL
			AND debut IS NOT NULL
			AND finalGame IS NOT NULL)
            
SELECT	 nameGiven, birthDate, debut, finalGame,
		 ROUND(COALESCE((DATEDIFF(debut, birthDate)/365),0),0) AS age_first_game, 
         ROUND(COALESCE((DATEDIFF(finalGame, birthDate)/365),0),0) AS age_final_game,
		 ROUND((DATEDIFF(finalGame, debut)/365), 0) AS career_years
FROM	 bd
ORDER BY career_years DESC;

-- 3. What team did each player play on for their starting and ending years?

SELECT	p.nameGiven,
		s1.yearID AS starting_year, s1.teamID AS starting_team,
        s2.yearID AS final_year, s2.teamID AS final_team
FROM	players p INNER JOIN salaries s1
						ON p.playerID = s1.playerID
						AND YEAR(p.debut) = s1.yearID
				  INNER JOIN salaries s2
						ON p.playerID = s2.playerID
						AND YEAR(p.finalGame) = s2.yearID;
        
-- 4. How many players started and ended on the same team and also played for over a decade?
SELECT	p.nameGiven,
		s1.yearID AS starting_year, s1.teamID AS starting_team,
        s2.yearID AS final_year, s2.teamID AS final_team
FROM	players p INNER JOIN salaries s1
						ON p.playerID = s1.playerID
						AND YEAR(p.debut) = s1.yearID
				  INNER JOIN salaries s2
						ON p.playerID = s2.playerID
						AND YEAR(p.finalGame) = s2.yearID
WHERE	s1.teamID = s2.teamID
		AND s2.yearID - s1.yearID > 10;

-- PART IV: PLAYER COMPARISON ANALYSIS
-- 1. View the players table
SELECT	*
FROM	players;

-- 2. Which players have the same birthday?
WITH ply AS (SELECT	*,
							CAST((CONCAT(birthYear,'-', birthMonth,'-', birthDay)) AS DATE) AS birthdate
					FROM	players)

SELECT	 birthdate, GROUP_CONCAT(nameGiven ORDER BY nameGiven SEPARATOR ', ') AS players
FROM	 ply
GROUP BY birthdate
HAVING	 COUNT(nameGiven) > 1
		 AND birthdate IS NOT NULL;

-- 3. Create a summary table that shows for each team, what percent of players bat right, left and both
SELECT	DISTINCT bats
FROM	players;

SELECT	DISTINCT throws
FROM	players;

SELECT	*	FROM	salaries;
WITH rlbpv AS (SELECT teamID,
					 SUM(CASE WHEN bats = 'R' THEN 1 ELSE 0 END) AS bats_r,
					 SUM(CASE WHEN bats = 'L' THEN 1 ELSE 0 END) AS bats_l,
                     SUM(CASE WHEN bats = 'B' THEN 1 ELSE 0 END) AS bats_b,
					 SUM(CASE WHEN throws = 'R' THEN 1 ELSE 0 END) AS throws_r, 
					 SUM(CASE WHEN throws = 'L' THEN 1 ELSE 0 END) AS throws_l
			 FROM	 players p INNER JOIN salaries s
					 ON p.playerID = s.playerID
			 GROUP BY teamID)

SELECT	 teamID,
		 ROUND((bats_r/(bats_r + bats_l + bats_b))*100, 2) as bats_right_pct,
         ROUND((bats_l/(bats_r + bats_l + bats_b))*100, 2) as bats_left_pct,
         ROUND((bats_b/(bats_r + bats_l + bats_b))*100, 2) as bats_both_pct,
         ROUND((throws_r/(throws_r + throws_l))*100, 2) as throws_right_pct,
         ROUND((throws_l/(throws_r + throws_l))*100, 2) as throws_left_pct
FROM	 rlbpv;

-- 4. How have average height and weight at debut game changed over the years, and what's the decade-over-decade difference?
SELECT	*
FROM	players;

WITH decade_avg AS (SELECT	 FLOOR(YEAR(debut)/10)*10 as decade,
							 AVG(weight) as avg_weight_in_decade,
							 AVG(height) as avg_height_in_decade
					FROM	 players
					GROUP BY decade)

SELECT	*,
		avg_weight_in_decade - LAG(avg_weight_in_decade) OVER (ORDER BY decade) AS weight_diff,
        avg_height_in_decade - LAG(avg_height_in_decade) OVER (ORDER BY decade) AS height_diff
FROM	decade_avg
WHERE	decade IS NOT NULL;
