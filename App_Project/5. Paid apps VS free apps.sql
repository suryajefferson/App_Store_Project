-- Determine paid apps have higher rating than free apps
SELECT 
CASE
    when price > 0 THEN 'PAID'
    ELSE 'FREE'
    END AS app_type,
round (avg (user_rating),1) AS avg_rating
FROM app_details 
GROUP BY app_type;