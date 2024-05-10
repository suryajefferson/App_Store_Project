-- get the overview of app ratings

SELECT 
    max (user_rating) AS maximum_rating,
    min (user_rating) AS minimun_rating,
    avg (user_rating) AS average_rating
FROM app_details;
