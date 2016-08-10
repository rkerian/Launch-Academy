-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT movies.title AS title, movies.rating as rating
FROM movies
ORDER BY rating
LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

SELECT movies.title as title
FROM movies
WHERE rating IS null
ORDER BY title;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

SELECT movies.title as title
FROM movies
WHERE synopsis LIKE '%thrilling%'
ORDER BY title;

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

SELECT movies.title as title, movies.year as year, movies.rating as rating
FROM movies
WHERE genre_id = 17 AND rating IS NOT NULL
ORDER BY rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

SELECT actors.name as actor, movies.title as movie, movies.year as year
  FROM actors INNER JOIN cast_members
  ON (actors.id = cast_members.actor_id)
  INNER JOIN movies
  ON (movies.id = cast_members.movie_id)
  WHERE cast_members.character = 'James Bond'
  ORDER BY movies.year ASC;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

SELECT actors.name as actor, movies.title as movie, movies.year as year, genres.name as genre
  FROM cast_members INNER JOIN actors
  ON (actors.id = cast_members.actor_id)
  INNER JOIN movies
  ON (cast_members.movie_id = movies.id)
  INNER JOIN genres
  ON (movies.genre_id = genres.id)
  WHERE actors.name = 'Julianne Moore'
  ORDER BY genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT movies.title as name, movies.year as year, studios.name as studio
  FROM movies INNER JOIN genres
  ON (movies.genre_id = genres.id)
  LEFT OUTER JOIN studios
  ON (movies.studio_id = studios.id)
  WHERE genres.name = 'Horror'
  ORDER BY movies.year ASC
  LIMIT 5;
