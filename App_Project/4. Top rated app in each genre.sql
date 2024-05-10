-- check top rated app in each genre

SELECT * 
FROM (
SELECT prime_genre, track_name, user_rating, rating_count_tot,
    RANK () OVER (PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS ranking
FROM app_details) AS ranked_table
WHERE ranking = 1