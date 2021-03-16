-- Getting the 5 best family restaurants based on overall rating
SELECT geoplaces.placeid, geoplaces.name, geoplaces.ambience, rating.placeid, SUM(rating.rating) AS "Overall Rating Sum"
FROM rating
INNER JOIN geoplaces ON
geoplaces.placeid = rating.placeid
WHERE geoplaces.ambience = 'familiar'
GROUP BY geoplaces.placeid, rating.placeid
ORDER BY SUM(rating.rating) DESC
LIMIT 5;

-- Getting 5 worst family restaurants based on overall rating
SELECT geoplaces.placeid, geoplaces.name, geoplaces.ambience, rating.placeid, SUM(rating.rating) AS "Overall Rating Sum"
FROM rating
INNER JOIN geoplaces ON
geoplaces.placeid = rating.placeid
WHERE geoplaces.ambience = 'familiar'
GROUP BY geoplaces.placeid, rating.placeid
ORDER BY SUM(rating.rating)
LIMIT 5;


-- Getting the 5 best family restaurants based on food rating
SELECT geoplaces.placeid, geoplaces.name, geoplaces.ambience, rating.placeid, SUM(rating.food_rating) AS "Food Rating Sum"
FROM rating
INNER JOIN geoplaces ON
geoplaces.placeid = rating.placeid
WHERE geoplaces.ambience = 'familiar'
GROUP BY geoplaces.placeid, rating.placeid
ORDER BY SUM(rating.food_rating) DESC
LIMIT 5;

-- Getting 5 worst family restaurants based on food rating
SELECT geoplaces.placeid, geoplaces.name, geoplaces.ambience, rating.placeid, SUM(rating.food_rating) AS "Food Rating Sum"
FROM rating
INNER JOIN geoplaces ON
geoplaces.placeid = rating.placeid
WHERE geoplaces.ambience = 'familiar'
GROUP BY geoplaces.placeid, rating.placeid
ORDER BY SUM(rating.food_rating)
LIMIT 5;


-- Getting 5 best family restaurants based on service rating
SELECT geoplaces.placeid, geoplaces.name, geoplaces.ambience, rating.placeid, SUM(rating.service_rating) AS "Service Rating Sum"
FROM rating
INNER JOIN geoplaces ON
geoplaces.placeid = rating.placeid
WHERE geoplaces.ambience = 'familiar'
GROUP BY geoplaces.placeid, rating.placeid
ORDER BY SUM(rating.service_rating) DESC
LIMIT 5;


-- Getting 5 worst family restaurants based on service rating
SELECT geoplaces.placeid, geoplaces.name, geoplaces.ambience, rating.placeid, SUM(rating.service_rating) AS "Service Rating Sum"
FROM rating
INNER JOIN geoplaces ON
geoplaces.placeid = rating.placeid
WHERE geoplaces.ambience = 'familiar'
GROUP BY geoplaces.placeid, rating.placeid
ORDER BY SUM(rating.service_rating)
LIMIT 5;

-- Overall worst service rating restraunts 
SELECT geoplaces.placeid, geoplaces.name, rating.placeid, SUM(rating.service_rating) AS "Service Rating Sum"
FROM rating
INNER JOIN geoplaces ON
geoplaces.placeid = rating.placeid
GROUP BY geoplaces.placeid, rating.placeid
ORDER BY SUM(rating.service_rating)
LIMIT 5;

