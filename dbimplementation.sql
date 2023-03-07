-- DB: oscarj23_db
DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Directors;
DROP TABLE IF EXISTS Rating;
DROP TABLE IF EXISTS appUser;
DROP TABLE IF EXISTS Role;
-- Q1
CREATE TABLE Movies (
    id INT,
    release DATE,
    genre VARCHAR(50),
    runtime VARCHAR(50),
    title VARCHAR(100),
    language VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE Actors (
    id INT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE Directors (
    id INT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE appUser (
    id INT,
    username VARCHAR(50),
    isAdmin BOOLEAN,
    PRIMARY KEY (id)
);

CREATE TABLE Rating (
    score INT,
    rating_id INT,
    user_id INT,
    movie_id INT,
    time timestamp,
    PRIMARY KEY (rating_id, user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES appUser(id),
    FOREIGN KEY (movie_id) REFERENCES Movies(id)
);

CREATE TABLE Role (
    movie_id INT,
    actor_id INT,
    role VARCHAR(50),
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(id),
    FOREIGN KEY (movie_id) REFERENCES Movies(id)
);

CREATE TABLE Directs (
    movie_id INT,
    director_id INT,
    PRIMARY KEY (movie_id, director_id),
    FOREIGN KEY (director_id) REFERENCES Directors(id),
    FOREIGN KEY (movie_id) REFERENCES Movies(id)
);
-- Q2

-- Commands to insert data into tables genericly
--  create temporary table temp (csv schema);                                                                                                       user_id int,                                                                                                         movie_id int,                                                                                                        time timestamp                                                                                                       );
-- CREATE TABLE
-- oscarj23_db=> \copy temp from 'absolute filepath to file' csv header;
-- COPY 10
-- oscarj23_db=> insert into table (select * from temp);
-- INSERT 0 10
-- oscarj23_db=> select * from table (checking if they inserted)
-- drop table temp;

-- queries
--8
-- SELECT a.id, a.firstName, a.lastName
-- FROM Actors a, Role r, Movies m
-- WHERE a.id = r.actor_id
-- AND m.id = r.movie_id
-- AND m.release >= '03-06-2018'
-- GROUP BY a.id, a.firstName, a.lastName
-- ORDER BY count(m.id) DESC
-- LIMIT 1;

-- --10
-- SELECT d.id, d.firstName, d.lastName, avg(r.score)
-- FROM Directors d, Directs s, Movies m, Rating r
-- WHERE d.id = s.director_id
-- AND m.id = s.movie_id
-- AND m.id = r.movie_id
-- GROUP BY d.id, d.firstName, d.lastName
-- ORDER BY avg(r.score) DESC
-- LIMIT 5;

-- --11
-- SELECT a.id, a.firstName, a.lastName, avg(r.score)
-- FROM actors a, movies m, Rating r, role o
-- WHERE a.id = o.actor_id
-- AND m.id = o.movie_id
-- AND m.id = r.movie_id
-- GROUP BY a.id, a.firstName, a.lastName
-- ORDER BY avg(r.score) ASC
-- LIMIT 5;

-- --18
-- SELECT m.id, m.title, m.runtime
-- FROM Movies m, appUser u, Rating r
-- WHERE m.id = r.movie_id
-- AND u.id = r.user_id
-- ORDER BY cast(m.runtime as INTEGER) desc;

-- --5
-- How many hours did austenfan spend watching horror movies in 2022? (Administrator)

-- SELECT u.user_id, sum(m.runtime) FROM Rating r
-- LEFT JOIN appUser u ON r.user_id = a.id LEFT JOIN Movies m ON r.movie_id = m.id 
-- WHERE u.user_id = 'austenfan' AND m.genre = 'horror';

-- 14
-- Who is the biggest hater on the app? (lowest average rating, min 10 ratings). (Administrator)

-- SELECT r.user_id, u.username,ROUND(avg(score),2) 
-- FROM Rating r 
-- join appUser u on u.id = r.user_id
-- GROUP BY r.user_id, u.username 
-- ORDER BY avg(score) ASC;

-- -- 15
-- -- What are the top 5 highest reviewed genres on the app? (User)

-- SELECT m.genre, count(r.rating_id) as num_ratings 
-- FROM Rating r
-- LEFT JOIN Movies m ON r.movie_id = m.id
-- GROUP BY m.genre
-- ORDER BY count(r.rating_id) DESC;

-- What are the average movie ratings by user austenfan for each language? (Administrator)
-- 1. Show all five star ratings from a user
-- select username, id, r.score
-- from appuser u
-- join rating r on u.id = r.user_id 
-- 	and r.score > 4;

-- 3. What genre of movies does a specific user review the most?
-- select u.username, m.genre, max(r.rating_id)
-- from appuser u
-- join rating r on u.id = r.user_id
-- join movies m on m.id = r.movie_id 
-- where u.username = 'jane.doe'
-- group by u.username, m.genre

-- 19. What are the average movie ratings for each language? (Administrator)

-- select m.language, ROUND(avg(r.score),2)
-- from appuser u
-- join rating r on u.id = r.user_id 
-- join movies m on r.movie_id = m.id
-- group by m.language


-- Q3 Demo Statements:

-- 14
-- Who is the biggest hater on the app? (lowest average rating, min 10 ratings). (Administrator)

-- SELECT r.user_id, u.username,ROUND(avg(score),2) 
-- FROM Rating r 
-- join appUser u on u.id = r.user_id
-- GROUP BY r.user_id, u.username 
-- ORDER BY avg(score) ASC;

--8 Which actor has appeared in the most films in the last 5 years? (User)

-- SELECT a.id, a.firstName, a.lastName
-- FROM Actors a, Role r, Movies m
-- WHERE a.id = r.actor_id
-- AND m.id = r.movie_id
-- AND m.release >= '03-06-2018'
-- GROUP BY a.id, a.firstName, a.lastName
-- ORDER BY count(m.id) DESC
-- LIMIT 1;

-- 19. What are the average movie ratings for each language? (Administrator)

-- select m.language, ROUND(avg(r.score),2)
-- from appuser u
-- join rating r on u.id = r.user_id 
-- join movies m on r.movie_id = m.id
-- group by m.language