-- generes with lower ratings
SELECT prime_genre, 
    round(avg(user_rating),1)
FROM app_details
GROUP BY prime_genre
ORDER BY round(avg(user_rating),1);