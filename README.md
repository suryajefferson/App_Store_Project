## Introduction
The mobile app market is a constantly evolving space where new ideas, rivalry, and user demands converge to influence the fate of numerous applications. To succeed as app developers we must know the the hidden patterns and trends that influence the app market. Each question sheds light on a different aspect of the complex realm of app creation which reveals identifying unexplored opportunities, comprehending user preferences, and refining strategies to create app

🔍 SQL queries? Check them out here: : [App_Project ](/App_Project/)
## Background
With a passion for technology and a keen eye for market trends, We delves deep into the data-rich realm of app analytics. Through various SQL queries and rigorous analysis of the App Store's vast repository of applications, they uncover valuable insights that illuminate the path forward.

#### The questions I wanted to answer through my SQL queries were:
1.  No of apps per genre
2. overview of app ratings
3. Looking for generes with lower ratings
4. Check top rated app in each genre
5. Determine whether paid apps have higher rating than free apps
6. Check if there is a correlation between the length of app descprition and user rating
7. Check if apps with more supported languages have higher ratings
8. Is possible for apps with less size (MB) have good ratings


## Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

## The Analysis


#### 1. 1. No of apps per genre


<details>
<summary>Click to toggle contents of "Code and details"</summary>

``` sql
-- no of apps per genre
SELECT prime_genre, count(id) AS no_of_apps
FROM app_details
GROUP BY prime_genre
ORDER BY  no_of_apps DESC;
```
</details>

<details>
<summary>Click to toggle "Breakdown and Results" </summary>

| Prime Genre        | No. of Apps |
|--------------------|-------------|
| Games              | 3862        |
| Entertainment      | 535         |
| Education          | 453         |
| Photo & Video      | 349         |
| Utilities          | 248         |
| Health & Fitness   | 180         |
| Productivity       | 178         |
| Social Networking  | 167         |
| Lifestyle          | 144         |
| Music              | 138         |
| Shopping           | 122         |
| Sports             | 114         |
| Book               | 112         |
| Finance            | 104         |
| Travel             | 81          |
| News               | 75          |
| Weather            | 72          |
| Reference          | 64          |
| Food & Drink       | 63          |
| Business           | 57          |
| Navigation         | 46          |
| Medical            | 23          |
| Catalogs           | 10          |

#### Breakdown 
The large number of apps in genres like "Games" and "Entertainment" indicates intense competition within those categories. In less competitive genres like "Catalogs" and "Medical," developers can explore new ideas and meet the needs of specific groups of users. The popularity of different app genres is influenced by user preferences and interests. The popularity of genres such as "Games," "Entertainment," and "Education" suggests that users are interested in and using apps in these areas. Market trends can be observed by analyzing how the distribution of apps across genres changes over time, reflecting shifts in user preferences. By examining this data over time, developers can anticipate changes and adjust their plans accordingly.
This finding is very useful for app makers who want to start or improve their apps.             |
</details>

#### 2. Overview of app ratings

<details>
<summary> Click to toggle contents of "Code and details"</summary>
```sql
-- get the overview of app ratings

SELECT 
    max (user_rating) AS maximum_rating,
    min (user_rating) AS minimun_rating,
    avg (user_rating) AS average_rating
FROM app_details;

```
</details>

<details>
<summary>Click to toggle contents of "Breakdown and Results"</summary>

| Maximum Rating | Minimum Rating | Average Rating |
|----------------|----------------|----------------|
| 5              | 0              | 3.5269556759761012 |

#### Breakdown 
The data collected from the app store analysis is summarized in this result. This data can be interpreted in the following way:
The lowest rating among the analyzed apps is 0, suggesting that some apps have received very low user satisfaction. 

The highest rating among the analyzed apps is 5, indicating that some apps have achieved the highest possible user satisfaction. 

The average user rating for all the apps examined is around 3.53. This serves as a standard for gauging the general user satisfaction with the apps in the app store.


</details>

#### 3. Generes with lower ratings
<details>
<summary>Click to toggle contents of "Code and details"</summary>

```sql
-- generes with lower ratings
SELECT prime_genre, 
    round(avg(user_rating),1)
FROM app_details
GROUP BY prime_genre
ORDER BY round(avg(user_rating),1);
```
</details>

<details>
<summary>Click to toggle contents of "Breakdown and Results"</summary>

| Prime Genre        | Round |
|--------------------|-------|
| Catalogs           | 2.1   |
| Finance            | 2.4   |
| Book               | 2.5   |
| Navigation         | 2.7   |
| Lifestyle          | 2.8   |
| News               | 3.0   |
| Social Networking  | 3.0   |
| Sports             | 3.0   |
| Food & Drink       | 3.2   |
| Entertainment      | 3.2   |
| Utilities          | 3.3   |
| Education          | 3.4   |
| Travel             | 3.4   |
| Medical            | 3.4   |
| Shopping           | 3.5   |
| Reference          | 3.5   |
| Weather            | 3.6   |
| Health & Fitness   | 3.7   |
| Business           | 3.7   |
| Games              | 3.7   |
| Photo & Video      | 3.8   |
| Productivity       | 4.0   |
| Music              | 4.0   |

#### Breakdown 
with its approximate average user rating.

Average User Ratings: The rounded average ratings offer a general overview of user satisfaction across each genre. The sentence can be paraphrased as: The average ratings of apps in various genres reflect the general satisfaction and usefulness of users, as well as the potential for improvement or innovation. Users tend to rate apps in genres that are more productive or musical more positively, while apps in genres that are less rated may need more attention or development. , For instance, if a particular genre consistently receives high ratings, it suggests that it has a strong and enduring appeal among users, while a genre with fluctuating or lower ratings may indicate that user preferences are changing or that there are untapped opportunities for enhancing the apps performance.
</details>


#### 4. Top rated app in each genre

<details>
<summary>Click to toggle contents of "Code and details"</summary>



```sql
SELECT  
-- check top rated app in each genre

SELECT * 
FROM (
SELECT prime_genre, track_name, user_rating, rating_count_tot,
    RANK () OVER (PARTITION BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS ranking
FROM app_details) AS ranked_table
WHERE ranking = 1
```
</details>

<details>
<summary>Click to toggle contents of "Breakdown and Results"</summary>

| Prime Genre        | Track Name                                                                                                        | User Rating | Rating Count Total |
|--------------------|-------------------------------------------------------------------------------------------------------------------|-------------|-------------------|
| Book               | Color Therapy Adult Coloring Book for Adults                                                                       | 5           | 84062             |
| Business           | TurboScan™ Pro - document & receipt scanner: scan multiple pages and photos to PDF                                  | 5           | 28388             |
| Catalogs           | CPlus for Craigslist app - mobile classifieds                                                                     | 5           | 13345             |
| Education          | Elevate - Brain Training and Games                                                                                 | 5           | 58092             |
| Entertainment      | Bruh-Button                                                                                                       | 5           | 17487             |
| Finance            | Credit Karma: Free Credit Scores, Reports & Alerts                                                                 | 5           | 101679            |
| Food & Drink       | Domino's Pizza USA                                                                                                | 5           | 258624            |
| Games              | Head Soccer                                                                                                       | 5           | 481564            |
| Health & Fitness   | Yoga Studio                                                                                                       | 5           | 28439             |
| Lifestyle          | ipsy - Makeup, subscription and beauty tips                                                                       | 5           | 17489             |
| Medical            | Blink Health                                                                                                      | 5           | 1198              |
| Music              | Tenuto                                                                                                            | 5           | 562               |
| Navigation         | parkOmator – for Apple Watch meter expiration timer, notifications & GPS navigator to car location               | 5           | 1                 |
| News               | The Guardian                                                                                                      | 5           | 8176              |
| Photo & Video      | Pic Collage - Picture Editor & Photo Collage Maker                                                                | 5           | 123433            |
| Productivity       | VPN Proxy Master - Unlimited WiFi security VPN                                                                    | 5           | 13674             |
| Reference          | Sky Guide: View Stars Night or Day                                                                                | 5           | 22100             |
| Shopping           | Zappos: shop shoes & clothes, fast free shipping                                                                  | 5           | 103655            |
| Social Networking  | We Heart It - Fashion, wallpapers, quotes, tattoos                                                                | 5           | 90414             |
| Sports             | J23 - Jordan Release Dates and History                                                                            | 5           | 3775              |
| Travel             | Urlaubspiraten                                                                                                    | 5           | 188               |
| Utilities          | Flashlight Ⓞ                                                                                                     | 5           | 130450            |
| Weather            | NOAA Hi-Def Radar Pro -  Storm Warnings, Hurricane Tracker & Weather Forecast                                     | 5           | 15809             |

#### Breakdown 
This finding offers valuable information about the most popular apps in each main category, along with their user ratings and the number of times they have been rated. This data can be interpreted in the following way:.
the prime genre of apps is represented by each row, and within each row, the track name is the name of the most highly rated app. The user rating is the level of satisfaction expressed by users, and the rating count total is the total number of ratings the top-rated app has received, reflecting its popularity and user engagement.
Based on this information, we can extract the following conclusions:  User Appreciation: The most highly rated apps in each category have achieved a user rating of 5, indicating that users greatly value and find pleasure in using these apps.Popularity: The total number of ratings for each app indicates that these top-rated apps are not only highly rated but also widely popular among users, as evidenced by the substantial number of ratings they have received.

</details>


#### 5. Paid apps VS free apps

<details>
<summary>Click to toggle contents of "Code and details"</summary>


```sql
-- Determine paid apps have higher rating than free apps
SELECT 
CASE
    when price > 0 THEN 'PAID'
    ELSE 'FREE'
    END AS app_type,
round (avg (user_rating),1) AS avg_rating
FROM app_details 
GROUP BY app_type;
```
</details>

<details>
<summary>Click to toggle contents of "Breakdown and Results"</summary>

| App Type | Average Rating |
|----------|----------------|
| PAID     | 3.7            |
| FREE     | 3.4            |

#### Breakdown 
This result provides insights into the average user ratings of paid and free apps in the app store. Here's what can be understood from this data:
App Type: The data is divided into two groups: apps that require payment and apps that are free.Average Rating: The average user rating for each group shows how happy users are with the apps they have downloaded and used. Based on this information, we can extract the following conclusions: 

 On average, users give paid apps a rating of 3.7, which is slightly more than the rating of 3.4 for free apps. 

The sentence can be paraphrased as: The fact that users give paid apps a higher average rating than free apps indicates that they think paid apps are worth more and have better quality, features, or user experiences. The variation in average ratings between paid and free apps reveals the significance of pricing policies and how they affect user expectations and actions. By analyzing this data, developers can make educated choices about how to charge for their apps and what kind of revenue models to use.
</details>

#### 6. App descprition length and user rating

<details>
<summary>Click to toggle contents of "Code and details"</summary>


```sql
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
```
</details>

<details>
<summary>Click to toggle contents of "Breakdown and Results"</summary>

| Round | Length  |
|-------|---------|
| 3.9   | long    |
| 3.2   | medium  |
| 2.5   | short   |


#### Breakdown 
The data is divided into three groups according to the length of app descriptions: short, medium, and long. 
The longer the description of an app, the higher the average rating it receives, with apps having 3.9-length descriptions getting the highest ratings, followed by those with 3.2-length descriptions, and those with 2.5-length descriptions getting the lowest ratings. The study indicates that, generally, users tend to have a more positive perception of apps with longer descriptions, as these descriptions offer more comprehensive information about the apps characteristics, capabilities, and advantages, enabling users to make better-informed choices and establish realistic expectations. Apps with longer descriptions tend to have higher user satisfaction and ratings, which suggests that users value engaging and informative app descriptions. To create a successful application, developers should strive to strike a balance between providing enough details and not overwhelming users with excessively long descriptions.
</details>

#### 7. Language support and user ratings

<details>
<summary>Click to toggle contents of "Code and details"</summary>


```sql
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
```
</details>

<details>
<summary>Click to toggle contents of "Breakdown and Results"</summary>

| Supported Languages | Rating |
|----------------------|--------|
| >10                  | 4.1    |
| 5-10                 | 4.0    |
| 0-5                  | 3.3    |


#### Breakdown 
This result provides insights into the relationship between the number of supported languages for apps and their average user ratings. Here's what can be understood from this data:

The data is divided into three groups according to the number of languages they can handle: less than or equal to 5, between 6 and 10, and more than 10.The average rating for each group shows how happy users are with apps based on the number of languages they can use.
Based on this information, we can extract the following conclusions:.

The more languages an app supports, the better it is rated on average. 

Apps that can work in more than 10 languages tend to have the best ratings (4.1), followed by those that can work in 5-10 languages (4.0), and then those that can work in 0-5 languages (3.3). This may also help an app reach more people and be more useful for them. Apps that are tailored to the languages and cultures of their users in various regions tend to be more appealing and appreciated, resulting in higher user satisfaction and ratings.
</details>

#### 8. Top Calculator apps that are less than 50 mb

<details>
<summary>Click to toggle contents of "Code and details"</summary>


```sql
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
```
</details>

<details>
<summary>Click to toggle contents of "Breakdown and Results"</summary>

| Track Name                                                | Size (MB) | User Rating |
|-----------------------------------------------------------|-----------|-------------|
| Evolution Calculator - CP & XP - for Pokemon GO!          | 19        | 5           |
| Digits, the calculator for humans                        | 4         | 4.5         |
| Calculator for iPad Free.                                | 48        | 4.5         |
| Secret Calculator Pro - Hide photos & videos             | 14        | 4.5         |
| PCalc - The Best Calculator                              | 49        | 4.5         |
| MyScript Calculator - Handwriting calculator             | 21        | 4.5         |
| Calculator HD - the missing calculator on your iPad      | 3         | 4.5         |
| Photomath - Camera Calculator                            | 34        | 4.5         |
| Calculator‰                                               | 16        | 4.5         |


#### Breakdown 
This result provides insights into various calculator apps available in the app store, including their names, sizes, and user ratings. Here's what can be understood from this data:
Calculator Apps: The list comprises a range of calculator applications with diverse functionalities, including basic calculators, scientific calculators, and specialized calculators for specific purposes like photography or gaming. User Satisfaction: The consistently high user ratings (ranging from 4.5 to 5) indicate that users generally find these calculator apps useful and satisfactory. The size of the calculator apps varies greatly, with some being as small as 3 MB and others as large as 49 MB. The size of an app can influence a users decision to install it, as bigger apps may consume more storage and potentially affect the devices speed.
</details>




## What I Learned
By studying the types of apps and how they are spread, Ive learned about the competitive situation in the app market. 

By analyzing app ratings and user preferences, we can identify the most popular genres and determine which ones have the potential for a new app. 

By understanding the difference between paid and free apps can help us develop monetization strategies that cater to user preferences and improve app quality. This implies that users might consider paid apps to be of better quality or worth, suggesting potential avenues for generating revenue.

 Localization Impact: The connection between supported languages and app ratings emphasizes the significance of localization. By catering to diverse language preferences, the app can boost user happiness and attract a wider audience, which may result in better ratings and more downloads.

 By, recognizing genres that have lower ratings can offer valuable insights into areas where the app can be enhanced or innovated. The study indicates that while a lengthy description is beneficial, its the contents quality and relevance that significantly impact user ratings, rather than its length.

## Conclusions

#### Insights
The analysis of the data, shows its evident that a successful app development strategy requires focusing on specific genres or niches that have a high demand and less competition. By prioritizing quality, we can concentrate on creating an exceptional user experience that caters to the specific requirements and desires of our target audience. 

To create successful apps, focus on usability, functionality, and innovation, as these factors influence user satisfaction and ratings. Additionally, keep improving your app based on user feedback and market trends to ensure long-term success. By keeping track of app ratings, user reviews, and competitor activity, valuable insights can be gained to improve existing features and introduce new ones, ensuring that the app remains competitive.

#### Closing Thoughts
Having gained these valuable insights, I am now better prepared to make well-informed decisions at every stage of the app development process. Using data-driven analysis, I can find chances, avoid dangers, and improve plans to make apps that users like and that succeed in the fast and tough app market. 

The main idea of this project is that app development is not only a technical process but also a user-centric one that aims to provide value and satisfaction to the users.



