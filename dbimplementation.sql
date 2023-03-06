DROP TABLE IF EXISTS Movies;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Directors;
DROP TABLE IF EXISTS Rating;
DROP TABLE IF EXISTS appUser;
DROP TABLE IF EXISTS Role;

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

--  create temporary table temp (csv schema);                                                                                                       user_id int,                                                                                                         movie_id int,                                                                                                        time timestamp                                                                                                       );
-- CREATE TABLE
-- oscarj23_db=> \copy temp from 'absolute filepath to file' csv header;
-- COPY 10
-- oscarj23_db=> insert into table (select * from temp);
-- INSERT 0 10
-- oscarj23_db=> select * from table (checking if they inserted)
-- drop table temp;