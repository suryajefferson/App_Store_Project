/*check if there is a correlation between 
the lenght of app descprition and user rating */

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