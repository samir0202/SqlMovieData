--SECTION-A
--Write a query in SQL to list the Horror movies
use MoviesApp
SELECT m.MOV_ID, MOV_TITLE, mc.Genre_Title
FROM movies m, Genre mc, MOVIE_GENRES md
where m.mov_id = md.mov_id
and mc.Genre_ID =md.Genre_ID
and mc.Genre_Title  = 'Horror';



--Write a query in SQL to find the name of all reviewers who have rated 8 or more stars
use MoviesApp
SELECT REV_NAME
FROM REVIEWER, RATING
WHERE rating.rev_id = reviewer.rev_id
AND rating.rev_stars>=8
AND reviewer.rev_name IS NOT NULL;



--Write a query in SQL to list all the information of the 
--actors who played a role in the movie ‘Deliverance’.
use MoviesApp
SELECT * 
FROM actor 
WHERE actid IN(
SELECT actid 
FROM moviecast 
WHERE mov_id IN (
SELECT mov_id 
FROM movieS
WHERE mov_title='Deliverance'
));



--Write a query in SQL to find the name of the director (first and last names)
--who directed a movie that casted a role for 'Eyes Wide Shut'
use MoviesApp
SELECT d.dir_fname, d.dir_lname, m.mov_title  
FROM  director d, movies m , moviecast mc , movie_direction md
where m.mov_id = md.mov_id
and md.dirid =d.dirid
and mc.mov_id = m.mov_id
and m.mov_title  = 'Eyes Wide Shut';



--Write a query in SQL to find the movie title, year, date of release, director--and actor for those movies which reviewer is ‘Neal Wruck’use MoviesAppSELECT mov_title, mov_year, mov_dt_rel, dir_fname, dir_lname, 
act_fname, act_lname
FROM MOVIES a, movie_direction b, director c, rating d, reviewer e, actor f, moviecast g
WHERE a.mov_id=b.mov_id
AND  b.dirid=c.dirid 
AND a.mov_id=d.mov_id 
AND  d.rev_id=e.rev_id 
AND  a.mov_id=g.mov_id 
AND g.actid=f.actid 
AND e.rev_name='Neal Wruck';



--Write a query in SQL to find all the years which produced at least 
--one movie and that received a rating of more than 4 stars
use MoviesApp
SELECT DISTINCT mov_year
FROM Movies, Rating
WHERE Movies.MOV_ID = Rating.MOV_ID AND REV_STARS >4
ORDER BY mov_year;



--Write a query in SQL to find the name of all movies who have 
--rated their ratings with a NULL value
use MoviesApp
SELECT REV_NAME from reviewer r
INNER JOIN rating rt
ON rt.REV_ID = r.REV_ID
WHERE rt.REV_STARS IS NULL;


--Write a query in SQL to find the name of movies who were directed by ‘David’
use MoviesApp
SELECT mov_title as movie_name FROM movies
JOIN  movie_direction 
ON movies.mov_id=movie_direction.mov_id
JOIN  director 
ON movie_direction.dirid=director.dirid
WHERE dir_fname = 'David';



-- Write a query in SQL to list the first and last names of all the actors who were --cast in the movie ‘Boogie Nights’, and the roles they played in that production.use MoviesAppSELECT act_fname+act_lname as Actor_Name
FROM actor 
JOIN moviecast ON actor.actid=moviecast.actid
JOIN movies ON moviecast.mov_id=movies.mov_id 
AND movies.mov_title='Boogie Nights';



--Find the name of the actor who have worked in more than one movie
use MoviesApp
SELECT mov_title 
FROM movies
WHERE mov_id IN (
SELECT mov_id 
FROM moviecast 
WHERE actid IN (
SELECT actid 
FROM actor 
WHERE actid IN (
SELECT actid 
FROM moviecast GROUP BY actid 
HAVING COUNT(actid)>1)));