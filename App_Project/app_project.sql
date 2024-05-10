SELECT * 
FROM app_description
LIMIT 100;

SELECT * 
FROM app_details
LIMIT 100;

-- check missing values in the columns
SELECT count(*)
FROM app_description
WHERE id is NULL or track_name IS NULL OR app_desc IS NULL;

-- no of apps per genre
SELECT prime_genre, count(id) AS no_of_apps
FROM app_details
GROUP BY prime_genre
ORDER BY  no_of_apps DESC;

-- get the overview of app ratings

SELECT 
    max (user_rating) AS maximum_rating,
    min (user_rating) AS minimun_rating,
    avg (user_rating) AS average_rating
FROM app_details;

-- getting the data for calculator apps that are less than 50 mb and rating is > 4
SELECT
    track_name,
    size_bytes/ 1000000 AS size_mb,
    user_rating
FROM app_details
WHERE (track_name like '%Calculator%' or track_name like '%calculator')
    AND (size_bytes/ 1000000 < 50)
    AND user_rating > 4
ORDER BY user_rating DESC;

-- Determine paid apps have higher rating than free apps
SELECT 
CASE
    when price > 0 THEN 'PAID'
    ELSE 'FREE'
    END AS app_type,
round (avg (user_rating),1) AS avg_rating
FROM app_details 
GROUP BY app_type;

-- Check if apps with more supported languages have higher ratings

SELECT 
CASE 
    WHEN lang_num <=5  THEN '0-5'
    WHEN lang_num BETWEEN 5 AND 10 THEN '5-10'
    ELSE '>10'
    END AS supported_lang,
round (avg (user_rating),1) AS rating
FROM app_details
GROUP BY supported_lang
ORDER BY rating DESC;

-- generes with lower ratings
SELECT prime_genre, 
    round(avg(user_rating),1)
FROM app_details
GROUP BY prime_genre
ORDER BY round(avg(user_rating),1);

-- check if there is a correlation between 
--the lenght of app descprition and user rating

SELECT round(avg(user_rating),1),
    CASE
    WHEN length(app_desc) < 500 THEN 'short'
    WHEN length(app_desc) BETWEEN 500 AND 1000 THEN 'medium'
    ELSE 'long'
    END AS length
FROM app_details
INNER JOIN app_description ON app_details.id = app_description.id
GROUP BY length
ORDER BY length;

-- check top rated app in each genre

SELECT * 
FROM (
SELECT prime_genre, track_name, user_rating, rating_count_tot,
    RANK () OVER (PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS ranking
FROM app_details) AS ranked_table
WHERE ranking = 1