--Dataset: Spotify top 50 songs in 2021
--Source: Kaggle https://www.kaggle.com/datasets/equinxx/spotify-top-50-songs-in-2021
--Queried using: SQLite 3



SELECT * FROM spotify_top50_2021

--What is the average danceability by artist? 
SELECT 
    artist_name, 
    ROUND(avg(danceability), 3) as average_danceability
FROM spotify_top50_2021
GROUP BY artist_name
ORDER BY average_danceability DESC; 


--Who are the top artists based on popularity,
--and what are their tracks average danceability and energy?

SELECT
    artist_name,
    ROUND(avg(popularity), 3) AS average_popularity,
    ROUND(avg(danceability), 3) AS average_danceability,
    ROUND(avg(energy), 3) AS average_energy
	FROM spotify_top50_2021
GROUP BY artist_name 
ORDER BY average_popularity DESC 


--What artist released the longest song?

SELECT artist_name, track_name, duration_ms FROM spotify_top50_2021
WHERE artist_name = 'Bruno Mars' OR artist_name LIKE 'a%'
ORDER BY duration_ms DESC
LIMIT 20;

--What is the average danceability of the top 12 most popular songs?
--I'm selecting the top 12 because songs 9-12 share the same popularity score.

SELECT  
    AVG(danceability) AS average_danceability FROM spotify_top50_2021
WHERE popularity >= 82;


