-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT movies.title AS movie, movies.rating
FROM movies
ORDER BY rating
LIMIT 50
;
-- | movie                                        | rating
-- ------------------------------------------------+--------
-- Mulan II                                       |      0
-- Beauty and the Beast - The Enchanted Christmas |      0
-- Police Academy 5 - Assignment Miami Beach      |      0
-- InSight                                        |      0
-- Police Academy 4 - Citizens on Patrol          |      0
-- ...
-- 88 Minutes                                     |      5
-- Big Mommas: Like Father, Like Son              |      5
-- Broken Bridges                                 |      5
-- Serving Sara                                   |      5
-- (50 rows)

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

SELECT movies.title AS movie
FROM movies
WHERE movies.rating IS NULL
ORDER BY movies.title
;
-- (369 rows)

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

SELECT movies.title AS movie
FROM movies
WHERE movies.synopsis LIKE '%thrilling%'
;
-- movie
-- --------------------------------------
-- Gnomeo and Juliet
-- Hugo
-- Black Swan
-- Judy Moody and the NOT Bummer Summer
-- Trollhunter
-- Prometheus
-- I Saw the Devil
-- (7 rows)

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

SELECT movies.title AS movie, movies.year, movies.rating, genres.name AS genre
FROM movies
JOIN genres ON movies.genre_id = genres.id
WHERE genres.name = 'Science Fiction & Fantasy' AND movies.year > 1980
ORDER BY movies.rating DESC
;
-- (51 rows)

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

SELECT actors.name AS actor, movies.title AS movie, movies.year
FROM cast_members
JOIN movies ON movies.id = cast_members.movie_id
JOIN actors ON actors.id = cast_members.actor_id
WHERE cast_members.character = 'James Bond'
ORDER BY movies.year
;
-- actor      |              movie              | year
-- ----------------+---------------------------------+------
-- Sean Connery   | Dr. No                          | 1962
-- Sean Connery   | From Russia With Love           | 1963
-- Sean Connery   | Goldfinger                      | 1964
-- Sean Connery   | Thunderball                     | 1965
-- Sean Connery   | You Only Live Twice             | 1967
-- George Lazenby | On Her Majesty's Secret Service | 1969
-- Sean Connery   | Diamonds Are Forever            | 1971
-- Roger Moore    | Live and Let Die                | 1973
-- Roger Moore    | The Man with the Golden Gun     | 1974
-- Roger Moore    | The Spy Who Loved Me            | 1977
-- Roger Moore    | Moonraker                       | 1979
-- Roger Moore    | Octopussy                       | 1983
-- Roger Moore    | A View to a Kill                | 1985
-- Timothy Dalton | The Living Daylights            | 1987
-- Pierce Brosnan | GoldenEye                       | 1995
-- Pierce Brosnan | Tomorrow Never Dies             | 1997
-- Pierce Brosnan | The World Is Not Enough         | 1999
-- Daniel Craig   | Casino Royale                   | 2006
-- Darko Belgrade | Epic Movie                      | 2007
-- Daniel Craig   | Quantum of Solace               | 2008
-- Daniel Craig   | Skyfall                         | 2012
-- (21 rows)

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

SELECT movies.title AS movie, movies.year AS year, genres.name AS genre
FROM cast_members
JOIN actors ON actors.id = cast_members.actor_id
JOIN movies ON movies.id = cast_members.movie_id
JOIN genres ON genres.id = movies.genre_id
WHERE actors.name = 'Julianne Moore'
ORDER BY genres.name, movies.title, movies.year
;
-- movie              | year |           genre
-- --------------------------------+------+---------------------------
-- The Lost World - Jurassic Park | 1997 | Action & Adventure
-- Nine Months                    | 1995 | Comedy
-- The Big Lebowski               | 1998 | Comedy
-- A Single Man                   | 2009 | Drama
-- Benny & Joon                   | 1993 | Drama
-- Boogie Nights                  | 1997 | Drama
-- Children of Men                | 2006 | Drama
-- I'm Not There                  | 2007 | Drama
-- Magnolia                       | 1999 | Drama
-- The Forgotten                  | 2004 | Drama
-- The Fugitive                   | 1993 | Drama
-- The Hours                      | 2002 | Drama
-- The Kids Are All Right         | 2010 | Drama
-- Assassins                      | 1995 | Mystery & Suspense
-- Chloe                          | 2010 | Mystery & Suspense
-- Hannibal                       | 2001 | Mystery & Suspense
-- Next                           | 2007 | Mystery & Suspense
-- Evolution                      | 2001 | Science Fiction & Fantasy
-- (18 rows)

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT movies.title AS movie, movies.year, studios.name AS studio
FROM movies
JOIN genres ON movies.genre_id = genres.id
JOIN studios ON movies.studio_id = studios.id
WHERE genres.name = 'Horror'
ORDER BY movies.year
LIMIT 5
;
-- title             | year |             name
-- ------------------------------+------+-------------------------------
-- Frankenstein                 | 1931 | Universal Pictures Company
-- The Wolf Man                 | 1941 | Universal Pictures
-- The Thing from Another World | 1951 | Warner Home Video
-- Psycho                       | 1960 | Paramount Pictures
-- Night of the Living Dead     | 1968 | Continental Distributing Inc.
-- (5 rows)
