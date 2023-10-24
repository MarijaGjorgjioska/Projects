CREATE TABLE appleStore_description_combined AS 

SELECT*FROM appleStore_description1

UNION ALL

SELECT*FROM appleStore_description2

UNION ALL

SELECT*FROM appleStore_description3

UNION ALL
 
SELECT*FROM appleStore_description4
 
 **EXPLORATORY DATA ANALYSIS**
 
 --check the number of unique apps
 
 SELECT COUNT(DISTINCT id) AS UniqueAppIds
 FROM AppleStore
 
 SELECT COUNT(DISTINCT id) AS UniqueAppIds
 FROM appleStore_description_combined
 
 -- check for any missing values 
 
 SELECT COUNT(*) As MissingValues
 FROM AppleStore
 Where track_name ISNULL OR prime_genre ISNULL OR user_rating ISNULL
 
 SELECT COUNT(*) As MissingValues
 FROM appleStore_description_combined
 Where app_desc ISNULL
 
-- Find out the number of Apps per genre
 SELECT prime_genre, COUNT(*) AS NummApps
 FROM AppleStore
 GROUP BY prime_genre
 ORDER BY NummApps DESC
 
 -- Get an overview  of the Apps rating
 
 SELECT min(user_rating) AS MinRating, 
 		max(user_rating) AS MaxRating,
 		avg(user_rating) AS AvgRating
 From AppleStore
 
 
 **DATA ANALYSIS**
 
 
 -- Determinate whether paid Apps have higher ratings than the free apps
 
 SELECT CASE 
 		WHEN price>0 THEN 'Paid'
        ELSE 'Free' 
        END AS App_Type,
        avg(user_rating) AS Avg_Rating 
 FROM AppleStore
 GROUP BY App_Type
 
 --Check if apps with more supported languages have higher ratings 

SELECT CASE 
			WHEN lang_num < 10 THEN '10 languages'
            WHEN lang_num BETWEEN 10 AND 30 THEN ' 10 to 30 langueges'
            ELSE ' more then 30 langueges'
        End AS language_bucket,
        avg(user_rating) AS Avg_Rating 
 FROM AppleStore
 GROUP BY language_bucket 
 ORDER By Avg_Rating DESC
        
 --Check the genres with low ratings
 
 SELECT prime_genre, 
 		avg (user_rating) AS Avg_Rating
 FROM AppleStore
 GROUP BY prime_genre
 ORDER BY Avg_rating ASC
 LIMIT 10 
 
 --Check if there is correlation between the lenght of the app description and the user rating 
 
 SELECT CASE 
 			WHEN lenght(b.app_desc) <500 THEN 'Short' 
            WHEN lenght(b.app_desc) BETWEEN 500 AND 1000 THEN 'Medium'
            ELSE 'Long' 
         END As description_lenght_bucket,
         avg(a.user_rating) AS average_rating 
 
 FROM 
 		AppleStore AS A 
 JOIN
 		appleStore_description_combined AS B
 
 ON 
 	A.id=B.id
    
    
 GROUP BY description_lenght_bucket
 ORDER BY average_rating DESC
 
 
 --Check the top rated apps for each genre
 SELECT 
 	prime_genre,
    track_name,
    user_rating
 FROM (
   SELECT
   prime_genre,
   track_name,
   user_rating,
   RANK() OVER ( PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS rank
   FROM AppleStore
   		)
        AS a 
 WHERE 
 a.rank = 1
    
    
    
    
    
 
 
 
 
 
 
 
 
 
 