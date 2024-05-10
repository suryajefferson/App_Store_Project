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