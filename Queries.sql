/*
SELECT * FROM USER_PROFILE;
SELECT * FROM GEOPLACES;
SELECT * FROM RATING;
SELECT * FROM CUISINE;
SELECT * FROM PARKING;
*/

----------------------------------------------------------------------

-- Which restaurants have the best family ratings?
SELECT geoplaces.placeid, geoplaces.name,geoplaces.ambience,rating.placeid,SUM(rating.rating) AS "Overall Rating SUM"
FROM rating
INNER JOIN geoplaces ON
geoplaces.placeid = rating.placeid
WHERE geoplaces.ambience = 'familiar'
GROUP BY geoplaces.placeid, rating.placeid
ORDER BY SUM(rating.rating) DESC
LIMIT 5;

----------------------------------------------------------------------

-- What restaurant is preferred by particular religion?
SELECT SRC.RELIGION,SRC.NAME,SRC.CNT,SRC.MAX_CNT
FROM 
(
	SELECT UP.RELIGION,G.NAME,COUNT(G.NAME) AS CNT,
	MAX(COUNT(G.NAME)) OVER (PARTITION BY UP.RELIGION) AS MAX_CNT
	FROM USER_PROFILE UP,
	RATING R,
	GEOPLACES G
	WHERE UP.USERID = R.USERID
	AND R.PLACEID = G.PLACEID
	AND UP.RELIGION != 'none'
	GROUP BY UP.RELIGION,G.NAME
	ORDER BY COUNT(G.NAME) DESC
) SRC
WHERE SRC.CNT = SRC.MAX_CNT;

----------------------------------------------------------------------

-- Which City has the most elevated no of restaurants with higher rating?
SELECT COUNT(R.RATING),G.CITY
FROM USER_PROFILE UP,
RATING R,
GEOPLACES G
WHERE UP.USERID = R.USERID
AND R.PLACEID = G.PLACEID
AND G.CITY != 'Not Recorded'
GROUP BY G.CITY
HAVING MAX(R.RATING) = 2 --- 2 being the highest rating
ORDER BY COUNT(R.RATING) DESC;

----------------------------------------------------------------------

-- Does having a Parking lot affect the restaurant rating?
SELECT P.PARKING_LOT,R.RATING, COUNT(R.RATING) AS "TOTAL RATING"
FROM USER_PROFILE UP,
RATING R,
GEOPLACES G,
PARKING P
WHERE UP.USERID = R.USERID
AND R.PLACEID = G.PLACEID
AND G.PLACEID = P.PLACEID
GROUP BY P.PARKING_LOT,R.RATING
ORDER BY COUNT(R.RATING) DESC
LIMIT 5;

----------------------------------------------------------------------

--Does serving alcohol affect user rating?
SELECT g.alcohol, r.rating, COUNT(r.rating) AS "Total Rating"
FROM rating r, geoplaces g
WHERE r.placeid = g.placeid
GROUP BY g.alcohol, r.rating
HAVING MAX(r.rating) = 2 --- 2 being the highest rating
ORDER BY COUNT(r.rating) DESC;

----------------------------------------------------------------------

--Number of restaurants based on cuisine type.
SELECT c.cuisine, COUNT(g.name)
FROM geoplaces g, cuisine c
WHERE g.placeid = c.placeid
AND g.city != 'Not Recorded'
GROUP BY c.cuisine
ORDER BY COUNT(g.name) DESC
LIMIT 5;
