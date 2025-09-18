SELECT week, posteam, game_seconds_remaining, (60-(CAST(game_seconds_remaining AS FLOAT)/60)) AS game_time, yards_gained
From plays
limit 10;

select * 
From teams;



SELECT week, posteam, game_seconds_remaining, (60-(CAST(game_seconds_remaining AS FLOAT)/60)) AS game_time, yards_gained, t.team_name, t.team_color, t.team_logo_wikipedia
From plays p
JOIN teams t
    ON p.posteam = t.team_abbr;

-- The Query below is used to create total_yards.csv
-- Other queries above were to gather information to write the final query
SELECT week, posteam,team_name,team_color,team_logo_wikipedia, game_time, yards_gained,
    SUM(yards_gained) OVER (PARTITION BY week, posteam ORDER BY game_time) AS total_yards_gained
From (
    SELECT week, posteam, game_seconds_remaining, (60-(CAST(game_seconds_remaining AS FLOAT)/60)) AS game_time, yards_gained, t.team_name, t.team_color, t.team_logo_wikipedia
    From plays p
    JOIN teams t
    ON p.posteam = t.team_abbr);

