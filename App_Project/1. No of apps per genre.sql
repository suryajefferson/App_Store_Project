-- no of apps per genre
SELECT prime_genre, count(id) AS no_of_apps
FROM app_details
GROUP BY prime_genre
ORDER BY  no_of_apps DESC;