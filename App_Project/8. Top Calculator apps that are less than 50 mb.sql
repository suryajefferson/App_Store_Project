-- getting the data for calculator apps that are less than 50 mb and rating is > 4
SELECT
    track_name,
    size_bytes/ 1000000 AS size_mb,
    user_rating
FROM app_details
WHERE (track_name like '%Calculator%' or track_name like '%calculator%')
    AND (size_bytes/ 1000000 < 50)
    AND user_rating > 4
ORDER BY user_rating DESC;