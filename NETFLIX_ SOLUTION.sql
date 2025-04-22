create database netflix;
CREATE TABLE netflix_
(
	show_id	VARCHAR(5),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);

SELECT * FROM netflix_

--1. Count the number of Movies vs TV Shows
SELECT type, COUNT(*)
FROM netflix_
GROUP BY 1;

--2. Find the most common rating for movies and TV shows
SELECT * FROM 
	(SELECT 
		type, 
		rating, 
		COUNT(*),
		RANK() OVER(PARTITION BY type ORDER BY COUNT(*)DESC) as ranking
	FROM netflix_
	GROUP BY 1,2) AS B1
WHERE ranking=1;
--3. List all movies released in a specific year (e.g., 2020)

SELECT 
	type, 
	release_year
FROM netflix_
where type='Movie' AND 
release_year='2020';

--4. Find the top 5 countries with the most content on Netflix

SELECT UNNEST(STRING_TO_ARRAY(country,',')), COUNT(*) AS no_of_content from netflix_ 
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 5;

--5. Identify the longest movie

SELECT title, duration FROM netflix_
WHERE type='Movie'
AND duration=(SELECT MAX(duration) From netflix_) 




--6. Find content added in the last 5 years

SELECT title, TO_DATE(date_added,'MONTH DD YY')
FROM netflix_
WHERE TO_DATE(date_added,'MONTH DD YY') >= CURRENT_DATE - INTERVAL '5 years'



--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

SELECT title,type,director 
FROM netflix_
WHERE director LIKE '%Rajiv Chilaka%'

--List all TV shows with more than 5 seasons

SELECT title,type, duration
FROM netflix_
WHERE type ='TV Show' 
AND
SPLIT_PART(duration,' ',1) :: numeric >5 




--9. Count the number of content items in each genre

SELECT
	UNNEST(STRING_TO_ARRAY(listed_in,',')) AS genres, 
	COUNT(*) AS no_of_content
FROM netflix_ 
GROUP BY 1;


--10.Find each year and the average numbers of content release in India on netflix. Return top 5 year with highest avg content release!
SELECT
	release_year, 
	COUNT(*),
	ROUND(COUNT(*):: NUMERIC /(SELECT count(*) FROM netflix_ WHERE 'India'= ANY(STRING_TO_ARRAY(country,',')))  * 100, 2) AS avg

FROM netflix_
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;

--11. List all movies that are documentaries

SELECT 
	title,
	type,
	listed_in
FROM netflix_
WHERE type='Movie' AND
listed_in Ilike '%Documentaries%'

--12. Find all content without a director

SELECT * FROM netflix_
WHERE director IS NULL

--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT 
	title,
	type,
	director,
	casts,
	release_year,
	listed_in
FROM netflix_
WHERE casts ILIKE '%Salman Khan%' AND
release_year >= EXTRACT( YEAR FROM CURRENT_DATE) - 10

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

SELECT 
	UNNEST(STRING_TO_ARRAY(casts,',')) AS Actors,
	COUNT(*) as No_of_movies
FROM netflix_
WHERE country like '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


--15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category.
 
WITH new_table
AS 
(SELECT 
	*, 
	CASE
	WHEN
	description ILIKE '%kill%' OR 
	description ILIKE'violence' THEN 'Bad Content'
	ELSE 'Good Content'
	END Category
FROM netflix_)

SELECT 
	Category,
	COUNT(*)
	FROM new_table
GROUP BY 1;








